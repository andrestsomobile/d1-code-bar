﻿delete from config where cfnombre = 'notifica_vencimiento_lotes';

--insert into config values('notifica_vencimiento_lotes','sistemas@sli.com.co,soporte@sli.com.co,milena.mendez@koba-group.com,jose.tibaquicha@koba-group.com');

insert into config values('notifica_vencimiento_lotes','soporte@sli.com.co');

select * from enviarmail  where emenviado  ='N'

delete from  enviarmail;

select * from config;

/*
select 
'<tr><td>'|| ltraflote 
||'</td><td>'||ltrafproducto 
||'</td><td>'||prodescripcion 
||'</td><td>'||ltrafvencimiento::date
||'</td></tr>' 
from lote_trafico  
inner join producto on procodsx = ltrafcodproducto  
where ltrafvencimiento between current_date and current_date +  integer '90'
order by 1

select emcodsx, emcorreo, emasunto, emmensaje from enviarmail where emenviado = 'N' order by 1

*/