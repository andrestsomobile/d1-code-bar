
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import="administracion.control.*,maestro.control.*" %>  

		<html> 
		
				<script type="text/javascript">
			function setcia() {
				if(document.usuarioForm.usugrupo.options[usuarioForm.usugrupo.selectedIndex].value=='3'
						||			
					document.usuarioForm.usugrupo.options[usuarioForm.usugrupo.selectedIndex].value=='4'	
				) {
				
				
				if(document.usuarioForm.usugrupo.options[usuarioForm.usugrupo.selectedIndex].value=='3') {
					document.getElementById('cliente').style.display='block';
					}
					else {
					document.getElementById('cliente').style.display='none';
					}
					document.getElementById('cia').style.display='block';
				
				}else {
				  document.getElementById('cia').style.display='none';
				  document.getElementById('cliente').style.display='none';
				  document.usuarioForm.usucompania.value='0';
				}
			}
			
		</script>
		
<%
administracion.form.usuarioForm usuform = (administracion.form.usuarioForm)request.getAttribute("usuarioForm");
gstcliente gcli = new gstcliente();

gstgrupo ggr = new gstgrupo();
%>		
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

		<div class="titulo"> Gestion de Datos de un usuario </div> 
		<br> 
		<html:form action="usuarioAction.do?app=administracion&modulo=usuario_datos" method="post" > 
		<html:hidden property="opcion" styleId="opcion"/> 
		<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
			<tr> 
				<td colspan="2"> Digite los datos de un usuario, debe ingresar el nombre, login, clave, mail (no obligatorio) , 
				grupo al que pertenece  y compania  a la que pertenece. 
			<tr> 
				<td>Codigo del sistema
				<td><html:text property="usucodsx"  readonly="true" styleClass="readonly"  /> (Asignado por el Sx - No Editable)
			<tr> 
				<td>Nombre
				<td><html:text property="usunombre"  />* <html:errors property="usunombre" />
			<tr> 
				<td>Login
				<td><html:text property="usulogin"  />* <html:errors property="usulogin"/>
			<tr> 
				<td>Clave
				<td><html:password property="usuclave"  />* <html:errors property="usuclave"/>
			<tr> 
				<td>Email
				<td><html:text property="usumail"  /> 
			<tr> 
				<td>Grupo
				<td>
				<% if(true) { 
			request.setAttribute("lista", ggr.getlistagrupo());
			%>
				<html:select property="usugrupo" onchange="setcia()">
					<html:options collection="lista"  
					property="gcodsx" labelProperty="gnombre"   />
				</html:select>
			<% } else  { %>	 
				<html:hidden property="usugrupo" value="<%= usuform.getusugrupo() %>"/>
				<input type="text" value="<%= ggr.getgrupo(usuform.getusugrupo() ).getgnombre()%>"  readonly="true" class="readonly">
			<% } %>
			<tr> 
				<td>Compañia
				<td>
				<% if(usuform==null  || ( usuform!=null && !usuform.getusugrupo().equals("3")) ) {  %>
				<span id="cia" style="display:none"  >
					<% 
						gstcompania gcia = new gstcompania();
						request.setAttribute("listaCompania", gcia.getlistacompania());
					%>	
					
					<html:select styleId="usucompania" property="usucompania"  >
					<html:options collection="listaCompania"  
					property="comcodsx" labelProperty="comnombre"   />
				</html:select>
				</span>
			<span id="cliente" style="display:none"  >
		  	<br> 
				Cliente:  	<html:text readonly="true" styleClass="readonly" property="usucodcliente" />		
							<%
				String[] parametros = new String[] {"'+ document.usuarioForm.usucompania.options[usuarioForm.usucompania.selectedIndex].value + '", "0", ""};
				String[] parametros_total = new String[] {"'+  document.usuarioForm.usucompania.options[usuarioForm.usucompania.selectedIndex].value + '", ""};
				String[] campos_form= new String[] {"usucodcliente"};
				String[] campos_pick = new String[] {"clicodsx"};
				String[] campos_entity= new String[] {"clicodsx", "clinombre", "clinit", "clidireccion"};
				String[] nombres_campos_entity= new String[] {"Consec. Cliente", "Nombre", "NIT", "Direccion"};
				%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstcliente" entidad="maestro.entity.cliente" 
						formulario="usuarioForm" metodo="getlistaclienteByEmpresa"
						metodo_total="getTotalPaginaslistaclienteByEmpresa"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
			
			</span>		
			<% } else  {  %> 
			<html:hidden property="usucodcliente" />		
			<% maestro.entity.cliente cli = gcli.getcliente( usuform.getusucodcliente());  %>
			<input type="text" value="<%= cli==null ? "" :  cli.getclinombre()%>" readonly="true" class="readonly">
			<% } %>
			*<html:errors property="usucodcliente"/>	
			<tr align="center"> 
				<td colspan="2"><html:submit  value="Grabar" disabled='<%= !gstpermiso.getEscritura(session,  "administracion", "usuario_datos.jsp") %>' /> 
						 <html:button property="cancelar" onclick="window.location='main.jsp?app=administracion&modulo=usuario'" value="Cancelar"/>
		</table> 		</html:form> 		
		
		
		</html> 
		
		