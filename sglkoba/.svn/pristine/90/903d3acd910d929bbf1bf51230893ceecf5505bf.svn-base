-- Tablas de Dsitribucion nacional
-- Ingresos consolidados
-- IMPORTACION	PROVEEDOR	MATERIAL	UMP x ESTIBA	CANTIDAD	LOTE	VENCIMIENTO LOTE	
-- CANTIDAD CONTENEDORES	TIPO CONTENEDOR	UMP ESPERADAS	UMP RECIBIDAS	AVERIAS RECIBIDAS	
-- AVERIAS RECUPERADAS	AVERIAS TOTALES X UMP	TRANSPORTADOR	PLACA	ETA REAL CEDI	RECIBE LOGISTICA

DROP TABLE IF EXISTS auditoriacargue;

CREATE TABLE auditoriacargue
(
  accodsx serial NOT NULL,
  accodcia integer NOT NULL,
  acactividad character varying(100) NOT NULL,
  acfechainicio timestamp without time zone NOT NULL,
  acfechafinal timestamp without time zone,
  acobservacion character varying(100),
  accodusuario integer,
  acarchivo text,
  acinconsistencias text[],
  CONSTRAINT pk_auditoriacargue PRIMARY KEY (accodsx),
  CONSTRAINT fk_aucusu FOREIGN KEY (accodusuario)
      REFERENCES usuario (usucodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_auditoriacargue FOREIGN KEY (accodcia)
      REFERENCES compania (comcodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT
)
WITH (
  OIDS=FALSE
);
ALTER TABLE auditoriacargue
  OWNER TO postgres;
  
-- 
DROP TABLE movimiento.distnal_ingreso;

CREATE TABLE movimiento.distnal_ingreso
(
  dnicodsx serial NOT NULL,
  dnicodigocargue integer,
  dnicompania integer,
  dnifecha timestamp without time zone,
  dniimportacion character varying,
  dniproveedor character varying,
  dniproducto integer,
  dniumpestiba  numeric(20,6) DEFAULT 0,
  dnicantidad  numeric(20,6) DEFAULT 0,
  dnilote character varying,
  dnifechavencimiento date,
  dnicantcontenedor numeric(20,6) DEFAULT 0,
  dnitipocontenedor character varying,
  dniumpesperadas  numeric(20,6) DEFAULT 0,
  dniumprecibidas numeric(20,6) DEFAULT 0,
  dniaveriasrecibidas  numeric(20,6) DEFAULT 0,
  dniaveriasrecuperadas  numeric(20,6) DEFAULT 0,
  dniaveriastotales  numeric(20,6) DEFAULT 0,
  dnitransportadora integer,
  dniplaca character varying,
  dnietarealcedi date,
  dnirecibelogistica character varying,
  resumen text,
  CONSTRAINT pk_dniingreso PRIMARY KEY (dnicodsx),
  CONSTRAINT fk_dnii_compania FOREIGN KEY (  dnicompania )
      REFERENCES public.compania (comcodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_dnii_producto FOREIGN KEY (  dniproducto )
      REFERENCES public.producto (procodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_dnii_transp FOREIGN KEY (  dnitransportadora )
      REFERENCES public.transportadora (transpcodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT
)
WITH (
  OIDS=FALSE
);
ALTER TABLE movimiento.distnal_ingreso
  OWNER TO postgres;



DROP TABLE movimiento.distnal_despacho;


CREATE TABLE movimiento.distnal_despacho
(
  dndcodsx serial NOT NULL,
  dndcodigocargue integer,
  dndcompania integer,
  dndpedido character varying,
  dndpetra character varying,
  dndfechavencimiento date,
  dndsucursal integer,
  dnddireccion character varying,
  dndproducto integer,
  dndcantidad numeric(20,6) DEFAULT 0,
  dndvalorunit numeric(20,6) DEFAULT 0,
  dndvalorfactunit numeric(20,6) DEFAULT 0,
  dndtransportadora integer,
  dndplaca character varying,
  dndtipoveh character varying,
  dhdcostoflete numeric(20,6) DEFAULT 0,
  dndjustflete character varying,
  dndfechaflete timestamp without time zone,
  dndfechaalistamiento date,
  dndfechadespacho date,
  dndfechaentrega date,
  resumen text,
  CONSTRAINT pk_dnddespacho PRIMARY KEY (dndcodsx),
  CONSTRAINT fk_dndi_compania FOREIGN KEY (  dndcompania )
      REFERENCES public.compania (comcodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_dndi_producto FOREIGN KEY (  dndproducto )
      REFERENCES public.producto (procodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_dndi_transp FOREIGN KEY (  dndtransportadora )
      REFERENCES public.transportadora (transpcodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_dndi_sucursal FOREIGN KEY (  dndsucursal )
      REFERENCES public.sucursal (succodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT
)
WITH (
  OIDS=FALSE
);
ALTER TABLE movimiento.distnal_despacho
  OWNER TO postgres;