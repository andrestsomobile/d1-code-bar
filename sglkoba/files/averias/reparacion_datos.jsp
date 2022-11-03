 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso " %>  

<%@page import="averias.form.reparacionForm"%>
<%@page import="pedido.control.gstpedido"%>
<%@page import="pedido.entity.pedido"%>
<%@page import="util.Fecha"%>
<html> 
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

		<div class="titulo"> Gestion de Datos de una Recuperaci&oacute;n </div> 
		<br> 

	<%
	reparacionForm rep_form = (reparacionForm)request.getAttribute("reparacionForm");

	boolean estramite = rep_form==null || (rep_form!=null && rep_form.getrepestado()!=null && rep_form.getrepestado().equals("TRAMITE"));  
	boolean existe = rep_form!=null && (!rep_form.getrepcodsx().equals("")); //|| (ave_form!=null && ave_form.getavecodsx()!=null && !ave_form.getavecodsx().equals(""));
	gstreparacion grep = new gstreparacion();
	String totalunidadesPleg = rep_form==null ? "0.00" : grep.getTotalUnidadesPleg(rep_form.getrepcodsx());
	String totalunidadesProd = rep_form==null ? "0.00" : grep.getTotalUnidadesProd(rep_form.getrepcodsx());
	%>	
		
		
		<html:form action="reparacionAction.do" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border='0' cellpadding='3' cellspacing='0' class='tabla_datos' width='90%'> 
			<tr> 
				<td>Consecutivo (automatico)
				<td><html:text property="repcodsx" readonly="true" styleClass="readonly"  /> 
			
				<td>Empresa
				<td><html:text property="nombrecia" readonly="true" styleClass="readonly"  /> 
				<html:hidden property="repcodcia"/>
				*<html:errors property="repcodcia"  /> 
				    <%			
    if(existe==false) {
    	%>
    <%	
    String[] parametros_cia = new String[] {  "0", ""};
	String[] parametros_total_cia = new String[] {""};
	String[] campos_form_cia= new String[] {"repcodcia" , "nombrecia" };
	String[] campos_pick_cia = new String[] {"comcodsx" , "comnombre"};
	String[] campos_entity_cia= new String[] {"comcodsx", "comnombre"};
	String[] nombres_campos_entity_cia= new String[] {"Codigo", "Nombre"};
	String formulario_cia = "reparacionForm";  
	String metodo_cia = "getlistacompania"; 
	String metodoTotal_cia = "getTotalPaginaslistacompania";
	%> <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
	<popup:boton clase="maestro.control.gstcompania" entidad="maestro.entity.compania" funcion_onclick="limpiarDatos()"
			formulario="<%=formulario_cia %>" metodo="<%=metodo_cia %>"
			metodo_total="<%=metodoTotal_cia %>"
			parametros="<%= parametros_cia %>" campos_form="<%= campos_form_cia %>"
			campos_pick="<%= campos_pick_cia %>"
			parametros_total="<%= parametros_total_cia %>" 
			campos_entity="<%= campos_entity_cia %>" nombres_campos_entity="<%= nombres_campos_entity_cia %>" /> 
<% } %>
				
				
				
			<tr> 
				<td>Fecha
				<td><html:text property="repfecha" readonly="true" styleClass="readonly" size="15" value="<%= existe ? rep_form.getrepfecha() : Fecha.getFecha() %>" /> 
				*<html:errors property="repfecha"  /> 
			 
				<td>Tipo saldo
				<td>
				<% 
				if(existe==false) {
					%>
				<html:select property="repsaldo"  >
					<html:option value="NAC">NAC</html:option>
					<html:option value="NNAC">NNAC</html:option>
				</html:select>
				<% } else  { %>
				<html:text property="repsaldo" readonly="true" styleClass="readonly"/>
				<% } %>
			<tr> 
				<td>Destino
				<td>
			<% 
				if(existe==false) {
					%>
				<html:select property="repdestino"  > 
					<html:option value="DESPIECE">DESPIECE POR AVERIA</html:option>
					<html:option value="PLEGADIZA">PLEGADIZA</html:option>
				</html:select>
			<% } else  { %>
				<html:text property="repdestino" readonly="true" styleClass="readonly"/>
				<% } %>
				<td>Estado
				<td>
     <% if(rep_form==null) {%> 
     <html:text property="repestado" value="TRAMITE" readonly="true" styleClass="readonly" size="10" /> 
      <% } else if(rep_form.getrepestado().equals("FINALIZADO")) {%> 
      		<html:text property="repestado" value="FINALIZADO"  readonly="true" styleClass="readonly" size="10"/> 
      <% } else { %> <html:select property="repestado"  > <html:option value="TRAMITE"> 
      TRAMITE</html:option> <html:option value="FINALIZADO"> FINALIZADO</html:option> 
      </html:select> <% } %> 
      <% if(gstpermiso.getAdministracion(session, "averias", "reparacion.jsp") && (estramite==false) ){ %>
     <br>  <a href="reparacionAction.do?opcion=activar&repcodsx=<%=rep_form.getrepcodsx() %>"> 
      Activar </a> <%}  %> 
			<tr> 
				<td>Observacion
				<td><html:textarea  property="repobservacion"  /> 
				<td colspan="2">&nbsp;
  			
			<%
			if(existe && rep_form.getrepestado().equals("FINALIZADO") && rep_form.getrepsaldo().equals("NAC") ) {
				gstpedido gped = new gstpedido();
				pedido ped = gped.getpedido(  rep_form.getReppedido());
				if(ped==null) {
				%>
	<A  href="main.jsp?app=averias&modulo=pedido_reparacion&repcodsx=<%= rep_form.getrepcodsx() %>">
	 CREAR UN PEDIDO </A>
				<% 			
				}else  {
				%>
	<A  href="pedidoAction.do?opcion=set&pedcodsx=<%= rep_form.getReppedido() %>">
VER PEDIDO </A>
				<%
				}
				}
			%>
			<tr>
				<td width="20%">Total Plegadiza
                <td width="32%"><%=totalunidadesPleg%>
                <td width="20%">Total Producto
                <td width="32%"><%=totalunidadesProd%>  	
				
				<tr align="center"> 
				<td colspan="4">  
 <%if(gstpermiso.getEscritura(session, "averias", "reparacion.jsp") && (existe==false ||  (existe && rep_form.getrepestado().equals("TRAMITE")) )){ %> 
<html:submit  value="Grabar"/> 
 <% } %> <html:button  property="cancelar" value="Cancelar" onclick="window.location='main.jsp?app=averias&modulo=reparacion'" />
		</table> 		</html:form> 		</html> 
		
<%if(existe) { %>		

<%@include file="reparacion_detalle.jsp" %>

<% } %>
		