<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstcategoria gcategoria = new gstcategoria();

			Collection lista = gcategoria.getlistacategoria();
			request.setAttribute("lista", lista);
			gstcategoria catPadre = new gstcategoria();
			categoria entPadre;
			gstcompania gcompania = new gstcompania();
			compania entcompania;
			String compania;
			%>
<div class="titulo">Lista de Categorias</div>
<br>

<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Compañia
		<th>Cod Sistema
		<th>Categoria Padre
		<th>Nombre
		<th>Descripción

		<logic:iterate id="temp" name="lista"
			type="maestro.entity.categoria">
			<tr align='center'>
				<%
				entcompania = gcompania.getcompania(temp.getcatcodcompania());
				compania = entcompania != null ? entcompania.getcomnombre() : "";
				%>
				<td><%=compania%>
				<td><%=temp.getcatcodsx()%>
				<%
					entPadre = catPadre.getcategoria(temp.getcatcodpadre());
				  	String padre = entPadre!=null?entPadre.getcatnombre():"SIN PADRE";
				%>
				
				<td><%=temp.getcatcodpadre()+" - "+ padre%>
				<td><%=temp.getcatnombre()%>
				<td><%=temp.getcatdescripcion()%>
				
		</logic:iterate>
</table>
