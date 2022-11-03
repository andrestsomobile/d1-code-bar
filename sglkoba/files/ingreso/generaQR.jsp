 <%@page import="ingreso.entity.lote_trafico"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="ingreso.control.*,ingreso.entity.*,java.util.*, administracion.control.gstpermiso,ingreso.form.ingresoForm"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 
 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

<% 
gstentrada gentrada = new gstentrada(); 
String ingcodsx = request.getParameter("ingcodsx");
Collection lista = gentrada.getIdentificacionEstibas(ingcodsx); 
%> 
 <!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">

	<script src="files/movil/jquery.min.js"></script>
	<script src="files/movil/qrcode.js"></script> 

	<style type="text/css">
		 
		#codigoQR{
		  width: 256px;
		  height: 256px;
		  margin-top: 25px;
		  border: 2px solid #eee;
		}
	</style>
	<style type="text/css" media="print">
		@page  
		{ size: auto;   /* auto is the initial value */ 
		
		    /* this affects the margin in the printer settings */ 
		    margin: 5mm 5mm 5mm 5mm;  
		} 
	    @media all {
			div.saltopagina { display: none; }
		}
	   
		@media print{
	   		div.saltopagina{ 
	      		display:block; 
	     		 page-break-before:always;
	   		}
		}
	</style>
</head>

<body>

 <div class="titulo"> Generar Codigos QR - Ingreso:  <%=ingcodsx %></div> 
 <br> 

 
  
  <% 
  int salto = 0;
  for (Object data : lista) {
	ArrayList<String> info = (ArrayList<String>) data;
	String promodelo = info.get(0);
	String prodescripcion = info.get(1);
	String ltraflote = info.get(2);
	String ingfecha = info.get(3);
	String ltrafvencimiento = info.get(4);
	String prounimasterpac  = info.get(5);
	String trafnumdta = info.get(6);
	String entcodsx = info.get(7);
	String qr1 = "{"
			+ "PLU:" + promodelo 
			+ ",DESCRIPCION:" + prodescripcion
			+ ",LOTE:" + ltraflote
			+ ",F.INGRESO:" + ingfecha
			+ ",F.VENCIMIENTO:" + ltrafvencimiento
			+ ",UMP x ESTIBA:" + prounimasterpac
			+ ",IMPORTACION:" + trafnumdta
			+ ",SX:" + entcodsx
			+	"}";
	String qr = "{"
			+ promodelo 
			+ "," + prodescripcion
			+ "," + ltraflote
			+ "," + ingfecha
			+ "," + ltrafvencimiento
			+ "," + prounimasterpac
			+ "," + trafnumdta
			+ "," + entcodsx
			+	"}";
  %>
  <table  align='center' width='99%' border='1' cellspacing='0' cellpading='0' class="" style="font-size:20px;font-weight:bold;">
	  <tr><td>PLU:</td><td><%=promodelo %></td>
	  	<td rowspan="7" valign="top" style="no-repeat" id="codigoQR_<%=qr%>"></td>
	  </tr>
	  <tr><td>DESCRIPCI&Oacute;N:</td><td><%=prodescripcion %></td></tr>
	  <tr><td>LOTE:</td><td><%=ltraflote %></td></tr>
	  <tr><td>F.INGRESO:</td><td><%=ingfecha %></td></tr>
	  <tr><td>F.VENCIMIENTO:</td><td><%=ltrafvencimiento %></td></tr>
	  <tr><td>UMP x ESTIBA:</td><td><%=prounimasterpac %></td></tr>
	  <tr><td>IMPORTACI&Oacute;N:</td><td><%=trafnumdta %></td></tr>	  
  </table>  
  <br><br>
  
  <% 

    if (salto==2) {
    	salto=0;
  %>
      <div class="saltopagina"></div>
  <%
    } else {
        salto++;
    }
  }
  %>

</body>

</html>
 

<script type="text/javascript">

function imprimir() {
	var width=850;
	var height=650;
	var left=25;
	var top=25;
	var r="";
	 r = window.location + "";

	ruta = r.substring(r.indexOf('?') +1 , r.charAt(r.length)=='#'? r.length -1 :r.length );

	 pagina = window.open("imprimir.jsp?"+ruta, "pagina",  "width="+width+",height="+ height+",resizable=yes,scrollbars=yes,left="+left+",top="+top);

}
</script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("[id^=codigoQR_]").each(function(){
		var qr =$(this).attr('id');
		var miCodigoQR = new QRCode(this);
		miCodigoQR.makeCode(qr);
	});
  
});
</script>