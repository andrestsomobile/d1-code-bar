 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   maestro.control.*,maestro.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstproducto_cliente gproducto_cliente = new gstproducto_cliente(); 
  gproducto_cliente.setMaxfilas(10);  

  String clicodsx = request.getParameter("clicodsx");
  gstcliente gcli = new gstcliente();
  cliente cli = gcli.getcliente(clicodsx);

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gproducto_cliente.getlistaproducto_cliente(clicodsx, pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de productos para el cliente <%= cli.getclinombre() %> </div> 
 <br> 
 <table width='80%' align='center' border='0'> 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "maestro", "producto_cliente.jsp") ){ %> 
 <a href='main.jsp?app=maestro&modulo=producto_cliente_datos&clicodsx=<%= clicodsx %>'> Nuevo producto_cliente </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='main.jsp?app=maestro&modulo=producto_cliente&clicodsx=<%= clicodsx %>'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
 <table align='center'  width='90%' border='0' class='tabla_listas' cellspacing='0' cellpading='0'> 
 	<tr>  
 	<th> Material

 <th> Descripcion
 <th> Maneja EAN
 <th> Maneja TAG
 <th> Maneja Codigo barra
 <th> Codigo de Barras
 <th> Maneja Garantia
 <th> Opcion	<logic:iterate id="temp" name="lista" type="maestro.entity.producto_cliente"  >
 <tr align='center'>  
 <%
 gstproducto gprod = new gstproducto();
 producto prod = gprod.getproducto( temp.getprocproducto());
 
 %>
 <td>  <%= prod.getpromodelo() %>
 <td>  <%= prod.getprodescripcion() %>
 <td>  <%= temp.getprocean() %>
 <td>  <%= temp.getproctag() %>
 <td>  <%= temp.getprocodbarra() %>
 <td>  <%= temp.getprocnumcodigobarra() %>&nbsp;
 <td>  <%= temp.getprocgarantia() %>

 <td> <a href='producto_clienteAction.do?opcion=set&codsx=<%= temp.getproccodsx()%>&clicodsx=<%= temp.getproccliente() %>&clicodsx=<%= clicodsx  %>'> <img src="./disenno/images/update.gif" border="0" > </a> 			&nbsp;| &nbsp; 
 <%if(gstpermiso.getEscritura(session, "maestro", "producto_cliente.jsp") ){ %> 
		<a href="javascript:validarDelete('producto_clienteAction.do?clicodsx=<%= clicodsx %>&opcion=delete&codsx=<%= temp.getproccodsx()  %>')"> <img src="./disenno/images/substract.gif" border="0" > </a>   
 <% } %> 
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=maestro&modulo=producto_cliente&param=" + (param==null?"":param) + "&clicodsx="+ clicodsx; 
 int paginas = gproducto_cliente.getTotalPaginaslistaproducto_cliente(clicodsx, param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 