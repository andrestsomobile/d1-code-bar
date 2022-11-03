/*
query despachos koba
parametro: rango de fecha de despachos
campos:
- fecha.
- codigo material.
- descripcion material.
- numero pedido o reserva.
- numero de cajas (ump).
- estibas.
- fecha vencimiento.
- lote.
- transportadora.
- placa.
- tipo vehiculo.
- observacion.
- quien alisto
- quien despacho ??
- quien reviso ??
- numero de precinto  ??
- hora entrada vehiculo
- hora salida vehiculo
*/

select 
d.despfecha as "Fecha", pro.promodelo as "Material", regexp_replace(pro.prodescripcion, E'[\\n\\r]+', ' ', 'g') as "Descripcion", p.pednumpedido as "Pedido", s.sucnombre as "Sucursal", rd.refdcant as "Cantidad", round(rd.refdcant/pro.prounimasterpac) as "Estibas"
, l.ltrafvencimiento as "Vencimiento Lote", l.ltraflote as "Lote", t.transpnombre as "Trasportadora", d.despplaca as "Placa", d.desptipoveh as "Tipo Veh", regexp_replace(d.despobservacion, E'[\\n\\r]+', ' ', 'g') as "Observaciones", emp.empnombre as "Alisto", 'N/A' as "Reviso", 'N/A' as "Precinto"
,despfechalv as "Fecha Entrada Veh", desphoralv as "Hora Entrada Veh", despfechasv as "Fecha Salida Veh", desphorasv as "Hora Entrada Veh"
from despacho d
inner join despacho_pedido dp on dp.despeddespacho = d.despcodsx
inner join referencia_despacho rd on rd.refddespacho_pedido = dp.despedcodsx 
inner join producto pro on pro.procodsx = rd.refdproducto
inner join pedido p on p.pedcodsx = dp.despedpedido
inner join sucursal s on s.succodsx = pedsucursal
inner join referencia_despacho_pedido rdp on rdp.refdpcodrefd = rd.refdcodsx 
inner join referencia_pedido rp on rp.refpcodsx = rdp.refdcodrefp
inner join entrada e on e.entcodsx = rp.refpentrada
inner join lote_trafico l on l.ltrafcodsx = e.entlote
inner join transportadora t on t.transpcodsx = desptransportadora
inner join registro_pedido_detalle rgpd on rgpd.rpdenumpedido = p.pedcodsx
inner join registro_pedido rgp on rgp.repecodsx = rpderegped
inner join empleado emp on emp.empcodsx = rgp.repeempleado
where d.despfecha between current_date-200 and  current_date
---where d.despfecha between '2019-12-01 00:00:00' and '2019-12-31 23:59:59'
order by 1 
--limit 1