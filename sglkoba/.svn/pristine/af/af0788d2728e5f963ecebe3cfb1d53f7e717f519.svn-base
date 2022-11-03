<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso, averias.form.*, averias.control.*, averias.entity.* " %>  


<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 
<html>   

<%
averiaForm ave_form = (averias.form.averiaForm)request.getAttribute("averiaForm");

boolean estramite = ave_form==null || (ave_form!=null && ave_form.getaveestado()!=null && ave_form.getaveestado().equals("TRAMITE"));
boolean existe = ave_form!=null && (!ave_form.getavecodsx().equals("")); //|| (ave_form!=null && ave_form.getavecodsx()!=null && !ave_form.getavecodsx().equals(""));
%>

<script type="text/javascript">
	function limpiarDatos() {
	
		averiaForm.aveingreso.value='';
		averiaForm.avetipo.value='';
		averiaForm.bod.value='';
		averiaForm.pos.value='';
		averiaForm.prod.value='';
		averiaForm.saldonac.value='';
		averiaForm.saldonnac.value='';
	
	}
	
	function setTipo() {
		averiaForm.avecant_pleg_nac.value='0';
		averiaForm.avecant_prod_nac.value='0';
	
		averiaForm.avecant_pleg_nnac.value='0';
		averiaForm.avecant_prod_nnac.value='0';
	}

    function open_win() {
        var enlace = 'averiaAction.do?opcion=cambiar_posicion&boddest=' + document.boddest.value + '&posdest=' + document.posdest.value + '&codsx=<%=ave_form.getavecodsx()%>';
        window.open(enlace);
    }
    
    function asignaPosicion() {
  	  alert("esto es:" + document.averiaForm.aveposdest.value);
  	  document.averiaForm.posdest.value = document.averiaForm.aveposdest;
        //alert("ahora pos es :" + document.averiaForm.posdest.value);
    }
    
    function asignaBodega() {
  	  //alert("esto es:" + document.averiaForm.aveboddest.options[averiaForm.aveboddest.selectedIndex].value);
  	  document.averiaForm.boddest.value = document.averiaForm.aveboddest.options[averiaForm.aveboddest.selectedIndex].value;
        alert("ahora bod es :" + document.averiaForm.boddest.value);
   }
</script>
		
		<div class="titulo"> Gestion de Datos de una Averia </div> 
		<br> 
		<html:form action="averiaAction.do" method="post"  > 
		<html:hidden property="opcion"/> 
<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
  <tr> 
    <td>Codigo Sx (Autonumerico) 
    <td><html:text property="avecodsx"  readonly="true" styleClass="readonly" size="5"/> 
    <td>Compania
    <td><html:hidden      property="avecompania"  />
