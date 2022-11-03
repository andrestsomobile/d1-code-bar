	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<html>
<TR>
<td colspan="10">Zona: 
<html:select property="zona">
	<html:option value="TODOS">TODAS</html:option>
	 <% 
 maestro.control.gstzona gzon= new maestro.control.gstzona();
 request.setAttribute("listaZona", gzon.getlistazona()); 
 %>
 	 <html:options collection="listaZona"  
					property="zoncodsx" labelProperty="zonnombre"   /> 
 		

</html:select>