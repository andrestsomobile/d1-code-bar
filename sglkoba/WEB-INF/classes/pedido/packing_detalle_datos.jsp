
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso " %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

<%
String packcodsx = request.getParameter("packdpacking");
pedido.entity.packing pack = new pedido.control.gstpacking().getpacking(packcodsx);
%>
		<div class="titulo"> Gestion de Referencias por Packing </div> 
		<br> 
		<html:form action="packing_detalleAction.do" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border="0" width='80%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
			<tr> 
				<td>Consecutivo
				<td><html:text property="packdcodsx" readonly="true" styleClass="readonly"   /> 
				<html:hidden property="packdpacking" value="<%= pack.getpackcodsx() %>" /> 
			<tr> 
				<td>Producto
				<td><html:hidden property="packdproducto" /> 
				<html:text property="promodelo"  readonly="true" styleClass="readonly" /> 
				<html:text property="prodesc"  readonly="true" styleClass="readonly" /> 
				<%
				String cia = pack.getpackempresa();
				
				String[] parametros = new String[] {  cia, "NAC", "0", ""};
				String[] parametros_total = new String[] {cia, "NAC", ""};
				String[] campos_form= new String[] {"packdproducto", "promodelo", "prodesc"};
				String[] campos_pick = new String[] {"Uno", "Dos", "Tres"};
				String[] campos_entity= new String[] {"Dos",  "Tres" , "Cuatro"};
				String[] nombres_campos_entity= new String[] {"Material",  "Descripcion", "Saldo (NAC)" };
				String metodo = "getlistaproductoConSaldo";  
				String metodoTotal = "getTotalPaginaslistaproductoConSaldo";

		%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstproducto" entidad="maestro.entity.producto" 
						formulario="packing_detalleForm" metodo="<%= metodo %>"
						metodo_total="<%= metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
				

				<html:errors property="packdproducto"/>
				
				
			<tr> 
				<td>Cantidad Total (El sistema asignara las posiciones automaticamente)
				<td><html:text property="packdtotal"  />  <html:errors property="packdtotal"/>
				<tr align="center"> 
				<td colspan="2">   
 <%if(gstpermiso.getEscritura(session, "pedido", "packing_detalle.jsp") ){ %> 
<html:submit  value="Grabar"/> 
 <% } %> <input type="button"   value="Cancelar" onclick="window.location='packingAction.do?opcion=set&codsx=<%= packcodsx %>'" >
		</table> 		</html:form> 		</html> 