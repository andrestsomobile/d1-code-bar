<%@ page language="java"   pageEncoding="ISO-8859-1"  import="administracion.control.*, administracion.entity.*"%>

<html>    
 <div class="titulo"> Consulta de Capacidad de camiones </div> 
 <br> 


<%

String[] pedidos = request.getParameterValues("pedcodsx");
String fecha_ini = request.getParameter("fecha_ini");
String fecha_fin = request.getParameter("fecha_fin");
if(pedidos==null) {
%>
<form name="camionForm" action="main.jsp?app=util&modulo=capacidad_camion" method="post">

<table align="center" border="0" width='70%' cellpadding="3" cellspacing="0" class="tabla_datos"> 

<TR><th colspan="4">Digita el rango de fechas donde se encuentran los pedidos finalizados
<tr>	<Td>Fecha Inicial <input type="text" name="fecha_ini" readonly="readonly" class="readonly" size="10">
	<a href="javascript:show_calendar('camionForm.fecha_ini');">
<img src="./disenno/images/calendar.gif" id="lupita"></a> 
	
	<Td colspan="2"> Fecha Final<input type="text" name="fecha_fin" readonly="readonly" class="readonly" size="10">
<a href="javascript:show_calendar('camionForm.fecha_fin');" ><img src="./disenno/images/calendar.gif" id="lupita"></a> 

<tr> <th colspan="4"> DIGITE EL CONSECUTIVO DE LOS PEDIDO ASOCIADOS (no se toma si las fechas se han digitado)
<tr>
	<td><input type="text" name="pedcodsx" size="8">
	<td><input type="text" name="pedcodsx" size="8">
	<td><input type="text" name="pedcodsx" size="8">
<tr>
	<td><input type="text" name="pedcodsx" size="8">
	<td><input type="text" name="pedcodsx" size="8">
	<td><input type="text" name="pedcodsx" size="8">
<tr>
	<td><input type="text" name="pedcodsx" size="8">
	<td><input type="text" name="pedcodsx" size="8">
	<td><input type="text" name="pedcodsx" size="8">
<tr>
	<td><input type="text" name="pedcodsx" size="8">
	<td><input type="text" name="pedcodsx" size="8">
	<td><input type="text" name="pedcodsx" size="8">
<tr>
	<td><input type="text" name="pedcodsx" size="8">
	<td><input type="text" name="pedcodsx" size="8">
	<td><input type="text" name="pedcodsx" size="8">


	<tr>
	<td colspan="3"  align="center"><input type="submit" name="Enviar" value="Enviar">
	
</table>
</form>


<%
} else {
	try {
	util.Camiones cam = new util.Camiones();
	cam.execute(fecha_ini, fecha_fin, pedidos);
	
%>
<table align="center" border="0" width='70%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
<caption> Resultados Generales</caption>
<tr><td> Pedidos Consultados: <td> <%= cam.getCad_pedidos() %>
<tr><td> PESO TOTAL:<td> <%= cam.getPeso()%> 
<tr><td> volumen TOTAL:<td><%=  cam.getVol()%>
<tr><td> Master Packs Totales : <td> <%=cam.getMpacks() %>
</table>
<table align="center" border="0" width='70%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
<caption>Resultados Combinados</caption>
<tr><td> Camiones Grandes :<td> <%= cam.getCont_g() %>
<tr><td> Camiones Medianos :<td> <%= cam.getCont_m() %>
<tr><td> Camiones pequenos:<td> <%= cam.getCont_p() %>
<tr><td> Peso Mpack unit (promedio): <td> <%= cam.getPeso_mpack() %>
<tr><td> Volumen Mpack unit (promedio) : <td><%= cam.getVol_mpack()%>
<tr><td> Cantidad de Mpack Camiones Grandes FULL : <td><%= cam.getMpack_g()==null ? "NO HAY MULAS FULL" :  cam.getMpack_g() %>
<tr><td> Cantidad de Mpack para el camion no FULL tipo  <%= cam.getTipo_modulo() %>: <td><%=cam.getMpack_modulo() %>

</table>


<table align="center" border="0" width='70%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
<caption>Resultados Por Tipo de Camion</caption>
<tr><td> Camiones Grandes :<td> <%= cam.getCont_g_tipo() %>
<tr><td> MasterPacks por camion Grande :<td> <%= cam.getMpack_g_tipo() %>
<tr><td> Camiones Medianos :<td> <%= cam.getCont_m_tipo() %>
<tr><td> MasterPacks por camion Grande :<td> <%= cam.getMpack_m_tipo() %>
<tr><td> Camiones pequenos:<td> <%= cam.getCont_p_tipo() %>
<tr><td> MasterPacks por camion Grande :<td> <%= cam.getMpack_p_tipo()%>
</table>

<%
	}catch(Exception e) { e.printStackTrace(); }
}
%>

</html>