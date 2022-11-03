	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<html>



<td width="120">Usuario<br>
<html:text property="usuario" size="10" /> <html:errors property="usuario"/>
		<%
				parametros = new String[] { "0", ""};
				parametros_total = new String[] { ""};
				campos_form= new String[] {"usuario"};
				campos_pick = new String[] {"usucodsx"};
				campos_entity= new String[] { "usucodsx", "usunombre" ,"usulogin"};
				nombres_campos_entity= new String[] {"Codigo", "Nombre" ,"Login"};
				metodo  = "getlistausuario";
				metodo_total = "getTotalPaginaslistausuario";
		%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="administracion.control.gstusuario" entidad="administracion.entity.usuario" 
						formulario="reportesForm" metodo="<%= metodo %>" 
						metodo_total="<%= metodo_total %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>"  />


</td>
