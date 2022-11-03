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

<% if( gper.verIzquierdo(grupo, "averias", "averia_padre.jsp") ) { %>
	<tr > 
	<td>&nbsp;</td>
		<td> <a href="main.jsp?app=averias&modulo=averia_padre">  :: Averias</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "averias", "averia.jsp") ) { %>
	<tr > 
	<td>&nbsp;</td>
		<td> <a href="main.jsp?app=averias&modulo=averia">  :: Detalle de Averias</a> 
<% } %>

<% if( gper.verIzquierdo(grupo, "averias", "reparacion.jsp") ) { %>
	<tr > 
	<td>&nbsp;</td>
		<td> <a href="main.jsp?app=averias&modulo=reparacion">:: Recuperaci&oacute;n</a> 
<% } %>

</table>
<% } %>
