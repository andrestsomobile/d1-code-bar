<%@ page language="java" 
    pageEncoding="ISO-8859-1"  import="administracion.control.*, administracion.entity.*"%>
    


<%@page import="auditoria.control.gstauditoria_conexiones"%>
<span class="principal" >


<%
//registro en la auditoria donde entro:
gstauditoria_conexiones.registrarAcceso(request);

String app = request.getParameter("app");
String pagina = "files/" + app + "/"+  (  "index.jsp"  );
if(app==null) {
%>
<%@include file="default.jsp" %>
<%	
}else {
%>
<jsp:include page="<%=pagina%>" flush="true"/>
<% }  %>

</span>
