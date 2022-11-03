	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<%@page import="util.Fecha"%>
<td>
Fecha
<html:text property="fecha" size="10" readonly="true" styleClass="readonly"  value="<%= Fecha.getFechaSinHora() %>"/><html:errors property="fecha"/>
<a href="javascript:show_calendar('reportesForm.fecha');">
<img src="./disenno/images/calendar.gif" id="lupita"></a> 
</td>
