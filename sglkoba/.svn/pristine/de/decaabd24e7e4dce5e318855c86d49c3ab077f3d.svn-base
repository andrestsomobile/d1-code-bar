<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*, reportes.form.reportesForm , reportes.util.*, maestro.control.*, maestro.entity.*,java.math.BigDecimal	" %>
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
<div class="titulo"> Auditoria de Accesos y conexiones a la aplicacion </div>

<html:form action="reportesAction.do?tipo=operaciones&reporte=auditoria_conexiones" method="post" onsubmit="return validar()" > 
<table >

<%@include file="fechas.jsp"%> 
<td>Nombre Usuario <html:text property="usuario"/>
	<% 
				String[] parametros = new String[] { "0", ""};
	String[] parametros_total = new String[] { ""};
	String[]	campos_form= new String[] {"usuario"};
	String[]	campos_pick = new String[] {"usunombre"};
	String[]	campos_entity= new String[] { "usunombre", "usulogin" };
	String[]	nombres_campos_entity= new String[] {"Nombre", "Login"};
	String	metodo  = "getlistausuario";
	String	metodo_total = "getTotalPaginaslistausuario";
		%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="administracion.control.gstusuario" entidad="administracion.entity.usuario" funcion_onclick="return validar()"
						formulario="reportesForm" metodo="<%= metodo %>" 
						metodo_total="<%= metodo_total %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
				<html:errors property="categoria"/>


<%@include file="tipo_reporte.jsp"%>  
<tr> <td colspan="8" align="center"><html:submit value="Ver Reporte" />
</table>
</html:form>
