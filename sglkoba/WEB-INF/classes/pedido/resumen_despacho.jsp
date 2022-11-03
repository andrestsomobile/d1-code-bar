

 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" java.util.*, pedido.control.*, pedido.entity.*, pedido.form.* " %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

<% 
 
gstdespacho gdesp = new gstdespacho();
gstpedido gped = new gstpedido();
gstdespacho_pedido gdesp_ped = new gstdespacho_pedido();
gstreferencia_despacho gref_desp = new gstreferencia_despacho();

maestro.control.gstcompania gcomp = new maestro.control.gstcompania();
maestro.control.gsttransportadora gtransp = new maestro.control.gsttransportadora();
maestro.control.gstproducto gprod = new maestro.control.gstproducto();
String despcodsx = request.getParameter("despcodsx");

despacho desp = gdesp.getdespacho(despcodsx);
%>

		<div class="titulo"> Despacho de MErcancia</div> 
		<br> 
		
<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_resumen"> 

  <tr> 
    <td>Consecutivo
    <td><%= desp.getdespcodsx() %>
    <td>Empresa
    <td><%=  gcomp.getcompania(desp.getdespempresa()).getcomnombre() %>
  <tr> 
    <td>Fecha 
    <td><%= desp.getdespfecha() %>
    <td>Estado
    <td> <%= desp.getdespestado() %>
  <tr> 
    <td>Empresa Transp
    <td> <%= gtransp.gettransportadora( desp.getdesptransportadora()).gettranspnombre() %>
    <td>Placa Vehiculo
    <td><%= desp.getdespplaca() %>
  <tr> 
    <td>Cedula
    <td><%= desp.getdespcedcond() %>
    <td>Nombre Cond
    <td><%= desp.getdespnombrecond() %>
  <tr> 
    <td>Observacion
    <td><%= desp.getdespobservacion() %> &nbsp;
    <td>&nbsp;
    <td>&nbsp; 
  <tr>
	<td>Guia Remesa
	<td><%=desp.getDepguiaremesa()%> &nbsp;
	<td>Precinto
	<td><%=desp.getDepprecinto()%>&nbsp;    
    
</table>
<br>
<%
Collection pedidos = gdesp_ped.getlistadespacho_pedido(desp.getdespcodsx());
Iterator ite = pedidos.iterator();

%>

	<% 
	while(ite.hasNext()) {
		despacho_pedido desp_ped = (despacho_pedido)ite.next();
		pedido ped = gped.getpedido( desp_ped.getdespedpedido());
		
	%>
	<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_resumen">  
<tr>	
	<th>Consec <th>Numero Guia <th>Num. Pedido <th>Fecha
	
	<tr>
		<td> <%= ped.getpedcodsx() %>
		<td> <%= ped.getpedguia() %>
		<td> <%= ped.getpednumpedido() %>
		<td> <%= ped.getpedfecha() %>
		<%-- por cada pedido coloco sus referencias: --%>
	<tr><td colspan="4">	
	
		<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_resumen">  
		<tr>
			<th>Material <th>Descripcion<th>Cantidad a Despachar
		<%
		Collection refs = gref_desp.getlistareferencia_despacho( desp_ped.getdespedcodsx()); 
		Iterator iterefs = refs.iterator();
		while(iterefs.hasNext()) { 
			referencia_despacho ref_desp =(referencia_despacho) iterefs.next();
			maestro.entity.producto prod = gprod.getproducto( ref_desp.getrefdproducto());
			%>
		<tr>
			<td>	<%= prod.getpromodelo()  %>
			<td>	<%= prod.getprodescripcion() %>
			<td>	<%= ref_desp.getRefdcant() %>
			
			<% 
			}
			%>	
		</table>
</table>	
<br>	
	<% } %>
	



</html> 