
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import ="java.util.*, administracion.control.gstpermiso, pedido.form.packingForm, maestro.control.gstcompania" %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

<%
maestro.control.gstbodega gbod = new maestro.control.gstbodega();
String packcodsx = request.getParameter("packcodsx");
pedido.control.gstpacking gpack = new pedido.control.gstpacking();
pedido.entity.packing pack = gpack.getpacking(packcodsx); 
pedido.control.gstpacking_detalle gpackdet = new pedido.control.gstpacking_detalle();
pedido.control.gstpacking_detalle_posicion gpackpos = new pedido.control.gstpacking_detalle_posicion();
gstcompania gcia = new gstcompania();
maestro.control.gstproducto gprod = new maestro.control.gstproducto();
%>		

		<div class="titulo"> Packing - Formato de Impresion </div> 
		<br> 
<table align="center" border="0" width='80%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
			<tr> 
				<td>Consecutivo
				<td><%= pack.getpackcodsx() %>
				<td>Empresa
				<td> <%= gcia.getcompania( pack.getpackempresa()).getcomnombre() %>
				
			<tr> 
				<td>Fecha
				<td><%= pack.getpackfecha() %>
				<td>Observaciones
				<td><%= pack.getpackobservaciones() %>
			<tr> 
				<td>Estado
				<td><%= pack.getpackestado() %>
	
				<td>&nbsp; <td> &nbsp;
				</table> 		
				<br>
	<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
	<tr><th>Material<th>Descripcion<th>Cantidad Total <th>Referencias por Posicion
		<%
		//ahora pongo las referencias con sus posiciones:
			Collection dets = gpackdet.getlistapacking_detalle( pack.getpackcodsx());
		Iterator ite = dets.iterator();
		while(ite.hasNext()) {
			pedido.entity.packing_detalle packd = (pedido.entity.packing_detalle)ite.next();
			maestro.entity.producto prod = gprod.getproducto( packd.getpackdproducto());
		%>
		<tr>
			<td> <%= prod.getpromodelo() %>
			<td> <%= prod.getprodescripcion() %>
			<td> <%= gpackdet.getTotalPacking_detalle( packd.getpackdcodsx())%>
			<td> 
				<table align="center" border="0" width='90%' cellpadding="1" cellspacing="0" class="tabla_datos" > 
				<tr>	<th>Bodega <th>Posicion <th>Cantidad
				<%
				Collection pos = gpackpos.getlistapacking_detalle_posicion( packd.getpackdcodsx());
				Iterator itepos = pos.iterator();
				while(itepos.hasNext()) {
					pedido.entity.packing_detalle_posicion pds = (pedido.entity.packing_detalle_posicion) itepos.next();
				%>
				<tr>
				<td><%= gbod.getbodega( pds.getpackpbodega() ).getbodnombre() %>
				<td><%= pds.getpackpposicion() %>
				<td><%= pds.getpackpcantidad() %>
				
				<% } %>
				</table>
			
		
		
		<%} %>
		
		
		</table>
		<br><br>

		 		</html> 