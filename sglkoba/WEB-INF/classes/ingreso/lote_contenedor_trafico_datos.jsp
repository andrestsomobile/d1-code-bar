 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso, ingreso.entity.*, ingreso.control.*" %>  
		    
<html> 

<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

		<div class="titulo"> Lote en el Trafico </div> 
		<br> 

<%

	String trafcodsx = request.getAttribute("trafcodsx") == null ? request.getParameter("trafcodsx") : (String) request.getAttribute("trafcodsx");
    String lctrafcodsx = request.getParameter("codsx");
%>		
<%@ include file="trafico_head.jsp"%>		
		<html:form action="lote_contenedor_traficoAction.do?app=ingreso&modulo=lote_contenedor_trafico_datos" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
			<html:hidden property="lctrafcodsx" /> 
			

			<tr>
			    
				<td>Veh&iacute;culo (con estado DESCARGANDO)
				<td>
				<html:hidden property="lctrafcontenedor"/>
				<html:text property="placa" readonly="true" styleClass="readonly"/>
				<html:text property="iniciodescargue" readonly="true" styleClass="readonly"/>
				<%
				String[] parametros = new String[] {trafcodsx,"0" ,""};
				String[] parametros_total = new String[] {trafcodsx,""};
				String[] campos_form= new String[] {"lctrafcontenedor", "placa","iniciodescargue" };
				String[] campos_pick = new String[] {"ctrafcodsx", "ctrafplaca","ctrafiniciodescargue" };
				String[] campos_entity= new String[] { "ctrafcodsx", "ctrafplaca","ctrafiniciodescargue" };
				String[] nombres_campos_entity= new String[] {"Codigo", "Placa" , "Inicio Descargue"};
				String metodo  = "getlistacontenedor_trafico_descargando";
				String metodo_total = "getTotalPaginalistacontenedor_trafico_descargando";
				%>
						 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
						<popup:boton clase="ingreso.control.gstcontenedor_trafico" entidad="ingreso.entity.contenedor_trafico" 
								formulario="lote_contenedor_traficoForm" metodo="<%= metodo %>" 
								metodo_total="<%= metodo_total %>"
								parametros="<%= parametros %>" campos_form="<%= campos_form %>"
								campos_pick="<%= campos_pick %>"
								parametros_total="<%= parametros_total %>" 
								campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
				*<html:errors property="ltrafcontenedor"/>
			  <tr> 
				<td>Lote
				<% 
				gstlote_trafico glote = new gstlote_trafico();
				request.setAttribute("listalote_trafico" , glote.getlistalote_trafico(trafcodsx));
				%>
				<td><html:select property="lctraflote">
					 <html:options collection="listalote_trafico" property="ltrafcodsx" labelProperty="ltraflote" />
				</html:select>	
			 <tr> 
				<td>Cantidad Recibida
				<td><html:text property="lctrafcantidad"  /> 
				<html:errors property="lctrafcantidad"/>

			<tr align="center"> 
				<td colspan="2">
				<% if( gstpermiso.getEscritura(session,  "ingreso", "lote_trafico_datos.jsp") && traf.getTrafestado().equals("TRAMITE")) {%>
					<html:submit  value="Grabar" /> 
				<%} %>
		</table> 	
		<br>
		 <% if(lctrafcodsx !=null ) {  %>
    	<a href="main.jsp?app=ingreso&modulo=inspeccion_recibo&trafcodsx=<%=trafcodsx%>&lctrafcodsx=<%=lctrafcodsx%>">Inspecci&oacute;n de Recibo </a>
    <% } %>  	
	</html:form> 	
			</html> 