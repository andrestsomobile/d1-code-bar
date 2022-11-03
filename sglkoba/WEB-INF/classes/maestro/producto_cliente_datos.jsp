
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso " %>  

		<%@page import="maestro.control.gstcliente"%>
<%@page import="maestro.entity.cliente"%>
<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

<%
String clicodsx = request.getParameter("clicodsx");
gstcliente gcli = new gstcliente();
cliente cli = gcli.getcliente(clicodsx);
%>
		<div class="titulo"> Gestion de Datos de un producto_cliente </div> 
		<br> 
		<html:form action="producto_clienteAction.do" method="post" > 
		<html:hidden property="opcion"/> 
				<html:hidden property="proccliente" value="<%= clicodsx %>"/> 
								<html:hidden property="clicodsx" value="<%= clicodsx %>"/> 
		<table align="center" border'0' cellpadding='3' cellspacing='0' class='tabla_datos' width='80%'> 

<html:hidden property="proccodsx" /> 
			<tr> 
				<td>Producto
				<td><html:hidden property="procproducto"  /> 
				<html:text property="promodelo" readonly="true" styleClass="readonly" /> 
				<html:text property="prodescripcion"  readonly="true" styleClass="readonly"/> 
						<% 
			String[]	parametros = new String[] {cli.getclicodcompania(), "0", ""};
						String[]	parametros_total = new String[] {cli.getclicodcompania(), ""};
						String[]	campos_form= new String[] {"procproducto", "promodelo" , "prodescripcion"};
						String[]	campos_pick = new String[] {"procodsx" , "promodelo" , "prodescripcion"};
						String[]	campos_entity= new String[] { "promodelo", "prodescripcion" };
						String[]	nombres_campos_entity= new String[] {"Material", "Descripcion"};
						String	metodo  = "getlistaproducto";
						String	metodo_total = "getTotalPaginaslistaproducto";
		%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstproducto" entidad="maestro.entity.producto" funcion_onclick="return verificar_companias()"
						formulario="producto_clienteForm" metodo="<%= metodo %>" 
						metodo_total="<%= metodo_total %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
				<html:errors property="ref_ini"/>
				
				
			<tr> 
				<td>Maneja EAN
				<td><html:select property="procean"  > 
					<html:option value="S">S</html:option>
					<html:option value="N">N</html:option>
				</html:select>
			<tr> 
				<td>Maneja TAG
				
				<td><html:select property="proctag"  > 
					<html:option value="S">S</html:option>
					<html:option value="N">N</html:option>
				</html:select>
				
			<tr> 
				<td>Maneja Codigo Barras
				<td>
				<html:select property="procodbarra"  > 
					<html:option value="S">S</html:option>
					<html:option value="N">N</html:option>
				</html:select>
			<tr> 
				<td>Codigo Barras
				<td><html:text property="procnumcodigobarra"  /> 
			<tr> 
				<td>Maneja Garantias
				<td>
				<html:select property="procgarantia"  > 
					<html:option value="S">S</html:option>
					<html:option value="N">N</html:option>
				</html:select>
				<tr align="center"> 
				<td colspan="2">   
 <%if(gstpermiso.getEscritura(session, "maestro", "producto_cliente.jsp") ){ %> 
<html:submit  value="Grabar"/> 
 <% } %> <input type="button"  name="cancelar" value="Cancelar" onclick="window.location='main.jsp?app=maestro&modulo=producto_cliente&clicodsx=<%= clicodsx %>'" />
		</table> 		</html:form> 		</html> 