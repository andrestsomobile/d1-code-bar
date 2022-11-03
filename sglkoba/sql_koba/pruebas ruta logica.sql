select 
case when char_length(refpposicion) = 5 and refpposicion not like 'PISO%' and refpposicion not like 'RENTA%' then 
substring(refpposicion from 1 for 1) || substring(refpposicion from 5 for 1) || substring(refpposicion from 4 for 1)  || substring(refpposicion from 2 for 2) 
else '*' || refpposicion || '*' end as nuevapos 
, refpposicion
,trim(refpposicion)
,* 
from referencia_pedido
where refpnumpedido between 258 and 260  
order by 1 desc
limit 150


--select * from referencia_pedido where refpposicion like 'PIS%'


