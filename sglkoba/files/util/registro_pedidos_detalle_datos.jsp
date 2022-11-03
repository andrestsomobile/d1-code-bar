<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,pedido.control.*,pedido.entity.*,registro.control.*,registro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<% 

registro_pedido_detalleForm regf = (registro_pedido_detalleForm)request.getAttribute("registro_pedido_detalleForm");
String Codsx = regf.getrpderegped();

gstregistro_pedido_detalle gregistro_pedido_detalle = new gstregistro_pedido_detalle();
			gregistro_pedido_detalle.setMaxfilas(20);
			String param = request.getParameter("param");
			String pag = request.getParameter("pag");
			Collection lista = gregistro_pedido_detalle.getlistaregistro_pedido_detalle(pag, Codsx);
			request.setAttribute("lista", lista);
%>
<div class="titulo">Registro de Pedidos</div>

<br>
 <%@ include file="registro_pedido_head1.jsp" %>

<br>
    
<table align='center'  width='40%' border='0' cellspacing='0' cellpading='0' class="tabla_listas">
	<tr>
		<th>Pedidos Alistados (*)
                <th>Guia (*)
		<logic:iterate id="temp" name="lista" type="registro.entity.registro_pedido_detalle">
			<tr align='center'>

                            <td><%= new gstpedido().getpedido(temp.getrpdenumpedido()).getpednumpedido()%>
                            <td><%= new gstpedido().getpedido(temp.getrpdenumpedido()).getpedguia()%>
                            
                                    
                                 



		</logic:iterate>
</table>