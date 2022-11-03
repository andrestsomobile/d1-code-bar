
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstdepartamento gdepartamento = new gstdepartamento();
			gdepartamento.setMaxfilas(10);
			String param = request.getParameter("param");
			String pag = request.getParameter("pag");
			Collection lista = gdepartamento.getlistadepartamento(pag, param);
			request.setAttribute("lista", lista);
			gstzona gzona = new gstzona();
			zona entzona;
			String zona;
			%>
<div class="titulo">Gestion de Departamentos</div>
<div align="right" > <a href="main.jsp?app=maestro&modulo=print_<%= request.getParameter("modulo") %>"> Imprimir Listado Completo </a> </div>
<br>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
	<Tr>
		<td align='left'>
		<% if(gstpermiso.getEscritura(session, "maestro", "departamento.jsp")) {%>
		<a href='main.jsp?app=maestro&modulo=departamento_datos'> Nuevo Departamento </a>
		<% }%>
		<td align='right'>
		<form method='post' action='main.jsp?app=maestro&modulo=departamento'>
		<input type='text' name='param' value='<%=param==null ? "" : param %>'>
		<input type='submit' name='buscar' value='Buscar'></form>
</table>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 	<tr>
		<th>Codigo (*)
		<th>Nombre (*)
		<th>Zona (*)
		<th>Opcion <logic:iterate id="temp" name="lista"
			type="maestro.entity.departamento">
			<tr align='center'>
				<td><%=temp.getdepcodigo()%>
				<td><%=temp.getdepnombre()%>
				<%
				entzona = gzona.getzona(temp.getdepzona());
				zona = entzona != null ? entzona.getzonnombre() : "";
				%>
				<td><%=zona%>
				<td><a
					href='departamentoAction.do?opcion=set&codsx=<%= temp.getdepcodigo()%>'><img src="./disenno/images/update.gif" title="Actualizar" ></a> &nbsp;| &nbsp; 
				<% if(gstpermiso.getEscritura(session, "maestro", "departamento.jsp")) {%>
				<a href="javascript:validarDelete('departamentoAction.do?opcion=delete&codsx=<%= temp.getdepcodigo()  %>')"><img src="./disenno/images/substract.gif" title="Eliminar" ></a>
				<%} %>
		</logic:iterate>
</table>
<%String url = "main.jsp?app=maestro&modulo=departamento&param="
					+ (param == null ? "" : param);
			int paginas = gdepartamento.getTotalPaginaslistadepartamento(param);

			%>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
<br>Los campos con (*) son de busqueda