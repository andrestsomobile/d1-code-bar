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
	//lista = control.tab_control_resumen();

%>
<script src="./jquery.min.js"></script>
<script src="./jquery.plugins.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() {
//       var data = google.visualization.arrayToDataTable([
//         ["Item", "Cantidad", { role: "style" } ],
//         ["Despachos En Tramite",2, "#FFA500"],
//         ["Despachos Finalizados",6, "#7FFF00"],
//         ["Pedidos Despachados",5, "#2E8B57"],
//         ["Pedidos En Tramite",0, "#DC143C"],
//         ["Pedidos Finalizados",45, "#8B4513"],
//         ["Pedidos en Alistamiento",11, "#F4A460"]
//       ]);
      

      var jsonData = $.ajax({ url: "./tabcontrol/resumen.json", dataType: "json",async: false,  }).responseText;
      var data = new google.visualization.DataTable(jsonData); 
      
//       $.getJSON('resumen.json', function(obj) {

//           var data = google.visualization.arrayToDataTable(obj);
//           console.log(data);
//           var options = {
//                   title: 'Chart Demo',width: 400, height: 240
//               };

//               var chart = new google.visualization.BarChart(document.getElementById('barchart_values'));
//               chart.draw(data, options);
//           });
        
     var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
     chart.draw(data, {width: 400, height: 240});
      
//       var view = new google.visualization.DataView(data);
//       view.setColumns([0, 1,
//                        { calc: "stringify",
//                          sourceColumn: 1,
//                          type: "string",
//                          role: "annotation" },
//                        2]);

//       var options = {
//         title: "Vista general del proceso",
//         width: 900,
//         height: 200,
//         bar: {groupWidth: "95%"},
//         legend: { position: "none" },
//       };
//       var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
//       chart.draw(view, options);
  }
  </script>
<div id="barchart_values" style="width: 400px; height: 240px;"></div>