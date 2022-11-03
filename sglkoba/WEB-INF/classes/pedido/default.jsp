<html>
<div class="titulo"> Modulo de Salidas de Mercancia </div>
<br>
<br>

<table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabla_listas">
  <%
  administracion.control.gstpermiso gper = new administracion.control.gstpermiso();
  String grupo = ((administracion.entity.usuario)session.getAttribute("usuario")).getusugrupo();
%>



  <tr> 
    <td colspan="4"><br>
      A traves de Este modulo se cuenta con opciones para la descarga y despacho de mercancia<br>
      <br>
    </td>
  </tr>
  <tr> 
    <th width="50%">Pedidos</th>
    <th width="50%">Despachos</th>
  </tr>

  <tr valign="top"> 
    <td>Registre pedidos  <br>
      <br>
      <% if( gper.verIzquierdo(grupo, "pedido", "pedido.jsp") ) { %>
      <a href="main.jsp?app=pedido&modulo=pedido">&gt;&gt; Ingresar</a><br>
      <br>
      <% } %>
    </td>
    <td>Genere los despachos de la mercancia
      <br><br>
      <% if( gper.verIzquierdo(grupo, "pedido", "despacho.jsp") ) { %>
      <a href="main.jsp?app=pedido&modulo=despacho">
      &gt;&gt; Ingresar</a>
      <%} %>
      </td>
</table>
</html>