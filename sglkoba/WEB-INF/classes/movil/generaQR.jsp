 
<%@page import="ingreso.entity.lote_trafico"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="maestro.control.*,maestro.entity.*,java.util.*, administracion.control.gstpermiso,ingreso.form.ingresoForm"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <div class=""> Generar Codigo QR </div> 
 <br> 
 
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
  <input id="item_txt" type="text" placeholder="Ingresa alg�n texto">
  <button id="generarCodigo">Generar</button> <a href="#" id="descargarCodigo">Descargar</a>
  <div id="codigoQR"></div>	
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