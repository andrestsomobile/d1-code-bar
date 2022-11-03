
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso " %>  

		<%@page import="maestro.control.gstbodega"%>
<%@page import="java.util.Collection"%>
<%@page import="maestro.control.gstproducto"%>
<%@page import="averias.form.reparacion_detalleForm"%>
<%@page import="averias.control.gstreparacion"%>
<%@page import="averias.entity.reparacion"%>
<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

<%
gstbodega gbod = new gstbodega();
gstproducto gprod = new gstproducto();

reparacion_detalleForm repdf = (reparacion_detalleForm)request.getAttribute("reparacion_detalleForm");
gstreparacion grep = new gstreparacion();
reparacion rep = grep.getreparacion(repdf.getrepdreparacion());

%>
		<div class="titulo"> Gestion de Datos de un reparacion_detalle </div> 
		<br> 
		<html:form action="reparacion_detalleAction.do" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border='0' cellpadding='3' cellspacing='0' class='tabla_datos' width='80%'> 
<html:hidden property="repdcodsx"  /> 
			<html:hidden property="repdreparacion"  /> 
<html:hidden property="repdproducto"  /> 
<input type="hidden" name="repcodsx" value="<%= repdf.getrepdreparacion() %>" >
<html:hidden property="repdtiposaldo"/>
			<tr>
				<td>Producto
				<td><%= gprod.getproducto( repdf.getrepdproducto() ).getpromodelo() %>			
			<tr> 
				<td>Averia
				<td><html:text property="repdaveria" readonly="true" styleClass="readonly" /> 
			<tr> 
				<td>Cantidad x Plegadiza
				<td><html:text property="repdcant_pleg"  readonly="true" styleClass="readonly" />

			<tr> 
				<td>Cantidad x Producto
				<td><html:text property="repdcant_prod"  readonly="true" styleClass="readonly" />
			<tr> 
				<td>Bodega Origen (averia)
				<td><html:text property="repdbodega"  readonly="true" styleClass="readonly" />
			<tr> 
				<td>Posicion Origen (averia)
				<td><html:text property="repdposicion" readonly="true" styleClass="readonly" />
			<tr> 
				<td>Bodega Destino (averia)
				<td>
				<%
				Collection l = gbod.getlistabodega();
				request.setAttribute("lista", l);
				
				%>
				<html:select property="repdbodega_dest">
					   <html:options collection="lista"  property="bodcodsx" labelProperty="bodnombre"   /> 
				</html:select>
			
			<tr> 
				<td>Posicion Destino (averia)
				<td><html:text property="repdposicion_dest" readonly="true" styleClass="readonly"  size="4"/>
<a href="#" onclick="showmapa(  reparacion_detalleForm.repdbodega_dest.options[reparacion_detalleForm.repdbodega_dest.selectedIndex].value , 'repdposicion_dest', 'reparacion_detalleForm')">Mapa </a>								
				
				<tr align="center"> 
				<td colspan="2">   
 <%if(gstpermiso.getEscritura(session, "averias", "reparacion_detalle.jsp") && rep.getrepestado().equals("TRAMITE")){ %> 
<html:submit  value="Grabar"/> 
 <% } %> 
 <input type="button" value="Cancelar" onclick="window.location='reparacionAction.do?opcion=set&repcodsx=<%= repdf.getrepdreparacion()  %>'">

		</table> 		</html:form> 		</html> 