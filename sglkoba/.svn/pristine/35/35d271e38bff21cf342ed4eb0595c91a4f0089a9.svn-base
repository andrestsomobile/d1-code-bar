<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso, maestro.control.gstcliente"%>

<html>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
	String cliente = request.getAttribute("cliente")==null ? request.getParameter("succodcliente") : (String)request.getAttribute("cliente"); 
	gstcliente gcli = new gstcliente();
	String nombre = gcli.getcliente(cliente).getclinombre();
%>	
<div class="titulo">Gestion de Datos de un sucursal</div>
<div class="titulo">Cliente <%=nombre %></div>
<br>
<html:form action="sucursalAction.do?app=maestro&modulo=sucursal_datos"
	method="post">
	<html:hidden property="opcion" />
	<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
		<tr>
			<td>Codigo del sistema
			<td><html:text property="succodsx" readonly="true" styleClass="readonly"/>
		<tr>
		
			<td>Codigo del cliente
			<td><html:text property="succodcliente" value="<%=cliente %>" readonly="true" styleClass="readonly"/>* <html:errors property="succodcliente" />
			
			<tr>
			<td>Codigo de la sucursal
			<td><html:text property="succodigo" />* <html:errors property="succodigo" />
		<tr>
			<td>Nit
			<td><html:text property="sucnit" />* <html:errors property="sucnit" />
		<tr>
			<td>Nombre
			<td><html:text property="sucnombre" />* <html:errors
				property="sucnombre" />
		<tr>
			<td>Departamento
			<td>
			<% 
			request.setAttribute("listadepto", new maestro.control.gstdepartamento().getlistadepartamento());
			%>
			<html:select property="sucdepartamento" onchange="document.sucursalForm.succiudad.value=''; document.sucursalForm.ciudesc.value='';">
				<html:options collection="listadepto"  property="depcodigo" labelProperty="depnombre"   /> 
			</html:select>
		<tr>
			<td>Ciudad
			<td><html:hidden property="succiudad" />
			<%
			maestro.form.sucursalForm sf = (maestro.form.sucursalForm)request.getAttribute("sucursalForm");
			String dep="";
			if(sf!=null && sf.getsucciudad()!=null && !sf.getsucciudad().equals("")) dep = new maestro.control.gstciudad().getciudad(sf.getsucciudad()).getciunombre();
			
			%>
			<input type="text" name="ciudesc" readonly="readonly" class="readonly" value="<%=dep %>" >
			* <html:errors
				property="succiudad" />
				
		<% 
			String depto = "'+ sucursalForm.sucdepartamento.options[sucursalForm.sucdepartamento.selectedIndex].value  + '" ;

			String[] parametros = new String[] {  depto, "0", ""};
			String[] parametros_total = new String[] {depto, ""};
			String[] campos_form= new String[] {"succiudad", "ciudesc"};
			String[] campos_pick = new String[] {"ciucodigo", "ciunombre"};
			String[] campos_entity= new String[] {"ciucodigo", "ciunombre" };
			String[] nombres_campos_entity= new String[] { "Codigo",  "Nombre"};
			String formulario = "sucursalForm";
			String metodo = "getlistaciudadByDepto"; 
			String metodoTotal = "getTotalPaginaslistaciudadByDepto";
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
			<td><html:text property="succontacto" />
		<tr>
			<td>Cargo
			<td><html:text property="succargo" />
		<tr>
			<td>Email
			<td><html:text property="sucemail" />
		<tr>
			<td>Direccion
			<td><html:text property="sucdireccion" />* <html:errors
				property="sucdireccion" />
		<tr>
			<td>Telefono
			<td><html:text property="suctelefono" />* <html:errors
				property="suctelefono" />
		<tr align="center">
			<td colspan="2"><html:submit value="Grabar" disabled='<%= !gstpermiso.getEscritura(session,  "maestro", "sucursal_datos.jsp") %>' />
			<input type="button" onclick="window.location='main.jsp?app=maestro&modulo=sucursal&&succodcliente=<%=cliente  %>'" value="Cancelar"/>
	</table>
</html:form>
</html>
