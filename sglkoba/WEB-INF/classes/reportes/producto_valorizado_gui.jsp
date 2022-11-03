<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@page import="maestro.control.gstproducto"%>
<%@page import="java.util.Collection"%>
<%@page import="util.Math"%>
<%@page import="maestro.entity.producto"%>
<%
	String compania = request.getParameter("compania");
	String fecha = request.getParameter("fecha")+" 23:59:59";
	String referencia = request.getParameter("referencia");
	String categoria = request.getParameter("categoria");
	if (referencia.isEmpty()) {
		gstproducto a = new gstproducto();
		Collection lista = a.getlistaproductoCategoria(compania,
				categoria);
		request.setAttribute("lista", lista);
	} else {
		gstproducto gp = new gstproducto();
		producto pro = null;
		pro=gp.getproductoByUk(compania,referencia);
		Collection <producto>lista = new ArrayList();
		lista.add(pro);
		request.setAttribute("lista", lista);
	}
%>

<%@page import="java.util.ArrayList"%>
<STYLE>
 H1.SaltoDePagina
 {
     PAGE-BREAK-AFTER: always
 }
</STYLE>
<div class="TITULO">Consolidado por Producto Valorizado a la fecha <%=fecha%> </div>
<table width="100%" border="1">
	<tr>
		<td width="150px;" rowspan="2" style="background-color:#8FBEE8;">Referencia</td>
		<td width="150px;" rowspan="2" style="background-color:#8FBEE8;">Descripcion</td>
		<td width="100px;" colspan="2" style="background-color:#8FBEE8;">Cantidad</td>
		<td width="100px;" colspan="2" style="background-color:#8FBEE8;">Valores</td>
		<td width="100px;" rowspan="2" style="background-color:#8FBEE8;">Cantidad Total</td>
		<td width="100px;" rowspan="2" style="background-color:#8FBEE8;">Valor Total</td>
	</tr>
	<tr>
		<td style="background-color:#8FBEE8;">NAC</td>
		<td style="background-color:#8FBEE8;">NNAC</td>
		<td style="background-color:#8FBEE8;">NAC</td>
		<td style="background-color:#8FBEE8;">NNAC</td>
	</tr>
		<%
		String total_reporte_can="0";
		String total_reporte_val="0";
		int i=0;
		%>
	<logic:iterate id="temp" name="lista" type="maestro.entity.producto">
		<%
		i++;
		gstproducto gp = new gstproducto();
		String nac = gp.getSaldoProductoNAC(temp.getprocodsx(), fecha,"kardsaldonac");
		String nnac = gp.getSaldoProductoNNAC(temp.getprocodsx(),fecha, "kardsaldonnac");
		float fnac=Float.parseFloat(nac);
		float fnnac=Float.parseFloat(nnac);

		if (fnac != 0 || fnnac !=0) {//solo cuando ambos saldos sean mayor a cero
		String max_ingreso=gp.getMaxingresoTrafico(temp.getprocodsx());
		String valor_cif=gp.getCIFReferenciaProducto(temp.getprocodsx(), max_ingreso);
		
		String val_nac=Math.multiplicar(nac,valor_cif);
		String val_nnac=Math.multiplicar(nnac,valor_cif);
		
		
		String can_total=Math.sumar(nac,nnac);
		String val_total=Math.sumar(val_nac,val_nnac);
		
		total_reporte_can=Math.sumar(can_total,total_reporte_can);
		total_reporte_val=Math.sumar(val_total,total_reporte_val);
		%>
		<tr>
			<td><%=temp.getpromodelo()%></td>
			<td><%=temp.getprodescripcion()%></td>

			<td><%=nac%></td>
			<td><%=nnac%></td>
			<td><%=val_nac%></td>
			<td><%=val_nnac%></td>
			<td><%=can_total%></td>
			<td><%=val_total%></td>
		</tr>
		<%
			}
		%>
		
		<%
		if(i==13){
		%>
		<tr>
		<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>Totales Parciales</td>
			<th><%=total_reporte_can%></td>
			<th><%=total_reporte_val%></td>
		<tr>
		</table>	
		<H1 class=SaltoDePagina> </H1>
		<table width="100%" border="1">
		<tr>
			<td width="150px;" rowspan="2" style="background-color:#8FBEE8;">Referencia</td>
			<td width="150px;" rowspan="2" style="background-color:#8FBEE8;">Descripcion</td>
			<td width="100px;" colspan="2" style="background-color:#8FBEE8;">Cantidad</td>
			<td width="100px;" colspan="2" style="background-color:#8FBEE8;">Valores</td>
			<td width="100px;" rowspan="2" style="background-color:#8FBEE8;">Cantidad Total</td>
			<td width="100px;" rowspan="2" style="background-color:#8FBEE8;">Valor Total</td>
		</tr>
		<tr>
			<td style="background-color:#8FBEE8;">NAC</td>
			<td style="background-color:#8FBEE8;">NNAC</td>
			<td style="background-color:#8FBEE8;">NAC</td>
			<td style="background-color:#8FBEE8;">NNAC</td>
		</tr>
		<%
		i=0;//reinicio
		}
		%>
		
	</logic:iterate>
	<tr>
		<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>Totales</td>
			<th style="font-size: 20"><%=total_reporte_can%></td>
			<th style="font-size: 20"><%=total_reporte_val%></td>
		<tr>
</table>