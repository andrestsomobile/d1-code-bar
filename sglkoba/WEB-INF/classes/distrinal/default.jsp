<html>
<div class="titulo"> Modulo de Distribución Nacional </div>
<br>
<br>

<table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabla_listas">
  <tr> 
    <td colspan="4"><br>
      A traves de este modulo se cuenta con opciones para el registro de ingresos consolidados y despachos a las regionales<br>
      <br>
    </td>
  </tr>
  <tr> 
    <th width="33%">Ingreso Consolidado</th>
    <th width="33%">Despachos a Regionales</th>
  </tr>
  <%  
  administracion.control.gstpermiso gper = new administracion.control.gstpermiso();
  String grupo = ((administracion.entity.usuario)session.getAttribute("usuario")).getusugrupo();
%>
  <tr valign="top"> 
    <td>Registre la información consolidadada de Ingresos para Distribución Nacional  <br>
      <br>
      <% if( gper.verIzquierdo(grupo, "distrinal", "ingreso.jsp") ) { %>
      <a href="main.jsp?app=distrinal&modulo=ingreso">&gt;&gt; Ingresar</a><br>
      <br>
      <% } %>
    </td>
    <td>Genere los despachos a las Regionales
      <br><br>
      <% if( gper.verIzquierdo(grupo, "distrinal", "despacho.jsp") ) { %>
      <a href="main.jsp?app=distrinal&modulo=despacho">
      &gt;&gt; Ingresar</a>
      <%} %>
      </td>

    </td>
</table>
</html>