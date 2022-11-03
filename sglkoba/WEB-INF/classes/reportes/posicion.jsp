	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<html>

<td>Bodega: <% 
	maestro.control.gstbodega gbod = new maestro.control.gstbodega();
	request.setAttribute("listaBodega", gbod.getlistabodega());
%>
	<html:select property="bodega">
	<html:options collection="listaBodega"  
					property="bodcodsx" labelProperty="bodnombre"/>
	</html:select>
<td>Posicion: 
<html:text property="posicion" size="10" />  
<a href="#" onclick="showmapa(  reportesForm.bodega.options[reportesForm.bodega.selectedIndex].value , 'posicion', 'reportesForm')">Mapa </a>
