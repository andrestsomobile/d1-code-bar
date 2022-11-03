<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso"%>

<html>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<div class="titulo">Gestion de Datos de un transportadora</div>
<br>
<html:form
	action="transportadoraAction.do?app=maestro&modulo=transportadora_datos"
	method="post">
	<html:hidden property="opcion" />
<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
		<tr>
			<td>Codigo del sistema
			<td><html:text property="transpcodsx" readonly="true" styleClass="readonly" />
		<tr>
			<td>Nombre
			<td><html:text property="transpnombre" />* <html:errors
				property="transpnombre" />
		<tr>
			<td>Direccion
			<td><html:text property="transpdireccion" />* <html:errors
				property="transpdireccion" />
		<tr>
			<td>Telefono
			<td><html:text property="transptel" />* <html:errors
				property="transptel" />
		<tr>
			<td>Email
			<td><html:text property="transpmail" />
		<tr>
			<td>Contacto
			<td><html:text property="transpcontacto" />* <html:errors
				property="transpcontacto" />
		<tr align="center">
			<td colspan="2"><html:submit value="Grabar" disabled='<%= !gstpermiso.getEscritura(session,  "maestro", "transportadora_datos.jsp") %>' />
						<html:button property="cancelar" onclick="window.location='main.jsp?app=maestro&modulo=transportadora'" value="Cancelar"/>
	</table>
</html:form>
</html>