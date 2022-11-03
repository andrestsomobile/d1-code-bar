package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class reporte_saldo_bl_ref extends Command {

	public void execute(String ruta, HttpServletRequest request,
			reportesForm repfor) {
		String cad_params = getCadParams( repfor);
		HashMap parametros = new HashMap();
		
		parametros.put("cad_params", cad_params);
		
		//ahora saco el reporte:
		
		
		File reporte = new File(  ruta + "reporte_saldo_bl_ref.jasper");
			

		String sql = "select trafdocumento, trafembarque, promodelo, trafpedido, sum(entsaldonacf) as saldonac, sum(entsaldosinnacf) as saldosinnac " +
		"from trafico, ingreso, entrada, producto, compania " +
		"where trafcodsx=ingtrafico and ingcodsx=entcodingreso and promodelo='" + repfor.getReferencia() + "' and (entsaldonacf>0 or entsaldosinnacf>0) and " +
        "procodsx=entcodproducto and trafcompania=comcodsx and comcodsx =" + repfor.getCompania() + " and trafdocumento!='AJUSTE' " +
        "group by trafdocumento, trafembarque, promodelo, trafpedido " +
        "order by trafembarque";
		
		parametros.put("sql", sql);
		
		request.setAttribute("parametros", parametros);
		request.setAttribute("reporte", reporte);


	}

}
