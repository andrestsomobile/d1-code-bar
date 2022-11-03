<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="ingreso.control.*,ingreso.entity.*,java.util.*, maestro.entity.*, maestro.control.*, administracion.control.*, sap.control.*, pedido.entity.pedido, pedido.control.*"%>
   
   
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>
 
 <div class="contenedorPrincipal" style="padding:1em;">
 <div class="titulo"> Interfaz 945 </div> 

 <br> 

 <%
 String pedcodsx 		     = request.getParameter("pedcodsx");
 String ruta      			 = request.getParameter("ruta");
 String modo      			 = request.getParameter("modo"); //verificar, enviar
 String errorCode 			 = request.getParameter("errorcode");
 String identificadorArchivo = request.getParameter("archivo");

 if(modo == null){
	 modo = "verificar";
 }
 String codPedido = "";	
 
 if(identificadorArchivo == null){
	 identificadorArchivo = (new gstinterface945()).getSiguiente945outputfileID();	
 }

 %>
<script language="javascript">
var req;


function verificarSi(){
	
	location.href="main.jsp?app=pedido&modulo=sli945&modo=enviar&pedcodsx=<%= pedcodsx %>&archivo=<%= identificadorArchivo %>";
}

function verificarNo(){
	location.href="pedidoAction.do?opcion=set&pedcodsx=<%= pedcodsx %>";
}



function  enviarAceptar(){
	location.href="pedidoAction.do?opcion=set&pedcodsx=<%= pedcodsx %>";
}

</script>

<%

if(modo.equals("enviar")){
	
	gstsapinterface945 control945 				 = new gstsapinterface945();	
	ResultadoEscribirInterface resultadoEscribir = control945.armarArchivo945(pedcodsx, identificadorArchivo);
	
	gstpedido controlPedido                      = new gstpedido();
	pedido pedido  								  = controlPedido.getpedido(pedcodsx);
	
	if(resultadoEscribir.getCodigoError() != gstsapinterface945.ERROR945CANTIDADPORENCIMA){
		String dataRaw								 = resultadoEscribir.getStringDataRaw();
		boolean enviado 							 = control945.enviarArchivo945(dataRaw, pedido.getpedcompania(),session);
		String aviso 								 = "Información cargada.";
		%>
		<div style=" width: 26em; margin: 0 auto; font-size: 1.2em;">
			<div>
				<table valign="middle">
					<tr>
						<td valign="middle"><img src="./disenno/images/iconook.png" style="margin-right: 1em;"/></td>
						<td valign="middle">
							<%=aviso %>						
						</td>
					</tr>
				</table>
			</div>		
			<div style="text-align: center;  margin-top:1em;"><input type="button" id="botonAceptar" name="botonAceptar" value="Aceptar" onclick="enviarAceptar();"/>	</div>				
		</div>

		<%	
	}else{
		String aviso = "Error en envío de archivo la cantidad registrada es mayor a la recibida.";
		%>
		<div style=" width: 26em; margin: 0 auto; font-size: 1.2em;">
			<div>
				<table valign="middle">
					<tr>
						<td valign="middle"><img src="./disenno/images/iconofail.png" style="margin-right: 1em;"/></td>
						<td valign="middle">
							<%=aviso %>						
						</td>
					</tr>
				</table>
			</div>		
			<div style="text-align: center;  margin-top:1em;"><input type="button" id="botonAceptar" name="botonAceptar" value="Aceptar" onclick="enviarAceptar();"/>	</div>				
		</div>

		<%
		
	}
		
}else if(modo.equals("verificar")) {

	String aviso 	 = "AVISO";
	String tablaHtml = "";
	String dataRaw   = ""; //Archivo puro que se envía
	
	gstsapinterface945 control945 = new gstsapinterface945();
	
	ResultadoEscribirInterface resultadoEscribir = control945.armarArchivo945(pedcodsx, identificadorArchivo);
	
	tablaHtml	= resultadoEscribir.getTableHtmlDataRaw();
	dataRaw		= resultadoEscribir.getStringDataRaw();
	
	aviso = "¿Está seguro de enviar el archivo 945 a Oster?";	
	if(resultadoEscribir.getCodigoError() == 0){
		
		%>

		<div style=" width: 26em; margin: 0 auto; font-size: 1.2em;">

		<div style="text-align:center; padding-top: 1em;">
			<div><%= aviso %></div>
			<input type="button" id="botonVerificarSi" name="botonVerificarSi" value="Sí" onclick="verificarSi();"/>
			<input type="button" id="botonVerificarNo" name="botonVerificarNo" value="No" onclick="verificarNo();"/>				
		</div>
		</div>

		<h1>Interface 945</h1>
		<%=tablaHtml %>		

		<h3>Contenido Archivo</h3>
		<textarea rows="10" style="width: 100%;"><%= dataRaw %></textarea>
		<%		
	
	
	}else if(resultadoEscribir.getCodigoError() == gstsapinterface945.ERROR945CANTIDADPORDEBAJO ){
		aviso = "Algunos items tienen registrados menos cantidad que la solicitdada ¿Está seguro de enviar el archivo 945 a Oster?";
		%>

		<div style=" width: 26em; margin: 0 auto; font-size: 1.2em;">

		<div style="text-align:center; padding-top: 1em;">
			<div><%= aviso %></div>
			<input type="button" id="botonVerificarSi" name="botonVerificarSi" value="Sí" onclick="verificarSi();"/>
			<input type="button" id="botonVerificarNo" name="botonVerificarNo" value="No" onclick="verificarNo();"/>				
		</div>
		</div>

		<h2>Diferencia de cantidades</h2>
		<%= resultadoEscribir.getMensajeErrorExtensionHtml() %>
		
		<h1>Interface 945</h1>
		<%=tablaHtml %>		

		<h3>Contenido Archivo</h3>
		<textarea rows="10" style="width: 100%;"><%= dataRaw %></textarea>
		<%		
	}else if(resultadoEscribir.getCodigoError() == gstsapinterface945.ERROR945CANTIDADPORENCIMA ){
		aviso = "Algunos items tienen registrados mas cantidad que la solicitada. No puede enviar este archivo, por favor verifique la sección de diferencias de cantidades y realice los cambios pertinentes";
		%>

		<div style=" width: 26em; margin: 0 auto; font-size: 1.2em;">

		<div style="text-align:center; padding-top: 1em;">
			<div><%= aviso %></div>			
			<input type="button" id="botonVerificarNo" name="botonVerificarNo" value="Aceptar" onclick="verificarNo();"/>				
		</div>
		</div>

		<h2>Diferencia de cantidades</h2>
		<%= resultadoEscribir.getMensajeErrorExtensionHtml() %>
		
		<%		
	}
	
	
	
	
	
}
%>

  
 
