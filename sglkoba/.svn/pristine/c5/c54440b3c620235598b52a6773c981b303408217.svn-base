/*

SELECT 
entcodsx
,promodelo
,regexp_replace(prodescripcion, E'[\\n\\r]+', ' ', 'g' ) as prodescripcion
,entbodega
,entposicion
,case when trafnumdta is not null then trafnumdta else 'SIN DEFINIR' end as trafnumdta
,case when ltraflote is not null then ltraflote else 'SIN DEFINIR' end as ltraflote
,case when ltrafvencimiento is not null then to_char(ltrafvencimiento,'yyyy-mm-dd') else 'SIN DEFINIR' end as ltrafvencimiento
,entcantidad
,proump
,entsaldonac
,entsaldosinnac
FROM entrada
inner join producto on procodsx = entcodproducto
inner join lote_trafico on ltrafcodsx = entlote
inner join trafico on trafcodsx = ltrafnumtrafico 
where ( (entsaldonac > 0 and entsaldonac = prounimasterpac) or (entsaldosinnac > 0 and entsaldosinnac = prounimasterpac) )
order by entposicion
--LIMIT 50



SELECT entcodsx ||';'||
promodelo ||';'||
prodescripcion ||';'||
entposicion ||';'||
case when trafnumdta is not null then trafnumdta else 'SIN DEFINIR' end ||';'||
case when ltraflote is not null then ltraflote else 'SIN DEFINIR' end ||';'||
case when ltrafvencimiento is not null then to_char(ltrafvencimiento,'yyyy-mm-dd') else 'SIN DEFINIR' end ||';'||
entcantidad ||';'||
proump ||';'||
entsaldonac ||';'||
entsaldosinnac

	as cadena
	FROM entrada
	inner join producto on procodsx = entcodproducto
	inner join lote_trafico on ltrafcodsx = entlote
	inner join trafico on trafcodsx = ltrafnumtrafico 
	where ( (entsaldonac > 0 and entsaldonac = prounimasterpac) or (entsaldosinnac > 0 and entsaldosinnac = prounimasterpac) )
	order by entposicion 
	

C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\sglkoba\movil_off

copy (select * from movimiento.movil_inventario1() limit 5) to 'C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\sglkoba\movil_off\movil_inventario.jsp';

copy (select * from movimiento.movil_inventario() limit 5) to 'C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/sglkoba/movil_off/movil_inventario.json';
copy (select * from movimiento.movil_reubicacion() limit 5) to 'C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/sglkoba/movil_off/movil_reubicacion.json';
copy (select * from movimiento.movil_descargas()) to 'C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/sglkoba/movil_off/movil_descargas.json';

copy (select * from movimiento.movil_inventario1()) to '/usr/local/tomcat/webapps/sglkoba/movil_off/movil_inventario.jsp';

copy (select * from movimiento.movil_inventario()) to '/usr/local/tomcat/webapps/sglkoba/movil_off/movil_inventario.json';
copy (select * from movimiento.movil_reubicacion()) to '/usr/local/tomcat/webapps/sglkoba/movil_off/movil_reubicacion.json';
copy (select * from movimiento.movil_descargas()) to '/usr/local/tomcat/webapps/sglkoba/movil_off/movil_descargas.json';

*/
CREATE OR REPLACE FUNCTION movimiento.movil_descargas()
  RETURNS text AS
$BODY$
DECLARE
rec record;
texto TEXT;
periodo integer;
BEGIN
texto = '{"data": [';

FOR rec IN

	SELECT '[' || '"' || 'APK KOBA Movil'  || '",' || '"' || current_date || '",' || '"' || 'app-debug.apk' || '"' || '],' as cadena 
	/*UNION
	SELECT '[' || '"' || 'Inventario para Cambios de Posici&oacute;n (Offline)'  || '",' || '"' || current_date || '",' || '"' || 'movil_inventario.json' || '"' || '],' as cadena 
	UNION
	SELECT '[' || '"' || 'Inventario para Reubicaci&oacute;n (Offline)'  || '",' || '"' || current_date || '",' || '"' || 'movil_reubicacion.json' || '"' || '],' as cadena
	*/
LOOP
	texto  = texto || rec.cadena;
END LOOP;
SELECT trim(trailing ',' from texto) INTO texto;
texto = texto || ']}';
RETURN texto;
END;$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION movimiento.movil_descargas()
  OWNER TO postgres;

--------------------------------------------------------------------------------------------------------------------
 
CREATE OR REPLACE FUNCTION movimiento.movil_inventario1()
  RETURNS text AS
