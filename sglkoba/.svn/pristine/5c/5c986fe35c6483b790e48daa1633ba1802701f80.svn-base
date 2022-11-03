
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso"%>

<html>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<div class="titulo">Gestion de Datos de un Empleado</div>
<br>
<html:form action="empleadoAction.do?app=maestro&modulo=empleado_datos"
	method="post">
	<html:hidden property="opcion" />
	<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
		<tr>
			<td>Codigo del sistema
			<td><html:text property="empcodsx" readonly="true" styleClass="readonly" />
		<tr>
			<td>Nombre
			<td><html:text property="empnombre" />* <html:errors
				property="empnombre" />
		<tr>
			<td>Cedula
			<td><html:text property="empcedula" />* <html:errors
				property="empcedula" />
		<tr>
			<td>Email
			<td><html:text property="empmail" />* <html:errors
				property="empmail" />
		<tr>
			<td>Cargo
			<td><html:text property="empcargo" />
		<tr align="center">
			<td colspan="2"><html:submit value="Grabar" disabled='<%= !gstpermiso.getEscritura(session,  "maestro", "empleado_datos.jsp") %>' />
						<html:button property="cancelar" onclick="window.location='main.jsp?app=maestro&modulo=empleado'" value="Cancelar"/>
	</table>
</html:form>
</html>
