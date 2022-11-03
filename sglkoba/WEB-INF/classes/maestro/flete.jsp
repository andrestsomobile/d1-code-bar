
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso, maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%
gstflete gflete = new gstflete();
gflete.setMaxfilas(10);

String param = request.getParameter("param");
String pag = request.getParameter("pag");
Collection lista = gflete.getlistaflete(pag, param);
request.setAttribute("lista", lista);
gstcliente gcliente = new gstcliente();
cliente entcliente;
String cliente;
gsttransportadora gtrans = new gsttransportadora();
transportadora enttrans;
String transportadora;
gstsucursal gsucursal = new gstsucursal();
sucursal entsucursal;
String sucursalnombre;
%>
<div class="titulo">Gestion de fletes</div>
<div align="right" > <a href="main.jsp?app=maestro&modulo=print_<%= request.getParameter("modulo") %>"> Imprimir Listado Completo </a> </div>
<br>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
	<Tr>
		<td align='left'>
		<% if(gstpermiso.getEscritura(session, "maestro", "flete.jsp")) {%>
		<a href='main.jsp?app=maestro&modulo=flete_datos'>Nuevo Flete </a>
		<%} %>
		<td align='right'>
		<form method='post' action='main.jsp?app=maestro&modulo=flete'><input
			type='text' name='param' value='<%=param==null ? "" : param %>'> <input
			type='submit' name='buscar' value='Buscar'></form>
</table>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Cod Sistema (*)
		<th>Cliente Origen (*)
		<th>Sucursal Destino (*)
		<th>Transportadora (*)
		<th>Tipo de Vehiculo (*)
		<th>Costo
		<th>Opcion 
	</tr>

		<logic:iterate id="temp" name="lista"
			type="maestro.entity.flete">
			<tr align='center'>
			<%
			entcliente = gcliente.getcliente(temp.getflecliente());
			cliente = entcliente != null ? entcliente.getclinombre() : "";
			enttrans = gtrans.gettransportadora(temp.getfletransportadora());
			transportadora = gtrans != null ? enttrans.gettranspnombre() : "";
			entsucursal = gsucursal.getsucursal(temp.getflesucursal());
			sucursalnombre = entsucursal != null ? entsucursal.getsucnombre() : "";
			%>
				<td><%=temp.getflecodsx()%>
				<td><%=cliente%>
				<td><%=sucursalnombre%>
				<td><%=transportadora%>
				<td><%=temp.getfletipoveh()%>
				<td><%=temp.getflevalor()%>
				<td><a
					href='fleteAction.do?opcion=set&codsx=<%= temp.getflecodsx()%>'><img src="./disenno/images/update.gif" title="Actualizar" ></a> &nbsp;| &nbsp; 
				<% if(gstpermiso.getEscritura(session, "maestro", "flete.jsp")) {%>
				<a	href="javascript:validarDelete('fleteAction.do?opcion=delete&codsx=<%= temp.getflecodsx()  %>')"><img src="./disenno/images/substract.gif" title="Eliminar" >	</a>
				<%} %>
		</logic:iterate>
</table>
<%String url = "main.jsp?app=maestro&modulo=flete&param="
					+ (param == null ? "" : param);
			int paginas = gflete.getTotalPaginaslistaflete(param);

			%>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
<br>Los campos con (*) son de busqueda