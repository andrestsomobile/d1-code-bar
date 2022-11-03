<html>
<div class="titulo"> Modulo de Maestros</div>
<br>

<table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabla_listas">
  <tr> 
    <td colspan="4"><br>
      Gestione las Variables principales de la aplicacion necesarias para las 
      operaciones del sistema. <br> <br> </td>
  </tr>
  <tr> 
    <th width="25%">Companias</th>
    <th width="25%">Categorias</th>
    <th width="25%">Productos</th>
    <th width="25%">Clientes y Sucursales</th>
  </tr>
  <%
  administracion.control.gstpermiso gper = new administracion.control.gstpermiso();
  String grupo = ((administracion.entity.usuario)session.getAttribute("usuario")).getusugrupo();
%>
  <tr valign="top"> 
    <td>Registre los datos de la compania, tales como telefono, nit, actividad, 
      etc <br> <br> <% if( gper.verIzquierdo(grupo, "maestro", "compania.jsp") ) { %> 
      <a href="main.jsp?app=maestro&modulo=compania">&gt;&gt; 
      Ingresar</a><br> <br> <% } %> </td>
    <td>Categorias para clasificar productos por compania<br> <br> 
	<% if( gper.verIzquierdo(grupo, "maestro", "categoria.jsp") ) { %>
      <a href="main.jsp?app=maestro&modulo=categoria">&gt;&gt; Ingresar</a> 
      <%} %> </td>
    <td>Defina los productos de las companias registradas<br> <br> 
    <% if( gper.verIzquierdo(grupo, "maestro", "producto.jsp") ) { %> 
    <a href="main.jsp?app=maestro&modulo=producto">&gt;&gt; 
      Ingresar</a><br> <% } %> </td>
    <td>Defina sus clientes y las sucursales de los mismos<br> 
      <% if( gper.verIzquierdo(grupo, "maestro", "cliente.jsp") ) { %> 
      <a href="main.jsp?app=maestro&modulo=cliente"><br>
      &gt;&gt; Ingresar</a> <% } %> </td>
  </tr>
  <tr> 
    <th>Ciudades</th>
    <th>Departamentos</th>
    <th>Zonas</th>
    <th>Transportadoras</th>
  </tr>
  <tr valign="top"> 
    <td>Defina las ciudades a las cuales va a despachar su mercancia<br> 
      <br> 
      <% if( gper.verIzquierdo(grupo, "maestro", "ciudad.jsp") ) { %> 
      <a href="main.jsp?app=maestro&modulo=ciudad">&gt;&gt; 
      Ingresar</a><br> <br> <%} %> </td>
    <td>Departamentos a los cuales se despacha mercancia<br>
      <br>
      <% if( gper.verIzquierdo(grupo, "maestro", "departamento.jsp") ) { %> 
      <a href="main.jsp?app=maestro&modulo=departamento">&gt;&gt; Ingresar</a><br>
      <% } %>
      <br>
    </td>
    <td>Agrupaciones de departamentos definidas<br>
      <br>
      <br>
      <% if( gper.verIzquierdo(grupo, "maestro", "zona.jsp") ) { %> 
      <a href="main.jsp?app=maestro&modulo=zona">&gt;&gt; Ingresar </a>
      <%} %>
      </td>
    <td>Empresas con las cuales se maneja el servicio de transporte de mercancia<br>
    <% if( gper.verIzquierdo(grupo, "maestro", "transportadora.jsp") ) { %> 
      <a href="main.jsp?app=maestro&modulo=transportadora">&gt;&gt; Ingresar</a>
      <%} %>
      </td>
  </tr>
  <tr valign="top"> 
    <th>Bodegas</th>
    <th>Empleados</th>
    <th>Fletes</th>
    <th>Causales Devolucion</th>
  </tr>
  <tr valign="top">
    <td>Bodegas en las cuales esta ubicada la compania.<br>
      <% if( gper.verIzquierdo(grupo, "maestro", "bodega.jsp") ) { %> 
      <a href="main.jsp?app=maestro&modulo=bodega">&gt;&gt;Ingresar</a>
      <% } %>
      </td>
    <td>Personal que labora en la compania<br>
      <br>
      <% if( gper.verIzquierdo(grupo, "maestro", "empleado.jsp") ) { %> 
      <a href="main.jsp?app=maestro&modulo=empleado">&gt;&gt; Ingresar </a>
      <% } %>
      </td>
    <td>Defina los valores para fletes entre ciudades<br>
      
      <% if( gper.verIzquierdo(grupo, "maestro", "flete.jsp") ) { %> 
      <a href="main.jsp?app=maestro&modulo=flete">&gt;&gt; Ingresar</a>
      <% } %>
      </td>
    <td>Causales de devolucion registrados
    <br>
      <% if( gper.verIzquierdo(grupo, "maestro", "causal.jsp") ) { %> 
      <a href="main.jsp?app=maestro&modulo=causal">&gt;&gt; Ingresar</a>
      <% } %>
    
    </td>
  </tr>
  
  
   <tr valign="top"> 
    <th>Centro de Costo</th>
    <th>Categoria Oster</th>
    <th>&nbsp;</th>
    <th>&nbsp;</th>
  </tr>
  <tr valign="top">
    <td>Centro de Costo <br>
      <% if( gper.verIzquierdo(grupo, "maestro", "centrocosto.jsp") ) { %> 
      <a href="main.jsp?app=maestro&modulo=centrocosto">&gt;&gt;Ingresar</a>
      <% } %>
    </td>
    <td>Categoria Oster <br>
      <% if( gper.verIzquierdo(grupo, "maestro", "categoria_oster.jsp") ) { %> 
      <a href="main.jsp?app=maestro&modulo=categoria_oster">&gt;&gt;Ingresar</a>
      <% } %>
    </td>    
    <td>&nbsp;      
    </td>  
     <td>&nbsp;      
    </td>  
  </tr>
  
</table>
</html>