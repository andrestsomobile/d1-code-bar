
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import="maestro.control.*,ingreso.form.ingresoForm, administracion.control.gstpermiso" %>  

		<html> 
		
		<script type="text/javascript">
		
		function limpiarDatos() {

			document.ingresoForm.ingtrafico.value='';
			document.ingresoForm.ingcausal.value='';
			document.ingresoForm.ingcli_devolucion.value='';
			document.ingresoForm.ingciudad_dev.value='';

		}
			function setbotontrafico() { 
				if(document.ingresoForm.ingtipo.options[ingresoForm.ingtipo.selectedIndex].value=='TRAFICO') {
					
					document.getElementById('trafico').style.display='block';
				}else {
				  document.getElementById('trafico').style.display='none';
				  document.ingresoForm.ingtrafico.value='';
				}
			
				if(document.ingresoForm.ingtipo.options[ingresoForm.ingtipo.selectedIndex].value=='DEVOLUCION') {
					
					document.getElementById('causal').style.display='block';
				}else {
				  document.getElementById('causal').style.display='none';
				}
			}
			
			
			
		function validartrafico() {
			if(document.ingresoForm.ingtipo.options[ingresoForm.ingtipo.selectedIndex].value=='TRAFICO') {
				if( document.ingresoForm.ingtrafico.value=='') {
					alert('Si el ingreso es de tipo trafico, debe seleccionar uno de la lista o escribir el consecutivo');
					return false;
				}
			}
			
			if(document.ingresoForm.ingtipo.options[ingresoForm.ingtipo.selectedIndex].value=='DEVOLUCION') {
				if( document.ingresoForm.ingcli_devolucion.value=='') {
					alert('Si el ingreso es de tipo DEVOLUCION, debe seleccionar el cliente');
					return false;
				}
				if( document.ingresoForm.ingciudad_dev.value=='') {
					alert('Si el ingreso es de tipo DEVOLUCION, debe seleccionar la CIUDAD');
					return false;
				}
			}
			
		}
		</script>
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 
<%
gstreferencia_trafico greft = new gstreferencia_trafico();
gstingreso ging = new gstingreso();
ingresoForm ingf = (ingresoForm)request.getAttribute("ingresoForm");
String ingcodsx = ingf==null ? null : ingf.getingcodsx();
String totalunidades = ingf==null ? "0.00" : ging.getTotalUnidadesIngreso(ingcodsx);
boolean sin_pos = false;
sin_pos = ingcodsx != null ? ging.tiene_entradas_sin_posicion(ingcodsx) : false;
%>
		<div class="titulo"> Gestion de Datos de un ingreso </div> 
		<br> 
		<html:form action="ingresoAction.do?app=ingreso&modulo=ingreso_datos" method="post" onsubmit="return validartrafico()" > 
		<html:hidden property="opcion"/> 
		
