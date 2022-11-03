 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="administracion.control.*,administracion.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstempresa gempresa = new gstempresa(); 
  gempresa.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gempresa.getlistaempresa(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de empresas </div> 
 <br> 
 <table width='80%' align='center' border='0'> 
 	<Tr> 
 	<td align='left'>
 	<% if(gstpermiso.getEscritura(session, "administracion", "empresa.jsp")) {%>
 	<a href='main.jsp?app=administracion&modulo=empresa_datos'> Nueva Empresa </a> 
 	<%} %>
 	<td align='right'> 	<form method='post' action='main.jsp?app=administracion&modulo=empresa'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
 <table align='center'  width='80%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  <th> Codigo
 <th> Nombre
 <th> Direccion
 <th> Telefono
 <th> Nit
 <th> Descripcion
 <th> Opcion	<logic:iterate id="temp" name="lista" type="administracion.entity.empresa"  >
 <tr align='center'>  <td>  <%= temp.getempcodsx() %>
 <td>  <%= temp.getempnombre() %>
 <td>  <%= temp.getempdireccion() %>
 <td>  <%= temp.getemptelefono() %>
 <td>  <%= temp.getempnit() %>
 <td>  <%= temp.getempdescripcion() %>

 <td> <a href='empresaAction.do?opcion=set&codsx=<%= temp.getempcodsx()%>'>Actualizar </a>&nbsp;| &nbsp;
 <% if(gstpermiso.getEscritura(session, "administracion", "empresa.jsp")) {%>
 <a href="javascript:validarDelete('empresaAction.do?opcion=delete&codsx=<%= temp.getempcodsx()  %>')">Eliminar </a>
 <%} %>
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=administracion&modulo=empresa&param=" + (param==null?"":param); 
 int paginas = gempresa.getTotalPaginaslistaempresa(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 