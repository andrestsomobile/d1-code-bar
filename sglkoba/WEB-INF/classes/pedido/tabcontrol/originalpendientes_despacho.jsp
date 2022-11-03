<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,pedido.control.*,pedido.entity.*,maestro.control.*,maestro.entity.compania,java.util.*"%>
<html>

<%
	gstTableroControl control = new gstTableroControl();
	Collection lista = null;
	lista = control.originalpendientes_despacho();
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
<link rel="stylesheet"	href="../../../disenno/editablegrid/extensions/autocomplete/autocomplete.css"	type="text/css" media="screen">

<script src="pendientes_despacho.js"></script> 
<link rel="stylesheet" type="text/css" media="all" href="./metro.css">

<script>
			window.onload = function() {
				editableGridPD = new EditableGrid("PendientesDespacho", {
					enableSort: false, // true is the default, set it to false if you don't want sorting to be enabled
					editmode: "static", // change this to "fixed" to test out editorzone, and to "static" to get the old-school mode
					editorzoneid: "", // will be used only if editmode is set to "fixed"
					allowSimultaneousEdition: true,
					pageSize: 20
				});

				// we build and load the metadata in Javascript
				editableGridPD.load({ metadata: [
					{ name: "fecha", datatype: "string", editable: false },
					{ name: "pedido", datatype: "string", editable: false },
					{ name: "guia", datatype: "string", editable: false },
					{ name: "factura", datatype: "string", editable: false },
					{ name: "cliente", datatype: "string", editable: false },
					{ name: "ciudad", datatype: "string", editable: false },
					{ name: "transportadora", datatype: "string", editable: false },
					{ name: "observaciones", datatype: "string", editable: false}
					
				]});

				// then we attach to the HTML table and render it
				editableGridPD.attachToHTMLTable('htmlgrid');
				editableGridPD.renderGrid();
				editableGridPD.initializeGrid();
			} 
			
</script>		
</head>
<body>
	<br>
	<div class="titulo"> <h1 align="center">PEDIDOS PARA DESPACHO </h1></div> 
	<br>
	
	<div align="right" class="header"><a href="../tablero_control.jsp" ><img src="./images/regresar.png" width="50" height="50"></a> </div>
	
	<br>
	<div align="center" class="header">
		<!-- Grid filter -->
		<label for="filter">Buscar Pedido :</label> 
		<input type="text" id="filter" value="" /> 
	</div> 
	
	<!--  Number of rows per page and bars in chart -->
	<div id="pagecontrol">
		<label for="pagecontrol">Registros por Pagina: </label> <select
			id="pagesize" name="pagesize">
			<option value="20">20</option>
			<option value="100">100</option>
			<option value="1000000000">Todos</option>
		</select>
	</div>
	<br>
	
	<!-- Paginator control -->
	<div id="paginator"></div>

	
	<!-- Edition zone (to demonstrate the "fixed" editor mode) -->
	<div id="edition"></div>
	
	<div id="tablecontent">
	 
	 <table id="htmlgrid" class="testgrid" align='center' width='90%' border='1' cellspacing='2' cellpading='0' >
 		<tr>
 			<th>FECHA</th>	
 			<th>PEDIDO</th>
 			<th>GUIA</th>	
 			<th>FACTURA</th>
 			<th>CLIENTE</th>			
 			<th>CIUDAD</th>
 			<th>TRANSPORTADORA</th>		
 			<th>OBSERVACIONES</th>	
 			
 		</tr>	

 		<% 
			Iterator it = lista.iterator();
			while (it.hasNext()) { %>
				<tr align='center'> <%
				Collection datos = (Collection) it.next();
				Iterator det = datos.iterator();

				while (det.hasNext()) {
					String valor = (String) det.next(); %>
					<td> <%= valor %> </td>
              <%}%>
				</tr>
			<%}%>
			

	</table> 
  </div>

  <!-- Feedback message zone -->
  <div id="message"></div>

</body>
</html>