<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos">
  <tr> 
    <td width="16%">Consecutivo 
    <td width="6%"><html:text property="ingcodsx" readonly="true" styleClass="readonly"  /> 
      <%
			gstcompania gcia = new gstcompania();
			request.setAttribute("listaCompania", gcia.getlistacompania());
		%> 
		
	 <td>Compania
	    <td><html:hidden      property="ingcodcia"  />
	<html:text property="nombrecia" size="20" readonly="true" styleClass="readonly" />
	    <%			
	    if(ingcodsx == null || (totalunidades != null && totalunidades.equals("0.00"))) {
	    	%>
	    	
	    <%	
	    String[] parametros_cia = new String[] {  "0", ""};
		String[] parametros_total_cia = new String[] {""};
		String[] campos_form_cia= new String[] {"ingcodcia", "nombrecia" };
		String[] campos_pick_cia = new String[] {"comcodsx" , "comnombre"};
		String[] campos_entity_cia= new String[] {"comcodsx", "comnombre"};
		String[] nombres_campos_entity_cia= new String[] {"Codigo", "Nombre"};
		String formulario_cia = "ingresoForm";  
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
    <td>Fecha Ingreso 
    <td> <html:text property="ingfecha" value="<%= ingf==null ? util.Fecha.getFecha() : ingf.getingfecha() %>" readonly="true" styleClass="readonly"  /> 
      *<html:errors property="ingfecha"  /> 
    <td>Tipo 
    <td colspan="3"> <%if(ingf==null) { %> 
      <html:select property="ingtipo"  onchange="setbotontrafico()"   > 
      <html:option  value="TRAFICO">TRAFICO</html:option> 
      <html:option  value="DEVOLUCION">DEVOLUCION</html:option> 
      <html:option  value="DESPIECE">DESPIECE</html:option>
      <html:option  value="AJUSTE">AJUSTE</html:option>
       </html:select> <% } else { %> <html:text property="ingtipo" readonly="true" styleClass="readonly"  /> 
      <% } %> <% if( ingf==null || ingf!=null && ingf.getingtipo().equals("TRAFICO") && ( ingf.getIngestado().equals("TRAMITE") || ingf.getIngestado().equals("FINALIZADO")  )) { %> 
  <tr> 
    <td>Trafico 
    <td colspan="1"> <span id="trafico" style="display=block" > <html:text property="ingtrafico" readonly="true" styleClass="readonly"  /> 
      <html:errors property="ingtrafico"/>
      <html:hidden property="ingconsec" value="0" />
      <html:hidden property="ingconseczfp" value="0"/> 
      <% 
      
      if( ingf==null || ingf!=null && ingf.getingtipo().equals("TRAFICO") && ( ingf.getIngestado().equals("TRAMITE")   )  && (ging.getTotalReferenciasIngreso( ingf.getingcodsx())==0) ) { %>
      <%
		//String cia = ingf==null ? "'+ ingresoForm.ingcodcia.options[ingresoForm.ingcodcia.selectedIndex].value  + '" : " ' + ingresoForm.ingcodcia.value + '";				
      String cia = "'+ ingresoForm.ingcodcia.value   + '";
				String[] parametros = new String[] {  cia, "0", ""};
				String[] parametros_total = new String[] {cia, ""};
				String[] campos_form= new String[] {"ingtrafico", "ingconsec" , "ingconseczfp"};
				String[] campos_pick = new String[] {"trafcodsx", "trafconsec" , "trafnumerofmm"};
				String[] campos_entity= new String[] {"trafcodsx", "trafdocumento", "trafnumdta", "trafconsec" , "trafnumerofmm"};
				String[] nombres_campos_entity= new String[] {"Consecutivo", "Documento Transporte","Documento Transito" ,"Consec","ConsecZFP"};
				String formulario = "ingresoForm"; 
				String metodo = "getlistatraficoNoIngreso";
				String metodoTotal = "getTotalPaginaslistatraficoNoIngreso";
				%>
      <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%>
      <popup:boton clase="ingreso.control.gsttrafico" entidad="ingreso.entity.trafico" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" /> 
      </span> &nbsp; 
      
      <% } %> 
      <td>Asignaci&oacute;n Posiciones Bodega
	  <td>
	      <html:select property="ingtipoasignacion" > 
	      	<html:option value="">--Selecione--</html:option>
            <html:option value="AUTOMATICO">AUTOMATICO</html:option>
	      	<html:option value="MANUAL">MANUAL</html:option> 
	      </html:select><html:errors property="ingtipoasignacion" />
      <% } %> <% if( ingf==null || ingf!=null && ingf.getingtipo().equals("DEVOLUCION") && ( ingf.getIngestado().equals("TRAMITE") || ingf.getIngestado().equals("FINALIZADO")  )) { %> 
  <tr> 
    <td>Causal 
    <td colspan="5"> &nbsp; <span id="causal"  style="display:<%= ingf==null ? "none" : "block"  %>"> 
      <% 
 gstcausal gcaus = new gstcausal();
 request.setAttribute("listaCausal", gcaus.getlistacausal()); 
 %>
      <html:select property="ingcausal"> <html:options collection="listaCausal"  
					property="caucodsx" labelProperty="caudesc"   /> </html:select> 
      <br>
      Cliente: <html:hidden property="ingcli_devolucion" /> 
      <input type="text" name="desccliente" readonly="true"  class="readonly" value="<%= ingf!=null ? new gstcliente().getcliente( ingf.getIngcli_devolucion()).getclinombre() : "" %>">
      <%
//String cia = ingf==null ? "'+ ingresoForm.ingcodcia.options[ingresoForm.ingcodcia.selectedIndex].value  + '" : " ' + ingresoForm.ingcodcia.value + '";				
      String cia = "'+ ingresoForm.ingcodcia.value   + '";
				String[] parametros = new String[] {  cia, "0", ""};
				String[] parametros_total = new String[] {cia, ""};
				String[] campos_form= new String[] {"ingcli_devolucion", "desccliente"};
				String[] campos_pick = new String[] {"clicodsx" , "clinombre"};
				String[] campos_entity= new String[] {"clicodsx", "clinombre", "clidireccion"};
				String[] nombres_campos_entity= new String[] {"Consec. Cliente", "Cliente", "Direccion"};
				String formulario = "ingresoForm";
				String metodo = "getlistaclienteByEmpresa";
				String metodoTotal = "getTotalPaginaslistaclienteByEmpresa";
				%>
      <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%>
      <popup:boton clase="maestro.control.gstcliente" entidad="maestro.entity.cliente" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" /> 
      Ciudad: <html:hidden property="ingciudad_dev" /> 
      <input type="text" name="descciudad" readonly="true" Class="readonly" value="<%= ingf!=null ? new gstciudad().getciudad( ingf.getIngciudad_dev() ).getciunombre() : "" %>">
      <%


				parametros = new String[] {   "0", ""};
				parametros_total = new String[] {""};
				campos_form= new String[] {"ingciudad_dev", "descciudad"};
				campos_pick = new String[] {"ciucodigo" , "ciunombre"};
				campos_entity= new String[] {"ciucodigo", "ciunombre"};
				nombres_campos_entity= new String[] {"Codigo Ciudad", "Nombre"};
				formulario = "ingresoForm";
				metodo = "getlistaciudad";
				metodoTotal = "getTotalPaginaslistaciudad";
				%>

      <popup:boton clase="maestro.control.gstciudad" entidad="maestro.entity.ciudad" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" /> 
						
		<br>Planilla 
			<html:text property="ingplanilla" />				
      </span> <%} %> 
  <tr> 
    <td>Observacion 
    <td ><html:textarea property="ingobservacion"  /> 
    <td>Estado 
    <td colspan="3" > <%if(ingf==null) { %> <html:text property="ingestado" value="TRAMITE" readonly="true" styleClass="readonly"/> 
      <% } else if(ingf.getIngestado().equals("TRAMITE")) { %> <html:select property="ingestado"  > <html:option value="TRAMITE">TRAMITE</html:option> 
      <html:option value="FINALIZADO">FINALIZADO</html:option> </html:select> 
      <% } else {%> <html:text property="ingestado" value="FINALIZADO" readonly="true" styleClass="readonly"/> 
      <%
  	//coloco el enlace con permiso de administracion para que lo active:
	if(gstpermiso.getAdministracion(session, "ingreso", "ingreso_datos.jsp") ) { 
  %> <a href="ingresoAction.do?opcion=activar&codsx=<%= ingf.getingcodsx()  %>">Activar 
      </a> <% } } %> <html:errors property="ingestado" /> 
  <tr> 
    <td>Peso Neto 
    <td><html:text property="ingpesoneto" readonly="true" styleClass="readonly" size="10"/>KGM 
    <td>Peso Bruto  
    <td width="32%"><html:text property="ingpesobruto" readonly="true" styleClass="readonly" size="10"/> 
  <tr>
    <td width="20%">FOB 
    <td width="32%"><html:text property="ingfob" readonly="true" styleClass="readonly" size="10"/> 
    <%
    if(ingf!=null &&  (ingcodsx!= null && !ingcodsx.equals("")) && ingf.getingtipo().equals("TRAFICO") ) 
    	out.println("USD");
    else out.println("$");
    %>
    <td width="20%">Total Unidades 
    <td width="32%"><%=totalunidades%>  

  <% if (sin_pos) { %>
  <tr align="center"> 
    <td colspan="7" bgcolor= '#FFFF00'> Tiene entradas sin posici&oacute;n en Bodega
    </td>
  </tr>
  <%} %>
  <tr align="center"> 
    <td colspan="7"> 
    <% 
    	boolean tramite = ingf!=null && ingf.getIngestado()!=null && ingf.getIngestado().equals("TRAMITE") ? true : false;
		boolean escritura = gstpermiso.getEscritura(session, "ingreso", "ingreso_datos.jsp");
		System.out.println("tramite:" + tramite + "  escritura:"+  escritura);
    	if(escritura && ( tramite || ingf==null  )) { %> 
    		<html:submit  value="Grabar" /> 
    		<html:button property="algo" value="Cancelar" onclick="window.location='main.jsp?app=ingreso&modulo=ingreso_datos'" /> 
    <% } %> 
  
</table>
</html:form>
<% if( ingf!=null && ingf.getingtipo().equals("TRAFICO") && ingf.getIngestado().equals("TRAMITE")) { %> 
<%@include file="lote_contenedor_ingreso.jsp" %>
<%} %>
<% if( ingf!=null && ingf.getingtipo().equals("TRAFICO") && ingf.getIngestado().equals("TRAMITE")) { %> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='left' height="40">
 	<a href='main.jsp?app=ingreso&modulo=subirPosiciones&ingcodsx=<%=ingcodsx%>'> Cargar Posiciones desde un Archivo </a>
 	<br>
 	<br>
 	<td align='right'> 	&nbsp;
 </table>
 <br> 
 <%} %>

<%
if(ingf!=null && (ingcodsx!= null && !ingcodsx.equals("")) && sin_pos) {
	
%>

<%@include file="entrada_sin_pos.jsp" %>

<%} %>
<%
if(ingf!=null &&  (ingcodsx!= null && !ingcodsx.equals(""))) {
	
%>

<%@include file="entrada.jsp" %>

<%} %>
</html> 