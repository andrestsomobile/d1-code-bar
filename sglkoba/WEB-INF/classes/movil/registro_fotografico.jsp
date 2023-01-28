<!doctype html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" pedido.action.*, java.util.*, java.io.*,util.*, util.file.* " %>
		    

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>






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

function refrescar() {
	location.reload();
}

</script>

<style>
        *, *.before, *:after {
            box-sizing:border-box;
        }
        
        body {
            font-family: Avenir, 'Helvetica Neue', 'Lato', 'Segoe UI', Helvetica, Arial, sans-serif;
        }
        
        #Selector {
            width: 200px;
            margin: 0 auto;
        }
        
        .SubirFoto {
            width: 0.1px;
            height: 0.1px;
            opacity: 0;
            overflow: hidden;
            position: absolute;
            z-index: -1;
            line-height: normal;
            font.size: 100%
            margin:0;
        }
        
        .SubirFoto + label {
            font-size: 1.2rem;
            font-weight: bold;
            color: #d3394c;
            display: inline-block;
            text-overflow: ellipsis;
            text-align: center;
            white-space: nowrap;
            overflow: hidden;
            padding: 0.6rem 1.2rem;
            cursor: pointer;
        }

        .SubirFoto:focus + label,
        .SubirFoto + label:hover {
            color: orange;
            outline: 1px dotted #000;
            fill: orange;
        }
        
        .SubirFoto + label figure {
            width: 100%;
            height: 100%;
            fill: #f1e5e6;
            border-radius: 50%;
            background-color: #d3394c;
            display: block;
            padding: 20px;
            margin: 0 auto 10px;
        }
        
        .SubirFoto + label:hover figure {
            background:orange;
        }
        
        inputfile + label svg {
            vertical-align: middle;
            width: 100%;
            height: 100%;
            fill: #f1e5e6;
        }
    </style>
</head>    
<%
String filePath = request.getRealPath("")+ File.separator;
String tipoAdjunto = "REGFOTOGRAFICO";
String ruta_pdf = Propiedades.getProperties("ruta_pdf");
String clave = request.getParameter("clave");
String placa = request.getParameter("placa");
%>
<div class="titulo">Registro Fotografico  Vehiculo Placa <%=placa%> <%=clave%> </div> 

	<iframe id="uploadFrameID" name="uploadFrame" height="0" width="0" frameborder="0" scrolling="yes"></iframe>              
	<form id="myForm" enctype="multipart/form-data" method="post" target="uploadFrame" 
		action="servlet/FileUploadServlet?tipoAdjunto=<%=tipoAdjunto%>&ruta_pdf=pdf&clave=<%=request.getParameter("clave")%>" onsubmit="ajaxFunction()">
<!-- 	    <input type="file" name="txtFile" id="txtFile" accept="image/*" capture="camera"/> -->
	    
	    <br />
	    
	    <div id="Selector">
        	<input type="file" name="txtFile" id="txtFile" class="SubirFoto" accept="image/*;capture=camera" />
        	<label for="txtFile"><figure><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg></figure> <span>Envía una foto...</span></label>
    	</div>
    
	    <input type="submit" id="submitID" name="submit" value="Upload" />
	    <input type="hidden" id="tipoAdjunto" name="tipoAdjunto" value="<%=tipoAdjunto%>"/>
	    <input type="hidden" id="ruta_pdf" name="ruta_pdf" value="<%=ruta_pdf%>"/>
	    <input type="hidden" id="clave" name="clave" value="<%=clave%>"/>
	    <br><br>
	    <input type="button" id="btn1" name="btn1" onclick="refrescar()" value="Actualizar" />
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
<br>
<br><br><br>




 
<table border="1" cellpadding="0" cellspacing="0" class="lista-home">
   <caption> Registro Fotografico: <%=request.getParameter("clave")%> </caption>
    <tr>
      <th> Imagen
      <th> Archivo 
      <th> Tamaño
      <th> Fecha Creacion
      <th colspan="1"> Opcion
    </tr>
<%
String ruta = getServletContext().getRealPath("//") + File.separator + ruta_pdf + File.separator + tipoAdjunto + File.separator + clave + File.separator;
String ruta_ver = request.getContextPath() + File.separator + ruta_pdf + File.separator + tipoAdjunto + File.separator + clave + File.separator;

String elim = request.getParameter("eliminararchivo");
if (elim!=null) {
	try {
 		File f = new File(ruta + request.getParameter("nombrearchivo") );
 f.delete();
 }catch(Exception ex) {
 ex.printStackTrace();
 }
}

ShowFiles sf = new ShowFiles();
File[] fs =  null;
fs = sf.getListaArchivosGenerados( ruta);
for(int i=0; fs!=null &&  i  <  fs.length ; i++) {
	File f = fs[i];
	String ruta_arch = ruta + f.getName();
	if(f.getName().equals("CVS")) continue;
%>
 
<style>
a.vClass:visited {color: red;} 
a.vClass:hover {color: pink;} 
a.vClass:active {color: orange;} 
a.vClass:link {color: blue;} 
</style>

 <tr>
  	  <td nowrap="nowrap"><img width="100px" height="auto" alt="" src="<%=ruta_ver + File.separator + f.getName() %>"> 
      <td nowrap="nowrap"><%=f.getName() %>
      <td nowrap="nowrap"><%= ( f.length() / 1000) %> Kb
      <td nowrap="nowrap"><%= new Date( f.lastModified() )%>
      <td nowrap="nowrap"><a href='main_movil.jsp?app=movil&modulo=registro_fotografico&clave=<%=clave%>&eliminararchivo=ok&nombrearchivo=<%=f.getName() %>'>Eliminar</a>
 </tr>
    
<%
}
%>
 </table>