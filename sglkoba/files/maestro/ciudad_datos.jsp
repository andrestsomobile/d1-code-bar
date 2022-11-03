<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso, maestro.control.gstdepartamento"%>

<html>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<div class="titulo">Gestion de Datos de una Ciudad</div>
<br>
<html:form action="ciudadAction.do?app=maestro&modulo=ciudad_datos"
	method="post">
	<html:hidden property="opcion" />
	<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
		<tr>
			<td>Codigo
			<td><html:text property="ciucodigo" />* <html:errors
				property="ciucodigo" />
		<tr>
		<%
			gstdepartamento gdpto = new gstdepartamento();
			request.setAttribute("lista", gdpto.getlistadepartamento());
		%>
			<td>Departamento
			<td><html:select property="ciudepto">
					<html:options collection="lista"  
					property="depcodigo" labelProperty="depnombre"   />
				</html:select>* <html:errors
				property="ciudepto" />

		<tr>
			<td>Nombre
			<td><html:text property="ciunombre" />* <html:errors
				property="ciunombre" />
				
		<tr>
			<td>Codigo Saferbo
			<td><html:text property="ciusaferbo" />
		
		<tr align="center">
			<td colspan="2"><html:submit value="Grabar" disabled='<%= !gstpermiso.getEscritura(session,  "maestro", "ciudad_datos.jsp") %>' />
			<html:button property="cancelar" onclick="window.location='main.jsp?app=maestro&modulo=ciudad'" value="Cancelar"/>
	</table>
</html:form>
</html>
