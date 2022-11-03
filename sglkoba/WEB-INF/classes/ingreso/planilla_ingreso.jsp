<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso,clientesvarios.control.*, maestro.control.*, java.util.*,util.Fecha"%>
<html>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<% 
clientesvarios.form.entradacvForm entity =(clientesvarios.form.entradacvForm)request.getAttribute("entradacvForm");
boolean estramite = entity==null || entity.getecvcodsx() == null || entity.getecvcodsx().isEmpty() || (entity.getecvestado() != null && entity.getecvestado().equals("TRAMITE"));

StringTokenizer stk;
String[] _precintos = null;
if (entity !=null && entity.getecvprecintos() != null) {
	stk = new StringTokenizer(entity.getecvprecintos(), ",{}[]");
	_precintos = new String[stk.countTokens()];
	int i = 0;
	while (stk.hasMoreElements()) {
		_precintos[i++] = stk.nextToken().trim();
	}
}
%>

<body>
<html:form action="entradacvAction.do?app=clientesvarios&modulo=planilla_ingreso" method="post">
<html:hidden property="opcion"/> 
	<div id="wrap" >
        

	<h2 align="center">SISTEMAS LOGISTICOS INDUSTRIALES S.A.S</h2>
	<h2 align="center">NIT 90007306-5 </h2>

	<table width='680px' border='0' cellspacing='0' cellpading='0'>
		
		<table width='680px' border='1' cellspacing='0' cellpading='0'>
			<tr><td colspan="100%" align="center" >PLANILLA UNICA DE INGRESO Y SALIDA DE MERCANCIA</td></tr>
		</table>
		
		<br>
		    
		<table width='680px' border='1' cellspacing='0' cellpading='0'>
		
			<tr><td>Planilla No.</td> 
				<td colspan="5"><html:text property="ecvcodsx" size="8" readonly="true" styleClass="readonly" /></td>
			</tr>
			<tr><td width="20%">Fecha</td>
				<%if (entity == null || (entity != null && entity.getecvcodsx() != null)){ %>
				<td width="30%"><html:text property="ecvfecha" readonly="true" styleClass="readonly" /> *<html:errors property="ecvfecha"/>
      				<a href="javascript:show_calendar('entradacvForm.ecvfecha');"><img src="./disenno/images/calendar.gif" class="lupita"> </a>
				</td>
				<%} else { %>
				<td  width="30%"><html:text property="ecvfecha" readonly="true" styleClass="readonly" /> *<html:errors property="ecvfecha"/></td>
				<%}%>
				<td width="15%">Ingreso</td><td width="10%" align="center">X</td><td width="15%">Salida</td><td  width="10%">&nbsp;</td>
			</tr>
					
			<tr><td width="20%">Cliente</td>
					<td width="80%"  colspan="5">
					<html:hidden property="ecvcodcia" />
					<html:text property="comnombre" readonly="true" styleClass="readonly" size="50"/>
					* <html:errors property="ecvcodcia"  /> 
					<% 
		           	String[] parametros = new String[] {"0", ""};
		           	String[] parametros_total = new String[] {""};
		           	String[] campos_form= new String[] {"ecvcodcia","comnombre"};
		           	String[] campos_pick = new String[] {"comcodsx", "comnombre"};
		           	String[] campos_entity= new String[] {"comcodsx", "comnombre"};
		           	String[] nombres_campos_entity= new String[] {"Codigo","Nombre"};
		           	String formulario = "entradacvForm";
		           	String metodo = "getlistacompania"; 
		           	String metodoTotal = "getTotalPaginaslistacompania";
				   	%> 
					<%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
					<popup:boton clase="maestro.control.gstcompania" entidad="maestro.entity.compania" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
					</td>
				</tr>
				
			
			<tr>
				<td>Origen</td><td colspan="5" ><html:text property="ecvorigen" size="80" /></td>
			</tr>
			<tr>
				<td>Estado</td>
				<td colspan="1" >
    			<% if(entity==null || entity.getecvcodsx() == null || entity.getecvcodsx().isEmpty()) {%> 
     			<html:text property="ecvestado" value="TRAMITE" readonly="true" styleClass="readonly" size="10" /> 
      			<% } else if(entity!=null && entity.getecvestado() != null && entity.getecvestado().equals("FINALIZADO")) {%> 
      			<html:text property="ecvestado" value="FINALIZADO"  readonly="true" styleClass="readonly" size="10"/> 
      			<% } else { %> 
      			<html:select property="ecvestado"  > 
      			<html:option value="TRAMITE">TRAMITE</html:option> 
      			<html:option value="FINALIZADO"> FINALIZADO</html:option> 
     			</html:select> 
     			<% } %> 
      			<% if(gstpermiso.getAdministracion(session, "clientesvarios", "planilla_ingreso.jsp") && (estramite==false) ){ %>
     				<a href="entradacvAction.do?opcion=activar&ecvcodsx=<%=entity.getecvcodsx() %>"> Activar </a> 
      			<%} %>
      			<td colspan="4" align="center">
      			<% if(entity !=null ) {  %>
    			<a href="main.jsp?app=clientesvarios&modulo=subirAdjuntoIngreso&clave=<%=entity.getecvcodsx()%>">Cargar Documentos Ingreso </a>
    			<% } %> 
			</tr>
 
		</table>
		
		<br>
		
		<table width='680px' border='1' cellspacing='0' cellpading='0'>
			<tr><td colspan="100%" align="center" >INFORMACION GENERAL</td></tr>
		</table>
		
		<br>
		
		<table width='680px' border='1' cellspacing='0' cellpading='0'>						

			<tr> 
				<td width="12%">Servicio Montacargas</td><td width="13%"><html:text property="ecvservmontacargas"  size="30" /></td>
				<td width="12%">Hora Inicial</td><td width="13%"><html:text property="ecvservmchoraini" size="10" value='<%= entity==null ? "00:00" : entity.getecvservmchoraini()%>'/></td>
				<td width="12%">Hora Final</td><td width="13%"><html:text property="ecvservmchorafin" size="10" value='<%= entity==null ? "00:00" : entity.getecvservmchorafin()%>'/></td>
				<td width="12%">Total Horas</td><td width="13%"><html:text property="ecvmontacargashoras" size="10" readonly="true" styleClass="readonly"/></td>*<html:errors property="ecvmontacargashoras"/></td>
			</tr>
			
		</table>
		
		<br>
		
		<table width='680px' border='1' cellspacing='0' cellpading='0'>	
				
			<tr><td>Auxiliar Bodega</td>
				<td><html:text property="ecvauxbodega" size="30"/> </td>
				<td>Braceros</td><td><html:text property="ecvbraceros" size="30"/></td>
			</tr>
			
		</table>
		
		<br>
		
		<table width='680px' border='1' cellspacing='0' cellpading='0'>	
				
			<tr>
				<td width="20%">Transportadora</td>
				<td width="80%">
				<html:hidden property="ecvcodtransportadora" />
				<html:text property="transpnombre" readonly="true" styleClass="readonly" size="50" />
				* <html:errors property="ecvcodtransportadora"  /> 
				<% 
	           	parametros = new String[] {  "0", ""};
	           	parametros_total = new String[] {""};
	           	campos_form= new String[] {"ecvcodtransportadora","transpnombre"};
	           	campos_pick = new String[] {"transpcodsx", "transpnombre"};
	           	campos_entity= new String[] {"transpcodsx", "transpnombre"};
	           	nombres_campos_entity= new String[] {"Codigo","Nombre"};
	           	formulario = "entradacvForm";
	           	metodo = "getlistatransportadora"; 
	           	metodoTotal = "getTotalPaginaslistatransportadora";
			   	%> 
				<%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="maestro.control.gsttransportadora" entidad="maestro.entity.transportadora" 
					formulario="<%=formulario %>" metodo="<%=metodo %>"
					metodo_total="<%=metodoTotal %>"
					parametros="<%= parametros %>" campos_form="<%= campos_form %>"
					campos_pick="<%= campos_pick %>"
					parametros_total="<%= parametros_total %>" 
					campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
				</td>

				<td>Placa</td><td><html:text property="ecvplaca" size="15"/></td>
			</tr>
			
			<tr>
				<td>Conductor</td><td><html:text property="ecvconductor" size="50" /></td>
				<td>Cedula</td><td><html:text property="ecvcedcondutor" size="15"/></td>
			</tr>
				
		</table>
		
		<br>
		
		<table width='680px' border='1' cellspacing='0' cellpading='0'>	
						
			<tr>
				<td rowspan="3" colspan="2">Tipo Vehiculo</td>
				<td><html:text property="tipovehiculo1_1" size="10" styleClass="readonly" value="40"/></td>
				<td><html:text property="tipovehiculo1_2" size="10" /></td>
				<td><html:text property="tipovehiculo2_1" size="10" styleClass="readonly" value="SENCILLO"/></td>
				<td><html:text property="tipovehiculo2_2" size="10" /></td>
			</tr>
			<tr>
				<td rowspan="1"><html:text property="tipovehiculo3_1" size="10" styleClass="readonly" value="20"/></td>
				<td><html:text property="tipovehiculo3_2" size="10" /></td>
				<td><html:text property="tipovehiculo4_1" size="10" styleClass="readonly" value="TURBO"/></td>
				<td><html:text property="tipovehiculo4_2" size="10" /></td>
			</tr>
			<tr>
				<td rowspan="1">Otro Cual?</td>
				<td><html:text property="tipovehiculo5_1" size="10" /></td>
				<td>Cuantos</td>
				<td><html:text property="tipovehiculo5_2" size="10" /></td>
			</tr>			
			<tr>
				<td width="12%">Total Vehiculos</td><td width="13%"><html:text property="ecvcantvehiculo" size="10"/>*<html:errors property="ecvcantvehiculo"/></td>
			</tr>		
		</table>
		
		<br>
		
		<table width='680px' border='1' cellspacing='0' cellpading='0'>	
					
			<tr><td >Precintos</td>
				<td>No.</td><td><html:text property="ecvprecintos" value='<%=_precintos != null ? _precintos[0] : "" %>'/>&nbsp;</td>
				<td>No.</td><td><html:text property="ecvprecintos" value='<%=_precintos != null ? _precintos[1] : "" %>'/>&nbsp;</td>
				<td>No.</td><td><html:text property="ecvprecintos" value='<%=_precintos != null ? _precintos[2] : "" %>'/>&nbsp;</td>
			</tr>
			
		</table>
		
		<br>

		
		<table width='680px' border='1' cellspacing='0' cellpading='0'>	
							
			<tr>
				<td rowspan="1" colspan="8"  align="center">Documento de Transporte</td>
				<td rowspan="2">FMM</td>
				<td rowspan="2">Descripcion</td>
				<td rowspan="2" nowrap="nowrap">Cantidad (ud.)</td>
				<td rowspan="2">Bultos</td>
				<td rowspan="2">Peso Neto</td>
				<td rowspan="2">Peso Bruto</td>
			</tr>
			<tr>
				<td rowspan="1" width="5%" >BL</td><td width="5%"><html:radio property="ecvtipodocumento" value="BL"/></td>
				<td width="5%">GA</td><td width="5%"><html:radio property="ecvtipodocumento" value="GA"/></td>
				<td width="5%">RM</td><td width="5%"><html:radio property="ecvtipodocumento" value="RM" /></td>
				<td width="5%">CP</td><td width="5%"><html:radio property="ecvtipodocumento" value="CP" /></td>*<html:errors property="ecvtipodocumento"  />
			</tr>
			<tr>			
				<td colspan="8"><html:text property="ecvdocumento" size="20"/> *<html:errors property="ecvdocumento"/> </td>
				<td><html:text property="ecvfmmzf" size="8" /></td>
				<td><html:text property="ecvdescripcionmcia" size="20"/></td>
				<td><html:text property="ecvcantidad" size="7"/>*<html:errors property="ecvcantidad"  /></td>
				<td nowrap="nowrap"><html:text property="ecvbultos" size="7"/>*<html:errors property="ecvbultos"  /></td>
				<td nowrap="nowrap"><html:text property="ecvpesoneto" size="7"/>*<html:errors property="ecvpesoneto"  /></td>
				<td nowrap="nowrap"><html:text property="ecvpesobrutozf" size="7"/>*<html:errors property="ecvpesobrutozf"  /></td>
			</tr>

			<tr>
				<%if (entity != null){ %>
				<td colspan="8" align="center">T O T A L</td>
				<td><%=entity.getecvcantidad() %></td>
				<td nowrap="nowrap"><%=entity.getecvbultos() %></td>
				<td nowrap="nowrap"><%=entity.getecvpesoneto() %></td>
				<td nowrap="nowrap"><%=entity.getecvpesobrutozf() %></td>
				<%} else { %>
				<td colspan="8" align="center">T O T A L</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<%}%>
			</tr>

		</table>
		
		
		<br>	
		
		<table width='680px' border='1' cellspacing='0' cellpading='0'>	
							
			<tr>
				<td>Vlr. CIF</td>
				<td>Vlr. FOB</td>
				<td>Vlr. Fletes</td>
				<td>Vlr. Seguros</td>
				<td>Vlr. Otros</td>
				<td>Vlr. Servicio</td>
			</tr>

			<tr>			
				<td nowrap="nowrap"><html:text property="ecvvalorcif" size="8" /> *<html:errors property="ecvvalorcif" /></td>
				<td nowrap="nowrap"><html:text property="ecvvalorfob" size="8" /> *<html:errors property="ecvvalorfob" /></td>
				<td nowrap="nowrap"><html:text property="ecvvalorfletes" size="8" /> *<html:errors property="ecvvalorfletes" /></td>
				<td nowrap="nowrap"><html:text property="ecvvalorseguros" size="8" /> *<html:errors property="ecvvalorseguros" /></td>
				<td nowrap="nowrap"><html:text property="ecvvalorotros" size="8" /> *<html:errors property="ecvvalorotros" /></td>
				<td nowrap="nowrap"><html:text property="ecvvalorservicio" size="8" /> *<html:errors property="ecvvalorservicio" /></td>
			</tr>
			
		</table>
		
		<br>
		
		<table width='680px' border='0' cellspacing='0' cellpading='0'>
			<tr><td>Observaciones </td></tr>
			<tr><td><html:textarea property="ecvobservacion"  rows="3" cols="90"/></td></tr>
		</table>		
		
		<br>
		
		<table width='680px' border='1' cellspacing='0' cellpading='0'>
			<tr><td colspan="100%" align="center" >INFORMACION DE OCUPACION</td></tr>
		</table>
		
		<br>		

		<table width='680px' border='1' cellspacing='0' cellpading='0'>	
				
			<tr>
				<td>Bodega</td><td><html:text property="ecvbodega" size="10" /> *<html:errors property="ecvbodega" /></td>
				<td>Pallets</td><td><html:text property="ecvpallets" size="10" /> *<html:errors property="ecvpallets" /></td>
				<td>Posiciones</td><td><html:text property="ecvposiciones" size="10" /> *<html:errors property="ecvposiciones" /></td>
				<td>Area</td><td><html:text property="ecvocupacionm2" size="10" /> *<html:errors property="ecvocupacionm2" /></td>
			</tr>
			<tr>
				<td>Ubicacion</td><td colspan="7" ><html:text property="ecvubicacion" size="60" /> *<html:errors property="ecvubicacion" /></td>
			<tr>
		</table>
				
		
		<br> <br> 
		
			
		
	</div>
	<table width='680px' border='0' cellspacing='0' cellpading='0'>
	<tr align="center"> 
    <td> 
	    <% 
		boolean escritura = gstpermiso.getEscritura(session, "clientesvarios", "planilla_ingreso.jsp") && estramite;
	    if (escritura ) { %> 
	    	<html:submit  value="Grabar" /> 
	    <% } else {%> 
	    	<html:submit value="Grabar" disabled="true" /> 
	    <%}%> 
    	<html:button property="algo" value="Cancelar" onclick="window.location='main.jsp?app=clientesvarios&modulo=datos_planilla'" />
	</td>
	</tr>
	</table>	
		
	<br> <br>
	     	 
</html:form> 
</body>
</html>