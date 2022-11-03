<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gsttipoproducto gtipoproducto = new gsttipoproducto();
			gtipoproducto.setMaxfilas(10);
			String param = request.getParameter("param");
			String pag = request.getParameter("pag");
			Collection lista = gtipoproducto.getlistatipoproducto(pag, param);
			request.setAttribute("lista", lista);
			gstcompania gcompania = new gstcompania();
			compania entcompania;
			String compania;
			%>
<div class="titulo">Gestion de Tipo Producto</div>
<div align="right" > <a href="main.jsp?app=maestro&modulo=print_<%= request.getParameter("modulo") %>"> Imprimir Listado Completo </a> </div>
<br>
<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' > 
<tr>
 	<td colspan="2" class="fuente">
 	<br>
 	Tipos de Producto para clasificar los productos de cada Compañia
 	<br><br>

	<Tr>
		<td align='left'>
		<% if(gstpermiso.getEscritura(session, "maestro", "tipoproducto.jsp")) {%>
		<a href='main.jsp?app=maestro&modulo=tipoproducto_datos'>Nuevo Tipo Producto </a>
		<% }  %>
		<td align='right'>
		<form method='post' action='main.jsp?app=maestro&modulo=tipoproducto'><input
			type='text' name='param' value='<%=param==null ? "" : param %>'> <input
			type='submit' name='buscar' value='Buscar'></form>
</table>
<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Cod Sistema (*)
		<th>Descripción (*)
		<th>Compañia (*)
		<th>Codigo (*)
		<th>Opcion <logic:iterate id="temp" name="lista"
			type="maestro.entity.tipoproducto">
			<tr align='center'>
				<td><%=temp.gettiprcodsx()%>
				<td><%=temp.gettiprdescripcion()%>
				<%
				entcompania = gcompania.getcompania(temp.gettiprcodcompania());
				compania = entcompania != null ? entcompania.getcomnombre() : "";
				%>
				<td><%=compania%>
				<td><%=temp.gettiprcodigo()%>
				<td><a href='tipoproductoAction.do?opcion=set&codsx=<%= temp.gettiprcodsx()%>'><img src="./disenno/images/update.gif" title="Actualizar" ></a> 
				&nbsp;|&nbsp; 
				<% if(gstpermiso.getEscritura(session, "maestro", "tipoproducto.jsp") )  {%>
				<a href="javascript:validarDelete('tipoproductoAction.do?opcion=delete&codsx=<%= temp.gettiprcodsx()  %>')"><img src="./disenno/images/substract.gif" title="Eliminar" ></a>
				<%} %>
		</logic:iterate>
</table>
<%String url = "main.jsp?app=maestro&modulo=tipoproducto&param="
					+ (param == null ? "" : param);
			int paginas = gtipoproducto.getTotalPaginaslistatipoproducto(param);

			%>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
<br>Los Campos con (*) son de busqueda
