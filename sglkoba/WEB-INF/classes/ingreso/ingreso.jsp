 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso, ingreso.control.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   
  
 gstingreso gingreso = new gstingreso(); 
  gingreso.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   
String tipo = request.getParameter("tipo");   
 Collection lista = gingreso.getlistaingreso(tipo, pag, param);  
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de ingresos </div> 
 <br> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='left'>
 	<% if(gstpermiso.getEscritura(session, "ingreso", "ingreso.jsp")) {%>
 	<a href='main.jsp?app=ingreso&modulo=ingreso_datos'> Nuevo ingreso </a>
 	<%} %>
 	<td align='right'> 	<form method='post' action='main.jsp?app=ingreso&modulo=ingreso'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <%if(tipo!=null){ %> 
 <input type='hidden' name='tipo' value='<%=tipo%>'> 
 <%} %>
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  <th> Consecutivo (*)
 <th> Empresa (*)
 <th> Fecha (*)
 <th> Tipo Ingreso (*)
 <th> Trafico (*)

 <th> Opcion	
 <logic:iterate id="temp" name="lista" type="ingreso.entity.ingreso"  >
 <tr align='center'>  <td>  <%= temp.getingcodsx() %>
 <td>  <%= new maestro.control.gstcompania().getcompania( temp.getingcodcia()).getcomnombre() %>
 <td>  <%= temp.getingfecha() %>
 <td>  <%= temp.getingtipo() %>
 <td>  <%= temp.getingtrafico()== null ?"&nbsp;" : temp.getingtrafico() %>

 <td> <a href='ingresoAction.do?opcion=set&codsx=<%= temp.getingcodsx()%>'><html:img src="./disenno/images/update.gif" /></a> 			
 &nbsp;| &nbsp;
<% if(gstpermiso.getEscritura(session, "ingreso", "ingreso.jsp") && temp.getIngestado().equals("TRAMITE")) {%>
 <a href="javascript:validarDelete('ingresoAction.do?opcion=delete&codsx=<%= temp.getingcodsx()  %>')"><html:img src="./disenno/images/substract.gif" /></a>
<%} %>
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=ingreso&modulo=ingreso&param=" + (param==null?"":param) + "&tipo=" + (tipo==null ?"": tipo ); 
 int paginas = gingreso.getTotalPaginaslistaingreso(tipo, param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 <br>Los campos con (*) son de busqueda
 <br>Tambien puede buscar por los PRODUCTOS (Referencia y Descripcion) asociados