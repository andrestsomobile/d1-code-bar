<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,pedido.control.*,pedido.entity.*,maestro.control.*,maestro.entity.compania,java.util.*"%>
<html>

<%
	gstTableroControl control = new gstTableroControl();
	String accion = request.getParameter("accion");
	if(accion != null  && accion.equals("fijarcapacidad")) {	
		String placa = request.getParameter("placa");
		String capacidad = request.getParameter("valorcapacidad");
		control.actualiza_vehiculo(placa, capacidad);
	}
	Collection lista = null;
	lista = control.lista_despachos_kv();

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

<script src="despachos.js"></script> 
<link rel="stylesheet" type="text/css" media="all" href="./metro.css">

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
function buscarValor(clave,valor){
	var x;
	var filtro = "input[name='" + clave + valor + "']";
	x = $(filtro);
	return x;
}
window.onload = function() {
	editableGridD = new EditableGrid("Despacho", {
		enableSort: false, // true is the default, set it to false if you don't want sorting to be enabled
		editmode: "static", // change this to "fixed" to test out editorzone, and to "static" to get the old-school mode
		editorzoneid: "", // will be used only if editmode is set to "fixed"
		allowSimultaneousEdition: false,
		pageSize: 10
	});

	// we build and load the metadata in Javascript
	editableGridD.load({ metadata: [
		{ name: "gauge", datatype: "html", editable: false },
		{ name: "despacho", datatype: "string", editable: false },
		{ name: "placa", datatype: "html", editable: false },
		{ name: "conductor", datatype: "string", editable: false },
		{ name: "transportadora", datatype: "string", editable: false },
		{ name: "estado", datatype: "string", editable: false },
		{ name: "valordeclarado", datatype: "numeric", editable: false },
		{ name: "pesobruto", datatype: "string", editable: false },
		{ name: "bultos", datatype: "string", editable: false},
		{ name: "kilovolumen", datatype: "string", editable: false}					
	]});

	// then we attach to the HTML table and render it
	editableGridD.attachToHTMLTable('htmlgrid');
	editableGridD.renderGrid();
	editableGridD.initializeGrid();
	//carga_gauge();
} 

//function carga_gauge() { //alert('voy a pintar');
	google.load("visualization", "1", {packages:["gauge"]});
	google.setOnLoadCallback(drawChart);
///}
function drawChart() {
	grafico = $('[id^=chart_div]');
	grafico.each(function() {
		var chart = new google.visualization.Gauge(this);
		var codsx = $(this).attr("title");
		var placa = buscarValor('placa_',codsx);
		var kv_cargado = buscarValor('kv_cargado_',codsx); 
		var data = new google.visualization.DataTable({cols: [ {id: 'Placa', label: 'Placa', type: 'string'},{id: 'Kv', label: 'KV', type: 'number'} ],
					rows: [ {c:[{v: placa.val()}, {v: kv_cargado.val()}]} ] });
		var options = {width : 150,height : 75, redFrom : 90, redTo : 100, yellowFrom : 70, yellowTo : 90, minorTicks : 5};		   
		chart.draw(data, options);
	});
}
    
function valorcapacidad(placa,actual) { 
	s=prompt('Digite Capacidad KV del camion '+ placa,actual);
	if (s != null) {
	  window.location='./despachos.jsp?accion=fijarcapacidad&placa='+placa+'&valorcapacidad='+ s;
	}
}
</script>		

</head>
<body>
	<br>
	<div class="titulo"> <h1 align="center">RESUMEN DE DESPACHOS DEL DIA</h1></div> 
	<br>
	
	<div align="right" class="header">
		<a href="../tablero_control.jsp" ><img src="./images/regresar.png" width="50" height="50"></a>
	</div>


	<br>
	
	<div align="center">
		<table border="0" cellpadding="0" cellspacing="0" style="font-size:8pt"> 
			<tr><td> 
				<SCRIPT language="JavaScript" type="text/javascript"><!-- 
				function addZero(i) { if (i < 10) {i = "0" + i; } return i;}
				var hoy=new Date(document.lastModified); 
				document.write("Ultima Actualizacion " +addZero(hoy.getHours())+":"+addZero(hoy.getMinutes())+":"+addZero(hoy.getSeconds())); 
				// --> 
				</SCRIPT> 
			</td></tr> 
		</table> 
	</div>
	<br>
		
	<!--  Number of rows per page and bars in chart -->
	<div id="pagecontrol">
		<label for="pagecontrol">Registros por Pagina: </label> <select
			id="pagesize" name="pagesize">
			<option value="10">10</option>
			<option value="500">500</option>
			<option value="10000000">Todos</option>
		</select>
	</div>
	<br>
	
	<!-- Grid filter -->
	<label for="filter">Filtrar :</label> <input type="text" id="filter" value="" /> 
	
	<!-- Paginator control -->
	<div id="paginator"></div>

	<div id="tablecontent">
	 
	 <table id="htmlgrid" class="testgrid" align='center' width='90%'
				border='1' cellspacing='2' cellpading='0' >
 		<tr>
 			<th>CAPACIDAD</th>
 			<th>DESPACHO</th>	
 			<th>PLACA</th> 			
 			<th>CONDUCTOR</th>	
 			<th>TRANSPORTADORA</th>
 			<th>ESTADO</th>			
 			<th>VALOR DECLARADO</th>
 			<th>PESO BRUTO</th>		
 			<th>BULTOS</th>	
 			<th>KILO VOLUMEN</th>	
 		</tr>	

 		<% 
			Iterator it = lista.iterator();		
			while (it.hasNext()) { %>
				<tr align='center'> <%
					Collection datos = (Collection) it.next();
					Iterator det = datos.iterator();
					%>
					
					<%
					while (det.hasNext()) {
						String despcodsx = (String) det.next();
						String placa = (String) det.next();
						String conductor = (String) det.next();
						String transp = (String) det.next();
						String estado = (String) det.next();
						String valordec = (String) det.next();
						String pesobruto = (String) det.next();
						String bultos = (String) det.next();
						String kilovol = (String) det.next();
						String kv_cargado = (String) det.next();
						String kv_total = (String) det.next();
					%>
					<td style='font-size: 9px;'>Capacidad: <%=kv_total%> Kv<br>Cargado:<%=kv_cargado%>%<br><div id='chart_div_<%=despcodsx%>' title='<%=despcodsx%>' style='width: 150px; height: 75px;'></div></td>
					<td nowrap="nowrap"><%=despcodsx%> </td>
					<td nowrap="nowrap"><%=placa%> <br>
						<form name='myform_<%=despcodsx%>'>
						 	<a href="javascript:valorcapacidad('<%=placa%>',<%=kv_total%>)"> <img src="../../../disenno/images/update.gif" border="0" title='Actualizar Capacidad KV de Camion'></a>
  							
 						</form>
					</td>
					<td><%=conductor%> </td>
					<td><%=transp%> </td>
					<td nowrap="nowrap"><%=estado%> </td>
					<td nowrap="nowrap"><%=valordec%> </td>
             		<td nowrap="nowrap"><%=pesobruto%> </td>
             		<td nowrap="nowrap"><%=bultos%> </td>
             		<td nowrap="nowrap"><%=kilovol%> </td>
	              	<input type='hidden' name='placa_<%=despcodsx%>' value='<%=placa%>' >
	              	<input type='hidden' name='kv_cargado_<%=despcodsx%>' value='<%=kv_cargado%>'>
	              <%}%>
				</tr>
			<%}%>
			

</table> 
  </div>

  <!-- Feedback message zone -->
  <div id="message"></div>
<!-- </form>  -->
</body>
</html>