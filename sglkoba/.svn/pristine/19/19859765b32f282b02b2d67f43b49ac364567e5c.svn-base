CREATE TABLE movimiento.lote_trafico
(
    ltrafcodsx serial,
    ltraflote character varying COLLATE pg_catalog."default" NOT NULL,
	ltrafnumtrafico integer NOT NULL,
    ltrafelaboracion timestamp without time zone,
	ltrafvencimiento timestamp without time zone,
    CONSTRAINT pk_lote_trafico PRIMARY KEY (ltrafcodsx),
    CONSTRAINT uq_lote_trafico UNIQUE (ltraflote, ltrafnumtrafico),
    CONSTRAINT "fk_lote_trafico" FOREIGN KEY (ltrafnumtrafico)
        REFERENCES movimiento.trafico (trafcodsx) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
)


-- Column: movimiento.entrada.entlote

-- ALTER TABLE movimiento.entrada DROP COLUMN entlote;

ALTER TABLE movimiento.entrada
    ADD COLUMN entlote integer 