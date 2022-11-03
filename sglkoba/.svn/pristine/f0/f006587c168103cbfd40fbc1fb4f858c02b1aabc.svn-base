 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="ingreso.control.*,ingreso.entity.*,java.util.*, maestro.entity.*, maestro.control.*, administracion.control.*, sap.control.*, sap.entity.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>
 
 <div class="contenedorPrincipal" style="padding:1em;">
 <div class="titulo"> Listado Archivos Recibidos 943 </div> 
 
 <br>
  
<%
gstinterface943 	control943 	  = new gstinterface943();
gstsapinterface943 	controlsap943 = new gstsapinterface943(); 
gstsap 				controlSap    = new gstsap();

control943.setMaxfilas(10);  

String param = request.getParameter("param"); 
String pag 	 = request.getParameter("pag");   

Collection lista = control943.getlistainterface943(pag, param); 
request.setAttribute("lista", lista); 
%>

<table align='center'  width='98%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 <tr>  
 <th> Código
 <th> Usuario
 <th> Archivo
 <th> P.O Number  (Num pedido)
 <th> Ship From (Enviar desde)
 <th> Number Units Shipped (Unidades enviadas)
 <th> Fecha carga archivo
 <th> Acción

 <logic:iterate id="temp" name="lista" type="interface943"  >
 
 <%
 gstsapinterface943.ResumenHolder943 resumen = controlsap943.getResumenArchivo(
 			controlSap.parsearStringInterface(
 			control943.getContenidoArchivoByIntcodsx(
 					temp.getIntcodsx())));
 %>
 
 <tr align='center'>   
 <td>   <%= temp.getIntcodsx() %>
 <td> 	<%= temp.getUsulogin() %>
 <td>  	<%= temp.getIntfilename() %>
 <td>  	<%= resumen.poNumber %>
 <td>  	<%= resumen.shipFrom %>(<%= resumen.shipFromId %>)
 <td>   <%= resumen.cantidadTotalEnviada %>
 <td>  	<%= temp.getIntfecha().substring(0, temp.getIntfecha().length()-6) %>
 <td>   Ir al tráfico  <a href='traficoAction.do?opcion=set&codsx=<%= temp.getTrafcodsx() %>'> <img src="./disenno/images/next.png" border="0" ></a>
 
 </logic:iterate>
 
</table> 

 <% 	 
 String url  = "main.jsp?app=ingreso&modulo=listadoArchivos943&param=" + (param==null?"":param); 
 int paginas = control943.getTotalPaginaslistainterface943(param); 
 %> 
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   />
 		
</div> <!--  Fin div principal -->
  
 
