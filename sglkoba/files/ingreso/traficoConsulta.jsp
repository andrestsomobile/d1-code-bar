	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 



<td width="120">Trafico <br>
<html:text property="compania" size="10"  /><html:errors property="cia_ini"/>
		<%
				String[] parametros = new String[] { "0", ""};
		String[] parametros_total = new String[] {""};
		String[] campos_form= new String[] {"compania"};
		String[] campos_pick = new String[] {"trafcodsx"};
		String[] campos_entity= new String[] { "trafcodsx", "trafnumdta" };
		String[] nombres_campos_entity= new String[] {"Codigo", "Importacion" };
		String metodo  = "getlistatrafico";
		String metodo_total = "getTotalPaginaslistatrafico";
		%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="ingreso.control.gsttrafico" entidad="ingreso.entity.trafico" 
						formulario="reportesForm" metodo="<%= metodo %>" 
						metodo_total="<%= metodo_total %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
				<html:errors property="compania"/>

</td>

