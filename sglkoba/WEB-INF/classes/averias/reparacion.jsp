 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   averias.control.*,averias.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstreparacion greparacion = new gstreparacion(); 
  greparacion.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = greparacion.getlistareparacion(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de Recuperaci&oacute;n </div> 
 <br> 
 <table width='80%' align='center' border='0'> 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "averias", "reparacion.jsp") ){ %> 
 <a href='main.jsp?app=averias&modulo=reparacion_datos'> Nuevo Recuperaci&oacute;n </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='main.jsp?app=averias&modulo=reparacion'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
 <table align='center'  width='90%' border='0' class='tabla_listas' cellspacing='0' cellpading='0'> 
 	<tr>  <th> Consecutivo
 <th> Empresa
 <th> Fecha
 <th> Tipo Saldo
 <th> Destino
 <th> Estado
 <th> Opcion	<logic:iterate id="temp" name="lista" type="averias.entity.reparacion"  >
 <tr align='center'>  <td>  <%= temp.getrepcodsx() %>
 <td>  <%= temp.getrepcodcia() %>
 <td>  <%= temp.getrepfecha() %>
 <td>  <%= temp.getrepsaldo() %>
 <td>  <%= temp.getrepdestino() %>
 <td>  <%= temp.getrepestado() %>


 <td> <a href='reparacionAction.do?opcion=set&repcodsx=<%= temp.getrepcodsx()%>'> <img src="./disenno/images/update.gif" border="0" > </a> 			&nbsp;| &nbsp; 
 <%if(gstpermiso.getEscritura(session, "averias", "reparacion.jsp") && temp.getrepestado().equals("TRAMITE")){ %> 
		<a href="javascript:validarDelete('reparacionAction.do?opcion=delete&codsx=<%= temp.getrepcodsx()  %>')"> <img src="./disenno/images/substract.gif" border="0" > </a>   
 <% } %> 
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=averias&modulo=reparacion&param=" + (param==null?"":param); 
 int paginas = greparacion.getTotalPaginaslistareparacion(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 