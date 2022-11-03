 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   maestro.control.*,maestro.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstcausal gcausal = new gstcausal(); 
 Collection lista = gcausal.getlistacausal(); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Lista de causales de averia</div> 
 <br> 

<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  <th> Consecutivo (*)
 <th> Descripcion (*)
 <th>Responsable (*)
<logic:iterate id="temp" name="lista" type="maestro.entity.causal"  >
 <tr align='center'>  <td>  <%= temp.getcaucodsx() %>
 <td>  <%= temp.getcaudesc() %>
 <td><%= temp.getcauresponsable() %>


 </logic:iterate>
  </table> 
