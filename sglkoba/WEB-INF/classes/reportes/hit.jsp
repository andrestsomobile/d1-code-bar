	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<td>
	

Causal HIT: 
<html:select property="hit">
	<html:option value="TODOS">TODOS</html:option>
	 <% 
 maestro.control.gstcausal_hit gcaus = new maestro.control.gstcausal_hit();
 request.setAttribute("listaCausal", gcaus.getlistacausal_hit()); 
 %>
 	 <html:options collection="listaCausal"  
					property="cauhcodsx" labelProperty="cauhdesc"   /> 
 		

</html:select>
