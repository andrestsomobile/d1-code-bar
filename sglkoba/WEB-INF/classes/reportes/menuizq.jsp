<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="administracion.control.*,administracion.entity.*" %>
<%
	String menuizq = (String) request.getAttribute("menuizq");
	if (menuizq == null) {
		gstpermiso gper = new gstpermiso();
		String grupo = ((usuario) session.getAttribute("usuario")).getusugrupo();
		String tipo = request.getParameter("tipo");
%>

<table width="120" border="0" cellspacing="3" cellpadding="3" class="menuizquierdo">
	<tr>
		<td nowrap="nowrap"><a href="main.jsp?app=reportes&amp;tipo=operaciones&amp;tipo=operaciones">Operaciones</a> 
		<% if (tipo != null && tipo.equals("operaciones")) { %>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap">
		<table class="tabla_form" align="center" cellpadding="0" cellspacing="0" border="0">
			<% if (gper.verIzquierdo(grupo, "reportes", "trafico.jsp")) { %>
			<tr>
				<td nowrap="nowrap"><a href="main.jsp?app=reportes&amp;modulo=trafico&amp;tipo=operaciones">- Trafico</a>
			<% } %>
			<% if (gper.verIzquierdo(grupo, "reportes", "ingreso.jsp")) { %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a href="main.jsp?app=reportes&amp;modulo=ingreso&amp;tipo=operaciones">- Ingresos</a>
			<% 	} %> 
			<% 	if (gper.verIzquierdo(grupo, "reportes", "nacionalizaciones.jsp")) { %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a	href="main.jsp?app=reportes&amp;modulo=nacionalizaciones&amp;tipo=operaciones">- Nacionalizaciones</a>
			<% 	} %> 
			<% 	if (gper.verIzquierdo(grupo, "reportes", "packing.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=packing&amp;tipo=operaciones">
				- Packings</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "picking.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=picking&amp;tipo=operaciones">
				- Pickings</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "pedido.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=pedido&amp;tipo=operaciones">
				- Pedidos </a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "despachos.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=despachos&amp;tipo=operaciones">
				- Despachos </a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "movimientos.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=movimientos&amp;tipo=operaciones">
				- Movimientos</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "devoluciones.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=devoluciones&amp;tipo=operaciones">
				- Devoluciones</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "modelos_embarque.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=modelos_embarque&amp;tipo=operaciones">
				- Modelos por Embarque</a> <%
 	}
 %> <%-- if( gper.verIzquierdo(grupo, "reportes", "planilla_despachos.jsp") ) { %>
	<tr > 
		<td nowrap="nowrap"> <a href="main.jsp?app=reportes&modulo=planilla_despachos_encabezado&tipo=operaciones"> - Planilla de Despachos (Simple)</a> 
<% } --%> <%
 	if (gper.verIzquierdo(grupo, "reportes", "planilla_despachos.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=planilla_despachos&amp;tipo=operaciones">
				- Planilla de Despachos (Productos)</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "reporte_despachos.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=reporte_despachos&amp;tipo=operaciones">
				- Reporte de Despachos (Categorias)</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "ingreso_ajuste.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=ingreso_ajuste&amp;tipo=operaciones">
				- Ajustes ingreso de Mercancia</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "averias.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=averias&amp;tipo=operaciones">
				- Averias de Mercancia</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "reparaciones.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=reparaciones&amp;tipo=operaciones">
				- Reparaciones de Mercancia</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "auditoria_conexiones.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=auditoria_conexiones&amp;tipo=operaciones">
				- Auditoria de Accesos</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "auditoria.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=auditoria&amp;tipo=operaciones">
				- Auditoria</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "consolidado_descargas.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=consolidado_descargas&amp;tipo=operaciones">
				- Consolidado de Descargas en bodega</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "reporte_despachos_excel.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=reporte_despachos_excel&amp;tipo=operaciones">
				- Reporte Despachos (Excel)</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "reporte_pedidos_excel.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=reporte_pedidos_excel&amp;tipo=operaciones">
				- Reporte Pedidos (Excel)</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "reporte_pend_nal_excel.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=reporte_pend_nal_excel&amp;tipo=operaciones">
				- Reporte Pendientes por Nacionalizar (Excel)</a> <%
 	}
 %><%
 	if (gper.verIzquierdo(grupo, "reportes", "despachos_sin_notificacion.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=despachos_sin_notificacion&amp;tipo=operaciones">
				- Relacion de Despachos sin Notificacion (Excel)</a> <%
 	}
 %><%
 	if (gper.verIzquierdo(grupo, "reportes", "fletes_pedidos.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=fletes_pedidos&amp;tipo=operaciones">
				- Fletes Pedidos (Excel)</a> <%
 	}
 %><%
 	if (gper.verIzquierdo(grupo, "reportes", "informe_despachos.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=informe_despachos&amp;tipo=operaciones">
				- Informe Despachos</a> <%
 	}
 %><%
 	if (gper.verIzquierdo(grupo, "reportes", "informe_ingresos.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=informe_ingresos&amp;tipo=operaciones">
				- Informe Ingresos</a> <%
 	}
 %><%
 	if (gper.verIzquierdo(grupo, "reportes", "informe_bodvirtuales.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=informe_bodvirtuales&amp;tipo=operaciones">
				- Informe Bodegas Virtuales</a> <%
 	}
 %><%
 	if (gper.verIzquierdo(grupo, "reportes", "informe_tiempos_almacenamiento.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=informe_tiempos_almacenamiento&amp;tipo=operaciones">
				- Informe Tiempos Almacenamiento</a> <%
 	}
 %><%
 	if (gper.verIzquierdo(grupo, "reportes", "movimientos_calidad.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=movimientos_calidad&amp;tipo=operaciones">
				- Movimientos Bodega Calidad</a> <%
 	}
 %><%
 	if (gper.verIzquierdo(grupo, "reportes", "informe_pedidos_pendientes.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=informe_pedidos_pendientes&amp;tipo=operaciones">
				- Informe Pedidos Pendientes de Despacho</a> <%
 	}
 %><%
 	if (gper.verIzquierdo(grupo, "reportes", "informe_tiempos_alistamiento.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=informe_tiempos_alistamiento&amp;tipo=operaciones">
				- Informe Tiempos Alistamiento</a> <%
 	}
 %>
				</td>
			</tr>
		</table>

		<%
			}
		%>
		</td>
	</tr>
	
<% if (grupo != null && !grupo.equals("7")) { %>	
	<tr>
		<td nowrap="nowrap"><a
			href="main.jsp?app=reportes&amp;tipo=inventarios"> Inventarios</a> <%
 	if (tipo != null && tipo.equals("inventarios")) {
 %>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap">
		<table class="tabla_form" align="center" cellpadding="0"
			cellspacing="0" border="0">
			<%
				if (gper.verIzquierdo(grupo, "reportes", "saldos_referencia.jsp")) {
			%>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=saldos_referencia_simple&amp;tipo=inventarios">
				- Saldos por Referencia</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "saldos_referencia.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=saldos_referencia&amp;tipo=inventarios">
				- Saldos por Referencia (posicion)</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "saldos_posicion.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=saldos_posicion&amp;tipo=inventarios">
				- Saldos por Posicion</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "inventario.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=inventario&amp;tipo=inventarios">
				- Inventarios por Empresa </a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "kardex.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=kardex&amp;tipo=inventarios">
				- Kardex </a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "kardex_categoria.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=kardex_categoria&amp;tipo=inventarios">
				- Kardex Diario por Categoria</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "kardex_categoria_descargue.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=kardex_categoria_descargue&amp;tipo=inventarios">
				- Kardex Diario por Categoria(Descargue)</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "saldos_embarque_excel.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=saldos_embarque_excel&amp;tipo=inventarios">
				- Saldos por Embarque/BL (Excel)</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "saldos_embarque_posicion.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=saldos_embarque_posicion&amp;tipo=inventarios">
				- Saldos por Embarque/BL con Posicion </a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "saldo_reservado.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=saldo_reservado&amp;tipo=inventarios">
				- Saldo Reservado </a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "bodega_producto.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=bodega_producto&amp;tipo=inventarios">
				- Saldo por Bodega / Producto Consolidado</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "historico_embarque.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=historico_embarque&amp;tipo=inventarios">
				- Historico Movimientos por embarque</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "saldos_averiados.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=saldos_averiados&amp;tipo=inventarios">
				- Saldos Averiados</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "saldos_averiados_posicion.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=saldos_averiados_posicion&amp;tipo=inventarios">
				- Saldos Averiados Por Posicion</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "inventario_unidades_detallado.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=inventario_unidades_detallado&amp;tipo=inventarios">
				- Inv. de Unidades Detallado</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "inventario_unidades_detallado_excel.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=inventario_unidades_detallado_excel&amp;tipo=inventarios">
				- Inv. de Unidades Detallado(Excel-Kardex)</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "inventario_unidades_detallado_excel_ent.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=inventario_unidades_detallado_excel_ent&amp;tipo=inventarios">
				- Inv. de Unidades Detallado(Excel-Entradas)</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "inventario_unidades_resumen.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=inventario_unidades_resumen&amp;tipo=inventarios">
				- Inv. de Unidades Resumido</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "resumen_saldos_embarque.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=resumen_saldos_embarque&amp;tipo=inventarios">
				- Resumen de Saldos por Embarque</a><br>
				<a
					href="main.jsp?app=reportes&amp;modulo=resumen_saldos_embarque_excel&amp;tipo=inventarios">
				- Resumen de Saldos por Embarque (Excel)</a><br>
				<a
					href="main.jsp?app=reportes&amp;modulo=generaInvOnline&amp;tipo=inventarios">
				- Resumen de Saldos por Embarque (WEB)</a><br>
				<a
					href="main.jsp?app=reportes&amp;modulo=producto_valorizado&amp;tipo=inventarios">
				- Consolidado Por Producto Valorizado</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "generacion_bat.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=generacion_bat&amp;tipo=inventarios">
				- Generacion BAT</a> <%
 	}
 %><%
 	if (gper.verIzquierdo(grupo, "reportes", "inventario_producto_valorizado_excel.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=inventario_producto_valorizado_excel&amp;tipo=inventarios">
				- Consolidado por Producto Valorizado (Excel)</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "resumen_embarque.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=resumen_embarque&amp;tipo=inventarios">
				- Resumen por Embarque</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "reporte_saldo_bl_ref.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=reporte_saldo_bl_ref&amp;tipo=inventarios">
				- Reporte Saldos BL por Referencia</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "reporte_despachos_embaque.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=reporte_despachos_embaque&amp;tipo=inventarios">
				- Reporte de Desapchos BAT por Embarque</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "reporte_kardex_bl.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=reporte_kardex_bl&amp;tipo=inventarios">
				- Kardex por Embarque/BL</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "reporte_inv_chasis.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=reporte_inv_chasis&amp;tipo=inventarios">
				- Inventario de Chasis/Seriales</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "saldos_consolidados.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=saldos_consolidados&amp;tipo=inventarios">
				- Saldos Consolidados (Excel)</a> <%
 	}
 %> <%
	if (gper.verIzquierdo(grupo, "reportes", "inventario_posicion_bodega.jsp")) {
%>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=inventario_posicion_bodega&amp;tipo=inventarios">
				- Inventario Posicion Bodega (Excel)</a> <%
	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "ocupacion_bim.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=ocupacion_bim&amp;tipo=inventarios">
				- Inventario Ocupacion BIM (Excel)</a> <%
 	}
 %> <%
 	if (gper.verIzquierdo(grupo, "reportes", "disnal_inventario.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=disnal_inventario&amp;tipo=inventarios">
				- Inventario Distribución Nacional (Excel)</a> <%
 	}
 %>
				</td>
			</tr>
		</table>

		<%
			}
		%>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><a
			href="main.jsp?app=reportes&amp;tipo=indicadores"> Indicadores</a> <%
 	if (tipo != null && tipo.equals("indicadores")) {
 %>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap">
		<table class="tabla_form" align="center" cellpadding="0"
			cellspacing="0" border="0">
			<%
				if (gper.verIzquierdo(grupo, "reportes", "indicador_horas_semanas.jsp")) {
			%>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=indicador_horas_semanas&amp;tipo=indicadores">
				- Pedidos por Hora /Semana</a> <%
 	}
 			if (gper.verIzquierdo(grupo, "reportes", "indicador_zonas_valores.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=indicador_zonas_valores&amp;tipo=indicadores">
				- Pedidos por Zona con Valores Totalizados</a> <%
 	}
 			if (gper.verIzquierdo(grupo, "reportes", "indicador_zonas.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=indicador_zonas&amp;tipo=indicadores">
				- Pedidos por Zona</a> <%
 	}
 			if (gper.verIzquierdo(grupo, "reportes", "indicador_pedidos_hit.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=indicador_pedidos_hit&amp;tipo=indicadores">
				- Pedidos HIT</a> <%
 	}
 			if (gper.verIzquierdo(grupo, "reportes", "indicador_ingresos_contenedores.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=indicador_ingresos_contenedores&amp;tipo=indicadores">
				- Contenedores de Ingreso</a> <%
 	}
 			if (gper.verIzquierdo(grupo, "reportes", "indicador_ingresos_companias.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=indicador_ingresos_companias&amp;tipo=indicadores">
				- Ingresos por Empresa</a> <%
 	}
 			if (gper.verIzquierdo(grupo, "reportes", "indicador_devoluciones_cliente.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=indicador_devoluciones_cliente&amp;tipo=indicadores">
				- Devoluciones por Cliente</a> <%
 	}
 			if (gper.verIzquierdo(grupo, "reportes", "indicador_devoluciones_responsable.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=indicador_devoluciones_responsable&amp;tipo=indicadores">
				- Devoluciones por Responsable </a> <%
 	}
 			if (gper.verIzquierdo(grupo, "reportes", "indicador_devoluciones_causal.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=indicador_devoluciones_causal&amp;tipo=indicadores">
				- Devoluciones por Causal por Cliente </a> <%
 	}
 			if (gper.verIzquierdo(grupo, "reportes", "indicador_devoluciones_causal_compania.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=indicador_devoluciones_causal_compania&amp;tipo=indicadores">
				- Devoluciones por Causal por Compania </a> <%
 	}
 			if (gper.verIzquierdo(grupo, "reportes", "indicador_devoluciones_zona.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=indicador_devoluciones_zona&amp;tipo=indicadores">
				- Devoluciones por Causal Zona </a> <%
 	}
 			if (gper.verIzquierdo(grupo, "reportes", "indicador_pedidos_zonas_valorizados.jsp")) {
 %>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><a
					href="main.jsp?app=reportes&amp;modulo=indicador_pedidos_zonas_valorizados&amp;tipo=indicadores">
				- Pedidos por Zona Valorizados</a> <%
 	}
 %>





		</table>
		<%
			}
		%>
		</td>
	</tr>
	
	<% } // elimina menus de inventario e indicadores del menu izq %>
</table>


<%
	}
%>