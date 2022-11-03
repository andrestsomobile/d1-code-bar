	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<html>
<TR>
<td colspan="10">Formato: 
<html:select property="tipo_reporte">
	<html:option value="HTML">HTML</html:option>
	<html:option value="PDF">PDF</html:option> 		
	<html:option value="EXCEL">EXCEL</html:option>
</html:select>