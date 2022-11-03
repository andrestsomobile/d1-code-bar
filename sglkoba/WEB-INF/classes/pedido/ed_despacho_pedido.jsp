<%@page import="util.Fecha"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,pedido.control.*,pedido.entity.*, pedido.form.*,java.util.*"%>
<html>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
	String cia = request.getParameter("cia");
	String despcodsx = request.getParameter("despcodsx");
	String transp = request.getParameter("transp");
	gstpedido control = new gstpedido();
	control.setMaxfilas(1000000);
	String pag = request.getParameter("pag");
	Collection lista = control.getlistapedido_despachar(cia,despcodsx,transp,null,null);
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="/sgljde/disenno/editablegrid/editablegrid-2.0.1.js"></script>
<link rel="stylesheet" href="/sgljde/disenno/editablegrid/editablegrid-2.0.1.css"	type="text/css" media="screen">

<!-- include javascript and css files for jQuery, needed for the datepicker and autocomplete extensions -->
<script src="/sgljde/disenno/editablegrid/extensions/jquery/jquery-1.6.4.min.js"></script>
<script src="/sgljde/disenno/editablegrid/extensions/jquery/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" href="/sgljde/disenno/editablegrid/extensions/jquery/jquery-ui-1.8.16.custom.css" type="text/css" media="screen">

<!-- include javascript and css files for the autocomplete extension -->
<script src="/sgljde/disenno/editablegrid/extensions/autocomplete/autocomplete.js"></script>
<link rel="stylesheet"	href="/sgljde/disenno/editablegrid/extensions/autocomplete/autocomplete.css"	type="text/css" media="screen">

<script src="ed_despacho_pedido.js"></script> 
<link rel="stylesheet" type="text/css" href="../../disenno/editablegrid/demo.css" media="screen" />

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
				datosPedido = new EditableGrid("DatosPedido", {
					enableSort: true, // true is the default, set it to false if you don't want sorting to be enabled
					editmode: "static", // change this to "fixed" to test out editorzone, and to "static" to get the old-school mode
					editorzoneid: "", // will be used only if editmode is set to "fixed"
					allowSimultaneousEdition: false,
					pageSize: 50
				});
				// we build and load the metadata in Javascript
				datosPedido.load({ metadata: [
					{ name: "codsx", datatype: "string", editable: false},
					{ name: "guia", datatype: "string", editable: false},
					{ name: "pedido", datatype: "string", editable: false},
					{ name: "action", datatype: "html", editable: false}
				]});

				// then we attach to the HTML table and render it
				datosPedido.attachToHTMLTable('htmlgrid');
				datosPedido.renderGrid();
				datosPedido.initializeGrid();

			} 
			
	
			$(window).unload( function () {window.opener.location.reload(true);  } );
		</script>
		

</head>
<body>
<html:form action="despacho_pedidoAction.do?app=pedido&modulo=ed_despacho_pedido" method="post">  

	<div class="titulo">  <h2> Gestion de Pedidos en el Despacho </h2> </div> <h3>Los pedidos se agregaran al Despacho <%=despcodsx%></h3>
	
	<div id="wrap" >
	
		<!-- Paginator control -->
		<div id="paginator"></div>
			
		<!--  Number of rows per page and bars in chart -->
		<div id="pagecontrol" align="center">
			<label for="pagecontrol">Registros por Pagina: </label> 
			<select
				id="pagesize" name="pagesize">
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="500">500</option>
				<option value="1000">1000</option>
				<option value="5000">5000</option>
				<option value="500000">Todos</option>
			</select>

		</div>

		<!-- Edition zone (to demonstrate the "fixed" editor mode) -->
        <!-- <div id="edition"></div> -->
		
		<!-- Grid contents -->
		<div id="tablecontent">

			<table id="htmlgrid" class="testgrid tabla_listas" align='center' width='90%' border='0' cellspacing='0' cellpading='0'>
				<input type='hidden' name='cia' value='<%=cia%>'/>
				<input type='hidden' name='despcodsx' value='<%=despcodsx%>'/>
				<input type='hidden' name='transp' value='<%=transp%>'/>
				<tr>
					<th align='center'>CONSECUTIVO</th>
					<th align='center'>GUIA</th>
					<th align='center'>No PEDIDO</th>
					<th align='center'>Opcion</th>
				</tr>
				<% 
					Iterator it_det = lista.iterator();
					while (it_det.hasNext()) {
						pedido _ped = (pedido)it_det.next();
						String codsx = _ped.getpedcodsx();
						String guia = _ped.getpedguia();
						String pedido = _ped.getpednumpedido();
				%>
				
				<tr align='center' id="R<%=codsx%>">
					<td align='center'><%=codsx%></td>
					<td align='center'><%=guia%></td>
					<td align='center'><%=pedido%></td>
					<td align='center'></td>

				</tr>
				<%
					}
				%>
			</table>
			
			

		</div>

		<!-- Feedback message zone -->
		<div id="message"></div>

		
	</div>
</html:form>
</body>
</html>