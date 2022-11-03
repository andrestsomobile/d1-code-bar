 
 <%@page import="sap.control.gstsapinterface944"%>
<%@page import="sap.control.gstinterface944"%>
<%@page import="sap.control.gstsapinterface943"%>
<%@page import="sap.control.gstsap"%>
<%@page import="sap.control.gstinterface943"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso,ingreso.control.*,ingreso.entity.*,java.util.*, util.Math"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   
 gstreferencia_trafico greferencia_trafico  = new gstreferencia_trafico(); 
 maestro.control.gstproducto gprod 			= new maestro.control.gstproducto();
 gstfactura_trafico gfactura_trafico        = new gstfactura_trafico(); 
 gstinterface943 gstinterface943            = new gstinterface943();
 gstinterface944 gstinterface944            = new gstinterface944();

 gstsapinterface943 controlInterface943     = new gstsapinterface943();
 gstsapinterface944 controlInterface944     = new gstsapinterface944();
 
 gstsap controlSap                          = new gstsap();
 Map<String, String> cantidadOriginal       = new HashMap<String, String>();//Listado de todas las refrencias por cantidad original
 Map<String, String> cantidadTotalReal      = new HashMap<String, String>();//Listado de todas las referencias en el trafico sumando los similares.
 Map<String, String> referenciasDanadas     = new HashMap<String, String>();//Listado de todas las referecias con sus el valor dañado reportado
 boolean             existeArchivo943       = false; 
 gfactura_trafico.setMaxfilas(10);  

 String trafcodsx = request.getAttribute("trafcodsx")==null ? request.getParameter("trafcodsx") : (String)request.getAttribute("trafcodsx");
  
 String param = request.getParameter("param"); 
 String pag   = request.getParameter("pag");   

 Collection lista = gfactura_trafico.getlistafactura_trafico( trafcodsx, pag, param); 
 request.setAttribute("lista", lista);
 
 //Recupero la información de archivo original.
 String contenidoArchivo943 = gstinterface943.getContenidoArchivoByTrafcodsx(trafcodsx);
 if(contenidoArchivo943 != null){
	 cantidadOriginal = controlInterface943.procesarReferenciasPorCantidadEnviada(controlSap.parsearStringInterface(contenidoArchivo943));
	 existeArchivo943 = true;
 }
 
 //Recupero la información de los borrados en caso de que ya haya sido enviado.
 String contenidoArchivo944 = gstinterface944.getContenidoArchivoByTrafcodsx(trafcodsx);
 if(contenidoArchivo944 != null){
	 referenciasDanadas = controlInterface944.procesarReferenciasDanadas(controlSap.parsearStringInterface(contenidoArchivo944));		 
 }
 
 for(Object facturaLista : lista){
	 factura_trafico factura 		= (factura_trafico) facturaLista;
	 Collection referenciasTrafico 	= greferencia_trafico.getlistareferencia_trafico( factura.getftrafcodsx()); 
	 for(Object referenciaLista : referenciasTrafico){
		referencia_trafico referenciaTrafico = (referencia_trafico) referenciaLista;
		maestro.entity.producto producto 	 = gprod.getproducto( referenciaTrafico.getreftproducto());
		if( cantidadTotalReal.containsKey(producto.getpromodelo()) ){
			cantidadTotalReal.put(
				producto.getpromodelo(), 
				util.Math.sumar(cantidadTotalReal.get(producto.getpromodelo()), referenciaTrafico.getreftcantidad())
			);
		}else{
			cantidadTotalReal.put(
				producto.getpromodelo(), 
				referenciaTrafico.getreftcantidad()
			);
		}		
	 }
 }
 %> 
  
