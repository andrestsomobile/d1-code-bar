
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso" %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

		<div class="titulo"> Gestion de Datos de La empresa </div> 
		<br> 
		<html:form action="empresaAction.do?app=administracion&modulo=empresa_datos" method="post" > 
		<html:hidden property="opcion"/> 
		
<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos">
  <html:hidden  property="empcodsx"  /> 
  <tr> 
    <td colspan="2">Registre los Datos de su empresa: Nombre de la empresa, Direccion, 
      telefono de contacto, nit y descripcion de las actividades realizadas<br>
   
  <tr> 
    <td>Nombre 
    <td><html:textarea property="empnombre" rows="5" cols="40"  /> <html:errors property="empnombre" /> 
  <tr> 
    <td>Direccion 
    <td><html:textarea property="empdireccion" rows="5" cols="40" /> <html:errors property="empdireccion" /> 
  <tr> 
    <td>Telefono 
    <td><html:text property="emptelefono"  /> <html:errors property="emptelefono" /> 
  <tr> 
    <td>Nit 
    <td><html:text property="empnit"  /> <html:errors property="empnit" /> 
  <tr> 
    <td>Descripcion 
    <td><html:textarea property="empdescripcion"  cols="40" rows="5" /> <html:errors property="empdescripcion" /> 
      <tr> 
    <td>Mail
    <td><html:text property="empmail"   /> <html:errors property="empmail" /> 
    
      <tr> 
    <td>Slogan
    <td><html:textarea property="empslogan"  cols="40" rows="2" /> <html:errors property="empslogan" /> 
    
  <tr align="center"> 
    <td colspan="2"><html:submit  value="Grabar" disabled='<%= !gstpermiso.getEscritura(session,  "administracion", "empresa_datos.jsp") %>'/> 
    <html:button property="cancelar" onclick="window.location='main.jsp?app=administracion'" value="Cancelar"/>
</table>
</html:form> 		</html> 