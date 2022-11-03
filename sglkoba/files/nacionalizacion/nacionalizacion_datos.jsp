
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import="nacionalizacion.control.*, nacionalizacion.form.*, maestro.control.gstcompania, administracion.control.* " %>  

		<html> 
		<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 
<%
nacionalizacionForm nac_form = (nacionalizacionForm)request.getAttribute("nacionalizacionForm");
String naccodsx = nac_form==null || ( nac_form!=null && nac_form.getnaccodsx()==null) ? null : nac_form.getnaccodsx();
gstcompania gcia = new gstcompania(); 
gstnacionalizacion gnac = new gstnacionalizacion();
String totalunidades = nac_form==null ? "0.00" : gnac.getTotalUnidades(naccodsx);
%>	
		<div class="titulo"> Gestion de Datos de una Nacionalizacion </div> 
		<html:form action="nacionalizacionAction.do?app=nacionalizacion&modulo=nacionalizacion_datos" method="post" > 
		<html:hidden property="opcion"/> 
		
	
		 
<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
  <tr> 
    <td>Consecutivo 
    <td><html:text property="naccodsx" styleClass="readonly" readonly="true" /> 
    <td>Empresa 
    <td> <%if(naccodsx==null) { 
					
					request.setAttribute("listaCompania", gcia.getlistacompania());
				%> <html:select property="nacempresa" > 
      <html:options collection="listaCompania"  
					property="comcodsx" labelProperty="comnombre"   /> </html:select> 
      <% } else {%> <html:hidden property="nacempresa"  /> <input type="text" value="<%= gcia.getcompania(nac_form.getnacempresa()).getcomnombre()  %>" readonly="true" class="readonly" >
      <% } %> 
  <tr> 
    <td>Fecha 
    <td><html:text property="nacfecha" styleClass="readonly" readonly="true" value="<%= naccodsx == null ?  util.Fecha.getFecha() : nac_form.getnacfecha() %>" /> 
      *<html:errors property="nacfecha"  /> 
    <td>Tipo Nacionalizacion
    <td> 
    <% if(naccodsx==null || (naccodsx!= null && naccodsx.equals(""))) { %>
    <html:select property="nactipo" > 
			<html:option value="REFERENCIA">REFERENCIA</html:option>
    		<html:option value="GLOBAL">GLOBAL</html:option>
    </html:select>
	<% }else { %>   
	<html:text property="nactipo" readonly="true" styleClass="readonly" />
	<% } %>
  <tr> 
    <td>Ingreso 
    <td><html:text property="nacingreso" readonly="true" styleClass="readonly"  /> 
      *<html:errors property="nacingreso"  /> <% if(naccodsx==null || ( naccodsx!=null && naccodsx.equals("")  )) {				%> 
      <%
String cia = naccodsx==null ?  "'+ nacionalizacionForm.nacempresa.options[nacionalizacionForm.nacempresa.selectedIndex].value  + '" : "'+ nacionalizacionForm.nacempresa.value   + '";

				String[] parametros = new String[] {  cia, "0", ""};
				String[] parametros_total = new String[] {cia, ""};
				String[] campos_form= new String[] {"nacingreso", "nacfechaingresobodega"};
				String[] campos_pick = new String[] {"ingcodsx", "ingfecha"};
				String[] campos_entity= new String[] {"ingcodsx", "ingfecha", "Ingcausal",  "Ingobservacion" , "Ingestado", "Ingconsec" , "Ingconseczfp"};
				String[] nombres_campos_entity= new String[] {"Consecutivo", "Fecha","Embarque" ,  "Documento Transporte", "Documento Transito", "Consec ZF" , "Numero FM (aprobacion) ZF"};
				String formulario = "nacionalizacionForm";
				String metodo = "getlistaingreso_nacionalizaciones"; 
				String metodoTotal = "getTotalPaginaslistaingreso_nacionalizaciones";
				%> <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> <popup:boton clase="ingreso.control.gstingreso" entidad="ingreso.entity.ingreso" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" /> 
      <% } %> 
    <td>Fecha Ingreso 
    <td><html:text property="nacfechaingresobodega" styleClass="readonly" readonly="true"  /> 
      *<html:errors property="nacfechaingresobodega"  /> 
  <tr> 
    <td>Declaracion 
    <td><html:text property="nacdeclaracion" /> *<html:errors property="nacdeclaracion"  /> 
    <td>Fecha Declaracion 
    <td><html:text property="nacfechadeclaracion"  styleClass="readonly" readonly="true"  /> 
      *<html:errors property="nacfechadeclaracion"  /> <a
				href="javascript:show_calendar('nacionalizacionForm.nacfechadeclaracion');"> 
      <img src="./disenno/images/calendar.gif" class="lupita"> </a> 
      
  <html:hidden property="nacpaginainicial"  value="0"/> *<html:errors property="nacpaginainicial"   /> 
  <html:hidden property="nacpaginafinal" value="0" /> *<html:errors property="nacpaginafinal"  /> 
  <html:hidden property="nacdosia" value="0"/> *<html:errors property="nacdosia"  /> 
  
	<html:hidden property="nacconsec" value="0" />  <html:errors property="nacconsec"  /> 
	   
	<html:hidden property="nacconseczfp" value="0" />  <html:errors property="nacconseczfp"  /> 
  
  
  <tr> 
    <td>Peso Neto
    <td><html:text property="nacpesoneto"  readonly="true" styleClass="readonly"/> KGM
    <td>Peso Bruto
    <td><html:text property="nacpesobruto" readonly="true" styleClass="readonly"/> KGM
  
  <tr> 
    <td>FOB
    <td><html:text property="nacfob"  readonly="true" styleClass="readonly"/> USD 
    <td width="20%">Total Unidades
    <td width="32%"><%=totalunidades%> 

  
  
  <tr> 
    <td>Estado 
    <td> <% if(naccodsx==null) {				%> <html:text property="nacestado" value="TRAMITE" readonly="true" styleClass="readonly" /> 
      <% } else if(nac_form.getnacestado()!=null && nac_form.getnacestado().equals("FINALIZADO")) {%> <html:text property="nacestado" value="FINALIZADO"  readonly="true" styleClass="readonly" /> 
      <% } else { %> <html:select property="nacestado"  > <html:option value="TRAMITE"> 
      TRAMITE</html:option> <html:option value="FINALIZADO"> FINALIZADO</html:option> 
      </html:select> <% } %> <html:errors property="nacestado"/> 
    <td>Observaciones
    <td><html:textarea property="nacobservaciones"></html:textarea>
  <tr align="center"> 
    <td colspan="4">
    <%
    if(gstpermiso.getEscritura(session, "nacionalizacion", "nacionalizacion_datos.jsp")) {
    	if(nac_form==null ||  nac_form!=null && nac_form.getnacestado()!=null && nac_form.getnacestado().equals("TRAMITE")) {
    %>
    <html:submit  value="Grabar"/> 
    <html:button  property="prueba" value="Cancelar" onclick="window.location='main.jsp?app=nacionalizacion&modulo=nacionalizacion_datos'" />
    <%} else if(nac_form!=null && nac_form.getnacestado()!=null && nac_form.getnacestado().equals("FINALIZADO")) {  %>
    
    <a href="nacionalizacionAction.do?opcion=activar&codsx=<%= nac_form.getnaccodsx() %>"> ACTIVAR NACIONALIZACION</a>
    <BR>
<%--     <a href="javascript:window.location='nacionalizacionAction.do?opcion=actualizar_consecutivo_zf&codsx=<%=nac_form.getnaccodsx()%>&nacconsec='+document.nacionalizacionForm.nacconsec.value+'&nacconseczfp='+document.nacionalizacionForm.nacconseczfp.value ">ACTUALIZAR CONSECUTIVOS ZONA FRANCA</a> --%>
    <% } %>
    <% } %>
    <BR>
    <% if(nac_form!=null ) {  %>
    	<a href="main.jsp?app=nacionalizacion&modulo=subirAdjuntoNacionalizacion&clave=<%=nac_form.getnaccodsx() %>">Cargar Documentos Nacionalizacion </a>
    <% } %>  
</table> 		
</html:form> 		
<% if(naccodsx!=null && !naccodsx.equals("") ) {%>
<%@include file="nacionalizacion_detalle.jsp" %>
<% } %>

</html> 