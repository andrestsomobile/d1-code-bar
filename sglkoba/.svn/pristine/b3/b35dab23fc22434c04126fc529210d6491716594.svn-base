-- FUNCTION: movimiento.tg_gst_pedido_actualizar_datos()

-- DROP FUNCTION movimiento.tg_gst_pedido_actualizar_datos();

CREATE oR REPLACE FUNCTION movimiento.tg_gst_pedido_actualizar_datos()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF 
AS $BODY$--ACTUALIZA DATOS DESDE PACKING_DETALLE_POSICION HACIA PACKING_dETALLE Y DE ALLLI HACIA EL PACKING:
DECLARE
pesoneto numeric;
pesobruto numeric;
valor numeric;
valorfac numeric;
porc_iva numeric;
ref_ped RECORD;
_pedcodsx int8;

BEGIN
pesoneto=0;
pesobruto=0;
valor=0;
valorfac=0;

IF TG_OP='DELETE' THEN
	_pedcodsx = OLD.refpnumpedido;
ELSE 
	_pedcodsx = NEW.refpnumpedido;
END IF;

IF TG_RELNAME='referencia_pedido' THEN

	select into pesoneto sum(refppesonetototal) 
	from referencia_pedido where
	refpnumpedido = _pedcodsx;

	select into pesobruto sum(refppesobrutototal) 
	from referencia_pedido where
	refpnumpedido = _pedcodsx;

	select into valor sum(refpvalortotal) 
	from referencia_pedido where
	refpnumpedido = _pedcodsx;

	select into valorfac sum(refpvalorfactotal) 
	from referencia_pedido where
	refpnumpedido = _pedcodsx;

	select into porc_iva pedporc_iva
	from pedido where pedido.pedcodsx =_pedcodsx;

IF pesoneto is NULL THEN pesoneto =0; END IF;
IF pesobruto is NULL THEN pesobruto =0; END IF;
IF valor is NULL THEN valor =0; END IF;
IF valorfac is NULL THEN valorfac =0; END IF;

update pedido set pedpesoneto= pesoneto, pedpesobruto = pesobruto , pedsubtotal =  valor,pedfactotal = valorfac,
pediva = valor * porc_iva /100 , pedtotal = valor + ( valor * porc_iva /100 ) where pedido.pedcodsx= _pedcodsx;

END IF;

IF TG_OP='DELETE' THEN
	return OLD;
ELSE 
	return NEW;
END IF;

END;$BODY$;

ALTER FUNCTION movimiento.tg_gst_pedido_actualizar_datos()
    OWNER TO postgres;
