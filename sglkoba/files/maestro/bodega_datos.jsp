
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="administracion.control.gstpermiso"
	pageEncoding="ISO-8859-1"%>

<html>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<div class="titulo">Gestion de Datos de una Bodega</div>
<br>
<html:form action="bodegaAction.do?app=maestro&modulo=bodega_datos"
	method="post">
	<html:hidden property="opcion" />
	<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
		<tr>
			<td>Codigo del Sistema
			<td><html:text readonly="true" property="bodcodsx" styleClass="readonly"/>
		<tr>
			<td>Nombre
			<td><html:text property="bodnombre" />*<html:errors
				property="bodnombre" />
		<tr>
			<td>Descripcion
			<td><html:textarea property="boddesc"></html:textarea>*<html:errors
				property="boddesc" />
		<tr>
			<td>Direccion plano
			<td><html:text property="bodurlplano" />*<html:errors
				property="bodurlplano" />
		<tr align="center">
			<td colspan="2"><html:submit value="Grabar" disabled='<%= !gstpermiso.getEscritura(session,  "maestro", "bodega_datos.jsp") %>'   />
						<html:button property="cancelar" onclick="window.location='main.jsp?app=maestro&modulo=bodega'" value="Cancelar"/>
	</table>
</html:form>
</html>
