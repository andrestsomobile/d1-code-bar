
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso"%>

<html>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<div class="titulo">Gestion de Datos de Locaciona</div>
<br>
<html:form action="locacionAction.do?app=maestro&modulo=locacion_datos"
	method="post">
	<html:hidden property="opcion" />
<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
		<tr>
			<td>Cod Sistema
			<td><html:text property="loccodsx" styleClass="readonly" readonly="true"/>
		<tr>
			<td>Nombre
			<td><html:text property="locdesc" /> *<html:errors
				property="locdesc" />
		<tr align="center">
			<td colspan="2"><html:submit value="Grabar" disabled='<%= !gstpermiso.getEscritura(session,  "maestro", "locacion_datos.jsp") %>' />
			<html:button property="cancelar" onclick="window.location='main.jsp?app=maestro&modulo=locacion'" value="Cancelar"/>
	</table>
</html:form>
</html>
