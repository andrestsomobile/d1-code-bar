-- Function: movimiento.tg_gstposicion_entrada_before()

-- DROP FUNCTION movimiento.tg_gstposicion_entrada_before();

CREATE OR REPLACE FUNCTION movimiento.tg_gstposicion_entrada_before()
  RETURNS trigger AS
$BODY$--
DECLARE
  _prounimasterpac numeric;
  _posicion character varying;
  _valida integer;
  ing record;
BEGIN

  IF TG_OP='INSERT' THEN
    IF NEW.entposicion IS NULL OR NEW.entposicion = '' THEN
       select * into ing from ingreso where ingcodsx = NEW.entcodingreso; 
       IF ing.ingestado='TRAMITE' and ing.ingtipo='TRAFICO' THEN
         NEW.entposicion = NULL;
       ELSE
         NEW.entposicion = movimiento.obtiene_posicion_libre(NEW.entbodega,NEW.entcodsx,NEW.entcodproducto,NEW.entcantidad);
       END IF;
    ELSE
       RAISE NOTICE 'Entro con posicion fija: %',NEW.entposicion;
    END IF;
    RETURN NEW;

  ELSIF TG_OP='UPDATE' THEN
    -- Se valida que la posicion este libre y no sea tunel
    IF OLD.entposicion != NEW.entposicion THEN
      _valida = movimiento.valida_posicion_en_bodega(NEW.entbodega, NEW.entposicion);---
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

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION movimiento.tg_gstposicion_entrada_before()
  OWNER TO postgres;
