 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   maestro.control.*,maestro.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstaveria gaveria = new gstaveria(); 
  gaveria.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gaveria.getlistaaveria(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de averias </div> 
 <br> 
<table width='90%' align='center' border='0' cellpadding="0" cellspacing="0"> 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "maestro", "averia.jsp") ){ %> 
 <a href='main.jsp?app=maestro&modulo=averia_datos'> Nueva averia </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='main.jsp?app=maestro&modulo=averia'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  <th> Codigo Sistema
 <th> Descripcion
 <th> Opcion	<logic:iterate id="temp" name="lista" type="maestro.entity.averia"  >
 <tr align='center'>  <td>  <%= temp.getavecodsx() %>
 <td>  <%= temp.getavedescripcion() %>

 <td> <a href='averiaAction.do?opcion=set&codsx=<%= temp.getavecodsx()%>'> <img src="./disenno/images/update.gif" border="0" > </a> 			&nbsp;| &nbsp; 
 <%if(gstpermiso.getEscritura(session, "maestro", "averia.jsp") ){ %> 
		<a href="javascript:validarDelete('averiaAction.do?opcion=delete&codsx=<%= temp.getavecodsx()  %>')"> <img src="./disenno/images/substract.gif" border="0" > </a>   
 <% } %> 
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=maestro&modulo=averia&param=" + (param==null?"":param); 
 int paginas = gaveria.getTotalPaginaslistaaveria(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 