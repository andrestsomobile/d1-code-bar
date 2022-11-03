DROP FUNCTION IF EXISTS movimiento.posicion_ruta_logica(bodega integer, posicion character varying );

DROP TYPE IF EXISTS posrutalogica;

CREATE TYPE posrutalogica AS  (
    posicionreal character varying,
    bodega integer,
    estante character varying,
    posicion character varying,
    nivel integer,
    frente_pos character varying
);


CREATE OR REPLACE FUNCTION movimiento.posicion_ruta_logica(bodega integer, posicion character varying )
    RETURNS posrutalogica
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    --ROWS 1000
AS $BODY$
-- La ruta lógica de alistamiento por posición es:
-- Bodega: 1 a 2 asc
-- Estante: Z a A desc
-- Nivel: 7 a 1 desc
-- Posición: 99 a 01 desc
-- Frente/Posterior: F a P asc
-- Ya no se tiene en cuenta el FEFO
DECLARE  
	_prl posrutalogica;

BEGIN

	SELECT posicion as posicionreal
		, bodega
		, case when substring(posicion from '.$') ~ E'^\\d+$' then substring(posicion from 1 for 1) else null end as estante
		, left(right(posicion,-1),2) as posicion
		, case when substring(posicion from '.$') ~ E'^\\d+$' then substring(posicion from '.$')::integer  else 0 end as nivel
		, case when left(right(posicion,-3),1) in ('F','P') then left(right(posicion,-3),1) else null end as frente_pos
	INTO _prl; 
 

RETURN _prl;

END;$BODY$;

