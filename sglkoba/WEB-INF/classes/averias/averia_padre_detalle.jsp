<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" 
import ="administracion.control.gstpermiso, averias.form.*, averias.control.*, averias.entity.*,ingreso.control.gstentrada,java.util.*,maestro.control.*,maestro.entity.* " %>  

<html>   
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<%@taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 



<html:form action="averia_padreAction.do" method="post"  > 

<html:hidden property="opcion" value= "creardetalle"/> 
<html:hidden property="codsx" value= "<%=ave_form.getavpcodsx() %>"/>

<%

if (existe && estramite) { 
	gstentrada control_entrada  = new gstentrada();
	Collection listaentradas = null;
	int contador = 0;
	if (ave_form!=null && ave_form.getavpingreso() != null ) {
		listaentradas = control_entrada.getlistaentradaByingresoConSaldoNac(ave_form.getavpingreso());
	}
	request.setAttribute("listaentradas", listaentradas); 
%>
<br>
<table align='center' width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas">
	<tr>
		<th colspan="6"> Referencias asociadas al Ingreso 
		<%if(gstpermiso.getEscritura(session, "averias", "averia_padre.jsp")){ %>
			 <html:submit property="btnApply" value="Crear Detalle de Averias" />
	    <% } %>
	    </th>
	</tr>
	<tr>
		<th> Referencia </th>
		<th> Bodega</th>
		<th> Posicion</th>
		<th> Saldo Nac</th>
		<th> Cant Pleg Nac</th>
		<th> Cant Prod Nac</th>
	 </tr>
	 
	 <logic:iterate id="temp_entrada" name="listaentradas" type="ingreso.entity.entrada">	
	 <input type="hidden" name="entcodsx" value='<%= temp_entrada.getentcodsx() %>'>
	 <tr>
	 	 <td><%= temp_entrada.getentcodproducto() %></td> 	 
	 	 <td><%= temp_entrada.getEntbodega() %></td>
	 	 <td><%= temp_entrada.getentposicion() %></td>
	 	 <td><%= temp_entrada.getentsaldonac() %></td>
	 	 <td><input type="text" name="cantplegnac" size="8"></td>
	 	 <td><input type="text" name="cantprodnac" size="8"></td>
	 </tr>
	 </logic:iterate>
	 
</table>



<% } %> 

</html:form> 		

</html> 