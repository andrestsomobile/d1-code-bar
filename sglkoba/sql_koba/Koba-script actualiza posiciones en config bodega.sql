-- Ejecutar los select que resultan de este query.

 select 'select movimiento.actualiza_posicion_en_bodega('||entcodsx||');' from entrada where char_length(entposicion) = 5 and (entsaldonac + entsaldosinnac) > 0 order by entrada

