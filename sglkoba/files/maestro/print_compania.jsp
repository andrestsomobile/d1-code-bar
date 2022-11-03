
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstcompania gcompania = new gstcompania();

			Collection lista = gcompania.getlistacompania();
			request.setAttribute("lista", lista);
			%>
<div class="titulo">Lista de Compañias</div>
<br>

<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Codigo
		<th>Nombre
		<th>NIT
	    <th>Ciudad
		<th>Telefono
		<th>Direccion
		<th>Fax
		<th>Mail
		<th>Gerente
		<th>Contacto
		<th>Cargo
		<th>Tipo
		<th>Inventario
		<th>Usa Mapa
		<logic:iterate id="temp" name="lista"
			type="maestro.entity.compania">
			<tr align='center'>
				<td><%=temp.getcomcodsx()%>
				<td><%=temp.getcomnombre()%> 
				<td><%=temp.getComnit()%>
				<td><%= new gstciudad().getciudad( temp.getcomciudad()).getciunombre()%>
				<td><%=temp.getcomtelefono()%>
				<td><%=temp.getcomdireccion()%>
				<td><%=temp.getcomfax()%>
				<td><%=temp.getcomemail()%>
				<td><%=temp.getcomgerente()%>
				<td><%=temp.getcomcontacto()%>
				<td><%=temp.getcomcargo()%>
				<td><%=temp.getComTipoDesc()%>
				<td><%=temp.getComInventarioDesc()%>
				<td><%=temp.getCommapa()%>
</logic:iterate>
</table>
