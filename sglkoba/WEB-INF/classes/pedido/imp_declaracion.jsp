<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso, pedido.form.pedidoForm,pedido.control.*, maestro.control.*, maestro.entity.*" %>  
<%@page import="util.JhFormat, java.io.*,util.*, util.file.*, java.util.*"%>

<html> 

<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 

<%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 


<div class="titulo"> Impresión Declaraciones de Pedido </div> 
<br><br>

<% 
gstreferencia_pedido greferencia_pedido = new gstreferencia_pedido(); 
gstpedido gped = new gstpedido();

gstcompania gcia = new gstcompania();
String pedcodsx = request.getParameter("pedcodsx");

pedido.entity.pedido ped = gped.getpedido(pedcodsx);
pedidoForm ped_form = new pedidoForm();
ped_form.llenar(ped);
%>		

<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
  <tr> 
    <tH >Consecutivo 
    <td ><%= ped_form.getpedcodsx() %>
    <tH >Compania 
    <td > <%= gcia.getcompania(ped_form.getpedcompania()).getcomnombre()  %>
  <tr> 
    <th>No. Solicitud 
    <td><%= ped_form.getpednumpedido() %>
    <th>No. PETRA 
    <td><%= ped_form.getpedordencompra() %>
  <tr> 
    <th>No. Guia 
    <td><%= ped_form.getpedguia() %>
    <th>Fecha Sistema 
    <td><%=  ped_form.getpedfechasistema() %>
  <tr> 
    <th>Fecha Pedido
    <td><%= ped_form.getpedfecha() %>
    
    <th>Fecha Venc
    <td><%= ped_form.getpedfechavenc() %>
  <tr> 
    <th>Fecha Cita
    <td><%= ped_form.getpedfechacita() %>
    <th>Hora Cita
    <td><%=ped_form.getpedhoracita() %>
  <tr> 
    <th>Cliente
    <td> <%= ped_form.getClidesc() %>
    <th>Sucursal 
    <td><%= ped_form.getSucdesc() %>
</table>
<br><br>

<%
Collection lista = greferencia_pedido.getlistadeclaracion_pedido(pedcodsx);
request.setAttribute("lista", lista);
%>
<style>
	a.vClass:visited {color: red;} 
	a.vClass:hover {color: pink;} 
	a.vClass:active {color: orange;} 
	a.vClass:link {color: blue;} 
</style>

<table align='center' width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>  
		<th>No. Declaración</th>
		<th>Imprimir</th>
	</tr>
 <%
String filePath = request.getRealPath("")+ File.separator;
String tipoAdjunto = "NACIONALIZACION";
String ruta_pdf = Propiedades.getProperties("ruta_pdf");

Iterator it = lista.iterator();
while (it.hasNext()) { 

	Collection datos = (Collection) it.next();
	Iterator det = datos.iterator();
	while (det.hasNext()) {
		String naccodsx = (String) det.next(); 
		String declaracion = (String) det.next(); 	 
%>
 	<tr align='center'>  
		<td nowrap="nowrap"><%= declaracion%></td> 
		<td >
<%
			String ruta = getServletContext().getRealPath("//") + File.separator + ruta_pdf + File.separator + tipoAdjunto + File.separator + naccodsx + File.separator;
			String ruta_ver = request.getContextPath() + File.separator + ruta_pdf + File.separator + tipoAdjunto + File.separator + naccodsx + File.separator;
			
			
			
			ShowFiles sf = new ShowFiles();
			File[] fs =  null;
			fs = sf.getListaArchivosGenerados( ruta);
			for(int i=0; fs!=null &&  i  <  fs.length ; i++) {
				File f = fs[i];
				String ruta_arch = ruta + f.getName();
				if(f.getName().equals("CVS")) continue;
%>
 
	 			<a href="<%= ruta_ver + f.getName()%>" target="_blank" class="vClass"><%=f.getName() %></a><br>
    
			<%
			}
			%>
 			
		</td>
	</tr>
<%
	}
}
%>
</table> 

<br><br><br>


</html> 