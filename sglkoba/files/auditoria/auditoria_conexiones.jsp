 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   auditoria.control.*,auditoria.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstauditoria_conexiones gauditoria_conexiones = new gstauditoria_conexiones(); 
  gauditoria_conexiones.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gauditoria_conexiones.getlistaauditoria_conexiones(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de auditoria_conexioness </div> 
 <br> 
 <table width='80%' align='center' border='0'> 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "auditoria", "auditoria_conexiones.jsp") ){ %> 
 <a href='main.jsp?app=auditoria&modulo=auditoria_conexiones_datos'> Nuevo auditoria_conexiones </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='main.jsp?app=auditoria&modulo=auditoria_conexiones'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
 <table align='center'  width='90%' border='0' class='tabla_listas' cellspacing='0' cellpading='0'> 
 	<tr>  <th> audicodsx
 <th> audilogin
 <th> audinombre
 <th> audifecha
 <th> audiapp
 <th> audimodulo
 <th> Opcion	<logic:iterate id="temp" name="lista" type="auditoria.entity.auditoria_conexiones"  >
 <tr align='center'>  <td>  <%= temp.getaudicodsx() %>
 <td>  <%= temp.getaudilogin() %>
 <td>  <%= temp.getaudinombre() %>
 <td>  <%= temp.getaudifecha() %>
 <td>  <%= temp.getaudiapp() %>
 <td>  <%= temp.getaudimodulo() %>

 <td> <a href='auditoria_conexionesAction.do?opcion=set&codsx=<%= temp.getaudicodsx()%>'> <img src="./disenno/images/update.gif" border="0" > </a> 			&nbsp;| &nbsp; 
 <%if(gstpermiso.getEscritura(session, "auditoria", "auditoria_conexiones.jsp") ){ %> 
		<a href="javascript:validarDelete('auditoria_conexionesAction.do?opcion=delete&codsx=<%= temp.getaudicodsx()  %>')"> <img src="./disenno/images/substract.gif" border="0" > </a>   
 <% } %> 
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=auditoria&modulo=auditoria_conexiones&param=" + (param==null?"":param); 
 int paginas = gauditoria_conexiones.getTotalPaginaslistaauditoria_conexiones(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 