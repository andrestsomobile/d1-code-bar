<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,registro.control.*,registro.entity.*,java.util.*,pedido.control.*"%>
<html>

<% 
gstTableroControl control = new gstTableroControl();
gstregistro_pedido gregped = new gstregistro_pedido();
gstregistro_pedido_detalle gregpeddet = new gstregistro_pedido_detalle();
String pag = request.getParameter("pag");
String repecodsx = request.getParameter("repecodsx");
String codsxempleado = request.getParameter("codsxempleado");
String accion = request.getParameter("accion");
String mensaje =  request.getParameter("mensaje");
registro_pedido entity = null;
if (repecodsx != null) {
	entity = gregped.getregistro_pedido(repecodsx);
}
if (repecodsx != null && !repecodsx.equals("") && !repecodsx.equals("null") && accion != null && accion.equals("creardetalle")) {
	mensaje = "";
	Vector pedi = new Vector();
	pedi.add(request.getParameter("ped1"));
	pedi.add(request.getParameter("ped2"));
	pedi.add(request.getParameter("ped3"));
	pedi.add(request.getParameter("ped4"));
	pedi.add(request.getParameter("ped5"));
	pedi.add(request.getParameter("ped6"));
	pedi.add(request.getParameter("ped7"));
	pedi.add(request.getParameter("ped8"));
	pedi.add(request.getParameter("ped9"));
	pedi.add(request.getParameter("ped10"));
	pedi.add(request.getParameter("ped11"));
	pedi.add(request.getParameter("ped12"));
	pedi.add(request.getParameter("ped13"));
	pedi.add(request.getParameter("ped14"));
	pedi.add(request.getParameter("ped15"));
	pedi.add(request.getParameter("ped16"));
	pedi.add(request.getParameter("ped17"));
	pedi.add(request.getParameter("ped18"));
	pedi.add(request.getParameter("ped19"));
	pedi.add(request.getParameter("ped20"));
	int reg = 0;
	String msg = "";
	try {
		for (int i = 0; i < pedi.size(); i++) {
			String pedcodsx = gregpeddet.getpedcodsx(pedi.get(i).toString());
			if (pedcodsx != null && !pedcodsx.equals("") && !pedcodsx.equals("0")) {
				if (control.existe_pedido_en_alistamiento(codsxempleado, pedcodsx) == 0) {
					control.crea_registro_pedido_detalle(repecodsx, pedcodsx);
					reg++;
				} else {
					msg = msg + "Pedido " + pedi.get(i).toString() + " duplicado. ";
				}
			}
		}
		mensaje = "Se registraron los pedidos, para finalizar el alistamiento ingrese a la opcion Finalizar Alistamiento desde el Tablero de Control";
		//response.sendRedirect("../tablero_control.jsp");
	} catch (SQLException e) {
		e.printStackTrace();
	}
	if (reg == 0) {
		mensaje = "Se presentaron errores al registrar los pedidos. " + msg;
	}
}
%>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="../../../disenno/editablegrid/editablegrid-2.0.1.js"></script>
<link rel="stylesheet" href="../../../disenno/editablegrid/editablegrid-2.0.1.css" type="text/css" media="screen">

<!-- include javascript and css files for jQuery, needed for the datepicker and autocomplete extensions -->
<script src="../../../disenno/editablegrid/extensions/jquery/jquery-1.6.4.min.js"></script>
<script src="../../../disenno/editablegrid/extensions/jquery/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" href="../../../disenno/editablegrid/extensions/jquery/jquery-ui-1.8.16.custom.css" type="text/css" media="screen">

<!-- include javascript and css files for the autocomplete extension -->
<script src="../../../disenno/editablegrid/extensions/autocomplete/autocomplete.js"></script>
<link rel="stylesheet"	href="../../../disenno/editablegrid/extensions/autocomplete/autocomplete.css" type="text/css" media="screen">

<link rel="stylesheet" type="text/css" media="all" href="./metro.css">
</head>

<script type="text/javascript">
function mostrarVentana()
{
    var ventana = document.getElementById('miVentana'); // Accedemos al contenedor
    ventana.style.marginTop = "10px"; // Definimos su posición vertical. La ponemos fija para simplificar el código
    ventana.style.marginLeft = ((document.body.clientWidth-350) / 2) +  "px"; // Definimos su posición horizontal
    ventana.style.display = 'block'; // Y lo hacemos visible
}

