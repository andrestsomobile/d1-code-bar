--
-- PostgreSQL database dump
--

-- Started on 2010-11-11 13:40:21

SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 2 (class 2615 OID 23848)
-- Name: facturacion; Type: SCHEMA; Schema: -; Owner: usersgl
--

CREATE SCHEMA facturacion;


ALTER SCHEMA facturacion OWNER TO usersgl;

--
-- TOC entry 6 (class 2615 OID 23849)
-- Name: movimiento; Type: SCHEMA; Schema: -; Owner: usersgl
--

CREATE SCHEMA movimiento;


ALTER SCHEMA movimiento OWNER TO usersgl;

--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA movimiento; Type: COMMENT; Schema: -; Owner: usersgl
--

COMMENT ON SCHEMA movimiento IS 'esquema que tiene las tablas de movimientos de traficos, ingresos, salidas, etc';


--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- TOC entry 787 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = facturacion, pg_catalog;

--
-- TOC entry 531 (class 1247 OID 23851)
-- Dependencies: 1830
-- Name: reporte_alistamiento; Type: TYPE; Schema: facturacion; Owner: usersgl
--

CREATE TYPE reporte_alistamiento AS (
	fecha date,
	unid_desp character varying,
	rep_minv character varying,
	unid_fact character varying
);


ALTER TYPE facturacion.reporte_alistamiento OWNER TO usersgl;

--
-- TOC entry 532 (class 1247 OID 23853)
-- Dependencies: 1831
-- Name: reporte_almacenamiento_detalle; Type: TYPE; Schema: facturacion; Owner: usersgl
--

CREATE TYPE reporte_almacenamiento_detalle AS (
	modelo character varying,
	cant_nac character varying,
	cant_nnac character varying
);


ALTER TYPE facturacion.reporte_almacenamiento_detalle OWNER TO usersgl;

--
-- TOC entry 533 (class 1247 OID 23855)
-- Dependencies: 1832
-- Name: revision_datos; Type: TYPE; Schema: facturacion; Owner: usersgl
--

CREATE TYPE revision_datos AS (
	ingcodsx numeric,
	procodsx numeric,
	fecha date,
	tipo character varying,
	cant_ingreso numeric,
	cant_kardex numeric
);


ALTER TYPE facturacion.revision_datos OWNER TO usersgl;

SET search_path = movimiento, pg_catalog;

--
-- TOC entry 534 (class 1247 OID 23857)
-- Dependencies: 1833
-- Name: bodega_producto; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE bodega_producto AS (
	bodnombre character varying,
	promodelo character varying,
	prodescripcion character varying,
	procodsx bigint,
	saldonac numeric,
	saldonnac numeric,
	saldopeson numeric,
	saldopesob numeric,
	saldovalornacpesos numeric,
	saldovalornacus numeric,
	saldovalornnacus numeric,
	bodcodsx bigint
);


ALTER TYPE movimiento.bodega_producto OWNER TO usersgl;

--
-- TOC entry 535 (class 1247 OID 23859)
-- Dependencies: 1834
-- Name: consolidado_despacho; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE consolidado_despacho AS (
	modelo character varying,
	descripcion character varying,
	tipo character varying,
	consec character varying,
	conseczfp character varying,
	embarque character varying,
	documento character varying,
	ingconsec character varying,
	ingconseczfp character varying,
	cantidad numeric(15,2),
	valor numeric(15,2),
	peso numeric(15,2)
);


ALTER TYPE movimiento.consolidado_despacho OWNER TO usersgl;

--
-- TOC entry 536 (class 1247 OID 23861)
-- Dependencies: 1835
-- Name: indic_dev_causal; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE indic_dev_causal AS (
	caucodsx bigint,
	caudesc character varying,
	cantidad numeric,
	porc numeric
);


ALTER TYPE movimiento.indic_dev_causal OWNER TO usersgl;

--
-- TOC entry 537 (class 1247 OID 23863)
-- Dependencies: 1836
-- Name: indic_dev_cliente; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE indic_dev_cliente AS (
	cliente character varying,
	cantidad numeric,
	porc numeric
);


ALTER TYPE movimiento.indic_dev_cliente OWNER TO usersgl;

--
-- TOC entry 538 (class 1247 OID 23865)
-- Dependencies: 1837
-- Name: indic_ing_cont; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE indic_ing_cont AS (
	compania character varying,
	de_20 bigint,
	de_40 bigint,
	de_40hq bigint,
	total integer,
	porc numeric
);


ALTER TYPE movimiento.indic_ing_cont OWNER TO usersgl;

--
-- TOC entry 539 (class 1247 OID 23867)
-- Dependencies: 1838
-- Name: indic_ingresos_cia; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE indic_ingresos_cia AS (
	compania character varying,
	valor numeric,
	cantidad numeric,
	porc numeric
);


ALTER TYPE movimiento.indic_ingresos_cia OWNER TO usersgl;

--
-- TOC entry 540 (class 1247 OID 23869)
-- Dependencies: 1839
-- Name: indicador_hit; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE indicador_hit AS (
	hit bigint,
	texto character varying,
	sem1 bigint,
	sem2 bigint,
	sem3 bigint,
	sem4 bigint,
	tot_zona bigint,
	porc_zona numeric(10,2)
);


ALTER TYPE movimiento.indicador_hit OWNER TO usersgl;

--
-- TOC entry 541 (class 1247 OID 23871)
-- Dependencies: 1840
-- Name: indicador_horas; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE indicador_horas AS (
	texto text,
	a bigint,
	b bigint,
	c bigint,
	d bigint,
	e bigint,
	f numeric
);


ALTER TYPE movimiento.indicador_horas OWNER TO usersgl;

--
-- TOC entry 542 (class 1247 OID 23873)
-- Dependencies: 1841
-- Name: indicador_zonas; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE indicador_zonas AS (
	texto character varying,
	sem1_a bigint,
	sem1_b bigint,
	sem1_c bigint,
	sem1_d bigint,
	sem2_a bigint,
	sem2_b bigint,
	sem2_c bigint,
	sem2_d bigint,
	sem3_a bigint,
	sem3_b bigint,
	sem3_c bigint,
	sem3_d bigint,
	sem4_a bigint,
	sem4_b bigint,
	sem4_c bigint,
	sem4_d bigint,
	tot_zona bigint,
	porc_zona numeric
);


ALTER TYPE movimiento.indicador_zonas OWNER TO usersgl;

--
-- TOC entry 543 (class 1247 OID 23875)
-- Dependencies: 1842
-- Name: indicador_zonas_valorizado; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE indicador_zonas_valorizado AS (
	zona character varying,
	r1 numeric,
	r2 numeric,
	r3 numeric,
	r4 numeric,
	r5 numeric,
	porc numeric,
	total numeric
);


ALTER TYPE movimiento.indicador_zonas_valorizado OWNER TO usersgl;

--
-- TOC entry 544 (class 1247 OID 23877)
-- Dependencies: 1843
-- Name: inventario_promedio; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE inventario_promedio AS (
	categoria character varying,
	dia date,
	valor numeric
);


ALTER TYPE movimiento.inventario_promedio OWNER TO usersgl;

--
-- TOC entry 545 (class 1247 OID 23879)
-- Dependencies: 1844
-- Name: kardex_categoria; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE kardex_categoria AS (
	categ character varying,
	fecha date,
	ent numeric,
	sal numeric,
	saldo numeric
);


ALTER TYPE movimiento.kardex_categoria OWNER TO usersgl;

--
-- TOC entry 546 (class 1247 OID 23881)
-- Dependencies: 1845
-- Name: kilo_volumen; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE kilo_volumen AS (
	numpedido character varying,
	kilovolumen numeric
);


ALTER TYPE movimiento.kilo_volumen OWNER TO usersgl;

--
-- TOC entry 547 (class 1247 OID 23883)
-- Dependencies: 1846
-- Name: reporte_kardex_categoria; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE reporte_kardex_categoria AS (
	categ character varying,
	fecha timestamp without time zone,
	saldoini numeric,
	ent numeric,
	sal numeric,
	saldo numeric,
	promedio numeric
);


ALTER TYPE movimiento.reporte_kardex_categoria OWNER TO usersgl;

--
-- TOC entry 548 (class 1247 OID 23885)
-- Dependencies: 1847
-- Name: subreporte_historico_embarque_producto; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE subreporte_historico_embarque_producto AS (
	fecha timestamp with time zone,
	cod character varying,
	cod2 character varying,
	consec character varying,
	conseczfp character varying,
	cant numeric,
	valor numeric,
	pesob numeric
);


ALTER TYPE movimiento.subreporte_historico_embarque_producto OWNER TO usersgl;

--
-- TOC entry 549 (class 1247 OID 23887)
-- Dependencies: 1848
-- Name: subreporte_picking_reservado; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE subreporte_picking_reservado AS (
	pickcodsx integer,
	pickcodpacking bigint,
	pickestado character varying,
	sum numeric
);


ALTER TYPE movimiento.subreporte_picking_reservado OWNER TO usersgl;

--
-- TOC entry 550 (class 1247 OID 23889)
-- Dependencies: 1849
-- Name: tipo_inventario_valorizado; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE tipo_inventario_valorizado AS (
	promodelo character varying,
	prodescripcion character varying,
	saldo_ant_nac numeric,
	saldo_ant_nnac numeric,
	totalunidades numeric,
	saldonaccif numeric,
	saldonnaccfi numeric,
	totalescif numeric,
	valorpesos numeric
);


ALTER TYPE movimiento.tipo_inventario_valorizado OWNER TO usersgl;

--
-- TOC entry 551 (class 1247 OID 23891)
-- Dependencies: 1850
-- Name: tipo_reporte_inventario; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE tipo_reporte_inventario AS (
	comcodsx bigint,
	comnombre character varying,
	catnombre character varying,
	catdescripcion character varying,
	promodelo character varying,
	prodescripcion character varying,
	saldo_ant_nac numeric,
	saldo_ant_nnac numeric,
	ave_pleg_nac numeric,
	ave_prod_nac numeric,
	ave_pleg_nnac numeric,
	ave_prod_nnac numeric,
	acum_nac numeric,
	acum_dev numeric,
	aj_pos_nac numeric,
	aj_neg_nac numeric,
	aj_pos_nnac numeric,
	aj_neg_nnac numeric,
	pend_desp numeric,
	acum_desp numeric,
	ped_tram_nac numeric,
	ped_tram_nnac numeric,
	saldo_fin_nac numeric,
	saldo_fin_nnac numeric,
	saldo_fisico_nac numeric,
	saldo_fisico_nnac numeric
);


ALTER TYPE movimiento.tipo_reporte_inventario OWNER TO usersgl;

--
-- TOC entry 552 (class 1247 OID 23893)
-- Dependencies: 1851
-- Name: tipo_saldo_embarque; Type: TYPE; Schema: movimiento; Owner: postgres
--

CREATE TYPE tipo_saldo_embarque AS (
	ingcodsx bigint,
	ingfecha timestamp with time zone,
	ingcantidad numeric,
	ingpesoneto numeric,
	ingpesobruto numeric,
	trafembarque character varying,
	trafdocumento character varying,
	trafnumdta character varying,
	nad_cantidad numeric,
	nad_pesoneto numeric,
	nad_pesobruto numeric,
	nnac_cantidad numeric,
	nnac_pesoneto numeric,
	nnac_pesobruto numeric
);


ALTER TYPE movimiento.tipo_saldo_embarque OWNER TO postgres;

--
-- TOC entry 553 (class 1247 OID 23895)
-- Dependencies: 1852
-- Name: tp_kardex; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE tp_kardex AS (
	kardsaldonac numeric,
	kardsaldonnac numeric,
	entsaldonac numeric,
	entsaldonacf numeric,
	avesaldo_pleg_nac numeric,
	avecant_prod_nac numeric
);


ALTER TYPE movimiento.tp_kardex OWNER TO usersgl;

--
-- TOC entry 554 (class 1247 OID 23897)
-- Dependencies: 1853
-- Name: tp_resumido; Type: TYPE; Schema: movimiento; Owner: usersgl
--

CREATE TYPE tp_resumido AS (
	kardsaldonac numeric,
	kardsaldonnac numeric,
	entsaldonac numeric,
	entsaldonacf numeric,
	avesaldo_pleg_nac numeric,
	avecant_prod_nac numeric
);


ALTER TYPE movimiento.tp_resumido OWNER TO usersgl;

SET search_path = public, pg_catalog;

--
-- TOC entry 529 (class 0 OID 0)
-- Name: gtsq; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE gtsq;


--
-- TOC entry 128 (class 1255 OID 16667)
-- Dependencies: 7 529
-- Name: gtsq_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_in(cstring) RETURNS gtsq
    AS '$libdir/tsearch2', 'gtsq_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsq_in(cstring) OWNER TO postgres;

--
-- TOC entry 129 (class 1255 OID 16668)
-- Dependencies: 7 529
-- Name: gtsq_out(gtsq); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_out(gtsq) RETURNS cstring
    AS '$libdir/tsearch2', 'gtsq_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsq_out(gtsq) OWNER TO postgres;

--
-- TOC entry 528 (class 1247 OID 16666)
-- Dependencies: 129 7 128
-- Name: gtsq; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE gtsq (
    INTERNALLENGTH = 8,
    INPUT = gtsq_in,
    OUTPUT = gtsq_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.gtsq OWNER TO postgres;

--
-- TOC entry 524 (class 0 OID 0)
-- Name: gtsvector; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE gtsvector;


--
-- TOC entry 89 (class 1255 OID 16599)
-- Dependencies: 7 524
-- Name: gtsvector_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_in(cstring) RETURNS gtsvector
    AS '$libdir/tsearch2', 'gtsvector_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsvector_in(cstring) OWNER TO postgres;

--
-- TOC entry 90 (class 1255 OID 16600)
-- Dependencies: 7 524
-- Name: gtsvector_out(gtsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_out(gtsvector) RETURNS cstring
    AS '$libdir/tsearch2', 'gtsvector_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsvector_out(gtsvector) OWNER TO postgres;

--
-- TOC entry 523 (class 1247 OID 16598)
-- Dependencies: 7 89 90
-- Name: gtsvector; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE gtsvector (
    INTERNALLENGTH = variable,
    INPUT = gtsvector_in,
    OUTPUT = gtsvector_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.gtsvector OWNER TO postgres;

--
-- TOC entry 521 (class 0 OID 0)
-- Name: tsquery; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tsquery;


--
-- TOC entry 63 (class 1255 OID 16569)
-- Dependencies: 7 521
-- Name: tsquery_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_in(cstring) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.tsquery_in(cstring) OWNER TO postgres;

--
-- TOC entry 64 (class 1255 OID 16570)
-- Dependencies: 7 521
-- Name: tsquery_out(tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_out(tsquery) RETURNS cstring
    AS '$libdir/tsearch2', 'tsquery_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.tsquery_out(tsquery) OWNER TO postgres;

--
-- TOC entry 520 (class 1247 OID 16568)
-- Dependencies: 63 7 64
-- Name: tsquery; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tsquery (
    INTERNALLENGTH = variable,
    INPUT = tsquery_in,
    OUTPUT = tsquery_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.tsquery OWNER TO postgres;

--
-- TOC entry 518 (class 0 OID 0)
-- Name: tsvector; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tsvector;


--
-- TOC entry 54 (class 1255 OID 16557)
-- Dependencies: 7 518
-- Name: tsvector_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_in(cstring) RETURNS tsvector
    AS '$libdir/tsearch2', 'tsvector_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.tsvector_in(cstring) OWNER TO postgres;

--
-- TOC entry 55 (class 1255 OID 16558)
-- Dependencies: 7 518
-- Name: tsvector_out(tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_out(tsvector) RETURNS cstring
    AS '$libdir/tsearch2', 'tsvector_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.tsvector_out(tsvector) OWNER TO postgres;

--
-- TOC entry 517 (class 1247 OID 16556)
-- Dependencies: 7 55 54
-- Name: tsvector; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tsvector (
    INTERNALLENGTH = variable,
    INPUT = tsvector_in,
    OUTPUT = tsvector_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


ALTER TYPE public.tsvector OWNER TO postgres;

--
-- TOC entry 526 (class 1247 OID 16611)
-- Dependencies: 1828
-- Name: statinfo; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE statinfo AS (
	word text,
	ndoc integer,
	nentry integer
);


ALTER TYPE public.statinfo OWNER TO postgres;

--
-- TOC entry 512 (class 1247 OID 16449)
-- Dependencies: 1825
-- Name: tokenout; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tokenout AS (
	tokid integer,
	token text
);


ALTER TYPE public.tokenout OWNER TO postgres;

--
-- TOC entry 511 (class 1247 OID 16442)
-- Dependencies: 1824
-- Name: tokentype; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tokentype AS (
	tokid integer,
	alias text,
	descr text
);


ALTER TYPE public.tokentype OWNER TO postgres;

--
-- TOC entry 527 (class 1247 OID 16617)
-- Dependencies: 1829
-- Name: tsdebug; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tsdebug AS (
	ts_name text,
	tok_type text,
	description text,
	token text,
	dict_name text[],
	tsvector tsvector
);


ALTER TYPE public.tsdebug OWNER TO postgres;

SET search_path = facturacion, pg_catalog;

--
-- TOC entry 140 (class 1255 OID 23898)
-- Dependencies: 787 2
-- Name: actualiza_kardex_modelo(bigint); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION actualiza_kardex_modelo(bigint) RETURNS void
    AS $_$declare
rec record;
cia alias for $1;

begin

for rec in select procodsx, promodelo from producto where procodigocia=cia
loop
    update kardex set kardmodelo=rec.promodelo where kardcodproducto = rec.procodsx;
	
raise notice'Modelo :%', rec.promodelo;

end loop;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.actualiza_kardex_modelo(bigint) OWNER TO usersgl;

--
-- TOC entry 141 (class 1255 OID 23899)
-- Dependencies: 787 2
-- Name: actualizar_cliente_facturacion(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION actualizar_cliente_facturacion() RETURNS "trigger"
    AS $$--TRIGGER que se llena con los datos de la tabla COMPANIA del esquema public que es la
--tabla de usuarios a los que se factura.
BEGIN
IF TG_RELNAME = 'compania' THEN


--CREACION DE UNA COMPANIA, SE INSERTA UN REGISTRO:


if TG_OP='INSERT'  THEN

insert into cliente_facturacion(clifnombre, clifnit, clifdireccion, cliftelefono, clifcodcompania)
values
(new.comnombre, new.comnit, new.comdireccion, new.comtelefono, new.comcodsx);

END IF;

if TG_OP='UPDATE'  THEN

update cliente_facturacion set
clifnombre = new.comnombre, clifnit = new.comnit, 
clifdireccion =new.comdireccion, cliftelefono = new.comtelefono, clifcodcompania =new.comcodsx
where clifcodcompania = new.comcodsx;


END IF;

--delete, borra el cliente, si este ya tiene facturas no lo podra borrar...
if TG_OP='DELETE'  THEN
 delete from cliente_facturacion where clifcodcompania = old.comcodsx;

END IF;



if TG_OP='DELETE' THEN
RETURN OLD;
ELSE RETURN NEW;
END IF;

END IF;

END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.actualizar_cliente_facturacion() OWNER TO usersgl;

--
-- TOC entry 142 (class 1255 OID 23900)
-- Dependencies: 787 2
-- Name: actualizar_concepto_cliente(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION actualizar_concepto_cliente() RETURNS "trigger"
    AS $$DECLARE
rec RECORD;

BEGIN

--cliente_facturacion, solo lo hago cuando es nuevo, ya que cuando se actualiza aki no pasa nada
-- y en el delete se van por la llave foranea en cascada
--inserto todos los conceptos con todos los datos en cero
IF TG_RELNAME = 'cliente_facturacion' and TG_OP='INSERT' THEN

for rec in select * from concepto loop
insert into concepto_cliente(conccodconcepto, conccodcliente, concdescconcepto, concnombrecliente, 
concvalorunit, concporcentaje, concminimo) 
 values( rec.concodsx, new.clifcodsx, rec.condesc, new.clifnombre, 0,0,0);

end loop;

END if;

--cuando se inserta un concepto,qu elo cree, cuando se actualize no, y cuando se elimine tampoco
-- por que ahi va por llave foranea en cascada, es decir, que cuando se elimina un concepto
-- se elimina para todos los clientes
if TG_RELNAME='concepto' THEN

if TG_OP='INSERT' THEN
insert into concepto_cliente(conccodconcepto, conccodcliente, concdescconcepto, concnombrecliente, 
concvalorunit, concporcentaje, concminimo) 
 select new.concodsx, clifcodsx, new.condesc, clifnombre, 0,0,0 from cliente_facturacion;
END IF;

IF TG_OP='UPDATE' THEN

update concepto_cliente set concdescconcepto = new.condesc where conccodconcepto = new.concodsx;

END IF;

END IF;

IF TG_OP= 'DELETE' THEN 
RETURN OLD;
ELSE RETURN NEW;
END IF;


END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.actualizar_concepto_cliente() OWNER TO usersgl;

--
-- TOC entry 143 (class 1255 OID 23901)
-- Dependencies: 2 787
-- Name: actualizar_subtotal_factura(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION actualizar_subtotal_factura() RETURNS "trigger"
    AS $$DECLARE
fac record;
subt  numeric;
val_iva numeric;
val_ret numeric;
val_reteiva numeric;
val_imptimbre numeric;
BEGIN

IF TG_RELNAME='factura_detalle' THEN

if TG_OP='DELETE' THEN
   select into fac * from factura where faccodsx = old.facdfactura;
  else
   select into fac * from factura where faccodsx = new.facdfactura;
end if;

select into subt sum( facdvalortotal) from factura_detalle where facdfactura = fac.faccodsx;
raise notice'subt :%', subt;
if subt is null then subt = 0; end if;
raise notice'subt :%', subt;
if fac.facsubtotal is null then fac.facsubtotal = 0; end if;
if fac.facdescto is null then fac.facdescto = 0; end if;
if fac.faciva is null then fac.faciva = 0; end if;
if fac.facretefuente is null then fac.facretefuente = 0; end if;
if fac.facdescto is null then fac.facdescto = 0; end if;
if fac.facimptimbre is null then fac.facimptimbre = 0; end if;
if fac.facreteiva is null then fac.facreteiva = 0; end if;

val_iva = (subt - fac.facdescto) * fac.faciva/100;
val_ret = (subt - fac.facdescto) * fac.facretefuente/100;
val_imptimbre = (subt - fac.facdescto) * fac.facimptimbre/100;
val_reteiva = val_iva * fac.facreteiva/100;

raise notice'1 :%', val_iva;
raise notice'2 :%', val_ret;
raise notice'3 :%', val_imptimbre;
raise notice'4 :%', val_reteiva;
raise notice'5 :%', (subt + val_iva) -( val_ret + val_reteiva + val_imptimbre) - fac.facdescto;


update factura set facsubtotal = subt, 
factotal =  (subt + val_iva) -( val_ret + val_reteiva + val_imptimbre) - fac.facdescto,
facvaloriva = val_iva,
facvalorretef = val_ret,
facvalimptimbre = val_imptimbre where faccodsx = fac.faccodsx;  

END IF;

if TG_OP='DELETE' THEN
return OLD;
ELSE
return new;
END IF;

END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.actualizar_subtotal_factura() OWNER TO usersgl;

--
-- TOC entry 144 (class 1255 OID 23902)
-- Dependencies: 787 2
-- Name: actualizar_total_factura(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION actualizar_total_factura() RETURNS "trigger"
    AS $$DECLARE
val_iva numeric;
val_ret numeric;
val_reteiva numeric;
val_imptimbre numeric;

BEGIN

IF TG_RELNAME='factura' THEN


select into new.facsubtotal sum(facdvalortotal) from factura_detalle
where facdfactura = new.faccodsx;
if new.facsubtotal is null then new.facsubtotal = 0; end if;
val_iva = (new.facsubtotal - new.facdescto) * new.faciva/100;
val_ret = (new.facsubtotal - new.facdescto) * new.facretefuente/100;
val_imptimbre = (new.facsubtotal - new.facdescto) * new.facimptimbre/100;
val_reteiva = val_iva * new.facreteiva/100;

new.factotal = (new.facsubtotal + val_iva) - (val_ret + val_reteiva + new.facvalimptimbre) - new.facdescto;
new.facvaloriva = val_iva;
new.facvalorretef = val_ret;
new.facvalimptimbre = val_imptimbre;

END IF;

return new;
END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.actualizar_total_factura() OWNER TO usersgl;

--
-- TOC entry 145 (class 1255 OID 23903)
-- Dependencies: 2 787
-- Name: actualizar_unidades_alistamiento(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION actualizar_unidades_alistamiento() RETURNS "trigger"
    AS $$declare
rec record;
total numeric(15,2);
rep record;
vas record;
begin

--valido que el cliente tenga las categorias de REPUESTOS Y VASOS
select into rep categoria.* from categoria, compania, cliente_facturacion 
where catcodcompania = comcodsx and comcodsx = clifcodcompania and clifcodsx = new.alcliente_fac
and catnombre ='REPUESTOS';

select into vas categoria.* from categoria, compania, cliente_facturacion 
where catcodcompania = comcodsx and comcodsx = clifcodcompania and clifcodsx = new.alcliente_fac
and catnombre ='VASOS';

if rep.catcodsx is null then raise exception 'el cliente no tiene la categoria REPUESTOS'; end if;
if vas.catcodsx is null then raise exception 'el cliente no tiene la categoria VASOS'; end if;

total =0;
for rec in select * from reporte_alistamiento(new.alfecha_ini::date, new.alfecha_fin::date, new.alcliente_fac)
loop

total = total  + (rec.unid_fact::numeric);


end loop;

new.alunid_facturar := total;

return new;
end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.actualizar_unidades_alistamiento() OWNER TO usersgl;

--
-- TOC entry 146 (class 1255 OID 23904)
-- Dependencies: 2 787
-- Name: actualizar_unidades_almacenamiento(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION actualizar_unidades_almacenamiento() RETURNS "trigger"
    AS $$declare
rec record;

elec numeric(15,2);
vasos numeric(15,2);
ele record;
vas record;
i integer;
begin

--valido que el cliente tenga las categorias de REPUESTOS Y VASOS
select into ele categoria.* from categoria, compania, cliente_facturacion 
where catcodcompania = comcodsx and comcodsx = clifcodcompania and clifcodsx = new.almcliente_fac
and catnombre ='ELECTRODOMESTICOS';

select into vas categoria.* from categoria, compania, cliente_facturacion 
where catcodcompania = comcodsx and comcodsx = clifcodcompania and clifcodsx = new.almcliente_fac
and catnombre ='VASOS';

if ele.catcodsx is null then raise exception 'el cliente no tiene la categoria ELECTRODOMESTICOS'; end if;
if vas.catcodsx is null then raise exception 'el cliente no tiene la categoria VASOS'; end if;


i=0;
elec=0;
vasos=0;

for rec in select * from reporte_almacenamiento(new.almfecha_ini::date, new.almfecha_fin::date, new.almcliente_fac)
loop
i = i+1;
elec = elec + (rec.unid_desp::numeric);
vasos = vasos + (rec.rep_minv::numeric);

end loop;

new.almelect := elec / i;
new.almvasos := vasos /i;

return new;
end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.actualizar_unidades_almacenamiento() OWNER TO usersgl;

--
-- TOC entry 147 (class 1255 OID 23905)
-- Dependencies: 2 787
-- Name: alldates(date, date); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION alldates(date, date) RETURNS SETOF date
    AS $_$declare
        s alias for $1;
        e alias for $2;
        d date;
begin
        d := s;

        while d <= e
        LOOP
                return next d;
                select d + '1 day'::interval into d;
        END LOOP;

     --   return d;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.alldates(date, date) OWNER TO usersgl;

--
-- TOC entry 148 (class 1255 OID 23906)
-- Dependencies: 543 787 2
-- Name: descuadre_kardex_corte(date); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION descuadre_kardex_corte(date) RETURNS SETOF movimiento.indicador_zonas_valorizado
    AS $_$declare
fecha alias for $1;
rec record;
resp record;

kard_nac numeric;
kard_nnac numeric;

ent_nac numeric;
ent_nnac numeric;

ave_nac numeric;
ave_nnac numeric;

begin

for rec in select kardcompania , kardcodproducto, kardmodelo from kardex 
           where kardfecha::date <= fecha
           group by kardcompania, kardcodproducto, kardmodelo
loop

select into ent_nac, ent_nnac  sum(entsaldonacf), sum(entsaldosinnacf) from entrada, ingreso
where ingcodsx=entcodingreso and entcodproducto = rec.kardcodproducto
and ingestado='FINALIZADO' and ingfecha::date <= fecha;

select into ave_nac, ave_nnac  sum(avesaldo_pleg_nac) + sum(avesaldo_prod_nac), sum(avesaldo_pleg_nnac) + sum(avesaldo_prod_nnac)
from averia
where aveproducto = rec.kardcodproducto and aveestado='FINALIZADO' and avefecha::date <= fecha;

ent_nac = ent_nac + ave_nac;
ent_nnac = ent_nnac + ave_nnac;


select into kard_nac, kard_nnac kardsaldonac, kardsaldonnac from kardex 
where kardcodproducto = rec.kardcodproducto and kardfecha::date <= fecha
order by kardfecha desc , kardcodsx  desc limit 1;

if ent_nac!=kard_nac or ent_nnac != kard_nnac then

for resp in 
select rec.kardmodelo, ent_nac, kard_nac, ent_nac-kard_nac, ent_nnac, kard_nnac, ent_nnac-kard_nnac, 0.00
loop
return next resp;
end loop;

end if;
end loop;



end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.descuadre_kardex_corte(date) OWNER TO usersgl;

--
-- TOC entry 149 (class 1255 OID 23907)
-- Dependencies: 2 787
-- Name: kardex(character varying, integer, integer); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION kardex(character varying, integer, integer) RETURNS void
    AS $_$--trigger que se encarga de llenar la tabla del kardex con los movimientos...
declare

rec RECORD;

tipo alias for $1;
prod alias for $2;
codsx alias for $3;

temp1 record;
temp2 record;
saldonac numeric;
saldonnac numeric;
cant_averia numeric;
begin

IF tipo='INGRESO' THEN
 
   --saco los productos que hayan en este ingreso:
  for rec in select  procodsx, promodelo,  prodescripcion,
		 comcodsx, comnombre,ingfecha,  ingtipo,
		 sum(entcantidad) as cant, sum(entpesobrutototal) as bruto, 
		 sum(entvalortotal) as valor, ingcodsx
		from entrada, producto, compania , ingreso
		where entcodproducto = procodsx and procodigocia = comcodsx 
                and entcodproducto=prod
		and ingcodsx = entcodingreso and ingestado::varchar='FINALIZADO'::varchar
		and entcodingreso = codsx
		group by comcodsx, comnombre, procodsx, promodelo,  prodescripcion, ingfecha, ingcodsx, ingtipo
  LOOP

	select into cant_averia sum(avesaldo_pleg_nac+avesaldo_prod_nac) as saldo
          from averia
          where aveingreso=codsx and aveproducto=prod;

	if cant_averia is null then cant_averia:=0; end if; 
        
        rec.cant := rec.cant + cant_averia;
        
       saldonac =0;saldonnac =0;
       --primero saco el saldo anterior  
       select into temp1 * from kardex where kardcodproducto = rec.procodsx 
          and kardcompania = rec.comcodsx order by kardfecha desc, kardcodsx desc limit 1;
       saldonac = temp1.kardsaldonac;
       saldonnac = temp1.kardsaldonnac;

       if saldonac is null then saldonac=0; end if;
       if saldonnac is null then saldonnac=0; end if;
       --SI EL INGRESO ES DE TIPO 'TRAFICO' EL SALDO ES NO NACIONALIZADO, 
       --DE LO CONTRARIO SERA NACIONALIZADO:
       select into temp2 * from ingreso where ingcodsx = rec.ingcodsx;

       if temp2.ingtipo='TRAFICO'  THEN --EL SALDO ES NO NACIONALIZADO
	 INSERT INTO kardex(kardfecha, kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, 
			kardnombrecomp, kardfechaing, kardcantingreso, kardtipoing,
			kardpesobrutoent, kardvaloringreso, kardcodigoingreso, kardsaldonac, kardsaldonnac)
	 values (rec.ingfecha, rec.procodsx, rec.promodelo, rec.prodescripcion,
		rec.comcodsx, rec.comnombre, rec.ingfecha, rec.cant, rec.ingtipo, rec.bruto,
		rec.valor, rec.ingcodsx, saldonac, saldonnac + rec.cant );

       ELSE  -- ES DEVOLUCION O DESPIECE, ES NACIONALIZADO:
	 INSERT INTO kardex(kardfecha, kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, 
			kardnombrecomp, kardfechaing, kardcantingreso, kardtipoing,
			kardpesobrutoent, kardvaloringreso, kardcodigoingreso, kardsaldonac, kardsaldonnac)
	 values (rec.ingfecha, rec.procodsx, rec.promodelo, rec.prodescripcion,
		rec.comcodsx, rec.comnombre, rec.ingfecha, rec.cant, rec.ingtipo, rec.bruto,
		rec.valor, rec.ingcodsx, (saldonac+rec.cant ), saldonnac);
       END IF;
  END LOOP;
END IF;


IF tipo='DESPACHO' THEN
  FOR REC IN select procodsx, promodelo,  prodescripcion ,
	comcodsx, comnombre, despfecha, sum(refdcant) as cantnac, 0.00 as cantnnac, 
	sum(refdpesoneto) as neto, sum(refdpesobruto) as bruto,sum(refdvalor)as valor,  despcodsx, despedpedido
	from compania, producto, despacho, despacho_pedido, referencia_despacho
	where comcodsx = despempresa and despeddespacho = despcodsx and refddespacho_pedido = despedcodsx
	and procodsx = refdproducto and despcodsx = codsx
	group by comcodsx, comnombre, procodsx, promodelo,  prodescripcion, despcodsx, despfecha, despedpedido
  LOOP

        saldonac =0; saldonnac =0;

        --primero saco el saldo anterior  
        select into temp1 * from kardex where kardcodproducto = rec.procodsx 
           and kardcompania = rec.comcodsx order by kardfecha desc, kardcodsx desc limit 1;
        saldonac = temp1.kardsaldonac;
        saldonnac = temp1.kardsaldonnac;

        if saldonac is null then saldonac=0; end if;
        if saldonnac is null then saldonnac=0; end if;
           --miro si el pedido es tiPO NAC O SNAC

        SELECT INTO temp2 * from pedido where pedcodsx = rec.despedpedido;
        if temp2.pedtipo='NAC' then --es nacionalizado:
          rec.cantnac  := rec.cantnac;
          rec.cantnnac :=0;
        else --es no nacionalizado:
          rec.cantnnac := rec.cantnac;
          rec.cantnac :=0.00;
        end if;

        INSERT INTO kardex(kardfecha, kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, 
			kardnombrecomp, kardfechasal, kardcantsalnac, kardcantsalnnac , karddespacho,
			kardpesobrutosal, kardvalorsal, kardcodigodespacho, kardsaldonac,  kardsaldonnac) 
        VALUES( rec.despfecha , rec.procodsx, rec.promodelo,  rec.prodescripcion ,
			rec.comcodsx, rec.comnombre, rec.despfecha, rec.cantnac,rec.cantnnac ,
		       rec.despcodsx, rec.bruto,rec.valor,  rec.despcodsx , (saldonac -rec.cantnac) ,  (saldonnac -rec.cantnnac));

  END LOOP;
END IF;

--TABLA NACIONALIZACION PARA AGREGAR EL REGISTRO DE NACIONALIZACION:
IF tipo='NACIONALIZACION' THEN
  FOR REC IN select procodsx, promodelo,  prodescripcion ,
	comcodsx, comnombre, nacfecha, naccodsx, sum(nadcantidad) as cantidad,
	sum(nadpesonetototal) as neto, sum(nadpesobrutototal) as bruto,sum(nadfobtotal)as valor
	from compania,  nacionalizacion, nacionalizacion_detalle, entrada, producto
	where comcodsx = nacempresa and naccodsx = nadcodnac and nadentrada = entcodsx and entcodproducto = procodsx
	and naccodsx = codsx
	group by comcodsx, comnombre, procodsx, promodelo,  prodescripcion, nacfecha, naccodsx
  LOOP
        --primero saco el saldo anterior  
        saldonac =0;saldonnac =0;

          --primero saco el saldo anterior  
          select into temp1 * from kardex where kardcodproducto = rec.procodsx 
            and kardcompania = rec.comcodsx order by kardfecha desc, kardcodsx desc limit 1;
          saldonac = temp1.kardsaldonac;
          saldonnac = temp1.kardsaldonnac;

          if saldonac is null then saldonac=0; end if;
          if saldonnac is null then saldonnac=0; end if;
          --miro si el pedido es tiPO NAC O SNAC
          --ahora voy y registro la nacionalizacion:

          INSERT INTO kardex(kardfecha, kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, 
			kardnombrecomp, kardfechanac, kardcantnac, kardpesonetonac,
			kardpesobrutonac, kardvalornac, kardcodnac, kardsaldonac,  kardsaldonnac) 
          VALUES( rec.nacfecha, rec.procodsx, rec.promodelo,  rec.prodescripcion ,
			rec.comcodsx, rec.comnombre, rec.nacfecha, rec.cantidad,
		        rec.neto, rec.bruto,rec.valor,  rec.naccodsx, (saldonac + rec.cantidad) ,  (saldonnac - rec.cantidad));
  END LOOP;
END IF;
  
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.kardex(character varying, integer, integer) OWNER TO usersgl;

--
-- TOC entry 150 (class 1255 OID 23909)
-- Dependencies: 2 787
-- Name: kardex1(character varying, integer, integer); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION kardex1(character varying, integer, integer) RETURNS void
    AS $_$--trigger que se encarga de llenar la tabla del kardex con los movimientos...
declare

rec RECORD;

tipo alias for $1;
prod alias for $2;
codsx alias for $3;

temp1 record;
temp2 record;
saldonac numeric;
saldonnac numeric;
cant_averia numeric;
begin

IF tipo='INGRESO' THEN
 
   --saco los productos que hayan en este ingreso:
  for rec in select  procodsx, promodelo,  prodescripcion,
		 comcodsx, comnombre,ingfecha,  ingtipo,
		 sum(entcantidad) as cant, sum(entpesobrutototal) as bruto, 
		 sum(entvalortotal) as valor, ingcodsx
		from entrada, producto, compania , ingreso
		where entcodproducto = procodsx and procodigocia = comcodsx 
                and entcodproducto=prod
		and ingcodsx = entcodingreso and ingestado::varchar='FINALIZADO'::varchar
		and entcodingreso = codsx
		group by comcodsx, comnombre, procodsx, promodelo,  prodescripcion, ingfecha, ingcodsx, ingtipo
  LOOP

	select into cant_averia sum(avesaldo_pleg_nac+avesaldo_prod_nac) as saldo
          from averia
          where aveingreso=codsx and aveproducto=prod;

	if cant_averia is null then cant_averia:=0; end if; 
        
        rec.cant := rec.cant + cant_averia;
        
       saldonac =0;saldonnac =0;
       --primero saco el saldo anterior  
       select into temp1 * from kardex where kardcodproducto = rec.procodsx 
          and kardcompania = rec.comcodsx order by kardfecha desc, kardcodsx desc limit 1;
       saldonac = temp1.kardsaldonac;
       saldonnac = temp1.kardsaldonnac;

       if saldonac is null then saldonac=0; end if;
       if saldonnac is null then saldonnac=0; end if;
       --SI EL INGRESO ES DE TIPO 'TRAFICO' EL SALDO ES NO NACIONALIZADO, 
       --DE LO CONTRARIO SERA NACIONALIZADO:
       select into temp2 * from ingreso where ingcodsx = rec.ingcodsx;

       if temp2.ingtipo='TRAFICO'  THEN --EL SALDO ES NO NACIONALIZADO
	 INSERT INTO kardex(kardfecha, kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, 
			kardnombrecomp, kardfechaing, kardcantingreso, kardtipoing,
			kardpesobrutoent, kardvaloringreso, kardcodigoingreso, kardsaldonac, kardsaldonnac)
	 values (rec.ingfecha, rec.procodsx, rec.promodelo, rec.prodescripcion,
		rec.comcodsx, rec.comnombre, rec.ingfecha, rec.cant, rec.ingtipo, rec.bruto,
		rec.valor, rec.ingcodsx, saldonac, saldonnac + rec.cant );

       ELSE  -- ES DEVOLUCION O DESPIECE, ES NACIONALIZADO:
	 INSERT INTO kardex(kardfecha, kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, 
			kardnombrecomp, kardfechaing, kardcantingreso, kardtipoing,
			kardpesobrutoent, kardvaloringreso, kardcodigoingreso, kardsaldonac, kardsaldonnac)
	 values (rec.ingfecha, rec.procodsx, rec.promodelo, rec.prodescripcion,
		rec.comcodsx, rec.comnombre, rec.ingfecha, rec.cant, rec.ingtipo, rec.bruto,
		rec.valor, rec.ingcodsx, (saldonac+rec.cant ), saldonnac);
       END IF;
  END LOOP;
END IF;


IF tipo='DESPACHO' THEN
  FOR REC IN select procodsx, promodelo,  prodescripcion ,
	comcodsx, comnombre, despfecha, sum(refdcant) as cantnac, 0.00 as cantnnac, 
	sum(refdpesoneto) as neto, sum(refdpesobruto) as bruto,sum(refdvalor)as valor,  despcodsx, despedpedido
	from compania, producto, despacho, despacho_pedido, referencia_despacho
	where comcodsx = despempresa and despeddespacho = despcodsx and refddespacho_pedido = despedcodsx
	and procodsx = refdproducto and despcodsx = codsx
	group by comcodsx, comnombre, procodsx, promodelo,  prodescripcion, despcodsx, despfecha, despedpedido
  LOOP

        saldonac =0; saldonnac =0;

        --primero saco el saldo anterior  
        select into temp1 * from kardex where kardcodproducto = rec.procodsx 
           and kardcompania = rec.comcodsx order by kardfecha desc, kardcodsx desc limit 1;
        saldonac = temp1.kardsaldonac;
        saldonnac = temp1.kardsaldonnac;

        if saldonac is null then saldonac=0; end if;
        if saldonnac is null then saldonnac=0; end if;
           --miro si el pedido es tiPO NAC O SNAC

        SELECT INTO temp2 * from pedido where pedcodsx = rec.despedpedido;
        if temp2.pedtipo='NAC' then --es nacionalizado:
          rec.cantnac  := rec.cantnac;
          rec.cantnnac :=0;
        else --es no nacionalizado:
          rec.cantnnac := rec.cantnac;
          rec.cantnac :=0.00;
        end if;

        INSERT INTO kardex(kardfecha, kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, 
			kardnombrecomp, kardfechasal, kardcantsalnac, kardcantsalnnac , karddespacho,
			kardpesobrutosal, kardvalorsal, kardcodigodespacho, kardsaldonac,  kardsaldonnac) 
        VALUES( rec.despfecha , rec.procodsx, rec.promodelo,  rec.prodescripcion ,
			rec.comcodsx, rec.comnombre, rec.despfecha, rec.cantnac,rec.cantnnac ,
		       rec.despcodsx, rec.bruto,rec.valor,  rec.despcodsx , (saldonac -rec.cantnac) ,  (saldonnac -rec.cantnnac));

  END LOOP;
END IF;

--TABLA NACIONALIZACION PARA AGREGAR EL REGISTRO DE NACIONALIZACION:
IF tipo='NACIONALIZACION' THEN
  FOR REC IN select procodsx, promodelo,  prodescripcion ,
	comcodsx, comnombre, nacfecha, naccodsx, sum(nadcantidad) as cantidad,
	sum(nadpesonetototal) as neto, sum(nadpesobrutototal) as bruto,sum(nadfobtotal)as valor
	from compania,  nacionalizacion, nacionalizacion_detalle, entrada, producto
	where comcodsx = nacempresa and naccodsx = nadcodnac and nadentrada = entcodsx and entcodproducto = procodsx
	and naccodsx = codsx
	group by comcodsx, comnombre, procodsx, promodelo,  prodescripcion, nacfecha, naccodsx
  LOOP
        --primero saco el saldo anterior  
        saldonac =0;saldonnac =0;

          --primero saco el saldo anterior  
          select into temp1 * from kardex where kardcodproducto = rec.procodsx 
            and kardcompania = rec.comcodsx order by kardfecha desc, kardcodsx desc limit 1;
          saldonac = temp1.kardsaldonac;
          saldonnac = temp1.kardsaldonnac;

          if saldonac is null then saldonac=0; end if;
          if saldonnac is null then saldonnac=0; end if;
          --miro si el pedido es tiPO NAC O SNAC
          --ahora voy y registro la nacionalizacion:

          INSERT INTO kardex(kardfecha, kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, 
			kardnombrecomp, kardfechanac, kardcantnac, kardpesonetonac,
			kardpesobrutonac, kardvalornac, kardcodnac, kardsaldonac,  kardsaldonnac) 
          VALUES( rec.nacfecha, rec.procodsx, rec.promodelo,  rec.prodescripcion ,
			rec.comcodsx, rec.comnombre, rec.nacfecha, rec.cantidad,
		        rec.neto, rec.bruto,rec.valor,  rec.naccodsx, (saldonac + rec.cantidad) ,  (saldonnac - rec.cantidad));
  END LOOP;
END IF;
  
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.kardex1(character varying, integer, integer) OWNER TO usersgl;

--
-- TOC entry 151 (class 1255 OID 23911)
-- Dependencies: 531 2 787
-- Name: reporte_alistamiento(date, date, bigint); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION reporte_alistamiento(date, date, bigint) RETURNS SETOF reporte_alistamiento
    AS $_$declare
rec record;
temp record;
fecha_ini alias for $1;
fecha_fin alias for $2;
despachadas numeric(15,2);
repuestos numeric(15,2);
unid_fact numeric(15,2);
cliente_fac alias for $3;
comp bigint;
rep record;
vas record;
begin

select into comp comcodsx from compania, cliente_facturacion where comcodsx = clifcodcompania and clifcodsx = cliente_fac;

select into rep categoria.* from categoria, compania
where catcodcompania = comcodsx and comcodsx = comp
and catnombre ='REPUESTOS';

select into vas categoria.* from categoria, compania
where catcodcompania = comcodsx and comcodsx = comp
and catnombre ='VASOS';

for rec in select x.date from alldates(fecha_ini, fecha_fin) as x
loop

--if extract(dow from date '2006-12-25')!=6 or extract(dow from date '2006-12-25')!=0 then
--saco todo lo despachado de todas las categorias
select into despachadas sum(refdcant) from despacho, despacho_pedido, referencia_despacho
where despcodsx = despeddespacho and refddespacho_pedido = despedcodsx
and despfecha::date =rec.date and despempresa = comp  and despestado='FINALIZADO';

-- saco lo de repuestos y vasos
select into repuestos sum(refdcant) from despacho, despacho_pedido, referencia_despacho, producto
where despcodsx = despeddespacho and refddespacho_pedido = despedcodsx
and despfecha::date =rec.date and despempresa = comp
and procodsx = refdproducto and (procategoria =2 or procategoria=6 or procategoria=3) and despestado='FINALIZADO';

if despachadas is null then despachadas :=0; end if;
if repuestos is null then repuestos :=0; end if;

if despachadas!=0  then
unid_fact = despachadas - repuestos;

for temp in select rec.date, despachadas::text::varchar , repuestos::text::varchar, 
	unid_fact ::text:: varchar
loop

return next temp;
end loop;

end if;
end loop;

--return temp;



end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.reporte_alistamiento(date, date, bigint) OWNER TO usersgl;

--
-- TOC entry 152 (class 1255 OID 23912)
-- Dependencies: 2 531 787
-- Name: reporte_almacenamiento(date, date, bigint); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION reporte_almacenamiento(date, date, bigint) RETURNS SETOF reporte_alistamiento
    AS $_$declare
rec record;
rec2 record;
rec3 record;
temp record;
kard record;
fecha_ini alias for $1;
fecha_fin alias for $2;
cliente_fac alias for $3;
comp bigint;
elec record;
vas record;


electrodomesticos numeric(15,2);
vasos numeric(15,2);
entrada numeric(15,2);
salida numeric(15,2);
saldo_ini numeric(15,2);
saldo_elec numeric(15,2);
saldo_vasos numeric(15,2);
valor_dia_elec numeric(15,2);
valor_dia_vasos numeric(15,2);

begin

select into comp comcodsx from compania, cliente_facturacion where comcodsx = clifcodcompania and clifcodsx = cliente_fac;

select into elec categoria.* from categoria, compania
where catcodcompania = comcodsx and comcodsx = comp
and catnombre ='ELECTRODOMESTICOS';

select into vas categoria.* from categoria, compania
where catcodcompania = comcodsx and comcodsx = comp
and catnombre ='VASOS';


saldo_ini=0;

saldo_elec = saldo_ini;

for rec in select x.date from alldates(fecha_ini, fecha_fin) as x
loop

valor_dia_elec := 0;
--hago la suma de los electrodomesticos que esten en el kardex, no de todos pues por que pa que
for rec2 in select procodsx from producto, kardex where procodsx = kardcodproducto and procategoria = elec.catcodsx
 and procodigocia=comp group by procodsx
loop
	select into kard * from kardex where kardcodproducto = rec2.procodsx and kardfecha::date <= rec.date
	order by  KARDFECHA  desc, kardcodsx desc limit 1;

--	if kard.kardcodsx is not null then 
if kard.kardsaldonac is null then kard.kardsaldonac=0; end if;
if kard.kardsaldonnac is null then kard.kardsaldonnac=0; end if;

	valor_dia_elec = valor_dia_elec + (kard.kardsaldonac + kard.kardsaldonnac);
raise notice'valor dia elec:%', valor_dia_elec;
--	end if;
end loop;

valor_dia_vasos :=0;
--hago la suma de los VASOS que esten en el kardex, no de todos pues por que pa que
for rec2 in select procodsx from producto, kardex where procodsx = kardcodproducto and procategoria = vas.catcodsx and procodigocia=comp 
group by procodsx
loop
	select into kard * from kardex where kardcodproducto = rec2.procodsx and kardfecha::date <= rec.date 
	order by kardfecha desc, kardcodsx desc limit 1;
	if kard.kardcodsx is not null then 
	valor_dia_vasos = valor_dia_vasos + (kard.kardsaldonac + kard.kardsaldonnac);
	end if;
end loop;



for temp in select rec.date, valor_dia_elec::text::varchar , valor_dia_vasos::text::varchar, ''::varchar
loop
return next temp;
end loop;



end loop;





end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.reporte_almacenamiento(date, date, bigint) OWNER TO usersgl;

--
-- TOC entry 153 (class 1255 OID 23913)
-- Dependencies: 532 787 2
-- Name: reporte_almacenamiento_detalle(date, bigint); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION reporte_almacenamiento_detalle(date, bigint) RETURNS SETOF reporte_almacenamiento_detalle
    AS $_$declare
rec record;
rec2 record;
rec3 record;
temp record;
kard record;
fecha_ini alias for $1;

cliente_fac alias for $2;
comp bigint;
elec record;
vas record;


electrodomesticos numeric(15,2);
vasos numeric(15,2);
entrada numeric(15,2);
salida numeric(15,2);
saldo_ini numeric(15,2);
saldo_elec numeric(15,2);
saldo_vasos numeric(15,2);
valor_dia_elec numeric(15,2);
valor_dia_vasos numeric(15,2);

begin

select into comp comcodsx from compania, cliente_facturacion where comcodsx = clifcodcompania and clifcodsx = cliente_fac;

select into elec categoria.* from categoria, compania
where catcodcompania = comcodsx and comcodsx = comp
and catnombre ='ELECTRODOMESTICOS';

select into vas categoria.* from categoria, compania
where catcodcompania = comcodsx and comcodsx = comp
and catnombre ='VASOS';


saldo_ini=0;

saldo_elec = saldo_ini;

valor_dia_elec := 0;
--hago la suma de los electrodomesticos que esten en el kardex, no de todos pues por que pa que
for rec2 in select procodsx from producto, kardex where procodsx = kardcodproducto and procategoria = elec.catcodsx
 and procodigocia=comp group by procodsx
loop
	select into kard kardmodelo, kardsaldonac::text::varchar, kardsaldonnac::text::varchar from kardex where kardcodproducto = rec2.procodsx and kardfecha::date <= fecha_ini
	order by  KARDFECHA  desc, kardcodsx desc limit 1;

--	if kard.kardcodsx is not null then 
if kard.kardsaldonac is null then kard.kardsaldonac=0; end if;
if kard.kardsaldonnac is null then kard.kardsaldonnac=0; end if;

return next kard;
end loop;

valor_dia_vasos :=0;
--hago la suma de los VASOS que esten en el kardex, no de todos pues por que pa que
for rec2 in select procodsx from producto, kardex where procodsx = kardcodproducto and procategoria = vas.catcodsx 
and procodigocia=comp group by procodsx
loop
	select into kard kardmodelo, kardsaldonac::text::varchar, kardsaldonnac::text::varchar from kardex where kardcodproducto = rec2.procodsx and kardfecha::date <= fecha_ini
	order by kardfecha desc, kardcodsx desc limit 1;
	--	if kard.kardcodsx is not null then 
if kard.kardsaldonac is null then kard.kardsaldonac=0; end if;
if kard.kardsaldonnac is null then kard.kardsaldonnac=0; end if;

return next kard;

end loop;


end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.reporte_almacenamiento_detalle(date, bigint) OWNER TO usersgl;

--
-- TOC entry 154 (class 1255 OID 23914)
-- Dependencies: 531 2 787
-- Name: reporte_almacenamiento_error_rival(date, date, bigint); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION reporte_almacenamiento_error_rival(date, date, bigint) RETURNS SETOF reporte_alistamiento
    AS $_$declare
rec record;
rec2 record;
rec3 record;
temp record;
kard record;
fecha_ini alias for $1;
fecha_fin alias for $2;
cliente_fac alias for $3;
comp bigint;
elec record;
vas record;


electrodomesticos numeric(15,2);
vasos numeric(15,2);
entrada numeric(15,2);
salida numeric(15,2);
saldo_ini numeric(15,2);
saldo_elec numeric(15,2);
saldo_vasos numeric(15,2);
valor_dia_elec numeric(15,2);
valor_dia_vasos numeric(15,2);

begin

select into comp comcodsx from compania, cliente_facturacion where comcodsx = clifcodcompania and clifcodsx = cliente_fac;

select into elec categoria.* from categoria, compania
where catcodcompania = comcodsx and comcodsx = comp
and catnombre ='ELECTRODOMESTICOS';

select into vas categoria.* from categoria, compania
where catcodcompania = comcodsx and comcodsx = comp
and catnombre ='VASOS';


saldo_ini=0;

saldo_elec = saldo_ini;

for rec in select x.date from alldates(fecha_ini, fecha_fin) as x
loop

valor_dia_elec := 0;
--hago la suma de los electrodomesticos que esten en el kardex, no de todos pues por que pa que
for rec2 in select procodsx from producto, kardex where procodsx = kardcodproducto and procategoria = elec.catcodsx
 group by procodsx
loop
	select into kard * from kardex where kardcodproducto = rec2.procodsx and kardfecha::date <= rec.date
	order by  KARDFECHA  desc, kardcodsx desc limit 1;

--	if kard.kardcodsx is not null then 
if kard.kardsaldonac is null then kard.kardsaldonac=0; end if;
if kard.kardsaldonnac is null then kard.kardsaldonnac=0; end if;

	valor_dia_elec = valor_dia_elec + (kard.kardsaldonac + kard.kardsaldonnac);
raise notice'valor dia elec:%', valor_dia_elec;
--	end if;
end loop;

valor_dia_vasos :=0;
--hago la suma de los VASOS que esten en el kardex, no de todos pues por que pa que
for rec2 in select procodsx from producto, kardex where procodsx = kardcodproducto and procategoria = vas.catcodsx  
group by procodsx
loop
	select into kard * from kardex where kardcodproducto = rec2.procodsx and kardfecha::date <= rec.date 
	order by kardfecha desc, kardcodsx desc limit 1;
	if kard.kardcodsx is not null then 
	valor_dia_vasos = valor_dia_vasos + (kard.kardsaldonac + kard.kardsaldonnac);
	end if;
end loop;



for temp in select rec.date, valor_dia_elec::text::varchar , valor_dia_vasos::text::varchar, ''::varchar
loop
return next temp;
end loop;



end loop;





end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.reporte_almacenamiento_error_rival(date, date, bigint) OWNER TO usersgl;

--
-- TOC entry 155 (class 1255 OID 23915)
-- Dependencies: 2 787
-- Name: resumen_alistamiento(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION resumen_alistamiento() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN


IF TG_RELNAME='alistamiento'  THEN

--datos del concepto:
res := new.alcodsx ||' ' || new.alfecha_ini  ||' ' || new.alfecha_fin;

--ACTUALIZO EL despacho:
res = upper(res);
new.resumen := res;


return new;

END IF;



IF TG_RELNAME='alistamiento_detalle'  THEN

--datos del concepto:
res := new.aldetcodsx;

--ACTUALIZO EL despacho:
res = upper(res);
new.resumen := res;


return new;

END IF;


END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.resumen_alistamiento() OWNER TO usersgl;

--
-- TOC entry 156 (class 1255 OID 23916)
-- Dependencies: 787 2
-- Name: resumen_almacenamiento(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION resumen_almacenamiento() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN


IF TG_RELNAME='almacenamiento'  THEN

--datos del concepto:
res := new.almcodsx ||' ' || new.almfecha_ini  ||' ' || new.almfecha_fin;

--ACTUALIZO EL despacho:
res = upper(res);
new.resumen := res;


return new;

END IF;





END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.resumen_almacenamiento() OWNER TO usersgl;

--
-- TOC entry 157 (class 1255 OID 23917)
-- Dependencies: 2 787
-- Name: resumen_cliente_facturacion(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION resumen_cliente_facturacion() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN


IF TG_RELNAME='cliente_facturacion'  THEN

--datos del concepto:
res := new.clifcodcompania ||' ' || new.clifnombre ||' ' || new.clifnit 
       ||' ' || new.clifdireccion ||' ' || new.cliftelefono;

--ACTUALIZO EL despacho:
res = upper(res);
new.resumen := res;


return new;

END IF;
END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.resumen_cliente_facturacion() OWNER TO usersgl;

--
-- TOC entry 158 (class 1255 OID 23918)
-- Dependencies: 2 787
-- Name: resumen_concepto(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION resumen_concepto() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN


IF TG_RELNAME='concepto'  THEN

--datos del concepto:
res := new.concodsx ||' ' || new.condesc;

--ACTUALIZO EL despacho:
res = upper(res);
new.resumen := res;


return new;

END IF;
END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.resumen_concepto() OWNER TO usersgl;

--
-- TOC entry 159 (class 1255 OID 23919)
-- Dependencies: 2 787
-- Name: resumen_concepto_cliente(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION resumen_concepto_cliente() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN


IF TG_RELNAME='concepto_cliente'  THEN

--datos del concepto:
res := new.concdescconcepto;

--ACTUALIZO EL despacho:
res = upper(res);
new.resumen := res;


return new;

END IF;
END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.resumen_concepto_cliente() OWNER TO usersgl;

--
-- TOC entry 160 (class 1255 OID 23920)
-- Dependencies: 2 787
-- Name: resumen_factura(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION resumen_factura() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN


IF TG_RELNAME='factura'  THEN

--datos del concepto:
res := new.faccodsx ||' ' || new.facdesccliente ||' ' || new.facfechafactura ||' ' || new.facnit ||' ' || new.facconcepto ;

--ACTUALIZO EL despacho:
res = upper(res);
new.resumen := res;


return new;

END IF;
END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.resumen_factura() OWNER TO usersgl;

--
-- TOC entry 161 (class 1255 OID 23921)
-- Dependencies: 2 787
-- Name: resumen_factura_detalle(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION resumen_factura_detalle() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN


IF TG_RELNAME='factura_detalle'  THEN

--datos del concepto:
res := new.facdcodsx ||' ' || new.facdconceptodesc;

--ACTUALIZO EL despacho:
res = upper(res);
new.resumen := res;


return new;

END IF;
END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.resumen_factura_detalle() OWNER TO usersgl;

--
-- TOC entry 162 (class 1255 OID 23922)
-- Dependencies: 2 787
-- Name: resumen_proforma(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION resumen_proforma() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN


IF TG_RELNAME='proforma'  THEN

--datos de la proforma:
res := new.profcodsx || coalesce('', new.profnumfactura::text) || coalesce('', new.profost) || coalesce('', new.profpedido) || coalesce('', new.profnit) || coalesce('', new.porforigen) || coalesce('', new.profbl) ;

--ACTUALIZO EL despacho:
res = upper(res);
new.resumen := res;


return new;

END IF;
END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.resumen_proforma() OWNER TO usersgl;

--
-- TOC entry 163 (class 1255 OID 23923)
-- Dependencies: 787 2 533
-- Name: revisa_kardex(character varying); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION revisa_kardex(character varying) RETURNS SETOF revision_datos
    AS $_$declare
rec record;
resp record;

actualiza alias FOR $1;
kard_nac numeric;
kard_nnac numeric;

ent_nac numeric;
ent_cant numeric;
ent_nnac numeric;

fecha  timestamp;

ave_nac numeric;
ave_nnac numeric;

begin

for rec in select kardcodigoingreso, kardfechaing, kardcodproducto, kardmodelo, kardcantingreso, kardtipoing, ingfecha 
           from kardex, ingreso where kardtipoing is not null and kardcodigoingreso=ingcodsx
          --group by kardcompania, kardcodproducto, kardmodelo
loop

select into ent_cant sum(entcantidad) from entrada
where entcodproducto = rec.kardcodproducto and entcodingreso=rec.kardcodigoingreso;

select into ave_nac  sum(avesaldo_pleg_nac) + sum(avesaldo_prod_nac)
from averia
where aveproducto = rec.kardcodproducto and aveingreso=rec.kardcodigoingreso;

if ave_nac is null then ave_nac:=0; end if;
if ent_cant is null then ent_cant:=0; end if;

ent_cant = ent_cant + ave_nac;

if actualiza='SI' then
    --raise notice 'Actualizando...';
    --select into fecha ingfecha from ingreso where ingcodsx=rec.kardcodigoingreso;
    if rec.ingfecha <> rec.kardfechaing then
        update ingreso set ingfecha=rec.kardfechaing where ingcodsx=rec.kardcodigoingreso;
    end if;
    update kardex set kardcantingreso=ent_cant
    where kardcodproducto=rec.kardcodproducto and kardcodigoingreso=rec.kardcodigoingreso;
end if;

for resp in 
select rec.kardcodigoingreso::numeric, rec.kardcodproducto::numeric, 
       rec.kardfechaing::date, rec.kardtipoing::varchar, ent_cant::numeric, rec.kardcantingreso::numeric
       --where ent_cant - rec.kardcantingreso <> 0
loop
return next resp;
end loop;

--end if;
end loop;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.revisa_kardex(character varying) OWNER TO usersgl;

--
-- TOC entry 164 (class 1255 OID 23924)
-- Dependencies: 787 2 533
-- Name: revisa_kardex_despachos(character varying); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION revisa_kardex_despachos(character varying) RETURNS SETOF revision_datos
    AS $_$declare
rec record;
resp record;

actualiza alias FOR $1;
kard_nac numeric;
kard_nnac numeric;

ent_nac numeric;
ent_cant numeric;
ent_nnac numeric;

fecha  timestamp;

ave_nac numeric;
ave_nnac numeric;

begin

for rec in select despcodsx, despfecha, 0::varchar as procodsx, ''::varchar as promodelo, 0.00::numeric as cantidad, 'DESPACHO'::varchar as tipo from despacho 
           where despestado::text='FINALIZADO'::text
          
loop

if actualiza='SI' then
    --raise notice 'Actualizando...';
    select into fecha kardfecha from kardex where karddespacho=rec.despcodsx limit 1;
    if fecha <> rec.despfecha then
        update despacho set despfecha=fecha where despcodsx=rec.despcodsx;
    end if;
    
    --update kardex set kardfecha=fecha, kardfechasal=fecha where karddespacho=rec.despcodsx;
end if;

for resp in 
select rec.despcodsx::numeric, rec.procodsx::numeric, 
       rec.despfecha::date, rec.tipo::varchar, rec.cantidad::numeric, rec.cantidad::numeric
       
loop
return next resp;
end loop;

--end if;
end loop;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.revisa_kardex_despachos(character varying) OWNER TO usersgl;

--
-- TOC entry 165 (class 1255 OID 23925)
-- Dependencies: 533 2 787
-- Name: revisa_kardex_nacional(character varying); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION revisa_kardex_nacional(character varying) RETURNS SETOF revision_datos
    AS $_$declare
rec record;
resp record;

actualiza alias for $1;
kard_nac numeric;
kard_nnac numeric;

fecha timestamp;

ent_nac numeric;
ent_nnac numeric;

ave_nac numeric;
ave_nnac numeric;

begin

for rec in select kardcodsx, kardcodnac, kardfechanac, kardcodproducto, kardmodelo, kardcantnac, nacfecha 
           from kardex, nacionalizacion where kardcodnac is not null and naccodsx=kardcodnac
          --group by kardcompania, kardcodproducto, kardmodelo
loop

select into ent_nac sum(nadcantidad) from nacionalizacion, nacionalizacion_detalle, entrada
where nadcodnac=rec.kardcodnac 
and naccodsx=nadcodnac and nacestado='FINALIZADO'
and entcodsx=nadentrada
and entcodproducto = rec.kardcodproducto;

select into ave_nac sum(avnsaldo) from averia_nacdet, averia, nacionalizacion_detalle
where aveproducto = rec.kardcodproducto and avnaveria=avecodsx
and avnnacdet_or=nadcodsx and nadcodnac=rec.kardcodnac 
group by nadcodnac;


if ave_nac is null then ave_nac:=0; end if;
if ent_nac is null then ent_nac:=0; end if;

ent_nac = ent_nac + ave_nac;
if actualiza='SI' then
    --select into fecha nacfecha from nacionalizacion where naccodsx=rec.kardcodnac;
    if rec.nacfecha <> rec.kardfechanac then
        update nacionalizacion set nacfecha=rec.kardfechanac where naccodsx=rec.kardcodnac;
    end if;
    
    update kardex set kardcantnac=ent_nac
    where kardcodsx=rec.kardcodsx;
end if;

for resp in 
select rec.kardcodnac::numeric, rec.kardcodproducto::numeric, 
       rec.kardfechanac::date, 'NACIONALIZACION'::varchar, ent_nac::numeric, 
       rec.kardcantnac::numeric
loop
return next resp;
end loop;

--end if;
end loop;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.revisa_kardex_nacional(character varying) OWNER TO usersgl;

--
-- TOC entry 166 (class 1255 OID 23926)
-- Dependencies: 787 2
-- Name: revision_datos(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION revision_datos() RETURNS void
    AS $$declare
rec record;
rec1 record;
temp record;
cant_kard numeric;
cant_nac numeric;
cant_des numeric;
cant_averia numeric;
ent_cant numeric;

begin

delete from revision;
-- Diferencias entre Ingresos (Traficos, devoluciones, Ajustes) vs Kardex 
for rec in SELECT  ingcodsx, ingtrafico, procodsx, promodelo, ingfecha,  ingtipo, 
           sum(entcantidad) as ent_cantidad, sum(entsaldonacf+entsaldosinnacf) as ent_saldo
           FROM entrada, producto, ingreso 
	   WHERE entcodproducto = procodsx 
           AND ingcodsx = entcodingreso
           --AND entcodproducto=148
           GROUP BY procodsx, promodelo, ingfecha, ingcodsx, ingtrafico, ingtipo
loop
	select into cant_averia sum(avesaldo_pleg_nac+avesaldo_prod_nac) as saldo
        from averia
        where aveingreso=rec.ingcodsx and aveproducto=rec.procodsx;

        if cant_averia is null then cant_averia:=0; end if; 
        
        rec.ent_cantidad := rec.ent_cantidad + cant_averia;
        rec.ent_saldo := rec.ent_saldo + cant_averia;
            
        select into cant_kard kardcantingreso::numeric from kardex where kardcodproducto = rec.procodsx and kardcodigoingreso = rec.ingcodsx limit 1;

        select into cant_nac sum(nadcantidad)::numeric from nacionalizacion, nacionalizacion_detalle, entrada, producto
		where naccodsx = nadcodnac and nadentrada = entcodsx and entcodproducto = procodsx
                and nacingreso=rec.ingcodsx and procodsx=rec.procodsx;

        select into cant_des sum(refpcantidad)::numeric from pedido, referencia_pedido, entrada, despacho_pedido, referencia_despacho, despacho
	where despacho.despestado::text = 'FINALIZADO'::text
	        and refpentrada=entcodsx and despedpedido=pedcodsx and refddespacho_pedido=despedcodsx 
	        and despacho_pedido.despeddespacho = despacho.despcodsx and refpnumpedido=pedcodsx and refpproducto=rec.procodsx
	        and refdproducto=rec.procodsx and entcodingreso=rec.ingcodsx and entcodproducto=rec.procodsx;
	
        if cant_nac is null then cant_nac=0; end if;
        if cant_des is null then cant_des=0; end if;

        cant_nac := cant_nac + cant_averia;

        if rec.ent_cantidad = rec.ent_saldo then
	   continue;
        end if;

        if rec.ingtipo='TRAFICO' then 
           if rec.ent_cantidad = cant_nac then
              if rec.ent_cantidad = cant_des + rec.ent_saldo then
                 continue; 
              end if;
           end if;
        end if;


        --if rec.ingtipo='TRAFICO' then 
          -- if rec.ent_cantidad = cant_des + rec.ent_saldo then
            --  if rec.ent_cantidad = cant_nac then
              --   continue;
--              end if;
  --         end if;
    --    end if;

        if rec.ingtipo <> 'TRAFICO' then 
           if rec.ent_cantidad = cant_des + rec.ent_saldo then
              continue;
           end if;
        end if;

        --if rec.ent_cantidad = 0 or cant_des + rec.ent_saldo <> rec.ent_cantidad then 
              
           INSERT INTO facturacion.revision 
               VALUES (rec.ingcodsx, rec.ingtrafico, rec.procodsx, rec.promodelo, rec.ingfecha, rec.ingtipo, 
                       rec.ent_cantidad, cant_nac, cant_kard, cant_des);
              --select into rec rec.ingr, rec.prod, rec.fecha, rec.tipo, rec.cant, kard.cantingreso
          -- continue;
        
         --end if;
         if rec.ingtipo = 'TRAFICO' then
            if cant_nac > 0.00 and cant_nac < cant_des then
              INSERT INTO facturacion.revision 
                VALUES (rec.ingcodsx, rec.ingtrafico, rec.procodsx, rec.promodelo, rec.ingfecha,
                        'INGRESO-NACIONAL', rec.ent_cantidad, cant_nac, 0, cant_des);           
              continue; 
            end if;
          end if;


end loop;

-- Diferencias entre Nacionalizaciones vs Kardex 

for rec in SELECT nadcodsx, naccodsx, entcodsx, procodsx, promodelo, nacfecha, 
                  nadcantidad as nac_cantidad, entcantidad as ent_cantidad
           FROM nacionalizacion_detalle, nacionalizacion, entrada, producto 
	   where naccodsx = nadcodnac and nadentrada = entcodsx and entcodproducto = procodsx
           and entcantidad <> nadcantidad
           --GROUP BY naccodsx, entcodsx, procodsx, promodelo, nacfecha  
loop
	select into cant_kard kardcantnac::numeric from kardex 
        where kardcodproducto = rec.procodsx and kardcodnac = rec.naccodsx limit 1;

	if rec.ent_cantidad <> rec.nac_cantidad then
           INSERT INTO facturacion.revision 
              VALUES (rec.nadcodsx, rec.entcodsx, rec.procodsx, rec.promodelo, rec.nacfecha,
                       'NACIONALIZACION', rec.ent_cantidad, rec.nac_cantidad, cant_kard, 0);
            
        end if;

end loop;

-- Diferencias entre Despachos vs Kardex
FOR REC IN select despcodsx, procodsx, promodelo, despfecha, sum(refdcant) as cantnac
		from producto, despacho, despacho_pedido, referencia_despacho
		where despeddespacho = despcodsx and refddespacho_pedido = despedcodsx
		and procodsx = refdproducto
		group by despcodsx, procodsx, promodelo, despfecha
LOOP

        select into cant_kard sum(kardcantsalnac)::numeric from kardex where kardcodproducto = rec.procodsx and karddespacho = rec.despcodsx limit 1;
	
        if cant_kard <> rec.cantnac then
              
            INSERT INTO facturacion.revision 
              VALUES (rec.despcodsx, 0, rec.procodsx, rec.promodelo, rec.despfecha, 'DESPACHO', rec.cantnac, 0, cant_kard, 0);
            --select into rec rec.ingr, rec.prod, rec.fecha, rec.tipo, rec.cant, kard.cantingreso
            
        end if;

end loop;

-- Diferencias entre los ingresos y las cantidades nacionalizadas.
-- FOR REC IN SELECT  ingcodsx, ingtrafico, procodsx, promodelo, ingfecha, sum(entcantidad) as cantidad FROM entrada, producto, ingreso 
-- WHERE entcodproducto = procodsx AND ingcodsx = entcodingreso AND ingtipo = 'TRAFICO' GROUP BY procodsx, promodelo, ingfecha, ingcodsx, ingtrafico
-- order by ingcodsx
-- LOOP

-- select into cant_nac sum(nadcantidad)::numeric from nacionalizacion, nacionalizacion_detalle, entrada, producto
-- where naccodsx = nadcodnac and nadentrada = entcodsx and entcodproducto = procodsx
-- and nacingreso=rec.ingcodsx and procodsx=rec.procodsx;
	
-- if cant_nac <> rec.cantidad then
             
-- INSERT INTO facturacion.revision 
-- VALUES (rec.ingcodsx, rec.ingtrafico, rec.procodsx, rec.promodelo, rec.ingfecha, 'INGRESO-NACIONAL', rec.cantidad, 0, cant_nac);           
-- end if;
--end loop;

end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.revision_datos() OWNER TO usersgl;

--
-- TOC entry 167 (class 1255 OID 23927)
-- Dependencies: 2 787
-- Name: revision_datos2(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION revision_datos2() RETURNS void
    AS $_$
declare
--prod alias for $1;
rec record;
rec1 record;
temp record;
cant_desp numeric;
cant_nac numeric;

begin

delete from revisionproducto;
-- Diferencias entre Ingresos (Traficos, devoluciones, Ajustes) vs Kardex 
for rec in SELECT  ingcodsx, procodsx, promodelo, ingtipo, sum(entcantidad) as ent_cantidad, 
                   sum(entsaldonacf + entsaldosinnacf)  as ent_saldo
           FROM entrada, producto, ingreso 
	   WHERE entcodproducto = procodsx 
           AND ingcodsx = entcodingreso 
           --AND procodsx=prod
           GROUP BY procodsx, promodelo, ingcodsx, ingtipo
           ORDER BY ingtipo, ingcodsx
loop
	cant_nac := 0;
	if rec.ingtipo = 'TRAFICO' then
                select into cant_nac sum(nadcantidad)::numeric from nacionalizacion, nacionalizacion_detalle, entrada, producto
		where naccodsx = nadcodnac and nadentrada = entcodsx and entcodproducto = procodsx
                and nacingreso=rec.ingcodsx and procodsx=rec.procodsx;

        end if;
	
        if cant_nac is null then 
           cant_nac:=0; 
        end if;
        select into cant_desp sum(refpcantidad)::numeric
	from pedido, referencia_pedido, entrada, despacho_pedido, referencia_despacho, despacho
	where refpnumpedido=pedcodsx and refpproducto=rec.procodsx
	and refpentrada=entcodsx and despedpedido=pedcodsx and refddespacho_pedido=despedcodsx 
	and despacho_pedido.despeddespacho = despacho.despcodsx and despacho.despestado::text = 'FINALIZADO'::text
	and refdproducto=rec.procodsx and entcodingreso=rec.ingcodsx 
        and entcodproducto=rec.procodsx;
              
        INSERT INTO facturacion.revisionproducto 
              VALUES (rec.procodsx, rec.promodelo, rec.ingcodsx, rec.ent_cantidad, cant_nac, 
                      cant_desp, rec.ingtipo, rec.ent_saldo);
            --select into rec rec.ingr, rec.prod, rec.fecha, rec.tipo, rec.cant, kard.cantingreso
end loop;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.revision_datos2() OWNER TO usersgl;

--
-- TOC entry 168 (class 1255 OID 23928)
-- Dependencies: 787 2
-- Name: revision_datos_ajustes(); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION revision_datos_ajustes() RETURNS void
    AS $_$
declare
--prod alias for $1;
rec record;
rec1 record;
temp record;
cant_desp numeric;
cant_nac numeric;

begin

delete from revisionproducto;
-- Diferencias entre Ingresos (Traficos, devoluciones, Ajustes) vs Kardex 
for rec in SELECT  ingcodsx, procodsx, promodelo, sum(entcantidad) as ent_cantidad, 
                   sum (entsaldonacf) as ent_saldo
           FROM entrada, producto, ingreso 
	   WHERE entcodproducto = procodsx 
           AND ingcodsx = entcodingreso AND ingtipo='AJUSTE'
           GROUP BY procodsx, promodelo, ingcodsx
           ORDER BY ingcodsx
loop
	cant_desp := 0;
	        
        select into cant_desp sum(refpcantidad)::numeric
	from pedido, referencia_pedido, entrada, despacho_pedido, referencia_despacho, despacho
	where refpnumpedido=pedcodsx 
        and refpproducto=rec.procodsx
	and refpentrada=entcodsx and despedpedido=pedcodsx and refddespacho_pedido=despedcodsx 
	and despacho_pedido.despeddespacho = despacho.despcodsx 
        and despacho.despestado::text = 'FINALIZADO'::text
	and refdproducto=rec.procodsx 
        and entcodingreso=rec.ingcodsx
        and entcodproducto=rec.procodsx;
        
        if cant_desp is null then cant_desp=0; end if;    

        INSERT INTO facturacion.revisionproducto 
              VALUES (rec.procodsx, rec.promodelo, rec.ingcodsx, rec.ent_cantidad, 0, cant_desp, 'AJUSTE', rec.ent_saldo);
            --select into rec rec.ingr, rec.prod, rec.fecha, rec.tipo, rec.cant, kard.cantingreso
end loop;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.revision_datos_ajustes() OWNER TO usersgl;

--
-- TOC entry 169 (class 1255 OID 23929)
-- Dependencies: 2 787
-- Name: revision_datos_producto(integer); Type: FUNCTION; Schema: facturacion; Owner: usersgl
--

CREATE FUNCTION revision_datos_producto(integer) RETURNS void
    AS $_$
declare
prod alias for $1;
rec record;
rec1 record;
temp record;
cant_desp numeric;
cant_nac numeric;

begin

delete from revisionproducto;
-- Diferencias entre Ingresos (Traficos, devoluciones, Ajustes) vs Kardex 
for rec in SELECT  ingcodsx, procodsx, promodelo, ingtipo, sum(entcantidad) as ent_cantidad,
                   sum(entsaldonacf+entsaldosinnacf) as saldo
           FROM entrada, producto, ingreso 
	   WHERE entcodproducto = procodsx 
           AND ingcodsx = entcodingreso AND procodsx=prod
           GROUP BY procodsx, promodelo, ingcodsx, ingtipo
           ORDER BY ingtipo, ingcodsx
loop
	cant_nac := 0;
	if rec.ingtipo = 'TRAFICO' then
                select into cant_nac sum(nadcantidad)::numeric from nacionalizacion, nacionalizacion_detalle, entrada, producto
		where naccodsx = nadcodnac and nadentrada = entcodsx and entcodproducto = procodsx
                and nacingreso=rec.ingcodsx and procodsx=rec.procodsx;

        end if;
	
        if cant_nac is null then 
           cant_nac:=0; 
        end if;
        select into cant_desp sum(refpcantidad)::numeric
	from pedido, referencia_pedido, entrada, despacho_pedido, referencia_despacho, despacho
	where refpnumpedido=pedcodsx and refpproducto=prod
	and refpentrada=entcodsx and despedpedido=pedcodsx and refddespacho_pedido=despedcodsx 
	and despacho_pedido.despeddespacho = despacho.despcodsx and despacho.despestado::text = 'FINALIZADO'::text
	and refdproducto=prod and entcodingreso=rec.ingcodsx and entcodproducto=prod;
              
        INSERT INTO facturacion.revisionproducto 
              VALUES (rec.procodsx, rec.promodelo, rec.ingcodsx, rec.ent_cantidad, cant_nac, cant_desp, rec.ingtipo, rec.saldo);
            --select into rec rec.ingr, rec.prod, rec.fecha, rec.tipo, rec.cant, kard.cantingreso
end loop;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION facturacion.revision_datos_producto(integer) OWNER TO usersgl;

SET search_path = movimiento, pg_catalog;

--
-- TOC entry 170 (class 1255 OID 23930)
-- Dependencies: 6 787
-- Name: act_kardex(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION act_kardex() RETURNS void
    AS $$/*
Trigger que se encarga de recalcular el kardex cuando se elimina uno de sus registros, es decir, cuando
se ACTIVA cualquier movimiento (ingreso, nacionalizacion o despacho).
*/
--solo se HACE EN EL DELETE 
declare
temp record;
rec record;
anterior record;
saldonac numeric(15,2);
saldonnac numeric(15,2);

pro int8;
kardproducto int8;

begin
pro =0;
kardproducto=0;

saldonac =0;
saldonnac =0;

for rec in select * from kardex order by kardcodproducto asc, kardfecha asc, kardcodsx asc
loop

kardproducto = rec.kardcodproducto;

if pro!= kardproducto then
pro = kardproducto;
saldonac =0;
saldonnac =0;
end if;


if rec.kardcodigoingreso is not null then
	-- si es tipo trafico, sumo al saldo no nacionalizado	
	if rec.kardtipoing='TRAFICO' then
	saldonnac = saldonnac + rec.kardcantingreso;
	saldonac = saldonac +0;
	else
	-- es otro tipo de ingreso, sumo al saldo nacionalizado:
	saldonnac = saldonnac + 0;
	saldonac = saldonac + rec.kardcantingreso;
	end if;
end if;

--si es una nacionalizacion
if rec.kardcodnac is not null then
	saldonnac = saldonnac - rec.kardcantnac;
	saldonac = saldonac +  rec.kardcantnac;

end if;

--si es un despacho
if rec.karddespacho is not null then
	saldonnac = saldonnac - rec.kardcantsalnnac;
	saldonac = saldonac - rec.kardcantsalnac;

end if;

--si es un ajuste de ingreso:p
if rec.kardajuste is not null then

--de ingreso:
if rec.kardtipoing='AJUSTE' then

select into temp * from ajuste where ajcodsx = rec.kardajuste;

end if;


end if;


	update kardex set kardsaldonac = saldonac, kardsaldonnac = saldonnac where kardcodsx = rec.kardcodsx;

end loop;

return;

end;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.act_kardex() OWNER TO usersgl;

--
-- TOC entry 171 (class 1255 OID 23931)
-- Dependencies: 6 787
-- Name: act_kardex_producto(bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION act_kardex_producto(bigint) RETURNS void
    AS $_$/*
Trigger que se encarga de recalcular el kardex cuando se elimina uno de sus registros, es decir, cuando
se ACTIVA cualquier movimiento (ingreso, nacionalizacion o despacho).
*/
--solo se HACE EN EL DELETE 
declare
temp record;
rec record;
anterior record;
saldonac numeric(15,2);
saldonnac numeric(15,2);

pro int8;
kardproducto int8;

begin
pro =0;
kardproducto=0;

saldonac =0;
saldonnac =0;

for rec in select * from kardex where kardcodproducto=$1 
           order by kardcodproducto asc, kardfecha asc, kardcodsx asc
loop

  kardproducto = rec.kardcodproducto;

  if pro!= kardproducto then
    pro = kardproducto;
    saldonac =0;
    saldonnac =0;
  end if;


  if rec.kardcodigoingreso is not null then
	-- si es tipo trafico, sumo al saldo no nacionalizado	
	if rec.kardtipoing='TRAFICO' then
	saldonnac = saldonnac + rec.kardcantingreso;
	saldonac = saldonac +0;
	else
	-- es otro tipo de ingreso, sumo al saldo nacionalizado:
	saldonnac = saldonnac + 0;
	saldonac = saldonac + rec.kardcantingreso;
	end if;
  end if;

--si es una nacionalizacion
  if rec.kardcodnac is not null then
	saldonnac = saldonnac - rec.kardcantnac;
	saldonac = saldonac +  rec.kardcantnac;

  end if;

--si es un despacho
  if rec.karddespacho is not null then
	saldonnac = saldonnac - rec.kardcantsalnnac;
	saldonac = saldonac - rec.kardcantsalnac;

  end if;

--si es un ajuste de ingreso:p
  if rec.kardajuste is not null then

--de ingreso:
    if rec.kardtipoing='AJUSTE' then

    select into temp * from ajuste where ajcodsx = rec.kardajuste;

    end if;
  end if;
  update kardex set kardsaldonac = saldonac, kardsaldonnac = saldonnac where kardcodsx = rec.kardcodsx;

end loop;

return;

end;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.act_kardex_producto(bigint) OWNER TO usersgl;

--
-- TOC entry 172 (class 1255 OID 23932)
-- Dependencies: 787 6
-- Name: act_nacdet(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION act_nacdet() RETURNS void
    AS $$declare
rec record;
respaldado numeric(15,2);

begin

for rec in select * from nacionalizacion_detalle 
loop

select into respaldado sum(refpcantidad) from referencia_pedido where refpnacdetalle = rec.nadcodsx;

if respaldado is null then respaldado =0; end if;

update nacionalizacion_detalle set nadcantidad = respaldado + nadsaldo where nadcodsx = rec.nadcodsx;




end loop;

return;

end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.act_nacdet() OWNER TO usersgl;

--
-- TOC entry 173 (class 1255 OID 23933)
-- Dependencies: 787 6
-- Name: actualizar_pesos_valor_trafico(bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION actualizar_pesos_valor_trafico(bigint) RETURNS void
    AS $_$DECLARE
traf record;
ref_traf RECORD; -- registro de referencia_trafico
pesoneto numeric;
pesobruto numeric;
fob numeric; 
cif numeric; 
cant numeric;

BEGIN
pesoneto=0;
pesobruto=0;
fob=0;
cif=0;
cant=0;

select into traf * from trafico where trafcodsx = $1;

select into pesoneto sum(reftpesonetototal) from referencia_trafico, factura_trafico where reftnumfacturatrafico= ftrafcodsx
and ftrafnumtrafico = $1;

select into pesobruto sum(reftpesobrutototal) from referencia_trafico, factura_trafico where reftnumfacturatrafico= ftrafcodsx
and ftrafnumtrafico = $1;

select into fob sum(reftfobtotal) from referencia_trafico, factura_trafico where reftnumfacturatrafico= ftrafcodsx
and ftrafnumtrafico = $1;

select into cant sum(reftcantidad) from referencia_trafico, factura_trafico where 
reftnumfacturatrafico= ftrafcodsx
and ftrafnumtrafico = $1;

update trafico set traffob = fob, trafcif = fob + traf.traffletesseguro , trafpesoneto = pesoneto, trafpesobruto= pesobruto, trafcantidad= cant
where trafcodsx = $1;

RETURN;

END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.actualizar_pesos_valor_trafico(bigint) OWNER TO usersgl;

--
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 173
-- Name: FUNCTION actualizar_pesos_valor_trafico(bigint); Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON FUNCTION actualizar_pesos_valor_trafico(bigint) IS 'Trigger que se encarga de actualizar los campos de valorFOB, valorCIF, peso neto, peso bruto y cantidad total de items.
Esta funcion es llamada desde los triggers de gestion de trafico
';


--
-- TOC entry 174 (class 1255 OID 23934)
-- Dependencies: 787 6
-- Name: actualizar_saldo_fisico_ingreso(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION actualizar_saldo_fisico_ingreso() RETURNS "trigger"
    AS $$declare


begin

if TG_RELNAME='ingreso' then

if TG_OP='UPDATE' then

--finalizo, seteo el saldo fisico
if new.ingestado='FINALIZADO' and old.ingestado='TRAMITE' then

if new.ingtipo ='TRAFICO' then
update entrada set entsaldosinnacf = entcantidad, entsaldonacf = 0 where entcodingreso = new.ingcodsx;
else
update entrada set entsaldosinnacf =0, entsaldonacf = entcantidad where entcodingreso = new.ingcodsx;
end if;

end if;


--activo, quito el saldo fisico
if new.ingestado='TRAMITE' and old.ingestado='FINALIZADO' then

update entrada set entsaldosinnacf = 0, entsaldonacf =0 where entcodingreso = new.ingcodsx;

End if;






end if;


end if;

if TG_OP='DELETE' then
return old;
else
return new;
end if;


end;

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.actualizar_saldo_fisico_ingreso() OWNER TO usersgl;

--
-- TOC entry 175 (class 1255 OID 23935)
-- Dependencies: 787 546 6
-- Name: calculokilovolumen(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION calculokilovolumen() RETURNS SETOF kilo_volumen
    AS $$declare
rec record;
resp record;
kilovolumen numeric;

begin

for rec in select * from pedido where pedcompania=1 and pednumpedido like '%%M9%%' and length(pednumpedido)=6 order by pednumpedido
loop

select into kilovolumen round(sum(prokilovolumen*refpcantidad),2) as kilovol 
from referencia_pedido,producto 
where procodsx=refpproducto and refpnumpedido=rec.pedcodsx;

for resp in select rec.pednumpedido, kilovolumen
loop
return next resp;
end loop;

end loop;

end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.calculokilovolumen() OWNER TO usersgl;

--
-- TOC entry 176 (class 1255 OID 23936)
-- Dependencies: 787 6
-- Name: causal_pedido(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION causal_pedido() RETURNS "trigger"
    AS $$--trigger que se encarga de actualizar el "causal hit" de un pedido...
--se actualiza cada vez que se inserta un causal de pedido hit nuevo / diferente y cuando
--se registran los datos del pedido

declare
rec record;

begin

if TG_RELNAME='pedido' then

select into rec * from causal_hit where cauhcodsx = new.pedcausal_hit;
if TG_OP='INSERT'  then
insert into causal_pedido(cauppedido, caupcausal, caupdesccausal,caupfecha)
values
	(new.pedcodsx, rec.cauhcodsx, rec.cauhdesc, now() );
end if; --insert


IF TG_OP='UPDATE' THEN

--miro si el causal hit nuevo es diferente al viejo para actualizarlo
if new.pedcausal_hit!=old.pedcausal_hit then 

select into rec * from causal_hit where cauhcodsx = new.pedcausal_hit;
	insert into causal_pedido(cauppedido, caupcausal, caupdesccausal,caupfecha)
values
	(new.pedcodsx, rec.cauhcodsx, rec.cauhdesc, now() );

end if;


end if; --update

end if;





if TG_OP='DELETE' then
	return old;
else 
	return new;
end if;

end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.causal_pedido() OWNER TO usersgl;

--
-- TOC entry 177 (class 1255 OID 23937)
-- Dependencies: 787 6 535
-- Name: consolidado_despacho(bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION consolidado_despacho(bigint) RETURNS SETOF consolidado_despacho
    AS $_$declare
rec record;
desp alias for $1;
begin

for rec in
	select 
	promodelo::varchar, prodescripcion::varchar, 'NACIONALIZACION'::varchar as tipo,  nacconsec::varchar,
	nacconseczfp::varchar, trafembarque, trafdocumento, ingconsec::varchar, 
	ingconseczfp::varchar,
	sum(referencia_despacho_pedido.refdcant) as cantidad,
	sum(referencia_despacho_pedido.refdvalortotal) as valor,
	sum(referencia_despacho_pedido.refdpesobrutototal) as pesobruto
	from
	despacho, despacho_pedido, referencia_despacho, referencia_despacho_pedido,referencia_pedido, pedido, producto --, entrada, ingreso, trafico, producto
	, nacionalizacion, nacionalizacion_detalle, ingreso, trafico
	where 
	despcodsx = despeddespacho and despedcodsx = refddespacho_pedido and refdcodsx = refdpcodrefd and refdcodrefp = refpcodsx
	and refpnumpedido = pedcodsx and refpproducto = procodsx
	and refpnacdetalle is not null
	and refpnacdetalle = nadcodsx and nadcodnac = naccodsx
	and nacingreso = ingcodsx and ingtrafico = trafcodsx
	and despcodsx = desp
	group by promodelo, prodescripcion,   nacconsec, nacconseczfp , trafembarque, trafdocumento, ingconsec, ingconseczfp
order by trafembarque asc
loop

return next rec;

end loop;

for rec in
	select 
	promodelo::varchar, prodescripcion::varchar,  ingtipo::varchar , 
	ingconsec::varchar, ingconseczfp::varchar,''::varchar,''::varchar,
	''::varchar,''::varchar,
	sum(referencia_despacho_pedido.refdcant) as cantidad,
	sum(referencia_despacho_pedido.refdvalortotal) as valor,
	sum(referencia_despacho_pedido.refdpesobrutototal) as pesobruto
	from
	despacho, despacho_pedido, referencia_despacho, referencia_despacho_pedido,referencia_pedido, pedido, producto --, entrada, ingreso, trafico, producto
	,ingreso, entrada
	where 
	despcodsx = despeddespacho and despedcodsx = refddespacho_pedido and refdcodsx = refdpcodrefd and refdcodrefp = refpcodsx
	and refpnumpedido = pedcodsx and refpproducto = procodsx
	and refpnacdetalle is null
	and refpentrada = entcodsx and entcodingreso = ingcodsx
	and despcodsx = desp

	group by promodelo, prodescripcion,   ingconsec, ingconseczfp, ingtipo

loop
	return next rec;

end loop;


end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.consolidado_despacho(bigint) OWNER TO usersgl;

--
-- TOC entry 178 (class 1255 OID 23938)
-- Dependencies: 6 787
-- Name: crear_ingresos(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION crear_ingresos() RETURNS void
    AS $$declare
rec record;

begin


for rec in select * from trafico 
	loop

insert into ingreso(ingcodcia, ingfecha, ingtipo, ingtrafico, ingobservacion, ingestado)
	values
	( 1, rec.traffechacreacion ,'TRAFICO', rec.trafcodsx, 'TRAFICO CREADO EN LA MIGRACION', 'FINALIZADO'  );


end loop;
return;

end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.crear_ingresos() OWNER TO usersgl;

--
-- TOC entry 179 (class 1255 OID 23939)
-- Dependencies: 6 787
-- Name: crear_kardex(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION crear_kardex() RETURNS void
    AS $$declare
rec record;
nac numeric;
nnac numeric;
pro int8;

antnac numeric;
antnnac numeric;

begin

pro =0;
nac =0;
nnac =0;
antnac =0;
antnnac =0;


for rec in select * from kardex order by  kardcodproducto, KARDFECHA  asc, kardcodsx asc 

loop
    
--cuando el producto cambia pongo todo en ceros
if pro != rec.kardcodproducto then
pro = rec.kardcodproducto;
nac =0;
nnac =0;
antnac =0;
antnnac =0;
end if;

	select into nac sum(entsaldonacf) from entrada where entcodproducto= rec.kardcodproducto and
	entcodingreso = rec.kardcodigoingreso;

	select into nnac sum(entsaldosinnacf) from entrada where entcodproducto= rec.kardcodproducto and
	entcodingreso = rec.kardcodigoingreso;
if nac is null then nac=0; end if;
if nnac is null then nnac=0; end if;

antnac = antnac + nac;
antnnac = antnnac + nnac;

update kardex set kardsaldonac = kardsaldonac + antnac , 
	kardsaldonnac = kardsaldonnac + antnnac where kardcodsx = rec.kardcodsx;




end loop;

return;

end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.crear_kardex() OWNER TO usersgl;

--
-- TOC entry 180 (class 1255 OID 23940)
-- Dependencies: 787 6
-- Name: crear_nacdetalle(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION crear_nacdetalle() RETURNS void
    AS $$declare
rec record;

begin


for rec in select * from nacionalizacion_detalle2
	loop

raise notice 'nac: %',rec.nadcodnac;
raise notice 'entrada: %',rec.nadentrada;
insert into nacionalizacion_detalle(nadcodnac, nadentrada, nadcantidad, nadsaldo, nadpesoneto,nadpesonetototal, nadpesobruto, 
nadpesobrutototal,nadfob, nadfobtotal)
	values
	( rec.nadcodnac::text::int, rec.nadentrada::text::int, rec.nadcantidad, rec.nadsaldo, rec.nadpesoneto,rec.nadpesonetototal, rec.nadpesobruto, 
	rec.nadpesobrutototal, rec.nadfob, rec.nadfobtotal );


end loop;
return;

end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.crear_nacdetalle() OWNER TO usersgl;

--
-- TOC entry 181 (class 1255 OID 23941)
-- Dependencies: 6 787
-- Name: crear_nacionalizacion(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION crear_nacionalizacion() RETURNS void
    AS $$declare
rec record;

begin


for rec in select * from nacionalizacion2
	loop

raise notice 'fecha:%',rec.nacfecha;
raise notice 'ingreso:%',rec.nacingreso;
raise notice 'dec:%',rec.nacdeclaracion;

insert into nacionalizacion(nacempresa, nacfecha, nacingreso, nacestado, nacdeclaracion, nacfechadeclaracion, nacfechaingresobodega, 
			nacpaginainicial, nacpaginafinal, nacdosia, nacobservaciones, nactipo	)
	values
	( 1, rec.nacfecha ,rec.nacingreso::text::int, 'FINALIZADO',  rec.nacdeclaracion, rec.nacfechadeclaracion, rec.nacfechadeclaracion, 
			rec.nacpaginainicial, rec.nacpaginafinal, rec.nacdosia, 'NACIONALIZACION CREADA EN MIGRACION', 'REFERENCIA' );


end loop;
return;

end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.crear_nacionalizacion() OWNER TO usersgl;

--
-- TOC entry 182 (class 1255 OID 23942)
-- Dependencies: 6 787
-- Name: descomprometer_packing(bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION descomprometer_packing(bigint) RETURNS integer
    AS $_$declare
packpcodsx alias for $1;

pack record;
packdet record;
packdp record;
ent record;
nacdet record;

saldosinnac numeric;
saldonac numeric;
cantidad numeric; 

begin


for packdp in 
	select packing_detalle_posicion.* from packing_detalle_posicion, packing_detalle
	where packppackingdet = packdcodsx  and packdpacking=packpcodsx
	and packpsaldo>0
loop

select into nacdet * from nacionalizacion_detalle where nadcodsx = packdp.packpnacdetalle;
select into ent * from entrada where entcodsx = packdp.packpentrada;

saldonac = ent.entsaldonac;
cantidad = packdp.packpsaldo;
--actualizo la entrada, solo el saldo del sistema por q el fisico no se ha tocado
update entrada set entsaldonac = ( saldonac  + cantidad )where 	entcodsx = ent.entcodsx;
--actualizo la nacionalizaciondetalle:
saldonac = nacdet.nadsaldo;
if nacdet.nadcodsx is not null then
update nacionalizacion_detalle set nadsaldo = (saldonac + cantidad) where nadcodsx = nacdet.nadcodsx;
end if;

update packing_detalle_posicion set packpsaldo=0 where packing_detalle_posicion.packpcodsx = packdp.packpcodsx;

end loop;


return 1;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.descomprometer_packing(bigint) OWNER TO usersgl;

--
-- TOC entry 183 (class 1255 OID 23943)
-- Dependencies: 787 6
-- Name: descuadre_entnac(bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION descuadre_entnac(bigint) RETURNS numeric
    AS $_$declare
rec record;
resp record;

ent_nac numeric;
nac_nac numeric;

ent_nac_tmp numeric;
nac_nac_tmp numeric;


begin

ent_nac_tmp = 0;
nac_nac_tmp = 0;

for rec in select * from entrada where entcodproducto=$1 and entsaldonacf>0
loop

select into ent_nac entsaldonac from entrada
where entcodsx = rec.entcodsx;

select into nac_nac nadsaldo 
from nacionalizacion_detalle
where nadentrada = rec.entcodsx;

ent_nac_tmp = ent_nac_tmp + ent_nac;
nac_nac_tmp = nac_nac_tmp + nac_nac;

raise notice ' Entrada:%',rec.entcodsx;
raise notice ' entsaldonac = % - nadsaldo = %', ent_nac,nac_nac;

end loop;

raise notice ' SaldoNacTotal = % - NacionalizacionTotal = %',ent_nac_tmp,nac_nac_tmp;


--if ent_nac!=nac_nac then

--for resp in 
--select rec.entcodsx, ent_nac_tmp, nac_nac_tmp
--loop
--return next resp;
--return;
--end loop;
--end if;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.descuadre_entnac(bigint) OWNER TO usersgl;

--
-- TOC entry 184 (class 1255 OID 23944)
-- Dependencies: 6 787
-- Name: descuadre_entnac1(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION descuadre_entnac1() RETURNS numeric
    AS $$declare
rec record;

ent_nac numeric;
nac_nac numeric;
nac_SaldoNac numeric;

ent_nac_tmp numeric;
nac_nac_tmp numeric;

entcodproductonew numeric;
entcodproductoold numeric;

begin

entcodproductonew=0;
entcodproductoold=0;

ent_nac_tmp=0;
nac_nac_tmp=0;

for rec in select * from entrada where entsaldonacf>0
loop

select into ent_nac entsaldonac from entrada
where entcodsx = rec.entcodsx;

select into nac_nac sum(nadsaldo) 
from nacionalizacion_detalle
where nadentrada = rec.entcodsx;

--ent_nac_tmp = ent_nac;
nac_nac_tmp = nac_nac_tmp + nac_nac;

if entcodproductonew!=0 then
    entcodproductonew = rec.entcodproducto;
    if entcodproductonew = entcodproductoold then
        ent_nac_tmp  = ent_nac;
        nac_SaldoNac = nac_SaldoNac + nac_nac_tmp;
    else 
        raise notice ' Producto:%',entcodproductoold;
	raise notice ' entsaldonac = % - nadsaldo = %', ent_nac_tmp, nac_SaldoNac;
        ent_nac_tmp=0;
        nac_SaldoNac=0;
        entcodproductoold = rec.entcodproducto;
        ent_nac_tmp  = ent_nac;
        nac_SaldoNac = nac_SaldoNac + nac_nac_tmp;
    end if;
else
    entcodproductoold = rec.entcodproducto;
end if;

--return;

end loop;

end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.descuadre_entnac1() OWNER TO usersgl;

--
-- TOC entry 185 (class 1255 OID 23945)
-- Dependencies: 6 787
-- Name: descuadre_entnac_bat(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION descuadre_entnac_bat() RETURNS numeric
    AS $$declare
rec  record;
recp record;
resp record;

ent_nac numeric;
nac_nac numeric;

ent_nac_tmp numeric;
nac_nac_tmp numeric;


begin

ent_nac_tmp = 0;
nac_nac_tmp = 0;

for recp in select procodsx from producto where procodigocia='76'
loop

for rec in select * from entrada, nacionalizacion_detalle where entcodsx=nadentrada and entcodproducto=recp.procodsx and (entsaldonacf>0 or nadsaldo>0)
loop

select into ent_nac entsaldonac from entrada
where entcodsx = rec.entcodsx;

select into nac_nac sum(nadsaldo) 
from nacionalizacion_detalle
where nadentrada = rec.entcodsx;

ent_nac_tmp = ent_nac_tmp + ent_nac;
nac_nac_tmp = nac_nac_tmp + nac_nac;

raise notice ' Entrada:%',rec.entcodsx;
raise notice ' entsaldonac = % - nadsaldo = %', ent_nac,nac_nac;

end loop;
end loop;

raise notice ' SaldoNacTotal = % - NacionalizacionTotal = %',ent_nac_tmp,nac_nac_tmp;


--if ent_nac!=nac_nac then

--for resp in 
--select rec.entcodsx, ent_nac_tmp, nac_nac_tmp
--loop
--return next resp;
--return;
--end loop;
--end if;

end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.descuadre_entnac_bat() OWNER TO usersgl;

--
-- TOC entry 186 (class 1255 OID 23946)
-- Dependencies: 787 6 543
-- Name: descuadre_kardex(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION descuadre_kardex() RETURNS SETOF indicador_zonas_valorizado
    AS $$declare
rec record;
resp record;

kard_nac numeric;
kard_nnac numeric;

ent_nac numeric;
ent_nnac numeric;

ave_nac numeric;
ave_nnac numeric;

begin

for rec in select kardcompania , kardcodproducto, kardmodelo from kardex group by kardcompania, kardcodproducto, kardmodelo
loop

select into ent_nac, ent_nnac  sum(entsaldonacf), sum(entsaldosinnacf) from entrada
where entcodproducto = rec.kardcodproducto;
raise notice ' Producto:%',rec.kardcodproducto;

select into ave_nac, ave_nnac  sum(avesaldo_pleg_nac) + sum(avesaldo_prod_nac), sum(avesaldo_pleg_nnac) + sum(avesaldo_prod_nnac)
from averia
where aveproducto = rec.kardcodproducto;

ent_nac = ent_nac + ave_nac;
ent_nnac = ent_nnac + ave_nnac;


select into kard_nac, kard_nnac kardsaldonac, kardsaldonnac from kardex where kardcodproducto = rec.kardcodproducto
order by kardfecha desc , kardcodsx  desc limit 1;

if ent_nac!=kard_nac or ent_nnac != kard_nnac then

for resp in 
select rec.kardmodelo, ent_nac, kard_nac, ent_nac-kard_nac, ent_nnac, kard_nnac, ent_nnac-kard_nnac, 0.00
loop
return next resp;
end loop;

end if;
end loop;



end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.descuadre_kardex() OWNER TO usersgl;

--
-- TOC entry 187 (class 1255 OID 23947)
-- Dependencies: 554 6 787
-- Name: fc_get_inventario_resumido(integer, timestamp without time zone); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION fc_get_inventario_resumido(integer, timestamp without time zone) RETURNS SETOF tp_resumido
    AS $_$
   DECLARE
   result   RECORD;
   result2  RECORD;
   result3  RECORD;
   list    movimiento.tp_resumido;
   idporoducto  ALIAS FOR $1;
   fecha_final  ALIAS FOR $2;
   BEGIN
      SELECT  INTO result
      CASE WHEN  kardex.kardsaldonac  IS NULL THEN 0 ELSE kardex.kardsaldonac  END  ,
      CASE WHEN  kardex.kardsaldonnac IS NULL THEN 0 ELSE kardex.kardsaldonnac END
      FROM   movimiento.kardex
      WHERE  kardcodproducto = idporoducto AND
             kardfecha <= fecha_final
       ORDER BY  kardfecha DESC, kardcodsx DESC
       limit 1;
     
      --SELECT INTO result2
      --CASE  WHEN movimiento.averia.avesaldo_pleg_nac IS NULL THEN 0 ELSE movimiento.averia.avesaldo_pleg_nac END,
      --CASE  WHEN movimiento.averia.avesaldo_prod_nac IS NULL THEN 0 ELSE movimiento.averia.avesaldo_prod_nac  END
      --FROM  movimiento.averia
      --WHERE aveproducto=idporoducto AND
      --      avefecha<=fecha_final
      --ORDER BY avefecha DESC, avecodsx DESC limit 1;

	SELECT INTO result2
	CASE WHEN sum(movimiento.averia.avesaldo_pleg_nac) IS NULL THEN 0 ELSE sum(movimiento.averia.avesaldo_pleg_nac) END as avesaldo_pleg_nac,
        CASE WHEN sum(movimiento.averia.avesaldo_prod_nac) IS NULL THEN 0 ELSE sum(movimiento.averia.avesaldo_prod_nac) END as avesaldo_prod_nac
        FROM  movimiento.averia
        WHERE aveproducto=idporoducto AND
              avefecha<=fecha_final LIMIT 1;

      --SELECT INTO result3
      --CASE  WHEN movimiento.entrada.entsaldonac IS NULL THEN 0 ELSE movimiento.entrada.entsaldonac END
      --,CASE  WHEN movimiento.entrada.entsaldonacf  IS NULL THEN 0 ELSE movimiento.entrada.entsaldonacf  END
      --FROM  movimiento.entrada
      --WHERE entcodproducto=idporoducto AND
      --      entfecha<=fecha_final
      --ORDER BY entfecha DESC, entcodsx DESC limit 1;

	SELECT INTO result3
	CASE WHEN sum(movimiento.entrada.entsaldonac) IS NULL THEN 0 ELSE sum(movimiento.entrada.entsaldonac) END as entsaldonac, 
	CASE WHEN sum(movimiento.entrada.entsaldonacf)IS NULL THEN 0 ELSE sum(movimiento.entrada.entsaldonacf)END as entsaldonacf
	FROM movimiento.entrada
	WHERE entcodproducto=idporoducto AND
	      entfecha<=fecha_final LIMIT 1;

     -- RAISE NOTICE '%',result.kardsaldonac;
      list.kardsaldonac=result.kardsaldonac;
      list.kardsaldonnac=result.kardsaldonnac;

      list.avesaldo_pleg_nac=result2.avesaldo_pleg_nac;
      list.avecant_prod_nac =result2.avesaldo_prod_nac;

      list.entsaldonac=result3.entsaldonac;
      list.entsaldonacf =result3.entsaldonacf;

      RETURN next list;
   END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.fc_get_inventario_resumido(integer, timestamp without time zone) OWNER TO usersgl;

--
-- TOC entry 188 (class 1255 OID 23948)
-- Dependencies: 6 787
-- Name: get_total_pedidos_hit(bigint, timestamp with time zone, timestamp with time zone, bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION get_total_pedidos_hit(bigint, timestamp with time zone, timestamp with time zone, bigint) RETURNS bigint
    AS $_$declare
compania ALIAS FOR $1;
dia_ini ALIAS FOR $2;
dia_fin ALIAS FOR $3;
hit ALIAS FOR $4;
resultado int8;

begin

select into resultado count(1)  from causal_pedido, pedido where 
pedcodsx = cauppedido and 
pedcompania = compania  and pedfechasistema>=dia_ini and 
pedfechasistema<= dia_fin and caupcausal =hit and  pedestado='FINALIZADO';

return resultado;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.get_total_pedidos_hit(bigint, timestamp with time zone, timestamp with time zone, bigint) OWNER TO usersgl;

--
-- TOC entry 3027 (class 0 OID 0)
-- Dependencies: 188
-- Name: FUNCTION get_total_pedidos_hit(bigint, timestamp with time zone, timestamp with time zone, bigint); Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON FUNCTION get_total_pedidos_hit(bigint, timestamp with time zone, timestamp with time zone, bigint) IS 'Funcion que retorna el total de pedidos HIT en un rango de fechas segun el tipo de indicador HIT';


--
-- TOC entry 189 (class 1255 OID 23949)
-- Dependencies: 6 787
-- Name: get_total_pedidos_hora_semana(bigint, timestamp without time zone, timestamp without time zone, time without time zone, time without time zone); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION get_total_pedidos_hora_semana(bigint, timestamp without time zone, timestamp without time zone, time without time zone, time without time zone) RETURNS bigint
    AS $_$declare
compania ALIAS FOR $1;
dia_ini ALIAS FOR $2;
dia_fin ALIAS FOR $3;
hora_ini ALIAS FOR $4;
hora_fin ALIAS FOR $5;
resultado int8;

begin

select into resultado count(1)  from pedido where pedcompania = compania  and pedfechasistema>=dia_ini and 
pedfechasistema<= dia_fin and pedhora >=hora_ini and pedhora <=hora_fin and pedestado='FINALIZADO';

return resultado;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.get_total_pedidos_hora_semana(bigint, timestamp without time zone, timestamp without time zone, time without time zone, time without time zone) OWNER TO usersgl;

--
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 189
-- Name: FUNCTION get_total_pedidos_hora_semana(bigint, timestamp without time zone, timestamp without time zone, time without time zone, time without time zone); Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON FUNCTION get_total_pedidos_hora_semana(bigint, timestamp without time zone, timestamp without time zone, time without time zone, time without time zone) IS 'Funcion que entrega el total de pedidos realizado en un rango de fecha y rango de horas para una compania determinada';


--
-- TOC entry 190 (class 1255 OID 23950)
-- Dependencies: 787 6
-- Name: get_total_pedidos_hora_semana_zona(bigint, timestamp without time zone, timestamp without time zone, time without time zone, time without time zone, bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION get_total_pedidos_hora_semana_zona(bigint, timestamp without time zone, timestamp without time zone, time without time zone, time without time zone, bigint) RETURNS bigint
    AS $_$declare
compania ALIAS FOR $1;
dia_ini ALIAS FOR $2;
dia_fin ALIAS FOR $3;
hora_ini ALIAS FOR $4;
hora_fin ALIAS FOR $5;
zona ALIAS FOR $6;

resultado int8;

begin

select into resultado count(1)  from pedido where pedcompania = compania  and pedfechasistema>=dia_ini and 
pedfechasistema<= dia_fin and pedhora >=hora_ini and pedhora <=hora_fin and pedzona= zona AND PEDESTADO='FINALIZADO';

return resultado;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.get_total_pedidos_hora_semana_zona(bigint, timestamp without time zone, timestamp without time zone, time without time zone, time without time zone, bigint) OWNER TO usersgl;

--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 190
-- Name: FUNCTION get_total_pedidos_hora_semana_zona(bigint, timestamp without time zone, timestamp without time zone, time without time zone, time without time zone, bigint); Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON FUNCTION get_total_pedidos_hora_semana_zona(bigint, timestamp without time zone, timestamp without time zone, time without time zone, time without time zone, bigint) IS 'Funcion que entrega el total de pedidos realizado en un rango de fecha y rango de horas para una compania determinada en una ZON geografica definida';


--
-- TOC entry 191 (class 1255 OID 23951)
-- Dependencies: 6 787 536
-- Name: indicador_devoluciones_causal(bigint, timestamp with time zone, timestamp with time zone, bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION indicador_devoluciones_causal(bigint, timestamp with time zone, timestamp with time zone, bigint) RETURNS SETOF indic_dev_causal
    AS $_$declare
compania ALIAS FOR $1;
fecha_ini ALIAS FOR $2;
fecha_fin ALIAS FOR $3;
cod_cliente ALIAS FOR $4;

rec record;
res record;
total numeric;
totalcant_averia numeric;
cant numeric;
cant_averia numeric;
porc numeric;

begin
--calculo primero el total de devoluciones del cliente
select into total sum(ingcantidad) from ingreso where ingtipo='DEVOLUCION' 
and ingcodcia=compania and ingestado='FINALIZADO' 
and ingfecha >=fecha_ini and ingfecha <=fecha_fin and ingcli_devolucion = cod_cliente;

-- calculo total de devoluciones en averias
select INTO totalcant_averia sum(avesaldo_pleg_nac+avesaldo_prod_nac) 
from ingreso, averia
where ingtipo='DEVOLUCION' 
and ingfecha >=fecha_ini and ingfecha <=fecha_fin
and ingcli_devolucion = cod_cliente
and aveingreso=ingcodsx and ingcodcia=compania;

IF total is null then total=0; end if;
IF totalcant_averia is null then totalcant_averia=0; end if;

for rec in select * from causal  ORDER BY CAUCODSX LOOP

SELECT into cant sum(ingcantidad) 
from ingreso where ingtipo='DEVOLUCION' and ingcodcia=compania and ingestado='FINALIZADO' 
and ingcausal= rec.caucodsx and ingfecha >=fecha_ini and ingfecha <=fecha_fin 
and ingcli_devolucion = cod_cliente;

select INTO cant_averia sum(avesaldo_pleg_nac+avesaldo_prod_nac) 
from ingreso, averia
where ingtipo='DEVOLUCION' 
and ingfecha >=fecha_ini and ingfecha <=fecha_fin
and ingcli_devolucion = cod_cliente
and aveingreso=ingcodsx and ingcodcia=compania
and ingcausal= rec.caucodsx;

IF cant is null then cant=0; end if;
IF cant_averia is null then cant_averia=0; end if;
if total + totalcant_averia = 0 then 
	porc =0;
else 
	porc = ((cant+cant_averia) /(total + totalcant_averia))* 100;
end if; 
for res in 
select rec.caucodsx::int8, rec.caudesc, cant+cant_averia, porc where cant+cant_averia > 0
LOOP
	return next res;
end loop;

END LOOP;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.indicador_devoluciones_causal(bigint, timestamp with time zone, timestamp with time zone, bigint) OWNER TO usersgl;

--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 191
-- Name: FUNCTION indicador_devoluciones_causal(bigint, timestamp with time zone, timestamp with time zone, bigint); Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON FUNCTION indicador_devoluciones_causal(bigint, timestamp with time zone, timestamp with time zone, bigint) IS 'Funcion que retorna los datos con los que se obtiene el reporte de devoluciones x causal que son: causal, fob, cantidad y porcentaje ';


--
-- TOC entry 192 (class 1255 OID 23952)
-- Dependencies: 536 6 787
-- Name: indicador_devoluciones_causal_compania(bigint, timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION indicador_devoluciones_causal_compania(bigint, timestamp with time zone, timestamp with time zone) RETURNS SETOF indic_dev_causal
    AS $_$declare
compania ALIAS FOR $1;
fecha_ini ALIAS FOR $2;
fecha_fin ALIAS FOR $3;


rec record;
res record;
total numeric;
totalcant_averia numeric;
cant numeric;
cant_averia numeric;
porc numeric;

begin
--calculo primero el total de devoluciones del cliente
select into total sum(ingcantidad) from ingreso where ingtipo='DEVOLUCION' 
and ingcodcia=compania and ingestado='FINALIZADO' 
and ingfecha >=fecha_ini and ingfecha <=fecha_fin;

-- calculo total de devoluciones en averias
select INTO totalcant_averia sum(avesaldo_pleg_nac+avesaldo_prod_nac) 
from ingreso, averia
where ingtipo='DEVOLUCION' 
and ingfecha >=fecha_ini and ingfecha <=fecha_fin
and aveingreso=ingcodsx and ingcodcia=compania;

IF total is null then total=0; end if;
IF totalcant_averia is null then totalcant_averia=0; end if;

for rec in select * from causal  ORDER BY CAUCODSX LOOP

SELECT into cant sum(ingcantidad) 
from ingreso where ingtipo='DEVOLUCION' and ingcodcia=compania and ingestado='FINALIZADO' 
and ingcausal= rec.caucodsx and ingfecha >=fecha_ini and ingfecha <=fecha_fin;

select INTO cant_averia sum(avesaldo_pleg_nac+avesaldo_prod_nac) 
from ingreso, averia
where ingtipo='DEVOLUCION' 
and ingfecha >=fecha_ini and ingfecha <=fecha_fin
and aveingreso=ingcodsx and ingcodcia=compania
and ingcausal= rec.caucodsx;

IF cant is null then cant=0; end if;
IF cant_averia is null then cant_averia=0; end if;
if total + totalcant_averia = 0 then 
	porc =0;
else 
	porc = ((cant+cant_averia) /(total + totalcant_averia))* 100;
end if; 
for res in 
select rec.caucodsx::int8, rec.caudesc, cant+cant_averia, porc where cant+cant_averia > 0
LOOP
	return next res;
end loop;

END LOOP;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.indicador_devoluciones_causal_compania(bigint, timestamp with time zone, timestamp with time zone) OWNER TO usersgl;

--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 192
-- Name: FUNCTION indicador_devoluciones_causal_compania(bigint, timestamp with time zone, timestamp with time zone); Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON FUNCTION indicador_devoluciones_causal_compania(bigint, timestamp with time zone, timestamp with time zone) IS 'Funcion que retorna los datos con los que se obtiene el reporte de devoluciones x causal   POR COMPANIA que son: causal, fob, cantidad y porcentaje ';


--
-- TOC entry 193 (class 1255 OID 23953)
-- Dependencies: 6 787 537
-- Name: indicador_devoluciones_cliente(bigint, timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION indicador_devoluciones_cliente(bigint, timestamp with time zone, timestamp with time zone) RETURNS SETOF indic_dev_cliente
    AS $_$declare
compania ALIAS FOR $1;
fecha_ini ALIAS FOR $2;
fecha_fin ALIAS FOR $3;
rec record;
res record;
totalcant numeric;
totalcant_averia numeric;
begin
--calculo primero el total de devoluciones ($fob) en ingresos
select sum(ingcantidad)  into totalcant from ingreso where ingtipo='DEVOLUCION' 
and ingcodcia=compania and ingestado='FINALIZADO' 
and ingfecha >=fecha_ini and ingfecha <=fecha_fin;

-- calculo total de devoluciones en averias
select INTO totalcant_averia sum(avesaldo_pleg_nac+avesaldo_prod_nac) 
from ingreso, averia, cliente
where ingtipo='DEVOLUCION' 
and ingfecha >=fecha_ini and ingfecha <=fecha_fin
and ingcli_devolucion=clicodsx 
and aveingreso=ingcodsx and ingcodcia=compania;

raise notice 'tot % - tave %',totalcant,totalcant_averia;

for res in 
select clinombre, sum(cantidad), (sum(cantidad) /(totalcant+totalcant_averia))* 100 
from (
select clinombre, sum(ingcantidad) as cantidad
from ingreso, cliente where ingtipo='DEVOLUCION' and ingcodcia=compania and ingestado='FINALIZADO' 
and ingcli_devolucion= clicodsx and ingfecha >=fecha_ini and ingfecha <=fecha_fin
group by clinombre
UNION
select clinombre, sum(avesaldo_pleg_nac+avesaldo_prod_nac) as cantidad
from ingreso, averia,cliente
where ingtipo='DEVOLUCION' 
and ingfecha >=fecha_ini and ingfecha <=fecha_fin
and ingcli_devolucion=clicodsx 
and aveingreso=ingcodsx and ingcodcia=compania
group by clinombre) as dual
group by clinombre
LOOP
  return next res;
end loop;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.indicador_devoluciones_cliente(bigint, timestamp with time zone, timestamp with time zone) OWNER TO usersgl;

--
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 193
-- Name: FUNCTION indicador_devoluciones_cliente(bigint, timestamp with time zone, timestamp with time zone); Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON FUNCTION indicador_devoluciones_cliente(bigint, timestamp with time zone, timestamp with time zone) IS 'Funcion que retorna los datos para obtener el reporte de indicador de devoluciones por cliente, retornando el cliente, el valor de devoluciones y el porcentaje de las mismas en un periodo determinado y para una compannia en particular';


--
-- TOC entry 194 (class 1255 OID 23954)
-- Dependencies: 787 6 537
-- Name: indicador_devoluciones_responsable(bigint, timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION indicador_devoluciones_responsable(bigint, timestamp with time zone, timestamp with time zone) RETURNS SETOF indic_dev_cliente
    AS $_$declare
compania ALIAS FOR $1;
fecha_ini ALIAS FOR $2;
fecha_fin ALIAS FOR $3;

rec record;
res record;
cant numeric;
porc numeric;
total numeric;
totalcant_averia numeric;
cant_averia numeric;

begin
--calculo primero el total de devoluciones ($fob) en ingresos
select sum(ingcantidad) into total from ingreso where ingtipo='DEVOLUCION' 
and ingcodcia=compania and ingestado='FINALIZADO' 
and ingfecha >=fecha_ini and ingfecha <=fecha_fin;

-- calculo total de devoluciones en averias
select INTO totalcant_averia sum(avesaldo_pleg_nac+avesaldo_prod_nac) 
from ingreso, averia, cliente
where ingtipo='DEVOLUCION' 
and ingfecha >=fecha_ini and ingfecha <=fecha_fin
and ingcli_devolucion=clicodsx
and aveingreso=ingcodsx and ingcodcia=compania;

IF total IS NULL THEN total=0; END IF;
IF totalcant_averia IS NULL THEN totalcant_averia=0; END IF;

raise notice 'tot % - tave %',total,totalcant_averia;

FOR rec in select cauresponsable from causal group by cauresponsable LOOP
-- cantidad por ingreso
select into cant sum(ingcantidad) 
from ingreso, causal where ingtipo='DEVOLUCION' and ingcodcia=compania and ingestado='FINALIZADO' 
and ingcausal= caucodsx and ingfecha >=fecha_ini and ingfecha <=fecha_fin 
and cauresponsable = rec.cauresponsable;
-- cantidad por averias
select into cant_averia sum(avesaldo_pleg_nac+avesaldo_prod_nac)
from ingreso, averia, causal
where ingtipo='DEVOLUCION' 
and ingfecha >=fecha_ini and ingfecha <=fecha_fin
and ingcausal = caucodsx
and aveingreso=ingcodsx and ingcodcia=compania
and cauresponsable = rec.cauresponsable;

IF cant_averia IS NULL THEN cant_averia=0; END IF;
IF cant IS NULL THEN cant=0; END IF;

if total + totalcant_averia = 0 then
   porc=0;
else
   porc = ((cant+cant_averia)/(total+totalcant_averia))* 100;
end if;

for res in 
select rec.cauresponsable, cant+cant_averia, porc
LOOP
  return next res;
end loop;
END LOOP;

--return res;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.indicador_devoluciones_responsable(bigint, timestamp with time zone, timestamp with time zone) OWNER TO usersgl;

--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 194
-- Name: FUNCTION indicador_devoluciones_responsable(bigint, timestamp with time zone, timestamp with time zone); Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON FUNCTION indicador_devoluciones_responsable(bigint, timestamp with time zone, timestamp with time zone) IS 'Funcion que retorna los datos con los que se obtiene el reporte de devoluciones x responsable  que son: responsable, fob, cantidad y porcentaje';


--
-- TOC entry 195 (class 1255 OID 23955)
-- Dependencies: 6 787 538
-- Name: indicador_ingreso_contenedores(timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION indicador_ingreso_contenedores(timestamp with time zone, timestamp with time zone) RETURNS SETOF indic_ing_cont
    AS $_$declare

fecha_ini ALIAS FOR $1;
fecha_fin ALIAS FOR $2;

rec record;
res record;
total numeric;

de_20 int8;
de_40 int8;
de_40hq int8;
tot_cont int8;
porc numeric;

begin
--calculo primero el total de ingresos
select into total count(1) from trafico, contenedor_trafico
where ctrafnumtrafico = trafcodsx and ctraftamano !='FURGON'
and trafestado='FINALIZADO' 
and traffechacreacion >=fecha_ini and traffechacreacion <=fecha_fin;

for rec in select * from compania LOOP

select into de_20 count(1) from trafico, contenedor_trafico
where trafcompania = rec.comcodsx and 
ctrafnumtrafico = trafcodsx 
and trafestado='FINALIZADO' and ctraftamano='20'
and traffechacreacion >=fecha_ini and traffechacreacion <=fecha_fin;

select into de_40 count(1) from trafico, contenedor_trafico
where trafcompania = rec.comcodsx and 
ctrafnumtrafico = trafcodsx 
and trafestado='FINALIZADO' and ctraftamano='40'
and traffechacreacion >=fecha_ini and traffechacreacion <=fecha_fin;


select into de_40hq count(1) from trafico, contenedor_trafico
where trafcompania = rec.comcodsx and 
ctrafnumtrafico = trafcodsx 
and trafestado='FINALIZADO' and ctraftamano='40HQ'
and traffechacreacion >=fecha_ini and traffechacreacion <=fecha_fin;

tot_cont = de_20 +de_40 + de_40hq;

IF total=0 THEN
	porc=0;
ELSE 
	porc = tot_cont *100 / total;

END IF;

for res in 
select rec.comnombre, de_20, de_40, de_40hq, tot_cont::int4, porc
LOOP
	return next res;
end loop;


END LOOP;

--return res;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.indicador_ingreso_contenedores(timestamp with time zone, timestamp with time zone) OWNER TO usersgl;

--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 195
-- Name: FUNCTION indicador_ingreso_contenedores(timestamp with time zone, timestamp with time zone); Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON FUNCTION indicador_ingreso_contenedores(timestamp with time zone, timestamp with time zone) IS 'Funcion que retorna el total de contenedores de 20, 40 y 40hq por empresa en un rango de fechas determinado';


--
-- TOC entry 196 (class 1255 OID 23956)
-- Dependencies: 6 787 539
-- Name: indicador_ingresos_companias(timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION indicador_ingresos_companias(timestamp with time zone, timestamp with time zone) RETURNS SETOF indic_ingresos_cia
    AS $_$declare

fecha_ini ALIAS FOR $1;
fecha_fin ALIAS FOR $2;

rec record;
res record;
total numeric;

valor numeric;
cant numeric;
porc numeric;

begin
valor=0;
cant=0;
porc=0;

--calculo primero el total de ingresos
select into total sum(trafcif) from trafico
where 
trafestado='FINALIZADO' 
and traffechacreacion >=fecha_ini and traffechacreacion <=fecha_fin;

for rec in select * from compania LOOP

select into valor sum(trafcif) from trafico
where trafcompania = rec.comcodsx 
and trafestado='FINALIZADO' 
and traffechacreacion >=fecha_ini and traffechacreacion <=fecha_fin;

select into cant sum(trafcantidad) from trafico
where trafcompania = rec.comcodsx 
and trafestado='FINALIZADO' 
and traffechacreacion >=fecha_ini and traffechacreacion <=fecha_fin;

IF valor is null THEN valor=0; END IF;
IF cant is null THEN cant=0; END IF;
IF total is null THEN
	porc=0;
ELSE 
	porc = (valor *100) / total;

END IF;

for res in 
select rec.comnombre, valor, cant, porc
LOOP
	return next res;
end loop;


END LOOP;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.indicador_ingresos_companias(timestamp with time zone, timestamp with time zone) OWNER TO usersgl;

--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 196
-- Name: FUNCTION indicador_ingresos_companias(timestamp with time zone, timestamp with time zone); Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON FUNCTION indicador_ingresos_companias(timestamp with time zone, timestamp with time zone) IS 'Funcion que retorna los datos del reporte de indicador de ingresos por compania, retornando datos de la
compania, valor, cantidad y porcentaje de participacion en los ingresos en el periodo de fechas solicitado';


--
-- TOC entry 197 (class 1255 OID 23957)
-- Dependencies: 6 787 540
-- Name: indicador_pedidos_hit(bigint, date, bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION indicador_pedidos_hit(bigint, date, bigint) RETURNS SETOF indicador_hit
    AS $_$declare
compania ALIAS FOR $1;
mes ALIAS FOR $2;
hit ALIAS FOR $3;
rec record;
res record;
begin

IF hit IS NULL THEN
  FOR rec in select * from public.causal_hit order by cauhcodsx
	LOOP
	select into res * from indicador_pedidos_por_hit(compania, mes, rec.cauhcodsx);
	return next res;
  END LOOP;

ELSE 
	select into res * from indicador_pedidos_por_hit(compania, mes, hit);
	return next res;
END IF;



--return res;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.indicador_pedidos_hit(bigint, date, bigint) OWNER TO usersgl;

--
-- TOC entry 198 (class 1255 OID 23958)
-- Dependencies: 6 541 787
-- Name: indicador_pedidos_horas(bigint, date); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION indicador_pedidos_horas(bigint, date) RETURNS SETOF indicador_horas
    AS $_$declare
compania ALIAS FOR $1;
mes ALIAS FOR $2;
res record;

total int8;--el gran total de pedidos

--variables de la semana uno:
texto text;
sem1_A int8;
sem1_B int8;
sem1_C int8;
sem1_D int8;

--variables de la semana dos:
sem2_A int8;
sem2_B int8;
sem2_C int8;
sem2_D int8;

--variables de la semana tres:
sem3_A int8;
sem3_B int8;
sem3_C int8;
sem3_D int8;

--variables de la semana cuatro:
sem4_A int8;
sem4_B int8;
sem4_C int8;
sem4_D int8;

A_total int8;
A_porcentaje numeric;
B_total int8;
B_porcentaje numeric;
C_total int8;
C_porcentaje numeric;
D_total int8;
D_porcentaje numeric;



begin

--SEMANA UNO Y SUS PERIODOS:
sem1_A = get_total_pedidos_hora_semana(compania, mes + interval '00:00' , mes + integer '7' + interval '23:59:00', '07:00:00', '11:00:59'  );
sem1_B = get_total_pedidos_hora_semana(compania, mes + interval '00:00' , mes + integer '7' + interval '23:59:00', '11:01:00', '13:00:59'  );
sem1_C = get_total_pedidos_hora_semana(compania, mes + interval '00:00' , mes + integer '7' + interval '23:59:00', '13:01:00', '15:00:59'  );
sem1_D = get_total_pedidos_hora_semana(compania, mes + interval '00:00' , mes + integer '7' + interval '23:59:00', '15:01:00', '23:59:59'  );

--SEMANA DOS Y SUS PERIODOS:
sem2_A = get_total_pedidos_hora_semana(compania, mes + integer '8' + interval '00:00' , mes + integer '14' + interval '23:59:00', '07:00:00', '11:00:59'  );
sem2_B = get_total_pedidos_hora_semana(compania, mes + integer '8' + interval '00:00' , mes + integer '14' + interval '23:59:00', '11:01:00', '13:00:59'  );
sem2_C = get_total_pedidos_hora_semana(compania, mes + integer '8' + interval '00:00' , mes + integer '14' + interval '23:59:00', '13:01:00', '15:00:59'  );
sem2_D = get_total_pedidos_hora_semana(compania, mes + integer '8' + interval '00:00' , mes + integer '14' + interval '23:59:00', '15:01:00', '23:59:59'  ) ;

--SEMANA TRES Y SUS PERIODOS:
sem3_A = get_total_pedidos_hora_semana(compania, mes + integer '15'+ interval '00:00' , mes + integer '21' + interval '23:59:00', '07:00:00', '11:00:59'  ) ;
sem3_B = get_total_pedidos_hora_semana(compania, mes + integer '15'+ interval '00:00' , mes + integer '21' + interval '23:59:00', '11:01:00', '13:00:59'  ) ;
sem3_C = get_total_pedidos_hora_semana(compania, mes + integer '15'+ interval '00:00' , mes + integer '21' + interval '23:59:00', '13:01:00', '15:00:59'  );
sem3_D = get_total_pedidos_hora_semana(compania, mes + integer '15'+ interval '00:00' , mes + integer '21' + interval '23:59:00', '15:01:00', '23:59:59'  ) ;

--SEMANA CUATRO Y SUS PERIODOS:
sem4_A = get_total_pedidos_hora_semana(compania, mes + integer '22' + interval '00:00' , getultimodiames(mes), '07:00:00', '11:00:59'  ) ;
sem4_B = get_total_pedidos_hora_semana(compania, mes + integer '22' + interval '00:00' , getultimodiames(mes), '11:01:00', '13:00:59'  );
sem4_C = get_total_pedidos_hora_semana(compania, mes + integer '22' + interval '00:00' , getultimodiames(mes), '13:01:00', '15:00:59'  );
sem4_D = get_total_pedidos_hora_semana(compania, mes + integer '22' + interval '00:00' , getultimodiames(mes), '15:01:00', '23:59:59'  );

--saco los totales por hora y los porcentajes:

A_total = sem1_A + sem2_A + sem3_A + sem4_A;
B_total = sem1_B + sem2_B + sem3_B + sem4_B;
C_total = sem1_C + sem2_C + sem3_C + sem4_C;
D_total = sem1_D + sem2_D + sem3_D  + sem4_D;

total = A_total + B_total + C_total + D_total;

IF total=0 THEN
A_porcentaje = 0;
B_porcentaje = 0;
C_porcentaje = 0;
D_porcentaje = 0;

ELSE
A_porcentaje = A_total * 100 / total;
B_porcentaje = B_total * 100 / total;
C_porcentaje = C_total * 100 / total;
D_porcentaje = D_total * 100 / total;
END IF;
texto='08:00 AM - 11:00 AM';
for res in 
select  texto , sem1_A,sem2_A,sem3_A,sem4_A, A_total, A_porcentaje
loop
	return next res;
end loop;

texto='11:01 AM -13:00 PM';
for res in 
select texto, sem1_B,sem2_B,sem3_B,sem4_B, B_total , B_porcentaje
loop
	return next res;
end loop;

texto='13:01 PM - 15:00 PM';
for res in 
select texto, sem1_C, sem2_C, sem3_C,sem4_C, C_total , C_porcentaje
loop
	return next res;
end loop;

texto='15:01 PM - 20:00 PM';
for res in 
select texto , sem1_D, sem2_D, sem3_D, sem4_D, D_total, D_porcentaje
loop
	return next res;
end loop;


--return next res;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.indicador_pedidos_horas(bigint, date) OWNER TO usersgl;

--
-- TOC entry 199 (class 1255 OID 23959)
-- Dependencies: 787 541 6
-- Name: indicador_pedidos_horasxxx(bigint, date); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION indicador_pedidos_horasxxx(bigint, date) RETURNS SETOF indicador_horas
    AS $_$declare
compania ALIAS FOR $1;
mes ALIAS FOR $2;
res record;

total int8;--el gran total de pedidos

--variables de la semana uno:
texto text;
sem1_A int8;
sem1_B int8;
sem1_C int8;
sem1_D int8;
sem1_total int8;
sem1_porcentaje numeric;

--variables de la semana dos:
sem2_A int8;
sem2_B int8;
sem2_C int8;
sem2_D int8;
sem2_total int8;
sem2_porcentaje numeric;

--variables de la semana tres:
sem3_A int8;
sem3_B int8;
sem3_C int8;
sem3_D int8;
sem3_total int8;
sem3_porcentaje numeric;

--variables de la semana cuatro:
sem4_A int8;
sem4_B int8;
sem4_C int8;
sem4_D int8;
sem4_total int8;
sem4_porcentaje numeric;



begin

--SEMANA UNO Y SUS PERIODOS:

sem1_A = get_total_pedidos_hora_semana(compania, mes + interval '00:00' ,  mes + integer '7' + interval '23:59:00' , '07:00', '10:00'  );
sem1_B = get_total_pedidos_hora_semana(compania, mes + interval '00:00' , mes + integer '7' + interval '23:59:00', '010:01', '13:00'  );
sem1_C = get_total_pedidos_hora_semana(compania, mes + interval '00:00' , mes + integer '7' + interval '23:59:00', '13:01', '15:00'  );
sem1_D = get_total_pedidos_hora_semana(compania, mes + interval '00:00' , mes + integer '7' + interval '23:59:00', '15:01', '20:00'  );
sem1_total = sem1_A + sem1_B + sem1_C + sem1_D;

--SEMANA DOS Y SUS PERIODOS:
sem2_A = get_total_pedidos_hora_semana(compania, mes + integer '8' + interval '00:00' ,  mes + integer '14' + interval '23:59:00' , '07:00', '10:00'  );
sem2_B = get_total_pedidos_hora_semana(compania, mes + integer '8' + interval '00:00' , mes + integer '14' + interval '23:59:00', '010:01', '13:00'  );
sem2_C = get_total_pedidos_hora_semana(compania, mes + integer '8' + interval '00:00' , mes + integer '14' + interval '23:59:00', '13:01', '15:00'  );
sem2_D = get_total_pedidos_hora_semana(compania, mes + integer '8' + interval '00:00' , mes + integer '14' + interval '23:59:00', '15:01', '20:00'  ) ;
sem2_total = sem2_A + sem2_B + sem2_C + sem2_D;


--SEMANA TRES Y SUS PERIODOS:
sem3_A = get_total_pedidos_hora_semana(compania, mes + integer '15'+ interval '00:00' ,  mes + integer '21' + interval '23:59:00' , '07:00', '10:00'  ) ;
sem3_B = get_total_pedidos_hora_semana(compania, mes + integer '15'+ interval '00:00' , mes + integer '21' + interval '23:59:00', '010:01', '13:00'  ) ;
sem3_C = get_total_pedidos_hora_semana(compania, mes + integer '15'+ interval '00:00' , mes + integer '21' + interval '23:59:00', '13:01', '15:00'  );
sem3_D = get_total_pedidos_hora_semana(compania, mes + integer '15'+ interval '00:00' , mes + integer '21' + interval '23:59:00', '15:01', '20:00'  ) ;
sem3_total = sem3_A + sem3_B + sem3_C + sem3_D;


--SEMANA CUATRO Y SUS PERIODOS:
sem4_A = get_total_pedidos_hora_semana(compania, mes + integer '22' + interval '00:00' , getultimodiames(mes), '07:00', '10:00'  ) ;
sem4_B = get_total_pedidos_hora_semana(compania, mes + integer '22' + interval '00:00' , getultimodiames(mes), '010:01', '13:00'  );
sem4_C = get_total_pedidos_hora_semana(compania, mes + integer '22' + interval '00:00' , getultimodiames(mes), '13:01', '15:00'  );
sem4_D = get_total_pedidos_hora_semana(compania, mes + integer '22' + interval '00:00' , getultimodiames(mes), '15:01', '20:00'  );
sem4_total = sem4_A + sem4_B + sem4_C  + sem4_D;

total = sem1_total + sem2_total + sem3_total + sem4_total;

IF total=0 THEN
sem1_porcentaje = 0;
sem2_porcentaje = 0;
sem3_porcentaje = 0;
sem4_porcentaje = 0;

ELSE
sem1_porcentaje = sem1_total * 100 / total;
sem2_porcentaje = sem2_total * 100 / total;
sem3_porcentaje = sem3_total * 100 / total;
sem4_porcentaje = sem4_total * 100 / total;
END IF;
texto='SEMANA 1';
for res in 
select  texto , sem1_A,sem1_B,sem1_C,sem1_D, sem1_total, sem1_porcentaje
loop
	return next res;
end loop;

texto='SEMANA 2';
for res in 
select texto, sem2_A,sem2_B,sem2_C,sem2_D, sem2_total , sem3_porcentaje
loop
	return next res;
end loop;

texto='SEMANA 3';
for res in 
select texto, sem3_A, sem3_B, sem3_C,sem3_D, sem3_total , sem3_porcentaje
loop
	return next res;
end loop;

texto='SEMANA 4';
for res in 
select texto , sem4_A, sem4_B, sem4_C, sem4_D, sem4_total, sem4_porcentaje
loop
	return next res;
end loop;


return res;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.indicador_pedidos_horasxxx(bigint, date) OWNER TO usersgl;

--
-- TOC entry 200 (class 1255 OID 23960)
-- Dependencies: 787 6 540
-- Name: indicador_pedidos_por_hit(bigint, date, bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION indicador_pedidos_por_hit(bigint, date, bigint) RETURNS SETOF indicador_hit
    AS $_$declare
compania ALIAS FOR $1;
mes ALIAS FOR $2;
hit ALIAS FOR $3;
datos_hit record;
res record;

total_pedidos int8;--el gran total de pedidos en el mes

--variables de la semana uno:
texto varchar;
sem1 int8;
sem2 int8;
sem3 int8;
sem4 int8;

total int8;
porcentaje numeric(10,2);
cauhcodsx  int8;

begin
select into total_pedidos count(caupcausal) from pedido, causal_pedido where pedcodsx = cauppedido and 
	pedcompania=compania and pedfechasistema >= mes + interval '00:00' 
	and pedfechasistema <= getultimodiames(mes) AND PEDESTADO='FINALIZADO' ;

select into datos_hit * from causal_hit where causal_hit.cauhcodsx = hit;

--SEMANA UNO Y SUS PERIODOS:
sem1 = get_total_pedidos_hit(compania, mes + interval '00:00' ,  mes + integer '7' + interval '23:59:00' , hit );
sem2 = get_total_pedidos_hit(compania, mes +  integer '8' + interval '00:00' , mes + integer '14' + interval '23:59:00', hit  );
sem3 = get_total_pedidos_hit(compania, mes + integer '15' + interval '00:00' , mes + integer '21' + interval '23:59:00', hit  );
sem4 = get_total_pedidos_hit(compania, mes + integer '22' + interval '00:00' ,getultimodiames(mes), hit  );

--saco los totales por hora y los porcentjaes:

total = sem1 + sem2 + sem3 + sem4;

IF total=0 THEN
	porcentaje = 0;
ELSE
	porcentaje = total * 100 / total_pedidos;
END IF;

texto= datos_hit.cauhdesc;
cauhcodsx = datos_hit.cauhcodsx;

for res in 
select  cauhcodsx , texto, sem1, sem2, sem3,sem4, total, porcentaje
loop
	return next res;
end loop;


--return res;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.indicador_pedidos_por_hit(bigint, date, bigint) OWNER TO usersgl;

--
-- TOC entry 201 (class 1255 OID 23961)
-- Dependencies: 787 6 542
-- Name: indicador_pedidos_por_zona(bigint, date, integer); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION indicador_pedidos_por_zona(bigint, date, integer) RETURNS SETOF indicador_zonas
    AS $_$declare
compania ALIAS FOR $1;
mes ALIAS FOR $2;
zona ALIAS FOR $3;
res record;
datos_zona record;


texto varchar;
--variables de la semana uno:
sem1_A int8;
sem1_B int8;
sem1_C int8;
sem1_D int8;

--variables de la semana dos:
sem2_A int8;
sem2_B int8;
sem2_C int8;
sem2_D int8;

--variables de la semana tres:
sem3_A int8;
sem3_B int8;
sem3_C int8;
sem3_D int8;

--variables de la semana cuatro:
sem4_A int8;
sem4_B int8;
sem4_C int8;
sem4_D int8;

sem1_total int8;
sem2_total int8;
sem3_total int8;
sem4_total int8;

tot_zona int8;
porc_zona numeric;
total_pedidos int8; --total de pedidos en el mes para clacular porcentajes por zona
begin

select into total_pedidos count(1) from pedido where pedfechasistema >= mes + interval '00:00' 
and pedfecha <= getultimodiames(mes) and pedestado='FINALIZADO' AND pedcompania = compania;

select into datos_zona  * from public.zona where zoncodsx=zona;


--SEMANA UNO Y SUS PERIODOS:
sem1_A = get_total_pedidos_hora_semana_zona(compania, mes + interval '00:00' ,  mes + integer '7' + interval '23:59:00','08:00:00', '11:00:59' ,zona );
sem1_B = get_total_pedidos_hora_semana_zona(compania, mes + interval '00:00' , mes + integer '7' + interval '23:59:00', '11:01:00', '13:00:59' ,zona );
sem1_C = get_total_pedidos_hora_semana_zona(compania, mes + interval '00:00' , mes + integer '7' + interval '23:59:00', '13:01:00', '15:00:59' ,zona );
sem1_D = get_total_pedidos_hora_semana_zona(compania, mes + interval '00:00' , mes + integer '7' + interval '23:59:00', '15:01:00', '23:59:59' ,zona );

--SEMANA DOS Y SUS PERIODOS:
sem2_A = get_total_pedidos_hora_semana_zona(compania, mes + integer '8' + interval '00:00' ,  mes + integer '14' + interval '23:59:00','08:00:00', '11:00:59'  ,zona );
sem2_B = get_total_pedidos_hora_semana_zona(compania, mes + integer '8' + interval '00:00' , mes + integer '14' + interval '23:59:00', '11:01:00', '13:00:59'  ,zona );
sem2_C = get_total_pedidos_hora_semana_zona(compania, mes + integer '8' + interval '00:00' , mes + integer '14' + interval '23:59:00', '13:01:00', '15:00:59'  ,zona );
sem2_D = get_total_pedidos_hora_semana_zona(compania, mes + integer '8' + interval '00:00' , mes + integer '14' + interval '23:59:00', '15:01:00', '23:59:59'  ,zona );

--SEMANA TRES Y SUS PERIODOS:
sem3_A = get_total_pedidos_hora_semana_zona(compania, mes + integer '15'+ interval '00:00' ,  mes + integer '21' + interval '23:59:00','08:00:00', '11:00:59'  ,zona );
sem3_B = get_total_pedidos_hora_semana_zona(compania, mes + integer '15'+ interval '00:00' , mes + integer '21' + interval '23:59:00', '11:01:00', '13:00:59'  ,zona );
sem3_C = get_total_pedidos_hora_semana_zona(compania, mes + integer '15'+ interval '00:00' , mes + integer '21' + interval '23:59:00', '13:01:00', '15:00:59'  ,zona );
sem3_D = get_total_pedidos_hora_semana_zona(compania, mes + integer '15'+ interval '00:00' , mes + integer '21' + interval '23:59:00', '15:01:00', '20:00:59'  ,zona );

--SEMANA CUATRO Y SUS PERIODOS:
sem4_A = get_total_pedidos_hora_semana_zona(compania, mes + integer '22' + interval '00:00' , getultimodiames(mes), '08:00:00', '11:00:59'  ,zona );
sem4_B = get_total_pedidos_hora_semana_zona(compania, mes + integer '22' + interval '00:00' , getultimodiames(mes), '11:01:00', '13:00:59'  ,zona );
sem4_C = get_total_pedidos_hora_semana_zona(compania, mes + integer '22' + interval '00:00' , getultimodiames(mes), '13:01:00', '15:00:59'  ,zona );
sem4_D = get_total_pedidos_hora_semana_zona(compania, mes + integer '22' + interval '00:00' , getultimodiames(mes), '15:01:00', '23:59:59'  ,zona );

--saco los totales por hora y los porcentjaes:

sem1_total = sem1_A + sem1_B + sem1_C + sem1_D;
sem2_total = sem2_A + sem2_B + sem2_C + sem2_D;
sem3_total = sem3_A + sem3_B + sem3_C + sem3_D;
sem4_total = sem4_A + sem4_B + sem4_C  + sem4_D;

tot_zona = sem1_total + sem2_total + sem3_total + sem4_total;

raise notice'total_pedidos %' , total_pedidos;
IF total_pedidos=0 THEN
porc_zona =0;
ELSE
porc_zona = ( 100 * tot_zona  / total_pedidos)  ; 
END IF;

texto=datos_zona.zonnombre;
for res in 
select  texto , 
	sem1_A,sem1_B,sem1_c,sem1_D, 
	sem2_A,sem2_B,sem2_C,sem2_D, 
	sem3_A, sem3_B, sem3_C,sem3_D, 
	sem4_A, sem4_B, sem4_C, sem4_D,   
	tot_zona, porc_zona
loop
	return next res;
end loop;


return next res;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.indicador_pedidos_por_zona(bigint, date, integer) OWNER TO usersgl;

--
-- TOC entry 202 (class 1255 OID 23962)
-- Dependencies: 6 787 543
-- Name: indicador_pedidos_por_zona_valores(bigint, date, integer); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION indicador_pedidos_por_zona_valores(bigint, date, integer) RETURNS SETOF indicador_zonas_valorizado
    AS $_$declare
compania ALIAS FOR $1;
mes ALIAS FOR $2;
zona ALIAS FOR $3;
res record;
datos_zona record;


texto varchar;
--variables de la semana uno:
sem1 numeric;
sem2 numeric;
sem3 numeric;
sem4 numeric;

tot_zona numeric;
porc_zona numeric;
total_pedidos numeric; --total de pedidos en el mes para clacular porcentajes por zona
begin

select into total_pedidos sum(pedsubtotal) from pedido where pedcompania = compania and 
	pedfechasistema >= mes + interval '00:00' and pedfechasistema <= getultimodiames(mes) and pedestado='FINALIZADO';

select into datos_zona  * from public.zona where zoncodsx=zona ;


--SEMANA UNO Y SUS PERIODOS:
select into sem1 sum(pedsubtotal) from pedido where pedzona = datos_zona.zoncodsx and pedcompania = compania and 
	pedfechasistema >= ( mes + interval '00:00') and pedfechasistema <= (mes + integer '7' + interval '23:59:00')  
	and pedestado='FINALIZADO';

select into sem2 sum(pedsubtotal) from pedido where pedzona = datos_zona.zoncodsx and pedcompania = compania and 
	pedfechasistema >= ( mes + integer '8' + interval '00:00' ) and pedfechasistema <= (  mes + integer '14' + interval '23:59:00' )  
	and pedestado='FINALIZADO';

select into sem3 sum(pedsubtotal) from pedido where pedzona = datos_zona.zoncodsx and pedcompania = compania and 
	pedfechasistema >= ( mes + integer '15' + interval '00:00' ) and pedfechasistema <= (  mes + integer '21' + interval '23:59:00' )  
	and pedestado='FINALIZADO';

select into sem4 sum(pedsubtotal) from pedido where pedzona = datos_zona.zoncodsx and pedcompania = compania and 
	pedfechasistema >= ( mes + integer '22' + interval '00:00' ) and pedfechasistema <= ( getultimodiames(mes) )  
	and pedestado='FINALIZADO';

if sem1 is null then sem1=0; end if;
if sem2 is null then sem2=0; end if;
if sem3 is null then sem3=0; end if;
if sem4 is null then sem4=0; end if;


tot_zona = sem1 + sem2 + sem3 + sem4;

IF total_pedidos=0 THEN
porc_zona =0;
ELSE
porc_zona = ( 100 * tot_zona  / total_pedidos)  ; 
END IF;

texto=datos_zona.zonnombre;
for res in 
select  texto , 
	sem1,
	sem2,
	sem3,
	sem4, 0::numeric, 
	porc_zona ,tot_zona
loop
	return next res;
end loop;


return next res;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.indicador_pedidos_por_zona_valores(bigint, date, integer) OWNER TO usersgl;

--
-- TOC entry 203 (class 1255 OID 23963)
-- Dependencies: 787 6 542
-- Name: indicador_pedidos_zonas(bigint, date, integer); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION indicador_pedidos_zonas(bigint, date, integer) RETURNS SETOF indicador_zonas
    AS $_$declare
compania ALIAS FOR $1;
mes ALIAS FOR $2;
zona ALIAS FOR $3;
rec record;
res record;
begin

IF zona IS NULL THEN
  FOR rec in select * from public.zona
	LOOP
	select into res * from indicador_pedidos_por_zona(compania, mes, rec.zoncodsx);
	return next res;
  END LOOP;

ELSE 
	select into res * from indicador_pedidos_por_zona(compania, mes, zona);
	return next res;
END IF;



--return next res;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.indicador_pedidos_zonas(bigint, date, integer) OWNER TO usersgl;

--
-- TOC entry 204 (class 1255 OID 23964)
-- Dependencies: 787 6 543
-- Name: indicador_pedidos_zonas_valores(bigint, date, integer); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION indicador_pedidos_zonas_valores(bigint, date, integer) RETURNS SETOF indicador_zonas_valorizado
    AS $_$declare
compania ALIAS FOR $1;
mes ALIAS FOR $2;
zona ALIAS FOR $3;
rec record;
res record;
begin

IF zona IS NULL THEN
  FOR rec in select * from public.zona
	LOOP
	select into res * from indicador_pedidos_por_zona_valores(compania, mes, rec.zoncodsx);
	return next res;
  END LOOP;

ELSE 
	select into res * from indicador_pedidos_por_zona_valores(compania, mes, zona);
	return next res;
END IF;



--return next res;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.indicador_pedidos_zonas_valores(bigint, date, integer) OWNER TO usersgl;

--
-- TOC entry 205 (class 1255 OID 23965)
-- Dependencies: 6 543 787
-- Name: indicador_pedidos_zonas_valorizado(bigint, timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION indicador_pedidos_zonas_valorizado(bigint, timestamp without time zone, timestamp without time zone) RETURNS SETOF indicador_zonas_valorizado
    AS $_$declare
compania ALIAS FOR $1;
fecha_ini ALIAS FOR $2;
fecha_fin ALIAS FOR $3;

rec record;
res record;

r1 numeric;
r2 numeric;
r3 numeric;
r4 numeric;
r5 numeric;
porc numeric;
total numeric;
gran_total numeric;

begin

select into gran_total count(1) from pedido where pedestado='FINALIZADO' and pedfecha >= fecha_ini and pedfecha<= fecha_fin and pedcompania = compania;

FOR rec in select * from public.zona
	LOOP -- por cada zona miro cuanto hubo:
	
select into r1 count(1) from pedido where pedcompania = compania and pedfecha >= fecha_ini and pedfecha<= fecha_fin 
	and pedestado='FINALIZADO' and pedzona = rec.zoncodsx and pedsubtotal <= 1000000;

select into r2 count(1) from pedido where pedcompania = compania and pedfecha >= fecha_ini and pedfecha<= fecha_fin 
	and pedestado='FINALIZADO' and pedzona = rec.zoncodsx and pedsubtotal >= 1000001 and pedsubtotal <= 3000000;

select into r3 count(1) from pedido where pedcompania = compania and pedfecha >= fecha_ini and pedfecha<= fecha_fin
	and pedestado='FINALIZADO' and pedzona = rec.zoncodsx and pedsubtotal >= 3000001 and pedsubtotal <= 6000000;

select into r4 count(1) from pedido where pedcompania = compania and pedfecha >= fecha_ini and pedfecha<= fecha_fin 
	and pedestado='FINALIZADO' and pedzona = rec.zoncodsx and pedsubtotal >= 6000001 and pedsubtotal <= 9000000;

select into r5 count(1) from pedido where pedcompania = compania and pedfecha >= fecha_ini and pedfecha<= fecha_fin 
	and pedestado='FINALIZADO' and pedzona = rec.zoncodsx and pedsubtotal >= 9000001 ;

total = r1 + r2 + r3 +r4 + r5;
if total is null or total =0 then
porc =0;
else 
	porc = total * 100 / gran_total;
end if;

for res in 
select rec.zonnombre, r1, r2, r3, r4, r5, porc, total
LOOP
	return next res;
end loop;	

END LOOP;


end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.indicador_pedidos_zonas_valorizado(bigint, timestamp without time zone, timestamp without time zone) OWNER TO usersgl;

--
-- TOC entry 206 (class 1255 OID 23966)
-- Dependencies: 787 544 6
-- Name: inventario_promedio(bigint, date, date, bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION inventario_promedio(bigint, date, date, bigint) RETURNS SETOF inventario_promedio
    AS $_$declare
rec record;
cia alias for $1;
fecha_ini alias for $2;
fecha_fin alias for $3;
catcod alias for $4;
dias int2;
fecha date;
saldo numeric;
saldo_ant numeric;
cate record;


begin

dias = fecha_fin - fecha_ini;
fecha = fecha_ini;
saldo_ant= 0;
select into cate * from categoria where categoria.catcodsx = catcodsx and catcodcompania=cia;

FOR i IN 0..dias LOOP
        RAISE NOTICE 'i es %', i;

	select into saldo (kardsaldonac +kardsaldonnac) 
	from kardex, categoria, producto
	where kardcodproducto = procodsx
	and procategoria = catcodsx  
	and kardfecha >= fecha + time '00:00' and kardfecha<= fecha + time '23:59' 
	and catcodsx = catcod and kardcompania = cia
	group by catnombre,catcodsx , kardsaldonac +kardsaldonnac, kardfecha, kardcodsx
	order by kardfecha desc, kardcodsx limit 1;
	
if saldo is null then
	saldo = saldo_ant;
end if;
saldo_ant = saldo;

for rec in select cate.catnombre, fecha, saldo 
loop
	return next rec;
end loop;
fecha = fecha + integer '1';

END LOOP;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.inventario_promedio(bigint, date, date, bigint) OWNER TO usersgl;

--
-- TOC entry 207 (class 1255 OID 23967)
-- Dependencies: 551 787 6
-- Name: inventario_unidades_resumen(bigint, bigint, timestamp with time zone); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION inventario_unidades_resumen(bigint, bigint, timestamp with time zone) RETURNS SETOF tipo_reporte_inventario
    AS $_$DECLARE
cia_ini ALIAS FOR $1;
cia_fin ALIAS FOR $2;
fecha_fin ALIAS FOR $3;
rec record;
rec2 record;
res record;
temp1 record;
temp2 record;
temp3 record;

saldo_ant_nac numeric;
saldo_ant_nnac numeric;
--AVERIAS:
ave_pleg_nac numeric;
ave_prod_nac numeric;
ave_pleg_nnac numeric;
ave_prod_nnac numeric;

--ajustes:
aj_pos_nac numeric;
aj_neg_nac numeric;
aj_pos_nnac numeric;
aj_neg_nnac numeric;

acum_nac numeric;
acum_dev numeric;

pend_desp_nac numeric;
pend_desp_nnac numeric;

ped_tram_nac  numeric;
ped_tram_nnac  numeric;

acum_desp numeric;

saldo_fin_nac numeric;
saldo_fin_nnac numeric;
saldo_fisico_nac numeric;
saldo_fisico_nnac numeric;


BEGIN
for rec in select * from producto, categoria, public.compania  
where comcodsx = procodigocia and  catcodsx= procategoria 
and procodigocia between cia_ini and cia_fin order by procodigocia, catnombre
LOOP
--saco el saldo nac y saldonnac hasta ANTES de la fecha de consulta, lo saco de la tabla del kardex donde esta
--todo lo ejecutado de entrada, nacionalizado o salida
select into saldo_ant_nac kardsaldonac from 
	kardex where kardfecha <= fecha_fin and kardcodproducto = rec.procodsx 
order by kardfecha desc, kardcodsx desc limit 1;
if saldo_ant_nac is null then  saldo_ant_nac=0; end if;

select into saldo_ant_nnac kardsaldonnac from 
	kardex where kardfecha <=fecha_fin and kardcodproducto = rec.procodsx 
order by kardfecha desc, kardcodsx desc limit 1;
if saldo_ant_nnac is null then  saldo_ant_nnac=0; end if;


--los saldos reales y del sistem alos voy a sacar de la entrada y listo

for temp3 in select rec.comcodsx::int8, rec.comnombre, rec.catnombre, rec.catdescripcion, rec.promodelo, rec.prodescripcion,
saldo_ant_nac, saldo_ant_nnac, 0::numeric, 0::numeric , 0::numeric , 0::numeric, 0::numeric, 
0::numeric,
0::numeric , 0::numeric, 0::numeric, 0::numeric, 0::numeric, 0::numeric, 
0::numeric, 0::numeric,
0::numeric, 0::numeric , 0::numeric, 0::numeric


LOOP
	return next temp3;
end loop;


END LOOP;


END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.inventario_unidades_resumen(bigint, bigint, timestamp with time zone) OWNER TO usersgl;

--
-- TOC entry 208 (class 1255 OID 23968)
-- Dependencies: 550 6 787
-- Name: inventario_valorizado(bigint, bigint, timestamp with time zone, numeric); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION inventario_valorizado(bigint, bigint, timestamp with time zone, numeric) RETURNS SETOF tipo_inventario_valorizado
    AS $_$DECLARE
compania ALIAS  FOR $1;
cate ALIAS      FOR $2;
fecha_fin ALIAS FOR $3;
trm ALIAS       FOR $4;

rec  record;
rec2 record;
res  record;

temp1 record;
temp2 record;
temp3 record;

saldo_ant_nac  numeric;
saldo_ant_nnac numeric;
cifunitario    numeric(12,2);

--AVERIAS:
ave_pleg_nac  numeric;
ave_prod_nac  numeric;
ave_pleg_nnac numeric;
ave_prod_nnac numeric;

--ajustes:
aj_pos_nac numeric;
aj_neg_nac numeric;
aj_pos_nnac numeric;
aj_neg_nnac numeric;

acum_nac numeric;
acum_dev numeric;

pend_desp_nac  numeric;
pend_desp_nnac numeric;

ped_tram_nac   numeric;
ped_tram_nnac  numeric;

acum_desp numeric;

saldo_fin_nac     numeric;
saldo_fin_nnac    numeric;
saldo_fisico_nac  numeric;
saldo_fisico_nnac numeric;


BEGIN
for rec in select * from producto, categoria, public.compania  
where comcodsx = procodigocia and  catcodsx= procategoria 
and procodigocia = compania and procategoria=cate order by promodelo
LOOP
--saco el saldo nac y saldonnac hasta ANTES de la fecha de consulta, lo saco de la tabla del kardex donde esta
--todo lo ejecutado de entrada, nacionalizado o salida
select into saldo_ant_nac kardsaldonac from 
	kardex where kardfecha <= fecha_fin and kardcodproducto = rec.procodsx 
order by kardfecha desc, kardcodsx desc limit 1;
if saldo_ant_nac is null then  saldo_ant_nac=0; end if;

select into saldo_ant_nnac kardsaldonnac from 
	kardex where kardfecha <=fecha_fin and kardcodproducto = rec.procodsx 
order by kardfecha desc, kardcodsx desc limit 1;

if saldo_ant_nnac is null then  saldo_ant_nnac=0; end if;

--select into factura ftrafnumfactura from ingreso, factura_trafico where ingcodsx=(select max(kardcodigoingreso) from
--kardex where kardfecha <= fecha_fin and kardcodproducto = rec.procodsx and
--kardtipoing='TRAFICO') and ftrafnumtrafico=ingtrafico;

select into cifunitario reftcifunit from referencia_trafico
where reftnumfacturatrafico=(select ftrafcodsx from ingreso, factura_trafico where ingcodsx=(select max(kardcodigoingreso) from
kardex where kardfecha <=fecha_fin and kardcodproducto = rec.procodsx and kardtipoing='TRAFICO' ) and ftrafnumtrafico=ingtrafico limit 1
--desc limit 1
);
 
raise notice'Modelo: %CifUnitario:%',rec.procodsx, cifunitario;

--los saldos reales y del sistem alos voy a sacar de la entrada y listo

for temp3 in select rec.promodelo, rec.prodescripcion, saldo_ant_nac, saldo_ant_nnac,(saldo_ant_nac+saldo_ant_nnac),(saldo_ant_nac*cifunitario),(saldo_ant_nnac*cifunitario),(saldo_ant_nac*cifunitario)+(saldo_ant_nnac*cifunitario),((saldo_ant_nac*cifunitario)+(saldo_ant_nnac*cifunitario))*trm

LOOP
	return next temp3;
end loop;


END LOOP;

--return temp3;

END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.inventario_valorizado(bigint, bigint, timestamp with time zone, numeric) OWNER TO usersgl;

--
-- TOC entry 209 (class 1255 OID 23969)
-- Dependencies: 787 6
-- Name: kardex(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION kardex() RETURNS "trigger"
    AS $$--trigger que se encarga de llenar la tabla del kardex con los movimientos...
declare
rec RECORD;
temp1 record;
temp2 record;
saldonac numeric;
saldonnac numeric;
begin

IF TG_RELNAME='ingreso' THEN
--cuando el ingreso se finaliza, es que registro las entradas
IF TG_OP = 'DELETE' THEN
--SI BORRO el ingreso, borro lo que haya aki:
delete from kardex where kardcodigoingreso= old.ingcodsx;

ELSE 
--CUANDO LO ACTIVA::
if new.ingestado='TRAMITE' AND OLD.ingestado='FINALIZADO' THEN
  delete from kardex where kardcodigoingreso= old.ingcodsx;
END IF;

--CUADNO LO FINALIZAD, AKI SI METO TODO AL KARDEX:
if new.ingestado='FINALIZADO' AND OLD.ingestado='TRAMITE' THEN

--saco los productos que hayan en este ingreso:
for rec in select  procodsx, promodelo,  prodescripcion,
		 comcodsx, comnombre,ingfecha,  ingtipo,
		 sum(entcantidad) as cant, sum(entpesobrutototal) as bruto, 
		 sum(entvalortotal) as valor, ingcodsx
		from entrada, producto, compania , ingreso
		where entcodproducto = procodsx and procodigocia = comcodsx 
		and ingcodsx = entcodingreso
		and entcodingreso = new.ingcodsx
		group by comcodsx, comnombre, procodsx, promodelo,  prodescripcion, ingfecha, ingcodsx, ingtipo
LOOP
--primero saco el saldo anterior  
saldonac =0;
saldonnac =0;

--primero saco el saldo anterior  
select into temp1 * from kardex where kardcodproducto = rec.procodsx and kardcompania = rec.comcodsx order by kardfecha desc, kardcodsx desc limit 1;
 saldonac = temp1.kardsaldonac;
 saldonnac = temp1.kardsaldonnac;

if saldonac is null then saldonac=0; end if;
if saldonnac is null then saldonnac=0; end if;
--SI EL INGRESO ES DE TIPO 'TRAFICO' EL SALDO ES NO NACIONALIZADO, DE LO CONTRARIO SERA NACIONALIZADO:
select into temp2 * from ingreso where ingcodsx = rec.ingcodsx;

if temp2.ingtipo='TRAFICO'  THEN --EL SALDO ES NO NACIONALIZADO
	INSERT INTO kardex(kardfecha, kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, 
			kardnombrecomp, kardfechaing, kardcantingreso, kardtipoing,
			kardpesobrutoent, kardvaloringreso, kardcodigoingreso, kardsaldonac, kardsaldonnac)
	values (new.ingfecha, rec.procodsx, rec.promodelo, rec.prodescripcion,
		rec.comcodsx, rec.comnombre, new.ingfecha, rec.cant, rec.ingtipo, rec.bruto,
		rec.valor, rec.ingcodsx, saldonac, saldonnac + rec.cant );

ELSE  -- ES DEVOLUCION O DESPIECE, ES NACIONALIZADO:
	INSERT INTO kardex(kardfecha, kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, 
			kardnombrecomp, kardfechaing, kardcantingreso, kardtipoing,
			kardpesobrutoent, kardvaloringreso, kardcodigoingreso, kardsaldonac, kardsaldonnac)
	values (new.ingfecha, rec.procodsx, rec.promodelo, rec.prodescripcion,
		rec.comcodsx, rec.comnombre, new.ingfecha, rec.cant, rec.ingtipo, rec.bruto,
		rec.valor, rec.ingcodsx, (saldonac+rec.cant ), saldonnac);
END IF;

	
END LOOP;
END IF;

END IF;


END IF;


IF TG_RELNAME='despacho' THEN
--cuando el despacho se finaliza, es que registro las descargas.....


IF TG_OP = 'DELETE' THEN
--SI BORRO el ingreso, borro lo que haya aki:
delete from kardex where kardcodigodespacho= old.despcodsx;
ELSE 
if new.despestado='TRAMITE' AND old.despestado='FINALIZADO' THEN
delete from kardex where kardcodigodespacho= old.despcodsx;
END IF;

if new.despestado='FINALIZADO' AND old.despestado='TRAMITE' THEN

FOR REC IN select procodsx, promodelo,  prodescripcion ,
			comcodsx, comnombre, despfecha, sum(refdcant) as cantnac, 0.00 as cantnnac, 
		sum(refdpesoneto) as neto, sum(refdpesobruto) as bruto,sum(refdvalor)as valor,  despcodsx, despedpedido
		from compania, producto, despacho, despacho_pedido, referencia_despacho
		where comcodsx = despempresa and despeddespacho = despcodsx and refddespacho_pedido = despedcodsx
		and procodsx = refdproducto and despcodsx = NEW.despcodsx
		group by comcodsx, comnombre, procodsx, promodelo,  prodescripcion, despcodsx, despfecha, despedpedido
LOOP

saldonac =0;
saldonnac =0;

--primero saco el saldo anterior  
select into temp1 * from kardex where kardcodproducto = rec.procodsx and kardcompania = rec.comcodsx order by kardfecha desc, kardcodsx desc limit 1;
 saldonac = temp1.kardsaldonac;
 saldonnac = temp1.kardsaldonnac;

if saldonac is null then saldonac=0; end if;
if saldonnac is null then saldonnac=0; end if;
--miro si el pedido es tiPO NAC O SNAC

SELECT INTO temp2 * from pedido where pedcodsx = rec.despedpedido;
if temp2.pedtipo='NAC' then --es nacionalizado:
      rec.cantnac  :=     rec.cantnac;
      rec.cantnnac :=0;
else --es no nacionalizado:
  
  rec.cantnnac := rec.cantnac;
  rec.cantnac :=0.00;
end if;

INSERT INTO kardex(kardfecha, kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, 
			kardnombrecomp, kardfechasal, kardcantsalnac, kardcantsalnnac , karddespacho,
			kardpesobrutosal, kardvalorsal, kardcodigodespacho, kardsaldonac,  kardsaldonnac) 
VALUES( new.despfecha , rec.procodsx, rec.promodelo,  rec.prodescripcion ,
			rec.comcodsx, rec.comnombre, new.despfecha, rec.cantnac,rec.cantnnac ,
		       rec.despcodsx, rec.bruto,rec.valor,  rec.despcodsx , (saldonac -rec.cantnac) ,  (saldonnac -rec.cantnnac));

END LOOP;
		
end if;
END IF;

END IF;


--TABLA NACIONALIZACION PARA AGREGAR EL REGISTRO DE NACIONALIZACION:
IF TG_RELNAME='nacionalizacion' THEN
IF TG_OP = 'DELETE' THEN
--SI BORRO el ingreso, borro lo que haya aki:
delete from kardex where kardcodnac= old.naccodsx;

ELSE 

--SI ACTIVA LA NACIONALZIACION, BORRO TODO
IF TG_OP='UPDATE' THEN
IF old.nacestado='FINALIZADO' AND NEW.nacestado='TRAMITE'  THEN
  delete from kardex where kardcodnac= old.naccodsx;
end if;


--CUANDO FINALIZO LA NACIONALIZACION ES QUE MUEVO EL KARDEX

IF old.nacestado='TRAMITE' AND NEW.nacestado='FINALIZADO'  THEN

FOR REC IN select procodsx, promodelo,  prodescripcion ,
		comcodsx, comnombre, nacfecha, naccodsx, sum(nadcantidad) as cantidad,
		sum(nadpesonetototal) as neto, sum(nadpesobrutototal) as bruto,sum(nadfobtotal)as valor
		from compania,  nacionalizacion, nacionalizacion_detalle, entrada, producto
		where comcodsx = nacempresa and naccodsx = nadcodnac and nadentrada = entcodsx and entcodproducto = procodsx
		and naccodsx = new.naccodsx
		group by comcodsx, comnombre, procodsx, promodelo,  prodescripcion, nacfecha, naccodsx
LOOP

--primero saco el saldo anterior  
saldonac =0;
saldonnac =0;

--primero saco el saldo anterior  
select into temp1 * from kardex where kardcodproducto = rec.procodsx and kardcompania = rec.comcodsx order by kardfecha desc, kardcodsx desc limit 1;
 saldonac = temp1.kardsaldonac;
 saldonnac = temp1.kardsaldonnac;

if saldonac is null then saldonac=0; end if;
if saldonnac is null then saldonnac=0; end if;
--miro si el pedido es tiPO NAC O SNAC
--ahora voy y registro la nacionalizacion:


INSERT INTO kardex(kardfecha, kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, 
			kardnombrecomp, kardfechanac, kardcantnac, kardpesonetonac,
			kardpesobrutonac, kardvalornac, kardcodnac, kardsaldonac,  kardsaldonnac) 
VALUES( new.nacfecha, rec.procodsx, rec.promodelo,  rec.prodescripcion ,
			rec.comcodsx, rec.comnombre, new.nacfecha, rec.cantidad,
		       rec.neto, rec.bruto,rec.valor,  rec.naccodsx, (saldonac + rec.cantidad) ,  (saldonnac - rec.cantidad));

END LOOP;

END IF;
  END IF;
END IF;

END IF;



--TABLA AJUSTE, TENGO QUE MOVER EL KARDEX PARA QUE SE REFLEJE BIEN EL SALDO:
if TG_RELNAME='ajuste' THEN

IF TG_OP='DELETE' THEN
	delete from kardex where kardajuste = old.ajcodsx;
ELSE
-- un ajuste se crea en estado finalizado:
IF new.ajestado='FINALIZADO' THEN
--primero saco el saldo anterior  
select into temp2 producto.* from producto, entrada  where entcodsx = new.ajentrada and entcodproducto = procodsx;

 RAISE NOTICE 'el producto: %',temp2.procodsx;
select into temp1 * from kardex where kardcodproducto = temp2.procodsx order by kardfecha desc, kardcodsx desc limit 1;

if temp1.kardcodsx is null then 
saldonac =0;
saldonnac =0;
else 
 saldonac = temp1.kardsaldonac;
 saldonnac = temp1.kardsaldonnac;
end if;


--miro de que fue el ajuste, si positivo o negativo y si nac o nnac:

	if new.aj_pos_nac >0 THEN  --es ajuste de ingreso nac
		select into rec procodsx, promodelo,  prodescripcion ,
		comcodsx, comnombre, new.ajfecha as ajfecha, new.ajcodsx, new.aj_pos_nac as cant
		from compania,   producto, entrada
		where comcodsx = new.ajcodcia and entcodsx = new.ajentrada and entcodproducto = procodsx;
	--inserto el registro en el kardex:
		INSERT INTO kardex(kardfecha, kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, 
			kardnombrecomp, kardfechaing, kardcantingreso, kardtipoing,
			kardsaldonac, kardsaldonnac, kardajuste)
	values (now(), rec.procodsx, rec.promodelo, rec.prodescripcion,
		rec.comcodsx, rec.comnombre, rec.ajfecha, rec.cant, 'AJUSTE', saldonac + rec.cant, saldonnac, new.ajcodsx);
saldonac = saldonac + rec.cant;
select into temp1 * from kardex where kardcodproducto = temp2.procodsx order by kardfecha desc, kardcodsx desc limit 1;


	END IF;


	if new.aj_neg_nac >0 THEN  --es ajuste de salida nac
		select into rec procodsx, promodelo,  prodescripcion ,
		comcodsx, comnombre, new.ajfecha as ajfecha , new.ajcodsx, new.aj_neg_nac as cant
		from compania,  producto, entrada
		where comcodsx = new.ajcodcia and entcodsx = new.ajentrada and entcodproducto = procodsx;

	INSERT INTO kardex(kardfecha, kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, 
			kardnombrecomp, kardfechasal, kardcantsalnac, kardcantsalnnac , karddespacho,
			kardsaldonac,  kardsaldonnac, kardajuste) 
		VALUES( now(), rec.procodsx, rec.promodelo,  rec.prodescripcion ,
			rec.comcodsx, rec.comnombre, rec.ajfecha , rec.cant ,0  ,
		       'AJUSTE', (saldonac -rec.cant) ,  saldonnac , new.ajcodsx);
saldonac = saldonac - rec.cant;
select into temp1 * from kardex where kardcodproducto = temp2.procodsx order by kardfecha desc, kardcodsx desc limit 1;
	END IF;
	
	if new.aj_pos_nnac >0 THEN  --es ajuste de ingreso nnac
		select into rec procodsx, promodelo,  prodescripcion ,
		comcodsx, comnombre, new.ajfecha as ajfecha, new.ajcodsx, new.aj_pos_nnac as cant
		from compania,  producto, entrada
		where comcodsx = new.ajcodcia and entcodsx = new.ajentrada and entcodproducto = procodsx;
		--inserto el registro en el kardex:
		INSERT INTO kardex(kardfecha, kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, 
			kardnombrecomp, kardfechaing, kardcantingreso, kardtipoing,
			kardsaldonac, kardsaldonnac, kardajuste)
	values (now(), rec.procodsx, rec.promodelo, rec.prodescripcion,
		rec.comcodsx, rec.comnombre, rec.ajfecha, rec.cant, 'AJUSTE', 
		saldonac , saldonnac + rec.cant, new.ajcodsx);
saldonnac = saldonnac + rec.cant;
select into temp1 * from kardex where kardcodproducto = temp2.procodsx order by kardfecha desc, kardcodsx desc limit 1;
	END IF;
	if new.aj_neg_nnac >0 THEN  --es ajuste de salida nnac
		select into rec procodsx, promodelo,  prodescripcion ,
		comcodsx, comnombre, new.ajfecha as ajfecha, new.ajcodsx, new.aj_neg_nnac as cant
		from compania,  producto, entrada
		where comcodsx = new.ajcodcia and entcodsx = new.ajentrada and entcodproducto = procodsx;
	INSERT INTO kardex(kardfecha, kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, 
			kardnombrecomp, kardfechasal, kardcantsalnac, kardcantsalnnac , karddespacho,
			kardsaldonac,  kardsaldonnac, kardajuste) 
		VALUES( now(), rec.procodsx, rec.promodelo,  rec.prodescripcion ,
			rec.comcodsx, rec.comnombre, rec.ajfecha , rec.cant ,0  ,
		       'AJUSTE', saldonac  ,  saldonnac - rec.cant, new.ajcodsx);
saldonnac = saldonnac - rec.cant;
select into temp1 * from kardex where kardcodproducto = temp2.procodsx order by kardfecha desc, kardcodsx desc limit 1;
	END IF;

--ahora 

END IF;


END IF;

END IF;


if TG_OP='DELETE' then
return old;
else
return new;
end if;

end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.kardex() OWNER TO usersgl;

--
-- TOC entry 210 (class 1255 OID 23971)
-- Dependencies: 545 787 6
-- Name: kardex_categoria(bigint, bigint, date, date); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION kardex_categoria(bigint, bigint, date, date) RETURNS SETOF kardex_categoria
    AS $_$declare
comp alias for $1;
categ alias for $2;
fecha_ini alias for $3;
fecha_fin alias for $4;

ent numeric;
sal numeric;
saldo numeric;
valor_dia_elec numeric;

rec record; 
rec1 record;
rec2 record;
kard record;

begin

valor_dia_elec=0;

  for rec in select  kardfecha::date as date, catcodsx, catnombre, sum(kardcantingreso) as ingresos, 
                  sum(kardcantsalnac) + sum(kardcantsalnnac) as salidas,0.00 as sald
           from kardex, producto ,categoria
           where kardcodproducto = procodsx and procategoria = catcodsx  and kardfecha::date >= fecha_ini 
           and kardfecha::date <= fecha_fin and procategoria = categ and kardcompania=comp
           group by catcodsx, catnombre, kardfecha::date
           order by catnombre, kardfecha::date  asc
  loop
	raise notice'fecha:%', rec.date ;

	for rec2 in select procodsx from producto, kardex where procodsx = kardcodproducto and procategoria = rec.catcodsx
                        and procodigocia=comp
			group by procodsx ORDER BY PROCODSX
	loop
		--raise notice'prodeucto:%', rec2.procodsx ;
		select into kard * from kardex where kardcodproducto = rec2.procodsx and kardfecha::date <= rec.date 
		order by kardfecha desc, kardcodsx desc limit 1;

		if kard.kardsaldonac is null then kard.kardsaldonac=0; end if;
		if kard.kardsaldonnac is null then kard.kardsaldonnac=0; end if;

		valor_dia_elec = valor_dia_elec + (kard.kardsaldonac + kard.kardsaldonnac);
		raise notice'producto:%', rec2.procodsx ;
		raise notice'saldonac:%', kard.kardsaldonac ;
		raise notice'saldonnac:%', kard.kardsaldonnac ;
		raise notice'valor dia elec:%', valor_dia_elec;

	end loop;


	rec.sald = valor_dia_elec;

	for rec1  in select  rec.catnombre::varchar, rec.date::date, rec.ingresos::numeric, rec.salidas::numeric, 
                             valor_dia_elec::numeric
	loop 
		return next rec1;
	end loop;

	valor_dia_elec=0;


  end loop;


end;



$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.kardex_categoria(bigint, bigint, date, date) OWNER TO usersgl;

--
-- TOC entry 211 (class 1255 OID 23972)
-- Dependencies: 787 6
-- Name: liberar_saldo_despacho(bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION liberar_saldo_despacho(bigint) RETURNS void
    AS $_$DECLARE
refdp RECORD;

BEGIN
select into refdp  * from referencia_despacho_pedido where refdpcodsx = $1;

update referencia_pedido set refpsaldo = ( refpsaldo  + refdp.refdcant ) where refpcodsx = refdp.refdcodrefp;

RETURN;

END;

$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.liberar_saldo_despacho(bigint) OWNER TO usersgl;

--
-- TOC entry 212 (class 1255 OID 23973)
-- Dependencies: 787 6
-- Name: liberar_saldo_packing(bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION liberar_saldo_packing(bigint) RETURNS void
    AS $_$DECLARE
ent RECORD; --registro de entradas
nacdet RECORD; -- registro de la nacinalizacion_detalle que se esta borrando y se va a sumar
pack_det_pos RECORD; --registro en cuestion de packing_detalle_posicion
pack RECORD; --registro del packing
saldosinnac numeric;
saldonac numeric;
cantidad numeric; 


BEGIN
saldosinnac = 0;
saldonac = 0;

select into pack_det_pos * from packing_detalle_posicion where packpcodsx=$1;


select into nacdet * from nacionalizacion_detalle where nadcodsx = pack_det_pos.packpnacdetalle;
select into ent * from entrada where entcodsx = pack_det_pos.packpentrada;

saldonac = ent.entsaldonac;
cantidad = pack_det_pos.packpsaldo;
--actualizo la entrada:
update entrada set entsaldonac = ( saldonac  + cantidad )where 	entcodsx = ent.entcodsx;
--actualizo la nacionalizaciondetalle:
saldonac = nacdet.nadsaldo;
if nacdet.nadcodsx is not null then
update nacionalizacion_detalle set nadsaldo = (saldonac + cantidad) where nadcodsx = nacdet.nadcodsx;
end if;



RETURN;

END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.liberar_saldo_packing(bigint) OWNER TO usersgl;

--
-- TOC entry 213 (class 1255 OID 23974)
-- Dependencies: 787 6
-- Name: liberar_saldo_pedido(bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION liberar_saldo_pedido(bigint) RETURNS void
    AS $_$DECLARE
ent RECORD; --registro de entradas
nacdet RECORD; -- registro de la nacinalizacion_detalle que se esta borrando y se va a sumar
refp RECORD; --registro en cuestion de referencia_pedido
ped RECORD; --registro del pedido
saldosinnac numeric;
saldonac numeric;
cantidad numeric; 


BEGIN
saldosinnac = 0;
saldonac = 0;

select into refp * from referencia_pedido where refpcodsx=$1;
select into ped * from pedido where pedcodsx=refp.refpnumpedido;


IF ped.pedtipo='NAC' THEN

select into ent * from entrada where entcodsx = refp.refpentrada;

select into nacdet * from nacionalizacion_detalle where nadcodsx = refp.refpnacdetalle;


saldonac = ent.entsaldonac;
cantidad = refp.refpcantidad;
--actualizo la entrada:
update entrada set entsaldonac = ( saldonac  + cantidad )where 	entcodsx = ent.entcodsx;
--actualizo la nacionalizaciondetalle:
saldonac = nacdet.nadsaldo;
update nacionalizacion_detalle set nadsaldo = (saldonac + cantidad) where nadcodsx = nacdet.nadcodsx;



END IF;

IF ped.pedtipo='SNAC' THEN

select into ent * from entrada where entcodsx = refp.refpentrada;

saldosinnac = ent.entsaldosinnac;
cantidad = refp.refpcantidad;
--actualizo la entrada:
update entrada set entsaldosinnac = ( saldosinnac  + cantidad )where 	entcodsx = ent.entcodsx;


END IF;


RETURN;

END;

$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.liberar_saldo_pedido(bigint) OWNER TO usersgl;

--
-- TOC entry 214 (class 1255 OID 23975)
-- Dependencies: 787 6
-- Name: liberar_saldo_picking(bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION liberar_saldo_picking(bigint) RETURNS void
    AS $_$DECLARE
pack_det_pos RECORD; --registro de packing_detalle_posicion
pick_det_pack RECORD; --registro del picking_detalle_packing
cantidad numeric; 


BEGIN

select into pick_det_pack * from picking_detalle_packing where pickpcodsx=$1;
select into pack_det_pos * from packing_detalle_posicion where packpcodsx= pick_det_pack.pickppackingdet ;


cantidad = pick_det_pack.pickpcantidad;
--actualizo la packing_detalle_posicion:
update packing_detalle_posicion set packpsaldo= ( packpsaldo  + cantidad )where packpcodsx = pack_det_pos.packpcodsx;

RETURN;

END;

$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.liberar_saldo_picking(bigint) OWNER TO usersgl;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- TOC entry 1854 (class 1259 OID 23976)
-- Dependencies: 2378 2380 2381 2382 2383 6
-- Name: entrada; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE entrada (
    entcodsx integer NOT NULL,
    entcodingreso bigint NOT NULL,
    entcodproducto bigint NOT NULL,
    entbodega bigint NOT NULL,
    entposicion character varying NOT NULL,
    entcantidad numeric(15,2) NOT NULL,
    entpesoneto numeric(15,2) NOT NULL,
    entpesonetototal numeric(15,2) NOT NULL,
    entpesobruto numeric(15,2) NOT NULL,
    entpesobrutototal numeric(15,2) NOT NULL,
    entsaldopesoneto numeric(15,2) NOT NULL,
    entsaldopesobruto numeric(15,2) NOT NULL,
    entsaldonac numeric(15,2),
    entsaldosinnac numeric(15,2),
    entvalor numeric(15,2) NOT NULL,
    entvalortotal numeric(15,2) NOT NULL,
    resumen text,
    entfecha timestamp without time zone DEFAULT now(),
    entsaldonacf numeric(15,2),
    entsaldosinnacf numeric(15,2),
    entunidad character varying,
    CONSTRAINT chk_entcantidad CHECK ((entcantidad >= (0)::numeric)),
    CONSTRAINT chk_entsaldosinnac CHECK ((entsaldosinnac >= (0)::numeric)),
    CONSTRAINT chk_entsaldosinnacf CHECK ((entsaldosinnacf >= (0)::numeric)),
    CONSTRAINT chk_saldo_nac CHECK ((entsaldonac >= (0)::numeric))
);


ALTER TABLE movimiento.entrada OWNER TO usersgl;

--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 1854
-- Name: TABLE entrada; Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON TABLE entrada IS 'Tabla donde se almacenan los datos de una entrada a inventario, dichos datos consisten en el INGRESO, PRODUCTO, BODEGA Y POSICION, es asi como se podra manejar saldo por ingreso por bodega por producto.
Ademas de esto, se discrimina el saldo nacionalizado del NO nacionalizado,  para asi mantener actualizada la información de los saldos.
';


--
-- TOC entry 215 (class 1255 OID 23986)
-- Dependencies: 6 555 787
-- Name: lista_entradas_fifo(bigint, character varying); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION lista_entradas_fifo(bigint, character varying) RETURNS SETOF entrada
    AS $_$DECLARE


producto ALIAS FOR $1;
tipopedido ALIAS for $2;

ents entrada;

BEGIN
-- PRIMERO SACO LOS INGRESOS CON EL TIPO DE SALDO::::
-- SALDO NACIONALIZADO::

IF tipopedido ='NAC' THEN

--PRIMERO saco las entradas tipo devolucion y tipo despiece:
--cambio hecho el 22 de enero de 2007 por solicitud de jefatura de operaciones, que primero
--sean las devoluciones y luego lo nacionalizado
for ents in  
select entcodsx, entcodingreso, null as entcodproducto, entbodega, entposicion, entcantidad, entpesoneto, 
	entpesonetototal, entpesobruto, entpesobrutototal, entsaldopesoneto, entsaldopesobruto,
	 entsaldonac , entsaldosinnac
from ingreso, entrada 	where 
	ingcodsx = entcodingreso and (ingtipo='DEVOLUCION'  or ingtipo='DESPIECE' OR ingtipo='AJUSTE') and ingestado = 'FINALIZADO' 
	and entcodproducto = producto and   entsaldonac >0 order by ingfecha asc
LOOP
	return next ents;
end loop;


--consulta que obtiene las entradas tipo trafico, que han tenido nacionalizaciones del producto requerido para la empresa requerida,
-- y se organizan por fecha de nacionalizacion, y orden de registro en la nacionalizacion
--el saldo por cantidad que se coloca es realmente la cantidad nacionalizada de esa entrada en la nacionalizacion ordenada
for ents in  
	select entcodsx, entcodingreso, nadcodsx as entcodproducto, entbodega, entposicion, entcantidad, entpesoneto, 
	entpesonetototal, entpesobruto, entpesobrutototal, entsaldopesoneto, entsaldopesobruto,
	nadsaldo as entsaldonac , entsaldosinnac
	from ingreso, nacionalizacion, nacionalizacion_detalle, entrada 
	where ingcodsx = nacingreso and naccodsx = nadcodnac and entcodsx = nadentrada 
	and entcodproducto = producto   and entsaldonac >0 
	order by ingfecha , entbodega, entposicion asc 
	--order by nacfecha, nadcodsx  asc
LOOP
	return next ents;
end loop;


end if; --fin que el tipo de pedido sea NAC

---------------------------------------------------------------------
---------------------------------------------------------------------
--SALDO SIN NACIONALIZAR
--SOLO SE SACA DE LOS INGRESOS TIPO TRAFICO...

if tipopedido ='SNAC' then
--consulta que obtiene las entradas tipo trafico, que han tenido nacionalizaciones del producto requerido para la empresa requerida,
-- y se organizan por fecha de nacionalizacion, y orden de registro en la nacionalizacion
--el saldo por cantidad que se coloca es realmente la cantidad nacionalizada de esa entrada en la nacionalizacion ordenada
for ents in  
	select *
	from entrada 
	where entcodproducto = producto  AND entsaldosinnac >0 order by entfecha asc

LOOP
	return next ents;
end loop;

end if; --fin que el tipo de pedido sea SNAC




RETURN;

END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.lista_entradas_fifo(bigint, character varying) OWNER TO usersgl;

--
-- TOC entry 216 (class 1255 OID 23987)
-- Dependencies: 787 549 6
-- Name: lista_picking_reservado(bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION lista_picking_reservado(producto bigint) RETURNS SETOF subreporte_picking_reservado
    AS $$declare
rec record;

begin

for rec in
	select pickcodsx, pickcodpacking, pickestado ,sum(pickdcantidad) from picking_detalle, picking 
	where pickcodsx = pickdcodpicking and( pickpedido is null  ) and pickdproducto=producto
	group by pickcodsx, pickcodpacking , pickestado
loop
	return next rec;
end loop;

for rec in
	select pickcodsx, pickcodpacking, pickestado ,sum(pickdcantidad) from picking_detalle, picking , pedido
	where pickcodsx = pickdcodpicking and pickpedido = pedcodsx   and pickdproducto=producto  and pedpesobruto =0 
	group by pickcodsx, pickcodpacking , pickestado
loop
	return next rec;
end loop;



end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.lista_picking_reservado(producto bigint) OWNER TO usersgl;

--
-- TOC entry 217 (class 1255 OID 23988)
-- Dependencies: 787 6
-- Name: recalcular_kardex(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION recalcular_kardex() RETURNS "trigger"
    AS $$/*
Trigger que se encarga de recalcular el kardex cuando se elimina uno de sus registros, es decir, cuando
se ACTIVA cualquier movimiento (ingreso, nacionalizacion o despacho).
*/
--solo se HACE EN EL DELETE 
declare
temp record;
rec record;
anterior record;
saldonac numeric(15,2);
saldonnac numeric(15,2);

begin

if TG_OP = 'DELETE' then
  select into anterior * from kardex where kardcodproducto = old.kardcodproducto and kardfecha < old.kardfecha 
  order by kardfecha desc, kardcodsx desc limit 1;

  saldonac = anterior.kardsaldonac;
  saldonnac = anterior.kardsaldonnac;

  if saldonac is null then saldonac =0; end if;
  if saldonnac is null then saldonnac =0; end if;

  for rec in select * from kardex where kardcodproducto = old.kardcodproducto and kardfecha > old.kardfecha
  order by kardfecha asc, kardcodsx asc
  loop
  --si es un ingreso

  if rec.kardcodigoingreso is not null then
	-- si es tipo trafico, sumo al saldo no nacionalizado	
	if rec.kardtipoing='TRAFICO' then
	saldonnac = saldonnac + rec.kardcantingreso;
	saldonac = saldonac +0;
	else
	-- es otro tipo de ingreso, sumo al saldo nacionalizado:
	saldonnac = saldonnac + 0;
	saldonac = saldonac + rec.kardcantingreso;
	end if;
  end if;

  --si es una nacionalizacion
  if rec.kardcodnac is not null then
	saldonnac = saldonnac - rec.kardcantnac;
	saldonac = saldonac +  rec.kardcantnac;

  end if;

  --si es un despacho
  if rec.karddespacho is not null then
	saldonnac = saldonnac - rec.kardcantsalnnac;
	saldonac = saldonac - rec.kardcantsalnac;

  end if;

  --si es un ajuste de ingreso:p
  if rec.kardajuste is not null then

    --de ingreso:
    if rec.kardtipoing='AJUSTE' then

      select into temp * from ajuste where ajcodsx = rec.kardajuste;

    end if;

  end if;

	update kardex set kardsaldonac = saldonac, kardsaldonnac = saldonnac where kardcodsx = rec.kardcodsx;

  end loop;

  return old;
end if;

if TG_OP = 'INSERT' then
  select into anterior * from kardex where kardcodproducto = new.kardcodproducto and kardfecha < new.kardfecha 
  order by kardfecha desc, kardcodsx desc limit 1;

  saldonac = anterior.kardsaldonac;
  saldonnac = anterior.kardsaldonnac;

  if saldonac is null then saldonac =0; end if;
  if saldonnac is null then saldonnac =0; end if;

--raise notice 'Anterior saldonac % saldonnac %' , saldonac, saldonnac;
  for rec in select * from kardex where kardcodproducto = new.kardcodproducto and kardfecha >= new.kardfecha
  order by kardfecha asc, kardcodsx asc
  loop
  --si es un ingreso

  if rec.kardcodigoingreso is not null then
	-- si es tipo trafico, sumo al saldo no nacionalizado	
	if rec.kardtipoing='TRAFICO' then
	saldonnac = saldonnac + rec.kardcantingreso;
	saldonac = saldonac +0;
	else
	-- es otro tipo de ingreso, sumo al saldo nacionalizado:
	saldonnac = saldonnac + 0;
	saldonac = saldonac + rec.kardcantingreso;
	end if;
--raise notice 'Ingreso %' , rec.kardcantingreso;
  end if;

  --si es una nacionalizacion
  if rec.kardcodnac is not null then
	saldonnac = saldonnac - rec.kardcantnac;
	saldonac = saldonac +  rec.kardcantnac;

  end if;

  --si es un despacho
  if rec.karddespacho is not null then
	saldonnac = saldonnac - rec.kardcantsalnnac;
	saldonac = saldonac - rec.kardcantsalnac;
--raise notice 'Salida %' , rec.kardcantsalnac;
  end if;

  --si es un ajuste de ingreso:p
  if rec.kardajuste is not null then

    --de ingreso:
    if rec.kardtipoing='AJUSTE' then

      select into temp * from ajuste where ajcodsx = rec.kardajuste;

    end if;

  end if;
--raise notice 'saldonac % saldonnac %' , saldonac, saldonnac;
  update kardex set kardsaldonac = saldonac, kardsaldonnac = saldonnac where kardcodsx = rec.kardcodsx;

  end loop;

  return new;
end if;

end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.recalcular_kardex() OWNER TO usersgl;

--
-- TOC entry 218 (class 1255 OID 23989)
-- Dependencies: 787 534 6
-- Name: reporte_bodega_producto(bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION reporte_bodega_producto(bigint) RETURNS SETOF bodega_producto
    AS $_$declare
cia alias for $1;
rec record;
nacpeso numeric;
nacus numeric;
nnacus numeric;

begin
for rec in
	select bodnombre::varchar, promodelo::varchar, prodescripcion::varchar, procodsx::bigint, 
	sum(entsaldonacf)::numeric as nacf, sum(entsaldosinnacf)::numeric as nnacf,
	sum(entsaldopesoneto)::numeric as neto, sum(entsaldopesobruto)::numeric as bruto, 
0.00::numeric as saldovalornacpeso, 	
0.00::numeric as saldovalornacus ,
0.00::numeric as saldovalornnacus , bodcodsx::bigint
	from bodega, producto, entrada, ingreso
	where
	ingcodsx = entcodingreso and entcodproducto = procodsx and entbodega = bodcodsx 
	and ingestado='FINALIZADO'  and ingcodcia=cia
	group by bodnombre, promodelo, prodescripcion, procodsx, bodcodsx
	order by bodnombre, procodsx asc
loop
-- sumo lo que haya NACIONALIZADO EN PESOS, que fue lo que ingreso por DEVOLUCION / DESPIECE
select into nacpeso sum(entsaldonacf * entvalor)  from entrada, ingreso  where entcodproducto = rec.procodsx  and ingcodcia=cia
	and ingcodsx = entcodingreso and ingestado='FINALIZADO' and ingtipo!='TRAFICO' and entbodega = rec.bodcodsx;

-- sumo lo que haya NACIONALIZADO EN DOLARES, que fue lo que ingreso por TRAFICO
select into nacus sum(entsaldonacf * entvalor)  from entrada, ingreso  where entcodproducto = rec.procodsx  and ingcodcia=cia
	and ingcodsx = entcodingreso and ingestado='FINALIZADO' and ingtipo='TRAFICO' and entbodega = rec.bodcodsx;

-- sumo lo que haya no NACIONALIZADO EN DOLARES, que fue lo que ingreso por TRAFICO
select into nnacus sum(entsaldosinnacf * entvalor)  from entrada, ingreso   where entcodproducto = rec.procodsx  and ingcodcia=cia
	and ingcodsx = entcodingreso and ingestado='FINALIZADO' and ingtipo='TRAFICO' and entbodega = rec.bodcodsx;

if nacus is null then nacus=0; end if;
if nacpeso is null then nacpeso=0; end if;
if nnacus is null then nnacus=0; end if;

rec.saldovalornnacus= nnacus;
rec.saldovalornacpeso = nacpeso;
rec.saldovalornacus = nacus;


return next rec ;

end loop;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.reporte_bodega_producto(bigint) OWNER TO usersgl;

--
-- TOC entry 219 (class 1255 OID 23990)
-- Dependencies: 787 551 6
-- Name: reporte_inventario_empresa(bigint, timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION reporte_inventario_empresa(bigint, timestamp with time zone, timestamp with time zone) RETURNS SETOF tipo_reporte_inventario
    AS $_$DECLARE
compania ALIAS FOR $1;
fecha_ini ALIAS FOR $2;
fecha_fin ALIAS FOR $3;
rec record;
rec2 record;
res record;
temp1 record;
temp2 record;
temp3 record;

saldo_ant_nac numeric;
saldo_ant_nnac numeric;
--AVERIAS:
ave_pleg_nac numeric;
ave_prod_nac numeric;
ave_pleg_nnac numeric;
ave_prod_nnac numeric;

--ajustes:
aj_pos_nac numeric;
aj_neg_nac numeric;
aj_pos_nnac numeric;
aj_neg_nnac numeric;

acum_nac numeric;
acum_dev numeric;

pend_desp_nac numeric;
pend_desp_nnac numeric;

ped_tram_nac  numeric;
ped_tram_nnac  numeric;

acum_desp numeric;

saldo_fin_nac numeric;
saldo_fin_nnac numeric;
saldo_fisico_nac numeric;
saldo_fisico_nnac numeric;


BEGIN
for rec in select * from producto, categoria, public.compania  where comcodsx = procodigocia and  catcodsx= procategoria 
and procodigocia = compania order by catnombre
LOOP
--saco el saldo nac y saldonnac hasta ANTES de la fecha de consulta, lo saco de la tabla del kardex donde esta
--todo lo ejecutado de entrada, nacionalizado o salida
select into saldo_ant_nac kardsaldonac from 
	kardex where kardfecha <=fecha_ini and kardcodproducto = rec.procodsx order by kardfecha desc, kardcodsx desc limit 1;
if saldo_ant_nac is null then  saldo_ant_nac=0; end if;
select into saldo_ant_nnac kardsaldonnac from 
	kardex where kardfecha <=fecha_ini and kardcodproducto = rec.procodsx order by kardfecha desc, kardcodsx desc limit 1;
if saldo_ant_nnac is null then  saldo_ant_nnac=0; end if;

--ahora saco lo de las averias al final del mes:
select into ave_pleg_nac sum(avesaldo_pleg_nac) from averia, entrada where  aveentrada = entcodsx and entcodproducto = rec.procodsx and avefecha <=fecha_fin and aveestado='FINALIZADO';
if ave_pleg_nac is null then ave_pleg_nac=0; end if;
select into ave_prod_nac sum(avesaldo_prod_nac) from averia, entrada where  aveentrada = entcodsx and entcodproducto = rec.procodsx and avefecha <=fecha_fin and aveestado='FINALIZADO';
if ave_prod_nac is null then ave_prod_nac=0; end if;
select into ave_pleg_nnac sum(avesaldo_pleg_nnac) from averia, entrada where  aveentrada = entcodsx and entcodproducto = rec.procodsx and avefecha <=fecha_fin and aveestado='FINALIZADO';
if ave_pleg_nnac is null then ave_pleg_nnac=0; end if;
select into ave_prod_nnac sum(avesaldo_prod_nnac)  from averia, entrada where  aveentrada = entcodsx and entcodproducto = rec.procodsx and avefecha <=fecha_fin and aveestado='FINALIZADO';
if ave_prod_nnac is null then ave_prod_nnac=0; end if;


--lo acumulado nacionalizado:
SELECT into acum_nac sum(nadcantidad) from nacionalizacion, nacionalizacion_detalle, entrada 
where naccodsx = nadcodnac and nadentrada = entcodsx 
and entcodproducto = rec.procodsx and nacestado='FINALIZADO';
if acum_nac is null then acum_nac:=0; end if;

--LO ACUMULADO EN DEVOLUCIONES DE ESTE ITEM:
select into acum_dev sum(entcantidad) from ingreso, entrada where 
ingcodsx = entcodingreso and ingestado='FINALIZADO'  and ingtipo='DEVOLUCION' and 
entcodproducto=rec.procodsx  and ingfecha >=fecha_ini and ingfecha <= fecha_fin;
if acum_dev is null then acum_dev=0; end if;

--LO ACUMULADO EN  AJUSTES DEL MES:
for rec2 in select * from ajuste, entrada where ajentrada = entcodsx and entcodproducto = rec.procodsx and 
ajestado='FINALIZADO' AND ajfecha >= fecha_ini and ajfecha <= fecha_fin 
loop
aj_pos_nac = aj_pos_nac + rec2.aj_pos_nac;
aj_neg_nac = aj_neg_nac + rec2.aj_neg_nac;
aj_pos_nnac = aj_pos_nnac + rec2.aj_pos_nnac;
aj_neg_nnac= aj_neg_nnac + rec2.aj_neg_nnac;

end loop;

if aj_pos_nac is null then aj_pos_nac=0; end if;
if aj_neg_nac is null then aj_neg_nac=0; end if;
if aj_pos_nnac is null then aj_pos_nnac=0; end if;
if aj_neg_nnac is null then aj_neg_nnac=0; end if;


--lo pendiente por despachar, no es historico, es solo lo que haya aun por despachar cuyo pedido este en este
--rango de fechas:
select into pend_desp_nac sum(refpsaldo) from pedido, referencia_pedido where pedcodsx = refpnumpedido and 
refpproducto = rec.procodsx and pedestado='FINALIZADO' and pedtipo='NAC' and pedfechasistema >=fecha_ini and pedfechasistema <= fecha_fin;
if pend_desp_nac is null then pend_desp_nac=0; end if;

select into pend_desp_nnac sum(refpsaldo) from pedido, referencia_pedido where pedcodsx = refpnumpedido and 
refpproducto = rec.procodsx and pedestado='FINALIZADO' and pedtipo='SNAC' and pedfechasistema >=fecha_ini and pedfechasistema <= fecha_fin;
if pend_desp_nnac is null then pend_desp_nnac=0; end if;

--los pedidos hechos en ese rango:
select into acum_desp sum(refdcant) from referencia_despacho, despacho_pedido, despacho where despeddespacho = despcodsx 
and despedcodsx = refddespacho_pedido and despestado='FINALIZADO' and 
refdproducto=rec.procodsx and despfecha >=fecha_ini and despfecha <= fecha_fin;
if acum_desp is null then acum_desp=0; end if;

--los pedidos en tramite:
select into ped_tram_nac sum(refpcantidad) from pedido, referencia_pedido where pedcodsx = refpnumpedido and 
refpproducto = rec.procodsx and pedestado='TRAMITE' and pedtipo='NAC' and pedfechasistema >=fecha_ini and pedfechasistema <= fecha_fin;
if ped_tram_nac is null then ped_tram_nac=0; end if;

select into ped_tram_nnac sum(refpcantidad) from pedido, referencia_pedido where pedcodsx = refpnumpedido and 
refpproducto = rec.procodsx and pedestado='TRAMITE' and pedtipo='SNAC' and pedfechasistema >=fecha_ini and pedfechasistema <= fecha_fin;
if ped_tram_nnac is null then ped_tram_nnac=0;  end if;

--saldo al final ejecutado, sacado del kardex:
select into saldo_fin_nac kardsaldonac from 
	kardex where kardfecha <=fecha_fin and kardcodproducto = rec.procodsx order by kardfecha desc, kardcodsx desc limit 1;
if saldo_fin_nac is null then saldo_fin_nac=0;  end if;

select into saldo_fin_nnac kardsaldonnac from 
	kardex where kardfecha <=fecha_fin and kardcodproducto = rec.procodsx order by kardfecha desc, kardcodsx desc limit 1;
if saldo_fin_nnac is null then saldo_fin_nnac=0;  end if;

saldo_fin_nac = saldo_fin_nac - (ave_pleg_nac + ave_prod_nac);
saldo_fin_nnac = saldo_fin_nnac - (ave_pleg_nnac + ave_prod_nnac);

--EL SALDO FISICO REAL SERA = tramite + pend_desp + ejecutado - averias nac / averias nnac
saldo_fisico_nac = saldo_fin_nac + pend_desp_nac + ped_tram_nac ;
saldo_fisico_nnac = saldo_fin_nnac + pend_desp_nnac + ped_tram_nnac ;

/*
for temp3 in select 0::int8, ''::VARCHAR,''::VARCHAR,''::VARCHAR,''::VARCHAR,''::VARCHAR,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,
0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,
0::numeric,0::numeric
*/

--los saldos reales y del sistem alos voy a sacar de la entrada y listo
select into saldo_fin_nac, saldo_fin_nnac , saldo_fisico_nac, saldo_fisico_nnac
sum(entsaldonac), sum(entsaldosinnac), sum(entsaldonacf), sum(entsaldosinnacf)
from entrada where entcodproducto=rec.procodsx;

if saldo_fin_nac is null then saldo_fin_nac=0;  end if;
if saldo_fin_nnac is null then saldo_fin_nnac=0;  end if;
if saldo_fisico_nac is null then saldo_fisico_nac=0;  end if;
if saldo_fisico_nnac is null then saldo_fisico_nnac=0;  end if;


for temp3 in select rec.comcodsx::int8, rec.comnombre, rec.catnombre, rec.catdescripcion, rec.promodelo, rec.prodescripcion,
saldo_ant_nac, saldo_ant_nnac, ave_pleg_nac, ave_prod_nac , ave_pleg_nnac , ave_prod_nnac, acum_nac, 
acum_dev,
aj_pos_nac , aj_neg_nac, aj_pos_nnac, aj_neg_nnac, pend_desp_nac + pend_desp_nnac, acum_desp, 
ped_tram_nac, ped_tram_nnac,
saldo_fin_nac, saldo_fin_nnac , saldo_fisico_nac, saldo_fisico_nnac


LOOP
	return next temp3;
end loop;


END LOOP;

--return temp3;

END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.reporte_inventario_empresa(bigint, timestamp with time zone, timestamp with time zone) OWNER TO usersgl;

--
-- TOC entry 220 (class 1255 OID 23992)
-- Dependencies: 551 6 787
-- Name: reporte_inventario_fecha_categoria(bigint, bigint, timestamp with time zone); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION reporte_inventario_fecha_categoria(bigint, bigint, timestamp with time zone) RETURNS SETOF tipo_reporte_inventario
    AS $_$DECLARE
compania ALIAS FOR $1;
cate ALIAS FOR $2;
fecha_fin ALIAS FOR $3;
rec record;
rec2 record;
res record;
temp1 record;
temp2 record;
temp3 record;

saldo_ant_nac numeric;
saldo_ant_nnac numeric;
--AVERIAS:
ave_pleg_nac numeric;
ave_prod_nac numeric;
ave_pleg_nnac numeric;
ave_prod_nnac numeric;

--ajustes:
aj_pos_nac numeric;
aj_neg_nac numeric;
aj_pos_nnac numeric;
aj_neg_nnac numeric;

acum_nac numeric;
acum_dev numeric;

pend_desp_nac numeric;
pend_desp_nnac numeric;

ped_tram_nac  numeric;
ped_tram_nnac  numeric;

acum_desp numeric;

saldo_fin_nac numeric;
saldo_fin_nnac numeric;
saldo_fisico_nac numeric;
saldo_fisico_nnac numeric;


BEGIN
for rec in select * from producto, categoria, public.compania  
where comcodsx = procodigocia and  catcodsx= procategoria 
and procodigocia = compania and procategoria=cate order by catnombre
LOOP
--saco el saldo nac y saldonnac hasta ANTES de la fecha de consulta, lo saco de la tabla del kardex donde esta
--todo lo ejecutado de entrada, nacionalizado o salida
select into saldo_ant_nac kardsaldonac from 
	kardex where kardfecha <= fecha_fin and kardcodproducto = rec.procodsx 
order by kardfecha desc, kardcodsx desc limit 1;
if saldo_ant_nac is null then  saldo_ant_nac=0; end if;

select into saldo_ant_nnac kardsaldonnac from 
	kardex where kardfecha <=fecha_fin and kardcodproducto = rec.procodsx 
order by kardfecha desc, kardcodsx desc limit 1;
if saldo_ant_nnac is null then  saldo_ant_nnac=0; end if;

/*
for temp3 in select 0::int8, ''::VARCHAR,''::VARCHAR,''::VARCHAR,''::VARCHAR,''::VARCHAR,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,
0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,0::numeric,
0::numeric,0::numeric
*/

--los saldos reales y del sistem alos voy a sacar de la entrada y listo

for temp3 in select rec.comcodsx::int8, rec.comnombre, rec.catnombre, rec.catdescripcion, rec.promodelo, rec.prodescripcion,
saldo_ant_nac, saldo_ant_nnac, 0::numeric, 0::numeric , 0::numeric , 0::numeric, 0::numeric, 
0::numeric,
0::numeric , 0::numeric, 0::numeric, 0::numeric, 0::numeric, 0::numeric, 
0::numeric, 0::numeric,
0::numeric, 0::numeric , 0::numeric, 0::numeric


LOOP
	return next temp3;
end loop;


END LOOP;

--return temp3;

END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.reporte_inventario_fecha_categoria(bigint, bigint, timestamp with time zone) OWNER TO usersgl;

--
-- TOC entry 221 (class 1255 OID 23993)
-- Dependencies: 547 6 787
-- Name: reporte_kardex_categoria(bigint, bigint, date, date); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION reporte_kardex_categoria(bigint, bigint, date, date) RETURNS SETOF reporte_kardex_categoria
    AS $_$declare
comp alias for $1;
categ alias for $2;
fecha_ini alias for $3;
fecha_fin alias for $4;

ent numeric;
sal numeric;
saldo numeric;
valor_dia_elec numeric;
saldoini numeric;
promedio numeric;
contadordia numeric;
acumulado numeric;
diaanterior date;
diaactual date;
diasiguiente date;
saldodiaanterior numeric;

rec0 record; 
rec1 record;
rec2 record;
rec record;
kard record;
recfecha record;

begin
  valor_dia_elec=0;                                    
  contadordia = 0;
  acumulado = 0;
  diaactual = fecha_ini;
  diaanterior = date_trunc('day',diaactual) + interval '-1 days';
  diasiguiente = date_trunc('day',diaactual) + interval '1 days';
 while diaactual <= date_trunc('day',fecha_fin) loop
        select into rec0 diaactual as date, catcodsx, catnombre
               from categoria
               where catcodsx = categ 
               order by catnombre;
        select into rec diaactual as date, catcodsx, catnombre, sum(kardcantingreso) as ingresos, 
               sum(kardcantsalnac) + sum(kardcantsalnnac) as salidas,0.00 as sald
               from kardex, producto ,categoria
               where kardcodproducto = procodsx and procategoria = catcodsx  and kardfecha::date >= diaactual 
               and kardfecha::date < diasiguiente and procategoria = categ and kardcompania=comp
               group by catcodsx, catnombre, kardfecha::date
               order by catnombre, kardfecha::date  asc limit 1;
	for rec2 in select procodsx from producto, kardex where procodsx = kardcodproducto and procategoria = rec.catcodsx
                        and procodigocia=comp
			group by procodsx ORDER BY PROCODSX
	loop
		select into kard * from kardex where kardcodproducto = rec2.procodsx and kardfecha::date <= diaactual
		order by kardfecha desc, kardcodsx desc limit 1;

		if kard.kardsaldonac is null then kard.kardsaldonac=0; end if;
		if kard.kardsaldonnac is null then kard.kardsaldonnac=0; end if;

		valor_dia_elec = valor_dia_elec + (kard.kardsaldonac + kard.kardsaldonnac);

	end loop;
        if valor_dia_elec = 0 then valor_dia_elec=saldodiaanterior; end if;
	rec.sald = valor_dia_elec;
        if rec.ingresos is null then rec.ingresos=0; end if;
        if rec.salidas is null then rec.salidas=0; end if;
        saldoini = valor_dia_elec+rec.salidas-rec.ingresos;
	raise notice'saldoini: % - valor_dia % + ingresos-salidas %', saldoini, valor_dia_elec, rec.ingresos-rec.salidas ;
        contadordia = to_number(to_char(date_trunc('day', diaactual)-date_trunc('day', fecha_ini),'dd'),'999999999') + 1;
        acumulado = acumulado + rec.sald;
        promedio = acumulado / contadordia;
        raise notice'fecha: % - dias: % - saldo: % - prom: % ', diaactual,contadordia,acumulado,promedio;
	for rec1  in select  rec0.catnombre::varchar, diaactual::timestamp, saldoini::numeric, rec.ingresos::numeric, rec.salidas::numeric, 
                             valor_dia_elec::numeric ,promedio::numeric
	loop 
		return next rec1;
	end loop;
    saldodiaanterior = valor_dia_elec;
	valor_dia_elec=0;
    diaanterior = diaactual;
    diaactual = date_trunc('day',diaactual) + interval '1 days';
    diasiguiente = date_trunc('day',diaactual) + interval '1 days';
   end loop;
end;

$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.reporte_kardex_categoria(bigint, bigint, date, date) OWNER TO usersgl;

--
-- TOC entry 222 (class 1255 OID 23994)
-- Dependencies: 787 6
-- Name: resumen_ajuste(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION resumen_ajuste() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;
temp2 record;
BEGIN


IF TG_RELNAME='ajuste'  THEN

--datos del ajuste:
res := new.ajcodsx ||' ' || new.ajfecha  ;
--datos de compania:
select into temp1 * from compania where comcodsx = new.ajcodcia;
select into temp2 * from producto, entrada where procodsx  = entcodproducto and entcodsx = new.ajentrada;

res := res ||' '|| temp1.comnombre  ||' '||temp2.prodescripcion || ' ' || temp2.promodelo || ' ' ||  temp2.entposicion;

--ACTUALIZO EL despacho:
res = upper(res);
new.resumen := res;


return new;

END IF;
END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.resumen_ajuste() OWNER TO usersgl;

--
-- TOC entry 223 (class 1255 OID 23995)
-- Dependencies: 6 787
-- Name: resumen_averia(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION resumen_averia() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN


IF TG_RELNAME='averia'  THEN

--datos del ajuste:
res := new.avecodsx||' ' || new.avefecha  ||' ' || new.avetipo ||' ' ||  new.aveposdest ;
--datos de compania:
select into temp1 * from compania where comcodsx = new.avecompania;
res := res ||' '|| temp1.comnombre;
select into temp1 * from producto, entrada where entcodproducto = 
procodsx and entcodsx = new.aveentrada;
res := res ||' '|| temp1.promodelo ||' '|| temp1.prodescripcion;

--ACTUALIZO EL despacho:
res = upper(res);
new.resumen := res;


return new;

END IF;
END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.resumen_averia() OWNER TO usersgl;

--
-- TOC entry 224 (class 1255 OID 23996)
-- Dependencies: 787 6
-- Name: resumen_despacho(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION resumen_despacho() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN


IF TG_RELNAME='despacho'  THEN

--datos del despacho:
res := new.despcodsx ||' ' || new.despfecha ||' ' || new.despplaca ||' ' || new.despnombrecond ||' ' || new.despestado  ||' ' || coalesce(new.despobservacion,'');

-- compania:
select into temp1 * from compania where comcodsx = new.despempresa;
res := res || ' ' || temp1.comnombre; 
-- transportadora:
select into temp1 * from transportadora where transpcodsx= new.desptransportadora;
res := res || ' ' || temp1.transpnombre; 


--miro los despachos que hayan en el pedido
for rec in select * from pedido, despacho_pedido where despedpedido = pedcodsx 
and despeddespacho = new.despcodsx  
LOOP

--por cada pedido saco el numero, la orden de compra, la guia, el cliente, el departamento,
--la ciuad y los productos
res := res ||' ' || rec.pednumpedido  ||' ' || rec.pedordencompra ||' ' || rec.pedguia ||' ' ||  coalesce(rec.pedfactura,'');
-- cliente:
select into temp1 * from cliente where clicodsx = rec.pedcliente;
res := res || ' ' || temp1.clinombre; 
-- ciudad:
select into temp1 * from ciudad where ciucodigo = rec.pedciudad;
res := res || ' ' || temp1.ciunombre; 
-- departamento:
select into temp1 * from departamento where depcodigo = rec.peddepartamento;
res := res || ' ' || temp1.depnombre; 

-- productos:
for temp1 in select promodelo, prodescripcion from producto, referencia_despacho where
procodsx = refdproducto and refddespacho_pedido = rec.despedcodsx
group by promodelo, prodescripcion 
LOOP
	res := res ||' ' || temp1.promodelo ||' ' || temp1.prodescripcion;
END LOOP;

END LOOP;

--ACTUALIZO EL despacho:
res = upper(res);
new.resumen := res;


END IF;

IF TG_RELNAME='referencia_despacho' THEN
  if TG_OP='DELETE' THEN
--   update despacho set despcodsx = old.refpnumpedido where pedcodsx= old.refpnumpedido;
  ELSE
 --   update pedido set pedcodsx = new.refpnumpedido where pedcodsx= new.refpnumpedido;
  END IF;
END IF;





if TG_OP='DELETE' THEN
return old;
else
return new;
end if;

END;

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.resumen_despacho() OWNER TO usersgl;

--
-- TOC entry 225 (class 1255 OID 23997)
-- Dependencies: 6 787
-- Name: resumen_entrada(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION resumen_entrada() RETURNS "trigger"
    AS $$--
--Trigger que permite llenar el campo "resumen" de la tablas DEL ESQUEMA PUBLICcon 
--los datos principales, usado para las busquedas.
--Cuando se haga un select * from TABLA, y se reciban parametros, estos seran
--consultados en la columna resumen
--
--SOLO SE HACE CON EL CREATE Y EL UPTADE
DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;
temp2 record;
temp3 record;
temp4 record;

BEGIN
--en create y update

IF TG_RELNAME='entrada'  THEN

select into temp1 * from producto where procodsx = new.entcodproducto;
select into temp2 * from bodega where bodcodsx = new.entbodega;
res := temp1.promodelo || ' ' || temp1.prodescripcion || ' ' || new.entposicion || ' ' || temp2.bodnombre;

res := upper(res);
new.resumen := res;

return new;
end if;

END;

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.resumen_entrada() OWNER TO usersgl;

--
-- TOC entry 226 (class 1255 OID 23998)
-- Dependencies: 787 6
-- Name: resumen_ingreso(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION resumen_ingreso() RETURNS "trigger"
    AS $$--
--Trigger que permite llenar el campo "resumen" de la tablas DEL ESQUEMA PUBLICcon 
--los datos principales, usado para las busquedas.
--Cuando se haga un select * from TABLA, y se reciban parametros, estos seran
--consultados en la columna resumen
--
--SOLO SE HACE CON EL CREATE Y EL UPTADE
DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;
temp2 record;
temp3 record;
temp4 record;

BEGIN


IF TG_RELNAME='ingreso'  THEN

--datos del ingreso:
res := new.ingcodsx ||' ' || new.ingfecha ||' ' || new.ingtipo
	||' ' || coalesce(new.ingtrafico,0) ||' ' || new.ingestado||' ' || new.ingobservacion;
--datos de compania:
select into temp1 * from compania where comcodsx = new.ingcodcia;
res := res ||' '|| temp1.comnombre;
--datos del trafico:
select into temp1 * from trafico where trafcodsx = new.ingtrafico;
if temp1.trafcodsx is not null then
	res:=  res || ' ' || temp1.trafdocumento  || ' ' ||  temp1.trafembarque;
end if;
--datos si es devolucion:
if new.ingtipo='DEVOLUCION' then
select into temp1 * from causal where caucodsx = new.ingcausal;
	res:=  res || ' ' || temp1.caudesc;
select into temp1 * from cliente where clicodsx= new.ingcli_devolucion;
	res:=  res || ' ' || temp1.clinombre;
select into temp1 * from ciudad where ciucodigo= new.ingciudad_dev;
	res:=  res || ' ' || temp1.ciunombre;
end if;

--referencias:
for rec in select promodelo, prodescripcion from producto, entrada , ingreso where
procodsx = entcodproducto  and ingcodsx = entcodingreso and entcodingreso = new.ingcodsx
group by promodelo, prodescripcion LOOP
	res := res ||' ' || rec.promodelo ||' ' || rec.prodescripcion;
END LOOP;

--ACTUALIZO EL ingreso:
res = upper(res);
new.resumen := res;


END IF;

IF TG_RELNAME='entrada' THEN
  if TG_OP='DELETE' THEN
   update ingreso set ingcodsx= old.entcodingreso where ingcodsx = old.entcodingreso;
  ELSE
    update ingreso set ingcodsx= new.entcodingreso where ingcodsx= new.entcodingreso;
  END IF;
END IF;







if TG_OP='DELETE' THEN
return old;
else
return new;
end if;

END;

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.resumen_ingreso() OWNER TO usersgl;

--
-- TOC entry 227 (class 1255 OID 23999)
-- Dependencies: 6 787
-- Name: resumen_nacionalizacion(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION resumen_nacionalizacion() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;
temp2 record;
temp3 record;
temp4 record;

BEGIN


IF TG_RELNAME='nacionalizacion'  THEN

--datos de la nacionalizacion:
res := new.naccodsx ||' ' || new.nacfecha ||' ' || new.nacestado 
       ||' ' || new.nacdeclaracion || ' ' || new.nacingreso ;
--datos de compania:
select into temp1 * from compania where comcodsx = new.nacempresa;
res := res ||' '|| temp1.comnombre;

--datos del trafico:
select into temp1 * from trafico, ingreso where trafcodsx = ingtrafico 
and ingcodsx = new.nacingreso;
if temp1.trafcodsx is not null then
	res:=  res || ' ' || temp1.trafdocumento  || ' ' ||  temp1.trafembarque;
end if;


--referencias:
for rec in select promodelo, prodescripcion from producto, entrada, 
nacionalizacion_detalle where
procodsx = entcodproducto  and nadentrada = entcodsx and nadcodnac = new.naccodsx
group by promodelo, prodescripcion LOOP
	res := res ||' ' || rec.promodelo ||' ' || rec.prodescripcion;
END LOOP;

--ACTUALIZO EL ingreso:
res = upper(res);
new.resumen := res;


END IF;

IF TG_RELNAME='nacionalizacion_detalle' THEN
  if TG_OP='DELETE' THEN
   update nacionalizacion set naccodsx= old.nadcodnac where naccodsx = old.nadcodnac;
  ELSE
   update nacionalizacion set naccodsx= new.nadcodnac where naccodsx = new.nadcodnac;
  END IF;
END IF;







if TG_OP='DELETE' THEN
return old;
else
return new;
end if;

END;

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.resumen_nacionalizacion() OWNER TO usersgl;

--
-- TOC entry 228 (class 1255 OID 24000)
-- Dependencies: 6 787
-- Name: resumen_nacionalizacion_Detalle(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION "resumen_nacionalizacion_Detalle"() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;
temp2 record;
temp3 record;
temp4 record;

BEGIN


IF TG_RELNAME='nacionalizacion_detalle'  THEN

select into temp1 * from producto , entrada where   procodsx = entcodproducto and entcodsx = new.nadentrada;

res = temp1.promodelo || ' ' || temp1.prodescripcion || ' ' || temp1.entposicion;
--ACTUALIZO EL ingreso:
res = upper(res);
new.resumen := res;


END IF;




if TG_OP='DELETE' THEN
return old;
else
return new;
end if;

END;

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento."resumen_nacionalizacion_Detalle"() OWNER TO usersgl;

--
-- TOC entry 229 (class 1255 OID 24001)
-- Dependencies: 6 787
-- Name: resumen_packing(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION resumen_packing() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN


IF TG_RELNAME='packing'  THEN

--datos del packing:
res := new.packcodsx ||' ' || new.packfecha ||' ' || new.packestado 
	||' ' || new.packobservaciones;
-- compania:
select into temp1 * from compania where comcodsx = new.packempresa;
res := res || ' ' || temp1.comnombre; 
-- productos:
for rec in select promodelo, prodescripcion from producto, 
packing_detalle where
procodsx = packdproducto and packdpacking = new.packcodsx
group by promodelo, prodescripcion LOOP
	res := res ||' ' || rec.promodelo ||' ' || rec.prodescripcion;
END LOOP;

--ACTUALIZO EL packing:
res = upper(res);
new.resumen := res;


END IF;

IF TG_RELNAME='packing_detalle' THEN
  if TG_OP='DELETE' THEN
   update packing set packcodsx = old.packdpacking where packcodsx = old.packdpacking;
  ELSE
    update packing set packcodsx = new.packdpacking where packcodsx = new.packdpacking;
  END IF;
END IF;





if TG_OP='DELETE' THEN
return old;
else
return new;
end if;

END;

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.resumen_packing() OWNER TO usersgl;

--
-- TOC entry 230 (class 1255 OID 24002)
-- Dependencies: 787 6
-- Name: resumen_packing_detalle(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION resumen_packing_detalle() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN
--en create y update

IF TG_RELNAME='packing_detalle'  THEN

select into temp1 * from producto where procodsx = new.packdproducto;
res := temp1.promodelo || ' ' || temp1.prodescripcion;

res := upper(res);
new.resumen := res;

return new;
end if;

END;

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.resumen_packing_detalle() OWNER TO usersgl;

--
-- TOC entry 231 (class 1255 OID 24003)
-- Dependencies: 787 6
-- Name: resumen_pedido(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION resumen_pedido() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN


IF TG_RELNAME='pedido'  THEN

--datos del picking:
res := new.pedcodsx ||' ' || new.pedfechasistema ||' ' || new.pednumpedido
	||' ' || new.pedguia ||' ' || new.pedordencompra 
        ||' ' || coalesce(new.pedfactura,'')||' ' ||new.pedestado;
-- compania:
select into temp1 * from compania where comcodsx = new.pedcompania;
res := res || ' ' || temp1.comnombre; 
-- cliente:
select into temp1 * from cliente where clicodsx = new.pedcliente;
res := res || ' ' || temp1.clinombre; 
-- ciudad:
select into temp1 * from ciudad where ciucodigo = new.pedciudad;
res := res || ' ' || temp1.ciunombre; 
-- departamento:
select into temp1 * from departamento where depcodigo = new.peddepartamento;
res := res || ' ' || temp1.depnombre; 



-- productos:
for rec in select promodelo, prodescripcion from producto, 
referencia_pedido where
procodsx = refpproducto and refpnumpedido = new.pedcodsx
group by promodelo, prodescripcion LOOP
	res := res ||' ' || rec.promodelo ||' ' || rec.prodescripcion;
END LOOP;

--ACTUALIZO EL pedido:
res = upper(res);
new.resumen := res;


END IF;

IF TG_RELNAME='referencia_pedido' THEN
  if TG_OP='DELETE' THEN
   update pedido set pedcodsx = old.refpnumpedido where pedcodsx= old.refpnumpedido;
  ELSE
    update pedido set pedcodsx = new.refpnumpedido where pedcodsx= new.refpnumpedido;
  END IF;
END IF;


IF TG_RELNAME='causal_pedido' THEN

res := new.cauppedido ||' ' ||new.caupcausal ||' ' ||new.caupdesccausal ||' ' ||new.caupfecha;


res = upper(res);
new.resumen := res;

END IF;

IF TG_RELNAME='novedad_pedido' THEN

res := new.novpedido ||' ' ||new.novdesc||' ' ||new.novfecha ;


res = upper(res);
new.resumen := res;

END IF;




if TG_OP='DELETE' THEN
return old;
else
return new;
end if;

END;

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.resumen_pedido() OWNER TO usersgl;

--
-- TOC entry 232 (class 1255 OID 24004)
-- Dependencies: 787 6
-- Name: resumen_picking(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION resumen_picking() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN


IF TG_RELNAME='picking'  THEN

--datos del picking:
res := new.pickcodsx ||' ' || new.pickfecha ||' ' || new.pickestado 
	||' ' || new.pickobservaciones;
-- compania:
select into temp1 * from compania where comcodsx = new.pickempresa;
res := res || ' ' || temp1.comnombre; 
-- productos:
for rec in select promodelo, prodescripcion from producto, 
picking_detalle where
procodsx = pickdproducto and pickdcodpicking= new.pickcodsx
group by promodelo, prodescripcion LOOP
	res := res ||' ' || rec.promodelo ||' ' || rec.prodescripcion;
END LOOP;

--ACTUALIZO EL packing:
res = upper(res);
new.resumen := res;


END IF;

IF TG_RELNAME='picking_detalle' THEN
  if TG_OP='DELETE' THEN
   update picking set pickcodsx = old.pickdcodpicking where pickcodsx = old.pickdcodpicking;
  ELSE
    update picking set pickcodsx = new.pickdcodpicking where pickcodsx = new.pickdcodpicking;
  END IF;
END IF;





if TG_OP='DELETE' THEN
return old;
else
return new;
end if;

END;

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.resumen_picking() OWNER TO usersgl;

--
-- TOC entry 233 (class 1255 OID 24005)
-- Dependencies: 787 6
-- Name: resumen_picking_detalle(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION resumen_picking_detalle() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN
--en create y update

IF TG_RELNAME='picking_detalle'  THEN

select into temp1 * from producto where procodsx = new.pickdproducto;
res := temp1.promodelo || ' ' || temp1.prodescripcion;

res := upper(res);
new.resumen := res;

return new;
end if;

END;

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.resumen_picking_detalle() OWNER TO usersgl;

--
-- TOC entry 234 (class 1255 OID 24006)
-- Dependencies: 6 787
-- Name: resumen_referencia_pedido(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION resumen_referencia_pedido() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN
--en create y update

IF TG_RELNAME='referencia_pedido'  THEN

select into temp1 * from producto where procodsx = new.refpproducto;
res := temp1.promodelo || ' ' || temp1.prodescripcion ||' ' || new.refpposicion;

res := upper(res);
new.resumen := res;

return new;
end if;

END;

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.resumen_referencia_pedido() OWNER TO usersgl;

--
-- TOC entry 235 (class 1255 OID 24007)
-- Dependencies: 6 787
-- Name: resumen_reparacion(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION resumen_reparacion() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN


IF TG_RELNAME='reparacion'  THEN

--datos de la reparacion:
res := new.repcodsx||' ' || new.repfecha  ||' ' || new.repsaldo ||' ' ||  new.repdestino ||' ' ||   new.repestado;
--datos de compania:
select into temp1 * from compania where comcodsx = new.repcodcia;
res := res ||' '|| temp1.comnombre;

--ACTUALIZO EL despacho:
res = upper(res);
new.resumen := res;


return new;

END IF;

IF TG_RELNAME='reparacion_detalle'  THEN
--datos de la proreparacion:
res := new.repdaveria;
--datos de compania:
select into temp1 * from producto where procodsx = new.repdproducto;
res := res ||' '|| temp1.promodelo ||' ' || temp1.prodescripcion ||' ' || new.repdposicion  ||' ' ||  new.repdposicion_dest;

--ACTUALIZO la reparacion_detalle:
res = upper(res);
new.resumen := res;


return new;

END IF;



END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.resumen_reparacion() OWNER TO usersgl;

--
-- TOC entry 236 (class 1255 OID 24008)
-- Dependencies: 787 6
-- Name: resumen_reubicacion(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION resumen_reubicacion() RETURNS "trigger"
    AS $$DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;

BEGIN


IF TG_RELNAME='reubicacion'  THEN

--datos de la reubicacion:
res := new.recodsx ||' ' || new.refecha ||' ' || new.retipo ||' ' ||  new.retipomov
	||' ' || new.reestado;
--datos de compania:
select into temp1 * from compania where comcodsx = new.recodcia;
res := res ||' '|| temp1.comnombre;
--datos del producto:
select into temp1 * from producto, entrada where entcodproducto = procodsx
and entcodsx = new.reentradaor;
	res:=  res || ' ' || temp1.promodelo  || ' ' ||  temp1.prodescripcion;

--datos de la bodega de origen:
select into temp1 * from entrada, bodega where entbodega = bodcodsx and entcodsx = new.reentradaor;
  res:= res || ' ' || temp1.bodnombre || ' ' || temp1.entposicion;

--datos de la bodega de destino:
select into temp1 * from entrada, bodega where entbodega = bodcodsx and entcodsx = new.reentradafin;
 res:= res || ' ' || temp1.bodnombre || ' ' || temp1.entposicion;

--DATOS del trafico y el ingreso

select into temp1 * from entrada, ingreso, trafico where entcodsx = new.reentradaor
and ingcodsx = entcodingreso and ingtrafico = trafcodsx;
if temp1.trafcodsx is not null then
	res := res || ' ' ||  temp1.trafembarque || ' ' ||  temp1.trafdocumento || ' ' || temp1.ingcodsx;
end if; 

 
res = upper(res);
new.resumen := res;

end if;
return new;

END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.resumen_reubicacion() OWNER TO usersgl;

--
-- TOC entry 237 (class 1255 OID 24009)
-- Dependencies: 552 6 787
-- Name: resumen_saldos_embarque(bigint, character varying, timestamp with time zone); Type: FUNCTION; Schema: movimiento; Owner: postgres
--

CREATE FUNCTION resumen_saldos_embarque(bigint, character varying, timestamp with time zone) RETURNS SETOF tipo_saldo_embarque
    AS $_$
DECLARE
cia ALIAS FOR $1;
emb ALIAS FOR $2;
fec ALIAS FOR $3;
fini date;
rec1 RECORD;
rec2 RECORD;
rec3 RECORD;

BEGIN
  fini = date_trunc('day',fec);
  FOR rec1 IN SELECT ingreso.ingcodsx, ingreso.ingfecha, ingreso.ingcantidad, ingreso.ingpesoneto, ingreso.ingpesobruto, 
                    trafico.trafembarque, trafico.trafdocumento, trafico.trafnumdta
               FROM ingreso, trafico
              WHERE ingreso.ingcodcia = cia 
                AND ingreso.ingfecha <= fini 
                AND ingreso.ingestado = 'FINALIZADO'
                AND ingreso.ingtrafico = trafico.trafcodsx 
                AND (trafembarque LIKE emb OR trafdocumento LIKE emb)
	      ORDER BY ingreso.ingcodsx
  LOOP
    SELECT INTO rec2 ingreso.ingcodsx, sum(nadcantidad) as nad_cantidad, sum(nadpesonetototal) as nad_pesoneto, sum(nadpesobrutototal) as nad_pesobruto, 
           ingcantidad-sum(nadcantidad) as nnac_cantidad, ingpesoneto-sum(nadpesonetototal) as nnac_pesoneto, ingpesobruto-sum(nadpesobrutototal) as nnac_pesobruto 
      FROM ingreso, entrada, nacionalizacion, nacionalizacion_detalle 
     WHERE ingreso.ingcodsx = rec1.ingcodsx 
       AND ingreso.ingcodsx = entrada.entcodingreso  
       AND entrada.entcodsx = nacionalizacion_detalle.nadentrada
       AND nacionalizacion_detalle.nadcodnac = nacionalizacion.naccodsx  
       AND nacionalizacion.nacfecha <= fec
       AND nacionalizacion.nacestado = 'FINALIZADO'
     GROUP BY ingcodsx, ingcantidad, ingpesoneto, ingpesobruto;
    
    IF rec2.nad_cantidad IS NULL THEN rec2.nad_cantidad = 0.00; END IF;
    IF rec2.nad_pesoneto IS NULL THEN rec2.nad_pesoneto = 0.00; END IF;
    IF rec2.nad_pesobruto IS NULL THEN rec2.nad_pesobruto = 0.00; END IF;
    IF rec2.nnac_cantidad IS NULL THEN rec2.nnac_cantidad = 0.00; END IF;
    IF rec2.nnac_pesoneto IS NULL THEN rec2.nnac_pesoneto = 0.00; END IF;
    IF rec2.nnac_pesobruto IS NULL THEN rec2.nnac_pesobruto = 0.00; END IF;

    FOR rec3 IN SELECT rec1.ingcodsx::bigint, rec1.ingfecha::timestamp with time zone, rec1.ingcantidad::numeric, rec1.ingpesoneto::numeric, rec1.ingpesobruto::numeric, 
                       rec1.trafembarque::varchar, rec1.trafdocumento::varchar, rec1.trafnumdta::varchar,
                       rec2.nad_cantidad::numeric, rec2.nad_pesoneto::numeric, rec2.nad_pesobruto::numeric,
                       rec2.nnac_cantidad::numeric, rec2.nnac_pesoneto::numeric, rec2.nnac_pesobruto::numeric
    LOOP
      RETURN NEXT rec3;
    END LOOP;
  END LOOP;

END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.resumen_saldos_embarque(bigint, character varying, timestamp with time zone) OWNER TO postgres;

--
-- TOC entry 238 (class 1255 OID 24010)
-- Dependencies: 787 6
-- Name: resumen_trafico(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION resumen_trafico() RETURNS "trigger"
    AS $$--
--Trigger que permite llenar el campo "resumen" de la tablas DEL ESQUEMA PUBLICcon 
--los datos principales, usado para las busquedas.
--Cuando se haga un select * from TABLA, y se reciban parametros, estos seran
--consultados en la columna resumen
--
--SOLO SE HACE CON EL CREATE Y EL UPTADE
DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;
temp2 record;
temp3 record;
temp4 record;

BEGIN

--PARA EL TRAFICO, TOMO DE LAS TABLAS: trafico, contenedor_trafico, factura_trafico y referencia_trafico (productos)
IF TG_RELNAME='trafico'  THEN

--datos del trafico:
res := new.trafcodsx ||' ' || new.traffechacreacion ||' ' || new.trafdocumento 
	||' ' || new.trafembarque ||' ' || coalesce (new.trafnumdta ,'') ||' ' || coalesce (new.trafnumsobordo ,'');
-- compania:
select into temp1 * from compania where comcodsx = new.trafcompania;
res := res || ' ' || temp1.comnombre; 
--datos de contenedores:
for rec in select  * from contenedor_trafico where ctrafnumtrafico = new.trafcodsx LOOP
	res:= res || ' ' || rec.ctrafnumero;
END LOOP;

--numeros de factura
for rec in select  * from factura_trafico where ftrafnumtrafico = new.trafcodsx LOOP
	res:= res || ' ' ||rec.ftrafnumfactura;
END LOOP;

-- productos:
for rec in select promodelo, prodescripcion from producto, referencia_trafico, factura_trafico where
procodsx = reftproducto and reftnumfacturatrafico = ftrafcodsx and ftrafnumtrafico = new.trafcodsx
group by promodelo, prodescripcion LOOP
	res := res ||' ' || rec.promodelo ||' ' || rec.prodescripcion;
END LOOP;

--ACTUALIZO EL TRAFICO:
res = upper(res);
new.resumen := res;


END IF;

IF TG_RELNAME='contenedor_trafico' THEN
  if TG_OP='DELETE' THEN
   update trafico set trafcodsx = old.ctrafnumtrafico where trafcodsx = old.ctrafnumtrafico;
  ELSE
    update trafico set trafcodsx = new.ctrafnumtrafico where trafcodsx = new.ctrafnumtrafico;
  END IF;
END IF;
IF TG_RELNAME='factura_trafico' THEN
   if TG_OP='DELETE' THEN
    update trafico set trafcodsx = old.ftrafnumtrafico where trafcodsx = old.ftrafnumtrafico;
    else
    update trafico set trafcodsx = new.ftrafnumtrafico where trafcodsx = new.ftrafnumtrafico;
    end if;
END IF;

IF TG_RELNAME='referencia_trafico' THEN
   if TG_OP='DELETE' THEN
    update factura_trafico set ftrafcodsx = old.reftnumfacturatrafico where ftrafcodsx = old.reftnumfacturatrafico;
  else
  update factura_trafico set ftrafcodsx = new.reftnumfacturatrafico where ftrafcodsx = new.reftnumfacturatrafico;
    end if;

END IF;





if TG_OP='DELETE' THEN
return old;
else
return new;
end if;

END;

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.resumen_trafico() OWNER TO usersgl;

--
-- TOC entry 239 (class 1255 OID 24011)
-- Dependencies: 787 6
-- Name: saldo_posicion(character varying, character varying, character varying); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION saldo_posicion(character varying, character varying, character varying) RETURNS numeric
    AS $_$DECLARE
procodsx ALIAS FOR $1;
posicion ALIAS FOR $2;
tipo ALIAS FOR $3;

resp numeric;
BEGIN
IF tipo ='NAC'  THEN
	select into resp entsaldonac from entrada where entposicion=posicion and entcodproducto= procodsx;
END IF;

IF tipo = 'SNAC' THEN
	select into resp entsaldosinnac from entrada where entposicion=posicion and entcodproducto= procodsx;
END IF;

IF tipo = 'TODO' THEN
	select into resp sum(entsaldonac) + sum(entsaldosinnac) from entrada where 
	entposicion=posicion and entcodproducto= procodsx;
END IF;


IF resp IS NULL THEN
	resp := 0;
END IF;

return resp;

END$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.saldo_posicion(character varying, character varying, character varying) OWNER TO usersgl;

--
-- TOC entry 240 (class 1255 OID 24012)
-- Dependencies: 6 548 787
-- Name: subreporte_historico_embarque_producto(bigint, bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION subreporte_historico_embarque_producto(prod bigint, ing bigint) RETURNS SETOF subreporte_historico_embarque_producto
    AS $_$declare
prod alias for $1;
ing alias for $2;
rec record;

begin

for rec in
	select nacfecha::timestamp with time zone , nacdeclaracion::varchar, naccodsx::varchar, nacconsec::varchar, nacconseczfp::varchar, 
sum(nadcantidad)::numeric as cant, sum(nadfobtotal)::numeric as valor, sum(nadpesobrutototal)::numeric as pesob
from nacionalizacion, nacionalizacion_detalle, entrada
where naccodsx = nadcodnac and nadentrada = entcodsx and entcodingreso = ing and entcodproducto = prod
group by nacfecha,nacdeclaracion, nacconsec, nacconseczfp, naccodsx

loop
	return next rec;
end loop;


for rec in
	select 
	despfecha::timestamp with time zone ,  pedcodsx::varchar, despcodsx::varchar, despconsec::varchar, despconseczfp::varchar
	, referencia_despacho.refdcant, referencia_despacho.refdvalor, 
	referencia_despacho.refdpesobruto
	from
	despacho, despacho_pedido, referencia_despacho, referencia_despacho_pedido,referencia_pedido, pedido --, entrada, ingreso, trafico, producto
	, entrada
	where 
	despcodsx = despeddespacho and despedcodsx = refddespacho_pedido and refdcodsx = refdpcodrefd and refdcodrefp = refpcodsx
	and refpnumpedido = pedcodsx 
	and refpentrada = entcodsx and entcodproducto = prod and entcodingreso = ing
	group by 
	 despfecha,  pedcodsx, despcodsx, despconsec, despconseczfp, referencia_despacho.refdcant, referencia_despacho.refdvalor, 
	referencia_despacho.refdpesobruto

loop
	return next rec;
end loop;

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.subreporte_historico_embarque_producto(prod bigint, ing bigint) OWNER TO usersgl;

--
-- TOC entry 241 (class 1255 OID 24013)
-- Dependencies: 6 787
-- Name: sumar_saldo_nac(bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION sumar_saldo_nac(bigint) RETURNS void
    AS $_$DECLARE
ent RECORD; --registro de entradas
nacdet RECORD; -- registro de la nacinalizacion_detalle que se esta borrando y se va a sumar
saldosinnac numeric;
saldonac numeric;
 
BEGIN
saldosinnac = 0;
saldonac = 0;

select into nacdet * from nacionalizacion_detalle where nadcodsx = $1;
select into ent * from entrada where entcodsx = nacdet.nadentrada;

--saco el saldo original:
saldosinnac = ent.entsaldosinnac;
saldonac = ent.entsaldonac;
--resto el saldo nacionalizado y lo ssumo al no nacionalizado:
saldonac = saldonac - nacdet.nadcantidad;
saldosinnac = saldosinnac + nacdet.nadcantidad;


--actualizo el registro entrada:
update entrada set --entsaldonac = saldonac , 
entsaldosinnac = saldosinnac where
	entcodsx = ent.entcodsx;

RETURN;

END;

$_$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.sumar_saldo_nac(bigint) OWNER TO usersgl;

--
-- TOC entry 242 (class 1255 OID 24014)
-- Dependencies: 787 6
-- Name: tg_gst_averia(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION tg_gst_averia() RETURNS "trigger"
    AS $$/*
TRIGGER QUE SE ENCARGA DE REESTABLECER LOS SALDOS DE UNA NACIONALIZACION_DETALLE cuando se han efectuado
averias, 
es decir, cuando una averia se crea y esta mueve saldo que ha sido nacionalizado, es necesario
que ademas de mover las ENTRADAS y sus saldos, tambien sean movidos los datos de las 
NACIONALIZACIONES_DETALLE que estan asociadas a esta entrada.

de esta forma, cuando se borre la averia, la ctndiad restada por nacdet sera sumadas a las NACDETALLE ORIGINALES.
no elimino para evitar problemas, pero si se RESTA TODO, cantidades, pesos y saldos...
*/
declare

rec record;

begin

if TG_OP='DELETE' and TG_RELNAME='averia' THEN

for rec in 
	select * from averia_nacdet  where avnaveria = old.avecodsx
loop
--por cada relacion averia_nacdet sumo a la original

--a la original
raise notice'nacdet or:%', rec.avnnacdet_or ;
update nacionalizacion_detalle set nadcantidad = nadcantidad + rec.avncant,
	nadsaldo = nadsaldo + rec.avncant where nadcodsx = rec.avnnacdet_or;


end loop;

END IF;


--CUANDO SE BORRA UN REGISTRO EN LA TABLA REPARACION_DETALLE, se deben sumar a las averias las cantidades tomadas
-- para dejar el saldo disponible y hacer que la averia quede como originalmente estaba
if TG_OP='DELETE' and TG_RELNAME='reparacion_detalle' THEN

if old.repdtiposaldo ='NAC' then  --sumo al saldo nac de la averia original

update averia set avesaldo_pleg_nac = avesaldo_pleg_nac + old.repdcant_pleg,
		  avesaldo_prod_nac = avesaldo_prod_nac + old.repdcant_prod
	where avecodsx = old.repdaveria;

else --sumo a los saldos nnaca de la averia origina

update averia set avesaldo_pleg_nnac = avesaldo_pleg_nnac + old.repdcant_pleg,
		  avesaldo_prod_nnac = avesaldo_prod_nnac + old.repdcant_prod
	where avecodsx = old.repdaveria;

end if;



END IF;


if TG_OP='DELETE' then
return old;
else return new;
end if;

end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.tg_gst_averia() OWNER TO usersgl;

--
-- TOC entry 243 (class 1255 OID 24015)
-- Dependencies: 6 787
-- Name: tg_gst_despacho(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION tg_gst_despacho() RETURNS "trigger"
    AS $$BEGIN
IF TG_RELNAME='referencia_despacho_pedido' AND TG_OP ='DELETE' THEN


PERFORM liberar_saldo_despacho(OLD.refdpcodsx);


RETURN OLD; 
END IF;
END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.tg_gst_despacho() OWNER TO usersgl;

--
-- TOC entry 244 (class 1255 OID 24016)
-- Dependencies: 787 6
-- Name: tg_gst_despacho_actualizar_datos(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION tg_gst_despacho_actualizar_datos() RETURNS "trigger"
    AS $$--ACTUALIZA DATOS DESDE PACKING_DETALLE_POSICION HACIA PACKING_dETALLE Y DE ALLLI HACIA EL PACKING:
DECLARE
pesoneto numeric;
pesobruto numeric;
bultos numeric;
bultosarmados numeric;
valor numeric;
cantidad numeric;
desp RECORD;
desp_ped RECORD;
ref_desp RECORD;
ref_desp_ped RECORD;


BEGIN
pesoneto=0;
pesobruto=0;



IF TG_RELNAME='referencia_despacho_pedido'  THEN

if TG_OP='INSERT' OR TG_OP='UPDATE' THEN
	select into ref_Desp * from referencia_despacho where refdcodsx = NEW.refdpcodrefd;
ELSE 
	select into ref_Desp * from referencia_despacho where refdcodsx = OLD.refdpcodrefd;
END IF;

select into pesoneto sum(refdpesonetototal) from referencia_despacho_pedido where refdpcodrefd = ref_desp.refdcodsx;
select into pesobruto sum(refdpesobrutototal) from referencia_despacho_pedido where refdpcodrefd = ref_desp.refdcodsx;
select into cantidad sum(refdcant) from referencia_despacho_pedido where refdpcodrefd = ref_desp.refdcodsx;
select into valor sum(refdvalortotal) from referencia_despacho_pedido where refdpcodrefd = ref_desp.refdcodsx;


IF pesoneto is NULL THEN pesoneto =0; END IF;
IF pesobruto is NULL THEN pesobruto =0; END IF;
IF cantidad is NULL THEN cantidad=0; END IF;
IF valor is NULL THEN cantidad=0; END IF;

update referencia_despacho set refdpesoneto = pesoneto, refdpesobruto = pesobruto, refdcant = cantidad,
refdvalor = valor where  refdcodsx = ref_desp.refdcodsx;

--ahora actualizao el despacho:
END IF;

IF TG_RELNAME='referencia_despacho'  THEN

if TG_OP='DELETE' THEN
	select into ref_desp * from referencia_despacho where refdcodsx = old.refdcodsx;
	select into desp_ped * from despacho_pedido where despedcodsx = old.refddespacho_pedido;
ELSE 
	select into ref_desp * from referencia_despacho where refdcodsx = NEW.refdcodsx;
	select into desp_ped * from despacho_pedido where despedcodsx = NEW.refddespacho_pedido;
END IF;

	select into pesoneto sum(refdpesoneto) 
	from referencia_despacho where
	refddespacho_pedido = desp_ped.despedcodsx;--  ref_desp.refddespacho_pedido;

	select into pesobruto sum(refdpesobruto) 
	from referencia_despacho where
	refddespacho_pedido = desp_ped.despedcodsx;--ref_desp.refddespacho_pedido;

	select into valor sum(refdvalor) 
	from referencia_despacho where
	refddespacho_pedido = desp_ped.despedcodsx;--ref_desp.refddespacho_pedido;

IF pesoneto is NULL THEN pesoneto =0; END IF;
IF pesobruto is NULL THEN pesobruto =0; END IF;
IF valor is NULL THEN valor =0; END IF;

--update despacho set desppesoneto= pesoneto, desppesobruto = pesobruto , despfob =  valor 
--where despacho.despcodsx = desp_ped.despeddespacho ;

update despacho_pedido set despedpesoneto = pesoneto, despedpesobruto = pesobruto, despedvalor = valor
where despedcodsx = desp_ped.despedcodsx;--ref_desp.refddespacho_pedido;

END IF;


IF TG_RELNAME='despacho_pedido' THEN

IF TG_OP='DELETE' THEN
	select into desp_ped * from despacho_pedido where despedcodsx = OLD.despedcodsx;
	select into desp * from despacho where despcodsx = OLD.despeddespacho;
ELSE
	select into desp_ped * from despacho_pedido where despedcodsx = NEW.despedcodsx;
	select into desp * from despacho where despcodsx = NEW.despeddespacho;
END IF;

raise notice'el pedido es%', desp_ped;

--if desp_ped.despeddespacho is not null then 
select into bultos sum(despedbultos) from despacho_pedido where despeddespacho = desp.despcodsx;
select into bultosarmados sum(despedbultosarmados) from despacho_pedido where despeddespacho = desp.despcodsx;
select into pesoneto sum(despedpesoneto) from despacho_pedido where despeddespacho = desp.despcodsx;
select into pesobruto sum(despedpesobruto) from despacho_pedido where despeddespacho = desp.despcodsx;
select into valor sum(despedvalor) from despacho_pedido where despeddespacho = desp.despcodsx;


IF pesoneto is NULL THEN pesoneto =0; END IF;
IF pesobruto is NULL THEN pesobruto =0; END IF;
IF bultos is NULL THEN bultos =0; END IF;
IF bultosarmados is NULL THEN bultosarmados =0; END IF;
IF valor is NULL THEN valor =0; END IF;

update despacho set despbultos = bultos, despbultosarmados = bultosarmados ,
	desppesoneto = pesoneto, desppesobruto = pesobruto, despfob = valor where  despcodsx= desp.despcodsx;

--else 
--update despacho set despbultos = 0, despbultosarmados = 0,	desppesoneto = 0, desppesobruto = 0, despfob = 0 where  despcodsx= desp.despcodsx;


--end if;

END IF;


IF TG_OP='DELETE' THEN
	return OLD;
ELSE 
	return NEW;
END IF;


END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.tg_gst_despacho_actualizar_datos() OWNER TO usersgl;

--
-- TOC entry 245 (class 1255 OID 24017)
-- Dependencies: 787 6
-- Name: tg_gst_ingreso(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION tg_gst_ingreso() RETURNS "trigger"
    AS $$DECLARE 
total int4;
vingpesoneto numeric;
vingpesobruto numeric;
vingfob numeric;
vingcantidad numeric;
BEGIN


IF TG_RELNAME='entrada' THEN

  if TG_OP='DELETE' THEN

    select into total count(1) from entrada where entcodingreso=old.entcodingreso;

    IF total=0 THEN
      update ingreso set ingpesoneto= 0,ingpesobruto= 0, ingfob =0 , ingcantidad=0
      where ingcodsx = old.entcodingreso;

    ELSE 

     select sum(entpesonetototal), sum(entpesobrutototal),sum(entvalortotal),sum(entcantidad) 
     into vingpesoneto,vingpesobruto,vingfob,vingcantidad
     from entrada where entcodingreso = old.entcodingreso;

     update ingreso set 
     ingpesoneto=vingpesoneto,
     ingpesobruto=vingpesobruto, 
     ingfob =vingfob,
     ingcantidad = vingcantidad
     where ingcodsx = old.entcodingreso;
    END IF;


  ELSE 
     select sum(entpesonetototal), sum(entpesobrutototal),sum(entvalortotal),sum(entcantidad) 
     into vingpesoneto,vingpesobruto,vingfob,vingcantidad
     from entrada where entcodingreso = new.entcodingreso;

     update ingreso set 
     ingpesoneto=vingpesoneto,
     ingpesobruto=vingpesobruto, 
     ingfob =vingfob,
     ingcantidad = vingcantidad
     where ingcodsx = new.entcodingreso;

  END IF;

END IF;


IF TG_OP='INSERT' THEN
RETURN NEW; 
ELSE 
RETURN OLD; 
END IF;


END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.tg_gst_ingreso() OWNER TO usersgl;

--
-- TOC entry 246 (class 1255 OID 24018)
-- Dependencies: 787 6
-- Name: tg_gst_nacionalizaciones_actualizar_datos(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION tg_gst_nacionalizaciones_actualizar_datos() RETURNS "trigger"
    AS $$DECLARE
nadcodsx int8;
total int8;
nac  RECORD;
peson numeric;
pesob numeric;
valor numeric;

BEGIN

IF TG_RELNAME='nacionalizacion_detalle' THEN



IF TG_OP='DELETE' THEN 
	nadcodsx = old.nadcodsx;
	select into total count(1) from nacionalizacion_detalle where
	nadcodnac = old.nadcodnac;
	select into nac nacionalizacion.* from nacionalizacion where naccodsx = old.nadcodnac;
ELSE 
	nadcodsx = new.nadcodsx;
	select into total count(1) from nacionalizacion_detalle where
	nadcodnac = new.nadcodnac;
	select into nac nacionalizacion.* from nacionalizacion where naccodsx = new.nadcodnac;
END IF;

IF total =0 THEN
	update nacionalizacion set 
	nacpesoneto= 0,
	nacpesobruto = 0,
	nacfob = 0
	where naccodsx =nac.naccodsx;

ELSE 

select into peson, pesob,valor sum(nadpesonetototal), sum(nadpesobrutototal), sum(nadfobtotal)
from  nacionalizacion_detalle where nadcodnac = nac.naccodsx;

if peson is null then peson=0; end if;
if pesob is null then pesob=0; end if;
if valor is null then valor=0; end if;

	update nacionalizacion set 
	nacpesoneto= peson,
	nacpesobruto = pesob,
	nacfob = valor
	--from nacionalizacion_detalle
	where naccodsx = nac.naccodsx;

END IF;



IF TG_OP='DELETE' THEN 
RETURN OLD; 
ELSE
RETURN NEW;
END IF;

END IF;
END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.tg_gst_nacionalizaciones_actualizar_datos() OWNER TO usersgl;

--
-- TOC entry 247 (class 1255 OID 24019)
-- Dependencies: 787 6
-- Name: tg_gst_nacionalizaciones_liberar_entrada(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION tg_gst_nacionalizaciones_liberar_entrada() RETURNS "trigger"
    AS $$DECLARE 

BEGIN

/**
OPERACION PARA LIBERAR EL SALDO CUANDO SE HAYA BORRADO UN ITEM
*/
IF TG_RELNAME='nacionalizacion_detalle' AND TG_OP ='DELETE' THEN
PERFORM sumar_saldo_nac(OLD.nadcodsx);

RETURN OLD;
END IF;



END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.tg_gst_nacionalizaciones_liberar_entrada() OWNER TO usersgl;

--
-- TOC entry 248 (class 1255 OID 24020)
-- Dependencies: 787 6
-- Name: tg_gst_packing_actualizar_datos(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION tg_gst_packing_actualizar_datos() RETURNS "trigger"
    AS $$--ACTUALIZA DATOS DESDE PACKING_DETALLE_POSICION HACIA PACKING_dETALLE Y DE ALLLI HACIA EL PACKING:
DECLARE
pesoneto numeric;
pesobruto numeric;
cantidad numeric;
packd RECORD;
packdcodsx int8;
packcodsx int8;

BEGIN
pesoneto=0;
pesobruto=0;


IF TG_RELNAME='packing_detalle' AND TG_OP='DELETE' THEN


	packdcodsx = old.packdcodsx;
	packcodsx = old.packdpacking;

	select into pesoneto sum(packppesonetototal) 
	from packing, packing_Detalle, packing_Detalle_posicion where
	packing.packcodsx = packdpacking and packppackingdet = packing_detalle.packdcodsx
	and packing.packcodsx = packcodsx;

	select into pesobruto sum(packppesobrutototal) 
	from packing, packing_Detalle, packing_Detalle_posicion where
	packing.packcodsx = packdpacking and packppackingdet = packing_detalle.packdcodsx
	and packing.packcodsx = packcodsx;

IF pesoneto is NULL THEN pesoneto =0; END IF;
IF pesobruto is NULL THEN pesobruto =0; END IF;
RAISE NOTICE '--0000000000000=----------packin.packcodsx %',packcodsx;
RAISE NOTICE '--0000000000000=----------PESONETO %',pesoneto;
RAISE NOTICE '--0000000000000=----------PESOBRUTO %',pesobruto;
update packing set packpesoneto = pesoneto, packpesobruto = pesobruto where packing.packcodsx = packcodsx;


END IF;

IF TG_RELNAME='packing_detalle_posicion' THEN

IF TG_OP='DELETE' THEN
	packdcodsx = OLD.packppackingdet;
ELSE 
	packdcodsx = NEW.packppackingdet;
END IF;

select into packd * from packing_detalle where packing_detalle.packdcodsx = packdcodsx;

select into pesoneto sum(packppesonetototal) from packing_detalle_posicion where packppackingdet = packdcodsx;
select into pesobruto sum(packppesobrutototal) from packing_detalle_posicion where packppackingdet = packdcodsx;
select into cantidad sum(packpcantidad) from packing_detalle_posicion where packppackingdet = packdcodsx;

IF pesoneto is NULL THEN pesoneto =0; END IF;
IF pesobruto is NULL THEN pesobruto =0; END IF;

update packing_detalle set packdpesoneto = pesoneto, packdpesobruto = pesobruto, packdcantidad = cantidad
 where 
packing_detalle.packdcodsx = packdcodsx;

--ahora actualizao el packing:
select into pesoneto sum(packdpesoneto) from packing_detalle where packing_detalle.packdpacking= packd.packdpacking;
select into pesobruto sum(packdpesobruto) from packing_detalle where packing_detalle.packdpacking= packd.packdpacking;

IF pesoneto is NULL THEN pesoneto =0; END IF;
IF pesobruto is NULL THEN pesobruto =0; END IF;


update packing set packpesoneto = pesoneto, packpesobruto= pesobruto where packing.packcodsx = packd.packdpacking;

END IF;


IF TG_OP='DELETE' THEN
	return OLD;
ELSE 
	return NEW;
END IF;


END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.tg_gst_packing_actualizar_datos() OWNER TO usersgl;

--
-- TOC entry 249 (class 1255 OID 24021)
-- Dependencies: 787 6
-- Name: tg_gst_packing_detalle_posicion(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION tg_gst_packing_detalle_posicion() RETURNS "trigger"
    AS $$DECLARE 
DET RECORD; --registro de entradas

BEGIN

--Cuando la tabla sea nacionalizacion_detalle y este borrando:
IF TG_RELNAME='packing_detalle_posicion' AND TG_OP ='DELETE' THEN

PERFORM liberar_saldo_packing(OLD.packpcodsx);

RETURN OLD; 
END IF;



END;
    

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.tg_gst_packing_detalle_posicion() OWNER TO usersgl;

--
-- TOC entry 250 (class 1255 OID 24022)
-- Dependencies: 787 6
-- Name: tg_gst_pedido(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION tg_gst_pedido() RETURNS "trigger"
    AS $$DECLARE 
PED RECORD; --registro deL PEDIDO

BEGIN

--Cuando la tabla sea nacionalizacion_detalle y este borrando:
IF TG_RELNAME='referencia_pedido' AND TG_OP ='DELETE' THEN

SELECT into PED * from pedido where pedcodsx = OLD.refpnumpedido;
IF PED.pedpicking IS NULL THEN 

PERFORM liberar_saldo_pedido(OLD.refpcodsx);

END IF;

RETURN OLD; 
END IF;



END;
    

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.tg_gst_pedido() OWNER TO usersgl;

--
-- TOC entry 251 (class 1255 OID 24023)
-- Dependencies: 6 787
-- Name: tg_gst_pedido_actualizar_datos(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION tg_gst_pedido_actualizar_datos() RETURNS "trigger"
    AS $$--ACTUALIZA DATOS DESDE PACKING_DETALLE_POSICION HACIA PACKING_dETALLE Y DE ALLLI HACIA EL PACKING:
DECLARE
pesoneto numeric;
pesobruto numeric;
valor numeric;
porc_iva numeric;
ref_ped RECORD;
pedcodsx int8;

BEGIN
pesoneto=0;
pesobruto=0;
valor=0;

IF TG_OP='DELETE' THEN
	pedcodsx = OLD.refpnumpedido;
ELSE 
	pedcodsx = NEW.refpnumpedido;
END IF;

IF TG_RELNAME='referencia_pedido' THEN


	select into pesoneto sum(refppesonetototal) 
	from referencia_pedido where
	refpnumpedido = pedcodsx;

	select into pesobruto sum(refppesobrutototal) 
	from referencia_pedido where
	refpnumpedido = pedcodsx;

	select into valor sum(refpvalortotal) 
	from referencia_pedido where
	refpnumpedido = pedcodsx;

	select into porc_iva pedporc_iva
	from pedido where pedido.pedcodsx = pedcodsx;


IF pesoneto is NULL THEN pesoneto =0; END IF;
IF pesobruto is NULL THEN pesobruto =0; END IF;
IF valor is NULL THEN valor =0; END IF;

update pedido set pedpesoneto= pesoneto, pedpesobruto = pesobruto , pedsubtotal =  valor,
pediva = valor * porc_iva /100 , pedtotal = valor + ( valor * porc_iva /100 ) where pedido.pedcodsx= pedcodsx;


END IF;

IF TG_OP='DELETE' THEN
	return OLD;
ELSE 
	return NEW;
END IF;


END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.tg_gst_pedido_actualizar_datos() OWNER TO usersgl;

--
-- TOC entry 252 (class 1255 OID 24024)
-- Dependencies: 787 6
-- Name: tg_gst_picking(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION tg_gst_picking() RETURNS "trigger"
    AS $$DECLARE 

BEGIN

--Cuando la tabla sea nacionalizacion_detalle y este borrando:
IF TG_RELNAME='picking_detalle_packing' AND TG_OP ='DELETE' THEN

PERFORM liberar_saldo_picking(OLD.pickpcodsx);

RETURN OLD; 
END IF;



END;
    

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.tg_gst_picking() OWNER TO usersgl;

--
-- TOC entry 253 (class 1255 OID 24025)
-- Dependencies: 6 787
-- Name: tg_gst_picking_actualizar_datos(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION tg_gst_picking_actualizar_datos() RETURNS "trigger"
    AS $$--ACTUALIZA DATOS DESDE PACKING_DETALLE_POSICION HACIA PACKING_dETALLE Y DE ALLLI HACIA EL PACKING:
DECLARE
pesoneto numeric;
pesobruto numeric;
valor numeric;
cantidad numeric;
pickd RECORD;
pickdcodsx int8;
pickcodsx int8;

BEGIN
pesoneto=0;
pesobruto=0;


IF TG_RELNAME='picking_detalle' AND TG_OP='DELETE' THEN


	pickdcodsx = old.pickdcodsx;
	pickcodsx = old.pickdcodpicking;

	select into pesoneto sum(pickppesonetototal) 
	from picking, picking_detalle, picking_detalle_packing where
	picking.pickcodsx = pickdcodpicking and pickppickingdetalle = picking_detalle.pickdcodsx
	and picking.pickcodsx = pickcodsx;

	select into pesobruto sum(pickppesobrutototal) 
	from picking, picking_detalle, picking_detalle_packing where
	picking.pickcodsx = pickdcodpicking and pickppickingdetalle = picking_detalle.pickdcodsx
	and picking.pickcodsx = pickcodsx;

	select into valor sum(pickdvalortotal) 
	from picking, picking_detalle, picking_detalle_packing where
	picking.pickcodsx = pickdcodpicking and pickppickingdetalle = picking_detalle.pickdcodsx
	and picking.pickcodsx = pickcodsx;

IF pesoneto is NULL THEN pesoneto =0; END IF;
IF pesobruto is NULL THEN pesobruto =0; END IF;
IF valor is NULL THEN valor =0; END IF;

update picking set pickpesoneto = pesoneto, pickpesobruto = pesobruto , pickvalor =  valor where picking.pickcodsx = pickcodsx;


END IF;

IF TG_RELNAME='picking_detalle_packing' THEN

IF TG_OP='DELETE' THEN
	pickdcodsx = OLD.pickppickingdetalle;
ELSE 
	pickdcodsx = NEW.pickppickingdetalle;
END IF;

select into pickd * from picking_detalle where picking_detalle.pickdcodsx = pickdcodsx;

select into pesoneto sum(pickppesonetototal) from picking_detalle_packing where pickppickingdetalle = pickdcodsx;
select into pesobruto sum(pickppesobrutototal) from picking_detalle_packing where pickppickingdetalle = pickdcodsx;
select into cantidad sum(pickpcantidad) from picking_detalle_packing where pickppickingdetalle = pickdcodsx;

IF pesoneto is NULL THEN pesoneto =0; END IF;
IF pesobruto is NULL THEN pesobruto =0; END IF;
IF cantidad is NULL THEN cantidad=0; END IF;

update picking_detalle set pickdpesoneto = pesoneto, pickdpesobruto = pesobruto, pickdcantidad = cantidad,
pickdvalortotal = (cantidad * pickd.pickdvalorunit) where  picking_detalle.pickdcodsx = pickdcodsx;

--ahora actualizao el packing:
select into pesoneto sum(pickdpesoneto) from picking_detalle where picking_detalle.pickdcodpicking= pickd.pickdcodpicking;
select into pesobruto sum(pickdpesobruto) from picking_detalle where picking_detalle.pickdcodpicking= pickd.pickdcodpicking;
select into valor sum(pickdvalortotal) from picking_detalle where picking_detalle.pickdcodpicking= pickd.pickdcodpicking;

IF pesoneto is NULL THEN pesoneto =0; END IF;
IF pesobruto is NULL THEN pesobruto =0; END IF;
IF valor is NULL THEN valor=0; END IF;

update picking set pickpesoneto = pesoneto, pickpesobruto= pesobruto , pickvalor= valor 
where picking.pickcodsx = pickd.pickdcodpicking;

END IF;


IF TG_OP='DELETE' THEN
	return OLD;
ELSE 
	return NEW;
END IF;


END;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.tg_gst_picking_actualizar_datos() OWNER TO usersgl;

--
-- TOC entry 254 (class 1255 OID 24026)
-- Dependencies: 6 787
-- Name: tg_gst_reparacion(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION tg_gst_reparacion() RETURNS "trigger"
    AS $$declare
rec record;
ave averia;
ent_ave entrada;
ent_dest entrada;
nacdets record;
nacdet nacionalizacion_detalle;
repnacdets record;
tot bigint;
numpedido character varying;
recpedido record;
begin

--miro cuando actualize la reparacion a estado finalizado para ir a mover los saldos bien ahorita si...
--es decir, ir a sumar / crear entradas y de igual manera, si hay nacionalizacion_detalle tambien crearlas
-- sumarlas
if TG_OP='UPDATE' and TG_RELNAME='reparacion' THEN
--cuando lo finalizo, sumo saldos
if old.repestado ='TRAMITE' and new.repestado = 'FINALIZADO' then

for rec in select * from reparacion_detalle where repdreparacion = new.repcodsx 
loop
select into ave * from averia where avecodsx = rec.repdaveria;
select into ent_ave * from entrada where entcodsx = ave.aveentrada;

--debo crear una entrada con la cantidad/saldo de la reparacion
select into ent_dest * from entrada where entcodingreso = ent_ave.entcodingreso and entcodproducto = rec.repdproducto
	and entbodega = rec.repdbodega_dest and entposicion= rec.repdposicion_dest;

if ent_dest.entcodsx is null then --no existe, la creo
raise notice'NO EXISTE!!';
--miro si la repd es NAC o NNAC:
	if rec.repdtiposaldo ='NAC' then
	insert into entrada(entcodingreso,entcodproducto ,entbodega , entposicion ,  entcantidad ,
			entpesoneto ,entpesonetototal,entpesobruto ,entpesobrutototal ,
			entsaldopesoneto, entsaldopesobruto ,entsaldonac ,entsaldosinnac ,
			entvalor , entvalortotal ,  entfecha ,entsaldonacf ,  entsaldosinnacf , entunidad)
		values ( ent_ave.entcodingreso,ent_ave.entcodproducto , rec.repdbodega_dest , rec.repdposicion_dest , ( rec.repdcant_pleg + rec.repdcant_prod ) ,
			   ent_ave.entpesoneto , ent_ave.entpesoneto * ( rec.repdcant_pleg + rec.repdcant_prod ), ent_ave.entpesobruto ,ent_ave.entpesobruto * (rec.repdcant_pleg + rec.repdcant_prod ),
			   ent_ave.entpesoneto * ( rec.repdcant_pleg + rec.repdcant_prod ), ent_ave.entpesobruto * (rec.repdcant_pleg + rec.repdcant_prod ) ,
			  ( rec.repdcant_pleg + rec.repdcant_prod ) ,0 ,
			   ent_ave.entvalor, ent_ave.entvalor * ( rec.repdcant_pleg + rec.repdcant_prod ),  now() ,( rec.repdcant_pleg + rec.repdcant_prod ) ,  0 , 'U') ;

		--LISTO, YA ESTA CREADA LA ENTRADA, tengo que crear las nacionalizaciones_detalle
		--para esto, miro en la tabla averia_nacdet para ver esta averia de que nacdetalles tomo...

		for nacdets in select * from nacionalizacion_detalle, reparacion_nacdet where nadcodsx = repndnacdet
		and repndrepdetalle = rec.repdcodsx
		loop
		--creo la nacdetalle pero con el entcodsx de la entrada destino que acabo de crear, 
		select into ent_dest * from entrada where entcodingreso = ent_ave.entcodingreso and entcodproducto = rec.repdproducto
		and entbodega = rec.repdbodega_dest and entposicion= rec.repdposicion_dest;
RAISE NOTICE'ENTRADA CREADA: %', ent_dest.entcodsx;
		insert into nacionalizacion_detalle(nadcodnac, nadentrada, nadcantidad, nadsaldo,
				nadpesoneto, nadpesonetototal, nadpesobruto, nadpesobrutototal,
				nadfob, nadfobtotal)
			values(nacdets.nadcodnac, ent_dest.entcodsx , nacdets.repndcant , nacdets.repndcant,
				nacdets.nadpesoneto , nacdets.nadpesoneto * (nacdets.repndcant) ,
				nacdets.nadpesobruto , nacdets.nadpesobruto * (nacdets.repndcant) ,
				nacdets.nadfob , nacdets.nadfob * (nacdets.repndcant) );

		select into nacdet * from nacionalizacion_detalle where nadcodnac = nacdets.nadcodnac and
					nadentrada = ent_dest.entcodsx;
		RAISE NOTICE'nacdetalle CREADA y actualizada en reparacion_nacdet: %', nacdet.nadcodsx;
		update reparacion_nacdet set repndnacdet_rep = nacdet.nadcodsx where repndcodsx  = nacdets.repndcodsx;

		end loop;
		
	else --es NNAC

	insert into entrada(entcodingreso,entcodproducto ,entbodega , entposicion ,  entcantidad ,
			entpesoneto ,entpesonetototal,entpesobruto ,entpesobrutototal ,
			entsaldopesoneto, entsaldopesobruto ,entsaldonac ,entsaldosinnac ,
			entvalor , entvalortotal ,  entfecha ,entsaldonacf ,  entsaldosinnacf , entunidad)
		values ( ent_ave.entcodingreso,ent_ave.entcodproducto , rec.repdbodega_dest , rec.repdposicion_dest , ( rec.repdcant_pleg + rec.repdcant_prod ) ,
			   ent_ave.entpesoneto , ent_ave.entpesoneto * ( rec.repdcant_pleg + rec.repdcant_prod ), ent_ave.entpesobruto ,ent_ave.entpesobruto * (rec.repdcant_pleg + rec.repdcant_prod ),
			   ent_ave.entpesoneto * ( rec.repdcant_pleg + rec.repdcant_prod ), ent_ave.entpesobruto * (rec.repdcant_pleg + rec.repdcant_prod ) ,
			   0 , ( rec.repdcant_pleg + rec.repdcant_prod ) ,
			   ent_ave.entvalor, ent_ave.entvalor * ( rec.repdcant_pleg + rec.repdcant_prod ),  now()  , 0 ,( rec.repdcant_pleg + rec.repdcant_prod ) ,   'U') ;


	end if;
else --la entrada si existe, la sumo
raise notice'SI EXISTE!!';
	--miro si la repd es NAC o NNAC:
	if rec.repdtiposaldo ='NAC' then
	update entrada set entcantidad = entcantidad + (rec.repdcant_pleg + rec.repdcant_prod),
			   entsaldonac = entsaldonac + (rec.repdcant_pleg + rec.repdcant_prod),
			   entsaldonacf = entsaldonacf + (rec.repdcant_pleg + rec.repdcant_prod)
		where entcodsx = ent_dest.entcodsx;
	else-- para saldo NNAC
	update entrada set entcantidad = entcantidad + (rec.repdcant_pleg + rec.repdcant_prod),
			   entsaldosinnac = entsaldosinnac + (rec.repdcant_pleg + rec.repdcant_prod),
			   entsaldosinnacf = entsaldosinnacf + (rec.repdcant_pleg + rec.repdcant_prod)
		where entcodsx = ent_dest.entcodsx;
	end if;
	--actualizo los pesos:
	update entrada set entsaldopesoneto = entpesoneto * (entsaldonacf + entsaldosinnacf),
			   entsaldopesobruto = entpesobruto * (entsaldonacf + entsaldosinnacf)
		where entcodsx = ent_dest.entcodsx;

		--LISTO, YA ESTA CREADA LA ENTRADA, tengo que crear las nacionalizaciones_detalle
		--para esto, miro en la tabla averia_nacdet para ver esta averia de que nacdetalles tomo...
	
		for nacdets in select * from nacionalizacion_detalle, reparacion_nacdet where nadcodsx = repndnacdet
		and repndrepdetalle = rec.repdcodsx
		loop
		
raise notice'rep_nacdet original: %', rec.repdcodsx;

		select into nacdet * from nacionalizacion_detalle where nadcodnac = nacdets.nadcodnac and 	
				nadentrada = ent_dest.entcodsx;

raise notice'nacdet dest: %', nacdet.nadcodsx;
	
		if nacdet.nadcodsx is null then 
raise notice'VA A INSERTAR!!!!!!!!!!!!!!!!!!';
raise notice'NADCODNAC: %', nacdets.nadcodnac;
raise notice'nadentrada: %', ent_dest.entcodsx;

		insert into nacionalizacion_detalle(nadcodnac, nadentrada, nadcantidad, nadsaldo,
				nadpesoneto, nadpesonetototal, nadpesobruto, nadpesobrutototal,
				nadfob, nadfobtotal)
			values(nacdets.nadcodnac, ent_dest.entcodsx , nacdets.repndcant , nacdets.repndcant,
				nacdets.nadpesoneto , nacdets.nadpesoneto * (nacdets.repndcant) ,
				nacdets.nadpesobruto , nacdets.nadpesobruto * (nacdets.repndcant) ,
				nacdets.nadfob , nacdets.nadfob * (nacdets.repndcant) );
		select into nacdet * from nacionalizacion_detalle where nadcodnac = nacdets.nadcodnac and
					nadentrada = ent_dest.entcodsx;
		else

			update nacionalizacion_Detalle set nadcantidad = nadcantidad + (nacdets.repndcant),
			nadsaldo = nadsaldo + (nacdets.repndcant) where
			nadcodsx = nacdet.nadcodsx;
		end if;


raise notice'nacdet actualizada: %', nacdet.nadcodsx;
		
		update reparacion_nacdet set repndnacdet_rep = nacdet.nadcodsx where repndcodsx  = nacdets.repndcodsx;		
		
		end loop;

end if;




end loop;

end if; 


--si lo llego a activar, se quitan los saldos.
if old.repestado ='FINALIZADO' and new.repestado = 'TRAMITE' then
--debo RESTAR a las entradas,  solo resto para no eliminar nada.

for rec in select * from reparacion_detalle where repdreparacion = new.repcodsx 
loop
select into ave * from averia where avecodsx = rec.repdaveria;
select into ent_ave * from entrada where entcodsx = ave.aveentrada;

raise notice'entrada,%' , ent_ave.entcodsx;
select into ent_dest * from entrada where entcodingreso = ent_ave.entcodingreso and entcodproducto = rec.repdproducto
	and entbodega = rec.repdbodega_dest and entposicion= rec.repdposicion_dest;
raise notice'entrada,%' , ent_dest.entcodsx;
raise notice'cant rep,%' , (rec.repdcant_pleg + rec.repdcant_prod);
--ANTES DE RESTAR VERIFICO QUE LA ENTRADA NO ESTE EN NINGUNA SALIDA, SI LO ESTA NO LO DEJO Y LO MUESTRO:
select into tot count(1) from referencia_pedido where refpentrada = ent_dest.entcodsx;
IF tot is null then 
tot =0;
end if;

if tot!=0 THEN
 for recpedido in select refpnumpedido from referencia_pedido where refpentrada = ent_dest.entcodsx loop
   numpedido := recpedido.refpnumpedido || ',';
 end loop;
 RAISE EXCEPTION 'LAS ENTRADAS ASOCIADAS A ESTA REPARACION YA ESTAN SIENDO TOMADAS POR PEDIDO % NO PUEDE ACTIVAR LA REPARACION',numpedido;
END IF;

if rec.repdtiposaldo ='NAC' then

	update entrada set entcantidad = entcantidad - (rec.repdcant_pleg + rec.repdcant_prod),
			   entsaldonac = entsaldonac - (rec.repdcant_pleg + rec.repdcant_prod),
			   entsaldonacf = entsaldonacf - (rec.repdcant_pleg + rec.repdcant_prod)
		where entcodsx = ent_dest.entcodsx;
--tengo que restar de las nacdetalle tambien, para ello saco lo que de una reparacion_detalle
--se metio en nacionalizaciones a traves de la tabla reparacio_nacdet, alli se tiene la reparacion_detalle, la
--cantidad y la nacionalizacion a la que se sumo  y fue llenada cuando se finalizo ??


for repnacdets in select * from reparacion_nacdet where repndrepdetalle = rec.repdcodsx
loop
update nacionalizacion_detalle set nadcantidad = nadcantidad - repnacdets.repndcant,
				nadsaldo = nadsaldo - repnacdets.repndcant
		where nadcodsx = repnacdets.repndnacdet_rep;
end loop;

else --es saldo NNAC
	
		update entrada set entcantidad = entcantidad - (rec.repdcant_pleg + rec.repdcant_prod),
			   entsaldosinnac = entsaldosinnac - (rec.repdcant_pleg + rec.repdcant_prod),
			   entsaldosinnacf = entsaldosinnacf - (rec.repdcant_pleg + rec.repdcant_prod)
		where entcodsx = ent_dest.entcodsx;

end if;

	--actualizo los pesos:
	update entrada set entsaldopesoneto = entpesoneto * (entsaldonacf + entsaldosinnacf),
			   entsaldopesobruto = entpesobruto * (entsaldonacf + entsaldosinnacf)
		where entcodsx = ent_dest.entcodsx;


end loop;


end if;
END IF;



if TG_OP='DELETE' and TG_RELNAME='reparacion_nacdet' THEN

update averia_nacdet set avnsaldo = avnsaldo + old.repndcant where
avncodsx = old.repndaverianacdet;


END IF;


if TG_OP ='DELETE' then 
return old;
else
return new;
end if;

end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.tg_gst_reparacion() OWNER TO usersgl;

--
-- TOC entry 255 (class 1255 OID 24028)
-- Dependencies: 787 6
-- Name: tg_gst_reubicacion(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION tg_gst_reubicacion() RETURNS "trigger"
    AS $$/*
TRIGGER QUE SE ENCARGA DE REESTABLECER LOS SALDOS DE UNA NACIONALIZACION_DETALLE cuando se han efectuado
reubicaciones, 
es decir, cuando una reubicacion se crea y esta mueve saldo que ha sido nacionalizado, es necesario
que ademas de mover las ENTRADAS y sus saldos, tambien sean movidos los datos de las 
NACIONALIZACIONES_DETALLE que estan asociadas a esta entrada.

de esta forma, cuando se borre la reubicacion, se restaran las cantidades a las nacdetalle FIN y seran
sumadas a las NACDETALLE ORIGINALES.
no elimino para evitar problemas, pero si se RESTA TODO, cantidades, pesos y saldos...
*/
declare

rec record;

begin

if TG_OP='DELETE' and TG_RELNAME='reubicacion' THEN

for rec in 
	select * from reubic_nacdetalle where renreubicacion = old.recodsx
loop
--por cada relacion reubic_nacdetalle resto de la final y sumo a la final

--a la final
update nacionalizacion_detalle set nadcantidad = nadcantidad - rec.rencantidad,
	nadsaldo = nadsaldo - rec.rencantidad where nadcodsx = rec.renacdetalle_fin;

--a la original
update nacionalizacion_detalle set nadcantidad = nadcantidad + rec.rencantidad,
	nadsaldo = nadsaldo + rec.rencantidad where nadcodsx = rec.renacdetalle_or;



end loop;

END IF;




if TG_OP='DELETE' then
return old;
else return new;
end if;

end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.tg_gst_reubicacion() OWNER TO usersgl;

--
-- TOC entry 256 (class 1255 OID 24029)
-- Dependencies: 6 787
-- Name: tg_gst_saldo(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION tg_gst_saldo() RETURNS "trigger"
    AS $$--trigger que se encarga de mover bien los saldos

declare

saldonac numeric(20,2);
saldosinnac numeric(20,2);
saldonacf numeric(20,2);
saldosinnacf numeric(20,2);
saldopeson numeric(20,2);
saldopesob numeric(20,2);

rec record;

cant numeric(20,2);

begin

--al ingreso, las entradas se crean con TODOS los saldos en CERO, tanto el fisico como el del sistema
if TG_RELNAME='ingreso' and TG_OP='UPDATE' then

raise notice 'aki%' , old.ingestado;
raise notice 'aki%' , new.ingestado;
-- cuando se ACTIVA el ingreso se quitan todos los saldos de la tabla
if old.ingestado='FINALIZADO' and new.ingestado='TRAMITE' then

update entrada set entsaldonac =0, entsaldosinnac =0 , entsaldonacf =0, entsaldosinnacf=0 , entsaldopesoneto=0,
entsaldopesobruto=0
where entcodingreso = new.ingcodsx;

end if;


-- cuando se finaliza el ingreso es que se llenan los saldos, tanto el fisico como el del sistema
if old.ingestado='TRAMITE' and new.ingestado='FINALIZADO' then

for rec in
	select * from entrada where entcodingreso = new.ingcodsx
loop

if new.ingtipo='TRAFICO' then
saldonac = 0;
saldosinnac = rec.entcantidad;
saldonacf = 0;
saldosinnacf = rec.entcantidad;

else

saldonac = rec.entcantidad;
saldosinnac = 0;
saldonacf = rec.entcantidad;
saldosinnacf = 0;

end if;

update entrada set entsaldonac = saldonac, entsaldosinnac = saldosinnac, entsaldonacf = saldonacf, entsaldosinnacf= saldosinnacf,
entsaldopesoneto = entpesonetototal, entsaldopesobruto = entpesobrutototal where entcodsx = rec.entcodsx;


end loop;




end if;



end if;


--CUANDO ES AL DESPACHO, RESTO EL SALDO FISICO:
if TG_RELNAME='despacho' and TG_OP='UPDATE' then

--cuando finalize el dspacho es que tengo que restar a la entrada:
if new.despestado='FINALIZADO' and OLD.despestado='TRAMITE'  THEN
for rec in
	SELECT referencia_despacho_pedido.refdcant as canti, refpcantidad, refpsaldo, referencia_despacho_pedido.refdpesonetototal as neto,  referencia_despacho_pedido.refdpesobrutototal as bruto, entsaldonacf, entcodsx , pedtipo 
	FROM 
	despacho, despacho_pedido, referencia_despacho, referencia_despacho_pedido, referencia_pedido, entrada, pedido
	where
	despcodsx = despeddespacho and refddespacho_pedido = despedcodsx and refdpcodrefd = refdcodsx and refdcodrefp= refpcodsx
	and refpentrada = entcodsx  and pedcodsx= refpnumpedido and despcodsx= new.despcodsx
loop
--ahora si resto al saldo fisico de la entrada el pesoneto, bruto y las cantidades segun el tipo de pedido:
if rec.pedtipo='NAC' then
	--resto saldo NAC fisico:
raise notice 'ENTCODSX:%', rec.entcodsx;
raise notice 'CANT:%', rec.canti;
	update entrada set entsaldonacf = entsaldonacf - rec.canti, entsaldopesoneto = entsaldopesoneto -rec.neto, entsaldopesobruto = entsaldopesobruto - rec.bruto where entcodsx = rec.entcodsx;
else
	update entrada set entsaldosinnacf = entsaldosinnacf - rec.canti , entsaldopesoneto = entsaldopesoneto -rec.neto, entsaldopesobruto = entsaldopesobruto - rec.bruto where entcodsx = rec.entcodsx;
end if;

end loop;
end if;

--cuando se ACTIVE EL DESPACHO, tengo que poner en las entradas el saldo fisico otra vez?
if new.despestado='TRAMITE' and OLD.despestado='FINALIZADO'  THEN
for rec in
	SELECT referencia_despacho_pedido.refdcant as canti, refpcantidad, refpsaldo, 
	referencia_despacho_pedido.refdpesonetototal as neto,  
	referencia_despacho_pedido.refdpesobrutototal as bruto, entsaldonacf, entcodsx , pedtipo 
	FROM 
	despacho, despacho_pedido, referencia_despacho, referencia_despacho_pedido, referencia_pedido, entrada, pedido
	where
	despcodsx = despeddespacho and refddespacho_pedido = despedcodsx and refdpcodrefd = refdcodsx and refdcodrefp= refpcodsx
	and refpentrada = entcodsx  and pedcodsx= refpnumpedido and despcodsx= new.despcodsx
loop
--ahora si resto al saldo fisico de la entrada el pesoneto, bruto y las cantidades segun el tipo de pedido:
if rec.pedtipo='NAC' then
	--resto saldo NAC fisico:
	update entrada set entsaldonacf = entsaldonacf + rec.canti , entsaldopesoneto = entsaldopesoneto + rec.neto, entsaldopesobruto = entsaldopesobruto + rec.bruto where entcodsx = rec.entcodsx;
else
	update entrada set entsaldosinnacf = entsaldosinnacf + rec.canti  , entsaldopesoneto = entsaldopesoneto + rec.neto, entsaldopesobruto = entsaldopesobruto + rec.bruto where entcodsx = rec.entcodsx;
end if;

end loop;
end if;



END IF;





if TG_OP='DELETE' THEN
return old;
else
return new;
end if;


end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.tg_gst_saldo() OWNER TO usersgl;

--
-- TOC entry 257 (class 1255 OID 24030)
-- Dependencies: 6 787
-- Name: tg_gst_trafico(); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION tg_gst_trafico() RETURNS "trigger"
    AS $$DECLARE 
traf RECORD; --registro de trafico a actualizar

BEGIN
RAISE INFO 'lllego al trigger';
--Cuando la tabla sea referencia_trafico
IF TG_RELNAME='referencia_trafico' THEN

if TG_OP='DELETE' THEN

select into traf trafico.* from trafico, factura_trafico where  ftrafnumtrafico = trafcodsx
and ftrafcodsx = old.reftnumfacturatrafico;
PERFORM actualizar_pesos_valor_trafico(traf.trafcodsx);

ELSE 
RAISE INFO 'lllego al if que no es DELETE';
select into traf trafico.* from trafico, factura_trafico where  ftrafnumtrafico = trafcodsx
and ftrafcodsx = NEW.reftnumfacturatrafico;
PERFORM actualizar_pesos_valor_trafico(traf.trafcodsx);

END IF;

END IF;


IF TG_OP='DELETE' THEN
RETURN OLD; 
ELSE 
RETURN NEW; 
END IF;


END;
    

$$
    LANGUAGE plpgsql;


ALTER FUNCTION movimiento.tg_gst_trafico() OWNER TO usersgl;

--
-- TOC entry 258 (class 1255 OID 24031)
-- Dependencies: 6
-- Name: total_masterpac_pedido(bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION total_masterpac_pedido(bigint) RETURNS SETOF numeric
    AS $_$select 
(sum(refpcantidad)/prounimasterpac)  from referencia_pedido, producto where procodsx = refpproducto and 
refpnumpedido=$1  group by prounimasterpac, provolmasterpac, provolumen;$_$
    LANGUAGE sql;


ALTER FUNCTION movimiento.total_masterpac_pedido(bigint) OWNER TO usersgl;

--
-- TOC entry 259 (class 1255 OID 24032)
-- Dependencies: 6
-- Name: volumen_referencia_pedido(bigint); Type: FUNCTION; Schema: movimiento; Owner: usersgl
--

CREATE FUNCTION volumen_referencia_pedido(bigint) RETURNS SETOF numeric
    AS $_$select 
(sum(refpcantidad)/prounimasterpac)*provolmasterpac  from referencia_pedido, producto where procodsx = refpproducto and 
refpnumpedido=$1  group by prounimasterpac, provolmasterpac, provolumen;$_$
    LANGUAGE sql;


ALTER FUNCTION movimiento.volumen_referencia_pedido(bigint) OWNER TO usersgl;

SET search_path = public, pg_catalog;

--
-- TOC entry 102 (class 1255 OID 16618)
-- Dependencies: 7
-- Name: _get_parser_from_curcfg(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _get_parser_from_curcfg() RETURNS text
    AS $$ select prs_name from pg_ts_cfg where oid = show_curcfg() $$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public._get_parser_from_curcfg() OWNER TO postgres;

--
-- TOC entry 260 (class 1255 OID 24033)
-- Dependencies: 787 7
-- Name: auditor(); Type: FUNCTION; Schema: public; Owner: usersgl
--

CREATE FUNCTION auditor() RETURNS "trigger"
    AS $$--
DECLARE
	textonuevo	text;
	textoviejo	text;
BEGIN
IF (TG_OP = 'DELETE') THEN
      IF TG_RELNAME='ajuste' THEN 
   	 textoviejo := COALESCE(OLD.ajcodsx::text,'null') ||'-'|| COALESCE(OLD.ajcodcia::text,'null') ||'-'|| COALESCE(OLD.ajingreso::text,'null') ||'-'|| COALESCE(OLD.ajentrada::text,'null') ||'-'|| COALESCE(OLD.ajfecha::text,'null') ||'-'|| COALESCE(OLD.ajsaldoant_nac::text,'null') ||'-'|| COALESCE(OLD.ajnuevosaldo_nac::text,'null') ||'-'|| COALESCE(OLD.ajsaldoant_nnac::text,'null') ||'-'|| COALESCE(OLD.ajnuevosaldo_nnac::text,'null') ||'-'|| COALESCE(OLD.ajestado::text,'null') ||'-'|| COALESCE(OLD.ajproducto::text,'null') ||'-'|| COALESCE(OLD.ajproducto_desc::text,'null') ||'-'|| COALESCE(OLD.aj_pos_nac::text,'null') ||'-'|| COALESCE(OLD.aj_neg_nac::text,'null') ||'-'|| COALESCE(OLD.aj_pos_nnac::text,'null') ||'-'|| COALESCE(OLD.aj_neg_nnac::text,'null') ||'-'|| COALESCE(OLD.ajobservacion::text,'null');
   END IF;
   IF TG_RELNAME='alistamiento' THEN 
   	 textoviejo := COALESCE(OLD.alcodsx::text,'null') ||'-'|| COALESCE(OLD.alfecha_ini::text,'null') ||'-'|| COALESCE(OLD.alfecha_fin::text,'null') ||'-'|| COALESCE(OLD.alcliente_fac::text,'null') ||'-'|| COALESCE(OLD.alfactura::text,'null') ||'-'|| COALESCE(OLD.alunid_facturar::text,'null');
   END IF;
   IF TG_RELNAME='almacenamiento' THEN 
   	 textoviejo := COALESCE(OLD.almcodsx::text,'null') ||'-'|| COALESCE(OLD.almcliente_fac::text,'null') ||'-'|| COALESCE(OLD.almfecha_ini::text,'null') ||'-'|| COALESCE(OLD.almfecha_fin::text,'null') ||'-'|| COALESCE(OLD.almelect::text,'null') ||'-'|| COALESCE(OLD.almvasos::text,'null') ||'-'|| COALESCE(OLD.almfactura::text,'null');
   END IF;
   IF TG_RELNAME='averia' THEN 
   	 textoviejo := COALESCE(OLD.avecodsx::text,'null') ||'-'|| COALESCE(OLD.avecompania::text,'null') ||'-'|| COALESCE(OLD.avefecha::text,'null') ||'-'|| COALESCE(OLD.aveingreso::text,'null') ||'-'|| COALESCE(OLD.aveentrada::text,'null') ||'-'|| COALESCE(OLD.avetipo::text,'null') ||'-'|| COALESCE(OLD.aveboddest::text,'null') ||'-'|| COALESCE(OLD.aveposdest::text,'null') ||'-'|| COALESCE(OLD.avecant_pleg_nac::text,'null') ||'-'|| COALESCE(OLD.avecant_pleg_nnac::text,'null') ||'-'|| COALESCE(OLD.avecant_prod_nac::text,'null') ||'-'|| COALESCE(OLD.avecant_prod_nnac::text,'null') ||'-'|| COALESCE(OLD.avesaldo_pleg_nac::text,'null') ||'-'|| COALESCE(OLD.avesaldo_pleg_nnac::text,'null') ||'-'|| COALESCE(OLD.avesaldo_prod_nac::text,'null') ||'-'|| COALESCE(OLD.avesaldo_prod_nnac::text,'null') ||'-'|| COALESCE(OLD.aveestado::text,'null') ||'-'|| COALESCE(OLD.aveproducto::text,'null');
   END IF;
   IF TG_RELNAME='averia_nacdet' THEN 
   	 textoviejo := COALESCE(OLD.avncodsx::text,'null') ||'-'|| COALESCE(OLD.avnaveria::text,'null') ||'-'|| COALESCE(OLD.avnnacdet_or::text,'null') ||'-'|| COALESCE(OLD.avncant::text,'null') ||'-'|| COALESCE(OLD.avnsaldo::text,'null');
   END IF;
   IF TG_RELNAME='bodega' THEN 
   	 textoviejo := COALESCE(OLD.bodcodsx::text,'null') ||'-'|| COALESCE(OLD.bodnombre::text,'null') ||'-'|| COALESCE(OLD.boddesc::text,'null') ||'-'|| COALESCE(OLD.bodurlplano::text,'null');
   END IF;
   IF TG_RELNAME='categoria' THEN 
   	 textoviejo := COALESCE(OLD.catcodsx::text,'null') ||'-'|| COALESCE(OLD.catcodpadre::text,'null') ||'-'|| COALESCE(OLD.catdescripcion::text,'null') ||'-'|| COALESCE(OLD.catcodcompania::text,'null') ||'-'|| COALESCE(OLD.catnombre::text,'null');
   END IF;
   IF TG_RELNAME='causal' THEN 
   	 textoviejo := COALESCE(OLD.caucodsx::text,'null') ||'-'|| COALESCE(OLD.caudesc::text,'null') ||'-'|| COALESCE(OLD.cauresponsable::text,'null') ||'-'|| COALESCE(OLD.causnota::text,'null') ||'-'|| COALESCE(OLD.causdocsoporte::text,'null');
   END IF;
   IF TG_RELNAME='causal_hit' THEN 
   	 textoviejo := COALESCE(OLD.cauhcodsx::text,'null') ||'-'|| COALESCE(OLD.cauhdesc::text,'null') ||'-'|| COALESCE(OLD.cauresp::text,'null');
   END IF;
   IF TG_RELNAME='causal_pedido' THEN 
   	 textoviejo := COALESCE(OLD.caupcodsx::text,'null') ||'-'|| COALESCE(OLD.cauppedido::text,'null') ||'-'|| COALESCE(OLD.caupcausal::text,'null') ||'-'|| COALESCE(OLD.caupdesccausal::text,'null') ||'-'|| COALESCE(OLD.caupfecha::text,'null');
   END IF;
   IF TG_RELNAME='ciudad' THEN 
   	 textoviejo := COALESCE(OLD.ciucodigo::text,'null') ||'-'|| COALESCE(OLD.ciunombre::text,'null') ||'-'|| COALESCE(OLD.ciudepto::text,'null');
   END IF;
   IF TG_RELNAME='cliente' THEN 
   	 textoviejo := COALESCE(OLD.clicodsx::text,'null') ||'-'|| COALESCE(OLD.clinombre::text,'null') ||'-'|| COALESCE(OLD.clinit::text,'null') ||'-'|| COALESCE(OLD.clidireccion::text,'null') ||'-'|| COALESCE(OLD.clitelefono::text,'null') ||'-'|| COALESCE(OLD.cliciudad::text,'null') ||'-'|| COALESCE(OLD.clicontacto::text,'null') ||'-'|| COALESCE(OLD.climail::text,'null') ||'-'|| COALESCE(OLD.cliobservacion::text,'null') ||'-'|| COALESCE(OLD.clicodcompania::text,'null') ||'-'|| COALESCE(OLD.clicodigo::text,'null') ||'-'|| COALESCE(OLD.clidevolucion::text,'null');
   END IF;
   IF TG_RELNAME='cliente_facturacion' THEN 
   	 textoviejo := COALESCE(OLD.clifcodsx::text,'null') ||'-'|| COALESCE(OLD.clifnombre::text,'null') ||'-'|| COALESCE(OLD.clifnit::text,'null') ||'-'|| COALESCE(OLD.clifdireccion::text,'null') ||'-'|| COALESCE(OLD.cliftelefono::text,'null') ||'-'|| COALESCE(OLD.clifcodcompania::text,'null');
   END IF;
   IF TG_RELNAME='compania' THEN 
   	 textoviejo := COALESCE(OLD.comcodsx::text,'null') ||'-'|| COALESCE(OLD.comdireccion::text,'null') ||'-'|| COALESCE(OLD.comnombre::text,'null') ||'-'|| COALESCE(OLD.comfax::text,'null') ||'-'|| COALESCE(OLD.comciudad::text,'null') ||'-'|| COALESCE(OLD.comemail::text,'null') ||'-'|| COALESCE(OLD.comgerente::text,'null') ||'-'|| COALESCE(OLD.comcontacto::text,'null') ||'-'|| COALESCE(OLD.comcargo::text,'null') ||'-'|| COALESCE(OLD.comtelefono::text,'null') ||'-'|| COALESCE(OLD.comnit::text,'null') ||'-'|| COALESCE(OLD.comtipo::text,'null') ||'-'|| COALESCE(OLD.cominventario::text,'null') ||'-'|| COALESCE(OLD.commapa::text,'null');
   END IF;
   IF TG_RELNAME='concepto' THEN 
   	 textoviejo := COALESCE(OLD.concodsx::text,'null') ||'-'|| COALESCE(OLD.condesc::text,'null');
   END IF;
   IF TG_RELNAME='concepto_cliente' THEN 
   	 textoviejo := COALESCE(OLD.conccodsx::text,'null') ||'-'|| COALESCE(OLD.conccodconcepto::text,'null') ||'-'|| COALESCE(OLD.conccodcliente::text,'null') ||'-'|| COALESCE(OLD.concdescconcepto::text,'null') ||'-'|| COALESCE(OLD.concnombrecliente::text,'null') ||'-'|| COALESCE(OLD.concvalorunit::text,'null') ||'-'|| COALESCE(OLD.concporcentaje::text,'null') ||'-'|| COALESCE(OLD.concminimo::text,'null');
   END IF;
   IF TG_RELNAME='config' THEN 
   	 textoviejo := COALESCE(OLD.cfnombre::text,'null') ||'-'|| COALESCE(OLD.cfvalor::text,'null');
   END IF;
   IF TG_RELNAME='contenedor_trafico' THEN 
   	 textoviejo := COALESCE(OLD.ctrafcodsx::text,'null') ||'-'|| COALESCE(OLD.ctrafnumtrafico::text,'null') ||'-'|| COALESCE(OLD.ctraftamano::text,'null') ||'-'|| COALESCE(OLD.ctrafnumero::text,'null');
   END IF;
   IF TG_RELNAME='departamento' THEN 
   	 textoviejo := COALESCE(OLD.depcodigo::text,'null') ||'-'|| COALESCE(OLD.depnombre::text,'null') ||'-'|| COALESCE(OLD.depzona::text,'null');
   END IF;
   IF TG_RELNAME='despacho' THEN 
   	 textoviejo := COALESCE(OLD.despcodsx::text,'null') ||'-'|| COALESCE(OLD.despempresa::text,'null') ||'-'|| COALESCE(OLD.despfecha::text,'null') ||'-'|| COALESCE(OLD.despobservacion::text,'null') ||'-'|| COALESCE(OLD.despplaca::text,'null') ||'-'|| COALESCE(OLD.despnombrecond::text,'null') ||'-'|| COALESCE(OLD.despcedcond::text,'null') ||'-'|| COALESCE(OLD.desptransportadora::text,'null') ||'-'|| COALESCE(OLD.despestado::text,'null') ||'-'|| COALESCE(OLD.despbultos::text,'null') ||'-'|| COALESCE(OLD.despbultosarmados::text,'null') ||'-'|| COALESCE(OLD.desppesoneto::text,'null') ||'-'|| COALESCE(OLD.desppesobruto::text,'null') ||'-'|| COALESCE(OLD.despfob::text,'null') ||'-'|| COALESCE(OLD.despconsec::text,'null') ||'-'|| COALESCE(OLD.despconseczfp::text,'null');
   END IF;
   IF TG_RELNAME='despacho_pedido' THEN 
   	 textoviejo := COALESCE(OLD.despedcodsx::text,'null') ||'-'|| COALESCE(OLD.despeddespacho::text,'null') ||'-'|| COALESCE(OLD.despedpedido::text,'null') ||'-'|| COALESCE(OLD.despedbultos::text,'null') ||'-'|| COALESCE(OLD.despedbultosarmados::text,'null') ||'-'|| COALESCE(OLD.despedpesoneto::text,'null') ||'-'|| COALESCE(OLD.despedpesobruto::text,'null') ||'-'|| COALESCE(OLD.despedvalor::text,'null');
   END IF;
   IF TG_RELNAME='empleado' THEN 
   	 textoviejo := COALESCE(OLD.empcodsx::text,'null') ||'-'|| COALESCE(OLD.empnombre::text,'null') ||'-'|| COALESCE(OLD.empcedula::text,'null') ||'-'|| COALESCE(OLD.empmail::text,'null') ||'-'|| COALESCE(OLD.empcargo::text,'null');
   END IF;
   IF TG_RELNAME='empresa' THEN 
   	 textoviejo := COALESCE(OLD.empcodsx::text,'null') ||'-'|| COALESCE(OLD.empnombre::text,'null') ||'-'|| COALESCE(OLD.empdireccion::text,'null') ||'-'|| COALESCE(OLD.emptelefono::text,'null') ||'-'|| COALESCE(OLD.empnit::text,'null') ||'-'|| COALESCE(OLD.empdescripcion::text,'null') ||'-'|| COALESCE(OLD.empmail::text,'null') ||'-'|| COALESCE(OLD.empslogan::text,'null');
   END IF;
   IF TG_RELNAME='entrada' THEN 
   	 textoviejo := COALESCE(OLD.entcodsx::text,'null') ||'-'|| COALESCE(OLD.entcodingreso::text,'null') ||'-'|| COALESCE(OLD.entcodproducto::text,'null') ||'-'|| COALESCE(OLD.entbodega::text,'null') ||'-'|| COALESCE(OLD.entposicion::text,'null') ||'-'|| COALESCE(OLD.entcantidad::text,'null') ||'-'|| COALESCE(OLD.entpesoneto::text,'null') ||'-'|| COALESCE(OLD.entpesonetototal::text,'null') ||'-'|| COALESCE(OLD.entpesobruto::text,'null') ||'-'|| COALESCE(OLD.entpesobrutototal::text,'null') ||'-'|| COALESCE(OLD.entsaldopesoneto::text,'null') ||'-'|| COALESCE(OLD.entsaldopesobruto::text,'null') ||'-'|| COALESCE(OLD.entsaldonac::text,'null') ||'-'|| COALESCE(OLD.entsaldosinnac::text,'null') ||'-'|| COALESCE(OLD.entvalor::text,'null') ||'-'|| COALESCE(OLD.entvalortotal::text,'null') ||'-'|| COALESCE(OLD.entfecha::text,'null') ||'-'|| COALESCE(OLD.entsaldonacf::text,'null') ||'-'|| COALESCE(OLD.entsaldosinnacf::text,'null') ||'-'|| COALESCE(OLD.entunidad::text,'null');
   END IF;
   IF TG_RELNAME='factura' THEN 
   	 textoviejo := COALESCE(OLD.faccodsx::text,'null') ||'-'|| COALESCE(OLD.faccodcliente::text,'null') ||'-'|| COALESCE(OLD.facdesccliente::text,'null') ||'-'|| COALESCE(OLD.facfechasistema::text,'null') ||'-'|| COALESCE(OLD.facfechafactura::text,'null') ||'-'|| COALESCE(OLD.facfechavencimiento::text,'null') ||'-'|| COALESCE(OLD.facnit::text,'null') ||'-'|| COALESCE(OLD.facdireccion::text,'null') ||'-'|| COALESCE(OLD.facobservaciones::text,'null') ||'-'|| COALESCE(OLD.facconcepto::text,'null') ||'-'|| COALESCE(OLD.facestado::text,'null') ||'-'|| COALESCE(OLD.facsubtotal::text,'null') ||'-'|| COALESCE(OLD.faciva::text,'null') ||'-'|| COALESCE(OLD.facretefuente::text,'null') ||'-'|| COALESCE(OLD.factotal::text,'null') ||'-'|| COALESCE(OLD.factextototal::text,'null') ||'-'|| COALESCE(OLD.factrm::text,'null') ||'-'|| COALESCE(OLD.fac_tipo::text,'null') ||'-'|| COALESCE(OLD.facvaloriva::text,'null') ||'-'|| COALESCE(OLD.facvalorretef::text,'null') ||'-'|| COALESCE(OLD.facmoneda::text,'null');
   END IF;
   IF TG_RELNAME='factura_detalle' THEN 
   	 textoviejo := COALESCE(OLD.facdcodsx::text,'null') ||'-'|| COALESCE(OLD.facdfactura::text,'null') ||'-'|| COALESCE(OLD.facdconceptodesc::text,'null') ||'-'|| COALESCE(OLD.facdtipo::text,'null') ||'-'|| COALESCE(OLD.facdvalorunit::text,'null') ||'-'|| COALESCE(OLD.facdvalortotal::text,'null') ||'-'|| COALESCE(OLD.facdcantidad::text,'null') ||'-'|| COALESCE(OLD.facdobservacion::text,'null') ||'-'|| COALESCE(OLD.facdporcentaje::text,'null') ||'-'|| COALESCE(OLD.facdvalorcomicion::text,'null') ||'-'|| COALESCE(OLD.facdminimo::text,'null');
   END IF;
   IF TG_RELNAME='factura_trafico' THEN 
   	 textoviejo := COALESCE(OLD.ftrafcodsx::text,'null') ||'-'|| COALESCE(OLD.ftrafnumfactura::text,'null') ||'-'|| COALESCE(OLD.ftrafnumtrafico::text,'null');
   END IF;
   IF TG_RELNAME='faq' THEN 
   	 textoviejo := COALESCE(OLD.faqcodsx::text,'null') ||'-'|| COALESCE(OLD.faqpregunta::text,'null') ||'-'|| COALESCE(OLD.faqrespcorta::text,'null') ||'-'|| COALESCE(OLD.faqresplarga::text,'null');
   END IF;
   IF TG_RELNAME='flete' THEN 
   	 textoviejo := COALESCE(OLD.flecodsx::text,'null') ||'-'|| COALESCE(OLD.fleciudad::text,'null') ||'-'|| COALESCE(OLD.fletransportadora::text,'null') ||'-'|| COALESCE(OLD.flevalor::text,'null') ||'-'|| COALESCE(OLD.fledias::text,'null');
   END IF;
   IF TG_RELNAME='grupo' THEN 
   	 textoviejo := COALESCE(OLD.gcodsx::text,'null') ||'-'|| COALESCE(OLD.gnombre::text,'null');
   END IF;
   IF TG_RELNAME='ingreso' THEN 
   	 textoviejo := COALESCE(OLD.ingcodsx::text,'null') ||'-'|| COALESCE(OLD.ingcodcia::text,'null') ||'-'|| COALESCE(OLD.ingfecha::text,'null') ||'-'|| COALESCE(OLD.ingtipo::text,'null') ||'-'|| COALESCE(OLD.ingtrafico::text,'null') ||'-'|| COALESCE(OLD.ingobservacion::text,'null') ||'-'|| COALESCE(OLD.ingestado::text,'null') ||'-'|| COALESCE(OLD.ingcausal::text,'null') ||'-'|| COALESCE(OLD.ingcli_devolucion::text,'null') ||'-'|| COALESCE(OLD.ingpesoneto::text,'null') ||'-'|| COALESCE(OLD.ingpesobruto::text,'null') ||'-'|| COALESCE(OLD.ingfob::text,'null') ||'-'|| COALESCE(OLD.ingcantidad::text,'null') ||'-'|| COALESCE(OLD.ingciudad_dev::text,'null') ||'-'|| COALESCE(OLD.ingconsec::text,'null') ||'-'|| COALESCE(OLD.ingconseczfp::text,'null') ||'-'|| COALESCE(OLD.ingplanilla::text,'null');
   END IF;
   IF TG_RELNAME='nacionalizacion' THEN 
   	 textoviejo := COALESCE(OLD.naccodsx::text,'null') ||'-'|| COALESCE(OLD.nacempresa::text,'null') ||'-'|| COALESCE(OLD.nacfecha::text,'null') ||'-'|| COALESCE(OLD.nacingreso::text,'null') ||'-'|| COALESCE(OLD.nacestado::text,'null') ||'-'|| COALESCE(OLD.nacdeclaracion::text,'null') ||'-'|| COALESCE(OLD.nacfechadeclaracion::text,'null') ||'-'|| COALESCE(OLD.nacfechaingresobodega::text,'null') ||'-'|| COALESCE(OLD.nacpaginainicial::text,'null') ||'-'|| COALESCE(OLD.nacpaginafinal::text,'null') ||'-'|| COALESCE(OLD.nacdosia::text,'null') ||'-'|| COALESCE(OLD.nacobservaciones::text,'null') ||'-'|| COALESCE(OLD.nactipo::text,'null') ||'-'|| COALESCE(OLD.nacpesoneto::text,'null') ||'-'|| COALESCE(OLD.nacpesobruto::text,'null') ||'-'|| COALESCE(OLD.nacfob::text,'null') ||'-'|| COALESCE(OLD.nacconsec::text,'null') ||'-'|| COALESCE(OLD.nacconseczfp::text,'null');
   END IF;
   IF TG_RELNAME='nacionalizacion_detalle' THEN 
   	 textoviejo := COALESCE(OLD.nadcodsx::text,'null') ||'-'|| COALESCE(OLD.nadcodnac::text,'null') ||'-'|| COALESCE(OLD.nadentrada::text,'null') ||'-'|| COALESCE(OLD.nadcantidad::text,'null') ||'-'|| COALESCE(OLD.nadsaldo::text,'null') ||'-'|| COALESCE(OLD.nadpesoneto::text,'null') ||'-'|| COALESCE(OLD.nadpesonetototal::text,'null') ||'-'|| COALESCE(OLD.nadpesobruto::text,'null') ||'-'|| COALESCE(OLD.nadpesobrutototal::text,'null') ||'-'|| COALESCE(OLD.nadfob::text,'null') ||'-'|| COALESCE(OLD.nadfobtotal::text,'null');
   END IF;
   IF TG_RELNAME='novedad_pedido' THEN 
   	 textoviejo := COALESCE(OLD.novcodsx::text,'null') ||'-'|| COALESCE(OLD.novpedido::text,'null') ||'-'|| COALESCE(OLD.novfecha::text,'null') ||'-'|| COALESCE(OLD.novdesc::text,'null') ||'-'|| COALESCE(OLD.novusuario::text,'null');
   END IF;
   IF TG_RELNAME='packing' THEN 
   	 textoviejo := COALESCE(OLD.packcodsx::text,'null') ||'-'|| COALESCE(OLD.packempresa::text,'null') ||'-'|| COALESCE(OLD.packfecha::text,'null') ||'-'|| COALESCE(OLD.packobservaciones::text,'null') ||'-'|| COALESCE(OLD.packestado::text,'null') ||'-'|| COALESCE(OLD.packpesoneto::text,'null') ||'-'|| COALESCE(OLD.packpesobruto::text,'null');
   END IF;
   IF TG_RELNAME='packing_detalle' THEN 
   	 textoviejo := COALESCE(OLD.packdcodsx::text,'null') ||'-'|| COALESCE(OLD.packdpacking::text,'null') ||'-'|| COALESCE(OLD.packdproducto::text,'null') ||'-'|| COALESCE(OLD.packdpesoneto::text,'null') ||'-'|| COALESCE(OLD.packdpesobruto::text,'null') ||'-'|| COALESCE(OLD.packdcantidad::text,'null');
   END IF;
   IF TG_RELNAME='packing_detalle_posicion' THEN 
   	 textoviejo := COALESCE(OLD.packpcodsx::text,'null') ||'-'|| COALESCE(OLD.packppackingdet::text,'null') ||'-'|| COALESCE(OLD.packpbodega::text,'null') ||'-'|| COALESCE(OLD.packpposicion::text,'null') ||'-'|| COALESCE(OLD.packpcantidad::text,'null') ||'-'|| COALESCE(OLD.packpentrada::text,'null') ||'-'|| COALESCE(OLD.packpnacdetalle::text,'null') ||'-'|| COALESCE(OLD.packpsaldo::text,'null') ||'-'|| COALESCE(OLD.packppesoneto::text,'null') ||'-'|| COALESCE(OLD.packppesobruto::text,'null') ||'-'|| COALESCE(OLD.packppesonetototal::text,'null') ||'-'|| COALESCE(OLD.packppesobrutototal::text,'null');
   END IF;
   IF TG_RELNAME='pedido' THEN 
   	 textoviejo := COALESCE(OLD.pedcodsx::text,'null') ||'-'|| COALESCE(OLD.pedcompania::text,'null') ||'-'|| COALESCE(OLD.pednumpedido::text,'null') ||'-'|| COALESCE(OLD.pedordencompra::text,'null') ||'-'|| COALESCE(OLD.pedguia::text,'null') ||'-'|| COALESCE(OLD.pedfechasistema::text,'null') ||'-'|| COALESCE(OLD.pedfecha::text,'null') ||'-'|| COALESCE(OLD.pedfechavenc::text,'null') ||'-'|| COALESCE(OLD.pedfechacita::text,'null') ||'-'|| COALESCE(OLD.pedhoracita::text,'null') ||'-'|| COALESCE(OLD.pedcliente::text,'null') ||'-'|| COALESCE(OLD.pedsucursal::text,'null') ||'-'|| COALESCE(OLD.peddireccion::text,'null') ||'-'|| COALESCE(OLD.pedciudad::text,'null') ||'-'|| COALESCE(OLD.peddepartamento::text,'null') ||'-'|| COALESCE(OLD.pedobservaciones::text,'null') ||'-'|| COALESCE(OLD.pedfactura::text,'null') ||'-'|| COALESCE(OLD.pedestado::text,'null') ||'-'|| COALESCE(OLD.pedsubtotal::text,'null') ||'-'|| COALESCE(OLD.pediva::text,'null') ||'-'|| COALESCE(OLD.peddescuento::text,'null') ||'-'|| COALESCE(OLD.pedtotal::text,'null') ||'-'|| COALESCE(OLD.pedtipo::text,'null') ||'-'|| COALESCE(OLD.pedpicking::text,'null') ||'-'|| COALESCE(OLD.pedpesoneto::text,'null') ||'-'|| COALESCE(OLD.pedpesobruto::text,'null') ||'-'|| COALESCE(OLD.pedhora::text,'null') ||'-'|| COALESCE(OLD.pedzona::text,'null') ||'-'|| COALESCE(OLD.pedcausal_hit::text,'null') ||'-'|| COALESCE(OLD.pedporc_iva::text,'null');
   END IF;
   IF TG_RELNAME='permiso' THEN 
   	 textoviejo := COALESCE(OLD.percodsx::text,'null') ||'-'|| COALESCE(OLD.pergrupo::text,'null') ||'-'|| COALESCE(OLD.perapp::text,'null') ||'-'|| COALESCE(OLD.permodulo::text,'null') ||'-'|| COALESCE(OLD.peracceso::text,'null');
   END IF;
   IF TG_RELNAME='picking' THEN 
   	 textoviejo := COALESCE(OLD.pickcodsx::text,'null') ||'-'|| COALESCE(OLD.pickfecha::text,'null') ||'-'|| COALESCE(OLD.pickempresa::text,'null') ||'-'|| COALESCE(OLD.pickcodpacking::text,'null') ||'-'|| COALESCE(OLD.pickobservaciones::text,'null') ||'-'|| COALESCE(OLD.pickestado::text,'null') ||'-'|| COALESCE(OLD.pickpesoneto::text,'null') ||'-'|| COALESCE(OLD.pickpesobruto::text,'null') ||'-'|| COALESCE(OLD.pickvalor::text,'null') ||'-'|| COALESCE(OLD.pickpedido::text,'null') ||'-'|| COALESCE(OLD.picknumpedido::text,'null');
   END IF;
   IF TG_RELNAME='picking_detalle' THEN 
   	 textoviejo := COALESCE(OLD.pickdcodsx::text,'null') ||'-'|| COALESCE(OLD.pickdcodpicking::text,'null') ||'-'|| COALESCE(OLD.pickdproducto::text,'null') ||'-'|| COALESCE(OLD.pickdvalorunit::text,'null') ||'-'|| COALESCE(OLD.pickdpesoneto::text,'null') ||'-'|| COALESCE(OLD.pickdpesobruto::text,'null') ||'-'|| COALESCE(OLD.pickdvalortotal::text,'null') ||'-'|| COALESCE(OLD.pickdcantidad::text,'null');
   END IF;
   IF TG_RELNAME='picking_detalle_packing' THEN 
   	 textoviejo := COALESCE(OLD.pickpcodsx::text,'null') ||'-'|| COALESCE(OLD.pickppickingdetalle::text,'null') ||'-'|| COALESCE(OLD.pickppackingdet::text,'null') ||'-'|| COALESCE(OLD.pickpcantidad::text,'null') ||'-'|| COALESCE(OLD.pickppesoneto::text,'null') ||'-'|| COALESCE(OLD.pickppesobruto::text,'null') ||'-'|| COALESCE(OLD.pickppesonetototal::text,'null') ||'-'|| COALESCE(OLD.pickppesobrutototal::text,'null');
   END IF;
   IF TG_RELNAME='producto' THEN 
   	 textoviejo := COALESCE(OLD.procodsx::text,'null') ||'-'|| COALESCE(OLD.procodigocia::text,'null') ||'-'|| COALESCE(OLD.prodescripcion::text,'null') ||'-'|| COALESCE(OLD.procategoria::text,'null') ||'-'|| COALESCE(OLD.promodelo::text,'null') ||'-'|| COALESCE(OLD.prosubpartida::text,'null') ||'-'|| COALESCE(OLD.proean::text,'null') ||'-'|| COALESCE(OLD.procodbarra::text,'null') ||'-'|| COALESCE(OLD.progarantia::text,'null') ||'-'|| COALESCE(OLD.prokiloreal::text,'null') ||'-'|| COALESCE(OLD.provolumen::text,'null') ||'-'|| COALESCE(OLD.prokilovolumen::text,'null') ||'-'|| COALESCE(OLD.prouniempaque::text,'null') ||'-'|| COALESCE(OLD.prokvuniempaque::text,'null') ||'-'|| COALESCE(OLD.provoluniempaque::text,'null') ||'-'|| COALESCE(OLD.prounimasterpac::text,'null') ||'-'|| COALESCE(OLD.prokvmasterpack::text,'null') ||'-'|| COALESCE(OLD.propesobmp::text,'null') ||'-'|| COALESCE(OLD.provolmasterpac::text,'null') ||'-'|| COALESCE(OLD.procodigobarra::text,'null') ||'-'|| COALESCE(OLD.proestado::text,'null') ||'-'|| COALESCE(OLD.proobservacion::text,'null') ||'-'|| COALESCE(OLD.protipoproducto::text,'null');
   END IF;
   IF TG_RELNAME='producto_cliente' THEN 
   	 textoviejo := COALESCE(OLD.proccodsx::text,'null') ||'-'|| COALESCE(OLD.proccliente::text,'null') ||'-'|| COALESCE(OLD.procproducto::text,'null') ||'-'|| COALESCE(OLD.procean::text,'null') ||'-'|| COALESCE(OLD.proctag::text,'null') ||'-'|| COALESCE(OLD.procodbarra::text,'null') ||'-'|| COALESCE(OLD.procnumcodigobarra::text,'null') ||'-'|| COALESCE(OLD.procgarantia::text,'null');
   END IF;
   IF TG_RELNAME='proforma' THEN 
   	 textoviejo := COALESCE(OLD.profcodsx::text,'null') ||'-'|| COALESCE(OLD.profnumfactura::text,'null') ||'-'|| COALESCE(OLD.profost::text,'null') ||'-'|| COALESCE(OLD.profpedido::text,'null') ||'-'|| COALESCE(OLD.profnit::text,'null') ||'-'|| COALESCE(OLD.porforigen::text,'null') ||'-'|| COALESCE(OLD.profmotonave::text,'null') ||'-'|| COALESCE(OLD.profbl::text,'null') ||'-'|| COALESCE(OLD.proftasacambio::text,'null') ||'-'|| COALESCE(OLD.profbultos::text,'null') ||'-'|| COALESCE(OLD.profcont20::text,'null') ||'-'|| COALESCE(OLD.profcont40::text,'null') ||'-'|| COALESCE(OLD.profcont40hc::text,'null') ||'-'|| COALESCE(OLD.profpeso::text,'null') ||'-'|| COALESCE(OLD.proffob::text,'null') ||'-'|| COALESCE(OLD.profflete::text,'null') ||'-'|| COALESCE(OLD.profgastosorigen::text,'null') ||'-'|| COALESCE(OLD.profrecargocomb::text,'null') ||'-'|| COALESCE(OLD.profgastosdestino::text,'null') ||'-'|| COALESCE(OLD.profgastosnaviera::text,'null') ||'-'|| COALESCE(OLD.profcollectionfee::text,'null') ||'-'|| COALESCE(OLD.profradicacionbl::text,'null') ||'-'|| COALESCE(OLD.profmanejo::text,'null') ||'-'|| COALESCE(OLD.profdropoff::text,'null') ||'-'|| COALESCE(OLD.profseguro::text,'null') ||'-'|| COALESCE(OLD.profcifdolares::text,'null') ||'-'|| COALESCE(OLD.profcifpesos::text,'null') ||'-'|| COALESCE(OLD.proftotal::text,'null') ||'-'|| COALESCE(OLD.proffecha::text,'null') ||'-'|| COALESCE(OLD.profcliente::text,'null') ||'-'|| COALESCE(OLD.profservotm::text,'null') ||'-'|| COALESCE(OLD.profanticipo::text,'null') ||'-'|| COALESCE(OLD.proffurgon::text,'null') ||'-'|| COALESCE(OLD.profmanejosli::text,'null');
   END IF;
   IF TG_RELNAME='referencia_despacho' THEN 
   	 textoviejo := COALESCE(OLD.refdcodsx::text,'null') ||'-'|| COALESCE(OLD.refddespacho_pedido::text,'null') ||'-'|| COALESCE(OLD.refdproducto::text,'null') ||'-'|| COALESCE(OLD.refdcant::text,'null') ||'-'|| COALESCE(OLD.refdvalor::text,'null') ||'-'|| COALESCE(OLD.refdpesoneto::text,'null') ||'-'|| COALESCE(OLD.refdpesobruto::text,'null');
   END IF;
   IF TG_RELNAME='referencia_despacho_pedido' THEN 
   	 textoviejo := COALESCE(OLD.refdpcodsx::text,'null') ||'-'|| COALESCE(OLD.refdpcodrefd::text,'null') ||'-'|| COALESCE(OLD.refdcodrefp::text,'null') ||'-'|| COALESCE(OLD.refdcant::text,'null') ||'-'|| COALESCE(OLD.refdvalorunit::text,'null') ||'-'|| COALESCE(OLD.refdvalortotal::text,'null') ||'-'|| COALESCE(OLD.refdpesoneto::text,'null') ||'-'|| COALESCE(OLD.refdpesobruto::text,'null') ||'-'|| COALESCE(OLD.refdpesonetototal::text,'null') ||'-'|| COALESCE(OLD.refdpesobrutototal::text,'null');
   END IF;
   IF TG_RELNAME='referencia_pedido' THEN 
   	 textoviejo := COALESCE(OLD.refpcodsx::text,'null') ||'-'|| COALESCE(OLD.refpnumpedido::text,'null') ||'-'|| COALESCE(OLD.refpproducto::text,'null') ||'-'|| COALESCE(OLD.refpbodega::text,'null') ||'-'|| COALESCE(OLD.refpposicion::text,'null') ||'-'|| COALESCE(OLD.refpcantidad::text,'null') ||'-'|| COALESCE(OLD.refpvalorunit::text,'null') ||'-'|| COALESCE(OLD.refpvalortotal::text,'null') ||'-'|| COALESCE(OLD.refpentrada::text,'null') ||'-'|| COALESCE(OLD.refpnacdetalle::text,'null') ||'-'|| COALESCE(OLD.refpsaldo::text,'null') ||'-'|| COALESCE(OLD.refppesoneto::text,'null') ||'-'|| COALESCE(OLD.refppesobruto::text,'null') ||'-'|| COALESCE(OLD.refppesonetototal::text,'null') ||'-'|| COALESCE(OLD.refppesobrutototal::text,'null');
   END IF;
   IF TG_RELNAME='referencia_trafico' THEN 
   	 textoviejo := COALESCE(OLD.reftcodsx::text,'null') ||'-'|| COALESCE(OLD.reftnumfacturatrafico::text,'null') ||'-'|| COALESCE(OLD.reftproducto::text,'null') ||'-'|| COALESCE(OLD.reftcantidad::text,'null') ||'-'|| COALESCE(OLD.reftpesoneto::text,'null') ||'-'|| COALESCE(OLD.reftpesobruto::text,'null') ||'-'|| COALESCE(OLD.reftfobunit::text,'null') ||'-'|| COALESCE(OLD.reftfobtotal::text,'null') ||'-'|| COALESCE(OLD.reftcifunit::text,'null') ||'-'|| COALESCE(OLD.reftciftotal::text,'null') ||'-'|| COALESCE(OLD.reftpesonetototal::text,'null') ||'-'|| COALESCE(OLD.reftpesobrutototal::text,'null') ||'-'|| COALESCE(OLD.reftmpacks::text,'null');
   END IF;
   IF TG_RELNAME='reparacion' THEN 
   	 textoviejo := COALESCE(OLD.repcodsx::text,'null') ||'-'|| COALESCE(OLD.repcodcia::text,'null') ||'-'|| COALESCE(OLD.repfecha::text,'null') ||'-'|| COALESCE(OLD.repsaldo::text,'null') ||'-'|| COALESCE(OLD.repdestino::text,'null') ||'-'|| COALESCE(OLD.repestado::text,'null') ||'-'|| COALESCE(OLD.repobservacion::text,'null') ||'-'|| COALESCE(OLD.reppedido::text,'null');
   END IF;
   IF TG_RELNAME='reparacion_detalle' THEN 
   	 textoviejo := COALESCE(OLD.repdcodsx::text,'null') ||'-'|| COALESCE(OLD.repdreparacion::text,'null') ||'-'|| COALESCE(OLD.repdproducto::text,'null') ||'-'|| COALESCE(OLD.repdaveria::text,'null') ||'-'|| COALESCE(OLD.repdcant_pleg::text,'null') ||'-'|| COALESCE(OLD.repdcant_prod::text,'null') ||'-'|| COALESCE(OLD.repdbodega::text,'null') ||'-'|| COALESCE(OLD.repdposicion::text,'null') ||'-'|| COALESCE(OLD.repdtiposaldo::text,'null') ||'-'|| COALESCE(OLD.repdbodega_dest::text,'null') ||'-'|| COALESCE(OLD.repdposicion_dest::text,'null');
   END IF;
   IF TG_RELNAME='reparacion_nacdet' THEN 
   	 textoviejo := COALESCE(OLD.repndcodsx::text,'null') ||'-'|| COALESCE(OLD.repndrepdetalle::text,'null') ||'-'|| COALESCE(OLD.repndnacdet::text,'null') ||'-'|| COALESCE(OLD.repndcant::text,'null') ||'-'|| COALESCE(OLD.repndaverianacdet::text,'null') ||'-'|| COALESCE(OLD.repndnacdet_rep::text,'null');
   END IF;
   IF TG_RELNAME='reubic_nacdetalle' THEN 
   	 textoviejo := COALESCE(OLD.rencodsx::text,'null') ||'-'|| COALESCE(OLD.renreubicacion::text,'null') ||'-'|| COALESCE(OLD.renacdetalle_or::text,'null') ||'-'|| COALESCE(OLD.renacdetalle_fin::text,'null') ||'-'|| COALESCE(OLD.rencantidad::text,'null');
   END IF;
   IF TG_RELNAME='reubicacion' THEN 
   	 textoviejo := COALESCE(OLD.recodsx::text,'null') ||'-'|| COALESCE(OLD.recodcia::text,'null') ||'-'|| COALESCE(OLD.reingreso::text,'null') ||'-'|| COALESCE(OLD.retipo::text,'null') ||'-'|| COALESCE(OLD.reentradaor::text,'null') ||'-'|| COALESCE(OLD.reentradafin::text,'null') ||'-'|| COALESCE(OLD.recantidad::text,'null') ||'-'|| COALESCE(OLD.reestado::text,'null') ||'-'|| COALESCE(OLD.refecha::text,'null') ||'-'|| COALESCE(OLD.retipomov::text,'null');
   END IF;
   IF TG_RELNAME='sucursal' THEN 
   	 textoviejo := COALESCE(OLD.succodsx::text,'null') ||'-'|| COALESCE(OLD.succodcliente::text,'null') ||'-'|| COALESCE(OLD.sucnit::text,'null') ||'-'|| COALESCE(OLD.sucnombre::text,'null') ||'-'|| COALESCE(OLD.succiudad::text,'null') ||'-'|| COALESCE(OLD.sucdepartamento::text,'null') ||'-'|| COALESCE(OLD.succontacto::text,'null') ||'-'|| COALESCE(OLD.succargo::text,'null') ||'-'|| COALESCE(OLD.sucemail::text,'null') ||'-'|| COALESCE(OLD.sucdireccion::text,'null') ||'-'|| COALESCE(OLD.suctelefono::text,'null') ||'-'|| COALESCE(OLD.succodigo::text,'null');
   END IF;
   IF TG_RELNAME='trafico' THEN 
   	 textoviejo := COALESCE(OLD.trafcodsx::text,'null') ||'-'|| COALESCE(OLD.trafcompania::text,'null') ||'-'|| COALESCE(OLD.traffechacreacion::text,'null') ||'-'|| COALESCE(OLD.trafdocumento::text,'null') ||'-'|| COALESCE(OLD.trafembarque::text,'null') ||'-'|| COALESCE(OLD.traftransportadora::text,'null') ||'-'|| COALESCE(OLD.trafprocedencia::text,'null') ||'-'|| COALESCE(OLD.traffechaarribopuerto::text,'null') ||'-'|| COALESCE(OLD.traffechapresentdta::text,'null') ||'-'|| COALESCE(OLD.traffechaaprobaciondta::text,'null') ||'-'|| COALESCE(OLD.traffob::text,'null') ||'-'|| COALESCE(OLD.trafcif::text,'null') ||'-'|| COALESCE(OLD.trafconsec::text,'null') ||'-'|| COALESCE(OLD.trafnumerofmm::text,'null') ||'-'|| COALESCE(OLD.traftrm::text,'null') ||'-'|| COALESCE(OLD.trafnumdta::text,'null') ||'-'|| COALESCE(OLD.trafnumsobordo::text,'null') ||'-'|| COALESCE(OLD.traffechadescargue::text,'null') ||'-'|| COALESCE(OLD.traffechalevante::text,'null') ||'-'|| COALESCE(OLD.traffechaingresozf::text,'null') ||'-'|| COALESCE(OLD.trafentregadocusia::text,'null') ||'-'|| COALESCE(OLD.trafobservaciones::text,'null') ||'-'|| COALESCE(OLD.trafpesobruto::text,'null') ||'-'|| COALESCE(OLD.trafusuario::text,'null') ||'-'|| COALESCE(OLD.traffechasobordo::text,'null') ||'-'|| COALESCE(OLD.traforigen::text,'null') ||'-'|| COALESCE(OLD.trafpesoneto::text,'null') ||'-'|| COALESCE(OLD.traffletesseguro::text,'null') ||'-'|| COALESCE(OLD.trafestado::text,'null') ||'-'|| COALESCE(OLD.trafcantidad::text,'null') ||'-'|| COALESCE(OLD.trafpedido::text,'null') ||'-'|| COALESCE(OLD.trafmotonave::text,'null');
   END IF;
   IF TG_RELNAME='transportadora' THEN 
   	 textoviejo := COALESCE(OLD.transpcodsx::text,'null') ||'-'|| COALESCE(OLD.transpnombre::text,'null') ||'-'|| COALESCE(OLD.transpdireccion::text,'null') ||'-'|| COALESCE(OLD.transptel::text,'null') ||'-'|| COALESCE(OLD.transpmail::text,'null') ||'-'|| COALESCE(OLD.transpcontacto::text,'null');
   END IF;
   IF TG_RELNAME='unidad' THEN 
   	 textoviejo := COALESCE(OLD.unicod::text,'null') ||'-'|| COALESCE(OLD.unidesc::text,'null');
   END IF;
   IF TG_RELNAME='usuario' THEN 
   	 textoviejo := COALESCE(OLD.usucodsx::text,'null') ||'-'|| COALESCE(OLD.usunombre::text,'null') ||'-'|| COALESCE(OLD.usulogin::text,'null') ||'-'|| COALESCE(OLD.usuclave::text,'null') ||'-'|| COALESCE(OLD.usumail::text,'null') ||'-'|| COALESCE(OLD.usugrupo::text,'null') ||'-'|| COALESCE(OLD.usucompania::text,'null') ||'-'|| COALESCE(OLD.usucodcliente::text,'null');
   END IF;
   IF TG_RELNAME='zona' THEN 
   	 textoviejo := COALESCE(OLD.zoncodsx::text,'null') ||'-'|| COALESCE(OLD.zonnombre::text,'null');
   END IF;
   IF TG_RELNAME='tipoproducto' THEN 
   	 textoviejo := COALESCE(OLD.tiprcodsx::text,'null') ||'-'|| COALESCE(OLD.tiprdescripcion::text,'null') ||'-'|| COALESCE(OLD.tiprcodcompania::text,'null') ||'-'|| COALESCE(OLD.tiprcodigo::text,'null');
   END IF;
ELSIF (TG_OP = 'INSERT') THEN
   IF TG_RELNAME='ajuste' THEN 
   	 textonuevo := COALESCE(NEW.ajcodsx::text,'null') ||'-'|| COALESCE(NEW.ajcodcia::text,'null') ||'-'|| COALESCE(NEW.ajingreso::text,'null') ||'-'|| COALESCE(NEW.ajentrada::text,'null') ||'-'|| COALESCE(NEW.ajfecha::text,'null') ||'-'|| COALESCE(NEW.ajsaldoant_nac::text,'null') ||'-'|| COALESCE(NEW.ajnuevosaldo_nac::text,'null') ||'-'|| COALESCE(NEW.ajsaldoant_nnac::text,'null') ||'-'|| COALESCE(NEW.ajnuevosaldo_nnac::text,'null') ||'-'|| COALESCE(NEW.ajestado::text,'null') ||'-'|| COALESCE(NEW.ajproducto::text,'null') ||'-'|| COALESCE(NEW.ajproducto_desc::text,'null') ||'-'|| COALESCE(NEW.aj_pos_nac::text,'null') ||'-'|| COALESCE(NEW.aj_neg_nac::text,'null') ||'-'|| COALESCE(NEW.aj_pos_nnac::text,'null') ||'-'|| COALESCE(NEW.aj_neg_nnac::text,'null') ||'-'|| COALESCE(NEW.ajobservacion::text,'null');
   END IF;
   IF TG_RELNAME='alistamiento' THEN 
   	 textonuevo := COALESCE(NEW.alcodsx::text,'null') ||'-'|| COALESCE(NEW.alfecha_ini::text,'null') ||'-'|| COALESCE(NEW.alfecha_fin::text,'null') ||'-'|| COALESCE(NEW.alcliente_fac::text,'null') ||'-'|| COALESCE(NEW.alfactura::text,'null') ||'-'|| COALESCE(NEW.alunid_facturar::text,'null');
   END IF;
   IF TG_RELNAME='almacenamiento' THEN 
   	 textonuevo := COALESCE(NEW.almcodsx::text,'null') ||'-'|| COALESCE(NEW.almcliente_fac::text,'null') ||'-'|| COALESCE(NEW.almfecha_ini::text,'null') ||'-'|| COALESCE(NEW.almfecha_fin::text,'null') ||'-'|| COALESCE(NEW.almelect::text,'null') ||'-'|| COALESCE(NEW.almvasos::text,'null') ||'-'|| COALESCE(NEW.almfactura::text,'null');
   END IF;
   IF TG_RELNAME='averia' THEN 
   	 textonuevo := COALESCE(NEW.avecodsx::text,'null') ||'-'|| COALESCE(NEW.avecompania::text,'null') ||'-'|| COALESCE(NEW.avefecha::text,'null') ||'-'|| COALESCE(NEW.aveingreso::text,'null') ||'-'|| COALESCE(NEW.aveentrada::text,'null') ||'-'|| COALESCE(NEW.avetipo::text,'null') ||'-'|| COALESCE(NEW.aveboddest::text,'null') ||'-'|| COALESCE(NEW.aveposdest::text,'null') ||'-'|| COALESCE(NEW.avecant_pleg_nac::text,'null') ||'-'|| COALESCE(NEW.avecant_pleg_nnac::text,'null') ||'-'|| COALESCE(NEW.avecant_prod_nac::text,'null') ||'-'|| COALESCE(NEW.avecant_prod_nnac::text,'null') ||'-'|| COALESCE(NEW.avesaldo_pleg_nac::text,'null') ||'-'|| COALESCE(NEW.avesaldo_pleg_nnac::text,'null') ||'-'|| COALESCE(NEW.avesaldo_prod_nac::text,'null') ||'-'|| COALESCE(NEW.avesaldo_prod_nnac::text,'null') ||'-'|| COALESCE(NEW.aveestado::text,'null') ||'-'|| COALESCE(NEW.aveproducto::text,'null');
   END IF;
   IF TG_RELNAME='averia_nacdet' THEN 
   	 textonuevo := COALESCE(NEW.avncodsx::text,'null') ||'-'|| COALESCE(NEW.avnaveria::text,'null') ||'-'|| COALESCE(NEW.avnnacdet_or::text,'null') ||'-'|| COALESCE(NEW.avncant::text,'null') ||'-'|| COALESCE(NEW.avnsaldo::text,'null');
   END IF;
   IF TG_RELNAME='bodega' THEN 
   	 textonuevo := COALESCE(NEW.bodcodsx::text,'null') ||'-'|| COALESCE(NEW.bodnombre::text,'null') ||'-'|| COALESCE(NEW.boddesc::text,'null') ||'-'|| COALESCE(NEW.bodurlplano::text,'null');
   END IF;
   IF TG_RELNAME='categoria' THEN 
   	 textonuevo := COALESCE(NEW.catcodsx::text,'null') ||'-'|| COALESCE(NEW.catcodpadre::text,'null') ||'-'|| COALESCE(NEW.catdescripcion::text,'null') ||'-'|| COALESCE(NEW.catcodcompania::text,'null') ||'-'|| COALESCE(NEW.catnombre::text,'null');
   END IF;
   IF TG_RELNAME='causal' THEN 
   	 textonuevo := COALESCE(NEW.caucodsx::text,'null') ||'-'|| COALESCE(NEW.caudesc::text,'null') ||'-'|| COALESCE(NEW.cauresponsable::text,'null') ||'-'|| COALESCE(NEW.causnota::text,'null') ||'-'|| COALESCE(NEW.causdocsoporte::text,'null');
   END IF;
   IF TG_RELNAME='causal_hit' THEN 
   	 textonuevo := COALESCE(NEW.cauhcodsx::text,'null') ||'-'|| COALESCE(NEW.cauhdesc::text,'null') ||'-'|| COALESCE(NEW.cauresp::text,'null');
   END IF;
   IF TG_RELNAME='causal_pedido' THEN 
   	 textonuevo := COALESCE(NEW.caupcodsx::text,'null') ||'-'|| COALESCE(NEW.cauppedido::text,'null') ||'-'|| COALESCE(NEW.caupcausal::text,'null') ||'-'|| COALESCE(NEW.caupdesccausal::text,'null') ||'-'|| COALESCE(NEW.caupfecha::text,'null');
   END IF;
   IF TG_RELNAME='ciudad' THEN 
   	 textonuevo := COALESCE(NEW.ciucodigo::text,'null') ||'-'|| COALESCE(NEW.ciunombre::text,'null') ||'-'|| COALESCE(NEW.ciudepto::text,'null');
   END IF;
   IF TG_RELNAME='cliente' THEN 
   	 textonuevo := COALESCE(NEW.clicodsx::text,'null') ||'-'|| COALESCE(NEW.clinombre::text,'null') ||'-'|| COALESCE(NEW.clinit::text,'null') ||'-'|| COALESCE(NEW.clidireccion::text,'null') ||'-'|| COALESCE(NEW.clitelefono::text,'null') ||'-'|| COALESCE(NEW.cliciudad::text,'null') ||'-'|| COALESCE(NEW.clicontacto::text,'null') ||'-'|| COALESCE(NEW.climail::text,'null') ||'-'|| COALESCE(NEW.cliobservacion::text,'null') ||'-'|| COALESCE(NEW.clicodcompania::text,'null') ||'-'|| COALESCE(NEW.clicodigo::text,'null') ||'-'|| COALESCE(NEW.clidevolucion::text,'null');
   END IF;
   IF TG_RELNAME='cliente_facturacion' THEN 
   	 textonuevo := COALESCE(NEW.clifcodsx::text,'null') ||'-'|| COALESCE(NEW.clifnombre::text,'null') ||'-'|| COALESCE(NEW.clifnit::text,'null') ||'-'|| COALESCE(NEW.clifdireccion::text,'null') ||'-'|| COALESCE(NEW.cliftelefono::text,'null') ||'-'|| COALESCE(NEW.clifcodcompania::text,'null');
   END IF;
   IF TG_RELNAME='compania' THEN 
   	 textonuevo := COALESCE(NEW.comcodsx::text,'null') ||'-'|| COALESCE(NEW.comdireccion::text,'null') ||'-'|| COALESCE(NEW.comnombre::text,'null') ||'-'|| COALESCE(NEW.comfax::text,'null') ||'-'|| COALESCE(NEW.comciudad::text,'null') ||'-'|| COALESCE(NEW.comemail::text,'null') ||'-'|| COALESCE(NEW.comgerente::text,'null') ||'-'|| COALESCE(NEW.comcontacto::text,'null') ||'-'|| COALESCE(NEW.comcargo::text,'null') ||'-'|| COALESCE(NEW.comtelefono::text,'null') ||'-'|| COALESCE(NEW.comnit::text,'null') ||'-'|| COALESCE(NEW.comtipo::text,'null') ||'-'|| COALESCE(NEW.cominventario::text,'null') ||'-'|| COALESCE(NEW.commapa::text,'null');
   END IF;
   IF TG_RELNAME='concepto' THEN 
   	 textonuevo := COALESCE(NEW.concodsx::text,'null') ||'-'|| COALESCE(NEW.condesc::text,'null');
   END IF;
   IF TG_RELNAME='concepto_cliente' THEN 
   	 textonuevo := COALESCE(NEW.conccodsx::text,'null') ||'-'|| COALESCE(NEW.conccodconcepto::text,'null') ||'-'|| COALESCE(NEW.conccodcliente::text,'null') ||'-'|| COALESCE(NEW.concdescconcepto::text,'null') ||'-'|| COALESCE(NEW.concnombrecliente::text,'null') ||'-'|| COALESCE(NEW.concvalorunit::text,'null') ||'-'|| COALESCE(NEW.concporcentaje::text,'null') ||'-'|| COALESCE(NEW.concminimo::text,'null');
   END IF;
   IF TG_RELNAME='config' THEN 
   	 textonuevo := COALESCE(NEW.cfnombre::text,'null') ||'-'|| COALESCE(NEW.cfvalor::text,'null');
   END IF;
   IF TG_RELNAME='contenedor_trafico' THEN 
   	 textonuevo := COALESCE(NEW.ctrafcodsx::text,'null') ||'-'|| COALESCE(NEW.ctrafnumtrafico::text,'null') ||'-'|| COALESCE(NEW.ctraftamano::text,'null') ||'-'|| COALESCE(NEW.ctrafnumero::text,'null');
   END IF;
   IF TG_RELNAME='departamento' THEN 
   	 textonuevo := COALESCE(NEW.depcodigo::text,'null') ||'-'|| COALESCE(NEW.depnombre::text,'null') ||'-'|| COALESCE(NEW.depzona::text,'null');
   END IF;
   IF TG_RELNAME='despacho' THEN 
   	 textonuevo := COALESCE(NEW.despcodsx::text,'null') ||'-'|| COALESCE(NEW.despempresa::text,'null') ||'-'|| COALESCE(NEW.despfecha::text,'null') ||'-'|| COALESCE(NEW.despobservacion::text,'null') ||'-'|| COALESCE(NEW.despplaca::text,'null') ||'-'|| COALESCE(NEW.despnombrecond::text,'null') ||'-'|| COALESCE(NEW.despcedcond::text,'null') ||'-'|| COALESCE(NEW.desptransportadora::text,'null') ||'-'|| COALESCE(NEW.despestado::text,'null') ||'-'|| COALESCE(NEW.despbultos::text,'null') ||'-'|| COALESCE(NEW.despbultosarmados::text,'null') ||'-'|| COALESCE(NEW.desppesoneto::text,'null') ||'-'|| COALESCE(NEW.desppesobruto::text,'null') ||'-'|| COALESCE(NEW.despfob::text,'null') ||'-'|| COALESCE(NEW.despconsec::text,'null') ||'-'|| COALESCE(NEW.despconseczfp::text,'null');
   END IF;
   IF TG_RELNAME='despacho_pedido' THEN 
   	 textonuevo := COALESCE(NEW.despedcodsx::text,'null') ||'-'|| COALESCE(NEW.despeddespacho::text,'null') ||'-'|| COALESCE(NEW.despedpedido::text,'null') ||'-'|| COALESCE(NEW.despedbultos::text,'null') ||'-'|| COALESCE(NEW.despedbultosarmados::text,'null') ||'-'|| COALESCE(NEW.despedpesoneto::text,'null') ||'-'|| COALESCE(NEW.despedpesobruto::text,'null') ||'-'|| COALESCE(NEW.despedvalor::text,'null');
   END IF;
   IF TG_RELNAME='empleado' THEN 
   	 textonuevo := COALESCE(NEW.empcodsx::text,'null') ||'-'|| COALESCE(NEW.empnombre::text,'null') ||'-'|| COALESCE(NEW.empcedula::text,'null') ||'-'|| COALESCE(NEW.empmail::text,'null') ||'-'|| COALESCE(NEW.empcargo::text,'null');
   END IF;
   IF TG_RELNAME='empresa' THEN 
   	 textonuevo := COALESCE(NEW.empcodsx::text,'null') ||'-'|| COALESCE(NEW.empnombre::text,'null') ||'-'|| COALESCE(NEW.empdireccion::text,'null') ||'-'|| COALESCE(NEW.emptelefono::text,'null') ||'-'|| COALESCE(NEW.empnit::text,'null') ||'-'|| COALESCE(NEW.empdescripcion::text,'null') ||'-'|| COALESCE(NEW.empmail::text,'null') ||'-'|| COALESCE(NEW.empslogan::text,'null');
   END IF;
   IF TG_RELNAME='entrada' THEN 
   	 textonuevo := COALESCE(NEW.entcodsx::text,'null') ||'-'|| COALESCE(NEW.entcodingreso::text,'null') ||'-'|| COALESCE(NEW.entcodproducto::text,'null') ||'-'|| COALESCE(NEW.entbodega::text,'null') ||'-'|| COALESCE(NEW.entposicion::text,'null') ||'-'|| COALESCE(NEW.entcantidad::text,'null') ||'-'|| COALESCE(NEW.entpesoneto::text,'null') ||'-'|| COALESCE(NEW.entpesonetototal::text,'null') ||'-'|| COALESCE(NEW.entpesobruto::text,'null') ||'-'|| COALESCE(NEW.entpesobrutototal::text,'null') ||'-'|| COALESCE(NEW.entsaldopesoneto::text,'null') ||'-'|| COALESCE(NEW.entsaldopesobruto::text,'null') ||'-'|| COALESCE(NEW.entsaldonac::text,'null') ||'-'|| COALESCE(NEW.entsaldosinnac::text,'null') ||'-'|| COALESCE(NEW.entvalor::text,'null') ||'-'|| COALESCE(NEW.entvalortotal::text,'null') ||'-'|| COALESCE(NEW.entfecha::text,'null') ||'-'|| COALESCE(NEW.entsaldonacf::text,'null') ||'-'|| COALESCE(NEW.entsaldosinnacf::text,'null') ||'-'|| COALESCE(NEW.entunidad::text,'null');
   END IF;
      IF TG_RELNAME='factura' THEN 
   	 textonuevo := COALESCE(NEW.faccodsx::text,'null') ||'-'|| COALESCE(NEW.faccodcliente::text,'null') ||'-'|| COALESCE(NEW.facdesccliente::text,'null') ||'-'|| COALESCE(NEW.facfechasistema::text,'null') ||'-'|| COALESCE(NEW.facfechafactura::text,'null') ||'-'|| COALESCE(NEW.facfechavencimiento::text,'null') ||'-'|| COALESCE(NEW.facnit::text,'null') ||'-'|| COALESCE(NEW.facdireccion::text,'null') ||'-'|| COALESCE(NEW.facobservaciones::text,'null') ||'-'|| COALESCE(NEW.facconcepto::text,'null') ||'-'|| COALESCE(NEW.facestado::text,'null') ||'-'|| COALESCE(NEW.facsubtotal::text,'null') ||'-'|| COALESCE(NEW.faciva::text,'null') ||'-'|| COALESCE(NEW.facretefuente::text,'null') ||'-'|| COALESCE(NEW.factotal::text,'null') ||'-'|| COALESCE(NEW.factextototal::text,'null') ||'-'|| COALESCE(NEW.factrm::text,'null') ||'-'|| COALESCE(NEW.fac_tipo::text,'null') ||'-'|| COALESCE(NEW.facvaloriva::text,'null') ||'-'|| COALESCE(NEW.facvalorretef::text,'null') ||'-'|| COALESCE(NEW.facmoneda::text,'null');
   END IF;
   IF TG_RELNAME='factura_detalle' THEN 
   	 textonuevo := COALESCE(NEW.facdcodsx::text,'null') ||'-'|| COALESCE(NEW.facdfactura::text,'null') ||'-'|| COALESCE(NEW.facdconceptodesc::text,'null') ||'-'|| COALESCE(NEW.facdtipo::text,'null') ||'-'|| COALESCE(NEW.facdvalorunit::text,'null') ||'-'|| COALESCE(NEW.facdvalortotal::text,'null') ||'-'|| COALESCE(NEW.facdcantidad::text,'null') ||'-'|| COALESCE(NEW.facdobservacion::text,'null') ||'-'|| COALESCE(NEW.facdporcentaje::text,'null') ||'-'|| COALESCE(NEW.facdvalorcomicion::text,'null') ||'-'|| COALESCE(NEW.facdminimo::text,'null');
   END IF;
   IF TG_RELNAME='factura_trafico' THEN 
   	 textonuevo := COALESCE(NEW.ftrafcodsx::text,'null') ||'-'|| COALESCE(NEW.ftrafnumfactura::text,'null') ||'-'|| COALESCE(NEW.ftrafnumtrafico::text,'null');
   END IF;
   IF TG_RELNAME='faq' THEN 
   	 textonuevo := COALESCE(NEW.faqcodsx::text,'null') ||'-'|| COALESCE(NEW.faqpregunta::text,'null') ||'-'|| COALESCE(NEW.faqrespcorta::text,'null') ||'-'|| COALESCE(NEW.faqresplarga::text,'null');
   END IF;
   IF TG_RELNAME='flete' THEN 
   	 textonuevo := COALESCE(NEW.flecodsx::text,'null') ||'-'|| COALESCE(NEW.fleciudad::text,'null') ||'-'|| COALESCE(NEW.fletransportadora::text,'null') ||'-'|| COALESCE(NEW.flevalor::text,'null') ||'-'|| COALESCE(NEW.fledias::text,'null');
   END IF;
   IF TG_RELNAME='grupo' THEN 
   	 textonuevo := COALESCE(NEW.gcodsx::text,'null') ||'-'|| COALESCE(NEW.gnombre::text,'null');
   END IF;
   IF TG_RELNAME='ingreso' THEN 
   	 textonuevo := COALESCE(NEW.ingcodsx::text,'null') ||'-'|| COALESCE(NEW.ingcodcia::text,'null') ||'-'|| COALESCE(NEW.ingfecha::text,'null') ||'-'|| COALESCE(NEW.ingtipo::text,'null') ||'-'|| COALESCE(NEW.ingtrafico::text,'null') ||'-'|| COALESCE(NEW.ingobservacion::text,'null') ||'-'|| COALESCE(NEW.ingestado::text,'null') ||'-'|| COALESCE(NEW.ingcausal::text,'null') ||'-'|| COALESCE(NEW.ingcli_devolucion::text,'null') ||'-'|| COALESCE(NEW.ingpesoneto::text,'null') ||'-'|| COALESCE(NEW.ingpesobruto::text,'null') ||'-'|| COALESCE(NEW.ingfob::text,'null') ||'-'|| COALESCE(NEW.ingcantidad::text,'null') ||'-'|| COALESCE(NEW.ingciudad_dev::text,'null') ||'-'|| COALESCE(NEW.ingconsec::text,'null') ||'-'|| COALESCE(NEW.ingconseczfp::text,'null') ||'-'|| COALESCE(NEW.ingplanilla::text,'null');
   END IF;
   IF TG_RELNAME='nacionalizacion' THEN 
   	 textonuevo := COALESCE(NEW.naccodsx::text,'null') ||'-'|| COALESCE(NEW.nacempresa::text,'null') ||'-'|| COALESCE(NEW.nacfecha::text,'null') ||'-'|| COALESCE(NEW.nacingreso::text,'null') ||'-'|| COALESCE(NEW.nacestado::text,'null') ||'-'|| COALESCE(NEW.nacdeclaracion::text,'null') ||'-'|| COALESCE(NEW.nacfechadeclaracion::text,'null') ||'-'|| COALESCE(NEW.nacfechaingresobodega::text,'null') ||'-'|| COALESCE(NEW.nacpaginainicial::text,'null') ||'-'|| COALESCE(NEW.nacpaginafinal::text,'null') ||'-'|| COALESCE(NEW.nacdosia::text,'null') ||'-'|| COALESCE(NEW.nacobservaciones::text,'null') ||'-'|| COALESCE(NEW.nactipo::text,'null') ||'-'|| COALESCE(NEW.nacpesoneto::text,'null') ||'-'|| COALESCE(NEW.nacpesobruto::text,'null') ||'-'|| COALESCE(NEW.nacfob::text,'null') ||'-'|| COALESCE(NEW.nacconsec::text,'null') ||'-'|| COALESCE(NEW.nacconseczfp::text,'null');
   END IF;
   IF TG_RELNAME='nacionalizacion_detalle' THEN 
   	 textonuevo := COALESCE(NEW.nadcodsx::text,'null') ||'-'|| COALESCE(NEW.nadcodnac::text,'null') ||'-'|| COALESCE(NEW.nadentrada::text,'null') ||'-'|| COALESCE(NEW.nadcantidad::text,'null') ||'-'|| COALESCE(NEW.nadsaldo::text,'null') ||'-'|| COALESCE(NEW.nadpesoneto::text,'null') ||'-'|| COALESCE(NEW.nadpesonetototal::text,'null') ||'-'|| COALESCE(NEW.nadpesobruto::text,'null') ||'-'|| COALESCE(NEW.nadpesobrutototal::text,'null') ||'-'|| COALESCE(NEW.nadfob::text,'null') ||'-'|| COALESCE(NEW.nadfobtotal::text,'null');
   END IF;
   IF TG_RELNAME='novedad_pedido' THEN 
   	 textonuevo := COALESCE(NEW.novcodsx::text,'null') ||'-'|| COALESCE(NEW.novpedido::text,'null') ||'-'|| COALESCE(NEW.novfecha::text,'null') ||'-'|| COALESCE(NEW.novdesc::text,'null') ||'-'|| COALESCE(NEW.novusuario::text,'null');
   END IF;
   IF TG_RELNAME='packing' THEN 
   	 textonuevo := COALESCE(NEW.packcodsx::text,'null') ||'-'|| COALESCE(NEW.packempresa::text,'null') ||'-'|| COALESCE(NEW.packfecha::text,'null') ||'-'|| COALESCE(NEW.packobservaciones::text,'null') ||'-'|| COALESCE(NEW.packestado::text,'null') ||'-'|| COALESCE(NEW.packpesoneto::text,'null') ||'-'|| COALESCE(NEW.packpesobruto::text,'null');
   END IF;
   IF TG_RELNAME='packing_detalle' THEN 
   	 textonuevo := COALESCE(NEW.packdcodsx::text,'null') ||'-'|| COALESCE(NEW.packdpacking::text,'null') ||'-'|| COALESCE(NEW.packdproducto::text,'null') ||'-'|| COALESCE(NEW.packdpesoneto::text,'null') ||'-'|| COALESCE(NEW.packdpesobruto::text,'null') ||'-'|| COALESCE(NEW.packdcantidad::text,'null');
   END IF;
   IF TG_RELNAME='packing_detalle_posicion' THEN 
   	 textonuevo := COALESCE(NEW.packpcodsx::text,'null') ||'-'|| COALESCE(NEW.packppackingdet::text,'null') ||'-'|| COALESCE(NEW.packpbodega::text,'null') ||'-'|| COALESCE(NEW.packpposicion::text,'null') ||'-'|| COALESCE(NEW.packpcantidad::text,'null') ||'-'|| COALESCE(NEW.packpentrada::text,'null') ||'-'|| COALESCE(NEW.packpnacdetalle::text,'null') ||'-'|| COALESCE(NEW.packpsaldo::text,'null') ||'-'|| COALESCE(NEW.packppesoneto::text,'null') ||'-'|| COALESCE(NEW.packppesobruto::text,'null') ||'-'|| COALESCE(NEW.packppesonetototal::text,'null') ||'-'|| COALESCE(NEW.packppesobrutototal::text,'null');
   END IF;
   IF TG_RELNAME='pedido' THEN 
   	 textonuevo := COALESCE(NEW.pedcodsx::text,'null') ||'-'|| COALESCE(NEW.pedcompania::text,'null') ||'-'|| COALESCE(NEW.pednumpedido::text,'null') ||'-'|| COALESCE(NEW.pedordencompra::text,'null') ||'-'|| COALESCE(NEW.pedguia::text,'null') ||'-'|| COALESCE(NEW.pedfechasistema::text,'null') ||'-'|| COALESCE(NEW.pedfecha::text,'null') ||'-'|| COALESCE(NEW.pedfechavenc::text,'null') ||'-'|| COALESCE(NEW.pedfechacita::text,'null') ||'-'|| COALESCE(NEW.pedhoracita::text,'null') ||'-'|| COALESCE(NEW.pedcliente::text,'null') ||'-'|| COALESCE(NEW.pedsucursal::text,'null') ||'-'|| COALESCE(NEW.peddireccion::text,'null') ||'-'|| COALESCE(NEW.pedciudad::text,'null') ||'-'|| COALESCE(NEW.peddepartamento::text,'null') ||'-'|| COALESCE(NEW.pedobservaciones::text,'null') ||'-'|| COALESCE(NEW.pedfactura::text,'null') ||'-'|| COALESCE(NEW.pedestado::text,'null') ||'-'|| COALESCE(NEW.pedsubtotal::text,'null') ||'-'|| COALESCE(NEW.pediva::text,'null') ||'-'|| COALESCE(NEW.peddescuento::text,'null') ||'-'|| COALESCE(NEW.pedtotal::text,'null') ||'-'|| COALESCE(NEW.pedtipo::text,'null') ||'-'|| COALESCE(NEW.pedpicking::text,'null') ||'-'|| COALESCE(NEW.pedpesoneto::text,'null') ||'-'|| COALESCE(NEW.pedpesobruto::text,'null') ||'-'|| COALESCE(NEW.pedhora::text,'null') ||'-'|| COALESCE(NEW.pedzona::text,'null') ||'-'|| COALESCE(NEW.pedcausal_hit::text,'null') ||'-'|| COALESCE(NEW.pedporc_iva::text,'null');
   END IF;
   IF TG_RELNAME='permiso' THEN 
   	 textonuevo := COALESCE(NEW.percodsx::text,'null') ||'-'|| COALESCE(NEW.pergrupo::text,'null') ||'-'|| COALESCE(NEW.perapp::text,'null') ||'-'|| COALESCE(NEW.permodulo::text,'null') ||'-'|| COALESCE(NEW.peracceso::text,'null');
   END IF;
   IF TG_RELNAME='picking' THEN 
   	 textonuevo := COALESCE(NEW.pickcodsx::text,'null') ||'-'|| COALESCE(NEW.pickfecha::text,'null') ||'-'|| COALESCE(NEW.pickempresa::text,'null') ||'-'|| COALESCE(NEW.pickcodpacking::text,'null') ||'-'|| COALESCE(NEW.pickobservaciones::text,'null') ||'-'|| COALESCE(NEW.pickestado::text,'null') ||'-'|| COALESCE(NEW.pickpesoneto::text,'null') ||'-'|| COALESCE(NEW.pickpesobruto::text,'null') ||'-'|| COALESCE(NEW.pickvalor::text,'null') ||'-'|| COALESCE(NEW.pickpedido::text,'null') ||'-'|| COALESCE(NEW.picknumpedido::text,'null');
   END IF;
   IF TG_RELNAME='picking_detalle' THEN 
   	 textonuevo := COALESCE(NEW.pickdcodsx::text,'null') ||'-'|| COALESCE(NEW.pickdcodpicking::text,'null') ||'-'|| COALESCE(NEW.pickdproducto::text,'null') ||'-'|| COALESCE(NEW.pickdvalorunit::text,'null') ||'-'|| COALESCE(NEW.pickdpesoneto::text,'null') ||'-'|| COALESCE(NEW.pickdpesobruto::text,'null') ||'-'|| COALESCE(NEW.pickdvalortotal::text,'null') ||'-'|| COALESCE(NEW.pickdcantidad::text,'null');
   END IF;
   IF TG_RELNAME='picking_detalle_packing' THEN 
   	 textonuevo := COALESCE(NEW.pickpcodsx::text,'null') ||'-'|| COALESCE(NEW.pickppickingdetalle::text,'null') ||'-'|| COALESCE(NEW.pickppackingdet::text,'null') ||'-'|| COALESCE(NEW.pickpcantidad::text,'null') ||'-'|| COALESCE(NEW.pickppesoneto::text,'null') ||'-'|| COALESCE(NEW.pickppesobruto::text,'null') ||'-'|| COALESCE(NEW.pickppesonetototal::text,'null') ||'-'|| COALESCE(NEW.pickppesobrutototal::text,'null');
   END IF;
   IF TG_RELNAME='producto' THEN 
   	 textonuevo := COALESCE(NEW.procodsx::text,'null') ||'-'|| COALESCE(NEW.procodigocia::text,'null') ||'-'|| COALESCE(NEW.prodescripcion::text,'null') ||'-'|| COALESCE(NEW.procategoria::text,'null') ||'-'|| COALESCE(NEW.promodelo::text,'null') ||'-'|| COALESCE(NEW.prosubpartida::text,'null') ||'-'|| COALESCE(NEW.proean::text,'null') ||'-'|| COALESCE(NEW.procodbarra::text,'null') ||'-'|| COALESCE(NEW.progarantia::text,'null') ||'-'|| COALESCE(NEW.prokiloreal::text,'null') ||'-'|| COALESCE(NEW.provolumen::text,'null') ||'-'|| COALESCE(NEW.prokilovolumen::text,'null') ||'-'|| COALESCE(NEW.prouniempaque::text,'null') ||'-'|| COALESCE(NEW.prokvuniempaque::text,'null') ||'-'|| COALESCE(NEW.provoluniempaque::text,'null') ||'-'|| COALESCE(NEW.prounimasterpac::text,'null') ||'-'|| COALESCE(NEW.prokvmasterpack::text,'null') ||'-'|| COALESCE(NEW.propesobmp::text,'null') ||'-'|| COALESCE(NEW.provolmasterpac::text,'null') ||'-'|| COALESCE(NEW.procodigobarra::text,'null') ||'-'|| COALESCE(NEW.proestado::text,'null') ||'-'|| COALESCE(NEW.proobservacion::text,'null') ||'-'|| COALESCE(NEW.protipoproducto::text,'null');
   END IF;
   IF TG_RELNAME='producto_cliente' THEN 
   	 textonuevo := COALESCE(NEW.proccodsx::text,'null') ||'-'|| COALESCE(NEW.proccliente::text,'null') ||'-'|| COALESCE(NEW.procproducto::text,'null') ||'-'|| COALESCE(NEW.procean::text,'null') ||'-'|| COALESCE(NEW.proctag::text,'null') ||'-'|| COALESCE(NEW.procodbarra::text,'null') ||'-'|| COALESCE(NEW.procnumcodigobarra::text,'null') ||'-'|| COALESCE(NEW.procgarantia::text,'null');
   END IF;
   IF TG_RELNAME='proforma' THEN 
   	 textonuevo := COALESCE(NEW.profcodsx::text,'null') ||'-'|| COALESCE(NEW.profnumfactura::text,'null') ||'-'|| COALESCE(NEW.profost::text,'null') ||'-'|| COALESCE(NEW.profpedido::text,'null') ||'-'|| COALESCE(NEW.profnit::text,'null') ||'-'|| COALESCE(NEW.porforigen::text,'null') ||'-'|| COALESCE(NEW.profmotonave::text,'null') ||'-'|| COALESCE(NEW.profbl::text,'null') ||'-'|| COALESCE(NEW.proftasacambio::text,'null') ||'-'|| COALESCE(NEW.profbultos::text,'null') ||'-'|| COALESCE(NEW.profcont20::text,'null') ||'-'|| COALESCE(NEW.profcont40::text,'null') ||'-'|| COALESCE(NEW.profcont40hc::text,'null') ||'-'|| COALESCE(NEW.profpeso::text,'null') ||'-'|| COALESCE(NEW.proffob::text,'null') ||'-'|| COALESCE(NEW.profflete::text,'null') ||'-'|| COALESCE(NEW.profgastosorigen::text,'null') ||'-'|| COALESCE(NEW.profrecargocomb::text,'null') ||'-'|| COALESCE(NEW.profgastosdestino::text,'null') ||'-'|| COALESCE(NEW.profgastosnaviera::text,'null') ||'-'|| COALESCE(NEW.profcollectionfee::text,'null') ||'-'|| COALESCE(NEW.profradicacionbl::text,'null') ||'-'|| COALESCE(NEW.profmanejo::text,'null') ||'-'|| COALESCE(NEW.profdropoff::text,'null') ||'-'|| COALESCE(NEW.profseguro::text,'null') ||'-'|| COALESCE(NEW.profcifdolares::text,'null') ||'-'|| COALESCE(NEW.profcifpesos::text,'null') ||'-'|| COALESCE(NEW.proftotal::text,'null') ||'-'|| COALESCE(NEW.proffecha::text,'null') ||'-'|| COALESCE(NEW.profcliente::text,'null') ||'-'|| COALESCE(NEW.profservotm::text,'null') ||'-'|| COALESCE(NEW.profanticipo::text,'null') ||'-'|| COALESCE(NEW.proffurgon::text,'null') ||'-'|| COALESCE(NEW.profmanejosli::text,'null');
   END IF;
   IF TG_RELNAME='referencia_despacho' THEN 
   	 textonuevo := COALESCE(NEW.refdcodsx::text,'null') ||'-'|| COALESCE(NEW.refddespacho_pedido::text,'null') ||'-'|| COALESCE(NEW.refdproducto::text,'null') ||'-'|| COALESCE(NEW.refdcant::text,'null') ||'-'|| COALESCE(NEW.refdvalor::text,'null') ||'-'|| COALESCE(NEW.refdpesoneto::text,'null') ||'-'|| COALESCE(NEW.refdpesobruto::text,'null');
   END IF;
   IF TG_RELNAME='referencia_despacho_pedido' THEN 
   	 textonuevo := COALESCE(NEW.refdpcodsx::text,'null') ||'-'|| COALESCE(NEW.refdpcodrefd::text,'null') ||'-'|| COALESCE(NEW.refdcodrefp::text,'null') ||'-'|| COALESCE(NEW.refdcant::text,'null') ||'-'|| COALESCE(NEW.refdvalorunit::text,'null') ||'-'|| COALESCE(NEW.refdvalortotal::text,'null') ||'-'|| COALESCE(NEW.refdpesoneto::text,'null') ||'-'|| COALESCE(NEW.refdpesobruto::text,'null') ||'-'|| COALESCE(NEW.refdpesonetototal::text,'null') ||'-'|| COALESCE(NEW.refdpesobrutototal::text,'null');
   END IF;
   IF TG_RELNAME='referencia_pedido' THEN 
   	 textonuevo := COALESCE(NEW.refpcodsx::text,'null') ||'-'|| COALESCE(NEW.refpnumpedido::text,'null') ||'-'|| COALESCE(NEW.refpproducto::text,'null') ||'-'|| COALESCE(NEW.refpbodega::text,'null') ||'-'|| COALESCE(NEW.refpposicion::text,'null') ||'-'|| COALESCE(NEW.refpcantidad::text,'null') ||'-'|| COALESCE(NEW.refpvalorunit::text,'null') ||'-'|| COALESCE(NEW.refpvalortotal::text,'null') ||'-'|| COALESCE(NEW.refpentrada::text,'null') ||'-'|| COALESCE(NEW.refpnacdetalle::text,'null') ||'-'|| COALESCE(NEW.refpsaldo::text,'null') ||'-'|| COALESCE(NEW.refppesoneto::text,'null') ||'-'|| COALESCE(NEW.refppesobruto::text,'null') ||'-'|| COALESCE(NEW.refppesonetototal::text,'null') ||'-'|| COALESCE(NEW.refppesobrutototal::text,'null');
   END IF;
   IF TG_RELNAME='referencia_trafico' THEN 
   	 textonuevo := COALESCE(NEW.reftcodsx::text,'null') ||'-'|| COALESCE(NEW.reftnumfacturatrafico::text,'null') ||'-'|| COALESCE(NEW.reftproducto::text,'null') ||'-'|| COALESCE(NEW.reftcantidad::text,'null') ||'-'|| COALESCE(NEW.reftpesoneto::text,'null') ||'-'|| COALESCE(NEW.reftpesobruto::text,'null') ||'-'|| COALESCE(NEW.reftfobunit::text,'null') ||'-'|| COALESCE(NEW.reftfobtotal::text,'null') ||'-'|| COALESCE(NEW.reftcifunit::text,'null') ||'-'|| COALESCE(NEW.reftciftotal::text,'null') ||'-'|| COALESCE(NEW.reftpesonetototal::text,'null') ||'-'|| COALESCE(NEW.reftpesobrutototal::text,'null') ||'-'|| COALESCE(NEW.reftmpacks::text,'null');
   END IF;
   IF TG_RELNAME='reparacion' THEN 
   	 textonuevo := COALESCE(NEW.repcodsx::text,'null') ||'-'|| COALESCE(NEW.repcodcia::text,'null') ||'-'|| COALESCE(NEW.repfecha::text,'null') ||'-'|| COALESCE(NEW.repsaldo::text,'null') ||'-'|| COALESCE(NEW.repdestino::text,'null') ||'-'|| COALESCE(NEW.repestado::text,'null') ||'-'|| COALESCE(NEW.repobservacion::text,'null') ||'-'|| COALESCE(NEW.reppedido::text,'null');
   END IF;
   IF TG_RELNAME='reparacion_detalle' THEN 
   	 textonuevo := COALESCE(NEW.repdcodsx::text,'null') ||'-'|| COALESCE(NEW.repdreparacion::text,'null') ||'-'|| COALESCE(NEW.repdproducto::text,'null') ||'-'|| COALESCE(NEW.repdaveria::text,'null') ||'-'|| COALESCE(NEW.repdcant_pleg::text,'null') ||'-'|| COALESCE(NEW.repdcant_prod::text,'null') ||'-'|| COALESCE(NEW.repdbodega::text,'null') ||'-'|| COALESCE(NEW.repdposicion::text,'null') ||'-'|| COALESCE(NEW.repdtiposaldo::text,'null') ||'-'|| COALESCE(NEW.repdbodega_dest::text,'null') ||'-'|| COALESCE(NEW.repdposicion_dest::text,'null');
   END IF;
   IF TG_RELNAME='reparacion_nacdet' THEN 
   	 textonuevo := COALESCE(NEW.repndcodsx::text,'null') ||'-'|| COALESCE(NEW.repndrepdetalle::text,'null') ||'-'|| COALESCE(NEW.repndnacdet::text,'null') ||'-'|| COALESCE(NEW.repndcant::text,'null') ||'-'|| COALESCE(NEW.repndaverianacdet::text,'null') ||'-'|| COALESCE(NEW.repndnacdet_rep::text,'null');
   END IF;
   IF TG_RELNAME='reubic_nacdetalle' THEN 
   	 textonuevo := COALESCE(NEW.rencodsx::text,'null') ||'-'|| COALESCE(NEW.renreubicacion::text,'null') ||'-'|| COALESCE(NEW.renacdetalle_or::text,'null') ||'-'|| COALESCE(NEW.renacdetalle_fin::text,'null') ||'-'|| COALESCE(NEW.rencantidad::text,'null');
   END IF;
   IF TG_RELNAME='reubicacion' THEN 
   	 textonuevo := COALESCE(NEW.recodsx::text,'null') ||'-'|| COALESCE(NEW.recodcia::text,'null') ||'-'|| COALESCE(NEW.reingreso::text,'null') ||'-'|| COALESCE(NEW.retipo::text,'null') ||'-'|| COALESCE(NEW.reentradaor::text,'null') ||'-'|| COALESCE(NEW.reentradafin::text,'null') ||'-'|| COALESCE(NEW.recantidad::text,'null') ||'-'|| COALESCE(NEW.reestado::text,'null') ||'-'|| COALESCE(NEW.refecha::text,'null') ||'-'|| COALESCE(NEW.retipomov::text,'null');
   END IF;
   IF TG_RELNAME='sucursal' THEN 
   	 textonuevo := COALESCE(NEW.succodsx::text,'null') ||'-'|| COALESCE(NEW.succodcliente::text,'null') ||'-'|| COALESCE(NEW.sucnit::text,'null') ||'-'|| COALESCE(NEW.sucnombre::text,'null') ||'-'|| COALESCE(NEW.succiudad::text,'null') ||'-'|| COALESCE(NEW.sucdepartamento::text,'null') ||'-'|| COALESCE(NEW.succontacto::text,'null') ||'-'|| COALESCE(NEW.succargo::text,'null') ||'-'|| COALESCE(NEW.sucemail::text,'null') ||'-'|| COALESCE(NEW.sucdireccion::text,'null') ||'-'|| COALESCE(NEW.suctelefono::text,'null') ||'-'|| COALESCE(NEW.succodigo::text,'null');
   END IF;
   IF TG_RELNAME='trafico' THEN 
   	 textonuevo := COALESCE(NEW.trafcodsx::text,'null') ||'-'|| COALESCE(NEW.trafcompania::text,'null') ||'-'|| COALESCE(NEW.traffechacreacion::text,'null') ||'-'|| COALESCE(NEW.trafdocumento::text,'null') ||'-'|| COALESCE(NEW.trafembarque::text,'null') ||'-'|| COALESCE(NEW.traftransportadora::text,'null') ||'-'|| COALESCE(NEW.trafprocedencia::text,'null') ||'-'|| COALESCE(NEW.traffechaarribopuerto::text,'null') ||'-'|| COALESCE(NEW.traffechapresentdta::text,'null') ||'-'|| COALESCE(NEW.traffechaaprobaciondta::text,'null') ||'-'|| COALESCE(NEW.traffob::text,'null') ||'-'|| COALESCE(NEW.trafcif::text,'null') ||'-'|| COALESCE(NEW.trafconsec::text,'null') ||'-'|| COALESCE(NEW.trafnumerofmm::text,'null') ||'-'|| COALESCE(NEW.traftrm::text,'null') ||'-'|| COALESCE(NEW.trafnumdta::text,'null') ||'-'|| COALESCE(NEW.trafnumsobordo::text,'null') ||'-'|| COALESCE(NEW.traffechadescargue::text,'null') ||'-'|| COALESCE(NEW.traffechalevante::text,'null') ||'-'|| COALESCE(NEW.traffechaingresozf::text,'null') ||'-'|| COALESCE(NEW.trafentregadocusia::text,'null') ||'-'|| COALESCE(NEW.trafobservaciones::text,'null') ||'-'|| COALESCE(NEW.trafpesobruto::text,'null') ||'-'|| COALESCE(NEW.trafusuario::text,'null') ||'-'|| COALESCE(NEW.traffechasobordo::text,'null') ||'-'|| COALESCE(NEW.traforigen::text,'null') ||'-'|| COALESCE(NEW.trafpesoneto::text,'null') ||'-'|| COALESCE(NEW.traffletesseguro::text,'null') ||'-'|| COALESCE(NEW.trafestado::text,'null') ||'-'|| COALESCE(NEW.trafcantidad::text,'null') ||'-'|| COALESCE(NEW.trafpedido::text,'null') ||'-'|| COALESCE(NEW.trafmotonave::text,'null');
   END IF;
   IF TG_RELNAME='transportadora' THEN 
   	 textonuevo := COALESCE(NEW.transpcodsx::text,'null') ||'-'|| COALESCE(NEW.transpnombre::text,'null') ||'-'|| COALESCE(NEW.transpdireccion::text,'null') ||'-'|| COALESCE(NEW.transptel::text,'null') ||'-'|| COALESCE(NEW.transpmail::text,'null') ||'-'|| COALESCE(NEW.transpcontacto::text,'null');
   END IF;
   IF TG_RELNAME='unidad' THEN 
   	 textonuevo := COALESCE(NEW.unicod::text,'null') ||'-'|| COALESCE(NEW.unidesc::text,'null');
   END IF;
   IF TG_RELNAME='usuario' THEN 
   	 textonuevo := COALESCE(NEW.usucodsx::text,'null') ||'-'|| COALESCE(NEW.usunombre::text,'null') ||'-'|| COALESCE(NEW.usulogin::text,'null') ||'-'|| COALESCE(NEW.usuclave::text,'null') ||'-'|| COALESCE(NEW.usumail::text,'null') ||'-'|| COALESCE(NEW.usugrupo::text,'null') ||'-'|| COALESCE(NEW.usucompania::text,'null') ||'-'|| COALESCE(NEW.usucodcliente::text,'null');
   END IF;
   IF TG_RELNAME='zona' THEN 
   	 textonuevo := COALESCE(NEW.zoncodsx::text,'null') ||'-'|| COALESCE(NEW.zonnombre::text,'null');
   END IF;
   IF TG_RELNAME='tipoproducto' THEN 
   	 textonuevo := COALESCE(NEW.tiprcodsx::text,'null') ||'-'|| COALESCE(NEW.tiprdescripcion::text,'null') ||'-'|| COALESCE(NEW.tiprcodcompania::text,'null') ||'-'|| COALESCE(NEW.tiprcodigo::text,'null');
   END IF;
ELSIF (TG_OP = 'UPDATE') THEN
   IF TG_RELNAME='ajuste' THEN 
   	 textoviejo := COALESCE(OLD.ajcodsx::text,'null') ||'-'|| COALESCE(OLD.ajcodcia::text,'null') ||'-'|| COALESCE(OLD.ajingreso::text,'null') ||'-'|| COALESCE(OLD.ajentrada::text,'null') ||'-'|| COALESCE(OLD.ajfecha::text,'null') ||'-'|| COALESCE(OLD.ajsaldoant_nac::text,'null') ||'-'|| COALESCE(OLD.ajnuevosaldo_nac::text,'null') ||'-'|| COALESCE(OLD.ajsaldoant_nnac::text,'null') ||'-'|| COALESCE(OLD.ajnuevosaldo_nnac::text,'null') ||'-'|| COALESCE(OLD.ajestado::text,'null') ||'-'|| COALESCE(OLD.ajproducto::text,'null') ||'-'|| COALESCE(OLD.ajproducto_desc::text,'null') ||'-'|| COALESCE(OLD.aj_pos_nac::text,'null') ||'-'|| COALESCE(OLD.aj_neg_nac::text,'null') ||'-'|| COALESCE(OLD.aj_pos_nnac::text,'null') ||'-'|| COALESCE(OLD.aj_neg_nnac::text,'null') ||'-'|| COALESCE(OLD.ajobservacion::text,'null');
   	 textonuevo := COALESCE(NEW.ajcodsx::text,'null') ||'-'|| COALESCE(NEW.ajcodcia::text,'null') ||'-'|| COALESCE(NEW.ajingreso::text,'null') ||'-'|| COALESCE(NEW.ajentrada::text,'null') ||'-'|| COALESCE(NEW.ajfecha::text,'null') ||'-'|| COALESCE(NEW.ajsaldoant_nac::text,'null') ||'-'|| COALESCE(NEW.ajnuevosaldo_nac::text,'null') ||'-'|| COALESCE(NEW.ajsaldoant_nnac::text,'null') ||'-'|| COALESCE(NEW.ajnuevosaldo_nnac::text,'null') ||'-'|| COALESCE(NEW.ajestado::text,'null') ||'-'|| COALESCE(NEW.ajproducto::text,'null') ||'-'|| COALESCE(NEW.ajproducto_desc::text,'null') ||'-'|| COALESCE(NEW.aj_pos_nac::text,'null') ||'-'|| COALESCE(NEW.aj_neg_nac::text,'null') ||'-'|| COALESCE(NEW.aj_pos_nnac::text,'null') ||'-'|| COALESCE(NEW.aj_neg_nnac::text,'null') ||'-'|| COALESCE(NEW.ajobservacion::text,'null');
   END IF;
   IF TG_RELNAME='alistamiento' THEN 
   	 textoviejo := COALESCE(OLD.alcodsx::text,'null') ||'-'|| COALESCE(OLD.alfecha_ini::text,'null') ||'-'|| COALESCE(OLD.alfecha_fin::text,'null') ||'-'|| COALESCE(OLD.alcliente_fac::text,'null') ||'-'|| COALESCE(OLD.alfactura::text,'null') ||'-'|| COALESCE(OLD.alunid_facturar::text,'null');
   	 textonuevo := COALESCE(NEW.alcodsx::text,'null') ||'-'|| COALESCE(NEW.alfecha_ini::text,'null') ||'-'|| COALESCE(NEW.alfecha_fin::text,'null') ||'-'|| COALESCE(NEW.alcliente_fac::text,'null') ||'-'|| COALESCE(NEW.alfactura::text,'null') ||'-'|| COALESCE(NEW.alunid_facturar::text,'null');
   END IF;
   IF TG_RELNAME='almacenamiento' THEN 
   	 textoviejo := COALESCE(OLD.almcodsx::text,'null') ||'-'|| COALESCE(OLD.almcliente_fac::text,'null') ||'-'|| COALESCE(OLD.almfecha_ini::text,'null') ||'-'|| COALESCE(OLD.almfecha_fin::text,'null') ||'-'|| COALESCE(OLD.almelect::text,'null') ||'-'|| COALESCE(OLD.almvasos::text,'null') ||'-'|| COALESCE(OLD.almfactura::text,'null');
   	 textonuevo := COALESCE(NEW.almcodsx::text,'null') ||'-'|| COALESCE(NEW.almcliente_fac::text,'null') ||'-'|| COALESCE(NEW.almfecha_ini::text,'null') ||'-'|| COALESCE(NEW.almfecha_fin::text,'null') ||'-'|| COALESCE(NEW.almelect::text,'null') ||'-'|| COALESCE(NEW.almvasos::text,'null') ||'-'|| COALESCE(NEW.almfactura::text,'null');
   END IF;
   IF TG_RELNAME='averia' THEN 
   	 textoviejo := COALESCE(OLD.avecodsx::text,'null') ||'-'|| COALESCE(OLD.avecompania::text,'null') ||'-'|| COALESCE(OLD.avefecha::text,'null') ||'-'|| COALESCE(OLD.aveingreso::text,'null') ||'-'|| COALESCE(OLD.aveentrada::text,'null') ||'-'|| COALESCE(OLD.avetipo::text,'null') ||'-'|| COALESCE(OLD.aveboddest::text,'null') ||'-'|| COALESCE(OLD.aveposdest::text,'null') ||'-'|| COALESCE(OLD.avecant_pleg_nac::text,'null') ||'-'|| COALESCE(OLD.avecant_pleg_nnac::text,'null') ||'-'|| COALESCE(OLD.avecant_prod_nac::text,'null') ||'-'|| COALESCE(OLD.avecant_prod_nnac::text,'null') ||'-'|| COALESCE(OLD.avesaldo_pleg_nac::text,'null') ||'-'|| COALESCE(OLD.avesaldo_pleg_nnac::text,'null') ||'-'|| COALESCE(OLD.avesaldo_prod_nac::text,'null') ||'-'|| COALESCE(OLD.avesaldo_prod_nnac::text,'null') ||'-'|| COALESCE(OLD.aveestado::text,'null') ||'-'|| COALESCE(OLD.aveproducto::text,'null');
   	 textonuevo := COALESCE(NEW.avecodsx::text,'null') ||'-'|| COALESCE(NEW.avecompania::text,'null') ||'-'|| COALESCE(NEW.avefecha::text,'null') ||'-'|| COALESCE(NEW.aveingreso::text,'null') ||'-'|| COALESCE(NEW.aveentrada::text,'null') ||'-'|| COALESCE(NEW.avetipo::text,'null') ||'-'|| COALESCE(NEW.aveboddest::text,'null') ||'-'|| COALESCE(NEW.aveposdest::text,'null') ||'-'|| COALESCE(NEW.avecant_pleg_nac::text,'null') ||'-'|| COALESCE(NEW.avecant_pleg_nnac::text,'null') ||'-'|| COALESCE(NEW.avecant_prod_nac::text,'null') ||'-'|| COALESCE(NEW.avecant_prod_nnac::text,'null') ||'-'|| COALESCE(NEW.avesaldo_pleg_nac::text,'null') ||'-'|| COALESCE(NEW.avesaldo_pleg_nnac::text,'null') ||'-'|| COALESCE(NEW.avesaldo_prod_nac::text,'null') ||'-'|| COALESCE(NEW.avesaldo_prod_nnac::text,'null') ||'-'|| COALESCE(NEW.aveestado::text,'null') ||'-'|| COALESCE(NEW.aveproducto::text,'null');
   END IF;
   IF TG_RELNAME='averia_nacdet' THEN 
   	 textoviejo := COALESCE(OLD.avncodsx::text,'null') ||'-'|| COALESCE(OLD.avnaveria::text,'null') ||'-'|| COALESCE(OLD.avnnacdet_or::text,'null') ||'-'|| COALESCE(OLD.avncant::text,'null') ||'-'|| COALESCE(OLD.avnsaldo::text,'null');
   	 textonuevo := COALESCE(NEW.avncodsx::text,'null') ||'-'|| COALESCE(NEW.avnaveria::text,'null') ||'-'|| COALESCE(NEW.avnnacdet_or::text,'null') ||'-'|| COALESCE(NEW.avncant::text,'null') ||'-'|| COALESCE(NEW.avnsaldo::text,'null');
   END IF;
   IF TG_RELNAME='bodega' THEN 
   	 textoviejo := COALESCE(OLD.bodcodsx::text,'null') ||'-'|| COALESCE(OLD.bodnombre::text,'null') ||'-'|| COALESCE(OLD.boddesc::text,'null') ||'-'|| COALESCE(OLD.bodurlplano::text,'null');
   	 textonuevo := COALESCE(NEW.bodcodsx::text,'null') ||'-'|| COALESCE(NEW.bodnombre::text,'null') ||'-'|| COALESCE(NEW.boddesc::text,'null') ||'-'|| COALESCE(NEW.bodurlplano::text,'null');
   END IF;
   IF TG_RELNAME='categoria' THEN 
   	 textoviejo := COALESCE(OLD.catcodsx::text,'null') ||'-'|| COALESCE(OLD.catcodpadre::text,'null') ||'-'|| COALESCE(OLD.catdescripcion::text,'null') ||'-'|| COALESCE(OLD.catcodcompania::text,'null') ||'-'|| COALESCE(OLD.catnombre::text,'null');
   	 textonuevo := COALESCE(NEW.catcodsx::text,'null') ||'-'|| COALESCE(NEW.catcodpadre::text,'null') ||'-'|| COALESCE(NEW.catdescripcion::text,'null') ||'-'|| COALESCE(NEW.catcodcompania::text,'null') ||'-'|| COALESCE(NEW.catnombre::text,'null');
   END IF;
   IF TG_RELNAME='causal' THEN 
   	 textoviejo := COALESCE(OLD.caucodsx::text,'null') ||'-'|| COALESCE(OLD.caudesc::text,'null') ||'-'|| COALESCE(OLD.cauresponsable::text,'null') ||'-'|| COALESCE(OLD.causnota::text,'null') ||'-'|| COALESCE(OLD.causdocsoporte::text,'null');
   	 textonuevo := COALESCE(NEW.caucodsx::text,'null') ||'-'|| COALESCE(NEW.caudesc::text,'null') ||'-'|| COALESCE(NEW.cauresponsable::text,'null') ||'-'|| COALESCE(NEW.causnota::text,'null') ||'-'|| COALESCE(NEW.causdocsoporte::text,'null');
   END IF;
   IF TG_RELNAME='causal_hit' THEN 
   	 textoviejo := COALESCE(OLD.cauhcodsx::text,'null') ||'-'|| COALESCE(OLD.cauhdesc::text,'null') ||'-'|| COALESCE(OLD.cauresp::text,'null');
   	 textonuevo := COALESCE(NEW.cauhcodsx::text,'null') ||'-'|| COALESCE(NEW.cauhdesc::text,'null') ||'-'|| COALESCE(NEW.cauresp::text,'null');
   END IF;
   IF TG_RELNAME='causal_pedido' THEN 
   	 textoviejo := COALESCE(OLD.caupcodsx::text,'null') ||'-'|| COALESCE(OLD.cauppedido::text,'null') ||'-'|| COALESCE(OLD.caupcausal::text,'null') ||'-'|| COALESCE(OLD.caupdesccausal::text,'null') ||'-'|| COALESCE(OLD.caupfecha::text,'null');
   	 textonuevo := COALESCE(NEW.caupcodsx::text,'null') ||'-'|| COALESCE(NEW.cauppedido::text,'null') ||'-'|| COALESCE(NEW.caupcausal::text,'null') ||'-'|| COALESCE(NEW.caupdesccausal::text,'null') ||'-'|| COALESCE(NEW.caupfecha::text,'null');
   END IF;
   IF TG_RELNAME='ciudad' THEN 
   	 textoviejo := COALESCE(OLD.ciucodigo::text,'null') ||'-'|| COALESCE(OLD.ciunombre::text,'null') ||'-'|| COALESCE(OLD.ciudepto::text,'null');
   	 textonuevo := COALESCE(NEW.ciucodigo::text,'null') ||'-'|| COALESCE(NEW.ciunombre::text,'null') ||'-'|| COALESCE(NEW.ciudepto::text,'null');
   END IF;
   IF TG_RELNAME='cliente' THEN 
   	 textoviejo := COALESCE(OLD.clicodsx::text,'null') ||'-'|| COALESCE(OLD.clinombre::text,'null') ||'-'|| COALESCE(OLD.clinit::text,'null') ||'-'|| COALESCE(OLD.clidireccion::text,'null') ||'-'|| COALESCE(OLD.clitelefono::text,'null') ||'-'|| COALESCE(OLD.cliciudad::text,'null') ||'-'|| COALESCE(OLD.clicontacto::text,'null') ||'-'|| COALESCE(OLD.climail::text,'null') ||'-'|| COALESCE(OLD.cliobservacion::text,'null') ||'-'|| COALESCE(OLD.clicodcompania::text,'null') ||'-'|| COALESCE(OLD.clicodigo::text,'null') ||'-'|| COALESCE(OLD.clidevolucion::text,'null');
   	 textonuevo := COALESCE(NEW.clicodsx::text,'null') ||'-'|| COALESCE(NEW.clinombre::text,'null') ||'-'|| COALESCE(NEW.clinit::text,'null') ||'-'|| COALESCE(NEW.clidireccion::text,'null') ||'-'|| COALESCE(NEW.clitelefono::text,'null') ||'-'|| COALESCE(NEW.cliciudad::text,'null') ||'-'|| COALESCE(NEW.clicontacto::text,'null') ||'-'|| COALESCE(NEW.climail::text,'null') ||'-'|| COALESCE(NEW.cliobservacion::text,'null') ||'-'|| COALESCE(NEW.clicodcompania::text,'null') ||'-'|| COALESCE(NEW.clicodigo::text,'null') ||'-'|| COALESCE(NEW.clidevolucion::text,'null');
   END IF;
   IF TG_RELNAME='cliente_facturacion' THEN 
   	 textoviejo := COALESCE(OLD.clifcodsx::text,'null') ||'-'|| COALESCE(OLD.clifnombre::text,'null') ||'-'|| COALESCE(OLD.clifnit::text,'null') ||'-'|| COALESCE(OLD.clifdireccion::text,'null') ||'-'|| COALESCE(OLD.cliftelefono::text,'null') ||'-'|| COALESCE(OLD.clifcodcompania::text,'null');
   	 textonuevo := COALESCE(NEW.clifcodsx::text,'null') ||'-'|| COALESCE(NEW.clifnombre::text,'null') ||'-'|| COALESCE(NEW.clifnit::text,'null') ||'-'|| COALESCE(NEW.clifdireccion::text,'null') ||'-'|| COALESCE(NEW.cliftelefono::text,'null') ||'-'|| COALESCE(NEW.clifcodcompania::text,'null');
   END IF;
   IF TG_RELNAME='compania' THEN 
   	 textoviejo := COALESCE(OLD.comcodsx::text,'null') ||'-'|| COALESCE(OLD.comdireccion::text,'null') ||'-'|| COALESCE(OLD.comnombre::text,'null') ||'-'|| COALESCE(OLD.comfax::text,'null') ||'-'|| COALESCE(OLD.comciudad::text,'null') ||'-'|| COALESCE(OLD.comemail::text,'null') ||'-'|| COALESCE(OLD.comgerente::text,'null') ||'-'|| COALESCE(OLD.comcontacto::text,'null') ||'-'|| COALESCE(OLD.comcargo::text,'null') ||'-'|| COALESCE(OLD.comtelefono::text,'null') ||'-'|| COALESCE(OLD.comnit::text,'null') ||'-'|| COALESCE(OLD.comtipo::text,'null') ||'-'|| COALESCE(OLD.cominventario::text,'null') ||'-'|| COALESCE(OLD.commapa::text,'null');
   	 textonuevo := COALESCE(NEW.comcodsx::text,'null') ||'-'|| COALESCE(NEW.comdireccion::text,'null') ||'-'|| COALESCE(NEW.comnombre::text,'null') ||'-'|| COALESCE(NEW.comfax::text,'null') ||'-'|| COALESCE(NEW.comciudad::text,'null') ||'-'|| COALESCE(NEW.comemail::text,'null') ||'-'|| COALESCE(NEW.comgerente::text,'null') ||'-'|| COALESCE(NEW.comcontacto::text,'null') ||'-'|| COALESCE(NEW.comcargo::text,'null') ||'-'|| COALESCE(NEW.comtelefono::text,'null') ||'-'|| COALESCE(NEW.comnit::text,'null') ||'-'|| COALESCE(NEW.comtipo::text,'null') ||'-'|| COALESCE(NEW.cominventario::text,'null') ||'-'|| COALESCE(NEW.commapa::text,'null');
   END IF;
   IF TG_RELNAME='concepto' THEN 
   	 textoviejo := COALESCE(OLD.concodsx::text,'null') ||'-'|| COALESCE(OLD.condesc::text,'null');
   	 textonuevo := COALESCE(NEW.concodsx::text,'null') ||'-'|| COALESCE(NEW.condesc::text,'null');
   END IF;
   IF TG_RELNAME='concepto_cliente' THEN 
   	 textoviejo := COALESCE(OLD.conccodsx::text,'null') ||'-'|| COALESCE(OLD.conccodconcepto::text,'null') ||'-'|| COALESCE(OLD.conccodcliente::text,'null') ||'-'|| COALESCE(OLD.concdescconcepto::text,'null') ||'-'|| COALESCE(OLD.concnombrecliente::text,'null') ||'-'|| COALESCE(OLD.concvalorunit::text,'null') ||'-'|| COALESCE(OLD.concporcentaje::text,'null') ||'-'|| COALESCE(OLD.concminimo::text,'null');
   	 textonuevo := COALESCE(NEW.conccodsx::text,'null') ||'-'|| COALESCE(NEW.conccodconcepto::text,'null') ||'-'|| COALESCE(NEW.conccodcliente::text,'null') ||'-'|| COALESCE(NEW.concdescconcepto::text,'null') ||'-'|| COALESCE(NEW.concnombrecliente::text,'null') ||'-'|| COALESCE(NEW.concvalorunit::text,'null') ||'-'|| COALESCE(NEW.concporcentaje::text,'null') ||'-'|| COALESCE(NEW.concminimo::text,'null');
   END IF;
   IF TG_RELNAME='config' THEN 
   	 textoviejo := COALESCE(OLD.cfnombre::text,'null') ||'-'|| COALESCE(OLD.cfvalor::text,'null');
   	 textonuevo := COALESCE(NEW.cfnombre::text,'null') ||'-'|| COALESCE(NEW.cfvalor::text,'null');
   END IF;
   IF TG_RELNAME='contenedor_trafico' THEN 
   	 textoviejo := COALESCE(OLD.ctrafcodsx::text,'null') ||'-'|| COALESCE(OLD.ctrafnumtrafico::text,'null') ||'-'|| COALESCE(OLD.ctraftamano::text,'null') ||'-'|| COALESCE(OLD.ctrafnumero::text,'null');
   	 textonuevo := COALESCE(NEW.ctrafcodsx::text,'null') ||'-'|| COALESCE(NEW.ctrafnumtrafico::text,'null') ||'-'|| COALESCE(NEW.ctraftamano::text,'null') ||'-'|| COALESCE(NEW.ctrafnumero::text,'null');
   END IF;
   IF TG_RELNAME='departamento' THEN 
   	 textoviejo := COALESCE(OLD.depcodigo::text,'null') ||'-'|| COALESCE(OLD.depnombre::text,'null') ||'-'|| COALESCE(OLD.depzona::text,'null');
   	 textonuevo := COALESCE(NEW.depcodigo::text,'null') ||'-'|| COALESCE(NEW.depnombre::text,'null') ||'-'|| COALESCE(NEW.depzona::text,'null');
   END IF;
   IF TG_RELNAME='despacho' THEN 
   	 textoviejo := COALESCE(OLD.despcodsx::text,'null') ||'-'|| COALESCE(OLD.despempresa::text,'null') ||'-'|| COALESCE(OLD.despfecha::text,'null') ||'-'|| COALESCE(OLD.despobservacion::text,'null') ||'-'|| COALESCE(OLD.despplaca::text,'null') ||'-'|| COALESCE(OLD.despnombrecond::text,'null') ||'-'|| COALESCE(OLD.despcedcond::text,'null') ||'-'|| COALESCE(OLD.desptransportadora::text,'null') ||'-'|| COALESCE(OLD.despestado::text,'null') ||'-'|| COALESCE(OLD.despbultos::text,'null') ||'-'|| COALESCE(OLD.despbultosarmados::text,'null') ||'-'|| COALESCE(OLD.desppesoneto::text,'null') ||'-'|| COALESCE(OLD.desppesobruto::text,'null') ||'-'|| COALESCE(OLD.despfob::text,'null') ||'-'|| COALESCE(OLD.despconsec::text,'null') ||'-'|| COALESCE(OLD.despconseczfp::text,'null');
   	 textonuevo := COALESCE(NEW.despcodsx::text,'null') ||'-'|| COALESCE(NEW.despempresa::text,'null') ||'-'|| COALESCE(NEW.despfecha::text,'null') ||'-'|| COALESCE(NEW.despobservacion::text,'null') ||'-'|| COALESCE(NEW.despplaca::text,'null') ||'-'|| COALESCE(NEW.despnombrecond::text,'null') ||'-'|| COALESCE(NEW.despcedcond::text,'null') ||'-'|| COALESCE(NEW.desptransportadora::text,'null') ||'-'|| COALESCE(NEW.despestado::text,'null') ||'-'|| COALESCE(NEW.despbultos::text,'null') ||'-'|| COALESCE(NEW.despbultosarmados::text,'null') ||'-'|| COALESCE(NEW.desppesoneto::text,'null') ||'-'|| COALESCE(NEW.desppesobruto::text,'null') ||'-'|| COALESCE(NEW.despfob::text,'null') ||'-'|| COALESCE(NEW.despconsec::text,'null') ||'-'|| COALESCE(NEW.despconseczfp::text,'null');
   END IF;
   IF TG_RELNAME='despacho_pedido' THEN 
   	 textoviejo := COALESCE(OLD.despedcodsx::text,'null') ||'-'|| COALESCE(OLD.despeddespacho::text,'null') ||'-'|| COALESCE(OLD.despedpedido::text,'null') ||'-'|| COALESCE(OLD.despedbultos::text,'null') ||'-'|| COALESCE(OLD.despedbultosarmados::text,'null') ||'-'|| COALESCE(OLD.despedpesoneto::text,'null') ||'-'|| COALESCE(OLD.despedpesobruto::text,'null') ||'-'|| COALESCE(OLD.despedvalor::text,'null');
   	 textonuevo := COALESCE(NEW.despedcodsx::text,'null') ||'-'|| COALESCE(NEW.despeddespacho::text,'null') ||'-'|| COALESCE(NEW.despedpedido::text,'null') ||'-'|| COALESCE(NEW.despedbultos::text,'null') ||'-'|| COALESCE(NEW.despedbultosarmados::text,'null') ||'-'|| COALESCE(NEW.despedpesoneto::text,'null') ||'-'|| COALESCE(NEW.despedpesobruto::text,'null') ||'-'|| COALESCE(NEW.despedvalor::text,'null');
   END IF;
   IF TG_RELNAME='empleado' THEN 
   	 textoviejo := COALESCE(OLD.empcodsx::text,'null') ||'-'|| COALESCE(OLD.empnombre::text,'null') ||'-'|| COALESCE(OLD.empcedula::text,'null') ||'-'|| COALESCE(OLD.empmail::text,'null') ||'-'|| COALESCE(OLD.empcargo::text,'null');
   	 textonuevo := COALESCE(NEW.empcodsx::text,'null') ||'-'|| COALESCE(NEW.empnombre::text,'null') ||'-'|| COALESCE(NEW.empcedula::text,'null') ||'-'|| COALESCE(NEW.empmail::text,'null') ||'-'|| COALESCE(NEW.empcargo::text,'null');
   END IF;
   IF TG_RELNAME='empresa' THEN 
   	 textoviejo := COALESCE(OLD.empcodsx::text,'null') ||'-'|| COALESCE(OLD.empnombre::text,'null') ||'-'|| COALESCE(OLD.empdireccion::text,'null') ||'-'|| COALESCE(OLD.emptelefono::text,'null') ||'-'|| COALESCE(OLD.empnit::text,'null') ||'-'|| COALESCE(OLD.empdescripcion::text,'null') ||'-'|| COALESCE(OLD.empmail::text,'null') ||'-'|| COALESCE(OLD.empslogan::text,'null');
   	 textonuevo := COALESCE(NEW.empcodsx::text,'null') ||'-'|| COALESCE(NEW.empnombre::text,'null') ||'-'|| COALESCE(NEW.empdireccion::text,'null') ||'-'|| COALESCE(NEW.emptelefono::text,'null') ||'-'|| COALESCE(NEW.empnit::text,'null') ||'-'|| COALESCE(NEW.empdescripcion::text,'null') ||'-'|| COALESCE(NEW.empmail::text,'null') ||'-'|| COALESCE(NEW.empslogan::text,'null');
   END IF;
   IF TG_RELNAME='entrada' THEN 
   	 textoviejo := COALESCE(OLD.entcodsx::text,'null') ||'-'|| COALESCE(OLD.entcodingreso::text,'null') ||'-'|| COALESCE(OLD.entcodproducto::text,'null') ||'-'|| COALESCE(OLD.entbodega::text,'null') ||'-'|| COALESCE(OLD.entposicion::text,'null') ||'-'|| COALESCE(OLD.entcantidad::text,'null') ||'-'|| COALESCE(OLD.entpesoneto::text,'null') ||'-'|| COALESCE(OLD.entpesonetototal::text,'null') ||'-'|| COALESCE(OLD.entpesobruto::text,'null') ||'-'|| COALESCE(OLD.entpesobrutototal::text,'null') ||'-'|| COALESCE(OLD.entsaldopesoneto::text,'null') ||'-'|| COALESCE(OLD.entsaldopesobruto::text,'null') ||'-'|| COALESCE(OLD.entsaldonac::text,'null') ||'-'|| COALESCE(OLD.entsaldosinnac::text,'null') ||'-'|| COALESCE(OLD.entvalor::text,'null') ||'-'|| COALESCE(OLD.entvalortotal::text,'null') ||'-'|| COALESCE(OLD.entfecha::text,'null') ||'-'|| COALESCE(OLD.entsaldonacf::text,'null') ||'-'|| COALESCE(OLD.entsaldosinnacf::text,'null') ||'-'|| COALESCE(OLD.entunidad::text,'null');
   	 textonuevo := COALESCE(NEW.entcodsx::text,'null') ||'-'|| COALESCE(NEW.entcodingreso::text,'null') ||'-'|| COALESCE(NEW.entcodproducto::text,'null') ||'-'|| COALESCE(NEW.entbodega::text,'null') ||'-'|| COALESCE(NEW.entposicion::text,'null') ||'-'|| COALESCE(NEW.entcantidad::text,'null') ||'-'|| COALESCE(NEW.entpesoneto::text,'null') ||'-'|| COALESCE(NEW.entpesonetototal::text,'null') ||'-'|| COALESCE(NEW.entpesobruto::text,'null') ||'-'|| COALESCE(NEW.entpesobrutototal::text,'null') ||'-'|| COALESCE(NEW.entsaldopesoneto::text,'null') ||'-'|| COALESCE(NEW.entsaldopesobruto::text,'null') ||'-'|| COALESCE(NEW.entsaldonac::text,'null') ||'-'|| COALESCE(NEW.entsaldosinnac::text,'null') ||'-'|| COALESCE(NEW.entvalor::text,'null') ||'-'|| COALESCE(NEW.entvalortotal::text,'null') ||'-'|| COALESCE(NEW.entfecha::text,'null') ||'-'|| COALESCE(NEW.entsaldonacf::text,'null') ||'-'|| COALESCE(NEW.entsaldosinnacf::text,'null') ||'-'|| COALESCE(NEW.entunidad::text,'null');
   END IF;
   IF TG_RELNAME='factura' THEN 
   	 textoviejo := COALESCE(OLD.faccodsx::text,'null') ||'-'|| COALESCE(OLD.faccodcliente::text,'null') ||'-'|| COALESCE(OLD.facdesccliente::text,'null') ||'-'|| COALESCE(OLD.facfechasistema::text,'null') ||'-'|| COALESCE(OLD.facfechafactura::text,'null') ||'-'|| COALESCE(OLD.facfechavencimiento::text,'null') ||'-'|| COALESCE(OLD.facnit::text,'null') ||'-'|| COALESCE(OLD.facdireccion::text,'null') ||'-'|| COALESCE(OLD.facobservaciones::text,'null') ||'-'|| COALESCE(OLD.facconcepto::text,'null') ||'-'|| COALESCE(OLD.facestado::text,'null') ||'-'|| COALESCE(OLD.facsubtotal::text,'null') ||'-'|| COALESCE(OLD.faciva::text,'null') ||'-'|| COALESCE(OLD.facretefuente::text,'null') ||'-'|| COALESCE(OLD.factotal::text,'null') ||'-'|| COALESCE(OLD.factextototal::text,'null') ||'-'|| COALESCE(OLD.factrm::text,'null') ||'-'|| COALESCE(OLD.fac_tipo::text,'null') ||'-'|| COALESCE(OLD.facvaloriva::text,'null') ||'-'|| COALESCE(OLD.facvalorretef::text,'null') ||'-'|| COALESCE(OLD.facmoneda::text,'null');
   	 textonuevo := COALESCE(NEW.faccodsx::text,'null') ||'-'|| COALESCE(NEW.faccodcliente::text,'null') ||'-'|| COALESCE(NEW.facdesccliente::text,'null') ||'-'|| COALESCE(NEW.facfechasistema::text,'null') ||'-'|| COALESCE(NEW.facfechafactura::text,'null') ||'-'|| COALESCE(NEW.facfechavencimiento::text,'null') ||'-'|| COALESCE(NEW.facnit::text,'null') ||'-'|| COALESCE(NEW.facdireccion::text,'null') ||'-'|| COALESCE(NEW.facobservaciones::text,'null') ||'-'|| COALESCE(NEW.facconcepto::text,'null') ||'-'|| COALESCE(NEW.facestado::text,'null') ||'-'|| COALESCE(NEW.facsubtotal::text,'null') ||'-'|| COALESCE(NEW.faciva::text,'null') ||'-'|| COALESCE(NEW.facretefuente::text,'null') ||'-'|| COALESCE(NEW.factotal::text,'null') ||'-'|| COALESCE(NEW.factextototal::text,'null') ||'-'|| COALESCE(NEW.factrm::text,'null') ||'-'|| COALESCE(NEW.fac_tipo::text,'null') ||'-'|| COALESCE(NEW.facvaloriva::text,'null') ||'-'|| COALESCE(NEW.facvalorretef::text,'null') ||'-'|| COALESCE(NEW.facmoneda::text,'null');
   END IF;
   IF TG_RELNAME='factura_detalle' THEN 
   	 textoviejo := COALESCE(OLD.facdcodsx::text,'null') ||'-'|| COALESCE(OLD.facdfactura::text,'null') ||'-'|| COALESCE(OLD.facdconceptodesc::text,'null') ||'-'|| COALESCE(OLD.facdtipo::text,'null') ||'-'|| COALESCE(OLD.facdvalorunit::text,'null') ||'-'|| COALESCE(OLD.facdvalortotal::text,'null') ||'-'|| COALESCE(OLD.facdcantidad::text,'null') ||'-'|| COALESCE(OLD.facdobservacion::text,'null') ||'-'|| COALESCE(OLD.facdporcentaje::text,'null') ||'-'|| COALESCE(OLD.facdvalorcomicion::text,'null') ||'-'|| COALESCE(OLD.facdminimo::text,'null');
   	 textonuevo := COALESCE(NEW.facdcodsx::text,'null') ||'-'|| COALESCE(NEW.facdfactura::text,'null') ||'-'|| COALESCE(NEW.facdconceptodesc::text,'null') ||'-'|| COALESCE(NEW.facdtipo::text,'null') ||'-'|| COALESCE(NEW.facdvalorunit::text,'null') ||'-'|| COALESCE(NEW.facdvalortotal::text,'null') ||'-'|| COALESCE(NEW.facdcantidad::text,'null') ||'-'|| COALESCE(NEW.facdobservacion::text,'null') ||'-'|| COALESCE(NEW.facdporcentaje::text,'null') ||'-'|| COALESCE(NEW.facdvalorcomicion::text,'null') ||'-'|| COALESCE(NEW.facdminimo::text,'null');
   END IF;
   IF TG_RELNAME='factura_trafico' THEN 
   	 textoviejo := COALESCE(OLD.ftrafcodsx::text,'null') ||'-'|| COALESCE(OLD.ftrafnumfactura::text,'null') ||'-'|| COALESCE(OLD.ftrafnumtrafico::text,'null');
   	 textonuevo := COALESCE(NEW.ftrafcodsx::text,'null') ||'-'|| COALESCE(NEW.ftrafnumfactura::text,'null') ||'-'|| COALESCE(NEW.ftrafnumtrafico::text,'null');
   END IF;
   IF TG_RELNAME='faq' THEN 
   	 textoviejo := COALESCE(OLD.faqcodsx::text,'null') ||'-'|| COALESCE(OLD.faqpregunta::text,'null') ||'-'|| COALESCE(OLD.faqrespcorta::text,'null') ||'-'|| COALESCE(OLD.faqresplarga::text,'null');
   	 textonuevo := COALESCE(NEW.faqcodsx::text,'null') ||'-'|| COALESCE(NEW.faqpregunta::text,'null') ||'-'|| COALESCE(NEW.faqrespcorta::text,'null') ||'-'|| COALESCE(NEW.faqresplarga::text,'null');
   END IF;
   IF TG_RELNAME='flete' THEN 
   	 textoviejo := COALESCE(OLD.flecodsx::text,'null') ||'-'|| COALESCE(OLD.fleciudad::text,'null') ||'-'|| COALESCE(OLD.fletransportadora::text,'null') ||'-'|| COALESCE(OLD.flevalor::text,'null') ||'-'|| COALESCE(OLD.fledias::text,'null');
   	 textonuevo := COALESCE(NEW.flecodsx::text,'null') ||'-'|| COALESCE(NEW.fleciudad::text,'null') ||'-'|| COALESCE(NEW.fletransportadora::text,'null') ||'-'|| COALESCE(NEW.flevalor::text,'null') ||'-'|| COALESCE(NEW.fledias::text,'null');
   END IF;
   IF TG_RELNAME='grupo' THEN 
   	 textoviejo := COALESCE(OLD.gcodsx::text,'null') ||'-'|| COALESCE(OLD.gnombre::text,'null');
   	 textonuevo := COALESCE(NEW.gcodsx::text,'null') ||'-'|| COALESCE(NEW.gnombre::text,'null');
   END IF;
   IF TG_RELNAME='ingreso' THEN 
   	 textoviejo := COALESCE(OLD.ingcodsx::text,'null') ||'-'|| COALESCE(OLD.ingcodcia::text,'null') ||'-'|| COALESCE(OLD.ingfecha::text,'null') ||'-'|| COALESCE(OLD.ingtipo::text,'null') ||'-'|| COALESCE(OLD.ingtrafico::text,'null') ||'-'|| COALESCE(OLD.ingobservacion::text,'null') ||'-'|| COALESCE(OLD.ingestado::text,'null') ||'-'|| COALESCE(OLD.ingcausal::text,'null') ||'-'|| COALESCE(OLD.ingcli_devolucion::text,'null') ||'-'|| COALESCE(OLD.ingpesoneto::text,'null') ||'-'|| COALESCE(OLD.ingpesobruto::text,'null') ||'-'|| COALESCE(OLD.ingfob::text,'null') ||'-'|| COALESCE(OLD.ingcantidad::text,'null') ||'-'|| COALESCE(OLD.ingciudad_dev::text,'null') ||'-'|| COALESCE(OLD.ingconsec::text,'null') ||'-'|| COALESCE(OLD.ingconseczfp::text,'null') ||'-'|| COALESCE(OLD.ingplanilla::text,'null');
   	 textonuevo := COALESCE(NEW.ingcodsx::text,'null') ||'-'|| COALESCE(NEW.ingcodcia::text,'null') ||'-'|| COALESCE(NEW.ingfecha::text,'null') ||'-'|| COALESCE(NEW.ingtipo::text,'null') ||'-'|| COALESCE(NEW.ingtrafico::text,'null') ||'-'|| COALESCE(NEW.ingobservacion::text,'null') ||'-'|| COALESCE(NEW.ingestado::text,'null') ||'-'|| COALESCE(NEW.ingcausal::text,'null') ||'-'|| COALESCE(NEW.ingcli_devolucion::text,'null') ||'-'|| COALESCE(NEW.ingpesoneto::text,'null') ||'-'|| COALESCE(NEW.ingpesobruto::text,'null') ||'-'|| COALESCE(NEW.ingfob::text,'null') ||'-'|| COALESCE(NEW.ingcantidad::text,'null') ||'-'|| COALESCE(NEW.ingciudad_dev::text,'null') ||'-'|| COALESCE(NEW.ingconsec::text,'null') ||'-'|| COALESCE(NEW.ingconseczfp::text,'null') ||'-'|| COALESCE(NEW.ingplanilla::text,'null');
   END IF;
   IF TG_RELNAME='nacionalizacion' THEN 
   	 textoviejo := COALESCE(OLD.naccodsx::text,'null') ||'-'|| COALESCE(OLD.nacempresa::text,'null') ||'-'|| COALESCE(OLD.nacfecha::text,'null') ||'-'|| COALESCE(OLD.nacingreso::text,'null') ||'-'|| COALESCE(OLD.nacestado::text,'null') ||'-'|| COALESCE(OLD.nacdeclaracion::text,'null') ||'-'|| COALESCE(OLD.nacfechadeclaracion::text,'null') ||'-'|| COALESCE(OLD.nacfechaingresobodega::text,'null') ||'-'|| COALESCE(OLD.nacpaginainicial::text,'null') ||'-'|| COALESCE(OLD.nacpaginafinal::text,'null') ||'-'|| COALESCE(OLD.nacdosia::text,'null') ||'-'|| COALESCE(OLD.nacobservaciones::text,'null') ||'-'|| COALESCE(OLD.nactipo::text,'null') ||'-'|| COALESCE(OLD.nacpesoneto::text,'null') ||'-'|| COALESCE(OLD.nacpesobruto::text,'null') ||'-'|| COALESCE(OLD.nacfob::text,'null') ||'-'|| COALESCE(OLD.nacconsec::text,'null') ||'-'|| COALESCE(OLD.nacconseczfp::text,'null');
   	 textonuevo := COALESCE(NEW.naccodsx::text,'null') ||'-'|| COALESCE(NEW.nacempresa::text,'null') ||'-'|| COALESCE(NEW.nacfecha::text,'null') ||'-'|| COALESCE(NEW.nacingreso::text,'null') ||'-'|| COALESCE(NEW.nacestado::text,'null') ||'-'|| COALESCE(NEW.nacdeclaracion::text,'null') ||'-'|| COALESCE(NEW.nacfechadeclaracion::text,'null') ||'-'|| COALESCE(NEW.nacfechaingresobodega::text,'null') ||'-'|| COALESCE(NEW.nacpaginainicial::text,'null') ||'-'|| COALESCE(NEW.nacpaginafinal::text,'null') ||'-'|| COALESCE(NEW.nacdosia::text,'null') ||'-'|| COALESCE(NEW.nacobservaciones::text,'null') ||'-'|| COALESCE(NEW.nactipo::text,'null') ||'-'|| COALESCE(NEW.nacpesoneto::text,'null') ||'-'|| COALESCE(NEW.nacpesobruto::text,'null') ||'-'|| COALESCE(NEW.nacfob::text,'null') ||'-'|| COALESCE(NEW.nacconsec::text,'null') ||'-'|| COALESCE(NEW.nacconseczfp::text,'null');
   END IF;
   IF TG_RELNAME='nacionalizacion_detalle' THEN 
   	 textoviejo := COALESCE(OLD.nadcodsx::text,'null') ||'-'|| COALESCE(OLD.nadcodnac::text,'null') ||'-'|| COALESCE(OLD.nadentrada::text,'null') ||'-'|| COALESCE(OLD.nadcantidad::text,'null') ||'-'|| COALESCE(OLD.nadsaldo::text,'null') ||'-'|| COALESCE(OLD.nadpesoneto::text,'null') ||'-'|| COALESCE(OLD.nadpesonetototal::text,'null') ||'-'|| COALESCE(OLD.nadpesobruto::text,'null') ||'-'|| COALESCE(OLD.nadpesobrutototal::text,'null') ||'-'|| COALESCE(OLD.nadfob::text,'null') ||'-'|| COALESCE(OLD.nadfobtotal::text,'null');
   	 textonuevo := COALESCE(NEW.nadcodsx::text,'null') ||'-'|| COALESCE(NEW.nadcodnac::text,'null') ||'-'|| COALESCE(NEW.nadentrada::text,'null') ||'-'|| COALESCE(NEW.nadcantidad::text,'null') ||'-'|| COALESCE(NEW.nadsaldo::text,'null') ||'-'|| COALESCE(NEW.nadpesoneto::text,'null') ||'-'|| COALESCE(NEW.nadpesonetototal::text,'null') ||'-'|| COALESCE(NEW.nadpesobruto::text,'null') ||'-'|| COALESCE(NEW.nadpesobrutototal::text,'null') ||'-'|| COALESCE(NEW.nadfob::text,'null') ||'-'|| COALESCE(NEW.nadfobtotal::text,'null');
   END IF;
   IF TG_RELNAME='novedad_pedido' THEN 
   	 textoviejo := COALESCE(OLD.novcodsx::text,'null') ||'-'|| COALESCE(OLD.novpedido::text,'null') ||'-'|| COALESCE(OLD.novfecha::text,'null') ||'-'|| COALESCE(OLD.novdesc::text,'null') ||'-'|| COALESCE(OLD.novusuario::text,'null');
   	 textonuevo := COALESCE(NEW.novcodsx::text,'null') ||'-'|| COALESCE(NEW.novpedido::text,'null') ||'-'|| COALESCE(NEW.novfecha::text,'null') ||'-'|| COALESCE(NEW.novdesc::text,'null') ||'-'|| COALESCE(NEW.novusuario::text,'null');
   END IF;
   IF TG_RELNAME='packing' THEN 
   	 textoviejo := COALESCE(OLD.packcodsx::text,'null') ||'-'|| COALESCE(OLD.packempresa::text,'null') ||'-'|| COALESCE(OLD.packfecha::text,'null') ||'-'|| COALESCE(OLD.packobservaciones::text,'null') ||'-'|| COALESCE(OLD.packestado::text,'null') ||'-'|| COALESCE(OLD.packpesoneto::text,'null') ||'-'|| COALESCE(OLD.packpesobruto::text,'null');
   	 textonuevo := COALESCE(NEW.packcodsx::text,'null') ||'-'|| COALESCE(NEW.packempresa::text,'null') ||'-'|| COALESCE(NEW.packfecha::text,'null') ||'-'|| COALESCE(NEW.packobservaciones::text,'null') ||'-'|| COALESCE(NEW.packestado::text,'null') ||'-'|| COALESCE(NEW.packpesoneto::text,'null') ||'-'|| COALESCE(NEW.packpesobruto::text,'null');
   END IF;
   IF TG_RELNAME='packing_detalle' THEN 
   	 textoviejo := COALESCE(OLD.packdcodsx::text,'null') ||'-'|| COALESCE(OLD.packdpacking::text,'null') ||'-'|| COALESCE(OLD.packdproducto::text,'null') ||'-'|| COALESCE(OLD.packdpesoneto::text,'null') ||'-'|| COALESCE(OLD.packdpesobruto::text,'null') ||'-'|| COALESCE(OLD.packdcantidad::text,'null');
   	 textonuevo := COALESCE(NEW.packdcodsx::text,'null') ||'-'|| COALESCE(NEW.packdpacking::text,'null') ||'-'|| COALESCE(NEW.packdproducto::text,'null') ||'-'|| COALESCE(NEW.packdpesoneto::text,'null') ||'-'|| COALESCE(NEW.packdpesobruto::text,'null') ||'-'|| COALESCE(NEW.packdcantidad::text,'null');
   END IF;
   IF TG_RELNAME='packing_detalle_posicion' THEN 
   	 textoviejo := COALESCE(OLD.packpcodsx::text,'null') ||'-'|| COALESCE(OLD.packppackingdet::text,'null') ||'-'|| COALESCE(OLD.packpbodega::text,'null') ||'-'|| COALESCE(OLD.packpposicion::text,'null') ||'-'|| COALESCE(OLD.packpcantidad::text,'null') ||'-'|| COALESCE(OLD.packpentrada::text,'null') ||'-'|| COALESCE(OLD.packpnacdetalle::text,'null') ||'-'|| COALESCE(OLD.packpsaldo::text,'null') ||'-'|| COALESCE(OLD.packppesoneto::text,'null') ||'-'|| COALESCE(OLD.packppesobruto::text,'null') ||'-'|| COALESCE(OLD.packppesonetototal::text,'null') ||'-'|| COALESCE(OLD.packppesobrutototal::text,'null');
   	 textonuevo := COALESCE(NEW.packpcodsx::text,'null') ||'-'|| COALESCE(NEW.packppackingdet::text,'null') ||'-'|| COALESCE(NEW.packpbodega::text,'null') ||'-'|| COALESCE(NEW.packpposicion::text,'null') ||'-'|| COALESCE(NEW.packpcantidad::text,'null') ||'-'|| COALESCE(NEW.packpentrada::text,'null') ||'-'|| COALESCE(NEW.packpnacdetalle::text,'null') ||'-'|| COALESCE(NEW.packpsaldo::text,'null') ||'-'|| COALESCE(NEW.packppesoneto::text,'null') ||'-'|| COALESCE(NEW.packppesobruto::text,'null') ||'-'|| COALESCE(NEW.packppesonetototal::text,'null') ||'-'|| COALESCE(NEW.packppesobrutototal::text,'null');
   END IF;
   IF TG_RELNAME='pedido' THEN 
   	 textoviejo := COALESCE(OLD.pedcodsx::text,'null') ||'-'|| COALESCE(OLD.pedcompania::text,'null') ||'-'|| COALESCE(OLD.pednumpedido::text,'null') ||'-'|| COALESCE(OLD.pedordencompra::text,'null') ||'-'|| COALESCE(OLD.pedguia::text,'null') ||'-'|| COALESCE(OLD.pedfechasistema::text,'null') ||'-'|| COALESCE(OLD.pedfecha::text,'null') ||'-'|| COALESCE(OLD.pedfechavenc::text,'null') ||'-'|| COALESCE(OLD.pedfechacita::text,'null') ||'-'|| COALESCE(OLD.pedhoracita::text,'null') ||'-'|| COALESCE(OLD.pedcliente::text,'null') ||'-'|| COALESCE(OLD.pedsucursal::text,'null') ||'-'|| COALESCE(OLD.peddireccion::text,'null') ||'-'|| COALESCE(OLD.pedciudad::text,'null') ||'-'|| COALESCE(OLD.peddepartamento::text,'null') ||'-'|| COALESCE(OLD.pedobservaciones::text,'null') ||'-'|| COALESCE(OLD.pedfactura::text,'null') ||'-'|| COALESCE(OLD.pedestado::text,'null') ||'-'|| COALESCE(OLD.pedsubtotal::text,'null') ||'-'|| COALESCE(OLD.pediva::text,'null') ||'-'|| COALESCE(OLD.peddescuento::text,'null') ||'-'|| COALESCE(OLD.pedtotal::text,'null') ||'-'|| COALESCE(OLD.pedtipo::text,'null') ||'-'|| COALESCE(OLD.pedpicking::text,'null') ||'-'|| COALESCE(OLD.pedpesoneto::text,'null') ||'-'|| COALESCE(OLD.pedpesobruto::text,'null') ||'-'|| COALESCE(OLD.pedhora::text,'null') ||'-'|| COALESCE(OLD.pedzona::text,'null') ||'-'|| COALESCE(OLD.pedcausal_hit::text,'null') ||'-'|| COALESCE(OLD.pedporc_iva::text,'null');
   	 textonuevo := COALESCE(NEW.pedcodsx::text,'null') ||'-'|| COALESCE(NEW.pedcompania::text,'null') ||'-'|| COALESCE(NEW.pednumpedido::text,'null') ||'-'|| COALESCE(NEW.pedordencompra::text,'null') ||'-'|| COALESCE(NEW.pedguia::text,'null') ||'-'|| COALESCE(NEW.pedfechasistema::text,'null') ||'-'|| COALESCE(NEW.pedfecha::text,'null') ||'-'|| COALESCE(NEW.pedfechavenc::text,'null') ||'-'|| COALESCE(NEW.pedfechacita::text,'null') ||'-'|| COALESCE(NEW.pedhoracita::text,'null') ||'-'|| COALESCE(NEW.pedcliente::text,'null') ||'-'|| COALESCE(NEW.pedsucursal::text,'null') ||'-'|| COALESCE(NEW.peddireccion::text,'null') ||'-'|| COALESCE(NEW.pedciudad::text,'null') ||'-'|| COALESCE(NEW.peddepartamento::text,'null') ||'-'|| COALESCE(NEW.pedobservaciones::text,'null') ||'-'|| COALESCE(NEW.pedfactura::text,'null') ||'-'|| COALESCE(NEW.pedestado::text,'null') ||'-'|| COALESCE(NEW.pedsubtotal::text,'null') ||'-'|| COALESCE(NEW.pediva::text,'null') ||'-'|| COALESCE(NEW.peddescuento::text,'null') ||'-'|| COALESCE(NEW.pedtotal::text,'null') ||'-'|| COALESCE(NEW.pedtipo::text,'null') ||'-'|| COALESCE(NEW.pedpicking::text,'null') ||'-'|| COALESCE(NEW.pedpesoneto::text,'null') ||'-'|| COALESCE(NEW.pedpesobruto::text,'null') ||'-'|| COALESCE(NEW.pedhora::text,'null') ||'-'|| COALESCE(NEW.pedzona::text,'null') ||'-'|| COALESCE(NEW.pedcausal_hit::text,'null') ||'-'|| COALESCE(NEW.pedporc_iva::text,'null');
   END IF;
   IF TG_RELNAME='permiso' THEN 
   	 textoviejo := COALESCE(OLD.percodsx::text,'null') ||'-'|| COALESCE(OLD.pergrupo::text,'null') ||'-'|| COALESCE(OLD.perapp::text,'null') ||'-'|| COALESCE(OLD.permodulo::text,'null') ||'-'|| COALESCE(OLD.peracceso::text,'null');
   	 textonuevo := COALESCE(NEW.percodsx::text,'null') ||'-'|| COALESCE(NEW.pergrupo::text,'null') ||'-'|| COALESCE(NEW.perapp::text,'null') ||'-'|| COALESCE(NEW.permodulo::text,'null') ||'-'|| COALESCE(NEW.peracceso::text,'null');
   END IF;
   IF TG_RELNAME='picking' THEN 
   	 textoviejo := COALESCE(OLD.pickcodsx::text,'null') ||'-'|| COALESCE(OLD.pickfecha::text,'null') ||'-'|| COALESCE(OLD.pickempresa::text,'null') ||'-'|| COALESCE(OLD.pickcodpacking::text,'null') ||'-'|| COALESCE(OLD.pickobservaciones::text,'null') ||'-'|| COALESCE(OLD.pickestado::text,'null') ||'-'|| COALESCE(OLD.pickpesoneto::text,'null') ||'-'|| COALESCE(OLD.pickpesobruto::text,'null') ||'-'|| COALESCE(OLD.pickvalor::text,'null') ||'-'|| COALESCE(OLD.pickpedido::text,'null') ||'-'|| COALESCE(OLD.picknumpedido::text,'null');
   	 textonuevo := COALESCE(NEW.pickcodsx::text,'null') ||'-'|| COALESCE(NEW.pickfecha::text,'null') ||'-'|| COALESCE(NEW.pickempresa::text,'null') ||'-'|| COALESCE(NEW.pickcodpacking::text,'null') ||'-'|| COALESCE(NEW.pickobservaciones::text,'null') ||'-'|| COALESCE(NEW.pickestado::text,'null') ||'-'|| COALESCE(NEW.pickpesoneto::text,'null') ||'-'|| COALESCE(NEW.pickpesobruto::text,'null') ||'-'|| COALESCE(NEW.pickvalor::text,'null') ||'-'|| COALESCE(NEW.pickpedido::text,'null') ||'-'|| COALESCE(NEW.picknumpedido::text,'null');
   END IF;
   IF TG_RELNAME='picking_detalle' THEN 
   	 textoviejo := COALESCE(OLD.pickdcodsx::text,'null') ||'-'|| COALESCE(OLD.pickdcodpicking::text,'null') ||'-'|| COALESCE(OLD.pickdproducto::text,'null') ||'-'|| COALESCE(OLD.pickdvalorunit::text,'null') ||'-'|| COALESCE(OLD.pickdpesoneto::text,'null') ||'-'|| COALESCE(OLD.pickdpesobruto::text,'null') ||'-'|| COALESCE(OLD.pickdvalortotal::text,'null') ||'-'|| COALESCE(OLD.pickdcantidad::text,'null');
   	 textonuevo := COALESCE(NEW.pickdcodsx::text,'null') ||'-'|| COALESCE(NEW.pickdcodpicking::text,'null') ||'-'|| COALESCE(NEW.pickdproducto::text,'null') ||'-'|| COALESCE(NEW.pickdvalorunit::text,'null') ||'-'|| COALESCE(NEW.pickdpesoneto::text,'null') ||'-'|| COALESCE(NEW.pickdpesobruto::text,'null') ||'-'|| COALESCE(NEW.pickdvalortotal::text,'null') ||'-'|| COALESCE(NEW.pickdcantidad::text,'null');
   END IF;
   IF TG_RELNAME='picking_detalle_packing' THEN 
   	 textoviejo := COALESCE(OLD.pickpcodsx::text,'null') ||'-'|| COALESCE(OLD.pickppickingdetalle::text,'null') ||'-'|| COALESCE(OLD.pickppackingdet::text,'null') ||'-'|| COALESCE(OLD.pickpcantidad::text,'null') ||'-'|| COALESCE(OLD.pickppesoneto::text,'null') ||'-'|| COALESCE(OLD.pickppesobruto::text,'null') ||'-'|| COALESCE(OLD.pickppesonetototal::text,'null') ||'-'|| COALESCE(OLD.pickppesobrutototal::text,'null');
   	 textonuevo := COALESCE(NEW.pickpcodsx::text,'null') ||'-'|| COALESCE(NEW.pickppickingdetalle::text,'null') ||'-'|| COALESCE(NEW.pickppackingdet::text,'null') ||'-'|| COALESCE(NEW.pickpcantidad::text,'null') ||'-'|| COALESCE(NEW.pickppesoneto::text,'null') ||'-'|| COALESCE(NEW.pickppesobruto::text,'null') ||'-'|| COALESCE(NEW.pickppesonetototal::text,'null') ||'-'|| COALESCE(NEW.pickppesobrutototal::text,'null');
   END IF;
   IF TG_RELNAME='producto' THEN 
   	 textoviejo := COALESCE(OLD.procodsx::text,'null') ||'-'|| COALESCE(OLD.procodigocia::text,'null') ||'-'|| COALESCE(OLD.prodescripcion::text,'null') ||'-'|| COALESCE(OLD.procategoria::text,'null') ||'-'|| COALESCE(OLD.promodelo::text,'null') ||'-'|| COALESCE(OLD.prosubpartida::text,'null') ||'-'|| COALESCE(OLD.proean::text,'null') ||'-'|| COALESCE(OLD.procodbarra::text,'null') ||'-'|| COALESCE(OLD.progarantia::text,'null') ||'-'|| COALESCE(OLD.prokiloreal::text,'null') ||'-'|| COALESCE(OLD.provolumen::text,'null') ||'-'|| COALESCE(OLD.prokilovolumen::text,'null') ||'-'|| COALESCE(OLD.prouniempaque::text,'null') ||'-'|| COALESCE(OLD.prokvuniempaque::text,'null') ||'-'|| COALESCE(OLD.provoluniempaque::text,'null') ||'-'|| COALESCE(OLD.prounimasterpac::text,'null') ||'-'|| COALESCE(OLD.prokvmasterpack::text,'null') ||'-'|| COALESCE(OLD.propesobmp::text,'null') ||'-'|| COALESCE(OLD.provolmasterpac::text,'null') ||'-'|| COALESCE(OLD.procodigobarra::text,'null') ||'-'|| COALESCE(OLD.proestado::text,'null') ||'-'|| COALESCE(OLD.proobservacion::text,'null') ||'-'|| COALESCE(OLD.protipoproducto::text,'null');
   	 textonuevo := COALESCE(NEW.procodsx::text,'null') ||'-'|| COALESCE(NEW.procodigocia::text,'null') ||'-'|| COALESCE(NEW.prodescripcion::text,'null') ||'-'|| COALESCE(NEW.procategoria::text,'null') ||'-'|| COALESCE(NEW.promodelo::text,'null') ||'-'|| COALESCE(NEW.prosubpartida::text,'null') ||'-'|| COALESCE(NEW.proean::text,'null') ||'-'|| COALESCE(NEW.procodbarra::text,'null') ||'-'|| COALESCE(NEW.progarantia::text,'null') ||'-'|| COALESCE(NEW.prokiloreal::text,'null') ||'-'|| COALESCE(NEW.provolumen::text,'null') ||'-'|| COALESCE(NEW.prokilovolumen::text,'null') ||'-'|| COALESCE(NEW.prouniempaque::text,'null') ||'-'|| COALESCE(NEW.prokvuniempaque::text,'null') ||'-'|| COALESCE(NEW.provoluniempaque::text,'null') ||'-'|| COALESCE(NEW.prounimasterpac::text,'null') ||'-'|| COALESCE(NEW.prokvmasterpack::text,'null') ||'-'|| COALESCE(NEW.propesobmp::text,'null') ||'-'|| COALESCE(NEW.provolmasterpac::text,'null') ||'-'|| COALESCE(NEW.procodigobarra::text,'null') ||'-'|| COALESCE(NEW.proestado::text,'null') ||'-'|| COALESCE(NEW.proobservacion::text,'null') ||'-'|| COALESCE(NEW.protipoproducto::text,'null');
   END IF;
   IF TG_RELNAME='producto_cliente' THEN 
   	 textoviejo := COALESCE(OLD.proccodsx::text,'null') ||'-'|| COALESCE(OLD.proccliente::text,'null') ||'-'|| COALESCE(OLD.procproducto::text,'null') ||'-'|| COALESCE(OLD.procean::text,'null') ||'-'|| COALESCE(OLD.proctag::text,'null') ||'-'|| COALESCE(OLD.procodbarra::text,'null') ||'-'|| COALESCE(OLD.procnumcodigobarra::text,'null') ||'-'|| COALESCE(OLD.procgarantia::text,'null');
   	 textonuevo := COALESCE(NEW.proccodsx::text,'null') ||'-'|| COALESCE(NEW.proccliente::text,'null') ||'-'|| COALESCE(NEW.procproducto::text,'null') ||'-'|| COALESCE(NEW.procean::text,'null') ||'-'|| COALESCE(NEW.proctag::text,'null') ||'-'|| COALESCE(NEW.procodbarra::text,'null') ||'-'|| COALESCE(NEW.procnumcodigobarra::text,'null') ||'-'|| COALESCE(NEW.procgarantia::text,'null');
   END IF;
   IF TG_RELNAME='proforma' THEN 
   	 textoviejo := COALESCE(OLD.profcodsx::text,'null') ||'-'|| COALESCE(OLD.profnumfactura::text,'null') ||'-'|| COALESCE(OLD.profost::text,'null') ||'-'|| COALESCE(OLD.profpedido::text,'null') ||'-'|| COALESCE(OLD.profnit::text,'null') ||'-'|| COALESCE(OLD.porforigen::text,'null') ||'-'|| COALESCE(OLD.profmotonave::text,'null') ||'-'|| COALESCE(OLD.profbl::text,'null') ||'-'|| COALESCE(OLD.proftasacambio::text,'null') ||'-'|| COALESCE(OLD.profbultos::text,'null') ||'-'|| COALESCE(OLD.profcont20::text,'null') ||'-'|| COALESCE(OLD.profcont40::text,'null') ||'-'|| COALESCE(OLD.profcont40hc::text,'null') ||'-'|| COALESCE(OLD.profpeso::text,'null') ||'-'|| COALESCE(OLD.proffob::text,'null') ||'-'|| COALESCE(OLD.profflete::text,'null') ||'-'|| COALESCE(OLD.profgastosorigen::text,'null') ||'-'|| COALESCE(OLD.profrecargocomb::text,'null') ||'-'|| COALESCE(OLD.profgastosdestino::text,'null') ||'-'|| COALESCE(OLD.profgastosnaviera::text,'null') ||'-'|| COALESCE(OLD.profcollectionfee::text,'null') ||'-'|| COALESCE(OLD.profradicacionbl::text,'null') ||'-'|| COALESCE(OLD.profmanejo::text,'null') ||'-'|| COALESCE(OLD.profdropoff::text,'null') ||'-'|| COALESCE(OLD.profseguro::text,'null') ||'-'|| COALESCE(OLD.profcifdolares::text,'null') ||'-'|| COALESCE(OLD.profcifpesos::text,'null') ||'-'|| COALESCE(OLD.proftotal::text,'null') ||'-'|| COALESCE(OLD.proffecha::text,'null') ||'-'|| COALESCE(OLD.profcliente::text,'null') ||'-'|| COALESCE(OLD.profservotm::text,'null') ||'-'|| COALESCE(OLD.profanticipo::text,'null') ||'-'|| COALESCE(OLD.proffurgon::text,'null') ||'-'|| COALESCE(OLD.profmanejosli::text,'null');
   	 textonuevo := COALESCE(NEW.profcodsx::text,'null') ||'-'|| COALESCE(NEW.profnumfactura::text,'null') ||'-'|| COALESCE(NEW.profost::text,'null') ||'-'|| COALESCE(NEW.profpedido::text,'null') ||'-'|| COALESCE(NEW.profnit::text,'null') ||'-'|| COALESCE(NEW.porforigen::text,'null') ||'-'|| COALESCE(NEW.profmotonave::text,'null') ||'-'|| COALESCE(NEW.profbl::text,'null') ||'-'|| COALESCE(NEW.proftasacambio::text,'null') ||'-'|| COALESCE(NEW.profbultos::text,'null') ||'-'|| COALESCE(NEW.profcont20::text,'null') ||'-'|| COALESCE(NEW.profcont40::text,'null') ||'-'|| COALESCE(NEW.profcont40hc::text,'null') ||'-'|| COALESCE(NEW.profpeso::text,'null') ||'-'|| COALESCE(NEW.proffob::text,'null') ||'-'|| COALESCE(NEW.profflete::text,'null') ||'-'|| COALESCE(NEW.profgastosorigen::text,'null') ||'-'|| COALESCE(NEW.profrecargocomb::text,'null') ||'-'|| COALESCE(NEW.profgastosdestino::text,'null') ||'-'|| COALESCE(NEW.profgastosnaviera::text,'null') ||'-'|| COALESCE(NEW.profcollectionfee::text,'null') ||'-'|| COALESCE(NEW.profradicacionbl::text,'null') ||'-'|| COALESCE(NEW.profmanejo::text,'null') ||'-'|| COALESCE(NEW.profdropoff::text,'null') ||'-'|| COALESCE(NEW.profseguro::text,'null') ||'-'|| COALESCE(NEW.profcifdolares::text,'null') ||'-'|| COALESCE(NEW.profcifpesos::text,'null') ||'-'|| COALESCE(NEW.proftotal::text,'null') ||'-'|| COALESCE(NEW.proffecha::text,'null') ||'-'|| COALESCE(NEW.profcliente::text,'null') ||'-'|| COALESCE(NEW.profservotm::text,'null') ||'-'|| COALESCE(NEW.profanticipo::text,'null') ||'-'|| COALESCE(NEW.proffurgon::text,'null') ||'-'|| COALESCE(NEW.profmanejosli::text,'null');
   END IF;
   IF TG_RELNAME='referencia_despacho' THEN 
   	 textoviejo := COALESCE(OLD.refdcodsx::text,'null') ||'-'|| COALESCE(OLD.refddespacho_pedido::text,'null') ||'-'|| COALESCE(OLD.refdproducto::text,'null') ||'-'|| COALESCE(OLD.refdcant::text,'null') ||'-'|| COALESCE(OLD.refdvalor::text,'null') ||'-'|| COALESCE(OLD.refdpesoneto::text,'null') ||'-'|| COALESCE(OLD.refdpesobruto::text,'null');
   	 textonuevo := COALESCE(NEW.refdcodsx::text,'null') ||'-'|| COALESCE(NEW.refddespacho_pedido::text,'null') ||'-'|| COALESCE(NEW.refdproducto::text,'null') ||'-'|| COALESCE(NEW.refdcant::text,'null') ||'-'|| COALESCE(NEW.refdvalor::text,'null') ||'-'|| COALESCE(NEW.refdpesoneto::text,'null') ||'-'|| COALESCE(NEW.refdpesobruto::text,'null');
   END IF;
   IF TG_RELNAME='referencia_despacho_pedido' THEN 
   	 textoviejo := COALESCE(OLD.refdpcodsx::text,'null') ||'-'|| COALESCE(OLD.refdpcodrefd::text,'null') ||'-'|| COALESCE(OLD.refdcodrefp::text,'null') ||'-'|| COALESCE(OLD.refdcant::text,'null') ||'-'|| COALESCE(OLD.refdvalorunit::text,'null') ||'-'|| COALESCE(OLD.refdvalortotal::text,'null') ||'-'|| COALESCE(OLD.refdpesoneto::text,'null') ||'-'|| COALESCE(OLD.refdpesobruto::text,'null') ||'-'|| COALESCE(OLD.refdpesonetototal::text,'null') ||'-'|| COALESCE(OLD.refdpesobrutototal::text,'null');
   	 textonuevo := COALESCE(NEW.refdpcodsx::text,'null') ||'-'|| COALESCE(NEW.refdpcodrefd::text,'null') ||'-'|| COALESCE(NEW.refdcodrefp::text,'null') ||'-'|| COALESCE(NEW.refdcant::text,'null') ||'-'|| COALESCE(NEW.refdvalorunit::text,'null') ||'-'|| COALESCE(NEW.refdvalortotal::text,'null') ||'-'|| COALESCE(NEW.refdpesoneto::text,'null') ||'-'|| COALESCE(NEW.refdpesobruto::text,'null') ||'-'|| COALESCE(NEW.refdpesonetototal::text,'null') ||'-'|| COALESCE(NEW.refdpesobrutototal::text,'null');
   END IF;
   IF TG_RELNAME='referencia_pedido' THEN 
   	 textoviejo := COALESCE(OLD.refpcodsx::text,'null') ||'-'|| COALESCE(OLD.refpnumpedido::text,'null') ||'-'|| COALESCE(OLD.refpproducto::text,'null') ||'-'|| COALESCE(OLD.refpbodega::text,'null') ||'-'|| COALESCE(OLD.refpposicion::text,'null') ||'-'|| COALESCE(OLD.refpcantidad::text,'null') ||'-'|| COALESCE(OLD.refpvalorunit::text,'null') ||'-'|| COALESCE(OLD.refpvalortotal::text,'null') ||'-'|| COALESCE(OLD.refpentrada::text,'null') ||'-'|| COALESCE(OLD.refpnacdetalle::text,'null') ||'-'|| COALESCE(OLD.refpsaldo::text,'null') ||'-'|| COALESCE(OLD.refppesoneto::text,'null') ||'-'|| COALESCE(OLD.refppesobruto::text,'null') ||'-'|| COALESCE(OLD.refppesonetototal::text,'null') ||'-'|| COALESCE(OLD.refppesobrutototal::text,'null');
   	 textonuevo := COALESCE(NEW.refpcodsx::text,'null') ||'-'|| COALESCE(NEW.refpnumpedido::text,'null') ||'-'|| COALESCE(NEW.refpproducto::text,'null') ||'-'|| COALESCE(NEW.refpbodega::text,'null') ||'-'|| COALESCE(NEW.refpposicion::text,'null') ||'-'|| COALESCE(NEW.refpcantidad::text,'null') ||'-'|| COALESCE(NEW.refpvalorunit::text,'null') ||'-'|| COALESCE(NEW.refpvalortotal::text,'null') ||'-'|| COALESCE(NEW.refpentrada::text,'null') ||'-'|| COALESCE(NEW.refpnacdetalle::text,'null') ||'-'|| COALESCE(NEW.refpsaldo::text,'null') ||'-'|| COALESCE(NEW.refppesoneto::text,'null') ||'-'|| COALESCE(NEW.refppesobruto::text,'null') ||'-'|| COALESCE(NEW.refppesonetototal::text,'null') ||'-'|| COALESCE(NEW.refppesobrutototal::text,'null');
   END IF;
   IF TG_RELNAME='referencia_trafico' THEN 
   	 textoviejo := COALESCE(OLD.reftcodsx::text,'null') ||'-'|| COALESCE(OLD.reftnumfacturatrafico::text,'null') ||'-'|| COALESCE(OLD.reftproducto::text,'null') ||'-'|| COALESCE(OLD.reftcantidad::text,'null') ||'-'|| COALESCE(OLD.reftpesoneto::text,'null') ||'-'|| COALESCE(OLD.reftpesobruto::text,'null') ||'-'|| COALESCE(OLD.reftfobunit::text,'null') ||'-'|| COALESCE(OLD.reftfobtotal::text,'null') ||'-'|| COALESCE(OLD.reftcifunit::text,'null') ||'-'|| COALESCE(OLD.reftciftotal::text,'null') ||'-'|| COALESCE(OLD.reftpesonetototal::text,'null') ||'-'|| COALESCE(OLD.reftpesobrutototal::text,'null') ||'-'|| COALESCE(OLD.reftmpacks::text,'null');
   	 textonuevo := COALESCE(NEW.reftcodsx::text,'null') ||'-'|| COALESCE(NEW.reftnumfacturatrafico::text,'null') ||'-'|| COALESCE(NEW.reftproducto::text,'null') ||'-'|| COALESCE(NEW.reftcantidad::text,'null') ||'-'|| COALESCE(NEW.reftpesoneto::text,'null') ||'-'|| COALESCE(NEW.reftpesobruto::text,'null') ||'-'|| COALESCE(NEW.reftfobunit::text,'null') ||'-'|| COALESCE(NEW.reftfobtotal::text,'null') ||'-'|| COALESCE(NEW.reftcifunit::text,'null') ||'-'|| COALESCE(NEW.reftciftotal::text,'null') ||'-'|| COALESCE(NEW.reftpesonetototal::text,'null') ||'-'|| COALESCE(NEW.reftpesobrutototal::text,'null') ||'-'|| COALESCE(NEW.reftmpacks::text,'null');
   END IF;
   IF TG_RELNAME='reparacion' THEN 
   	 textoviejo := COALESCE(OLD.repcodsx::text,'null') ||'-'|| COALESCE(OLD.repcodcia::text,'null') ||'-'|| COALESCE(OLD.repfecha::text,'null') ||'-'|| COALESCE(OLD.repsaldo::text,'null') ||'-'|| COALESCE(OLD.repdestino::text,'null') ||'-'|| COALESCE(OLD.repestado::text,'null') ||'-'|| COALESCE(OLD.repobservacion::text,'null') ||'-'|| COALESCE(OLD.reppedido::text,'null');
   	 textonuevo := COALESCE(NEW.repcodsx::text,'null') ||'-'|| COALESCE(NEW.repcodcia::text,'null') ||'-'|| COALESCE(NEW.repfecha::text,'null') ||'-'|| COALESCE(NEW.repsaldo::text,'null') ||'-'|| COALESCE(NEW.repdestino::text,'null') ||'-'|| COALESCE(NEW.repestado::text,'null') ||'-'|| COALESCE(NEW.repobservacion::text,'null') ||'-'|| COALESCE(NEW.reppedido::text,'null');
   END IF;
   IF TG_RELNAME='reparacion_detalle' THEN 
   	 textoviejo := COALESCE(OLD.repdcodsx::text,'null') ||'-'|| COALESCE(OLD.repdreparacion::text,'null') ||'-'|| COALESCE(OLD.repdproducto::text,'null') ||'-'|| COALESCE(OLD.repdaveria::text,'null') ||'-'|| COALESCE(OLD.repdcant_pleg::text,'null') ||'-'|| COALESCE(OLD.repdcant_prod::text,'null') ||'-'|| COALESCE(OLD.repdbodega::text,'null') ||'-'|| COALESCE(OLD.repdposicion::text,'null') ||'-'|| COALESCE(OLD.repdtiposaldo::text,'null') ||'-'|| COALESCE(OLD.repdbodega_dest::text,'null') ||'-'|| COALESCE(OLD.repdposicion_dest::text,'null');
   	 textonuevo := COALESCE(NEW.repdcodsx::text,'null') ||'-'|| COALESCE(NEW.repdreparacion::text,'null') ||'-'|| COALESCE(NEW.repdproducto::text,'null') ||'-'|| COALESCE(NEW.repdaveria::text,'null') ||'-'|| COALESCE(NEW.repdcant_pleg::text,'null') ||'-'|| COALESCE(NEW.repdcant_prod::text,'null') ||'-'|| COALESCE(NEW.repdbodega::text,'null') ||'-'|| COALESCE(NEW.repdposicion::text,'null') ||'-'|| COALESCE(NEW.repdtiposaldo::text,'null') ||'-'|| COALESCE(NEW.repdbodega_dest::text,'null') ||'-'|| COALESCE(NEW.repdposicion_dest::text,'null');
   END IF;
   IF TG_RELNAME='reparacion_nacdet' THEN 
   	 textoviejo := COALESCE(OLD.repndcodsx::text,'null') ||'-'|| COALESCE(OLD.repndrepdetalle::text,'null') ||'-'|| COALESCE(OLD.repndnacdet::text,'null') ||'-'|| COALESCE(OLD.repndcant::text,'null') ||'-'|| COALESCE(OLD.repndaverianacdet::text,'null') ||'-'|| COALESCE(OLD.repndnacdet_rep::text,'null');
   	 textonuevo := COALESCE(NEW.repndcodsx::text,'null') ||'-'|| COALESCE(NEW.repndrepdetalle::text,'null') ||'-'|| COALESCE(NEW.repndnacdet::text,'null') ||'-'|| COALESCE(NEW.repndcant::text,'null') ||'-'|| COALESCE(NEW.repndaverianacdet::text,'null') ||'-'|| COALESCE(NEW.repndnacdet_rep::text,'null');
   END IF;
   IF TG_RELNAME='reubic_nacdetalle' THEN 
   	 textoviejo := COALESCE(OLD.rencodsx::text,'null') ||'-'|| COALESCE(OLD.renreubicacion::text,'null') ||'-'|| COALESCE(OLD.renacdetalle_or::text,'null') ||'-'|| COALESCE(OLD.renacdetalle_fin::text,'null') ||'-'|| COALESCE(OLD.rencantidad::text,'null');
   	 textonuevo := COALESCE(NEW.rencodsx::text,'null') ||'-'|| COALESCE(NEW.renreubicacion::text,'null') ||'-'|| COALESCE(NEW.renacdetalle_or::text,'null') ||'-'|| COALESCE(NEW.renacdetalle_fin::text,'null') ||'-'|| COALESCE(NEW.rencantidad::text,'null');
   END IF;
   IF TG_RELNAME='reubicacion' THEN 
   	 textoviejo := COALESCE(OLD.recodsx::text,'null') ||'-'|| COALESCE(OLD.recodcia::text,'null') ||'-'|| COALESCE(OLD.reingreso::text,'null') ||'-'|| COALESCE(OLD.retipo::text,'null') ||'-'|| COALESCE(OLD.reentradaor::text,'null') ||'-'|| COALESCE(OLD.reentradafin::text,'null') ||'-'|| COALESCE(OLD.recantidad::text,'null') ||'-'|| COALESCE(OLD.reestado::text,'null') ||'-'|| COALESCE(OLD.refecha::text,'null') ||'-'|| COALESCE(OLD.retipomov::text,'null');
   	 textonuevo := COALESCE(NEW.recodsx::text,'null') ||'-'|| COALESCE(NEW.recodcia::text,'null') ||'-'|| COALESCE(NEW.reingreso::text,'null') ||'-'|| COALESCE(NEW.retipo::text,'null') ||'-'|| COALESCE(NEW.reentradaor::text,'null') ||'-'|| COALESCE(NEW.reentradafin::text,'null') ||'-'|| COALESCE(NEW.recantidad::text,'null') ||'-'|| COALESCE(NEW.reestado::text,'null') ||'-'|| COALESCE(NEW.refecha::text,'null') ||'-'|| COALESCE(NEW.retipomov::text,'null');
   END IF;
   IF TG_RELNAME='sucursal' THEN 
   	 textoviejo := COALESCE(OLD.succodsx::text,'null') ||'-'|| COALESCE(OLD.succodcliente::text,'null') ||'-'|| COALESCE(OLD.sucnit::text,'null') ||'-'|| COALESCE(OLD.sucnombre::text,'null') ||'-'|| COALESCE(OLD.succiudad::text,'null') ||'-'|| COALESCE(OLD.sucdepartamento::text,'null') ||'-'|| COALESCE(OLD.succontacto::text,'null') ||'-'|| COALESCE(OLD.succargo::text,'null') ||'-'|| COALESCE(OLD.sucemail::text,'null') ||'-'|| COALESCE(OLD.sucdireccion::text,'null') ||'-'|| COALESCE(OLD.suctelefono::text,'null') ||'-'|| COALESCE(OLD.succodigo::text,'null');
   	 textonuevo := COALESCE(NEW.succodsx::text,'null') ||'-'|| COALESCE(NEW.succodcliente::text,'null') ||'-'|| COALESCE(NEW.sucnit::text,'null') ||'-'|| COALESCE(NEW.sucnombre::text,'null') ||'-'|| COALESCE(NEW.succiudad::text,'null') ||'-'|| COALESCE(NEW.sucdepartamento::text,'null') ||'-'|| COALESCE(NEW.succontacto::text,'null') ||'-'|| COALESCE(NEW.succargo::text,'null') ||'-'|| COALESCE(NEW.sucemail::text,'null') ||'-'|| COALESCE(NEW.sucdireccion::text,'null') ||'-'|| COALESCE(NEW.suctelefono::text,'null') ||'-'|| COALESCE(NEW.succodigo::text,'null');
   END IF;
   IF TG_RELNAME='trafico' THEN 
   	 textoviejo := COALESCE(OLD.trafcodsx::text,'null') ||'-'|| COALESCE(OLD.trafcompania::text,'null') ||'-'|| COALESCE(OLD.traffechacreacion::text,'null') ||'-'|| COALESCE(OLD.trafdocumento::text,'null') ||'-'|| COALESCE(OLD.trafembarque::text,'null') ||'-'|| COALESCE(OLD.traftransportadora::text,'null') ||'-'|| COALESCE(OLD.trafprocedencia::text,'null') ||'-'|| COALESCE(OLD.traffechaarribopuerto::text,'null') ||'-'|| COALESCE(OLD.traffechapresentdta::text,'null') ||'-'|| COALESCE(OLD.traffechaaprobaciondta::text,'null') ||'-'|| COALESCE(OLD.traffob::text,'null') ||'-'|| COALESCE(OLD.trafcif::text,'null') ||'-'|| COALESCE(OLD.trafconsec::text,'null') ||'-'|| COALESCE(OLD.trafnumerofmm::text,'null') ||'-'|| COALESCE(OLD.traftrm::text,'null') ||'-'|| COALESCE(OLD.trafnumdta::text,'null') ||'-'|| COALESCE(OLD.trafnumsobordo::text,'null') ||'-'|| COALESCE(OLD.traffechadescargue::text,'null') ||'-'|| COALESCE(OLD.traffechalevante::text,'null') ||'-'|| COALESCE(OLD.traffechaingresozf::text,'null') ||'-'|| COALESCE(OLD.trafentregadocusia::text,'null') ||'-'|| COALESCE(OLD.trafobservaciones::text,'null') ||'-'|| COALESCE(OLD.trafpesobruto::text,'null') ||'-'|| COALESCE(OLD.trafusuario::text,'null') ||'-'|| COALESCE(OLD.traffechasobordo::text,'null') ||'-'|| COALESCE(OLD.traforigen::text,'null') ||'-'|| COALESCE(OLD.trafpesoneto::text,'null') ||'-'|| COALESCE(OLD.traffletesseguro::text,'null') ||'-'|| COALESCE(OLD.trafestado::text,'null') ||'-'|| COALESCE(OLD.trafcantidad::text,'null') ||'-'|| COALESCE(OLD.trafpedido::text,'null') ||'-'|| COALESCE(OLD.trafmotonave::text,'null');
   	 textonuevo := COALESCE(NEW.trafcodsx::text,'null') ||'-'|| COALESCE(NEW.trafcompania::text,'null') ||'-'|| COALESCE(NEW.traffechacreacion::text,'null') ||'-'|| COALESCE(NEW.trafdocumento::text,'null') ||'-'|| COALESCE(NEW.trafembarque::text,'null') ||'-'|| COALESCE(NEW.traftransportadora::text,'null') ||'-'|| COALESCE(NEW.trafprocedencia::text,'null') ||'-'|| COALESCE(NEW.traffechaarribopuerto::text,'null') ||'-'|| COALESCE(NEW.traffechapresentdta::text,'null') ||'-'|| COALESCE(NEW.traffechaaprobaciondta::text,'null') ||'-'|| COALESCE(NEW.traffob::text,'null') ||'-'|| COALESCE(NEW.trafcif::text,'null') ||'-'|| COALESCE(NEW.trafconsec::text,'null') ||'-'|| COALESCE(NEW.trafnumerofmm::text,'null') ||'-'|| COALESCE(NEW.traftrm::text,'null') ||'-'|| COALESCE(NEW.trafnumdta::text,'null') ||'-'|| COALESCE(NEW.trafnumsobordo::text,'null') ||'-'|| COALESCE(NEW.traffechadescargue::text,'null') ||'-'|| COALESCE(NEW.traffechalevante::text,'null') ||'-'|| COALESCE(NEW.traffechaingresozf::text,'null') ||'-'|| COALESCE(NEW.trafentregadocusia::text,'null') ||'-'|| COALESCE(NEW.trafobservaciones::text,'null') ||'-'|| COALESCE(NEW.trafpesobruto::text,'null') ||'-'|| COALESCE(NEW.trafusuario::text,'null') ||'-'|| COALESCE(NEW.traffechasobordo::text,'null') ||'-'|| COALESCE(NEW.traforigen::text,'null') ||'-'|| COALESCE(NEW.trafpesoneto::text,'null') ||'-'|| COALESCE(NEW.traffletesseguro::text,'null') ||'-'|| COALESCE(NEW.trafestado::text,'null') ||'-'|| COALESCE(NEW.trafcantidad::text,'null') ||'-'|| COALESCE(NEW.trafpedido::text,'null') ||'-'|| COALESCE(NEW.trafmotonave::text,'null');
   END IF;
   IF TG_RELNAME='transportadora' THEN 
   	 textoviejo := COALESCE(OLD.transpcodsx::text,'null') ||'-'|| COALESCE(OLD.transpnombre::text,'null') ||'-'|| COALESCE(OLD.transpdireccion::text,'null') ||'-'|| COALESCE(OLD.transptel::text,'null') ||'-'|| COALESCE(OLD.transpmail::text,'null') ||'-'|| COALESCE(OLD.transpcontacto::text,'null');
   	 textonuevo := COALESCE(NEW.transpcodsx::text,'null') ||'-'|| COALESCE(NEW.transpnombre::text,'null') ||'-'|| COALESCE(NEW.transpdireccion::text,'null') ||'-'|| COALESCE(NEW.transptel::text,'null') ||'-'|| COALESCE(NEW.transpmail::text,'null') ||'-'|| COALESCE(NEW.transpcontacto::text,'null');
   END IF;
   IF TG_RELNAME='unidad' THEN 
   	 textoviejo := COALESCE(OLD.unicod::text,'null') ||'-'|| COALESCE(OLD.unidesc::text,'null');
   	 textonuevo := COALESCE(NEW.unicod::text,'null') ||'-'|| COALESCE(NEW.unidesc::text,'null');
   END IF;
   IF TG_RELNAME='usuario' THEN 
   	 textoviejo := COALESCE(OLD.usucodsx::text,'null') ||'-'|| COALESCE(OLD.usunombre::text,'null') ||'-'|| COALESCE(OLD.usulogin::text,'null') ||'-'|| COALESCE(OLD.usuclave::text,'null') ||'-'|| COALESCE(OLD.usumail::text,'null') ||'-'|| COALESCE(OLD.usugrupo::text,'null') ||'-'|| COALESCE(OLD.usucompania::text,'null') ||'-'|| COALESCE(OLD.usucodcliente::text,'null');
   	 textonuevo := COALESCE(NEW.usucodsx::text,'null') ||'-'|| COALESCE(NEW.usunombre::text,'null') ||'-'|| COALESCE(NEW.usulogin::text,'null') ||'-'|| COALESCE(NEW.usuclave::text,'null') ||'-'|| COALESCE(NEW.usumail::text,'null') ||'-'|| COALESCE(NEW.usugrupo::text,'null') ||'-'|| COALESCE(NEW.usucompania::text,'null') ||'-'|| COALESCE(NEW.usucodcliente::text,'null');
   END IF;
   IF TG_RELNAME='zona' THEN 
   	 textoviejo := COALESCE(OLD.zoncodsx::text,'null') ||'-'|| COALESCE(OLD.zonnombre::text,'null');
   	 textonuevo := COALESCE(NEW.zoncodsx::text,'null') ||'-'|| COALESCE(NEW.zonnombre::text,'null');
   END IF;
   IF TG_RELNAME='tipoproducto' THEN 
   	 textoviejo := COALESCE(OLD.tiprcodsx::text,'null') ||'-'|| COALESCE(OLD.tiprdescripcion::text,'null') ||'-'|| COALESCE(OLD.tiprcodcompania::text,'null') ||'-'|| COALESCE(OLD.tiprcodigo::text,'null');
   	 textonuevo := COALESCE(NEW.tiprcodsx::text,'null') ||'-'|| COALESCE(NEW.tiprdescripcion::text,'null') ||'-'|| COALESCE(NEW.tiprcodcompania::text,'null') ||'-'|| COALESCE(NEW.tiprcodigo::text,'null');
   END IF;
END IF;

INSERT INTO auditoria(auditipo,audifecha,audiusuario,audiip,auditabla,audinuevo,audiviejo) VALUES(TG_OP,NOW(),CURRENT_USER,inet_client_addr()::text,TG_RELNAME,textonuevo,textoviejo);

IF TG_OP='DELETE' THEN
  RETURN OLD;
ELSE
  RETURN NEW;
END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.auditor() OWNER TO usersgl;

--
-- TOC entry 62 (class 1255 OID 16566)
-- Dependencies: 517 7 517 517
-- Name: concat(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION concat(tsvector, tsvector) RETURNS tsvector
    AS '$libdir/tsearch2', 'concat'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.concat(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 25 (class 1255 OID 16415)
-- Dependencies: 7
-- Name: dex_init(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dex_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'dex_init'
    LANGUAGE c;


ALTER FUNCTION public.dex_init(internal) OWNER TO postgres;

--
-- TOC entry 26 (class 1255 OID 16416)
-- Dependencies: 7
-- Name: dex_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dex_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'dex_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dex_lexize(internal, internal, integer) OWNER TO postgres;

--
-- TOC entry 72 (class 1255 OID 16579)
-- Dependencies: 517 7 520
-- Name: exectsq(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION exectsq(tsvector, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'exectsq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.exectsq(tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 72
-- Name: FUNCTION exectsq(tsvector, tsquery); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION exectsq(tsvector, tsquery) IS 'boolean operation with text index';


--
-- TOC entry 261 (class 1255 OID 24035)
-- Dependencies: 787 553 7
-- Name: fc_get_kardsaldonac(integer, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: usersgl
--

CREATE FUNCTION fc_get_kardsaldonac(integer, timestamp without time zone) RETURNS SETOF movimiento.tp_kardex
    AS $_$
   DECLARE
   result   RECORD;
   result2  RECORD;
   result3  RECORD;
   list    movimiento.tp_kardex;
   idporoducto  ALIAS FOR $1;
   fecha_final  ALIAS FOR $2;
   BEGIN
      SELECT  INTO result
      CASE WHEN  kardex.kardsaldonac  IS NULL THEN 0 ELSE kardex.kardsaldonac  END  ,
      CASE WHEN  kardex.kardsaldonnac IS NULL THEN 0 ELSE kardex.kardsaldonnac END
      FROM   movimiento.kardex
      WHERE  kardcodproducto = idporoducto AND
             kardfecha <= fecha_final
       ORDER BY  kardfecha DESC, kardcodsx DESC
       limit 1;

     --SELECT INTO result2
     --  CASE  WHEN movimiento.averia.avesaldo_pleg_nac IS NULL THEN 0 ELSE movimiento.averia.avesaldo_pleg_nac END
     -- ,CASE  WHEN movimiento.averia.avesaldo_prod_nac IS NULL THEN 0 ELSE movimiento.averia.avesaldo_prod_nac END
     -- FROM  movimiento.averia
     -- WHERE aveproducto=idporoducto AND
     --       avefecha<=fecha_final
     -- ORDER BY avefecha DESC, avecodsx DESC limit 1;

	SELECT INTO result2
	CASE WHEN sum(movimiento.averia.avesaldo_pleg_nac) IS NULL THEN 0 ELSE sum(movimiento.averia.avesaldo_pleg_nac) END as avesaldo_pleg_nac,
        CASE WHEN sum(movimiento.averia.avesaldo_prod_nac) IS NULL THEN 0 ELSE sum(movimiento.averia.avesaldo_prod_nac) END as avesaldo_prod_nac
        FROM  movimiento.averia
        WHERE aveproducto=idporoducto AND
              avefecha<=fecha_final LIMIT 1;


      --SELECT INTO result3
      -- CASE  WHEN movimiento.entrada.entsaldonac IS NULL THEN 0 ELSE movimiento.entrada.entsaldonac END
      --,CASE  WHEN movimiento.entrada.entsaldonacf  IS NULL THEN 0 ELSE movimiento.entrada.entsaldonacf  END
      --FROM  movimiento.entrada
      --WHERE entcodproducto=idporoducto AND
      --      entfecha<=fecha_final
      --ORDER BY entfecha DESC, entcodsx DESC limit 1;

	SELECT INTO result3
	CASE WHEN sum(movimiento.entrada.entsaldonac) IS NULL THEN 0 ELSE sum(movimiento.entrada.entsaldonac) END as entsaldonac, 
	CASE WHEN sum(movimiento.entrada.entsaldonacf)IS NULL THEN 0 ELSE sum(movimiento.entrada.entsaldonacf)END as entsaldonacf
	FROM movimiento.entrada
	WHERE entcodproducto=idporoducto AND
	      entfecha<=fecha_final LIMIT 1;

     -- RAISE NOTICE '%',result.kardsaldonac;
      list.kardsaldonac=result.kardsaldonac;
      list.kardsaldonnac=result.kardsaldonnac;

      list.avesaldo_pleg_nac=result2.avesaldo_pleg_nac;
      list.avecant_prod_nac =result2.avesaldo_prod_nac;
      
      list.entsaldonac=result3.entsaldonac;
      list.entsaldonacf =result3.entsaldonacf;

      RETURN next list;
   END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.fc_get_kardsaldonac(integer, timestamp without time zone) OWNER TO usersgl;

--
-- TOC entry 101 (class 1255 OID 16615)
-- Dependencies: 7 517 520
-- Name: get_covers(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION get_covers(tsvector, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'get_covers'
    LANGUAGE c STRICT;


ALTER FUNCTION public.get_covers(tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 262 (class 1255 OID 24036)
-- Dependencies: 787 7
-- Name: getultimodiames(date); Type: FUNCTION; Schema: public; Owner: usersgl
--

CREATE FUNCTION getultimodiames(date) RETURNS timestamp without time zone
    AS $_$begin

return  date_trunc('month', $1 + '1 month'::interval) - '1 day'::interval + time '23:59:00';

end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.getultimodiames(date) OWNER TO usersgl;

--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 262
-- Name: FUNCTION getultimodiames(date); Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON FUNCTION getultimodiames(date) IS 'Funcion utilizada en el modulo de reportes para obtener el ultimo dia de un mes determinado y poder obtener reportes por meses';


--
-- TOC entry 138 (class 1255 OID 16679)
-- Dependencies: 7 520
-- Name: gin_extract_tsquery(tsquery, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gin_extract_tsquery(tsquery, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gin_extract_tsquery'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gin_extract_tsquery(tsquery, internal, internal) OWNER TO postgres;

--
-- TOC entry 137 (class 1255 OID 16678)
-- Dependencies: 517 7
-- Name: gin_extract_tsvector(tsvector, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gin_extract_tsvector(tsvector, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gin_extract_tsvector'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gin_extract_tsvector(tsvector, internal) OWNER TO postgres;

--
-- TOC entry 139 (class 1255 OID 16680)
-- Dependencies: 7 520
-- Name: gin_ts_consistent(internal, internal, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gin_ts_consistent(internal, internal, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'gin_ts_consistent'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gin_ts_consistent(internal, internal, tsquery) OWNER TO postgres;

--
-- TOC entry 131 (class 1255 OID 16671)
-- Dependencies: 7
-- Name: gtsq_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_compress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_compress'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_compress(internal) OWNER TO postgres;

--
-- TOC entry 130 (class 1255 OID 16670)
-- Dependencies: 7 528
-- Name: gtsq_consistent(gtsq, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_consistent(gtsq, internal, integer) RETURNS boolean
    AS '$libdir/tsearch2', 'gtsq_consistent'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_consistent(gtsq, internal, integer) OWNER TO postgres;

--
-- TOC entry 132 (class 1255 OID 16672)
-- Dependencies: 7
-- Name: gtsq_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_decompress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_decompress'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_decompress(internal) OWNER TO postgres;

--
-- TOC entry 133 (class 1255 OID 16673)
-- Dependencies: 7
-- Name: gtsq_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsq_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 134 (class 1255 OID 16674)
-- Dependencies: 7
-- Name: gtsq_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_picksplit(internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 136 (class 1255 OID 16676)
-- Dependencies: 7 528 528
-- Name: gtsq_same(gtsq, gtsq, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_same(gtsq, gtsq, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_same'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_same(gtsq, gtsq, internal) OWNER TO postgres;

--
-- TOC entry 135 (class 1255 OID 16675)
-- Dependencies: 7
-- Name: gtsq_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_union(bytea, internal) RETURNS integer[]
    AS '$libdir/tsearch2', 'gtsq_union'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_union(bytea, internal) OWNER TO postgres;

--
-- TOC entry 92 (class 1255 OID 16603)
-- Dependencies: 7
-- Name: gtsvector_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_compress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_compress'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_compress(internal) OWNER TO postgres;

--
-- TOC entry 91 (class 1255 OID 16602)
-- Dependencies: 523 7
-- Name: gtsvector_consistent(gtsvector, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_consistent(gtsvector, internal, integer) RETURNS boolean
    AS '$libdir/tsearch2', 'gtsvector_consistent'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_consistent(gtsvector, internal, integer) OWNER TO postgres;

--
-- TOC entry 93 (class 1255 OID 16604)
-- Dependencies: 7
-- Name: gtsvector_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_decompress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_decompress'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_decompress(internal) OWNER TO postgres;

--
-- TOC entry 94 (class 1255 OID 16605)
-- Dependencies: 7
-- Name: gtsvector_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsvector_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 95 (class 1255 OID 16606)
-- Dependencies: 7
-- Name: gtsvector_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_picksplit(internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 97 (class 1255 OID 16608)
-- Dependencies: 523 523 7
-- Name: gtsvector_same(gtsvector, gtsvector, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_same(gtsvector, gtsvector, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_same'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_same(gtsvector, gtsvector, internal) OWNER TO postgres;

--
-- TOC entry 96 (class 1255 OID 16607)
-- Dependencies: 7
-- Name: gtsvector_union(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_union(internal, internal) RETURNS integer[]
    AS '$libdir/tsearch2', 'gtsvector_union'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_union(internal, internal) OWNER TO postgres;

--
-- TOC entry 83 (class 1255 OID 16592)
-- Dependencies: 520 7
-- Name: headline(oid, text, tsquery, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(oid, text, tsquery, text) RETURNS text
    AS '$libdir/tsearch2', 'headline'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(oid, text, tsquery, text) OWNER TO postgres;

--
-- TOC entry 84 (class 1255 OID 16593)
-- Dependencies: 7 520
-- Name: headline(oid, text, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(oid, text, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'headline'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(oid, text, tsquery) OWNER TO postgres;

--
-- TOC entry 85 (class 1255 OID 16594)
-- Dependencies: 520 7
-- Name: headline(text, text, tsquery, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(text, text, tsquery, text) RETURNS text
    AS '$libdir/tsearch2', 'headline_byname'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(text, text, tsquery, text) OWNER TO postgres;

--
-- TOC entry 86 (class 1255 OID 16595)
-- Dependencies: 520 7
-- Name: headline(text, text, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(text, text, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'headline_byname'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(text, text, tsquery) OWNER TO postgres;

--
-- TOC entry 87 (class 1255 OID 16596)
-- Dependencies: 520 7
-- Name: headline(text, tsquery, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(text, tsquery, text) RETURNS text
    AS '$libdir/tsearch2', 'headline_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(text, tsquery, text) OWNER TO postgres;

--
-- TOC entry 88 (class 1255 OID 16597)
-- Dependencies: 7 520
-- Name: headline(text, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(text, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'headline_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(text, tsquery) OWNER TO postgres;

--
-- TOC entry 56 (class 1255 OID 16560)
-- Dependencies: 7 517
-- Name: length(tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION length(tsvector) RETURNS integer
    AS '$libdir/tsearch2', 'tsvector_length'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.length(tsvector) OWNER TO postgres;

--
-- TOC entry 20 (class 1255 OID 16410)
-- Dependencies: 7
-- Name: lexize(oid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lexize(oid, text) RETURNS text[]
    AS '$libdir/tsearch2', 'lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.lexize(oid, text) OWNER TO postgres;

--
-- TOC entry 21 (class 1255 OID 16411)
-- Dependencies: 7
-- Name: lexize(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lexize(text, text) RETURNS text[]
    AS '$libdir/tsearch2', 'lexize_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.lexize(text, text) OWNER TO postgres;

--
-- TOC entry 22 (class 1255 OID 16412)
-- Dependencies: 7
-- Name: lexize(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lexize(text) RETURNS text[]
    AS '$libdir/tsearch2', 'lexize_bycurrent'
    LANGUAGE c STRICT;


ALTER FUNCTION public.lexize(text) OWNER TO postgres;

--
-- TOC entry 118 (class 1255 OID 16648)
-- Dependencies: 520 7
-- Name: numnode(tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION numnode(tsquery) RETURNS integer
    AS '$libdir/tsearch2', 'tsquery_numnode'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.numnode(tsquery) OWNER TO postgres;

--
-- TOC entry 43 (class 1255 OID 16450)
-- Dependencies: 7 512
-- Name: parse(oid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION parse(oid, text) RETURNS SETOF tokenout
    AS '$libdir/tsearch2', 'parse'
    LANGUAGE c STRICT;


ALTER FUNCTION public.parse(oid, text) OWNER TO postgres;

--
-- TOC entry 44 (class 1255 OID 16451)
-- Dependencies: 7 512
-- Name: parse(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION parse(text, text) RETURNS SETOF tokenout
    AS '$libdir/tsearch2', 'parse_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.parse(text, text) OWNER TO postgres;

--
-- TOC entry 45 (class 1255 OID 16452)
-- Dependencies: 7 512
-- Name: parse(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION parse(text) RETURNS SETOF tokenout
    AS '$libdir/tsearch2', 'parse_current'
    LANGUAGE c STRICT;


ALTER FUNCTION public.parse(text) OWNER TO postgres;

--
-- TOC entry 69 (class 1255 OID 16576)
-- Dependencies: 7 520
-- Name: plainto_tsquery(oid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION plainto_tsquery(oid, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'plainto_tsquery'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.plainto_tsquery(oid, text) OWNER TO postgres;

--
-- TOC entry 70 (class 1255 OID 16577)
-- Dependencies: 7 520
-- Name: plainto_tsquery(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION plainto_tsquery(text, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'plainto_tsquery_name'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.plainto_tsquery(text, text) OWNER TO postgres;

--
-- TOC entry 71 (class 1255 OID 16578)
-- Dependencies: 520 7
-- Name: plainto_tsquery(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION plainto_tsquery(text) RETURNS tsquery
    AS '$libdir/tsearch2', 'plainto_tsquery_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.plainto_tsquery(text) OWNER TO postgres;

--
-- TOC entry 263 (class 1255 OID 24037)
-- Dependencies: 7
-- Name: plpgsql_call_handler(); Type: FUNCTION; Schema: public; Owner: usersgl
--

CREATE FUNCTION plpgsql_call_handler() RETURNS language_handler
    AS '$libdir/plpgsql', 'plpgsql_call_handler'
    LANGUAGE c;


ALTER FUNCTION public.plpgsql_call_handler() OWNER TO usersgl;

--
-- TOC entry 48 (class 1255 OID 16455)
-- Dependencies: 7
-- Name: prsd_end(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION prsd_end(internal) RETURNS void
    AS '$libdir/tsearch2', 'prsd_end'
    LANGUAGE c;


ALTER FUNCTION public.prsd_end(internal) OWNER TO postgres;

--
-- TOC entry 47 (class 1255 OID 16454)
-- Dependencies: 7
-- Name: prsd_getlexeme(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION prsd_getlexeme(internal, internal, internal) RETURNS integer
    AS '$libdir/tsearch2', 'prsd_getlexeme'
    LANGUAGE c;


ALTER FUNCTION public.prsd_getlexeme(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 50 (class 1255 OID 16457)
-- Dependencies: 7
-- Name: prsd_headline(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION prsd_headline(internal, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'prsd_headline'
    LANGUAGE c;


ALTER FUNCTION public.prsd_headline(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 49 (class 1255 OID 16456)
-- Dependencies: 7
-- Name: prsd_lextype(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION prsd_lextype(internal) RETURNS internal
    AS '$libdir/tsearch2', 'prsd_lextype'
    LANGUAGE c;


ALTER FUNCTION public.prsd_lextype(internal) OWNER TO postgres;

--
-- TOC entry 46 (class 1255 OID 16453)
-- Dependencies: 7
-- Name: prsd_start(internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION prsd_start(internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'prsd_start'
    LANGUAGE c;


ALTER FUNCTION public.prsd_start(internal, integer) OWNER TO postgres;

--
-- TOC entry 65 (class 1255 OID 16572)
-- Dependencies: 7 520
-- Name: querytree(tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION querytree(tsquery) RETURNS text
    AS '$libdir/tsearch2', 'tsquerytree'
    LANGUAGE c STRICT;


ALTER FUNCTION public.querytree(tsquery) OWNER TO postgres;

--
-- TOC entry 75 (class 1255 OID 16584)
-- Dependencies: 7 520 517
-- Name: rank(real[], tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank(real[], tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank(real[], tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 76 (class 1255 OID 16585)
-- Dependencies: 517 520 7
-- Name: rank(real[], tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank(real[], tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank(real[], tsvector, tsquery, integer) OWNER TO postgres;

--
-- TOC entry 77 (class 1255 OID 16586)
-- Dependencies: 517 7 520
-- Name: rank(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank(tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank_def'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank(tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 78 (class 1255 OID 16587)
-- Dependencies: 520 7 517
-- Name: rank(tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank(tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank_def'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank(tsvector, tsquery, integer) OWNER TO postgres;

--
-- TOC entry 79 (class 1255 OID 16588)
-- Dependencies: 517 7 520
-- Name: rank_cd(real[], tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank_cd(real[], tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank_cd(real[], tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 80 (class 1255 OID 16589)
-- Dependencies: 520 7 517
-- Name: rank_cd(real[], tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank_cd(real[], tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank_cd(real[], tsvector, tsquery, integer) OWNER TO postgres;

--
-- TOC entry 81 (class 1255 OID 16590)
-- Dependencies: 517 7 520
-- Name: rank_cd(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank_cd(tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd_def'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank_cd(tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 82 (class 1255 OID 16591)
-- Dependencies: 520 7 517
-- Name: rank_cd(tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank_cd(tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd_def'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank_cd(tsvector, tsquery, integer) OWNER TO postgres;

--
-- TOC entry 100 (class 1255 OID 16614)
-- Dependencies: 7
-- Name: reset_tsearch(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION reset_tsearch() RETURNS void
    AS '$libdir/tsearch2', 'reset_tsearch'
    LANGUAGE c STRICT;


ALTER FUNCTION public.reset_tsearch() OWNER TO postgres;

--
-- TOC entry 264 (class 1255 OID 24038)
-- Dependencies: 787 7
-- Name: resumen(); Type: FUNCTION; Schema: public; Owner: usersgl
--

CREATE FUNCTION resumen() RETURNS "trigger"
    AS $$--
--Trigger que permite llenar el campo "resumen" de la tablas DEL ESQUEMA PUBLICcon 
--los datos principales, usado para las busquedas.
--Cuando se haga un select * from TABLA, y se reciban parametros, estos seran
--consultados en la columna resumen
--
--SOLO SE HACE CON EL CREATE Y EL UPTADE
DECLARE
res varchar;
rec record; -- registro de la tabla
temp1 record;
temp2 record;
temp3 record;

BEGIN

IF TG_RELNAME='usuario' THEN
res = new.usucodsx ||' ' || new.usunombre ||' ' || new.usulogin ||' ' ||new.usumail;
END IF;

IF TG_RELNAME='grupo' THEN
res = new.gcodsx ||' ' || new.gnombre;
END IF;

IF TG_RELNAME='permiso' THEN
select into temp1 * from grupo where gcodsx = new.pergrupo;
res = new.percodsx ||' ' || new.perapp  ||' ' ||  new.permodulo || ' ' || temp1.gnombre;
END IF;

IF TG_RELNAME='compania' THEN
select into temp1 * from ciudad where ciucodigo =new.comciudad ;
res = new.comcodsx ||' ' || new.comnombre||' ' ||  temp1.ciunombre ||' ' ||  NEW.comnit;
END IF;

IF TG_RELNAME='categoria' THEN
select into temp1 * from compania where comcodsx =new.catcodcompania ;
res = new.catcodsx ||' ' || new.catdescripcion||' ' ||  new.catnombre ||' ' || temp1.comnombre;
END IF;

IF TG_RELNAME='producto' THEN
select into temp1 * from compania where comcodsx =new.procodigocia;
select into temp2 * from categoria where catcodsx =new.procategoria;
select into temp3 * from tipoproducto where tiprcodsx =new.protipoproducto;
res = new.procodsx ||' ' || new.prodescripcion||' ' ||  new.promodelo ||' ' || temp1.comnombre ||' ' ||  temp2.catnombre  ||' ' ||  new.prosubpartida ||' ' || new.proestado ||' ' ||  temp3.tiprdescripcion;
END IF;

IF TG_RELNAME='cliente' THEN
select into temp1 * from compania where comcodsx =new.clicodcompania;
res = new.clicodsx||' ' || new.clinombre||' ' ||  coalesce(new.clinit ,'') ||' ' || temp1.comnombre ||' ' || new.clicodigo;
END IF;

IF TG_RELNAME='sucursal' THEN
select into temp1 * from cliente where clicodsx =new.succodcliente;
select into temp2 * from ciudad where ciucodigo = new.succiudad;
res = new.succodsx||' ' || new.sucnit||' ' ||  new.sucnombre||' ' || 
	temp1.clinombre ||' ' || new.succodigo ||' ' || new.sucdireccion 
	||' ' ||  temp2.ciunombre;
END IF;

IF TG_RELNAME='ciudad' THEN
select into temp1 * from departamento where depcodigo=new.ciudepto;
res = new.ciucodigo||' ' || new.ciunombre||' ' ||  temp1.depnombre;
END IF;

IF TG_RELNAME='departamento' THEN
select into temp1 * from zona where zoncodsx = new.depzona;
res = new.depcodigo||' ' || new.depnombre||' ' ||  coalesce('',temp1.zonnombre);
END IF;

IF TG_RELNAME='zona' THEN
res = new.zoncodsx ||' ' || new.zonnombre;
END IF;

IF TG_RELNAME='transportadora' THEN
res = new.transpcodsx ||' ' || new.transpnombre;
END IF;

IF TG_RELNAME='bodega' THEN
res = new.bodcodsx ||' ' || new.bodnombre;
END IF;

IF TG_RELNAME='empleado' THEN
res = new.empcodsx ||' ' || new.empnombre ||' ' || new.empcedula;
END IF;

IF TG_RELNAME='flete' THEN
select into temp1 * from ciudad where ciucodigo = new.fleciudad;
select into temp2 * from transportadora where transpcodsx = new.fletransportadora;
res = new.flecodsx ||' ' || temp1.ciunombre ||' ' || new.fleciudad  ||' ' ||  temp2.transpnombre;
END IF;

IF TG_RELNAME='causal' THEN
res = new.caucodsx ||' ' || new.caudesc ||' ' ||  new.cauresponsable;
END IF;

IF TG_RELNAME='causal_hit' THEN
res = new.cauhcodsx ||' ' || new.cauhdesc ||' ' ||  new.cauresp;
END IF;

IF TG_RELNAME='faq' THEN
res = new.faqcodsx ||' ' || new.faqpregunta ||' ' ||  new.faqrespcorta ||' ' ||  new.faqresplarga;
END IF;

IF TG_RELNAME='producto_cliente' THEN
select into temp1 * from producto where procodsx = new.procproducto;
res = new.proccodsx ||' ' || temp1.promodelo ||' ' || temp1.prodescripcion;
END IF;

IF TG_RELNAME='tipoproducto' THEN
select into temp1 * from compania where comcodsx =new.tiprcodcompania ;
res = new.tiprcodsx ||' ' || new.tiprdescripcion||' ' ||  new.tiprcodigo ||' ' || temp1.comnombre;
END IF;

IF TG_RELNAME='numfactura' THEN
select into temp1 * from empresa where empcodsx =new.nfempresa;
res = new.nfestado ||' ' || new.nffecha||' ' ||  new.nfinicio ||' ' || temp1.empnombre;
END IF;

res = upper(res);
new.resumen := res;
return new;


END;

$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.resumen() OWNER TO usersgl;

--
-- TOC entry 122 (class 1255 OID 16655)
-- Dependencies: 520 520 7
-- Name: rewrite(tsquery, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rewrite(tsquery, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_rewrite'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rewrite(tsquery, text) OWNER TO postgres;

--
-- TOC entry 123 (class 1255 OID 16656)
-- Dependencies: 520 520 520 520 7
-- Name: rewrite(tsquery, tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rewrite(tsquery, tsquery, tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_rewrite_query'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rewrite(tsquery, tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 124 (class 1255 OID 16657)
-- Dependencies: 520 7 522 520
-- Name: rewrite_accum(tsquery, tsquery[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rewrite_accum(tsquery, tsquery[]) RETURNS tsquery
    AS '$libdir/tsearch2', 'rewrite_accum'
    LANGUAGE c;


ALTER FUNCTION public.rewrite_accum(tsquery, tsquery[]) OWNER TO postgres;

--
-- TOC entry 125 (class 1255 OID 16658)
-- Dependencies: 520 520 7
-- Name: rewrite_finish(tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rewrite_finish(tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'rewrite_finish'
    LANGUAGE c;


ALTER FUNCTION public.rewrite_finish(tsquery) OWNER TO postgres;

--
-- TOC entry 73 (class 1255 OID 16580)
-- Dependencies: 517 520 7
-- Name: rexectsq(tsquery, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rexectsq(tsquery, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'rexectsq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rexectsq(tsquery, tsvector) OWNER TO postgres;

--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 73
-- Name: FUNCTION rexectsq(tsquery, tsvector); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION rexectsq(tsquery, tsvector) IS 'boolean operation with text index';


--
-- TOC entry 51 (class 1255 OID 16473)
-- Dependencies: 7
-- Name: set_curcfg(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curcfg(integer) RETURNS void
    AS '$libdir/tsearch2', 'set_curcfg'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curcfg(integer) OWNER TO postgres;

--
-- TOC entry 52 (class 1255 OID 16474)
-- Dependencies: 7
-- Name: set_curcfg(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curcfg(text) RETURNS void
    AS '$libdir/tsearch2', 'set_curcfg_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curcfg(text) OWNER TO postgres;

--
-- TOC entry 23 (class 1255 OID 16413)
-- Dependencies: 7
-- Name: set_curdict(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curdict(integer) RETURNS void
    AS '$libdir/tsearch2', 'set_curdict'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curdict(integer) OWNER TO postgres;

--
-- TOC entry 24 (class 1255 OID 16414)
-- Dependencies: 7
-- Name: set_curdict(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curdict(text) RETURNS void
    AS '$libdir/tsearch2', 'set_curdict_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curdict(text) OWNER TO postgres;

--
-- TOC entry 41 (class 1255 OID 16446)
-- Dependencies: 7
-- Name: set_curprs(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curprs(integer) RETURNS void
    AS '$libdir/tsearch2', 'set_curprs'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curprs(integer) OWNER TO postgres;

--
-- TOC entry 42 (class 1255 OID 16447)
-- Dependencies: 7
-- Name: set_curprs(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curprs(text) RETURNS void
    AS '$libdir/tsearch2', 'set_curprs_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curprs(text) OWNER TO postgres;

--
-- TOC entry 61 (class 1255 OID 16565)
-- Dependencies: 517 7 517
-- Name: setweight(tsvector, "char"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION setweight(tsvector, "char") RETURNS tsvector
    AS '$libdir/tsearch2', 'setweight'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.setweight(tsvector, "char") OWNER TO postgres;

--
-- TOC entry 53 (class 1255 OID 16475)
-- Dependencies: 7
-- Name: show_curcfg(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION show_curcfg() RETURNS oid
    AS '$libdir/tsearch2', 'show_curcfg'
    LANGUAGE c STRICT;


ALTER FUNCTION public.show_curcfg() OWNER TO postgres;

--
-- TOC entry 27 (class 1255 OID 16418)
-- Dependencies: 7
-- Name: snb_en_init(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION snb_en_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'snb_en_init'
    LANGUAGE c;


ALTER FUNCTION public.snb_en_init(internal) OWNER TO postgres;

--
-- TOC entry 28 (class 1255 OID 16419)
-- Dependencies: 7
-- Name: snb_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION snb_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'snb_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.snb_lexize(internal, internal, integer) OWNER TO postgres;

--
-- TOC entry 29 (class 1255 OID 16421)
-- Dependencies: 7
-- Name: snb_ru_init_koi8(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION snb_ru_init_koi8(internal) RETURNS internal
    AS '$libdir/tsearch2', 'snb_ru_init_koi8'
    LANGUAGE c;


ALTER FUNCTION public.snb_ru_init_koi8(internal) OWNER TO postgres;

--
-- TOC entry 30 (class 1255 OID 16423)
-- Dependencies: 7
-- Name: snb_ru_init_utf8(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION snb_ru_init_utf8(internal) RETURNS internal
    AS '$libdir/tsearch2', 'snb_ru_init_utf8'
    LANGUAGE c;


ALTER FUNCTION public.snb_ru_init_utf8(internal) OWNER TO postgres;

--
-- TOC entry 31 (class 1255 OID 16425)
-- Dependencies: 7
-- Name: spell_init(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION spell_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'spell_init'
    LANGUAGE c;


ALTER FUNCTION public.spell_init(internal) OWNER TO postgres;

--
-- TOC entry 32 (class 1255 OID 16426)
-- Dependencies: 7
-- Name: spell_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION spell_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'spell_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.spell_lexize(internal, internal, integer) OWNER TO postgres;

--
-- TOC entry 98 (class 1255 OID 16612)
-- Dependencies: 526 7
-- Name: stat(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION stat(text) RETURNS SETOF statinfo
    AS '$libdir/tsearch2', 'ts_stat'
    LANGUAGE c STRICT;


ALTER FUNCTION public.stat(text) OWNER TO postgres;

--
-- TOC entry 99 (class 1255 OID 16613)
-- Dependencies: 526 7
-- Name: stat(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION stat(text, text) RETURNS SETOF statinfo
    AS '$libdir/tsearch2', 'ts_stat'
    LANGUAGE c STRICT;


ALTER FUNCTION public.stat(text, text) OWNER TO postgres;

--
-- TOC entry 60 (class 1255 OID 16564)
-- Dependencies: 517 7 517
-- Name: strip(tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION strip(tsvector) RETURNS tsvector
    AS '$libdir/tsearch2', 'strip'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.strip(tsvector) OWNER TO postgres;

--
-- TOC entry 34 (class 1255 OID 16428)
-- Dependencies: 7
-- Name: syn_init(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION syn_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'syn_init'
    LANGUAGE c;


ALTER FUNCTION public.syn_init(internal) OWNER TO postgres;

--
-- TOC entry 35 (class 1255 OID 16429)
-- Dependencies: 7
-- Name: syn_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION syn_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'syn_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.syn_lexize(internal, internal, integer) OWNER TO postgres;

--
-- TOC entry 36 (class 1255 OID 16431)
-- Dependencies: 7
-- Name: thesaurus_init(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION thesaurus_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'thesaurus_init'
    LANGUAGE c;


ALTER FUNCTION public.thesaurus_init(internal) OWNER TO postgres;

--
-- TOC entry 37 (class 1255 OID 16432)
-- Dependencies: 7
-- Name: thesaurus_lexize(internal, internal, integer, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION thesaurus_lexize(internal, internal, integer, internal) RETURNS internal
    AS '$libdir/tsearch2', 'thesaurus_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.thesaurus_lexize(internal, internal, integer, internal) OWNER TO postgres;

--
-- TOC entry 66 (class 1255 OID 16573)
-- Dependencies: 7 520
-- Name: to_tsquery(oid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsquery(oid, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'to_tsquery'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsquery(oid, text) OWNER TO postgres;

--
-- TOC entry 67 (class 1255 OID 16574)
-- Dependencies: 7 520
-- Name: to_tsquery(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsquery(text, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'to_tsquery_name'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsquery(text, text) OWNER TO postgres;

--
-- TOC entry 68 (class 1255 OID 16575)
-- Dependencies: 7 520
-- Name: to_tsquery(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsquery(text) RETURNS tsquery
    AS '$libdir/tsearch2', 'to_tsquery_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsquery(text) OWNER TO postgres;

--
-- TOC entry 57 (class 1255 OID 16561)
-- Dependencies: 7 517
-- Name: to_tsvector(oid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsvector(oid, text) RETURNS tsvector
    AS '$libdir/tsearch2', 'to_tsvector'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsvector(oid, text) OWNER TO postgres;

--
-- TOC entry 58 (class 1255 OID 16562)
-- Dependencies: 7 517
-- Name: to_tsvector(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsvector(text, text) RETURNS tsvector
    AS '$libdir/tsearch2', 'to_tsvector_name'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsvector(text, text) OWNER TO postgres;

--
-- TOC entry 59 (class 1255 OID 16563)
-- Dependencies: 517 7
-- Name: to_tsvector(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsvector(text) RETURNS tsvector
    AS '$libdir/tsearch2', 'to_tsvector_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsvector(text) OWNER TO postgres;

--
-- TOC entry 38 (class 1255 OID 16443)
-- Dependencies: 7 511
-- Name: token_type(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION token_type(integer) RETURNS SETOF tokentype
    AS '$libdir/tsearch2', 'token_type'
    LANGUAGE c STRICT;


ALTER FUNCTION public.token_type(integer) OWNER TO postgres;

--
-- TOC entry 39 (class 1255 OID 16444)
-- Dependencies: 7 511
-- Name: token_type(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION token_type(text) RETURNS SETOF tokentype
    AS '$libdir/tsearch2', 'token_type_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.token_type(text) OWNER TO postgres;

--
-- TOC entry 40 (class 1255 OID 16445)
-- Dependencies: 7 511
-- Name: token_type(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION token_type() RETURNS SETOF tokentype
    AS '$libdir/tsearch2', 'token_type_current'
    LANGUAGE c STRICT;


ALTER FUNCTION public.token_type() OWNER TO postgres;

--
-- TOC entry 103 (class 1255 OID 16619)
-- Dependencies: 7 527
-- Name: ts_debug(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ts_debug(text) RETURNS SETOF tsdebug
    AS $_$
select 
        m.ts_name,
        t.alias as tok_type,
        t.descr as description,
        p.token,
        m.dict_name,
        strip(to_tsvector(p.token)) as tsvector
from
        parse( _get_parser_from_curcfg(), $1 ) as p,
        token_type() as t,
        pg_ts_cfgmap as m,
        pg_ts_cfg as c
where
        t.tokid=p.tokid and
        t.alias = m.tok_alias and 
        m.ts_name=c.ts_name and 
        c.oid=show_curcfg() 
$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public.ts_debug(text) OWNER TO postgres;

--
-- TOC entry 74 (class 1255 OID 16583)
-- Dependencies: 7
-- Name: tsearch2(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsearch2() RETURNS "trigger"
    AS '$libdir/tsearch2', 'tsearch2'
    LANGUAGE c;


ALTER FUNCTION public.tsearch2() OWNER TO postgres;

--
-- TOC entry 127 (class 1255 OID 16661)
-- Dependencies: 7 520 520
-- Name: tsq_mcontained(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsq_mcontained(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsq_mcontained'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsq_mcontained(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 126 (class 1255 OID 16660)
-- Dependencies: 520 7 520
-- Name: tsq_mcontains(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsq_mcontains(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsq_mcontains'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsq_mcontains(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 119 (class 1255 OID 16649)
-- Dependencies: 7 520 520 520
-- Name: tsquery_and(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_and(tsquery, tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_and'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_and(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 111 (class 1255 OID 16634)
-- Dependencies: 520 7 520
-- Name: tsquery_cmp(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_cmp(tsquery, tsquery) RETURNS integer
    AS '$libdir/tsearch2', 'tsquery_cmp'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_cmp(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 114 (class 1255 OID 16637)
-- Dependencies: 520 520 7
-- Name: tsquery_eq(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_eq(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_eq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_eq(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 115 (class 1255 OID 16638)
-- Dependencies: 7 520 520
-- Name: tsquery_ge(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_ge(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_ge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_ge(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 116 (class 1255 OID 16639)
-- Dependencies: 7 520 520
-- Name: tsquery_gt(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_gt(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_gt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_gt(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 113 (class 1255 OID 16636)
-- Dependencies: 520 7 520
-- Name: tsquery_le(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_le(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_le'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_le(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 112 (class 1255 OID 16635)
-- Dependencies: 7 520 520
-- Name: tsquery_lt(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_lt(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_lt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_lt(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 117 (class 1255 OID 16640)
-- Dependencies: 7 520 520
-- Name: tsquery_ne(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_ne(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_ne'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_ne(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 121 (class 1255 OID 16653)
-- Dependencies: 520 520 7
-- Name: tsquery_not(tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_not(tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_not'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_not(tsquery) OWNER TO postgres;

--
-- TOC entry 120 (class 1255 OID 16651)
-- Dependencies: 7 520 520 520
-- Name: tsquery_or(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_or(tsquery, tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_or'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_or(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 104 (class 1255 OID 16620)
-- Dependencies: 517 517 7
-- Name: tsvector_cmp(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_cmp(tsvector, tsvector) RETURNS integer
    AS '$libdir/tsearch2', 'tsvector_cmp'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_cmp(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 107 (class 1255 OID 16623)
-- Dependencies: 517 517 7
-- Name: tsvector_eq(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_eq(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_eq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_eq(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 108 (class 1255 OID 16624)
-- Dependencies: 517 517 7
-- Name: tsvector_ge(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_ge(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_ge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_ge(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 109 (class 1255 OID 16625)
-- Dependencies: 517 517 7
-- Name: tsvector_gt(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_gt(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_gt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_gt(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 106 (class 1255 OID 16622)
-- Dependencies: 517 7 517
-- Name: tsvector_le(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_le(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_le'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_le(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 105 (class 1255 OID 16621)
-- Dependencies: 517 517 7
-- Name: tsvector_lt(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_lt(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_lt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_lt(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 110 (class 1255 OID 16626)
-- Dependencies: 517 517 7
-- Name: tsvector_ne(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_ne(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_ne'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_ne(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 788 (class 1255 OID 16659)
-- Dependencies: 7 125 520 124 522
-- Name: rewrite(tsquery[]); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE rewrite(tsquery[]) (
    SFUNC = rewrite_accum,
    STYPE = tsquery,
    FINALFUNC = rewrite_finish
);


ALTER AGGREGATE public.rewrite(tsquery[]) OWNER TO postgres;

--
-- TOC entry 1472 (class 2617 OID 16654)
-- Dependencies: 520 121 7 520
-- Name: !!; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR !! (
    PROCEDURE = tsquery_not,
    RIGHTARG = tsquery
);


ALTER OPERATOR public.!! (NONE, tsquery) OWNER TO postgres;

--
-- TOC entry 1470 (class 2617 OID 16650)
-- Dependencies: 119 7 520 520 520
-- Name: &&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR && (
    PROCEDURE = tsquery_and,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = &&,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.&& (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1458 (class 2617 OID 16629)
-- Dependencies: 7 105 517 517
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = tsvector_lt,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.< (tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 1464 (class 2617 OID 16643)
-- Dependencies: 520 112 520 7
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = tsquery_lt,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.< (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1459 (class 2617 OID 16630)
-- Dependencies: 517 7 517 106
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = tsvector_le,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<= (tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 1465 (class 2617 OID 16644)
-- Dependencies: 113 520 7 520
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = tsquery_le,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<= (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1463 (class 2617 OID 16631)
-- Dependencies: 7 517 110 517
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = tsvector_ne,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 1469 (class 2617 OID 16645)
-- Dependencies: 520 117 7 520
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = tsquery_ne,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1474 (class 2617 OID 16662)
-- Dependencies: 7 520 520 127
-- Name: <@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <@ (
    PROCEDURE = tsq_mcontained,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<@ (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1462 (class 2617 OID 16632)
-- Dependencies: 517 517 107 7
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = tsvector_eq,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    SORT1 = <,
    SORT2 = <,
    LTCMP = <,
    GTCMP = >
);


ALTER OPERATOR public.= (tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 1468 (class 2617 OID 16646)
-- Dependencies: 520 7 114 520
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = tsquery_eq,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    SORT1 = <,
    SORT2 = <,
    LTCMP = <,
    GTCMP = >
);


ALTER OPERATOR public.= (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1461 (class 2617 OID 16627)
-- Dependencies: 517 7 517 109
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = tsvector_gt,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.> (tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 1467 (class 2617 OID 16641)
-- Dependencies: 7 520 116 520
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = tsquery_gt,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.> (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1460 (class 2617 OID 16628)
-- Dependencies: 7 108 517 517
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = tsvector_ge,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.>= (tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 1466 (class 2617 OID 16642)
-- Dependencies: 520 7 520 115
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = tsquery_ge,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.>= (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1475 (class 2617 OID 16665)
-- Dependencies: 520 520 126 7
-- Name: @; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @ (
    PROCEDURE = tsq_mcontains,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1473 (class 2617 OID 16663)
-- Dependencies: 520 7 126 520
-- Name: @>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @> (
    PROCEDURE = tsq_mcontains,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@> (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1457 (class 2617 OID 16581)
-- Dependencies: 7 73 517 520
-- Name: @@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @@ (
    PROCEDURE = rexectsq,
    LEFTARG = tsquery,
    RIGHTARG = tsvector,
    COMMUTATOR = @@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@@ (tsquery, tsvector) OWNER TO postgres;

--
-- TOC entry 1456 (class 2617 OID 16582)
-- Dependencies: 517 520 72 7
-- Name: @@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @@ (
    PROCEDURE = exectsq,
    LEFTARG = tsvector,
    RIGHTARG = tsquery,
    COMMUTATOR = @@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@@ (tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 1478 (class 2617 OID 16681)
-- Dependencies: 73 517 7 520
-- Name: @@@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @@@ (
    PROCEDURE = rexectsq,
    LEFTARG = tsquery,
    RIGHTARG = tsvector,
    COMMUTATOR = @@@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@@@ (tsquery, tsvector) OWNER TO postgres;

--
-- TOC entry 1477 (class 2617 OID 16682)
-- Dependencies: 72 517 7 520
-- Name: @@@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @@@ (
    PROCEDURE = exectsq,
    LEFTARG = tsvector,
    RIGHTARG = tsquery,
    COMMUTATOR = @@@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@@@ (tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 1455 (class 2617 OID 16567)
-- Dependencies: 517 517 62 7 517
-- Name: ||; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR || (
    PROCEDURE = concat,
    LEFTARG = tsvector,
    RIGHTARG = tsvector
);


ALTER OPERATOR public.|| (tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 1471 (class 2617 OID 16652)
-- Dependencies: 520 120 520 7 520
-- Name: ||; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR || (
    PROCEDURE = tsquery_or,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = ||,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.|| (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1476 (class 2617 OID 16664)
-- Dependencies: 127 7 520 520
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = tsq_mcontained,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1585 (class 2616 OID 16683)
-- Dependencies: 7 1477 137 138 139 517 1456
-- Name: gin_tsvector_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gin_tsvector_ops
    DEFAULT FOR TYPE tsvector USING gin AS
    STORAGE text ,
    OPERATOR 1 @@(tsvector,tsquery) ,
    OPERATOR 2 @@@(tsvector,tsquery) RECHECK ,
    FUNCTION 1 bttextcmp(text,text) ,
    FUNCTION 2 gin_extract_tsvector(tsvector,internal) ,
    FUNCTION 3 gin_extract_tsquery(tsquery,internal,internal) ,
    FUNCTION 4 gin_ts_consistent(internal,internal,tsquery);


ALTER OPERATOR CLASS public.gin_tsvector_ops USING gin OWNER TO postgres;

--
-- TOC entry 1584 (class 2616 OID 16677)
-- Dependencies: 1474 1475 130 1476 132 131 136 7 520 134 135 528 133 1473
-- Name: gist_tp_tsquery_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist_tp_tsquery_ops
    DEFAULT FOR TYPE tsquery USING gist AS
    STORAGE gtsq ,
    OPERATOR 7 @>(tsquery,tsquery) RECHECK ,
    OPERATOR 8 <@(tsquery,tsquery) RECHECK ,
    OPERATOR 13 @(tsquery,tsquery) RECHECK ,
    OPERATOR 14 ~(tsquery,tsquery) RECHECK ,
    FUNCTION 1 gtsq_consistent(gtsq,internal,integer) ,
    FUNCTION 2 gtsq_union(bytea,internal) ,
    FUNCTION 3 gtsq_compress(internal) ,
    FUNCTION 4 gtsq_decompress(internal) ,
    FUNCTION 5 gtsq_penalty(internal,internal,internal) ,
    FUNCTION 6 gtsq_picksplit(internal,internal) ,
    FUNCTION 7 gtsq_same(gtsq,gtsq,internal);


ALTER OPERATOR CLASS public.gist_tp_tsquery_ops USING gist OWNER TO postgres;

--
-- TOC entry 1581 (class 2616 OID 16609)
-- Dependencies: 7 91 1456 523 517 96 92 93 94 95 97
-- Name: gist_tsvector_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist_tsvector_ops
    DEFAULT FOR TYPE tsvector USING gist AS
    STORAGE gtsvector ,
    OPERATOR 1 @@(tsvector,tsquery) RECHECK ,
    FUNCTION 1 gtsvector_consistent(gtsvector,internal,integer) ,
    FUNCTION 2 gtsvector_union(internal,internal) ,
    FUNCTION 3 gtsvector_compress(internal) ,
    FUNCTION 4 gtsvector_decompress(internal) ,
    FUNCTION 5 gtsvector_penalty(internal,internal,internal) ,
    FUNCTION 6 gtsvector_picksplit(internal,internal) ,
    FUNCTION 7 gtsvector_same(gtsvector,gtsvector,internal);


ALTER OPERATOR CLASS public.gist_tsvector_ops USING gist OWNER TO postgres;

--
-- TOC entry 1583 (class 2616 OID 16647)
-- Dependencies: 111 1464 520 7 1466 1467 1468 1465
-- Name: tsquery_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS tsquery_ops
    DEFAULT FOR TYPE tsquery USING btree AS
    OPERATOR 1 <(tsquery,tsquery) ,
    OPERATOR 2 <=(tsquery,tsquery) ,
    OPERATOR 3 =(tsquery,tsquery) ,
    OPERATOR 4 >=(tsquery,tsquery) ,
    OPERATOR 5 >(tsquery,tsquery) ,
    FUNCTION 1 tsquery_cmp(tsquery,tsquery);


ALTER OPERATOR CLASS public.tsquery_ops USING btree OWNER TO postgres;

--
-- TOC entry 1582 (class 2616 OID 16633)
-- Dependencies: 104 1461 1460 1462 1459 1458 517 7
-- Name: tsvector_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS tsvector_ops
    DEFAULT FOR TYPE tsvector USING btree AS
    OPERATOR 1 <(tsvector,tsvector) ,
    OPERATOR 2 <=(tsvector,tsvector) ,
    OPERATOR 3 =(tsvector,tsvector) ,
    OPERATOR 4 >=(tsvector,tsvector) ,
    OPERATOR 5 >(tsvector,tsvector) ,
    FUNCTION 1 tsvector_cmp(tsvector,tsvector);


ALTER OPERATOR CLASS public.tsvector_ops USING btree OWNER TO postgres;

SET search_path = facturacion, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 1855 (class 1259 OID 24039)
-- Dependencies: 2
-- Name: alistamiento; Type: TABLE; Schema: facturacion; Owner: usersgl; Tablespace: 
--

CREATE TABLE alistamiento (
    alcodsx integer NOT NULL,
    alfecha_ini date NOT NULL,
    alfecha_fin date NOT NULL,
    alcliente_fac bigint NOT NULL,
    resumen text,
    alfactura bigint,
    alunid_facturar numeric(15,2),
    alempresa smallint
);


ALTER TABLE facturacion.alistamiento OWNER TO usersgl;

--
-- TOC entry 1856 (class 1259 OID 24044)
-- Dependencies: 2 1855
-- Name: alistamiento_alcodsx_seq; Type: SEQUENCE; Schema: facturacion; Owner: usersgl
--

CREATE SEQUENCE alistamiento_alcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE facturacion.alistamiento_alcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 1856
-- Name: alistamiento_alcodsx_seq; Type: SEQUENCE OWNED BY; Schema: facturacion; Owner: usersgl
--

ALTER SEQUENCE alistamiento_alcodsx_seq OWNED BY alistamiento.alcodsx;


--
-- TOC entry 1857 (class 1259 OID 24046)
-- Dependencies: 2
-- Name: almacenamiento; Type: TABLE; Schema: facturacion; Owner: usersgl; Tablespace: 
--

CREATE TABLE almacenamiento (
    almcodsx integer NOT NULL,
    almcliente_fac bigint NOT NULL,
    almfecha_ini date NOT NULL,
    almfecha_fin date NOT NULL,
    almelect numeric(15,2),
    almvasos numeric(15,2),
    almfactura bigint,
    resumen text,
    almempresa smallint
);


ALTER TABLE facturacion.almacenamiento OWNER TO usersgl;

--
-- TOC entry 1858 (class 1259 OID 24051)
-- Dependencies: 2 1857
-- Name: almacenamiento_almcodsx_seq; Type: SEQUENCE; Schema: facturacion; Owner: usersgl
--

CREATE SEQUENCE almacenamiento_almcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE facturacion.almacenamiento_almcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 1858
-- Name: almacenamiento_almcodsx_seq; Type: SEQUENCE OWNED BY; Schema: facturacion; Owner: usersgl
--

ALTER SEQUENCE almacenamiento_almcodsx_seq OWNED BY almacenamiento.almcodsx;


--
-- TOC entry 1859 (class 1259 OID 24053)
-- Dependencies: 2
-- Name: cliente_facturacion; Type: TABLE; Schema: facturacion; Owner: usersgl; Tablespace: 
--

CREATE TABLE cliente_facturacion (
    clifcodsx integer NOT NULL,
    clifnombre character varying NOT NULL,
    clifnit character varying NOT NULL,
    clifdireccion character varying NOT NULL,
    cliftelefono character varying,
    clifcodcompania bigint NOT NULL,
    resumen text
);


ALTER TABLE facturacion.cliente_facturacion OWNER TO usersgl;

--
-- TOC entry 1860 (class 1259 OID 24058)
-- Dependencies: 1859 2
-- Name: cliente_facturacion_clifcodsx_seq; Type: SEQUENCE; Schema: facturacion; Owner: usersgl
--

CREATE SEQUENCE cliente_facturacion_clifcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE facturacion.cliente_facturacion_clifcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 1860
-- Name: cliente_facturacion_clifcodsx_seq; Type: SEQUENCE OWNED BY; Schema: facturacion; Owner: usersgl
--

ALTER SEQUENCE cliente_facturacion_clifcodsx_seq OWNED BY cliente_facturacion.clifcodsx;


--
-- TOC entry 1861 (class 1259 OID 24060)
-- Dependencies: 2
-- Name: concepto; Type: TABLE; Schema: facturacion; Owner: usersgl; Tablespace: 
--

CREATE TABLE concepto (
    concodsx integer NOT NULL,
    condesc character varying NOT NULL,
    resumen text
);


ALTER TABLE facturacion.concepto OWNER TO usersgl;

--
-- TOC entry 1862 (class 1259 OID 24065)
-- Dependencies: 2
-- Name: concepto_cliente; Type: TABLE; Schema: facturacion; Owner: usersgl; Tablespace: 
--

CREATE TABLE concepto_cliente (
    conccodsx integer NOT NULL,
    conccodconcepto bigint NOT NULL,
    conccodcliente bigint NOT NULL,
    concdescconcepto character varying NOT NULL,
    concnombrecliente character varying NOT NULL,
    concvalorunit numeric NOT NULL,
    concporcentaje numeric,
    concminimo numeric,
    resumen text
);


ALTER TABLE facturacion.concepto_cliente OWNER TO usersgl;

--
-- TOC entry 1863 (class 1259 OID 24070)
-- Dependencies: 2 1862
-- Name: concepto_cliente_conccodsx_seq; Type: SEQUENCE; Schema: facturacion; Owner: usersgl
--

CREATE SEQUENCE concepto_cliente_conccodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE facturacion.concepto_cliente_conccodsx_seq OWNER TO usersgl;

--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 1863
-- Name: concepto_cliente_conccodsx_seq; Type: SEQUENCE OWNED BY; Schema: facturacion; Owner: usersgl
--

ALTER SEQUENCE concepto_cliente_conccodsx_seq OWNED BY concepto_cliente.conccodsx;


--
-- TOC entry 1864 (class 1259 OID 24072)
-- Dependencies: 2 1861
-- Name: concepto_concodsx_seq; Type: SEQUENCE; Schema: facturacion; Owner: usersgl
--

CREATE SEQUENCE concepto_concodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE facturacion.concepto_concodsx_seq OWNER TO usersgl;

--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 1864
-- Name: concepto_concodsx_seq; Type: SEQUENCE OWNED BY; Schema: facturacion; Owner: usersgl
--

ALTER SEQUENCE concepto_concodsx_seq OWNED BY concepto.concodsx;


--
-- TOC entry 1865 (class 1259 OID 24074)
-- Dependencies: 2389 2
-- Name: conffactura; Type: TABLE; Schema: facturacion; Owner: usersgl; Tablespace: 
--

CREATE TABLE conffactura (
    cfcodsx integer NOT NULL,
    cfempresa smallint,
    ciiva numeric,
    ciretefuente numeric,
    ciresolucion text,
    cfbanco text,
    cfcuenta text,
    cfreteiva numeric(4,2),
    cfimptimbre numeric(15,2) DEFAULT 0
);


ALTER TABLE facturacion.conffactura OWNER TO usersgl;

--
-- TOC entry 1866 (class 1259 OID 24080)
-- Dependencies: 2 1865
-- Name: conffactura_cfcodsx_seq; Type: SEQUENCE; Schema: facturacion; Owner: usersgl
--

CREATE SEQUENCE conffactura_cfcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE facturacion.conffactura_cfcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 1866
-- Name: conffactura_cfcodsx_seq; Type: SEQUENCE OWNED BY; Schema: facturacion; Owner: usersgl
--

ALTER SEQUENCE conffactura_cfcodsx_seq OWNED BY conffactura.cfcodsx;


--
-- TOC entry 1867 (class 1259 OID 24082)
-- Dependencies: 2391 2392 2393 2
-- Name: factura; Type: TABLE; Schema: facturacion; Owner: usersgl; Tablespace: 
--

CREATE TABLE factura (
    faccodsx integer NOT NULL,
    faccodcliente bigint NOT NULL,
    facdesccliente character varying NOT NULL,
    facfechasistema timestamp without time zone,
    facfechafactura date NOT NULL,
    facfechavencimiento date,
    facnit character varying NOT NULL,
    facdireccion character varying,
    facobservaciones character varying,
    facconcepto character varying NOT NULL,
    facestado character varying NOT NULL,
    facsubtotal numeric(15,2),
    faciva numeric(15,2),
    facretefuente numeric(15,2),
    factotal numeric(15,2),
    factextototal character varying,
    resumen text,
    factrm numeric(10,2),
    fac_tipo character varying,
    facvaloriva numeric(15,2),
    facvalorretef numeric(15,2),
    facmoneda character varying,
    facempresa smallint,
    facnum integer,
    faccontribuyente character varying(1),
    facreteiva numeric(4,2),
    facdescto numeric(15,2) DEFAULT 0,
    facimptimbre numeric(15,2) DEFAULT 0,
    facvalimptimbre numeric(15,2) DEFAULT 0
);


ALTER TABLE facturacion.factura OWNER TO usersgl;

--
-- TOC entry 1868 (class 1259 OID 24090)
-- Dependencies: 2
-- Name: factura_detalle; Type: TABLE; Schema: facturacion; Owner: usersgl; Tablespace: 
--

CREATE TABLE factura_detalle (
    facdcodsx integer NOT NULL,
    facdfactura bigint NOT NULL,
    facdconceptodesc character varying NOT NULL,
    facdtipo character varying NOT NULL,
    facdvalorunit numeric(15,2) NOT NULL,
    facdvalortotal numeric(15,2) NOT NULL,
    facdcantidad numeric(15,2),
    facdobservacion character varying,
    resumen text,
    facdporcentaje numeric NOT NULL,
    facdvalorcomicion numeric NOT NULL,
    facdminimo numeric NOT NULL
);


ALTER TABLE facturacion.factura_detalle OWNER TO usersgl;

--
-- TOC entry 1869 (class 1259 OID 24095)
-- Dependencies: 1868 2
-- Name: factura_detalle_facdcodsx_seq; Type: SEQUENCE; Schema: facturacion; Owner: usersgl
--

CREATE SEQUENCE factura_detalle_facdcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE facturacion.factura_detalle_facdcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 1869
-- Name: factura_detalle_facdcodsx_seq; Type: SEQUENCE OWNED BY; Schema: facturacion; Owner: usersgl
--

ALTER SEQUENCE factura_detalle_facdcodsx_seq OWNED BY factura_detalle.facdcodsx;


--
-- TOC entry 1870 (class 1259 OID 24097)
-- Dependencies: 1867 2
-- Name: factura_faccodsx_seq; Type: SEQUENCE; Schema: facturacion; Owner: usersgl
--

CREATE SEQUENCE factura_faccodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE facturacion.factura_faccodsx_seq OWNER TO usersgl;

--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 1870
-- Name: factura_faccodsx_seq; Type: SEQUENCE OWNED BY; Schema: facturacion; Owner: usersgl
--

ALTER SEQUENCE factura_faccodsx_seq OWNED BY factura.faccodsx;


--
-- TOC entry 1871 (class 1259 OID 24099)
-- Dependencies: 2
-- Name: numfactura; Type: TABLE; Schema: facturacion; Owner: usersgl; Tablespace: 
--

CREATE TABLE numfactura (
    nfcodsx integer NOT NULL,
    nfempresa smallint NOT NULL,
    nfestado character varying(10) NOT NULL,
    nffecha timestamp with time zone NOT NULL,
    nfinicio integer NOT NULL,
    nffin integer NOT NULL,
    nfdisponible integer NOT NULL,
    nfsiguiente integer NOT NULL,
    resumen text
);


ALTER TABLE facturacion.numfactura OWNER TO usersgl;

--
-- TOC entry 1872 (class 1259 OID 24104)
-- Dependencies: 1871 2
-- Name: numfactura_nfcodsx_seq; Type: SEQUENCE; Schema: facturacion; Owner: usersgl
--

CREATE SEQUENCE numfactura_nfcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE facturacion.numfactura_nfcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 1872
-- Name: numfactura_nfcodsx_seq; Type: SEQUENCE OWNED BY; Schema: facturacion; Owner: usersgl
--

ALTER SEQUENCE numfactura_nfcodsx_seq OWNED BY numfactura.nfcodsx;


--
-- TOC entry 1873 (class 1259 OID 24106)
-- Dependencies: 2
-- Name: proforma; Type: TABLE; Schema: facturacion; Owner: usersgl; Tablespace: 
--

CREATE TABLE proforma (
    profcodsx integer NOT NULL,
    profnumfactura bigint,
    profost character varying,
    profpedido character varying,
    profnit character varying,
    porforigen character varying,
    profmotonave character varying,
    profbl character varying,
    proftasacambio character varying,
    profbultos numeric(15,2),
    profcont20 smallint,
    profcont40 smallint,
    profcont40hc smallint,
    profpeso numeric(15,2),
    proffob numeric(15,2),
    profflete numeric(15,2),
    profgastosorigen numeric(15,2),
    profrecargocomb numeric(15,2),
    profgastosdestino numeric(15,2),
    profgastosnaviera numeric(15,2),
    profcollectionfee numeric(15,2),
    profradicacionbl numeric(15,2),
    profmanejo numeric(15,2),
    profdropoff numeric(15,2),
    profseguro numeric(15,2),
    profcifdolares numeric(15,2),
    profcifpesos numeric(15,2),
    proftotal numeric(15,2),
    proffecha timestamp without time zone,
    profcliente bigint,
    resumen character varying,
    profservotm numeric(15,2),
    profanticipo numeric(15,2),
    proffurgon smallint,
    profmanejosli numeric(15,2),
    proempresa smallint
);


ALTER TABLE facturacion.proforma OWNER TO usersgl;

--
-- TOC entry 1874 (class 1259 OID 24111)
-- Dependencies: 1873 2
-- Name: proforma_profcodsx_seq; Type: SEQUENCE; Schema: facturacion; Owner: usersgl
--

CREATE SEQUENCE proforma_profcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE facturacion.proforma_profcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 1874
-- Name: proforma_profcodsx_seq; Type: SEQUENCE OWNED BY; Schema: facturacion; Owner: usersgl
--

ALTER SEQUENCE proforma_profcodsx_seq OWNED BY proforma.profcodsx;


--
-- TOC entry 1875 (class 1259 OID 24113)
-- Dependencies: 2
-- Name: revision; Type: TABLE; Schema: facturacion; Owner: usersgl; Tablespace: 
--

CREATE TABLE revision (
    ingcodsx integer,
    numero integer,
    procodsx integer,
    promodelo character varying,
    fecha date,
    tipo character varying,
    cantidad bigint,
    cantnac bigint,
    cantkardex bigint,
    cantdespacho bigint
);


ALTER TABLE facturacion.revision OWNER TO usersgl;

--
-- TOC entry 1876 (class 1259 OID 24118)
-- Dependencies: 2
-- Name: revision1; Type: TABLE; Schema: facturacion; Owner: usersgl; Tablespace: 
--

CREATE TABLE revision1 (
    ingcodsx integer,
    numero integer,
    procodsx integer,
    promodelo character varying,
    fecha date,
    tipo character varying,
    cantidad bigint,
    cantnac bigint,
    cantkardex bigint,
    cantdespacho bigint
);


ALTER TABLE facturacion.revision1 OWNER TO usersgl;

--
-- TOC entry 1877 (class 1259 OID 24123)
-- Dependencies: 2398 2
-- Name: revisionproducto; Type: TABLE; Schema: facturacion; Owner: usersgl; Tablespace: 
--

CREATE TABLE revisionproducto (
    producto integer,
    modelo character varying,
    ingreso integer,
    cantingreso bigint,
    cantnacional bigint,
    cantdespachos bigint,
    tipo character varying,
    saldo bigint DEFAULT 0
);


ALTER TABLE facturacion.revisionproducto OWNER TO usersgl;

SET search_path = movimiento, pg_catalog;

--
-- TOC entry 1878 (class 1259 OID 24129)
-- Dependencies: 2399 6
-- Name: ajuste; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE ajuste (
    ajcodsx integer NOT NULL,
    ajcodcia bigint NOT NULL,
    ajingreso bigint NOT NULL,
    ajentrada bigint NOT NULL,
    ajfecha timestamp without time zone DEFAULT now() NOT NULL,
    ajsaldoant_nac numeric(20,2) NOT NULL,
    ajnuevosaldo_nac numeric(20,2) NOT NULL,
    ajsaldoant_nnac numeric(20,2) NOT NULL,
    ajnuevosaldo_nnac numeric(20,2) NOT NULL,
    resumen text,
    ajestado character varying,
    ajproducto character varying,
    ajproducto_desc character varying,
    aj_pos_nac numeric(20,2),
    aj_neg_nac numeric(20,2),
    aj_pos_nnac numeric(20,2),
    aj_neg_nnac numeric(20,2),
    ajobservacion character varying
);


ALTER TABLE movimiento.ajuste OWNER TO usersgl;

--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 1878
-- Name: TABLE ajuste; Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON TABLE ajuste IS 'Tabla que contiene la información de los ajustes realizados en el sistema.';


--
-- TOC entry 1879 (class 1259 OID 24135)
-- Dependencies: 1878 6
-- Name: ajuste_ajcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE ajuste_ajcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.ajuste_ajcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 1879
-- Name: ajuste_ajcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE ajuste_ajcodsx_seq OWNED BY ajuste.ajcodsx;


--
-- TOC entry 1880 (class 1259 OID 24137)
-- Dependencies: 2401 2402 2403 2404 2405 2406 2407 2408 6
-- Name: averia; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE averia (
    avecodsx integer NOT NULL,
    avecompania bigint NOT NULL,
    avefecha timestamp without time zone NOT NULL,
    aveingreso bigint NOT NULL,
    aveentrada bigint NOT NULL,
    avetipo character varying NOT NULL,
    aveboddest smallint NOT NULL,
    aveposdest character varying NOT NULL,
    avecant_pleg_nac numeric(20,2) DEFAULT 0 NOT NULL,
    avecant_pleg_nnac numeric(20,2) DEFAULT 0 NOT NULL,
    avecant_prod_nac numeric(20,2) DEFAULT 0 NOT NULL,
    avecant_prod_nnac numeric(20,2) DEFAULT 0 NOT NULL,
    avesaldo_pleg_nac numeric(20,2) DEFAULT 0 NOT NULL,
    avesaldo_pleg_nnac numeric(20,2) DEFAULT 0 NOT NULL,
    avesaldo_prod_nac numeric(20,2) DEFAULT 0 NOT NULL,
    avesaldo_prod_nnac numeric(20,2) DEFAULT 0 NOT NULL,
    aveestado character varying NOT NULL,
    resumen text,
    aveproducto bigint,
    serial character varying
);


ALTER TABLE movimiento.averia OWNER TO usersgl;

--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 1880
-- Name: TABLE averia; Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON TABLE averia IS 'Tabla que contiene la informacion de las operaciones de AVERIAS generadas en el sistema';


--
-- TOC entry 1881 (class 1259 OID 24150)
-- Dependencies: 1880 6
-- Name: averia_avecodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE averia_avecodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.averia_avecodsx_seq OWNER TO usersgl;

--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 1881
-- Name: averia_avecodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE averia_avecodsx_seq OWNED BY averia.avecodsx;


--
-- TOC entry 1882 (class 1259 OID 24152)
-- Dependencies: 6
-- Name: averia_nacdet; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE averia_nacdet (
    avncodsx integer NOT NULL,
    avnaveria bigint NOT NULL,
    avnnacdet_or bigint NOT NULL,
    avncant numeric(15,2) NOT NULL,
    avnsaldo numeric(15,2)
);


ALTER TABLE movimiento.averia_nacdet OWNER TO usersgl;

--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 1882
-- Name: TABLE averia_nacdet; Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON TABLE averia_nacdet IS 'Tabla que registra los datos de una averia de que NACIONALIZACION_DETALLE tomo para restar los saldos, es decir, puede ocurrir que una ENTRADA tenga varias nacionalizaciones y cuando se haga una averia, al tomar de una entrada, la averia debe registrar de que NACIONALIZACION_DETALLE tomo para restar.
';


--
-- TOC entry 1883 (class 1259 OID 24154)
-- Dependencies: 1882 6
-- Name: averia_nacdet_avncodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE averia_nacdet_avncodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.averia_nacdet_avncodsx_seq OWNER TO usersgl;

--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 1883
-- Name: averia_nacdet_avncodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE averia_nacdet_avncodsx_seq OWNED BY averia_nacdet.avncodsx;


--
-- TOC entry 1884 (class 1259 OID 24156)
-- Dependencies: 6
-- Name: causal_pedido; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE causal_pedido (
    caupcodsx integer NOT NULL,
    cauppedido bigint NOT NULL,
    caupcausal bigint NOT NULL,
    caupdesccausal character varying NOT NULL,
    caupfecha timestamp with time zone NOT NULL,
    resumen text
);


ALTER TABLE movimiento.causal_pedido OWNER TO usersgl;

--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 1884
-- Name: TABLE causal_pedido; Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON TABLE causal_pedido IS 'Tabla que registra los CAUSALES HIT que ha tenido un pedido durante su gestion, es decir, el usuario debe actualizar el campo CAUSAL HIT de un pedido cada vez que realiza alguna modificacion con el objeto de registrar dicha informacion.
finalmente, al final estos datos se usaran para obtener un reporte de causales HIT en un periodo de fechas';


--
-- TOC entry 1885 (class 1259 OID 24161)
-- Dependencies: 1884 6
-- Name: causal_pedido_caupcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE causal_pedido_caupcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.causal_pedido_caupcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 1885
-- Name: causal_pedido_caupcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE causal_pedido_caupcodsx_seq OWNED BY causal_pedido.caupcodsx;


SET default_with_oids = true;

--
-- TOC entry 1886 (class 1259 OID 24163)
-- Dependencies: 6
-- Name: contenedor_trafico; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE contenedor_trafico (
    ctrafcodsx integer NOT NULL,
    ctrafnumtrafico bigint NOT NULL,
    ctraftamano character varying NOT NULL,
    ctrafnumero character varying NOT NULL
);


ALTER TABLE movimiento.contenedor_trafico OWNER TO usersgl;

--
-- TOC entry 1887 (class 1259 OID 24168)
-- Dependencies: 6 1886
-- Name: contenedor_trafico_ctrafcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE contenedor_trafico_ctrafcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.contenedor_trafico_ctrafcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 1887
-- Name: contenedor_trafico_ctrafcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE contenedor_trafico_ctrafcodsx_seq OWNED BY contenedor_trafico.ctrafcodsx;


--
-- TOC entry 1888 (class 1259 OID 24170)
-- Dependencies: 6
-- Name: despacho; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE despacho (
    despcodsx integer NOT NULL,
    despempresa bigint NOT NULL,
    despfecha timestamp without time zone NOT NULL,
    despobservacion character varying,
    despplaca character varying NOT NULL,
    despnombrecond character varying NOT NULL,
    despcedcond character varying NOT NULL,
    desptransportadora integer NOT NULL,
    despestado character varying NOT NULL,
    despbultos numeric(4,0),
    despbultosarmados numeric(4,2),
    desppesoneto numeric(15,2),
    desppesobruto numeric(15,2),
    despfob numeric(15,2),
    resumen text,
    despconsec character varying,
    despconseczfp character varying,
    despnotifzfp bigint
);


ALTER TABLE movimiento.despacho OWNER TO usersgl;

--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 1888
-- Name: TABLE despacho; Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON TABLE despacho IS 'Tabla que almacena los datos de los despachos de mercancía registrados en la aplicación, un despacho se referira a un MOVIMIENTO DE CAMION que se efectue de salida de mercancía';


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 1888
-- Name: COLUMN despacho.despnotifzfp; Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON COLUMN despacho.despnotifzfp IS 'Numero notificacion en zona franca';


--
-- TOC entry 1889 (class 1259 OID 24175)
-- Dependencies: 1888 6
-- Name: despacho_despcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE despacho_despcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.despacho_despcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 1889
-- Name: despacho_despcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE despacho_despcodsx_seq OWNED BY despacho.despcodsx;


--
-- TOC entry 1890 (class 1259 OID 24177)
-- Dependencies: 6
-- Name: despacho_pedido; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE despacho_pedido (
    despedcodsx integer NOT NULL,
    despeddespacho bigint NOT NULL,
    despedpedido bigint NOT NULL,
    despedbultos numeric(15,2),
    despedbultosarmados numeric(15,2),
    despedpesoneto numeric(15,2),
    despedpesobruto numeric(15,2),
    despedvalor numeric(15,2)
);


ALTER TABLE movimiento.despacho_pedido OWNER TO usersgl;

--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 1890
-- Name: TABLE despacho_pedido; Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON TABLE despacho_pedido IS 'Tabla mediante la cual se asocia que un despacho pueda contener varios pedidos, a su vez que se indica que un pedido puede salir en varios despachos.
';


--
-- TOC entry 1891 (class 1259 OID 24179)
-- Dependencies: 6 1890
-- Name: despacho_pedido_despedcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE despacho_pedido_despedcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.despacho_pedido_despedcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 1891
-- Name: despacho_pedido_despedcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE despacho_pedido_despedcodsx_seq OWNED BY despacho_pedido.despedcodsx;


SET default_with_oids = false;

--
-- TOC entry 1892 (class 1259 OID 24181)
-- Dependencies: 2415 6
-- Name: entrada2; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE entrada2 (
    entcodsx integer NOT NULL,
    entcodingreso character varying,
    entcodproducto character varying,
    entbodega character varying,
    entposicion character varying NOT NULL,
    entcantidad numeric(15,2) NOT NULL,
    entpesoneto numeric(15,2) NOT NULL,
    entpesonetototal numeric(15,2) NOT NULL,
    entpesobruto numeric(15,2) NOT NULL,
    entpesobrutototal numeric(15,2) NOT NULL,
    entsaldopesoneto numeric(15,2) NOT NULL,
    entsaldopesobruto numeric(15,2) NOT NULL,
    entsaldonac numeric(15,2),
    entsaldosinnac numeric(15,2),
    entvalor numeric(15,2) NOT NULL,
    entvalortotal numeric(15,2) NOT NULL,
    resumen text,
    entfecha timestamp without time zone DEFAULT now(),
    entsaldonacf numeric(15,2),
    entsaldosinnacf numeric(15,2),
    entunidad character varying
);


ALTER TABLE movimiento.entrada2 OWNER TO usersgl;

--
-- TOC entry 1893 (class 1259 OID 24187)
-- Dependencies: 6 1892
-- Name: entrada2_entcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE entrada2_entcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.entrada2_entcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 1893
-- Name: entrada2_entcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE entrada2_entcodsx_seq OWNED BY entrada2.entcodsx;


--
-- TOC entry 1894 (class 1259 OID 24189)
-- Dependencies: 1854 6
-- Name: entrada_entcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE entrada_entcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.entrada_entcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 1894
-- Name: entrada_entcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE entrada_entcodsx_seq OWNED BY entrada.entcodsx;


SET default_with_oids = true;

--
-- TOC entry 1895 (class 1259 OID 24191)
-- Dependencies: 6
-- Name: factura_trafico; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE factura_trafico (
    ftrafcodsx integer NOT NULL,
    ftrafnumfactura character varying NOT NULL,
    ftrafnumtrafico bigint NOT NULL
);


ALTER TABLE movimiento.factura_trafico OWNER TO usersgl;

--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 1895
-- Name: TABLE factura_trafico; Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON TABLE factura_trafico IS 'Tabla que registra las FACTURAS que vienen asociadas a un TRAFICO de mercancía';


--
-- TOC entry 1896 (class 1259 OID 24196)
-- Dependencies: 1895 6
-- Name: factura_trafico_ftrafcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE factura_trafico_ftrafcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.factura_trafico_ftrafcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 1896
-- Name: factura_trafico_ftrafcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE factura_trafico_ftrafcodsx_seq OWNED BY factura_trafico.ftrafcodsx;


--
-- TOC entry 1897 (class 1259 OID 24198)
-- Dependencies: 2418 2419 2420 2421 2422 6
-- Name: ingreso; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE ingreso (
    ingcodsx integer NOT NULL,
    ingcodcia integer NOT NULL,
    ingfecha timestamp without time zone NOT NULL,
    ingtipo character varying NOT NULL,
    ingtrafico bigint,
    ingobservacion character varying,
    ingestado character varying DEFAULT 'TRAMITE'::character varying,
    ingcausal character varying,
    ingcli_devolucion bigint,
    ingpesoneto numeric(15,2) DEFAULT 0 NOT NULL,
    ingpesobruto numeric(15,2) DEFAULT 0 NOT NULL,
    ingfob numeric(15,2) DEFAULT 0 NOT NULL,
    ingcantidad numeric DEFAULT 0,
    ingciudad_dev integer,
    resumen text,
    ingconsec bigint,
    ingconseczfp bigint,
    ingplanilla character varying
);


ALTER TABLE movimiento.ingreso OWNER TO usersgl;

--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 1897
-- Name: TABLE ingreso; Type: COMMENT; Schema: movimiento; Owner: usersgl
--

COMMENT ON TABLE ingreso IS 'Tabla que registra los ingresos de mercancía que se registran; un ingreso se concibe como cualquier tipo de operación que resulte en un AUMENTO DE LOS SALDOS, es asi que por ejemplo una DEVOLUCION es un ingreso de mercancía.

Existen 3 tipos de ingresos:
•	TRAFICO: cuando a un TRAFICO de mercancía se le genera un ingreso a bodega
•	DEVOLUCION: cuando ocurre una devolucion de mercancía y se registra el ingreso
•	DESPIECE: cuando se genera un ingreso por que se desmantelo un producto con el objeto de obtener sus repuestos
';


--
-- TOC entry 1898 (class 1259 OID 24208)
-- Dependencies: 6 1897
-- Name: ingreso_ingcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE ingreso_ingcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.ingreso_ingcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 1898
-- Name: ingreso_ingcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE ingreso_ingcodsx_seq OWNED BY ingreso.ingcodsx;


SET default_with_oids = false;

--
-- TOC entry 1899 (class 1259 OID 24210)
-- Dependencies: 6
-- Name: kardex; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE kardex (
    kardcodsx integer NOT NULL,
    kardfecha timestamp without time zone NOT NULL,
    kardcodproducto bigint NOT NULL,
    kardmodelo character varying,
    kardprodescripcion character varying NOT NULL,
    kardcompania bigint NOT NULL,
    kardnombrecomp character varying NOT NULL,
    kardfechaing timestamp without time zone,
    kardcantingreso numeric,
    kardtipoing character varying,
    kardpesobrutoent numeric,
    kardvaloringreso numeric,
    kardcodigoingreso bigint,
    kardfechanac timestamp without time zone,
    kardcantnac numeric,
    kardpesonetonac numeric,
    kardpesobrutonac numeric,
    kardvalornac numeric,
    kardcodnac bigint,
    kardfechasal timestamp without time zone,
    kardcantsalnac numeric,
    kardcantsalnnac numeric,
    karddespacho character varying,
    kardpesobrutosal numeric,
    kardvalorsal numeric,
    kardcodigodespacho bigint,
    kardsaldonac numeric,
    kardsaldonnac numeric,
    kardajuste bigint,
    serial character varying
);


ALTER TABLE movimiento.kardex OWNER TO usersgl;

--
-- TOC entry 1900 (class 1259 OID 24215)
-- Dependencies: 1899 6
-- Name: kardex_kardcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE kardex_kardcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.kardex_kardcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 1900
-- Name: kardex_kardcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE kardex_kardcodsx_seq OWNED BY kardex.kardcodsx;


SET default_with_oids = true;

--
-- TOC entry 1901 (class 1259 OID 24217)
-- Dependencies: 2425 2426 2427 6
-- Name: nacionalizacion; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE nacionalizacion (
    naccodsx integer NOT NULL,
    nacempresa bigint NOT NULL,
    nacfecha timestamp without time zone NOT NULL,
    nacingreso bigint NOT NULL,
    nacestado character varying NOT NULL,
    nacdeclaracion character varying NOT NULL,
    nacfechadeclaracion timestamp without time zone NOT NULL,
    nacfechaingresobodega timestamp without time zone NOT NULL,
    nacpaginainicial character varying NOT NULL,
    nacpaginafinal character varying NOT NULL,
    nacdosia character varying,
    nacobservaciones character varying,
    nactipo character varying,
    nacpesoneto numeric(15,2) DEFAULT 0,
    nacpesobruto numeric(15,2) DEFAULT 0,
    nacfob numeric(15,2) DEFAULT 0,
    resumen text,
    nacconsec bigint,
    nacconseczfp bigint
);


ALTER TABLE movimiento.nacionalizacion OWNER TO usersgl;

SET default_with_oids = false;

--
-- TOC entry 1902 (class 1259 OID 24225)
-- Dependencies: 6
-- Name: nacionalizacion2; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE nacionalizacion2 (
    nacfecha timestamp without time zone NOT NULL,
    nacingreso character varying NOT NULL,
    nacestado character varying NOT NULL,
    nacdeclaracion character varying NOT NULL,
    nacfechadeclaracion timestamp without time zone NOT NULL,
    nacpaginainicial character varying NOT NULL,
    nacpaginafinal character varying NOT NULL,
    nacdosia character varying,
    nacobservaciones character varying
);


ALTER TABLE movimiento.nacionalizacion2 OWNER TO usersgl;

SET default_with_oids = true;

--
-- TOC entry 1903 (class 1259 OID 24230)
-- Dependencies: 6
-- Name: nacionalizacion_detalle; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE nacionalizacion_detalle (
    nadcodsx integer NOT NULL,
    nadcodnac bigint NOT NULL,
    nadentrada bigint NOT NULL,
    nadcantidad numeric(15,2) NOT NULL,
    nadsaldo numeric(15,2) NOT NULL,
    nadpesoneto numeric(15,2),
    nadpesonetototal numeric(15,2),
    nadpesobruto numeric(15,2),
    nadpesobrutototal numeric(15,2),
    nadfob numeric(15,2),
    nadfobtotal numeric(15,2),
    resumen text
);


ALTER TABLE movimiento.nacionalizacion_detalle OWNER TO usersgl;

SET default_with_oids = false;

--
-- TOC entry 1904 (class 1259 OID 24235)
-- Dependencies: 6
-- Name: nacionalizacion_detalle2; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE nacionalizacion_detalle2 (
    nadcodsx integer NOT NULL,
    nadcodnac character varying,
    nadentrada bigint,
    producto character varying,
    bodega character varying,
    posicion character varying,
    ingreso character varying,
    nadcantidad numeric(15,2) NOT NULL,
    nadsaldo numeric(15,2) NOT NULL,
    nadpesoneto numeric(15,2),
    nadpesonetototal numeric(15,2),
    nadpesobruto numeric(15,2),
    nadpesobrutototal numeric(15,2),
    nadfob numeric(15,2),
    nadfobtotal numeric(15,2)
);


ALTER TABLE movimiento.nacionalizacion_detalle2 OWNER TO usersgl;

--
-- TOC entry 1905 (class 1259 OID 24240)
-- Dependencies: 1904 6
-- Name: nacionalizacion_detalle2_nadcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE nacionalizacion_detalle2_nadcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.nacionalizacion_detalle2_nadcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 1905
-- Name: nacionalizacion_detalle2_nadcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE nacionalizacion_detalle2_nadcodsx_seq OWNED BY nacionalizacion_detalle2.nadcodsx;


--
-- TOC entry 1906 (class 1259 OID 24242)
-- Dependencies: 6 1903
-- Name: nacionalizacion_detalle_nadcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE nacionalizacion_detalle_nadcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.nacionalizacion_detalle_nadcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 1906
-- Name: nacionalizacion_detalle_nadcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE nacionalizacion_detalle_nadcodsx_seq OWNED BY nacionalizacion_detalle.nadcodsx;


--
-- TOC entry 1907 (class 1259 OID 24244)
-- Dependencies: 1901 6
-- Name: nacionalizacion_naccodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE nacionalizacion_naccodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.nacionalizacion_naccodsx_seq OWNER TO usersgl;

--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 1907
-- Name: nacionalizacion_naccodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE nacionalizacion_naccodsx_seq OWNED BY nacionalizacion.naccodsx;


--
-- TOC entry 1908 (class 1259 OID 24246)
-- Dependencies: 6
-- Name: novedad_pedido; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE novedad_pedido (
    novcodsx integer NOT NULL,
    novpedido bigint NOT NULL,
    novfecha timestamp with time zone NOT NULL,
    novdesc character varying NOT NULL,
    novusuario bigint NOT NULL,
    resumen text
);


ALTER TABLE movimiento.novedad_pedido OWNER TO usersgl;

--
-- TOC entry 1909 (class 1259 OID 24251)
-- Dependencies: 1908 6
-- Name: novedad_pedido_novcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE novedad_pedido_novcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.novedad_pedido_novcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 1909
-- Name: novedad_pedido_novcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE novedad_pedido_novcodsx_seq OWNED BY novedad_pedido.novcodsx;


SET default_with_oids = true;

--
-- TOC entry 1910 (class 1259 OID 24253)
-- Dependencies: 6
-- Name: packing; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE packing (
    packcodsx integer NOT NULL,
    packempresa bigint NOT NULL,
    packfecha timestamp without time zone NOT NULL,
    packobservaciones character varying,
    packestado character varying NOT NULL,
    packpesoneto numeric(15,2),
    packpesobruto numeric(15,2),
    resumen text
);


ALTER TABLE movimiento.packing OWNER TO usersgl;

--
-- TOC entry 1911 (class 1259 OID 24258)
-- Dependencies: 6
-- Name: packing_detalle; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE packing_detalle (
    packdcodsx integer NOT NULL,
    packdpacking bigint NOT NULL,
    packdproducto bigint NOT NULL,
    packdpesoneto numeric(15,2),
    packdpesobruto numeric(15,2),
    packdcantidad numeric(15,2),
    resumen text
);


ALTER TABLE movimiento.packing_detalle OWNER TO usersgl;

--
-- TOC entry 1912 (class 1259 OID 24263)
-- Dependencies: 6 1911
-- Name: packing_detalle_packdcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE packing_detalle_packdcodsx_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.packing_detalle_packdcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 1912
-- Name: packing_detalle_packdcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE packing_detalle_packdcodsx_seq OWNED BY packing_detalle.packdcodsx;


--
-- TOC entry 1913 (class 1259 OID 24265)
-- Dependencies: 6
-- Name: packing_detalle_posicion; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE packing_detalle_posicion (
    packpcodsx integer NOT NULL,
    packppackingdet bigint NOT NULL,
    packpbodega smallint NOT NULL,
    packpposicion character varying NOT NULL,
    packpcantidad numeric(15,2) NOT NULL,
    packpentrada bigint NOT NULL,
    packpnacdetalle bigint,
    packpsaldo numeric(15,2),
    packppesoneto numeric(15,2) NOT NULL,
    packppesobruto numeric(15,2) NOT NULL,
    packppesonetototal numeric(15,2) NOT NULL,
    packppesobrutototal numeric(15,2) NOT NULL
);


ALTER TABLE movimiento.packing_detalle_posicion OWNER TO usersgl;

--
-- TOC entry 1914 (class 1259 OID 24270)
-- Dependencies: 6 1913
-- Name: packing_detalle_posicion_packpcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE packing_detalle_posicion_packpcodsx_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.packing_detalle_posicion_packpcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 1914
-- Name: packing_detalle_posicion_packpcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE packing_detalle_posicion_packpcodsx_seq OWNED BY packing_detalle_posicion.packpcodsx;


--
-- TOC entry 1915 (class 1259 OID 24272)
-- Dependencies: 6 1910
-- Name: packing_packcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE packing_packcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.packing_packcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 1915
-- Name: packing_packcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE packing_packcodsx_seq OWNED BY packing.packcodsx;


--
-- TOC entry 1916 (class 1259 OID 24274)
-- Dependencies: 2435 6
-- Name: pedido; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE pedido (
    pedcodsx integer NOT NULL,
    pedcompania bigint NOT NULL,
    pednumpedido character varying NOT NULL,
    pedordencompra character varying NOT NULL,
    pedguia character varying NOT NULL,
    pedfechasistema timestamp without time zone NOT NULL,
    pedfecha date NOT NULL,
    pedfechavenc date,
    pedfechacita date,
    pedhoracita time without time zone,
    pedcliente bigint NOT NULL,
    pedsucursal bigint NOT NULL,
    peddireccion character varying NOT NULL,
    pedciudad bigint NOT NULL,
    peddepartamento bigint NOT NULL,
    pedobservaciones character varying,
    pedfactura character varying,
    pedestado character varying NOT NULL,
    pedsubtotal numeric(15,2),
    pediva numeric(15,2),
    peddescuento numeric(15,2),
    pedtotal numeric(15,2) NOT NULL,
    pedtipo character varying,
    pedpicking bigint,
    pedpesoneto numeric(15,2),
    pedpesobruto numeric(15,2),
    pedhora time without time zone DEFAULT now() NOT NULL,
    pedzona bigint,
    pedcausal_hit bigint,
    resumen text,
    pedporc_iva numeric(5,2)
);


ALTER TABLE movimiento.pedido OWNER TO usersgl;

--
-- TOC entry 1917 (class 1259 OID 24280)
-- Dependencies: 1916 6
-- Name: pedido_pedcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE pedido_pedcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.pedido_pedcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 1917
-- Name: pedido_pedcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE pedido_pedcodsx_seq OWNED BY pedido.pedcodsx;


--
-- TOC entry 1918 (class 1259 OID 24282)
-- Dependencies: 6
-- Name: picking; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE picking (
    pickcodsx integer NOT NULL,
    pickfecha timestamp without time zone NOT NULL,
    pickempresa bigint NOT NULL,
    pickcodpacking bigint NOT NULL,
    pickobservaciones character varying,
    pickestado character varying NOT NULL,
    pickpesoneto numeric(15,2),
    pickpesobruto numeric(15,2),
    pickvalor numeric(15,2),
    resumen text,
    pickpedido bigint,
    picknumpedido character varying
);


ALTER TABLE movimiento.picking OWNER TO usersgl;

--
-- TOC entry 1919 (class 1259 OID 24287)
-- Dependencies: 6
-- Name: picking_detalle; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE picking_detalle (
    pickdcodsx integer NOT NULL,
    pickdcodpicking bigint NOT NULL,
    pickdproducto bigint NOT NULL,
    pickdvalorunit numeric(15,2),
    pickdpesoneto numeric(15,2),
    pickdpesobruto numeric(15,2),
    pickdvalortotal numeric(15,2),
    pickdcantidad numeric(15,2),
    resumen text
);


ALTER TABLE movimiento.picking_detalle OWNER TO usersgl;

--
-- TOC entry 1920 (class 1259 OID 24292)
-- Dependencies: 6
-- Name: picking_detalle_packing; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE picking_detalle_packing (
    pickpcodsx integer NOT NULL,
    pickppickingdetalle bigint NOT NULL,
    pickppackingdet bigint NOT NULL,
    pickpcantidad numeric(15,2) NOT NULL,
    pickppesoneto numeric(15,2) NOT NULL,
    pickppesobruto numeric(15,2) NOT NULL,
    pickppesonetototal numeric(15,2) NOT NULL,
    pickppesobrutototal numeric(15,2) NOT NULL
);


ALTER TABLE movimiento.picking_detalle_packing OWNER TO usersgl;

--
-- TOC entry 1921 (class 1259 OID 24294)
-- Dependencies: 1920 6
-- Name: picking_detalle_packing_pickpcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE picking_detalle_packing_pickpcodsx_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.picking_detalle_packing_pickpcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 1921
-- Name: picking_detalle_packing_pickpcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE picking_detalle_packing_pickpcodsx_seq OWNED BY picking_detalle_packing.pickpcodsx;


--
-- TOC entry 1922 (class 1259 OID 24296)
-- Dependencies: 6 1919
-- Name: picking_detalle_pickdcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE picking_detalle_pickdcodsx_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.picking_detalle_pickdcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 1922
-- Name: picking_detalle_pickdcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE picking_detalle_pickdcodsx_seq OWNED BY picking_detalle.pickdcodsx;


--
-- TOC entry 1923 (class 1259 OID 24298)
-- Dependencies: 6 1918
-- Name: picking_pickcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE picking_pickcodsx_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.picking_pickcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 1923
-- Name: picking_pickcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE picking_pickcodsx_seq OWNED BY picking.pickcodsx;


--
-- TOC entry 1924 (class 1259 OID 24300)
-- Dependencies: 6
-- Name: referencia_despacho; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE referencia_despacho (
    refdcodsx integer NOT NULL,
    refddespacho_pedido bigint NOT NULL,
    refdproducto bigint NOT NULL,
    refdcant numeric(15,2),
    refdvalor numeric(15,2),
    refdpesoneto numeric(15,2),
    refdpesobruto numeric(15,2),
    refdserial character varying
);


ALTER TABLE movimiento.referencia_despacho OWNER TO usersgl;

--
-- TOC entry 1925 (class 1259 OID 24305)
-- Dependencies: 6
-- Name: referencia_despacho_pedido; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE referencia_despacho_pedido (
    refdpcodsx integer NOT NULL,
    refdpcodrefd bigint NOT NULL,
    refdcodrefp bigint NOT NULL,
    refdcant numeric(15,2) NOT NULL,
    refdvalorunit numeric(15,2) NOT NULL,
    refdvalortotal numeric(15,2) NOT NULL,
    refdpesoneto numeric(15,2) NOT NULL,
    refdpesobruto numeric(15,2) NOT NULL,
    refdpesonetototal numeric(15,2) NOT NULL,
    refdpesobrutototal numeric(15,2) NOT NULL
);


ALTER TABLE movimiento.referencia_despacho_pedido OWNER TO usersgl;

--
-- TOC entry 1926 (class 1259 OID 24307)
-- Dependencies: 1925 6
-- Name: referencia_despacho_pedido_refdpcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE referencia_despacho_pedido_refdpcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.referencia_despacho_pedido_refdpcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 1926
-- Name: referencia_despacho_pedido_refdpcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE referencia_despacho_pedido_refdpcodsx_seq OWNED BY referencia_despacho_pedido.refdpcodsx;


--
-- TOC entry 1927 (class 1259 OID 24309)
-- Dependencies: 6 1924
-- Name: referencia_despacho_refdcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE referencia_despacho_refdcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.referencia_despacho_refdcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 1927
-- Name: referencia_despacho_refdcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE referencia_despacho_refdcodsx_seq OWNED BY referencia_despacho.refdcodsx;


SET default_with_oids = false;

--
-- TOC entry 2019 (class 1259 OID 647142)
-- Dependencies: 6
-- Name: referencia_despacho_serial; Type: TABLE; Schema: movimiento; Owner: postgres; Tablespace: 
--

CREATE TABLE referencia_despacho_serial (
    refdscodsx integer NOT NULL,
    refdsreferencia_despacho bigint NOT NULL,
    refdsserial character varying
);


ALTER TABLE movimiento.referencia_despacho_serial OWNER TO postgres;

--
-- TOC entry 2018 (class 1259 OID 647140)
-- Dependencies: 2019 6
-- Name: referencia_despacho_serial_refdscodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: postgres
--

CREATE SEQUENCE referencia_despacho_serial_refdscodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.referencia_despacho_serial_refdscodsx_seq OWNER TO postgres;

--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 2018
-- Name: referencia_despacho_serial_refdscodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: postgres
--

ALTER SEQUENCE referencia_despacho_serial_refdscodsx_seq OWNED BY referencia_despacho_serial.refdscodsx;


SET default_with_oids = true;

--
-- TOC entry 1928 (class 1259 OID 24311)
-- Dependencies: 6
-- Name: referencia_pedido; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE referencia_pedido (
    refpcodsx integer NOT NULL,
    refpnumpedido bigint NOT NULL,
    refpproducto bigint NOT NULL,
    refpbodega bigint NOT NULL,
    refpposicion character varying NOT NULL,
    refpcantidad numeric(15,2) NOT NULL,
    refpvalorunit numeric(15,2) NOT NULL,
    refpvalortotal numeric(15,2) NOT NULL,
    refpentrada bigint NOT NULL,
    refpnacdetalle bigint,
    refpsaldo numeric(15,2) NOT NULL,
    refppesoneto numeric(15,2),
    refppesobruto numeric(15,2),
    refppesonetototal numeric(15,2),
    refppesobrutototal numeric(15,2),
    resumen text
);


ALTER TABLE movimiento.referencia_pedido OWNER TO usersgl;

--
-- TOC entry 1929 (class 1259 OID 24316)
-- Dependencies: 1928 6
-- Name: referencia_pedido_refpcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE referencia_pedido_refpcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.referencia_pedido_refpcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 1929
-- Name: referencia_pedido_refpcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE referencia_pedido_refpcodsx_seq OWNED BY referencia_pedido.refpcodsx;


--
-- TOC entry 1930 (class 1259 OID 24318)
-- Dependencies: 2444 6
-- Name: referencia_trafico; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE referencia_trafico (
    reftcodsx integer NOT NULL,
    reftnumfacturatrafico bigint NOT NULL,
    reftproducto bigint NOT NULL,
    reftcantidad numeric(10,2) NOT NULL,
    reftpesoneto numeric(15,2) NOT NULL,
    reftpesobruto numeric(15,2) NOT NULL,
    reftfobunit numeric(15,2) NOT NULL,
    reftfobtotal numeric(15,2) NOT NULL,
    reftcifunit numeric(15,2) NOT NULL,
    reftciftotal numeric(15,2) NOT NULL,
    reftpesonetototal numeric(15,2) NOT NULL,
    reftpesobrutototal numeric(15,2) NOT NULL,
    reftmpacks numeric(15,2),
    reftserial character varying,
    reftserialdespacho character varying DEFAULT 'N'::character varying
);


ALTER TABLE movimiento.referencia_trafico OWNER TO usersgl;

--
-- TOC entry 1931 (class 1259 OID 24323)
-- Dependencies: 6 1930
-- Name: referencia_trafico_reftcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE referencia_trafico_reftcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.referencia_trafico_reftcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 1931
-- Name: referencia_trafico_reftcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE referencia_trafico_reftcodsx_seq OWNED BY referencia_trafico.reftcodsx;


SET default_with_oids = false;

--
-- TOC entry 1932 (class 1259 OID 24325)
-- Dependencies: 6
-- Name: reparacion; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE reparacion (
    repcodsx integer NOT NULL,
    repcodcia bigint NOT NULL,
    repfecha timestamp without time zone NOT NULL,
    repsaldo character varying NOT NULL,
    repdestino character varying NOT NULL,
    repestado character varying NOT NULL,
    resumen text,
    repobservacion character varying,
    reppedido bigint
);


ALTER TABLE movimiento.reparacion OWNER TO usersgl;

--
-- TOC entry 1933 (class 1259 OID 24330)
-- Dependencies: 6
-- Name: reparacion_detalle; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE reparacion_detalle (
    repdcodsx integer NOT NULL,
    repdreparacion bigint NOT NULL,
    repdproducto bigint NOT NULL,
    repdaveria bigint NOT NULL,
    repdcant_pleg numeric(15,2) NOT NULL,
    repdcant_prod numeric(15,2) NOT NULL,
    repdbodega bigint NOT NULL,
    repdposicion character varying NOT NULL,
    resumen text,
    repdtiposaldo character varying,
    repdbodega_dest bigint,
    repdposicion_dest character varying,
    serial character varying
);


ALTER TABLE movimiento.reparacion_detalle OWNER TO usersgl;

--
-- TOC entry 1934 (class 1259 OID 24335)
-- Dependencies: 1933 6
-- Name: reparacion_detalle_repdcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE reparacion_detalle_repdcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.reparacion_detalle_repdcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 1934
-- Name: reparacion_detalle_repdcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE reparacion_detalle_repdcodsx_seq OWNED BY reparacion_detalle.repdcodsx;


--
-- TOC entry 1935 (class 1259 OID 24337)
-- Dependencies: 6
-- Name: reparacion_nacdet; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE reparacion_nacdet (
    repndcodsx integer NOT NULL,
    repndrepdetalle bigint NOT NULL,
    repndnacdet bigint NOT NULL,
    repndcant numeric(15,2) NOT NULL,
    repndaverianacdet bigint,
    repndnacdet_rep bigint
);


ALTER TABLE movimiento.reparacion_nacdet OWNER TO usersgl;

--
-- TOC entry 1936 (class 1259 OID 24339)
-- Dependencies: 6 1935
-- Name: reparacion_nacdet_repndcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE reparacion_nacdet_repndcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.reparacion_nacdet_repndcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 1936
-- Name: reparacion_nacdet_repndcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE reparacion_nacdet_repndcodsx_seq OWNED BY reparacion_nacdet.repndcodsx;


--
-- TOC entry 1937 (class 1259 OID 24341)
-- Dependencies: 1932 6
-- Name: reparacion_repcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE reparacion_repcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.reparacion_repcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 1937
-- Name: reparacion_repcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE reparacion_repcodsx_seq OWNED BY reparacion.repcodsx;


SET search_path = public, pg_catalog;

SET default_with_oids = true;

--
-- TOC entry 1938 (class 1259 OID 24343)
-- Dependencies: 2448 2449 2450 7
-- Name: compania; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE compania (
    comcodsx integer NOT NULL,
    comdireccion character varying NOT NULL,
    comnombre character varying NOT NULL,
    comfax character varying,
    comciudad character varying,
    comemail character varying,
    comgerente character varying,
    comcontacto character varying NOT NULL,
    comcargo character varying,
    comtelefono character varying NOT NULL,
    resumen text,
    comnit character varying NOT NULL,
    comtipo character varying DEFAULT 'N'::character varying,
    cominventario character varying DEFAULT 'A'::character varying,
    commapa character varying DEFAULT 'S'::character varying
);


ALTER TABLE public.compania OWNER TO usersgl;

--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 1938
-- Name: TABLE compania; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE compania IS 'Almacena los datos de las empresas a las cuales se les presta el servicio de almacenamiento e inventario, esta tabla es de vital importancia para la aplicacion, puesto que las demas tablas asocian esta a sus datos, tales como productos, categorias, ingresos, etc';


--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 1938
-- Name: COLUMN compania.comtipo; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON COLUMN compania.comtipo IS 'Tipo de Compania: Normal, Patios';


--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 1938
-- Name: COLUMN compania.cominventario; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON COLUMN compania.cominventario IS 'Toma Inventario: Automatico(FIFO), Manual';


--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 1938
-- Name: COLUMN compania.commapa; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON COLUMN compania.commapa IS 'Utiliza Mapa para toma Inventario o es Manual';


--
-- TOC entry 1939 (class 1259 OID 24351)
-- Dependencies: 2452 2453 2454 2455 2456 2457 2458 2459 2460 2461 2462 2463 2464 2465 2467 2468 2469 7
-- Name: producto; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE producto (
    procodsx integer NOT NULL,
    procodigocia bigint NOT NULL,
    prodescripcion character varying NOT NULL,
    procategoria bigint NOT NULL,
    promodelo character varying NOT NULL,
    prosubpartida character varying NOT NULL,
    proean character varying DEFAULT 'N'::character varying,
    procodbarra character(1) DEFAULT 'N'::bpchar,
    progarantia character(1) DEFAULT 'N'::bpchar,
    prokiloreal numeric(20,4) DEFAULT 0 NOT NULL,
    provolumen numeric(22,6) DEFAULT 0 NOT NULL,
    prokilovolumen numeric(22,6) DEFAULT 0,
    prouniempaque numeric(15,2) DEFAULT 0 NOT NULL,
    prokvuniempaque numeric(15,2) DEFAULT 0,
    provoluniempaque numeric(20,4) DEFAULT 0,
    prounimasterpac numeric(15,2) DEFAULT 0 NOT NULL,
    prokvmasterpack numeric(22,6) DEFAULT 0,
    propesobmp numeric(20,4) DEFAULT 0,
    resumen text,
    provolmasterpac numeric(22,6) DEFAULT 0,
    procodigobarra character varying,
    proestado character varying DEFAULT 'ACTIVO'::character varying NOT NULL,
    proobservacion character varying,
    protipoproducto bigint NOT NULL,
    CONSTRAINT ck_codbarra CHECK (((procodbarra = 'S'::bpchar) OR (procodbarra = 'N'::bpchar))),
    CONSTRAINT ck_ean CHECK ((((proean)::text = 'S'::text) OR ((proean)::text = 'N'::text))),
    CONSTRAINT ck_garantia CHECK (((progarantia = 'S'::bpchar) OR (progarantia = 'N'::bpchar)))
);


ALTER TABLE public.producto OWNER TO usersgl;

--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 1939
-- Name: TABLE producto; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE producto IS 'Almacena los productos de las companias, dichos productos estan asociados a las categorias de la compania tambien';


SET search_path = movimiento, pg_catalog;

--
-- TOC entry 1940 (class 1259 OID 24373)
-- Dependencies: 2094 6
-- Name: reporte_ajustes; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_ajustes AS
    SELECT compania.comcodsx, compania.comnombre, producto.promodelo, producto.prodescripcion, ajuste.ajfecha AS fecha, entrada.entcodingreso, ajuste.ajsaldoant_nac, ajuste.ajnuevosaldo_nac, ajuste.ajsaldoant_nnac, ajuste.ajnuevosaldo_nnac FROM ajuste, public.compania, public.producto, entrada WHERE (((ajuste.ajcodcia = compania.comcodsx) AND (ajuste.ajentrada = entrada.entcodsx)) AND (entrada.entcodproducto = producto.procodsx)) ORDER BY compania.comcodsx, producto.promodelo;


ALTER TABLE movimiento.reporte_ajustes OWNER TO usersgl;

SET search_path = public, pg_catalog;

--
-- TOC entry 1941 (class 1259 OID 24376)
-- Dependencies: 7
-- Name: bodega; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE bodega (
    bodcodsx integer NOT NULL,
    bodnombre character varying NOT NULL,
    boddesc character varying NOT NULL,
    bodurlplano character varying NOT NULL,
    resumen text
);


ALTER TABLE public.bodega OWNER TO usersgl;

--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 1941
-- Name: TABLE bodega; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE bodega IS 'Tabla que representa las bodegas en las que la empresa tenga mercancia';


SET search_path = movimiento, pg_catalog;

--
-- TOC entry 1942 (class 1259 OID 24381)
-- Dependencies: 2095 6
-- Name: reporte_averias; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_averias AS
    SELECT compania.comcodsx, compania.comnombre, averia.avecodsx, averia.avefecha AS fecha, averia.aveingreso, producto.promodelo, producto.prodescripcion, b1.bodnombre AS bodorigen, entrada.entposicion, averia.aveestado AS avetipo, b2.bodnombre AS boddestino, averia.aveposdest, averia.avecant_pleg_nac, averia.avecant_pleg_nnac, averia.avecant_prod_nac, averia.avecant_prod_nnac, averia.avesaldo_pleg_nac, averia.avesaldo_pleg_nnac, averia.avesaldo_prod_nac, averia.avesaldo_prod_nnac FROM public.compania, averia, public.producto, public.bodega b1, public.bodega b2, entrada WHERE (((((compania.comcodsx = averia.avecompania) AND (averia.aveentrada = entrada.entcodsx)) AND (entrada.entcodproducto = producto.procodsx)) AND (b1.bodcodsx = entrada.entbodega)) AND (b2.bodcodsx = averia.aveboddest)) ORDER BY compania.comcodsx, producto.promodelo;


ALTER TABLE movimiento.reporte_averias OWNER TO usersgl;

SET search_path = public, pg_catalog;

--
-- TOC entry 1943 (class 1259 OID 24385)
-- Dependencies: 2471 7
-- Name: cliente; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE cliente (
    clicodsx integer NOT NULL,
    clinombre character varying NOT NULL,
    clinit character varying,
    clidireccion character varying,
    clitelefono character varying,
    cliciudad character varying,
    clicontacto character varying,
    climail character varying,
    cliobservacion character varying,
    clicodcompania bigint NOT NULL,
    resumen text,
    clicodigo character varying,
    clidevolucion character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE public.cliente OWNER TO usersgl;

--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 1943
-- Name: TABLE cliente; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE cliente IS 'Almacena los datos asociados a los clientes de la aplicacion, estos clientes son las companias que compran sus productos a las COMPANIAS';


--
-- TOC entry 1944 (class 1259 OID 24391)
-- Dependencies: 7
-- Name: transportadora; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE transportadora (
    transpcodsx integer NOT NULL,
    transpnombre character varying NOT NULL,
    transpdireccion character varying NOT NULL,
    transptel character varying NOT NULL,
    transpmail character varying,
    transpcontacto character varying NOT NULL,
    resumen text
);


ALTER TABLE public.transportadora OWNER TO usersgl;

SET search_path = movimiento, pg_catalog;

--
-- TOC entry 1945 (class 1259 OID 24396)
-- Dependencies: 2096 6
-- Name: reporte_despachos; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_despachos AS
    SELECT compania.comcodsx, compania.comnombre, cliente.clicodsx, cliente.clinombre, despacho.despcodsx, despacho.despfecha AS fecha, despacho.despobservacion, despacho.despplaca, despacho.despnombrecond, despacho.despbultos, despacho.despbultosarmados, despacho.desppesoneto, despacho.desppesobruto, despacho.despfob, transportadora.transpnombre, producto.promodelo, producto.prodescripcion, sum(referencia_despacho_pedido.refdcant) AS sum FROM despacho, public.compania, public.cliente, pedido, public.transportadora, despacho_pedido, referencia_despacho, public.producto, referencia_despacho_pedido WHERE (((((((((despacho.despempresa = compania.comcodsx) AND (cliente.clicodsx = pedido.pedcliente)) AND (despacho.desptransportadora = transportadora.transpcodsx)) AND ((despacho.despestado)::text = 'FINALIZADO'::text)) AND (despacho_pedido.despeddespacho = despacho.despcodsx)) AND (referencia_despacho.refddespacho_pedido = despacho_pedido.despedcodsx)) AND (referencia_despacho.refdproducto = producto.procodsx)) AND (referencia_despacho_pedido.refdpcodrefd = referencia_despacho.refdcodsx)) AND (pedido.pedcodsx = despacho_pedido.despedpedido)) GROUP BY compania.comnombre, cliente.clinombre, despacho.despcodsx, producto.promodelo, compania.comcodsx, cliente.clicodsx, despacho.despfecha, despacho.despobservacion, despacho.despplaca, despacho.despnombrecond, despacho.despbultos, despacho.despbultosarmados, despacho.desppesoneto, despacho.desppesobruto, despacho.despfob, transportadora.transpnombre, producto.prodescripcion ORDER BY compania.comnombre, cliente.clinombre, despacho.despcodsx, producto.promodelo;


ALTER TABLE movimiento.reporte_despachos OWNER TO usersgl;

SET search_path = public, pg_catalog;

--
-- TOC entry 1946 (class 1259 OID 24400)
-- Dependencies: 7
-- Name: ciudad; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE ciudad (
    ciucodigo character varying NOT NULL,
    ciunombre character varying NOT NULL,
    ciudepto character varying,
    resumen text
);


ALTER TABLE public.ciudad OWNER TO usersgl;

--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 1946
-- Name: TABLE ciudad; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE ciudad IS 'Almacena la informacion de las ciudades existentes';


--
-- TOC entry 1947 (class 1259 OID 24405)
-- Dependencies: 7
-- Name: departamento; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE departamento (
    depcodigo character varying NOT NULL,
    depnombre character varying NOT NULL,
    depzona bigint NOT NULL,
    resumen text
);


ALTER TABLE public.departamento OWNER TO usersgl;

--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 1947
-- Name: TABLE departamento; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE departamento IS 'implementa los datos de los departamentos geograficos almacenados';


--
-- TOC entry 1948 (class 1259 OID 24410)
-- Dependencies: 7
-- Name: sucursal; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE sucursal (
    succodsx integer NOT NULL,
    succodcliente bigint NOT NULL,
    sucnit character varying NOT NULL,
    sucnombre character varying NOT NULL,
    succiudad character varying NOT NULL,
    sucdepartamento character varying NOT NULL,
    succontacto character varying,
    succargo character varying,
    sucemail character varying,
    sucdireccion character varying NOT NULL,
    suctelefono character varying NOT NULL,
    resumen text,
    succodigo character varying
);


ALTER TABLE public.sucursal OWNER TO usersgl;

--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 1948
-- Name: TABLE sucursal; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE sucursal IS 'Almacena sucursales (oficinas) que tenga un cliente (tabla cliente), con el objeto de poder manejar diferentes sitios de despacho de mercancia';


SET search_path = movimiento, pg_catalog;

--
-- TOC entry 1949 (class 1259 OID 24415)
-- Dependencies: 2097 6
-- Name: reporte_despachos_encabezado; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_despachos_encabezado AS
    SELECT compania.comcodsx, compania.comnombre, pedido.pedguia, (despacho.despfecha)::date AS fecha, cliente.clicodsx, cliente.clinombre, sucursal.sucnombre, pedido.peddireccion AS clidireccion, ciudad.ciunombre, departamento.depnombre, sum(despacho_pedido.despedbultos) AS bultos, sum(despacho_pedido.despedbultosarmados) AS bultosarmados, sum(despacho_pedido.despedvalor) AS valor, sum(despacho_pedido.despedpesoneto) AS pesoneto, sum(despacho_pedido.despedpesobruto) AS pesobruto FROM public.compania, pedido, public.cliente, public.ciudad, public.departamento, despacho_pedido, despacho, public.sucursal WHERE ((((((((sucursal.succodsx = pedido.pedsucursal) AND (compania.comcodsx = pedido.pedcompania)) AND (pedido.pedcliente = cliente.clicodsx)) AND ((pedido.pedciudad)::text = (ciudad.ciucodigo)::text)) AND ((pedido.peddepartamento)::text = (departamento.depcodigo)::text)) AND (pedido.pedcodsx = despacho_pedido.despedpedido)) AND (despacho.despcodsx = despacho_pedido.despeddespacho)) AND ((despacho.despestado)::text = 'FINALIZADO'::text)) GROUP BY compania.comcodsx, cliente.clinombre, pedido.pedguia, compania.comnombre, despacho.despfecha, cliente.clicodsx, sucursal.sucnombre, pedido.peddireccion, ciudad.ciunombre, departamento.depnombre ORDER BY compania.comcodsx, cliente.clinombre, pedido.pedguia;


ALTER TABLE movimiento.reporte_despachos_encabezado OWNER TO usersgl;

--
-- TOC entry 1950 (class 1259 OID 24419)
-- Dependencies: 2098 6
-- Name: reporte_despachos_encabezado_new; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_despachos_encabezado_new AS
    SELECT compania.comcodsx, compania.comnombre, pedido.pedguia, (despacho.despfecha)::date AS fecha, cliente.clicodsx, cliente.clinombre, sucursal.sucnombre, pedido.peddireccion AS clidireccion, ciudad.ciunombre, departamento.depnombre, sum(despacho_pedido.despedbultos) AS bultos, sum(despacho_pedido.despedbultosarmados) AS bultosarmados, sum(despacho_pedido.despedvalor) AS valor, sum(despacho_pedido.despedpesoneto) AS pesoneto, sum(despacho_pedido.despedpesobruto) AS pesobruto FROM public.compania, pedido, public.cliente, public.ciudad, public.departamento, despacho_pedido, despacho, public.sucursal WHERE (((((((((sucursal.succodsx = pedido.pedsucursal) OR ((sucursal.succodigo)::text = (pedido.pedsucursal)::text)) AND (compania.comcodsx = pedido.pedcompania)) AND (pedido.pedcliente = cliente.clicodsx)) AND ((pedido.pedciudad)::text = (ciudad.ciucodigo)::text)) AND ((pedido.peddepartamento)::text = (departamento.depcodigo)::text)) AND (pedido.pedcodsx = despacho_pedido.despedpedido)) AND (despacho.despcodsx = despacho_pedido.despeddespacho)) AND ((despacho.despestado)::text = 'FINALIZADO'::text)) GROUP BY compania.comcodsx, cliente.clinombre, pedido.pedguia, compania.comnombre, despacho.despfecha, cliente.clicodsx, sucursal.sucnombre, pedido.peddireccion, ciudad.ciunombre, departamento.depnombre ORDER BY compania.comcodsx, cliente.clinombre, pedido.pedguia;


ALTER TABLE movimiento.reporte_despachos_encabezado_new OWNER TO usersgl;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 1951 (class 1259 OID 24423)
-- Dependencies: 7
-- Name: causal; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE causal (
    caucodsx integer NOT NULL,
    caudesc character varying NOT NULL,
    cauresponsable character varying NOT NULL,
    causnota character varying,
    causdocsoporte character varying,
    resumen text
);


ALTER TABLE public.causal OWNER TO usersgl;

--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 1951
-- Name: TABLE causal; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE causal IS 'Tabla que contiene los CAUSALES DE DEVOLUCION establecidos, con el animo de facilitar la estraccion de informes';


SET default_with_oids = true;

--
-- TOC entry 1952 (class 1259 OID 24428)
-- Dependencies: 7
-- Name: zona; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE zona (
    zoncodsx integer NOT NULL,
    zonnombre character varying NOT NULL,
    resumen text
);


ALTER TABLE public.zona OWNER TO usersgl;

--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 1952
-- Name: TABLE zona; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE zona IS 'Almacena datos para almacenar  ZONAS geograficas, las cuales son agrupaciones de departamentos';


SET search_path = movimiento, pg_catalog;

--
-- TOC entry 1953 (class 1259 OID 24433)
-- Dependencies: 2099 6
-- Name: reporte_devoluciones; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_devoluciones AS
    SELECT compania.comcodsx, compania.comnombre, ingreso.ingcodsx, ingreso.ingcausal AS causal, causal.caudesc, ingreso.ingfecha AS fecha, cliente.clicodsx, cliente.clinombre, producto.promodelo, producto.prodescripcion, sum(entrada.entcantidad) AS cantidad, sum(entrada.entpesonetototal) AS pesoneto, sum(entrada.entpesobrutototal) AS pesobruto, sum(entrada.entvalortotal) AS valor, ciudad.ciunombre, zona.zonnombre FROM public.compania, ingreso, public.cliente, entrada, public.producto, public.causal, public.ciudad, public.departamento, public.zona WHERE (((((((((((ingreso.ingtipo)::text = 'DEVOLUCION'::text) AND ((ingreso.ingestado)::text = 'FINALIZADO'::text)) AND (compania.comcodsx = ingreso.ingcodcia)) AND (cliente.clicodsx = ingreso.ingcli_devolucion)) AND (entrada.entcodproducto = producto.procodsx)) AND (entrada.entcodingreso = ingreso.ingcodsx)) AND ((ingreso.ingcausal)::text = (causal.caucodsx)::text)) AND ((ciudad.ciucodigo)::text = (ingreso.ingciudad_dev)::text)) AND ((ciudad.ciudepto)::text = (departamento.depcodigo)::text)) AND (departamento.depzona = zona.zoncodsx)) GROUP BY compania.comnombre, cliente.clicodsx, ingreso.ingcodsx, compania.comcodsx, ingreso.ingcausal, causal.caudesc, ingreso.ingfecha, cliente.clinombre, producto.promodelo, producto.prodescripcion, ciudad.ciunombre, zona.zonnombre ORDER BY compania.comnombre, cliente.clicodsx, ingreso.ingcodsx;


ALTER TABLE movimiento.reporte_devoluciones OWNER TO usersgl;

--
-- TOC entry 1954 (class 1259 OID 24437)
-- Dependencies: 2100 6
-- Name: reporte_ingresos; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_ingresos AS
    SELECT compania.comcodsx, compania.comnombre, ingreso.ingcodsx, ingreso.ingtipo, ingreso.ingtrafico, ingreso.ingfecha AS fecha, ingreso.ingobservacion, ingreso.ingpesoneto, ingreso.ingpesobruto, ingreso.ingfob AS valor, producto.promodelo, producto.prodescripcion, bodega.bodnombre, entrada.entposicion, entrada.entcantidad, entrada.entpesoneto, entrada.entpesonetototal, entrada.entpesobruto, entrada.entpesobrutototal, ingreso.ingconsec, ingreso.ingconseczfp FROM public.compania, ingreso, entrada, public.producto, public.bodega WHERE ((((((compania.comcodsx = ingreso.ingcodcia) AND (entrada.entcodingreso = ingreso.ingcodsx)) AND (producto.procodsx = entrada.entcodproducto)) AND (bodega.bodcodsx = entrada.entbodega)) AND ((ingreso.ingestado)::text = 'FINALIZADO'::text)) AND (entrada.entcantidad > (0)::numeric)) ORDER BY compania.comcodsx, ingreso.ingcodsx, producto.promodelo;


ALTER TABLE movimiento.reporte_ingresos OWNER TO usersgl;

--
-- TOC entry 1955 (class 1259 OID 24441)
-- Dependencies: 2477 2478 2479 2480 2481 2482 2483 6
-- Name: trafico; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE trafico (
    trafcodsx integer NOT NULL,
    trafcompania bigint NOT NULL,
    traffechacreacion timestamp without time zone NOT NULL,
    trafdocumento character varying NOT NULL,
    trafembarque character varying,
    traftransportadora character varying,
    trafprocedencia character varying,
    traffechaarribopuerto timestamp without time zone,
    traffechapresentdta timestamp without time zone,
    traffechaaprobaciondta timestamp without time zone,
    traffob numeric(15,2) DEFAULT 0,
    trafcif numeric(15,2) DEFAULT 0,
    trafconsec integer,
    trafnumerofmm integer,
    traftrm numeric(10,2),
    trafnumdta character varying,
    trafnumsobordo character varying,
    traffechadescargue timestamp without time zone,
    traffechalevante timestamp without time zone,
    traffechaingresozf timestamp without time zone,
    trafentregadocusia timestamp without time zone,
    trafobservaciones character varying,
    trafpesobruto numeric(15,2) DEFAULT 0,
    trafusuario integer NOT NULL,
    traffechasobordo timestamp without time zone,
    traforigen character varying,
    trafpesoneto numeric(15,2) DEFAULT 0,
    traffletesseguro numeric(15,2) DEFAULT 0,
    trafestado character varying DEFAULT 'TRAMITE'::character varying NOT NULL,
    trafcantidad numeric DEFAULT 0,
    resumen text,
    trafpedido character varying,
    trafmotonave character varying
);


ALTER TABLE movimiento.trafico OWNER TO usersgl;

--
-- TOC entry 1956 (class 1259 OID 24453)
-- Dependencies: 2101 6
-- Name: reporte_inventario; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_inventario AS
    SELECT compania.comcodsx, compania.comnombre, trafico.trafcodsx, trafico.trafembarque AS embarque, trafico.traffechacreacion AS fecha, trafico.trafdocumento, trafico.trafnumdta, trafico.trafconsec, trafico.trafnumerofmm, ingreso.ingcodsx, ingreso.ingpesoneto, ingreso.ingpesobruto, ingreso.ingfob, producto.procodsx, producto.promodelo, producto.prodescripcion, sum(entrada.entcantidad) AS cantidad, sum(entrada.entpesonetototal) AS neto, sum(entrada.entpesobrutototal) AS bruto, sum(entrada.entvalortotal) AS valor, sum(entrada.entsaldonac) AS saldonac, sum(entrada.entsaldosinnac) AS saldosinnac FROM public.compania, trafico, ingreso, entrada, public.producto WHERE ((((((compania.comcodsx = trafico.trafcompania) AND (trafico.trafcodsx = ingreso.ingtrafico)) AND (entrada.entcodingreso = ingreso.ingcodsx)) AND (producto.procodsx = entrada.entcodproducto)) AND ((ingreso.ingestado)::text = 'FINALIZADO'::text)) AND ((trafico.trafestado)::text = 'FINALIZADO'::text)) GROUP BY compania.comcodsx, trafico.trafcodsx, producto.promodelo, compania.comnombre, trafico.trafembarque, trafico.traffechacreacion, trafico.trafdocumento, trafico.trafnumdta, trafico.trafconsec, trafico.trafnumerofmm, ingreso.ingcodsx, ingreso.ingpesoneto, ingreso.ingpesobruto, ingreso.ingfob, producto.procodsx, producto.prodescripcion ORDER BY compania.comcodsx, trafico.trafcodsx, producto.promodelo;


ALTER TABLE movimiento.reporte_inventario OWNER TO usersgl;

--
-- TOC entry 1957 (class 1259 OID 24457)
-- Dependencies: 2102 6
-- Name: reporte_modelos_embarque; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_modelos_embarque AS
    SELECT compania.comcodsx, compania.comnombre, ingreso.ingcodsx, ingreso.ingfecha AS fecha, ingreso.ingtrafico, trafico.trafembarque AS embarque, trafico.trafdocumento, producto.promodelo, producto.prodescripcion, bodega.bodnombre, entrada.entposicion, entrada.entcantidad FROM public.compania, ingreso, trafico, entrada, public.producto, public.bodega WHERE ((((((((compania.comcodsx = ingreso.ingcodcia) AND ((ingreso.ingtipo)::text = 'TRAFICO'::text)) AND ((ingreso.ingestado)::text = 'FINALIZADO'::text)) AND (trafico.trafcodsx = ingreso.ingtrafico)) AND (entrada.entcodingreso = ingreso.ingcodsx)) AND (producto.procodsx = entrada.entcodproducto)) AND (entrada.entbodega = bodega.bodcodsx)) AND (entrada.entcantidad > (0)::numeric)) ORDER BY compania.comnombre, ingreso.ingcodsx, producto.promodelo;


ALTER TABLE movimiento.reporte_modelos_embarque OWNER TO usersgl;

--
-- TOC entry 1958 (class 1259 OID 24461)
-- Dependencies: 2103 6
-- Name: reporte_movimientos_ingreso; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_movimientos_ingreso AS
    SELECT compania.comcodsx, compania.comnombre, producto.promodelo, producto.prodescripcion, ingreso.ingcodsx, ingreso.ingfecha AS fecha, ingreso.ingtipo, ingreso.ingtrafico, sum(entrada.entpesonetototal) AS entpesoneto, sum(entrada.entpesobrutototal) AS entpesobruto, sum(entrada.entcantidad) AS cantidad FROM public.compania, public.producto, entrada, ingreso WHERE ((((compania.comcodsx = producto.procodigocia) AND (entrada.entcodproducto = producto.procodsx)) AND (entrada.entcodingreso = ingreso.ingcodsx)) AND ((ingreso.ingestado)::text = 'FINALIZADO'::text)) GROUP BY compania.comnombre, producto.promodelo, ingreso.ingcodsx, compania.comcodsx, producto.prodescripcion, ingreso.ingfecha, ingreso.ingtipo, ingreso.ingtrafico ORDER BY compania.comnombre, producto.promodelo, ingreso.ingcodsx;


ALTER TABLE movimiento.reporte_movimientos_ingreso OWNER TO usersgl;

--
-- TOC entry 1959 (class 1259 OID 24465)
-- Dependencies: 2104 6
-- Name: reporte_movimientos_salida; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_movimientos_salida AS
    SELECT compania.comcodsx, compania.comnombre, producto.promodelo, producto.prodescripcion, despacho.despcodsx, despacho.despfecha AS fecha, despacho.despplaca, pedido.pedcodsx, pedido.pednumpedido, pedido.pedguia, pedido.pedfactura, despacho_pedido.despedpedido, referencia_despacho_pedido.refdvalorunit, sum(referencia_despacho_pedido.refdcant) AS sum, referencia_despacho_pedido.refdvalortotal, referencia_despacho_pedido.refdpesonetototal, referencia_despacho_pedido.refdpesobrutototal FROM public.compania, public.producto, despacho, despacho_pedido, referencia_despacho, referencia_despacho_pedido, referencia_pedido, pedido WHERE ((((((((compania.comcodsx = producto.procodigocia) AND (producto.procodsx = referencia_despacho.refdproducto)) AND (referencia_despacho.refddespacho_pedido = despacho_pedido.despedcodsx)) AND (despacho_pedido.despeddespacho = despacho.despcodsx)) AND (referencia_pedido.refpcodsx = referencia_despacho_pedido.refdcodrefp)) AND (pedido.pedcodsx = despacho_pedido.despedpedido)) AND (referencia_despacho_pedido.refdpcodrefd = referencia_despacho.refdcodsx)) AND ((despacho.despestado)::text = 'FINALIZADO'::text)) GROUP BY compania.comnombre, producto.promodelo, despacho.despcodsx, pedido.pedcodsx, compania.comcodsx, producto.prodescripcion, despacho.despfecha, despacho.despplaca, pedido.pednumpedido, pedido.pedguia, pedido.pedfactura, despacho_pedido.despedpedido, referencia_despacho_pedido.refdvalorunit, referencia_despacho_pedido.refdvalortotal, referencia_despacho_pedido.refdpesonetototal, referencia_despacho_pedido.refdpesobrutototal ORDER BY compania.comnombre, producto.promodelo, despacho.despcodsx, pedido.pedcodsx;


ALTER TABLE movimiento.reporte_movimientos_salida OWNER TO usersgl;

--
-- TOC entry 1960 (class 1259 OID 24469)
-- Dependencies: 2105 6
-- Name: reporte_nacionalizaciones; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_nacionalizaciones AS
    SELECT compania.comcodsx, compania.comnombre, nacionalizacion.naccodsx, nacionalizacion.nacfecha AS fecha, nacionalizacion.nacdeclaracion, nacionalizacion.nacfechadeclaracion, nacionalizacion.nacdosia, nacionalizacion.nacobservaciones, trafico.trafembarque AS embarque, producto.promodelo, producto.prodescripcion, sum(nacionalizacion_detalle.nadcantidad) AS sum, nacionalizacion.nacingreso, trafico.trafcodsx, trafico.trafdocumento, nacionalizacion.nacconsec, nacionalizacion.nacconseczfp FROM public.compania, nacionalizacion, nacionalizacion_detalle, public.producto, entrada, ingreso, trafico WHERE (((((((nacionalizacion.nacempresa = compania.comcodsx) AND ((nacionalizacion.nacestado)::text = 'FINALIZADO'::text)) AND (nacionalizacion_detalle.nadcodnac = nacionalizacion.naccodsx)) AND (nacionalizacion_detalle.nadentrada = entrada.entcodsx)) AND (entrada.entcodproducto = producto.procodsx)) AND (entrada.entcodingreso = ingreso.ingcodsx)) AND (trafico.trafcodsx = ingreso.ingtrafico)) GROUP BY compania.comnombre, nacionalizacion.naccodsx, producto.promodelo, compania.comcodsx, nacionalizacion.nacfecha, nacionalizacion.nacdeclaracion, nacionalizacion.nacfechadeclaracion, nacionalizacion.nacdosia, nacionalizacion.nacobservaciones, trafico.trafembarque, producto.prodescripcion, nacionalizacion.nacingreso, trafico.trafcodsx, trafico.trafdocumento, nacionalizacion.nacconsec, nacionalizacion.nacconseczfp ORDER BY compania.comnombre, nacionalizacion.naccodsx, producto.promodelo;


ALTER TABLE movimiento.reporte_nacionalizaciones OWNER TO usersgl;

--
-- TOC entry 1961 (class 1259 OID 24473)
-- Dependencies: 2106 6
-- Name: reporte_packing; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_packing AS
    SELECT compania.comcodsx, compania.comnombre, packing.packcodsx, packing.packfecha AS fecha, packing.packobservaciones, packing.packpesoneto, packing.packpesobruto, producto.promodelo, producto.prodescripcion, packing_detalle.packdpesoneto, packing_detalle.packdpesobruto, packing_detalle.packdcantidad, bodega.bodnombre, packing_detalle_posicion.packpposicion, packing_detalle_posicion.packpcantidad, packing_detalle_posicion.packppesoneto, packing_detalle_posicion.packppesobruto, packing_detalle_posicion.packppesonetototal, packing_detalle_posicion.packppesobrutototal FROM public.compania, packing, packing_detalle, packing_detalle_posicion, public.producto, public.bodega WHERE ((((((compania.comcodsx = packing.packempresa) AND (packing.packcodsx = packing_detalle.packdpacking)) AND (packing_detalle_posicion.packppackingdet = packing_detalle.packdcodsx)) AND (producto.procodsx = packing_detalle.packdproducto)) AND (bodega.bodcodsx = packing_detalle_posicion.packpbodega)) AND ((packing.packestado)::text = 'FINALIZADO'::text)) ORDER BY compania.comcodsx, packing.packcodsx, producto.promodelo;


ALTER TABLE movimiento.reporte_packing OWNER TO usersgl;

--
-- TOC entry 1962 (class 1259 OID 24477)
-- Dependencies: 2107 6
-- Name: reporte_pedidos; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_pedidos AS
    SELECT compania.comcodsx, compania.comnombre, pedido.pedcodsx, pedido.pednumpedido, pedido.pedordencompra, pedido.pedguia, pedido.pedfechasistema AS fecha, pedido.pedfechavenc, cliente.clinombre, cliente.clicodsx, pedido.peddireccion, ciudad.ciunombre, departamento.depnombre, pedido.pedobservaciones, pedido.pedfactura, pedido.pedsubtotal, pedido.pediva, pedido.peddescuento, pedido.pedtotal, pedido.pedpicking, pedido.pedpesoneto, pedido.pedpesobruto, producto.promodelo, producto.prodescripcion, bodega.bodnombre, referencia_pedido.refpposicion, referencia_pedido.refpcantidad, referencia_pedido.refpvalorunit, referencia_pedido.refpvalortotal, referencia_pedido.refppesoneto, referencia_pedido.refppesobruto, referencia_pedido.refppesonetototal, referencia_pedido.refppesobrutototal FROM public.compania, pedido, referencia_pedido, public.producto, public.cliente, public.ciudad, public.departamento, public.bodega WHERE ((((((((compania.comcodsx = pedido.pedcompania) AND (pedido.pedcodsx = referencia_pedido.refpnumpedido)) AND (producto.procodsx = referencia_pedido.refpproducto)) AND (cliente.clicodsx = pedido.pedcliente)) AND ((pedido.pedciudad)::text = (ciudad.ciucodigo)::text)) AND ((pedido.peddepartamento)::text = (departamento.depcodigo)::text)) AND ((pedido.pedestado)::text = 'FINALIZADO'::text)) AND (bodega.bodcodsx = referencia_pedido.refpbodega)) ORDER BY compania.comcodsx, pedido.pedcodsx, producto.promodelo;


ALTER TABLE movimiento.reporte_pedidos OWNER TO usersgl;

--
-- TOC entry 1963 (class 1259 OID 24481)
-- Dependencies: 2108 6
-- Name: reporte_picking; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_picking AS
    SELECT compania.comcodsx, compania.comnombre, picking.pickcodsx, picking.pickfecha AS fecha, picking.pickobservaciones, picking.pickpesoneto, picking.pickpesobruto, picking.pickvalor, producto.promodelo, producto.prodescripcion, picking_detalle.pickdpesoneto, picking_detalle.pickdpesobruto, picking_detalle.pickdcantidad, picking_detalle.pickdvalorunit, picking_detalle.pickdvalortotal, bodega.bodnombre, packing_detalle_posicion.packpposicion, picking_detalle_packing.pickpcantidad, packing_detalle_posicion.packppesoneto, packing_detalle_posicion.packppesobruto, (packing_detalle_posicion.packppesoneto * picking_detalle_packing.pickpcantidad) AS netotot, (packing_detalle_posicion.packppesobruto * picking_detalle_packing.pickpcantidad) AS brutotot, picking.pickcodpacking FROM public.compania, picking, picking_detalle, picking_detalle_packing, packing_detalle_posicion, public.producto, public.bodega WHERE (((((((compania.comcodsx = picking.pickempresa) AND (picking.pickcodsx = picking_detalle.pickdcodpicking)) AND (picking_detalle_packing.pickppickingdetalle = picking_detalle.pickdcodsx)) AND (picking_detalle_packing.pickppackingdet = packing_detalle_posicion.packpcodsx)) AND (producto.procodsx = picking_detalle.pickdproducto)) AND (bodega.bodcodsx = packing_detalle_posicion.packpbodega)) AND ((picking.pickestado)::text = 'FINALIZADO'::text)) ORDER BY compania.comcodsx, picking.pickcodsx, producto.promodelo;


ALTER TABLE movimiento.reporte_picking OWNER TO usersgl;

--
-- TOC entry 1964 (class 1259 OID 24485)
-- Dependencies: 2109 6
-- Name: reporte_reparaciones; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_reparaciones AS
    SELECT compania.comcodsx, compania.comnombre, reparacion.repcodsx, reparacion.repfecha AS fecha, reparacion.repsaldo, reparacion.repdestino, reparacion.repestado, reparacion.repobservacion, reparacion.reppedido, producto.procodsx, producto.promodelo, producto.prodescripcion, reparacion_detalle.repdaveria, reparacion_detalle.repdbodega, reparacion_detalle.repdposicion, reparacion_detalle.repdbodega_dest, reparacion_detalle.repdposicion_dest, reparacion_detalle.repdcant_pleg, reparacion_detalle.repdcant_prod FROM public.compania, reparacion, reparacion_detalle, public.producto WHERE (((compania.comcodsx = reparacion.repcodcia) AND (reparacion.repcodsx = reparacion_detalle.repdreparacion)) AND (reparacion_detalle.repdproducto = producto.procodsx)) ORDER BY compania.comcodsx, reparacion.repcodsx, producto.procodsx;


ALTER TABLE movimiento.reporte_reparaciones OWNER TO usersgl;

--
-- TOC entry 1965 (class 1259 OID 24488)
-- Dependencies: 2110 6
-- Name: reporte_saldo_reservado; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_saldo_reservado AS
    SELECT compania.comcodsx, compania.comnombre, producto.procodsx, producto.promodelo, producto.prodescripcion, sum(entrada.entsaldonac) AS nac, sum(entrada.entsaldosinnac) AS nnac, sum(entrada.entsaldonacf) AS nacf, sum(entrada.entsaldosinnacf) AS nnacf, (sum(entrada.entsaldonacf) - sum(entrada.entsaldonac)) AS reservadonac, (sum(entrada.entsaldosinnacf) - sum(entrada.entsaldosinnac)) AS reservadosinnac, sum(entrada.entsaldopesoneto) AS pesoneto, sum(entrada.entsaldopesobruto) AS pesobruto FROM public.compania, public.producto, entrada WHERE ((compania.comcodsx = producto.procodigocia) AND (producto.procodsx = entrada.entcodproducto)) GROUP BY producto.promodelo, compania.comcodsx, compania.comnombre, producto.procodsx, producto.prodescripcion ORDER BY producto.promodelo;


ALTER TABLE movimiento.reporte_saldo_reservado OWNER TO usersgl;

--
-- TOC entry 1966 (class 1259 OID 24491)
-- Dependencies: 2111 6
-- Name: reporte_saldos_averiados; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_saldos_averiados AS
    SELECT compania.comcodsx, compania.comnombre, producto.procodsx, producto.promodelo, producto.prodescripcion, sum(averia.avesaldo_pleg_nac) AS spleg_nac, sum(averia.avesaldo_prod_nac) AS sprod_nac, sum(averia.avesaldo_pleg_nnac) AS spleg_nnac, sum(averia.avesaldo_prod_nnac) AS sprid_nnac FROM averia, public.compania, public.producto WHERE ((compania.comcodsx = averia.avecompania) AND (producto.procodsx = averia.aveproducto)) GROUP BY compania.comcodsx, compania.comnombre, producto.procodsx, producto.promodelo, producto.prodescripcion HAVING ((((sum(averia.avesaldo_pleg_nac) + sum(averia.avesaldo_prod_nac)) + sum(averia.avesaldo_pleg_nnac)) + sum(averia.avesaldo_prod_nnac)) > (0)::numeric);


ALTER TABLE movimiento.reporte_saldos_averiados OWNER TO usersgl;

--
-- TOC entry 1967 (class 1259 OID 24494)
-- Dependencies: 2112 6
-- Name: reporte_saldos_embarque; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_saldos_embarque AS
    SELECT compania.comcodsx, compania.comnombre, ingreso.ingcodsx, ingreso.ingfecha, ingreso.ingpesoneto, ingreso.ingpesobruto, sum(entrada.entsaldopesoneto) AS saldopesoneto, sum(entrada.entsaldopesobruto) AS saldopesobruto, ingreso.ingtipo, trafico.trafembarque, trafico.trafdocumento, trafico.trafnumdta, trafico.trafcodsx FROM ingreso, trafico, entrada, public.producto, public.compania WHERE ((((ingreso.ingtrafico = trafico.trafcodsx) AND (entrada.entcodingreso = ingreso.ingcodsx)) AND (entrada.entcodproducto = producto.procodsx)) AND (trafico.trafcompania = compania.comcodsx)) GROUP BY compania.comcodsx, ingreso.ingcodsx, compania.comnombre, ingreso.ingfecha, ingreso.ingpesoneto, ingreso.ingpesobruto, ingreso.ingtipo, trafico.trafembarque, trafico.trafdocumento, trafico.trafnumdta, trafico.trafcodsx ORDER BY compania.comcodsx, ingreso.ingcodsx;


ALTER TABLE movimiento.reporte_saldos_embarque OWNER TO usersgl;

--
-- TOC entry 1968 (class 1259 OID 24498)
-- Dependencies: 2113 6
-- Name: reporte_saldos_posicion; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_saldos_posicion AS
    SELECT compania.comcodsx, compania.comnombre, bodega.bodcodsx, bodega.bodnombre AS bodega, entrada.entposicion AS posicion, producto.promodelo, producto.prodescripcion, entrada.entsaldonac, entrada.entsaldosinnac, entrada.entsaldopesoneto, entrada.entsaldopesobruto, entrada.entsaldonacf, entrada.entsaldosinnacf, ingreso.ingfecha AS fecha, ingreso.ingcodsx, ingreso.ingtrafico FROM entrada, public.bodega, public.producto, ingreso, public.compania WHERE ((((((compania.comcodsx = producto.procodigocia) AND (bodega.bodcodsx = entrada.entbodega)) AND (entrada.entcodproducto = producto.procodsx)) AND (entrada.entcodingreso = ingreso.ingcodsx)) AND ((ingreso.ingestado)::text = 'FINALIZADO'::text)) AND ((entrada.entsaldonacf > (0)::numeric) OR (entrada.entsaldosinnacf > (0)::numeric))) ORDER BY compania.comnombre, bodega.bodnombre, entrada.entposicion, producto.promodelo, ingreso.ingcodsx;


ALTER TABLE movimiento.reporte_saldos_posicion OWNER TO usersgl;

--
-- TOC entry 1969 (class 1259 OID 24502)
-- Dependencies: 2114 6
-- Name: reporte_saldos_referencia; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_saldos_referencia AS
    SELECT compania.comcodsx, compania.comnombre, producto.procodsx, producto.promodelo, producto.prodescripcion, sum(entrada.entsaldonac) AS saldonac, sum(entrada.entsaldosinnac) AS saldosinnac, sum(entrada.entsaldopesoneto) AS saldopesoneto, sum(entrada.entsaldopesobruto) AS saldopesobruto, sum(entrada.entsaldonacf) AS entsaldonacf, sum(entrada.entsaldosinnacf) AS entsaldosinnacf FROM public.compania, public.producto, entrada, ingreso WHERE ((((entrada.entcodproducto = producto.procodsx) AND (compania.comcodsx = producto.procodigocia)) AND (entrada.entcodingreso = ingreso.ingcodsx)) AND ((ingreso.ingestado)::text = 'FINALIZADO'::text)) GROUP BY compania.comnombre, producto.promodelo, compania.comcodsx, producto.procodsx, producto.prodescripcion ORDER BY compania.comnombre, producto.promodelo;


ALTER TABLE movimiento.reporte_saldos_referencia OWNER TO usersgl;

--
-- TOC entry 1970 (class 1259 OID 24506)
-- Dependencies: 2115 6
-- Name: reporte_trafico; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW reporte_trafico AS
    SELECT compania.comcodsx, compania.comnombre, trafico.trafcodsx, trafico.trafcompania, trafico.traffechacreacion AS fecha, trafico.trafdocumento, trafico.trafembarque, transportadora.transpnombre AS traftransportadora, trafico.trafprocedencia, trafico.traffechaarribopuerto, trafico.traffechapresentdta, trafico.traffechaaprobaciondta, trafico.traffob, trafico.trafcif, trafico.trafconsec, trafico.trafnumerofmm, trafico.traftrm, trafico.trafnumdta, trafico.trafnumsobordo, trafico.traffechadescargue, trafico.traffechalevante, trafico.traffechaingresozf, trafico.trafentregadocusia, trafico.trafobservaciones, trafico.trafpesobruto, trafico.trafusuario, trafico.traffechasobordo, trafico.traforigen, trafico.trafpesoneto, trafico.traffletesseguro, trafico.trafestado, trafico.trafpedido, trafico.trafmotonave, trafico.trafembarque AS embarque FROM public.compania, trafico, public.transportadora WHERE (((compania.comcodsx = trafico.trafcompania) AND ((trafico.trafestado)::text = 'FINALIZADO'::text)) AND ((trafico.traftransportadora)::text = (transportadora.transpcodsx)::text));


ALTER TABLE movimiento.reporte_trafico OWNER TO usersgl;

SET default_with_oids = false;

--
-- TOC entry 1971 (class 1259 OID 24510)
-- Dependencies: 6
-- Name: reubic_nacdetalle; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE reubic_nacdetalle (
    rencodsx integer NOT NULL,
    renreubicacion bigint NOT NULL,
    renacdetalle_or bigint NOT NULL,
    renacdetalle_fin bigint,
    rencantidad numeric(15,2) NOT NULL
);


ALTER TABLE movimiento.reubic_nacdetalle OWNER TO usersgl;

--
-- TOC entry 1972 (class 1259 OID 24512)
-- Dependencies: 1971 6
-- Name: reubic_nacdetalle_rencodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE reubic_nacdetalle_rencodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.reubic_nacdetalle_rencodsx_seq OWNER TO usersgl;

--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 1972
-- Name: reubic_nacdetalle_rencodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE reubic_nacdetalle_rencodsx_seq OWNED BY reubic_nacdetalle.rencodsx;


SET default_with_oids = true;

--
-- TOC entry 1973 (class 1259 OID 24514)
-- Dependencies: 6
-- Name: reubicacion; Type: TABLE; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE TABLE reubicacion (
    recodsx integer NOT NULL,
    recodcia bigint NOT NULL,
    reingreso bigint NOT NULL,
    retipo character varying NOT NULL,
    reentradaor bigint NOT NULL,
    reentradafin bigint NOT NULL,
    recantidad numeric(15,2) NOT NULL,
    reestado character varying NOT NULL,
    refecha timestamp without time zone NOT NULL,
    retipomov character varying,
    resumen text
);


ALTER TABLE movimiento.reubicacion OWNER TO usersgl;

--
-- TOC entry 1974 (class 1259 OID 24519)
-- Dependencies: 6 1973
-- Name: reubicacion_recodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE reubicacion_recodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.reubicacion_recodsx_seq OWNER TO usersgl;

--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 1974
-- Name: reubicacion_recodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE reubicacion_recodsx_seq OWNED BY reubicacion.recodsx;


--
-- TOC entry 1975 (class 1259 OID 24521)
-- Dependencies: 2116 6
-- Name: subreporte_camiones_guia; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW subreporte_camiones_guia AS
    SELECT despacho.despcodsx, despacho.despfecha, despacho.despobservacion, despacho.despplaca, despacho_pedido.despedbultos, despacho_pedido.despedbultosarmados, sum(referencia_despacho.refdvalor) AS valor, sum(referencia_despacho.refdpesoneto) AS pesoneto, sum(referencia_despacho.refdpesobruto) AS pesobruto FROM pedido, despacho_pedido, despacho, referencia_despacho WHERE (((((pedido.pedcodsx = despacho_pedido.despedpedido) AND (despacho_pedido.despeddespacho = despacho.despcodsx)) AND (despacho_pedido.despedcodsx = referencia_despacho.refddespacho_pedido)) AND ((pedido.pedguia)::text = '1'::text)) AND ((despacho.despestado)::text = 'FINALIZADO'::text)) GROUP BY despacho.despcodsx, despacho.despfecha, despacho.despobservacion, despacho.despplaca, despacho_pedido.despedbultos, despacho_pedido.despedbultosarmados;


ALTER TABLE movimiento.subreporte_camiones_guia OWNER TO usersgl;

--
-- TOC entry 1976 (class 1259 OID 24525)
-- Dependencies: 2117 6
-- Name: subreporte_facturas_trafico; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW subreporte_facturas_trafico AS
    SELECT factura_trafico.ftrafnumtrafico, factura_trafico.ftrafnumfactura, producto.promodelo, producto.prodescripcion, referencia_trafico.reftcantidad, referencia_trafico.reftpesonetototal AS reftpesoneto, referencia_trafico.reftpesobrutototal AS reftpesobruto, referencia_trafico.reftfobunit, referencia_trafico.reftfobtotal, referencia_trafico.reftcifunit, referencia_trafico.reftciftotal FROM factura_trafico, referencia_trafico, public.producto WHERE ((factura_trafico.ftrafcodsx = referencia_trafico.reftnumfacturatrafico) AND (producto.procodsx = referencia_trafico.reftproducto)) ORDER BY factura_trafico.ftrafnumtrafico, factura_trafico.ftrafnumfactura, producto.promodelo;


ALTER TABLE movimiento.subreporte_facturas_trafico OWNER TO usersgl;

SET search_path = public, pg_catalog;

--
-- TOC entry 1977 (class 1259 OID 24528)
-- Dependencies: 7
-- Name: categoria; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE categoria (
    catcodsx integer NOT NULL,
    catcodpadre bigint NOT NULL,
    catdescripcion character varying NOT NULL,
    catnombre character varying NOT NULL,
    resumen text
);


ALTER TABLE public.categoria OWNER TO usersgl;

--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 1977
-- Name: TABLE categoria; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE categoria IS 'Tabla que contiene las categorias de productos asociadas a una compania; ';


SET search_path = movimiento, pg_catalog;

--
-- TOC entry 1978 (class 1259 OID 24533)
-- Dependencies: 2118 6
-- Name: subreporte_pedidos_guia_categorias; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW subreporte_pedidos_guia_categorias AS
    SELECT pedido.pedcodsx, pedido.pednumpedido, pedido.pedguia, pedido.pedcompania, pedido.pedfechasistema, pedido.pedfactura, pedido.pedsubtotal, pedido.pediva, pedido.peddescuento, pedido.pedtotal, pedido.pedpesoneto, pedido.pedpesobruto, categoria.catdescripcion, sum(referencia_despacho_pedido.refdcant) AS cant, sum(referencia_despacho_pedido.refdvalortotal) AS valor, sum(referencia_despacho_pedido.refdpesonetototal) AS pesonetototal, sum(referencia_despacho_pedido.refdpesobrutototal) AS pesobrutototal FROM pedido, referencia_pedido, public.producto, public.categoria, referencia_despacho_pedido, despacho_pedido, despacho WHERE ((((((((pedido.pedcodsx = referencia_pedido.refpnumpedido) AND (referencia_pedido.refpproducto = producto.procodsx)) AND (referencia_despacho_pedido.refdcodrefp = referencia_pedido.refpcodsx)) AND (despacho_pedido.despeddespacho = despacho.despcodsx)) AND (despacho_pedido.despedpedido = pedido.pedcodsx)) AND ((despacho.despestado)::text = 'FINALIZADO'::text)) AND ((pedido.pedestado)::text = 'FINALIZADO'::text)) AND (categoria.catcodsx = producto.procategoria)) GROUP BY pedido.pedguia, pedido.pedcodsx, categoria.catdescripcion, pedido.pednumpedido, pedido.pedcompania, pedido.pedfechasistema, pedido.pedfactura, pedido.pedsubtotal, pedido.pediva, pedido.peddescuento, pedido.pedtotal, pedido.pedpesoneto, pedido.pedpesobruto ORDER BY pedido.pedguia, pedido.pedcodsx, categoria.catdescripcion DESC;


ALTER TABLE movimiento.subreporte_pedidos_guia_categorias OWNER TO usersgl;

--
-- TOC entry 1979 (class 1259 OID 24537)
-- Dependencies: 2119 6
-- Name: subreporte_pedidos_guia_productos; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW subreporte_pedidos_guia_productos AS
    SELECT pedido.pedcodsx, pedido.pednumpedido, pedido.pedguia, pedido.pedcompania, pedido.pedfechasistema, pedido.pedfactura, pedido.pedsubtotal, pedido.pediva, pedido.peddescuento, pedido.pedtotal, pedido.pedpesoneto, pedido.pedpesobruto, producto.promodelo, producto.prodescripcion, sum(referencia_despacho_pedido.refdcant) AS cant, sum(referencia_despacho_pedido.refdvalortotal) AS valor, sum(referencia_despacho_pedido.refdpesonetototal) AS pesonetototal, sum(referencia_despacho_pedido.refdpesobrutototal) AS pesobrutototal FROM pedido, referencia_pedido, public.producto, referencia_despacho_pedido, despacho_pedido, despacho WHERE (((((((pedido.pedcodsx = referencia_pedido.refpnumpedido) AND (referencia_pedido.refpproducto = producto.procodsx)) AND (referencia_despacho_pedido.refdcodrefp = referencia_pedido.refpcodsx)) AND (despacho_pedido.despeddespacho = despacho.despcodsx)) AND (despacho_pedido.despedpedido = pedido.pedcodsx)) AND ((despacho.despestado)::text = 'FINALIZADO'::text)) AND ((pedido.pedestado)::text = 'FINALIZADO'::text)) GROUP BY pedido.pedguia, pedido.pedcodsx, producto.promodelo, pedido.pednumpedido, pedido.pedcompania, pedido.pedfechasistema, pedido.pedfactura, pedido.pedsubtotal, pedido.pediva, pedido.peddescuento, pedido.pedtotal, pedido.pedpesoneto, pedido.pedpesobruto, producto.prodescripcion ORDER BY pedido.pedguia, pedido.pedcodsx, producto.promodelo DESC;


ALTER TABLE movimiento.subreporte_pedidos_guia_productos OWNER TO usersgl;

--
-- TOC entry 1980 (class 1259 OID 24541)
-- Dependencies: 2120 6
-- Name: subreporte_posiciones_saldo; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW subreporte_posiciones_saldo AS
    SELECT bodega.bodnombre, entrada.entcodproducto, entrada.entposicion, entrada.entsaldonac, entrada.entsaldosinnac, entrada.entsaldopesoneto, entrada.entsaldopesobruto, entrada.entsaldonacf, entrada.entsaldosinnacf FROM entrada, public.bodega, ingreso WHERE ((((entrada.entbodega = bodega.bodcodsx) AND ((entrada.entsaldonacf > (0)::numeric) OR (entrada.entsaldosinnacf > (0)::numeric))) AND (ingreso.ingcodsx = entrada.entcodingreso)) AND ((ingreso.ingestado)::text = 'FINALIZADO'::text));


ALTER TABLE movimiento.subreporte_posiciones_saldo OWNER TO usersgl;

--
-- TOC entry 1981 (class 1259 OID 24544)
-- Dependencies: 2121 6
-- Name: subreporte_productos_guia; Type: VIEW; Schema: movimiento; Owner: usersgl
--

CREATE VIEW subreporte_productos_guia AS
    SELECT producto.promodelo, producto.prodescripcion, sum(referencia_despacho.refdcant) AS cant, sum(referencia_despacho.refdvalor) AS valor, sum(referencia_despacho.refdpesoneto) AS pesoneto, sum(referencia_despacho.refdpesobruto) AS pesobruto FROM pedido, despacho_pedido, despacho, referencia_despacho, public.producto WHERE (((((pedido.pedcodsx = despacho_pedido.despedpedido) AND (despacho.despcodsx = despacho_pedido.despeddespacho)) AND ((despacho.despestado)::text = 'FINALIZADO'::text)) AND (producto.procodsx = referencia_despacho.refdproducto)) AND (referencia_despacho.refddespacho_pedido = despacho_pedido.despedcodsx)) GROUP BY producto.promodelo, producto.prodescripcion ORDER BY producto.promodelo;


ALTER TABLE movimiento.subreporte_productos_guia OWNER TO usersgl;

--
-- TOC entry 1982 (class 1259 OID 24548)
-- Dependencies: 1955 6
-- Name: trafico_trafcodsx_seq; Type: SEQUENCE; Schema: movimiento; Owner: usersgl
--

CREATE SEQUENCE trafico_trafcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE movimiento.trafico_trafcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 1982
-- Name: trafico_trafcodsx_seq; Type: SEQUENCE OWNED BY; Schema: movimiento; Owner: usersgl
--

ALTER SEQUENCE trafico_trafcodsx_seq OWNED BY trafico.trafcodsx;


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 1983 (class 1259 OID 24550)
-- Dependencies: 7
-- Name: auditoria; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE auditoria (
    audicodsx integer NOT NULL,
    auditipo character varying,
    audifecha timestamp without time zone,
    audiusuario character varying,
    audiip character varying,
    auditabla character varying,
    audinuevo character varying,
    audiviejo character varying
);


ALTER TABLE public.auditoria OWNER TO usersgl;

--
-- TOC entry 1984 (class 1259 OID 24555)
-- Dependencies: 1983 7
-- Name: auditoria_audicodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE auditoria_audicodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auditoria_audicodsx_seq OWNER TO usersgl;

--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 1984
-- Name: auditoria_audicodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE auditoria_audicodsx_seq OWNED BY auditoria.audicodsx;


--
-- TOC entry 1985 (class 1259 OID 24557)
-- Dependencies: 7
-- Name: auditoria_conexiones; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE auditoria_conexiones (
    audicodsx integer NOT NULL,
    audilogin character varying NOT NULL,
    audinombre character varying NOT NULL,
    audifecha timestamp with time zone NOT NULL,
    audiapp character varying NOT NULL,
    audimodulo character varying
);


ALTER TABLE public.auditoria_conexiones OWNER TO usersgl;

--
-- TOC entry 1986 (class 1259 OID 24562)
-- Dependencies: 7 1985
-- Name: auditoria_conexiones_audicodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE auditoria_conexiones_audicodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auditoria_conexiones_audicodsx_seq OWNER TO usersgl;

--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 1986
-- Name: auditoria_conexiones_audicodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE auditoria_conexiones_audicodsx_seq OWNED BY auditoria_conexiones.audicodsx;


--
-- TOC entry 1987 (class 1259 OID 24564)
-- Dependencies: 1941 7
-- Name: bodega_bodcodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE bodega_bodcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.bodega_bodcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 1987
-- Name: bodega_bodcodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE bodega_bodcodsx_seq OWNED BY bodega.bodcodsx;


--
-- TOC entry 1988 (class 1259 OID 24566)
-- Dependencies: 1977 7
-- Name: categoria_catcodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE categoria_catcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.categoria_catcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 1988
-- Name: categoria_catcodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE categoria_catcodsx_seq OWNED BY categoria.catcodsx;


--
-- TOC entry 1989 (class 1259 OID 24568)
-- Dependencies: 7 1951
-- Name: causal_caucodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE causal_caucodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.causal_caucodsx_seq OWNER TO usersgl;

--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 1989
-- Name: causal_caucodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE causal_caucodsx_seq OWNED BY causal.caucodsx;


--
-- TOC entry 1990 (class 1259 OID 24570)
-- Dependencies: 7
-- Name: causal_hit; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE causal_hit (
    cauhcodsx integer NOT NULL,
    cauhdesc character varying NOT NULL,
    cauresp character varying,
    resumen text
);


ALTER TABLE public.causal_hit OWNER TO usersgl;

--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 1990
-- Name: TABLE causal_hit; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE causal_hit IS 'Tabla que contiene la informacion de algo conocido como "causales de pedido no hit", que representan una informacion del pedido y el manejo que se le dio';


--
-- TOC entry 1991 (class 1259 OID 24575)
-- Dependencies: 7 1990
-- Name: causal_hit_cauhcodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE causal_hit_cauhcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.causal_hit_cauhcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 1991
-- Name: causal_hit_cauhcodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE causal_hit_cauhcodsx_seq OWNED BY causal_hit.cauhcodsx;


--
-- TOC entry 1992 (class 1259 OID 24577)
-- Dependencies: 1943 7
-- Name: cliente_clicodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE cliente_clicodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cliente_clicodsx_seq OWNER TO usersgl;

--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 1992
-- Name: cliente_clicodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE cliente_clicodsx_seq OWNED BY cliente.clicodsx;


--
-- TOC entry 1993 (class 1259 OID 24579)
-- Dependencies: 7 1938
-- Name: compania_comcodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE compania_comcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.compania_comcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 1993
-- Name: compania_comcodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE compania_comcodsx_seq OWNED BY compania.comcodsx;


--
-- TOC entry 1994 (class 1259 OID 24581)
-- Dependencies: 7
-- Name: config; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE config (
    cfnombre character varying NOT NULL,
    cfvalor character varying NOT NULL
);


ALTER TABLE public.config OWNER TO usersgl;

SET default_with_oids = true;

--
-- TOC entry 1995 (class 1259 OID 24586)
-- Dependencies: 7
-- Name: empleado; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE empleado (
    empcodsx integer NOT NULL,
    empnombre character varying NOT NULL,
    empcedula character varying NOT NULL,
    empmail character varying NOT NULL,
    empcargo character varying,
    resumen text
);


ALTER TABLE public.empleado OWNER TO usersgl;

--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 1995
-- Name: TABLE empleado; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE empleado IS 'guarda los empleados que esten activos dentro de la compania';


--
-- TOC entry 1996 (class 1259 OID 24591)
-- Dependencies: 1995 7
-- Name: empleado_empcodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE empleado_empcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.empleado_empcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 1996
-- Name: empleado_empcodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE empleado_empcodsx_seq OWNED BY empleado.empcodsx;


--
-- TOC entry 1997 (class 1259 OID 24593)
-- Dependencies: 7
-- Name: empresa; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE empresa (
    empcodsx integer NOT NULL,
    empnombre character varying NOT NULL,
    empdireccion character varying,
    emptelefono character varying NOT NULL,
    empnit character varying NOT NULL,
    empdescripcion character varying,
    empmail character varying,
    empslogan character varying
);


ALTER TABLE public.empresa OWNER TO usersgl;

--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 1997
-- Name: TABLE empresa; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE empresa IS 'Guarda los datos de configuracin de la empresa que ejecuta la aplicacion, esta es una tabla de un solo registro';


--
-- TOC entry 1998 (class 1259 OID 24598)
-- Dependencies: 1997 7
-- Name: empresa_empcodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE empresa_empcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.empresa_empcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 1998
-- Name: empresa_empcodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE empresa_empcodsx_seq OWNED BY empresa.empcodsx;


SET default_with_oids = false;

--
-- TOC entry 1999 (class 1259 OID 24600)
-- Dependencies: 7
-- Name: faq; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE faq (
    faqcodsx integer NOT NULL,
    faqpregunta character varying NOT NULL,
    faqrespcorta character varying NOT NULL,
    faqresplarga character varying NOT NULL,
    resumen text
);


ALTER TABLE public.faq OWNER TO usersgl;

--
-- TOC entry 2000 (class 1259 OID 24605)
-- Dependencies: 1999 7
-- Name: faq_faqcodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE faq_faqcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.faq_faqcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 2000
-- Name: faq_faqcodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE faq_faqcodsx_seq OWNED BY faq.faqcodsx;


SET default_with_oids = true;

--
-- TOC entry 2001 (class 1259 OID 24607)
-- Dependencies: 2494 7
-- Name: flete; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE flete (
    flecodsx integer NOT NULL,
    fleciudad character varying NOT NULL,
    fletransportadora bigint NOT NULL,
    flevalor numeric(15,2) NOT NULL,
    fledias smallint DEFAULT 0 NOT NULL,
    resumen text
);


ALTER TABLE public.flete OWNER TO usersgl;

--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 2001
-- Name: TABLE flete; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE flete IS 'Guarda informacion de fletes para manejo de transportadora y sus tarifas';


--
-- TOC entry 2002 (class 1259 OID 24613)
-- Dependencies: 7 2001
-- Name: flete_flecodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE flete_flecodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.flete_flecodsx_seq OWNER TO usersgl;

--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 2002
-- Name: flete_flecodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE flete_flecodsx_seq OWNED BY flete.flecodsx;


--
-- TOC entry 2003 (class 1259 OID 24615)
-- Dependencies: 7
-- Name: grupo; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE grupo (
    gcodsx integer NOT NULL,
    gnombre character varying NOT NULL,
    resumen text
);


ALTER TABLE public.grupo OWNER TO usersgl;

--
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 2003
-- Name: TABLE grupo; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE grupo IS 'guarda los datos de los GRUPOS DE USUARIOS que acceden a la aplicacion, es decir, implementa el concepto de USURIOS - GRUPOS - PERMISOS';


--
-- TOC entry 2004 (class 1259 OID 24620)
-- Dependencies: 7 2003
-- Name: grupo_gcodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE grupo_gcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.grupo_gcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 2004
-- Name: grupo_gcodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE grupo_gcodsx_seq OWNED BY grupo.gcodsx;


--
-- TOC entry 2005 (class 1259 OID 24622)
-- Dependencies: 2497 7
-- Name: permiso; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE permiso (
    percodsx integer NOT NULL,
    pergrupo bigint NOT NULL,
    perapp character varying NOT NULL,
    permodulo character varying NOT NULL,
    peracceso smallint DEFAULT 0 NOT NULL,
    resumen text
);


ALTER TABLE public.permiso OWNER TO usersgl;

--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 2005
-- Name: TABLE permiso; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE permiso IS 'implementa los permisos de la aplicacion para el acceso de los diferentes usuarios';


--
-- TOC entry 2006 (class 1259 OID 24628)
-- Dependencies: 7 2005
-- Name: permiso_percodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE permiso_percodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.permiso_percodsx_seq OWNER TO usersgl;

--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 2006
-- Name: permiso_percodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE permiso_percodsx_seq OWNED BY permiso.percodsx;


--
-- TOC entry 1826 (class 1259 OID 16459)
-- Dependencies: 7
-- Name: pg_ts_cfg; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pg_ts_cfg (
    ts_name text NOT NULL,
    prs_name text NOT NULL,
    locale text
);


ALTER TABLE public.pg_ts_cfg OWNER TO postgres;

--
-- TOC entry 1827 (class 1259 OID 16466)
-- Dependencies: 7
-- Name: pg_ts_cfgmap; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pg_ts_cfgmap (
    ts_name text NOT NULL,
    tok_alias text NOT NULL,
    dict_name text[]
);


ALTER TABLE public.pg_ts_cfgmap OWNER TO postgres;

--
-- TOC entry 1822 (class 1259 OID 16403)
-- Dependencies: 7
-- Name: pg_ts_dict; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pg_ts_dict (
    dict_name text NOT NULL,
    dict_init regprocedure,
    dict_initoption text,
    dict_lexize regprocedure NOT NULL,
    dict_comment text
);


ALTER TABLE public.pg_ts_dict OWNER TO postgres;

--
-- TOC entry 1823 (class 1259 OID 16434)
-- Dependencies: 7
-- Name: pg_ts_parser; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pg_ts_parser (
    prs_name text NOT NULL,
    prs_start regprocedure NOT NULL,
    prs_nexttoken regprocedure NOT NULL,
    prs_end regprocedure NOT NULL,
    prs_headline regprocedure NOT NULL,
    prs_lextype regprocedure NOT NULL,
    prs_comment text
);


ALTER TABLE public.pg_ts_parser OWNER TO postgres;

SET default_with_oids = false;

--
-- TOC entry 2007 (class 1259 OID 24630)
-- Dependencies: 7
-- Name: producto_cliente; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE producto_cliente (
    proccodsx integer NOT NULL,
    proccliente bigint NOT NULL,
    procproducto bigint NOT NULL,
    procean character(1),
    proctag character(1),
    procodbarra character(1),
    procnumcodigobarra character varying,
    procgarantia character(1),
    resumen text
);


ALTER TABLE public.producto_cliente OWNER TO usersgl;

--
-- TOC entry 2008 (class 1259 OID 24635)
-- Dependencies: 2007 7
-- Name: producto_cliente_proccodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE producto_cliente_proccodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.producto_cliente_proccodsx_seq OWNER TO usersgl;

--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 2008
-- Name: producto_cliente_proccodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE producto_cliente_proccodsx_seq OWNED BY producto_cliente.proccodsx;


--
-- TOC entry 2009 (class 1259 OID 24637)
-- Dependencies: 1939 7
-- Name: producto_procodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE producto_procodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.producto_procodsx_seq OWNER TO usersgl;

--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 2009
-- Name: producto_procodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE producto_procodsx_seq OWNED BY producto.procodsx;


--
-- TOC entry 2010 (class 1259 OID 24639)
-- Dependencies: 1948 7
-- Name: sucursal_succodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE sucursal_succodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sucursal_succodsx_seq OWNER TO usersgl;

--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 2010
-- Name: sucursal_succodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE sucursal_succodsx_seq OWNED BY sucursal.succodsx;


SET default_with_oids = true;

--
-- TOC entry 2011 (class 1259 OID 24641)
-- Dependencies: 7
-- Name: tipoproducto; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE tipoproducto (
    tiprcodsx integer NOT NULL,
    tiprdescripcion character varying NOT NULL,
    tiprcodcompania bigint NOT NULL,
    tiprcodigo character varying NOT NULL,
    resumen text
);


ALTER TABLE public.tipoproducto OWNER TO usersgl;

--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 2011
-- Name: TABLE tipoproducto; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE tipoproducto IS 'Tabla que contiene los tipos de productos asociadas a una compania; ';


--
-- TOC entry 2012 (class 1259 OID 24646)
-- Dependencies: 2011 7
-- Name: tipoproducto_tiprcodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE tipoproducto_tiprcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipoproducto_tiprcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 2012
-- Name: tipoproducto_tiprcodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE tipoproducto_tiprcodsx_seq OWNED BY tipoproducto.tiprcodsx;


--
-- TOC entry 2013 (class 1259 OID 24648)
-- Dependencies: 7 1944
-- Name: transportadora_transpcodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE transportadora_transpcodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.transportadora_transpcodsx_seq OWNER TO usersgl;

--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 2013
-- Name: transportadora_transpcodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE transportadora_transpcodsx_seq OWNED BY transportadora.transpcodsx;


SET default_with_oids = false;

--
-- TOC entry 2014 (class 1259 OID 24650)
-- Dependencies: 7
-- Name: unidad; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE unidad (
    unicod character varying(3) NOT NULL,
    unidesc character varying(30)
);


ALTER TABLE public.unidad OWNER TO usersgl;

--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 2014
-- Name: TABLE unidad; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE unidad IS 'unidades de medida';


SET default_with_oids = true;

--
-- TOC entry 2015 (class 1259 OID 24652)
-- Dependencies: 7
-- Name: usuario; Type: TABLE; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE TABLE usuario (
    usucodsx integer NOT NULL,
    usunombre character varying,
    usulogin character varying NOT NULL,
    usuclave character varying NOT NULL,
    usumail character varying,
    usugrupo bigint NOT NULL,
    usucompania bigint,
    usucodcliente bigint,
    resumen text
);


ALTER TABLE public.usuario OWNER TO usersgl;

--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 2015
-- Name: TABLE usuario; Type: COMMENT; Schema: public; Owner: usersgl
--

COMMENT ON TABLE usuario IS 'Implementa los datos de acceso a la aplicacion, es decir los  usuarios del sistema, en esta tabla se almacenan los datos de login y clave';


--
-- TOC entry 2016 (class 1259 OID 24657)
-- Dependencies: 2015 7
-- Name: usuario_usucodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE usuario_usucodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.usuario_usucodsx_seq OWNER TO usersgl;

--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 2016
-- Name: usuario_usucodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE usuario_usucodsx_seq OWNED BY usuario.usucodsx;


--
-- TOC entry 2017 (class 1259 OID 24659)
-- Dependencies: 7 1952
-- Name: zona_zoncodsx_seq; Type: SEQUENCE; Schema: public; Owner: usersgl
--

CREATE SEQUENCE zona_zoncodsx_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.zona_zoncodsx_seq OWNER TO usersgl;

--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 2017
-- Name: zona_zoncodsx_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usersgl
--

ALTER SEQUENCE zona_zoncodsx_seq OWNED BY zona.zoncodsx;


SET search_path = facturacion, pg_catalog;

--
-- TOC entry 2384 (class 2604 OID 24661)
-- Dependencies: 1856 1855
-- Name: alcodsx; Type: DEFAULT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE alistamiento ALTER COLUMN alcodsx SET DEFAULT nextval('alistamiento_alcodsx_seq'::regclass);


--
-- TOC entry 2385 (class 2604 OID 24662)
-- Dependencies: 1858 1857
-- Name: almcodsx; Type: DEFAULT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE almacenamiento ALTER COLUMN almcodsx SET DEFAULT nextval('almacenamiento_almcodsx_seq'::regclass);


--
-- TOC entry 2386 (class 2604 OID 24663)
-- Dependencies: 1860 1859
-- Name: clifcodsx; Type: DEFAULT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE cliente_facturacion ALTER COLUMN clifcodsx SET DEFAULT nextval('cliente_facturacion_clifcodsx_seq'::regclass);


--
-- TOC entry 2387 (class 2604 OID 24664)
-- Dependencies: 1864 1861
-- Name: concodsx; Type: DEFAULT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE concepto ALTER COLUMN concodsx SET DEFAULT nextval('concepto_concodsx_seq'::regclass);


--
-- TOC entry 2388 (class 2604 OID 24665)
-- Dependencies: 1863 1862
-- Name: conccodsx; Type: DEFAULT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE concepto_cliente ALTER COLUMN conccodsx SET DEFAULT nextval('concepto_cliente_conccodsx_seq'::regclass);


--
-- TOC entry 2390 (class 2604 OID 24666)
-- Dependencies: 1866 1865
-- Name: cfcodsx; Type: DEFAULT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE conffactura ALTER COLUMN cfcodsx SET DEFAULT nextval('conffactura_cfcodsx_seq'::regclass);


--
-- TOC entry 2394 (class 2604 OID 24667)
-- Dependencies: 1870 1867
-- Name: faccodsx; Type: DEFAULT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE factura ALTER COLUMN faccodsx SET DEFAULT nextval('factura_faccodsx_seq'::regclass);


--
-- TOC entry 2395 (class 2604 OID 24668)
-- Dependencies: 1869 1868
-- Name: facdcodsx; Type: DEFAULT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE factura_detalle ALTER COLUMN facdcodsx SET DEFAULT nextval('factura_detalle_facdcodsx_seq'::regclass);


--
-- TOC entry 2396 (class 2604 OID 24669)
-- Dependencies: 1872 1871
-- Name: nfcodsx; Type: DEFAULT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE numfactura ALTER COLUMN nfcodsx SET DEFAULT nextval('numfactura_nfcodsx_seq'::regclass);


--
-- TOC entry 2397 (class 2604 OID 24670)
-- Dependencies: 1874 1873
-- Name: profcodsx; Type: DEFAULT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE proforma ALTER COLUMN profcodsx SET DEFAULT nextval('proforma_profcodsx_seq'::regclass);


SET search_path = movimiento, pg_catalog;

--
-- TOC entry 2400 (class 2604 OID 24671)
-- Dependencies: 1879 1878
-- Name: ajcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ajuste ALTER COLUMN ajcodsx SET DEFAULT nextval('ajuste_ajcodsx_seq'::regclass);


--
-- TOC entry 2409 (class 2604 OID 24672)
-- Dependencies: 1881 1880
-- Name: avecodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE averia ALTER COLUMN avecodsx SET DEFAULT nextval('averia_avecodsx_seq'::regclass);


--
-- TOC entry 2410 (class 2604 OID 24673)
-- Dependencies: 1883 1882
-- Name: avncodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE averia_nacdet ALTER COLUMN avncodsx SET DEFAULT nextval('averia_nacdet_avncodsx_seq'::regclass);


--
-- TOC entry 2411 (class 2604 OID 24674)
-- Dependencies: 1885 1884
-- Name: caupcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE causal_pedido ALTER COLUMN caupcodsx SET DEFAULT nextval('causal_pedido_caupcodsx_seq'::regclass);


--
-- TOC entry 2412 (class 2604 OID 24675)
-- Dependencies: 1887 1886
-- Name: ctrafcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE contenedor_trafico ALTER COLUMN ctrafcodsx SET DEFAULT nextval('contenedor_trafico_ctrafcodsx_seq'::regclass);


--
-- TOC entry 2413 (class 2604 OID 24676)
-- Dependencies: 1889 1888
-- Name: despcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE despacho ALTER COLUMN despcodsx SET DEFAULT nextval('despacho_despcodsx_seq'::regclass);


--
-- TOC entry 2414 (class 2604 OID 24677)
-- Dependencies: 1891 1890
-- Name: despedcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE despacho_pedido ALTER COLUMN despedcodsx SET DEFAULT nextval('despacho_pedido_despedcodsx_seq'::regclass);


--
-- TOC entry 2379 (class 2604 OID 24678)
-- Dependencies: 1894 1854
-- Name: entcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE entrada ALTER COLUMN entcodsx SET DEFAULT nextval('entrada_entcodsx_seq'::regclass);


--
-- TOC entry 2416 (class 2604 OID 24679)
-- Dependencies: 1893 1892
-- Name: entcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE entrada2 ALTER COLUMN entcodsx SET DEFAULT nextval('entrada2_entcodsx_seq'::regclass);


--
-- TOC entry 2417 (class 2604 OID 24680)
-- Dependencies: 1896 1895
-- Name: ftrafcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE factura_trafico ALTER COLUMN ftrafcodsx SET DEFAULT nextval('factura_trafico_ftrafcodsx_seq'::regclass);


--
-- TOC entry 2423 (class 2604 OID 24681)
-- Dependencies: 1898 1897
-- Name: ingcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ingreso ALTER COLUMN ingcodsx SET DEFAULT nextval('ingreso_ingcodsx_seq'::regclass);


--
-- TOC entry 2424 (class 2604 OID 24682)
-- Dependencies: 1900 1899
-- Name: kardcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE kardex ALTER COLUMN kardcodsx SET DEFAULT nextval('kardex_kardcodsx_seq'::regclass);


--
-- TOC entry 2428 (class 2604 OID 24683)
-- Dependencies: 1907 1901
-- Name: naccodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE nacionalizacion ALTER COLUMN naccodsx SET DEFAULT nextval('nacionalizacion_naccodsx_seq'::regclass);


--
-- TOC entry 2429 (class 2604 OID 24684)
-- Dependencies: 1906 1903
-- Name: nadcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE nacionalizacion_detalle ALTER COLUMN nadcodsx SET DEFAULT nextval('nacionalizacion_detalle_nadcodsx_seq'::regclass);


--
-- TOC entry 2430 (class 2604 OID 24685)
-- Dependencies: 1905 1904
-- Name: nadcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE nacionalizacion_detalle2 ALTER COLUMN nadcodsx SET DEFAULT nextval('nacionalizacion_detalle2_nadcodsx_seq'::regclass);


--
-- TOC entry 2431 (class 2604 OID 24686)
-- Dependencies: 1909 1908
-- Name: novcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE novedad_pedido ALTER COLUMN novcodsx SET DEFAULT nextval('novedad_pedido_novcodsx_seq'::regclass);


--
-- TOC entry 2432 (class 2604 OID 24687)
-- Dependencies: 1915 1910
-- Name: packcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE packing ALTER COLUMN packcodsx SET DEFAULT nextval('packing_packcodsx_seq'::regclass);


--
-- TOC entry 2433 (class 2604 OID 24688)
-- Dependencies: 1912 1911
-- Name: packdcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE packing_detalle ALTER COLUMN packdcodsx SET DEFAULT nextval('packing_detalle_packdcodsx_seq'::regclass);


--
-- TOC entry 2434 (class 2604 OID 24689)
-- Dependencies: 1914 1913
-- Name: packpcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE packing_detalle_posicion ALTER COLUMN packpcodsx SET DEFAULT nextval('packing_detalle_posicion_packpcodsx_seq'::regclass);


--
-- TOC entry 2436 (class 2604 OID 24690)
-- Dependencies: 1917 1916
-- Name: pedcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE pedido ALTER COLUMN pedcodsx SET DEFAULT nextval('pedido_pedcodsx_seq'::regclass);


--
-- TOC entry 2437 (class 2604 OID 24691)
-- Dependencies: 1923 1918
-- Name: pickcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE picking ALTER COLUMN pickcodsx SET DEFAULT nextval('picking_pickcodsx_seq'::regclass);


--
-- TOC entry 2438 (class 2604 OID 24692)
-- Dependencies: 1922 1919
-- Name: pickdcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE picking_detalle ALTER COLUMN pickdcodsx SET DEFAULT nextval('picking_detalle_pickdcodsx_seq'::regclass);


--
-- TOC entry 2439 (class 2604 OID 24693)
-- Dependencies: 1921 1920
-- Name: pickpcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE picking_detalle_packing ALTER COLUMN pickpcodsx SET DEFAULT nextval('picking_detalle_packing_pickpcodsx_seq'::regclass);


--
-- TOC entry 2440 (class 2604 OID 24694)
-- Dependencies: 1927 1924
-- Name: refdcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE referencia_despacho ALTER COLUMN refdcodsx SET DEFAULT nextval('referencia_despacho_refdcodsx_seq'::regclass);


--
-- TOC entry 2441 (class 2604 OID 24695)
-- Dependencies: 1926 1925
-- Name: refdpcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE referencia_despacho_pedido ALTER COLUMN refdpcodsx SET DEFAULT nextval('referencia_despacho_pedido_refdpcodsx_seq'::regclass);


--
-- TOC entry 2502 (class 2604 OID 647144)
-- Dependencies: 2019 2018 2019
-- Name: refdscodsx; Type: DEFAULT; Schema: movimiento; Owner: postgres
--

ALTER TABLE referencia_despacho_serial ALTER COLUMN refdscodsx SET DEFAULT nextval('referencia_despacho_serial_refdscodsx_seq'::regclass);


--
-- TOC entry 2442 (class 2604 OID 24696)
-- Dependencies: 1929 1928
-- Name: refpcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE referencia_pedido ALTER COLUMN refpcodsx SET DEFAULT nextval('referencia_pedido_refpcodsx_seq'::regclass);


--
-- TOC entry 2443 (class 2604 OID 24697)
-- Dependencies: 1931 1930
-- Name: reftcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE referencia_trafico ALTER COLUMN reftcodsx SET DEFAULT nextval('referencia_trafico_reftcodsx_seq'::regclass);


--
-- TOC entry 2445 (class 2604 OID 24698)
-- Dependencies: 1937 1932
-- Name: repcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE reparacion ALTER COLUMN repcodsx SET DEFAULT nextval('reparacion_repcodsx_seq'::regclass);


--
-- TOC entry 2446 (class 2604 OID 24699)
-- Dependencies: 1934 1933
-- Name: repdcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE reparacion_detalle ALTER COLUMN repdcodsx SET DEFAULT nextval('reparacion_detalle_repdcodsx_seq'::regclass);


--
-- TOC entry 2447 (class 2604 OID 24700)
-- Dependencies: 1936 1935
-- Name: repndcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE reparacion_nacdet ALTER COLUMN repndcodsx SET DEFAULT nextval('reparacion_nacdet_repndcodsx_seq'::regclass);


--
-- TOC entry 2485 (class 2604 OID 24701)
-- Dependencies: 1972 1971
-- Name: rencodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE reubic_nacdetalle ALTER COLUMN rencodsx SET DEFAULT nextval('reubic_nacdetalle_rencodsx_seq'::regclass);


--
-- TOC entry 2486 (class 2604 OID 24702)
-- Dependencies: 1974 1973
-- Name: recodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE reubicacion ALTER COLUMN recodsx SET DEFAULT nextval('reubicacion_recodsx_seq'::regclass);


--
-- TOC entry 2484 (class 2604 OID 24703)
-- Dependencies: 1982 1955
-- Name: trafcodsx; Type: DEFAULT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE trafico ALTER COLUMN trafcodsx SET DEFAULT nextval('trafico_trafcodsx_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 2488 (class 2604 OID 24704)
-- Dependencies: 1984 1983
-- Name: audicodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE auditoria ALTER COLUMN audicodsx SET DEFAULT nextval('auditoria_audicodsx_seq'::regclass);


--
-- TOC entry 2489 (class 2604 OID 24705)
-- Dependencies: 1986 1985
-- Name: audicodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE auditoria_conexiones ALTER COLUMN audicodsx SET DEFAULT nextval('auditoria_conexiones_audicodsx_seq'::regclass);


--
-- TOC entry 2470 (class 2604 OID 24706)
-- Dependencies: 1987 1941
-- Name: bodcodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE bodega ALTER COLUMN bodcodsx SET DEFAULT nextval('bodega_bodcodsx_seq'::regclass);


--
-- TOC entry 2487 (class 2604 OID 24707)
-- Dependencies: 1988 1977
-- Name: catcodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE categoria ALTER COLUMN catcodsx SET DEFAULT nextval('categoria_catcodsx_seq'::regclass);


--
-- TOC entry 2475 (class 2604 OID 24708)
-- Dependencies: 1989 1951
-- Name: caucodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE causal ALTER COLUMN caucodsx SET DEFAULT nextval('causal_caucodsx_seq'::regclass);


--
-- TOC entry 2490 (class 2604 OID 24709)
-- Dependencies: 1991 1990
-- Name: cauhcodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE causal_hit ALTER COLUMN cauhcodsx SET DEFAULT nextval('causal_hit_cauhcodsx_seq'::regclass);


--
-- TOC entry 2472 (class 2604 OID 24710)
-- Dependencies: 1992 1943
-- Name: clicodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE cliente ALTER COLUMN clicodsx SET DEFAULT nextval('cliente_clicodsx_seq'::regclass);


--
-- TOC entry 2451 (class 2604 OID 24711)
-- Dependencies: 1993 1938
-- Name: comcodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE compania ALTER COLUMN comcodsx SET DEFAULT nextval('compania_comcodsx_seq'::regclass);


--
-- TOC entry 2491 (class 2604 OID 24712)
-- Dependencies: 1996 1995
-- Name: empcodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE empleado ALTER COLUMN empcodsx SET DEFAULT nextval('empleado_empcodsx_seq'::regclass);


--
-- TOC entry 2492 (class 2604 OID 24713)
-- Dependencies: 1998 1997
-- Name: empcodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE empresa ALTER COLUMN empcodsx SET DEFAULT nextval('empresa_empcodsx_seq'::regclass);


--
-- TOC entry 2493 (class 2604 OID 24714)
-- Dependencies: 2000 1999
-- Name: faqcodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE faq ALTER COLUMN faqcodsx SET DEFAULT nextval('faq_faqcodsx_seq'::regclass);


--
-- TOC entry 2495 (class 2604 OID 24715)
-- Dependencies: 2002 2001
-- Name: flecodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE flete ALTER COLUMN flecodsx SET DEFAULT nextval('flete_flecodsx_seq'::regclass);


--
-- TOC entry 2496 (class 2604 OID 24716)
-- Dependencies: 2004 2003
-- Name: gcodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE grupo ALTER COLUMN gcodsx SET DEFAULT nextval('grupo_gcodsx_seq'::regclass);


--
-- TOC entry 2498 (class 2604 OID 24717)
-- Dependencies: 2006 2005
-- Name: percodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE permiso ALTER COLUMN percodsx SET DEFAULT nextval('permiso_percodsx_seq'::regclass);


--
-- TOC entry 2466 (class 2604 OID 24718)
-- Dependencies: 2009 1939
-- Name: procodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE producto ALTER COLUMN procodsx SET DEFAULT nextval('producto_procodsx_seq'::regclass);


--
-- TOC entry 2499 (class 2604 OID 24719)
-- Dependencies: 2008 2007
-- Name: proccodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE producto_cliente ALTER COLUMN proccodsx SET DEFAULT nextval('producto_cliente_proccodsx_seq'::regclass);


--
-- TOC entry 2474 (class 2604 OID 24720)
-- Dependencies: 2010 1948
-- Name: succodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE sucursal ALTER COLUMN succodsx SET DEFAULT nextval('sucursal_succodsx_seq'::regclass);


--
-- TOC entry 2500 (class 2604 OID 24721)
-- Dependencies: 2012 2011
-- Name: tiprcodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE tipoproducto ALTER COLUMN tiprcodsx SET DEFAULT nextval('tipoproducto_tiprcodsx_seq'::regclass);


--
-- TOC entry 2473 (class 2604 OID 24722)
-- Dependencies: 2013 1944
-- Name: transpcodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE transportadora ALTER COLUMN transpcodsx SET DEFAULT nextval('transportadora_transpcodsx_seq'::regclass);


--
-- TOC entry 2501 (class 2604 OID 24723)
-- Dependencies: 2016 2015
-- Name: usucodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE usuario ALTER COLUMN usucodsx SET DEFAULT nextval('usuario_usucodsx_seq'::regclass);


--
-- TOC entry 2476 (class 2604 OID 24724)
-- Dependencies: 2017 1952
-- Name: zoncodsx; Type: DEFAULT; Schema: public; Owner: usersgl
--

ALTER TABLE zona ALTER COLUMN zoncodsx SET DEFAULT nextval('zona_zoncodsx_seq'::regclass);


SET search_path = facturacion, pg_catalog;

--
-- TOC entry 2536 (class 2606 OID 637428)
-- Dependencies: 1865 1865
-- Name: conffactura_cfempresa_key; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY conffactura
    ADD CONSTRAINT conffactura_cfempresa_key UNIQUE (cfempresa);


--
-- TOC entry 2538 (class 2606 OID 637430)
-- Dependencies: 1865 1865
-- Name: conffactura_pkey; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY conffactura
    ADD CONSTRAINT conffactura_pkey PRIMARY KEY (cfcodsx);


--
-- TOC entry 2546 (class 2606 OID 637432)
-- Dependencies: 1871 1871 1871 1871
-- Name: numfactura_nfempresa_key; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY numfactura
    ADD CONSTRAINT numfactura_nfempresa_key UNIQUE (nfempresa, nfestado, nffecha);


--
-- TOC entry 2548 (class 2606 OID 637434)
-- Dependencies: 1871 1871
-- Name: numfactura_pkey; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY numfactura
    ADD CONSTRAINT numfactura_pkey PRIMARY KEY (nfcodsx);


--
-- TOC entry 2516 (class 2606 OID 637436)
-- Dependencies: 1855 1855
-- Name: pk_alistamiento; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY alistamiento
    ADD CONSTRAINT pk_alistamiento PRIMARY KEY (alcodsx);


--
-- TOC entry 2520 (class 2606 OID 637438)
-- Dependencies: 1857 1857
-- Name: pk_almacenamiento; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY almacenamiento
    ADD CONSTRAINT pk_almacenamiento PRIMARY KEY (almcodsx);


--
-- TOC entry 2524 (class 2606 OID 637440)
-- Dependencies: 1859 1859
-- Name: pk_clifacturacion; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY cliente_facturacion
    ADD CONSTRAINT pk_clifacturacion PRIMARY KEY (clifcodsx);


--
-- TOC entry 2532 (class 2606 OID 637442)
-- Dependencies: 1862 1862
-- Name: pk_conc_cliente; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY concepto_cliente
    ADD CONSTRAINT pk_conc_cliente PRIMARY KEY (conccodsx);


--
-- TOC entry 2528 (class 2606 OID 637444)
-- Dependencies: 1861 1861
-- Name: pk_concepto; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY concepto
    ADD CONSTRAINT pk_concepto PRIMARY KEY (concodsx);


--
-- TOC entry 2544 (class 2606 OID 637446)
-- Dependencies: 1868 1868
-- Name: pk_facdetalle; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY factura_detalle
    ADD CONSTRAINT pk_facdetalle PRIMARY KEY (facdcodsx);


--
-- TOC entry 2540 (class 2606 OID 637448)
-- Dependencies: 1867 1867
-- Name: pk_factura; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY factura
    ADD CONSTRAINT pk_factura PRIMARY KEY (faccodsx);


--
-- TOC entry 2550 (class 2606 OID 637450)
-- Dependencies: 1873 1873
-- Name: pk_proforma; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY proforma
    ADD CONSTRAINT pk_proforma PRIMARY KEY (profcodsx);


--
-- TOC entry 2518 (class 2606 OID 637452)
-- Dependencies: 1855 1855 1855 1855
-- Name: uq_alistamiento; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY alistamiento
    ADD CONSTRAINT uq_alistamiento UNIQUE (alfecha_ini, alfecha_fin, alcliente_fac);


--
-- TOC entry 2522 (class 2606 OID 637454)
-- Dependencies: 1857 1857 1857 1857
-- Name: uq_almacenamiento; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY almacenamiento
    ADD CONSTRAINT uq_almacenamiento UNIQUE (almcliente_fac, almfecha_ini, almfecha_fin);


--
-- TOC entry 2526 (class 2606 OID 637456)
-- Dependencies: 1859 1859
-- Name: uq_cliente_fac; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY cliente_facturacion
    ADD CONSTRAINT uq_cliente_fac UNIQUE (clifnombre);


--
-- TOC entry 2534 (class 2606 OID 637458)
-- Dependencies: 1862 1862 1862
-- Name: uq_conc; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY concepto_cliente
    ADD CONSTRAINT uq_conc UNIQUE (conccodconcepto, conccodcliente);


--
-- TOC entry 2530 (class 2606 OID 637460)
-- Dependencies: 1861 1861
-- Name: uq_concepto; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY concepto
    ADD CONSTRAINT uq_concepto UNIQUE (condesc);


--
-- TOC entry 2542 (class 2606 OID 637462)
-- Dependencies: 1867 1867 1867
-- Name: uq_factura; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY factura
    ADD CONSTRAINT uq_factura UNIQUE (faccodcliente, facfechasistema);


--
-- TOC entry 2552 (class 2606 OID 637464)
-- Dependencies: 1873 1873
-- Name: uq_proforma; Type: CONSTRAINT; Schema: facturacion; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY proforma
    ADD CONSTRAINT uq_proforma UNIQUE (profbl);


SET search_path = movimiento, pg_catalog;

--
-- TOC entry 2586 (class 2606 OID 637466)
-- Dependencies: 1899 1899
-- Name: PK_KARDEX; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY kardex
    ADD CONSTRAINT "PK_KARDEX" PRIMARY KEY (kardcodsx);


--
-- TOC entry 2572 (class 2606 OID 637468)
-- Dependencies: 1890 1890
-- Name: pd_desp_ped; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY despacho_pedido
    ADD CONSTRAINT pd_desp_ped PRIMARY KEY (despedcodsx);


--
-- TOC entry 2618 (class 2606 OID 637470)
-- Dependencies: 1919 1919
-- Name: pf_picking; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY picking_detalle
    ADD CONSTRAINT pf_picking PRIMARY KEY (pickdcodsx);


--
-- TOC entry 2554 (class 2606 OID 637472)
-- Dependencies: 1878 1878
-- Name: pk_ajuste; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY ajuste
    ADD CONSTRAINT pk_ajuste PRIMARY KEY (ajcodsx);


--
-- TOC entry 2556 (class 2606 OID 637474)
-- Dependencies: 1880 1880
-- Name: pk_averia; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY averia
    ADD CONSTRAINT pk_averia PRIMARY KEY (avecodsx);


--
-- TOC entry 2560 (class 2606 OID 637476)
-- Dependencies: 1882 1882
-- Name: pk_avnac; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY averia_nacdet
    ADD CONSTRAINT pk_avnac PRIMARY KEY (avncodsx);


--
-- TOC entry 2562 (class 2606 OID 637478)
-- Dependencies: 1884 1884
-- Name: pk_causal_pedido; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY causal_pedido
    ADD CONSTRAINT pk_causal_pedido PRIMARY KEY (caupcodsx);


--
-- TOC entry 2564 (class 2606 OID 637480)
-- Dependencies: 1886 1886
-- Name: pk_cont_traf; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY contenedor_trafico
    ADD CONSTRAINT pk_cont_traf PRIMARY KEY (ctrafcodsx);


--
-- TOC entry 2568 (class 2606 OID 637482)
-- Dependencies: 1888 1888
-- Name: pk_despacho; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY despacho
    ADD CONSTRAINT pk_despacho PRIMARY KEY (despcodsx);


--
-- TOC entry 2512 (class 2606 OID 637484)
-- Dependencies: 1854 1854
-- Name: pk_entrada; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY entrada
    ADD CONSTRAINT pk_entrada PRIMARY KEY (entcodsx);


--
-- TOC entry 2576 (class 2606 OID 637486)
-- Dependencies: 1892 1892
-- Name: pk_entrada2; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY entrada2
    ADD CONSTRAINT pk_entrada2 PRIMARY KEY (entcodsx);


--
-- TOC entry 2578 (class 2606 OID 637488)
-- Dependencies: 1895 1895
-- Name: pk_factura_trafico; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY factura_trafico
    ADD CONSTRAINT pk_factura_trafico PRIMARY KEY (ftrafcodsx);


--
-- TOC entry 2582 (class 2606 OID 637490)
-- Dependencies: 1897 1897
-- Name: pk_ingreso; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY ingreso
    ADD CONSTRAINT pk_ingreso PRIMARY KEY (ingcodsx);


--
-- TOC entry 2590 (class 2606 OID 637492)
-- Dependencies: 1901 1901
-- Name: pk_nacionalizacion; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY nacionalizacion
    ADD CONSTRAINT pk_nacionalizacion PRIMARY KEY (naccodsx);


--
-- TOC entry 2594 (class 2606 OID 637494)
-- Dependencies: 1903 1903
-- Name: pk_nad; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY nacionalizacion_detalle
    ADD CONSTRAINT pk_nad PRIMARY KEY (nadcodsx);


--
-- TOC entry 2598 (class 2606 OID 637496)
-- Dependencies: 1904 1904
-- Name: pk_nad2; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY nacionalizacion_detalle2
    ADD CONSTRAINT pk_nad2 PRIMARY KEY (nadcodsx);


--
-- TOC entry 2600 (class 2606 OID 637498)
-- Dependencies: 1908 1908
-- Name: pk_novedad; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY novedad_pedido
    ADD CONSTRAINT pk_novedad PRIMARY KEY (novcodsx);


--
-- TOC entry 2604 (class 2606 OID 637500)
-- Dependencies: 1911 1911
-- Name: pk_packd; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY packing_detalle
    ADD CONSTRAINT pk_packd PRIMARY KEY (packdcodsx);


--
-- TOC entry 2602 (class 2606 OID 637502)
-- Dependencies: 1910 1910
-- Name: pk_packing; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY packing
    ADD CONSTRAINT pk_packing PRIMARY KEY (packcodsx);


--
-- TOC entry 2608 (class 2606 OID 637504)
-- Dependencies: 1913 1913
-- Name: pk_packp; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY packing_detalle_posicion
    ADD CONSTRAINT pk_packp PRIMARY KEY (packpcodsx);


--
-- TOC entry 2610 (class 2606 OID 637506)
-- Dependencies: 1916 1916
-- Name: pk_pedido; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pk_pedido PRIMARY KEY (pedcodsx);


--
-- TOC entry 2614 (class 2606 OID 637508)
-- Dependencies: 1918 1918
-- Name: pk_picking; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY picking
    ADD CONSTRAINT pk_picking PRIMARY KEY (pickcodsx);


--
-- TOC entry 2623 (class 2606 OID 637510)
-- Dependencies: 1920 1920
-- Name: pk_picking_pack; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY picking_detalle_packing
    ADD CONSTRAINT pk_picking_pack PRIMARY KEY (pickpcodsx);


--
-- TOC entry 2625 (class 2606 OID 637512)
-- Dependencies: 1924 1924
-- Name: pk_ref_desp; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY referencia_despacho
    ADD CONSTRAINT pk_ref_desp PRIMARY KEY (refdcodsx);


--
-- TOC entry 2629 (class 2606 OID 637514)
-- Dependencies: 1925 1925
-- Name: pk_ref_desp_ped; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY referencia_despacho_pedido
    ADD CONSTRAINT pk_ref_desp_ped PRIMARY KEY (refdpcodsx);


--
-- TOC entry 2750 (class 2606 OID 647149)
-- Dependencies: 2019 2019
-- Name: pk_ref_desp_serial; Type: CONSTRAINT; Schema: movimiento; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY referencia_despacho_serial
    ADD CONSTRAINT pk_ref_desp_serial PRIMARY KEY (refdscodsx);


--
-- TOC entry 2633 (class 2606 OID 637516)
-- Dependencies: 1930 1930
-- Name: pk_referencia_trafico; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY referencia_trafico
    ADD CONSTRAINT pk_referencia_trafico PRIMARY KEY (reftcodsx);


--
-- TOC entry 2631 (class 2606 OID 637518)
-- Dependencies: 1928 1928
-- Name: pk_refp; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY referencia_pedido
    ADD CONSTRAINT pk_refp PRIMARY KEY (refpcodsx);


--
-- TOC entry 2693 (class 2606 OID 637520)
-- Dependencies: 1971 1971
-- Name: pk_renac; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY reubic_nacdetalle
    ADD CONSTRAINT pk_renac PRIMARY KEY (rencodsx);


--
-- TOC entry 2637 (class 2606 OID 637522)
-- Dependencies: 1932 1932
-- Name: pk_rep; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY reparacion
    ADD CONSTRAINT pk_rep PRIMARY KEY (repcodsx);


--
-- TOC entry 2641 (class 2606 OID 637524)
-- Dependencies: 1933 1933
-- Name: pk_repd; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY reparacion_detalle
    ADD CONSTRAINT pk_repd PRIMARY KEY (repdcodsx);


--
-- TOC entry 2643 (class 2606 OID 637526)
-- Dependencies: 1935 1935
-- Name: pk_repnac; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY reparacion_nacdet
    ADD CONSTRAINT pk_repnac PRIMARY KEY (repndcodsx);


--
-- TOC entry 2695 (class 2606 OID 637528)
-- Dependencies: 1973 1973
-- Name: pk_reubic; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY reubicacion
    ADD CONSTRAINT pk_reubic PRIMARY KEY (recodsx);


--
-- TOC entry 2689 (class 2606 OID 637530)
-- Dependencies: 1955 1955
-- Name: pk_trafico; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY trafico
    ADD CONSTRAINT pk_trafico PRIMARY KEY (trafcodsx);


--
-- TOC entry 2691 (class 2606 OID 637532)
-- Dependencies: 1955 1955 1955
-- Name: ua_trafico; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY trafico
    ADD CONSTRAINT ua_trafico UNIQUE (trafcompania, trafdocumento);


--
-- TOC entry 2558 (class 2606 OID 637534)
-- Dependencies: 1880 1880 1880 1880 1880
-- Name: uq_averia; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY averia
    ADD CONSTRAINT uq_averia UNIQUE (avecompania, avefecha, aveingreso, aveentrada);


--
-- TOC entry 2566 (class 2606 OID 637536)
-- Dependencies: 1886 1886 1886 1886
-- Name: uq_cont_traf; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY contenedor_trafico
    ADD CONSTRAINT uq_cont_traf UNIQUE (ctrafnumtrafico, ctraftamano, ctrafnumero);


--
-- TOC entry 2570 (class 2606 OID 637538)
-- Dependencies: 1888 1888 1888
-- Name: uq_despacho; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY despacho
    ADD CONSTRAINT uq_despacho UNIQUE (despempresa, despfecha);


--
-- TOC entry 2574 (class 2606 OID 637540)
-- Dependencies: 1890 1890 1890
-- Name: uq_despacho_pedido; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY despacho_pedido
    ADD CONSTRAINT uq_despacho_pedido UNIQUE (despeddespacho, despedpedido);


--
-- TOC entry 2514 (class 2606 OID 637542)
-- Dependencies: 1854 1854 1854 1854 1854
-- Name: uq_entrada; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY entrada
    ADD CONSTRAINT uq_entrada UNIQUE (entcodingreso, entcodproducto, entbodega, entposicion);


--
-- TOC entry 2580 (class 2606 OID 637544)
-- Dependencies: 1895 1895 1895
-- Name: uq_factura_trafico; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY factura_trafico
    ADD CONSTRAINT uq_factura_trafico UNIQUE (ftrafnumfactura, ftrafnumtrafico);


--
-- TOC entry 2584 (class 2606 OID 637546)
-- Dependencies: 1897 1897 1897
-- Name: uq_ingreso; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY ingreso
    ADD CONSTRAINT uq_ingreso UNIQUE (ingcodcia, ingtrafico);


--
-- TOC entry 2588 (class 2606 OID 637548)
-- Dependencies: 1899 1899 1899 1899 1899 1899 1899 1899
-- Name: uq_kardex_ingreso; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY kardex
    ADD CONSTRAINT uq_kardex_ingreso UNIQUE (kardcodproducto, kardmodelo, kardprodescripcion, kardcompania, kardnombrecomp, kardfechaing, kardcodigoingreso);


--
-- TOC entry 2592 (class 2606 OID 637550)
-- Dependencies: 1901 1901 1901 1901 1901
-- Name: uq_nac; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY nacionalizacion
    ADD CONSTRAINT uq_nac UNIQUE (nacempresa, nacfecha, nacingreso, nacdeclaracion);


--
-- TOC entry 2596 (class 2606 OID 637552)
-- Dependencies: 1903 1903 1903
-- Name: uq_nacionalizacion_detalle; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY nacionalizacion_detalle
    ADD CONSTRAINT uq_nacionalizacion_detalle UNIQUE (nadcodnac, nadentrada);


--
-- TOC entry 2616 (class 2606 OID 637554)
-- Dependencies: 1918 1918 1918 1918
-- Name: uq_packing; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY picking
    ADD CONSTRAINT uq_packing UNIQUE (pickfecha, pickempresa, pickcodpacking);


--
-- TOC entry 2606 (class 2606 OID 637556)
-- Dependencies: 1911 1911 1911
-- Name: uq_packing_det; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY packing_detalle
    ADD CONSTRAINT uq_packing_det UNIQUE (packdpacking, packdproducto);


--
-- TOC entry 2612 (class 2606 OID 637558)
-- Dependencies: 1916 1916 1916
-- Name: uq_pedido; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT uq_pedido UNIQUE (pedcompania, pednumpedido);


--
-- TOC entry 2620 (class 2606 OID 637560)
-- Dependencies: 1919 1919 1919
-- Name: uq_picking_det; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY picking_detalle
    ADD CONSTRAINT uq_picking_det UNIQUE (pickdcodpicking, pickdproducto);


--
-- TOC entry 2627 (class 2606 OID 647081)
-- Dependencies: 1924 1924 1924 1924
-- Name: uq_ref_desp; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY referencia_despacho
    ADD CONSTRAINT uq_ref_desp UNIQUE (refddespacho_pedido, refdproducto, refdserial);


--
-- TOC entry 2752 (class 2606 OID 647151)
-- Dependencies: 2019 2019 2019
-- Name: uq_ref_desp_serial; Type: CONSTRAINT; Schema: movimiento; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY referencia_despacho_serial
    ADD CONSTRAINT uq_ref_desp_serial UNIQUE (refdsreferencia_despacho, refdsserial);


--
-- TOC entry 2635 (class 2606 OID 637564)
-- Dependencies: 1930 1930 1930 1930
-- Name: uq_referencia_trafico; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY referencia_trafico
    ADD CONSTRAINT uq_referencia_trafico UNIQUE (reftnumfacturatrafico, reftproducto, reftserial);


--
-- TOC entry 2639 (class 2606 OID 637566)
-- Dependencies: 1932 1932 1932
-- Name: uq_rep; Type: CONSTRAINT; Schema: movimiento; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY reparacion
    ADD CONSTRAINT uq_rep UNIQUE (repcodcia, repfecha);


SET search_path = public, pg_catalog;

--
-- TOC entry 2697 (class 2606 OID 637568)
-- Dependencies: 1977 1977
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (catcodsx);


--
-- TOC entry 2657 (class 2606 OID 637570)
-- Dependencies: 1943 1943
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (clicodsx);


--
-- TOC entry 2645 (class 2606 OID 637572)
-- Dependencies: 1938 1938
-- Name: compania_comnombre_key; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY compania
    ADD CONSTRAINT compania_comnombre_key UNIQUE (comnombre);


--
-- TOC entry 2647 (class 2606 OID 637574)
-- Dependencies: 1938 1938
-- Name: compania_pkey; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY compania
    ADD CONSTRAINT compania_pkey PRIMARY KEY (comcodsx);


--
-- TOC entry 2653 (class 2606 OID 637576)
-- Dependencies: 1941 1941
-- Name: pd_bodega; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY bodega
    ADD CONSTRAINT pd_bodega PRIMARY KEY (bodcodsx);


--
-- TOC entry 2707 (class 2606 OID 637578)
-- Dependencies: 1995 1995
-- Name: pd_empleado; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT pd_empleado PRIMARY KEY (empcodsx);


--
-- TOC entry 2508 (class 2606 OID 16465)
-- Dependencies: 1826 1826
-- Name: pg_ts_cfg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pg_ts_cfg
    ADD CONSTRAINT pg_ts_cfg_pkey PRIMARY KEY (ts_name);


--
-- TOC entry 2510 (class 2606 OID 16472)
-- Dependencies: 1827 1827 1827
-- Name: pg_ts_cfgmap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pg_ts_cfgmap
    ADD CONSTRAINT pg_ts_cfgmap_pkey PRIMARY KEY (ts_name, tok_alias);


--
-- TOC entry 2504 (class 2606 OID 16409)
-- Dependencies: 1822 1822
-- Name: pg_ts_dict_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pg_ts_dict
    ADD CONSTRAINT pg_ts_dict_pkey PRIMARY KEY (dict_name);


--
-- TOC entry 2506 (class 2606 OID 16440)
-- Dependencies: 1823 1823
-- Name: pg_ts_parser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pg_ts_parser
    ADD CONSTRAINT pg_ts_parser_pkey PRIMARY KEY (prs_name);


--
-- TOC entry 2681 (class 2606 OID 637580)
-- Dependencies: 1951 1951
-- Name: pk_causal; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY causal
    ADD CONSTRAINT pk_causal PRIMARY KEY (caucodsx);


--
-- TOC entry 2701 (class 2606 OID 637582)
-- Dependencies: 1990 1990
-- Name: pk_causalhit; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY causal_hit
    ADD CONSTRAINT pk_causalhit PRIMARY KEY (cauhcodsx);


--
-- TOC entry 2665 (class 2606 OID 637584)
-- Dependencies: 1946 1946
-- Name: pk_ciudad; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT pk_ciudad PRIMARY KEY (ciucodigo);


--
-- TOC entry 2703 (class 2606 OID 637586)
-- Dependencies: 1994 1994
-- Name: pk_config_nombre; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY config
    ADD CONSTRAINT pk_config_nombre PRIMARY KEY (cfnombre);


--
-- TOC entry 2671 (class 2606 OID 637588)
-- Dependencies: 1947 1947
-- Name: pk_departamento; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT pk_departamento PRIMARY KEY (depcodigo);


--
-- TOC entry 2711 (class 2606 OID 637590)
-- Dependencies: 1997 1997
-- Name: pk_empresa; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT pk_empresa PRIMARY KEY (empcodsx);


--
-- TOC entry 2715 (class 2606 OID 637592)
-- Dependencies: 1999 1999
-- Name: pk_faq; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY faq
    ADD CONSTRAINT pk_faq PRIMARY KEY (faqcodsx);


--
-- TOC entry 2719 (class 2606 OID 637594)
-- Dependencies: 2001 2001
-- Name: pk_flete; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY flete
    ADD CONSTRAINT pk_flete PRIMARY KEY (flecodsx);


--
-- TOC entry 2723 (class 2606 OID 637596)
-- Dependencies: 2003 2003
-- Name: pk_grupo; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY grupo
    ADD CONSTRAINT pk_grupo PRIMARY KEY (gcodsx);


--
-- TOC entry 2732 (class 2606 OID 637598)
-- Dependencies: 2005 2005
-- Name: pk_permiso; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT pk_permiso PRIMARY KEY (percodsx);


--
-- TOC entry 2736 (class 2606 OID 637600)
-- Dependencies: 2007 2007
-- Name: pk_proc; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY producto_cliente
    ADD CONSTRAINT pk_proc PRIMARY KEY (proccodsx);


--
-- TOC entry 2661 (class 2606 OID 637602)
-- Dependencies: 1944 1944
-- Name: pk_transp; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY transportadora
    ADD CONSTRAINT pk_transp PRIMARY KEY (transpcodsx);


--
-- TOC entry 2746 (class 2606 OID 637604)
-- Dependencies: 2015 2015
-- Name: pk_usuario; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (usucodsx);


--
-- TOC entry 2685 (class 2606 OID 637606)
-- Dependencies: 1952 1952
-- Name: pk_zona; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY zona
    ADD CONSTRAINT pk_zona PRIMARY KEY (zoncodsx);


--
-- TOC entry 2744 (class 2606 OID 637608)
-- Dependencies: 2014 2014
-- Name: pkunid; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY unidad
    ADD CONSTRAINT pkunid PRIMARY KEY (unicod);


--
-- TOC entry 2649 (class 2606 OID 637610)
-- Dependencies: 1939 1939
-- Name: producto_pkey; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (procodsx);


--
-- TOC entry 2677 (class 2606 OID 637612)
-- Dependencies: 1948 1948
-- Name: sucursal_pkey; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY sucursal
    ADD CONSTRAINT sucursal_pkey PRIMARY KEY (succodsx);


--
-- TOC entry 2740 (class 2606 OID 637614)
-- Dependencies: 2011 2011
-- Name: tipoproducto_pkey; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY tipoproducto
    ADD CONSTRAINT tipoproducto_pkey PRIMARY KEY (tiprcodsx);


--
-- TOC entry 2655 (class 2606 OID 637616)
-- Dependencies: 1941 1941
-- Name: uq_bodega; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY bodega
    ADD CONSTRAINT uq_bodega UNIQUE (bodnombre);


--
-- TOC entry 2683 (class 2606 OID 637620)
-- Dependencies: 1951 1951
-- Name: uq_causal; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY causal
    ADD CONSTRAINT uq_causal UNIQUE (caudesc);


--
-- TOC entry 2709 (class 2606 OID 637622)
-- Dependencies: 1995 1995
-- Name: uq_ced; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT uq_ced UNIQUE (empcedula);


--
-- TOC entry 2667 (class 2606 OID 637624)
-- Dependencies: 1946 1946
-- Name: uq_ciudad_codigo; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT uq_ciudad_codigo UNIQUE (ciucodigo);


--
-- TOC entry 2659 (class 2606 OID 637626)
-- Dependencies: 1943 1943 1943
-- Name: uq_cliente_codigo; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT uq_cliente_codigo UNIQUE (clicodcompania, clicodigo);


--
-- TOC entry 2673 (class 2606 OID 637628)
-- Dependencies: 1947 1947
-- Name: uq_cod; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT uq_cod UNIQUE (depcodigo);


--
-- TOC entry 2705 (class 2606 OID 637630)
-- Dependencies: 1994 1994
-- Name: uq_config_nombre; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY config
    ADD CONSTRAINT uq_config_nombre UNIQUE (cfnombre);


--
-- TOC entry 2675 (class 2606 OID 637632)
-- Dependencies: 1947 1947
-- Name: uq_depto; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT uq_depto UNIQUE (depnombre);


--
-- TOC entry 2713 (class 2606 OID 637634)
-- Dependencies: 1997 1997
-- Name: uq_empresa; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT uq_empresa UNIQUE (empnit);


--
-- TOC entry 2717 (class 2606 OID 637636)
-- Dependencies: 1999 1999
-- Name: uq_faq; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY faq
    ADD CONSTRAINT uq_faq UNIQUE (faqpregunta);


--
-- TOC entry 2721 (class 2606 OID 637638)
-- Dependencies: 2001 2001 2001
-- Name: uq_flete_ciudad_transp; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY flete
    ADD CONSTRAINT uq_flete_ciudad_transp UNIQUE (fleciudad, fletransportadora);


--
-- TOC entry 2725 (class 2606 OID 637640)
-- Dependencies: 2003 2003
-- Name: uq_grupo; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY grupo
    ADD CONSTRAINT uq_grupo UNIQUE (gnombre);


--
-- TOC entry 2748 (class 2606 OID 637642)
-- Dependencies: 2015 2015
-- Name: uq_login; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT uq_login UNIQUE (usulogin);


--
-- TOC entry 2669 (class 2606 OID 637644)
-- Dependencies: 1946 1946 1946
-- Name: uq_nombre; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT uq_nombre UNIQUE (ciunombre, ciudepto);


--
-- TOC entry 2734 (class 2606 OID 637646)
-- Dependencies: 2005 2005 2005 2005
-- Name: uq_permiso; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT uq_permiso UNIQUE (pergrupo, perapp, permodulo);


--
-- TOC entry 2738 (class 2606 OID 637648)
-- Dependencies: 2007 2007 2007
-- Name: uq_procc; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY producto_cliente
    ADD CONSTRAINT uq_procc UNIQUE (proccliente, procproducto);


--
-- TOC entry 2651 (class 2606 OID 637650)
-- Dependencies: 1939 1939 1939
-- Name: uq_producto; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT uq_producto UNIQUE (procodigocia, promodelo);


--
-- TOC entry 2679 (class 2606 OID 637652)
-- Dependencies: 1948 1948 1948
-- Name: uq_suc; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY sucursal
    ADD CONSTRAINT uq_suc UNIQUE (succodigo, succodcliente);


--
-- TOC entry 2742 (class 2606 OID 637654)
-- Dependencies: 2011 2011 2011
-- Name: uq_tipoproducto; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY tipoproducto
    ADD CONSTRAINT uq_tipoproducto UNIQUE (tiprcodcompania, tiprdescripcion);


--
-- TOC entry 2663 (class 2606 OID 637656)
-- Dependencies: 1944 1944
-- Name: uq_trans_nombre; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY transportadora
    ADD CONSTRAINT uq_trans_nombre UNIQUE (transpnombre);


--
-- TOC entry 2687 (class 2606 OID 637658)
-- Dependencies: 1952 1952
-- Name: uq_zona; Type: CONSTRAINT; Schema: public; Owner: usersgl; Tablespace: 
--

ALTER TABLE ONLY zona
    ADD CONSTRAINT uq_zona UNIQUE (zonnombre);


SET search_path = movimiento, pg_catalog;

--
-- TOC entry 2621 (class 1259 OID 637659)
-- Dependencies: 1920
-- Name: fki_pickp_detalle; Type: INDEX; Schema: movimiento; Owner: usersgl; Tablespace: 
--

CREATE INDEX fki_pickp_detalle ON picking_detalle_packing USING btree (pickppickingdetalle);


SET search_path = public, pg_catalog;

--
-- TOC entry 2698 (class 1259 OID 637660)
-- Dependencies: 1983
-- Name: idx_auditoria_fecha; Type: INDEX; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE INDEX idx_auditoria_fecha ON auditoria USING btree (audifecha);


--
-- TOC entry 2699 (class 1259 OID 637661)
-- Dependencies: 1983 1983
-- Name: idx_auditoria_login; Type: INDEX; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE INDEX idx_auditoria_login ON auditoria USING btree (audifecha, audiusuario);


--
-- TOC entry 2726 (class 1259 OID 637662)
-- Dependencies: 2005
-- Name: idx_perapp; Type: INDEX; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE INDEX idx_perapp ON permiso USING btree (perapp);


--
-- TOC entry 2727 (class 1259 OID 637663)
-- Dependencies: 2005
-- Name: idx_pergrupo; Type: INDEX; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE INDEX idx_pergrupo ON permiso USING btree (pergrupo);


--
-- TOC entry 2728 (class 1259 OID 637664)
-- Dependencies: 2005 2005 2005 2005
-- Name: idx_permiso; Type: INDEX; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE INDEX idx_permiso ON permiso USING btree (pergrupo, perapp, permodulo, peracceso);


--
-- TOC entry 2729 (class 1259 OID 637665)
-- Dependencies: 2005
-- Name: idx_permodulo; Type: INDEX; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE INDEX idx_permodulo ON permiso USING btree (permodulo);


--
-- TOC entry 2730 (class 1259 OID 637666)
-- Dependencies: 2005
-- Name: ix_peracceso; Type: INDEX; Schema: public; Owner: usersgl; Tablespace: 
--

CREATE INDEX ix_peracceso ON permiso USING btree (peracceso);


SET search_path = facturacion, pg_catalog;

--
-- TOC entry 2876 (class 2620 OID 637667)
-- Dependencies: 1859 142
-- Name: actualizar_concepto_cliente; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER actualizar_concepto_cliente
    AFTER INSERT ON cliente_facturacion
    FOR EACH ROW
    EXECUTE PROCEDURE actualizar_concepto_cliente();


--
-- TOC entry 2879 (class 2620 OID 637668)
-- Dependencies: 142 1861
-- Name: actualizar_concepto_cliente; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER actualizar_concepto_cliente
    AFTER INSERT OR UPDATE ON concepto
    FOR EACH ROW
    EXECUTE PROCEDURE actualizar_concepto_cliente();


--
-- TOC entry 2887 (class 2620 OID 637669)
-- Dependencies: 143 1868
-- Name: actualizar_subtotal_factura; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER actualizar_subtotal_factura
    AFTER INSERT OR DELETE OR UPDATE ON factura_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE actualizar_subtotal_factura();


--
-- TOC entry 2884 (class 2620 OID 637670)
-- Dependencies: 1867 144
-- Name: actualizar_total_factura; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER actualizar_total_factura
    BEFORE INSERT OR UPDATE ON factura
    FOR EACH ROW
    EXECUTE PROCEDURE actualizar_total_factura();


--
-- TOC entry 2873 (class 2620 OID 637671)
-- Dependencies: 146 1857
-- Name: actualizar_unidades; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER actualizar_unidades
    BEFORE INSERT OR UPDATE ON almacenamiento
    FOR EACH ROW
    EXECUTE PROCEDURE actualizar_unidades_almacenamiento();


--
-- TOC entry 2870 (class 2620 OID 637672)
-- Dependencies: 1855 260
-- Name: auditoria; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON alistamiento
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2874 (class 2620 OID 637673)
-- Dependencies: 1857 260
-- Name: auditoria; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON almacenamiento
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2877 (class 2620 OID 637674)
-- Dependencies: 260 1859
-- Name: auditoria; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON cliente_facturacion
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2882 (class 2620 OID 637675)
-- Dependencies: 1862 260
-- Name: auditoria; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON concepto_cliente
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2880 (class 2620 OID 637676)
-- Dependencies: 1861 260
-- Name: auditoria; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON concepto
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2888 (class 2620 OID 637677)
-- Dependencies: 1868 260
-- Name: auditoria; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON factura_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2885 (class 2620 OID 637678)
-- Dependencies: 1867 260
-- Name: auditoria; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON factura
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2891 (class 2620 OID 637679)
-- Dependencies: 1873 260
-- Name: auditoria; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON proforma
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2890 (class 2620 OID 637680)
-- Dependencies: 264 1871
-- Name: resumen; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON numfactura
    FOR EACH ROW
    EXECUTE PROCEDURE public.resumen();


--
-- TOC entry 2871 (class 2620 OID 637681)
-- Dependencies: 155 1855
-- Name: resumen_alistamiento; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER resumen_alistamiento
    BEFORE INSERT OR UPDATE ON alistamiento
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_alistamiento();


--
-- TOC entry 2875 (class 2620 OID 637682)
-- Dependencies: 1857 156
-- Name: resumen_almacenamiento; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER resumen_almacenamiento
    BEFORE INSERT OR UPDATE ON almacenamiento
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_almacenamiento();


--
-- TOC entry 2878 (class 2620 OID 637683)
-- Dependencies: 157 1859
-- Name: resumen_cliente_facturacion; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER resumen_cliente_facturacion
    BEFORE INSERT OR UPDATE ON cliente_facturacion
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_cliente_facturacion();


--
-- TOC entry 2881 (class 2620 OID 637684)
-- Dependencies: 158 1861
-- Name: resumen_concepto; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER resumen_concepto
    BEFORE INSERT OR UPDATE ON concepto
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_concepto();


--
-- TOC entry 2883 (class 2620 OID 637685)
-- Dependencies: 159 1862
-- Name: resumen_concepto_cliente; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER resumen_concepto_cliente
    BEFORE INSERT OR UPDATE ON concepto_cliente
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_concepto_cliente();


--
-- TOC entry 2886 (class 2620 OID 637686)
-- Dependencies: 160 1867
-- Name: resumen_factura; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER resumen_factura
    BEFORE INSERT OR UPDATE ON factura
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_factura();


--
-- TOC entry 2889 (class 2620 OID 637687)
-- Dependencies: 1868 161
-- Name: resumen_factura_Detalle; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER "resumen_factura_Detalle"
    BEFORE INSERT OR UPDATE ON factura_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_factura_detalle();


--
-- TOC entry 2892 (class 2620 OID 637688)
-- Dependencies: 162 1873
-- Name: resumen_proform; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER resumen_proform
    BEFORE INSERT OR UPDATE ON proforma
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_proforma();


--
-- TOC entry 2872 (class 2620 OID 637689)
-- Dependencies: 1855 145
-- Name: tg_alistamiento_actualizar; Type: TRIGGER; Schema: facturacion; Owner: usersgl
--

CREATE TRIGGER tg_alistamiento_actualizar
    BEFORE INSERT OR UPDATE ON alistamiento
    FOR EACH ROW
    EXECUTE PROCEDURE actualizar_unidades_alistamiento();


SET search_path = movimiento, pg_catalog;

--
-- TOC entry 2893 (class 2620 OID 637690)
-- Dependencies: 1878 260
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON ajuste
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2896 (class 2620 OID 637691)
-- Dependencies: 1880 260
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON averia
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2899 (class 2620 OID 637692)
-- Dependencies: 260 1882
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON averia_nacdet
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2900 (class 2620 OID 637693)
-- Dependencies: 260 1884
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON causal_pedido
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2902 (class 2620 OID 637694)
-- Dependencies: 260 1886
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON contenedor_trafico
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2904 (class 2620 OID 637695)
-- Dependencies: 260 1888
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON despacho
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2908 (class 2620 OID 637696)
-- Dependencies: 260 1890
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON despacho_pedido
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2866 (class 2620 OID 637697)
-- Dependencies: 1854 260
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON entrada
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2910 (class 2620 OID 637698)
-- Dependencies: 260 1895
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON factura_trafico
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2912 (class 2620 OID 637699)
-- Dependencies: 260 1897
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON ingreso
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2920 (class 2620 OID 637700)
-- Dependencies: 260 1903
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON nacionalizacion_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2917 (class 2620 OID 637701)
-- Dependencies: 1901 260
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON nacionalizacion
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2925 (class 2620 OID 637702)
-- Dependencies: 1908 260
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON novedad_pedido
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2929 (class 2620 OID 637703)
-- Dependencies: 1911 260
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON packing_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2933 (class 2620 OID 637704)
-- Dependencies: 1913 260
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON packing_detalle_posicion
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2927 (class 2620 OID 637705)
-- Dependencies: 1910 260
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON packing
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2936 (class 2620 OID 637706)
-- Dependencies: 1916 260
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON pedido
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2941 (class 2620 OID 637707)
-- Dependencies: 1919 260
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON picking_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2945 (class 2620 OID 637708)
-- Dependencies: 1920 260
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON picking_detalle_packing
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2939 (class 2620 OID 637709)
-- Dependencies: 260 1918
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON picking
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2948 (class 2620 OID 637710)
-- Dependencies: 260 1924
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON referencia_despacho
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2950 (class 2620 OID 637711)
-- Dependencies: 1925 260
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON referencia_despacho_pedido
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2953 (class 2620 OID 637712)
-- Dependencies: 260 1928
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON referencia_pedido
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2958 (class 2620 OID 637713)
-- Dependencies: 1930 260
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON referencia_trafico
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2964 (class 2620 OID 637714)
-- Dependencies: 260 1933
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON reparacion_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2961 (class 2620 OID 637715)
-- Dependencies: 1932 260
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON reparacion
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2967 (class 2620 OID 637716)
-- Dependencies: 1935 260
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON reparacion_nacdet
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2994 (class 2620 OID 637717)
-- Dependencies: 260 1973
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON reubicacion
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2992 (class 2620 OID 637718)
-- Dependencies: 1971 260
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON reubic_nacdetalle
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2990 (class 2620 OID 637719)
-- Dependencies: 260 1955
-- Name: auditoria; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON trafico
    FOR EACH ROW
    EXECUTE PROCEDURE public.auditor();


--
-- TOC entry 2905 (class 2620 OID 637720)
-- Dependencies: 1888 209
-- Name: kardex; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER kardex
    BEFORE DELETE OR UPDATE ON despacho
    FOR EACH ROW
    EXECUTE PROCEDURE kardex();


--
-- TOC entry 2913 (class 2620 OID 637721)
-- Dependencies: 1897 209
-- Name: kardex; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER kardex
    BEFORE DELETE OR UPDATE ON ingreso
    FOR EACH ROW
    EXECUTE PROCEDURE kardex();


--
-- TOC entry 2918 (class 2620 OID 637722)
-- Dependencies: 1901 209
-- Name: kardex; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER kardex
    BEFORE INSERT OR DELETE OR UPDATE ON nacionalizacion
    FOR EACH ROW
    EXECUTE PROCEDURE kardex();


--
-- TOC entry 2894 (class 2620 OID 637723)
-- Dependencies: 1878 209
-- Name: kardex; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER kardex
    BEFORE INSERT OR DELETE OR UPDATE ON ajuste
    FOR EACH ROW
    EXECUTE PROCEDURE kardex();


--
-- TOC entry 2916 (class 2620 OID 637724)
-- Dependencies: 217 1899
-- Name: recalcular_kardes; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER recalcular_kardes
    AFTER INSERT OR DELETE ON kardex
    FOR EACH ROW
    EXECUTE PROCEDURE recalcular_kardex();


--
-- TOC entry 2991 (class 2620 OID 637725)
-- Dependencies: 1955 238
-- Name: resumen; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON trafico
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_trafico();


--
-- TOC entry 2959 (class 2620 OID 637726)
-- Dependencies: 1930 238
-- Name: resumen; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR DELETE OR UPDATE ON referencia_trafico
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_trafico();


--
-- TOC entry 2911 (class 2620 OID 637727)
-- Dependencies: 238 1895
-- Name: resumen; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR DELETE OR UPDATE ON factura_trafico
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_trafico();


--
-- TOC entry 2903 (class 2620 OID 637728)
-- Dependencies: 238 1886
-- Name: resumen; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR DELETE OR UPDATE ON contenedor_trafico
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_trafico();


--
-- TOC entry 2914 (class 2620 OID 637729)
-- Dependencies: 1897 226
-- Name: resumen; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON ingreso
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_ingreso();


--
-- TOC entry 2928 (class 2620 OID 637730)
-- Dependencies: 1910 229
-- Name: resumen; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON packing
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_packing();


--
-- TOC entry 2930 (class 2620 OID 637731)
-- Dependencies: 229 1911
-- Name: resumen; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR DELETE OR UPDATE ON packing_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_packing();


--
-- TOC entry 2901 (class 2620 OID 637732)
-- Dependencies: 231 1884
-- Name: resumen; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON causal_pedido
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_pedido();


--
-- TOC entry 2926 (class 2620 OID 637733)
-- Dependencies: 1908 231
-- Name: resumen; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON novedad_pedido
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_pedido();


--
-- TOC entry 2962 (class 2620 OID 637734)
-- Dependencies: 1932 235
-- Name: resumen; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON reparacion
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_reparacion();


--
-- TOC entry 2965 (class 2620 OID 637735)
-- Dependencies: 1933 235
-- Name: resumen; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON reparacion_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_reparacion();


--
-- TOC entry 2895 (class 2620 OID 637736)
-- Dependencies: 1878 222
-- Name: resumen_ajuste; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen_ajuste
    BEFORE INSERT OR UPDATE ON ajuste
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_ajuste();


--
-- TOC entry 2897 (class 2620 OID 637737)
-- Dependencies: 1880 223
-- Name: resumen_averia; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen_averia
    BEFORE INSERT OR UPDATE ON averia
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_averia();


--
-- TOC entry 2906 (class 2620 OID 637738)
-- Dependencies: 224 1888
-- Name: resumen_despacho; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen_despacho
    BEFORE INSERT OR UPDATE ON despacho
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_despacho();


--
-- TOC entry 2867 (class 2620 OID 637739)
-- Dependencies: 1854 225
-- Name: resumen_entrada; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen_entrada
    BEFORE INSERT OR UPDATE ON entrada
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_entrada();


--
-- TOC entry 2868 (class 2620 OID 637740)
-- Dependencies: 1854 226
-- Name: resumen_ingreso; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen_ingreso
    BEFORE INSERT OR DELETE OR UPDATE ON entrada
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_ingreso();


--
-- TOC entry 2921 (class 2620 OID 637741)
-- Dependencies: 227 1903
-- Name: resumen_nacionaliacion; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen_nacionaliacion
    BEFORE INSERT OR DELETE OR UPDATE ON nacionalizacion_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_nacionalizacion();


--
-- TOC entry 2919 (class 2620 OID 637742)
-- Dependencies: 227 1901
-- Name: resumen_nacionalizacion; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen_nacionalizacion
    BEFORE INSERT OR UPDATE ON nacionalizacion
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_nacionalizacion();


--
-- TOC entry 2922 (class 2620 OID 637743)
-- Dependencies: 1903 228
-- Name: resumen_nacionalizacion_detalle; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen_nacionalizacion_detalle
    BEFORE INSERT OR UPDATE ON nacionalizacion_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE "resumen_nacionalizacion_Detalle"();


--
-- TOC entry 2931 (class 2620 OID 637744)
-- Dependencies: 230 1911
-- Name: resumen_packingdetalle; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen_packingdetalle
    BEFORE INSERT OR UPDATE ON packing_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_packing_detalle();


--
-- TOC entry 2937 (class 2620 OID 637745)
-- Dependencies: 231 1916
-- Name: resumen_pedido; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen_pedido
    BEFORE INSERT OR UPDATE ON pedido
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_pedido();


--
-- TOC entry 2954 (class 2620 OID 637746)
-- Dependencies: 231 1928
-- Name: resumen_pedido; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen_pedido
    BEFORE INSERT OR DELETE OR UPDATE ON referencia_pedido
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_pedido();


--
-- TOC entry 2940 (class 2620 OID 637747)
-- Dependencies: 1918 232
-- Name: resumen_picking; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen_picking
    BEFORE INSERT OR UPDATE ON picking
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_picking();


--
-- TOC entry 2942 (class 2620 OID 637748)
-- Dependencies: 232 1919
-- Name: resumen_picking; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen_picking
    BEFORE INSERT OR DELETE OR UPDATE ON picking_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_picking();


--
-- TOC entry 2943 (class 2620 OID 637749)
-- Dependencies: 233 1919
-- Name: resumen_picking_detalle; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen_picking_detalle
    BEFORE INSERT OR UPDATE ON picking_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_picking_detalle();


--
-- TOC entry 2955 (class 2620 OID 637750)
-- Dependencies: 234 1928
-- Name: resumen_referencia_pedido; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen_referencia_pedido
    BEFORE INSERT OR UPDATE ON referencia_pedido
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_referencia_pedido();


--
-- TOC entry 2995 (class 2620 OID 637751)
-- Dependencies: 1973 236
-- Name: resumen_reubicacion; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER resumen_reubicacion
    BEFORE INSERT OR UPDATE ON reubicacion
    FOR EACH ROW
    EXECUTE PROCEDURE resumen_reubicacion();


--
-- TOC entry 2966 (class 2620 OID 637752)
-- Dependencies: 242 1933
-- Name: tg_averia; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_averia
    BEFORE DELETE OR UPDATE ON reparacion_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_averia();


--
-- TOC entry 2938 (class 2620 OID 637753)
-- Dependencies: 176 1916
-- Name: tg_causal_hit_pedido; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_causal_hit_pedido
    AFTER INSERT OR UPDATE ON pedido
    FOR EACH ROW
    EXECUTE PROCEDURE causal_pedido();


--
-- TOC entry 2951 (class 2620 OID 637754)
-- Dependencies: 1925 243
-- Name: tg_gst_Despacho; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER "tg_gst_Despacho"
    BEFORE DELETE ON referencia_despacho_pedido
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_despacho();


--
-- TOC entry 2898 (class 2620 OID 637755)
-- Dependencies: 242 1880
-- Name: tg_gst_averia; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_averia
    BEFORE DELETE ON averia
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_averia();


--
-- TOC entry 2909 (class 2620 OID 637756)
-- Dependencies: 244 1890
-- Name: tg_gst_despacho_act_datos; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_despacho_act_datos
    AFTER INSERT OR DELETE OR UPDATE ON despacho_pedido
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_despacho_actualizar_datos();


--
-- TOC entry 2949 (class 2620 OID 637757)
-- Dependencies: 244 1924
-- Name: tg_gst_despacho_actualizar; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_despacho_actualizar
    AFTER INSERT OR DELETE OR UPDATE ON referencia_despacho
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_despacho_actualizar_datos();


--
-- TOC entry 2952 (class 2620 OID 637758)
-- Dependencies: 1925 244
-- Name: tg_gst_despacho_actualizar; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_despacho_actualizar
    AFTER INSERT OR DELETE OR UPDATE ON referencia_despacho_pedido
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_despacho_actualizar_datos();


--
-- TOC entry 2869 (class 2620 OID 637759)
-- Dependencies: 245 1854
-- Name: tg_gst_ingreso; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_ingreso
    AFTER INSERT OR DELETE OR UPDATE ON entrada
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_ingreso();


--
-- TOC entry 2923 (class 2620 OID 637760)
-- Dependencies: 1903 246
-- Name: tg_gst_nac_actualizar; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_nac_actualizar
    AFTER INSERT OR DELETE OR UPDATE ON nacionalizacion_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_nacionalizaciones_actualizar_datos();


--
-- TOC entry 2924 (class 2620 OID 637761)
-- Dependencies: 247 1903
-- Name: tg_gst_nac_liberar; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_nac_liberar
    BEFORE DELETE ON nacionalizacion_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_nacionalizaciones_liberar_entrada();


--
-- TOC entry 2934 (class 2620 OID 637762)
-- Dependencies: 1913 248
-- Name: tg_gst_packing_actualizar; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_packing_actualizar
    AFTER INSERT OR UPDATE ON packing_detalle_posicion
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_packing_actualizar_datos();


--
-- TOC entry 2932 (class 2620 OID 637763)
-- Dependencies: 248 1911
-- Name: tg_gst_packing_actualizar_datos; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_packing_actualizar_datos
    AFTER INSERT OR DELETE OR UPDATE ON packing_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_packing_actualizar_datos();


--
-- TOC entry 2935 (class 2620 OID 637764)
-- Dependencies: 249 1913
-- Name: tg_gst_packing_detalle_posicion; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_packing_detalle_posicion
    BEFORE DELETE ON packing_detalle_posicion
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_packing_detalle_posicion();


--
-- TOC entry 2956 (class 2620 OID 637765)
-- Dependencies: 1928 251
-- Name: tg_gst_pedido_Actualizar_datos; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER "tg_gst_pedido_Actualizar_datos"
    AFTER INSERT OR DELETE OR UPDATE ON referencia_pedido
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_pedido_actualizar_datos();


--
-- TOC entry 2946 (class 2620 OID 637766)
-- Dependencies: 252 1920
-- Name: tg_gst_picking; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_picking
    BEFORE DELETE ON picking_detalle_packing
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_picking();


--
-- TOC entry 2944 (class 2620 OID 637767)
-- Dependencies: 1919 253
-- Name: tg_gst_picking_actualizar_datos; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_picking_actualizar_datos
    AFTER INSERT OR DELETE OR UPDATE ON picking_detalle
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_picking_actualizar_datos();


--
-- TOC entry 2947 (class 2620 OID 637768)
-- Dependencies: 253 1920
-- Name: tg_gst_picking_actualizar_datos; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_picking_actualizar_datos
    AFTER INSERT OR DELETE OR UPDATE ON picking_detalle_packing
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_picking_actualizar_datos();


--
-- TOC entry 2957 (class 2620 OID 637769)
-- Dependencies: 250 1928
-- Name: tg_gst_referencia_pedido; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_referencia_pedido
    BEFORE DELETE ON referencia_pedido
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_pedido();


--
-- TOC entry 2963 (class 2620 OID 637770)
-- Dependencies: 1932 254
-- Name: tg_gst_reparacion; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_reparacion
    BEFORE INSERT OR UPDATE ON reparacion
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_reparacion();


--
-- TOC entry 2996 (class 2620 OID 637771)
-- Dependencies: 1973 255
-- Name: tg_gst_reubicacion; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_reubicacion
    BEFORE DELETE ON reubicacion
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_reubicacion();


--
-- TOC entry 2907 (class 2620 OID 637772)
-- Dependencies: 1888 256
-- Name: tg_gst_saldo; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_saldo
    BEFORE UPDATE ON despacho
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_saldo();


--
-- TOC entry 2915 (class 2620 OID 637773)
-- Dependencies: 256 1897
-- Name: tg_gst_saldo; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_saldo
    AFTER UPDATE ON ingreso
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_saldo();


--
-- TOC entry 2960 (class 2620 OID 637774)
-- Dependencies: 1930 257
-- Name: tg_gst_trafico; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_gst_trafico
    AFTER INSERT OR DELETE OR UPDATE ON referencia_trafico
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_trafico();


--
-- TOC entry 2968 (class 2620 OID 637775)
-- Dependencies: 1935 254
-- Name: tg_reparacion; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_reparacion
    BEFORE DELETE ON reparacion_nacdet
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_reparacion();


--
-- TOC entry 2993 (class 2620 OID 637776)
-- Dependencies: 1971 255
-- Name: tg_reubic_nacdet; Type: TRIGGER; Schema: movimiento; Owner: usersgl
--

CREATE TRIGGER tg_reubic_nacdet
    AFTER DELETE ON reubic_nacdetalle
    FOR EACH ROW
    EXECUTE PROCEDURE tg_gst_reubicacion();


SET search_path = public, pg_catalog;

--
-- TOC entry 2969 (class 2620 OID 637777)
-- Dependencies: 1938 141
-- Name: TG_ACTUALIZAR_CLIENTE_FACTURACION; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER "TG_ACTUALIZAR_CLIENTE_FACTURACION"
    AFTER INSERT OR DELETE OR UPDATE ON compania
    FOR EACH ROW
    EXECUTE PROCEDURE facturacion.actualizar_cliente_facturacion();


--
-- TOC entry 2974 (class 2620 OID 637778)
-- Dependencies: 260 1941
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON bodega
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 2997 (class 2620 OID 637779)
-- Dependencies: 260 1977
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON categoria
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 2986 (class 2620 OID 637780)
-- Dependencies: 260 1951
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON causal
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 2999 (class 2620 OID 637781)
-- Dependencies: 1990 260
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON causal_hit
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 2980 (class 2620 OID 637782)
-- Dependencies: 260 1946
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON ciudad
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 2976 (class 2620 OID 637783)
-- Dependencies: 260 1943
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON cliente
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 2970 (class 2620 OID 637784)
-- Dependencies: 1938 260
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON compania
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 3001 (class 2620 OID 637785)
-- Dependencies: 1994 260
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON config
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 2982 (class 2620 OID 637786)
-- Dependencies: 260 1947
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON departamento
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 3002 (class 2620 OID 637787)
-- Dependencies: 260 1995
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON empleado
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 3004 (class 2620 OID 637788)
-- Dependencies: 1997 260
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON empresa
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 3005 (class 2620 OID 637789)
-- Dependencies: 1999 260
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON faq
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 3007 (class 2620 OID 637790)
-- Dependencies: 260 2001
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON flete
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 3009 (class 2620 OID 637791)
-- Dependencies: 260 2003
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON grupo
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 3011 (class 2620 OID 637792)
-- Dependencies: 2005 260
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON permiso
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 3013 (class 2620 OID 637793)
-- Dependencies: 260 2007
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON producto_cliente
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 2972 (class 2620 OID 637794)
-- Dependencies: 1939 260
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON producto
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 2984 (class 2620 OID 637795)
-- Dependencies: 1948 260
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON sucursal
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 2978 (class 2620 OID 637796)
-- Dependencies: 260 1944
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON transportadora
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 3017 (class 2620 OID 637797)
-- Dependencies: 2014 260
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON unidad
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 3018 (class 2620 OID 637798)
-- Dependencies: 2015 260
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON usuario
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 2988 (class 2620 OID 637799)
-- Dependencies: 260 1952
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON zona
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 3015 (class 2620 OID 637800)
-- Dependencies: 2011 260
-- Name: auditoria; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER auditoria
    AFTER INSERT OR DELETE OR UPDATE ON tipoproducto
    FOR EACH ROW
    EXECUTE PROCEDURE auditor();


--
-- TOC entry 2973 (class 2620 OID 637801)
-- Dependencies: 1939 264
-- Name: resum; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resum
    BEFORE INSERT OR UPDATE ON producto
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 2989 (class 2620 OID 637802)
-- Dependencies: 1952 264
-- Name: resum; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resum
    BEFORE INSERT OR UPDATE ON zona
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 3019 (class 2620 OID 637803)
-- Dependencies: 2015 264
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON usuario
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 3010 (class 2620 OID 637804)
-- Dependencies: 2003 264
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON grupo
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 3012 (class 2620 OID 637805)
-- Dependencies: 2005 264
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON permiso
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 2971 (class 2620 OID 637806)
-- Dependencies: 264 1938
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON compania
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 2998 (class 2620 OID 637807)
-- Dependencies: 264 1977
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON categoria
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 2977 (class 2620 OID 637808)
-- Dependencies: 1943 264
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON cliente
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 2981 (class 2620 OID 637809)
-- Dependencies: 264 1946
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON ciudad
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 2983 (class 2620 OID 637810)
-- Dependencies: 1947 264
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON departamento
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 2979 (class 2620 OID 637811)
-- Dependencies: 264 1944
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON transportadora
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 3003 (class 2620 OID 637812)
-- Dependencies: 1995 264
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON empleado
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 3008 (class 2620 OID 637813)
-- Dependencies: 2001 264
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON flete
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 2987 (class 2620 OID 637814)
-- Dependencies: 1951 264
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON causal
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 3000 (class 2620 OID 637815)
-- Dependencies: 1990 264
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON causal_hit
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 2975 (class 2620 OID 637816)
-- Dependencies: 264 1941
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON bodega
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 3006 (class 2620 OID 637817)
-- Dependencies: 264 1999
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON faq
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 3014 (class 2620 OID 637818)
-- Dependencies: 264 2007
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON producto_cliente
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 2985 (class 2620 OID 637819)
-- Dependencies: 264 1948
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON sucursal
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


--
-- TOC entry 3016 (class 2620 OID 637820)
-- Dependencies: 264 2011
-- Name: resumen; Type: TRIGGER; Schema: public; Owner: usersgl
--

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE ON tipoproducto
    FOR EACH ROW
    EXECUTE PROCEDURE resumen();


SET search_path = facturacion, pg_catalog;

--
-- TOC entry 2756 (class 2606 OID 637821)
-- Dependencies: 1997 1855 2710
-- Name: alistamiento_alempresa_fkey; Type: FK CONSTRAINT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE ONLY alistamiento
    ADD CONSTRAINT alistamiento_alempresa_fkey FOREIGN KEY (alempresa) REFERENCES public.empresa(empcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2759 (class 2606 OID 637826)
-- Dependencies: 1997 1857 2710
-- Name: almacenamiento_almempresa_fkey; Type: FK CONSTRAINT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE ONLY almacenamiento
    ADD CONSTRAINT almacenamiento_almempresa_fkey FOREIGN KEY (almempresa) REFERENCES public.empresa(empcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2764 (class 2606 OID 637831)
-- Dependencies: 1997 1865 2710
-- Name: conffactura_cfempresa_fkey; Type: FK CONSTRAINT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE ONLY conffactura
    ADD CONSTRAINT conffactura_cfempresa_fkey FOREIGN KEY (cfempresa) REFERENCES public.empresa(empcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2765 (class 2606 OID 637836)
-- Dependencies: 1997 1867 2710
-- Name: factura_facempresa_fkey; Type: FK CONSTRAINT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE ONLY factura
    ADD CONSTRAINT factura_facempresa_fkey FOREIGN KEY (facempresa) REFERENCES public.empresa(empcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2761 (class 2606 OID 637841)
-- Dependencies: 1938 1859 2646
-- Name: fd_cliente_compania; Type: FK CONSTRAINT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE ONLY cliente_facturacion
    ADD CONSTRAINT fd_cliente_compania FOREIGN KEY (clifcodcompania) REFERENCES public.compania(comcodsx) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 2757 (class 2606 OID 637846)
-- Dependencies: 2523 1855 1859
-- Name: fk_al_clientefac; Type: FK CONSTRAINT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE ONLY alistamiento
    ADD CONSTRAINT fk_al_clientefac FOREIGN KEY (alcliente_fac) REFERENCES cliente_facturacion(clifcodsx);


--
-- TOC entry 2758 (class 2606 OID 637851)
-- Dependencies: 1855 1867 2539
-- Name: fk_alfactura; Type: FK CONSTRAINT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE ONLY alistamiento
    ADD CONSTRAINT fk_alfactura FOREIGN KEY (alfactura) REFERENCES factura(faccodsx) ON DELETE SET NULL;


--
-- TOC entry 2760 (class 2606 OID 637856)
-- Dependencies: 1857 1867 2539
-- Name: fk_almfactura; Type: FK CONSTRAINT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE ONLY almacenamiento
    ADD CONSTRAINT fk_almfactura FOREIGN KEY (almfactura) REFERENCES factura(faccodsx) ON DELETE SET NULL;


--
-- TOC entry 2762 (class 2606 OID 637861)
-- Dependencies: 2523 1862 1859
-- Name: fk_conc_clientefac; Type: FK CONSTRAINT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE ONLY concepto_cliente
    ADD CONSTRAINT fk_conc_clientefac FOREIGN KEY (conccodcliente) REFERENCES cliente_facturacion(clifcodsx) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 2763 (class 2606 OID 637866)
-- Dependencies: 1861 1862 2527
-- Name: fk_conc_concepto; Type: FK CONSTRAINT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE ONLY concepto_cliente
    ADD CONSTRAINT fk_conc_concepto FOREIGN KEY (conccodconcepto) REFERENCES concepto(concodsx) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 2767 (class 2606 OID 637871)
-- Dependencies: 1867 1868 2539
-- Name: fk_facdetallet_factura; Type: FK CONSTRAINT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE ONLY factura_detalle
    ADD CONSTRAINT fk_facdetallet_factura FOREIGN KEY (facdfactura) REFERENCES factura(faccodsx) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 2766 (class 2606 OID 637876)
-- Dependencies: 1859 1867 2523
-- Name: fk_factura_cliente; Type: FK CONSTRAINT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE ONLY factura
    ADD CONSTRAINT fk_factura_cliente FOREIGN KEY (faccodcliente) REFERENCES cliente_facturacion(clifcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2769 (class 2606 OID 637881)
-- Dependencies: 1867 1873 2539
-- Name: fkfactura; Type: FK CONSTRAINT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE ONLY proforma
    ADD CONSTRAINT fkfactura FOREIGN KEY (profnumfactura) REFERENCES factura(faccodsx) ON UPDATE RESTRICT ON DELETE SET NULL;


--
-- TOC entry 2768 (class 2606 OID 637886)
-- Dependencies: 1997 1871 2710
-- Name: numfactura_nfempresa_fkey; Type: FK CONSTRAINT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE ONLY numfactura
    ADD CONSTRAINT numfactura_nfempresa_fkey FOREIGN KEY (nfempresa) REFERENCES public.empresa(empcodsx);


--
-- TOC entry 2770 (class 2606 OID 637891)
-- Dependencies: 1873 1997 2710
-- Name: proforma_proempresa_fkey; Type: FK CONSTRAINT; Schema: facturacion; Owner: usersgl
--

ALTER TABLE ONLY proforma
    ADD CONSTRAINT proforma_proempresa_fkey FOREIGN KEY (proempresa) REFERENCES public.empresa(empcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


SET search_path = movimiento, pg_catalog;

--
-- TOC entry 2783 (class 2606 OID 637896)
-- Dependencies: 1890 1888 2567
-- Name: $1; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY despacho_pedido
    ADD CONSTRAINT "$1" FOREIGN KEY (despeddespacho) REFERENCES despacho(despcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2771 (class 2606 OID 637901)
-- Dependencies: 2646 1878 1938
-- Name: aj_codcia; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY ajuste
    ADD CONSTRAINT aj_codcia FOREIGN KEY (ajcodcia) REFERENCES public.compania(comcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2774 (class 2606 OID 637906)
-- Dependencies: 1938 1880 2646
-- Name: ave_compania; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY averia
    ADD CONSTRAINT ave_compania FOREIGN KEY (avecompania) REFERENCES public.compania(comcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2775 (class 2606 OID 637911)
-- Dependencies: 1854 1880 2511
-- Name: ave_entrada; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY averia
    ADD CONSTRAINT ave_entrada FOREIGN KEY (aveentrada) REFERENCES entrada(entcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2776 (class 2606 OID 637916)
-- Dependencies: 1897 1880 2581
-- Name: ave_ingreso; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY averia
    ADD CONSTRAINT ave_ingreso FOREIGN KEY (aveingreso) REFERENCES ingreso(ingcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2772 (class 2606 OID 637921)
-- Dependencies: 1854 1878 2511
-- Name: fk_ajentrada; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY ajuste
    ADD CONSTRAINT fk_ajentrada FOREIGN KEY (ajentrada) REFERENCES entrada(entcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2773 (class 2606 OID 637926)
-- Dependencies: 1878 2581 1897
-- Name: fk_ajingreso; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY ajuste
    ADD CONSTRAINT fk_ajingreso FOREIGN KEY (ajingreso) REFERENCES ingreso(ingcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2777 (class 2606 OID 637931)
-- Dependencies: 1880 1939 2648
-- Name: fk_aveproducto; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY averia
    ADD CONSTRAINT fk_aveproducto FOREIGN KEY (aveproducto) REFERENCES public.producto(procodsx) ON DELETE RESTRICT;


--
-- TOC entry 2778 (class 2606 OID 637936)
-- Dependencies: 1880 2555 1882
-- Name: fk_avn_Averia; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY averia_nacdet
    ADD CONSTRAINT "fk_avn_Averia" FOREIGN KEY (avnaveria) REFERENCES averia(avecodsx) ON DELETE CASCADE;


--
-- TOC entry 2779 (class 2606 OID 637941)
-- Dependencies: 1903 2593 1882
-- Name: fk_avn_nacdetor; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY averia_nacdet
    ADD CONSTRAINT fk_avn_nacdetor FOREIGN KEY (avnnacdet_or) REFERENCES nacionalizacion_detalle(nadcodsx) ON DELETE RESTRICT;


--
-- TOC entry 2780 (class 2606 OID 637946)
-- Dependencies: 1990 2700 1884
-- Name: fk_causalp_causal_hit; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY causal_pedido
    ADD CONSTRAINT fk_causalp_causal_hit FOREIGN KEY (caupcausal) REFERENCES public.causal_hit(cauhcodsx) ON DELETE RESTRICT;


--
-- TOC entry 2852 (class 2606 OID 637951)
-- Dependencies: 2646 1938 1973
-- Name: fk_codcia; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY reubicacion
    ADD CONSTRAINT fk_codcia FOREIGN KEY (recodcia) REFERENCES public.compania(comcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2781 (class 2606 OID 637956)
-- Dependencies: 1886 2688 1955
-- Name: fk_ctran_trafico; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY contenedor_trafico
    ADD CONSTRAINT fk_ctran_trafico FOREIGN KEY (ctrafnumtrafico) REFERENCES trafico(trafcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2782 (class 2606 OID 637961)
-- Dependencies: 2646 1888 1938
-- Name: fk_despacho_empresa; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY despacho
    ADD CONSTRAINT fk_despacho_empresa FOREIGN KEY (despempresa) REFERENCES public.compania(comcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2784 (class 2606 OID 637966)
-- Dependencies: 2609 1916 1890
-- Name: fk_desped_pedido; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY despacho_pedido
    ADD CONSTRAINT fk_desped_pedido FOREIGN KEY (despedpedido) REFERENCES pedido(pedcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2753 (class 2606 OID 637971)
-- Dependencies: 2652 1854 1941
-- Name: fk_entbodega; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY entrada
    ADD CONSTRAINT fk_entbodega FOREIGN KEY (entbodega) REFERENCES public.bodega(bodcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2754 (class 2606 OID 637976)
-- Dependencies: 2648 1854 1939
-- Name: fk_entrada_producto; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY entrada
    ADD CONSTRAINT fk_entrada_producto FOREIGN KEY (entcodproducto) REFERENCES public.producto(procodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2785 (class 2606 OID 637981)
-- Dependencies: 1895 1955 2688
-- Name: fk_factura_Trafico; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY factura_trafico
    ADD CONSTRAINT "fk_factura_Trafico" FOREIGN KEY (ftrafnumtrafico) REFERENCES trafico(trafcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2786 (class 2606 OID 637986)
-- Dependencies: 1897 2664 1946
-- Name: fk_ing_ciudad_dev; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY ingreso
    ADD CONSTRAINT fk_ing_ciudad_dev FOREIGN KEY (ingciudad_dev) REFERENCES public.ciudad(ciucodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2787 (class 2606 OID 637991)
-- Dependencies: 1951 2680 1897
-- Name: fk_ing_devolucion; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY ingreso
    ADD CONSTRAINT fk_ing_devolucion FOREIGN KEY (ingcausal) REFERENCES public.causal(caucodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2788 (class 2606 OID 637996)
-- Dependencies: 1897 1943 2656
-- Name: fk_ingcli_devolucion; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY ingreso
    ADD CONSTRAINT fk_ingcli_devolucion FOREIGN KEY (ingcli_devolucion) REFERENCES public.cliente(clicodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2789 (class 2606 OID 638001)
-- Dependencies: 1938 2646 1897
-- Name: fk_ingreso_cia; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY ingreso
    ADD CONSTRAINT fk_ingreso_cia FOREIGN KEY (ingcodcia) REFERENCES public.compania(comcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2755 (class 2606 OID 638006)
-- Dependencies: 2581 1854 1897
-- Name: fk_ingreso_ent; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY entrada
    ADD CONSTRAINT fk_ingreso_ent FOREIGN KEY (entcodingreso) REFERENCES ingreso(ingcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2790 (class 2606 OID 638011)
-- Dependencies: 2688 1897 1955
-- Name: fk_ingtrafico; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY ingreso
    ADD CONSTRAINT fk_ingtrafico FOREIGN KEY (ingtrafico) REFERENCES trafico(trafcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2792 (class 2606 OID 638016)
-- Dependencies: 2511 1903 1854
-- Name: fk_nacdet_entrada; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY nacionalizacion_detalle
    ADD CONSTRAINT fk_nacdet_entrada FOREIGN KEY (nadentrada) REFERENCES entrada(entcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2791 (class 2606 OID 638021)
-- Dependencies: 1901 1897 2581
-- Name: fk_nacingreso; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY nacionalizacion
    ADD CONSTRAINT fk_nacingreso FOREIGN KEY (nacingreso) REFERENCES ingreso(ingcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2793 (class 2606 OID 638026)
-- Dependencies: 2589 1903 1901
-- Name: fk_nacionalizacion; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY nacionalizacion_detalle
    ADD CONSTRAINT fk_nacionalizacion FOREIGN KEY (nadcodnac) REFERENCES nacionalizacion(naccodsx) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 2794 (class 2606 OID 638031)
-- Dependencies: 1916 2609 1908
-- Name: fk_nov_pedido; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY novedad_pedido
    ADD CONSTRAINT fk_nov_pedido FOREIGN KEY (novpedido) REFERENCES pedido(pedcodsx) ON DELETE CASCADE;


--
-- TOC entry 2795 (class 2606 OID 638036)
-- Dependencies: 1908 2015 2745
-- Name: fk_nov_usuario; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY novedad_pedido
    ADD CONSTRAINT fk_nov_usuario FOREIGN KEY (novusuario) REFERENCES public.usuario(usucodsx) ON DELETE RESTRICT;


--
-- TOC entry 2799 (class 2606 OID 638041)
-- Dependencies: 2603 1913 1911
-- Name: fk_pack_posicion_detalle; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY packing_detalle_posicion
    ADD CONSTRAINT fk_pack_posicion_detalle FOREIGN KEY (packppackingdet) REFERENCES packing_detalle(packdcodsx) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 2797 (class 2606 OID 638046)
-- Dependencies: 1910 1911 2601
-- Name: fk_packd_packing; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY packing_detalle
    ADD CONSTRAINT fk_packd_packing FOREIGN KEY (packdpacking) REFERENCES packing(packcodsx) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 2798 (class 2606 OID 638051)
-- Dependencies: 1939 1911 2648
-- Name: fk_packd_producto; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY packing_detalle
    ADD CONSTRAINT fk_packd_producto FOREIGN KEY (packdproducto) REFERENCES public.producto(procodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2796 (class 2606 OID 638056)
-- Dependencies: 1938 2646 1910
-- Name: fk_packing_cia; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY packing
    ADD CONSTRAINT fk_packing_cia FOREIGN KEY (packempresa) REFERENCES public.compania(comcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2800 (class 2606 OID 638061)
-- Dependencies: 1941 1913 2652
-- Name: fk_packp_bodega; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY packing_detalle_posicion
    ADD CONSTRAINT fk_packp_bodega FOREIGN KEY (packpbodega) REFERENCES public.bodega(bodcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2801 (class 2606 OID 638066)
-- Dependencies: 2511 1913 1854
-- Name: fk_packp_entrada; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY packing_detalle_posicion
    ADD CONSTRAINT fk_packp_entrada FOREIGN KEY (packpentrada) REFERENCES entrada(entcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2802 (class 2606 OID 638071)
-- Dependencies: 1913 1903 2593
-- Name: fk_packp_nacdetalle; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY packing_detalle_posicion
    ADD CONSTRAINT fk_packp_nacdetalle FOREIGN KEY (packpnacdetalle) REFERENCES nacionalizacion_detalle(nadcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2803 (class 2606 OID 638076)
-- Dependencies: 1916 1990 2700
-- Name: fk_ped_causal_hit; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk_ped_causal_hit FOREIGN KEY (pedcausal_hit) REFERENCES public.causal_hit(cauhcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2804 (class 2606 OID 638081)
-- Dependencies: 1946 1916 2664
-- Name: fk_ped_ciudad; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk_ped_ciudad FOREIGN KEY (pedciudad) REFERENCES public.ciudad(ciucodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2805 (class 2606 OID 638086)
-- Dependencies: 1916 1947 2670
-- Name: fk_ped_depto; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk_ped_depto FOREIGN KEY (peddepartamento) REFERENCES public.departamento(depcodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2806 (class 2606 OID 638091)
-- Dependencies: 1916 1938 2646
-- Name: fk_pedido_cia; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk_pedido_cia FOREIGN KEY (pedcompania) REFERENCES public.compania(comcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2807 (class 2606 OID 638096)
-- Dependencies: 1916 1943 2656
-- Name: fk_pedido_cliente; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk_pedido_cliente FOREIGN KEY (pedcliente) REFERENCES public.cliente(clicodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2808 (class 2606 OID 638101)
-- Dependencies: 1916 2613 1918
-- Name: fk_pedido_picking; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk_pedido_picking FOREIGN KEY (pedpicking) REFERENCES picking(pickcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2813 (class 2606 OID 638106)
-- Dependencies: 2648 1939 1919
-- Name: fk_pick_producto; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY picking_detalle
    ADD CONSTRAINT fk_pick_producto FOREIGN KEY (pickdproducto) REFERENCES public.producto(procodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2814 (class 2606 OID 638111)
-- Dependencies: 1919 2613 1918
-- Name: fk_pickid_picking; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY picking_detalle
    ADD CONSTRAINT fk_pickid_picking FOREIGN KEY (pickdcodpicking) REFERENCES picking(pickcodsx) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 2810 (class 2606 OID 638116)
-- Dependencies: 2646 1938 1918
-- Name: fk_picking_empresa; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY picking
    ADD CONSTRAINT fk_picking_empresa FOREIGN KEY (pickempresa) REFERENCES public.compania(comcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2811 (class 2606 OID 638121)
-- Dependencies: 2601 1910 1918
-- Name: fk_picking_packing; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY picking
    ADD CONSTRAINT fk_picking_packing FOREIGN KEY (pickcodpacking) REFERENCES packing(packcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2815 (class 2606 OID 638126)
-- Dependencies: 1920 1919 2617
-- Name: fk_pickp_detalle; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY picking_detalle_packing
    ADD CONSTRAINT fk_pickp_detalle FOREIGN KEY (pickppickingdetalle) REFERENCES picking_detalle(pickdcodsx) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 2816 (class 2606 OID 638131)
-- Dependencies: 1913 1920 2607
-- Name: fk_pickp_packing; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY picking_detalle_packing
    ADD CONSTRAINT fk_pickp_packing FOREIGN KEY (pickppackingdet) REFERENCES packing_detalle_posicion(packpcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2812 (class 2606 OID 638136)
-- Dependencies: 1918 1916 2609
-- Name: fk_pickpedido; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY picking
    ADD CONSTRAINT fk_pickpedido FOREIGN KEY (pickpedido) REFERENCES pedido(pedcodsx) ON DELETE SET NULL;


--
-- TOC entry 2819 (class 2606 OID 638141)
-- Dependencies: 1925 2624 1924
-- Name: fk_ref_desp_ped; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY referencia_despacho_pedido
    ADD CONSTRAINT fk_ref_desp_ped FOREIGN KEY (refdpcodrefd) REFERENCES referencia_despacho(refdcodsx) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 2820 (class 2606 OID 638146)
-- Dependencies: 1925 1928 2630
-- Name: fk_ref_desp_pedido; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY referencia_despacho_pedido
    ADD CONSTRAINT fk_ref_desp_pedido FOREIGN KEY (refdcodrefp) REFERENCES referencia_pedido(refpcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2817 (class 2606 OID 638151)
-- Dependencies: 2571 1890 1924
-- Name: fk_refd_despacho_ped; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY referencia_despacho
    ADD CONSTRAINT fk_refd_despacho_ped FOREIGN KEY (refddespacho_pedido) REFERENCES despacho_pedido(despedcodsx) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 2818 (class 2606 OID 638156)
-- Dependencies: 1939 2648 1924
-- Name: fk_refd_producto; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY referencia_despacho
    ADD CONSTRAINT fk_refd_producto FOREIGN KEY (refdproducto) REFERENCES public.producto(procodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2865 (class 2606 OID 647152)
-- Dependencies: 2019 1924 2624
-- Name: fk_refds_ref_desp; Type: FK CONSTRAINT; Schema: movimiento; Owner: postgres
--

ALTER TABLE ONLY referencia_despacho_serial
    ADD CONSTRAINT fk_refds_ref_desp FOREIGN KEY (refdsreferencia_despacho) REFERENCES referencia_despacho(refdcodsx) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 2821 (class 2606 OID 638161)
-- Dependencies: 1928 2652 1941
-- Name: fk_refp_bodega; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY referencia_pedido
    ADD CONSTRAINT fk_refp_bodega FOREIGN KEY (refpbodega) REFERENCES public.bodega(bodcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2822 (class 2606 OID 638166)
-- Dependencies: 2511 1854 1928
-- Name: fk_refp_entrada; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY referencia_pedido
    ADD CONSTRAINT fk_refp_entrada FOREIGN KEY (refpentrada) REFERENCES entrada(entcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2823 (class 2606 OID 638171)
-- Dependencies: 2593 1903 1928
-- Name: fk_refp_nacdetalle; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY referencia_pedido
    ADD CONSTRAINT fk_refp_nacdetalle FOREIGN KEY (refpnacdetalle) REFERENCES nacionalizacion_detalle(nadcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2824 (class 2606 OID 638176)
-- Dependencies: 2609 1916 1928
-- Name: fk_refp_pedido; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY referencia_pedido
    ADD CONSTRAINT fk_refp_pedido FOREIGN KEY (refpnumpedido) REFERENCES pedido(pedcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2825 (class 2606 OID 638181)
-- Dependencies: 1939 1930 2648
-- Name: fk_reft_producto; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY referencia_trafico
    ADD CONSTRAINT fk_reft_producto FOREIGN KEY (reftproducto) REFERENCES public.producto(procodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2826 (class 2606 OID 638186)
-- Dependencies: 2577 1895 1930
-- Name: fk_reft_trafico; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY referencia_trafico
    ADD CONSTRAINT fk_reft_trafico FOREIGN KEY (reftnumfacturatrafico) REFERENCES factura_trafico(ftrafcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2853 (class 2606 OID 638191)
-- Dependencies: 1854 1973 2511
-- Name: fk_reingreso_entrada_or; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY reubicacion
    ADD CONSTRAINT fk_reingreso_entrada_or FOREIGN KEY (reentradaor) REFERENCES entrada(entcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2854 (class 2606 OID 638196)
-- Dependencies: 1854 1973 2511
-- Name: fk_reingreso_entradafin; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY reubicacion
    ADD CONSTRAINT fk_reingreso_entradafin FOREIGN KEY (reentradafin) REFERENCES entrada(entcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2849 (class 2606 OID 638201)
-- Dependencies: 1971 1903 2593
-- Name: fk_ren_nacdet_fin; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY reubic_nacdetalle
    ADD CONSTRAINT fk_ren_nacdet_fin FOREIGN KEY (renacdetalle_fin) REFERENCES nacionalizacion_detalle(nadcodsx) ON DELETE RESTRICT;


--
-- TOC entry 2850 (class 2606 OID 638206)
-- Dependencies: 1971 1903 2593
-- Name: fk_ren_nacdet_or; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY reubic_nacdetalle
    ADD CONSTRAINT fk_ren_nacdet_or FOREIGN KEY (renacdetalle_or) REFERENCES nacionalizacion_detalle(nadcodsx) ON DELETE RESTRICT;


--
-- TOC entry 2851 (class 2606 OID 638211)
-- Dependencies: 1971 1973 2694
-- Name: fk_ren_reubicacion; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY reubic_nacdetalle
    ADD CONSTRAINT fk_ren_reubicacion FOREIGN KEY (renreubicacion) REFERENCES reubicacion(recodsx) ON DELETE CASCADE;


--
-- TOC entry 2827 (class 2606 OID 638216)
-- Dependencies: 1932 1916 2609
-- Name: fk_rep_pedido; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY reparacion
    ADD CONSTRAINT fk_rep_pedido FOREIGN KEY (reppedido) REFERENCES pedido(pedcodsx) ON UPDATE RESTRICT ON DELETE SET NULL;


--
-- TOC entry 2829 (class 2606 OID 638221)
-- Dependencies: 1933 1880 2555
-- Name: fk_repd_averia; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY reparacion_detalle
    ADD CONSTRAINT fk_repd_averia FOREIGN KEY (repdaveria) REFERENCES averia(avecodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2830 (class 2606 OID 638226)
-- Dependencies: 1933 1939 2648
-- Name: fk_repd_producto; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY reparacion_detalle
    ADD CONSTRAINT fk_repd_producto FOREIGN KEY (repdproducto) REFERENCES public.producto(procodsx) ON DELETE RESTRICT;


--
-- TOC entry 2831 (class 2606 OID 638231)
-- Dependencies: 1933 1932 2636
-- Name: fk_repd_reparacion; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY reparacion_detalle
    ADD CONSTRAINT fk_repd_reparacion FOREIGN KEY (repdreparacion) REFERENCES reparacion(repcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2832 (class 2606 OID 638236)
-- Dependencies: 1935 1882 2559
-- Name: fk_repndaverianacdet; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY reparacion_nacdet
    ADD CONSTRAINT fk_repndaverianacdet FOREIGN KEY (repndaverianacdet) REFERENCES averia_nacdet(avncodsx) ON DELETE RESTRICT;


--
-- TOC entry 2833 (class 2606 OID 638241)
-- Dependencies: 1935 1903 2593
-- Name: fk_repndnacdet_or; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY reparacion_nacdet
    ADD CONSTRAINT fk_repndnacdet_or FOREIGN KEY (repndnacdet) REFERENCES nacionalizacion_detalle(nadcodsx) ON DELETE RESTRICT;


--
-- TOC entry 2834 (class 2606 OID 638246)
-- Dependencies: 1935 1933 2640
-- Name: fk_repndrepdetalle; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY reparacion_nacdet
    ADD CONSTRAINT fk_repndrepdetalle FOREIGN KEY (repndrepdetalle) REFERENCES reparacion_detalle(repdcodsx) ON DELETE CASCADE;


--
-- TOC entry 2855 (class 2606 OID 638251)
-- Dependencies: 1973 1897 2581
-- Name: fk_reubic_ingreso; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY reubicacion
    ADD CONSTRAINT fk_reubic_ingreso FOREIGN KEY (reingreso) REFERENCES ingreso(ingcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2846 (class 2606 OID 638256)
-- Dependencies: 1955 1944 2660
-- Name: fk_traf_transportadora; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY trafico
    ADD CONSTRAINT fk_traf_transportadora FOREIGN KEY (traftransportadora) REFERENCES public.transportadora(transpcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2847 (class 2606 OID 638261)
-- Dependencies: 1955 2646 1938
-- Name: fk_trafico_compania; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY trafico
    ADD CONSTRAINT fk_trafico_compania FOREIGN KEY (trafcompania) REFERENCES public.compania(comcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2848 (class 2606 OID 638266)
-- Dependencies: 2745 2015 1955
-- Name: fk_trafico_usuario; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY trafico
    ADD CONSTRAINT fk_trafico_usuario FOREIGN KEY (trafusuario) REFERENCES public.usuario(usucodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2809 (class 2606 OID 638271)
-- Dependencies: 2684 1952 1916
-- Name: fk_zona; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk_zona FOREIGN KEY (pedzona) REFERENCES public.zona(zoncodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2828 (class 2606 OID 638276)
-- Dependencies: 1932 2646 1938
-- Name: repcodcia; Type: FK CONSTRAINT; Schema: movimiento; Owner: usersgl
--

ALTER TABLE ONLY reparacion
    ADD CONSTRAINT repcodcia FOREIGN KEY (repcodcia) REFERENCES public.compania(comcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


SET search_path = public, pg_catalog;

--
-- TOC entry 2839 (class 2606 OID 638281)
-- Dependencies: 2646 1938 1943
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT "$1" FOREIGN KEY (clicodcompania) REFERENCES compania(comcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2836 (class 2606 OID 638291)
-- Dependencies: 1938 1939 2646
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT "$1" FOREIGN KEY (procodigocia) REFERENCES compania(comcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2843 (class 2606 OID 638296)
-- Dependencies: 1948 1943 2656
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY sucursal
    ADD CONSTRAINT "$1" FOREIGN KEY (succodcliente) REFERENCES cliente(clicodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2861 (class 2606 OID 638301)
-- Dependencies: 2011 1938 2646
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY tipoproducto
    ADD CONSTRAINT "$1" FOREIGN KEY (tiprcodcompania) REFERENCES compania(comcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2837 (class 2606 OID 638306)
-- Dependencies: 1939 1977 2696
-- Name: $2; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT "$2" FOREIGN KEY (procategoria) REFERENCES categoria(catcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2838 (class 2606 OID 638311)
-- Dependencies: 1939 2011 2739
-- Name: $3; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT "$3" FOREIGN KEY (protipoproducto) REFERENCES tipoproducto(tiprcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2862 (class 2606 OID 638316)
-- Dependencies: 2656 1943 2015
-- Name: fk_cia_clientes; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_cia_clientes FOREIGN KEY (usucodcliente) REFERENCES cliente(clicodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2863 (class 2606 OID 638321)
-- Dependencies: 1938 2015 2646
-- Name: fk_cia_usuario; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_cia_usuario FOREIGN KEY (usucompania) REFERENCES compania(comcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2841 (class 2606 OID 638326)
-- Dependencies: 1946 1947 2670
-- Name: fk_ciu_dpto; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT fk_ciu_dpto FOREIGN KEY (ciudepto) REFERENCES departamento(depcodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2840 (class 2606 OID 638331)
-- Dependencies: 1943 1946 2664
-- Name: fk_cliciudad; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT fk_cliciudad FOREIGN KEY (cliciudad) REFERENCES ciudad(ciucodigo) ON DELETE RESTRICT;


--
-- TOC entry 2835 (class 2606 OID 638336)
-- Dependencies: 1938 1946 2664
-- Name: fk_com_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY compania
    ADD CONSTRAINT fk_com_ciudad FOREIGN KEY (comciudad) REFERENCES ciudad(ciucodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2842 (class 2606 OID 638341)
-- Dependencies: 1947 1952 2684
-- Name: fk_depto_zona; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT fk_depto_zona FOREIGN KEY (depzona) REFERENCES zona(zoncodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2856 (class 2606 OID 638346)
-- Dependencies: 2001 1946 2664
-- Name: fk_flete_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY flete
    ADD CONSTRAINT fk_flete_ciudad FOREIGN KEY (fleciudad) REFERENCES ciudad(ciucodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2857 (class 2606 OID 638351)
-- Dependencies: 2001 1944 2660
-- Name: fk_flete_transportador; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY flete
    ADD CONSTRAINT fk_flete_transportador FOREIGN KEY (fletransportadora) REFERENCES transportadora(transpcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2858 (class 2606 OID 638356)
-- Dependencies: 2003 2005 2722
-- Name: fk_grupo; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT fk_grupo FOREIGN KEY (pergrupo) REFERENCES grupo(gcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2864 (class 2606 OID 638361)
-- Dependencies: 2003 2015 2722
-- Name: fk_grupo_usuario; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_grupo_usuario FOREIGN KEY (usugrupo) REFERENCES grupo(gcodsx) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2859 (class 2606 OID 638366)
-- Dependencies: 2007 1943 2656
-- Name: fk_proc_cli; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY producto_cliente
    ADD CONSTRAINT fk_proc_cli FOREIGN KEY (proccliente) REFERENCES cliente(clicodsx) ON DELETE RESTRICT;


--
-- TOC entry 2860 (class 2606 OID 638371)
-- Dependencies: 2648 2007 1939
-- Name: fk_proc_prod; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY producto_cliente
    ADD CONSTRAINT fk_proc_prod FOREIGN KEY (procproducto) REFERENCES producto(procodsx) ON DELETE RESTRICT;


--
-- TOC entry 2844 (class 2606 OID 638376)
-- Dependencies: 1946 1948 2664
-- Name: fk_suc_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY sucursal
    ADD CONSTRAINT fk_suc_ciudad FOREIGN KEY (succiudad) REFERENCES ciudad(ciucodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2845 (class 2606 OID 638381)
-- Dependencies: 1947 1948 2670
-- Name: vk_suc_depto; Type: FK CONSTRAINT; Schema: public; Owner: usersgl
--

ALTER TABLE ONLY sucursal
    ADD CONSTRAINT vk_suc_depto FOREIGN KEY (sucdepartamento) REFERENCES departamento(depcodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2010-11-11 13:40:23

--
-- PostgreSQL database dump complete
--

