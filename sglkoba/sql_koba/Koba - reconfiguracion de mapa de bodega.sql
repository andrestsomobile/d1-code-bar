﻿--CREATE EXTENSION tablefunc;

/*

SELECT split_part(estante,'-',1) AS estante, split_part(estante,'-',2) AS nivel,*
FROM crosstab_mapa(
  'select (cbestante||'-'||cbnivel)::text, cbposicion::text from config_bodega order by cbestante,cbnivel,cbposicion');

--*/
CREATE EXTENSION IF NOT EXISTS tablefunc;

DROP FUNCTION if exists crosstab_mapa;

 CREATE OR REPLACE FUNCTION crosstab_mapa(
	IN text,
	OUT estante text,
	OUT posicion_01 text,
	OUT posicion_02 text,
	OUT posicion_03 text,
	OUT posicion_04 text,
	OUT posicion_05 text,
	OUT posicion_06 text,
	OUT posicion_07 text,
	OUT posicion_08 text,
	OUT posicion_09 text,
	OUT posicion_10 text,
	OUT posicion_11 text,
	OUT posicion_12 text,
	OUT posicion_13 text,
	OUT posicion_14 text,
	OUT posicion_15 text,
	OUT posicion_16 text,
	OUT posicion_17 text,
	OUT posicion_18 text,
	OUT posicion_19 text,
	OUT posicion_20 text,
	OUT posicion_21 text,
	OUT posicion_22 text,
	OUT posicion_23 text,
	OUT posicion_24 text,
	OUT posicion_25 text,
	OUT posicion_26 text,
	OUT posicion_27 text,
	OUT posicion_28 text,
	OUT posicion_29 text,
	OUT posicion_30 text,
	OUT posicion_31 text,
	OUT posicion_32 text,
	OUT posicion_33 text,
	OUT posicion_34 text,
	OUT posicion_35 text,
	OUT posicion_36 text,
	OUT posicion_37 text,
	OUT posicion_38 text,
	OUT posicion_39 text,
	OUT posicion_40 text,
	OUT posicion_41 text,
	OUT posicion_42 text,
	OUT posicion_43 text,
	OUT posicion_44 text,
	OUT posicion_45 text,
	OUT posicion_46 text,
	OUT posicion_47 text,
	OUT posicion_48 text,
	OUT posicion_49 text,
	OUT posicion_50 text,
	OUT posicion_51 text,
	OUT posicion_52 text,
	OUT posicion_53 text,
	OUT posicion_54 text,
	OUT posicion_55 text,
	OUT posicion_56 text,
	OUT posicion_57 text,
	OUT posicion_58 text
)
  RETURNS setof record
  AS '$libdir/tablefunc','crosstab' LANGUAGE C STABLE STRICT;    


SELECT substring(estante,1,1)::text as estanteria, substring(estante,3,1)::int as nivel,*
FROM crosstab_mapa('select cbestante||''-''||cbnivel, cbnivel::text,case when cbestado=''AC'' then cbposicion else ''XX-X'' end::text from config_bodega where cbnivel = substring(cbposicion,4,1)::int order by cbestante,cbnivel,cbposicion');

/*--

--SELECT cbbodega,cbestante,cbnivel, string_agg((cbposicion||cbestado)::text,'|' order by cbposicion) as cbposicion

SELECT cbbodega,cbestante,cbnivel, array_agg(case when cbestado='AC' then cbposicion else 'XX-X' end::text order by cbposicion) as cbposicion
FROM config_bodega 
GROUP BY cbbodega,cbestante,cbnivel
ORDER BY cbbodega,cbestante desc ,cbnivel,cbposicion;


CREATE TABLE ct(id SERIAL, rowid TEXT, attribute TEXT, value TEXT);
INSERT INTO ct(rowid, attribute, value) VALUES('test1','att1','val1');
INSERT INTO ct(rowid, attribute, value) VALUES('test1','att2','val2');
INSERT INTO ct(rowid, attribute, value) VALUES('test1','att3','val3');
INSERT INTO ct(rowid, attribute, value) VALUES('test1','att4','val4');
INSERT INTO ct(rowid, attribute, value) VALUES('test2','att1','val5');
INSERT INTO ct(rowid, attribute, value) VALUES('test2','att2','val6');
INSERT INTO ct(rowid, attribute, value) VALUES('test2','att3','val7');
INSERT INTO ct(rowid, attribute, value) VALUES('test2','att4','val8');

SELECT *
FROM crosstab(
  'select rowid, attribute, value
   from ct
   where attribute = ''att2'' or attribute = ''att3''
   order by 1,2')
AS ct(row_name text, category_1 text, category_2 text, category_3 text);

select * from ct

SELECT *
FROM crosstab(
  'select rowid, attribute, value
   from ct
   
   order by 1,2')
AS ct(row_name text, category_1 text, category_2 text, category_3 text);


SELECT *
FROM crosstab4(
  'select rowid, attribute, value
   from ct
   order by 1,2');

   
*/