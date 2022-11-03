<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gsttipoproducto gtipoproducto = new gsttipoproducto();

			Collection lista = gtipoproducto.getlistatipoproducto();
			request.setAttribute("lista", lista);
			gstcompania gcompania = new gstcompania();
			compania entcompania;
			String compania;
			%>
<div class="titulo">Lista de Tipo Producto</div>
<br>

<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Compañia
		<th>Cod Sistema
		<th>Descripción
		<th>Codigo

		<logic:iterate id="temp" name="lista"
			type="maestro.entity.tipoproducto">
			<tr align='center'>
				<%
				entcompania = gcompania.getcompania(temp.gettiprcodcompania());
				compania = entcompania != null ? entcompania.getcomnombre() : "";
				%>
				<td><%=compania%>
				<td><%=temp.gettiprcodsx()%>
				<td><%=temp.gettiprdescripcion()%>
				<td><%=temp.gettiprcodigo()%>
				
		</logic:iterate>
</table>
