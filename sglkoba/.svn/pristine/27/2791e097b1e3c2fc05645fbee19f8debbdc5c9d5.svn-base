 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   pedido.control.*,pedido.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstreferencia_despacho_pedido greferencia_despacho_pedido = new gstreferencia_despacho_pedido(); 
  greferencia_despacho_pedido.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = greferencia_despacho_pedido.getlistareferencia_despacho_pedido(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de referencia_despacho_pedidos </div> 
 <br> 
 <table width='80%' align='center' border='0'> 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "pedido", "referencia_despacho_pedido.jsp") ){ %> 
 <a href='main.jsp?app=pedido&modulo=referencia_despacho_pedido_datos'> Nuevo referencia_despacho_pedido </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='main.jsp?app=pedido&modulo=referencia_despacho_pedido'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
 <table align='center'  width='80%' border='1' cellspacing='0' cellpading='0'> 
 	<tr>  <th> refdpcodsx
 <th> refdpcodrefd
 <th> refdcodrefp
 <th> refdcant
 <th> Opcion	<logic:iterate id="temp" name="lista" type="pedido.entity.referencia_despacho_pedido"  >
 <tr align='center'>  <td>  <%= temp.getrefdpcodsx() %>
 <td>  <%= temp.getrefdpcodrefd() %>
 <td>  <%= temp.getrefdcodrefp() %>
 <td>  <%= temp.getrefdcant() %>

 <td> <a href='referencia_despacho_pedidoAction.do?opcion=set&codsx=<%= temp.getrefdpcodsx()%>'> <img src="./disenno/images/update.gif" border="0" > </a> 			&nbsp;| &nbsp; 
 <%if(gstpermiso.getEscritura(session, "pedido", "referencia_despacho_pedido.jsp") ){ %> 
		<a href="javascript:validarDelete('referencia_despacho_pedidoAction.do?opcion=delete&codsx=<%= temp.getrefdpcodsx()  %>')"> <img src="./disenno/images/substract.gif" border="0" > </a>   
 <% } %> 
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=pedido&modulo=referencia_despacho_pedido&param=" + (param==null?"":param); 
 int paginas = greferencia_despacho_pedido.getTotalPaginaslistareferencia_despacho_pedido(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 