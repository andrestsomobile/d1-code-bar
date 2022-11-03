
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso " %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

<% 

String despedcodsx= request.getParameter("despedcodsx"); 

%>
		<div class="titulo"> Gestion de Datos de un referencia_despacho </div> 
		<br> 
		<html:form action="referencia_despachoAction.do" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border="0" width='80%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
		<input type="hidden" name="despedcodsx" value="<%= despedcodsx %>" >
			<tr> 
				<td>Consecutivo
				<td><html:text property="refdcodsx" readonly="true" styleClass="readonly" /> 
				<html:hidden property="refddespacho_pedido" value="<%= despedcodsx %>" /> 
			<tr> 
				<td>Producto
				<td><html:text property="refdproducto"  /> 
				*<html:errors property="refdproducto"  /> 
				
				
				
			<tr> 
				<td>Cantidad a Despachar
				<td><html:text property="total"   /> 
				<tr align="center"> 
				<td colspan="2">   
 <%if(gstpermiso.getEscritura(session, "pedido", "referencia_despacho.jsp") ){ %> 
<html:submit  value="Grabar"/> 
 <% } %> <html:button  property="cancelar" value="Cancelar" onclick="window.location='main.jsp?app=pedido&modulo=referencia_despacho'" />
		</table> 		</html:form> 		</html> 