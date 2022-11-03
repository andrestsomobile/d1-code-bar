 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   pedido.control.*,pedido.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   
maestro.control.gstbodega gbod = new maestro.control.gstbodega();
 
 gstpacking_detalle gpacking_detalle = new gstpacking_detalle(); 
  gpacking_detalle.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gpacking_detalle.getlistapacking_detalle(packcodsx, pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Referencias Dentro del Packing </div> 
 <br> 
 <table width='80%' align='center' border='0'> 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "pedido", "packing_detalle.jsp") && tramite ){ %> 
 <a href='main.jsp?app=pedido&modulo=packing_detalle_datos&packdpacking=<%= packcodsx %>'> 
 Agregar Total de un Producto al Packing </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='packingAction.do?opcion=set&codsx=<%= packcodsx %>'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
 <table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>
 <th>Material	 (*)
 <th> Descripcion (*)
 <th>Total
 <th>Disponible
 <th>Detalle
 
 <th> Opcion	<logic:iterate id="temp" name="lista" type="packing_detalle"  >
 <tr align='center'>  
 <%
 maestro.control.gstproducto gprod = new maestro.control.gstproducto();
 maestro.entity.producto prod = gprod.getproducto( temp.getpackdproducto());
 %>
 <td>  <%= prod.getpromodelo() %>
 <td>  <%= prod.getprodescripcion() %>
<td> <%= gpacking_detalle.getTotalPacking_detalle( temp.getpackdcodsx()) %>
<td> <%= gpacking_detalle.getSaldoPacking_detalle( temp.getpackdcodsx()) %>
<td>
	<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr><th>Bodega <th>Posicion <th>Cantidad <th>Disponible
<%
	Collection detalles = new gstpacking_detalle_posicion().getlistapacking_detalle_posicion(  temp.getpackdcodsx());
	Iterator itedet = detalles.iterator();
	while(itedet.hasNext()) {
		packing_detalle_posicion pdp = (packing_detalle_posicion) itedet.next();
		
	%><tr>
	<td> <%= gbod.getbodega( pdp.getpackpbodega() ).getbodnombre() %> <td> <%= pdp.getpackpposicion() %> <td> <%= pdp.getpackpcantidad() %>
	<td> <%= pdp.getPackpsaldo() %>
	<% } %>
	</table>
 <td> &nbsp;
 <%if(gstpermiso.getEscritura(session, "pedido", "packing_detalle.jsp") && tramite ){ %> 
		<a href="javascript:validarDelete('packing_detalleAction.do?opcion=delete&codsx=<%= temp.getpackdcodsx()  %>')"> <img src="./disenno/images/substract.gif" border="0" ></a>   
 <% } %> 
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=pedido&modulo=packing_detalle&param=" + (param==null?"":param); 
 int paginas = gpacking_detalle.getTotalPaginaslistapacking_detalle( packcodsx, param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 <br>Los campos con (*) son de busqueda