 
<%@page import="ingreso.entity.lote_trafico"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="ingreso.control.*,java.util.*, administracion.control.gstpermiso,ingreso.form.ingresoForm, maestro.control.*,maestro.entity.*,util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

<script type="text/javascript">

function modificarPosicion(codsx,ingcod) {
	var entposicion = document.getElementById("entposicion_"+codsx);
	var entbodega = document.getElementById("entbodega_"+codsx);
	if(confirm('Se cambiara la posicion en bodega de esta entrada, esta seguro de realizar estos cambios?')) 
		window.location = "entradaAction.do?opcion=setPosicion&ingcodsx="+ingcod+"&codsx="+codsx+"&nuevapos="+entposicion.value+"&nuevabod="+entbodega.value;
}
</script>
<%   
 
gstentrada gentrada = new gstentrada(); 
gentrada.setMaxfilas(10);  
gstbodega gbod = new maestro.control.gstbodega();
String param = request.getParameter("param"); 
String pag = request.getParameter("pag");   
gstlote_trafico glt = new gstlote_trafico();

Collection lista = gentrada.getlistaentrada( ingcodsx, pag, param); 
request.setAttribute("lista", lista); 
Collection listabod = gbod.getlistaBodegasConConfig();
request.setAttribute("listabod", listabod);
%> 
 <div class="titulo"> Referencias por posicion en el ingreso </div> 
 <br> 
 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='left'>
 	<% 

 	boolean tramite = ingf!=null && ingf.getIngestado()!=null && ingf.getIngestado().equals("TRAMITE") ? true : false;
	boolean escritura = gstpermiso.getEscritura(session, "ingreso", "ingreso_datos.jsp");
	
 	if(  escritura  && tramite ) { %>
 	<a href='main.jsp?app=ingreso&modulo=entrada_datos&ingcodsx=<%= ingcodsx %>'> Nueva Referencia  </a> 
 	<% } %>
 	
 	<td align='right'> 	 <form method='post' action='ingresoAction.do?opcion=set&codsx=<%=ingcodsx %>'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
<table align='center'  width='99%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  
 <th> Material (*)
 <th> Descripcion (*)
 <th> Bodega
 <th> Posicion (*)
 <th> Lote
 <th> Cantidad
 <th> Unidades
 <th> Averiado
 <th> UMP
 <th> Peso B unit KGM
 <th> Peso B Total KGM
 <th> Saldo Peso B 
 <th> Saldo Nac 
 <th> Saldo sin Nac
 <th> Opcion	<logic:iterate id="temp" name="lista" type="entrada"  >
 <tr align='center'>
 <%
 producto prod = new gstproducto().getproducto( temp.getentcodproducto());
 java.math.BigDecimal cant = new java.math.BigDecimal(temp.getentcantidad());
 String cant_averiado = gentrada.getSumaAveriada(temp.getentcodsx());
 //if(cant.compareTo(java.math.BigDecimal.ZERO)!=0) {
lote_trafico lt = null;
if (temp.getentlote() != null) {
	lt = glt.getlote_trafico(temp.getentlote());
}

 %>  
 <td>  <%= prod.getpromodelo() %>
 <td>  <%= prod.getprodescripcion() %>
 <form name="miforma" action="">
 	<td> <select id="entbodega_<%= temp.getentcodsx() %>" <%=(temp != null && !tramite) ? "disabled" : "" %> > 
			  <logic:iterate id="b" name="listabod" type="bodega" >
				<option value="<%=b.getbodcodsx()%>"  <%=b.getbodcodsx().equals(temp.getEntbodega()) ? "selected" : ""%>><%=b.getbodnombre() %> </option>
		      </logic:iterate>
      	 </select>
 	<td nowrap="nowrap">  
 		<% if (temp != null && tramite) { %> 
          <input type="text" id="entposicion_<%= temp.getentcodsx() %>" size='10' value="<%= temp.getentposicion() %>">
          <a href='javascript:modificarPosicion(<%= temp.getentcodsx()%>,<%=ingcodsx%>)'> 
          <img src="./disenno/images/mover.png" border="0" width="15" heigth="15" ></a>
       <%} else {%> 
          <%= temp.getentposicion() %> 
       <%} %>
 </form>       
 <td>  <%= lt != null ? lt.getLtraflote() : "SIN DEFINIR" %>
 <td>  <%= temp.getentcantidad() %>
 <td>  <%= util.Math.multiplicar(prod.getprouniempaque(),temp.getentcantidad()) %>
 <td>  <%= cant_averiado %>
 <td> <%= prod.getProump() %>
 <td>  <%= temp.getentpesobruto() %>
 <td>  <%= temp.getEntpesobrutototal() %>
 <td>  <%= temp.getentsaldopesobruto() %>
 <td>  <%= temp.getentsaldonac() %>
 <td>  <%= temp.getentsaldosinnac() %>

 <td> <a href='entradaAction.do?opcion=set&codsx=<%= temp.getentcodsx()%>&ingcodsx=<%= temp.getentcodingreso() %>'> <img src="./disenno/images/update.gif" border="0" ></a>|
 <% if(gstpermiso.getEscritura(session, "ingreso", "entrada.jsp") && tramite) {%>
<a href="javascript:validarDelete('entradaAction.do?opcion=delete&codsx=<%= temp.getentcodsx()  %>')"><img src="./disenno/images/substract.gif" border="0"></a><%} %>
<% //} %>
 </logic:iterate>
  </table> 
	 <% 	 String url = "ingresoAction.do?opcion=set&codsx="+ingcodsx + "&param=" + (param==null?"":param); 
 int paginas = gentrada.getTotalPaginaslistaentrada(ingcodsx, param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 <br>Los campos con (*) son de busqueda