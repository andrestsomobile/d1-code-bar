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
			<div class="titulo">Descargas para SGLKOBA Movil</div>
			<br>
			<br>		
		  	 
		  	<table cellpadding="0" cellspacing="0" border="0" class="dataTable table table-striped" id="example">

  			</table>	  
		
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
$(document).ready(function() {

	  var columnDefs = [{
		title: "Archivo",
		type: "readonly"
      }, {
        title: "Fecha",
	    type: "readonly"
	  }, {
	    title: "Descargar",
	    type: "readonly"
	  }];

	  var myTable;

	  myTable = $('#example').DataTable({
	    "sPaginationType": "full_numbers",
	    "ajax" : 'movil_descargas.json',
	    columns: columnDefs,         
    	"columnDefs": [ {
        	  targets: 2,
        	  render: function (data, type, full, meta){
        	      return '<a href="'+data+'" download="'+data+'" >DESCARGAR</a>';	        	   
        	  }
        }],        	        
		dom: 'rtip',
          select: 'single',
          responsive: true	          
	  });

	});


</script>
 
