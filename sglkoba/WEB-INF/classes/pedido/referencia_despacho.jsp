 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   pedido.control.*,pedido.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>
<%@ taglib  uri="/WEB-INF/hiddenpaneltag.tld" prefix="h" %>

 <%   
gstdespacho_pedido gdesp = new gstdespacho_pedido();
 gstpedido gped = new gstpedido();
 
String despedcodsx = request.getParameter("despedcodsx") ;
 
 despacho_pedido desp = gdesp.getdespacho_pedido(despedcodsx);
 pedido ped = gped.getpedido(desp.getdespedpedido());
 despacho despa = new gstdespacho().getdespacho(desp.getdespeddespacho());
 gstreferencia_despacho greferencia_despacho = new gstreferencia_despacho(); 
  greferencia_despacho.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   
  
 Collection lista = greferencia_despacho.getlistareferencia_despacho( despedcodsx,  pag, param); 
 request.setAttribute("lista", lista); 
   %> 
 <div class="titulo"> Gestion de Referencias del Despacho en el pedido </div> 
 <br> 
 
  <table width='80%' align='center' border='0'> 
 	<Tr> 
 	<td align='left'> <a href="despachoAction.do?opcion=set&codsx=<%=desp.getdespeddespacho()  %>"> Volver al Despacho </a>   
 </td>	
 	<br>
 
 <table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_datos"> 
 <tr>
 	<td>Despacho <td><%= desp.getdespeddespacho() %> <td> Consec. Pedido: <td><%= ped.getpedcodsx() %>
 <tr>
 	<td>Num Pedido: <td><%= ped.getpednumpedido() %><td>Guia <td><%= ped.getpednumpedido() %> 
 
 </table>
 
 
 <br>
 <br>
 <table width='80%' align='center' border='0'> 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "pedido", "referencia_despacho.jsp") && despa.getdespestado().equals("TRAMITE") ){ %> 
 

 
 <html:form action="referencia_despachoAction.do" method="post" > 
		<html:hidden property="opcion" value="crear"/> 
		<table align="left" border="0" > 
		<input type="hidden" name="despedcodsx" value="<%= despedcodsx %>" />
		<input type="hidden" name="despcodsx" value="<%= desp.getdespeddespacho() %>" />
		
		<html:hidden property="refddespacho_pedido" value="<%= desp.getdespedcodsx() %>"/>
			<tr> 
				<td>Producto
				<td ><html:hidden property="refdproducto"   /> 
				<html:text property="promodelo" readonly="true" styleClass="readonly" /> 
				<br>
				<html:text property="prodescripcion" readonly="true" styleClass="readonly" /> 
				*<html:errors property="refdproducto"  /> 
				
				 		<%
				String[] parametros = new String[] {   ped.getpedcodsx(), "0", ""};
				String[] parametros_total = new String[] {ped.getpedcodsx(), ""};
				String[] campos_form= new String[] {"refdproducto", "promodelo", "prodescripcion", "max"};
				String[] campos_pick = new String[] {"refpproducto", "Refpbodega", "refpposicion", "Refpsaldo"};
				String[] campos_entity= new String[] { "Refpbodega",  "refpposicion" , "Refpsaldo"};
				String[] nombres_campos_entity= new String[] { "Material",  "Descripcion", "Saldo por Despachar" };
				String formulario = "referencia_despachoForm";
				String metodo = "getlistareferencia_pedido_disponible_agregar";  
				String metodoTotal = "getTotalPaginaslistareferencia_pedido_disponible_agregar";
				%>
				
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="pedido.control.gstreferencia_pedido" entidad="pedido.entity.referencia_pedido" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
				
			 
				<td> Saldo <td> 
				<html:text property="max" size="7" readonly="true" styleClass="readonly" />
			
				<td>Cantidad 
				<td><html:text property="total" size="10"  /> 
			<td>
				<html:errors property="total"/>
		<html:submit  value="ok"/> 
 
</table> 
 </html:form> 

 <% } %> 
 	<td align='right'> 	&nbsp; </table> 
 
 <table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  
 <th> Material
 <th> Descripcion
 <th> Cantidad a Despachar

 
 <th> Opcion	<logic:iterate id="temp" name="lista" type="referencia_despacho"  >
 <tr align='center'> 
 <%
 maestro.control.gstproducto gprod = new maestro.control.gstproducto();
 maestro.entity.producto prod = gprod.getproducto(temp.getrefdproducto());
 %>
 <td>  <%= prod.getpromodelo() %>
 <td>  <%= prod.getprodescripcion() %>
 <td>  <%= temp.getRefdcant() %>

 <td nowrap="nowrap"><%if(gstpermiso.getEscritura(session, "pedido", "referencia_despacho.jsp") && despa.getdespestado().equals("TRAMITE") ){ %> 
		<a href="javascript:validarDelete('referencia_despachoAction.do?opcion=delete&codsx=<%= temp.getrefdcodsx()  %>&despedcodsx=<%= despedcodsx %>&despcodsx=<%= despa.getdespcodsx() %>')"><img src="./disenno/images/substract.gif" border="0" ></a>
	   |<a href="main.jsp?app=pedido&modulo=referencia_despacho_serial&refdcodsx=<%=temp.getrefdcodsx()%>&promodelo= <%= prod.getpromodelo() %>&cantidad=<%= temp.getRefdcant() %>">Seleccionar Seriales</a>   
<%}else{ %>
		<a href="main.jsp?app=pedido&modulo=referencia_despacho_serial&refdcodsx=<%=temp.getrefdcodsx()%>&promodelo= <%= prod.getpromodelo() %>&cantidad=<%= temp.getRefdcant() %>">Ver Seriales</a>
 <% } %> &nbsp;
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=pedido&modulo=referencia_despacho&param=" + (param==null?"":param)+"&despedcodsx=" + desp.getdespedcodsx() +"&despcodsx=" + desp.getdespeddespacho();
 int paginas = greferencia_despacho.getTotalPaginaslistareferencia_despacho(despedcodsx, param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 