-- FUNCTION: public.resumen()

-- DROP FUNCTION public.resumen();

CREATE OR REPLACE FUNCTION public.resumen()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
--
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
select into temp1 * from cliente where clicodsx = new.flecliente;
select into temp2 * from transportadora where transpcodsx = new.fletransportadora;
res = new.flecodsx ||' ' || temp1.clinombre ||' ' || new.flecliente  ||' ' || new.fletipoveh ||' ' ||  temp2.transpnombre;
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

IF TG_RELNAME='centrocosto' THEN
select into temp1 * from centrocosto where cccod =new.cccod;
res = new.cccod ||' ' || new.ccdesc;
END IF;

IF TG_RELNAME='categoria_oster' THEN
select into temp1 * from categoria_oster where catocodsx =new.catocodsx;
res = new.catocodsx ||' ' || new.catodescripcion;
END IF;

res = upper(res);
new.resumen := res;
return new;
END;
$BODY$;

ALTER FUNCTION public.resumen()
    OWNER TO postgres;


-- Trigger: resumen

 DROP TRIGGER IF EXISTS resumen ON public.flete;

CREATE TRIGGER resumen
    BEFORE INSERT OR UPDATE 
    ON public.flete
    FOR EACH ROW
    EXECUTE PROCEDURE public.resumen();    
