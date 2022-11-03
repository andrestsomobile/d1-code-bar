
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso, maestro.control.gstzona"%>

<html>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<div class="titulo">Gestion de Datos de un Departamento</div>
<br>
<html:form
	action="departamentoAction.do?app=maestro&modulo=departamento_datos"
	method="post">
	<html:hidden property="opcion" />
	<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
		<tr>
			<td>Codigo
			<td><html:text property="depcodigo" />* <html:errors
				property="depcodigo" />
		<tr>
		<%
			gstzona gzona = new gstzona();
			request.setAttribute("lista", gzona.getlistazona());
		%>
			<td>Zona
			<td><html:select property="depzona">
					<html:options collection="lista"  
					property="zoncodsx" labelProperty="zonnombre"   />
				</html:select>* <html:errors
				property="catcodpadre" />
		<tr>
			<td>Nombre
			<td><html:text property="depnombre" />* <html:errors
				property="depnombre" />
		
		<tr align="center">
			<td colspan="2"><html:submit value="Grabar" disabled='<%= !gstpermiso.getEscritura(session,  "maestro", "departamento_datos.jsp") %>' />
			<html:button property="cancelar" onclick="window.location='main.jsp?app=maestro&modulo=departamento'" value="Cancelar"/>
	</table>
</html:form>
</html>
