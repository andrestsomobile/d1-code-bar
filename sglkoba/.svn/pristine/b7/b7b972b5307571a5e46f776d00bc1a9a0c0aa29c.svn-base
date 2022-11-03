
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso, ingreso.control.*,ingreso.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%
	gstlote_contenedor_trafico glote_contenedor_trafico = new gstlote_contenedor_trafico();
	gstcontenedor_trafico gct = new gstcontenedor_trafico();
	gstlote_trafico glt = new gstlote_trafico();
	String trafcodsx = request.getAttribute("trafcodsx") == null ? request.getParameter("trafcodsx")
			: (String) request.getAttribute("trafcodsx");
	Collection lista_det = glote_contenedor_trafico.getlistalote_contenedor_trafico(trafcodsx);
	request.setAttribute("lista_det", lista_det);
%>
<div class="titulo">Detalle Lotes del Trafico</div>
<br>
  
 <%@ include file="trafico_head.jsp" %>

<table align='center' width='90%' border='0' cellspacing='0'
	cellpading='0'>
	<Tr>
		<td align='left'>
			<%
				if (gstpermiso.getEscritura(session, "ingreso", "lote_trafico.jsp")
						&& traf.getTrafestado().equals("TRAMITE")) {
			%>
			<a
			href='main.jsp?app=ingreso&modulo=lote_contenedor_trafico_datos&trafcodsx=<%=trafcodsx%>'>
				Nuevo Detalle </a> <%
 	}
 %>
		
		<td align='right'>
</table>
<table align='center' width='90%' border='0' cellspacing='0'
	cellpading='0' class="tabla_listas">
	<tr>
	    <th>Vehículo
	    <th>Estado Vehículo
		<th>Lote
		<th>Proveedor
		<th>Material
		<th>Fecha Vencimiento
		<th>Cantidad Recibida
		<th>Imprimir QR's
		<th>Opcion <logic:iterate id="temp_det" name="lista_det" type="lote_contenedor_trafico">
		        <%
				  lote_trafico lt = glt.getlote_trafico(temp_det.getlctraflote());
		          contenedor_trafico ct = gct.getcontenedor_trafico(temp_det.getlctrafcontenedor());
				%>
				<tr align='center'>
				    <td><%=ct.getctrafplaca()%>
				    <td><%=ct.getCtrafestado()%>
					<td><%=lt.getLtraflote()%>
					<td><%=lt.getLtrafproveedor()%>
					<td><%=lt.getLtrafproducto()%>
					<td><%=lt.getLtrafvencimiento()%>
					<td><%=temp_det.getlctrafcantidad()%>
					<td><a href='main.jsp?app=ingreso&modulo=generaQRlote&lctrafcodsx=<%=temp_det.getlctrafcodsx()%>'>QR</a>
					<td>
						<% if (gstpermiso.getEscritura(session, "ingreso", "lote_trafico.jsp")) { %>
						<a href='lote_contenedor_traficoAction.do?opcion=set&codsx=<%=temp_det.getlctrafcodsx()%>'><img src="./disenno/images/update.gif" title="Actualizar"></a>
						&nbsp;
						<% } %>
						&nbsp;
						<% if (gstpermiso.getEscritura(session, "ingreso", "lote_trafico.jsp") && traf.getTrafestado().equals("TRAMITE")) { %>
						| &nbsp; 
						<a href="javascript:validarDelete('lote_contenedor_traficoAction.do?opcion=delete&codsx=<%=temp_det.getlctrafcodsx()%>')"><img src="./disenno/images/substract.gif" title="Eliminar"></a> 
							<% } %>
						&nbsp;
			</logic:iterate>
</table>
<br>
<table align="center" width="80%">
	<tr>
		<td width="50%" align="left"><a
			href="traficoAction.do?opcion=set&codsx=<%=trafcodsx%>">
				Volver al Trafico </a>
		
</table>