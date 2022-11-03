 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="administracion.control.*,administracion.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstgrupo ggrupo = new gstgrupo(); 
  ggrupo.setMaxfilas(15);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = ggrupo.getlistagrupo(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de Grupos </div> 
 <br> 
 
 <table width='90%' align='center' border='0' cellpadding="0" cellspacing="0"> 
 <tr>
 	<td colspan="2" class="fuente">
 	<br>
 	Realice operaciones de Busqueda, Crear, Actualizar o Eliminar Grupos de usuarios para acceso a la aplicacion
 	<br><br>
 	<Tr> 
 	<td align='left'>
 	<% if(gstpermiso.getEscritura(session, "administracion", "grupo.jsp")) {%>
 	<a href='main.jsp?app=administracion&modulo=grupo_datos'> Nuevo Grupo </a> 
 	<%} %>
 	<td align='right'> 	<form method='post' action='main.jsp?app=administracion&modulo=grupo'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
 <table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  <th> Codigo Sx (*)
 <th> Nombre (*)
 <th> Opcion	<logic:iterate id="temp" name="lista" type="administracion.entity.grupo"  >
 <tr align='center'>  <td>  <%= temp.getgcodsx() %>
 <td>  <%= temp.getgnombre() %>

 <td> <a href='grupoAction.do?opcion=set&codsx=<%= temp.getgcodsx()%>'><img src="./disenno/images/update.gif"></a> &nbsp;| &nbsp;
 <% if(gstpermiso.getEscritura(session, "administracion", "grupo.jsp")) {%>
 <% if(!temp.getgcodsx().equals("1") && !temp.getgcodsx().equals("3")  && !temp.getgcodsx().equals("4")) {%>
 <a href="javascript:validarDelete('grupoAction.do?opcion=delete&codsx=<%= temp.getgcodsx()  %>')"><img src="./disenno/images/substract.gif"></a>
 <%} %>
 <%}  %>
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=administracion&modulo=grupo&param=" + (param==null?"":param); 
 int paginas = ggrupo.getTotalPaginaslistagrupo(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
  <br>
 Los Campos con * son los Campos de Busqueda