 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso, ingreso.control.*,ingreso.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

gstcontenedor_trafico gcontenedor_trafico = new gstcontenedor_trafico(); 
String trafcodsx = request.getAttribute("trafcodsx")==null ? request.getParameter("trafcodsx") : (String)request.getAttribute("trafcodsx");
Collection lista = gcontenedor_trafico.getlistacontenedor_trafico(trafcodsx); 
int num_veh = gcontenedor_trafico.get_num_vehiculos(trafcodsx);
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Veh&iacute;culos del Trafico </div> 
 <br> 
 <%@ include file="trafico_head.jsp" %>

<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='left'>
 	<% if(gstpermiso.getEscritura(session, "ingreso", "contenedor_trafico.jsp") && traf.getTrafestado().equals("TRAMITE") && num_veh > lista.size()) {%>
 	   <a href='main.jsp?app=ingreso&modulo=contenedor_trafico_datos&trafcodsx=<%=trafcodsx %>'> Nuevo Veh&iacute;culo </a>
 	<%} %>
 	<td align='right'> 	
 </table> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  
 <th> Placa
 <th> Conductor
 <th> Cédula
 <th> Contenedor
 <th> Estado
 <th> Opcion	<logic:iterate id="temp" name="lista" type="contenedor_trafico"  >
 <tr align='center'>  
 <td>  <%=temp.getctrafplaca()%>
 <td>  <%= temp.getCtrafconductor() %>
 <td>  <%= temp.getCtrafcedula()%>
 <td>  <%= temp.getctrafnumero() %>
 <td>  <%= temp.getCtrafestado() %>
 <td> 
 <% if(gstpermiso.getEscritura(session, "ingreso", "contenedor_trafico.jsp")) { %>
 <a href='contenedor_traficoAction.do?opcion=set&codsx=<%= temp.getctrafcodsx()%>'><img src="./disenno/images/update.gif" title="Actualizar" ></a> 	
 <% } %>
 &nbsp;
 <% if(gstpermiso.getEscritura(session, "ingreso", "contenedor_trafico.jsp") && traf.getTrafestado().equals("TRAMITE")) { %>
 	| &nbsp;
 	<a href="javascript:validarDelete('contenedor_traficoAction.do?opcion=delete&codsx=<%= temp.getctrafcodsx()  %>')"><img src="./disenno/images/substract.gif" title="Eliminar" ></a>
<% } %>	
&nbsp;
 </logic:iterate>
  </table> 
		<table align="center" width="80%"> 
			<tr>
				<td width="50%" align="left"> <a href="traficoAction.do?opcion=set&codsx=<%= trafcodsx %>" > Volver al Trafico </a> 
				<td width="50%" align="right"> <a href="main.jsp?app=ingreso&modulo=factura_trafico&trafcodsx=<%= trafcodsx %>" > Gestionar Facturas y Referencias </a> 
		</table>