$BODY$
DECLARE
rec record;
texto TEXT;
periodo integer;
BEGIN
texto = ''; --'{"data": [';
FOR rec IN

	SELECT '<tr>' ||
	'<td>' || entcodsx  || '</td>' ||
	'<td>' || promodelo || '</td>' ||
	'<td>' || prodescripcion || '</td>' ||
	'<td>' || entposicion || '</td>' ||
	'<td>' || case when trafnumdta is not null then trafnumdta else 'SIN DEFINIR' end || '</td>' ||
	'<td>' || case when ltraflote is not null then ltraflote else 'SIN DEFINIR' end  || '</td>' ||
	'<td>' || case when ltrafvencimiento is not null then to_char(ltrafvencimiento,'yyyy-mm-dd') else 'SIN DEFINIR' end  || '</td>' ||
	'<td>' || entcantidad || '</td>' ||
	'<td>' || proump || '</td>' ||
	'<td>' || entsaldonac || '</td>' ||
	'<td>' || entsaldosinnac || '</td>' ||
	--'<td>' || '<input type=''text'' name=''bod'' id=''bod'' >' || '</td>' ||
	'<td>' || '' || '</td>' ||
	'<td>' || '' || '</td>' ||
	'</tr>' as cadena
	FROM entrada
	inner join producto on procodsx = entcodproducto
	inner join lote_trafico on ltrafcodsx = entlote
	inner join trafico on trafcodsx = ltrafnumtrafico 
	where ( (entsaldonac > 0 and entsaldonac = prounimasterpac) or (entsaldosinnac > 0 and entsaldosinnac = prounimasterpac) )
	order by entposicion 

	--LIMIT 30
LOOP
	texto  = texto || rec.cadena;
END LOOP;
SELECT trim(trailing ',' from texto) INTO texto;
--texto = texto || ']}';
RETURN texto;
END;$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION movimiento.movil_inventario()
  OWNER TO postgres;


--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
 
CREATE OR REPLACE FUNCTION movimiento.movil_inventario()
  RETURNS text AS
$BODY$
DECLARE
rec record;
texto TEXT;
periodo integer;
BEGIN
texto = '{"data": [';
FOR rec IN

	SELECT '[' ||
	'"' || entcodsx  || '",' ||
	'"' || promodelo || '",' ||
	'"' || prodescripcion || '",' ||
	'"' || entposicion || '",' ||
	'"' || case when trafnumdta is not null then trafnumdta else 'SIN DEFINIR' end || '",' ||
	'"' || case when ltraflote is not null then ltraflote else 'SIN DEFINIR' end  || '",' ||
	'"' || case when ltrafvencimiento is not null then to_char(ltrafvencimiento,'yyyy-mm-dd') else 'SIN DEFINIR' end  || '",' ||
	'"' || entcantidad || '",' ||
	'"' || proump || '",' ||
	'"' || entsaldonac || '",' ||
	'"' || entsaldosinnac || '",' ||
	--'"' || '<input type=''text'' name=''bod'' id=''bod'' >' || '",' ||
	'"' || '' || '",' ||
	'"' || '' || '"' ||
	'],' as cadena
	FROM entrada
	inner join producto on procodsx = entcodproducto
	inner join lote_trafico on ltrafcodsx = entlote
	inner join trafico on trafcodsx = ltrafnumtrafico 
	where ( (entsaldonac > 0 and entsaldonac = prounimasterpac) or (entsaldosinnac > 0 and entsaldosinnac = prounimasterpac) )
	order by entposicion 
LOOP
	texto  = texto || rec.cadena;
END LOOP;
SELECT trim(trailing ',' from texto) INTO texto;
texto = texto || ']}';
RETURN texto;
END;$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION movimiento.movil_inventario()
  OWNER TO postgres;


--------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION movimiento.movil_reubicacion()
  RETURNS text AS
$BODY$
DECLARE
rec record;
texto TEXT;
periodo integer;
BEGIN
texto = '{"data": [';
FOR rec IN

	SELECT '[' ||
	'"' || entcodsx  || '",' ||
	'"' || promodelo || '",' ||
	'"' || prodescripcion || '",' ||
	'"' || entposicion || '",' ||
	'"' || case when trafnumdta is not null then trafnumdta else 'SIN DEFINIR' end || '",' ||
	'"' || case when ltraflote is not null then ltraflote else 'SIN DEFINIR' end  || '",' ||
	'"' || case when ltrafvencimiento is not null then to_char(ltrafvencimiento,'yyyy-mm-dd') else 'SIN DEFINIR' end  || '",' ||
	'"' || entcantidad || '",' ||
	'"' || proump || '",' ||
	'"' || entsaldonac || '",' ||
	'"' || entsaldosinnac || '",' ||
	'"' || '' || '"' ||
	'],' as cadena
	FROM entrada
	inner join producto on procodsx = entcodproducto
	inner join lote_trafico on ltrafcodsx = entlote
	inner join trafico on trafcodsx = ltrafnumtrafico 
	where ( (entsaldonac > 0 and entsaldonac != prounimasterpac) or (entsaldosinnac > 0 and entsaldosinnac != prounimasterpac) )
	order by entposicion 
LOOP
	texto  = texto || rec.cadena;
END LOOP;
SELECT trim(trailing ',' from texto) INTO texto;
texto = texto || ']}';
RETURN texto;

END;$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION movimiento.movil_reubicacion()
  OWNER TO postgres;  