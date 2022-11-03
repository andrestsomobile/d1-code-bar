-- FUNCTION: movimiento.tg_gstposicion_entrada_before()

-- DROP FUNCTION movimiento.tg_gstposicion_entrada_before();

CREATE or replace FUNCTION movimiento.tg_gstposicion_entrada_before()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
--
DECLARE
  _prounimasterpac numeric;
  _posicion character varying;
  _valida integer;
  rec RECORD;
BEGIN

  IF TG_OP='INSERT' THEN
    IF NEW.entposicion IS NULL OR NEW.entposicion = '' THEN
	SELECT * INTO rec FROM ingreso WHERE ingcodsx = NEW.entcodingreso;
	IF rec.ingtipoasignacion = 'AUTOMATICO' THEN
          NEW.entposicion = movimiento.obtiene_posicion_libre(NEW.entbodega,NEW.entcodsx,NEW.entcodproducto,NEW.entcantidad);
	  RAISE NOTICE 'Se posiciona en %',NEW.entposicion;
	ELSE
          RAISE NOTICE 'No se posiciona nada';
        END IF;  
    ELSE
       RAISE NOTICE 'Entro con posicion fija: %',NEW.entposicion;
    END IF;
    RETURN NEW;

  ELSIF TG_OP='UPDATE' THEN
    -- Se valida que la posicion este libre y no sea tunel
    IF OLD.entposicion != NEW.entposicion THEN
      _valida = movimiento.valida_posicion_en_bodega(NEW.entbodega, NEW.entposicion);
      IF _valida = 1 THEN -- es posicion valida
         -- libera la posicion anterior y marca la nueva posicion como ocupada
         PERFORM movimiento.libera_posicion_en_bodega(OLD.entbodega, OLD.entposicion);
         PERFORM movimiento.actualiza_posicion_en_bodega(NEW.entcodsx,NEW.entbodega, NEW.entposicion);
         RETURN NEW;
      ELSE      
         RAISE EXCEPTION 'La posicion % no es valida, esta ocupada o es un tunel', NEW.entposicion;
      END IF;
    ELSE
      RETURN NEW;
    END IF;
  ELSIF TG_OP='DELETE' THEN
  
    UPDATE config_bodega set cbentrada = NULL 
      WHERE cbentrada = OLD.entcodsx;
    RETURN OLD;

  ELSE
  
    RETURN NEW;
    
  END IF;

END;
$BODY$;

ALTER FUNCTION movimiento.tg_gstposicion_entrada_before()
    OWNER TO postgres;
