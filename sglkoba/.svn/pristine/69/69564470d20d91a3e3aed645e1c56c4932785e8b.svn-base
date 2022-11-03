
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import="maestro.control.*, maestro.entity.*, administracion.control.gstpermiso, ingreso.form.*, ingreso.control.*, ingreso.entity.*" %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

<script type="text/javascript">
function validasaldo() {
  if( document.reubicacionForm.recodsx.value=='' && parseFloat(reubicacionForm.recantidad.value) >  parseFloat(reubicacionForm.saldo.value))
   {
   	   alert('No puede sacar mas cantidad que el saldo');
   	   return false;
   }else return true;

}
</script>
		<div class="titulo"> Gestion de Datos de un reubicacion </div> 
		<br> 
		<html:form action="reubicacionAction.do" method="post" onsubmit="return validasaldo()" > 
		<%
reubicacionForm form = (reubicacionForm)request.getAttribute("reubicacionForm");

String recodsx = form==null || ( form!=null && (form.getrecodsx()==null || form.getrecodsx().equals("") )) ? null : form.getrecodsx();

gstreubicacion greubic = new gstreubicacion();
gstcompania gcia = new gstcompania();
gstproducto gprod = new gstproducto();
gstentrada gent = new gstentrada();

reubicacion reubic = recodsx ==null ? null : greubic.getreubicacion(recodsx);

%>
		
		
		<html:hidden property="opcion"/> 

	