<html:text property="nombrecia" size="20" readonly="true" styleClass="readonly" />
    <%			
    if(existe==false) {
    	%>
    	
    <%	
    String[] parametros_cia = new String[] {  "0", ""};
	String[] parametros_total_cia = new String[] {""};
	String[] campos_form_cia= new String[] {"avecompania", "nombrecia" };
	String[] campos_pick_cia = new String[] {"comcodsx" , "comnombre"};
	String[] campos_entity_cia= new String[] {"comcodsx", "comnombre"};
	String[] nombres_campos_entity_cia= new String[] {"Codigo", "Nombre"};
	String formulario_cia = "averiaForm";  
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
    <td>Ingreso
    <td colspan="3"><html:text property="aveingreso" readonly="true" styleClass="readonly" size="10"/> <html:errors property="aveingreso"/>
              <%
              if(existe==false) {
String cia = "'+ averiaForm.avecompania.value   + '";

				String[] parametros = new String[] {  cia,"FINALIZADO",  "0", ""};
				String[] parametros_total = new String[] {cia, "FINALIZADO",""};
				String[] campos_form= new String[] {"aveingreso","avetipo", };
				String[] campos_pick = new String[] {"ingcodsx", "ingtipo"};
				String[] campos_entity= new String[] {"ingcodsx", "ingfecha",  "ingtipo" };
				String[] nombres_campos_entity= new String[] {"Consecutivo", "Fecha",  "Tipo"};
				String formulario = "averiaForm";  
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
<html:hidden property="avetipo" value="" />

  <tr> 
  
 
 
 
    <td>Datos Entrada  <html:errors property="aveentrada"/>
    <td colspan="3"><html:hidden property="aveentrada" /> Bodega:
    <html:text property="bod" readonly="true" styleClass="readonly" size="5"/>
    Posicion:
    <html:text property="pos" readonly="true" styleClass="readonly" size="5"/> <br>
    Producto: 
    <html:text property="prod" readonly="true" styleClass="readonly" size="50"/>
    <br>
    <%if(existe==false) { %>
    Saldo Nac : <html:text property="saldonac" readonly="true" styleClass="readonly" size="5"/>
    Saldo NNac : <html:text property="saldonnac" readonly="true" styleClass="readonly" size="5"/>
    <%} %>
      <%  
      if(existe==false) {
      String[] 	parametros = new String[] {   "' + averiaForm.aveingreso.value + '",  "0", ""};
      String[] 	parametros_total = new String[] {"' + averiaForm.aveingreso.value + '" ,""};
      String[] 	campos_form= new String[] {"aveentrada","bod" ,"pos" , "prod", "saldonac", "saldonnac"};
      String[] 	campos_pick = new String[] {"entcodsx", "Entbodega" , "entposicion" , "entcodproducto", "entsaldonac" , "entsaldosinnac"};
      String[] 	campos_entity= new String[] {"entcodproducto", "Entbodega",  "entposicion", "entsaldonac" , "entsaldosinnac" };
      String[] 	nombres_campos_entity= new String[] {"Producto", "Bodega",  "Posicion" , "Saldo Nac" , "Saldo NNac"};
      String	metodo = "getlistaentradaByingreso"; 
      String	metodoTotal= "getTotalPaginaslistaentradaByingreso"; 
      String	formulario = "averiaForm";
				
				%> 
				<popup:boton clase="ingreso.control.gstentrada" entidad="ingreso.entity.entrada" funcion_onclick="setTipo()"  
						formulario="<%=formulario %>" metodo="<%=metodo %>" 
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" /> 
		<% } %>				
    <tr> 
    <td>Bodega Destino 
    <td>
    <%
    request.setAttribute("listaBodega", new maestro.control.gstbodega().getlistabodega());
    %>
    
    <input name="boddest" type="hidden" id="boddest" value="">
    <input name="posdest" type="hidden" id="posdest" value="">
    <html:select property="aveboddest" onchange="asignaBodega()" >

    <html:options collection="listaBodega"  property="bodcodsx" labelProperty="bodnombre"   /> 
    </html:select>
    <td>Posicion Destino  <html:errors property="aveposdest"/>
    <td><html:text property="aveposdest"  readonly="true" styleClass="readonly" size="5" />
    <a href="#" onclick="showmapa(  averiaForm.aveboddest.options[averiaForm.aveboddest.selectedIndex].value , 'aveposdest', 'averiaForm');asignaPosicion()">Mapa</a>

 <% if(estramite==false ){ %>
     <br>  

     <a href="#" onclick='javascript:open_win()'>
     Actualizar Posicion </a> 
     
     <a href="#" onclick="javascript:alert(enlace)">
     Prueba</a>
 <%}  %>
  <tr> 
    <td>Cantidad Plegadiza Nac <html:errors property="avecant_pleg_nac"/>
    <td>
    <html:text property="avecant_pleg_nac"  size="10" readonly="<%= existe %>"  styleClass='<%= existe ?"readonly" : "" %>'  /> 
    <td>Cantidad Plegadiza NNAc <html:errors property="avecant_pleg_nnac"/>
    <td>
    <html:text property="avecant_pleg_nnac"  size="10" readonly="<%= existe %>"  styleClass='<%= existe ?"readonly" : "" %>' /> 
  <tr> 
    <td>Cantidad x Producto Nac <html:errors property="avecant_prod_nac"/>
    <td>
    <html:text property="avecant_prod_nac"  size="10" readonly="<%= existe %>"  styleClass='<%= existe ?"readonly" : "" %>' /> 

    <td>Cantidad x Producto NNac  <html:errors property="avecant_prod_nnac"/>
    <td>
<html:text property="avecant_prod_nnac"   size="10" readonly="<%= existe %>"  styleClass='<%= existe ?"readonly" : "" %>' /> 
  <tr> 
    <td>Estado 
    <td>
     <% if(ave_form==null) {%> 
     <html:text property="aveestado" value="TRAMITE" readonly="true" styleClass="readonly" size="10" /> 
      <% } else if(ave_form.getaveestado().equals("FINALIZADO")) {%> 
      		<html:text property="aveestado" value="FINALIZADO"  readonly="true" styleClass="readonly" size="10"/> 
      <% } else { %> <html:select property="aveestado"  > <html:option value="TRAMITE"> 
      TRAMITE</html:option> <html:option value="FINALIZADO"> FINALIZADO</html:option> 
      </html:select> <% } %> 
      <% if(gstpermiso.getAdministracion(session, "averias", "averia.jsp") && (estramite==false) ){ %>
     <br>  <a href="averiaAction.do?opcion=activar&codsx=<%=ave_form.getavecodsx() %>"> 
      Activar </a> <%}  %> 
    
    
    <td>Fecha 
    <td><html:text property="avefecha" readonly="true" styleClass="readonly" /> 
  <tr align="center"> 
    <td colspan="4"> <%if(gstpermiso.getEscritura(session, "averias", "averia_datos.jsp")&& estramite ){ %> 
    <html:submit  value="Grabar"/> <% } %> 
    <html:button  property="cancelar" value="Cancelar" onclick="window.location='main.jsp?app=averias&modulo=averia'" /> 

    
</table>

<html:hidden property="avesaldo_pleg_nac"/>
<html:hidden property="avesaldo_pleg_nnac"/>
<html:hidden property="avesaldo_prod_nac"/>
<html:hidden property="avesaldo_prod_nnac"/>
<html:hidden property="aveproducto"/> 

</html:form> 		</html> 