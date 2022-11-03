 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   averias.control.*,averias.entity.*,java.util.*,maestro.control.gstproducto"%> 
 <%@page import="maestro.control.gstbodega"%>
<html> 

 <%@  taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%  

 String repcodsx = request.getParameter("repcodsx");
 if(repcodsx.equals("")) {
	 
	 repcodsx = rep_form.getrepcodsx(); 
 }
 gstbodega gbod = new gstbodega();
 gstproducto gpro = new gstproducto();
 reparacion _rep = new gstreparacion().getreparacion(repcodsx);
 
 gstreparacion_detalle greparacion_detalle = new gstreparacion_detalle(); 
  greparacion_detalle.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = greparacion_detalle.getlistareparacion_detalle(repcodsx,  pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gesti&oacute;n de Detalles de Recuperaci&oacute;n</div> 
 <br> 
 <table width='100%' align='center' border='0'> 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "averias", "reparacion_detalle.jsp") ){ %> 

<form action="reparacion_detalleAction.do?opcion=agregar_total&repcodsx=<%= repcodsx %>" name="reparacion_detalleForm" method="post">

Producto:
<input type="text" name="producto" readonly="readonly" class="readonly" size="10">
    <%	
    String[] parametros_cia = new String[] { _rep.getrepcodcia(),  "0", ""};
	String[] parametros_total_cia = new String[] {_rep.getrepcodcia(), ""};
	String[] campos_form_cia= new String[] {"producto" };
	String[] campos_pick_cia = new String[] {"Uno" };
	String[] campos_entity_cia= new String[] {"Uno", "Dos", "Cuatro" , "Cinco", "Seis"};
	String[] nombres_campos_entity_cia= new String[] {"Codigo", "Material" , "Saldo Pleg", "Saldo Prod", "Total"};
	String formulario_cia = "reparacion_detalleForm";  
	
	String metodo_cia = ""; 
	String metodoTotal_cia = "";
	if(_rep.getrepsaldo().equals("NAC"))  {
		metodo_cia = "getListaAveriaSaldoProductoNAC";
		metodoTotal_cia  ="getTotalPaginasListaAveriaSaldoProductoNAC";
	}else {
		metodo_cia = "getListaAveriaSaldoProductoNNAC";
		metodoTotal_cia  ="getTotalPaginasListaAveriaSaldoProductoNNAC";		
	}

	%> <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
	<popup:boton clase="averias.control.gstaveria" entidad="util.Listado" 
			formulario="<%=formulario_cia %>" metodo="<%=metodo_cia %>"
			metodo_total="<%=metodoTotal_cia %>"
			parametros="<%= parametros_cia %>" campos_form="<%= campos_form_cia %>"
			campos_pick="<%= campos_pick_cia %>"
			parametros_total="<%= parametros_total_cia %>" 
			campos_entity="<%= campos_entity_cia %>" nombres_campos_entity="<%= nombres_campos_entity_cia %>" /> 





Cant:
<input type="text" name="cantidad" size="4" >
<input type="submit" value="OK">
</form>

 <% } %> 
 	<td align='right'> 	<form method='post' action='reparacionAction.do?opcion=set&repcodsx=<%= repcodsx %>'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
 <table align='center'  width='90%' border='0' class='tabla_listas' cellspacing='0' cellpading='0'> 
 	<tr>  
 <th> Producto
 <th> Averia
 <th> Cant plegadiza
 <th> Cant producto
 <th> Bodega Origen
 <th> Posicion Origen
 <th> Bodega Destino
 <th> Posicion Destino
 <th> Opcion	<logic:iterate id="temp" name="lista" type="averias.entity.reparacion_detalle"  >
 <tr align='center'>  
 <td nowrap="nowrap">  <%= gpro.getproducto( temp.getrepdproducto()).getpromodelo() %>
 <td>  <%= temp.getrepdaveria() %>
 <td>  <%= temp.getrepdcant_pleg() %>
 <td>  <%= temp.getrepdcant_prod() %>
 <td>  <%= gbod.getbodega( temp.getrepdbodega() ).getbodnombre() %>
 <td>  <%= temp.getrepdposicion() %>

 <td>  <%= gbod.getbodega( temp.getRepdbodega_dest() ).getbodnombre() %>
 <td>  <%= temp.getRepdposicion_dest() %>

 <td> <a href='reparacion_detalleAction.do?opcion=set&repcodsx=<%= temp.getrepdreparacion() %>&codsx=<%= temp.getrepdcodsx()%>'> <img src="./disenno/images/update.gif" border="0" > </a> 			&nbsp;| &nbsp; 
 <%if(gstpermiso.getEscritura(session, "averias", "reparacion_detalle.jsp") && _rep.getrepestado().equals("TRAMITE") ){ %> 
		<a href="javascript:validarDelete('reparacion_detalleAction.do?opcion=delete&repcodsx=<%= temp.getrepdreparacion() %>&codsx=<%= temp.getrepdcodsx()  %>')"> <img src="./disenno/images/substract.gif" border="0" > </a>   
 <% } %> 
 </logic:iterate>
  </table> 
<% 	 //String url = "main.jsp?app=averias&modulo=reparacion_detalle&repcodsx="+repcodsx+"&param="+(param==null?"":param);
	String url = "reparacionAction.do?opcion=set&repcodsx="+repcodsx+"";
 int paginas = greparacion_detalle.getTotalPaginaslistareparacion_detalle(repcodsx,  param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 
 </html>