
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso" %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

		<div class="titulo"> Gestion de Datos de un grupo </div> 
		<br> 
		<html:form action="grupoAction.do?app=administracion&modulo=grupo_datos" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border="0" width='90%' cellpadding="0" cellspacing="0" class="tabla_datos"> 
		<tr> 
				<td  colspan="2">Registre el nombre del grupo que va a crear.
				<br>Tenga en cuenta que para definir a que modulos el grupo tendra acceso, se deberan configurar en la
				opcion PERMISOS.
				<br><br>
			<tr> 
				<td>Codigo del sistema
				<td><html:text property="gcodsx" readonly="true" styleClass="readonly" size="10"   /> Generado por el Sx
			<tr> 
				<td>Nombre Grupo
				<%
				administracion.form.grupoForm gform = (administracion.form.grupoForm)request.getAttribute("grupoForm");
				boolean cambianombre = gform !=null  && gform.getgcodsx()!=null && ( gform.getgcodsx().equals("1") || gform.getgcodsx().equals("3")  || gform.getgcodsx().equals("4"))  ? true: false ; 
				%>
				<td><html:text property="gnombre" readonly="<%= cambianombre %>" size="35" styleClass='<%= cambianombre ? "readonly" : "" %>' />* <html:errors property="gnombre"/>
				<tr align="center"> 
				<td colspan="2"><html:submit  value="Grabar" disabled='<%= !gstpermiso.getEscritura(session,  "administracion", "grupo_datos.jsp") %>'/> 
				
				 <html:button property="cancelar" onclick="window.location='main.jsp?app=administracion&modulo=grupo'" value="Cancelar"/>

		</table> 		</html:form> 		</html> 