<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos">
  <tr> 
    <td>Consecutivo 
    <td><html:text property="recodsx"  readonly="true" styleClass="readonly" /> 
  <tr> 
    <td>Empresa 
    <td><%if(reubic==null) { 
					request.setAttribute("listaCompania", gcia.getlistacompania());
				%> <html:select property="recodcia" > 
      <html:options collection="listaCompania"  
					property="comcodsx" labelProperty="comnombre"   /> </html:select> 
      <% } else { %> <html:hidden property="recodcia" /> <input type="text" name="codcia" value="<%= gcia.getcompania( form.getRecodcia()).getcomnombre() %>" readonly="readonly" class="readonly"> 
      <% } %> 
  <tr> 
    <td>Ingreso a Reubicar 
    <td><html:text property="reingreso" readonly="true" styleClass="readonly" /> 
      <%
				//el ingreso no se puede cambiar una vez creado
				if(reubic==null) {
				String cia = recodsx==null ?  "'+ reubicacionForm.recodcia.options[reubicacionForm.recodcia.selectedIndex].value  + '" : "'+ reubicacionForm.recodcia.value   + '";

				String[] parametros = new String[] {  cia, "0", ""};
				String[] parametros_total = new String[] {cia, ""};
				String[] campos_form= new String[] {"reingreso"};
				String[] campos_pick = new String[] {"ingcodsx"};
				String[] campos_entity= new String[] {"ingcodsx", "ingfecha","ingtipo",  "ingtrafico" };
				String[] nombres_campos_entity= new String[] {"Consecutivo", "Fecha", "Tipo" ,  "Trafico"   };
				
				String formulario = "reubicacionForm";
				String metodo = "getlistaingreso_saldo_mayor_cero"; 
				String metodoTotal = "getTotalPaginaslistaingreso_saldo_mayor_cero";
				

				%> <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="ingreso.control.gstingreso" entidad="ingreso.entity.ingreso" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>" 
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" /> 
      <%} %>
      *<html:errors property="reingreso"  /> 
  <tr> 
    <td>Tipo de Saldo a Reubicar 
    <td> 
      <%if(reubic==null) { %>
      <html:select property="retipo"  > <html:option value="NACIONALIZADO">NACIONALIZADO</html:option> 
      <html:option value="NO NACIONALIZADO">NO NACIONALIZADO</html:option> </html:select> 
      <% } else { %>
      <html:text property="retipo" readonly="true" styleClass="readonly"/> 
      <% } %>

  <tr> 
    <td>Origen *<html:errors property="reentradaor"  /> 
    <td><html:hidden property="reentradaor"  /> <table class="pequeno" cellpadding="0" cellspacing="" border="1" width="200">
        <%
				String producto  = "";
				String bodega = "";
				String posicion = "";
				String saldo = "";

				if(form!=null && form.getreentradaor()!=null && !form.getreentradaor().equals("")) {
					entrada entor = gent.getentrada( form.getreentradaor());
//					entrada entfin = gent.getentrada( reubic.getreentradafin() );
					producto  = gprod.getproducto( entor.getentcodproducto()).getpromodelo();
					bodega = new gstbodega().getbodega( entor.getEntbodega()).getbodnombre();
					posicion = entor.getentposicion();
//					posicionfin = entfin.getentposicion();
//					form.setBodegafin(entfin.getEntbodega());
					
					if(form.getretipo().equals("NACIONALIZADO") )
							saldo =  entor.getentsaldonac();
										else 
						saldo = entor.getentsaldosinnac();
				}
				%>
        <tr> 
          <td width="50">Producto 
          <td> <input type="hidden" name="procodsx" > <input type="text" name="producto" readonly="true" Class="readonly" value="<%= producto %>" > 
          <td>Bodega 
          <td><input type="text" name="bodega"  readonly="true" Class="readonly"  value="<%= bodega %>"> 
        <tr> 
          <td>Posicion 
          <td> <input type="text" name="posicion" readonly="true" Class="readonly" value="<%= posicion %>"> 
          <td>Saldo (Segun el tipo) 
          <td> <input type="text" name="saldo" readonly="true" Class="readonly" value="<%= saldo %>"> 
      </table>
      <%
				if(reubic==null) {
				//el origen ????
				String cia = recodsx==null ?  "'+ reubicacionForm.recodcia.options[reubicacionForm.recodcia.selectedIndex].value  + '" : "'+ reubicacionForm.recodcia.value   + '";
				String tipo = recodsx ==null ?  "'+ reubicacionForm.retipo.options[reubicacionForm.retipo.selectedIndex].value  + '" : "'+ reubicacionForm.retipo.value   + '";
				String ingcodsx = "' + reubicacionForm.reingreso.value    +  '";
				String[] parametros = new String[] {  tipo,cia, ingcodsx,  "0", ""};
				String[] parametros_total = new String[] {tipo,cia, ingcodsx, ""};
				String[] campos_form= new String[] {"reentradaor","procodsx" ,"producto", "productofin", "bodega", "posicion", "saldo"};
				String[] campos_pick = new String[] {"entcodsx", "entcantidad", "entcodingreso", "entcodingreso","Entbodega", "entposicion", "entsaldosinnac"};
				String[] campos_entity= new String[] { "entcodingreso", "entcodproducto", "Entbodega", "entposicion", "entsaldosinnac"};
				String[] nombres_campos_entity= new String[] {"Material" , "Descripcion", "Bodega", "Posicion", "Saldo"};
				String formulario = "reubicacionForm"; 
				String metodo = "getlistaentradaByingreso_tipo"; 
				String metodoTotal = "getTotalPaginaslistaentradaByingreso_tipo";
				
				String[] campos_foranea = new String[]{"2"};
				String[] tablas_foranea =new String[]{ "bodega"};
				String[] primarias_foranea =new String[]{"bodcodsx"};
				String[] desc_foranea =new String[]{"bodnombre"};

				%> 
 <popup:boton clase="ingreso.control.gstentrada" entidad="ingreso.entity.entrada" 
					tablas_foranea="<%= tablas_foranea %>" 
						campos_foranea="<%= campos_foranea %>" 
						primarias_foranea="<%= primarias_foranea %>"
						desc_foranea="<%= desc_foranea %>"
					
				
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>"
						
						 /> <% } %> 
  <tr> 
    <td>Destino *<html:errors property="reentradafin"  /> 
    <td><html:hidden property="reentradafin"  /> <table class="pequeno" cellpadding="0" cellspacing="" border="1" width="200">
        <tr> 
          <td width="50">Producto 
          <td> <input type="text" name="productofin" readonly="true" Class="readonly" value="<%= producto %>" > 
          <td>Bodega 
          <td> <%
					maestro.control.gstbodega gbod = new maestro.control.gstbodega();
					request.setAttribute("listabodega", gbod.getlistabodega());
					if(reubic==null) {
					%> <html:select property="bodegafin"> <html:options collection="listabodega"  
					property="bodcodsx" labelProperty="bodnombre"   /> </html:select> 
            <%} else { 
					entrada entfin = gent.getentrada( reubic.getreentradafin());
					bodega bod = new gstbodega().getbodega( entfin.getEntbodega() );

					%> <html:hidden property="bodegafin"   /> <input name="text" type="text" class="readonly" value="<%= bod.getbodnombre()  %>" readonly="readonly"> 
            <%} %> 
        <tr> 
          <td>Posicion 
          <%
          String reentradafin = form!=null && form.getreentradafin()!=null && !form.getreentradafin().equals("") ? gent.getentrada( form.getreentradafin()).getentposicion() : "";
          %>
          <td> <html:text property="posicionfin" readonly="true" styleClass="readonly"  /> 
            <% if(reubic==null) {  %> <a href="#" onclick="if(document.reubicacionForm.productofin.value=='')  alert('Debe seleccionar el producto');  else  showmapa(document.reubicacionForm.bodegafin.options[document.reubicacionForm.bodegafin.selectedIndex].value, 'posicionfin', 'reubicacionForm',   document.reubicacionForm.procodsx.value);">Mapa 
            </a> <% } %>            
            <html:errors property="posicionfin"/>
          <td>&nbsp; 
          <td>&nbsp;</table> 
  <tr> 
    <td>Tipo de Reubicacion 
    <td> <html:select property="retipomov"> <html:option value="FISICO">FISICO</html:option> 
  <%-- 
      <html:option value="AVERIA">AVERIA(Saldo No Disponible)</html:option> <html:option value="REPARACION">REPARACION 
      (Saldo Disponible de Averias)</html:option> 
     --%> 
      </html:select> 
  <tr> 
    <td>Cantidad 
    <td> <%if(recodsx==null) { %> <html:text property="recantidad"  /> *<html:errors property="recantidad"  /> 
      <% } else { %> <html:text property="recantidad" readonly="true"  styleClass="readonly"/> 
      <% } %> 
  <tr> 
    <td>Estado 
    <td><% if(recodsx==null) {%> <html:text property="reestado" readonly="true" styleClass="readonly" value="TRAMITE"/> 
      <% }else if(form.getreestado().equals("TRAMITE")) {%> <html:select property="reestado"  > <html:option value="TRAMITE">TRAMITE</html:option> 
      <html:option value="FINALIZADO">FINALIZADO</html:option> </html:select> 
      <% } else {%> <html:text property="reestado" readonly="true" styleClass="readonly" value="FINALIZADO"/> 
      <%} %> 
      <%
      if(gstpermiso.getAdministracion(session, "ingreso", "reubicacion_datos.jsp") && recodsx!=null && form.getreestado().equals("FINALIZADO") ) {
    	  %>
    	<a href="reubicacionAction.do?opcion=activar&codsx=<%= form.getrecodsx() %>">Activar</a>  
    <% 	  
      }
      %>
  <tr> 
    <td>Fecha Creacion 
    <td><html:text property="refecha" readonly="true" styleClass="readonly" value="<%= recodsx==null ? util.Fecha.getFecha() : form.getrefecha() %>" /> 
  <tr align="center"> 
    <td colspan="2"> <%if(gstpermiso.getEscritura(session, "ingreso", "reubicacion.jsp") && recodsx==null || form.getreestado().equals("TRAMITE")  ){ %> <html:submit  value="Grabar"/> <%} %> <html:button  property="prueba" value="Cancelar" onclick="window.location='main.jsp?app=ingreso&modulo=reubicacion'" /> 
</table>
</html:form> 		</html> 