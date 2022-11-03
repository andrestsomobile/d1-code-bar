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
<% if( gper.verIzquierdo(grupo, "administracion", "empresa.jsp") ) { %>
	<tr > 
	<td>&nbsp;</td>
		<td> <a href="main.jsp?app=administracion&modulo=empresa"  >:: Empresa</a> 
<% } %>

<% if( gper.verIzquierdo(grupo, "administracion", "grupo.jsp") ) { %>
		<tr >  <td>&nbsp;</td>
		<td> <a href="main.jsp?app=administracion&modulo=grupo" >  :: Grupos </a> 
<% } %>

<% if( gper.verIzquierdo(grupo, "administracion", "usuario.jsp") ) { %>
	<tr >  <td>&nbsp;</td>
		<td> <a href="main.jsp?app=administracion&modulo=usuario" >:: Usuarios </a> 
<% } %>


<% if( gper.verIzquierdo(grupo, "administracion", "permiso.jsp") )	{ %>
	<tr >  <td>&nbsp;</td>
		<td> <a href="main.jsp?app=administracion&modulo=permiso" >  :: Permisos </a> 
<%  } %>
 

</table>
<% }  %>
