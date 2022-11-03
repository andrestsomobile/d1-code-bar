<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

			<%
			gstbodega gbodega = new gstbodega();
			gbodega.setMaxfilas(10);
			String param = request.getParameter("param");
			String pag = request.getParameter("pag");
			Collection lista = gbodega.getlistabodega(pag, param);
			request.setAttribute("lista", lista);
			%>
			
<div class="titulo">Gestion de Bodegas</div>
<div align="right" > <a href="main.jsp?app=maestro&modulo=print_<%= request.getParameter("modulo") %>"> Imprimir Listado Completo </a> </div>
<br>
<table width='90%' align='center' border='0' cellpadding="0" cellspacing="0"> 
	<Tr>
		<td align='left'>
		<% if(gstpermiso.getEscritura(session, "maestro", "bodega.jsp")) {%>
		<a href='main.jsp?app=maestro&modulo=bodega_datos'>Nueva bodega </a>
		<% }  %>
		<td align='right'>
		<form method='post' action='main.jsp?app=maestro&modulo=bodega'><input
			type='text' name='param' value='<%=param==null ? "" : param %>'> <input
			type='submit' name='buscar' value='Buscar'></form>
</table>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Cod Sistema (*)
		<th>Nombre (*)
		<th>Descripcion
		<th>Url Plano
		<th>Opcion <logic:iterate id="temp" name="lista"
			type="maestro.entity.bodega">
			<tr align='center'>
				<td><%=temp.getbodcodsx()%>
				<td><%=temp.getbodnombre()%>
				<td><%=temp.getboddesc()%>
				<td><%=temp.getbodurlplano()%>
				<td><a 
					href='bodegaAction.do?opcion=set&codsx=<%= temp.getbodcodsx()%>' >
				<img src="./disenno/images/update.gif" title="Actualizar" border="0"></a> &nbsp;|&nbsp;
				<% if(gstpermiso.getEscritura(session, "maestro", "bodega.jsp")) {%>
				 <a
					href="javascript:validarDelete('bodegaAction.do?opcion=delete&codsx=<%= temp.getbodcodsx()  %>')">
					<img src="./disenno/images/substract.gif" title="Eliminar" border="0"></a>
					<% } %>
		</logic:iterate>
</table>
<%String url = "main.jsp?app=maestro&modulo=bodega&param="
					+ (param == null ? "" : param);
			int paginas = gbodega.getTotalPaginaslistabodega(param);

			%>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
<br>Los campos con (*) son de busqueda