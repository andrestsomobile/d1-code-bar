
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="ingreso.control.*,ingreso.entity.*,java.util.*, maestro.entity.*, maestro.control.*, administracion.control.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%   

 gstentrada_locacion control = new gstentrada_locacion(); 
 control.setMaxfilas(10);  

 String param = request.getParameter("param"); 
 String pag = request.getParameter("pag");   

 Collection lista = control.getlistaentrada_locacion(pag, param); 
 request.setAttribute("lista", lista); 

%>
<div class="titulo">Gesti&oacute;n de Cambio Locaci&oacute;n</div>
<br>
<table align='center' width='90%' border='0' cellspacing='0' cellpading='0'>
	<Tr>
		<td align='left'>
			<%if(gstpermiso.getEscritura(session, "ingreso", "cambiolocacion.jsp") ){ %>
			<a href='main.jsp?app=ingreso&modulo=cambiolocacion_datos'> Nuevo</a> 
			<% } %>
		
		<td align='right'>
			<form method='post' action='main.jsp?app=ingreso&modulo=cambiolocacion'>
				<input type='text' name='param' value='<%=param==null ? "" : param %>'> 
				<input type='submit' name='buscar' value='Buscar'>
			</form>
</table>
<table align='center' width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas">
	<tr>
		<th>Consec *
		<th>Ingreso *
		<th>#Importacion *
		<th>Origen *
		<th>Destino *
		<TH>Producto *
		<th>Bodega
		<th>Posicion
		<th>Cantidad NAC
		<th>Cantidad SNAC
		<th>Fecha *
		<th>Opcion 
		
		<logic:iterate id="temp" name="lista" type="entrada_locacion">
				<tr align='center'>
					<td><%= temp.getElcodsx() %> 
<%
 	gstingreso ging = new gstingreso();
	gsttrafico gtraf = new gsttrafico();
	gstentrada gent = new gstentrada();
	gstproducto gprod = new gstproducto();
	gstbodega gbod = new gstbodega();
	gstlocacion gloc = new gstlocacion();
	
	entrada ent = gent.getentrada(temp.getElcodentrada());
 	ingreso ing = ging.getingreso(ent.getentcodingreso());
 	trafico traf = gtraf.gettrafico(ing.getingtrafico());
 	producto prod = gprod.getproducto(ent.getentcodproducto());
	locacion orig = gloc.getlocacion(temp.getElcodlocacionorigen());
	locacion dest = gloc.getlocacion(temp.getElcodlocaciondestino());
 %>
					<td><%= temp.getElcodsx() %>
					<td><%= ing.getingcodsx() %>
					<TD><%= traf==null ? ("NO TIENE(" + ing.getingtipo() +")"): traf.gettrafnumdta() %>
					<td><%= orig.getLocdesc() %>
					<td><%= dest.getLocdesc() %>
					<td><%= prod.getpromodelo() %>
					<td><%= gbod.getbodega(ent.getEntbodega()).getbodnombre() %>
					<td><%= ent.getentposicion() %>
					<td><%= temp.getElcantidadnac() %>
					<td><%= temp.getElcantidadsnac() %>
					<td><%= temp.getElfecha() %>
					<td><a
						href='entrada_locacionAction.do?opcion=set&codsx=<%= temp.getElcodsx()%>'>
							<img src="./disenno/images/update.gif">
						</a> | 
						<%if(gstpermiso.getEscritura(session, "ingreso", "cambiolocacion.jsp")  ){ %>
						<a href="javascript:validarDelete('cambiolocacionAction.do?opcion=delete&codsx=<%= temp.getElcodsx()  %>')">
							<img src="./disenno/images/substract.gif">
						</a> 
						<% } %>
			</logic:iterate>
</table>
<% 	 
String url = "main.jsp?app=ingreso&modulo=cambiolocacion&param=" + (param==null?"":param); 
int paginas = control.getTotalPaginaslistaentrada_locacion(param); 
%>

<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
<br>Los campos con (*) son campos de busqueda