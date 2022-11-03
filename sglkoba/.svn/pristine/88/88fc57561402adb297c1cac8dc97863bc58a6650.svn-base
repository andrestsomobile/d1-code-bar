--- Koba crea tablas para manejo de locaiones Renta, averias, no conforme, etc segun inventario recibido del usuario

-- Table: public.locacion

-- 
DROP TABLE movimiento.entrada_locacion;
DROP TABLE public.locacion;

CREATE TABLE public.locacion
(
  loccodsx serial,
  locdesc character varying(500),
  CONSTRAINT pkloc PRIMARY KEY (loccodsx)
)
WITH (
  OIDS=FALSE
);


-- Table: movimiento.entrada_locacion

-- DROP TABLE movimiento.entrada_locacion;

CREATE TABLE movimiento.entrada_locacion
(
  elcodsx serial,
  elcodentrada integer NOT NULL,
  elcodlocacionorigen integer NOT NULL,
  elcodlocaciondestino integer NOT NULL,
  elcantidadnac numeric(15,2) NOT NULL DEFAULT 0.00,
  elsaldonac numeric(15,2) NOT NULL DEFAULT 0.00,
  elcantidadsnac numeric(15,2) NOT NULL DEFAULT 0.00,
  elsaldosnac numeric(15,2) NOT NULL DEFAULT 0.00,
  elfecha timestamp without time zone NOT NULL,
  elpersona integer NOT NULL,
  resumen text,
  CONSTRAINT pkentloc PRIMARY KEY (elcodsx),
  CONSTRAINT fk_entloc_entrada FOREIGN KEY (elcodentrada)
      REFERENCES movimiento.entrada (entcodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_entloc_loc_ori FOREIGN KEY (elcodlocacionorigen)
      REFERENCES public.locacion (loccodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_entloc_loc_des FOREIGN KEY (elcodlocaciondestino)
      REFERENCES public.locacion (loccodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT
)
WITH (
  OIDS=FALSE
);



insert into locacion values 
(default,'PRINCIPAL'),
(default,'RENTAS'),
(default,'AVERIA'),
(default,'NO CONFORME'),
(default,'VENCIDOS');