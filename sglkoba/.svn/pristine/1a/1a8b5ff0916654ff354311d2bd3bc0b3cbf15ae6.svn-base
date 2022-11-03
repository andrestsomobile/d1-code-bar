
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso " %>  

		<%@page import="administracion.entity.usuario"%>
<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

		<div class="titulo"> Gestion de Datos de un novedad_pedido </div> 
		<br> 
		<%
		String pedcodsx = request.getParameter("pedcodsx");
		
		usuario usu = (usuario)session.getAttribute("usuario");
		
		%>
		<html:form action="novedad_pedidoAction.do" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border'0' cellpadding='3' cellspacing='0' class='tabla_datos' width='80%'> 
			<tr> 
				<td>Pedido
				<td><html:text property="novpedido" value="<%= pedcodsx %>" readonly="true" styleClass="readonly" /> 
			<tr> 
				<td>Fecha
				<td><html:text property="novfecha" readonly="true" styleClass="readonly" /> 
			<tr> 
				<td>Descripcion
				<td><html:textarea property="novdesc" cols="50" rows="6"   /> 
<html:hidden property="novusuario" value="<%= usu.getusucodsx() %>" /> 
<input type="hidden" name="pedcodsx"  value="<%= pedcodsx %>">
			
				<tr align="center"> 
				<td colspan="2">   
 <%if(gstpermiso.getAdministracion(session, "pedido", "novedad_pedido.jsp") ){ %> 
<html:submit  value="Grabar"/> 
 <% } %> <input type="button"  name="cancelar" value="Cancelar" onclick="window.location='main.jsp?app=pedido&modulo=novedad_pedido&pedcodsx=<%= pedcodsx %>'" />
		</table> 		</html:form> 		</html> 