<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

			<%
			gstciudad gciu = new gstciudad();
			gstcliente gcliente = new gstcliente();

			Collection lista = gcliente.getlistacliente();
			request.setAttribute("lista", lista);
			gstcompania gcompania = new gstcompania();
			compania entcompania;
			String compania;
			%>
<div class="titulo">Lista de Clientes</div>
<br>

<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Codigo del Sistema (*)
		<th>Codigo del Cliente (*)
		<th>Compañia (*)
		<th>Nombre (*)
		<th>Nit (*)
		<th>Ciudad
		<logic:iterate id="temp" name="lista"
			type="maestro.entity.cliente">
		
			<tr align='center'>
				<td><%=temp.getclicodsx()%>
				<td><%= temp.getClicodigo() %>
				<%
				entcompania = gcompania.getcompania(temp.getclicodcompania());
				compania = entcompania!=null?entcompania.getcomnombre():"";
				%>
				<td><%=compania%>
				<td><%=temp.getclinombre()%> 
				<td><%=temp.getclinit()%>
				<td><%= gciu.getciudad( temp.getcliciudad()).getciunombre() %>
		
</logic:iterate>
</table>
