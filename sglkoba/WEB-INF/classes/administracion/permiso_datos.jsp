
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import="administracion.control.*,java.io.*,java.util.*" %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

		<div class="titulo"> Gestion de Datos de un permiso </div> 
		<br> 
		<html:form  action="permisoAction.do?app=administracion&modulo=permiso_datos" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
					<tr> 
				<td colspan="2">
		 	<br>Los permisos estan definidos por <b>GRUPO,MODULO,COMPONENTE y ACCESO, </b>donde el modulo y componente seran
		 	los elementos a asignar el permiso de acceso definido
		 	<br><br>
			<tr> 
				<td>Codigo del sistema
				<td><html:text property="percodsx" size="10" readonly="true" styleClass="readonly"  /> 
				Generado por el Sistema
			<tr> 
				<td>Grupo
				<td>
				<%
			gstgrupo ggr = new gstgrupo();
			request.setAttribute("lista", ggr.getlistagrupo());
			%>
				
				<html:select property="pergrupo">
					<html:options collection="lista"  
					property="gcodsx" labelProperty="gnombre"   />
				</html:select>
			<tr> 
			<%
			
			 File[] files = new File(application.getRealPath(File.separator+ File.separator) + 
					 	File.separator + "files" +File.separator).listFiles();
				Collection list = Arrays.asList(files);
				request.setAttribute("perapps", list);
			%>
				<td>App
				<td><html:select property="perapp"  onchange="document.permisoForm.permodulo.value=''"  >
						<html:options collection="perapps" property="name"  	/>
					</html:select> 
			<tr> 
				<td>Modulo
				<td><html:text property="permodulo" readonly="true" styleClass="readonly"  /> *
					<%
					
				String[] parametros = new String[] { "'+ permisoForm.perapp.options[permisoForm.perapp.selectedIndex].value   +'" , "0", ""};
				String[] parametros_total = new String[] {"", ""};
				String[] campos_form= new String[] {"permodulo"};
				String[] campos_pick = new String[] { "percodsx"};
				String[] campos_entity= new String[] {"percodsx"};
				String[] nombres_campos_entity= new String[] {"Recurso"};
				String formulario = "permisoForm";
				String metodo = "getListaApp";
				String metodoTotal = "getTotalListaApp";
				%>
        		 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="administracion.control.gstpermiso" entidad="administracion.entity.permiso" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
	
				 <html:errors property="permodulo"/>
			<tr> 
				<td>Acceso
				<td>
				<html:select  property="peracceso">
					<html:option value="0">Ninguno</html:option>
					<html:option value="1">Lectura</html:option>
					<html:option value="2">Escritura</html:option>
					<html:option value="3">Administracion</html:option>
					<html:option value="4">Autorizacion</html:option>
               </html:select>
				<tr align="center"> 
				<td colspan="2"><html:submit  value="Grabar" disabled='<%= !gstpermiso.getEscritura(session,  "administracion", "permiso_datos.jsp") %>'/> 
										 <html:button property="cancelar" onclick="window.location='main.jsp?app=administracion&modulo=permiso'" value="Cancelar"/>
				
		</table> 		</html:form> 		</html> 