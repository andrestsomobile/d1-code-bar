
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso, pedido.form.pedidoForm,pedido.control.*, maestro.control.*, maestro.entity.* " %>  

		<%@page import="util.JhFormat"%>
<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 


		<div class="titulo"> Formato de Impresion de Pedido </div> 
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

  <tr> 
    <th>Direccion	
    <td><%= ped_form.getpeddireccion() %>
    <th>Ciudad 
    <td><%= ped_form.getCiudesc() %>
  <tr> 
    <th>Departamento
    <td><%= ped_form.getDepdesc() %>
    <th>&nbsp;
    <td>&nbsp;
    
  <tr> 
    <th>Observaciones
    <td><%= ped_form.getpedobservaciones() %>
    <th>Causal HIT
    <td><%= ped_form.getPedcausal_hit() + " - "  +new gstcausal_hit().getcausal_hit( ped_form.getPedcausal_hit()).getcauhdesc() %>
  <tr> 
    <th>Factura
    <td><%= ped_form.getpedfactura() %>
    <th>Estado 
    <td> <%= ped_form.getpedestado() %>
  <tr> 
    <th>Picking Asociado
    <td><%= ped_form.getPedpicking()==null ?"No tiene" :  ped_form.getPedpicking() %>
    <th>Tipo
<td> <%= ped_form.getPedtipo() %>

    
  <tr> 
    <th >Subtotal
    <td align="right">$<%= JhFormat.getFormatedNumber( ped_form.getpedsubtotal()) %>
 
    <th>IVA 
    <td align="right">$<%=JhFormat.getFormatedNumber( ped_form.getpediva() )%>
  <tr> 
    <th>&nbsp;
    <td>&nbsp;
 
     <th>Total 
    <td align="right">$<%= JhFormat.getFormatedNumber( ped_form.getpedtotal()) %>
  
</table>
<br><br>

<%

java.util.Collection lista = greferencia_pedido.getlistareferencia_pedido(pedcodsx);   
request.setAttribute("lista", lista); 


%>
<table align='center'  width='98%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
<Caption> Referencias del pedido</Caption>
 	<tr>  
 <th> Material
 <th>Descripcion
 <th>Bodega
 <th>Posicion
 <th>Cantidad x UMP
 <th>Vlr unitario $
 <th>Vlr Total $
 	<logic:iterate id="temp" name="lista" type="pedido.entity.referencia_pedido"  >
 <tr align='center'>  
 <% 
 maestro.entity.producto prod = new maestro.control.gstproducto().getproducto( temp.getrefpproducto() );
 gstbodega gbod = new gstbodega();
bodega bod = gbod.getbodega( temp.getRefpbodega() );
 %>
 <td>  <%= prod.getpromodelo()  %>
 <td>  <%= prod.getprodescripcion()%>  
 <td> <%= bod.getbodnombre()%>
 <td> <%= temp.getrefpposicion() %>
 <td align="right"> <%= JhFormat.getFormatedNumber(  temp.getrefpcantidad() )%>
 <td align="right"> <%= JhFormat.getFormatedNumber(  temp.getrefpvalorunit() )%>
 <td align="right"> <%= JhFormat.getFormatedNumber(  temp.getrefpvalortotal() )%>

 </logic:iterate>
  </table> 

<br><br><br>


</html> 