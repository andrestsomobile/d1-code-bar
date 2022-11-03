 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   pedido.control.*,pedido.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   
maestro.control.gstproducto gprod = new maestro.control.gstproducto();
 gstpicking_detalle gpicking_detalle = new gstpicking_detalle(); 
 gstpicking_detalle_packing gpickp = new gstpicking_detalle_packing();
 gstpacking_detalle_posicion gpackpos = new gstpacking_detalle_posicion();
 
  gpicking_detalle.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gpicking_detalle.getlistapicking_detalle(pickcodsx,  pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de picking_detalles </div> 
 <br> 
 <table width='80%' align='center' border='0'> 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "pedido", "picking_detalle.jsp") && tramite){ %> 
 <a href='main.jsp?app=pedido&modulo=picking_detalle_datos&pickdcodpicking=<%= pickcodsx %>'> Nuevo picking_detalle </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='pickingAction.do?opcion=set&codsx=<%= pickcodsx %>'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  
 <th> Modelo (*)
 <th>Descripcion (*)
 <th>Cantidad
 <th>Valor unit
 <th>Posiciones
 
 <th> Opcion	<logic:iterate id="temp" name="lista" type="picking_detalle"  >
 <tr align='center'>  
 <%
 maestro.entity.producto prod = gprod.getproducto( temp.getpickdproducto());
 %>
 <td>  <%= prod.getpromodelo() %>
 <td>  <%= prod.getprodescripcion() %>
 <td>  <%= gpicking_detalle.getTotalPicking_detalle(temp.getpickdcodsx() )%>
 <td> <%= temp.getPickdvalorunit() %>
 <td>

<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr><th>Bodega <th>Posicion <th>Cantidad
	<%
	Collection pos = gpickp.getlistapicking_detalle_packing(temp.getpickdcodsx());
	Iterator ite = pos.iterator();
	while(ite.hasNext()) {
		picking_detalle_packing pp = (picking_detalle_packing)ite.next();
		packing_detalle_posicion packpos = gpackpos.getpacking_detalle_posicion( pp.getpickppackingdet());		
	%>
	<tr> 
		<td> <%= packpos.getpackpbodega() %>
		<td> <%= packpos.getpackpposicion() %>
		<td> <%= pp.getpickpcantidad() %>
		
	
	<% } %>
</table>

 <td> &nbsp;
 <%if(gstpermiso.getEscritura(session, "pedido", "picking_detalle.jsp") && tramite ){ %> 
		<a href="javascript:validarDelete('picking_detalleAction.do?opcion=delete&codsx=<%= temp.getpickdcodsx()  %>')"><img src="./disenno/images/substract.gif" border="0" ></a>   
 <% } %> 
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=pedido&modulo=picking_detalle&param=" + (param==null?"":param); 
 int paginas = gpicking_detalle.getTotalPaginaslistapicking_detalle(pickcodsx,  param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 <br>Los campos con (*) son de busqueda.
