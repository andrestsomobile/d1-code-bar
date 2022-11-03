<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" %>
	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <script type="text/javascript">
function validar(){
var mens ='';
//valido compania
	if( document.reportesForm.compania.value=='') mens +='-Debe Escribir la Cia \n';
	if(isNaN ( document.reportesForm.compania.value) )mens += '-La Cia  debe ser el codigo numerico\n';
//valido el MES
	if( document.reportesForm.mes.value=='') mens +='-Debe Escribir el mes\n';
//valido EL ANO	
	if( document.reportesForm.anno.value=='') mens +='-Debe Escribir el anno\n';

//respuesta
	if(mens!='') {
		alert(mens);
		return false;
	}else 
		return true;
}
</script>	
	
<div class="titulo"> Indicador de Pedidos por Zona </div>

<html:form action="reportesAction.do?tipo=operaciones&reporte=indicador_zonas" method="post" onsubmit="return validar()"> 
<table>
<%@include file="mes.jsp"%>
<%@include file="zona.jsp"%>
<%@include file="detallado_resumido.jsp"%>
<%@include file="tipo_reporte.jsp"%>
<tr> <td colspan="8" align="center"><html:submit value="Ver Reporte" />
</table>
</html:form>

