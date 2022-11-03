
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso, pedido.form.pedidoForm,pedido.control.*, maestro.control.*, maestro.entity.* " %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

<script type="text/javascript">
 
 function reset_cia() {
 document.pedidoForm.pedcliente.value='';
 document.pedidoForm.clidesc.value='';
 document.pedidoForm.pedsucursal.value='';
 document.pedidoForm.sucdesc.value='';
 document.pedidoForm.peddireccion.value='';
 document.pedidoForm.pedciudad.value='';
 document.pedidoForm.ciudesc.value='';
 document.pedidoForm.peddepartamento.value='';
 document.pedidoForm.depdesc.value='';
 document.pedidoForm.sucdesc.value='';
 
 }
</script>

	
<%
gstcliente gcli = new gstcliente();
gstdepartamento gdep = new gstdepartamento();
gstsucursal gsuc = new gstsucursal();
String pedpicking = request.getParameter("pedpicking");
maestro.control.gsttransportadora gtransp = new maestro.control.gsttransportadora();
pedidoForm ped_form = (pedidoForm)request.getAttribute("pedidoForm");
gstcompania gcia = new gstcompania();
gstpedido control = new gstpedido();
%>	

<div class="titulo"> Gestion de Datos de un Pedido </div> 
		<html:form action="pedidoAction.do" method="post" > 
		<html:hidden property="opcion"/> 
		<html:hidden property="peddescuento" value="0" /> 
		<html:hidden property="pedzona"  /> 
<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 

  <tr> 
    <td >Consecutivo 
    <td ><html:text property="pedcodsx" readonly="true" styleClass="readonly"  /> Automatico
    <td >Compania 
    <td >
    <%
    	if(ped_form==null && ( pedpicking==null ||  (pedpicking!=null && !pedpicking.equals(""))) ) { 
					request.setAttribute("listaCompania", gcia.getlistacompania());
	%> <html:select property="pedcompania"  onchange="reset_cia()"> 
      			<html:options collection="listaCompania"  property="comcodsx" labelProperty="comnombre"   /> 
      	</html:select> 
    <% } else 
    	if(pedpicking!=null && !pedpicking.equals("")){ 
    	pedido.entity.picking pick = new gstpicking().getpicking(pedpicking);
    	%>
    	<html:hidden property="pedcompania" value="<%= pick.getpickempresa() %>"  /> <input type="text" value="<%= gcia.getcompania(pick.getpickempresa()).getcomnombre()  %>" readonly="true" class="readonly" >
    	<%	
    	}else {
    %> <html:hidden property="pedcompania"  /> <input type="text" value="<%= gcia.getcompania(ped_form.getpedcompania()).getcomnombre()  %>" readonly="true" class="readonly" >
      <% } %> 
  <tr> 
    <td>No. Solicitud
    <%
    String numped = request.getParameter("pednumpedido");
    	numped = numped==null ? ped_form!=null ? ped_form.getpednumpedido() : "" : numped;
    %>
    <td><html:text property="pednumpedido"  value="<%= numped  %>" /> *<html:errors property="pednumpedido"  /> 
    <td>No. PETRA
    <td><html:text property="pedordencompra"  /> *<html:errors property="pedordencompra"  /> 
  <tr> 
    <td>No. Guia 
    <td><html:text property="pedguia"  /> *<html:errors property="pedguia"  /> 
    <td>Fecha Sistema 
    <td><html:text property="pedfechasistema" value='<%= ped_form==null ? util.Fecha.getFecha() : ped_form.getpedfechasistema() %>'  readonly="true" styleClass="readonly"/> *<html:errors property="pedfechasistema"  /> 
	<a href="javascript:show_calendar('pedidoForm.pedfechasistema');">
			<img src="./disenno/images/calendar.gif" class="lupita"> </a>
			<%
    if(ped_form!=null && ped_form.getpedestado().equals("FINALIZADO")) {
    %>
    <a href="javascript:window.location='pedidoAction.do?opcion=fijar_fechasis&pedcodsx=<%= ped_form.getpedcodsx() %>&pedfechasistema=' +document.pedidoForm.pedfechasistema.value ">Actualizar </a>
    <% } %>
  <tr> 
    <td>Fecha Pedido
    <td><html:text property="pedfecha" readonly="true" styleClass="readonly"  /> *<html:errors property="pedfecha"  /> 
    <a href="javascript:show_calendar('pedidoForm.pedfecha');">
			<img src="./disenno/images/calendar.gif" class="lupita"> </a>
    
    <td>Fecha Venc
    <td><html:text property="pedfechavenc" readonly="true" styleClass="readonly"  /> *<html:errors property="pedfechavenc"  /> 
      <a href="javascript:show_calendar('pedidoForm.pedfechavenc');">
			<img src="./disenno/images/calendar.gif" class="lupita"> </a>
  <tr> 
    <td>Fecha Cita
    <td><html:text property="pedfechacita" readonly="true" styleClass="readonly" /> 
      <a href="javascript:show_calendar('pedidoForm.pedfechacita');">
			<img src="./disenno/images/calendar.gif" class="lupita"> </a>
    <td>Hora Cita
    <td><html:text property="pedhoracita" value='<%= ped_form==null ? "00:00" : ped_form.getpedhoracita() %>' /> 
  <tr> 
    <td>Cliente
    <td><html:hidden property="pedcliente"  />
    <html:text  property="clidesc" readonly="true" styleClass="readonly" />
     *<html:errors property="pedcliente"  /> 
          <% 
