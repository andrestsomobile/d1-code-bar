-- DROP FUNCTION llenar_config_bodega(_cbbodega integer,_cbestante character varying,_niveles integer,_posiciones integer)

CREATE OR REPLACE FUNCTION llenar_config_bodega(
	_cbbodega integer,
	_cbestante character varying,
	_niveles integer,	
	_posiciones integer)
  RETURNS void AS
$BODY$--
DECLARE

_cbposicion character varying;
_cbestado character varying;
i integer;
j integer;

BEGIN
  _cbestado = 'AC';
  i := 1;
  j := 1;
  DELETE FROM config_bodega WHERE cbbodega = _cbbodega and cbestante = _cbestante;
  WHILE i <= _niveles LOOP
    WHILE j <= _posiciones LOOP
      _cbposicion = TO_CHAR(j,'FM00') || '-' || i;
      INSERT INTO public.config_bodega(cbbodega, cbestante, cbnivel, cbposicion, cbestado)
	     VALUES (_cbbodega, _cbestante, i, _cbposicion, _cbestado);
      j := j + 1;
    END LOOP; 
    i := i + 1;
    j := 1;
  END LOOP; 
END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

-- Configura Posiciones de Bodega 1

select * from llenar_config_bodega(1,'A',6,50);
select * from llenar_config_bodega(1,'B',6,50);
select * from llenar_config_bodega(1,'C',7,50);
select * from llenar_config_bodega(1,'D',7,50);
select * from llenar_config_bodega(1,'E',6,50);
select * from llenar_config_bodega(1,'F',6,50);
select * from llenar_config_bodega(1,'G',6,58);
select * from llenar_config_bodega(1,'H',6,58);
select * from llenar_config_bodega(1,'I',7,58);
select * from llenar_config_bodega(1,'J',7,58);
select * from llenar_config_bodega(1,'K',6,58);
select * from llenar_config_bodega(1,'L',6,58);
select * from llenar_config_bodega(1,'M',6,58);
select * from llenar_config_bodega(1,'N',6,58);
select * from llenar_config_bodega(1,'O',7,58);
select * from llenar_config_bodega(1,'P',7,58);
select * from llenar_config_bodega(1,'Q',6,58);
select * from llenar_config_bodega(1,'R',6,58);
select * from llenar_config_bodega(1,'S',6,52);
select * from llenar_config_bodega(1,'T',7,52);
select * from llenar_config_bodega(1,'U',7,52);
select * from llenar_config_bodega(1,'V',7,52);
select * from llenar_config_bodega(1,'W',7,52);
select * from llenar_config_bodega(1,'X',7,52);
select * from llenar_config_bodega(1,'Y',7,52);
select * from llenar_config_bodega(1,'Z',6,52);


/*
select * from config_bodega  ORDER BY cbestante,cbnivel,cbposicion
--; where cbbodega = 1 and cbestante = 'B'

-- select * from config_bodega

SELECT * FROM bodega order by 1

insert into bodega values (1,'BI','BODEGA IMPORTADOS','','')

update entrada set entbodega = 1
update referencia_pedido set refpbodega = 1

select * from entrada

delete from bodega where bodcodsx > 1
*/