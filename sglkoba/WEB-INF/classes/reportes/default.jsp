<html>
<div class="titulo"> Modulo de Reportes</div>
<br>
<br>
<%
  administracion.control.gstpermiso gper = new administracion.control.gstpermiso();
  String grupo = ((administracion.entity.usuario)session.getAttribute("usuario")).getusugrupo();
%>
<% if (grupo != null && !grupo.equals("7")) { %>
<table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabla_listas">
 
  <tr> 
    <th width="50%">Reportes de Operaciones</th>
    <th width="50%">Reportes de Inventarios</th>
  </tr>

  <tr valign="top"> 
    <td>Observe el comportamiento de sus movimientos, despachos y operaciones<br>
      <br>
      
      <a href="main.jsp?app=reportes&tipo=operaciones">&gt;&gt; Ingresar</a><br>
      <br>
    </td>
    <td>Obtenga sus reportes de saldos detallados
      <br><br>
<a href="main.jsp?app=reportes&tipo=inventarios">&gt;&gt; Ingresar</a><br>
      </td>



  <tr> 
    <th width="50%">Indicadores de Gestion</th>
    <th width="50%">Reportes de Facturacion</th>
  </tr>

  <tr valign="top"> 
    <td>Observe como su empresa gestiona sus actividades<br>
      <br>
      <a href="main.jsp?app=reportes&tipo=indicadores">&gt;&gt; Ingresar</a><br>
      <br>
    </td>
    <td>Obtenga sus reportes de Facturacion<br>
      <br>
      <a href="main.jsp?app=reportes&tipo=facturacion">&gt;&gt; Ingresar</a><br>
      <br>
      </td>
</table>
<% 
}
if (grupo != null && grupo.equals("7")) { %>
<table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabla_listas">
 
  <tr> 
    <th width="50%">Reportes de Operaciones</th>

  </tr>

  <tr valign="top"> 
    <td>Observe el comportamiento de sus movimientos, despachos y operaciones<br>
      <br>
      
      <a href="main.jsp?app=reportes&tipo=operaciones">&gt;&gt; Ingresar</a><br>
      <br>
    </td>

</table>
<%} %>
</html>