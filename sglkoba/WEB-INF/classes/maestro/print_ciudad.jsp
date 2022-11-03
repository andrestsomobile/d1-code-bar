
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstciudad gciudad = new gstciudad();

			Collection lista = gciudad.getlistaciudad();
			request.setAttribute("lista", lista);
			gstdepartamento gdepartamento = new gstdepartamento();
			departamento entdepartamento;
			String departamento;
			%>
<div class="titulo">Gestion de Ciudades</div>
<br>

<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Codigo  (*)
		<th>Nombre (*)
		<th>Departamento (*)
		<th>Codigo Saferbo (*)
		
 <logic:iterate id="temp" name="lista"
			type="maestro.entity.ciudad">
			<tr align='center'>
				<td><%=temp.getciucodigo()%>
				<td><%=temp.getciunombre()%>
				<%
				entdepartamento = gdepartamento.getdepartamento(temp.getciudepto());
				departamento = entdepartamento != null ? entdepartamento.getdepnombre() : "";
				%>
				<td><%=departamento%>
				<td><%=temp.getciusaferbo() != null ? temp.getciusaferbo(): "&nbsp;"%>

		</logic:iterate>
</table>

</html>