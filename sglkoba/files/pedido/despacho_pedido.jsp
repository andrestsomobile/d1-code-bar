<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*, pedido.form.*,  pedido.control.*,pedido.entity.*,java.util.*"
%> 
 
 <html>
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 
 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>
 

 
 		<script type="text/javascript">

			function valorbultos(codsx,actual,despcodsx) { 
				s=prompt('Digite Bultos',actual);
				if (s != null) {
				  window.location='despacho_pedidoAction.do?opcion=fijar_bultos&despcodsx=' + despcodsx + '&codsx=' + codsx + '&bultos=' + s;
				}
			}
			
			function automatico(cia,desp,tran) { 
				window.location='despacho_pedidoAction.do?opcion=automaticodespacho&cia='+cia+'&despcodsx='+desp+'&transp='+tran;
			}
			
			function abrirHijo(cia,desp,tran) { 
				var foo = window.open('files/pedido/ed_despacho_pedido.jsp?cia='+cia+'&despcodsx='+desp+'&transp='+tran, "popupId", "location=no,menubar=no,titlebar=no,resizable=yes,toolbar=no, menubar=no,width=900,height=500");
			}
			
			
		</script>		
		
		
<div class="titulo"> Gestion de Pedidos en el despacho </div> 
 <br> 
 <%   
 
 maestro.control.gstproducto gprod = new maestro.control.gstproducto();
 gstreferencia_despacho greferencia_despacho = new gstreferencia_despacho(); 
 
  String despcodsx= request.getParameter("despcodsx");
 despacho desp = new gstdespacho().getdespacho(despcodsx);

 despachoForm desp_form = new despachoForm(); 
 
 if(desp==null) {
	 desp_form = (despachoForm)request.getAttribute("despachoForm");
	 desp = new gstdespacho().getdespacho( desp_form.getdespcodsx());
 }else {
 desp_form.llenar( desp);
 }
despcodsx = desp.getdespcodsx();
 
gstpedido gped = new gstpedido();
 gstdespacho_pedido gdespacho_pedido = new gstdespacho_pedido(); 
  gdespacho_pedido.setMaxfilas(2000);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gdespacho_pedido.getlistadespacho_pedido(despcodsx, pag, param); 
 request.setAttribute("lista", lista); 
 String desptransportadora = desp.getdesptransportadora();
  %> 
 
<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "pedido", "despacho_pedido.jsp") && desp_form.getdespestado().equals("TRAMITE") ){ %> 
 Agregar Pedido:
	<html:form action="despacho_pedidoAction.do" method="post" 	 > 
		<html:hidden property="opcion" value="crear"/> 
		<input type="hidden"  name="despcodsx" value="<%= despcodsx %>" />
	<html:text property="despedpedido" styleClass="readonly"  size="5" /> *
	<html:errors property="despedpedido" />
	<html:hidden property="despeddespacho" value="<%= despcodsx %>" /> 
		<%
				String cia = desp_form.getdespempresa();
				
				String[] parametros = new String[] {cia, despcodsx,desptransportadora, "0", ""};
				String[] parametros_total = new String[] {cia, despcodsx, desptransportadora , ""};
				String[] campos_form= new String[] {"despedpedido"};
				String[] campos_pick = new String[] {"pedcodsx"};
				String[] campos_entity= new String[] {"pedcodsx", "pedguia" , "pednumpedido"};
				String[] nombres_campos_entity= new String[] {"Consecutivo", "Guia" , "Numero pedido"};
	
				String metodo  = "getlistapedido_despachar";
				String metodo_total = "getTotalPaginaslistapedido_despachar";
		%>
				 <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
				<popup:boton clase="pedido.control.gstpedido" entidad="pedido" 
						formulario="despacho_pedidoForm" metodo="<%= metodo %>"
						metodo_total="<%= metodo_total %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick %>"
						parametros_total="<%= parametros_total %>" 
						campos_entity="<%= campos_entity %>" nombres_campos_entity="<%= nombres_campos_entity %>" />
Bultos: <html:text property="despedbultos" size="4"/> *
<html:errors property="despedbultos"/>
Bultos Armados: <html:text property="despedbultosarmados" size="4"/>*
<html:errors property="despedbultosarmados"/>
<html:submit value="Agregar" />
<%--  <a href="javascript:window.location='despacho_pedidoAction.do?opcion=automaticodespacho&cia=<%= desp_form.getdespempresa()%>&despcodsx=<%= desp_form.getdespcodsx()%>&transp=<%=desptransportadora%>'"> --%>
<!--     Automatico -->
<!-- </a> -->
<html:button property="auto" value="Agregar Todos" onclick='automatico(document.despacho_pedidoForm.cia.value,document.despacho_pedidoForm.desp.value,document.despacho_pedidoForm.transp.value);'/>
 
<input type='hidden' name='cia' value='<%=desp_form.getdespempresa()%>'/>
<input type='hidden' name='desp' value='<%=desp_form.getdespcodsx()%>'/>
<input type='hidden' name='transp' value='<%=desptransportadora%>'/>
<html:button property="selped" value="Seleccionar Pedidos" onclick='abrirHijo(document.despacho_pedidoForm.cia.value,document.despacho_pedidoForm.desp.value,document.despacho_pedidoForm.transp.value);'/>
	
 </html:form>
 <% } %> 
 	<td align='right'> &nbsp;
 </table> 
 <table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  
 <th>Consec. Pedido
 <th>Numero Guia
 <th>Num. Pedido
 <th>Fecha
 <th>Bultos / Bultos Armados
 <th>Peso N / Peso B KGM
 <th>Referencias
 <th>Opcion	<logic:iterate id="temp" name="lista" type="despacho_pedido"  >
 <tr align='center'>  
