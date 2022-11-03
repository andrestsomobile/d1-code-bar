
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso, maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

			<%
			gstproducto gproducto = new gstproducto();

			Collection lista = gproducto.getlistaproducto();
			request.setAttribute("lista", lista);
			gstcompania gcompania = new gstcompania();
			compania entcompania;
			String compania;
			gstcategoria gcategoria = new gstcategoria();
			categoria entcategoria;
			String categoria;
			%>
<div class="titulo">Lista de productos</div>
<br>

<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 	<tr>
		<th>Compañia
		<th>Cod Sistema
		<th>Descripcion
		<th>Categoria
		<th>Material
		<th>Subpartida
		<th>Estado
		<th>Kilo real
		<th>Volumen
		<th>Kilo Volumen
		<th> Unidad Empaque
		 <th>Kilo Volumen U Empaque
		<th>Volumen U Empaque 
		<th>Unid. Master Pack
		 
		<logic:iterate id="temp" name="lista"
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
		<td><%= temp.getprokiloreal() %>
		<td><%= temp.getprovolumen() %>
		<td><%= temp.getprokilovolumen() %>
		<td> <%= temp.getprouniempaque() %>
		 <td><%= temp.getprokvuniempaque() %>
		<td><%= temp.getprovoluniempaque() %>
		<td><%= temp.getprounimasterpac() %>
		
		</logic:iterate>
</table>

</html>