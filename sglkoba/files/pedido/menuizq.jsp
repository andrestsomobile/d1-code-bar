<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="administracion.control.*,administracion.entity.*"%>

<%
String menuizq = (String)request.getAttribute("menuizq");
if(menuizq==null) {
%>     
<% 
gstpermiso gper = new gstpermiso();
String grupo = ((usuario)session.getAttribute("usuario")).getusugrupo();
%>    
<%@page import="pedido.entity.*"%>
<%@page import="pedido.control.*"%>
<%@page import="pedido.form.*"%>
<table width="120" border="0" cellspacing="3" cellpadding="3"  class="menuizquierdo">

<% if( gper.verIzquierdo(grupo, "pedido", "pedido.jsp") ) { %>
	<tr  > 
	<td>&nbsp;</td>
		<td ><a href="main.jsp?app=pedido&modulo=pedido">  Pedidos</a> 
		<%
//miro si el pedido
pedidoForm ped_form = (pedidoForm)request.getAttribute("pedidoForm");
	String pedcodsx= ped_form!=null ? ped_form.getpedcodsx() : request.getParameter("pedcodsx");
	
if(pedcodsx!=null && !pedcodsx.equals("") ) {
%>
	<tr > 
	<td>&nbsp;</td>
	<td width="100"> 
		<table class="tabla_form" align="right" cellpadding="0" cellspacing="0" border="0">  
			<tr><td><a href="pedidoAction.do?opcion=set&pedcodsx=<%= pedcodsx%>"  > - Datos Generales </a>
			<tr><td> <a href="main.jsp?app=pedido&modulo=referencia_pedido&pedcodsx=<%= pedcodsx%>"> - Referencias</a>
			<tr><td> <a href="main.jsp?app=pedido&modulo=resumen&pedcodsx=<%= pedcodsx%>"> - Resumen</a>
			<tr><td> <a href="main.jsp?app=pedido&modulo=documento_entrega&pedcodsx=<%= pedcodsx%>"> - Doc. Entrega</a>
			
			<%
			pedido ped = new gstpedido().getpedido(pedcodsx);
			if(ped.getpedestado().equals("FINALIZADO") ) {
			%>
			<tr><td> <a href="main.jsp?app=pedido&modulo=novedad_pedido&pedcodsx=<%= pedcodsx %>"> - Novedades</a>			
			<% } %>
			</table>
<% } %>
		
		
<% } %>


<% if( gper.verIzquierdo(grupo, "pedido", "despacho.jsp") ) { %>
	<tr  > 
	<td>&nbsp;</td>
		<td ><a href="main.jsp?app=pedido&modulo=despacho">  Despachos </a> 
		<%
//miro si el pedido
despachoForm desp_form = (despachoForm)request.getAttribute("despachoForm");
	String despcodsx= desp_form!=null ? desp_form.getdespcodsx() : request.getParameter("despcodsx");

if(despcodsx!=null && !despcodsx.equals("") ) {
%>
	<tr > 
	<td>&nbsp;</td>
	<td width="100"> 
		<table class="tabla_form" align="right" cellpadding="0" cellspacing="0" border="0">  
			<tr><td><a href="despachoAction.do?opcion=set&codsx=<%= despcodsx%>"  > - Datos Generales </a>
			<tr><td> <a href="main.jsp?app=pedido&modulo=despacho_pedido&despcodsx=<%= despcodsx%>"> - Pedidos y Referencias</a>
			<tr><td> <a href="main.jsp?app=pedido&modulo=resumen_despacho&despcodsx=<%= despcodsx%>"> - Resumen</a>
			<tr><td> <a href="main.jsp?app=pedido&modulo=planilla_despacho&despcodsx=<%= despcodsx%>"> - Planilla Despacho</a>
			<tr><td> <a href="main.jsp?app=pedido&modulo=consolidado&despcodsx=<%= despcodsx%>"> - Consolidado por Embarque</a>
			<tr><td> <a href="main.jsp?app=pedido&modulo=generaPlanilla&despcodsx=<%= despcodsx%>"> - Generar Archivo de Planilla</a>
		</table>
<% } %>

<% } %>

<% if( gper.verIzquierdo(grupo, "registro", "subir_valor_unitario.jsp") ) { %>
<tr > 
	<td>&nbsp;</td>
		<td><a href="main.jsp?app=registro&amp;modulo=subir_valor_unitario">  :: Cargar Valor Unitario </a> 
<% } %>

    <tr  >
      <td>&nbsp;</td>
      <td ><a href="main.jsp?app=pedido&amp;modulo=subir">Subir Archivo</a></td>
    </tr>

	<td>&nbsp;</td>
		<td ><a href="main.jsp?app=pedido&modulo=subir"></a><a href="ShowFiles">Bloc de Errores </a></td>
  </tr>
  <tr>
      <td>&nbsp;</td>
      <td ><a href="./files/pedido/tablero_control.jsp">Tablero de Control</a></td>
  </tr>
  
<% if( gper.verIzquierdo(grupo, "pedido", "despacho.jsp") ) { %>
	<tr > 
	<td>&nbsp;</td>
	<td ><a href="./files/pedido/tabcontrol/carga.jsp">Asociar Pedidos a Despachos </a> 
<% } %>


</table>
<% }  %>
