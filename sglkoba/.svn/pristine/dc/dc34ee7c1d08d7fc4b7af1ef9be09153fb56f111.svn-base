select bodnombre, posicionbodega, promodelo, prodescripcion, proump, string_agg(distinct trafnumdta::text,',') as trafnumdta, ump_estiba, 
string_agg(distinct entcodsx::text,',') as entcodsx,sum(saldonac) as saldonac, sum(saldosnac) as saldosnac, Round((sum(saldonac)+sum(saldosnac))/ump_estiba,0) as estibas, string_agg(distinct ltraflote,',') as ltraflote,
string_agg(distinct to_char(ltrafvencimiento,'YYYY-MM-DD')::text,',') as ltrafvencimiento,  string_agg(distinct tunel::text,',') as estado, string_agg(distinct cbentrada::text,',') as cbentrada,
cbestante, cbnivel, cbposicion,entposicion

 from (
 
select cbbodega as bod, cbestante||cbposicion as posicionbodega, promodelo, prodescripcion, proump, trafnumdta, round(prounimasterpac,0) as ump_estiba, entcodsx,entposicion,
 Round(entsaldonac,0) as saldonac, Round(entsaldosinnac,0) as saldosnac, ltraflote, ltrafvencimiento,
case when cbestado = 'IN' then 'TUNEL' else (case when cbentrada is not null then 'OCUPADA' else 'LIBRE' end) end as tunel,cbentrada,cbestante, cbnivel, cbposicion
from config_bodega 
left join entrada on entcodsx = cbentrada
left join producto on procodsx = entcodproducto 
left join lote_trafico on ltrafcodsx = entlote
left join trafico on trafcodsx = ltrafnumtrafico
union all
select entbodega as bod, entposicion as posicionbodega, promodelo, prodescripcion, proump, trafnumdta, round(prounimasterpac,0) as ump_estiba, entcodsx, entposicion,
Round(entsaldonac,0) as saldonac, Round(entsaldosinnac,0) as saldosnac, ltraflote, ltrafvencimiento,
case when entcodsx in (select reentradafin from reubicacion) then 'UNIFICACION' else 'OTRAS' end as tunel,cbentrada,cbestante, cbnivel, cbposicion
from entrada
inner join producto on procodsx = entcodproducto
left join config_bodega on cbentrada = entcodsx 
left join lote_trafico on ltrafcodsx = entlote
left join trafico on trafcodsx = ltrafnumtrafico
where cbentrada is null and (entsaldonac+ entsaldosinnac) > 0
) as s1
left join bodega on bodcodsx = bod
group by bodnombre, posicionbodega, promodelo, prodescripcion,proump,ump_estiba,cbestante, cbnivel, cbposicion,entposicion
order by bodnombre,
case when (case when substring(entposicion from '.$') ~ E'^\\d+$' then substring(entposicion from '.$')::integer  else 0 end)  > 0
then left(entposicion,1) || case when substring(entposicion from '.$') ~ E'^\\d+$' then substring(entposicion from '.$')::integer  else 0 end || right(entposicion,-2)
else 'ZZZZ'||posicionbodega end

/*
estante nivel posicion
case when char_length(posicionbodega) = 5 and posicionbodega not like '%PISO%' and posicionbodega not like '%RENTA%' and posicionbodega != 'B3' then 
substring(posicionbodega from 1 for 1) || substring(posicionbodega from 5 for 1) || substring(posicionbodega from 4 for 1)  || substring(posicionbodega from 2 for 2) 
else 'ZZZZ'||posicionbodega end 
*/