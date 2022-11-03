 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="nacionalizacion.control.*,java.util.*, maestro.control.*, maestro.entity.*, administracion.control.*, nacionalizacion.entity.*, nacionalizacion.control.*, ingreso.control.*, ingreso.entity.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 
 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>
<%@ taglib  uri="/WEB-INF/hiddenpaneltag.tld" prefix="h" %>

 <%
 	gstbodega gbodega = new gstbodega();
 	gstproducto gprod = new gstproducto();
 	gstentrada gent = new gstentrada();
 	gstnacionalizacion_detalle gnacionalizacion_detalle = new gstnacionalizacion_detalle();
 	gnacionalizacion_detalle.setMaxfilas(10);
 	gstlote_trafico glt = new gstlote_trafico();

 	String param = request.getParameter("param");
 	String pag = request.getParameter("pag");

 	nacionalizacion nac = new gstnacionalizacion().getnacionalizacion(naccodsx);

 	Collection lista = gnacionalizacion_detalle.getlistanacionalizacion_detalle(naccodsx, pag, param);
 	request.setAttribute("lista", lista);
 %> 
 <div class="titulo"> Referencias en la Nacionalizacion </div> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='left'><% if(gstpermiso.getEscritura(session, "nacionalizacion", "nacionalizacion_detalle.jsp") && nac.getNactipo().equals("REFERENCIA") && nac.getnacestado().equals("TRAMITE")) { %>
 	<a href='main.jsp?app=nacionalizacion&modulo=nacionalizacion_detalle_datos&naccodsx=<%= naccodsx %>'> Nacionalizar por Posicion </a> 
 	<% } %>
 	<td align='right'> 	&nbsp;
 	<% if(gstpermiso.getEscritura(session, "nacionalizacion", "nacionalizacion_detalle.jsp") && nac.getNactipo().equals("REFERENCIA") && nac.getnacestado().equals("TRAMITE")) { %>
 	Nacionalizar Cantidad:
 	<form name='cantidad' method="post" action="nacionalizacion_detalleAction.do?opcion=nacionalizar_referencia_cantidad&naccodsx=<%= naccodsx %>" onsubmit="if(this.promodelo.value='') return false; else return true;">
 	<input type="hidden" name="procodsx" >
 	<input type="hidden" name="ingcodsx" value="<%= nac.getnacingreso() %>" >
 	<input type="text" name="promodelo" readonly="true" class="readonly" size="10" >
	<%

				String[] parametros = new String[] { nac.getnacempresa(),nac.getnacingreso(), "NNAC", nac.getnaccodsx(), "0", ""};
				String[] parametros_total = new String[] { nac.getnacempresa(), nac.getnacingreso(), "NNAC", ""};
				String[] campos_form= new String[] {"ingcodsx", "procodsx", "promodelo"};
				String[] campos_pick = new String[] {"Cinco", "Uno", "Dos"};
				String[] campos_entity= new String[] {"Dos", "Tres",  "Cuatro", "Seis" };
				String[] nombres_campos_entity= new String[] { "Material",  "Descripcion", "SaldoSinNac", "EnEstaNacionalizacion" };
				String formulario = "cantidad";
				String metodo = "getlistaproductoConSaldoByIngreso"; 
				String metodoTotal = "getTotalPaginaslistaproductoConSaldoByIngreso";
				%>
				
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="ingreso.control.gstentrada" entidad="util.Listado" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />

<br><input type="text" name="cantidad" size="5"> 	
 	<input type="submit" value="Ok">
 	</form>
 	<% } %>
 	
 	<td align='right'> 	&nbsp;
 	<% if(gstpermiso.getEscritura(session, "nacionalizacion", "nacionalizacion_detalle.jsp") && nac.getNactipo().equals("REFERENCIA") && nac.getnacestado().equals("TRAMITE")) { %>
 	Nacionalizar Toda la referencia:<br>
 	<form name='referencia' method="post" action="nacionalizacion_detalleAction.do?opcion=nacionalizar_referencia&naccodsx=<%= naccodsx %>" onsubmit="if(this.promodelo.value='') return false; else return true;">
 	
 	<input type="hidden" name="ingcodsx" >
 	<input type="hidden" name="procodsx" >
 	<input type="text" name="promodelo" readonly="true" class="readonly" size="10" >
 	
 	
 	<%

 	String[] parametros = new String[] { nac.getnacempresa(),nac.getnacingreso(), "NNAC", nac.getnaccodsx(), "0", ""};
	String[] parametros_total = new String[] { nac.getnacempresa(), nac.getnacingreso(), "NNAC", ""};
	String[] campos_form= new String[] {"ingcodsx", "procodsx", "promodelo"};
	String[] campos_pick = new String[] {"Cinco", "Uno", "Dos"};
	String[] campos_entity= new String[] {"Dos", "Tres",  "Cuatro", "Seis" };
	String[] nombres_campos_entity= new String[] { "Material",  "Descripcion", "SaldoSinNac", "EnEstaNacionalizacion" };
	String formulario = "referencia";
	String metodo = "getlistaproductoConSaldoByIngreso"; 
	String metodoTotal = "getTotalPaginaslistaproductoConSaldoByIngreso";
	%>
				
				<popup:boton clase="ingreso.control.gstentrada" entidad="util.Listado" 
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						metodo_total="<%=metodoTotal %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
 	
 	<input type="submit" value="Ok">
 	
 	<% } %>
 	
 	
 </table> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
