 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="ingreso.control.*,ingreso.entity.*,java.util.*, maestro.entity.*, maestro.control.*, administracion.control.*, sap.control.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>
 
 <div class="contenedorPrincipal" style="padding:1em;">
 <div class="titulo"> Interfaz 944 </div> 

 <br> 

 <%
 String trafcodsx            = request.getParameter("trafcodsx");
 String modo                 = request.getParameter("modo"); //verificar, enviar
 String danados              = request.getParameter("danados");
 String identificadorArchivo = request.getParameter("archivo");
 
 if(modo == null){
	 modo = "verificar";
 }
 
 if(danados == null){
	 danados = "";
 }
 
 if(identificadorArchivo == null){
	 identificadorArchivo = (new gstinterface944()).getSiguiente944outputfileID();
	 
 }
 //gstsapftputil ftpUtil = new gstsapftputil();
 //ftpUtil.enviarArchivo("formato944.txt", "AAAA*BBBB*CCCC");
 %>
<script language="javascript">

function verificarSi(){	
	location.href="main.jsp?app=ingreso&modulo=enviarArchivo944&modo=enviar&trafcodsx=<%= trafcodsx %>&archivo=<%= identificadorArchivo %>&danados=<%= danados %>";
}

function verificarNo(){
	location.href="main.jsp?app=ingreso&modulo=factura_trafico&trafcodsx=<%= trafcodsx %>";
}

function enviarAceptar(){
	location.href="main.jsp?app=ingreso&modulo=factura_trafico&trafcodsx=<%= trafcodsx %>";
	
}
</script>


<%

if(modo.equals("enviar")){
	
	gstsapinterface944 control944 				 = new gstsapinterface944();
	gsttrafico controltrafico                    = new gsttrafico();
	
	trafico trafico 		                     = controltrafico.gettrafico(trafcodsx);
	
	ResultadoEscribirInterface resultadoEscribir = control944.generarArchivo944(trafcodsx, danados, identificadorArchivo);
	String dataRaw								 = resultadoEscribir.getStringDataRaw();
	boolean enviado 							 = control944.enviarArchivo944(dataRaw, trafico.gettrafcompania(), session);
	String aviso 								 = "Archivo enviado.";
	
	%>
	<div style=" width: 26em; margin: 0 auto; font-size: 1.2em;">

	<div style="text-align:center; padding-top: 1em;">
		<div><%= aviso %></div>
		<input type="button" id="botonVerificarSi" name="botonAceptar" value="Aceptar" onclick="enviarAceptar();"/>					
	</div>
	</div>
	<%
	
}else if(modo.equals("verificar")) {

	String aviso 	 = "AVISO";
	String tablaHtml = "";
	String dataRaw   = ""; //Archivo puro que se envía
	
	gstsapinterface944 control944   = new gstsapinterface944();
	
	ResultadoEscribirInterface resultadoEscribir = control944.generarArchivo944(trafcodsx, danados, identificadorArchivo);
	
	tablaHtml	= resultadoEscribir.getTableHtmlDataRaw();
	dataRaw		= resultadoEscribir.getStringDataRaw();
	
	aviso = "¿Está seguro de enviar el archivo 944 a Oster?";
%>

<div style=" width: 26em; margin: 0 auto; font-size: 1.2em;">

<div style="text-align:center; padding-top: 1em;">
	<div><%= aviso %></div>
	<input type="button" id="botonVerificarSi" name="botonVerificarSi" value="Sí" onclick="verificarSi();"/>
	<input type="button" id="botonVerificarNo" name="botonVerificarNo" value="No" onclick="verificarNo();"/>				
</div>
</div>

<h1>Interface 944</h1>
<%=tablaHtml %>		

<h3>Contenido Archivo</h3>
<textarea rows="10" style="width: 100%;"><%= dataRaw %></textarea>
<%	
	
}
%>

	