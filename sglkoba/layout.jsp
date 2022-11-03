<%@ page language="java"  %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="administracion.control.gstempresa"%>
<%@page import="administracion.entity.empresa"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href='./disenno/templates/Principal/styles.css' rel="stylesheet" type="text/css"  >
	<script type="text/javascript" src="./disenno/javascript/scripts.js" ></script>
	<script type="text/javascript" src="./disenno/javascript/date.js" ></script>

<%
//empresa emp = (empresa)session.getAttribute("empresa");
%>
    <title> SGL :: Sistema de Gestion Logistico  </title>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#FFFFFF" >

 <html:errors property="general"  /> 

<TABLE width="770px" height="550px"border="0" align="center" 
cellpadding="0" cellspacing="0" style="border-left: 1px solid #000000; border-right: 1px solid #000000; border-top: 1px solid #000000; border-bottom: 1px solid #000000;" >
  <TR>
    <TD  valign="top" height="40x"   ><tiles:insert attribute="header" /></TD></TR>
  <TR>
   
    <TD valign="top"><tiles:insert attribute="body" /></TD></TR>
  <TR>
    <TD  valign="top" height="30px"><tiles:insert attribute="footer" />
    </TD>
</TABLE>

</body>
</html>