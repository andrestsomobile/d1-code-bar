 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso, ingreso.control.*,ingreso.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

gstcontenedor_trafico gcontenedor_trafico = new gstcontenedor_trafico(); 
gstlote_contenedor_trafico glct = new gstlote_contenedor_trafico();
String trafcodsx = request.getAttribute("trafcodsx")==null ? request.getParameter("trafcodsx") : (String)request.getAttribute("trafcodsx");
Collection listax = gcontenedor_trafico.getlistaVehiculosDescargando(); 
Collection lista = glct.getlistaVehiculosDescargando();
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Veh&iacute;culos Descargando</div> 
 <br> 
 

<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  
	 <th> Placa
	 <th> Conductor
	 <th> Cédula
	 <th> Contenedor
	 <th> Inicio Descargue
	 <th> Estado
	 <th> Opcion	<logic:iterate id="temp" name="lista" type="lote_contenedor_trafico"  >	
 <tr align='center'>  
 <% contenedor_trafico ct= gcontenedor_trafico.getcontenedor_trafico(temp.getlctrafcontenedor()); %>
	 <td>  <%=ct.getctrafplaca()%>
	 <td>  <%= ct.getCtrafconductor() %>
	 <td>  <%= ct.getCtrafcedula()%>
	 <td>  <%= ct.getctrafnumero() %>
	 <td>  <%= ct.getctrafiniciodescargue() %>
	 <td>  <%= ct.getCtrafestado() %>
	 <td> 
 <% if(gstpermiso.getEscritura(session, "ingreso", "contenedor_trafico.jsp")) { %>
 <a href='main_movil.jsp?app=movil&modulo=inspeccion_recibo_pdf&lctrafcodsx=<%= temp.getlctrafcodsx()%>&trafcodsx=<%=ct.getctrafnumtrafico()%>'><img src="./disenno/images/update.gif" title="Actualizar" ></a> 	
 <% } %>
 &nbsp;

 </logic:iterate>
  </table> 
