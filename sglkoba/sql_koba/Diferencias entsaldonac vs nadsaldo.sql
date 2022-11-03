select 
'<tr><td>' || entcodsx ||
'</td><td>' || nadcodsx ||
'</td><td>' || entcantidad ||
'</td><td>' || nadcantidad ||
'</td><td>' || entsaldonac ||
'</td><td>' || nadsaldo ||
'</td><td>' || nacionalizacion_detalle.resumen ||
'</td><td>' || entposicion ||
'</td><td>' || coalesce(ro.origen::text,' ') ||
'</td><td>' || coalesce(ro.reubicaciones,' ') ||
'</td><td>' || coalesce(rd.destino::text,' ') ||
'</td><td>' || coalesce(rd.reubicaciones,' ') ||
'</td></tr>'
from entrada
left join nacionalizacion_detalle on nadentrada = entcodsx
left join (select count(*) as origen,STRING_AGG (recodsx::text,',') as reubicaciones, reentradaor from reubicacion group by reentradaor ) as ro on ro.reentradaor = entcodsx  
left join (select count(*) as destino,STRING_AGG (recodsx::text,',') as reubicaciones,reentradafin from reubicacion group by reentradafin ) as rd on rd.reentradafin = entcodsx  
where entsaldonac > 0
and entsaldonac != nadsaldo
order by 1

select * from config
insert into config values ('revision_saldonac','sistemas@sli.com.co, soporte@sli.com.co')
/*
select entcodsx,nadcodsx, entcantidad,nadcantidad,entsaldonac,nadsaldo,nacionalizacion_detalle.resumen ,entposicion
,ro.origen, ro.reubicaciones, rd.destino, rd.reubicaciones
from entrada
left join nacionalizacion_detalle on nadentrada = entcodsx
left join (select count(*) as origen,STRING_AGG (recodsx::text,',') as reubicaciones, reentradaor from reubicacion group by reentradaor ) as ro on ro.reentradaor = entcodsx  
left join (select count(*) as destino,STRING_AGG (recodsx::text,',') as reubicaciones,reentradafin from reubicacion group by reentradafin ) as rd on rd.reentradafin = entcodsx  
where entsaldonac > 0
and entsaldonac != nadsaldo
order by resumen,nadsaldo
--limit 10
*/


--   select * from reubicacion  limit 2