<script>
function enviarArchivo944(){
	
	var tddanadas = document.querySelectorAll(".tddanada");
	
	var listadoDanados = ""; // 3546*20~2546*30~1546*10 
	
	for(var i = 0; i < tddanadas.length ; i++){		
		
		var tddanada  = tddanadas[i];
		
		var refdanada = null;
		var reftcodsx = null; 
						
		var temp = tddanada.querySelectorAll(".refdanada");
		if(temp.length > 0){
			var refdanadaElement = temp[0];
			refdanada = refdanadaElement.value;
		}
		
		temp =  tddanada.querySelectorAll(".reftcodsx");
		if(temp.length > 0){
			var reftcodsxElement = temp[0];
			reftcodsx = reftcodsxElement.value;
		}
		
		if(refdanada != null && reftcodsx != null){
			if(refdanada != "" & refdanada != "0" ){
				listadoDanados += reftcodsx+"*"+refdanada+"~";					
			}			
		}		
	}
	
	if( listadoDanados != "" ){
		listadoDanados = listadoDanados.slice(0, -1);
	}
		
	
	//console.log(listadoDanados);
	//console.log(encodeURIComponent(JSON.stringify(listadoDanados)));
	
	
// 	var eles = [];
// 	var inputs = document.getElementsByTagName("input");
// 	for(var i = 0; i < inputs.length; i++) {
// 		var nombre = inputs[i].name; 
// 	    if(inputs[i].name.indexOf('refdanada') == 0) {
// 	        eles.push(inputs[i]);
// 	    }
// 	}
// 	console.log(eles);
	
	location.href="main.jsp?app=ingreso&modulo=enviarArchivo944&trafcodsx=<%= trafcodsx %>&danados="+encodeURIComponent(listadoDanados);		
}

function cambiarReferenciaFactura(){
	var url = "factura_traficoAction.do?opcion=moverReferenciaFactura";
	if(confirm('¿Seguro desea mover el item de factura?')) 
		window.location=url;
	
}

</script>
 <div class="titulo"> Facturas y Referencias Asociadas al Trafico </div> 

 
 <br> 

<%@ include file="trafico_head.jsp" %>

 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='left' height="40">
 	<% if(gstpermiso.getEscritura(session, "ingreso", "factura_trafico.jsp") && traf.getTrafestado().equals("TRAMITE")) {%>
 	<a href='main.jsp?app=ingreso&modulo=factura_trafico_datos&trafcodsx=<%=trafcodsx %>'> Agregar Factura </a>
 	<br><br>
 	<a href='main.jsp?app=ingreso&modulo=subir&trafcodsx=<%=trafcodsx %>'> Agregar Referencias a Factura desde un Archivo Plano </a>
 	<br>
 	<br><br>
 	<a href='ShowFiles'> Ver Log Errores </a>
 	<br>
 	<%} %>
 	<td align='right'> 	&nbsp;
 </table>
 <br> 
<% if(existeArchivo943) { 
		if(traf.getTrafestado().equals("TRAMITE")){
			%>
			<div style="text-align:right; paddingLeft:2em; margin-bottom:1em;">El tráfico se encuentra en tramite<br/></div>
			<%
		}else{			
			%>
			<div style="text-align:right; paddingLeft:2em;"><input type="button" id="submitID" name="button" value="Enviar SAP 944" onclick="enviarArchivo944()" /></div>
			<%			
		}
 } 
 %>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  
 <th> Numero
 <th> Opcion	
 <th> Referencias
 <logic:iterate id="temp" name="lista" type="factura_trafico"  >
 <tr align='center'>
 <td>  <%= temp.getftrafnumfactura() %>
<td>
<%
Collection refs = greferencia_trafico.getlistareferencia_trafico( temp.getftrafcodsx()); 
request.setAttribute("refs", refs); 
Collection facturas = new gstfactura_trafico().getlistafactura_trafico(trafcodsx);
request.setAttribute("facturas", facturas);
%>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="pequeno"> 
<tr>	<th>Referencia 
		<th>Desc 
		<th>Serial 
		<th>Cant. Registrada
		<%if(existeArchivo943){ %> <th>Cant. Original <% } %>
		<th>FOB Total
		<%if(existeArchivo943 && !traf.getTrafestado().equals("TRAMITE")){ %> <th>Unidades Dañadas <% } %>
		<%if(existeArchivo943){ %> <th>Mover A <% } %>
		
  <logic:iterate id="ref" name="refs" type="referencia_trafico"  >
  	<%
  	maestro.entity.producto prod = gprod.getproducto( ref.getreftproducto());
  	%>
  	<tr><td><%= prod.getpromodelo() %> 
  	<td><%= prod.getprodescripcion() %>
  	<td><%=(ref.getreftserial()!=null)?ref.getreftserial():"-"%>
  	<td><%= ref.getreftcantidad() %>
