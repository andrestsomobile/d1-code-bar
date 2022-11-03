
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstdepartamento gdepartamento = new gstdepartamento();

			Collection lista = gdepartamento.getlistadepartamento();
			request.setAttribute("lista", lista);
			gstzona gzona = new gstzona();
			zona entzona;
			String zona;
			%>
<div class="titulo">Lista de Departamentos</div>
<br>

<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 	<tr>
		<th>Codigo (*)
		<th>Nombre (*)
		<th>Zona (*)
<logic:iterate id="temp" name="lista"
			type="maestro.entity.departamento">
			<tr align='center'>
				<td><%=temp.getdepcodigo()%>
				<td><%=temp.getdepnombre()%>
				<%
				entzona = gzona.getzona(temp.getdepzona());
				zona = entzona != null ? entzona.getzonnombre() : "";
				%>
				<td><%=zona%>

		</logic:iterate>
</table>

