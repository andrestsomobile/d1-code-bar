<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" %>
	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 
	
<div class="titulo"> Planilla de Despachos </div>

<html:form action="reportesAction.do?tipo=operaciones&reporte=reporte_despachos" method="post" > 
<table >
<%@include file="companias.jsp"%> 
<%@include file="clientes.jsp"%> 
<%@include file="fechas.jsp"%> 
<%@include file="tipo_reporte.jsp"%>   
<tr> <td colspan="8" align="center"><html:submit value="Ver Reporte" />
</table>
</html:form>