String cia = ped_form==null && pedpicking==null ?  "'+ pedidoForm.pedcompania.options[pedidoForm.pedcompania.selectedIndex].value  + '" : "'+ pedidoForm.pedcompania.value   + '";

				String[] parametros = new String[] {  cia, "0", ""};
				String[] parametros_total = new String[] {cia, ""};
				String[] campos_form= new String[] {"pedcliente", "clidesc"};
				String[] campos_pick = new String[] {"clicodsx", "clinombre"};
				String[] campos_entity= new String[] {"clinombre", "Clicodigo", "clinit" };
				String[] nombres_campos_entity= new String[] {"Nombre", "Codigo", "NIT"};
				String formulario = "pedidoForm";
				String metodo = "getlistaclienteByEmpresa"; 
				String metodoTotal = "getTotalPaginaslistaclienteByEmpresa";
				
				%> <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstcliente" entidad="maestro.entity.cliente" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						funcion_onclick="reset_cia()"
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" /> 

    
    <td>Sucursal 
    <td><html:hidden property="pedsucursal" />
   <html:text  property="sucdesc" readonly="true" styleClass="readonly" />
     *<html:errors property="pedsucursal"  /> 
              <% 
				String cliente = "'  +  pedidoForm.pedcliente.value    +  '";
				parametros = new String[] {  cliente, "0", ""};
				parametros_total = new String[] {cliente, ""};
				campos_form= new String[] {"pedsucursal", "sucdesc", "peddireccion" ,  "pedciudad", "ciudesc",  "peddepartamento", "depdesc"};
				campos_pick = new String[] {"succodsx",  "sucnombre" , "sucdireccion" , "succiudad" , "succontacto" , "sucdepartamento", "succargo"};
				campos_entity= new String[] {"succodsx", "sucnombre", "sucdireccion", "succontacto", "succargo" };
				nombres_campos_entity= new String[] {"Codigo", "Nombre","Direccion", "Ciudad", "Departamento"};
				formulario = "pedidoForm";
				metodo = "getlistasucursalByCliente"; 
				metodoTotal = "getTotalPaginaslistasucursalByCliente";
				%> <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstsucursal" entidad="maestro.entity.sucursal" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" /> 

  <tr> 
    <td>Direccion	
    <td><html:textarea property="peddireccion"  /> *<html:errors property="peddireccion"  /> 
    <td>Ciudad 
    <td><html:hidden property="pedciudad" />
    <html:text property="ciudesc" readonly="true" styleClass="readonly" />
     *<html:errors property="pedciudad"  /> 
                   <% 

				parametros = new String[] {  "0", ""};
				parametros_total = new String[] { ""};
				campos_form= new String[] {"pedciudad", "ciudesc",  "depdesc" , "peddepartamento"};
				campos_pick = new String[] {"Uno", "Dos", "Tres", "Cuatro"};
				campos_entity= new String[] {"Uno", "Dos", "Tres" };
				nombres_campos_entity= new String[] {"Codigo", "Nombre", "Departamento"};
				formulario = "pedidoForm";
				metodo = "getlistaciudadConDepto"; 
				metodoTotal = "getTotalPaginaslistaciudadConDepto";
				%> 
				<popup:boton clase="maestro.control.gstciudad" entidad="maestro.entity.ciudad" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" /> 
     
     
  <tr> 
    <td>Departamento
    <td><html:hidden property="peddepartamento" />
    <html:text  property="depdesc" readonly="true" styleClass="readonly" />
     *<html:errors property="peddepartamento"  /> 
     
    <td>Fecha Alistamiento
    <td><html:text property="pedfechaalistamiento" readonly="true" styleClass="readonly"  /> *<html:errors property="pedfechaalistamiento"  /> 
      <a href="javascript:show_calendar('pedidoForm.pedfechaalistamiento');">
			<img src="./disenno/images/calendar.gif" class="lupita"> </a>
              
   <tr> 
    <td>Fecha Despacho
    <td><html:text property="pedfechadespacho" readonly="true" styleClass="readonly"  /> *<html:errors property="pedfechadespacho"  /> 
      <a href="javascript:show_calendar('pedidoForm.pedfechadespacho');">
			<img src="./disenno/images/calendar.gif" class="lupita"> </a>
	<td>Fecha Entrega
    <td><html:text property="pedfechaentrega" readonly="true" styleClass="readonly"  /> *<html:errors property="pedfechaentrega"  /> 
      <a href="javascript:show_calendar('pedidoForm.pedfechaentrega');">
			<img src="./disenno/images/calendar.gif" class="lupita"> </a>
  <tr> 
    <td>Observaciones
    <td><html:textarea property="pedobservaciones"  /> 
    <%
    if(ped_form!=null && ped_form.getpedestado().equals("FINALIZADO")) {
    %>
    <a href="javascript:window.location='pedidoAction.do?opcion=fijar_observacion&pedcodsx=<%= ped_form.getpedcodsx() %>&pedobservaciones=' +document.pedidoForm.pedobservaciones.value ">Actualizar </a>
    <% } %>
        
    <html:hidden  property="pedcausal_hit"  value="1"/>    
    <html:hidden property="pedfactura" value="0" />  <html:errors property="pedfactura"/>
    
    
    <td>Estado 
        <td> 
        	<% if(ped_form==null) { %> 
        		<html:text property="pedestado" value="TRAMITE" readonly="true" styleClass="readonly" /> 
     		<% } else if( ped_form.getpedestado().equals("FINALIZADO")) {
     				String nuevoestado = control.getNuevoEstado(ped_form.getpedcodsx());
     				if (nuevoestado != null && nuevoestado.equals("DESPACHADO")) {
     		%> 
     					<html:hidden property="pedestado" value="FINALIZADO"  />
     					<input type='text' value='<%=nuevoestado %>' readonly="true" Class="readonly" />
     		<%      } else { %> 
     		 			<html:text property="pedestado" value="FINALIZADO"  readonly="true" styleClass="readonly" /> 
     		<%      } %> 
      		<% } else { %> 
      			<html:select property="pedestado"  > 
      				<html:option value="TRAMITE"> TRAMITE</html:option> 
      				<html:option value="FINALIZADO"> FINALIZADO</html:option> 
      			</html:select> 
      		<% } %> 
  <tr> 
   
    <td>Empresa Transp
    <td nowrap="nowrap">
     <html:hidden property="pedtransportadora"  /> 
     <html:text property="transpnombre" readonly="true" styleClass="readonly" />
     * <html:errors property="pedtransportadora"  /> 
           <% 

				parametros = new String[] {  "0", ""};
				parametros_total = new String[] {""};
				campos_form= new String[] {"pedtransportadora","transpnombre"};
				campos_pick = new String[] {"transpcodsx", "transpnombre"};
				campos_entity= new String[] {"transpcodsx", "transpnombre"};
				nombres_campos_entity= new String[] {"Codigo","Nombre"};
				formulario = "pedidoForm";
				metodo = "getlistatransportadora"; 
				metodoTotal = "getTotalPaginaslistatransportadora";

			%> 
			<%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gsttransportadora" entidad="maestro.entity.transportadora" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
    
           
    
     <%
    if(ped_form!=null && ped_form.getpedestado().equals("FINALIZADO")) {
    	
    %>
    <a href="javascript:window.location='pedidoAction.do?opcion=cambiar_transportadora&pedcodsx=<%= ped_form.getpedcodsx() %>&pedtransportadora=' +document.pedidoForm.pedtransportadora.value ">
    Actualizar
    </a>
    <% } %>
    <td>Tipo
