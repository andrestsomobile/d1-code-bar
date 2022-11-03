<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" %>
	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 

<script type="text/javascript">
function validar(){
var mens ='';
//valido cia 
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

<div class="TITULO"> Reportes de Inventario  <br>Inventario de Unidades Detallado(Excel-Entradas) </div>
 <br>
<html:form action="reportesAction.do?tipo=inventarios&reporte=inventario_unidades_detallado_excel_ent&tipo_reporte=EXCELGENERADO" method="post"  onsubmit="return validar()"> 
<table >
<%@include file="compania.jsp"%> 
<input type="hidden" name="pagina" value='main.jsp?app=reportes&modulo=inventario_unidades_detallado_excel_ent&tipo=inventarios'>  


<tr> <td colspan="8" align="center"><html:submit value="Generar Archivo" />
</table>
<table >
<tr> 
	<td>&nbsp;</td>
		<td ><a href="ShowFiles"> Ver Archivos </a></td>
</tr>		

</table>
</html:form>