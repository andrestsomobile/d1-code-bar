<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.util.*"%>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<script type="text/javascript">
function validar(){
var mens ='';
//valido cia 
var compania=document.reportesForm.compania.value;
var categoria=document.reportesForm.categoria.value;
var referencia=document.reportesForm.referencia.value;
var fecha=document.reportesForm.fecha.value;

	if( compania=='') mens +='-Debe Escribir la Compañia \n';
	if(isNaN ( compania) )mens += '-La Compañia debe ser el codigo numerico\n';
	
	if( categoria=='') mens +='-Debe Escribir la categoria \n';
	if(isNaN ( categoria) )mens += '-La categoria debe ser el codigo numerico\n';
	
	if( fecha=='') mens +='-Debe Escribir la Fecha \n';

//respuesta
	if(mens!='') {
		alert(mens);
		return false;
	}else{ 
		location.href="main.jsp?app=reportes&modulo=producto_valorizado_gui&tipo=inventarios&compania="+compania+"&categoria="+categoria+"&fecha="+fecha+"&referencia="+referencia;
	}
}
</script>
<div class="TITULO">Consolidado por Producto Valorizado</div>
<br>
<html:form action="reportesAction" method="post" onsubmit="">
	<html:hidden property="reporte" value="producto_valorizado" />
	<table>
		<%@include file="compania.jsp"%>
		<%@include file="categoria.jsp"%> 
		<%@include file="referencia.jsp"%>
		<%@include file="fecha.jsp"%>
		<tr>
			<td colspan="8" align="center"><html:button value="Ver Reporte"
				property="enviar" onclick="javascript:validar();" />
	</table>
</html:form>