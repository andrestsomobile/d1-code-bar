 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="administracion.control.*,administracion.entity.*,java.util.*,maestro.control.*, maestro.entity.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstusuario gusuario = new gstusuario(); 
  gusuario.setMaxfilas(10);  
gstcompania gcomp = new gstcompania();
gstcliente gcli = new gstcliente();

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gusuario.getlistausuario(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de Usuarios </div> 
 <br> 
 <table width='90%' align='center' border='0' cellpadding="0" cellspacing="0"> 
 <tr>
 	<td colspan="2" class="fuente">
 	<br>
 	Realice operaciones de Busqueda, Crear, Actualizar o Eliminar usuarios de la aplicacion existentes.
 	<br><br>
 	<Tr> 
 	<td align='left'>
 	<% if(gstpermiso.getEscritura(session, "administracion", "usuario.jsp")) {%>
 	<a href='main.jsp?app=administracion&modulo=usuario_datos'> Nuevo Usuario </a> 
 	<%} %>
 	<td align='right'> 	<form method='post' action='main.jsp?app=administracion&modulo=usuario'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
 <table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  <th> Codigo Sx (*)
 <th> Nombre (*)
 <th> Login (*)
 <th> Grupo
 <th> Compania
 <th> Cliente
 <th> Opcion	
 <logic:iterate id="temp" name="lista" type="administracion.entity.usuario"  >
 <tr align='center'>  
 <td>  <%= temp.getusucodsx() %>
 <td>  <%= temp.getusunombre() %>
 <td>  <%= temp.getusulogin() %>
 <td>  <%= new gstgrupo().getgrupo(temp.getusugrupo()).getgnombre() %>
 <td>  <%
 	compania c= gcomp.getcompania(temp.getusucompania());
  out.print(	c ==null ? "SLI" : c.getcomnombre() );
  %>
<td>   <%
	cliente cli = gcli.getcliente( temp.getusucodcliente()); 	
  out.print(	cli ==null ? "-" : cli.getclinombre() );
  %>
 <td> <a href="usuarioAction.do?opcion=set&codsx=<%= temp.getusucodsx()%>"><img src="./disenno/images/update.gif"></a>&nbsp;| &nbsp;
<% if(gstpermiso.getEscritura(session, "administracion", "usuario.jsp")) {%>
<a href="javascript:validarDelete('usuarioAction.do?opcion=delete&codsx=<%= temp.getusucodsx()  %>')">
<img src="./disenno/images/substract.gif"></a>
<%} %>
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=administracion&modulo=usuario&param=" + (param==null?"":param); 
 int paginas = gusuario.getTotalPaginaslistausuario(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 <br>
 Los Campos con * son los Campos de Busqueda