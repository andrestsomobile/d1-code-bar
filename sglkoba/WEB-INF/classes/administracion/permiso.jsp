 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="administracion.control.*,administracion.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstpermiso gpermiso = new gstpermiso(); 
  gpermiso.setMaxfilas(20);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gpermiso.getlistapermiso(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de Permisos </div> 
 <br> 
 <table width='90%' align='center' border='0' cellpadding="0" cellspacing="0"> 
  <tr>
 	<td colspan="2" class="fuente">
 	<br>
 	Defina los permisos de la aplicacion, puede realizar busquedas, crear, eliminar o actualizar permisos.
 
 	<br><br>
 
 	<Tr> 
 	<td align='left'>
 	<% if(gstpermiso.getEscritura(session, "administracion", "permiso.jsp")) {%>
 	<a href='main.jsp?app=administracion&modulo=permiso_datos'> Nuevo Permiso </a> 
 	<%} %>
 	<td align='right'> 	<form method='post' action='main.jsp?app=administracion&modulo=permiso'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
 <table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  <th> Codigo Sx (*)
 <th> Grupo (*)
 <th> Componente (*)
 <th> Modulo (*)
 <th> Acceso
 <th> Opcion	<logic:iterate id="temp" name="lista" type="administracion.entity.permiso"  >
 <tr align='center'>  <td>  <%= temp.getpercodsx() %>
 <td>  <%= new gstgrupo().getgrupo( temp.getpergrupo()).getgnombre() %>
 <td>  <%= temp.getperapp() %>
 <td>  <%= temp.getpermodulo() %>
 <td>  <%= temp.getperacceso_txt() %>

 <td> <a href='permisoAction.do?opcion=set&codsx=<%= temp.getpercodsx()%>'><img src="./disenno/images/update.gif"></a> 			&nbsp;| &nbsp;
<% if(gstpermiso.getEscritura(session, "administracion", "permiso.jsp")) {%>
<a href="javascript:validarDelete('permisoAction.do?opcion=delete&codsx=<%= temp.getpercodsx()  %>')"><img src="./disenno/images/substract.gif" ></a>
<%} %>
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=administracion&modulo=permiso&param=" + (param==null?"":param); 
 int paginas = gpermiso.getTotalPaginaslistapermiso(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 
   <br>
 Los Campos con * son los Campos de Busqueda