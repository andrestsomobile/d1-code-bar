<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<%@page import="util.Fecha"%>
<td>
Desde
<html:text property="fecha_ini" size="10" readonly="true" styleClass="readonly"  value="<%= Fecha.getFechaSinHora() %>"/><html:errors property="fecha_ini"/>
<a href="javascript:show_calendar('reportesForm.fecha_ini');">
<img src="./disenno/images/calendar.gif" id="lupita"></a> 
</td>
<td>
Hasta
<html:text property="fecha_fin" size="10" readonly="true" styleClass="readonly" value="<%= Fecha.getFechaSinHora() %>" /><html:errors property="fecha_fin"/>
<a href="javascript:show_calendar('reportesForm.fecha_fin');" ><img src="./disenno/images/calendar.gif" id="lupita"></a> 
</td>