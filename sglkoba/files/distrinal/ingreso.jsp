<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso, distrinal.control.*,distrinal.entity.*, java.util.*, maestro.entity.*, maestro.control.*"%> 
<html> 

<%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 
<%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

<%   
  
gstdistnal_ingreso control = new gstdistnal_ingreso(); 
gstcompania gcom = new gstcompania();
gstproducto gpro = new gstproducto();
gsttransportadora gtra = new gsttransportadora();
control.setMaxfilas(10);  

String param = request.getParameter("param"); 
String pag = request.getParameter("pag");   
String tipo = request.getParameter("tipo");   
Collection lista = control.getlistadistnal_ingreso("0", param);
request.setAttribute("lista", lista); 
%> 
 <div class="titulo">Ingreso Consolidado </div> 
 <br> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='left'>

 	<td align='right'> 	<form method='post' action='main.jsp?app=ingreso&modulo=ingreso'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <%if(tipo!=null){ %> 
 <input type='hidden' name='tipo' value='<%=tipo%>'> 
 <%} %>
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 <tr>  
	<th> Consecutivo 
	<th> Empresa 
	<th> Fecha
	<th> Importacion 
	<th>Proveedor	
	<th>Material	
	<th>Ump X Estiba	
	<th>Cantidad Ingreso	
	<th>Lote	
	<th>Vencimiento Lote
	<th>Transportador	
	<th>Placa	
	<th>Eta Real Cedi	
	<th>Recibe Logistica	
	</tr>
 
	<logic:iterate id="temp" name="lista" type="distnal_ingreso">
	    <% 
	       
	       compania comp = gcom.getcompania(temp.getDnicompania());
	       producto pro = gpro.getproducto(temp.getDniproducto());
	       transportadora tra = gtra.gettransportadora(temp.getDnitransportadora());
	    %>
		<tr>
			<td>  <%= temp.getDnicodigocargue() %>
			<td>  <%= comp.getcomnombre() %>
			<td>  <%= temp.getDnifecha() %> 		 
			<td>  <%= temp.getDniimportacion() %> 		 
			<td>  <%= temp.getDniproveedor()%> 
			<td>  <%= pro.getpromodelo() %> 		 
			<td>  <%= temp.getDniumpestiba() %> 
			<td>  <%= temp.getDnicantidad()%> 		 
			<td>  <%= temp.getDnilote() %> 
			<td>  <%= temp.getDnifechavencimiento() %> 
			<td>  <%= tra.gettranspnombre() %> 
			<td>  <%= temp.getDniplaca() %> 
			<td>  <%= temp.getDnietarealcedi() %> 
			<td>  <%= temp.getDnirecibelogistica() %> 
		 
		</tr>
	</logic:iterate>
 
 <%
 String url = "main.jsp?app=distrinal&modulo=ingreso&param=" + (param==null?"":param); 
 int paginas = control.getTotalPaginasdistnal_ingreso(param);
 %> 
 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 <br>Los campos con (*) son de busqueda
 <br>Tambien puede buscar por los PRODUCTOS (Referencia y Descripcion) asociados