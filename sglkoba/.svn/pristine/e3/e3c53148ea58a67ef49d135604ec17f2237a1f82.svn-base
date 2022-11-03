--- 4- Liberar posiciones con pedido en estado finalizado.

-- 1. al finalizar un pedido debe recorrer las referencias y si las entradas relacionadas ya quedan sin saldo lbera posicion
-- 2. al activar un pedido debe recorrer las refencias y si las entradas ya no

DROP TRIGGER  IF EXISTS tg_gstposicion_entrada_upd_after ON movimiento.entrada;


CREATE TRIGGER tg_gstposicion_entrada_upd_after
    AFTER UPDATE
    ON movimiento.entrada
    FOR EACH ROW
    EXECUTE PROCEDURE movimiento.tg_gstposicion_entrada_after();
    
select * from referencia_pedido  order by 1 desc



 select movimiento.actualiza_posicion_en_bodega(entcodsx) from entrada 
 where entsaldonac + entsaldosinnac > 0
 and char_length(entposicion) = 5 
 and entposicion not like '%PISO%' and entposicion not like '%RENTA%' and entposicion != 'B3'
and  entposicion not in ( 'u35-5','G46-7')

 
4) ejecuta el resultado del punto 2
5) update config_bodega  set cbentrada = null where cbentrada in (select entcodsx from entrada where entsaldonac + entsaldosinnac = 0)


select * from entrada where entposicion = 'u35-5'