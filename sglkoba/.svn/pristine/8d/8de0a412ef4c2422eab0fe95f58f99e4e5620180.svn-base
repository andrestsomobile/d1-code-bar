
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso, maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstsucursal gsucursal = new gstsucursal();
gstciudad gciu = new gstciudad();
gstdepartamento gdep = new gstdepartamento();



			Collection lista = gsucursal.getlistasucursal(  ); 
			request.setAttribute("lista", lista); 
			gstcliente gcliente = new gstcliente();
			cliente entcliente;
			String clienteSuc;
			%>
<div class="titulo">Lista de Sucursales</div>

<br>

<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Cod Sistema (*)
		<th>Codigo
		<th>Nit (*)
		<th>Nombre (*)
		<th>Ciudad
		<th>Departamento
		<th>Direccion
		<th>Telefono <logic:iterate id="temp" name="lista"
			type="maestro.entity.sucursal">
			<tr align='center'>
				<td><%=temp.getsuccodsx()%>
				<td><%=temp.getSuccodigo()%>
				<%
				entcliente = gcliente.getcliente(temp.getsuccodcliente());
				clienteSuc = entcliente != null ? entcliente.getclinombre():"";
				%>
				
				<td><%=temp.getsucnit()%>
				<td><%=temp.getsucnombre()%>
				<td><%= gciu.getciudad(temp.getsucciudad()).getciunombre()%>
				<td><%= gdep.getdepartamento(temp.getsucdepartamento()).getdepnombre()%>
				<td><%=temp.getsucdireccion()%>
				<td><%=temp.getsuctelefono()%>

		</logic:iterate>
</table>
