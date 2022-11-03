select entposicion as posicionbodega, promodelo, prodescripcion, proump, trafnumdta, round(prounimasterpac,0) as ump_estiba, entcodsx, entposicion, Round(entsaldonac,0) as saldonac, Round(entsaldosinnac,0) as saldosnac, ltraflote,ltrafelaboracion, ltrafvencimiento,
'OTRAS' as tunel,cbentrada,cbestante, cbnivel, cbposicion
from entrada
inner join producto on procodsx = entcodproducto
left join config_bodega on cbentrada = entcodsx 
left join lote_trafico on ltrafcodsx = entlote
left join trafico on trafcodsx = ltrafnumtrafico
where cbentrada is null and (entsaldonac+ entsaldosinnac) > 0
and entposicion not LIKE ('%INVENTARIO%')
and entposicion not LIKE ('%PISO%')
and entposicion not LIKE ('%RENTAS%')
and entposicion not LIKE ('%B3%')
order by cbestante, cbnivel, cbposicion,entposicion