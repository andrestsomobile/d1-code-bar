 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   maestro.control.*,maestro.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstcausal gcausal = new gstcausal(); 
  gcausal.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gcausal.getlistacausal(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de causales </div> 
 <div align="right" > <a href="main.jsp?app=maestro&modulo=print_<%= request.getParameter("modulo") %>"> Imprimir Listado Completo </a> </div>
 <br> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "maestro", "causal.jsp") ){ %> 
 <a href='main.jsp?app=maestro&modulo=causal_datos'> Nuevo causal </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='main.jsp?app=maestro&modulo=causal'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  <th> Consecutivo (*)
 <th> Descripcion (*)
 <th>Responsable (*)
 <th> Opcion	<logic:iterate id="temp" name="lista" type="maestro.entity.causal"  >
 <tr align='center'>  <td>  <%= temp.getcaucodsx() %>
 <td>  <%= temp.getcaudesc() %>
 <td><%= temp.getcauresponsable() %>

 <td> <a href='causalAction.do?opcion=set&codsx=<%= temp.getcaucodsx()%>'> <img src="./disenno/images/update.gif" border="0" > </a>|&nbsp; 
 <%if(gstpermiso.getEscritura(session, "maestro", "causal.jsp") ){ %> 
		<a href="javascript:validarDelete('causalAction.do?opcion=delete&codsx=<%= temp.getcaucodsx()  %>')"> <img src="./disenno/images/substract.gif" border="0" ></a>   
 <% } %> 
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=maestro&modulo=causal&param=" + (param==null?"":param); 
 int paginas = gcausal.getTotalPaginaslistacausal(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 <br>Los campos con (*) son de busqueda