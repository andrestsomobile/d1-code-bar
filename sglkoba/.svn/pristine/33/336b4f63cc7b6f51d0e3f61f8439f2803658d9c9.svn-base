select entlote,ltraflote, ltrafnumtrafico, count(*) cantidad_entradas
from entrada
inner join producto on procodsx = entcodproducto
inner join lote_trafico on ltrafcodsx = entlote
where entsaldonac > 0
group by entlote,ltraflote, ltrafnumtrafico


--select * from lote_trafico 