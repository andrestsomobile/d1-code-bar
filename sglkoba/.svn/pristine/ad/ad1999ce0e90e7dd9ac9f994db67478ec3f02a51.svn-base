
0) ejecutar script Koba-FUNCTION obtiene_posicion_libre V2 sin recursividad.sql
1) llenar mapa Koba-FUNCTION llenar_config_bodega.sql
2) marcar tuneles Koba-FUNCTION llenar_config_bodega.sql
3) select 'select movimiento.actualiza_posicion_en_bodega('||entcodsx||');' from entrada where char_length(entposicion) = 5 order by entrada
4) ejecuta el resultado del punto 2
5) update config_bodega  set cbentrada = null where cbentrada in (select entcodsx from entrada where entsaldonac + entsaldosinnac = 0)
