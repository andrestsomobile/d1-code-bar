SELECT entbodega, entposicion, substring(entposicion from 1 for 1) as _estante, right(entposicion,-1) as _posicion, 
case when substring(entposicion from '.$') ~ E'^\\d+$' then substring(entposicion from '.$')::integer  else 0 end as _nivel
, case when left(right(entposicion,-3),1) in ('F','P') then left(right(entposicion,-3),1) else null end as _frente_pos
FROM entrada WHERE entcodsx in ( 132871, 117031); 

/*
 --select * from movimiento.lista_entradas_fifo(148,'NAC')

 --select * from producto where promodelo like '%204'

select entcodsx, entcodingreso, nadcodsx as entcodproducto, entbodega, entposicion, entcantidad, entpesoneto, 
	   entpesonetototal, entpesobruto, entpesobrutototal, entsaldopesoneto, entsaldopesobruto,
	   nadsaldo as entsaldonac , entsaldosinnac, entlote

--left(cbposicion,2),-
--entcodsx, entbodega, entposicion, entcantidad, nadsaldo as entsaldonac , entsaldosinnac, entlote, ltrafvencimiento
--,config_bodega.*
	from entrada 
	inner join producto on procodsx = entcodproducto
	inner join nacionalizacion_detalle on nadentrada = entcodsx
	inner join nacionalizacion on naccodsx = nadcodnac and nacestado = 'FINALIZADO'
	inner join ingreso on  ingcodsx = nacingreso 
	left join lote_trafico on ltrafcodsx = entlote and ltrafcodproducto = entcodproducto
	inner join config_bodega on cbentrada = entcodsx
	where entcodproducto = 148
	and ( (entsaldonac >= prounimasterpac and entposicion != 'PISO') 
	   or (entsaldonac > 0 and entposicion = 'PISO')
	    )
	and ((char_length(entposicion) >= 5 and entposicion not like '%PISO%' and entposicion not like 'RENTA%' and entposicion != 'B3' and entposicion not like '%ZONA%') )
	and entposicion != 'RECIBO' 
	and entposicion != 'AVERIA'
	and entposicion != 'SOBRANTE'
	and entbodega != 11 --Bodega CALIDAD
	order by 
	 entbodega asc
	, cbestante desc
	, cbnivel desc
	, left(cbposicion,2) desc
	, cbfrente_pos asc
	 
	   --case when char_length(entposicion) >= 5 and entposicion not like 'PISO%' and entposicion not like 'RENTA%' then 
--	substring(entposicion from 1 for 1) || substring(entposicion from 5 for 1) || substring(entposicion from 4 for 1)  || substring(entposicion from 2 for 2) 
--	else '*' || entposicion || '*' end desc , ltrafvencimiento asc



SELECT entbodega, entposicion, substring(entposicion from 1 for 1) as _estante, right(entposicion,-1) as _posicion, 
case when substring(entposicion from '.$') ~ E'^\\d+$' then substring(entposicion from '.$')::integer  else 0 end as _nivel
, case when left(right(entposicion,-3),1) in ('F','P') then left(right(entposicion,-3),1) else null end as _frente_pos
FROM entrada WHERE entcodsx in ( 132871, 117031); 


*/