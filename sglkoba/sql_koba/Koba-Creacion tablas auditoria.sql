-- Koba: crea tabla para auditoria para porceso de pedidos, iingresos y despachos (nacionalizacioones ya esta)

CREATE TABLE movimiento.auditoriapedido
(
    aupedcodsx serial,
    aupedaccion character varying COLLATE pg_catalog."default",
    aupedfecha timestamp without time zone,
    aupedusuario integer,
    aupedpedcodsx integer,
    aupedantes text COLLATE pg_catalog."default",
    aupeddespues text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;



CREATE TABLE movimiento.auditoriaingreso
(
    auingcodsx serial,
    auingaccion character varying COLLATE pg_catalog."default",
    auingfecha timestamp without time zone,
    auingusuario integer,
    auingpedcodsx integer,
    auingantes text COLLATE pg_catalog."default",
    auingdespues text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;



CREATE TABLE movimiento.auditoriadespacho
(
    audescodsx serial,
    audesaccion character varying COLLATE pg_catalog."default",
    audesfecha timestamp without time zone,
    audesusuario integer,
    audespedcodsx integer,
    audesantes text COLLATE pg_catalog."default",
    audesdespues text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;
