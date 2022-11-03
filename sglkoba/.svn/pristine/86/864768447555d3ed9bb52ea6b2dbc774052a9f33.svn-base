<html>
<div class="titulo"> Modulo de Administracion</div>
<br>
<br>

<table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabla_listas">
  <tr> 
    <td colspan="4"><br>
      A traves de Este modulo se cuenta con opciones de administracion de la aplicacion, 
      configuracion y datos generales.<br>
      <br>
    </td>
  </tr>
  <tr> 
    <th width="25%">Datos de la Empresa</th>
    <th width="25%">Usuarios</th>
    <th width="25%">Grupos</th>
    <th width="25%">Permisos</th>
  </tr>
  <%
  administracion.control.gstpermiso gper = new administracion.control.gstpermiso();
  String grupo = ((administracion.entity.usuario)session.getAttribute("usuario")).getusugrupo();
%>
  <tr valign="top"> 
    <td>Registre los datos de la compania, tales como telefono, nit, actividad, 
      etc <br>
      <br>
      <% if( gper.verIzquierdo(grupo, "administracion", "empresa.jsp") ) { %>
      <a href="empresaAction.do?opcion=set&codsx=1">&gt;&gt; Ingresar</a><br>
      <br>
      <% } %>
    </td>
    <td>Defina las personas que tendran acceso a la aplicacion, asignando un login 
      y una contrasena<a href="main.jsp?app=administracion&modulo=usuario"><br>
      <br>
      <% if( gper.verIzquierdo(grupo, "administracion", "usuario.jsp") ) { %>
      &gt;&gt; Ingresar</a>
      <%} %>
      </td>
    <td>Cree los &quot;roles&quot; o grupos que accederan a la aplicacion, tales 
      como clientes, usuarios, etc<br>
      <br>
      <% if( gper.verIzquierdo(grupo, "administracion", "grupo.jsp") ) { %>
      <a href="main.jsp?app=administracion&modulo=grupo">&gt;&gt; Ingresar</a><br>
      <% } %>
    </td>
    <td>Defina los permisos de acceso a la aplicacion para un grupo determinado<br>
    <% if( gper.verIzquierdo(grupo, "administracion", "permiso.jsp") ) { %>
      <a href="main.jsp?app=administracion&modulo=permiso"><br>
      &gt;&gt; Ingresar</a>
      <% } %>
      </td>
  </tr>
  <tr> 
    <th>Ajustes</th>
    <th>&nbsp;</th>
    <th>&nbsp;</th>
    <th>&nbsp;</th>
  </tr>
  <tr valign="top">
    <td>Realice operaciones de ajuste a su inventario cuando asi sea requerido<br>
      <br>
      <% if( gper.verIzquierdo(grupo, "administracion", "ajuste.jsp") ) { %>
      <a href="main.jsp?app=administracion&modulo=ajuste">&gt;&gt; Ingresar</a><br>
      
      <br>
      <%} %>
    </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html>