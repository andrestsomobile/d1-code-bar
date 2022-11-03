 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1" import="maestro.control.*, registro.control.*,registro.entity.*,registro.form.*,java.util.*"%>

<%
registro_pedidoForm entf = (registro_pedidoForm)request.getAttribute("registro_pedidoForm");
String Codsx = entf.getrepecodsx();
String Emple = entf.getrepeempleado();
//gstempleado gemp = new gstempleado();
//empleado empl = gemp.getempleado(empcodsx)  .gettrafico(trafcodsx);
%>

<table align="center" border="0" width='70%' cellpadding="3" cellspacing="0" class="tabla_datos">
	
	<tr>
		<td> Consecutivo <td> <%= entf.getrepecodsx() %>
		<td> Fecha  <td> <%= entf.getrepefecha() %>
	<tr>
                <td>Auxiliar <td> <%= new gstempleado().getempleado(Emple).getempnombre() %>
		<td>Estado <td> <%= entf.getrepeesta() %>
	<tr>
		<td>Hora Inicio <td><%= entf.getrepehoin() %>
		<td>Hora Entrega <td> <%= entf.getrepehofi() %>&nbsp;
	</table>
<br>