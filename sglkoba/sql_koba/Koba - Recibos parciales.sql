--- Recibos Parciales

-- se crea marca para saber si el lote-vehiculo ya se agrego al trafico
--ALTER TABLE movimiento.lote_contenedor_trafico drop COLUMN lctrafingreso ;

ALTER TABLE movimiento.lote_contenedor_trafico ADD COLUMN lctrafingreso character varying (1) DEFAULT 'N';

UPDATE lote_contenedor_trafico set lctrafingreso = 'S';


CREATE TABLE movimiento.lctraf_entrada
(
  lctecodsx serial not null,
  lctecodlotecontenedor integer NOT NULL,
  lctecodentrada integer NOT NULL,
  CONSTRAINT pk_lcte PRIMARY KEY (lctecodsx),
  CONSTRAINT fk_lcte_lctraf FOREIGN KEY (lctecodlotecontenedor)
      REFERENCES movimiento.lote_contenedor_trafico (lctrafcodsx) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_lcte_entrada FOREIGN KEY (lctecodentrada)
      REFERENCES movimiento.entrada (entcodsx) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=TRUE
);

select * from ingreso where ingestado ='TRAMITE'

select * from lote_contenedor_trafico order by 1 desc limit 100

update lote_contenedor_trafico set lctrafingreso = 'N' where lctrafcodsx = 440

select * from entrada where entcodingreso = 33

delete  from entrada where entcodingreso = 33

select * from lctraf_entrada
