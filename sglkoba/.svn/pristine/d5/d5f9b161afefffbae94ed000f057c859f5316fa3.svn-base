	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<html>
<script type="text/javascript" >
/**
funcion que mira si la compania es la misma para poder mostrar la lista de clientes, si las cias son diferentes
se muestra una alerta y no se deja escoger el cliente
*/
function verificar_companias(){

	if( document.reportesForm.compania.value=='') {
		alert('Debe seleccionar la Compania');
		return false;
	}
}
</script>


<td width="120">Cliente <br>
<html:text property="cliente" size="10" /> <html:errors property="cliente_ini"/>
		<%
				parametros = new String[] {"' +  document.reportesForm.compania.value  + '", "0", ""};
				parametros_total = new String[] {"' +  document.reportesForm.compania.value  + '", ""};
				campos_form= new String[] {"cliente"};
				campos_pick = new String[] {"clicodsx"};
				campos_entity= new String[] { "clicodsx", "clinombre" ,"clidireccion"};
				nombres_campos_entity= new String[] {"Codigo", "Nombre" ,"Direccion"};
				metodo  = "getlistaclienteByEmpresa";
				metodo_total = "getTotalPaginaslistaclienteByEmpresa";
		%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstcliente" entidad="maestro.entity.cliente" funcion_onclick="return verificar_companias()"
						formulario="reportesForm" metodo="<%= metodo %>" 
						metodo_total="<%= metodo_total %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>"  />
				<html:errors property="cliente_ini"/>

</td>
