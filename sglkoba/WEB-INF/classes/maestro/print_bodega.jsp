<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

			<%
			gstbodega gbodega = new gstbodega();
			
			Collection lista = gbodega.getlistabodega();
			request.setAttribute("lista", lista);
			%>
			
<div class="titulo">Lista de Bodegas</div>
<br>

<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Cod Sistema (*)
		<th>Nombre (*)
		<th>Descripcion
		<th>Url Plano
		<logic:iterate id="temp" name="lista" type="bodega">
			<tr align='center'>
				<td><%=temp.getbodcodsx()%>
				<td><%=temp.getbodnombre()%>
				<td><%=temp.getboddesc()%>
				<td><%=temp.getbodurlplano()%>

		</logic:iterate>
</table>
</html>