--DROP TABLE movimiento.auditoriacarguepedido;

CREATE TABLE movimiento.auditoriacarguepedido
(
  aucpcodsx serial NOT NULL ,
  aucpfecha timestamp without time zone,
  aucpusuario bigint,
  aucparchivo character varying,
  aucpnumpedido character varying,
  aucppromodelo character varying,
  aucpdescripcion character varying,
  aucpcantidad integer,
  aucpestado character varying,
  aucpcomentario character varying  
)
WITH (
  OIDS=FALSE
);
ALTER TABLE movimiento.auditoriacarguepedido
  OWNER TO postgres;



  SELECT * FROM auditoriacarguepedido