<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,pedido.control.*,pedido.entity.*,maestro.control.*,maestro.entity.compania,java.util.*,java.text.SimpleDateFormat,registro.control.*"%>
<html>

<%
gstTableroControl control = new gstTableroControl();
gstregistro_pedido gregped = new gstregistro_pedido();
String pag = request.getParameter("pag");
String codempleado = request.getParameter("codempleado");
String accion = request.getParameter("accion");
if (codempleado != null && !codempleado.equals("") && !codempleado.equals("null") && accion.equals("crear")) {
	if(!gregped.ValidarEmpleado(codempleado).equals("FALLO")) {
		String Ident = gregped.Empleado_by_cedula(codempleado);
		int repecodsx = control.crea_registro_pedido(Ident);
		if (repecodsx >0) {
			response.sendRedirect("./registro_pedidos_detalle.jsp?repecodsx="+repecodsx+"&codsxempleado="+Ident);
		}
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


<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" >
<BR>

<form id="frmmain" name="frmmain" action="" method="post"  >
	<input type="hidden" name="accion" id="accion" value="crear">
	<br>
	<div class="titulo"> <h1 align="center">REGISTRO DE PEDIDOS PARA ALISTAMIENTO </h1></div> 


	<div align="right" class="header">
		<a href="../tablero_control.jsp" ><img src="./images/regresar.png" width="50" height="50"></a>
	</div>
	
	
	<br>
	<div align="center" class="header">
	<!-- Grid filter -->
		<label for="codempleado">Empleado :</label> <input type="text" id="codempleado" name='codempleado' value="" /> 
		
<!-- 		<button id="btnsalir" value="SALIR" title='SALIR'> <img src='./images/salir.jpg' width='30' heigth='30' border='0' onclick="limpiardatos()"></button>  -->

		<input type="hidden" id="filter" value="" /> 
	</div> 
	
	<br>

</form> 

</div>
</body>
</html>