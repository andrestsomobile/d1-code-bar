
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso,maestro.control.gstcompania"%>

<html>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<div class="titulo">Gestion de Datos de un cliente</div>
<br>
<html:form action="clienteAction.do?app=maestro&modulo=cliente_datos"
	method="post">
	<html:hidden property="opcion" />
	<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
	<tr> 
				<td  colspan="2">Los datos de un cliente de una compania registrada en l sistema son: Compania asociada, nombre
				, nit, direccion, telefono, ciudad, contacto, mail (No oblig) y observacion (No oblig)
				<br><br>	<tr>
			<td>Codigo del sistema
			<td><html:text property="clicodsx" readonly="true" styleClass="readonly"/>Automatico, Generado por el sistema
		<tr>
		<%
			gstcompania gcia = new gstcompania();
			request.setAttribute("listaCompania", gcia.getlistacompaniatodas());
		%>	
			<td>Codigo de la Compañia
			<td><html:select property="clicodcompania">
					<html:options collection="listaCompania"  
					property="comcodsx" labelProperty="comnombre"   />
				</html:select>* <html:errors
				property="clicodcompania" />
		<tr>
			<td>Codigo del cliente
			<td><html:text property="clicodigo" />* <html:errors
				property="clicodigo" />
			
		<tr>
			<td>Nombre
			<td><html:text property="clinombre" />* <html:errors
				property="clinombre" />
		<tr>
			<td>Nit
			<td><html:text property="clinit" />* <html:errors property="clinit" />
		<tr>
			<td>Direccion
			<td><html:text property="clidireccion" />* <html:errors
				property="clidireccion" />
		<tr>
			<td>Telefono
			<td><html:text property="clitelefono" />* <html:errors
				property="clitelefono" />
		<tr>
			<td>Ciudad
			<td>
			<%
			maestro.form.clienteForm cf =(maestro.form.clienteForm)request.getAttribute("clienteForm");
			
			%>
			<html:hidden property="cliciudad"  />
			<input type="text" name="ciunombre" readonly="readonly" class="readonly" value="<%= cf!=null && cf.getcliciudad()!=null ? new maestro.control.gstciudad().getciudad( cf.getcliciudad()).getciunombre() : "" %>">
			<% 


			String[] parametros = new String[] {   "0", ""};
			String[] parametros_total = new String[] { ""};
			String[] campos_form= new String[] {"cliciudad","ciunombre"};
			String[] campos_pick = new String[] {"ciucodigo" ,"ciunombre"};
			String[] campos_entity= new String[] {"ciucodigo", "ciunombre" };
			String[] nombres_campos_entity= new String[] { "Codigo",  "Nombre"};
			String formulario = "clienteForm";
			String metodo = "getlistaciudad"; 
			String metodoTotal = "getTotalPaginaslistaciudad";
			%> <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
			<popup:boton clase="maestro.control.gstciudad" entidad="maestro.entity.ciudad" 
					formulario="<%=formulario %>" metodo="<%=metodo %>"
					metodo_total="<%=metodoTotal %>"
					parametros="<%= parametros %>" campos_form="<%= campos_form %>"
					campos_pick="<%= campos_pick %>"
					parametros_total="<%= parametros_total %>" 
					campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" /> 
			
		<tr>
			<td>Contacto
			<td><html:text property="clicontacto" />* <html:errors
				property="clicontacto" />
		<tr>
			<td>Email
			<td><html:text property="climail" />
	<tr>
			<td>Acepta devoluciones
			<td><html:select property="clidevolucion">
				<html:option value="S">S</html:option>
				<html:option value="N">N</html:option>
			</html:select>	
	
		<tr>
			<td>Observacion
			<td><html:textarea property="cliobservacion"></html:textarea>		
		<tr align="center">
			<td colspan="2"><html:submit value="Grabar" disabled='<%= !gstpermiso.getEscritura(session,  "maestro", "cliente_datos.jsp") %>' />
			<html:button property="cancelar" onclick="window.location='main.jsp?app=maestro&modulo=cliente'" value="Cancelar"/>
	</table>
</html:form>
</html>
