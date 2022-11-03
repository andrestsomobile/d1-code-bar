<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="administracion.control.*,administracion.entity.*"%>
    
<%
String menuizq = (String)request.getAttribute("menuizq");
if(menuizq==null) {
%> 

<% 
gstpermiso gper = new gstpermiso();
String grupo = ((usuario)session.getAttribute("usuario")).getusugrupo();

String tipo = request.getParameter("tipo");
%>    
<table width="120" border="0" cellspacing="3" cellpadding="3"  class="menuizquierdo">
	<tr> 
		<td > <a href="main.jsp?app=reportes&tipo=operaciones&tipo=operaciones">  Operaciones</a> 
		<% if(tipo!=null && tipo.equals("operaciones"))  { %>
	<tr > <td > 
		<table class="tabla_form" align="center" cellpadding="0" cellspacing="0" border="0">  

<% if( gper.verIzquierdo(grupo, "reportes", "trafico.jsp") ) { %>
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=trafico&tipo=operaciones"> - Trafico</a> 
<% } %>

<% if( gper.verIzquierdo(grupo, "reportes", "ingreso.jsp") ) { %>
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=ingreso&tipo=operaciones"> - Ingresos</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "reportes", "nacionalizaciones.jsp") ) { %>
	<tr> 
		<td > <a href="main.jsp?app=reportes&modulo=nacionalizaciones&tipo=operaciones"> - Nacionalizaciones</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "reportes", "packing.jsp") ) { %>
	<tr> 
		<td > <a href="main.jsp?app=reportes&modulo=packing&tipo=operaciones"> - Packings</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "reportes", "picking.jsp") ) { %>
	<tr> 
		<td > <a href="main.jsp?app=reportes&modulo=picking&tipo=operaciones"> - Pickings</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "reportes", "pedido.jsp") ) { %>
	<tr  > 
		<td > <a href="main.jsp?app=reportes&modulo=pedido&tipo=operaciones">  - Pedidos </a> 
<% } %>


<% if( gper.verIzquierdo(grupo, "reportes", "despachos.jsp") ) { %>
	<tr  > 
		<td > <a href="main.jsp?app=reportes&modulo=despachos&tipo=operaciones">  - Despachos </a> 
<% } %>


<% if( gper.verIzquierdo(grupo, "reportes", "movimientos.jsp") ) { %>
	<tr  > 
		<td > <a href="main.jsp?app=reportes&modulo=movimientos&tipo=operaciones">  - Movimientos</a> 
<% } %>

<% if( gper.verIzquierdo(grupo, "reportes", "devoluciones.jsp") ) { %>
	<tr> 
		<td > <a href="main.jsp?app=reportes&modulo=devoluciones&tipo=operaciones"> - Devoluciones</a> 
<% } %>

<% if( gper.verIzquierdo(grupo, "reportes", "modelos_embarque.jsp") ) { %>
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=modelos_embarque&tipo=operaciones"> - Modelos por Embarque</a> 
<% } %>
<%-- if( gper.verIzquierdo(grupo, "reportes", "planilla_despachos.jsp") ) { %>
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=planilla_despachos_encabezado&tipo=operaciones"> - Planilla de Despachos (Simple)</a> 
<% } --%>

<% if( gper.verIzquierdo(grupo, "reportes", "planilla_despachos.jsp") ) { %>
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=planilla_despachos&tipo=operaciones"> - Planilla de Despachos (Productos)</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "reportes", "reporte_despachos.jsp") ) { %>
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=reporte_despachos&tipo=operaciones"> - Reporte de Despachos (Categorias)</a> 
<% } %>

<% if( gper.verIzquierdo(grupo, "reportes", "ingreso_ajuste.jsp") ) { %>
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=ingreso_ajuste&tipo=operaciones"> - Ajustes ingreso de Mercancia</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "reportes", "averias.jsp") ) { %>
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=averias&tipo=operaciones"> - Averias de Mercancia</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "reportes", "reparaciones.jsp") ) { %>
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=reparaciones&tipo=operaciones"> - Reparaciones de Mercancia</a> 
<% } %>
<% if( gper.verIzquierdo(grupo, "reportes", "auditoria_conexiones.jsp") ) { %>
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=auditoria_conexiones&tipo=operaciones"> - Auditoria de Accesos</a> 
<% } %>


<% if( gper.verIzquierdo(grupo, "reportes", "consolidado_descargas.jsp") ) { %>
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=consolidado_descargas&tipo=operaciones"> - Consolidado de Descargas en bodega</a> 
<% } %>

</table>

