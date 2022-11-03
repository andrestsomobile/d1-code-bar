<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,pedido.control.*,pedido.entity.*,maestro.control.*,maestro.entity.compania,java.util.*"%>
<html>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
    gstpedido control = new gstpedido();
	String pag = request.getParameter("pag");
	Collection lista = null;
	lista = control.pendientes_despacho_ind_transportadora();

%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="disenno/editablegrid/editablegrid-2.0.1.js"></script>
<link rel="stylesheet" href="disenno/editablegrid/editablegrid-2.0.1.css" type="text/css" media="screen">

<!-- include javascript and css files for jQuery, needed for the datepicker and autocomplete extensions -->
<script src="disenno/editablegrid/extensions/jquery/jquery-1.6.4.min.js"></script>
<script src="disenno/editablegrid/extensions/jquery/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" href="disenno/editablegrid/extensions/jquery/jquery-ui-1.8.16.custom.css" type="text/css" media="screen">

<!-- include javascript and css files for the autocomplete extension -->
<script src="disenno/editablegrid/extensions/autocomplete/autocomplete.js"></script>
<link rel="stylesheet"	href="disenno/editablegrid/extensions/autocomplete/autocomplete.css"	type="text/css" media="screen">

<script src="./files/pedido/pendientes_despacho_ind_transportadora.js"></script> 
<link rel="stylesheet" type="text/css" href="disenno/editablegrid/demo.css"	media="screen" />

<style>
body {
	font-family: 'lucida grande', tahoma, verdana, arial, sans-serif;
	font-size: 11px;
}

h1 {
	font-size: 15px;
}

a {
	color: #548dc4;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

table.testgrid {
	border-collapse: collapse;
	border: 1px solid #CCB;
	width: 800px;
}

table.testgrid td,table.testgrid th {
	padding: 5px;
	border: 1px solid #E0E0E0;
}

table.testgrid th {
	background: #E5E5E5;
	text-align: left;
}

input.invalid {
	background: red;
	color: #FDFDFD;
}
</style>

<script>
			window.onload = function() {
				editableGridPD = new EditableGrid("PendientesDespacho", {
					enableSort: true, // true is the default, set it to false if you don't want sorting to be enabled
					editmode: "static", // change this to "fixed" to test out editorzone, and to "static" to get the old-school mode
					editorzoneid: "", // will be used only if editmode is set to "fixed"
					allowSimultaneousEdition: false,
					pageSize: 1000000
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

	<div class="titulo"> PEDIDOS PARA DESPACHO - INDICADOR POR TRANSPORTADORA</div> 

	
	<!-- Grid filter -->
	<label for="filter">Filtrar :</label> <input type="text" id="filter" value="" /> 

	<div id="tablecontent">
	 
	 <table id="htmlgrid" class="testgrid" align='center' width='100%'
				border='1' cellspacing='2' cellpading='0' >
	

 		<tr>
 			<th>TRANSPORTADORA</th>	
 			<th>UD</th>
 			<th>MP</th>	
 			<th>KV</th>
 			<th>VR</th>			
			
 		</tr>	

 		<% 
			Iterator it = lista.iterator();
			while (it.hasNext()) { %>
				<tr align='center'> <%
				Collection datos = (Collection) it.next();
				Iterator det = datos.iterator();
				while (det.hasNext()) {
					String valor = (String) det.next(); %>
					<td nowrap="nowrap"> <%= valor %> </td>
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