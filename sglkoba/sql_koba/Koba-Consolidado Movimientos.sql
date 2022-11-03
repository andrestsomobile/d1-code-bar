
select trafnumdta, ingcodsx, promodelo, sum(entcantidad) as cantidad_ingreso, sum(entsaldonac) as disponible_nac, sum (entsaldosinnac) as disponible_snac
,sum(coalesce(nadcantidad,0)) as cantidad_nacionalizada, sum(coalesce(nadsaldo,0)) as saldo_nacionalizado
,sum(coalesce(refpcantidad,0)) as cantidad_reservada, sum(coalesce(refpsaldo,0)) as pendiente_despacho
,sum(entcantidad)-sum(coalesce(refpcantidad,0))+sum (entsaldosinnac)  as disponible_real  
from 
entrada
inner join ingreso on ingcodsx  = entcodingreso
inner join trafico on ingtrafico  = trafcodsx
inner join producto on procodsx = entcodproducto --and procodsx = 466
left join nacionalizacion_detalle on nadentrada = entcodsx
left join referencia_pedido on  refpproducto = entcodproducto and refpentrada= entcodsx and refpnacdetalle = nadcodsx
group by  trafnumdta, ingcodsx, promodelo
order by promodelo, ingcodsx