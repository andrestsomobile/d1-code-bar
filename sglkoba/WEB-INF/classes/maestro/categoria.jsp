<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstcategoria gcategoria = new gstcategoria();
			gcategoria.setMaxfilas(10);
			String param = request.getParameter("param");
			String pag = request.getParameter("pag");
			Collection lista = gcategoria.getlistacategoria(pag, param);
			request.setAttribute("lista", lista);
			gstcategoria catPadre = new gstcategoria();
			categoria entPadre;
			gstcompania gcompania = new gstcompania();
			compania entcompania;
			String compania;
			%>
<div class="titulo">Gestion de Categorias</div>
<div align="right" > <a href="main.jsp?app=maestro&modulo=print_<%= request.getParameter("modulo") %>"> Imprimir Listado Completo </a> </div>
<br>
<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' > 
<tr>
 	<td colspan="2" class="fuente">
 	<br>
 	Las categorias para jerarquizar productos de las empresas registradas
 	<br><br>

	<Tr>
		<td align='left'>
		<% if(gstpermiso.getEscritura(session, "maestro", "categoria.jsp")) {%>
		<a href='main.jsp?app=maestro&modulo=categoria_datos'>Nuevo categoria </a>
		<% }  %>
		<td align='right'>
		<form method='post' action='main.jsp?app=maestro&modulo=categoria'><input
			type='text' name='param' value='<%=param==null ? "" : param %>'> <input
			type='submit' name='buscar' value='Buscar'></form>
</table>
<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Cod Sistema (*)
		<th>Categoria Padre
		<th>Nombre (*)
		<th>Descripción (*)
		<th>Compañia (*)
		<th>Opcion <logic:iterate id="temp" name="lista"
			type="maestro.entity.categoria">
			<tr align='center'>
				<td><%=temp.getcatcodsx()%>
				<%
					entPadre = catPadre.getcategoria(temp.getcatcodpadre());
				  	String padre = entPadre!=null?entPadre.getcatnombre():"SIN PADRE";
				%>
				
				<td><%=temp.getcatcodpadre()+" - "+ padre%>
				<td><%=temp.getcatnombre()%>
				<td><%=temp.getcatdescripcion()%>
				<%
				entcompania = gcompania.getcompania(temp.getcatcodcompania());
				compania = entcompania != null ? entcompania.getcomnombre() : "";
				%>
				<td><%=compania%>
				<td><a href='categoriaAction.do?opcion=set&codsx=<%= temp.getcatcodsx()%>'><img src="./disenno/images/update.gif" title="Actualizar" ></a> 
				&nbsp;|&nbsp; 
				<% if(gstpermiso.getEscritura(session, "maestro", "categoria.jsp") && puedeBorrar( temp.getcatcodsx() ) )  {%>
				<a href="javascript:validarDelete('categoriaAction.do?opcion=delete&codsx=<%= temp.getcatcodsx()  %>')"><img src="./disenno/images/substract.gif" title="Eliminar" ></a>
				<%} %>
		</logic:iterate>
</table>
<%String url = "main.jsp?app=maestro&modulo=categoria&param="
					+ (param == null ? "" : param);
			int paginas = gcategoria.getTotalPaginaslistacategoria(param);

			%>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual="<%= pag %>" total="<%= (paginas) %>" url="<%= url %>" />
<br>Los Campos con (*) son de busqueda

<%!
private  boolean puedeBorrar(String catcodsx) {
	Vector nopueden = new Vector();
	nopueden.add( "1");
	nopueden.add( "2");
	nopueden.add( "3");
	nopueden.add( "4");
	nopueden.add( "5");
	nopueden.add( "6");
	nopueden.add( "7");
	
	return !nopueden.contains(catcodsx);
}

%>
