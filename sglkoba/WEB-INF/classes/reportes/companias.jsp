	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 

<td width="120">Desde Compania <br>
<html:text property="cia_ini" size="10"  /><html:errors property="cia_ini"/>
		<%
				String[] parametros = new String[] { "0", ""};
		String[] parametros_total = new String[] {""};
		String[] campos_form= new String[] {"cia_ini"};
		String[] campos_pick = new String[] {"comcodsx"};
		String[] campos_entity= new String[] { "comcodsx", "comnombre" };
		String[] nombres_campos_entity= new String[] {"Codigo", "Nombre" };
		String metodo  = "getlistacompania";
		String metodo_total = "getTotalPaginaslistacompania";
		%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstcompania" entidad="maestro.entity.compania" 
						formulario="reportesForm" metodo="<%= metodo %>" 
						metodo_total="<%= metodo_total %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
				<html:errors property="cia_ini"/>

</td>
<td width="120">Hasta Compania <br>
<html:text property="cia_fin" size="10" /><html:errors property="cia_fin"/>
		<%
				campos_form= new String[] {"cia_fin"};
		%>
				<popup:boton clase="maestro.control.gstcompania" entidad="maestro.entity.compania" 
						formulario="reportesForm" metodo="<%= metodo %>" 
						metodo_total="<%= metodo_total %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
				<html:errors property="cia_ini"/>

</td>