
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso " %>  


<%@page import="averias.entity.reparacion"%>
<%@page import="averias.control.gstreparacion"%>
<%@page import="java.util.Collection"%>
<%@page import="averias.control.gstreparacion_detalle"%>
<%@page import="java.util.Iterator"%>
<%@page import="averias.entity.reparacion_detalle"%>
<%@page import="maestro.control.gstproducto"%>
<%@page import="maestro.entity.producto"%>
<%@page import="util.Math"%>
<%@page import="maestro.control.gstcompania"%>
<html> 

<script type="text/javascript">
function validar() {

var mens ='';

	if( document.pedido_reparacion.numpedido.value=='') mens +='-Debe Escribir el numero del pedido \n';
	if( document.pedido_reparacion.suc.value=='') mens +='-Debe Escribir la sucursal\n';
	if( document.pedido_reparacion.cli.value=='') mens +='-Debe Escribir el cliente\n';

//respuesta
	if(mens!='') {
		alert(mens);
		return false;
	}else 
		return true;

}
</script>
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

		<div class="titulo"> Crear un Pedido con la Reparacion </div> 
		<br> 

	<%
String repcodsx = request.getParameter("repcodsx");
	gstreparacion grep = new gstreparacion();
	gstreparacion_detalle grepd = new gstreparacion_detalle();
	gstcompania gcomp = new gstcompania();
	gstproducto gprod = new gstproducto();
	reparacion rep = grep.getreparacion(repcodsx);
 
	%>	
		<form method="post" action="reparacionAction.do?opcion=crear_pedido" name="pedido_reparacion"  onsubmit="return validar();">
		<input type="hidden" name="repcodsx" value="<%= repcodsx %>">
	<table align="center" border='0' cellpadding='3' cellspacing='0' class='tabla_datos' width='90%'> 
	<tr>
		<td>Reparacion  <td> <%= repcodsx %>
	<tr>
		<td>Empresa <td> <%= rep.getrepcodcia() %> - <%= gcomp.getcompania( rep.getrepcodcia()).getcomnombre() %>

	<tr>
		<td>Numero del Pedido <td> <input type="text" name="numpedido">
	<tr>
		<td>Cliente del Pedido <td> <input type="hidden" name="clicodsx">
		<input type="text" readonly="readonly" class="readonly" name="cli">
		
		   <%	 
			String[] parametros = new String[] {  rep.getrepcodcia(), "0", ""};
			String[] parametros_total = new String[] {rep.getrepcodcia(), ""};
			String[] campos_form= new String[] {"clicodsx", "cli"};
			String[] campos_pick = new String[] {"clicodsx", "clinombre"};
			String[] campos_entity= new String[] {"clinombre", "Clicodigo", "clinit" };
			String[] nombres_campos_entity= new String[] {"Nombre", "Codigo", "NIT"};
			String formulario = "pedido_reparacion";
			String metodo = "getlistaclienteByEmpresa"; 
			String metodoTotal = "getTotalPaginaslistaclienteByEmpresa";
			
			%> <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
			<popup:boton clase="maestro.control.gstcliente" entidad="maestro.entity.cliente" 
					formulario="<%=formulario %>" metodo="<%=metodo %>"
					metodo_total="<%=metodoTotal %>"
					parametros="<%= parametros %>" campos_form="<%= campos_form %>"
					campos_pick="<%= campos_pick %>"
					parametros_total="<%= parametros_total %>" 
					campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" /> 
		
	<tr>
		<td>Sucursal del Pedido <td> <input type="hidden" name="succodsx">
		<input type="text" readonly="readonly" class="readonly" name="suc">
		
		              <% 
				String cliente = "'  +  pedido_reparacion.clicodsx.value    +  '";
				parametros = new String[] {  cliente, "0", ""};
				parametros_total = new String[] {cliente, ""};
				campos_form= new String[] {"succodsx", "suc"};
				campos_pick = new String[] {"succodsx", "sucnombre" };
				campos_entity= new String[] {"Succodigo", "sucnombre", "sucdireccion", "succontacto", "succargo" };
				nombres_campos_entity= new String[] {"Codigo", "Nombre","Direccion", "Ciudad", "Departamento"};
				formulario = "pedido_reparacion";
				metodo = "getlistasucursalByCliente"; 
				metodoTotal = "getTotalPaginaslistasucursalByCliente";
				%> 
				<popup:boton clase="maestro.control.gstsucursal" entidad="maestro.entity.sucursal" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" /> 
		
		
	<tr>
		<td colspan="2">Referencias y sus precios
		<%
		Collection refs = grepd.getlistareparacion_detalle(rep.getrepcodsx());
		Iterator ite = refs.iterator();
		
		while(ite.hasNext()) {
			reparacion_detalle repd = (reparacion_detalle)ite.next();
			
		producto prod = gprod.getproducto( repd.getrepdproducto());
		String cant = Math.sumar( repd.getrepdcant_pleg() , repd.getrepdcant_prod());
		%>
	<tr>
		<td><%= prod.getpromodelo() %>  /<%= prod.getprodescripcion() %> (<%= cant  %> Unidades)
		<td> <input type="text" name="valor" value="0">
		<input type="hidden" name="procodsx" value="<%= prod.getprocodsx() %>">
		<input type="hidden" name="repdcodsx" value="<%= repd.getrepdcodsx() %>">
			<%} %>	
		<tr>
			<td colspan="2" align="center">	
			<input type="submit" value="Crear Pedido">
			
	</table>
		
		
		</form>
		
</html>		