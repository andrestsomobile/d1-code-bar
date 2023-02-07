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

<% if( gper.verIzquierdo(grupo, "ingreso", "trafico.jsp") ) { %>
	<tr > 
	<td>&nbsp;</td>
		<td> <a href="main.jsp?app=ingreso&modulo=trafico">  :: Trafico</a> 
<% } %>

<%
//miro si el trafico existe y si tiene permisos:
	String param = request.getParameter("trafcodsx");
String trafcodsx = param==null || (param!=null && param.equals("")) ? (String)request.getAttribute("trafcodsx") :param  ;
if(trafcodsx!=null && !trafcodsx.equals("") ) {
%>
	<tr > 
	<td>&nbsp;</td>
	<td width="100"> 
		<table class="tabla_form" align="right" cellpadding="0" cellspacing="0" border="0" >  
			<tr><td> <a href="traficoAction.do?opcion=set&codsx=<%= trafcodsx %>"  > - Datos Generales </a>
			<tr><td> <a href="main.jsp?app=ingreso&modulo=factura_trafico&trafcodsx=<%= trafcodsx %>"> - Facturas / Refcias </a>
			<tr><td> <a href="main.jsp?app=ingreso&modulo=contenedor_trafico&trafcodsx=<%= trafcodsx %>"> - Veh&iacute;culos </a>			
			<tr><td> <a href="main.jsp?app=ingreso&modulo=lote_trafico&trafcodsx=<%= trafcodsx %>"> - Lotes </a>
			<tr><td> <a href="main.jsp?app=ingreso&modulo=lote_contenedor_trafico&trafcodsx=<%= trafcodsx %>"> - Detalle Lotes </a>
			<tr><td> <a href="main.jsp?app=ingreso&modulo=resumen_trafico&trafcodsx=<%= trafcodsx %>"> - Resumen </a>
		</table>
<% } %>

<% if( gper.verIzquierdo(grupo, "ingreso", "proforma.jsp") ) { %>
<tr > 
	<td>&nbsp;</td>
		<td><a href="main.jsp?app=ingreso&modulo=proforma">  :: Proforma </a> 
<% } %>


<% if( gper.verIzquierdo(grupo, "ingreso", "actualizar_posiciones.jsp") ) { %>
<tr > 
	<td>&nbsp;</td>
		<td> <a href="main.jsp?app=ingreso&modulo=actualizar_posiciones&trafcodsx=<%= trafcodsx %>"> :: Actualizar Posiciones </a>
<% } %>


<% if( gper.verIzquierdo(grupo, "ingreso", "ingreso.jsp") ) { %>
	<tr > 
	<td>&nbsp;</td>
		<td><a href="main.jsp?app=ingreso&modulo=ingreso">  :: Ingresos </a> 	
<% }
if(request.getParameter("modulo")!=null && request.getParameter("modulo").equals("ingreso")) {

%>
	<tr > 
	<td>&nbsp;</td>
	<td width="100"> 
		<table class="tabla_form" align="right" cellpadding="0" cellspacing="0" border="0">  
			<tr><td><a href="main.jsp?app=ingreso&modulo=ingreso&tipo=TRAFICO">  Trafico</a> 
			<tr><td> <a href="main.jsp?app=ingreso&modulo=ingreso&tipo=DEVOLUCION">  Devoluciones</a> 
			<tr><td> <a href="main.jsp?app=ingreso&modulo=ingreso&tipo=DESPIECE">  Despiece</a> 
			</table>
<% }  %>
<% if( gper.verIzquierdo(grupo, "ingreso", "reubicacion.jsp") ) { %>
	<tr > 
	<td>&nbsp;</td>
		<td> <a href="main.jsp?app=ingreso&modulo=reubicacion">:: Reubic</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "ingreso", "lote_trafico_vencimiento.jsp") ) { %>
	<tr > 
	<td>&nbsp;</td>
		<td> <a href="main.jsp?app=ingreso&modulo=lote_trafico_vencimiento">:: Vencimiento Lotes</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "ingreso", "lote_trafico_vencimiento_posicion.jsp") ) { %>
	<tr > 
	<td>&nbsp;</td>
		<td nowrap="nowrap"> <a href="main.jsp?app=ingreso&modulo=lote_trafico_vencimiento_posicion">:: Actualización Lotes <br>por Posicion</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "ingreso", "cambiolocacion.jsp") ) { %>
	<tr > 
	<td>&nbsp;</td>
		<td> <a href="main.jsp?app=ingreso&modulo=cambiolocacion">:: Cambio<br>Locaci&oacute;n</a> 
<% } %>    
</table>
<% } %>
