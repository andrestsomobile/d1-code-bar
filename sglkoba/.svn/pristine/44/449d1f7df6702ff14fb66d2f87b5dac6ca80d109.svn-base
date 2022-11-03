<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import ="maestro.control.*, maestro.entity.*, java.util.*" %>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 
<%
Vector inc = (Vector) request.getSession().getAttribute("inconsistencias");
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
			var isNotFinished = xml.getElementsByTagName("finished")[0];
			var myBytesRead = xml.getElementsByTagName("bytes_read")[0];
			var myContentLength = xml.getElementsByTagName("content_length")[0];
			var myPercent = xml.getElementsByTagName("percent_complete")[0];

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
				}
			}
		}
		else
		{
			alert(req.statusText);
		}
	}
}

function Guardar()
{
	var archivo=document.getElementById("txtFile");
	var codcia=document.getElementById("compania");
	location.href="subirProductosAction.do?ruta="+archivo.value+"&compania="+codcia.value;
}
</script>

<div class="titulo"> Cargue Archivo de Productos </div> 

<html:form action="reportesAction.do" method="post" onsubmit="return validar()"> 
<table >
<%@include file="seleccion_compania.jsp"%> 
</table>
</html:form>
	<iframe id="uploadFrameID" name="uploadFrame" height="0" width="0" frameborder="0" scrolling="yes"></iframe>              
	<form id="myForm" enctype="multipart/form-data" method="post" target="uploadFrame" action="servlet/FileUploadServlet" onsubmit="ajaxFunction()">
	    <input type="file" name="txtFile" id="txtFile" /><br />
	    <input type="submit" id="submitID" name="submit" value="Upload" />
	    <input type="button" id="guardar" name="guardar" value="Actualizar" onclick="Guardar();"/>
	</form>
<p>La estructura es un archivo Microsoft Excel 97-2003 (.xls). Son 26 celdas, estas son:
prodescripcion	procategoria	promodelo	prosubpartida	proean	procodbarra	progarantia	prokiloreal	provolumen	
prokilovolumen	prouniempaque	prokvuniempaque	provoluniempaque	prounimasterpac	prokvmasterpack	propesobmp
resumen	provolmasterpac	procodigobarra	proestado	proobservacion	protipoproducto	prolargo	proalto	proancho	procatoster
						
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
<br>
<br><br><br>
<%if (inc != null) { %>
<div class="titulo"> Log de Cargue </div> 
<table width="80%" border="1" cellpadding="1" cellspacing="1" class="fmm_componentes">
<% for (int i = 0;i<inc.size();i++) { String reg = (String) inc.elementAt(i);%>
 	<tr><td><%= reg%>
<%
   }
   request.getSession().setAttribute("inconsistencias",null);
%>
</table>
<%}%>