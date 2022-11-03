-- cambios en campos Despacho para poner datos de flete, cambio valor flete : quien cuando y justificacion

ALTER TABLE movimiento.despacho ADD COLUMN despcostoflete numeric(15,2) ;
ALTER TABLE movimiento.despacho ALTER COLUMN despcostoflete SET DEFAULT 0;

ALTER TABLE movimiento.despacho ADD COLUMN depjustflete character varying;
ALTER TABLE movimiento.despacho ADD COLUMN despfechaflete timestamp without time zone;

-- guia remesa del transp y precinto
ALTER TABLE movimiento.despacho ADD COLUMN depguiaremesa character varying;
ALTER TABLE movimiento.despacho ADD COLUMN depprecinto character varying;

despcostoflete
depjustflete
despfechaflete
depguiaremesa
depprecinto
