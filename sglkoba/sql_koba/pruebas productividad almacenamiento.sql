select 
realfecha
, realaccion
, empnombre
, min(radetiempo ) as inicio
, max(radetiempo) as final
,(realfecha || ' ' || max(radetiempo)) as finala
, to_char(  ( realfecha || ' ' || max(radetiempo) ) ::timestamp without time zone   - ( realfecha || ' ' || min(radetiempo) )::timestamp without time zone , 'HH24, MI:SS') as tiempo
, to_char(  ( realfecha || ' ' || max(radetiempo) ) ::timestamp without time zone   - ( realfecha || ' ' || min(radetiempo) )::timestamp without time zone , 'DD, HH24:MI:SS') as tiempo
, sum(radeestibas) qtyestibas
from registro_almacenamiento_detalle  

inner join registro_almacenamiento on raderegalm = realcodsx
inner join empleado on empcodsx = realempleado
--where realfecha >= current_date
group by realcodsx, realaccion,realfecha,realhoin,empnombre
order by 2,1

/*



select * from registro_almacenamiento where realfecha >= current_date
where  where realaccion = 'REUBICACION MANUAL'

select * from registro_almacenamiento_detalle 
limit 10


select realaccion, realfecha, min(radetiempo), max(radetiempo), sum(radeestibas)
from registro_almacenamiento_detalle  
inner join registro_almacenamiento on raderegalm = realcodsx
where realfecha >= current_date
group by realaccion,realfecha
order by 2,1


select * from empleado 

select * from reubicacion where  refecha  >= '2020-09-29'

select min(refecha), max(refecha) ,count(*) from reubicacion where  refecha  >= '2020-09-28'

select * from empleado 

INSERT INTO registro_almacenamiento_detalle ( raderegalm, radecodentrada, radecodreubicacion, radeestibas, radetiempo) VALUES (
select

"min";"max";"count"
 de 2020-09-28 07:17:23 a 2020-09-28 12:19:34 lleva 340

 "empcodsx";"empnombre";"empcedula";"empmail";"empcargo";"resumen"
1;"ALEJANDRO BABATIVA";"1070305424";"0";"Operario";"1 ALEJANDRO BABATIVA 1070305424"

*/