	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<script type="text/javascript" >
/**
funcion que mira si la compania es la misma para poder mostrar la lista de clientes, si las cias son diferentes
se muestra una alerta y no se deja escoger el cliente
*/
function verificar_compania(){

	if( document.reportesForm.compania.value=='') {
		alert('Debe seleccionar la  compania para poder mostrarle la lista de Referencias ');
		return false;
	}
}
</script>
<td width="120">Referencia<br>
<html:text property="referencia" size="10" />
		<% 
				parametros = new String[] {"' +  document.reportesForm.compania.value  + '", "0", ""};
				parametros_total = new String[] {"' +  document.reportesForm.compania.value  + '", ""};
				campos_form= new String[] {"referencia"};
				campos_pick = new String[] {"promodelo"};
				campos_entity= new String[] { "promodelo", "prodescripcion" };
				nombres_campos_entity= new String[] {"Material", "Descripcion"};
				metodo  = "getlistaproducto";
				metodo_total = "getTotalPaginaslistaproducto";
		%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstproducto" entidad="maestro.entity.producto" funcion_onclick="return verificar_companias()"
						formulario="reportesForm" metodo="<%= metodo %>" 
						metodo_total="<%= metodo_total %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
				<html:errors property="ref_ini"/>

</td>
