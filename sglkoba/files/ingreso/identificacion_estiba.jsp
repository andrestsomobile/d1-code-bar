<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso, java.util.*,ingreso.control.*,ingreso.entity.*,maestro.control.*,maestro.entity.*"%>

<html>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%
	String entcodsx = request.getParameter("entcodsx");
	gstentrada gent = new gstentrada();
	entrada ent = gent.getentrada(entcodsx);
	gstlote_trafico glt = new gstlote_trafico();
	lote_trafico lt = null;
	if (ent.getentlote() != null) {
		lt = glt.getlote_trafico(ent.getentlote());
	}

	gstingreso ging = new gstingreso();
	ingreso ing = ging.getingreso(ent.getentcodingreso());
	trafico traf = new gsttrafico().gettrafico(ing.getingtrafico());

	gstproducto gprod = new gstproducto();
	producto prod = gprod.getproducto(ent.getentcodproducto());

	gstbodega gbod = new gstbodega();
	bodega bod = gbod.getbodega(ent.getEntbodega());
%>

<div class="titulo">
	SGL - SISTEMA DE GESTION LOGISTICO 
	<BR> 
	FORMATO DE IDENTIFICACION DE ESTIBA
</div>
<br>

<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" style="font-size: 20">


	<tr>
		<td>Compañ&iacute;a:
		<td><%=new gstcompania().getcompania(ing.getingcodcia()).getcomnombre()%>
		<td>B/L-Doc. Transporte:
		<td><%=traf != null ? traf.gettrafdocumento() : " NO TIENE, ES " + ing.getingtipo()%>
	<tr>
		<td>Lote:
		<td><%=(lt != null && lt.getLtraflote() != null) ? lt.getLtraflote() : "NO DEFINIDO"%>
		<td>Fecha Ingreso :
		<td><%=ing.getingfecha()%>
	<tr>
		<td>Fecha Elaboraci&oacute;n Lote:
		<td><%=(lt != null && lt.getLtrafelaboracion() != null) ? lt.getLtrafelaboracion() : "NO DEFINIDO"%>
		<td>Fecha Vencimiento Lote:
		<td><%=(lt != null && lt.getLtrafvencimiento() != null) ? lt.getLtrafvencimiento() : "NO DEFINIDO"%>
	<tr>
		<td>Consec Ingreso:
		<td><%=ing.getingcodsx()%>
		<td>&nbsp;
		<td>&nbsp;
	<tr>
		<td>Bodega:
		<td><%=bod.getbodnombre()%>
		<td>Posici&oacute;n:
		<td><%=ent.getentposicion()%>
	<tr>
		<td>Material:
		<td><%=prod.getpromodelo()%>
		<td>Descripci&oacute;n:
		<td><%=prod.getprodescripcion()%>
	<tr>
		<td>Cantidad:
		<td><%=ent.getentcantidad()%>
		<td>R&oacute;tulo:
		<td><%=ent != null ? gent.getRotuloEstiba(ent.getentcodingreso(),ent.getentcodsx(),ent.getentcodproducto()) : "NO DEFINIDO"%>
</table>

</html>
