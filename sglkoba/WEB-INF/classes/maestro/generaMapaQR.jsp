<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1" import="maestro.control.*,maestro.entity.*,java.util.*" %>
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 
 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

<% 
gstconfig_bodega gconf_bog = new gstconfig_bodega();
gstbodega gbod = new gstbodega();
String procodsx = request.getParameter("procodsx");
String bodcodsx = request.getParameter("bodega");
String estanteria = request.getParameter("estanteria");
estanteria = estanteria == null ? "A" : estanteria;
bodcodsx = bodcodsx == null ? "1" : bodcodsx;
bodega bod = gbod.getbodega(bodcodsx);
Collection lista = gconf_bog.getPosicionesQR(bodcodsx,estanteria);
%> 
 <!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<script src="files/movil/jquery.min.js"></script>
	<script src="files/movil/qrcode.js"></script> 

	
</head>

<body>

 <div class="titulo"> Generar Codigos QR de Estanter&iacute;a:  <%=estanteria%></div> 
 <br> 

 
<div id='div_print'>  
  <% 
  int salto = 0;
  for (Object data : lista) {
	ArrayList<String> info = (ArrayList<String>) data;
	String posicion = info.get(0);
	String qr = posicion;
  %>

  <table id="tabla_print" style="page-break-after: always; width: 10cm; heigth: 15cm;" align='center' border='1' cellspacing='0' cellpading='0'  >
  
	  <tr>
	  	<td nowrap="nowrap">POSICI&Oacute;N:<%=posicion %></td>
	  	<td rowspan="2" valign="middle" style="no-repeat; width: 5cm; heigth: 15cm" title="<%=qr%>" id="codigoQR_<%=qr%>"></td>
	  </tr>  
	  <tr><td nowrap="nowrap">BODEGA:<%=bod != null ? bod.getbodnombre() : ""%></td></tr>
  </table>  
  <br><br>
<%
  }
  %>
</div>
</body>

</html>

<script type="text/javascript">
function PrintElem(elem)
{
    var mywindow = window.open('', 'PRINT', 'height=650,width=850');

    mywindow.document.write('<html><head><title>' + document.title  + '</title>');
    mywindow.document.write('</head><body>');
    mywindow.document.write(document.getElementById(elem).innerHTML);
    mywindow.document.write('</body></html>'); 
    mywindow.document.close(); // necessary for IE >= 10
    mywindow.focus(); // necessary for IE >= 10*/

    mywindow.print();

    return true;
}

function imprimir() {
	PrintElem('div_print');
}
</script>

<script type="text/javascript"> 
$(document).ready(function(){
	
	$("[id^=codigoQR_]").each(function(){
		var qr =$(this).attr('title');
		var miCodigoQR = new QRCode(this);
		miCodigoQR.makeCode(qr);
	});
  
});
</script>