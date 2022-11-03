
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstciudad gciudad = new gstciudad();
			gciudad.setMaxfilas(10);
			String param = request.getParameter("param");
			String pag = request.getParameter("pag");
			Collection lista = gciudad.getlistaciudad(pag, param);
			request.setAttribute("lista", lista);
			gstdepartamento gdepartamento = new gstdepartamento();
			departamento entdepartamento;
			String departamento;
			%>
<div class="titulo">Gestion de Ciudades</div>
<div align="right" > <a href="main.jsp?app=maestro&modulo=print_<%= request.getParameter("modulo") %>"> Imprimir Listado Completo </a> </div>
<br>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
	<Tr>
		<td align='left'>
		<% if(gstpermiso.getEscritura(session, "maestro", "ciudad.jsp")) {%>
		<a href='main.jsp?app=maestro&modulo=ciudad_datos'>	Nueva Ciudad </a>
		<%} %>
		<td align='right'>
		<form method='post' action='main.jsp?app=maestro&modulo=ciudad'><input
			type='text' name='param' value='<%=param==null ? "" : param %>'> <input
			type='submit' name='buscar' value='Buscar'></form>
</table>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Codigo  (*)
		<th>Nombre (*)
		<th>Departamento (*)
		<th>Codigo Saferbo (*)
		<th>Opcion <logic:iterate id="temp" name="lista"
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
				<td><a
					href='ciudadAction.do?opcion=set&codsx=<%= temp.getciucodigo()%>'><img src="./disenno/images/update.gif" title="Actualizar" ></a> &nbsp;| &nbsp; 
				<% if(gstpermiso.getEscritura(session, "maestro", "ciudad.jsp")) {%>
				<a href="javascript:validarDelete('ciudadAction.do?opcion=delete&codsx=<%= temp.getciucodigo()  %>')"><img src="./disenno/images/substract.gif" title="Eliminar" ></a>
				<%} %>
		</logic:iterate>
</table>
<%String url = "main.jsp?app=maestro&modulo=ciudad&param="
					+ (param == null ? "" : param);
			int paginas = gciudad.getTotalPaginaslistaciudad(param);

			%>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
<br>Los campos con (*) son de busqueda