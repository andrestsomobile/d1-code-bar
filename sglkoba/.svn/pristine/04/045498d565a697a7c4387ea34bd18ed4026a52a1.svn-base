<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" %>
	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 

<script type="text/javascript">
function validar(){
var mens ='';
//valido cia 
	if( document.reportesForm.compania.value=='') mens +='-Debe Escribir la Cia \n';
	if(isNaN ( document.reportesForm.compania.value) )mens += '-La Cia debe ser el codigo numerico\n';
//valido fecha:	
	if( document.reportesForm.fecha.value=='') mens +='-Debe Escribir la Fecha\n';
//respuesta
	if(mens!='') {
		alert(mens);
		return false;
	}else 
		return true;
}
</script>	

<div class="TITULO"> Reportes de Inventario  <br>Resumen de Saldos por Embarque </div>
 <br>
<html:form action="reportesAction.do?tipo=inventarios&reporte=resumen_saldos_embarque" method="post"  onsubmit="return validar()"> 
<table >
<%@include file="compania.jsp"%> 
<%@include file="embarque.jsp"%> 
<%@include file="fecha.jsp"%>  
<%@include file="tipo_reporte.jsp"%>  

<tr> <td colspan="8" align="center"><html:submit value="Ver Reporte" />
</table>
</html:form>