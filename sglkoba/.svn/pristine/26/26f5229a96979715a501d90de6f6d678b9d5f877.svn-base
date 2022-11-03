 
<%@page import="ingreso.entity.lote_trafico"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="maestro.control.*,maestro.entity.*,java.util.*, administracion.control.gstpermiso,ingreso.form.ingresoForm"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <div class=""> Consultar por Codigo QR </div> 
 <br> 
 
 <!DOCTYPE html>
<html>
<head>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
</head>
<body>
  

    
    <video id="preview"></video>
    <script type="text/javascript">
     // alert("Buscando cámara del dispositivo...");
      let scanner = new Instascan.Scanner({ video: document.getElementById('preview') });
      scanner.addListener('scan', function (content) {
        alert(content);
      });
      Instascan.Camera.getCameras().then(function (cameras) {
        if (cameras.length > 0) {
          scanner.start(cameras[0]);
        } else {
          console.error('No cameras found.');
        }
      }).catch(function (e) {
        console.error(e);
      });
    </script>
   
</body>
</html>
 
 
 
 <!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="files/movil/jquery.min.js"></script>
<script src="files/movil/qrcode.js"></script>
<!--   <link rel='stylesheet' href='style.css' type='text/css'> -->
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
</body>
<script src="jquery.min.js"></script>
<script src="qrcode.js"></script>
<script src="main.js"></script>
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