<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="maestro.control.*, maestro.entity.*"%>
 <link href="./disenno/templates/Principal/styles.css" rel="stylesheet" type="text/css" >
   
<%
  String bodega = request.getParameter("bodega");

gstbodega gbod = new gstbodega();
bodega entity = gbod.getbodega(bodega);

String campo = request.getParameter("campo");
String formulario = request.getParameter("formulario");



	if(entity!=null && campo!=null && formulario !=null ) {
    	String ruta_mapa =  "./disenno/mapas/" + entity.getbodurlplano();
%>

    <script type="text/javascript">
		function pick(posicion) {
		window.opener.document.<%= formulario %>.<%= campo %>.value = posicion;
		window.close();
		}
	
	
	</script>

<jsp:include page="<%=ruta_mapa%>"/>

<%
    }
%>

