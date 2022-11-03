<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" %>
	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
	 <script type="text/javascript">
function validar(){
var mens ='';
//valido cia 
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

<div class="TITULO"> Reportes de Inventario  <br>Saldos por Embarque con Posicion </div>
 <br>
<html:form action="reportesAction.do?tipo=inventarios&reporte=saldos_embarque_posicion" method="post" onsubmit="return validar()" > 
<html:hidden property="reporte" value="saldos_embarque_posicion"/>
<table >
<%@include file="compania.jsp"%> 
<%@include file="fechas.jsp"%> 
<%@include file="embarque.jsp"%> 
<%@include file="tipo_reporte.jsp"%>  
<tr> <td colspan="8" align="center"><html:submit value="Ver Reporte" />
</table>
</html:form>