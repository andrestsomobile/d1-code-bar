 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="ingreso.control.*,ingreso.entity.*,java.util.*, maestro.entity.*, maestro.control.*, administracion.control.*, sap.control.*, sap.entity.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>
 
 <div class="contenedorPrincipal" style="padding:1em;">
 <div class="titulo"> Listado Archivos Enviados 945 </div> 

 <br> 

 <%
 gstinterface945 	control945 	  = new gstinterface945();
 gstsapinterface945 controlsap945 = new gstsapinterface945(); 
 gstsap 			controlSap    = new gstsap();

 control945.setMaxfilas(10);  

 String param 	= request.getParameter("param"); 
 String pag 	= request.getParameter("pag");   

 Collection lista = control945.getlistainterface945(pag, param); 
 request.setAttribute("lista", lista); 
 %>

<table align='center'  width='98%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 <tr>  
 <th> Código
 <th> Usuario
 <th> Archivo
 <th> Delivery/Order Number (Pedido)
 <th> Ship To (Enviar a)
 <th> Date (Fecha Envio)
 <th> Fecha carga archivo
 <th> Acción
 	

<logic:iterate id="temp" name="lista" type="interface945"  >
 
 <% 
 gstsapinterface945.ResumenHolder945 resumen = controlsap945.getResumenArchivo(
 			controlSap.parsearStringInterface(
 			control945.getContenidoArchivoByIntcodsx(
 					temp.getIntcodsx())));
 %>
 
 <tr align='center'>  
 <td>   <%= temp.getIntcodsx() %>
 <td> 	<%= temp.getUsulogin() %>
 <td> 	<%= temp.getIntfilename() %>
 <td>   <%= resumen.delivery %>
 <td>  	<%= resumen.shipTo %>
 <td> 	<%= resumen.shippedDate %>
 <td>  	<%= temp.getIntfecha().substring(0, temp.getIntfecha().length()-6) %>
 <td>  Ir al pedido  <a href='pedidoAction.do?opcion=set&pedcodsx=<%= temp.getPedcodsx() %>'> <img src="./disenno/images/next.png" border="0" ></a>
  
 
</logic:iterate>

</table> 
	
<% 	 
 String url  = "main.jsp?app=pedido&modulo=listadoArchivos945&param=" + (param==null?"":param); 
 int paginas = control945.getTotalPaginaslistainterface945(param); 
 %> 
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   />
 
	
	
</div> <!--  Fin div principal -->
  
 
