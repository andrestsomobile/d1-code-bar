
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso " %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

		<div class="titulo"> Gestion de Datos de un auditoria_conexiones </div> 
		<br> 
		<html:form action="auditoria_conexionesAction.do" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border'0' cellpadding='3' cellspacing='0' class='tabla_datos' width='80%'> 
			<tr> 
				<td>Consecutivo
				<td><html:text property="audicodsx"  /> 
			<tr> 
				<td>Login
				<td><html:text property="audilogin"  /> 
			<tr> 
				<td>Nombre
				<td><html:text property="audinombre"  /> 
			<tr> 
				<td>Fecha
				<td><html:text property="audifecha"  /> 
			<tr> 
				<td>Modulo
				<td><html:text property="audiapp"  /> 
			<tr> 
				<td>Opcion
				<td><html:text property="audimodulo"  /> 
				<tr align="center"> 
				<td colspan="2">   
 <%if(gstpermiso.getEscritura(session, "auditoria", "auditoria_conexiones.jsp") ){ %> 
<html:submit  value="Grabar"/> 
 <% } %> <html:button  property="cancelar" value="Cancelar" onclick="window.location='main.jsp?app=auditoria&modulo=auditoria_conexiones'" />
		</table> 		</html:form> 		</html> 