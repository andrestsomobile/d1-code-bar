
/*
select 'select movimiento.actualiza_posicion_en_bodega('||entcodsx||');' from entrada where char_length(entposicion) = 5 and entsaldonac + entsaldosinnac != 0 order by entrada

update config_bodega  set cbentrada = null where cbentrada in (select entcodsx from entrada where entsaldonac + entsaldosinnac = 0)

SELECT * FROM automatico_posiciones_bodega();

select * from enviarmail  order by 1 desc limit 5

select * from entrada where entposicion = 'J50:1'

update entrada set entposicion = 'J50-1' where entposicion = 'J50:1'

select * from entrada where entposicion like 'J5%1'

*/

CREATE OR REPLACE FUNCTION movimiento.automatico_posiciones_bodega() RETURNS void AS
$BODY$--
DECLARE
	rec record;
BEGIN
	FOR rec IN select * from entrada where char_length(entposicion) = 5 and entsaldonac + entsaldosinnac != 0 order by entrada LOOP
		BEGIN
		  PERFORM movimiento.actualiza_posicion_en_bodega(rec.entcodsx);
		EXCEPTION
			WHEN OTHERS THEN
			    RAISE NOTICE 'ERROR:%, DETALLE:%', SQLSTATE, SQLERRM;
			    INSERT INTO enviarmail VALUES 
				(DEFAULT, now(), 'jose.tibaquicha@koba-group.com,sistemas@sli.com.co,soporte@sli.com.co','Tarea Automatica Posiciones Bodega',coalesce(SQLSTATE,'0') ||' '|| coalesce (SQLERRM,'Null'),'N');
		END;
	END LOOP;
	UPDATE config_bodega SET cbentrada = NULL WHERE cbentrada IN (SELECT entcodsx FROM entrada WHERE entsaldonac + entsaldosinnac = 0);
END;
$BODY$
LANGUAGE plpgsql VOLATILE;

--sistemas@sli.com.co, soporte@sli.com.co

