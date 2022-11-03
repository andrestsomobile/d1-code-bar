<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso, maestro.control.*"%>
	
<script>
    function limpiar(){
    document.productoForm.procategoria.value = '';
    document.productoForm.desc.value = '';
	}
	</script>
<html >
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<div class="titulo">Gestion de Datos de un Tipo Producto</div>
<br>
<html:form action="tipoproductoAction.do?app=maestro&modulo=tipoproducto_datos" method="post" >
	<html:hidden property="opcion" />
	<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
	<tr> 
				<td  colspan="2">Datos de un Tipo Producto: empresa, Tipo Producto y descripcion
				<br><br>
		
	<tr>
			<td>Codigo del sistema
			<td><html:text property="tiprcodsx" readonly="true" styleClass="readonly"  />Automatico, generado por el Sistema
		<%
			gsttipoproducto gtipr = new gsttipoproducto();
			request.setAttribute("lista", gtipr.getlistatipoproducto());
		%>
		<tr>
		<%
			gstcompania gcia = new gstcompania();
			request.setAttribute("listaCompania", gcia.getlistacompania());
		%>	
		<tr>
			<td>Compañia
			<td><html:select property="tiprcodcompania" >
					<html:options collection="listaCompania"  
					property="comcodsx" labelProperty="comnombre"/>
				</html:select>* <html:errors
				property="tiprcodcompania" />
		<tr>
			<td>Descripcion
			<td><html:textarea property="tiprdescripcion"></html:textarea>* <html:errors
				property="tiprdescripcion" />
		<tr>
			<td>Codigo Tipo Producto
			<td><html:text property="tiprcodigo" />* <html:errors
				property="tiprcodigo" />
		
		<tr align="center">
			<td colspan="2"><html:submit value="Grabar" disabled='<%= !gstpermiso.getEscritura(session,  "maestro", "tipoproducto_datos.jsp") %>' />
			<html:button property="cancelar" onclick="window.location='main.jsp?app=maestro&modulo=tipoproducto'" value="Cancelar"/>
	</table>
</html:form>
</html>
