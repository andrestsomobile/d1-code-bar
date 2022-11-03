--  Creacion de tabla para regrsitro de tiempos de almacenamiento y reubicacion usando QR

-- Table: public.registro_almacenamiento

-- 
DROP TABLE public.registro_almacenamiento cascade;

CREATE TABLE public.registro_almacenamiento
(
  realcodsx serial NOT NULL,
  realaccion character varying NOT NULL,
  realfecha date NOT NULL DEFAULT now(),
  realempleado integer NOT NULL,
  realhoin time without time zone NOT NULL,
  realhofi time without time zone,
  realcantestibas integer DEFAULT 0,
  realestado character varying NOT NULL DEFAULT 'TRAMITE'::character varying,
  CONSTRAINT pk_realcodsx PRIMARY KEY (realcodsx),
  CONSTRAINT fk_realempleado FOREIGN KEY (realempleado)
      REFERENCES public.empleado (empcodsx) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.registro_almacenamiento
  OWNER TO postgres;

  -- Table: public.registro_almacenamiento_detalle

-- 
DROP TABLE public.registro_almacenamiento_detalle;

CREATE TABLE public.registro_almacenamiento_detalle
(
  radecodsx serial NOT NULL,
  raderegalm integer NOT NULL,
  radecodentrada integer,
  radecodreubicacion integer,
  radeestibas integer DEFAULT 0,
  radetiempo time without time zone NOT NULL,
  CONSTRAINT pk_radecodsx PRIMARY KEY (radecodsx),
  CONSTRAINT fk_radeentrada FOREIGN KEY (radecodentrada)
      REFERENCES movimiento.entrada (entcodsx) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_radereubicacion FOREIGN KEY (radecodreubicacion)
      REFERENCES movimiento.reubicacion (recodsx) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,      
  CONSTRAINT fk_raderegalm FOREIGN KEY (raderegalm)
      REFERENCES public.registro_almacenamiento (realcodsx) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.registro_almacenamiento_detalle
  OWNER TO postgres;

-- Trigger: actualiza_registro_almacenamiento on public.registro_almacenamiento_detalle

-- DROP TRIGGER actualiza_registro_almacenamiento ON public.registro_almacenamiento_detalle;
/*
CREATE TRIGGER actualiza_registro_almacenamiento
  AFTER UPDATE
  ON public.registro_almacenamiento_detalle
  FOR EACH ROW
  EXECUTE PROCEDURE public.actualiza_registro_almacenamiento();
*/
