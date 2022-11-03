
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso, pedido.form.*, pedido.control.*, pedido.entity.*, maestro.control.*, maestro.entity.* " %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 
<%
pickingForm pick_form = (pickingForm)request.getAttribute("pickingForm");
gstcompania gcia = new gstcompania();
gstpicking gpick = new gstpicking(); 
%>
		<div class="titulo"> Gestion de Datos de un picking </div> 
		<br> 
		<%if(pick_form!=null) { %>
		<div align="right"><a href="main.jsp?app=pedido&modulo=picking_resumen&pickcodsx=<%= pick_form.getpickcodsx() %>"> Formato Resumen </a> </div>
	<% } %>	
		<html:form action="pickingAction.do" method="post" > 
		<html:hidden property="opcion"/> 
		
<table align="center" border="0" width='80%' cellpadding="3" cellspacing="0" class="tabla_datos">
  <tr> 
    <td>Consecutivo 
    <td><html:text property="pickcodsx" readonly="true" styleClass="readonly" /> 
    <td>Empresa 
    <td colspan="3"><%
    	if(pick_form==null) { 
					request.setAttribute("listaCompania", gcia.getlistacompania());
	%> <html:select property="pickempresa"> <html:options collection="listaCompania"  property="comcodsx" labelProperty="comnombre"   /> 
      </html:select> <% } else {%> <html:hidden property="pickempresa"  /> <input type="text" value="<%= gcia.getcompania(pick_form.getpickempresa()).getcomnombre()  %>" readonly="true" class="readonly" > 
      <% } %> 
  <tr> 
    <td>Fecha 
    <td><html:text property="pickfecha"  readonly="true" styleClass="readonly" value="<%= pick_form==null ? util.Fecha.getFecha() : pick_form.getpickfecha() %>" /> 
    <td>Packing Asociado 
    <td colspan="3"><html:text property="pickcodpacking" size="8" readonly="true" styleClass="readonly" /> 
      <% 
			   if(pick_form==null || pick_form.getpickcodpacking().equals("")  ) {
String cia = pick_form==null ?  "'+ pickingForm.pickempresa.options[pickingForm.pickempresa.selectedIndex].value  + '" : "'+ pickingForm.pickempresa.value   + '";

				String[] parametros = new String[] {  cia, "0", ""};
				String[] parametros_total = new String[] {cia, ""};
				String[] campos_form= new String[] {"pickcodpacking"};
				String[] campos_pick = new String[] {"packcodsx"};
				String[] campos_entity= new String[] {"packcodsx", "packfecha" };
				String[] nombres_campos_entity= new String[] {"Consecutivo", "Fecha"};
				String formulario = "pickingForm"; 
				String metodo = "getlistapackingConSaldo"; 
				String metodoTotal = "getTotalPaginaslistapackingConSaldo";
				
				%> <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="pedido.control.gstpacking" entidad="pedido.entity.packing" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" /> 
      <%} %> <html:errors property="pickcodpacking"/> &nbsp; 
  <tr> 
    <td>Observaciones 
    <td><html:textarea property="pickobservaciones"  /> 
    <td>Estado 
    <td colspan="3"> <% if(pick_form==null) {				%> <html:text property="pickestado" value="TRAMITE" readonly="true" styleClass="readonly" /> 
      <% } else if(pick_form.getpickestado().equals("FINALIZADO")) {%> <html:text property="pickestado" value="FINALIZADO"  readonly="true" styleClass="readonly" /> 
      <% } else { %> <html:select property="pickestado"  > <html:option value="TRAMITE"> 
      TRAMITE</html:option> <html:option value="FINALIZADO"> FINALIZADO</html:option> 
      </html:select> <% } %> <% if(gstpermiso.getAdministracion(session, "pedido", "picking.jsp") && (pick_form!=null && pick_form.getpickestado().equals("FINALIZADO")) ){ %> <a href="javascript:if(confirm('Seguro desea activar el Picking? si hace esto eliminara las referencias del pedido')) window.location='pickingAction.do?opcion=activar&codsx=<%=pick_form.getpickcodsx() %>';"> 
      Activar </a> <%}  %> 
  <tr> 
    <td>Peso Neto 
    <td><html:text property="pickpesoneto" readonly="true" styleClass="readonly" size="10"/>  KGM
    <td>Peso Bruto 
    <td><html:text property="pickpesobruto" readonly="true" styleClass="readonly" size="10"/> KGM
    <td>Valor
    <td><html:text property="pickvalor" readonly="true" styleClass="readonly" size="10"/> $

  <tr> 
    <td>Numero de pedido
    <td><html:text property="picknumpedido" />  
    <td>&nbsp;
    <td>&nbsp;
    <td>&nbsp;
    <td>&nbsp;
    
  <tr> 
    <td>Pedido Asociado <html:hidden property="pickpedido"/>
    <td colspan="5"> <%
				if(pick_form==null || (pick_form!=null && pick_form.getpickestado().equals("TRAMITE"))) {
				%>
      No se puede gestionar el pedido en el estado TRAMITE 
      <% 	
				}else {
				String pedido = pick_form!=null && pick_form.getpickcodsx()!=null && !pick_form.getpickcodsx().equals("") ?  gpick.tienepedido(pick_form.getpickcodsx() ) : null;
				if(pedido==null) {
					//no tiene pedido
				%> <a href="main.jsp?app=pedido&modulo=pedido_datos&pedpicking=<%= pick_form.getpickcodsx() %>&pednumpedido=<%= pick_form.getPicknumpedido()%>" >Generar 
      Pedido </a> <% }  else { %> <a href="pedidoAction.do?opcion=set&pedcodsx=<%= pedido %>" >Ver 
      Pedido </a> <%}   }%> 
  <tr align="center"> 
    <td colspan="6"> <%if(gstpermiso.getEscritura(session, "pedido", "picking.jsp") ){ %> <html:submit  value="Grabar"/> <% } %> <html:button  property="cancelar" value="Cancelar" onclick="window.location='main.jsp?app=pedido&modulo=picking'" /> 
</table>
</html:form> 		</html> 
		
		 
 <% if(pick_form!=null && !pick_form.getpickcodsx().equals("") ) {
 String pickcodsx= pick_form.getpickcodsx();
 boolean tramite = pick_form.getpickestado().equals("TRAMITE") ;
 %>
<%@include file="picking_detalle.jsp" %>
<% } %>