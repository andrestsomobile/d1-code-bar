-- Table: movimiento.inspeccion_recibo

-- DROP TABLE movimiento.inspeccion_recibo;

CREATE TABLE movimiento.inspeccion_recibo
(
inretrafico integer,
inrelctrafico integer,
inremuelle text,
inreprecinto text,
inrevencimiento date,
inrelote text,
inreestibas numeric,
inrecajas numeric,
inresaldo numeric,
inrenovedades text,
inrerecuperadas numeric,
inretotalump numeric,
inreesibasrequeridas numeric,
inrepesoestibavacia numeric,
inrepesototalestibasvacias numeric,
inrepesoestibapaletizada numeric,
inrepesoporump numeric,
inrepesonetoproducto numeric,
inreobservaciones text,
inrearlvigente_cal text,
inrearlvigente_obs text,
inrecarnet_cal text,
inrecarnet_obs text,
inreproteccion_cal text,
inreproteccion_obs text,
inrefumigacion_cal text,
inrefumigacion_obs text,
inremanipulacion_cal text,
inremanipulacion_obs text,
inreaseovehiculo_cal text,
inreaseovehiculo_obs text,
inresustanciasquimicas_cal text,
inresustanciasquimicas_obs text,
inretemperatura_cal text,
inretemperatura_obs text,
inreestadogeneral_cal text,
inreestadogeneral_obs text,
inrerevisiones_cal text,
inrerevisiones_obs text,
inreumprecibidas_cal text,
inreumprecibidas_obs text,
inreumprevisadas_cal text,
inreumprevisadas_obs text,
inretablanutricional_cal text,
inretablanutricional_obs text,
inreimportacioncinc_cal text,
inreimportacioncinc_obs text,
inrecalificacion_cal text,
inrecalificacion_obs text,
inrerecibido text,
inreconductor text,
inrefechagenerado timestamp without time zone,

  CONSTRAINT pk_inspeccion_recibo PRIMARY KEY (inretrafico,inrelctrafico),
  CONSTRAINT ir_trafico FOREIGN KEY (inretrafico)
      REFERENCES movimiento.trafico (trafcodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT lote_contenedor_trafico FOREIGN KEY (inrelctrafico)
      REFERENCES movimiento.lote_contenedor_trafico (lctrafcodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT

)
WITH (
  OIDS=FALSE
);
ALTER TABLE movimiento.inspeccion_recibo
  OWNER TO postgres;
COMMENT ON TABLE movimiento.inspeccion_recibo
  IS 'Tabla que contiene la informacion de inspeccion de recibos mercancia para generar PDF.';

