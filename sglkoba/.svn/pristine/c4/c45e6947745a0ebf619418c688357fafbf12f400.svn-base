
UPDATE contenedor_trafico set ctrafestado = 'DESCARGANDO' WHERE ctrafestado = 'CARGANDO' ;

-- Table: movimiento.lote_trafico

-- DROP TABLE movimiento.lote_trafico;

-- Table: movimiento.lote_trafico

DROP TABLE IF EXISTS movimiento.lote_trafico CASCADE;

CREATE TABLE movimiento.lote_trafico
(
  ltrafcodsx SERIAL,
  ltraflote character varying NOT NULL,
  ltrafnumtrafico integer NOT NULL,
  ltrafelaboracion timestamp without time zone,
  ltrafvencimiento timestamp without time zone,
  ltrafproveedor character varying,
  ltrafproducto character varying,
  ltrafcodproducto integer,
  CONSTRAINT pk_lote_trafico PRIMARY KEY (ltrafcodsx),
  CONSTRAINT fk_lote_trafico FOREIGN KEY (ltrafnumtrafico)
      REFERENCES movimiento.trafico (trafcodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_lote_producto FOREIGN KEY (ltrafcodproducto)
      REFERENCES public.producto (procodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT uq_lote_trafico UNIQUE (ltraflote, ltrafnumtrafico)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE movimiento.lote_trafico
  OWNER TO postgres;

DROP TABLE IF EXISTS movimiento.lote_contenedor_trafico CASCADE;

CREATE TABLE movimiento.lote_contenedor_trafico
(
  lctrafcodsx SERIAL,
  lctrafcontenedor integer NOT NULL,
  lctraflote integer NOT NULL,
  lctrafcantidad numeric(10,2),
  CONSTRAINT pk_lote_cont_traf PRIMARY KEY (lctrafcodsx),
  CONSTRAINT fk_lct_contenedor FOREIGN KEY (lctrafcontenedor)
      REFERENCES movimiento.contenedor_trafico (ctrafcodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_lct_lote FOREIGN KEY (lctraflote)
      REFERENCES movimiento.lote_trafico (ltrafcodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT
)
WITH (
  OIDS=TRUE
);
ALTER TABLE movimiento.lote_contenedor_trafico
  OWNER TO postgres;