 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso, ingreso.entity.*, ingreso.control.*" %>  
		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 
<%
gstcontenedor_trafico gcon = new gstcontenedor_trafico();
String trafcodsx = request.getParameter("trafcodsx")==null ? (String)request.getAttribute("trafcodsx") :request.getParameter("trafcodsx");
%>
		<div class="titulo"> Lote en el Trafico </div> 
		<br> 
		
		<%@ include file="trafico_head.jsp" %>
		
		<html:form action="lote_traficoAction.do?app=ingreso&modulo=lote_trafico_datos" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
			<html:hidden property="ltrafcodsx" /> 
			<html:hidden property="ltrafnumtrafico" 
				value="<%= trafcodsx  %>" /> 

			<tr> 
				<td>Lote
				<td><html:text property="ltraflote"  /> 
				<html:errors property="ltraflote"/>
		    <tr> 
				<td>Proveedor
				<td><html:text property="ltrafproveedor"  /> 
				<html:errors property="ltrafproveedor"/>
		    <tr> 
				<td>Producto
				<td>
					<html:hidden property="ltrafcodproducto"  />
					<html:text property="ltrafproducto" readonly="true" styleClass="readonly" />
					<html:text property="descripcionproducto" readonly="true" styleClass="readonly" /> 
				<%
				String[] parametros_pro = new String[] {trafcodsx,"0" ,""};
				String[] parametros_total_pro = new String[] {trafcodsx,""};
				String[] campos_form_pro = new String[] {"ltrafcodproducto", "ltrafproducto","descripcionproducto"};
				String[] campos_pick_pro = new String[] {"reftproducto", "reftserial","reftserialdespacho"};
				String[] campos_entity_pro = new String[] { "reftnumfacturatrafico", "reftserial", "reftserialdespacho","reftcantidad" };
				String[] nombres_campos_entity_pro = new String[] {"Factura", "Material", "Descripcion" , "Cantidad"};
				String metodo_pro  = "getlistareferencia_trafico_lote";
				String metodo_total_pro = "getTotalPaginaslistareferencia_trafico_lote";
				%>
						 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
						<popup:boton clase="ingreso.control.gstreferencia_trafico" entidad="ingreso.entity.referencia_trafico" 
								formulario="lote_traficoForm" metodo="<%= metodo_pro %>" 
								metodo_total="<%= metodo_total_pro %>"
								parametros="<%= parametros_pro %>" campos_form="<%= campos_form_pro %>"
								campos_pick="<%= campos_pick_pro %>"
								parametros_total="<%= parametros_total_pro %>" 
								campos_entity="<%= campos_entity_pro %>" nombres_campos_entity="<%= nombres_campos_entity_pro %>" />
				<html:errors property="ltrafcontenedor"/>
				<html:errors property="ltrafproducto"/>

			<tr> 	
				<td>Fecha Inicio
				<td colspan="3"><html:text property="ltrafelaboracion" size="15"
					styleClass="readonly" readonly="true" /> <html:errors property="ltrafelaboracion" /> 
					<a href="javascript:show_calendar('lote_traficoForm.ltrafelaboracion');">
				    <img src="./disenno/images/calendar.gif" class="lupita"> </a>
			<tr> 	
				<td>Fecha Vencimiento
				<td colspan="3"><html:text property="ltrafvencimiento" size="15"
					styleClass="readonly" readonly="true" /> <html:errors property="ltrafvencimiento" /> 
					<a href="javascript:show_calendar('lote_traficoForm.ltrafvencimiento');">
				    <img src="./disenno/images/calendar.gif" class="lupita"> </a>
			<tr align="center"> 
				<td colspan="2">
				<% if( gstpermiso.getEscritura(session,  "ingreso", "lote_trafico_datos.jsp") && traf.getTrafestado().equals("TRAMITE")) {%>
	<html:submit  value="Grabar" /> 
	<%} %>
		</table> 		</html:form> 	
		
		
		
			</html> 