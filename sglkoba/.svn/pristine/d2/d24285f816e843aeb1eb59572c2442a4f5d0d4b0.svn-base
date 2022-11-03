
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import ="java.util.*, administracion.control.gstpermiso, pedido.form.pickingForm, maestro.control.gstcompania, pedido.control.*, pedido.entity.*" %>  

		<%@page import="maestro.control.gstbodega"%>
<%@page import="maestro.entity.bodega"%>
<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

<%
String pickcodsx = request.getParameter("pickcodsx");
gstpicking gpick = new gstpicking();
gstpicking_detalle gpickdet = new gstpicking_detalle();
gstpicking_detalle_packing gpickpack = new gstpicking_detalle_packing();
gstpacking_detalle_posicion gpackpos = new gstpacking_detalle_posicion();
picking pick = gpick.getpicking( pickcodsx);
gstcompania gcia = new gstcompania();
maestro.control.gstproducto gprod = new maestro.control.gstproducto();
gstbodega gbod = new gstbodega();
%>		

		<div class="titulo"> Picking - Formato de Impresion </div> 
		<br> 
<table align="center" border="0" width='80%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
			<tr> 
				<td>Consecutivo
				<td><%= pick.getpickcodsx() %>
				<td>Empresa
				<td> <%= gcia.getcompania( pick.getpickempresa()).getcomnombre() %>
				
			<tr> 
				<td>Fecha
				<td><%= pick.getpickfecha() %>
				<td>Observaciones
				<td><%= pick.getpickobservaciones() %>
			<tr> 
				<td>Estado
				<td><%= pick.getpickestado() %>
	
				<td>&nbsp; <td> &nbsp;
				</table> 		
				<br>
	<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
	<tr><th>Modelo<th>Descripcion<th>Cantidad Total<th>Valor unit <th>Valor Tot <th>Referencias por Posicion
		<%
		//ahora pongo las referencias con sus posiciones:
			Collection dets = gpickdet.getlistapicking_detalle( pick.getpickcodsx());
		Iterator ite = dets.iterator();
		while(ite.hasNext()) {
			picking_detalle pickd = (picking_detalle)ite.next();
			maestro.entity.producto prod = gprod.getproducto( pickd.getpickdproducto());
		%>
		<tr>
			<td> <%= prod.getpromodelo() %>
			<td> <%= prod.getprodescripcion() %>
			<td> <%= gpickdet.getTotalPicking_detalle(pickd.getpickdcodsx())%>
			<td> <%= pickd.getPickdvalorunit() %>
			<td> <%= util.Math.multiplicar(pickd.getPickdvalorunit(), gpickdet.getTotalPicking_detalle(pickd.getpickdcodsx()) ) %>
			<td> 
				<table align="center" border="0" width='90%' cellpadding="1" cellspacing="0" class="tabla_datos" > 
				<tr>	<th>Bodega <th>Posicion <th>Cantidad
				<%
				Collection pos = gpickpack.getlistapicking_detalle_packing(pickd.getpickdcodsx());
				Iterator itepos = pos.iterator();
				while(itepos.hasNext()) {
					picking_detalle_packing pdp = (picking_detalle_packing)itepos.next();
					packing_detalle_posicion pds = gpackpos.getpacking_detalle_posicion( pdp.getpickppackingdet());
					bodega bod = gbod.getbodega(pds.getpackpbodega());
				%>
				<tr>
				<td><%= bod.getbodnombre() %>
				<td><%= pds.getpackpposicion() %>
				<td><%= pdp.getpickpcantidad() %>
				
				<% } %>
				</table>
			
		
		
		<%} %>
		
		
		</table>
		<br><br>

		 		</html> 