<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso, maestro.control.*" %>
	
	<script>
    function limpiar(){
    document.productoForm.procategoria.value = '';
    document.productoForm.desc.value = '';
	document.productoForm.protipoproducto.value = '';
    document.productoForm.desctipr.value = '';
	document.productoForm.protipoproducto.value = '';
    document.productoForm.desctipr.value = '';
	}
    
    function calcula_vol(campo) { 
    	//alert(campo.value);
    	if (document.productoForm.prolargo.value != null && document.productoForm.proancho.value != null && document.productoForm.proalto.value != null) {
    		campo.value = parseFloat(
    					    parseFloat(
    					      parseFloat(document.productoForm.prolargo.value) * 
    				          parseFloat(document.productoForm.proancho.value) * 
    				          parseFloat(document.productoForm.proalto.value) ) / 1000000 ).toFixed(6);
    		//alert(campo.value);
    	}
    }
	</script> 

<html>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<div class="titulo">Gestion de Datos de un producto</div>
<br>
<html:form action="productoAction.do?app=maestro&modulo=producto_datos"
	method="post">
	<html:hidden property="opcion" />
	<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
	<tr> 
				<td  colspan="2">Defina los datos del producto: empresa, descripcion, categoria, material, material espejo, y demas
				campos requeridos
				<br><br>
		<tr>
			<td>Codigo del sistema
			<td><html:text property="procodsx" readonly="true" styleClass="readonly" />Automatico, Generado por la app
		<tr>
		<%
			gstcompania gcia = new gstcompania();
			request.setAttribute("listaCompania", gcia.getlistacompania());
		%>	
			<td>Codigo de la Compañia
			<td><html:select property="procodigocia" onchange="limpiar()">
					<html:options collection="listaCompania"  
					property="comcodsx" labelProperty="comnombre"   />
				</html:select>* <html:errors
				property="procodigocia" />			
		<tr>
			<td>Descripcion
			<td><html:textarea property="prodescripcion" />* <html:errors
				property="prodescripcion" />
		<tr>
		<%
			gstcategoria gcat = new gstcategoria();
			request.setAttribute("lista", gcat.getlistacategoria());
		%>
			<td>Categoria Producto
			<td>
				<html:hidden property="procategoria"/>
				<%
				maestro.form.productoForm prof =(maestro.form.productoForm)request.getAttribute("productoForm");
				String desc ="";
				if(prof!=null && prof.getprocategoria()!=null) {
					
					desc = new gstcategoria().getcategoria(prof.getprocategoria() ).getcatnombre();
					
				}
				%>
				<input type="text" name="desc" readonly="true" class="readonly" value="<%= desc %>">* <html:errors
				property="procategoria" />
				<%
				
				String[] parametros = new String[] {"'+ productoForm.procodigocia.options[productoForm.procodigocia.selectedIndex].value  + '", "0", ""};
				String[] parametros_total = new String[] {"'+ productoForm.procodigocia.options[productoForm.procodigocia.selectedIndex].value  + '", ""};
				String[] campos_form= new String[] {"procategoria", "desc"};
				String[] campos_pick = new String[] {"catcodsx", "catnombre"};
				String[] campos_entity= new String[] {"catnombre", "catdescripcion"};
				String[] nombres_campos_entity= new String[] {"Nombre", "Descripcion"};
				String formulario = "productoForm";
				String metodo = "getlistacategoria";
				String metodoTotal = "getTotalPaginaslistacategoria";
				%>
				
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstcategoria" entidad="maestro.entity.categoria" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
						

				
				
												
		<tr>
		<%
			gsttipoproducto gtipr = new gsttipoproducto();
			request.setAttribute("listaTipoProducto", gtipr.getlistatipoproducto());
		%>
			<td>Tipo Producto
			<td>
				<html:hidden property="protipoproducto"/>
				<%
				maestro.form.productoForm prof2 =(maestro.form.productoForm)request.getAttribute("productoForm");
				String desctipr ="";
				if(prof2!=null && prof.getprotipoproducto()!=null) {
					
					desctipr = new gsttipoproducto().gettipoproducto(prof2.getprotipoproducto() ).gettiprdescripcion();
					
				}
				%>
				<input type="text" name="desctipr" readonly="true" class="readonly" value="<%= desctipr %>">* <html:errors
				property="protipoproducto" />
				<%
				
				String[] parametros_tipr = new String[] {"'+ productoForm.procodigocia.options[productoForm.procodigocia.selectedIndex].value  + '", "0", ""};
				String[] parametros_total_tipr = new String[] {"'+ productoForm.procodigocia.options[productoForm.procodigocia.selectedIndex].value  + '", ""};
				String[] campos_form_tipr= new String[] {"protipoproducto", "desctipr"};
				String[] campos_pick_tipr = new String[] {"tiprcodsx", "tiprcodigo"};
				String[] campos_entity_tipr= new String[] {"tiprcodigo", "tiprdescripcion"};
				String[] nombres_campos_entity_tipr= new String[] {"Codigo", "Descripcion"};
				String formulario_tipr = "productoForm";
				String metodo_tipr = "getlistatipoproducto";
				String metodoTotal_tipr = "getTotalPaginaslistatipoproducto";
				%>
				
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gsttipoproducto" entidad="maestro.entity.tipoproducto" 
						formulario="<%=formulario_tipr %>" metodo="<%=metodo_tipr %>"
						metodo_total="<%=metodoTotal_tipr %>"
						parametros="<%= parametros_tipr %>" campos_form="<%= campos_form_tipr %>"
						campos_pick="<%= campos_pick_tipr %>"
						parametros_total="<%= parametros_total_tipr %>" 
						campos_entity="<%= campos_entity_tipr %>" nombres_campos_entity="<%= nombres_campos_entity_tipr %>" />	
