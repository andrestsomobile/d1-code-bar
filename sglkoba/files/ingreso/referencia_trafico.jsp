 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso, ingreso.control.*,ingreso.entity.*,java.util.*,maestro.control.*, maestro.entity.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstreferencia_trafico greferencia_trafico = new gstreferencia_trafico(); 
  greferencia_trafico.setMaxfilas(17);  
//numero del trafico:
  String trafcodsx = request.getAttribute("trafcodsx")==null ? request.getParameter("trafcodsx") : (String)request.getAttribute("trafcodsx");

//codsx de la factura, llega por ul o por request

	String ftrafcodsx = request.getAttribute("ftrafcodsx")==null ? request.getParameter("ftrafcodsx") 
						: (String)request.getAttribute("ftrafcodsx");

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = greferencia_trafico.getlistareferencia_trafico( ftrafcodsx , pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Referencias en la Factura </div> 
 <br> 
 <%@ include file="trafico_head.jsp" %>
 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='left'>
<% if(gstpermiso.getEscritura(session, "ingreso", "referencia_trafico.jsp") && traf.getTrafestado().equals("TRAMITE")) {%> 	
 	<a href='main.jsp?app=ingreso&modulo=referencia_trafico_datos&ftrafcodsx=<%= ftrafcodsx %>&trafcodsx=<%= trafcodsx %>'> Nueva Referencia en la Factura </a>
<%} %>
 	<td align='right'> Factura:
 <form method='post' action='main.jsp?app=ingreso&modulo=referencia_trafico&trafcodsx=<%=trafcodsx %>'> 
 <select name="ftrafcodsx" onchange="submit();"> 
 	<%
 	Collection facturas = new gstfactura_trafico().getlistafactura_trafico(trafcodsx);
 	request.setAttribute("facturas", facturas);
 	%>
 	<logic:iterate id="fac" type="factura_trafico" name="facturas">
 		<option value="<%= fac.getftrafcodsx() %>" <%= fac.getftrafcodsx().equals( ftrafcodsx) ? "selected" : ""  %>> <%= fac.getftrafnumfactura() %></option>
 	</logic:iterate>
 	
 </select>
 </form>
 
 </table> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  
 <th> Material 
 <th> Descripcion
 <th> UMP
 <th> Cantidad
 <th> Mpacks
 <th> Peso N (unit)
 <th> Peso N (Total)
 <th> Peso B (unit)
 <th> Peso B (Total)
 <th> FOB unit 
 <th> FOB tot
 <th> CIF unit
 <th> CIF tot
 <th> Opcion	
 <logic:iterate id="temp" name="lista" type="referencia_trafico"  >
 <tr align='center'>
 <%
 gstproducto gprod = new gstproducto();
 producto prod = gprod.getproducto(temp.getreftproducto());
 %>
 <td>  <%=  prod.getpromodelo()%> 
 <td> <%= prod.getprodescripcion() %>
 <td>  <%=prod.getProump()%> 
 <td>  <%= temp.getreftcantidad() %>
 <td>  <%= temp.getReftmpacks() %>
 <td>  <%= temp.getreftpesoneto() %>
 <td>  <%= temp.getReftpesonetototal() %>
 <td>  <%= temp.getreftpesobruto() %>
 <td>  <%= temp.getReftpesobrutototal() %>
 <td>  <%= temp.getreftfobunit() %>
 <td>  <%= temp.getreftfobtotal() %>
 <td>  <%= temp.getreftcifunit() %>
 <td>  <%= temp.getreftciftotal() %>

 <td> 
  <% if(gstpermiso.getEscritura(session, "ingreso", "referencia_trafico.jsp") && traf.getTrafestado().equals("TRAMITE")) {%>
 <a href='referencia_traficoAction.do?opcion=set&codsx=<%= temp.getreftcodsx()%>&trafcodsx=<%=trafcodsx %>&ftrafcodsx=<%= ftrafcodsx %>'><img src="./disenno/images/update.gif" border="0"></a>&nbsp;|&nbsp;
 <a href="javascript:validarDelete('referencia_traficoAction.do?opcion=delete&codsx=<%= temp.getreftcodsx()  %>&trafcodsx=<%=trafcodsx %>&ftrafcodsx=<%= ftrafcodsx %>')"> <img src="./disenno/images/substract.gif" border="0"> </a>
 <%} %>
&nbsp; </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=ingreso&modulo=referencia_trafico&ftrafcodsx=" + ftrafcodsx+ "&param=" + (param==null?"":param)+"&trafcodsx=" + trafcodsx; 
 int paginas = greferencia_trafico.getTotalPaginaslistareferencia_trafico( ftrafcodsx, param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 

   
 	