
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso, pedido.control.*,pedido.entity.*, pedido.form.*" %>  

<html> 
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%>
 

<%
gstpedido gped = new gstpedido();  
maestro.control.gstbodega gbod = new maestro.control.gstbodega();

String pedcodsx = request.getParameter("pedcodsx");
referencia_pedidoForm pdf = (referencia_pedidoForm)request.getAttribute("referencia_pedidoForm");

%>
<div class="titulo"> Gestion de Datos de un referencia_pedido </div> 
<br> 

<html:form action="referencia_pedidoAction.do" method="post" > 
<html:hidden property="opcion"/> 
<input type="hidden" name="pedcodsx"  value="<%= pedcodsx %>">
<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
	<tr>
		<td colspan="2">Agrege referencias individuales a un pedido: se agregan por producto / posicion
	<tr> 
		<td>Consecutivo
		<td><html:text property="refpcodsx" readonly="true" styleClass="readonly" />  Automatico, generado por el Sistema
<html:hidden property="refpnumpedido" value="<%= pedcodsx %>"  /> 
				 
 

	<tr> 
		<td>Producto
		<td><html:hidden property="refpproducto"   /> 
			<html:text property="prodesc"  readonly="true" styleClass="readonly" /> 
			*<html:errors property="refpproducto"  /> 
		<%
				String cia = ped.getpedcompania();
				
		//		String[] parametros = new String[] {cia, "0", ""};
		//		String[] parametros_total = new String[] {cia, ""};
				
				
				
				
				
				String[] parametros = new String[] {  cia, ped.getpedtipo(), "0", ""};
				String[] parametros_total = new String[] {cia, ped.getpedtipo(), ""};
				String[] campos_form= new String[] {"refpproducto", "prodesc"};
				String[] campos_pick = new String[] {"Uno", "Dos"};
				String[] campos_entity= new String[] {"Uno", "Dos",  "Tres" , "Cuatro"};
				String[] nombres_campos_entity= new String[] {"Consecutivo", "Material",  "Descripcion", "Saldo ("  +  ped.getpedtipo() + ")" };
			
				
				String metodo = "getlistaproductoConSaldo";  
				String metodo_total = "getTotalPaginaslistaproductoConSaldo";
		%>
			 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
			<popup:boton clase="maestro.control.gstproducto" entidad="maestro.entity.producto" 
						formulario="referencia_pedidoForm" metodo="<%= metodo %>"
						metodo_total="<%= metodo_total %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
	<tr>
		<td>Bodega
		<td><html:select property="refpbodega"  > 
		<%
			java.util.Collection bodegas = new maestro.control.gstbodega().getlistabodega();
			request.setAttribute("bodegas", bodegas);
		%>
		    <html:options collection="bodegas"  
					property="bodcodsx" labelProperty="bodnombre"   />
			</html:select>
				
	<tr> 
		<td>Posicion
		<td><html:text property="refpposicion"   /> 
			<a href="#" onclick="showmapa( document.referencia_pedidoForm.refpbodega.value, 'refpposicion', 'referencia_pedidoForm',   document.referencia_pedidoForm.refpproducto.value,  '<%= ped.getpedtipo() %>')">Mapa </a>
			*<html:errors property="refpposicion"  /> 
	<tr> 
		<td>Cantidad x UMP
		<td><html:text property="refpcantidad"  /> 
		*<html:errors property="refpcantidad"  /> 
	<tr> 
		<td>Valor unitario
		<td><html:text property="refpvalorunit"  /> 
			*<html:errors property="refpvalorunit"  /> 
	<tr> 
		<td>Valor total
		<td><html:text property="refpvalortotal" readonly="true" styleClass="readonly" /> 
	<tr align="center"> 
		<td colspan="2">   
 	<%if(gstpermiso.getEscritura(session, "pedido", "referencia_pedido.jsp")  && (  ped.getPedpicking()==null || ped.getPedpicking().equals("")   )){ %> 
		<html:submit  value="Grabar"/> 
 	<% } %> 
	<input type="button"   value="Cancelar" onclick="window.location='main.jsp?app=pedido&modulo=referencia_pedido&pedcodsx=<%= pedcodsx %>'" />
</table>
</html:form>
		
</html> 