<% } %>

		
		
		
	<tr> 
		<td > <a href="main.jsp?app=reportes&tipo=inventarios">  Inventarios</a> 
		<% if(tipo!=null && tipo.equals("inventarios"))  { %>
	<tr > <td > 
		<table class="tabla_form" align="center" cellpadding="0" cellspacing="0" border="0">  
<% if( gper.verIzquierdo(grupo, "reportes", "saldos_referencia.jsp") ) { %>
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=saldos_referencia_simple&tipo=inventarios"> - Saldos por Referencia</a> 
<% } %>


<% if( gper.verIzquierdo(grupo, "reportes", "saldos_referencia.jsp") ) { %>
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=saldos_referencia&tipo=inventarios"> - Saldos por Referencia (posicion)</a> 
<% } %>

<% if( gper.verIzquierdo(grupo, "reportes", "saldos_posicion.jsp") ) { %>
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=saldos_posicion&tipo=inventarios"> - Saldos por Posicion</a> 
<% } %>
		
		<% if( gper.verIzquierdo(grupo, "reportes", "inventario.jsp") ) { %>
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=inventario&tipo=inventarios"> - Inventarios por Empresa </a> 
<% } %>
		<% if( gper.verIzquierdo(grupo, "reportes", "kardex.jsp") ) { %>
<tr> 
		<td > <a href="main.jsp?app=reportes&modulo=kardex&tipo=inventarios"> - Kardex </a> 
<% } %>
		<% if( gper.verIzquierdo(grupo, "reportes", "saldos_embarque.jsp") ) { %>
<tr> 
		<td > <a href="main.jsp?app=reportes&modulo=saldos_embarque&tipo=inventarios"> - Saldos por Embarque/BL </a> 
<% } %>
		<% if( gper.verIzquierdo(grupo, "reportes", "saldo_reservado.jsp") ) { %>
<tr> 
		<td > <a href="main.jsp?app=reportes&modulo=saldo_reservado&tipo=inventarios"> - Saldo Reservado </a> 
<% } %>
		<% if( gper.verIzquierdo(grupo, "reportes", "bodega_producto.jsp") ) { %>
<tr> 
		<td > <a href="main.jsp?app=reportes&modulo=bodega_producto&tipo=inventarios"> - Saldo por Bodega / Producto Consolidado</a> 
<% } %>
		<% if( gper.verIzquierdo(grupo, "reportes", "historico_embarque.jsp") ) { %>
<tr> 
		<td > <a href="main.jsp?app=reportes&modulo=historico_embarque&tipo=inventarios"> - Historico Movimientos por embarque</a> 
<% } %>
		<% if( gper.verIzquierdo(grupo, "reportes", "saldos_averiados.jsp") ) { %>
<tr> 
		<td > <a href="main.jsp?app=reportes&modulo=saldos_averiados&tipo=inventarios"> - Saldos Averiados</a> 
<% } %>
		<% if( gper.verIzquierdo(grupo, "reportes", "saldos_averiados_posicion.jsp") ) { %>
<tr> 
		<td > <a href="main.jsp?app=reportes&modulo=saldos_averiados_posicion&tipo=inventarios"> - Saldos Averiados Por Posicion</a> 
<% } %>
		
		</table>
		
		<% } %>
	<tr> 
		<td > <a href="main.jsp?app=reportes&tipo=indicadores">  Indicadores</a> 		
		<% if(tipo!=null && tipo.equals("indicadores"))  { %>
	<tr > <td > 
		<table class="tabla_form" align="center" cellpadding="0" cellspacing="0" border="0">  
	<% if( gper.verIzquierdo(grupo, "reportes", "indicador_horas_semanas.jsp") ) { %>	
		<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=indicador_horas_semanas&tipo=indicadores"> - Pedidos por Hora /Semana</a> 

	<%  } if( gper.verIzquierdo(grupo, "reportes", "indicador_zonas_valores.jsp") ) { %>	
		<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=indicador_zonas_valores&tipo=indicadores"> - Pedidos por Zona con Valores Totalizados</a> 



	<%  } if( gper.verIzquierdo(grupo, "reportes", "indicador_zonas.jsp") ) { %>	
		<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=indicador_zonas&tipo=indicadores"> - Pedidos por Zona</a> 
	<%  }  if( gper.verIzquierdo(grupo, "reportes", "indicador_pedidos_hit.jsp") ) { %>	
		<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=indicador_pedidos_hit&tipo=indicadores"> - Pedidos HIT</a> 
	<%  }  if( gper.verIzquierdo(grupo, "reportes", "indicador_ingresos_contenedores.jsp") ) { %>		
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=indicador_ingresos_contenedores&tipo=indicadores"> - Contenedores de Ingreso</a> 
	<%  }  if( gper.verIzquierdo(grupo, "reportes", "indicador_ingresos_companias.jsp") ) { %>				
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=indicador_ingresos_companias&tipo=indicadores"> - Ingresos por Empresa</a> 
	<%  }  if( gper.verIzquierdo(grupo, "reportes", "indicador_devoluciones_cliente.jsp") ) { %>				
	<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=indicador_devoluciones_cliente&tipo=indicadores"> - Devoluciones por Cliente</a> 
	<%  }  if( gper.verIzquierdo(grupo, "reportes", "indicador_devoluciones_responsable.jsp") ) { %>					
<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=indicador_devoluciones_responsable&tipo=indicadores"> - Devoluciones por Responsable </a> 
<%  }  if( gper.verIzquierdo(grupo, "reportes", "indicador_devoluciones_causal.jsp") ) { %>					
<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=indicador_devoluciones_causal&tipo=indicadores"> - Devoluciones por Causal por Cliente </a> 
<%  }  if( gper.verIzquierdo(grupo, "reportes", "indicador_devoluciones_causal_compania.jsp") ) { %>					
<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=indicador_devoluciones_causal_compania&tipo=indicadores"> - Devoluciones por Causal por Compania </a> 

<%  }  if( gper.verIzquierdo(grupo, "reportes", "indicador_devoluciones_zona.jsp") ) { %>							
<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=indicador_devoluciones_zona&tipo=indicadores"> - Devoluciones por Causal Zona </a> 
<%  }  if( gper.verIzquierdo(grupo, "reportes", "indicador_pedidos_zonas_valorizados.jsp") ) { %>							
<tr > 
		<td > <a href="main.jsp?app=reportes&modulo=indicador_pedidos_zonas_valorizados&tipo=indicadores"> - Pedidos por  Zona Valorizados</a> 
<%} %>

		</table>
	<% } %>		
		





</table>


		<%} %>