<td> <% if(ped_form==null && pedpicking==null) {%>  
<html:select property="pedtipo"> <html:option value="NAC">NACIONALIZADO</html:option> 
<html:option value="SNAC" >NO NACIONALIZADO</html:option>
</html:select> 
<% } else if(pedpicking!=null || ped_form!=null && ped_form.getPedpicking()!=null &&  !ped_form.getPedpicking().equals("") ) { 
%>
<html:text property="pedtipo" readonly="true" styleClass="readonly"  />
      <%  } else {%>
      <html:text property="pedtipo" readonly="true" styleClass="readonly" />
<% } %>
    

  <html:hidden property="pedsubtotal" /> 
  <html:hidden property="pedporc_iva"  value='<%= ped_form==null ? "19" : ped_form.getPedporc_iva() %>'  />
  <html:hidden property="pediva"  /> 
  <html:hidden property="pedfactotal"  />
  <html:hidden property="pedtotal" /> 
    
   <tr> 
    <td>Peso Neto
    <td><html:text property="pedpesoneto" readonly="true" styleClass="readonly" /> KGM
    <td>Peso Bruto
    <td><html:text property="pedpesobruto" readonly="true" styleClass="readonly" /> KGM
    
  <tr align="center"> 
  <%
  boolean tramite =ped_form==null  || (ped_form!=null && ped_form.getpedestado().equals("TRAMITE"));
  
  %>
    <td colspan="4"> <%if(gstpermiso.getEscritura(session, "pedido", "pedido.jsp") && tramite  ){ %> 
    <html:submit  value="Grabar"/> <% } %> <html:button  property="cancelar" value="Cancelar" onclick="window.location='main.jsp?app=pedido&modulo=pedido'" /> 
    
    
  <%if(gstpermiso.getAdministracion(session, "pedido", "pedido.jsp") && !tramite  ){ %> 
  <TR> <td colspan="4" align="center"> 
  	<a href="pedidoAction.do?opcion=activar&pedcodsx=<%= ped_form.getpedcodsx() %>">ACTIVAR PEDIDO</a>
  	<br>
  	<a href="main.jsp?app=pedido&modulo=imprimir_documento&pedcodsx=<%= ped_form.getpedcodsx() %>">IMPRIMIR</a>
  <%} %>
</table>
</html:form> 		</html> 