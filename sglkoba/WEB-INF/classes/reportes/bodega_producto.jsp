<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" %>
	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 
<script type="text/javascript">
function validar(){
var mens ='';
//valido cia inicial
	if( document.reportesForm.compania.value=='') mens +='-Debe Escribir la Cia \\n';
	if(isNaN ( document.reportesForm.compania.value) )mens += '-La Cia  debe ser el codigo numerico\n';
//respuesta
	if(mens!='') {
		alert(mens);
		return false;
	}else 
		return true;
}
</script>	
<div class="titulo"> Saldos consolidados por bodega / producto</div>

<html:form action="reportesAction.do?tipo=operaciones&reporte=bodega_producto" method="post" onsubmit="return validar()" > 
<table >
<%@include file="compania.jsp"%> 
<td>Bodega: <% 
	maestro.control.gstbodega gbod = new maestro.control.gstbodega();
	request.setAttribute("listaBodega", gbod.getlistabodega());
%>
	<html:select property="bodega">
	<html:option value="TODOS">TODOS</html:option>
	<html:options collection="listaBodega"  
					property="bodnombre" labelProperty="bodnombre"/>
	</html:select>

<%@include file="tipo_reporte.jsp"%>  
<tr> <td colspan="8" align="center"><html:submit value="Ver Reporte" />
</table>
</html:form>