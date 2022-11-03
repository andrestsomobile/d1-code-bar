
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso " %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

		<div class="titulo"> Gestion de Datos de un faq </div> 
		<br> 
		<html:form action="faqAction.do" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border'0' cellpadding='3' cellspacing='0' class='tabla_datos' width='80%'> 
			<tr> 
				<td>Consecutivo
				<td><html:text property="faqcodsx" size="5" readonly="true" styleClass="readonly"  /> 
			<tr> 
				<td>Pregunta
				<td><html:textarea property="faqpregunta"  /> 
			<tr> 
				<td>Respuesta Corta
				<td><html:textarea property="faqrespcorta"  /> 
			<tr> 
				<td>Respuesta Larga
				<td><html:textarea property="faqresplarga"  /> 
				<tr align="center"> 
				<td colspan="2">   
 <%if(gstpermiso.getEscritura(session, "ayuda", "faq.jsp") ){ %> 
<html:submit  value="Grabar"/> 
 <% } %> <html:button  property="cancelar" value="Cancelar" onclick="window.location='main.jsp?app=ayuda&modulo=faq'" />
		</table> 		</html:form> 		</html> 