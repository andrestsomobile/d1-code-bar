<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,pedido.control.*,pedido.entity.*,maestro.control.*,maestro.entity.compania,java.util.*"%>
<html>

<%
gstTableroControl control = new gstTableroControl();
String pag = request.getParameter("pag");
String codempleado = request.getParameter("codempleado");
String accion = request.getParameter("accion");
Collection lista = null;
if(accion != null  && accion.equals("finalizar")) {
	String rpdecodsx = request.getParameter("rpdecodsx");
	System.out.println("Se finalizará alistamiento rpdecodsx= "+rpdecodsx);
	if (rpdecodsx != null) {
		control.finalizarDetalleAlistamiento(rpdecodsx);
	}
	lista = control.pedidos_en_alistamiento(codempleado);
	if (lista.isEmpty()) {
		response.sendRedirect("../tablero_control.jsp");
	}
} else if(accion != null  && accion.equals("mostrarTodos")) {
	lista = control.pedidos_en_alistamiento("");
} else if (codempleado != null && !codempleado.equals("") && !codempleado.equals("null")) {
	lista = control.pedidos_en_alistamiento(codempleado);
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

<script src="./alistamiento.js"></script> 
<link rel="stylesheet" type="text/css" media="all" href="./metro.css">

<script>
function refrescar(campo){
	$("input[name='accion']").val('');
	window.location = window.location.pathname + '?codempleado='+campo.value;
}

function limpiardatos(){
	$("input[name='codempleado']").val(null);
	window.location = window.location.pathname;
}

$(function() {
	// manejo boton de finalizar
	botones = $('button[id="btnfinalizar"]');
	botones.each(function() {
		var boton = $(this);
		boton.unbind("click");
		boton.click(function() {
			a_rpdecodsx = boton.val();
			if (a_rpdecodsx != null) {
				$("input[name='accion']").val('finalizar');
				$('<input>').attr({ type : 'hidden', name : 'rpdecodsx' }).appendTo('#frmmain');
				$("input[name='rpdecodsx']").val(a_rpdecodsx);
				$('<input>').attr({ type : 'hidden', name : 'codempleado' }).appendTo('#frmmain');
				$("input[name='rpdecodsx']").val(a_rpdecodsx);
			}
		});
	});	
	// manejo boton de mostrar todos
	botones = $('button[id="btnTodos"]');
	botones.each(function() {
		var boton = $(this);
		boton.unbind("click");
		boton.click(function() {
			$("input[name='accion']").val('mostrarTodos');
		});
	});	
});

window.onload = function() {

	$(":input:first").focus();
	//setInterval(limpiardatos, 120000);//120 segundos
} 
</script>		
</head>
<body>
<form id="frmmain" name="frmmain" action="" method="post"  >
	<input type="hidden" name="accion" id="accion" value="">
	<br>
	<div class="titulo"> <h1 align="center">FINALIZAR PEDIDOS EN ALISTAMIENTO </h1></div> 


	<div align="right" class="header">
		<a href="../tablero_control.jsp" title="FINALIZAR TODO"><img src="./images/ok.jpg" width="50" height="50"></a>
		<a href="../tablero_control.jsp" title="Volver al Tablero de Control"><img src="./images/regresar.png" width="50" height="50"></a>
<!-- 		<button id="btnTodos" type="submit" value="mostrarTodos" title='Mostrar Todos' ></button> -->
	</div>
	
	
	<br>
	<div align="center" class="header">
	<!-- Grid filter -->
		<label for="codempleado">Empleado :</label> <input type="text" id="codempleado" name='codempleado' value='<%=codempleado != null && !codempleado.equals("null")?codempleado:""%>' onchange="refrescar(this)" /> 
		
<!-- 		<button id="btnsalir" value="SALIR" title='SALIR'> <img src='./images/salir.jpg' width='30' heigth='30' border='0' onclick="limpiardatos()"></button>  -->

<!-- 		<input type="hidden" id="filter" value="" />  -->
	</div> 
	
	<br>



	<div id="tablecontent">
	 
	 <table id="htmlgrid" class="testgrid" align='center' width='90%'	border='1' cellspacing='2' cellpading='0' >
	
 		<tr>			
 			<th>Sx</th>
 			<th>PEDIDO</th>
 			<th>EMPLEADO BODEGA</th>	
 			<th>FECHA ALISTAMIENTO</th>
 			<th>FECHA PEDIDO</th>	
 			<th align="center">FINALIZAR<BR> ALISTAMIENTO</th>			
 		</tr>	

 		<%if (lista != null) {
			Iterator it = lista.iterator();
			while (it.hasNext()) {
				Collection datos = (Collection) it.next();
				Iterator det = datos.iterator(); 
				String rpdecodsx = (String) det.next();
				String pednumpedido = (String) det.next();
				String empnombre = (String) det.next();
				String repefecha = (String) det.next();
				String pedfechasistema = (String) det.next();
			 %>
            <tr align='center'> 
				<td nowrap="nowrap"> <%= rpdecodsx %> </td>
				<td nowrap="nowrap"> <%= pednumpedido %> </td>
				<td nowrap="nowrap"> <%= empnombre %> </td>
				<td nowrap="nowrap"> <%= repefecha %> </td>
				<td nowrap="nowrap"> <%= pedfechasistema %> </td>
				<td nowrap="nowrap"><button id="btnfinalizar" type="submit" value="<%=rpdecodsx%>" title='Finalizar Alistamiento' ><img src='./images/ok.jpg' width='50' heigth='50' border='0'></button> </td>
			</tr>
            <%}%>
     	<%}%>

	</table> 
	</div>

</form> 
</body>
</html>