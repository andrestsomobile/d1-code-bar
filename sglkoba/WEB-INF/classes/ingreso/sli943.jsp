 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="ingreso.control.*,ingreso.entity.*,java.util.*, maestro.entity.*, maestro.control.*, administracion.control.*, sap.control.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>
 
 <div class="contenedorPrincipal" style="padding:1em;">
 <div class="titulo"> Interfaz 943 </div> 

 <br> 

 <%
 String trafcodsx = request.getParameter("trafcodsx");
 String ruta      = request.getParameter("ruta");
 String modo      = request.getParameter("modo"); //verificar, procesar, procesarok, procesarerror
 String errorCode = request.getParameter("errorcode");
 %>
<script language="javascript">
var req;

function ajaxFunction()
{
	var url = "servlet/FileUploadServlet";
	if (window.XMLHttpRequest) // Non-IE browsers
	{ 
	
		req = new XMLHttpRequest();
		req.onreadystatechange = processStateChange;
		try 
		{
			req.open("GET", url, true);
		} 
		catch (e) 
		{
			alert(e);
		}
		req.send(null);
	} 
	else if (window.ActiveXObject) // IE Browsers
	{ 
	
		req = new ActiveXObject("Microsoft.XMLHTTP");
		
		if (req) 
		{
			req.onreadystatechange = processStateChange;
			req.open("GET", url, true);
			req.send();
		}
	}
}

function processStateChange()
{
	/**
	 *	State	Description
	 *	0		The request is not initialized
	 *	1		The request has been set up
	 *	2		The request has been sent
	 *	3		The request is in process
	 *	4		The request is complete
	 */
	if (req.readyState == 4)
	{
		if (req.status == 200) // OK response
		{
		
			var xml = req.responseXML;

			// No need to iterate since there will only be one set of lines
			var isNotFinished   = xml.getElementsByTagName("finished")[0];
			var myBytesRead     = xml.getElementsByTagName("bytes_read")[0];
			var myContentLength = xml.getElementsByTagName("content_length")[0];
			var myPercent       = xml.getElementsByTagName("percent_complete")[0];

			// Check to see if it's even started yet
			if ((isNotFinished == null) && (myPercent == null))
			{
				document.getElementById("initializing").style.visibility = "visible";

				// Sleep then call the function again
				window.setTimeout("ajaxFunction();", 100);
			}
			else 
			{
				document.getElementById("initializing").style.visibility = "hidden";
				document.getElementById("progressBarTable").style.visibility = "visible";
				document.getElementById("percentCompleteTable").style.visibility = "visible";
				document.getElementById("bytesRead").style.visibility = "visible";

				myBytesRead = myBytesRead.firstChild.data;
				myContentLength = myContentLength.firstChild.data;

				if (myPercent != null) // It's started, get the status of the upload
				{
					myPercent = myPercent.firstChild.data;
		
					document.getElementById("progressBar").style.width = myPercent + "%";
					document.getElementById("bytesRead").innerHTML = myBytesRead + " of " + 
						myContentLength + " bytes read";
					document.getElementById("percentComplete").innerHTML = myPercent + "%";
	
					// Sleep then call the function again
					window.setTimeout("ajaxFunction();", 100);
				}
				else
				{
					document.getElementById("bytesRead").style.visibility = "hidden";
					document.getElementById("progressBar").style.width = "100%";
					document.getElementById("percentComplete").innerHTML = "Done!";
					revisarArchivo();
				}
			}
		}
		else
		{
			alert(req.statusText);
		}
	}
}

/*
function Guardar()
{
	var archivo=document.getElementById("txtFile").files[0].name;
	//alert(archivo.value);
	//window.location="fileAction.do?ruta="archivo.value;
	location.href="sli943?ruta="+archivo;
}
*/

function verificarSi(){
	location.href="main.jsp?app=ingreso&modulo=sli943&trafcodsx=<%= trafcodsx %>&modo=procesar&ruta=<%= ruta %>";
}

