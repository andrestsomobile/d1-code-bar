 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="ingreso.control.*,ingreso.entity.*,java.util.*,administracion.entity.*, administracion.control.*, maestro.control.*, maestro.entity.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>
 <%   

 gsttrafico gtrafico = new gsttrafico();  
  gtrafico.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gtrafico.getlistatrafico(pag, param); 
 request.setAttribute("lista", lista); 
 gstcompania gcomp = new gstcompania();
 	  
  %> 
 <div class="titulo"> Gestion de Traficos </div> 
 <br> 
 <table width='90%' align='center' border='0' cellpadding="0" cellspacing="0"> 
 	<Tr> 
 	<td align='left'>   
 	<% if(gstpermiso.getEscritura(session, "ingreso", "trafico.jsp")) {%>
 		<a  href='main.jsp?app=ingreso&modulo=trafico_datos'> Nuevo trafico </a> 
 		<% } %> &nbsp;
 	<td align='right'> 	<form method='post' action='main.jsp?app=ingreso&modulo=trafico'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
<tr>  
 <th> Consecutivo (*)
 <th> Compania (*)
 <th> Fecha Creacion (*)
 <th> # BL(*)
 <th> Recibo de Mercancía (*)
 <th> # Importacion (*)
 <th> Sobordo (*)
 <th> Opcion	
 
 <logic:iterate id="temp" name="lista" type="trafico"  >
 <tr align='center'>  <td>  <%= temp.gettrafcodsx() %>
 <td>  <%= gcomp.getcompania( temp.gettrafcompania()).getcomnombre() %>&nbsp;
 <td>  <%= temp.gettraffechacreacion() %>&nbsp;
 <td>  <%= temp.gettrafdocumento() %>&nbsp;
 <td>  <%= temp.getTrafpedido() %>&nbsp;
 <td>  <%= temp.gettrafnumdta() ==null ?"" : temp.gettrafnumdta() %>&nbsp;
 <td>  <%= temp.gettrafnumsobordo() ==null ?"" : temp.gettrafnumsobordo()  %>&nbsp;

 <td> <a title="Actualizar" href='traficoAction.do?opcion=set&codsx=<%= temp.gettrafcodsx()%>'>
	<html:img src="./disenno/images/update.gif" border="0"/></a> 			
 <% if(gstpermiso.getEscritura(session, "ingreso", "trafico.jsp") && temp.getTrafestado().equals("TRAMITE")) {%>
 |
 <a  title="Eliminar" href="javascript:validarDelete('traficoAction.do?opcion=delete&codsx=<%= temp.gettrafcodsx()  %>')">
	<html:img src="./disenno/images/substract.gif" border="0"/></a>   
 <% } %>
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=ingreso&modulo=trafico&param=" + (param==null?"":param); 
 int paginas = gtrafico.getTotalPaginaslistatrafico(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   />
 <br>Los campos con (*) son campos de busqueda 
 <br>Tambien puede Buscar por: Numero de Contenedores, Numero de Facturas , Productos (Referencias y Descripciones)