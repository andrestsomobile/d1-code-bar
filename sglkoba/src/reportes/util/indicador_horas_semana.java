package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class indicador_horas_semana extends Command {

	public void execute(String ruta, HttpServletRequest request,
			reportesForm repfor) {
		
		String cad_params = getCadParams( repfor);
		HashMap parametros = new HashMap();
		
		parametros.put("cad_params", cad_params);
		
		//ahora saco el reporte:
		
		
		File reporte = new File(  ruta + "indicador_pedidos_semana_horas.jasper");
					
		String sql = "select * from indicador_pedidos_horas(" + repfor.getCompania() +", '" + repfor.getAnno() + "-" + repfor.getMes() + "-01')";
		
		parametros.put("sql", sql);
		
		request.setAttribute("parametros", parametros);
		request.setAttribute("reporte", reporte);

		
	}

}
