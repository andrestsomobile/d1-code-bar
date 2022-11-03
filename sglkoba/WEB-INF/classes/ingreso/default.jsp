<html>
<div class="titulo"> Modulo de Ingresos de Mercancia </div>
<br>
<br>

<table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabla_listas">
  <tr> 
    <td colspan="4"><br>
      A traves de Este modulo se cuenta con opciones para el registro de ENTRADAS AL INVENTARIO<br>
      <br>
    </td>
  </tr>
  <tr> 
    <th width="33%">Trafico</th>
    <th width="33%">Ingresos</th>
    <th width="33%">Reubicaciones</th>
  </tr>
  <%  
  administracion.control.gstpermiso gper = new administracion.control.gstpermiso();
  String grupo = ((administracion.entity.usuario)session.getAttribute("usuario")).getusugrupo();
%>
  <tr valign="top"> 
    <td>Genere el Preaviso de la mercancia y sus datos documentales, contenedores, referencias etc <br>
      <br>
      <% if( gper.verIzquierdo(grupo, "ingreso", "trafico.jsp") ) { %>
      <a href="main.jsp?app=ingreso&modulo=trafico">&gt;&gt; Ingresar</a><br>
      <br>
      <% } %>
    </td>
    <td>Genere el ingreso a las bodegas y registre sus posiciones detalladas
      <br><br>
      <% if( gper.verIzquierdo(grupo, "ingreso", "ingreso.jsp") ) { %>
      <a href="main.jsp?app=ingreso&modulo=ingreso">
      &gt;&gt; Ingresar</a>
      <%} %>
      </td>
    <td>Cambie entre posiciones un saldo de cualquier mercancia<br>
      <br>
      <% if( gper.verIzquierdo(grupo, "ingreso", "reubicacion.jsp") ) { %>
      <a href="main.jsp?app=ingreso&modulo=reubicacion">&gt;&gt; Ingresar</a><br>
      <% } %>
    </td>
</table>
</html>