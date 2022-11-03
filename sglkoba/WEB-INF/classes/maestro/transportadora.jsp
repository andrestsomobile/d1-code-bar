
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gsttransportadora gtransportadora = new gsttransportadora();
			gtransportadora.setMaxfilas(10);

			String param = request.getParameter("param");
			String pag = request.getParameter("pag");

			Collection lista = gtransportadora.getlistatransportadora(pag,
					param);
			request.setAttribute("lista", lista);

			%>
<div class="titulo">Gestion de Transportadoras</div>
<div align="right" > <a href="main.jsp?app=maestro&modulo=print_<%= request.getParameter("modulo") %>"> Imprimir Listado Completo </a> </div>
<br>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
	<Tr>
		<td align='left'>
		<% if(gstpermiso.getEscritura(session, "maestro", "transportadora.jsp")) {%>
		<a href='main.jsp?app=maestro&modulo=transportadora_datos'> Nueva Transportadora </a>
		<%} %>
		<td align='right'>
		<form method='post'
			action='main.jsp?app=maestro&modulo=transportadora'><input
			type='text' name='param' value='<%=param==null ? "" : param %>'> <input
			type='submit' name='buscar' value='Buscar'></form>
</table>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Cod Sistema (*)
		<th>Nombre (*)
		<th>Direccion
		<th>Telefono
		<th>Email
		<th>Contacto
		<th>Opcion <logic:iterate id="temp" name="lista"
			type="maestro.entity.transportadora">
			<tr align='center'>
				<td><%=temp.gettranspcodsx()%>
				<td><%=temp.gettranspnombre()%>
				<td><%=temp.gettranspdireccion()%>
				<td><%=temp.gettransptel()%>
				<td><%=temp.gettranspmail()%>
				<td><%=temp.gettranspcontacto()%>
				<td><a
					href='transportadoraAction.do?opcion=set&codsx=<%= temp.gettranspcodsx()%>'><img src="./disenno/images/update.gif" title="Actualizar" ></a> &nbsp;| &nbsp; 
				<% if(gstpermiso.getEscritura(session, "maestro", "transportadora.jsp")) {%>
				<a	href="javascript:validarDelete('transportadoraAction.do?opcion=delete&codsx=<%= temp.gettranspcodsx()  %>')"><img src="./disenno/images/substract.gif" title="Eliminar"></a>
				<%} %>
		</logic:iterate>
</table>
<%String url = "main.jsp?app=maestro&modulo=transportadora&param="
					+ (param == null ? "" : param);
			int paginas = gtransportadora
					.getTotalPaginaslistatransportadora(param);

			%>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
<br>Los campos con (*) son de busqueda