
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso, maestro.control.*,maestro.entity.*,java.util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%gstflete gflete = new gstflete();
			gflete.setMaxfilas(10);

			Collection lista = gflete.getlistaflete();
			request.setAttribute("lista", lista);
			gstciudad gciudad = new gstciudad();
			ciudad entciudad;
			String ciudad;
			gsttransportadora gtrans = new gsttransportadora();
			transportadora enttrans;
			String transportadora;
			%>
<div class="titulo">Gestion de fletes</div>
<br>

<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
	<tr>
		<th>Cod Sistema
		<th>Ciudad
		<th>Transportadora
		<logic:iterate id="temp" name="lista"
			type="maestro.entity.flete">
			<tr align='center'>
			<%
			entciudad = gciudad.getciudad(temp.getfleciudad());
			ciudad = entciudad != null ? entciudad.getciunombre() : "";
			enttrans = gtrans.gettransportadora(temp.getfletransportadora());
			transportadora = gtrans != null ? enttrans.gettranspnombre() : "";
			
			%>
				<td><%=temp.getflecodsx()%>
				<td><%=ciudad%>
				<td><%=transportadora%>
		
		</logic:iterate>
</table>
