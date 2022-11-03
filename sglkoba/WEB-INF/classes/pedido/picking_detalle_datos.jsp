
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso, pedido.control.*, pedido.entity.* " %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

		<div class="titulo"> Gestion de Datos de un picking_detalle </div> 
		<br> 
		
		<%
		String pickdcodpicking = request.getParameter("pickdcodpicking");
		gstpicking gpick = new gstpicking();
		picking pick = gpick.getpicking( pickdcodpicking);
		%>
		
		<html:form action="picking_detalleAction.do" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border="0" width='80%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
			<tr> 
				<td>Consecutivo
				<td><html:text property="pickdcodsx" readonly="true" styleClass="readonly"  /> 
<html:hidden property="pickdcodpicking" value="<%= pickdcodpicking %>"  /> 
			<tr> 
				<td>Producto
				<td><html:hidden property="pickdproducto"  /> 
				<html:text  property="promodelo" readonly="true" styleClass="readonly"/>
				<br>
				<html:text  property="prodesc" readonly="true" styleClass="readonly"/>
				<%
				String packcodsx = pick.getpickcodpacking();
				String[] parametros = new String[] {packcodsx, "0", ""};
				String[] parametros_total = new String[] {packcodsx, ""};
				String[] campos_form= new String[] {"pickdproducto","promodelo",  "prodesc"};
				String[] campos_pick = new String[] {"Uno", "Dos", "Tres"};
				String[] campos_entity= new String[] {"Dos", "Tres", "Cuatro" , "Cinco"};
				String[] nombres_campos_entity= new String[] {"Material", "Descripcion" , "Total" , "Disponible"};
				String metodo  = "getListadoProductosPacking";
				String metodo_total = "getTotalListadoProductosPacking";
		%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstproducto" entidad="util.Listado" 
						formulario="picking_detalleForm" metodo="<%= metodo %>"
						metodo_total="<%= metodo_total %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
				<html:errors property="pickdproducto"/>
			<tr> 
				<td>Cantidad
				<td><html:text property="pickdtotal"  />  <html:errors property="pickdtotal"/>
				<tr> 
				<td>Valor unit
				<td><html:text property="pickdvalorunit"  />$  <html:errors property="pickdvalorunit"/>
				
				<tr align="center"> 
				<td colspan="2">   
 <%if(gstpermiso.getEscritura(session, "pedido", "picking_detalle.jsp") ){ %> 
<html:submit  value="Grabar"/> 
 <% } %> <input type="button"  name="cancelar" value="Cancelar" onclick="window.location='pickingAction.do?opcion=set&codsx=<%=  pickdcodpicking %>'" />
		</table> 		</html:form> 		</html> 