<html>
	<head>

        <title>SGL :: Sistema de Gestion Logistico -- KOBA Colombia S.A.S</title>
        <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<!--<link href="./disenno/templates/Movil/styles.css" rel="stylesheet" type="text/css"> -->

        <script src="./jQuery/jQuery-2.1.4.min.js"></script>
        <script src="./bootstrap/js/bootstrap.min.js"></script>
        		
		<script> 
		$(function(){
		  $("#header").load("./disenno/templates/Movil/header.jsp"); 
		  $("#footer").load("./disenno/templates/Movil/footer.html"); 
		});
		</script> 
		
		<link rel="stylesheet" href="./datatables/jquery.dataTables.css">
		<link rel="stylesheet" href="./datatables/extensions/Buttons/buttons.dataTables.min.css">
		
		

	</head>
	
	<body>
		<div id="header"></div>
		<!--Remaining section-->
		<div class="container">
			<div class="titulo">Reubicar por Cantidad</div>
			<br>
			<br>		
		  	 
		  	<table cellpadding="0" cellspacing="0" border="0" class="dataTable table table-striped" id="example">

  			</table>	 
  			<div name='pruebatabla'>
  			</div> 
		
		</div>
		<!--End Remaining section-->
		<div id="footer"></div>
	</body>
</html>

<script src="https://code.jquery.com/jquery-1.12.0.min.js" ></script>
<script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js" ></script>
<script src="https://cdn.datatables.net/buttons/1.1.2/js/dataTables.buttons.min.js" ></script>
<script src="https://cdn.datatables.net/select/1.1.2/js/dataTables.select.min.js" ></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" ></script>
<script src="https://cdn.datatables.net/responsive/2.0.2/js/dataTables.responsive.min.js" ></script>
<script src="./dataTable-AltEditor/dataTables.altEditor.free.js" ></script>
<script type="text/javascript">
function cargarDatos(){
    var DatosJson = JSON.parse(JSON.stringify(json));
    console.log(DatosJson.alumnoUTP.length);
    $("#Table").append('<tr><td>Nombre</td>'+
    '<td>Apellido paterno</td>' + 
    '<td>Edad</td>');
    for (i = 0; i < DatosJson.alumnoUTP.length; i++){

 $("#Table").append('<tr>' + 
    '<td align="center" style="dislay: none;">' + DatosJson.alumnoUTP[i].nombre + '</td>'+
    '<td align="center" style="dislay: none;">' + DatosJson.alumnoUTP[i].apePaterno + '</td>'+
    '<td align="center" style="dislay: none;">' + DatosJson.alumnoUTP[i].edad + '</td>'+'</tr>');
    }
}
$(document).ready(function() {

	 
	  var columnDefs = [{
		title: "Codigo",
		type: "readonly"
      }, {
        title: "Material",
	    type: "readonly"
	  }, {
	    title: "Descripcion",
	    type: "readonly"
	  }, {
	    title: "Posicion Actual",
	    type: "readonly"
	  }, {
	    title: "Importacion",
	    type: "readonly"
	  }, {
	    title: "Lote",
	    type: "readonly"
	  }, {
	    title: "Vencimiento",
	    type: "readonly"
	  }, {
	    title: "Cantidad",
	    type: "readonly"
	  }, {
	    title: "UMP",
        type: "readonly"
	  }, {
		title: "Saldo Nac",
		type: "readonly"
	  }, {
		    title: "Saldo sin Nac",
		    type: "readonly"
	  }, {
	    title: "Nueva Posicion",
	    type: "text"
	  }];

	  
	  $.getJSON('movil_reubicacion.json', function(json) {
	      $.each(json, function (x, item){
	    	  for (j = 0; j < item.length; j++) {
	    	  	var obj = item[j];
	    	  	$('#example').append('<tr>');
	    	  	//for (i = 0; i < 11; i++) {
	    		  $('#example').append('<tr>' 
	    				  +		  '<td>' + obj[0] + '<td>' 
	    				  +		  '<td>' + obj[1] + '<td>' 
	    				  +		  '<td>' + obj[2] + '<td>' 
	    				  +		  '<td>' + obj[3] + '<td>' 
	    				  +		  '<td>' + obj[4] + '<td>' 
	    				  +		  '<td>' + obj[5] + '<td>' 
	    				  +		  '<td>' + obj[6] + '<td>' 
	    				  +		  '<td>' + obj[7] + '<td>' 
	    				  +		  '<td>' + obj[8] + '<td>' 
	    				  +		  '<td>' + obj[9] + '<td>' 
	    				  +		  '<td>' + obj[10] + '<td>' 
	    				  +		  '<td>' + obj[11] + '<td>' 
	    				  +		  '<tr>');
	    		//}
	    	  }
	    	 // $('#example').append('<tr>' +		  '<td>"' + obj[i][0] + '<td>' +		  '<td>"' + obj[i][1] + '<td>' +		  '<td>"' + obj[i][2] + '<td>' +		  '<td>"' + obj[i][3] + '<td>' +		  '<tr>');
	  			//  $('#example').append( '<tr><th>'+item[0]+'</th><th>'+item+'</th><th>'+item+'</th></tr>');
	      });
	    });


	  var myTable;

	  myTable = $('#example').DataTable({
	    "sPaginationType": "full_numbers",
	   // "ajax" : 'movil_reubicacion.json',
	    columns: columnDefs,
			dom: 'Bfrtip',        // Needs button container
	          select: 'single',
	          responsive: true,
	          altEditor: true,     // Enable altEditor
	          buttons: [
	        	//  {text: 'Nuevo', name: 'add'},
	          	  {extend: 'selected', text: 'Editar', name: 'edit' }
	          	  //{extend: 'selected', text: 'Borrar', name: 'delete'}
	          ]
	  });
	
	  
	




	});


</script>
 
