 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1" import="maestro.control.*, registro.control.*,registro.entity.*,registro.form.*,java.util.*"%>

<%
registro_pedido_detalleForm rpdf = (registro_pedido_detalleForm)request.getAttribute("registro_pedido_detalleForm");
//String Codsx = rpdf.getrpderegped();
String repecodsx = new gstregistro_pedido().getregistro_pedido(rpdf.getrpderegped()).getrepecodsx();
String Fecha = new gstregistro_pedido().getregistro_pedido(rpdf.getrpderegped()).getrepefecha();
String Emple = new gstregistro_pedido().getregistro_pedido(rpdf.getrpderegped()).getrepeempleado();
String Estado = new gstregistro_pedido().getregistro_pedido(rpdf.getrpderegped()).getrepeesta();
String HoIn  = new gstregistro_pedido().getregistro_pedido(rpdf.getrpderegped()).getrepehoin();
String HoFi  = new gstregistro_pedido().getregistro_pedido(rpdf.getrpderegped()).getrepehofi();

String HoraIni = HoIn.substring(0, 5);
String HoraFin = HoFi.substring(0, 5);

String HoraInicio = HoraIni.substring(0,2);
String MinInicio  = HoraIni.substring(3,5);

String HoraEntrega = HoFi.substring(0,2);
String MinEntrega  = HoFi.substring(3,5);

Integer Hora_Inicio = Integer.parseInt(HoraInicio);
Integer FraccionInicio = Integer.parseInt(MinInicio);

Integer Hora_Entrega = Integer.parseInt(HoraEntrega);
Integer FraccionEntrega = Integer.parseInt(MinEntrega);

Hora_Inicio = Hora_Inicio * 60 + FraccionInicio;
Hora_Entrega = Hora_Entrega * 60 + FraccionEntrega;

Integer FullHora = 0;

if(Hora_Inicio > Hora_Entrega)
    FullHora = Hora_Inicio - Hora_Entrega;
else
    FullHora = Hora_Entrega - Hora_Inicio;

Integer DifHora = FullHora / 60;
Integer DifMinu = FullHora % 60;

HoraEntrega = "";
MinEntrega = "";

if (DifHora < 10)
    HoraEntrega = "0"+DifHora+":";
else
    HoraEntrega =  DifHora.toString()+":";

if (DifMinu < 10)
    MinEntrega = "0"+DifMinu+":";
else
    MinEntrega = DifMinu.toString()+":";
    
String FullTime = HoraEntrega+MinEntrega+"00";
%>

<table align="center" border="0" width='70%' cellpadding="3" cellspacing="0" class="tabla_datos">
	
	<tr>
		<td> Consecutivo <td> <%= repecodsx %>
		<td> Fecha  <td> <%= Fecha %>
	<tr>
                <td>Auxiliar <td> <%= new gstempleado().getempleado(Emple).getempnombre() %>
		<td>Estado <td> <%= Estado %>
	<tr>
		<td>Hora Inicio <td><%= HoIn %>
		<td>Hora Entrega <td> <%= HoFi %>&nbsp;
        <tr>
            <td colspan="3"><b><font size="5"> TIEMPO TRANSCURRIDO</font> <td></b><font size="5"> <%= FullTime %></font>
	</table>
<br>