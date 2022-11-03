 <%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<tiles:insert page="layout.jsp" flush="true">
  <tiles:put name="header" value="/disenno/templates/Movil/header.jsp" />
  <tiles:put name="footer" value="/disenno/templates/Movil/footer.html" />
  <tiles:put name="menu"   value="/disenno/templates/Movil/menu.jsp" />
  <tiles:put name="body"   value="body.jsp" />
</tiles:insert>


	