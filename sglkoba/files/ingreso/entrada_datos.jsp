 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"   import="administracion.control.gstpermiso, java.util.*" %>  

<html> 
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

<%
ingreso.control.gstentrada gentrada = new ingreso.control.gstentrada(); 
String ingcodsx = request.getParameter("ingcodsx")==null ? (String)request.getAttribute("ingcodsx") : request.getParameter("ingcodsx");
ingreso.control.gstingreso ging = new ingreso.control.gstingreso();
ingreso.entity.ingreso ing = ging.getingreso(ingcodsx);
maestro.control.gstcompania gcomp = new maestro.control.gstcompania();
maestro.entity.compania comp = gcomp.getcompania(ing.getingcodcia().toString());
String compmapa = comp.getCommapa();
%>

		<div class="titulo"> Gestion de Datos de una Entrada </div> 
		<br> 
		
<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 		
<caption>Encabezado del Ingreso</caption>
  <tr> 
    <td>Consecutivo 
    <td> <%=ingcodsx %>
    <td>Compañia 
    <td><%= new maestro.control.gstcompania().getcompania( ing.getingcodcia() ).getcomnombre() %> 
  <tr> 
    <td>Fecha Ingreso 
    <td><%= ing.getingfecha() %>
    <td>Tipo 
    <td><%= ing.getingtipo() %>
    
  <tr> 
    <td>Trafico 
    <td><%= ing.getingtrafico()==null ? "&nbsp;" : ing.getingtrafico() %>
    <td>Estado
    <td><%= ing.getIngestado() %> 
  
</table>

<%
ingreso.form.entradaForm entf = (ingreso.form.entradaForm)request.getAttribute("entradaForm");
if(entf!=null && entf.getentcodsx()!=null && !entf.getentcodsx().equals("")) {
%>
<div align="right">
<a href="main.jsp?app=ingreso&modulo=identificacion_estiba&entcodsx=<%= entf.getentcodsx() %>">
IDENTIFICACION DE ESTIBA <BR>
	<img src="./disenno/images/printer.gif">
</a>
</div>
<%
}
%>
<br>
		<html:form action="entradaAction.do?app=ingreso&modulo=entrada_datos" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
		
		<caption>Ingrese la Referencia y su posicion en el ingreso</caption>
		<html:hidden property="entcodsx"  /> 
		<html:hidden property="entcodingreso" value="<%= ingcodsx  %>"  /> 
			<tr> 
				<td>Producto
				
				<td><html:hidden property="entcodproducto"  /> 
				
				<%
				maestro.control.gstproducto gprod = new maestro.control.gstproducto();
				ingreso.form.entradaForm form = (ingreso.form.entradaForm)request.getAttribute("entradaForm");
				String desc = form!=null && (form.getentcodproducto()!=null && !form.getentcodproducto().equals("") ) 
								? gprod.getproducto( form.getentcodproducto()).getprodescripcion(): "";
				String tipopro = form!=null && (form.getentcodproducto()!=null && !form.getentcodproducto().equals("") ) 
								? gprod.getproducto( form.getentcodproducto()).getprotipoproducto(): "";
				String cant_averiado = gentrada.getSumaAveriada(form.getentcodsx());

				%>
				<input type="text" name="desc" value='<%= desc %>' readonly="true" class="readonly">
				<input type="hidden" name="tipopro" value='<%= tipopro %>'>
				*<html:errors property="entcodproducto"  /> 
				
				<%
				String cia = ing.getingcodcia();
				
				String[] parametros = new String[] {cia, "0", ""};
				String[] parametros_total = new String[] {cia, ""};
				String[] campos_form= new String[] {"entcodproducto", "desc", "entpesoneto", "entpesobruto", "tipopro"};
				String[] campos_pick = new String[] {"procodsx", "promodelo", "prokiloreal" , "prokiloreal", "protipoproducto"};
				String[] campos_entity= new String[] {"promodelo", "prodescripcion"};
				String[] nombres_campos_entity= new String[] {"Material", "Descripcion"};
						
				String metodo  = "getlistaproducto";
				String metodo_total = "getTotalPaginaslistaproducto";
				
