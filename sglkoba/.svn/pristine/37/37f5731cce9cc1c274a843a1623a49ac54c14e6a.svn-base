
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso, maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstzona gzona = new gstzona();

			Collection lista = gzona.getlistazona();
			request.setAttribute("lista", lista);
			%>
<div class="titulo">Lista de Zonas</div>
<br>

<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Cod Sistema (*)
		<th>Nombre (*)
		<logic:iterate id="temp" name="lista"
			type="maestro.entity.zona">
			<tr align='center'>
				<td><%=temp.getzoncodsx()%>
				<td><%=temp.getzonnombre()%>
		
		</logic:iterate>
</table>
