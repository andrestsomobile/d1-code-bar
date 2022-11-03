 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import =" administracion.control.gstpermiso " %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 
<%
System.out.println("aki ta");
ingreso.control.gstentrada gent = new ingreso.control.gstentrada();
maestro.control.gstproducto gprod = new maestro.control.gstproducto();
maestro.control.gstbodega gbod = new maestro.control.gstbodega();
%>
		<div class="titulo"> Gestion de Datos de un ajuste </div> 
		<br> 
		<html:form action="ajusteAction.do" method="post" > 
		
		<%
		administracion.form.ajusteForm ajf =(administracion.form.ajusteForm) request.getAttribute("ajusteForm");

		%>
		<html:hidden property="opcion"/> 
				<table align="center" border="0" width='90%' cellpadding="3" cellspacing="0" class="tabla_datos"> 
			<tr> 
				<td>Codigo 
				<td><html:text property="ajcodsx" readonly="true" styleClass="readonly"  /> 
			<tr> 
				<td>Compania
				<td><%
				maestro.control.gstcompania gcia = new maestro.control.gstcompania();
				request.setAttribute("listaCompania", gcia.getlistacompania());
				%><html:select property="ajcodcia">
					<html:options collection="listaCompania"  
					property="comcodsx" labelProperty="comnombre"   />
				</html:select>* <html:errors property="ajcodcia" />
				
			<tr> 
				<td>Ingreso
				<td><html:text property="ajingreso" readonly="true" styleClass="readonly" size="5" /> 
				 		<%
				String cia = "'+ ajusteForm.ajcodcia.options[ajusteForm.ajcodcia.selectedIndex].value + '";

				String[] parametros = new String[] {  cia, "FINALIZADO", "0", ""};
				String[] parametros_total = new String[] {cia, "FINALIZADO" , ""};
				String[] campos_form= new String[] {"ajingreso",};
				String[] campos_pick = new String[] {"ingcodsx"};
				String[] campos_entity= new String[] {"ingcodsx", "ingfecha",  "ingtipo" };
				String[] nombres_campos_entity= new String[] {"Consecutivo", "Fecha",  "Tipo" };
				String formulario = "ajusteForm";
				String metodo = "getlistaingresoByCia"; 
				String metodoTotal = "getTotalPaginaslistaingresoByCia";
				%>
				
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="ingreso.control.gstingreso" entidad="ingreso.entity.ingreso" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
				* <html:errors property="ajingreso" />
			<tr> 
				<td>Referencia <br> bodega <br> posicion
				<td><html:hidden property="ajentrada" />
				<% 
				ingreso.entity.entrada ent =null;
				maestro.entity.bodega bod = null;
				maestro.entity.producto prod = null;
				
				if(ajf.getajcodsx()!=null && !ajf.getajcodsx().equals("")) {
						ent = gent.getentrada( ajf.getajentrada());
						bod = gbod.getbodega( ent.getEntbodega());
						prod = gprod.getproducto( ent.getentcodproducto());
				}
				%>
				<input type="text" name="ref" value="<%= prod!=null ? prod.getprodescripcion()  : ""%>" readonly="readonly" class="readonly" ><br>
				<input type="text" name="bod" value="<%= bod!=null ? bod.getbodnombre()  : ""%>" readonly="readonly" class="readonly" ><br>
				<input type="text" name="pos" value="<%= ent!=null ? ent.getentposicion()  : ""%>" readonly="readonly" class="readonly" >
				<%

				parametros = new String[] {  "' + ajusteForm.ajingreso.value   +'",  "0", ""};
				parametros_total = new String[] {"' + ajusteForm.ajingreso.value   +'",  ""};
				campos_form= new String[] {"ajentrada", "ajsaldoant_nac", "ajsaldoant_nnac", "ref", "pos", "bod"};
				campos_pick = new String[] {"entcodsx", "entsaldonac" ,"entsaldosinnac" , "entcodproducto" , "entposicion" , "Entbodega"};
				campos_entity= new String[] { "entcodproducto",  "Entbodega", "entposicion", "entsaldonac" ,"entsaldosinnac" };
				nombres_campos_entity= new String[] { "Producto",  "Bodega" , "posicion", "Saldo Nac" , "Saldo N-NAC" };
				
				String[] campos_foranea = new String[]{"0", "1"};
				String[] tablas_foranea =new String[]{"producto", "bodega"};
				String[] primarias_foranea =new String[]{"procodsx", "bodcodsx"};
				String[] desc_foranea =new String[]{"prodescripcion", "bodnombre"};
				
				formulario = "ajusteForm";
				metodo = "getlistaentrada"; 
				metodoTotal = "getTotalPaginaslistaentrada"; 
		
				%>
				
				
				<popup:boton  clase="ingreso.control.gstentrada" entidad="ingreso.entity.entrada" 
						tablas_foranea="<%= tablas_foranea %>" 
						campos_foranea="<%= campos_foranea %>" 
						primarias_foranea="<%= primarias_foranea %>"
						desc_foranea="<%= desc_foranea %>"
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" 
						 />
				* <html:errors property="ajentrada" />
				
			<tr> 
				<td>Fecha
				<td><html:text property="ajfecha" readonly="true" styleClass="readonly" /> 
			<tr> 
				<td>Saldo Ant Nac
				<td><html:text property="ajsaldoant_nac" readonly="true" styleClass="readonly" /> 
				* <html:errors property="ajsaldoant_nac" />
			<tr> 
				<td>Nuevo Saldo Nac
				<td><html:text property="ajnuevosaldo_nac"  /> 
				* <html:errors property="ajnuevosaldo_nac" />
			<tr> 
				<td>Saldo Ant Sin Nac
				<td><html:text property="ajsaldoant_nnac" readonly="true" styleClass="readonly" /> 
				* <html:errors property="ajsaldoant_nnac" />
			<tr> 
				<td>Nuevo Saldo Nac
				<td><html:text property="ajnuevosaldo_nnac"  /> 
				* <html:errors property="ajnuevosaldo_nnac" />
					<tr> 
				<td>Justificacion
				<td><html:textarea property="ajobservacion"  /> 
				* <html:errors property="ajobservacion" />
						<tr> 
			<td>Estado
				<td>FINALIZADO
					
				
			<tr> 
				<td>
				<td>
				<tr align="center"> 
				<td colspan="2">   
 <%if(gstpermiso.getEscritura(session, "administracion", "ajuste_datos.jsp")&& (ajf.getajcodsx()== null) || 
		 ( ajf.getajcodsx()!= null  && ajf.getajcodsx().equals("")) ){ %> 
<html:submit  value="Grabar"/> 
 <% } %> <html:button  property="cancelar" value="Cancelar" onclick="window.location='main.jsp?app=administracion&modulo=ajuste'" />
		</table> 		</html:form> 		</html> 