<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" %>
	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
	 <script type="text/javascript">
function validar(){
var mens ='';

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

<div class="TITULO"> Saldos Consolidados </div>
 <br>
<html:form action="reportesAction.do?tipo=inventarios&reporte=saldos_consolidados&tipo_reporte=EXCELGENERADO" method="post" onsubmit="return validar()" > 
<input type="hidden" name="pagina" value='main.jsp?app=reportes&modulo=saldos_consolidados&tipo=inventarios'>
<table >
<%@include file="fechas.jsp"%> 
<tr> <td colspan="8" align="center"><html:submit value="Generar Archivo" />
</table >
<table >


<br>		
<%
String ruta = "uploads/";
String nomarch = "SaldosConsolidados" + ".xls";
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