function verificarNo(){
	location.href="main.jsp?app=ingreso&modulo=sli943&trafcodsx=<%= trafcodsx %>";
}

function revisarArchivo(){
	var archivo=document.getElementById("txtFile").files[0].name;
	//alert(archivo.value);
	//window.location="fileAction.do?ruta="archivo.value;	
	location.href="main.jsp?app=ingreso&modulo=sli943&trafcodsx=<%= trafcodsx %>&modo=verificar&ruta="+archivo;	
}

function procesarAceptar(){
	location.href="traficoAction.do?opcion=set&codsx=<%= trafcodsx %>";
	
}

function  failAceptar(){
	location.href="main.jsp?app=ingreso&modulo=sli943&trafcodsx=<%= trafcodsx %>";
}

</script>


	<iframe id="uploadFrameID" name="uploadFrame" height="0" width="0" frameborder="0" scrolling="yes"></iframe>              
	<form id="myForm" enctype="multipart/form-data" method="post" target="uploadFrame" 
		action="servlet/FileUploadServlet" onsubmit="ajaxFunction()">
	    <input type="file" name="txtFile" id="txtFile" /><label>Seleccionar archivo Oster943.edi</label> <br />
	    <input type="submit" id="submitID" name="submit" value="Subir archivo" />
	    <!-- <input type="button" id="guardar" name="guardar" value="Actualizar" onclick="Guardar();"/> -->
	</form>
	
	<!-- Add hidden DIVs for updating and the progress bar (just a table) below the form -->
	<div id="initializing" style="visibility: hidden; position: relative; top: inherit;">
		<table width="100%" style="border: 1px; background-color: black;">
			<tr>
				<td>
					<table width="100%" style="border: 1px; background-color: black; color: white;">
						<tr>
							<td align="center">
								<b>Inicializando Upload...</b>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	
	<div id="progressBarTable" style="visibility: hidden; position: absolute; top: inherit;">
		<table width="100%" style="border: 1px; background-color: black; color: white;">
			<tr>
				<td>
					<table id="progressBar" width="0px" 
						style="border: 1px; width: 0px; background-color: blue;">
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="100%" style="background-color: white; color: black;">
			<tr>
				<td align="center" nowrap="nowrap">
					<span id="bytesRead" style="font-weight: bold;">&nbsp;</span>
				</td>
			</tr>
		</table>		
	</div>

	<div id="percentCompleteTable" align="center"
		style="visibility: hidden; position: absolute; top: inherit;">
		<table width="100%" style="border: 1px;">
			<tr>
				<td>
					<table width="100%" style="border: 1px;">
						<tr>
							<td align="center" nowrap="nowrap">
 								<span id="percentComplete" style="color: white; font-weight: bold;">&nbsp;</span>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
   	</div>

