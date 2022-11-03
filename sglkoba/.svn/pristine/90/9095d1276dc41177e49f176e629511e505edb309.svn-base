
select repefecha, 'ALISTAMIENTO', empnombre, repehoin, repehofi,repeesta
,to_char(  ( repefecha || ' ' || max(repehofi) ) ::timestamp without time zone   - ( repefecha || ' ' || min(repehoin) )::timestamp without time zone , 'HH24, MI:SS') as tiempo
,count(rpdenumpedido) as qty
from registro_pedido_detalle
inner join registro_pedido on repecodsx = rpderegped
inner join empleado on empcodsx = repeempleado
where repefecha > '2021-08-01'
group by repefecha, empnombre,repehoin, repehofi,repeesta
