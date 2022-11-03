
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import="nacionalizacion.control.*, nacionalizacion.entity.*, administracion.control.*, nacionalizacion.form.*,ingreso.entity.*, ingreso.control.*" %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

<script type="text/javascript">
	function verificarCantidad() {
	if(nacionalizacion_detalleForm.nadcantidad.value=='') {
		alert('Debe ingresar la cantidad');
		return false;
	}
		if( parseFloat(  nacionalizacion_detalleForm.nadcantidad.value )> parseFloat( nacionalizacion_detalleForm.saldosinnac.value )) {
			alert('No puede nacionalizar mas de '+ nacionalizacion_detalleForm.saldosinnac.value );
			nacionalizacion_detalleForm.nadcantidad.value = '';
		return false;
		}
		return true;
	}
</script>
		<div class="titulo"> Referencias en la Nacionalizacion </div> 
		<br> 
		<% 
		nacionalizacion_detalleForm nacform = (nacionalizacion_detalleForm)request.getAttribute("nacionalizacion_detalleForm");
		
		String naccodsx = nacform==null || (nacform!=null && nacform.equals("")) ? request.getParameter("naccodsx") : nacform.getnadcodnac();
		String nadcodsx = nacform==null || (nacform!=null && nacform.equals("")) ? request.getParameter("nadcodsx") : nacform.getnadcodsx();
		
		gstnacionalizacion gnac = new gstnacionalizacion();
		gstnacionalizacion_detalle gnacdet = new gstnacionalizacion_detalle();
		gstentrada gent = new gstentrada();
		
		nacionalizacion nac = gnac.getnacionalizacion(naccodsx);
		nacionalizacion_detalle nacdet = nadcodsx ==null ? null : gnacdet.getnacionalizacion_detalle( nadcodsx );
		
			
		entrada ent = nacdet ==null ? null : gent.getentrada(nacdet.getnadentrada());
		%>
		<html:form action="nacionalizacion_detalleAction.do?app=nacionalizacion&modulo=nacionalizacion_detalle_datos" method="post" onsubmit="return verificarCantidad()" > 
		<html:hidden property="opcion"/> 
		<html:hidden property="nadcodnac" value="<%= naccodsx %>"/>
		
<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
			<tr> 
				<td>Consecutivo
				<td><html:text property="nadcodsx" readonly="true" styleClass="readonly"  /> 
				<html:hidden property="nadcodnac"  /> 
			<tr> 
				<td>Referencia
				<td><html:hidden property="nadentrada" /> 
				<input type="text" name="modelo" value="" readonly="true" class="readonly">
				<%
				String cia = nac.getnacempresa();

				String[] parametros = new String[] {  nac.getnacingreso(), "0", ""};
				String[] parametros_total = new String[] {nac.getnacingreso(), ""};
				String[] campos_form= new String[] {"nadentrada", "modelo","bodega","posicion", "saldosinnac" , "saldosinnac"};
				String[] campos_pick = new String[] {"entcodsx", "entcodingreso","Entbodega","entposicion", "entsaldosinnac" , "entsaldosinnac" };
				String[] campos_entity= new String[] {"entcodsx", "entcodingreso",  "entcodproducto" , "Entbodega", "entposicion" , "entsaldosinnac"};
				String[] nombres_campos_entity= new String[] {"Consecutivo", "Material",  "Descripcion", "Bodega" , "Posicion", "Saldo Sin Nac"};
				String formulario = "nacionalizacion_detalleForm";
				String metodo = "getlistaentradaByingreso_sinnac";
				String metodoTotal = "getTotalPaginaslistaentradaByingreso_sinnac";
				%>
				
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="ingreso.control.gstentrada" entidad="ingreso.entity.entrada" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
*<html:errors property="nadentrada"  /> (Solo las registradas en el Ingreso)				
			<tr> 
				<td>Bodega
				<td><input type="text" name="bodega" readonly="true" class="readonly"  /> 

			<tr> 
				<td>Posicion
				<td><input type="text" name="posicion" readonly="true" class="readonly"  /> 
			<tr> 
				<td>Saldo Sin Nac
				<td><input type="text" name="saldosinnac" readonly="true" class="readonly" > 
			<tr> 
				<td>Cantidad a Nacionalizar
				<td><html:text property="nadcantidad"   /> 
				*<html:errors property="nadcantidad"  />
				<tr align="center"> 
				<td colspan="2">
				<%
				boolean disabled= true;
				if(gstpermiso.getEscritura(session, "nacionalizacion", "nacionalizacion_detalle_datos.jsp") && nac.getnacestado().equals("TRAMITE") ) 
					disabled = false; 
					%>
				<html:submit  value="Grabar" disabled="<%= disabled %>"/> 
				&nbsp;
				
		</table> 		</html:form> 		</html> 