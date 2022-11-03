 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="ingreso.control.*,ingreso.entity.*,java.util.*, maestro.entity.*, maestro.control.*, administracion.control.*, sap.control.*, sap.entity.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>


 <%
 gstinterface940 	control940 	  = new gstinterface940();
 gstsapinterface940 controlsap940 = new gstsapinterface940(); 
 gstsap 			controlSap    = new gstsap();

 control940.setMaxfilas(10);  

 String param 	 = request.getParameter("param"); 
 String pag 	 = request.getParameter("pag");
 String intcodsx = request.getParameter("intcodsx"); //Es el código del pedido al cual se mostrará el detalle de la advertencia.

 if(param == null){
	 param="";
 }
 
 if(pag==null){
	 pag = "0";
 }
 
 Collection lista = control940.getlistainterface940(pag, param); 
 request.setAttribute("lista", lista); 
 %>

<script language="javascript">
function mostrarMensaje(codigoInterface){
	var el = document.querySelectorAll('#filaMensaje'+codigoInterface)[0];
	toggle(el, "");
}

function hide(el) {
    el.style.display = 'none';
}

function show(el, value) {
    el.style.display = value;
}

function toggle(el, value) {
    var display = (window.getComputedStyle ? getComputedStyle(el, null) : el.currentStyle).display;
    if (display == 'none') el.style.display = value;
    else el.style.display = 'none';
}