<%--   	<td><%= ref.getreftcantidad() %> --%>

	<% if(existeArchivo943) { %>
    <td>
    	<%
    		String cantidad = "0";
    		if( cantidadOriginal.containsKey(prod.getpromodelo()) ){
    			String cantidadOriginalRestante  = (String)cantidadOriginal.get(prod.getpromodelo()); 
    			String cantidadTotalRealRestante = util.Math.restar_bigdecimal(
    						(String)cantidadTotalReal.get(prod.getpromodelo()),
    						ref.getreftcantidad()    							
    					).toPlainString();
    			cantidadTotalReal.put(prod.getpromodelo(), cantidadTotalRealRestante);
    			
    			if(util.Math.comparar(ref.getreftcantidad(), cantidadOriginalRestante) < 0 ){
    				cantidad = ref.getreftcantidad();
    				cantidadOriginal.put(prod.getpromodelo(), util.Math.restar_bigdecimal(cantidadOriginalRestante, cantidad).toPlainString());
    				if(util.Math.comparar("0", cantidadTotalRealRestante) == 0){ //Ya es el ultimo
    					//cantidad = util.Math.restar_bigdecimal(cantidadOriginalRestante, cantidad).toPlainString();
    					cantidad = cantidadOriginalRestante;
    				}
    			}else{
    				cantidad = cantidadOriginalRestante;
    				cantidadOriginal.put(prod.getpromodelo(), util.Math.restar_bigdecimal(cantidadOriginalRestante, cantidad).toPlainString());    				
    			}
    		}
    	%>
    	<%= cantidad %>
    <% } %>
  	<td><%= ref.getreftfobtotal() %>
  	<% if(existeArchivo943 && !traf.getTrafestado().equals("TRAMITE")) { %>
  	<td class="tddanada" >
  		<%
  		String refdanada = "";
  		if( referenciasDanadas.containsKey(prod.getpromodelo())){
  			refdanada = referenciasDanadas.get(prod.getpromodelo());
  			referenciasDanadas.remove(prod.getpromodelo());
  		}
  		%>
  		<input class="refdanada" value="<%= refdanada %>" />
  		<input class="reftcodsx" value="<%= prod.getpromodelo() %>"  type="hidden" />
  	<% } %>
  	<td>  	 
  	<% if(existeArchivo943) { %>	  
	<form method='post' onsubmit="return false;" action='factura_traficoAction.do?opcion=moverReferenciaFactura&codsx=<%=trafcodsx %>'>		
	    <input name="refcantidad" 	value="<%=ref.getreftcantidad()%>" />
	    <input type="hidden" name="reftcodsx" 	          value="<%=ref.getreftcodsx()%>" />
	    <input type="hidden" name="reftnumfacturatrafico" value="<%=ref.getreftnumfacturatrafico()%>" />	     	    	   
 		<select name="ftrafcodsx" onchange="submit();">  	
 		<logic:iterate id="fac" type="factura_trafico" name="facturas">
 			<option value="<%= fac.getftrafcodsx() %>" <%= fac.getftrafcodsx().equals( ref.getreftnumfacturatrafico()) ? "selected" : ""  %>> <%= fac.getftrafnumfactura() %></option>
 		</logic:iterate> 	
 		</select>
 	</form>
 	<% } %>
  </logic:iterate>
  
</table>

 <td> 
  <% if(gstpermiso.getEscritura(session, "ingreso", "factura_trafico.jsp") && traf.getTrafestado().equals("TRAMITE")) {%>
 <a href='factura_traficoAction.do?opcion=set&codsx=<%= temp.getftrafcodsx()%>'><img src="./disenno/images/update.gif" title="Actualizar" ></a> 			
 &nbsp;| &nbsp; 		
 <a href="javascript:validarDelete('factura_traficoAction.do?opcion=delete&codsx=<%= temp.getftrafcodsx()  %>')"><img src="./disenno/images/substract.gif" title="Eliminar" ></a>
  &nbsp;| &nbsp;
 <%} %>
  <a href='main.jsp?app=ingreso&modulo=referencia_trafico&trafcodsx=<%= trafcodsx %>&ftrafcodsx=<%= temp.getftrafcodsx()%>'>Referencias </a> 			
  
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=ingreso&modulo=factura_trafico&trafcodsx=" + trafcodsx + "&param=" + (param==null?"":param); 
 int paginas = gfactura_trafico.getTotalPaginaslistafactura_trafico( trafcodsx,  param);  
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 