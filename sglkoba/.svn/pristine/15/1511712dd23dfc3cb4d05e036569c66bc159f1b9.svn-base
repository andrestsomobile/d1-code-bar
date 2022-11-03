 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="nacionalizacion.control.*,java.util.*, nacionalizacion.entity.*, ingreso.control.*, ingreso.entity.*, maestro.control.*, maestro.entity.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstnacionalizacion gnacionalizacion = new gstnacionalizacion(); 
 gstnacionalizacion_detalle gnacdet = new gstnacionalizacion_detalle();
 gstentrada gent = new gstentrada();
 gstproducto gprod = new gstproducto();
 
  gnacionalizacion.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gnacionalizacion.getlistanacionalizacion(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de nacionalizaciones </div> 
 <br> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='left'>
 	<%if(administracion.control.gstpermiso.getEscritura(session, "nacionalizacion", "nacionalizacion.jsp")) { %>
 	<a href='main.jsp?app=nacionalizacion&modulo=nacionalizacion_datos'> Nueva Nacionalizacion </a> 
 	<% } %>
 	&nbsp;
 	<td align='right'> 	<form method='post' action='main.jsp?app=nacionalizacion&modulo=nacionalizacion'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
<tr>  
 <th> Consecutivo (*)
 <th> Empresa (*)
 <th> Fecha (*)
 <th> Ingreso (*)
 <th> # Importacion (*)
 <th> Documento Transporte (*)
 <th> Referencia(s) (*)
 <th> Opcion	<logic:iterate id="temp" name="lista" type="nacionalizacion"  >
 <tr align='center'>  <td>  <%= temp.getnaccodsx() %>
 <td>  <%= new maestro.control.gstcompania().getcompania( temp.getnacempresa()).getcomnombre() %>
 <td>  <%= temp.getnacfecha() %>
 <%
 ingreso ing = new gstingreso().getingreso(temp.getnacingreso()); 
 trafico traf = new gsttrafico().gettrafico(ing.getingtrafico());
 Collection detalles = gnacdet.getlistanacionalizacion_detalle(temp.getnaccodsx());
 String refs = "";
 Iterator  ite = detalles.iterator();
 ArrayList productos = new ArrayList();
 while(ite.hasNext()) {
	 nacionalizacion_detalle nacd = (nacionalizacion_detalle)ite.next();
	 entrada ent = gent.getentrada( nacd.getnadentrada());
	 producto prod = gprod.getproducto( ent.getentcodproducto());
	 
	 if(!productos.contains(prod.getprocodsx())) refs += prod.getpromodelo() +  " , ";
	 
	 productos.add(prod.getprocodsx());
	 
	 
 }
	 
 %>
 <td><%= ing.getingcodsx() %>
 <td> <%= traf.gettrafnumdta()%>
 <td><%= traf.gettrafdocumento() %>
 <td> <%= refs %>
 <td>
 <%if(administracion.control.gstpermiso.getEscritura(session, "nacionalizacion", "nacionalizacion.jsp")) { %>
 <a href='nacionalizacionAction.do?opcion=set&codsx=<%= temp.getnaccodsx()%>'> <img src="./disenno/images/update.gif" ></a> 			
<% } %>
 &nbsp;| &nbsp; 		
 <%if(administracion.control.gstpermiso.getEscritura(session, "nacionalizacion", "nacionalizacion.jsp") && temp.getnacestado().equals("TRAMITE")) { %>
 <a href="javascript:validarDelete('nacionalizacionAction.do?opcion=delete&codsx=<%= temp.getnaccodsx()  %>')">
 <img src="./disenno/images/substract.gif" border="0" ></a>   
 <% } %>
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=nacionalizacion&modulo=nacionalizacion&param=" + (param==null?"":param); 
 int paginas = gnacionalizacion.getTotalPaginaslistanacionalizacion(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 <br>Los campos con (*) son de busqueda
 <br>Puede buscar ademas por los productos (Referencias y descripciones) Asociados