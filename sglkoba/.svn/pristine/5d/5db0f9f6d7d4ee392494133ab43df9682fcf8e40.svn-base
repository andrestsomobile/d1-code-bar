/*
select * from lote_trafico  where ltrafproducto  = '12000278'

"16164"
"18346"
"19122"
"19157"
"19164"
"19170"
"19175"

select lctrafcantidad, lctrafcantidad/110,* from lote_contenedor_trafico 
inner join lote_trafico on ltrafcodsx = lctraflote
 where ltrafproducto  = '12000278'
 
 990.00;25;"16164"
330.00;27;"18346"
1664.00;37;"19122"
2970.00;51;"19157"
1506.00;53;"19164"
8269.00;56;"19170"
900.00;59;"19175"

select sum(entcantidad), entlote from entrada where entcodingreso = 4 and entcodproducto = 151 group by entlote


select * from entrada where entcodingreso = 2 and entcodproducto = 151 

delete from entrada where entcodingreso = 3

delete from ingreso where ingcodsx = 3

--select (
select 
--* from movimiento.entrada_x_estiba ( 
2 ,procodsx,1,''::character varying,reftcantidad, reftpesoneto, reftpesoneto*reftcantidad,reftpesoneto, reftpesoneto*reftcantidad,
 0,0,0,0,reftfobunit,reftfobunit*reftcantidad,0,0,proump::character varying, null::integer
 --))
from producto, referencia_trafico, factura_trafico 	
where procodsx = reftproducto and reftnumfacturatrafico = ftrafcodsx 
and ftrafnumtrafico = 2 and procodigocia = 1
group by procodsx, reftcantidad, reftpesoneto, reftfobunit, prouniempaque, ftrafcodsx 

order by procodsx desc


select * from producto where procodsx = 151

*/


select 
2 ,procodsx,1,''::character varying,lctrafcantidad,reftpesoneto, reftpesoneto*lctrafcantidad,reftpesoneto, reftpesoneto*lctrafcantidad,
0,0,0,0,reftfobunit,reftfobunit*lctrafcantidad,0,0,proump::character varying, ltrafcodsx
,* from lote_trafico 
inner join lote_contenedor_trafico on lctraflote = ltrafcodsx
inner join producto on procodsx = ltrafcodproducto
inner join factura_trafico on ftrafnumtrafico = ltrafnumtrafico
inner join referencia_trafico on reftnumfacturatrafico = ftrafcodsx and reftproducto = ltrafcodproducto
where ltrafnumtrafico = 2
and  procodsx = 151






