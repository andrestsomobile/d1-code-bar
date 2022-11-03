
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.*,pedido.control.*,pedido.entity.*,java.util.*,ingreso.control.*,ingreso.entity.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/hiddenpaneltag.tld" prefix="h"%>

<%
	gstreferencia_despacho_serial greferencia_despacho_serial = new gstreferencia_despacho_serial();
	gstreferencia_despacho greferencia_despacho = new gstreferencia_despacho();
	gstdespacho_pedido gdesp = new gstdespacho_pedido();
	gstpedido gped = new gstpedido();

	String refdcodsx = request.getParameter("refdcodsx");

	referencia_despacho referencia_despacho = greferencia_despacho.getreferencia_despacho(refdcodsx);
	despacho_pedido desp = gdesp.getdespacho_pedido(referencia_despacho.getrefddespacho_pedido());
	pedido ped = gped.getpedido(desp.getdespedpedido());
	despacho despa = new gstdespacho().getdespacho(desp.getdespeddespacho());
	greferencia_despacho_serial.setMaxfilas(100);
	String param = request.getParameter("param");
	String pag = request.getParameter("pag");

	String promodelo = request.getParameter("promodelo");
	String cantidad = request.getParameter("cantidad");

	Collection lista = greferencia_despacho_serial.getlistareferencia_despacho_serial(refdcodsx);
	int cantidadserialesseleccionados = lista != null ? lista.size(): 0;
	request.setAttribute("lista", lista);
%>
<div class="titulo">Gestion de Seriales de Referencias</div>
<br>
<br>
 <table width='80%' align='center' border='0'> 
 	<Tr> 
 	<td align='left'> <a href="despachoAction.do?opcion=set&codsx=<%=desp.getdespeddespacho()%>"> Volver al Despacho </a>   
 	</td>	
 </table>
<br>
<br>	
<strong>Seriales de la Referencia: <%=promodelo%></strong>
<br>
<strong>Cantidad de Seriales a Despachar: <%=cantidad%></strong>
<br>
<strong>Cantidad de Seriales Seleccionados: <%=cantidadserialesseleccionados%></strong>
<table width='80%' align='center' border='0'>
	<Tr>
		<td align='left'>
		<%
			if (lista != null && !lista.isEmpty()) {
		%>

		<table align='center' width='50%' border='0' cellspacing='0'
			cellpading='0' class="tabla_listas">


			<tr>
				<th>Serial
				<th>Opcion <logic:iterate id="rds" name="lista"
					type="referencia_despacho_serial">
					<tr align='center'>
						<td><%=rds.getRefdsserial()%>
						<td><a
							href="javascript:validarDelete('referencia_despacho_serialAction.do?opcion=delete&codsx=<%=rds.getRefdscodsx()%>&refdcodsx=<%=refdcodsx%>&serial=<%=rds.getRefdsserial()%>&cantidad=<%=cantidad%>&promodelo=<%=promodelo%>')">
						<img src="./disenno/images/substract.gif" border="0"></a>
				</logic:iterate>
		</table>
		<%
			} else {
		%> <br>
		No hay seriales asignados. <%
 	}
 %>
		
	<Tr>
		<td align='left'><br>
		<br>
		<br>
		<strong>Seriales Disponibles de la Referencia</strong> <%
 	if (gstpermiso.getEscritura(session, "pedido",
 			"referencia_despacho_serial.jsp")
 			&& despa.getdespestado().equals("TRAMITE")) {
 		gstreferencia_trafico gret = new gstreferencia_trafico();
 		Collection lista_disponibles = gret
 				.getlistareferencia_traficoByProducto(referencia_despacho
 						.getrefdproducto());
 		request.setAttribute("lista_disponibles", lista_disponibles);
 		if (lista_disponibles != null && !lista_disponibles.isEmpty()) {
 %> <html:form action="referencia_despacho_serialAction.do"
			method="post">
			<html:submit property="btnApply" value="Aceptar" />
			<html:hidden property="refdcodsx" value="<%= refdcodsx %>" />
			<html:hidden property="promodelo" value="<%=promodelo%>" />
			<html:hidden property="cantidad" value="<%= cantidad %>" />
			<html:hidden property="opcion" value="crear" />
			<input type="hidden" name="refdsreferencia_despacho"
				value="<%=refdcodsx%>" />
			<table align='center' width='50%' border='0' cellspacing='0'
				cellpading='0' class="tabla_listas">
				<tr>
					<th>Marcar
					<th>Serial <logic:iterate id="temp" name="lista_disponibles"
						type="referencia_trafico">

						<tr align='center'>
							<td><html:multibox property="selectedItems"
								value="<%= temp.getreftcodsx() %>"></html:multibox>
							<td><%=temp.getreftserial()%>
					</logic:iterate>
			</table>

		</html:form> <%
 	} else {
 %> <br>
		<br>
		<br>
		No hay seriales disponibles. <%
			}
		%> <%
 	}
 %>
		
</table>