 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   maestro.control.*,maestro.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstcausal_hit gcausal_hit = new gstcausal_hit(); 
  gcausal_hit.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gcausal_hit.getlistacausal_hit(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de Causales de Pedido HIT</div> 
 <div align="right" > <a href="main.jsp?app=maestro&modulo=print_<%= request.getParameter("modulo") %>"> Imprimir Listado Completo </a> </div>
 <br> 
<table width='90%' align='center' border='0' cellpadding="0" cellspacing="0"> 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "maestro", "causal_hit.jsp") ){ %> 
 <a href='main.jsp?app=maestro&modulo=causal_hit_datos'> Nuevo causal_hit </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='main.jsp?app=maestro&modulo=causal_hit'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  <th> Codigo sistema (*)
 <th> Descripcion (*)
 <th> Responsable
 <th> Opcion	<logic:iterate id="temp" name="lista" type="maestro.entity.causal_hit"  >
 <tr align='center'>  <td>  <%= temp.getcauhcodsx() %>
 <td>  <%= temp.getcauhdesc() %>
<td> <%= temp.getcauresp() %>
 <td> <a href='causal_hitAction.do?opcion=set&codsx=<%= temp.getcauhcodsx()%>'> <img src="./disenno/images/update.gif" border="0" > </a> 			&nbsp;| &nbsp; 
 <%if(gstpermiso.getEscritura(session, "maestro", "causal_hit.jsp") ){ %> 
		<a href="javascript:validarDelete('causal_hitAction.do?opcion=delete&codsx=<%= temp.getcauhcodsx()  %>')"> <img src="./disenno/images/substract.gif" border="0" > </a>   
 <% } %> 
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=maestro&modulo=causal_hit&param=" + (param==null?"":param); 
 int paginas = gcausal_hit.getTotalPaginaslistacausal_hit(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 <br>Los campos con (*) son de busqueda