 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   maestro.control.*,maestro.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstcausal_hit gcausal_hit = new gstcausal_hit(); 

 Collection lista = gcausal_hit.getlistacausal_hit(); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Lista de Causales de Pedido HIT</div> 
 <br> 

<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  <th> Codigo sistema (*)
 <th> Descripcion (*)
 <th> Responsable
	<logic:iterate id="temp" name="lista" type="maestro.entity.causal_hit"  >
 <tr align='center'>  <td>  <%= temp.getcauhcodsx() %>
 <td>  <%= temp.getcauhdesc() %>
<td> <%= temp.getcauresp() %>

 </logic:iterate>
  </table> 
