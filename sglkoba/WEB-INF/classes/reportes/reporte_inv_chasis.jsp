<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*, java.io.*" %>
	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <script type="text/javascript">
function validar(){
var mens ='';
//valido cia inicial
	if( document.reportesForm.compania.value=='') mens +='-Debe Escribir la Cia \n';
	if(isNaN ( document.reportesForm.compania.value) )mens += '-La Cia debe ser el codigo numerico\n';
//respuesta
	if(mens!='') {
		alert(mens);
		return false;
	}else 
		return true;
}
</script>	
	
<div class="titulo"> Inventario de Chasis/Seriales </div>

<html:form action="reportesAction.do?tipo=inventarios&reporte=reporte_inv_chasis&tipo_reporte=EXCELGENERADO" method="post" onsubmit="return validar()"> 
<table >
<%@include file="compania.jsp"%> 
<input type="hidden" name="pagina" value='main.jsp?app=reportes&modulo=reporte_inv_chasis&tipo=inventarios'>  
<tr> <td colspan="8" align="center"><html:submit value="Generar Archivo" />
</table >
<br>		
<%
String ruta = "uploads/";
String nomarch = "Inventario_Seriales" + ".xls";
%>
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
  
 </table>
 <br>
<table >
<tr> 
	<td>&nbsp;</td>
	<td ><a href="ShowFiles">  Ver Archivos </a></td>
</tr>
</table>
</html:form>