function  aceptar(){
	location.href="main.jsp?app=pedido&modulo=listadoArchivos940&param=<%= param%>&pag=<%= pag%>";
}
</script>
 

 
 <div class="contenedorPrincipal" style="padding:1em;">
 <div class="titulo">
 	<%
 		if(intcodsx==null){
 			%>
 			Listado Archivos Recibidos 940
 			<%		
 		}else{
 			%>
 			Detalle Archivo 940
 			<%
 		}
 	%> 
 	 
 </div> 

 <br> 

 
 
 <%
 if(intcodsx == null){ //Mostrar listado
 %>
<table align='center'  width='98%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 <tr>  
 <th> Código
 <th> Usuario
 <th> Archivo
 <th> Delivery Number (Num Orden compra)
 <th> Purchase Order Number (Num Orden Pedido)
 <th> Bill To(Cobrar a)
 <th> Requested Ship Date (Fecha Envio)
 <th> Fecha carga archivo
 <th> Estado
 <th> Acción

<logic:iterate id="temp" name="lista" type="interface940"  >
 
 <% 
 gstsapinterface940.ResumenHolder940 resumen = controlsap940.getResumenArchivo(
 			controlSap.parsearStringInterface(
 			control940.getContenidoArchivoByIntcodsx(
 					temp.getIntcodsx())));
 %>
 
 
 
 <tr align='center'>  
 <td>   <%= temp.getIntcodsx() %>
 <td> 	<%= temp.getUsulogin() %>
 <td> 	<%= temp.getIntfilename() %>
 <td>   <%= resumen.depositorOrderNumber %>
 <td>  	<%= resumen.poNumber %>
 <td>  	<%= resumen.billTo %>(<%= resumen.billToId %>)
 <td>   <%= resumen.requestedShipDate %>
 <td>  	<%= temp.getIntfecha().substring(0, temp.getIntfecha().length()-6) %>
 <td>  
 <%
 	if(temp.getIntestadoimportacion().equals("OK")){
 		%>
 		<div>
		  <img src="./disenno/images/iconook.png" style="" width="20" height="20"/>
		  <span style="padding-bottom:1em; color:#4e9a06;">Correcto</span>
		</div> 		
 		<%
 	}else if(temp.getIntestadoimportacion().equals("WARNING")){
 		%>
 		<a style="color:#f57900;"" href="main.jsp?app=pedido&modulo=listadoArchivos940&param=<%= param%>&pag=<%= pag%>&intcodsx=<%= temp.getIntcodsx() %>"><img src="./disenno/images/iconowarning.png" />Advertencia</a>
 		<%
 	}else{
		%>
		<a style="color:#cc0000;"" href="main.jsp?app=pedido&modulo=listadoArchivos940&param=<%= param%>&pag=<%= pag%>&intcodsx=<%= temp.getIntcodsx() %>"><img src="./disenno/images/iconofail.png" />Error al cargar</a>
		<%
	}
 %>
 
 
 <td>
   <%
 	if(temp.getIntestadoimportacion().equals("OK") || temp.getIntestadoimportacion().equals("WARNING")){
 	%>
 	Ir al pedido  <a href='pedidoAction.do?opcion=set&pedcodsx=<%= temp.getPedcodsx() %>'> <img src="./disenno/images/next.png" border="0" ></a>
 	<%
 	}
   %>
 	
 <tr id="filaMensaje<%= temp.getIntcodsx()%>" class="filaMensaje " align='center' style="display: none;"> 
 <td colspan="10" style="padding-bottom: 1em; padding-top: 1em;">  <%= temp.getIntmensajeextra() %>
 
</logic:iterate>

</table> 
	
<% 	 
 String url  = "main.jsp?app=pedido&modulo=listadoArchivos940&param=" + (param==null?"":param); 
 int paginas = control940.getTotalPaginaslistainterface940(param); 
 %> 
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   />
 
 <%
 }else{
	 interface940 int940 = control940.getinterface940(intcodsx);
	 gstsapinterface940.ResumenHolder940 resumen = controlsap940.getResumenArchivo(
	 			controlSap.parsearStringInterface(
	 			control940.getContenidoArchivoByIntcodsx(
	 					int940.getIntcodsx())));
	 %>	 
	 <table align='center'  width='98%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	 <tr>  
		 <th> Código
		 <th> Usuario
		 <th> Archivo
		 <th> Delivery Number (Num Orden compra)
		 <th> Purchase Order Number (Num Orden Pedido)
		 <th> Bill To(Cobrar a)
		 <th> Requested Ship Date (Fecha Envio)
		 <th> Fecha carga archivo
		 <th> Estado	
		 <th> Acción
	<tr align='center'>  
		 <td>   <%= int940.getIntcodsx() %>
		 <td> 	<%= int940.getUsulogin() %>
		 <td> 	<%= int940.getIntfilename() %>
		 <td>   <%= resumen.depositorOrderNumber %>
		 <td>  	<%= resumen.poNumber %>
		 <td>  	<%= resumen.billTo %>(<%= resumen.billToId %>)
		 <td>   <%= resumen.requestedShipDate %>
		 <td>  	<%= int940.getIntfecha().substring(0, int940.getIntfecha().length()-6) %>
		 <td>  
		 <%
		 	if(int940.getIntestadoimportacion().equals("OK")){
		 		%>
		 		<div>
				  <img src="./disenno/images/iconook.png" style="" width="20" height="20"/>
				  <span style="padding-bottom:1em; color:#4e9a06;">Correcto</span>
				</div>	
		 		<%
		 	}else if(int940.getIntestadoimportacion().equals("WARNING")){
		 		%>
		 		<div>
				  <img src="./disenno/images/iconowarning.png" style="" width="20" height="20"/>
				  <span style="padding-bottom:1em; color:#f57900;">Advertencia</span>
				</div>
		 		<%
		 	}else{
		 		%>
		 		<div>
				  <img src="./disenno/images/iconofail.png" style="" width="20" height="20"/>
				  <span style="padding-bottom:1em; color:#cc0000;">Error al cargar</span>
				</div>
		 		<%
		 	}
		 %>
		 <td>
		 <%
		 	if(int940.getIntestadoimportacion().equals("OK") || int940.getIntestadoimportacion().equals("WARNING")){
		 	%>
		 	Ir al pedido  <a href='pedidoAction.do?opcion=set&pedcodsx=<%= int940.getPedcodsx() %>'> <img src="./disenno/images/next.png" border="0" ></a>
		 	<%
		 	}
		 	
		   %>
		 
	</table>
	
	
	<br/>
	<br/>
	<br/>
	
	<h3> Listado de advertencias </h3>
	
	<%= int940.getIntmensajeextra() %>	 
	
	<br/>
	<br/>
	
	<div style=" width: 26em; margin: 0 auto; font-size: 1.2em;">
									
		<div style="text-align: center;  margin-top:1em;"><input type="button" id="aceptar" name="aceptar" value="Aceptar" onclick="aceptar();"/></div>	
	</div>
	
	<%
	
	
	 
 }
 %>
	
	
</div> <!--  Fin div principal -->
  
 
