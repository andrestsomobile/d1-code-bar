
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso, pedido.form.packingForm, maestro.control.gstcompania" %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

<%

packingForm pack_form = (packingForm)request.getAttribute("packingForm");
gstcompania gcia = new gstcompania();

%>		

		<div class="titulo"> Gestion de Datos de un packing </div> 
		<br> 
	<%if(pack_form!=null) { %>
		<div align="right"><a href="main.jsp?app=pedido&modulo=packing_resumen&packcodsx=<%= pack_form.getpackcodsx() %>"> Formato Resumen </a> </div>
	<% } %>	
		<html:form action="packingAction.do" method="post" > 
		<html:hidden property="opcion"/> 
		
<table align="center" border="0" width='80%' cellpadding="3" cellspacing="0" class="tabla_datos">
  <tr> 
    <td>Consecutivo 
    <td><html:text property="packcodsx"  readonly="true" styleClass="readonly" /> 
    <td>Empresa 
    <td colspan="3"> <%
    	if(pack_form==null) { 
					request.setAttribute("listaCompania", gcia.getlistacompania());
	%> <html:select property="packempresa"> 
      <html:options collection="listaCompania"  property="comcodsx" labelProperty="comnombre"   /> 
      </html:select> <% } else {%> <html:hidden property="packempresa"  /> <input type="text" value="<%= pack_form!=null ? gcia.getcompania(pack_form.getpackempresa()).getcomnombre()  : ""%>" readonly="true" class="readonly" > 
      <% } %> 
  <tr> 
    <td>Fecha 
    <td><html:text property="packfecha" readonly="true" styleClass="readonly" value="<%= pack_form==null ? util.Fecha.getFecha() : pack_form.getpackfecha() %>"  /> 
    <td>Observaciones 
    <td colspan="3"><html:textarea property="packobservaciones"  /> 
  <tr> 
    <td>Estado 
    <td> <% if(pack_form==null) {				%> <html:text property="packestado" value="TRAMITE" readonly="true" styleClass="readonly" size="10" /> 
      <% } else if(pack_form.getpackestado().equals("FINALIZADO")) {%> <html:text property="packestado" value="FINALIZADO"  readonly="true" styleClass="readonly" size="10"/> 
      <% } else { %> <html:select property="packestado"  > <html:option value="TRAMITE"> 
      TRAMITE</html:option> <html:option value="FINALIZADO"> FINALIZADO</html:option> 
      </html:select> <% } %> <% if(gstpermiso.getAdministracion(session, "pedido", "packing.jsp") && (pack_form!=null && pack_form.getpackestado().equals("FINALIZADO")) ){ %> <a href="packingAction.do?opcion=activar&codsx=<%=pack_form.getpackcodsx() %>"> 
      Activar </a> <%}  %> 
    <td>Peso N
    <td> <html:text property="packpesoneto" readonly="true" styleClass="readonly" size="10"/>  KGM
    <td>Peso B
    <td> <html:text property="packpesobruto" readonly="true" styleClass="readonly" size="10" /> KGM
  <tr align="center"> 
    <td colspan="6"> <%
 
 if(gstpermiso.getEscritura(session, "pedido", "packing.jsp") ){ %> <%
 if(pack_form==null || (pack_form!=null && pack_form.getpackestado().equals("TRAMITE")))  {
 %> <html:submit  value="Grabar"/> <% } %> <% } %> <html:button  property="cancelar" value="Cancelar" onclick="window.location='main.jsp?app=pedido&modulo=packing'" /> 
 
 <%  
 //miro si tiene permisos de administracion para descompometer el saldo restante:
  if(gstpermiso.getAdministracion(session, "pedido", "packing.jsp") ){
	  if(pack_form!=null && !pack_form.getpackcodsx().equals("") && pack_form.getpackestado().equals("FINALIZADO")) {
 %>
<A href="javascript:if(confirm('Seguro desea LIBERAR los saldos del Packing? si hace esto ya no podra realizar mas PICKINGS'))  window.location='packingAction.do?opcion=descomprometer&codsx=<%= pack_form.getpackcodsx() %>';" > 
DESCOMPROMETER SALDO 
</A>
 <% 
	  }
 }
 %>
 
</table>
</html:form>
		
		
		
		 <%
 //ahora coloco la lista de packing_detalle
 %>
 
 <% if(pack_form!=null && !pack_form.getpackcodsx().equals("") ) {
 String packcodsx= pack_form.getpackcodsx();
 boolean tramite = pack_form.getpackestado().equals("TRAMITE") ;
 %>
<%@include file="packing_detalle.jsp" %>
<% } %>
 
		
		
		
		 		</html> 