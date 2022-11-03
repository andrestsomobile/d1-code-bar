<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" %>
	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<script type="text/javascript">
function validar(){
var mens ='';
//valido cia 
	if( document.reportesForm.compania.value=='') mens +='-Debe Escribir la Cia \n';
	if(isNaN ( document.reportesForm.compania.value) )mens += '-La Cia Inicial debe ser el codigo numerico\n';

//respuesta
	if(mens!='') {
		alert(mens);
		return false;
	}else 
		return true;
}
</script>	

<div class="TITULO"> Reportes de Inventario  <br>Saldos por Embarque </div>
 <br>
<html:form action="reportesAction.do?tipo=inventarios&reporte=saldo_reservado" method="post" onsubmit="return validar()" > 
<html:hidden property="reporte" value="saldo_reservado"/>
<table >
<%@include file="compania.jsp"%> 
<%@include file="referencia.jsp"%>  
<%@include file="tipo_reporte.jsp"%>  
<tr> <td colspan="8" align="center"><html:submit value="Ver Reporte" />
</table>
</html:form>