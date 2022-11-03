
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstcompania gcompania = new gstcompania();
			gcompania.setMaxfilas(10); 
			String param = request.getParameter("param");
			String pag = request.getParameter("pag");
			Collection lista = gcompania.getlistacompaniatodas(pag, param);
			request.setAttribute("lista", lista);
			%>
<div class="titulo">Gestion de Compañias</div>
<div align="right" > <a href="main.jsp?app=maestro&modulo=print_<%= request.getParameter("modulo") %>"> Imprimir Listado Completo </a> </div>
<br>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
<tr>
 	<td colspan="2" class="fuente">
 	<br>
 	Las companias a las cuales usted le presta sus servicios de logistica y almacenamiento.
 	<br><br>

	<Tr>
		<td align='left'>
		<% if(gstpermiso.getEscritura(session, "maestro", "compania.jsp")) {%>
		<a href='main.jsp?app=maestro&modulo=compania_datos'>Nueva Compañia </a>
		<%} %>
		<td align='right'>
		<form method='post' action='main.jsp?app=maestro&modulo=compania'><input
			type='text' name='param' value='<%=param==null ? "" : param %>'> <input
			type='submit' name='buscar' value='Buscar'></form>
</table>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Codigo (*)
		<th>Nombre (*)
		<th>NIT (*)
	    <th>Ciudad (*)
		<th>Telefono

		<th>Opcion <logic:iterate id="temp" name="lista"
			type="maestro.entity.compania">
			<tr align='center'>
				<td><%=temp.getcomcodsx()%>
				<td><%=temp.getcomnombre()%> 
				<td><%=temp.getComnit()%>
				<td><%= new gstciudad().getciudad( temp.getcomciudad()).getciunombre()%>
				<td><%=temp.getcomtelefono()%>
				<td><a
					href='companiaAction.do?opcion=set&codsx=<%= temp.getcomcodsx()%>'>
					<img src="./disenno/images/update.gif" title="Actualizar" ></a>&nbsp;|&nbsp;
				<% if(gstpermiso.getEscritura(session, "maestro", "compania.jsp")) {%>
				<a	href="javascript:validarDelete('companiaAction.do?opcion=delete&codsx=<%= temp.getcomcodsx()  %>')">
				<img src="./disenno/images/substract.gif" ></a>
				<%} %>
		</logic:iterate>
</table>
<%String url = "main.jsp?app=maestro&modulo=compania&param="
					+ (param == null ? "" : param);
			int paginas = gcompania.getTotalPaginaslistacompaniaTodas(param);

			%>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
   <br>
 Los Campos con * son los Campos de Busqueda