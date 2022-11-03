
CREATE OR REPLACE FUNCTION movimiento.obtiene_rotulo_estiba(_ingreso integer,_entrada integer,_producto integer) 
  RETURNS character varying AS
$BODY$--
DECLARE 
  _posicion character varying;
  rec_pro RECORD;
  rec_conf_bodega RECORD;
  _primer_estante character varying;
  _num integer;
  _tot integer;
BEGIN

select fila into _num from (
select row_number() over (partition by entcodingreso order by entposicion) as fila,entcodingreso,entcodsx,entposicion 
from entrada 
where entcodingreso = _ingreso
and entcodproducto = _producto
) as s1 where entcodsx = _entrada;

select count(1) into _tot from entrada 
where entcodingreso = _ingreso
and entcodproducto = _producto;

return _num || ' de ' || _tot;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;




--DROP  FUNCTION obtiene_posicion_libre(_bodega integer,_entrada integer,_producto integer) 

CREATE OR REPLACE FUNCTION movimiento.obtiene_posicion_libre(_bodega integer,_entrada integer,_producto integer) 
  RETURNS character varying AS
$BODY$--
DECLARE 
  _posicion character varying;
  rec_pro RECORD;
  rec_conf_bodega RECORD;
  _primer_estante character varying;
BEGIN
  SELECT * INTO rec_pro FROM producto WHERE procodsx = _producto;
  IF rec_pro.procatoster IS NULL THEN
    _primer_estante = 'D';
  ELSE
    SELECT catodescripcion INTO _primer_estante FROM categoria_oster WHERE catocodsx = rec_pro.procatoster;
    IF NOT FOUND THEN
      _primer_estante = 'D';
    END IF;
  END IF;
  SELECT *, cbestante||cbposicion as valor_posicion INTO rec_conf_bodega FROM config_bodega 
	 WHERE cbbodega = _bodega 
	 AND cbestado = 'AC' 
	 AND cbentrada IS NULL
	 AND cbcategoria = rec_pro.procategoria
	 AND cbestante >= _primer_estante
	 ORDER BY cbestante,cbnivel,cbposicion LIMIT 1;
  IF FOUND THEN
    UPDATE config_bodega set cbentrada = _entrada 
      WHERE cbbodega = rec_conf_bodega.cbbodega
      AND cbestante = rec_conf_bodega.cbestante
      AND cbnivel = rec_conf_bodega.cbnivel
      AND cbposicion = rec_conf_bodega.cbposicion
      AND cbestado = rec_conf_bodega.cbestado
      AND cbcategoria = rec_pro.procategoria;
    _posicion = rec_conf_bodega.valor_posicion;
  ELSE
    _posicion = 'UNICA'||_entrada;   
  END IF;
  RETURN _posicion;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE;


--Function: 
/*
DROP FUNCTION movimiento.entrada_x_estiba(_saldorest numeric(15,2), _entcodingreso integer, _entcodproducto integer, _entbodega integer, _entposicion character varying,
_entcantidad numeric(15,2), _entpesoneto numeric(15,2), _entpesonetototal numeric(15,2), _entpesobruto numeric(15,2),
_entpesobrutototal numeric(15,2), _entsaldopesoneto numeric(15,2), _entsaldopesobruto numeric(15,2), _entsaldonac numeric(15,2),
_entsaldosinnac numeric(15,2), _entvalor numeric(15,2), _entvalortotal numeric(15,2), _entsaldonacf numeric(15,2), 
_entsaldosinnacf numeric(15,2), _entunidad character varying(3), _entlote integer);
*/
CREATE OR REPLACE FUNCTION movimiento.entrada_x_estiba(_saldorest numeric(15,2), _entcodingreso integer, _entcodproducto integer, _entbodega integer, _entposicion character varying,
_entcantidad numeric(15,2), _entpesoneto numeric(15,2), _entpesonetototal numeric(15,2), _entpesobruto numeric(15,2),
_entpesobrutototal numeric(15,2), _entsaldopesoneto numeric(15,2), _entsaldopesobruto numeric(15,2), _entsaldonac numeric(15,2),
_entsaldosinnac numeric(15,2), _entvalor numeric(15,2), _entvalortotal numeric(15,2), _entsaldonacf numeric(15,2), 
_entsaldosinnacf numeric(15,2), _entunidad character varying(3), _entlote integer)
 RETURNS int AS

$BODY$--
DECLARE
  _prounimasterpac numeric;
  _posicion character varying;
  _nueva_entrada integer;
  vlr integer;
