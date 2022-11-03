<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<html>

<%= request.getParameter("algo") %>
<%= request.getParameter("oculto") %>
<form name="pruebaForm" action="prueba.jsp" method="post"> 
	<select name="algo" onchange="setcia()" id="algo">
		<option value="cia1">cia1</option>
		<option value="cia2">cia2</option>
		<option value="cia3">cia3</option>
	</select>
<input type="hidden" name="oculto" value="" id="oculto">
</form>

<script language="JavaScript" type="text/JavaScript">
function setcia()
	{
	this.document.getElementById('oculto').value='fijado';
	this.document.forms[0].submit();
	}
	</script>

</html>