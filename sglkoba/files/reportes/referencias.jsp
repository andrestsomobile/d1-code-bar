	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<script type="text/javascript" >
/**
funcion que mira si la compania es la misma para poder mostrar la lista de clientes, si las cias son diferentes
se muestra una alerta y no se deja escoger el cliente
*/
function verificar_companias(){

	if( document.reportesForm.cia_ini.value=='' || document.reportesForm.cia_fin.value==''
		||
	  (document.reportesForm.cia_ini.value !=document.reportesForm.cia_fin.value ) ) {
		
		alert('Debe seleccionar la misma compania para poder mostrarle la lista de Referencias y debe ser diferente de vacia');
		return false;
	}
}
</script>
<td width="120">Desde Referencia<br>
<html:text property="ref_ini" size="10" />
		<% 
				parametros = new String[] {"' +  document.reportesForm.cia_ini.value  + '", "0", ""};
				parametros_total = new String[] {"' +  document.reportesForm.cia_ini.value  + '", ""};
				campos_form= new String[] {"ref_ini"};
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
<td width="120">Hasta Referencia<br>
<html:text property="ref_fin" size="10" />
		<%
				campos_form= new String[] {"ref_fin"};
		%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstproducto" entidad="maestro.entity.producto" funcion_onclick="return verificar_companias()"
						formulario="reportesForm" metodo="<%= metodo %>"
						metodo_total="<%= metodo_total %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
		<html:errors property="ref_fin"/>
</td>