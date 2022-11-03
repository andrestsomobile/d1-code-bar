
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import="maestro.control.*, maestro.entity.*, administracion.control.gstpermiso, ingreso.form.*, ingreso.control.*, ingreso.entity.*" %>  
<html> 

<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<%@taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

<script type="text/javascript">
function validasaldoNac() {
  if( document.entrada_locacionForm.elcodsx.value=='' && parseFloat(entrada_locacionForm.elcantidadnac.value) >  parseFloat(entrada_locacionForm.elsaldonac.value))
   {
   	   alert('No puede sacar mas cantidad que el saldo');
   	   return false;
   }else return true;

}
function validasaldoSNac() {
  if( document.entrada_locacionForm.elcodsx.value=='' && parseFloat(entrada_locacionForm.elcantidadsnac.value) >  parseFloat(entrada_locacionForm.elsaldosnac.value))
   {
   	   alert('No puede sacar mas cantidad que el saldo');
   	   return false;
   }else return true;

}
</script>

<div class="titulo"> Gestion de Datos de Cambio Locacion </div> 
<br> 
<html:form action="entrada_locacionAction.do" method="post" onsubmit="return validasaldo()" > 
<%
entrada_locacionForm form = (entrada_locacionForm)request.getAttribute("entrada_locacionForm");

String elcodsx = form==null || ( form!=null && (form.getElcodsx()==null || form.getElcodsx().equals("") )) ? null : form.getElcodsx();

gstentrada_locacion control = new gstentrada_locacion();

gstingreso ging = new gstingreso();
gsttrafico gtraf = new gsttrafico();
gstentrada gent = new gstentrada();
gstproducto gprod = new gstproducto();
gstbodega gbod = new gstbodega();
gstlocacion gloc = new gstlocacion();
gstcompania gcia = new gstcompania();

entrada_locacion entrada_locacion = elcodsx ==null ? null : control.getentrada_locacion(elcodsx);

%>

<html:hidden property="opcion"/> 
	
<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos">
  <tr> 
    <td>Consecutivo 
    <td><html:text property="elcodsx"  readonly="true" styleClass="readonly" /> 
    
  <tr> 
    <td>Empresa 
    <td><%if(elcodsx==null) { 
					request.setAttribute("listaCompania", gcia.getlistacompania());
				%> <html:select property="elcodcia" > 
      <html:options collection="listaCompania"  
					property="comcodsx" labelProperty="comnombre" /> </html:select> 
      <% } else { %> <html:hidden property="elcodcia" /> <input type="text" name="codcia" value="<%= gcia.getcompania( form.getElcodcia()).getcomnombre() %>" readonly="readonly" class="readonly"> 
      <% } %> 
      
  <tr> 
    <td>Producto 
    <td><html:hidden property="elcodproducto" /> <html:text property="promodelo" readonly="true" styleClass="readonly" /> <html:text property="prodescripcion" readonly="true" styleClass="readonly" /> 
      <%
				//el ingreso no se puede cambiar una vez creado
				if (elcodsx==null) {
					String cia = elcodsx==null ?  "'+ entrada_locacionForm.elcodcia.selectedIndex].value  + '" : "'+ entrada_locacionForm.elcodcia.value   + '";
	
					String[] parametros = new String[] { "1","0", ""};
					String[] parametros_total = new String[] {"1",""};
					String[] campos_form= new String[] {"elcodproducto","promodelo","prodescripcion"};
					String[] campos_pick = new String[] {"procodsx","promodelo","prodescripcion"};
					String[] campos_entity= new String[] {"procodsx","promodelo","prodescripcion"};
					String[] nombres_campos_entity= new String[] {"Consecutivo", "Material", "Descripcion" };
					
					String formulario = "entrada_locacionForm";
					String metodo = "getlistaproducto"; 
					String metodoTotal = "getTotalPaginaslistaproducto";
				

				%> <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstproducto" entidad="maestro.entity.producto" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>" 
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" /> 
      <%} %>
      *<html:errors property="elcodproducto"  /> 
 

  <tr> 
    <td>Entrada 
    <td><html:text property="elcodentrada" readonly="true" styleClass="readonly" /> 
      <%
				//el ingreso no se puede cambiar una vez creado
				if(elcodsx==null) {
				String procodsx = elcodsx==null ?  "'+ entrada_locacionForm.elcodproducto.value  + '" : "'+ entrada_locacionForm.elcodproducto.value   + '";

				String[] parametros = new String[] { procodsx,  "0", ""};
				String[] parametros_total = new String[] {procodsx, ""};
				String[] campos_form= new String[] {"elcodentrada"};
				String[] campos_pick = new String[] {"entcodsx","entcodinngreso","entposicion","entcantidad","entsaldonac", "entsaldosinnac"};
				String[] campos_entity= new String[] {"entcodsx","entcodinngreso","entposicion","entcantidad","entsaldonac", "entsaldosinnac"};
				String[] nombres_campos_entity= new String[] {"Consecutivo","Ingreso", "Posicion","Cantidad","SaldoNAC", "SaldoSNAC"};
				
				String formulario = "entrada_locacionForm";
				String metodo = "getlistaentradaByProducto"; 
				String metodoTotal = "getTotalPaginaslistaentradaByProducto";
				

				%> <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="ingreso.control.gstentrada" entidad="ingreso.entity.entrada" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>" 
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" /> 
      <%} %>
      *<html:errors property="elcodentrada"  /> 
 
	<tr> 
		<% 
		request.setAttribute("listalocacion" , gloc.getlistalocacion("0",""));
		%>
	    <td>Locacion Origen *<html:errors property="elcodlocacionorigen"  /> 
	    <td><html:select property="elcodlocacionorigen">
			<html:options collection="listalocacion" property="loccodsx" labelProperty="locdesc" />
			</html:select>	
 
 	<tr> 
	    <td>Locacion Destino *<html:errors property="elcodlocaciondestino"  /> 
	    <td><html:select property="elcodlocaciondestino">
			<html:options collection="listalocacion" property="loccodsx" labelProperty="locdesc" />
			</html:select>	
			  
      
  <tr> 
    <td>Cantidad NAC
    <td> <%if(elcodsx==null) { %> <html:text property="elcantidadnac"  /> *<html:errors property="elcantidadnac"  /> 
      <% } else { %> <html:text property="elcantidadnac" readonly="true"  styleClass="readonly"/> 
      <% } %> 

  <tr> 
    <td>Cantidad SAC
    <td> <%if(elcodsx==null) { %> <html:text property="elcantidadsnac"  /> *<html:errors property="elcantidadsnac"  /> 
      <% } else { %> <html:text property="elcantidadsnac" readonly="true"  styleClass="readonly"/> 
      <% } %> 

  <tr> 
    <td>Fecha Creacion 
    <td><html:text property="elfecha" readonly="true" styleClass="readonly" value="<%= elcodsx==null ? util.Fecha.getFecha() : form.getElfecha() %>" /> 
  <tr align="center"> 
    <td colspan="2"> <%if(gstpermiso.getEscritura(session, "ingreso", "cambiolocacion.jsp") && elcodsx==null  ){ %> <html:submit  value="Grabar"/> <%} %> <html:button  property="prueba" value="Cancelar" onclick="window.location='main.jsp?app=ingreso&modulo=cambiolocacion'" /> 
</table>
</html:form> 		
</html> 