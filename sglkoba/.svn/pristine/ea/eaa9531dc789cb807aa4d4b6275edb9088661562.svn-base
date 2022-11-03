package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class inventario_unidades_resumen extends Command {

	public void execute(String ruta, HttpServletRequest request,
			reportesForm repfor) {
		String cad_params = getCadParams( repfor);
		HashMap parametros = new HashMap();
		
		parametros.put("cad_params", cad_params);
		
		//ahora saco el reporte:
		
		
		File reporte = new File(  ruta + "inventario_unidades_resumen.jasper");
		
		String sql = "select public.compania.comcodsx,public.compania.comnombre,public.categoria.catnombre,sum((SELECT (sum(CASE WHEN  kardsaldonac IS NULL THEN 0 ELSE kardsaldonac END))-(sum(CASE WHEN  avesaldo_pleg_nac IS NULL THEN 0 ELSE avesaldo_pleg_nac END))-(sum(CASE WHEN  avecant_prod_nac IS NULL THEN 0 ELSE avecant_prod_nac END)) from fc_get_inventario_resumido(public.producto.procodsx,'"+repfor.getFecha()+"'))) AS sum_nac,sum((SELECT sum(CASE WHEN  kardsaldonnac IS NULL THEN 0 ELSE kardsaldonnac END) from fc_get_kardsaldonac(public.producto.procodsx,'"+repfor.getFecha()+"'))) AS sum_nnac,sum((SELECT sum(CASE WHEN  avesaldo_pleg_nac IS NULL THEN 0 ELSE avesaldo_pleg_nac END) from fc_get_kardsaldonac(public.producto.procodsx,'"+repfor.getFecha()+"'))) AS sum_avesaldo_pleg_nac,sum((SELECT sum(CASE WHEN  avecant_prod_nac IS NULL THEN 0 ELSE avecant_prod_nac END) from fc_get_kardsaldonac(public.producto.procodsx,'"+repfor.getFecha()+"'))) AS sum_avecant_prod_nac,sum((SELECT sum(((CASE WHEN  kardsaldonac IS NULL THEN 0 ELSE kardsaldonac END)-(CASE WHEN  avesaldo_pleg_nac IS NULL THEN 0 ELSE avesaldo_pleg_nac END)-(CASE WHEN  avecant_prod_nac IS NULL THEN 0 ELSE avecant_prod_nac END)) + (CASE WHEN  kardsaldonnac IS NULL THEN 0 ELSE kardsaldonnac END) + (CASE WHEN  avesaldo_pleg_nac IS NULL THEN 0 ELSE avesaldo_pleg_nac END)+ (CASE WHEN  avecant_prod_nac IS NULL THEN 0 ELSE avecant_prod_nac END)) from fc_get_kardsaldonac(public.producto.procodsx,'"+repfor.getFecha()+"'))) AS sum_total,sum((SELECT sum((CASE WHEN  entsaldonacf IS NULL THEN 0 ELSE entsaldonacf END) - (CASE WHEN  entsaldonac IS NULL THEN 0 ELSE entsaldonac END)) from fc_get_kardsaldonac(public.producto.procodsx,'"+repfor.getFecha()+"'))) AS sum_saldo_reservado from public.producto, public.categoria, public.compania where comcodsx = procodigocia and  catcodsx= procategoria and procodigocia between "+repfor.getCia_ini()+" and "+repfor.getCia_fin()+" group by public.compania.comcodsx,public.compania.comnombre,public.categoria.catnombre order by public.compania.comcodsx,public.compania.comnombre,public.categoria.catnombre,sum_nac,sum_nnac,sum_avesaldo_pleg_nac,sum_avecant_prod_nac,sum_total,sum_saldo_reservado";	
	
		
		//String sql = "select comcodsx, comnombre, catnombre, sum(saldo_ant_nac) as sum_nac, sum(saldo_ant_nnac) as sum_nnac, sum(saldo_ant_nac)+sum(saldo_ant_nnac) as tot " +
			//" from inventario_unidades_resumen(" + repfor.getCia_ini() + "," + repfor.getCia_fin() + ",'" +  
		  //  repfor.getFecha() + "') group by comcodsx, comnombre, catnombre order by comcodsx, comnombre, catnombre";	
		
		
		parametros.put("sql", sql);
		
		request.setAttribute("parametros", parametros);
		request.setAttribute("reporte", reporte);



	}

}
