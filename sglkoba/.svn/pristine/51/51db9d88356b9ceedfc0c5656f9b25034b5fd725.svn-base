<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso,maestro.control.*"%>
	
		<script>
    function limpiar(){
    document.categoriaForm.catcodpadre.value = '0';
    document.categoriaForm.desc.value = 'SIN CATEGORIA';
    return;
	}
	</script> 

<%@page import="java.util.Vector"%>
<html >
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<div class="titulo">Gestion de Datos de un categoria</div>
<br>
<html:form
	action="categoriaAction.do?app=maestro&modulo=categoria_datos"
	method="post" >
	<html:hidden property="opcion" />
	<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
			<tr> 
				<td  colspan="2">Datos de una categoria: empresa, categoria (Si es una categoria principal, o sea que no tiene 
				jerarquias superiores a ella, se colocara SIN CATEGORIA) y descripcion
				<br><br>
	
	
		<tr>
			<td>Codigo del sistema
			<td><html:text property="catcodsx" readonly="true" styleClass="readonly"  />Automatico, generado por el Sistema
		<%
			gstcategoria gcat = new gstcategoria();
			request.setAttribute("lista", gcat.getlistacategoria());
		%>
		<tr>
		<%
			gstcompania gcia = new gstcompania();
			request.setAttribute("listaCompania", gcia.getlistacompania());
		%>	
		<tr>
			<td>Compañia
			<td><html:select property="catcodcompania" onchange="limpiar()">
					<html:options collection="listaCompania"  
					property="comcodsx" labelProperty="comnombre"/>
				</html:select>* <html:errors
				property="catcodcompania" />
		<tr>
			<td>Categoria padre
			<td>
				<html:hidden property="catcodpadre" />
				<html:text property="desc" readonly="true" styleClass="readonly" size="20"/><html:errors
				property="catcodpadre" />
				<%
				String[] parametros = new String[] {"'+ categoriaForm.catcodcompania.options[categoriaForm.catcodcompania.selectedIndex].value  + '", "0", ""};
				String[] parametros_total = new String[] {"'+ categoriaForm.catcodcompania.options[categoriaForm.catcodcompania.selectedIndex].value  + '", ""};
				String[] campos_form= new String[] {"catcodpadre", "desc"};
				String[] campos_pick = new String[] {"catcodsx", "catnombre"};
				String[] campos_entity= new String[] {"catnombre", "catdescripcion"};
				String[] nombres_campos_entity= new String[] {"Nombre", "Descripcion"};
				String formulario = "categoriaForm";
				String metodo = "getlistacategoria";
				String metodoTotal = "getTotalPaginaslistacategoria";
				%>
        		 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstcategoria" entidad="maestro.entity.categoria" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
		<tr>
			<td>Nombre Categoria
			<td><html:text property="catnombre" />* <html:errors
				property="catnombre" />
		<tr>
			<td>Descripcion
			<td><html:textarea property="catdescripcion"></html:textarea>* <html:errors
				property="catdescripcion" />
		<tr align="center">
			<td colspan="2"><html:submit value="Grabar" disabled='<%= !gstpermiso.getEscritura(session,  "maestro", "categoria_datos.jsp") %>' />
			<html:button property="cancelar" onclick="window.location='main.jsp?app=maestro&modulo=categoria'" value="Cancelar"/>
	</table>
</html:form>
</html>
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
