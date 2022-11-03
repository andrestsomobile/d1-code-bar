 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   pedido.control.*,pedido.entity.*,java.util.*"%> 
 <%@page import="maestro.control.gstcompania"%>
<%@page import="maestro.entity.compania"%>
<html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   
maestro.control.gsttransportadora gtransp = new maestro.control.gsttransportadora();
 gstcompania gcomp = new gstcompania();
 
 gstdespacho gdespacho = new gstdespacho(); 
  gdespacho.setMaxfilas(20);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gdespacho.getlistadespacho(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de Despacho </div> 
 <br> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 

 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "pedido", "despacho.jsp") ){ %> 
 <a href='main.jsp?app=pedido&modulo=despacho_datos'> Nuevo Despacho </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='main.jsp?app=pedido&modulo=despacho'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  <th> Consecutivo (*)
 <th> Empresa (*)
 <th> Fecha (*)
 <th> Placa (*)
 <th> Transportadora (*)

 <th> Opcion	<logic:iterate id="temp" name="lista" type="despacho"  >
 <tr align='center'>  <td>  <%= temp.getdespcodsx() %>
 <%
 compania comp = gcomp.getcompania(temp.getdespempresa());
 %>
 <td>  <%= comp.getcomnombre() %>
 <td>  <%= temp.getdespfecha() %>
 <td>  <%= temp.getdespplaca() %>
 
 <td>  <%= new maestro.control.gsttransportadora().gettransportadora( temp.getdesptransportadora()).gettranspnombre() %>

 <td> <a href='despachoAction.do?opcion=set&codsx=<%= temp.getdespcodsx()%>'> <img src="./disenno/images/update.gif" border="0" ></a>|
 <%if(gstpermiso.getEscritura(session, "pedido", "despacho.jsp")&& temp.getdespestado().equals("TRAMITE")  ){ %> 
		<a href="javascript:validarDelete('despachoAction.do?opcion=delete&codsx=<%= temp.getdespcodsx()  %>')"> <img src="./disenno/images/substract.gif" border="0" > </a>   
 <% } %> 
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=pedido&modulo=despacho&param=" + (param==null?"":param); 
 int paginas = gdespacho.getTotalPaginaslistadespacho(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 <br> Los campos con (*) son de busqueda
 <br>Tambien puede buscar por No SOLICITUD, GUIA, FACTURA, No PETRA, CIUDAD, DEPARTAMENTO, NOMBRE DEL CLIENTE
 de los pedidos asociados al despacho