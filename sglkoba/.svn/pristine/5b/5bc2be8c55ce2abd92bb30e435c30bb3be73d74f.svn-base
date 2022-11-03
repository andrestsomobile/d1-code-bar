<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" %>
	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <script type="text/javascript">
function validar(){
var mens ='';
//valido cia 
	if( document.reportesForm.compania.value=='') mens +='-Debe Escribir la Cia inicial\n';
	if(isNaN ( document.reportesForm.compania.value) )mens += '-La Cia Inicial debe ser el codigo numerico\n';

//respuesta
	if(mens!='') {
		alert(mens);
		return false;
	}else 
		return true;
}
</script>	
 
	
<div class="titulo"> Reporte Consolidado de Descarga de Mercancia en Bodega</div>

<html:form action="reportesAction.do?tipo=operaciones&reporte=consolidado_descargas" method="post" onsubmit="return validar()"> 
<table >
<%@include file="compania.jsp"%> 
<td>Pedidos:
<table border="0">
	<tr>	
		<td><input type="text" name="pednumpedido" size="10"> 
		<td><input type="text" name="pednumpedido" size="10">
		<td><input type="text" name="pednumpedido" size="10">
		<td><input type="text" name="pednumpedido" size="10">
		<td><input type="text" name="pednumpedido" size="10">
	<tr>	
		<td><input type="text" name="pednumpedido" size="10"> 
		<td><input type="text" name="pednumpedido" size="10">
		<td><input type="text" name="pednumpedido" size="10">
		<td><input type="text" name="pednumpedido" size="10">
		<td><input type="text" name="pednumpedido" size="10">
	<tr>	
		<td><input type="text" name="pednumpedido" size="10"> 
		<td><input type="text" name="pednumpedido" size="10">
		<td><input type="text" name="pednumpedido" size="10">
		<td><input type="text" name="pednumpedido" size="10">
		<td><input type="text" name="pednumpedido" size="10">
	<tr>	
		<td><input type="text" name="pednumpedido" size="10"> 
		<td><input type="text" name="pednumpedido" size="10">
		<td><input type="text" name="pednumpedido" size="10">
		<td><input type="text" name="pednumpedido" size="10">
		<td><input type="text" name="pednumpedido" size="10">

		
 </table>
	
<%@include file="tipo_reporte.jsp"%> 
<tr> <td colspan="8" align="center"><html:submit value="Ver Reporte" />
</table>
</html:form>