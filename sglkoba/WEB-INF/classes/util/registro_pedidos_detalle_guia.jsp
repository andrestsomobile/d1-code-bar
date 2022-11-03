<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,maestro.control.*,maestro.entity.*,registro.control.*,registro.entity.*,java.util.*"%>
<html>

<script type="text/javascript">
window.onload = function() {
  document.pedidosFrm.ped1.focus();
}
</script>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<% 
registro_pedidoForm regf = (registro_pedidoForm)request.getAttribute("registro_pedidoForm");
%>
<div class="titulo">Registro de Pedidos</div>

<br>
 <%@ include file="registro_pedido_head.jsp" %>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" onload="sf()">
<form action="registro_pedido_detalleAction.do?app=util&modulo=registro_pedidos_1&codsx=<%= regf.getrepecodsx()%>" name="pedidosFrm" method='post'>
<table align='center'  width='70%' border='0' cellspacing='0' cellpading='0' >
    <tr>
        <td colspan="5" align='center'><b> PEDIDOS PARA ALISTAR </b> </td>
    </tr>
    <br>
    <tr>
         <td> <input type='text' size="12" name='ped1' style="background-color: ffffff"></td>
         
    </tr>
                    
</table>
    <br>
    <table align='center'  width='70%' border='0' cellspacing='0' cellpading='0' >
              <tr></tr>
        <input type='submit' name='registrar' value='Registrar'>
    </table>
</form>
    
