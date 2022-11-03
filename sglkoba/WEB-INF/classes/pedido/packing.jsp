 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   pedido.control.*,pedido.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   
 maestro.control.gstcompania gcomp = new maestro.control.gstcompania();
 maestro.control.gstproducto gprod = new maestro.control.gstproducto();
 gstpacking_detalle gpackd = new gstpacking_detalle();
 
 gstpacking gpacking = new gstpacking(); 
  gpacking.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gpacking.getlistapacking(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de packings </div> 
 <br> 
 <table width='90%' align='center' border='0' class=""> 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "pedido", "packing.jsp") ){ %> 
 <a href='main.jsp?app=pedido&modulo=packing_datos'> Nuevo packing </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='main.jsp?app=pedido&modulo=packing'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
 <table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  <th> Consecutivo (*) 
 <th> Empresa (*)
 <th> Fecha (*)
 <th> Referencias (*)
 <th> Peso N KGM<th> Peso B KGM
 <th> Opcion	<logic:iterate id="temp" name="lista" type="packing"  >
 <tr align='center'>  <td>  <%= temp.getpackcodsx() %>
 <td>  <%= gcomp.getcompania( temp.getpackempresa()) .getcomnombre() %>
 <td>  <%= temp.getpackfecha() %>
<td>
	<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' class="pequeno"> 
		<tr><th>Material <th>Descripcion <th>Total <th>Disponible <th>Peso N <th>Peso B
		<%
		
		Collection refs = gpackd.getlistapacking_detalle(temp.getpackcodsx()); 
		Iterator ite = refs.iterator();
		while(ite.hasNext()) {
			packing_detalle pd = (packing_detalle)ite.next();
	maestro.entity.producto prod = gprod.getproducto( pd.getpackdproducto());			
		%>	
		<tr> 
		<td> <%= prod.getpromodelo() %> <td> <%= prod.getprodescripcion() %> 
		<td> <%= gpackd.getTotalPacking_detalle( pd.getpackdcodsx()) %>
		<td> <%= gpackd.getSaldoPacking_detalle( pd.getpackdcodsx()) %>
		<td> <%= pd.getPackdpesoneto() %>
		<td> <%= pd.getPackdpesobruto() %>
		<% } %>
	</table>
		<td> <%= temp.getPackpesoneto() %>
		<td> <%= temp.getPackpesobruto() %>
 <td> <a href='packingAction.do?opcion=set&codsx=<%= temp.getpackcodsx()%>'><img src="./disenno/images/update.gif" border="0" ></a>&nbsp;| &nbsp; 
 <%if(gstpermiso.getEscritura(session, "pedido", "packing.jsp") && temp.getpackestado().equals("TRAMITE") ){ %> 
		<a href="javascript:validarDelete('packingAction.do?opcion=delete&codsx=<%= temp.getpackcodsx()  %>')"><img src="./disenno/images/substract.gif" border="0" ></a>   
 <% } %> 
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=pedido&modulo=packing&param=" + (param==null?"":param); 
 int paginas = gpacking.getTotalPaginaslistapacking(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 
 
 <br>Los campos con (*) son de busqueda
 <br>Tambien puede buscar por los productos (Referencias y descripciones) asociados