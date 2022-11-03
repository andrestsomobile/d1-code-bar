
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso " %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

		<div class="titulo"> Gestion de Datos de un causal </div> 
		<br> 
		<html:form action="causalAction.do" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
			<tr> 
				<td>Codigo
				<td><html:text property="caucodsx" readonly="true" styleClass="readonly"  /> 
			<tr> 
				<td>Descripcion
				<td><html:text property="caudesc" size="40"  /> 
				*<html:errors property="caudesc"  /> 
			<tr> 
				<td>Responsable
				<td><html:text property="cauresponsable" size="40" /> 
			<tr> 
				<td>Nota
				<td><html:text property="causnota" size="40" /> 
			<tr> 
				<td>Documento Soporte
				<td><html:text property="causdocsoporte" size="40" /> 
				<tr align="center"> 
				<td colspan="2">   
 <%if(gstpermiso.getEscritura(session, "maestro", "causal.jsp") ){ %> 
<html:submit  value="Grabar"/> 
 <% } %> <html:button  property="cancelar" value="Cancelar" onclick="window.location='main.jsp?app=maestro&modulo=causal'" />
		</table> 		</html:form> 		</html> 