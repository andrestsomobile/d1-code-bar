<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso,maestro.control.*"%>

<%@page import="java.util.Vector"%>
<html >
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<div class="titulo">Gestion de Clasificacion ABC</div>
<br>
<html:form
	action="categoria_osterAction.do?app=maestro&modulo=categoria_oster_datos"
	method="post" >
	<html:hidden property="opcion" />
	<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
	
		<tr>
			<td>Codigo del sistema
			<td><html:text property="catocodsx" readonly="true" styleClass="readonly"  />Automatico, generado por el Sistema
		<%
			gstcategoria_oster gcat = new gstcategoria_oster();
			request.setAttribute("lista", gcat.getlistacategoria_oster());
		%>
		<tr>
		<%
			gstcompania gcia = new gstcompania();
			request.setAttribute("listaCompania", gcia.getlistacompania());
		%>	
		<tr>
			<td>Descripcion
			<td><html:textarea property="catodescripcion"></html:textarea>* <html:errors
				property="catodescripcion" />
		<tr align="center">
			<td colspan="2"><html:submit value="Grabar" disabled='<%= !gstpermiso.getEscritura(session,  "maestro", "categoria_oster_datos.jsp") %>' />
			<html:button property="cancelar" onclick="window.location='main.jsp?app=maestro&modulo=categoria_oster'" value="Cancelar"/>
	</table>
</html:form>
</html>

