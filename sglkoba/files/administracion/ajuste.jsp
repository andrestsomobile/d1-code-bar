 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,  administracion.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   
 maestro.control.gstproducto gprod = new maestro.control.gstproducto();
 ingreso.control.gstentrada gent = new ingreso.control.gstentrada();
 gstajuste gajuste = new gstajuste(); 
  gajuste.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gajuste.getlistaajuste(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de ajustes </div> 
 <br> 
 <table width='90%' align='center' border='0' cellpadding="0" cellspacing="0"> 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "administracion", "ajuste.jsp") ){ %> 
 <a href='main.jsp?app=administracion&modulo=ajuste_datos'> Nuevo ajuste </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='main.jsp?app=administracion&modulo=ajuste'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
 <table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  <th> Consec
 <th> Compania
 <th> Ingreso
 <th> Producto
 <th> Fecha
 <th> Saldo Ant NAC
 <th> Nuevo Saldo NAC
 <th> Saldo Ant N-NAC
 <th> Nuevo Saldo N-NAC
 <th> Opcion	<logic:iterate id="temp" name="lista" type="ajuste"  >
 <tr align='center'>  <td>  <%= temp.getajcodsx() %>
 <td>  <%= new maestro.control.gstcompania().getcompania(temp.getajcodcia() ).getcomnombre()%>
 <td>  <%= temp.getajingreso() %>
 <td>  <%  
 ingreso.entity.entrada ent = gent.getentrada( temp.getajentrada());
 maestro.entity.producto prod =  gprod.getproducto(ent.getentcodproducto());
 out.println(prod.getpromodelo() + " - " + prod.getprodescripcion());
 %>
 <td>  <%= temp.getajfecha() %>
 <td>  <%= temp.getajsaldoant_nac() %>
 <td>  <%= temp.getajnuevosaldo_nac() %>
 <td>  <%= temp.getajsaldoant_nnac() %>
 <td>  <%= temp.getajnuevosaldo_nnac() %>

 <td> <a href='ajusteAction.do?opcion=set&codsx=<%= temp.getajcodsx()%>'> <img src="./disenno/images/update.gif" border="0" > </a> 			&nbsp;| &nbsp; 
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=administracion&modulo=ajuste&param=" + (param==null?"":param); 
 int paginas = gajuste.getTotalPaginaslistaajuste(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 