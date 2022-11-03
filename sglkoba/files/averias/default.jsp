<html>
<div class="titulo"> Modulo de Recuperaci&oacute;n y Aver&iacute;as</div>
<br>
<br>

<table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabla_listas">
  <tr> 
    <td colspan="4"><br>
      A traves de Este modulo se cuenta con opciones para el registro de RECUPERACION Y AVER&Iacute;AS<br>
      <br>
    </td>
  </tr>
  <tr> 
    <th width="50%">Aver&iacute;as  </th>
    <th width="50%">Recuperaci&oacute;n</th>
  </tr>
  <%
  administracion.control.gstpermiso gper = new administracion.control.gstpermiso();
  String grupo = ((administracion.entity.usuario)session.getAttribute("usuario")).getusugrupo();
%>
  <tr valign="top"> 
    <td>A traves de esta opci&oacute;n usted puede crear aver&iacute;as  <br>
      <br>
      <% if( gper.verIzquierdo(grupo, "averias", "averia_padre.jsp") ) { %>
      <a href="main.jsp?app=averias&modulo=averia_padre">&gt;&gt; Ingresar</a><br>
      <br>
      <% } %>
    </td>
    <td>En las Recuperaciones usted define para una mercanc&iacute;a averiada, las reparaciones que ha tenido y asi nuevamente
    tendra saldo disponible
      <br><br>
      <% if( gper.verIzquierdo(grupo, "averias", "reparacion.jsp") ) { %>
      <a href="main.jsp?app=averias&modulo=reparacion">
      &gt;&gt; Ingresar</a>
      <%} %>
      </td>

</table>
</html>