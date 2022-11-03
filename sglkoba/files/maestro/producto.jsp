
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso, maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

			<%
			gstproducto gproducto = new gstproducto();
			gproducto.setMaxfilas(10);
			String param = request.getParameter("param");
			String pag = request.getParameter("pag");
			Collection lista = gproducto.getlistaproducto(pag, param);
			request.setAttribute("lista", lista);
			gstcompania gcompania = new gstcompania();
			compania entcompania;
			String compania;
			gstcategoria gcategoria = new gstcategoria();
			categoria entcategoria;
			String categoria;
			%>
<div class="titulo">Gestion de productos</div>
<div align="right" > <a href="main.jsp?app=maestro&modulo=print_<%= request.getParameter("modulo") %>"> Imprimir Listado Completo </a> </div>
<br>
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
<tr>
 	<td colspan="2" class="fuente">
 	<br>
 	Los productos de las companias, se muestran todos los productos de todas las companias, use el parametro de
 	busqueda para obtener datos filtrados.
 	<br><br>

	<Tr>
		<td align='left'>
		<% if(gstpermiso.getEscritura(session, "maestro", "producto.jsp")) {%>
		<a href='main.jsp?app=maestro&modulo=producto_datos'>Nuevo Producto</a>
		<%} %>
		<td align='right'>
		<form method='post' action='main.jsp?app=maestro&modulo=producto'><input
			type='text' name='param' value='<%=param==null ? "" : param %>'> <input
			type='submit' name='buscar' value='Buscar'></form>
</table>
<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 	<tr>
		<th>Cod Sistema (*)
		<th>Compañia (*)
		<th>Descripcion (*)
		<th>Categoria (*)
		<th>Material (*)
		<th>Material Espejo (*)
		<th>Estado
		<th>Opcion <logic:iterate id="temp" name="lista"
			type="maestro.entity.producto">
			<tr align='center'>
				<td><%=temp.getprocodsx()%>
				<%
				entcompania = gcompania.getcompania(temp.getprocodigocia());
				compania = entcompania!=null?entcompania.getcomnombre():"";
				%>
				<td><%=compania%>
				<td><%=temp.getprodescripcion()%>
				<%
				entcategoria = gcategoria.getcategoria(temp.getprocategoria());
				categoria = entcategoria!=null?entcategoria.getcatnombre():"";
				%>
				<td><%=categoria%>
				<td><%=temp.getpromodelo()%>
				<td><%=temp.getprosubpartida()%>
				<td><%= temp.getProestado() %>
				<td><a
					href='productoAction.do?opcion=set&codsx=<%= temp.getprocodsx()%>'><img src="./disenno/images/update.gif" title="Actualizar" ></a>&nbsp;|&nbsp;
				<% if(gstpermiso.getEscritura(session, "maestro", "producto.jsp")) {%>
				<a href="javascript:validarDelete('productoAction.do?opcion=delete&codsx=<%= temp.getprocodsx()  %>')"><img src="./disenno/images/substract.gif" title="Eliminar" ></a>
				<%} %>
		</logic:iterate>
</table>
<%String url = "main.jsp?app=maestro&modulo=producto&param="
					+ (param == null ? "" : param);
			int paginas = gproducto.getTotalPaginaslistaproducto(param);

			%>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
<br>Los Campos con (*) son de busqueda

</html>