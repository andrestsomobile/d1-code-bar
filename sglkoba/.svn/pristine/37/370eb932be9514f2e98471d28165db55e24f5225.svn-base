<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" %>
	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 
<%@page import="pedido.control.gstpacking"%>
<script type="text/javascript">
function validar(){
var mens ='';
//valido cia inicial
	if( document.reportesForm.cia_ini.value=='') mens +='-Debe Escribir la Cia inicial\n';
	if(isNaN ( document.reportesForm.cia_ini.value) )mens += '-La Cia Inicial debe ser el codigo numerico\n';
//valido cia final
	if( document.reportesForm.cia_fin.value=='') mens +='-Debe Escribir la Cia Final\n';
	if(isNaN ( document.reportesForm.cia_fin.value) )mens += '-La Cia Final debe ser el codigo numerico\n'; 
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
<div class="titulo"> Picking's de Mercancia</div>

<html:form action="reportesAction.do?tipo=operaciones&reporte=picking" method="post" onsubmit="return validar()" > 
<table >
<%@include file="companias.jsp"%> 
<%@include file="fechas.jsp"%> 
<%@include file="tipo_reporte.jsp"%>  
Packing: 
<input type="text" name="packing" >

		<% 
		parametros = new String[] {"' +document.reportesForm.cia_ini.value +'", "0", ""};
		parametros_total = new String[] { "' +document.reportesForm.cia_ini.value +'", ""};
		campos_form= new String[] {"packing"};
		campos_pick = new String[] {"packcodsx"};
		campos_entity= new String[] { "packcodsx", "packfecha" };
		nombres_campos_entity= new String[] {"Codigo", "Fecha" };
		metodo  = "getlistapacking";
		metodo_total = "getTotalPaginaslistapacking";
		%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="pedido.control.gstpacking" entidad="pedido.entity.packing" 
						formulario="reportesForm" metodo="<%= metodo %>" 
						metodo_total="<%= metodo_total %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
				<html:errors property="cia_ini"/>


<tr> <td colspan="8" align="center"><html:submit value="Ver Reporte" />
</table>
</html:form>