SELECT movimiento.posicion_ruta_logica(refpbodega,refpposicion),
refpcodsx, refpnumpedido, refpproducto, refpbodega, 
refpposicion,   
refpcantidad, refpvalorunit, refpvalortotal, refpentrada, refpnacdetalle,   
refpsaldo, refppesoneto, refppesobruto, refppesonetototal, refppesobrutototal,   
resumen, refpvalorfacunit, refpvalorfactotal 
FROM referencia_pedido 
--inner join config_bodega on cbentrada = refpentrada                             
where refpnumpedido=  7875 
order by 
  (select bodega from movimiento.posicion_ruta_logica(refpbodega,refpposicion)) asc
, (select estante from movimiento.posicion_ruta_logica(refpbodega,refpposicion)) desc NULLS LAST
, (select nivel from movimiento.posicion_ruta_logica(refpbodega,refpposicion)) desc
, (select posicion from movimiento.posicion_ruta_logica(refpbodega,refpposicion)) desc
, (select frente_pos from movimiento.posicion_ruta_logica(refpbodega,refpposicion)) asc

	-- La ruta lógica de alistamiento por posición es:
-- Bodega: 1 a 2 asc
-- Estante: Z a A desc
-- Nivel: 7 a 1 desc
-- Posición: 99 a 01 desc
-- Frente/Posterior: F a P asc
-- Ya no se tiene en cuenta el FEFO


	/*

	SELECT 
refpcodsx, refpnumpedido, refpproducto, refpbodega, 
case when char_length(refpposicion) = 5 and refpposicion not like 'PISO%' and refpposicion not like 'RENTA%' then   
substring(refpposicion from 1 for 1) || substring(refpposicion from 5 for 1) || substring(refpposicion from 4 for 1)  || substring(refpposicion from 2 for 2)   
else '*' || refpposicion || '*' end as nuevapos ,   
refpcantidad, refpvalorunit, refpvalortotal, refpentrada, refpnacdetalle,   
refpsaldo, refppesoneto, refppesobruto, refppesonetototal, refppesobrutototal,   
resumen, refpvalorfacunit, refpvalorfactotal 
FROM referencia_pedido 
where refpnumpedido=  7875 
order by 5 desc, refpposicion desc 

"entbodega";"entposicion";"_estante";"_posicion";"_nivel";"_frente_pos"
1;"P15-1";"P";"15";1;""
7;"M33F-3";"M";"33";3;"F"

select * from movimiento.posicion_ruta_logica(1,'P15-1') union all
select * from movimiento.posicion_ruta_logica(1,'BGPISO') union all
select * from movimiento.posicion_ruta_logica(7,'M33P-3') union all
select * from movimiento.posicion_ruta_logica(7,'M33F-3') union all
select * from movimiento.posicion_ruta_logica(7,'M31F-7') union all
select * from movimiento.posicion_ruta_logica(7,'M31P-7') union all
select * from movimiento.posicion_ruta_logica(7,'M32F-5')
order by bodega asc
,estante desc
,nivel desc
,posicion desc
,frente_pos asc
*/