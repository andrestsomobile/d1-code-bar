<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*,sap.control.*" %>
<%
String token = request.getParameter("token");
String tipo  = request.getParameter("tipo");

//Tipos: json, html
if(token == null){
	token = "";
}

if(tipo == ""){
	tipo = "html";
}

gstsaprevisarftp controlVerificar = new gstsaprevisarftp();


if(controlVerificar.esValidoToken(token)){
	controlVerificar.revisarArchivosFtp();	
}


%>
{
	"success" : true,
	"fecha"   : "<%= (new Date().toString()) %>"
}