function ocultarVentana()
{
    var ventana = document.getElementById('miVentana'); // Accedemos al contenedor
    ventana.style.display = 'none'; // Y lo hacemos invisible
    window.location = "../tablero_control.jsp";
}
</script>

<% 	
if (mensaje != null && !mensaje.equals("")) {
%> 
<div id="miVentana" style="position: fixed; width: 350px; height: 10px; top: 0; left: 0; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-weight: normal; border: #333333 3px solid; background-color: #FAFAFA; color: #000000; display:none;">
 <div style="font-weight: bold; text-align: left; color: #FFFFFF; padding: 5px; background-color:#006394">Mensajes de Alerta</div>
  <p style="padding: 5px; text-align: justify; line-height:normal; background-color:#F0F0F0"><%=mensaje%></p>
  <div style="padding: 10px; background-color: #F0F0F0; text-align: center; margin-top: 22px;"><input id="btnAceptar" onclick="ocultarVentana();" name="btnAceptar" size="20" type="button" value="Aceptar" /></div>
</div>

<script type="text/javascript">
mostrarVentana();
</script>
<% 	
}
%> 
<br>
<div>
<table align="center" border="0" width='70%' cellpadding="3" cellspacing="0" class="tabla_datos">
	<tr>
        <td colspan="4" align='center'><b>Registro de Pedidos para Alistamiento </b> </td>
    </tr>
    <div align="right" class="header">
		<a href="../tablero_control.jsp" ><img src="./images/regresar.png" width="50" height="50"></a>
	</div>
	<tr>
		<td> Consecutivo <td> <%= entity.getrepecodsx() %>
		<td> Fecha  <td> <%= entity.getrepefecha() %>
	<tr>
                <td>Auxiliar <td> <%= new gstempleado().getempleado(entity.getrepeempleado()).getempnombre() %>
		<td>Estado <td> <%= entity.getrepeesta() %>
	<tr>
		<td>Hora Inicio <td><%= entity.getrepehoin() %>
		<td>Hora Entrega <td> <%= entity.getrepehofi() %>&nbsp;
	</table>
<br>

<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" >
<form id="frmmain" name="frmmain" action="" method="post"  >
<input type="hidden" name="accion" id="accion" value="creardetalle">
<input type="hidden" name="mensaje" id="mensaje" value="">
<table align='center'  width='70%' border='0' cellspacing='0' cellpading='0' >

    <tr>
         <td> <input type='text' size="12" name='ped1' ></td>
         <td> <input type='text' size="12" name='ped2' ></td>
         <td> <input type='text' size="12" name='ped3' ></td>
         <td> <input type='text' size="12" name='ped4' ></td>
    </tr>
    <tr>
         <td> <input type='text' size="12" name='ped5' ></td>
         <td> <input type='text' size="12" name='ped6' ></td>
         <td> <input type='text' size="12" name='ped7' ></td>
         <td> <input type='text' size="12" name='ped8' ></td>
    </tr>
    <tr>
         <td> <input type='text' size="12" name='ped9' ></td>
         <td> <input type='text' size="12" name='ped10' ></td>
         <td> <input type='text' size="12" name='ped11' ></td>
         <td> <input type='text' size="12" name='ped12' ></td>
    </tr>
    <tr>
         <td> <input type='text' size="12" name='ped13' ></td>
         <td> <input type='text' size="12" name='ped14' ></td>
         <td> <input type='text' size="12" name='ped15' ></td>
         <td> <input type='text' size="12" name='ped16' ></td>
    </tr>
    <tr>
         <td> <input type='text' size="12" name='ped17' ></td>
         <td> <input type='text' size="12" name='ped18' ></td>
         <td> <input type='text' size="12" name='ped19' ></td>
         <td> <input type='text' size="12" name='ped20' ></td>
    </tr>

</table>
<br>
<div align="center" >
	<button id="btnguardar" type="submit" value="guardar" title='Guardar' ><img src='./images/ok.jpg' width='50' heigth='50' border='0'>Guardar</button>
</div>
</form>
</div>
</html>     
