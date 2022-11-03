  <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   pedido.control.*,pedido.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstnovedad_pedido gnovedad_pedido = new gstnovedad_pedido(); 
  gnovedad_pedido.setMaxfilas(10);  

  String pedcodsx = request.getParameter("pedcodsx"); 
 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   
 
 Collection lista = gnovedad_pedido.getlistanovedad_pedido(pedcodsx, pag, param); 
 request.setAttribute("lista", lista); 
 gstpedido gped = new gstpedido();
 pedido ped =gped.getpedido(pedcodsx);
  %> 
 <div class="titulo"> Novedades del pedido <%= ped.getpednumpedido() %> </div> 
 <br> 
 <table width='80%' align='center' border='0'> 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getAdministracion(session, "pedido", "novedad_pedido.jsp") ){ %> 
 <a href='main.jsp?app=pedido&modulo=novedad_pedido_datos&pedcodsx=<%= pedcodsx %>'> Nuevo novedad_pedido </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='main.jsp?app=pedido&modulo=novedad_pedido&pedcodsx=<%= pedcodsx %>'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
 <table align='center'  width='90%' border='0' class='tabla_listas' cellspacing='0' cellpading='0'> 
 	<tr>  

 <th> Fecha
 <th> Novedad
 <th> Opcion
 <logic:iterate id="temp" name="lista" type="novedad_pedido">
 <tr>
 	<td> <%= temp.getnovfecha() %>
 	<td> <%= temp.getnovdesc() %>
 	<td>
 	<% if(gstpermiso.getAdministracion(session, "pedido" , "novedad_pedido.jsp") ){ %>
 	
 	<a href="novedad_pedidoAction.do?opcion=delete&codsx=<%= temp.getnovcodsx() %>&pedcodsx=<%= pedcodsx %>"> <img src="./disenno/images/substract.gif" border="0" >  </a>
 		
 	<%} %>
 </logic:iterate>
 	  </table> 
	 <% 	 String url = "main.jsp?app=pedido&modulo=novedad_pedido&param=" + (param==null?"":param) +"&pedcodsx=" + pedcodsx; 
 int paginas = gnovedad_pedido.getTotalPaginaslistanovedad_pedido(pedcodsx, param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 </html>