BEGIN
    vlr = 0;
    SELECT prounimasterpac INTO _prounimasterpac FROM producto WHERE procodsx = _entcodproducto;
    IF _saldorest > _prounimasterpac THEN
      INSERT INTO entrada (entcodsx,entcodingreso,entcodproducto,entbodega, entposicion,entcantidad,
          entpesoneto,entpesonetototal,  entpesobruto, entpesobrutototal, entsaldopesoneto,
          entsaldopesobruto,entsaldonac,entsaldosinnac, entvalor, entvalortotal, entfecha, entsaldonacf, entsaldosinnacf, entunidad, entlote) VALUES (
	  DEFAULT,_entcodingreso, _entcodproducto, _entbodega, '', _prounimasterpac, 
	  _entpesoneto, _prounimasterpac*_entpesoneto, _entpesobruto, -_prounimasterpac*_entpesobruto, 0, 
	  0, 0, 0, _entvalor, _prounimasterpac*_entvalor, 
	  now(), 0, 0, _entunidad, _entlote) RETURNING entcodsx INTO _nueva_entrada;
	
       _posicion = movimiento.obtiene_posicion_libre(_entbodega,_nueva_entrada,_entcodproducto);
       UPDATE entrada SET entposicion = _posicion WHERE entcodsx = _nueva_entrada;
      
       SELECT * INTO vlr FROM  movimiento.entrada_x_estiba(_saldorest-_prounimasterpac,
	_entcodingreso, _entcodproducto, _entbodega, '', _entcantidad-_prounimasterpac, 
	_entpesoneto, (_entcantidad-_prounimasterpac)*_entpesoneto, _entpesobruto, (_entcantidad-_prounimasterpac)*_entpesobruto, 0, 
	0, 0, 0, _entvalor, (_entcantidad-_prounimasterpac)*_entvalor, 
	0, 0, _entunidad, _entlote);
      

    ELSE

      INSERT INTO entrada (entcodsx,entcodingreso,entcodproducto,entbodega, entposicion,entcantidad,entpesoneto,entpesonetototal, 
	  entpesobruto, entpesobrutototal, entsaldopesoneto,entsaldopesobruto,entsaldonac,
	  entsaldosinnac, entvalor, entvalortotal, entsaldonacf, entsaldosinnacf, entunidad, entlote) VALUES (
	  DEFAULT, _entcodingreso, _entcodproducto, _entbodega, '', _entcantidad, 
	  _entpesoneto, _entpesonetototal, 
	  _entpesobruto, _entpesobrutototal, _entsaldopesoneto,_entsaldopesobruto,_entsaldonac,
	  _entsaldosinnac, _entvalor, _entvalortotal, _entsaldonacf, _entsaldosinnacf, _entunidad, _entlote) RETURNING entcodsx INTO _nueva_entrada;

      _posicion = movimiento.obtiene_posicion_libre(_entbodega,_nueva_entrada,_entcodproducto);
      UPDATE entrada SET entposicion = _posicion WHERE entcodsx = _nueva_entrada;        		  
    END IF;
RETURN vlr;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
			

-- Function: movimiento.tg_gstposicion_entrada()

-- 
--DROP FUNCTION movimiento.tg_gstposicion_entrada();

CREATE OR REPLACE FUNCTION movimiento.tg_gstposicion_entrada()
  RETURNS trigger AS
$BODY$--
DECLARE
  _prounimasterpac numeric;
  _posicion character varying;
BEGIN

  IF TG_OP='INSERT' THEN
  /*
    SELECT prounimasterpac INTO _prounimasterpac FROM producto WHERE procodsx = NEW.entcodproducto;
    IF NEW.entcantidad > _prounimasterpac THEN

      INSERT INTO movimiento.entrada(
	entcodingreso, entcodproducto, entbodega, entposicion, entcantidad, 
	entpesoneto, entpesonetototal, entpesobruto, entpesobrutototal, entsaldopesoneto, 
	entsaldopesobruto, entsaldonac, entsaldosinnac, entvalor, entvalortotal,  
	entfecha, entsaldonacf, entsaldosinnacf, entunidad, entlote)
	VALUES (NEW.entcodingreso, NEW.entcodproducto, NEW.entbodega, '', NEW.entcantidad-_prounimasterpac, 
	NEW.entpesoneto, (NEW.entcantidad-_prounimasterpac)*NEW.entpesoneto, NEW.entpesobruto, (NEW.entcantidad-_prounimasterpac)*NEW.entpesobruto, 0, 
	0, 0, 0, NEW.entvalor, (NEW.entcantidad-_prounimasterpac)*NEW.entvalor, 
	NEW.entfecha, 0, 0, NEW.entunidad, NEW.entlote);

      NEW.entposicion = movimiento.obtiene_posicion_libre(NEW.entbodega,NEW.entcodsx,NEW.entcodproducto);
      NEW.entcantidad = _prounimasterpac;
      NEW.entpesonetototal = NEW.entpesoneto*_prounimasterpac;
      NEW.entpesobrutototal = NEW.entpesobruto*_prounimasterpac;
      NEW.entvalortotal = NEW.entvalor*_prounimasterpac;

    ELSE
      NEW.entposicion = movimiento.obtiene_posicion_libre(NEW.entbodega,NEW.entcodsx,NEW.entcodproducto);

    END IF;

    RETURN NEW;
*/
  ELSIF TG_OP='UPDATE' THEN
  
    IF (NEW.entsaldonacf + NEW.entsaldosinnacf) = 0 THEN
    
      UPDATE config_bodega set cbentrada = NULL 
        WHERE cbentrada = NEW.entcodsx;
      RETURN NEW;
      
    END IF;
    RETURN NEW;
    
  ELSIF TG_OP='DELETE' THEN
  
    UPDATE config_bodega set cbentrada = NULL 
      WHERE cbentrada = OLD.entcodsx;
    RETURN OLD;

  ELSE
  
    RETURN NEW;
    
  END IF;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

--DROP TRIGGER tg_gstposicion_entrada_ins ON movimiento.entrada;
/*
CREATE TRIGGER tg_gstposicion_entrada_ins
    BEFORE INSERT 
    ON movimiento.entrada
    FOR EACH ROW
    EXECUTE PROCEDURE movimiento.tg_gstposicion_entrada();
    */
DROP TRIGGER tg_gstposicion_entrada_upd ON movimiento.entrada;

CREATE TRIGGER tg_gstposicion_entrada_upd
    AFTER UPDATE
    ON movimiento.entrada
    FOR EACH ROW
    EXECUTE PROCEDURE movimiento.tg_gstposicion_entrada();
    
DROP TRIGGER tg_gstposicion_entrada_del ON movimiento.entrada;

CREATE TRIGGER tg_gstposicion_entrada_del
    AFTER DELETE
    ON movimiento.entrada
    FOR EACH ROW
    EXECUTE PROCEDURE movimiento.tg_gstposicion_entrada();
    