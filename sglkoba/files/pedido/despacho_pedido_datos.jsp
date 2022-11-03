
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso " %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

		<div class="titulo"> Gestion de Datos de un despacho_pedido </div> 
		<br> 
		<html:form action="despacho_pedidoAction.do" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border="1" width='80%'> 
			<tr> 
				<td>despedcodsx
				<td><html:text property="despedcodsx"  /> 
			<tr> 
				<td>despeddespacho
				<td><html:text property="despeddespacho"  /> 
				*<html:errors property="despeddespacho"  /> 
			<tr> 
				<td>despedpedido
				<td><html:text property="despedpedido"  /> 
				*<html:errors property="despedpedido"  /> 
				<tr align="center"> 
				<td colspan="2">   
 <%if(gstpermiso.getEscritura(session, "pedido", "despacho_pedido.jsp") ){ %> 
<html:submit  value="Grabar"/> 
 <% } %> <html:button  property="cancelar" value="Cancelar" onclick="window.location='main.jsp?app=pedido&modulo=despacho_pedido'" />
		</table> 		</html:form> 		</html> 