--select * from enviarmail order by 1 desc limit 500

---"emcodsx";"emfecha";"emcorreo";"emasunto";"emmensaje";"emenviado"
---75132;"2021-01-09 13:32:15.458021";"jose.tibaquicha@koba-group.com,sistemas@sli.com.co,soporte@sli.com.co";"Tarea Automatica Posiciones Bodega";"P0001 La posicion RENTA esta ocupada o esta definida como tunel.";"S"

--- select * from movimiento.automatico_posiciones_bodega();

CREATE OR REPLACE FUNCTION movimiento.automatico_posiciones_bodega() RETURNS void AS
$BODY$--
DECLARE
	rec record;
	linea text ;
BEGIN
        linea = '';
--	FOR rec IN select * from entrada where char_length(entposicion) = 5 and entsaldonac + entsaldosinnac != 0 order by entrada LOOP
	UPDATE config_bodega SET cbentrada = NULL WHERE cbentrada IN (SELECT entcodsx FROM entrada WHERE entsaldonac + entsaldosinnac = 0);
	FOR rec IN select case when substring(entposicion from '.$') ~ E'^\\d+$' then substring(entposicion from '.$')::integer  else 0 end as _nivel,entrada.* from entrada where entsaldonac + entsaldosinnac != 0 order by entrada LOOP
		IF rec.entbodega IS NOT NULL AND rec.entposicion IS NOT NULL AND rec._nivel > 0 THEN
			BEGIN
				PERFORM movimiento.actualiza_posicion_en_bodega(rec.entcodsx);
			EXCEPTION
				WHEN OTHERS THEN
				    RAISE NOTICE 'ERROR:%, DETALLE:%', SQLSTATE, SQLERRM;
				    linea = linea || '<br>' || coalesce(SQLSTATE,'0') ||' '|| coalesce (SQLERRM,'Null');
			    
			END;
		END IF;
	END LOOP;
	IF linea != '' THEN
		--INSERT INTO enviarmail VALUES (DEFAULT, now(), 'soporte@sli.com.co','Tarea Automatica Posiciones Bodega',linea,'N');
	END IF;
	UPDATE config_bodega SET cbentrada = NULL WHERE cbentrada IN (SELECT entcodsx FROM entrada WHERE entsaldonac + entsaldosinnac = 0);
END;
$BODY$
LANGUAGE plpgsql VOLATILE;