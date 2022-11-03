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


<% if( gper.verIzquierdo(grupo, "distrinal", "ingreso.jsp") ) { %>
	<tr > 
	<td>&nbsp;</td>
		<td> <a href="main.jsp?app=distrinal&modulo=subir_ingreso">  :: Cargar Ingreso Consolidado</a> 
<% } %>


<% if( gper.verIzquierdo(grupo, "distrinal", "despacho.jsp") ) { %>
<tr > 
	<td>&nbsp;</td>
		<td><a href="main.jsp?app=distrinal&modulo=subir_despacho">  :: Cargar Despacho a Regionales </a> 
<% } %>

<% if( gper.verIzquierdo(grupo, "distrinal", "ingreso.jsp") ) { %>
	<tr > 
	<td>&nbsp;</td>
		<td> <a href="main.jsp?app=distrinal&modulo=ingreso">  :: Ingreso Consolidado</a> 
<% } %>

<% if( gper.verIzquierdo(grupo, "distrinal", "despacho.jsp") ) { %>
<tr > 
	<td>&nbsp;</td>
		<td><a href="main.jsp?app=distrinal&modulo=despacho">  :: Despacho a Regionales </a> 
<% } %>
</table>
<% } %>