<tr>
<td colspan="8" align="right">
<form action="nacionalizacionAction.do?opcion=set&codsx=<%= naccodsx %>" method="post">
<input type="text" name="param" value="<%= param==null ?"": param %>">
<input type="submit" value="buscar">
</form>

 	<tr>  
 <th> Material (*)
 <th> Descripcion (*)
 <th> Bodega
 <th> Posicion (*)
 <th> Lote
 <th> Cantidad Nacionalizada
 <th> Cantidad Disponible
 <th> Reservas
 <th> Averiado
 <th> Opcion	<logic:iterate id="temp" name="lista" type="nacionalizacion_detalle"  >
 <tr align='center'>  
 <% 
 entrada ent = gent.getentrada(temp.getnadentrada());
 producto prod = gprod.getproducto(ent.getentcodproducto()); 
 lote_trafico lt = null;
 if (ent.getentlote() != null) {
	lt = glt.getlote_trafico(ent.getentlote());
 }
 String reservas = gnacionalizacion_detalle.getTotalReservado(temp.getnadcodsx());
 String averiado = gnacionalizacion_detalle.getTotalAveriado(temp.getnadcodsx());
 reservas = reservas !=  null && !reservas.equals("") ? reservas : "0";
 averiado = averiado !=  null && !averiado.equals("") ? averiado : "0";
 %>
<td> <%= prod.getpromodelo()     %>
<td> <%= prod.getprodescripcion() %>
<td> <%= gbodega.getbodega( ent.getEntbodega()).getbodnombre() %>
<td> <%= ent.getentposicion() %>
<td> <%= lt != null ? lt.getLtraflote() : "SIN DEFINIR" %>
<td> <%= temp.getnadcantidad() %>
<td> <%= temp.getNadsaldo() %>
<td> <%= reservas %>
<td> <%= averiado %>
 <td align='center'>&nbsp;
 <%-- if(gstpermiso.getEscritura(session, "nacionalizacion", "nacionalizacion_detalle.jsp")&& nac.getNactipo().equals("REFERENCIA") && nac.getnacestado().equals("TRAMITE") ) { %>
 <a href='nacionalizacion_detalleAction.do?opcion=set&codsx=<%= temp.getnadcodsx()%>'> <img src="./disenno/images/update.gif" border="0" > </a> 			
 <%} %>
 
 &nbsp;| &nbsp; 		
 --%>
 <% if(  (gstpermiso.getEscritura(session, "nacionalizacion", "nacionalizacion_detalle.jsp") && nac.getNactipo().equals("REFERENCIA") && nac.getnacestado().equals("TRAMITE") ) ||  
		  ( gstpermiso.getAdministracion(session, "nacionalizacion", "nacionalizacion_detalle.jsp")  && nac.getNactipo().equals("GLOBAL") && nac.getnacestado().equals("TRAMITE")  )   ) { %>
 <a href="javascript:validarDelete('nacionalizacion_detalleAction.do?opcion=delete&codsx=<%= temp.getnadcodsx()  %>')"> <img src="./disenno/images/substract.gif" border="0" ></a>   
 <% } %>
 </logic:iterate>
  </table> 
  
	 <% 	 String url = "nacionalizacionAction.do?opcion=set&codsx="+ naccodsx + "&param=" + (param==null?"":param); 
 int paginas = gnacionalizacion_detalle.getTotalPaginaslistanacionalizacion_detalle(naccodsx, param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 