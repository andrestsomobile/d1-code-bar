 
<%@page import="ingreso.entity.lote_trafico"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="maestro.control.*,maestro.entity.*,java.util.*, administracion.control.gstpermiso,ingreso.form.ingresoForm"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>


<%   
 
gstbodega gbod = new maestro.control.gstbodega();
String param = request.getParameter("param"); 
String pag = request.getParameter("pag");   
String start = "0";


Collection lista = gbod.getlistabodega(start, param); 
request.setAttribute("lista", lista); 
boolean tramite =  true ;
boolean escritura = gstpermiso.getEscritura(session, "movil", "inventario.jsp");

%> 
 <div class=""> Seleccionar Bodega </div> 
 <br> 
 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='center'>
 	

 	
 <input type='text' name='param' value='<%=param==null ? "" : param %>' style="background-color: white;color:black"> 
 <input type='submit' name='buscar' value='Buscar' style="background-color: white;color:black"> 
 </form> 
 </table> 
<table align='center'  width='99%' border='1' cellspacing='0' cellpading='0' class=""> 
 	<tr>  
 <th> Codigo
 <th> Descripcion
  <th> Opcion

 
 <logic:iterate id="temp" name="lista" type="bodega"  >
 <tr align='center'>
 
 <td>  <%= temp.getbodcodsx() %>
 <td>  <%= temp.getboddesc() %>
<td>  <input type='submit' name='buscar' value='Seleccionar' style="background-color: white;color:black"> 



 </logic:iterate>
  </table> 
