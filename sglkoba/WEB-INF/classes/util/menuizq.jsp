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
<table width="120" border="0" cellspacing="3" cellpadding="3"  class="menuizquierdo">

<% if( gper.verIzquierdo(grupo, "util", "capacidad_camion.jsp") ) { %>
	<tr > 
	<td>&nbsp;</td>
		<td> <a href="main.jsp?app=util&modulo=capacidad_camion">  :: Capacidad De Camiones</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "util", "calculadora.jsp") ) { %>
	<tr > 
	<td>&nbsp;</td>
		<td> <a href="main.jsp?app=util&modulo=calculadora">  :: Calculadora</a> 
<% } %>
<tr > 
	<td>&nbsp;</td>
	<td nowrap="nowrap"> <a href="consultas/addblocks/index.html">  :: Carga Camiones</a> 
<tr > 
	<td>&nbsp;</td>
	<td nowrap="nowrap"> <a href="main.jsp?app=util&modulo=consultasdespacho">  :: Consultas Despachos</a> 
	
<tr > 
	<td>&nbsp;</td>	
	<td> <a href="main.jsp?app=util&modulo=registro_pedidos_1">  :: Registro de Pedidos </a>
</table>


<% } %>
