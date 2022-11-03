<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,pedido.control.*,pedido.entity.*,maestro.control.*,maestro.entity.compania,java.util.*,db.beanConnector,java.sql.SQLException"%>
<html>

<%
gstTableroControl control = new gstTableroControl();
String pag = request.getParameter("pag");
String accion = request.getParameter("accion");
if(accion != null  && accion.equals("asociar")) {	
	String placa = request.getParameter("placa");
	String bultos = request.getParameter("bultos");
	String pedcodsx = request.getParameter("pedcodsx");
	System.out.println("despacho " + placa + " - bultos " + bultos + " pedcodsx "+ pedcodsx);
	boolean resp = true;
	beanConnector db = new beanConnector(false);
	try {
		gestionSaldos gstsaldo = new gestionSaldos();
		resp &= gstsaldo.respaldarDespachoByPedidoCompleto(placa,pedcodsx, db, bultos, "0");
		//mensaje = "despacho_pedido Creado con Exito";
	} catch (SQLException e) {
		e.printStackTrace();
		//mensaje = "No se pudo Crear el despacho_pedido: <br> " + e.getLocalizedMessage();
		resp = false;
	}
	if (resp)
		db.commit();
	else
		db.rollback();
	db = null;
} else if(accion != null  && accion.equals("asociar")) {	
	String numpedido = request.getParameter("numpedido");
}
Collection lista = control.pedidos_listos_cargue();
%>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="refresh" content="60"> 
<script src="../../../disenno/editablegrid/editablegrid-2.0.1.js"></script>
<link rel="stylesheet" href="../../../disenno/editablegrid/editablegrid-2.0.1.css" type="text/css" media="screen">

<!-- include javascript and css files for jQuery, needed for the datepicker and autocomplete extensions -->
<script src="../../../disenno/editablegrid/extensions/jquery/jquery-1.6.4.min.js"></script>
<script src="../../../disenno/editablegrid/extensions/jquery/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" href="../../../disenno/editablegrid/extensions/jquery/jquery-ui-1.8.16.custom.css" type="text/css" media="screen">

<!-- include javascript and css files for the autocomplete extension -->
<script src="../../../disenno/editablegrid/extensions/autocomplete/autocomplete.js"></script>
<link rel="stylesheet"	href="../../../disenno/editablegrid/extensions/autocomplete/autocomplete.css" type="text/css" media="screen">

<script src="carga.js"></script> 
<link rel="stylesheet" type="text/css" media="all" href="./metro.css">

<script>
window.onload = function() {
	editableGridCarga = new EditableGrid("PedidosCarga", {
		enableSort: false, // true is the default, set it to false if you don't want sorting to be enabled
		editmode: "static", // change this to "fixed" to test out editorzone, and to "static" to get the old-school mode
		editorzoneid: "", // will be used only if editmode is set to "fixed"
		allowSimultaneousEdition: true,
		pageSize: 50
	});

	// we build and load the metadata in Javascript
	editableGridCarga.load({ metadata: [
		{ name: "nomcia", datatype: "string", editable: false },
		{ name: "pedido", datatype: "string", editable: false },
		{ name: "guia", datatype: "string", editable: false },
		{ name: "empleado", datatype: "string", editable: false },
		{ name: "fecha_alistamiento", datatype: "string", editable: false },
		{ name: "fecha_pedido", datatype: "string", editable: false },
		{ name: "placa", datatype: "html", editable: false },
		{ name: "bultos", datatype: "html", editable: false }

	]});

	// then we attach to the HTML table and render it
	editableGridCarga.attachToHTMLTable('htmlgrid');
	editableGridCarga.renderGrid();
	editableGridCarga.initializeGrid();
} 

function buscarValor(clave,valor){
	var x;
	var filtro = "input[name='" + clave + valor + "']";
	x = $(filtro);
	return x;
}
function setPlaca(campo,codsx){
	var filtro = "input[name='placa_" + codsx + "']";
	$(filtro).val(campo.value);//alert('setie ' + campo.value);
}
function validarPedido(valor){
	$("input[name='accion']").val('validar');
	$('<input>').attr({ type : 'hidden', name : 'numpedido' }).appendTo('#frmmain');
	$("input[name='numpedido']").val(valor);
}
$(function() {
	// manejo boton de finalizar
	botones = $('button[id="btnasociar"]');
	botones.each(function() {
		var boton = $(this);
		boton.unbind("click");
		boton.click(function() {
			a_rpdecodsx = boton.val();
			if (a_rpdecodsx != null) {
				$("input[name='accion']").val('asociar');
				var placa = buscarValor('placa_',a_rpdecodsx);
				var pedido = buscarValor('pedcodsx_',a_rpdecodsx);
				var bultos = buscarValor('bultos_',a_rpdecodsx); 
				$('<input>').attr({ type : 'hidden', name : 'placa' }).appendTo('#frmmain');
				$("input[name='placa']").val(placa.val());
				$('<input>').attr({ type : 'hidden', name : 'pedcodsx' }).appendTo('#frmmain');
				$("input[name='pedcodsx']").val(pedido.val());
				$('<input>').attr({ type : 'hidden', name : 'bultos' }).appendTo('#frmmain');
				$("input[name='bultos']").val(bultos.val());
			}
			//alert("asociar pedido " + pedido.val() + " despacho " + placa.val() + " bultos " + bultos.val());
		});
	});			
});
</script>		

