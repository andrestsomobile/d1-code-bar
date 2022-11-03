-- SELECT * FROM trafico WHERE trafcodsx='5'

/* 


INSERT INTO ingreso (ingcodcia,ingfecha,ingtipo,ingtrafico, ingobservacion, ingestado, ingcausal, ingcli_devolucion, ingpesoneto, ingpesobruto, 
ingfob, ingcantidad, ingciudad_dev, ingconsec, ingconseczfp, ingplanilla )
VALUES ('1','2019-7-27 19:29:10','TRAFICO','5' ,'' ,'TRAMITE' ,NULL,NULL,'0' ,'0' ,'0' ,'0' ,NULL,NULL,NULL,'' )

select * from ingreso

select count(*) from entrada

delete from entrada where entcodingreso = 34;

delete from ingreso where ingtrafico = 5

select * from entrada


*/


-- Function: movimiento.tg_entradas_trafico()

-- DROP FUNCTION movimiento.tg_entradas_trafico();

CREATE OR REPLACE FUNCTION movimiento.tg_entradas_trafico()
  RETURNS trigger AS
$BODY$--
DECLARE
  rec RECORD;
BEGIN

  IF TG_OP='INSERT' THEN
    FOR rec IN SELECT procodsx,  reftcantidad, reftpesoneto, 
       reftpesoneto*reftcantidad as pesonetotot, reftpesoneto, reftpesoneto*reftcantidad as pesobrutotot, 
       reftfobunit,reftfobunit*reftcantidad as fobtotal,proump
       FROM referencia_trafico 
       INNER JOIN producto ON procodsx = reftproducto AND procodigocia = NEW.ingcodcia  and prounimasterpac != 1
       INNER JOIN factura_trafico ON ftrafcodsx = reftnumfacturatraficO AND ftrafnumtrafico = NEW.ingtrafico 
       ORDER BY procodsx desc LOOP

       PERFORM movimiento.entrada_x_estiba(NEW.ingcodsx,rec.procodsx,1,''::character varying,rec.reftcantidad, rec.reftpesoneto, 
       rec.pesonetotot,rec.reftpesoneto, rec.pesobrutotot, 0,0,0,0,rec.reftfobunit,rec.fobtotal,0,0,rec.proump, null::integer);
     END LOOP;
  END IF;
  RETURN NEW;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;



-- 
DROP TRIGGER tg_entradas_trafico ON movimiento.ingreso;

CREATE TRIGGER tg_entradas_trafico
    AFTER INSERT 
    ON movimiento.ingreso
    FOR EACH ROW
    EXECUTE PROCEDURE movimiento.tg_entradas_trafico();