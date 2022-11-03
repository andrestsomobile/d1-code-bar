<html>
<div class="titulo"> Modulo de Ayudas</div>
<br>
<br>

<table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabla_listas">
  <tr> 
    <td colspan="4"><br>
      A traves de Este modulo se cuenta con Manuales de Usuario y un FAQ para aclarar dudas en el uso de la aplicacion<br>
      <br>
    </td>
  </tr>
  <tr> 
    <th width="50%">Descargar el Manual</th>
    <th width="50%">Preguntas Frecuentes</th>
  </tr>
<%
  administracion.control.gstpermiso gper = new administracion.control.gstpermiso();
  String grupo = ((administracion.entity.usuario)session.getAttribute("usuario")).getusugrupo();
%>
  <tr valign="top"> 
    <td>Descargue el manual de usuario <br>
      <br>
      <% if( gper.verIzquierdo(grupo, "ayuda", "manuales.jsp") ) { %>
      <a href="main.jsp?app=ayuda&modulo=manuales">Ver</a><br>
      <br>
      <% } %>
    </td>
    <td>Entrar al FAQ
      <br>
      <% if( gper.verIzquierdo(grupo, "ayuda", "faq.jsp") ) { %>
 <a href="main.jsp?app=ayuda&modulo=faq">Ver</a><br>
      <%} %>
      </td>

  </tr>


</table>
</html>