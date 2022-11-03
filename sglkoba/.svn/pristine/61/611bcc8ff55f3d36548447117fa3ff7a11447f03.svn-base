package reportes.util;

import java.io.File;
import java.math.BigDecimal;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import maestro.control.gstdepartamento;
import maestro.control.gstproducto;
import maestro.entity.producto;
import nacionalizacion.control.gstnacionalizacion;

import pedido.control.gestionSaldos;
import pedido.control.gstdespacho;
import pedido.control.gstpacking;
import pedido.control.gstpedido;
import pedido.control.gstpicking;

import averias.control.gstreparacion;

import reportes.form.reportesForm;

public class saldo_reservado extends Command {

	public void execute(String ruta, HttpServletRequest request,
			reportesForm repfor) {

		
		
		String cad_params = getCadParams(repfor);	
		HashMap parametros = new HashMap();
		parametros.put("cad_params", cad_params);
		
		//ahora saco el reporte:
		
		File reporte = new File(  ruta + "reporte_saldo_reservado.jasper");
		
		parametros.put("SUBREPORT_DIR", ruta );
		//saco los totales y los pongo:
		 gstproducto gprod = new gstproducto();
		gstnacionalizacion gnac = new gstnacionalizacion();
		gstpacking gpack = new gstpacking();
		gstpicking gpick = new gstpicking();
		gstpedido gped = new gstpedido();
		gstdespacho gdesp = new gstdespacho();
		
		producto prod = gprod.getproductoByUk(repfor.getCompania(), repfor.getReferencia());
		String procodsx = prod==null ?null : prod.getprocodsx();
				
		BigDecimal reservado_nac = gnac.getSaldoReservadoNacionalizacion( procodsx);
		BigDecimal reservado_packing =gpack.getSaldoReservadoPacking(procodsx);
		BigDecimal reservado_picking =gpick.getSaldoReservadoPicking(procodsx);
		BigDecimal reservado_pedido_nac =gped.getSaldoReservadoPedido(procodsx, "NAC");
		BigDecimal reservado_pedido_nnac =gped.getSaldoReservadoPedido(procodsx, "NNAC");
		BigDecimal reservado_despacho_nac = gdesp.getSaldoReservadoDespacho(procodsx, "NAC");
		BigDecimal reservado_despacho_nnac = gdesp.getSaldoReservadoDespacho(procodsx, "NNAC");
		
		BigDecimal total_nac = util.Math.sumar_bigdecimal( reservado_packing, reservado_picking, reservado_pedido_nac , reservado_despacho_nac);
		BigDecimal total_nnac = util.Math.sumar_bigdecimal(reservado_nac, reservado_pedido_nnac , reservado_despacho_nnac);
		
		parametros.put("reservado_nac", reservado_nac);
		parametros.put("reservado_packing", reservado_packing);
		parametros.put("reservado_picking", reservado_picking);
		parametros.put("reservado_pedido_nac", reservado_pedido_nac);
		parametros.put("reservado_pedido_nnac", reservado_pedido_nnac);
		parametros.put("reservado_despacho_nac", reservado_despacho_nac);
		parametros.put("reservado_despacho_nnac", reservado_despacho_nnac);
		parametros.put("total_nac", total_nac);
		parametros.put("total_nnac", total_nnac);
		
		parametros.put( "sql", " select * from reporte_saldo_reservado where comcodsx= "+ repfor.getCompania() + " and procodsx = " + procodsx);
		
		request.setAttribute("parametros", parametros);
		request.setAttribute("reporte", reporte);
	
	}

}
