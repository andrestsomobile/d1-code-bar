update entrada set   entcodingreso = '4', entcodproducto = '450', entbodega= '1',
 entposicion = 'B3', entcantidad = '0.00', entpesoneto = '8.50', entpesonetototal = '850.00', 
 entpesobruto = '8.50', entpesobrutototal = '850.00', entsaldopesoneto = '0.0000', 
 entsaldopesobruto = '0.0000', entsaldonac = '0.00', entsaldosinnac = '0.00', entvalor = '1.00', 
 entvalortotal = '100.00', entsaldonacf = '0.00', entsaldosinnacf = '0.00', entunidad= 'U24', entlote = '320' where entcodsx = 10515


select * from entrada where entbodega = 7

select * from config_bodega where cbbodega in ( 1,7) and cbestado = 'IN' order by cbestante,cbposicion

"cbposicion"
"27F-1"

select * from movimiento.es_tunel(7,'A27F-1')

select * from movimiento.es_tunel(1,'S09-1')

 SELECT entbodega, entposicion, substring(entposicion from 1 for 1), substring(entposicion from '....$'), substring(entposicion from '.$') ::integer
 , RIGHT(entposicion, -1)
   --INTO _bodega, _entposicion, _estante, _posicion, _nivel 
  FROM entrada WHERE entcodsx in ( 34852,34752);

select * from movimiento.valida_posicion_en_bodega(7,'A07F-1')
2020-9-2 1:7:51 :  update entrada set   entposicion = 'A07F-1' , entbodega = '7' where entcodsx = 43

SELECT substring('A01-1PEPE' from 1 for 1), right('A01-1PEPE',-1), case when substring('A01-1PEPE' from '.$') ~ E'^\\d+$' then substring('A01-1PEPE' from '.$')::integer  else 0 end

case when substring(_entposicion from '.$') ~ E'^\\d+$' then substring(_entposicion from '.$')::integer  else 0 end

select * from movimiento.valida_posicion_en_bodega(7,'RENTAS')

select * from movimiento.es_tunel(1,'B3')


select * from movimiento.valida_posicion_en_bodega(7,'U35-2')

select distinct entbodega, entposicion from entrada 
where char_length(entposicion) >= 5

SELECT  'U35-2' as pos, left('U35-2',1) as estante, right('U35-2',-1) as posicion ,case when substring('U35-2' from '.$') ~ E'^\\d+$' then substring('U35-2' from '.$')::integer  else 0 end as nivel
union all
SELECT 'A07F-1' as pos, left('A07F-1',1) , right('A07F-1',-1) as posicion ,case when substring('A07F-1' from '.$') ~ E'^\\d+$' then substring('A07F-1' from '.$')::integer  else 0 end as nivel
union all
SELECT 'RENTAS' as pos, left('RENTAS',1) , right('RENTAS',-1) as posicion ,case when substring('RENTAS' from '.$') ~ E'^\\d+$' then substring('RENTAS' from '.$')::integer  else 0 end as nivel

SELECT *
FROM config_bodega 
      WHERE cbbodega = 1
      AND cbestante = left('U35-2',1)
      AND cbnivel = case when substring('U35-2' from '.$') ~ E'^\\d+$' then substring('U35-2' from '.$')::integer  else 0 end
      AND cbposicion = right('U35-2',-1)
      --AND cbestado = 'AC'; 

SELECT *
FROM config_bodega 
      WHERE cbbodega = 7
      AND cbestante = left('A07F-2',1)
      AND cbnivel = case when substring('A07F-2' from '.$') ~ E'^\\d+$' then substring('A07F-2' from '.$')::integer  else 0 end
      AND cbposicion = right('A07F-2',-1)


SELECT *
FROM config_bodega 
      WHERE cbbodega = 7
      AND cbestante = left('RENTAS',1)
      AND cbnivel = case when substring('RENTAS' from '.$') ~ E'^\\d+$' then substring('RENTAS' from '.$')::integer  else 0 end
      AND cbposicion = right('RENTAS',-1)