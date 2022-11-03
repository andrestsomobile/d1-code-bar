<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstempleado gempleado = new gstempleado();
			gempleado.setMaxfilas(10);

			String param = request.getParameter("param");
			String pag = request.getParameter("pag");

			Collection lista = gempleado.getlistaempleado(pag, param);
			request.setAttribute("lista", lista);

			%>
<div class="titulo">Gestion de Empleados</div>
<div align="right" > <a href="main.jsp?app=maestro&modulo=print_<%= request.getParameter("modulo") %>"> Imprimir Listado Completo </a> </div>
<br>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
	<Tr>
		<td align='left'>
		<% if(gstpermiso.getEscritura(session, "maestro", "empleado.jsp")) {%>
		<a href='main.jsp?app=maestro&modulo=empleado_datos'>Nuevo Empleado </a>
		<%} %>
		<td align='right'>
		<form method='post' action='main.jsp?app=maestro&modulo=empleado'><input
			type='text' name='param' value='<%=param==null ? "" : param %>'> <input
			type='submit' name='buscar' value='Buscar'></form>
</table>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Cod Sistema (*)
		<th>Nombre (*)
		<th>Cedula (*)
		<th>Email
		<th>Cargo
		<th>Opcion <logic:iterate id="temp" name="lista"
			type="maestro.entity.empleado">
			<tr align='center'>
				<td><%=temp.getempcodsx()%>
				<td><%=temp.getempnombre()%>
				<td><%=temp.getempcedula()%>
				<td><%=temp.getempmail()%>
				<td><%=temp.getempcargo()%>
				<td><a
					href='empleadoAction.do?opcion=set&codsx=<%= temp.getempcodsx()%>'><img src="./disenno/images/update.gif" title="Actualizar" ></a> &nbsp;| &nbsp; 
				<% if(gstpermiso.getEscritura(session, "maestro", "empleado.jsp")) {%>
				<a href="javascript:validarDelete('empleadoAction.do?opcion=delete&codsx=<%= temp.getempcodsx()  %>')"><img src="./disenno/images/substract.gif" title="Eliminar" ></a>
				<%} %>
		</logic:iterate>
</table>
<%String url = "main.jsp?app=maestro&modulo=empleado&param="
					+ (param == null ? "" : param);
			int paginas = gempleado.getTotalPaginaslistaempleado(param);

			%>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
<br>Los campos con (*) son de busqueda