-- FUNCTION: movimiento.obtiene_posicion_libre(integer, integer, integer, numeric)

-- DROP FUNCTION movimiento.obtiene_posicion_libre(integer, integer, integer, numeric);


CREATE OR REPLACE FUNCTION movimiento.obtiene_posicion_libre(
	_bodega integer,
	_entrada integer,
	_producto integer,
	_entcantidad numeric)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
--
DECLARE 
  _posicion character varying;
  rec_pro RECORD;
  rec_conf_bodega RECORD;
  _primer_estante character varying;
BEGIN
 raise notice '_bodega %,_entrada %,_producto %, _entcantidad %)',_bodega ,_entrada ,_producto , _entcantidad;
 SELECT * INTO rec_pro FROM producto WHERE procodsx = _producto;
  /*
  IF rec_pro.procatoster IS NULL THEN
    _primer_estante = 'D';
  ELSE
    SELECT catodescripcion INTO _primer_estante FROM categoria_oster WHERE catocodsx = rec_pro.procatoster;
    IF NOT FOUND THEN
      _primer_estante = 'D';
    END IF;
  END IF;
*/
  /*
  IF _entcantidad < rec_pro.prounimasterpac THEN -- si la estiba no esta completa se va para estante P en adelante   
    _primer_estante = 'P';
  END IF;
  */  
  SELECT *, cbestante||cbposicion as valor_posicion INTO rec_conf_bodega FROM config_bodega 
	 WHERE cbbodega = _bodega 
	 AND cbestado = 'AC' 
	 AND cbentrada IS NULL
	 AND cbproducto = rec_pro.promodelo
	 --AND cbestante >= _primer_estante
	 order by 
	 cbestante asc
	 , left(cbposicion,-3) asc
	 , cbnivel asc LIMIT 1;

	  
  IF rec_conf_bodega.valor_posicion IS NOT NULL  THEN
    raise notice 'nueva pos %', rec_conf_bodega.valor_posicion;
    UPDATE config_bodega set cbentrada = _entrada 
      WHERE cbbodega = rec_conf_bodega.cbbodega
      AND cbestante = rec_conf_bodega.cbestante
      AND cbnivel = rec_conf_bodega.cbnivel
      AND cbposicion = rec_conf_bodega.cbposicion
      AND cbestado = rec_conf_bodega.cbestado
      AND cbproducto = rec_pro.promodelo;
      --AND cbcategoria = rec_pro.procategoria;
    _posicion = rec_conf_bodega.valor_posicion;
  ELSE
    _posicion = 'BGPISO';--||_entrada;   
  END IF;
  RETURN _posicion;
END;
$BODY$;

ALTER FUNCTION movimiento.obtiene_posicion_libre(integer, integer, integer, numeric)
    OWNER TO postgres;