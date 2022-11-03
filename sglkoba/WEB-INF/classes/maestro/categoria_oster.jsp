<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstcategoria_oster gcategoria_oster = new gstcategoria_oster();
			gcategoria_oster.setMaxfilas(10);
			String param = request.getParameter("param");
			String pag = request.getParameter("pag");
			Collection lista = gcategoria_oster.getlistacategoria_oster(pag, param);
			request.setAttribute("lista", lista);
			%>
<div class="titulo">Gestion de Clasificacion ABC</div>

<br>
<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' > 
<tr>
 	<td colspan="2" class="fuente">
 	<br>
 	<p>Las opciones de clasificacion ABC para:
 	<p>CLASIFICACION X VAL0R DEL INVENTARIO	
 	<p>CLASIFICACION X STOCK DE INVENTARIO	
 	<p>CALIFICACION DEFINITIVA
 	
 	<br><br>

	<Tr>
		<td align='left'>
		<% if(gstpermiso.getEscritura(session, "maestro", "categoria_oster.jsp")) {%>
		<a href='main.jsp?app=maestro&modulo=categoria_oster_datos'>Nuevo </a>
		<% }  %>
		<td align='right'>
		<form method='post' action='main.jsp?app=maestro&modulo=categoria_oster'><input
			type='text' name='param' value='<%=param==null ? "" : param %>'> <input
			type='submit' name='buscar' value='Buscar'></form>
</table>
<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Cod Sistema (*)
		<th>Descripción (*)
		<th>Opcion <logic:iterate id="temp" name="lista"
			type="maestro.entity.categoria_oster">
			<tr align='center'>
				<td><%=temp.getcatocodsx()%>
				<td><%=temp.getcatodescripcion()%>
				<td><a href='categoria_osterAction.do?opcion=set&codsx=<%= temp.getcatocodsx()%>'><img src="./disenno/images/update.gif" title="Actualizar" ></a> 
				&nbsp;|&nbsp; 
				<% if(gstpermiso.getEscritura(session, "maestro", "categoria_oster.jsp"))  {%>
				<a href="javascript:validarDelete('categoria_osterAction.do?opcion=delete&codsx=<%= temp.getcatocodsx()  %>')"><img src="./disenno/images/substract.gif" title="Eliminar" ></a>
				<%} %>
		</logic:iterate>
</table>
<%String url = "main.jsp?app=maestro&modulo=categoria_oster&param="
					+ (param == null ? "" : param);
			int paginas = gcategoria_oster.getTotalPaginaslistacategoria_oster(param);

			%>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
<br>Los Campos con (*) son de busqueda


