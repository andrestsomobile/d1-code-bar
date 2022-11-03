	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<html>
<TR>
<td colspan="10">Causal: 
<html:select property="causal_devolucion">
	<html:option value="TODOS">TODOS</html:option>
	 <% 
 maestro.control.gstcausal gcaus = new maestro.control.gstcausal();
 request.setAttribute("listaCausal", gcaus.getlistacausal()); 
 %>
 	 <html:options collection="listaCausal"  
					property="caucodsx" labelProperty="caudesc"   /> 
 		

</html:select>