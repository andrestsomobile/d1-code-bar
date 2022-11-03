package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class inventario_unidades_detallado extends Command {

	public void execute(String ruta, HttpServletRequest request,
			reportesForm repfor) {
		String cad_params = getCadParams( repfor);
		System.out.println("********"+cad_params+"********");
		HashMap parametros = new HashMap();
		
		parametros.put("cad_params", cad_params);
		
		//ahora saco el reporte:
		
		
		
		File reporte = new File(  ruta + "inventario_unidades_detallado.jasper");
///////////////////////////////////
		//String sql = "select public.compania.comcodsx,public.compania.comnombre,public.categoria.catnombre,public.producto.promodelo,public.producto.prodescripcion,(SELECT kardsaldonac from fc_get_kardsaldonac(public.producto.procodsx,'" + repfor.getFecha() + "')) AS saldo_ant_nac,(SELECT kardsaldonnac from fc_get_kardsaldonac(public.producto.procodsx,'"+ repfor.getFecha() + "')) AS saldo_ant_nnac,(SELECT avesaldo_pleg_nac from fc_get_kardsaldonac(public.producto.procodsx,'"+ repfor.getFecha() + "')) AS avesaldo_pleg_nac,(SELECT avecant_prod_nac  from fc_get_kardsaldonac(public.producto.procodsx,'"+ repfor.getFecha() + "')) AS avecant_prod_nac,(SELECT kardsaldonac + kardsaldonnac from fc_get_kardsaldonac(public.producto.procodsx,'"+ repfor.getFecha() + "')) AS total from public.producto, public.categoria, public.compania where comcodsx = " + repfor.getCompania() + " and catcodsx= " + repfor.getCategoria() + "  and procodigocia = " + repfor.getCompania() + " and  procategoria=" + repfor.getCategoria() + " order by catnombre";
		//actual//
		//String sql = "select public.compania.comcodsx,public.compania.comnombre,public.categoria.catnombre,public.producto.promodelo,public.producto.prodescripcion,(SELECT (CASE WHEN  kardsaldonac IS NULL THEN 0 ELSE kardsaldonac END) from fc_get_kardsaldonac(public.producto.procodsx,'" + repfor.getFecha() + "')) AS saldo_ant_nac,(SELECT (CASE WHEN  kardsaldonnac IS NULL THEN 0 ELSE kardsaldonnac END) from fc_get_kardsaldonac(public.producto.procodsx,'"+ repfor.getFecha() + "')) AS saldo_ant_nnac,(SELECT (CASE WHEN  avesaldo_pleg_nac IS NULL THEN 0 ELSE avesaldo_pleg_nac END) from fc_get_kardsaldonac(public.producto.procodsx,'"+ repfor.getFecha() + "')) AS avesaldo_pleg_nac,(SELECT (CASE WHEN  avecant_prod_nac IS NULL THEN 0 ELSE avecant_prod_nac END) from fc_get_kardsaldonac(public.producto.procodsx,'"+ repfor.getFecha() + "')) AS avecant_prod_nac,(SELECT (CASE WHEN  kardsaldonac IS NULL THEN 0 ELSE kardsaldonac END) + (CASE WHEN  kardsaldonnac IS NULL THEN 0 ELSE kardsaldonnac END) + (CASE WHEN  avesaldo_pleg_nac IS NULL THEN 0 ELSE avesaldo_pleg_nac END)+ (CASE WHEN  avecant_prod_nac IS NULL THEN 0 ELSE avecant_prod_nac END) from fc_get_kardsaldonac(public.producto.procodsx,'"+ repfor.getFecha() + "')) AS total,(SELECT (CASE WHEN  entsaldonacf IS NULL THEN 0 ELSE entsaldonacf END) - (CASE WHEN  entsaldonac IS NULL THEN 0 ELSE entsaldonac END) from fc_get_kardsaldonac(public.producto.procodsx,'"+ repfor.getFecha() + "')) AS saldo_reservado from public.producto, public.categoria, public.compania where comcodsx = " + repfor.getCompania() + " and catcodsx= " + repfor.getCategoria() + "  and procodigocia = " + repfor.getCompania() + " and  procategoria=" + repfor.getCategoria() + " order by catnombre";
		//modificacion//
		String sql = "select public.compania.comcodsx,public.compania.comnombre,public.categoria.catnombre,public.producto.promodelo,public.producto.prodescripcion,(SELECT (CASE WHEN  kardsaldonac IS NULL THEN 0 ELSE kardsaldonac END)-(CASE WHEN  avesaldo_pleg_nac IS NULL THEN 0 ELSE avesaldo_pleg_nac END)-(CASE WHEN  avecant_prod_nac IS NULL THEN 0 ELSE avecant_prod_nac END) from fc_get_kardsaldonac(public.producto.procodsx,'" + repfor.getFecha() + "')) AS saldo_ant_nac,(SELECT (CASE WHEN  kardsaldonnac IS NULL THEN 0 ELSE kardsaldonnac END) from fc_get_kardsaldonac(public.producto.procodsx,'"+ repfor.getFecha() + "')) AS saldo_ant_nnac,(SELECT (CASE WHEN  avesaldo_pleg_nac IS NULL THEN 0 ELSE avesaldo_pleg_nac END) from fc_get_kardsaldonac(public.producto.procodsx,'"+ repfor.getFecha() + "')) AS avesaldo_pleg_nac,(SELECT (CASE WHEN  avecant_prod_nac IS NULL THEN 0 ELSE avecant_prod_nac END) from fc_get_kardsaldonac(public.producto.procodsx,'"+ repfor.getFecha() + "')) AS avecant_prod_nac,(SELECT ((CASE WHEN  kardsaldonac IS NULL THEN 0 ELSE kardsaldonac END)-(CASE WHEN  avesaldo_pleg_nac IS NULL THEN 0 ELSE avesaldo_pleg_nac END)-(CASE WHEN  avecant_prod_nac IS NULL THEN 0 ELSE avecant_prod_nac END)) + (CASE WHEN  kardsaldonnac IS NULL THEN 0 ELSE kardsaldonnac END) + (CASE WHEN  avesaldo_pleg_nac IS NULL THEN 0 ELSE avesaldo_pleg_nac END)+ (CASE WHEN  avecant_prod_nac IS NULL THEN 0 ELSE avecant_prod_nac END) from fc_get_kardsaldonac(public.producto.procodsx,'"+ repfor.getFecha() + "')) AS total,(SELECT (CASE WHEN  entsaldonacf IS NULL THEN 0 ELSE entsaldonacf END) - (CASE WHEN  entsaldonac IS NULL THEN 0 ELSE entsaldonac END) from fc_get_kardsaldonac(public.producto.procodsx,'"+ repfor.getFecha() + "')) AS saldo_reservado from public.producto, public.categoria, public.compania where comcodsx = " + repfor.getCompania() + " and catcodsx= " + repfor.getCategoria() + "  and procodigocia = " + repfor.getCompania() + " and  procategoria=" + repfor.getCategoria() + " order by catnombre";
		//-(CASE WHEN  avesaldo_pleg_nac IS NULL THEN 0 ELSE avesaldo_pleg_nac END)-(CASE WHEN  avecant_prod_nac IS NULL THEN 0 ELSE avecant_prod_nac END)
		//
		//////////////////////////////////	

		/*
		String sql = "select comcodsx,comnombre,catnombre,promodelo,prodescripcion,saldo_ant_nac,saldo_ant_nnac, saldo_ant_nac+saldo_ant_nnac as tot " 
			+ " from reporte_inventario_fecha_categoria(" + repfor.getCompania() + "," + repfor.getCategoria() + ",'" 
			+ repfor.getFecha() + "') order by promodelo";
		*/
		
		parametros.put("sql", sql);
		
		request.setAttribute("parametros", parametros);
		request.setAttribute("reporte", reporte);



	}

}
