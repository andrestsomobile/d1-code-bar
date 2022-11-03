
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="administracion.control.gstpermiso, ingreso.control.*,ingreso.entity.*,java.util.*,util.*"%>
<html>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<script type="text/javascript">

function modificarLote(codsx) {
	var ltrafvencimiento = document.getElementById("ltrafvencimiento_"+codsx);
	var ltraflote = document.getElementById("ltraflote_"+codsx);
	if(confirm('Se cambiara el lote y la fecha de vencimiento, esta seguro de realizar estos cambios?')) {
		window.location = "lote_traficoAction.do?opcion=modificarLote&codsx="+codsx+"&nuevafecha="+ltrafvencimiento.value+"&nuevolote="+ltraflote.value;
	}
}
function cambiafiltro(ck) {
	//alert(ck.value);
	if (ck.checked) {
		document.getElementById("filtro").value = 'S';
	} else {
		document.getElementById("filtro").value = 'N';
	}
	document.forms[0].submit();
}
</script>

<%
gstlote_trafico glote_trafico = new gstlote_trafico();
glote_trafico.setMaxfilas(10);  

String param = request.getParameter("param"); 
String pag = request.getParameter("pag");   
String filtro = request.getParameter("filtro");

gsttrafico gtrafico = new gsttrafico();
	
Collection lista = glote_trafico.getlistalote_trafico_vencimiento(pag, param, filtro);
request.setAttribute("lista", lista);

String hoy = Fecha.getFecha();

%>
<div class="titulo">Lotes</div>
<br>

<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 		<td align='right'> 	 
 			<form method='post' action='main.jsp?app=ingreso&modulo=lote_trafico_vencimiento'>
 			    <p> Filtro Vencidos: 
 				<input type="checkbox" id ='filtro' name='filtro' value='<%=filtro==null ? "N" : filtro %>' <%=filtro!=null && filtro.equals("S") ? "checked" : ""%> onchange="cambiafiltro(this)" > 
 				<input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 				<input type='submit' name='buscar' value='Buscar'> 
 			</form> 
 		</td>
 	</Tr>
 </table> 

<table align='center' width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas">
	<tr>
		<th>Material</th>
		<th>Proveedor</th>
		<th>Lote(*)</th>
		<th>Importaci&oacute;n</th>
		<th>Fecha Inicio</th>
		<th>Fecha Vencimiento</th>
		<th>Opci&oacute;n</th>
	    <form name="miforma" action="">
		<logic:iterate id="temp" name="lista" type="lote_trafico">
		    <%
		      trafico traf = null;
		      if (temp != null && temp.getLtrafnumtrafico() != null ) {
		    	  traf = gtrafico.gettrafico(temp.getLtrafnumtrafico());
		      }
		      String estilo_lote = "";
		      boolean vencido = false;
		      if (temp.getLtrafvencimiento() != null) {
		    	  vencido = Fecha.compararfechas(temp.getLtrafvencimiento(),hoy);
		      }
		      if (vencido) {
		      	estilo_lote += " bgcolor= '#FFFF00' ";
		      }

		    %>
			<tr align='center' <%=estilo_lote%>>
				<td nowrap><%=temp.getLtrafproducto()%></td>
				<td><%=temp.getLtrafproveedor()%></td>
				<td ><input type="text" id="ltraflote_<%=temp.getLtrafcodsx()%>" size="15" value = "<%=temp.getLtraflote()%>" /></td>
				<td nowrap><%=traf != null && traf.gettrafnumdta() != null ? traf.gettrafnumdta() : ""%>&nbsp;</td>
				<td nowrap><%=temp.getLtrafelaboracion()!= null ? Fecha.limpiar(temp.getLtrafelaboracion()) : ""%></td>
				<td nowrap><input type="text" id="ltrafvencimiento_<%=temp.getLtrafcodsx()%>" size="10" value = "<%=temp.getLtrafvencimiento() != null ? Fecha.limpiar(temp.getLtrafvencimiento()):"&nbsp;" %>"  />
					<a href="javascript:show_calendar('miforma.ltrafvencimiento_<%=temp.getLtrafcodsx()%>');">
				    <img src="./disenno/images/calendar.gif" class="lupita"> </a>
				</td>
				<td>
					<a href='javascript:modificarLote(<%= temp.getLtrafcodsx()%>)'> 
          			<img src="./disenno/images/mover.png" border="0" width="15" heigth="15" ></a>
				</td>
			</tr>
		</logic:iterate>
		</form>
</table>


<% 	
 String url_no = "lote_traficoAction.do?opcion=modificarLote&param=" + (param==null?"":param)+"&filtro=" + (filtro==null?"":filtro); 
 String url = "main.jsp?app=ingreso&modulo=lote_trafico_vencimiento&param=" + (param==null?"":param)+"&filtro=" + (filtro==null?"N":filtro); 
 int paginas = glote_trafico.getTotalPaginaslistalote_trafico_vencimiento(param,filtro); 
%> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 <br>Los campos con (*) son de busqueda