
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

<% if( gper.verIzquierdo(grupo, "maestro", "zona.jsp") ) { %>
	<tr  > 
			<td>&nbsp;</td>
		<td > <a href="main.jsp?app=maestro&modulo=zona">  Zonas</a> 
<% } %>

<% if( gper.verIzquierdo(grupo, "maestro", "departamento.jsp") ) { %>
	<tr > 
			<td>&nbsp;</td>
		<td ><a href="main.jsp?app=maestro&modulo=departamento">  Departamentos</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "maestro", "ciudad.jsp") ) { %>
	<tr > 
			<td>&nbsp;</td>
		<td ><a href="main.jsp?app=maestro&modulo=ciudad">  Ciudades</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "maestro", "compania.jsp") ) { %>
	<tr  > 
	<td>&nbsp;</td>
		<td > <a href="main.jsp?app=maestro&modulo=compania">  Companias</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "maestro", "categoria.jsp") ) { %>
	<tr > 
	<td>&nbsp;</td>
		<td ><a href="main.jsp?app=maestro&modulo=categoria">  Categorias</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "maestro", "tipoproducto.jsp") ) { %>
	<tr> 
	<td>&nbsp;</td>
		<td > <a href="main.jsp?app=maestro&modulo=tipoproducto">  Tipo Producto</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "maestro", "producto.jsp") ) { %>
	<tr> 
	<td>&nbsp;</td>
		<td > <a href="main.jsp?app=maestro&modulo=producto">  Productos</a> 
	
<% } %>
<% if( gper.verIzquierdo(grupo, "maestro", "cliente.jsp") ) { %>
	<tr> 
		<td>&nbsp;</td>
		<td > <a href="main.jsp?app=maestro&modulo=cliente">Clientes y Sucursales</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "maestro", "averia.jsp") ) { %>
	<tr> 
			<td>&nbsp;</td>
		<td ><a href="main.jsp?app=maestro&modulo=averia">  Averias</a> 
<% } %>


<% if( gper.verIzquierdo(grupo, "maestro", "transportadora.jsp") ) { %>
	<tr > 
			<td>&nbsp;</td>
		<td ><a href="main.jsp?app=maestro&modulo=transportadora">  Transportadoras</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "maestro", "bodega.jsp") ) { %>
<tr > 
			<td>&nbsp;</td>
		<td >
		<a href="main.jsp?app=maestro&modulo=bodega">  Bodegas</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "maestro", "mapa_bodega.jsp") ) { %>
<tr > 
			<td>&nbsp;</td>
		<td >
		<a href="main.jsp?app=maestro&modulo=mapa_bodega">  Mapa Bodega Principal</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "maestro", "empleado.jsp") ) { %>
<tr > 
			<td>&nbsp;</td>
		<td ><a href="main.jsp?app=maestro&modulo=empleado">  Empleados</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "maestro", "flete.jsp") ) { %>
<tr > 
			<td>&nbsp;</td>
		<td ><a href="main.jsp?app=maestro&modulo=flete">  Fletes</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "maestro", "causal.jsp") ) { %>
<tr > 
			<td>&nbsp;</td>
		<td ><a href="main.jsp?app=maestro&modulo=causal">  Causales de Devolucion</a> 
<% } %>

<% if( gper.verIzquierdo(grupo, "maestro", "averia.jsp") ) { %>
<tr > 
			<td>&nbsp;</td>
		<td ><a href="main.jsp?app=maestro&modulo=averia">  Averias</a> 
<% } %>

<% if( gper.verIzquierdo(grupo, "maestro", "categoria_oster.jsp") ) { %>
<tr > 
			<td>&nbsp;</td>
		<td ><a href="main.jsp?app=maestro&modulo=categoria_oster">  Clasificacion ABC</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "maestro", "locacion.jsp") ) { %>
<tr > 
			<td>&nbsp;</td>
		<td ><a href="main.jsp?app=maestro&modulo=locacion">Locaciones</a> 
<% } %>
</table>

<% } %>