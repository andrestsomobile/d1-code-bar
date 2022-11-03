<%@page import="ingreso.entity.lote_trafico"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="maestro.control.*,maestro.entity.*,java.util.*, administracion.control.gstpermiso,ingreso.form.ingresoForm"%> 


 <%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>
 
 <%
    String promodelo = "";
	String prodescripcion =  "";
	String ltraflote = "";
	String ingfecha =  "";
	String ltrafvencimiento =  "";
	String prounimasterpac  =  "";
	String trafnumdta = "";
	String ltrafcodsx =  "";
	
 %>
<!DOCTYPE html>
<html>
<head>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
</head>
<body>
  
     <div class=""> Descargue de Mercancías </div> 
    
     <video id="preview"></video>
    <script type="text/javascript">
      let scanner = new Instascan.Scanner({ video: document.getElementById('preview') });
      scanner.addListener('scan', function (content) {
        alert(content);
      });
      Instascan.Camera.getCameras().then(function (cameras) {
        if (cameras.length > 0) {
          scanner.start(cameras[0]);
        } else {
          console.error('No cameras found.');
          alert("No se encontró cámara");
        }
      }).catch(function (e) {
        console.error(e);
        alert("Error buscando cámara ");
      }
      });
    </script>
    
   TIPO DE LECTURA: <select  > 
		    	<option value="LECTURA QR" selected>LECTURA QR</option>
		    </select>
    
    <table align='center'  width='99%' border='1' cellspacing='0' cellpading='0' class="">
		<tr>
			<td>Escanear Estiba</td>
			<td>Datos Estiba</td>
		</tr>
		<tr>
			<td style="line-height:100pt;"><a href='javascript:confirm("Desea activar la camara del dispositivo?");'><html:img src="files/movil/camara.png" width='110px' height='110px' border="0"/></a></td>
			<td style="line-height:100pt;">
				<table  align='center' width='99%' border='1' cellspacing='0' cellpading='0' class="" style="font-size:8px;font-weight:bold;">
					  <tr><td  width='50%'>PLU:</td><td><%=promodelo %></td></tr>
					  <tr><td width='50%'>DESCRIPCI&Oacute;N:</td><td><%=prodescripcion %></td></tr>
					  <tr><td width='50%'>LOTE:</td><td><%=ltraflote %></td></tr>
					  <tr><td width='50%'>F.INGRESO:</td><td><%=ingfecha %></td></tr>
					  <tr><td width='50%'>F.VENCIMIENTO:</td><td><%=ltrafvencimiento %></td></tr>
					  <tr><td width='50%'>UMP x ESTIBA:</td><td><%=prounimasterpac %></td></tr>
					  <tr><td width='50%'>IMPORTACI&Oacute;N:</td><td><%=trafnumdta %></td></tr>	  
				</table>  
			</td>
		</tr>
		<tr>
			<td>Escanear Posición</td>
			<td>Datos Posición</td>
		</tr>
		<tr>
			<td style="line-height:100pt;"><a href='javascript:confirm("Desea activar la camara del dispositivo?");'><html:img src="files/movil/camara.png" width='110px' height='110px' border="0"/></a</td>
			<td style="line-height:100pt;">
				<table  align='center' width='99%' border='1' cellspacing='0' cellpading='0' class="" style="font-size:8px;font-weight:bold;">
					  <tr><td width='50%'>POSICION:</td><td><%=promodelo %></td></tr>
  
				</table>  
			</td>
		</tr>
		
		<tr>
			<td colspan = '2' align='center'><html:submit value="Grabar"  /> </td>
			
		</tr>
    </table>
    
    
   
</body>
</html> 


 
 
