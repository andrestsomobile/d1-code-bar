<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
  google.load("visualization", '1.1', {packages:['corechart']});
  google.setOnLoadCallback(drawChart);
  function drawChart() {

    
    var oldData = google.visualization.arrayToDataTable([
	  ['Transportadora', 'Unidades'],                                                  
	  ['SAFERBO',4334.00], 
	  ['PENDIENTE',1293.00], 
	  ['MASTER TRANS',88.00]]);


    var newData = google.visualization.arrayToDataTable([
		['Transportadora', 'Unidades'],                                                  
		['SAFERBO',582.858648], 
		['PENDIENTE',407.991802], 
		['MASTER TRANS',0.160000]]);
    
    
    var cliData = google.visualization.arrayToDataTable([
     ['Cliente', 'Unidades'],  
     ['SODIMAC COLOMBIA S A ',742.00],
    ['INDUSTRIA COLOMBIANA DE CAFE S.A.S',90.00],
    ['GRANDES SUPERFICIES DE COLOMBIA CARREFOUR',1144.00],
    ['COMERCIALIZA S.A.',3300.00],
    ['C.I. SPORTNET S.A.S',86.00],
    ['ALMACENES EXITO, S A ',253.00],
    ['ALLMARK COMERCIAL - BOGOTA',100.00]]);


    var optionsB = {title: 'Unidades por Transportadora',is3D: true};
	var optionsA = {title: 'KiloVolumen por Transportadora',is3D: true};
	var optionsCli = {title: 'Unidades por Cliente',is3D: true};

    var chartBefore = new google.visualization.PieChart(document.getElementById('piechart_before'));
    var chartAfter = new google.visualization.PieChart(document.getElementById('piechart_after'));
    var chartCli = new google.visualization.PieChart(document.getElementById('piechart_cli'));
    

    chartBefore.draw(oldData, optionsB);
    chartAfter.draw(newData, optionsA);
    chartCli.draw(cliData, optionsCli);
   
  }
</script>

 <div id="piechart_before" style="width: 650px; height: 300px;"></div>
<div id='piechart_after' style='width: 650px;  height: 300px;'></div>
<div id='piechart_cli' style='width: 650px;  height: 300px;'></div>