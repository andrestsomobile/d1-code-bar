
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso " %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

		<div class="titulo"> Gestion de Datos de un averia </div> 
		<br> 
		<html:form action="averiaAction.do" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border="1" width='80%'> 
			<tr> 
				<td>Codigo Sistema
				<td><html:text property="avecodsx"  readonly="true" styleClass="readonly" /> 
			<tr> 
				<td>Descripcion
				<td><html:text property="avedescripcion"  /> 
				*<html:errors property="avedescripcion"  /> 
				<tr align="center"> 
				<td colspan="2">   
 <%if(gstpermiso.getEscritura(session, "maestro", "averia.jsp") ){ %> 
<html:submit  value="Grabar"/> 
 <% } %> <html:button  property="cancelar" value="Cancelar" onclick="window.location='main.jsp?app=maestro&modulo=averia'" />
		</table> 		</html:form> 		</html> 