
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso, maestro.control.*, maestro.entity.*" %>  

		<%@page import="ingreso.form.referencia_traficoForm"%>
<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 
 

<%
String trafcodsx = request.getParameter("trafcodsx")==null ? (String)request.getAttribute("trafcodsx") :request.getParameter("trafcodsx");
String ftrafcodsx =request.getParameter("ftrafcodsx");

%>

		<div class="titulo"> Referencias en la Factura del Trafico </div> 
		<br> 
			<%@ include file="trafico_head.jsp" %>
		<html:form action="referencia_traficoAction.do?app=ingreso&modulo=referencia_trafico_datos" method="post" > 
		<input type='hidden' name='trafcodsx' value="<%= trafcodsx %>">
		<html:hidden property="opcion"/> 
	
<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
		<html:hidden property="reftcodsx"  /> 
		<html:hidden property="reftnumfacturatrafico" value="<%= ftrafcodsx %>"  /> 
		
			<tr> 
				<td>Material
				<td>
				<html:hidden property="reftproducto"/>
				<%
				referencia_traficoForm reftf = (referencia_traficoForm) request.getAttribute("referencia_traficoForm");
				producto prod = reftf!=null && reftf.getreftproducto()!=null ? new gstproducto().getproducto( reftf.getreftproducto()) : null;
				%>
				<input type="text" name="desc" readonly="true" class="readonly"
				value="<%= prod==null ? "" : prod.getpromodelo()  %>" size="35"><br>
				<input type="text" name="descl" readonly="true" class="readonly"
				value="<%= prod==null ?"" : prod.getprodescripcion()  %>" size="35">
				
				<%
				String cia = gtraf.gettrafico(trafcodsx).gettrafcompania();
				
				String[] parametros = new String[] {cia, "0", ""};
				String[] parametros_total = new String[] {cia, ""};
				String[] campos_form= new String[] {"reftproducto", "desc", "reftpesoneto", "reftpesobruto", "descl"};
				String[] campos_pick = new String[] {"procodsx", "promodelo", "prokiloreal", "prokiloreal", "prodescripcion"};
				String[] campos_entity= new String[] {"promodelo", "prodescripcion"};
				String[] nombres_campos_entity= new String[] {"Modelo", "Descripcion"};
				%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstproducto" entidad="maestro.entity.producto" 
						formulario="referencia_traficoForm" metodo="getlistaproducto"
						metodo_total="getTotalPaginaslistaproducto"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
				<html:errors property="reftproducto"/>
			<tr> 
				<td>Serial
				<td><html:text property="reftserial"  /> 
				<html:errors property="reftserial"/>				
			<tr> 
				<td>Cantidad
				<td><html:text property="reftcantidad"  /> 
				<html:errors property="reftcantidad"/>
			<tr> 
				<td>Master Packs
				<td><html:text property="reftmpacks" readonly="true" styleClass="readonly" /> 

				
			<tr> 
				<td>Peso Neto (unitario)
				<td><html:text property="reftpesoneto"  /> KGM
			<html:errors property="reftpesoneto"/>
						<tr> 
			<td>Peso Neto (Total)
				<td><html:text property="reftpesonetototal" readonly="true" styleClass="readonly"  /> KGM
				
			<tr> 
				<td>Peso Bruto (unitario)
				<td><html:text property="reftpesobruto"  /> KGM
				<html:errors property="reftpesobruto"/>
		<tr> 	<td>Peso Bruto (Total)
				<td><html:text property="reftpesobrutototal" readonly="true" styleClass="readonly"  /> KGM

			<tr> 
				<td>FOB unit
				<td><html:text property="reftfobunit"  /> USD
				<html:errors property="reftfobunit"/>
			<tr> 
				<td>FOB total
				<td><html:text property="reftfobtotal" readonly="true" styleClass="readonly"  /> USD
			<tr> 
				<td>CIF unit
				<td><html:text property="reftcifunit"  readonly="true" styleClass="readonly"/> USD
			<tr> 
				<td>CIF total
				<td><html:text property="reftciftotal" readonly="true" styleClass="readonly" /> USD
				<tr align="center"> 
				<td colspan="2">
				 <% if(gstpermiso.getEscritura(session, "ingreso", "referencia_trafico_datos.jsp") && traf.getTrafestado().equals("TRAMITE")) {%>
				<html:submit  value="Grabar" /> 
				<%}  %>
		</table> 		</html:form> 	
		
			</html> 	