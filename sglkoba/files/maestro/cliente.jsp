<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

			<%
			gstciudad gciu = new gstciudad();
			gstcliente gcliente = new gstcliente();
			gcliente.setMaxfilas(10);
			String param = request.getParameter("param");
			String pag = request.getParameter("pag");
			Collection lista = gcliente.getlistacliente(pag, param);
			request.setAttribute("lista", lista);
			gstcompania gcompania = new gstcompania();
			compania entcompania;
			String compania;
			%>
<div class="titulo">Gestion de Clientes</div>
<div align="right" > <a href="main.jsp?app=maestro&modulo=print_<%= request.getParameter("modulo") %>"> Imprimir Listado Completo </a> </div>
<br>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
<tr>
 	<td colspan="2" class="fuente">
 	<br>
 	Gestion de Los clientes de las empresas existentes
 	<br><br>
	<Tr>
		<td align='left'>
		<% if(gstpermiso.getEscritura(session, "maestro", "cliente.jsp")) {%>
		<a href='main.jsp?app=maestro&modulo=cliente_datos'>Nuevo Cliente </a>
		<%} %>
		<td align='right'>
		<form method='post' action='main.jsp?app=maestro&modulo=cliente'><input
			type='text' name='param' value='<%=param==null ? "" : param %>'> <input
			type='submit' name='buscar' value='Buscar'></form>
</table>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Codigo del Sistema (*)
		<th>Codigo del Cliente (*)
		<th>Compañia (*)
		<th>Nombre (*)
		<th>Nit (*)
		<th>Ciudad
		<th>Opcion <logic:iterate id="temp" name="lista"
			type="maestro.entity.cliente">
		
			<tr align='center'>
				<td><%=temp.getclicodsx()%>
				<td><%= temp.getClicodigo() %>
				<%
				entcompania = gcompania.getcompania(temp.getclicodcompania());
				compania = entcompania!=null?entcompania.getcomnombre():"";
				%>
				<td><%=compania%>
				<td><%=temp.getclinombre()%> 
				<td><%=temp.getclinit()%>
				<td><%= gciu.getciudad( temp.getcliciudad()).getciunombre() %>
				<td>
				<a
					href='clienteAction.do?opcion=set&codsx=<%= temp.getclicodsx()%>'><img src="./disenno/images/update.gif" title="Actualizar" ></a> &nbsp;| &nbsp; 
				<% if(gstpermiso.getEscritura(session, "maestro", "cliente.jsp")) {%>
				<a	href="javascript:validarDelete('clienteAction.do?opcion=delete&codsx=<%= temp.getclicodsx()  %>')"><img src="./disenno/images/substract.gif" title="Eliminar" ></a>
				<%} %>
				<a href="main.jsp?app=maestro&modulo=sucursal&succodcliente=<%=temp.getclicodsx()%>">Sucursales</a>
				<br>
				<a href="main.jsp?app=maestro&modulo=producto_cliente&clicodsx=<%=temp.getclicodsx()%>">Productos</a>
		</logic:iterate>
</table>
<%String url = "main.jsp?app=maestro&modulo=cliente&param="
					+ (param == null ? "" : param);
			int paginas = gcliente.getTotalPaginaslistacliente(param);

			%>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
<br>Los campos con (*) Son campos de busqueda