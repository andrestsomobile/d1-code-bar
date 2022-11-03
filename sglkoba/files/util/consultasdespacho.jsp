<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java"   pageEncoding="ISO-8859-1"  import="java.util.*,util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us" lang="en-us">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<script type="text/javascript" src="./disenno/libconsultas/jquery.js"></script>
<script type="text/javascript" src="./disenno/libconsultas/interface.js"></script>
<script type="text/javascript" src="./disenno/libconsultas/config.js"></script>
<link rel="stylesheet" href="./disenno/libconsultas/portlets.css">

</head>

<div class="titulo"> Consulta de Despachos </div> 

<body>
 
<%
consultadespachos cd = new consultadespachos();
Collection registros = cd.getListaDespachos();
Iterator it = registros.iterator();
try {	
	while (it.hasNext()) {
		Collection datos = (Collection) it.next();
		Iterator data = datos.iterator();
		String despcodsx =  (String) data.next();
		String comnombre =  (String) data.next();
		String despfecha =  (String) data.next();
		//fechafac = Fecha.getDia(fechafac) + "/" +Fecha.getMes(fechafac) + "/" +Fecha.getAnno(fechafac);
		String transpnombre =  (String) data.next();
		String despplaca  =  (String) data.next();
		String desptipoveh =  (String) data.next();
	
	
%>
 
<div id="container">
	
	<div id="header">
		<table align="center" border="0" width='100%' cellpadding="3" cellspacing="0" class="tabla_resumen">
			<tr>
				<td>Consecutivo
				<td><%=despcodsx %>
				<td>Empresa
				<td><%=comnombre %>
			<tr>
				<td>Fecha
				<td><%=despfecha %>
				<td>Empresa Transp
				<td><%=transpnombre %>
			<tr>
				<td>Placa Veh&iacute;culo
				<td><%=despplaca %> Tipo Veh: <%=desptipoveh %>&nbsp;
				<td>Capacidad 
				<td>1000 KV (<a href="consultas/addblocks/index.jsp?capacidad=1000" title="Ver">[ + ]</a>)
	
		</table>
	
		<span id="controls">
			<a href="#" id="all_open" title="Abrir">[ + ]</a>
			<a href="#" id="all_close" title="Cerrar">[ x ]</a>
		</span>
		<a href="#" id="all_expand">Expandir</a> ~
		<a href="#" id="all_collapse">Contraer</a> ~
		<!-- <a href="#" id="all_invert">Invertir</a> -->
	</div><!-- /#header -->
	

	
	<%
	Collection registros_det = cd.getListaPedidos(despcodsx);
	Iterator it_det = registros_det.iterator();
	int contador = 0;
	try {	
		while (it_det.hasNext()) {
			Collection datos_det = (Collection) it_det.next();
			Iterator data_det = datos_det.iterator();
			String pedcodsx =  (String) data_det.next();
			String pednumpedido =  (String) data_det.next();
			String pedguia =  (String) data_det.next();
			String clinombre =  (String) data_det.next();
			String peddireccion  =  (String) data_det.next();
			String ciunombre =  (String) data_det.next();
			String depnombre =  (String) data_det.next();
			String despedpesobruto =  (String) data_det.next();
			String despedbultos =  (String) data_det.next();
			String kv =  (String) data_det.next();
			String empnombre =  (String) data_det.next();
			String rpdeterminado =  (String) data_det.next();
	        contador++;
%>
	<table cellspacing="0" id="columns">
		<tr>
			<td>
				<div class="portlet">
					<div class="portlet_topper">
						<%=contador%>. <a href="#" class="toggle">Consecutivo Pedido <%=pedcodsx %></a>
					</div>
					<div class="portlet_content">							
					
						<table align="center" border="0"  cellpadding="3" cellspacing="0" class="tabla_resumen">
							<tr>
								<th rowspan=2>No. Pedido
								<th rowspan=2>Gu&iacute;a
								<th rowspan=2>Cliente
								<th rowspan=2>Direcci&oacute;n
								<th rowspan=2>Ciudad
								<th rowspan=2>Departamento
								<th colspan="2" align="center">Alistamiento
								<th rowspan=2>Peso
								<th rowspan=2>Bultos
								<th rowspan=2>Kilo Volumen  
								<th rowspan=2>Estado  
							</th>
							<tr>
								<th>Listo</th>
								<th>Empleado</th>							
							</tr>
							<tr>
								<td><%=pednumpedido %>
								<td><%=pedguia %>
								<td><%=clinombre %>
								<td><%=peddireccion %>
								<td><%=ciunombre %>
								<td><%=depnombre %>
								<td><%=rpdeterminado %>
								<td><%=empnombre %>
								<td align="right"><%=despedpesobruto %>
								<td align="right"><%=despedbultos %>
								<td align="right"><%=kv %>
								<td>PENDIENTE
							</tr>
						</table>
					</div>
				</div>
			</td>
		</tr>
	</table><!-- /#columns -->
		<%
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		%>

	
</div><!-- /#container -->

<%
	}
} catch (Exception ex) {
	ex.printStackTrace();
}
%>

</body>
</html>














