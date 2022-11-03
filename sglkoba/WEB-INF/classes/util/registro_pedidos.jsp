<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,registro.control.*,registro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstregistro_pedido gregistro_pedido = new gstregistro_pedido();
			gregistro_pedido.setMaxfilas(10);
			String param = request.getParameter("param");
			String pag = request.getParameter("pag");
			Collection lista = gregistro_pedido.getlistaregistro_pedido(pag, param);
			request.setAttribute("lista", lista);

			%>
<div class="titulo">Gestion Registro de Pedidos</div>
<div align="right" > <a href="main.jsp?app=registro&modulo=print_<%= request.getParameter("modulo") %>"> Imprimir Listado Completo </a> </div>
<br>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' >
	<Tr>
		<td align='left'>
		<% if(gstpermiso.getEscritura(session, "util", "registro_pedido.jsp")) {%>
		<a href='main.jsp?app=util&modulo=registro_pedidos_datos_1'>	Nuevo registro </a>
		<%} %>
		<td align='right'>
		<form method='post' action='main.jsp?app=util&modulo=registro_pedidos'><input
			type='text' name='param' value='<%=param==null ? "" : param %>'> <input
			type='submit' name='buscar' value='Buscar'></form>
</table>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas">
	<tr>
		<th>Consecutivo (*)
		<th>Empleado    (*)
                <th>Fecha       (*)
                <th>Hora Ingreso
                <th>Hora Salida
		<th>Estado
                <th>Opcion <logic:iterate id="temp" name="lista" type="registro.entity.registro_pedidos">
			<tr align='center'>

                                <td><%=temp.getrepecodsx()%>
                                <td><%=temp.getrepefecha()%>
                                <td><%= new gstempleado().getempleado(temp.getrepeempleado()).getempnombre() %>
                                <td><%=temp.getrepehoin()%>
                                <td><%=temp.getrepehofi()%>
                                <td><%=temp.getrepeesta()%>
                               	<td><a href='registro_pedidoAction.do?opcion=set&codsx=<%= temp.getrepecodsx()%>'><img src="./disenno/images/update.gif" title="Actualizar" ></a> &nbsp;| &nbsp;
                                    <% if(gstpermiso.getEscritura(session, "util", "registro_pedidos.jsp")) {%>
                                        <% if(!temp.getrepeesta().equals("FINALIZADO") ) {%>
                                            <a href="javascript:validarDelete('registro_pedidoAction.do?opcion=delete&codsx=<%= temp.getrepecodsx()  %>')"><img src="./disenno/images/substract.gif" title="Eliminar" ></a>
                                        <%} %>&nbsp;
                                    <%} %>
                                 



		</logic:iterate>
</table>
<%String url = "main.jsp?app=registro&modulo=registro_pedidos&param="
					+ (param == null ? "" : param);
			int paginas = gregistro_pedido.getTotalPaginaslistaregistro_pedido(param);

			%>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
<br>Los campos con (*) son de busqueda
