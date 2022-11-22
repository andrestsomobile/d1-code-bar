<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%
String modulo = request.getParameter("modulo");
if(modulo==null) modulo = "default";
%>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td align="left" width="120"><jsp:include flush="true" page="menuizq.jsp" /></td>
    <td align="left">
    <div id="texto_ppal">
    <jsp:include flush="true" page='<%= modulo + ".jsp"%>' /> </td>
    </div>
  </tr>
</table>