<tr>
		<%
			gstcategoria_oster gcatoster = new gstcategoria_oster();
			request.setAttribute("lista_oster", gcatoster.getlistacategoria_oster());
		%>
			<td>Clasificacion ABC
			<td>
				<html:hidden property="procatoster"/>
				<%
				maestro.form.productoForm prof_oster =(maestro.form.productoForm)request.getAttribute("productoForm");
				String desc_oster ="";
				if(prof_oster!=null && prof_oster.getProcatoster()!=null && !prof_oster.getProcatoster().equals("") ) {
					
					desc_oster = new gstcategoria_oster().getcategoria_oster(prof_oster.getProcatoster() ).getcatodescripcion();
					
				}
				%>
				<input type="text" name="desc_oster" readonly="true" class="readonly" value="<%= desc_oster %>"> <html:errors
				property="procatoster" />
				<%
				
				parametros = new String[] {"0", ""};
				parametros_total = new String[] { ""};
				campos_form= new String[] {"procatoster", "desc_oster"};
				campos_pick = new String[] {"catocodsx", "catodescripcion"};
				campos_entity= new String[] {"catocodsx", "catodescripcion"};
				nombres_campos_entity= new String[] {"Codigo", "Descripcion"};
				formulario = "productoForm";
				metodo = "getlistacategoria_oster";
				metodoTotal = "getTotalPaginaslistacategoria_oster";
				%>
				
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gstcategoria_oster" entidad="maestro.entity.categoria_oster" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
		<tr>
			<td>Material
			<td><html:text property="promodelo" />* <html:errors
				property="promodelo" />
		<tr>
			<td>Material Espejo
			<td><html:text property="prosubpartida" />* <html:errors
				property="prosubpartida" />
		<tr>
			<td>Ean
			<td>
			<html:select property="proean">
				<html:option value="S">S</html:option>
				<html:option value="N">N</html:option>
			</html:select>
		<tr>
			<td>Codigo de barra
			<td><html:select property="procodbarra">
					<html:option value="S">S</html:option>
					<html:option value="N">N</html:option>
			</html:select>* <html:errors
				property="procodbarra" />
		<tr>
			<td>Codigo de barra
			<td><html:text property="procodigobarra"/>
		<tr>
			<td>Garantia (s/n)
			<td><html:select property="progarantia">
					<html:option value="S">S</html:option>
					<html:option value="N">N</html:option>
			</html:select>
		
		<tr>
			<td>Kilo real
			<td><html:text property="prokiloreal" />KGM*<html:errors
				property="prokiloreal" />
		<tr>
			<td>Medidas 
			<td nowrap="nowrap">Alto: <html:text property="proalto"  /><html:errors property="proalto" />
				Largo:<html:text property="prolargo" /><html:errors property="prolargo" />
				Ancho:<html:text property="proancho" /><html:errors property="proancho" />
		<tr>
			<td>Volumen
			<td><html:text property="provolumen" />M3*<html:errors property="provolumen" />
			<a href="javascript:calcula_vol(document.productoForm.provolumen)"> Recalcular Volumen <a/>
				
		<tr>
			<td>Kilo Volumen
			<td><html:text property="prokilovolumen" readonly="true" styleClass="readonly" />M3*<html:errors
				property="prokilovolumen" />
       <tr>

			<td>UMP
			<% 
				maestro.control.gstunidad guni = new maestro.control.gstunidad();
				request.setAttribute("listaunidades" , guni.getlistaunidad());
				%>
				<td><html:select property="proump">
					 <html:options collection="listaunidades" property="unicod" labelProperty="unidesc" />
				</html:select>
			
		<tr>
			<td>Unidades x Caja
			<td><html:text property="prouniempaque" />UND*<html:errors
				property="prouniempaque" />
		<tr>
			<td>Kv x U emp
			<td><html:text property="prokvuniempaque" readonly="true" styleClass="readonly" />M3*<html:errors
				property="prokvuniempaque" />
		<tr>
			<td>Vol x U emp
			<td><html:text property="provoluniempaque" readonly="true" styleClass="readonly" />M3*<html:errors
				property="provoluniempaque" />
		<tr>
			<td>UMP X Estiba(Pallet)
			<td><html:text property="prounimasterpac" />UND*<html:errors
				property="prounimasterpac" />

	<tr>
		<td>Volumen M Pack
			<td><html:text property="provolmasterpac"  />M3*<html:errors
				property="provolmasterpac" />
		<tr>
			<td>KvMasterpack
			<td><html:text property="prokvmasterpack" readonly="true" styleClass="readonly" />M3*<html:errors
				property="prokvmasterpack" />
					
		<tr>
			<td>PesoBMp
			<td><html:text property="propesobmp"  />KGM*<html:errors
				property="propesobmp" />
		<tr>
			<td>Estado
			<td><html:select property="proestado" > 
				<html:option value="ACTIVO">ACTIVO</html:option>
				<html:option value="INACTIVO">INACTIVO</html:option>
			</html:select>
			*<html:errors property="proestado" />
		<tr>
			<td>Observacion
			<td><html:textarea property="proobservacion"  />
				
		<tr align="center">
			<td colspan="2"><html:submit value="Grabar" disabled='<%= !gstpermiso.getEscritura(session,  "maestro", "producto_datos.jsp") %>' />
			<html:button property="cancelar" onclick="window.location='main.jsp?app=maestro&modulo=producto'" value="Cancelar"/>
	</table>
</html:form>
</html>
