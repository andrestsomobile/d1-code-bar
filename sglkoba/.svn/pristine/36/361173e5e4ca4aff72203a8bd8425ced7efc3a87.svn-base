
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso, maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstlocacion control = new gstlocacion();
			control.setMaxfilas(10);
			String param = request.getParameter("param");
			String pag = request.getParameter("pag");
			Collection lista = control.getlistalocacion(pag, param);
			request.setAttribute("lista", lista);
			%>
<div class="titulo">Gestion de Locaciones</div>

<br>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
	<Tr>
		<td align='left'>
		<% if(gstpermiso.getEscritura(session, "maestro", "locacion.jsp")) {%>
		<a href='main.jsp?app=maestro&modulo=locacion_datos'>Nueva Locacion </a>
		<%} %>
		<td align='right'>
		<form method='post' action='main.jsp?app=maestro&modulo=locacion'><input
			type='text' name='param' value='<%=param==null ? "" : param %>'> <input
			type='submit' name='buscar' value='Buscar'></form>
</table>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Cod Sistema (*)
		<th>Nombre (*)
		<th>Opcion <logic:iterate id="temp" name="lista"
			type="maestro.entity.locacion">
			<tr align='center'>
				<td><%=temp.getLoccodsx()%>
				<td><%=temp.getLocdesc()%>
				<td><a
					href='locacionAction.do?opcion=set&codsx=<%= temp.getLoccodsx()%>'><img src="./disenno/images/update.gif" title="Actualizar" ></a> &nbsp;| &nbsp;
				<% if(gstpermiso.getEscritura(session, "maestro", "locacion.jsp")) {%>
				<a	href="javascript:validarDelete('locacionAction.do?opcion=delete&codsx=<%= temp.getLoccodsx()  %>')"><img src="./disenno/images/substract.gif" title="Eliminar" ></a>
				<%} %>
		</logic:iterate>
</table>
<%String url = "main.jsp?app=maestro&modulo=locacion&param="
					+ (param == null ? "" : param);
			int paginas = control.getTotalPaginaslistalocacion(param);

			%>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
<br>Los campos con (*) son de busqueda