-- FUNCTION: movimiento.lista_entradas_bodega(integer, character varying)

-- DROP FUNCTION movimiento.lista_entradas_bodega(integer, character varying);

-- select * from  movimiento.lista_entradas_bodega(477,'NAC');


CREATE OR REPLACE FUNCTION movimiento.lista_entradas_bodega(
	integer,
	character varying, integer)
    RETURNS SETOF movimiento.entrada 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$DECLARE  

_producto ALIAS FOR $1;
_tipopedido ALIAS for $2;
_bodega ALIAS for $3;
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
	and entbodega = _bodega
	and ( (entsaldonac >= prounimasterpac and entposicion != 'PISO') 
	   or (entsaldonac > 0 and entposicion = 'PISO')
	    )
	order by ingfecha asc, entbodega asc, case when char_length(entposicion) = 5 and entposicion not like 'PISO%' and entposicion not like 'RENTA%' then 
	substring(entposicion from 1 for 1) || substring(entposicion from 5 for 1) || substring(entposicion from 4 for 1)  || substring(entposicion from 2 for 2) 
	else '*' || entposicion || '*' end desc
LOOP
	return next ents;
end loop;

-- 2020-06-30 De acuerdo a los solicitado por Milena, se cambio en la política de inventario, de tal manera que a partir de ahora el criterio de búsqueda para las reservas es: 
-- 1) fecha de ingreso y 
-- 2) Posición en bodega.
-- La ruta logica de alistamiento por posicion es: 
-- Bodega 1 a 7 asc
-- Estante Z a A desc
-- Nivel 7 a 1 desc
-- Posicion 99 a 01 desc
-- Frente/Posterior F a P asc
-- Ya no se tiene en cuenta el FEFO
for ents in  
select entcodsx, entcodingreso, nadcodsx as entcodproducto, entbodega, entposicion, entcantidad, entpesoneto, 
	   entpesonetototal, entpesobruto, entpesobrutototal, entsaldopesoneto, entsaldopesobruto,
	   nadsaldo as entsaldonac , entsaldosinnac, entlote
	from entrada 
	inner join producto on procodsx = entcodproducto
	inner join nacionalizacion_detalle on nadentrada = entcodsx
	inner join nacionalizacion on naccodsx = nadcodnac and nacestado = 'FINALIZADO'
	inner join ingreso on  ingcodsx = nacingreso 
	inner join config_bodega on cbbodega = _bodega and cbentrada = entcodsx 
	where entcodproducto = _producto
	and entbodega = _bodega
	and entsaldonac >= prounimasterpac 
	order by ingfecha asc
	, entbodega asc
	, cbestante desc
	, cbnivel desc
	, substring(cbposicion from 1 for 2) desc
	, cbfrente_pos asc	
LOOP
	return next ents;
end loop;
-- aqui se saca lo de piso, es decir que no esta configurado en bodega
for ents in  
select entcodsx, entcodingreso, nadcodsx as entcodproducto, entbodega, entposicion, entcantidad, entpesoneto, 
	   entpesonetototal, entpesobruto, entpesobrutototal, entsaldopesoneto, entsaldopesobruto,
	   nadsaldo as entsaldonac , entsaldosinnac, entlote
	from entrada 
	inner join producto on procodsx = entcodproducto
	inner join nacionalizacion_detalle on nadentrada = entcodsx
	inner join nacionalizacion on naccodsx = nadcodnac and nacestado = 'FINALIZADO'
	inner join ingreso on  ingcodsx = nacingreso 
	where entcodproducto = _producto
	and entbodega = _bodega
	and entsaldonac > 0 
	and entcodsx NOT IN (SELECT cbentrada FROM config_bodega WHERE cbbodega = _bodega)
	order by ingfecha asc, entbodega asc, entposicion desc
LOOP
	return next ents;
end loop;

end if; --fin que el tipo de pedido sea NAC

---------------------------------------------------------------------
---------------------------------------------------------------------
--SALDO SIN NACIONALIZAR
--SOLO SE SACA DE LOS INGRESOS TIPO TRAFICO...

if _tipopedido ='SNAC' then
-- Se saca lo NO NACIONALIZADO. Se maneja el mismo orden de las NAC. Primero lo posicionado en bodegas
for ents in  
	select entrada.*
	from entrada 
	inner join producto on procodsx = entcodproducto
	inner join config_bodega on cbbodega = _bodega and cbentrada = entcodsx 
	where entcodproducto = _producto  
	and entbodega = _bodega
	and entsaldosinnac >= prounimasterpac 
	order by ingfecha asc
	, entbodega asc
	, cbestante desc
	, cbnivel desc
	, substring(cbposicion from 1 for 2) desc
	, cbfrente_pos asc	
LOOP
	return next ents;
end loop;
-- Esto es SNAC. Luego lo de Piso (posiciones no configuradas) 
for ents in  
	select entrada.*
	from entrada 
	inner join producto on procodsx = entcodproducto
	inner join config_bodega on cbbodega = _bodega and cbentrada = entcodsx 
	where entcodproducto = _producto  
	and entbodega = _bodega
	and entsaldosinnac > 0 
	and entcodsx NOT IN (SELECT cbentrada FROM config_bodega WHERE cbbodega = _bodega)
	order by ingfecha asc, entbodega asc, entposicion desc
LOOP
	return next ents;
end loop;

end if; --fin que el tipo de pedido sea SNAC

RETURN;

END;$BODY$;

