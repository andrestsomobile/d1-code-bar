select 
					 ltraflote 
					,ltrafproducto 
					,prodescripcion 
					,ltrafvencimiento::date
					,sum(lctrafcantidad)
					from lote_trafico  
					inner join producto on procodsx = ltrafcodproducto  
					left join lote_contenedor_trafico on lctraflote = ltrafcodsx
					where ltrafvencimiento between current_date and current_date + integer '90'
					group by ltraflote,ltrafproducto,prodescripcion,ltrafvencimiento
					order by 1;

select * from lote_contenedor_trafico limit 1
"lctrafcantidad"
2434.00
select * from lote_trafico limit 1

"ltrafcodsx"
3
"lctraflote"
353

2019-10-22 13:50:55 : select 
'<tr><td>'|| ltraflote 
||'</td><td>'||ltrafproducto 
||'</td><td>'||prodescripcion 
||'</td><td>'||ltrafvencimiento::date
||'</td></tr>' 
from lote_trafico  
inner join producto on procodsx = ltrafcodproducto  
where ltrafvencimiento between current_date and current_date + integer '90'
order by 1

select * from config

"cfnombre";"cfvalor"
"notifica_vencimiento_lotes";"sistemas@sli.com.co,soporte@sli.com.co,milena.mendez@koba-group.com,jose.tibaquicha@koba-group.com"


delete from config;

insert into config values ('notifica_vencimiento_lotes','sistemas@sli.com.co,soporte@sli.com.co')

insert into config values ('notifica_vencimiento_lotes','sistemas@sli.com.co,soporte@sli.com.co,jose.tibaquicha@koba-group.com,jorge.castiblanco@koba-group.com,milena.mendez@koba-group.com')



select * from enviarmail 

select emcodsx, emcorreo, emasunto, emmensaje from enviarmail where emenviado = 'N' order by 1