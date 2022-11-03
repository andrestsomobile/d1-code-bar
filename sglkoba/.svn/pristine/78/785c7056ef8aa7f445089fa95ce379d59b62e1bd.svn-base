select 
'ESTANTERIA' as tipo_ocupacion
, count(*) as tot_pos
, (select count(*) from config_bodega where cbentrada IS NOT NULL and cbestado = 'AC') as tot_ocu
, (select count(*) from config_bodega where cbentrada IS NULL and cbestado = 'AC') as tot_disp
, round(((select count(*) from config_bodega where cbentrada IS NOT NULL and cbestado = 'AC') / (select count(*) from config_bodega where cbestado = 'AC')::numeric) * 100,2) as porc_ocupado
from config_bodega
where cbestado = 'AC'

union all

select entposicion as tipo_ocupacion
,count(*) as tot_pos
,count(*) as tot_ocu
,0 as tot_disp
,round(100,2) as porc_ocupado
from entrada 
left join config_bodega on cbentrada = entcodsx
where entsaldonac + entsaldosinnac > 0 
and (case when substring(entposicion from '.$') ~ E'^\\d+$' then substring(entposicion from '.$')::integer  else 0 end)  = 0
--and (entposicion like '%PISO%' or entposicion like '%RENTA%' or entposicion like 'B3' or entposicion like 'BG%' or entposicion like '%INVE%')
and cbposicion is null
group  by entposicion