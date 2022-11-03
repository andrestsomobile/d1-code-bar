
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso, maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstcentrocosto gcentrocosto = new gstcentrocosto();
			gcentrocosto.setMaxfilas(10);
			String param = request.getParameter("param");
			String pag = request.getParameter("pag");
			Collection lista = gcentrocosto.getlistacentrocosto(pag, param);
			request.setAttribute("lista", lista);
			%>
<div class="titulo">Gestion de Centro de Costo</div>
<!--
<div align="right" > <a href="main.jsp?app=maestro&modulo=print_<%= request.getParameter("modulo") %>"> Imprimir Listado Completo </a> </div>
-->
<br>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
	<Tr>
		<td align='left'>
		<% if(gstpermiso.getEscritura(session, "maestro", "centrocosto.jsp")) {%>
		<a href='main.jsp?app=maestro&modulo=centrocosto_datos'>Nuevo Centro de Costo </a>
		<%} %>
		<td align='right'>
		<form method='post' action='main.jsp?app=maestro&modulo=centrocosto'><input
			type='text' name='param' value='<%=param==null ? "" : param %>'> <input
			type='submit' name='buscar' value='Buscar'></form>
</table>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Codigo (*)
		<th>Nombre (*)
		<th>Opcion <logic:iterate id="temp" name="lista"
			type="maestro.entity.centrocosto">
			<tr align='center'>
				<td><%=temp.getcccod()%>
				<td><%=temp.getccdesc()%>
				<td><a
					href='centrocostoAction.do?opcion=set&codsx=<%= temp.getcccod()%>'><img src="./disenno/images/update.gif" title="Actualizar" ></a> &nbsp;| &nbsp;
				<% if(gstpermiso.getEscritura(session, "maestro", "centrocosto.jsp")) {%>
				<a	href="javascript:validarDelete('centrocostoAction.do?opcion=delete&codsx=<%= temp.getcccod()  %>')"><img src="./disenno/images/substract.gif" title="Eliminar" ></a>
				<%} %>
		</logic:iterate>
</table>
<%String url = "main.jsp?app=maestro&modulo=centrocosto&param="
					+ (param == null ? "" : param);
			int paginas = gcentrocosto.getTotalPaginaslistacentrocosto(param);

			%>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
<br>Los campos con (*) son de busqueda