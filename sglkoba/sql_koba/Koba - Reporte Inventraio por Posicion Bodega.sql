select posicionbodega, promodelo, prodescripcion, proump, string_agg(distinct trafnumdta::text,',') as trafnumdta, ump_estiba, 
string_agg(distinct entcodsx::text,',') as entcodsx,sum(saldonac) as saldonac, sum(saldosnac) as saldosnac, string_agg(ltraflote,',') as ltraflote,
string_agg(to_char(ltrafvencimiento,'YYYY-MM-DD')::text,',') as ltrafvencimiento,  string_agg(tunel::text,',') as estado, string_agg(cbentrada::text,',') as cbentrada,
cbestante, cbnivel, cbposicion,entposicion

 from (
select cbestante||cbposicion as posicionbodega, promodelo, prodescripcion, proump, trafnumdta, round(prounimasterpac,0) as ump_estiba, entcodsx,entposicion,
 Round(entsaldonac,0) as saldonac, Round(entsaldosinnac,0) as saldosnac, ltraflote, ltrafvencimiento,
case when cbestado = 'IN' then 'TUNEL' else (case when cbentrada is not null then 'OCUPADA' else 'LIBRE' end) end as tunel,cbentrada,cbestante, cbnivel, cbposicion
from config_bodega 
left join entrada on entcodsx = cbentrada
left join producto on procodsx = entcodproducto 
left join lote_trafico on ltrafcodsx = entlote
left join trafico on trafcodsx = ltrafnumtrafico
where cbentrada is  null 
and entcodsx is null
union all 
select cbestante||cbposicion as posicionbodega, promodelo, prodescripcion, proump, trafnumdta, round(prounimasterpac,0) as ump_estiba, entcodsx,entposicion,
 Round(entsaldonac,0) as saldonac, Round(entsaldosinnac,0) as saldosnac, ltraflote, ltrafvencimiento,
case when cbestado = 'IN' then 'TUNEL' else (case when cbentrada is not null then 'OCUPADA' else 'LIBRE' end) end as tunel,cbentrada,cbestante, cbnivel, cbposicion
from config_bodega 
left join entrada on entcodsx = cbentrada
left join producto on procodsx = entcodproducto 
left join lote_trafico on ltrafcodsx = entlote
left join trafico on trafcodsx = ltrafnumtrafico
where cbentrada is not null 
and (entsaldonac+ entsaldosinnac) > 0
union all
select entposicion as posicionbodega, promodelo, prodescripcion, proump, trafnumdta, round(prounimasterpac,0) as ump_estiba, entcodsx, entposicion,
Round(entsaldonac,0) as saldonac, Round(entsaldosinnac,0) as saldosnac, ltraflote, ltrafvencimiento,
case when entcodsx in (select reentradafin from reubicacion) then 'UNIFICACION' else 'OTRAS' end as tunel,cbentrada,cbestante, cbnivel, cbposicion
from entrada
inner join producto on procodsx = entcodproducto
left join config_bodega on cbentrada = entcodsx 
left join lote_trafico on ltrafcodsx = entlote
left join trafico on trafcodsx = ltrafnumtrafico
where cbentrada is null 
and (entsaldonac+ entsaldosinnac) > 0
order by cbestante, cbnivel, cbposicion,entposicion
) as s1
---where entcodsx != cbentrada
--where posicionbodega in ('S45-3') --('B49-3','B50-3')
--where trafnumdta = 'IMP0447-19'
group by posicionbodega, promodelo, prodescripcion,proump,ump_estiba,cbestante, cbnivel, cbposicion,entposicion
	order by case when char_length(posicionbodega) = 5 and posicionbodega not like '%PISO%' and posicionbodega not like '%RENTA%' and posicionbodega != 'B3' then 
	substring(posicionbodega from 1 for 1) || substring(posicionbodega from 5 for 1) || substring(posicionbodega from 4 for 1)  || substring(posicionbodega from 2 for 2) 
	else 'ZZZZ'||posicionbodega end 
	
