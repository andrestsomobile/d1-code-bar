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
	
<div class="titulo"> Indicador de Ingresos por Compania</div>

<html:form action="reportesAction.do?tipo=operaciones&reporte=indicador_ingresos_companias" method="post" onsubmit="return validar()"> 
<table>
<%@include file="fechas.jsp"%> 
<%@include file="tipo_reporte.jsp"%>
<tr> <td colspan="8" align="center"><html:submit value="Ver Reporte" />
</table>
</html:form>

