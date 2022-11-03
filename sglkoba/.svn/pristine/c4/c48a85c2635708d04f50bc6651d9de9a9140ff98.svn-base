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
         <td> <input type='text' size="12" name='ped2' style="background-color: ffffff"></td>
         <td> <input type='text' size="12" name='ped3' style="background-color: ffffff"></td>
         <td> <input type='text' size="12" name='ped4' style="background-color: ffffff"></td>
    </tr>
    <tr>
         <td> <input type='text' size="12" name='ped5' style="background-color: ffffff"></td>
         <td> <input type='text' size="12" name='ped6' style="background-color: ffffff"></td>
         <td> <input type='text' size="12" name='ped7' style="background-color: ffffff"></td>
         <td> <input type='text' size="12" name='ped8' style="background-color: ffffff"></td>
    </tr>
    <tr>
         <td> <input type='text' size="12" name='ped9' style="background-color: ffffff"></td>
         <td> <input type='text' size="12" name='ped10' style="background-color: ffffff"></td>
         <td> <input type='text' size="12" name='ped11' style="background-color: ffffff"></td>
         <td> <input type='text' size="12" name='ped12' style="background-color: ffffff"></td>
    </tr>
    <tr>
         <td> <input type='text' size="12" name='ped13' style="background-color: ffffff"></td>
         <td> <input type='text' size="12" name='ped14' style="background-color: ffffff"></td>
         <td> <input type='text' size="12" name='ped15' style="background-color: ffffff"></td>
         <td> <input type='text' size="12" name='ped16' style="background-color: ffffff"></td>
    </tr>
    <tr>
         <td> <input type='text' size="12" name='ped17' style="background-color: ffffff"></td>
         <td> <input type='text' size="12" name='ped18' style="background-color: ffffff"></td>
         <td> <input type='text' size="12" name='ped19' style="background-color: ffffff"></td>
         <td> <input type='text' size="12" name='ped20' style="background-color: ffffff"></td>
    </tr>
</table>
    <br>
    <table align='center'  width='70%' border='0' cellspacing='0' cellpading='0' >
              <tr></tr>
        <input type='submit' name='registrar' value='Registrar'>
    </table>
</form>
    
