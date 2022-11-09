<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 

<td width="120">Compania <br>
<html:text property="compania" size="10"  /><html:errors property="cia_ini"/>
		<%
		String[] parametros_V = new String[] { "0", ""};
		String[] parametros_total_V = new String[] {""};
		String[] campos_form= new String[] {"compania"};
		String[] campos_pick = new String[] {"comcodsx"};
		String[] campos_entity= new String[] { "comcodsx", "comnombre" };
		String[] nombres_campos_entity= new String[] {"Codigo", "Nombre" };
		String metodo  = "getlistacompaniaByInventarioVirtual";
		String metodo_total = "getTotalPaginaslistacompaniaByInventarioVirtual";
		%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstcompania" entidad="maestro.entity.compania" 
						formulario="reportesForm" metodo="<%= metodo %>" 
						metodo_total="<%= metodo_total %>"
						parametros="<%= parametros_V %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total_V %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
				<html:errors property="compania"/>

</td>
