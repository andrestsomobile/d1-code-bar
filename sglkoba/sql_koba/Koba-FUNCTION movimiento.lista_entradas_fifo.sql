-- FUNCTION: movimiento.lista_entradas_fifo(integer, character varying)

-- DROP FUNCTION movimiento.lista_entradas_fifo(integer, character varying);

-- select * from  movimiento.lista_entradas_fifo(477,'NAC');


CREATE OR REPLACE FUNCTION movimiento.lista_entradas_fifo(
	integer,
	character varying)
    RETURNS SETOF movimiento.entrada 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$DECLARE  

_producto ALIAS FOR $1;
_tipopedido ALIAS for $2;

ents entrada;

BEGIN
-- PRIMERO SACO LOS INGRESOS CON EL TIPO DE SALDO::::
-- SALDO NACIONALIZADO::

IF _tipopedido ='NAC' THEN

--PRIMERO saco las entradas tipo devolucion y tipo despiece:
--cambio hecho el 22 de enero de 2007 por solicitud de jefatura de operaciones, que primero
--sean las devoluciones y luego lo nacionalizado
for ents in  
select entcodsx, entcodingreso, null as entcodproducto, entbodega, entposicion, entcantidad, entpesoneto, 
       entpesonetototal, entpesobruto, entpesobrutototal, entsaldopesoneto, entsaldopesobruto,
       entsaldonac, entsaldosinnac,entlote
	from entrada	
	inner join producto on procodsx = entcodproducto and entcodproducto = _producto
	inner join ingreso on  ingcodsx = entcodingreso 
	  and (ingtipo='DEVOLUCION'  or ingtipo='DESPIECE' OR ingtipo='AJUSTE') 
	  and ingestado = 'FINALIZADO' 
	where entcodproducto = _producto
	and ( (entsaldonac = prounimasterpac and entposicion != 'PISO') 
	   or (entsaldonac > 0 and entposicion = 'PISO')
	    )
	and entbodega != 11 --Bodega CALIDAD
	order by ingfecha asc, entbodega asc, case when char_length(entposicion) = 5 and entposicion not like 'PISO%' and entposicion not like 'RENTA%' then 
	substring(entposicion from 1 for 1) || substring(entposicion from 5 for 1) || substring(entposicion from 4 for 1)  || substring(entposicion from 2 for 2) 
	else '*' || entposicion || '*' end desc
LOOP
	return next ents;
end loop;

--consulta que obtiene las entradas tipo trafico, que han tenido nacionalizaciones del producto requerido para la empresa requerida,
-- y se organizan por fecha de vencimiento del lote y por posicion segun ruta logica de alistamiento
--el saldo por cantidad que se coloca es realmente la cantidad nacionalizada de esa entrada
-- aqui se saca primero lo de estanterias con estiba completa
for ents in  
select entcodsx, entcodingreso, nadcodsx as entcodproducto, entbodega, entposicion, entcantidad, entpesoneto, 
	   entpesonetototal, entpesobruto, entpesobrutototal, entsaldopesoneto, entsaldopesobruto,
	   nadsaldo as entsaldonac , entsaldosinnac, entlote
	from entrada 
	inner join producto on procodsx = entcodproducto
	inner join nacionalizacion_detalle on nadentrada = entcodsx
	inner join nacionalizacion on naccodsx = nadcodnac and nacestado = 'FINALIZADO'
	inner join ingreso on  ingcodsx = nacingreso 
	left join lote_trafico on ltrafcodsx = entlote and ltrafcodproducto = entcodproducto
	where entcodproducto = _producto 
	and ( (entsaldonac = prounimasterpac and entposicion != 'PISO') 
	   or (entsaldonac > 0 and entposicion = 'PISO')
	    )
	and ((char_length(entposicion) >= 5 and entposicion not like '%WMS%' and entposicion not like '%PISO%' and entposicion not like 'RENTA%' and entposicion != 'B3' and entposicion not like '%ZONA%') )
	and entposicion not like 'RENTA%' 
	and entposicion != 'B3' 
	and entposicion not like '%ZONA%'
	and entposicion != 'RECIBO' 
	and entposicion != 'AVERIA'
	and entposicion != 'SOBRANTE'
	and entbodega != 11 --Bodega CALIDAD

	order by 
	ltrafvencimiento asc
	,  (select bodega from movimiento.posicion_ruta_logica(entbodega,entposicion)) asc
	, (select estante from movimiento.posicion_ruta_logica(entbodega,entposicion)) desc NULLS LAST
	, (select nivel from movimiento.posicion_ruta_logica(entbodega,entposicion)) desc
	, (select posicion from movimiento.posicion_ruta_logica(entbodega,entposicion)) desc
	, (select frente_pos from movimiento.posicion_ruta_logica(entbodega,entposicion)) asc

LOOP
	return next ents;
end loop;
-- aqui se saca lo de piso

for ents in  
select entcodsx, entcodingreso, nadcodsx as entcodproducto, entbodega, entposicion, entcantidad, entpesoneto, 
	   entpesonetototal, entpesobruto, entpesobrutototal, entsaldopesoneto, entsaldopesobruto,
	   nadsaldo as entsaldonac , entsaldosinnac, entlote
	from entrada 
	inner join producto on procodsx = entcodproducto
	inner join nacionalizacion_detalle on nadentrada = entcodsx
	inner join nacionalizacion on naccodsx = nadcodnac and nacestado = 'FINALIZADO'
	inner join ingreso on  ingcodsx = nacingreso 
	left join lote_trafico on ltrafcodsx = entlote and ltrafcodproducto = entcodproducto
	where entcodproducto = _producto
	and ( (entsaldonac >= prounimasterpac and entposicion != 'PISO') 
	   or (entsaldonac > 0 and entposicion = 'PISO')
	    )
	and (entposicion like '%PISO%' or entposicion = 'B3')
	and entbodega != 11 --Bodega CALIDAD
	order by ingfecha asc, entbodega desc, entposicion desc
LOOP
	return next ents;
end loop;

end if; --fin que el tipo de pedido sea NAC

---------------------------------------------------------------------
---------------------------------------------------------------------
--SALDO SIN NACIONALIZAR
--SOLO SE SACA DE LOS INGRESOS TIPO TRAFICO...

if _tipopedido ='SNAC' then
--consulta que obtiene las entradas tipo trafico, que han tenido nacionalizaciones del producto requerido para la empresa requerida,
-- y se organizan por fecha de vencimiento del lote (si lo maneja) y por fecha de la entrada
for ents in  
	select entrada.*
	from entrada 
	inner join producto on procodsx = entcodproducto
	left join lote_trafico on ltrafcodsx = entlote and ltrafcodproducto = entcodproducto
	where entcodproducto = _producto  
	and ( (entsaldosinnac >= prounimasterpac and entposicion != 'PISO') 
	   or (entsaldosinnac > 0 and entposicion = 'PISO')
	    )
	and entbodega != 11 -- Bodega CALIDAD
	order by ltrafvencimiento asc, entfecha asc, entbodega asc, case when char_length(entposicion) = 5 and entposicion not like 'PISO%' and entposicion not like 'RENTA%' then 
	substring(entposicion from 1 for 1) || substring(entposicion from 5 for 1) || substring(entposicion from 4 for 1)  || substring(entposicion from 2 for 2) 
	else '*' || entposicion || '*' end desc
LOOP
	return next ents;
end loop;

end if; --fin que el tipo de pedido sea SNAC

RETURN;

END;$BODY$;

ALTER FUNCTION movimiento.lista_entradas_fifo(integer, character varying)
    OWNER TO postgres;
