 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   pedido.control.*,pedido.entity.*,java.util.*, maestro.control.*"%> 
 <%@page import="maestro.entity.producto"%>
<%@page import="nacionalizacion.control.gstnacionalizacion"%>
<%@page import="java.math.BigDecimal"%>
<html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstcompania gcia = new gstcompania();
 gstpedido gpedido = new gstpedido(); 
 gstciudad gciud = new gstciudad();
 gstdepartamento gdep = new gstdepartamento();
 gstcliente gcli = new gstcliente();
  gpedido.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gpedido.getlistapedido(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de pedidos </div> 
 <br> 
<table align='center'  width='98%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "pedido", "pedido.jsp") ){ %> 
 <a href='main.jsp?app=pedido&modulo=pedido_datos'> Nuevo pedido </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='main.jsp?app=pedido&modulo=pedido'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
<table align='center'  width='98%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  <th> Consecutivo (*)
 <th> Empresa (*)
 <th>Cliente (*)
 <th> No. Solicitud (*)
 <th> No. PETRA (*)
 <th> Guia (*)
 <th> Fecha Sist (*)
 <th> Fecha Ped
 <th> Destino
 <th> Opcion	
 <logic:iterate id="temp" name="lista" type="pedido"  >
 <tr align='center'>  <td>  <%= temp.getpedcodsx() %>
 <td>  <%= gcia.getcompania( temp.getpedcompania()).getcomnombre() %>
 <td> <%= gcli.getcliente( temp.getpedcliente()  ).getclinombre() %>
 <td>  <%= temp.getpednumpedido() %>
 <td>  <%= temp.getpedordencompra() %>
 <td>  <%= temp.getpedguia() %>
 <td>  <%= temp.getpedfechasistema() %>
 <td>  <%= temp.getpedfecha() %>
 <td>  <%= gciud.getciudad( temp.getpedciudad()).getciunombre() %> / <%=gdep.getdepartamento(  temp.getpeddepartamento()).getdepnombre() %>

 <td> 
 <a href='pedidoAction.do?opcion=set&pedcodsx=<%= temp.getpedcodsx()%>'> <img src="./disenno/images/update.gif" border="0" ></a>| 
 <%if(gstpermiso.getEscritura(session, "pedido", "pedido.jsp") && temp.getpedestado().equals("TRAMITE")){ %> 
		<a href="javascript:validarDelete('pedidoAction.do?opcion=delete&codsx=<%= temp.getpedcodsx()  %>')"><img src="./disenno/images/substract.gif" border="0" ></a>   
 <% } %> 
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=pedido&modulo=pedido&param=" + (param==null?"":param); 
 int paginas = gpedido.getTotalPaginaslistapedido(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 <br>Los campos con (*) son de busqueda
 <br>Tambien puede buscar por los productos (Referencias y descripcion) asociados
