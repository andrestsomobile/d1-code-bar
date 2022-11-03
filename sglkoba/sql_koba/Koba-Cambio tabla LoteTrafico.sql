
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

insert into lote_contenedor_trafico (lctrafcontenedor, lctraflote, lctrafcantidad) 
select ltrafcontenedor, ltrafcodsx, ltrafcantproducto from lote_trafico


ALTER TABLE movimiento.lote_trafico DROP COLUMN ltrafcontenedor;
ALTER TABLE movimiento.lote_trafico DROP COLUMN ltrafcantproducto;


ALTER TABLE movimiento.lote_trafico
  ADD CONSTRAINT fk_lote_producto FOREIGN KEY (ltrafcodproducto)
      REFERENCES public.producto (procodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT;

      
ALTER TABLE movimiento.lote_trafico DROP CONSTRAINT uq_lote_trafico;


ALTER TABLE movimiento.lote_trafico
  ADD CONSTRAINT uq_lote_trafico UNIQUE(ltraflote, ltrafnumtrafico);



