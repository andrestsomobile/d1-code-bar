DROP TABLE public.config_bodega;
CREATE TABLE public.config_bodega
(
	cbbodega integer not null,
    cbestante character varying NOT NULL,
	cbnivel integer not null,
	cbposicion character varying NOT NULL,
	cbestado character varying NOT NULL,
	cbentrada integer,
    CONSTRAINT pk_conf_bod PRIMARY KEY (cbbodega,cbestante,cbnivel,cbposicion)

)
WITH (
    OIDS = TRUE
)
TABLESPACE pg_default;

ALTER TABLE public.config_bodega
    OWNER to postgres;
COMMENT ON TABLE public.config_bodega
    IS 'Guarda las posiciones de una bodega';