<%
pedido ped = gped.getpedido( temp.getdespedpedido());
%>
 <td> <%= ped.getpedcodsx() %>
 <td> <%= ped.getpedguia() %>
 <td> <%= ped.getpednumpedido() %>
 <td> <%= ped.getpedfecha() %>
 <td> <%= temp.getDespedbultos() %> / <%= temp.getDespedbultosarmados() %>
 <%
    if(ped!=null && desp_form.getdespestado().equals("TRAMITE")) {  	
 %>
 <form name='myform_<%=temp.getdespedcodsx() %>'>
  <input type='button' value="Actualizar" onClick='valorbultos(<%=temp.getdespedcodsx() %>,<%= temp.getDespedbultos() %>,<%= desp_form.getdespcodsx()%>)'>
 </form>
<% } %> 

 <td><%= temp.getDespedpesoneto() %> / <%= temp.getDespedpesobruto() %>
<td><Table class="pequeno" cellpadding="0" cellspacing="0" border="1">
	<tr><th>REF <th>Desc <th>Cant 
	<%
	 
	request.setAttribute("refs", greferencia_despacho.getlistareferencia_despacho( temp.getdespedcodsx()) );
	%>
	<logic:iterate id="ref" name="refs" type="referencia_despacho">
	<%
	maestro.entity.producto prod = gprod.getproducto( ref.getrefdproducto());
	%>
		<tr><td><%= prod.getpromodelo() %> <td><%= prod.getprodescripcion() %>
		<td><%= ref.getRefdcant() %>
	</logic:iterate>
</table>
 <td nowrap="nowrap"> 
 <%if(gstpermiso.getEscritura(session, "pedido", "despacho_pedido.jsp")) {
	 
	 if(desp_form.getdespestado().equals("TRAMITE")  ){ %> 
		<a href="javascript:validarDelete('despacho_pedidoAction.do?opcion=delete&codsx=<%= temp.getdespedcodsx()  %>&despcodsx=<%= despcodsx %>')"> <img src="./disenno/images/substract.gif" border="0" ></a>|  
		<% } %>
		<a href="main.jsp?app=pedido&modulo=referencia_despacho&despedcodsx=<%= temp.getdespedcodsx() %>&despcodsx=<%= temp.getdespeddespacho() %>" >
		Referencias		</a>
		   
		
 <% } %> 
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=pedido&modulo=despacho_pedido&param=" + (param==null?"":param) + "&despcodsx=" + despcodsx; 
 int paginas = gdespacho_pedido.getTotalPaginaslistadespacho_pedido(despcodsx,  param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 


 </html> 
 