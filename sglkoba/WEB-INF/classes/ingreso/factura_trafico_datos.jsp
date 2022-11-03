
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso" %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 
<%
  String trafcodsx = request.getAttribute("trafcodsx")==null ? request.getParameter("trafcodsx") : (String)request.getAttribute("trafcodsx");
%>
		<div class="titulo"> Gestion de Datos de una factura_trafico </div> 
		<br> 
		<%@ include file="trafico_head.jsp" %>
		
		<html:form action="factura_traficoAction.do?app=ingreso&modulo=factura_trafico_datos" method="post" > 
		<html:hidden property="opcion"/> 
		<html:hidden property="ftrafcodsx"/>
		<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
			<tr> 
				<td>Factura
				<td><html:text property="ftrafnumfactura"  /> <html:errors property="ftrafnumfactura"/>
		<html:hidden property="ftrafnumtrafico" value="<%=trafcodsx %>" /> 
				<tr align="center"> 
				<td colspan="2">
			<%if( gstpermiso.getEscritura(session,  "ingreso", "factura_trafico_datos.jsp") && traf.getTrafestado().equals("TRAMITE") ) { %>	
				<html:submit  value="Grabar" /> 
				<%}  %>
		</table> 		</html:form> 		</html> 