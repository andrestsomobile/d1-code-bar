	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<%@page import="ingreso.control.gsttrafico"%>
<td>
BL: <html:text property="embarque"   />


		<% 
				parametros = new String[] {"' +   document.reportesForm.compania.value  + '", "0", ""};
				parametros_total = new String[] {"' +  document.reportesForm.compania.value  + '", ""};
				campos_form= new String[] {"embarque"};
				campos_pick = new String[] {"trafdocumento"};
				campos_entity= new String[] { "trafcodsx","trafembarque", "trafdocumento" };
				nombres_campos_entity= new String[] {"Consecutivo", "Embarque" , "Documento Transporte"};
				metodo  = "getlistatrafico";
				metodo_total = "getTotalPaginaslistatrafico";
		%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="ingreso.control.gsttrafico" entidad="ingreso.entity.trafico" 
						formulario="reportesForm" metodo="<%= metodo %>" 
						metodo_total="<%= metodo_total %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
				<html:errors property="categoria"/>
