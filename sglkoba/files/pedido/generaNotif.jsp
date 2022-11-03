<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" %>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<script type="text/javascript">
 function validar(){
	 return true;
 }
</script>
<%
String ruta = "uploads/";
String despcodsx = request.getParameter("despcodsx");
String nomarch = "ARCHIVO_NOTIFICACION"+".xls";
String nomarch_item = "ARCHIVO_NOTIFICACION_ITEM"+".xls";
%>	
<div class="titulo"> Generacion Archivo Notificacion ZF</div>

<html:form action="reportesAction.do?reporte=generaNotif&tipo_reporte=EXCELGENERADO" method="post" onsubmit="return validar()"> 
<table >
<input type="hidden" name="pagina" value='main.jsp?app=pedido&modulo=generaNotif'> 
 
<input type="hidden" name="despcodsx" value='<%=despcodsx%>'>  

<tr> <td colspan="8" align="center"><html:submit value="Generar Archivo" />
</table >
<table >
<br>		

 <table border="1" cellpadding="0" cellspacing="0">
   <caption> Ultimo Archivo Generado </caption>
    <tr>
      <th> Archivo 
      <th> Opcion
    </tr>
    <tr>
      <td nowrap="nowrap"><%=nomarch %>
      <td nowrap="nowrap"><a href="<%=ruta+nomarch%>"> Descargar </a>           
    </tr>
     <tr>
      <td nowrap="nowrap"><%=nomarch_item %>
      <td nowrap="nowrap"><a href="<%=ruta+nomarch_item%>"> Descargar </a>           
    </tr>
  
 </table>
<br>
<tr> 
	<td>&nbsp;</td>
		<td ><a href="ShowFiles">  Ver Archivos </a></td>
</tr>		

</table>
</html:form>

