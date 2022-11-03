 <%@page import="ingreso.entity.lote_trafico"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="ingreso.control.*,ingreso.entity.*,java.util.*, administracion.control.gstpermiso,ingreso.form.ingresoForm, maestro.control.*,maestro.entity.*, registro.control.*, registro.entity.*, registro.action.*, registro.form.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

<script type="text/javascript">
//alert("param " + param);
function reubicarPosicion(codsx,tipo,param,pag) {
	var entposicion = document.getElementById("entposicion_"+codsx);
	var entqty = document.getElementById("entqty_"+codsx);
	var entbodega = document.getElementById("entbodega_"+codsx);
	window.location = "reubicacionAction.do?opcion=reubicacion_movil&reentradaor="+codsx+"&tipo_movil="+tipo+"&nuevapos="+entposicion.value+"&nuevabod="+entbodega.value+"&recantidad="+entqty.value+"&param_movil="+param+"&pag_movil="+pag;
}

</script>
<%   
gstentrada gentrada = new gstentrada(); 
gsttrafico gtraf = new gsttrafico();
gentrada.setMaxfilas(10);  
gstbodega gbod = new gstbodega();
String tipo_movil = (String)request.getAttribute("tipo_movil");
String param_movil = (String)request.getAttribute("param_movil");
String pag_movil = (String)request.getAttribute("pag_movil");
String tipo = tipo_movil != null && !tipo_movil.equals("") && !tipo_movil.equals("null") ? tipo_movil : request.getParameter("tipo"); 
String param = param_movil != null && !param_movil.equals("") && !param_movil.equals("null") ? param_movil : request.getParameter("param"); 
String pag = pag_movil != null && !pag_movil.equals("") && !pag_movil.equals("null") ? pag_movil : request.getParameter("pag");   
gstlote_trafico glt = new gstlote_trafico();

Collection lista = gentrada.getlistaentrada_reubicacion_movil(pag, param, tipo); 
request.setAttribute("lista", lista); 
boolean tramite =  true ;
boolean escritura = gstpermiso.getEscritura(session, "movil", "reubicacion.jsp");
String ingcodsx= "1";
Collection listabod = gbod.getlistaBodegasConConfig();
request.setAttribute("listabod", listabod); 

registro_almacenamientoForm regAlmForm = (registro_almacenamientoForm)session.getAttribute("registro_almacenamientoForm");

%> 
 <div class="titulo"> Reubicaci&oacute;n por Cantidad </div> 
 <br> 
<h4>Realizando Acci&oacute;n: <%=regAlmForm != null ? regAlmForm.getRealaccion()  + ". Inicio: " + regAlmForm.getRealfecha() + " " + regAlmForm.getRealhoin():""%> </h4>
 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='center'>
 	 	<form method='post' action='main_movil.jsp?app=movil&modulo=reubicacion'> 	 	
 		<select name="tipo" > 
 			<option value="NACIONALIZADO" <%= tipo != null && tipo.equals("NACIONALIZADO") ? "selected" : ""%>>NACIONALIZADO</option> 
      		<option value="NO NACIONALIZADO" <%= tipo != null && tipo.equals("NO NACIONALIZADO") ? "selected" : ""%>>NO NACIONALIZADO</option> 
      	</select>
  		 <input type='text' name='param' value='<%=param==null ? "" : param %>' style="background-color: white;color:black" onkeyup="javascript:this.value=this.value.toUpperCase();"> 
		 <input type='submit' name='buscar' value='Buscar' style="background-color: white;color:black"> 
		</form> 
 </table> 
<table align='center' width='99%' border='1' cellspacing='0' cellpading='0' class=""> 
 	<tr>  
	 <th> Material(*)
	 <th> Descripcion
	 <th> Importacion(*)
	 <th> Lote(*)
	 <th> Vencimiento
	 <th> Cantidad
	 <th> UMP
	 <th> Saldo
	 <th> Cantidad a Reubicar
	 <th> Bodega
	 <th> Posicion(*)
	 
 
 <logic:iterate id="temp" name="lista" type="entrada" >
 <tr align='center'>
 <%
 producto prod = new gstproducto().getproducto( temp.getentcodproducto());
 trafico traf = null;
 lote_trafico lt = null;
if (temp.getentlote() != null) {
	lt = glt.getlote_trafico(temp.getentlote());
	 traf = gtraf.gettrafico(lt.getLtrafnumtrafico());
}

 %>  
 <td>  <%= prod.getpromodelo() %>
 <td>  <%= prod.getprodescripcion() %>      
 <td>  <%= traf != null && traf.gettrafnumdta() != null ? traf.gettrafnumdta() : "SIN DEFINIR" %>
 <td>  <%= lt != null && lt.getLtraflote() != null ? lt.getLtraflote() : "SIN DEFINIR" %>
 <td>  <%= lt != null && lt.getLtrafvencimiento() != null ? lt.getLtrafvencimiento() : "SIN DEFINIR" %>
 <td>  <%= temp.getentcantidad() %>
 <td>  <%= prod.getProump() %>
 <td>  <%= tipo != null && tipo.equals("NACIONALIZADO") ? temp.getentsaldonac() : temp.getentsaldosinnac() %>
 <form name="miforma" action="">	 
	 <td nowrap="nowrap">
	 		  <input type="text"  id="entqty_<%= temp.getentcodsx() %>" size='10' value="<%= tipo != null && tipo.equals("NACIONALIZADO") ? temp.getentsaldonac() : temp.getentsaldosinnac() %>" style="background-color: white;color:black">
	 <td> <select id="entbodega_<%= temp.getentcodsx() %>" > 
			  <logic:iterate id="b" name="listabod" type="bodega" >
				<option value="<%=b.getbodcodsx()%>"  <%=b.getbodcodsx().equals(temp.getEntbodega()) ? "selected" : ""%>><%=b.getbodnombre() %> </option>
		      </logic:iterate>
      	   </select>
	
	 <td nowrap="nowrap">
	          <input type="text" onkeyup="javascript:this.value=this.value.toUpperCase();" id="entposicion_<%= temp.getentcodsx() %>" size='10' value="<%= temp.getentposicion() %>" style="background-color: white;color:black" >
	          <a href="javascript:reubicarPosicion(<%= temp.getentcodsx()%>,'<%=tipo%>','<%=param%>','<%=pag%>')"> 
	          	<img src="./disenno/images/mover.png" border="0" width="15" heigth="15" >
	          </a>
 </form>


 </logic:iterate>
  </table> 
	 <% 
	 String url = "main_movil.jsp?app=movil&modulo=reubicacion"+ "&param=" + (param==null?"":param)+ "&tipo=" + (tipo==null?"NACIONALIZADO":tipo); 
 int paginas = gentrada.getTotallistaentrada_reubicacion_movil(param,tipo); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 <br>Los campos con (*) son de busqueda