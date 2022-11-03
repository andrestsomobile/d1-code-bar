select cbbodega, cbestante, cbnivel, cbfrente_pos, cbposicion, substring(cbposicion from 1 for 2), entcodproducto, promodelo, prodescripcion, entsaldonac, entbodega, entposicion
--, config_bodega.* 
from config_bodega  
inner join entrada on entcodsx = cbentrada
inner join producto on entcodproducto = procodsx
where cbentrada is not null
and entsaldonac > 0 
and promodelo = '12002813'
--and promodelo = '12001805'
order by cbbodega asc, cbestante desc, cbnivel desc, substring(cbposicion from 1 for 2) desc, cbfrente_pos asc


select * from c(832,'NAC'::character varying,7)

select * from lista_entradas_bodega(429,'SNAC'::character varying,7)


select procodsx, promodelo, prodescripcion, entcodsx, entsaldonac, entbodega, entposicion
from entrada 
inner join producto on entcodproducto = procodsx
where entsaldonac > 0 
and promodelo = '12002813'
--and promodelo = '12001805'

select * from entrada where entsaldosinnac > 0

select * from config_bodega  where cbentrada = 115941


select cbentrada, entcodsx, entcodingreso, nadcodsx as entcodproducto, entbodega, entposicion, entcantidad, entpesoneto, 
	   entpesonetototal, entpesobruto, entpesobrutototal, entsaldopesoneto, entsaldopesobruto,
	   nadsaldo as entsaldonac , entsaldosinnac, entlote
	from entrada 
	inner join producto on procodsx = entcodproducto
	inner join nacionalizacion_detalle on nadentrada = entcodsx
	inner join nacionalizacion on naccodsx = nadcodnac and nacestado = 'FINALIZADO'
	inner join ingreso on  ingcodsx = nacingreso 
	left join config_bodega on cbbodega = entbodega and cbentrada = entcodsx --and cbentrada is null
	where entcodproducto = 832
	--and entbodega = 1
	and entsaldonac > 0 
	--and entcodsx NOT IN (SELECT cbentrada FROM config_bodega WHERE cbbodega = 1)
	--order by ingfecha asc, entbodega asc, entposicion desc
	order by ingfecha asc
	, entbodega asc
	, cbestante desc
	, cbnivel desc
	, substring(cbposicion from 1 for 2) desc
	, cbfrente_pos asc	