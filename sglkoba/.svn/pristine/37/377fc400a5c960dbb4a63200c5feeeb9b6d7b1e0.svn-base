 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="maestro.control.*,maestro.entity.*, administracion.control.*,   pedido.control.*,pedido.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   
gstproducto gprod = new gstproducto();
 gstcompania gcomp = new gstcompania();
 
 
 gstpicking gpicking = new gstpicking(); 
 gstpicking_detalle gpickd = new gstpicking_detalle();
  gpicking.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gpicking.getlistapicking(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de pickings </div> 
 <br> 
 <table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "pedido", "picking.jsp") ){ %> 
 <a href='main.jsp?app=pedido&modulo=picking_datos'> Nuevo picking </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='main.jsp?app=pedido&modulo=picking'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
  <table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  <th> Consecutivo (*)
 <th> Fecha (*)
 <th> Empresa (*)
 <th> Packing Asociado (*)
 <th>Consec / Numero Pedido
 <th>Estado Pedido
 <th>Referencias (*)
 
 <th> Opcion	<logic:iterate id="temp" name="lista" type="picking"  >
 <tr align='center'>  <td>  <%= temp.getpickcodsx() %>
 <td>  <%= temp.getpickfecha() %>
 <td>  <%= gcomp.getcompania( temp.getpickempresa()).getcomnombre() %>
 <td>  <%= temp.getpickcodpacking() %>
 <td> <%= temp.getPickpedido()==null ?"&nbsp;" : temp.getPickpedido() %>  / <%= temp.getPicknumpedido()==null ? "&nbsp;": temp.getPicknumpedido() %>
 <td><%
 gstpedido gped = new gstpedido();
 pedido pedi = gped.getpedido(temp.getPickpedido());
String ped = temp.getPickpedido()==null ?"NO EXISTE" : pedi.getpedestado();
 %>
 <%= ped %>
<td>
<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr><th>Modelo <th>Referencia <th>Cant <th>Vlr unit
	
	<%
	Collection dets = gpickd.getlistapicking_detalle(temp.getpickcodsx());
	java.util.Iterator ite = dets.iterator();
	while(ite.hasNext()) {
		picking_detalle pickd = (picking_detalle)ite.next();
		producto prod =gprod.getproducto( pickd.getpickdproducto() );
		
	%>
	<tr>
		<td> <%= prod.getpromodelo()%>
		<td> <%= prod.getprodescripcion()%>
		<td> <%= gpickd.getTotalPicking_detalle( pickd.getpickdcodsx())  %>
		<td><%= pickd.getPickdvalorunit() %>
	
	<% } %>
</table>
	
 <td> <a href='pickingAction.do?opcion=set&codsx=<%= temp.getpickcodsx()%>'> <img src="./disenno/images/update.gif" border="0" ></a>|
 <%if(gstpermiso.getEscritura(session, "pedido", "picking.jsp")&& temp.getpickestado().equals("TRAMITE") ){ %> 
		<a href="javascript:validarDelete('pickingAction.do?opcion=delete&codsx=<%= temp.getpickcodsx()  %>')"> <img src="./disenno/images/substract.gif" border="0" ></a>   
 <% } %> 
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=pedido&modulo=picking&param=" + (param==null?"":param); 
 int paginas = gpicking.getTotalPaginaslistapicking(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
  <br>Los campos con (*) son de busqueda