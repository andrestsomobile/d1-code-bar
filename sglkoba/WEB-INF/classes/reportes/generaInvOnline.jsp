<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" %>
	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 

	
<div class="titulo"> Genera Informacion Inventario </div>

<html:form action="reportesAction.do?tipo=inventarios&reporte=generaInvOnline&tipo_reporte=EXCELGENERADO" method="post" onsubmit="return validar()"> 
<table >
	<%@include file="compania.jsp"%> 
	<input type="hidden" name="pagina" value='main.jsp?app=reportes&modulo=generaInvOnline&tipo=patilos&tipo=inventarios'>  
	<tr> <td colspan="8" align="center"><html:submit value="Generar Archivo" />
	<tr><br>
		<td>Inventario Online
		    <a href="inv_online/" TARGET="_new"> &gt;&gt; Ingresar</a><br>
	    </td>
</table >
<br>		
<%
String ruta = "inv_online/";
String nomarch = "datos.txt";
String nomarchexcel = "inv_online.xls";
%>
 <table border="1" cellpadding="0" cellspacing="0" align="center">
   <caption> Ultimo Archivo Generado </caption>
    <tr>
      <th> Archivo 
      <th> Opcion
    </tr>
    <tr>
      <td nowrap="nowrap"><%=nomarch %>
      <td nowrap="nowrap"><a href="<%=ruta+nomarch%>"> Descargar </a>           
    </tr>
    <tr>
      <td nowrap="nowrap"><%=nomarchexcel %>
      <td nowrap="nowrap"><a href="<%=ruta+nomarchexcel%>"> Descargar </a>           
    </tr>  
 </table>
 <br>
</html:form>

