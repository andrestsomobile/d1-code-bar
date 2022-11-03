	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<td>
	

<%@include file="compania.jsp"%>
Anno(yyyy): 
	<html:select  property="anno">
		<html:option value="2006">2006</html:option>
		<html:option value="2007">2007</html:option>
		<html:option value="2008">2008</html:option>
		<html:option value="2009">2009</html:option>
		<html:option value="2010">2010</html:option>
		<html:option value="2011">2011</html:option>
		<html:option value="2012">2012</html:option>
	</html:select>
	
Mes(MM): <html:select  property="mes">
		<html:option value="01">ENERO</html:option>
		<html:option value="02">FEBRERO</html:option>
		<html:option value="03">MARZO</html:option>
		<html:option value="04">ABRIL</html:option>
		<html:option value="05">MAYO</html:option>
		<html:option value="06">JUNIO</html:option>
		<html:option value="07">JULIO</html:option>
		<html:option value="08">AGOSTO</html:option>
		<html:option value="09">SEPTIEMBRE</html:option>
		<html:option value="10">OCTUBRE</html:option>
		<html:option value="11">NOVIEMBRE</html:option>
		<html:option value="12">DICIEMBRE</html:option>

			</html:select>