 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   pedido.control.*,pedido.entity.*,java.util.*"%> 
 <%@page import="util.Fecha"%>
<html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstcausal_pedido gcausal_pedido = new gstcausal_pedido(); 
  gcausal_pedido.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   
  String pedcodsx = request.getParameter("pedcodsx");
 Collection lista = gcausal_pedido.getlistacausal_pedido( pedcodsx, pag, param); 
 request.setAttribute("lista", lista); 

 pedido ped = new gstpedido().getpedido(pedcodsx);
  %> 
 <div class="titulo"> HISTORIAL HIT DEL PEDIDO <%= ped.getpednumpedido() %> </div> 
 <br> 
 <table width='80%' align='center' border='0'> 
 	<Tr> 
 	<td align='left'>   
&nbsp;
 	<td align='right'> 	<form method='post' action='main.jsp?app=pedido&modulo=causal_pedido&pedcodsx=<%=pedcodsx %>'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
 <table align='center'  width='90%' border='0' class='tabla_listas' cellspacing='0' cellpading='0'> 
 	<tr>  
 <th> Causal
 <th> Descripcion
 <th> Fecha / Hora
 <th> Opcion	
  <logic:iterate id="temp" name="lista" type="causal_pedido"  >
 <tr>
 	<td> <%= temp.getcaupcausal() %>
 	 	<td> <%= temp.getcaupdesccausal() %>
 	 	 	<td> <%= Fecha.limpiarseg(temp.getcaupfecha()) %>
<td> 	 	 	
 <%if(gstpermiso.getEscritura(session, "pedido", "causal_pedido.jsp") && ped.getpedestado().equals("TRAMITE")){ %> 
		<a href="javascript:validarDelete('causal_pedidoAction.do?opcion=delete&codsx=<%= temp.getcaupcodsx()  %>&pedcodsx=<%= pedcodsx %>')"><img src="./disenno/images/substract.gif" border="0" ></a>   
 <% } %> 

 </logic:iterate>
   </table> 
	 <% 	 String url = "main.jsp?app=pedido&modulo=causal_pedido&pedcodsx=" + pedcodsx + "&param=" + (param==null?"":param); 
 int paginas = gcausal_pedido.getTotalPaginaslistacausal_pedido(pedcodsx, param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 </html>