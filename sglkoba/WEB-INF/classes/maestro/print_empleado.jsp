<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstempleado gempleado = new gstempleado();


			Collection lista = gempleado.getlistaempleado();
			request.setAttribute("lista", lista);

			%>
<div class="titulo">Lista de Empleados</div>
<br>

<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Cod Sistema (*)
		<th>Nombre (*)
		<th>Cedula (*)
		<th>Email
		<th>Cargo
		<logic:iterate id="temp" name="lista"
			type="maestro.entity.empleado">
			<tr align='center'>
				<td><%=temp.getempcodsx()%>
				<td><%=temp.getempnombre()%>
				<td><%=temp.getempcedula()%>
				<td><%=temp.getempmail()%>
				<td><%=temp.getempcargo()%>
		
		</logic:iterate>
</table>
