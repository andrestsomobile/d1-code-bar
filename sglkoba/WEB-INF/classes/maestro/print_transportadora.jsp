
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gsttransportadora gtransportadora = new gsttransportadora();


			Collection lista = gtransportadora.getlistatransportadora();
			request.setAttribute("lista", lista);

			%>
<div class="titulo">Lista de Transportadoras</div>
<br>

<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Cod Sistema (*)
		<th>Nombre (*)
		<th>Direccion
		<th>Telefono
		<th>Email
		<th>Contacto
		<logic:iterate id="temp" name="lista"
			type="maestro.entity.transportadora">
			<tr align='center'>
				<td><%=temp.gettranspcodsx()%>
				<td><%=temp.gettranspnombre()%>
				<td><%=temp.gettranspdireccion()%>
				<td><%=temp.gettransptel()%>
				<td><%=temp.gettranspmail()%>
				<td><%=temp.gettranspcontacto()%>
		
		</logic:iterate>
</table>
