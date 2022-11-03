<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" 
import ="administracion.control.gstpermiso, averias.form.*, averias.control.*, averias.entity.*,ingreso.control.gstentrada,java.util.*,maestro.control.*,maestro.entity.* " %>  

<html>   
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<%@taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

<script type="text/javascript">
function limpiarDatos() {
	averia_padreForm.avpingreso.value='';
}

</script>
<%
gstaveria_padre controlavp = new gstaveria_padre();
averias.form.averia_padreForm ave_form = (averias.form.averia_padreForm)request.getAttribute("averia_padreForm");

boolean estramite = ave_form==null || (ave_form!=null && ave_form.getavpestado()!=null && ave_form.getavpestado().equals("TRAMITE"));
boolean existe = ave_form!=null && (!ave_form.getavpcodsx().equals("")); //|| (ave_form!=null && ave_form.getavpcodsx()!=null && !ave_form.getavpcodsx().equals(""));
String totalunidadesPleg = ave_form==null ? "0.00" : controlavp.getTotalUnidadesPleg(ave_form.getavpcodsx());
String totalunidadesProd = ave_form==null ? "0.00" : controlavp.getTotalUnidadesProd(ave_form.getavpcodsx());
%>		
<div class="titulo"> Gestion de Datos de una Averia </div> 
<br> 

<html:form action="averia_padreAction.do" method="post"  > 

<html:hidden property="opcion"/> 
<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
  <tr> 
    <td>Codigo Sx (Autonumerico) </td>
    <td><html:text property="avpcodsx"  readonly="true" styleClass="readonly" size="5"/> </td>
    <td>Compania</td>
    <td colspan="3"><html:hidden      property="avpcompania"  />
					<html:text property="nombrecia" size="20" readonly="true" styleClass="readonly" />
					    <%			
					    if(existe==false) {
					    	%>
					    	
					    <%	
					    String[] parametros_cia = new String[] {  "0", ""};
						String[] parametros_total_cia = new String[] {""};
						String[] campos_form_cia= new String[] {"avpcompania", "nombrecia" };
						String[] campos_pick_cia = new String[] {"comcodsx" , "comnombre"};
						String[] campos_entity_cia= new String[] {"comcodsx", "comnombre"};
						String[] nombres_campos_entity_cia= new String[] {"Codigo", "Nombre"};
						String formulario_cia = "averia_padreForm";  
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
	</td>					
  </tr>   
  
  <tr> 
    <td>Ingreso</td>
    <td><html:text property="avpingreso" readonly="true" styleClass="readonly" size="10"/> <html:errors property="avpingreso"/>
              <%
              if(existe==false) {
				String cia = "'+ averia_padreForm.avpcompania.value   + '";

				String[] parametros = new String[] {  cia,"FINALIZADO",  "0", ""};
				String[] parametros_total = new String[] {cia, "FINALIZADO",""};
				String[] campos_form= new String[] {"avpingreso" };
				String[] campos_pick = new String[] {"ingcodsx", "ingtipo"};
				String[] campos_entity= new String[] {"ingcodsx", "ingfecha",  "ingtipo" };
				String[] nombres_campos_entity= new String[] {"Consecutivo", "Fecha",  "Tipo"};
				String formulario = "averia_padreForm";  
				String metodo = "getlistaingresoByCia"; 
				String metodoTotal = "getTotalPaginaslistaingresoByCia";
				%> 
				<popup:boton clase="ingreso.control.gstingreso" entidad="ingreso.entity.ingreso" funcion_onclick="limpiarDatos()"
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" /> 
		<%}  %>
	</td>
    <td>Estado </td>
    <td>
     <% if(ave_form==null) {%> 
     <html:text property="avpestado" value="TRAMITE" readonly="true" styleClass="readonly" size="10" /> 
      <% } else if(ave_form.getavpestado().equals("FINALIZADO")) {%> 
      		<html:text property="avpestado" value="FINALIZADO"  readonly="true" styleClass="readonly" size="10"/> 
      <% } else { %> <html:select property="avpestado"  > <html:option value="TRAMITE"> 
      TRAMITE</html:option> <html:option value="FINALIZADO"> FINALIZADO</html:option> 
      </html:select> <% } %> 
      <% if(gstpermiso.getAdministracion(session, "averias", "averia_padre.jsp") && (estramite==false) ){ %>
     <br>  <a href="averia_padreAction.do?opcion=activar&codsx=<%=ave_form.getavpcodsx() %>"> 
      Activar </a> <%}  %> 
    </td>
    
    <tr>
				<td width="20%">Total Plegadiza
                <td width="32%"><%=totalunidadesPleg%>
                <td width="20%">Total Producto
                <td width="32%"><%=totalunidadesProd%>  
    <tr>
	    <td>Fecha </td>
	    <td colspan="3"><html:text property="avpfecha" readonly="true" styleClass="readonly" /> </td>
    
  </tr>
  
  <tr align="center"> 
    <td colspan="6"> <%if(gstpermiso.getEscritura(session, "averias", "averia_padre_datos.jsp")&& estramite ){ %> 
    <html:submit  value="Grabar"/> <% } %> 
    <html:button  property="cancelar" value="Cancelar" onclick="window.location='main.jsp?app=averias&modulo=averia_padre'" /> 
  </tr>
    
</table>

</html:form> 	

<br>
<%if(existe && estramite) { %>		

<%@ include file='averia_padre_detalle.jsp' %>

<% } %>
<br>

<%

if (existe && controlavp.tieneDetalles(ave_form.getavpcodsx())){ 
	gstproducto gprod = new gstproducto();
	Collection listaaverias = null;
	if (ave_form!=null && ave_form.getavpingreso() != null ) {
		listaaverias = controlavp.getlistaAveriaDetalles(ave_form.getavpcodsx());
	}
	request.setAttribute("listaaverias", listaaverias);%>
<br>
<table align='center' width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas">
    <tr><th colspan="7"> Detalle de Averias </th></tr>
	<tr>
		<th> Codigo Averia </th>
		<th> Referencia </th>
		<th> Bodega Destino</th>
		<th> Posicion Destino</th>
		<th> Cant Pleg Nac</th>
		<th> Cant Prod Nac</th>
		<th> Opcion</th>
	 </tr>
	 
	 <logic:iterate id="temp_averia" name="listaaverias" type="averias.entity.averia">	
     <%producto prod = gprod.getproducto( temp_averia.getAveproducto() );%>

	 <tr>
	 	 <td><%= temp_averia.getavecodsx() %></td>
	 	 <td><%= prod.getpromodelo() + " " + prod.getprodescripcion()%></td>	 	 
	 	 <td><%= temp_averia.getaveboddest()%></td>
	 	 <td><%= temp_averia.getaveposdest() %></td>
	 	 <td><%= temp_averia.getavecant_pleg_nac() %></td>
	 	 <td><%= temp_averia.getavecant_prod_nac() %></td>
	 	 <td align="center">
	 	 	<a href='averiaAction.do?opcion=set&codsx=<%= temp_averia.getavecodsx()%>'> <img src="./disenno/images/update.gif" border="0" > </a>
	 	 	<%if(gstpermiso.getEscritura(session, "averias", "averia.jsp") && temp_averia.getaveestado().equals("TRAMITE")){ %> 
		<a href="javascript:validarDelete('averiaAction.do?opcion=delete&codsx=<%= temp_averia.getavecodsx()  %>')"> <img src="./disenno/images/substract.gif" border="0" > </a>   
 <% } %> 
	 	 </td>
	 </tr>
	 </logic:iterate>
	 
</table>
<% } %> 

		

</html> 