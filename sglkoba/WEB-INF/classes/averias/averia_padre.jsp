
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.*,averias.control.*,averias.entity.*,java.util.*,maestro.control.gstcompania"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%   
 gstcompania gcomp = new maestro.control.gstcompania();
 
 gstaveria_padre control = new gstaveria_padre(); 
 control.setMaxfilas(10);  

 String param = request.getParameter("param"); 
 String pag = request.getParameter("pag");   

 Collection lista = control.getlistaaveria_padre(pag, param); 
 request.setAttribute("lista", lista); 
  %>
<div class="titulo">Gestion de Averias</div>
<br>
<table width='100%' align='center' border='0'>
	<Tr>
		<td align='left'>
			<%if(gstpermiso.getEscritura(session, "averias", "averia_padre.jsp") ){ %>
			<a href='main.jsp?app=averias&modulo=averia_padre_datos'> Nueva Averia </a> <% } %>
		
		<td align='right'>
			<form method='post' action='main.jsp?app=averias&modulo=averia_padre'>
				<input type='text' name='param'
					value='<%=param==null ? "" : param %>'> <input
					type='submit' name='buscar' value='Buscar'>
			</form>
</table>
<table align='center' width='100%' border='0' cellspacing='0' cellpading='0' class="tabla_listas">
	<tr>

		<th>Codigo (*)
		<th>Compania (*)
		<th>Fecha (*)
		<th>Ingreso
		<th>Opcion <logic:iterate id="temp" name="lista"
				type="averias.entity.averia_padre">
				<tr align='center'>
					<td><%= temp. getavpcodsx() %>
					<td><%= gcomp.getcompania( temp.getavpcompania()).getcomnombre() %>
					<td><%= temp.getavpfecha() %>
					<td><%= temp.getavpingreso() %> 
					<td><a href='averia_padreAction.do?opcion=set&codsx=<%= temp.getavpcodsx()%>'>
							<img src="./disenno/images/update.gif" border="0">
					</a> &nbsp;| &nbsp; <%if(gstpermiso.getEscritura(session, "averias", "averia_padre.jsp") && temp.getavpestado().equals("TRAMITE")){ %>
						<a
						href="javascript:validarDelete('averia_padreAction.do?opcion=delete&codsx=<%= temp.getavpcodsx()  %>')">
							<img src="./disenno/images/substract.gif" border="0">
					</a> <% } %>
			</logic:iterate>
</table>
<% 	 String url = "main.jsp?app=averias&modulo=averia_padre&param=" + (param==null?"":param); 
 int paginas = control.getTotalPaginaslistaaveria_padre(param); 
 %>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
<BR>Los Parametros con (*) son de busqueda.
<br>Tambien puede buscar por el codigo de la referencia y/o
descripcion de la misma