 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso, ingreso.entity.*, ingreso.form.*" %>  
<html> 
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 
<%
String trafcodsx = request.getParameter("trafcodsx")==null ? (String)request.getAttribute("trafcodsx") :request.getParameter("trafcodsx");
contenedor_traficoForm contenedor_traf_form =(contenedor_traficoForm)request.getAttribute("contenedor_traficoForm"); 
%>
		<div class="titulo"> Vehículo en el Trafico </div> 
		<br> 
		
		<%@ include file="trafico_head.jsp" %>
		
		<html:form action="contenedor_traficoAction.do?app=ingreso&modulo=contenedor_trafico_datos" method="post" > 
		<html:hidden property="opcion"/> 
		<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
			<html:hidden property="ctrafcodsx" /> 
			<html:hidden property="ctrafnumtrafico" 
				value="<%= trafcodsx  %>" /> 
           <tr> 
				<td>Placa
				<td><html:text property="ctrafplaca"  /> *<html:errors property="ctrafplaca" />
				<td>Estado
				<td> <%if(contenedor_traf_form==null || contenedor_traf_form.getCtrafestado() == null) { %>
					  <html:text property="ctrafestado" value="EN TRANSITO" readonly="true" styleClass="readonly"/>
					 <% } else if(contenedor_traf_form != null && contenedor_traf_form.getCtrafestado().equals("EN TRANSITO")) { %>
							<html:select property="ctrafestado">
								<html:option value="EN TRANSITO">EN TRANSITO</html:option>
								<html:option value="DESCARGANDO">DESCARGANDO</html:option>
							</html:select>
				     <% } else if(contenedor_traf_form != null && contenedor_traf_form.getCtrafestado().equals("DESCARGANDO")) { %>
							<html:select property="ctrafestado">
							    <html:option value="DESCARGANDO">DESCARGANDO</html:option>
								<html:option value="FINALIZADO">FINALIZADO</html:option>
							</html:select>
					<% } else if(contenedor_traf_form != null && contenedor_traf_form.getCtrafestado().equals("FINALIZADO")) { %>
					        <html:text property="ctrafestado" value="FINALIZADO" readonly="true" styleClass="readonly"/>
				     <% } %>
				 <td >
		     
		  
		  
				 
           <tr> 
				<td>Conductor
				<td><html:text property="ctrafconductor"  /> *<html:errors property="ctrafconductor" />
				<td>Cédula
				<td><html:text property="ctrafcedula"  /> *<html:errors property="ctrafcedula" />
			    
			<tr>
			    <td>Contenedor
				<td><html:text property="ctrafnumero"  /> *<html:errors property="ctrafnumero" />
				<td>Tama&ntilde;o
				<td>
					<html:select property="ctraftamano"> *<html:errors property="ctraftamano" />
						<html:option value="20">20</html:option>
						<html:option value="40">40</html:option>
						<html:option value="40HQ">40HQ</html:option>
						<html:option value="FURGON">FURGON</html:option>
					</html:select>
				
			<tr> 
				<td>Observaciones
			    <td colspan="3"><html:textarea property="ctrafobservacion" cols="70"/><tr align="center"> 
			
			 <tr> 
				<td>Inicio Descargue
				<td><html:text property="ctrafiniciodescargue" value='<%= contenedor_traf_form==null ? util.Fecha.getFecha() : contenedor_traf_form.getCtrafiniciodescargue() %>' size="15" readonly="true" styleClass="readonly"  />
				<td>Fin Descargue
				<td><html:text property="ctraffindescargue" size="15" readonly="true" styleClass="readonly"/> 
				    
			<tr>
				<td colspan="4" align="center">
				<% if( gstpermiso.getEscritura(session,  "ingreso", "contenedor_trafico_datos.jsp") && traf.getTrafestado().equals("TRAMITE")) {%>
				<html:submit  value="Grabar" /> 
				<%} %>
		</table> 
		<br>		
		<%if(contenedor_traf_form!=null) { %>
		<div align="center">
			<a href="main.jsp?app=ingreso&modulo=subirRegFotografico&clave=<%=contenedor_traf_form.getctrafcodsx()%>&placa=<%=contenedor_traf_form.getCtrafplaca()%>">Registro Fotografico </a>
		</div> 
		<% } %>
		 </html:form> 	
</html> 