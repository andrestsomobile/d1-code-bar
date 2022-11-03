 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="ingreso.control.*,ingreso.entity.*,java.util.*, maestro.entity.*, maestro.control.*, administracion.control.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstreubicacion greubicacion = new gstreubicacion(); 
  greubicacion.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = greubicacion.getlistareubicacion(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de reubicaciones </div> 
 <br> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='left'>
 	<%if(gstpermiso.getEscritura(session, "ingreso", "reubicacion.jsp") ){ %>
 	<a href='main.jsp?app=ingreso&modulo=reubicacion_datos'> Nueva reubicacion </a> 
 	<% } %>
 	<td align='right'> 	<form method='post' action='main.jsp?app=ingreso&modulo=reubicacion'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  <th> Consec *
 <th> Ingreso *
 <th>Emb *
 <th>BL *
 <TH>Producto *
 <th> Origen *
 <th> Destino *
 <th> Cantidad
 <th> Fecha *

 <th> Opcion	<logic:iterate id="temp" name="lista" type="reubicacion"  >
 <tr align='center'>  <td>  <%= temp.getrecodsx() %>
 <%
 	gstingreso ging = new gstingreso();
	gsttrafico gtraf = new gsttrafico();
	gstentrada gent = new gstentrada();
	gstproducto gprod = new gstproducto();
	gstbodega gbod = new gstbodega();
	
 	ingreso ing = ging.getingreso(temp.getreingreso());
 	trafico traf = gtraf.gettrafico( ing.getingtrafico());
 %>
 <td>  <%= temp.getreingreso() %>
 <TD> <%= traf==null ? ("NO TIENE(" + ing.getingtipo() +")"): traf.gettrafembarque() %>
  <TD> <%= traf==null ? ("NO TIENE(" + ing.getingtipo()+")" ): traf.gettrafdocumento() %>
 <td>  
 	<%
 	entrada ent = gent.getentrada(temp.getreentradaor());
 	producto prod = gprod.getproducto( ent.getentcodproducto() );
 	%>
 	<%= prod.getpromodelo() %>
<td>
 	<table class="pequeno" border="1" cellpadding="0" cellspacing="0">
 		<tr><th>Bod <th>Pos
 		<tr>
 		<td> <%= gbod.getbodega( ent.getEntbodega() ).getbodnombre() %>  <td> <%= ent.getentposicion() %>
 	</table>
 	
 	
 
 <td>  
  	<%
 	ent = gent.getentrada(temp.getreentradafin());
 	prod = gprod.getproducto( ent.getentcodproducto() );
 	%>
 	<table class="pequeno" border="1" cellpadding="0" cellspacing="0">
 		<tr><th>Bod<th>Pos
 		<tr>
 		<td> <%= gbod.getbodega( ent.getEntbodega()).getbodnombre() %>  <td> <%= ent.getentposicion() %>
 	</table>
 <td>  <%= temp.getrecantidad() %>
 <td>  <%= temp.getrefecha() %>
 <td> 
 <a href='reubicacionAction.do?opcion=set&codsx=<%= temp.getrecodsx()%>'><img src="./disenno/images/update.gif" ></a> 	
 		| 
 		<%if(gstpermiso.getEscritura(session, "ingreso", "reubicacion.jsp") && temp.getreestado().equals("TRAMITE") ){ %>
 			<a href="javascript:validarDelete('reubicacionAction.do?opcion=delete&codsx=<%= temp.getrecodsx()  %>')"><img src="./disenno/images/substract.gif" ></a>   
 			<% } %>
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=ingreso&modulo=reubicacion&param=" + (param==null?"":param); 
 int paginas = greubicacion.getTotalPaginaslistareubicacion(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 <br>Los campos con (*) son campos de busqueda 