</head>
<body>
<form id="frmmain" name="frmmain" action="" method="post"  >
<input type="hidden" name="accion" id="accion" value="">
	<br>
	<div class="titulo"> <h1 align="center">PEDIDOS ALISTADOS PARA CARGUE </h1></div> 

	<div align="right" class="header"><a href="../tablero_control.jsp" ><img src="./images/regresar.png" width="50" height="50"></a> </div>
	
	<br>
	
	<div align="center">
		<table border="0" cellpadding="0" cellspacing="0" style="font-size:8pt"> 
			<tr><td>
				<SCRIPT language="JavaScript" type="text/javascript"><!-- 
				function addZero(i) { if (i < 10) {i = "0" + i; } return i;}
				var hoy=new Date(document.lastModified); 
				document.write("Ultima Actualizacion " + addZero(hoy.getHours())  +":" + addZero(hoy.getMinutes()) + ":" + addZero(hoy.getSeconds())); 
				// --> 
				</SCRIPT> 
			</td></tr> 
		</table> 
	</div>
	<br>

	
	<div align="center" class="header">
	<!-- Grid filter -->
		<label for="filter">Buscar Pedido :</label> 

		<input type="text" id="filter" value="" onblur="validarPedido(this.value)"/> 
	</div> 
	
	<br>
	<!--  Number of rows per page and bars in chart -->
	<div id="pagecontrol">
		<label for="pagecontrol">Registros por Pagina: </label> <select
			id="pagesize" name="pagesize">
			<option value="50">50</option>
			<option value="100">100</option>
			<option value="1000000000">Todos</option>
		</select>
	</div>
	
	<!-- Paginator control -->
	<div id="paginator"></div>
	
	<!-- Edition zone (to demonstrate the "fixed" editor mode) -->
	<div id="edition"></div>

	<div id="tablecontent">
	 
	 <table id="htmlgrid" class="testgrid" align='center' width='90%'	border='1' cellspacing='2' cellpading='0' >
	
 		<tr>			
 			<th>COMPAÑIA</th>
 			<th>PEDIDO</th>
 			<th>GUIA</th>
 			<th>EMPLEADO BODEGA</th>	
 			<th>FECHA ALISTAMIENTO</th>
 			<th>FECHA PEDIDO</th>
 			<th>PLACA CAMION</th>	
 			<th>BULTOS</th>
 			<th align="center">Asociar al Despacho</th>			
 		</tr>	

 		<%if (lista != null) {
			Iterator it = lista.iterator();
			while (it.hasNext()) {
				Collection datos = (Collection) it.next();
				Iterator det = datos.iterator(); 
				String codcia = (String) det.next();
				String nomcia = (String) det.next();
				String rpdecodsx = (String) det.next();
				String pednumpedido = (String) det.next();
				String pedguia = (String) det.next();
				String empnombre = (String) det.next();
				String repefecha = (String) det.next();
				String pedfechasistema = (String) det.next();
				String pedcodsx = (String) det.next();
			 %>
            <tr align='center'> 
				<td nowrap="nowrap"> <%= nomcia %> </td>
				<td nowrap="nowrap"> <%= pednumpedido %> </td>
				<td nowrap="nowrap"> <%= pedguia %> </td>
				<td nowrap="nowrap"> <%= empnombre %> </td>
				<td nowrap="nowrap"> <%= repefecha %> </td>
				<td nowrap="nowrap"> <%= pedfechasistema %> </td>
				<td nowrap="nowrap"> 
					<input type='hidden' name='placa_<%=rpdecodsx%>' >
					<input type='hidden' name='pedcodsx_<%=rpdecodsx%>'  value="<%=pedcodsx%>">
					<select name="lstplaca_<%=rpdecodsx%>" onchange="setPlaca(this,'<%=rpdecodsx%>')">
						<%
						Collection lstplacas = control.lista_placas(codcia);
						if (lstplacas.isEmpty()) {
						%>
						<option value="0" selected="selected">No hay Placas Registradas para Despacho</option>
						<%
						} else {
							%>
							<option value="0" selected="selected">Seleccione Placa..</option>
							<%							
							Iterator ite=lstplacas.iterator();
							while(ite.hasNext()){ 
								ArrayList registros=(ArrayList)ite.next();
								Iterator iteradoRegistro=registros.iterator();
								String despcodsx = (String)iteradoRegistro.next();
								String placa = (String)iteradoRegistro.next();
						%>
						<option value="<%=despcodsx%>"><%=placa%></option>
						
						<%	}
						}%>
					</select>	
								
				</td>
				<td nowrap="nowrap"> <input type='text' name='bultos_<%=rpdecodsx%>'> </td>
				<td nowrap="nowrap"><button id="btnasociar" type="submit" value="<%=rpdecodsx%>" title='Asociar al Despacho' ><img src='./images/carga_ok.jpg' width='50'  height='50' border='0'></button> </td>
			</tr>
            <%}%>
     	<%}%>

	</table> 
	</div>

  <!-- Feedback message zone -->
  <div id="message"></div>
</form> 
</body>
</html> 