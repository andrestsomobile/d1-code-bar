 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="ingreso.control.*,ingreso.entity.*,java.util.*"%> 

<%
gsttrafico gtraf = new gsttrafico();
trafico traf = gtraf.gettrafico(trafcodsx);
%>
<%@page import="maestro.control.gstcompania"%>
<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
	<caption>Datos del Trafico</caption>
	<tr>
		<td> Consecutivo <td> <%= traf.gettrafcodsx() %>
		<td> Compania <td> <%= new gstcompania().getcompania( traf.gettrafcompania()).getcomnombre() %>
	<tr>	
		<td>Fecha Creacion <td> <%= traf.gettraffechacreacion() %>
		<td># BL <td> <%= traf.gettrafdocumento() %>
	<tr>
		<td>Recibo de Mercancía <td><%= traf.getTrafpedido() %>
		<td># Importación <td> <%= traf.gettrafnumdta() %>&nbsp;
	<tr>
		<td >Total Unidades <td><%= traf.getTrafcantidad() %>&nbsp;
		<td ># Veh&iacute;culos <td><%= traf.getTrafmotonave() %>&nbsp;
	</table>
<br>