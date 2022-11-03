<html>
	<head>

        <title>SGL :: Sistema de Gestion Logistico -- KOBA Colombia S.A.S</title>
        <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link href="./disenno/templates/Movil/styles.css" rel="stylesheet" type="text/css">

        <script src="./bootstrap/js/jquery-1.8.2.js"></script>
        <script src="./bootstrap/js/bootstrap.min.js"></script>
        		
		<script> 
		$(function(){
		  $("#header").load("./disenno/templates/Movil/header.jsp"); 
		  $("#footer").load("./disenno/templates/Movil/footer.html"); 
		});
		</script> 
		
		<script src="./qrcode.js"></script>

		<style type="text/css">
		  #item_txt{
		  width: 20%;
		}
		
		#generarCodigo{
		  width: 10%;
		  background-color: #5AA1E3;
		  color: #fff;
		}
		
		#descargarCodigo{
		  width: 10%;
		  background-color: #3CB371;
		  color: #fff;
		  display: none;
		  text-align: center;
		  border: #eee solid 2px;
		  text-decoration: none;
		}
		
		#codigoQR{
		  width: 256px;
		  height: 256px;
		  margin-top: 25px;
		  border: 2px solid #eee;
		}
		</style>

	</head>
	
	<body>
		<div id="header"></div>
		<!--Remaining section-->
		
			<div class="titulo">Consultar por Codigo QR </div>
			<br>
			<br>

			
		 <div class="container">
		
		  <input id="item_txt" type="text" placeholder="Ingresa algún texto">
		  <button  id="generarCodigo">Consultar QR</button>
		  <div id="codigoQR"></div>	
		  
		  <br>
		  <br>
		  
		  <table border="1">
			  <tr><td>Material:</td><td>12000222 </td>  </tr>
			  <tr><td>Descripcion:</td><td>TOALLITAS HUMEDAS LITTLE ANGELS 72 UND </td>  </tr>
			  <td>Posicion:</td><td>A01-1</td>  </tr>
			  <td>Importacion:</td><td>SALDOS INICIALES</td>  </tr>
			  <td>Lote:</td><td>21171F</td>  </tr>
			  <td>Saldo:</td><td>40.00</td>  </tr>

		  </table>
		
				
		</div>
		<!--End Remaining section-->
		<div id="footer"></div>
	</body>
</html>

 
<script type="text/javascript">
var miCodigoQR = new QRCode("codigoQR");

$(document).ready(function(){
  $("#generarCodigo").on("click",function(){
    var cadena = $("#item_txt").val();
    if (cadena == "") {
        alert("Ingresa un texto");
        $("#item_txt").focus();
    }else{
      $("#descargarCodigo").css("display","inline-block");
      miCodigoQR.makeCode(cadena);
    }
  });

  $("#descargarCodigo").on("click",function(){
    var base64 = $("#codigoQR img").attr('src');
    $("#descargarCodigo").attr('href', base64);
    $("#descargarCodigo").attr('download', "codigoQR");
    $("#descargarCodigo").trigger("click");
  });
});
</script>