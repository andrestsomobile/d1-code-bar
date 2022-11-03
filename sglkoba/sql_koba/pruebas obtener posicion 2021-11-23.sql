SELECT *, cbestante||cbposicion as valor_posicion --INTO rec_conf_bodega 
FROM config_bodega 
	 WHERE cbbodega = 7 
	 AND cbestado = 'AC' 
	 AND cbentrada IS NULL
	 AND cbproducto = '12002822'
	 --AND cbestante >= _primer_estante
	 ORDER BY cbestante,cbnivel,cbposicion LIMIT 1;

	 select * from producto where procodsx = 485
	 procodsx,procodigocia,prodescripcion,procategoria,promodelo,prosubpartida,proean,procodbarra,progarantia,prokiloreal,provolumen,prokilovolumen,prouniempaque,prokvuniempaque,provoluniempaque,prounimasterpac,prokvmasterpack,propesobmp,resumen,provolmasterpac,procodigobarra,proestado,proobservacion,protipoproducto,prolargo,proalto,proancho,procatoster,proump
485,1,QUINUA PREPARADA CUCINA & AMORE 225GR,2,12001811,0,N,N,N,8.000000,0.027018,10.807200,1.000000,10.807200,0.027018,40.000000,16000.000000,20.000000,485 QUINUA PREPARADA CUCINA & AMORE 225GR 12001811 BODEGA IMPORTADOS LINEA 0 ACTIVO FEFO,40.000000,0,ACTIVO,N/A,2,24.000000,39.500000,28.500000,3,U36

select * from config_bodega  where  cbbodega = 7 
and cbproducto = '12001811'
--and cbproducto is not null --= '12001811'

--select * from movimiento.obtiene_posicion_libre(7,140922,'12001811',0);


select * from movimiento.obtiene_posicion_libre(7,140922,485,0);

NOTICE:  _bodega 7,_entrada 222925,_producto 1052, _entcantidad 12)

select * from movimiento.obtiene_posicion_libre(7,222925,1052,0);

SELECT * FROM config_bodega where cbproducto like '%12004042%'

12001811

SELECT * FROM config_bodega where cbproducto like '%12002822%'

select * from producto where promodelo = '12002822'
procodsx,procodigocia,prodescripcion,procategoria,promodelo,prosubpartida,proean,procodbarra,progarantia,prokiloreal,provolumen,prokilovolumen,prouniempaque,prokvuniempaque,provoluniempaque,prounimasterpac,prokvmasterpack,propesobmp,resumen,provolmasterpac,procodigobarra,proestado,proobservacion,protipoproducto,prolargo,proalto,proancho,procatoster,proump
809,1,SHOWER GEL NATURAL FEELING 750 ML,2,12002822,12002822,S,S,S,10.000000,0.017095,6.838,12.000000,82.056,0.20514,76,0.0,10.000000,809 SHOWER GEL NATURAL FEELING 750 ML 12002822 BODEGA IMPORTADOS LINEA 12002822 ACTIVO FEFO,0.000000,0,ACTIVO,,2,30.500000,29.500000,19.000000,2,U12

update config_bodega set cbproducto = '12004042' where cbproducto = '12001811'


select * from config_bodega  where cbbodega = 7 and cbestante= 'C' and cbposicion='59P-5'

select * from entrada where entcodsx = 140922
entcodsx,entcodingreso,entcodproducto,entbodega,entposicion,entcantidad,entpesoneto,entpesonetototal,entpesobruto,entpesobrutototal,entsaldopesoneto,entsaldopesobruto,entsaldonac,entsaldosinnac,entvalor,entvalortotal,resumen,entfecha,entsaldonacf,entsaldosinnacf,entunidad,entlote
140922,1611,485,7,,0.00,8.000000,320.0,8.000000,320.0,0.000000,0.000000,0.00,0,1,40.000000,12001811 QUINUA PREPARADA CUCINA & AMORE 225GR  BODEGA 2,2021-02-23 15:31:04.905728,0.00,0.00,UND,4175

	
select * from entrada where entposicion ='' and entsaldonac > 0 order by 1 desc limit 10
140922	1611	485	7		0.00	8.000000	320.0	8.000000	320.0	0.000000	0.000000	0.00	0	1	40.000000	"12001811 QUINUA PREPARADA CUCINA & AMORE 225GR  BODEGA 2"	"2021-02-23 15:31:04.905728"	0.00	0.00	"UND"	4175

	 SELECT * FROM contenedor_trafico where   ctrafnumtrafico=2376
	 
2021-11-24 6:49:16 : select coalesce(trafmotonave,'0') from trafico where trafcodsx = '2376'

DELETE FROM ENTRADA WHERE ENTCODINGRESO = 2477


select (select * from movimiento.entrada_x_estiba 
( 2477,procodsx,7,''::character varying,lctrafcantidad,reftpesoneto, reftpesoneto*lctrafcantidad,reftpesoneto
, reftpesoneto*lctrafcantidad, 0,0,0,0,reftfobunit,reftfobunit*lctrafcantidad,0,0,proump::character varying
, ltrafcodsx, lctrafcodsx)) 
 from lote_trafico 
 inner join lote_contenedor_trafico on lctraflote = ltrafcodsx and lctrafcodsx = 6548 
 inner join producto on procodsx = ltrafcodproducto 
  inner join factura_trafico on ftrafnumtrafico = ltrafnumtrafico  
  inner join referencia_trafico on reftnumfacturatrafico = ftrafcodsx and reftproducto = ltrafcodproducto 
   where ltrafnumtrafico = 2376 and procodigocia = 1 order by procodsx asc

select * from lote_contenedor_trafico order by 1 desc limit 100

 SELECT lote_contenedor_trafico.* 
 FROM lote_contenedor_trafico 
 INNER JOIN lote_trafico ON ltrafcodsx = lctraflote 
 AND  ltrafnumtrafico = 2419;

lctrafcodsx,lctrafcontenedor,lctraflote,lctrafcantidad,lctrafingreso
6651,5562,6020,50,<NULL>


				update lote_contenedor_trafico set lctrafingreso = 'N' where lctrafcodsx = 6651 