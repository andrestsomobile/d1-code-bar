
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import ="nacionalizacion.entity.*, nacionalizacion.control.*, ingreso.control.*, ingreso.entity.*, java.util.*, administracion.control.gstpermiso, pedido.form.pedidoForm,pedido.control.*, maestro.control.*, maestro.entity.* " %>  

<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

<%
administracion.entity.empresa emp = new administracion.control.gstempresa().getempresa("4");
%>


  <tr> 
    <td valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" >
        <tr align="center">
          <td colspan="2"><%=emp.getempnombre()%><br>
              <%=emp.getempdireccion()%><br>
              Tel: <%=emp.getemptelefono()%>  
          </td>
        <tr> 
          <td><b>No. Solicitud: </b><font size=5><%= ped.getpednumpedido() %></font><img src='/barbecue/barcode?height=50&data=<%= ped.getpednumpedido() %>'/></td>
          <td align="right">Tipo Vista: 
		    <form action="main.jsp?app=pedido&modulo=documento_entrega&pedcodsx=<%=pedcodsx %>" method="post">
          		<select name="tipo" onchange="document.forms[0].submit();"> 
<%--           			<option value="RESUMIDO" <%= tipo.equals("RESUMIDO") ? "selected" : "" %>>RESUMIDO</option> --%>
          			<option value="DETALLADO" <%= tipo.equals("DETALLADO") ? "selected" : "" %>>DETALLADO</option>
          	</select>
          </form>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="pequeno">
      <caption>Datos Generales</caption>
        <tr> 
          <th align="left" width="25%">Compañia: <td width="25%"><%= gcomp.getcompania(cli.getclicodcompania()).getcomnombre() %></td>
          <th align="left" width="25%"> Destinatario: <td width="25%"><%= suc.getsucnombre()%></td>
        </tr>
        <tr> 
          <th align="left" width="25%">Fecha Pedido: <td width="25%"><%= ped.getpedfecha() %></td>
          <th align="left">Telefono: <td><%= suc.getsuctelefono() %></td>
        </tr>
        <tr> 
          <th align="left">No GUIA: <td><%= ped.getpedguia() %></td>
          <th align="left">Direccion: <td><%= ped.getpeddireccion() %>
        </tr>
        <tr> 
          <th align="left" >Transportadora<td ><%= transp != null?transp.gettranspnombre():"" %>&nbsp;
          <th align="left">Depto/Ciudad <td><%= dep.getdepnombre() %>/<%= ciud.getciunombre()  %></td>
        </tr>
        <tr> 
          <th align="left">Observacion<td width="25%"><%= ped.getpedobservaciones() %>&nbsp;
          <th align="left">Fecha Alistamiento<td><%= ped.getPedfechaalistamiento() %>&nbsp;
        </tr>
        <tr> 
          <th align="left">Fecha Despacho<td><%= ped.getPedfechadespacho() %>&nbsp;
          <th align="left">Fecha Entrega<td><%= ped.getPedfechaentrega()%>&nbsp;
        </tr>
      </table>
     