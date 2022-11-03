<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" %>
	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <script type="text/javascript">
function validar(){
var mens ='';
//valido cia inicial
	if( document.reportesForm.compania.value=='') mens +='-Debe Escribir la Cia \n';
	if(isNaN ( document.reportesForm.compania.value) )mens += '-La Cia debe ser el codigo numerico\n';
//valido fechas:	
	if( document.reportesForm.fecha_ini.value=='') mens +='-Debe Escribir la Fecha Inicial\n';
	if( document.reportesForm.fecha_fin.value=='') mens +='-Debe Escribir la Fecha Final\n';
//respuesta
	if(mens!='') {
		alert(mens);
		return false;
	}else 
		return true;
}
</script>	
	
<div class="titulo"> Resumen por Embarque </div>

<html:form action="reportesAction.do?tipo=inventarios&reporte=resumen_embarque&tipo_reporte=EXCELGENERADO" method="post" onsubmit="return validar()"> 
<table >
<%@include file="compania.jsp"%> 
<%@include file="fechas.jsp"%> 
<input type="hidden" name="pagina" value='main.jsp?app=reportes&modulo=resumen_embarque&tipo=inventarios'>  
<tr> <td colspan="8" align="center"><html:submit value="Generar Archivo" />
</table >
<table >
<tr> 
	<td>&nbsp;</td>
		<td ><a href="ShowFiles">  Ver Archivos </a></td>
</tr>		

</table>
</html:form>