//				el metodo dependera de si es de trafico y redefino los parametros, si no , se quedan igual
				if(ing.getingtipo().equals("TRAFICO")) {
					metodo = "getlistaproductoByTrafico";
					metodo_total= "getTotalPaginaslistaproductoByTrafico";
					parametros = new String[] {cia, ing.getingtrafico(), "0", ""};
					parametros_total = new String[] {cia, ing.getingtrafico(), ""};
					campos_form= new String[] {"entcodproducto", "desc", "entpesoneto", "entpesobruto", "entvalor", "tipopro"};

					campos_pick = new String[] {"procodsx", "promodelo", "prokiloreal" , "provolumen", "prokilovolumen", "protipoproducto" };
					campos_entity= new String[] {"promodelo", "prodescripcion" ,"prokilovolumen"};
					nombres_campos_entity= new String[] {"Material", "Descripcion", "Valor Unitario"};
				}
				
				%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstproducto" entidad="maestro.entity.producto" 
						formulario="entradaForm" metodo="<%= metodo %>"
						metodo_total="<%= metodo_total %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
			<%//if (tipopro != null && tipopro.equals("2")) {%>	
			<tr> 
				<td>Lote
				<% 
				ingreso.control.gstlote_trafico glote = new ingreso.control.gstlote_trafico();
				request.setAttribute("listalote_trafico" , glote.getlistalote_trafico(ing.getingtrafico(),form.getentcodproducto()));
				%>
				<td><html:select property="entlote">
					 <html:options collection="listalote_trafico" property="ltrafcodsx" labelProperty="ltraflote" />
				</html:select>	
			<%//} %>
			<tr> 
				<td>Bodega
				<td><html:select property="entbodega"  > 
					<%
					Collection bodegas = new maestro.control.gstbodega().getlistabodega();
					request.setAttribute("bodegas", bodegas);
					%>
			    <html:options collection="bodegas"  
					property="bodcodsx" labelProperty="bodnombre"   />
				</html:select>
			<tr> 
				<td>Posicion
				 
				<%
				 if(compmapa!=null && compmapa.equals("S")) {
				%>
				<td><html:text property="entposicion" readonly="true" styleClass="readonly" />
<!-- 				<a href="#" onclick="showmapa(document.entradaForm.entbodega.options[document.entradaForm.entbodega.selectedIndex].value, 'entposicion', 'entradaForm',   document.entradaForm.entcodproducto.value)">Mapa </a> -->
				<%}else {%>
				<td><%if(entf==null ) {%>
				    <html:select property="entposicion"  >
				    <%
					for (int i=1; i <= 1000;i++) {
						String numero = String.valueOf(i);
					%>
						<html:option value= "<%=numero%>"><%=numero%></html:option>
					<%}%>
					</html:select>
					<%} else {%>
					<html:text property="entposicion" readonly="true" styleClass="readonly" />
					<%}%>
				<%}%>	
				<html:errors property="entposicion"/>
			<tr> 
				<td>Cantidad
				<td><html:text property="entcantidad"  /> 
				*<html:errors property="entcantidad"  /> 
			<tr> 
				<td>Cantidad Averiada
				<td><%= cant_averiado %> 
			<tr> 
				<td>Unidad
				<% 
				maestro.control.gstunidad guni = new maestro.control.gstunidad();
				request.setAttribute("listaunidades" , guni.getlistaunidad());
				%>
				<td><html:select property="entunidad">
					 <html:options collection="listaunidades" property="unicod" labelProperty="unidesc" />
				</html:select>
			<tr> 
				<td>Peso N (unit) 
				<td>
				<% if (ing!=null && ing.getingtipo().equals("TRAFICO")) {  %>
				<html:text property="entpesoneto" readonly="true" styleClass="readonly"  /> 
				<%} else {%>
				<html:text property="entpesoneto"  /> 
				<%} %> KGM
				*<html:errors property="entpesoneto"  /> 
			<tr><td>Peso N (Total)	
				<td><html:text property="entpesonetototal" readonly="true" styleClass="readonly"/> KGM
			<tr> 
				<td>Peso B (unit)
				<td><% if (ing!=null && ing.getingtipo().equals("TRAFICO")) { //2015-09-15 LTA. Michel Candelo solicita que se permita modificar peso de ingresos tipo trafico %>
				<html:text property="entpesobruto"   /> 
				<%} else {%>
				<html:text property="entpesobruto"  /> 
				<%} %>KGM

				*<html:errors property="entpesobruto"  /> 
			<tr><td>Peso B (Total)	
				<td><html:text property="entpesobrutototal" readonly="true" styleClass="readonly"/>	KGM
				
			<tr><td>	Valor Unitario
				<td>	<html:text property="entvalor" readonly='<%= ing.getingtipo().equals("TRAFICO") ? true :false %>' styleClass='<%= ing.getingtipo().equals("TRAFICO") ? "readonly" :"" %>'/>
				<%= ing.getingtipo().equals("TRAFICO") ? "USD" :"$"%>
					
			<tr><td>	Valor Total
				<td>	<html:text property="entvalortotal" readonly="true" styleClass="readonly"/>
								<%= ing.getingtipo().equals("TRAFICO") ? "USD" :"$"%>

			<tr align="center"> 
				<td colspan="2">
				
    <% 
    
    	boolean tramite = ing!=null && ing.getIngestado()!=null && ing.getIngestado().equals("TRAMITE") ? true : false;
		boolean escritura = gstpermiso.getEscritura(session, "ingreso", "ingreso_datos.jsp");
		System.out.println("tramite:" + tramite + "  escritura:"+  escritura);
    if(escritura && tramite) {
    %>
    <html:submit  value="Grabar" />   
<% }else  {%>
<html:submit  value="Grabar" disabled="true" />   
<% } %>
<html:button property="algo" value="Cancelar" onclick="history.go(-1)"/>

	</table> 		
	</html:form> 		
	</html> 