<%
if(ruta != null && modo.equals("verificar")){
	gstsap gstsap                         = new gstsap(); 
	gstsapinterface943 gstsapinterface943 = new gstsapinterface943(); //Ayuda a verificar la información.
	ResultadoLeerInterface resultado = gstsap.revizarArchivo(ruta, request);
	String mensajeError              = "";
	if(resultado.isParseadoCorrecto()){
		String tablaHtml   = resultado.getTableHtmlDataRaw();
		String tipoArchivo = resultado.getTipoArchivo();
		String idDocumento = resultado.getIdDocumento();
		
		boolean isArchivoValido  = false;
		String aviso             = "";		
		gstsapinterface943.ValidacionData validacionData = gstsapinterface943.validarData(resultado.getDataRaw(), trafcodsx);
		isArchivoValido = validacionData.isValido;
		aviso = validacionData.mensaje;		
		
		//if(resultado.getTipoArchivo().equals("943")){
		if(isArchivoValido){
			if(aviso.equals("")){
				aviso = "¿Está seguro de cargar la información especificada en el archivo "+ruta+" con identificación "+idDocumento+"?";
			}else{
				aviso += "¿Desea continuar?";
			}		
			%>
			<div style=" width: 26em; margin: 0 auto; font-size: 1.2em;">
				<div>
				<table>
					<tr>
<!-- 						<td valign="middle"><img src="./disenno/images/iconook.png" style="margin-right: 1em;"/></td> -->
						<td valign="middle"><%= aviso %></td>
					</tr>
				</table>
				</div>
				<div style="text-align:center; padding-top: 1em;">
					<input type="button" id="botonVerificarSi" name="botonVerificarSi" value="Sí" onclick="verificarSi();"/>
					<input type="button" id="botonVerificarNo" name="botonVerificarNo" value="No" onclick="verificarNo();"/>
				</div>			
			</div>
			<h3 class="saph3"><%= ruta %></h3>
	        <% 
			%><%=tablaHtml %><%			
		}else{
			mensajeError = aviso;			
		}	
	}else{
		mensajeError = resultado.getMensajeError();
	}
	
	if(!mensajeError.equals("")){
		%>
		<div style=" width: 26em; margin: 0 auto; font-size: 1.2em;">
			<table>
				<tr>
					<td valign="middle"><img src="./disenno/images/iconofail.png" style="margin-right: 1em;"/></td>
					<td valign="middle">
						Error: <%= mensajeError %>						
					</td>
				</tr>
			</table>								
			<div style="text-align: center;  margin-top:1em;"><input type="button" id="botonFailAceptar" name="botonFailAceptar" value="Aceptar" onclick="failAceptar();"/></div>	
		</div>		
        <%
	}
}


if(ruta != null && modo.equals("procesar")){
	gstsap gstsap       = new gstsap(); 	
	ResultadoLeerInterface resultadoLeer =  gstsap.revizarArchivo(ruta, request); 
	boolean resultado  = false;	
	String mensajeError = "Error!!!"; 
	
	if(resultadoLeer.getCodigoError() == 0){
		gstsapinterface943 gstsapinterface943 = new gstsapinterface943();	
		gstsapinterface943.setTrafcodsx(trafcodsx); 
		gstsapinterface943.setSession(session);
		gstsapinterface943.setRutaArchivo(ruta);
		gstsapinterface943.setContenidoArchivo(resultadoLeer.getDataArchivo());
		gstsapresultadoimportacion resultadoImportacion = 
				gstsapinterface943.importarInformacion(resultadoLeer.getDataRaw());
		resultado = resultadoImportacion.isSuccess();
		mensajeError = resultadoImportacion.getMensajeError();
	}
	
	if(resultado){
		%>
		<div style=" width: 26em; margin: 0 auto; font-size: 1.2em;">
			<table>
				<tr>
					<td valign="middle"><img src="./disenno/images/iconook.png" style="margin-right: 1em;"/></td>
					<td valign="middle">
						Información cargada 						
					</td>
				</tr>
			</table>								
			<div style="text-align: center;  margin-top:1em;"><input type="button" id="botonProcesarAceptar" name="botonProcesarAceptar" value="Aceptar" onclick="procesarAceptar();"/></div>	
		</div>		
        <%
	}else{
		
		%>
		<div style=" width: 26em; margin: 0 auto; font-size: 1.2em;">
			<table>
				<tr>
					<td valign="middle"><img src="./disenno/images/iconofail.png" style="margin-right: 1em;"/></td>
					<td valign="middle">
						Error: <%= mensajeError %>						
					</td>
				</tr>
			</table>								
			<div style="text-align: center;  margin-top:1em;"><input type="button" id="botonProcesarAceptar" name="botonProcesarAceptar" value="Aceptar" onclick="failAceptar();"/></div>	
		</div>		
        <%
	}
	
}


%>
</div> <!--  Fin div principal -->
  
 
