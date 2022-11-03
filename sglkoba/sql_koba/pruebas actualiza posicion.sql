
 select 'select movimiento.actualiza_posicion_en_bodega('||entcodsx||');' from entrada where char_length(entposicion) = 5 order by entrada


select * from movimiento.actualiza_posicion_en_bodega(24959 ) 

 SELECT entcodsx, entbodega, entposicion, substring(entposicion from 1 for 1), substring(entposicion from '....$'), substring(entposicion from '.$')  FROM entrada 
where char_length(entposicion) = 5