<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" %>
	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <script type="text/javascript">
function validar(){
var mens ='';
//valido compania
	if( document.reportesForm.compania.value=='') mens +='-Debe Escribir la Cia \n';
	if(isNaN ( document.reportesForm.compania.value) )mens += '-La Cia  debe ser el codigo numerico\n';
//valido fechas:
	if( document.reportesForm.fecha_ini.value=='') mens +='-Debe Escribir la fecha inicial\n';
	if( document.reportesForm.fecha_fin.value=='') mens +='-Debe Escribir la fecha final\n';

//respuesta
	if(mens!='') {
		alert(mens);
		return false;
	}else 
		return true;
}
</script>	
	
<div class="titulo"> Indicador de Pedidos por Zona Valorizado</div>

<html:form action="reportesAction.do?tipo=indicadores&reporte=indicador_pedidos_zonas_valorizados" method="post" onsubmit="return validar()"> 
<table>
<%@include file="fechas.jsp"%>
<%@include file="compania.jsp"%>
<%@include file="tipo_reporte.jsp"%>
<tr> <td colspan="8" align="center"><html:submit value="Ver Reporte" />
</table>
</html:form>

