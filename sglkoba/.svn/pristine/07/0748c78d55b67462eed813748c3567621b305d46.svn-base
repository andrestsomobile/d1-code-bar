package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import averias.control.gstaveria;

import reportes.form.reportesForm;

public class saldos_referencia_simple extends Command {

	public void execute(String ruta, HttpServletRequest request,
			reportesForm repfor) {

		
		
		String cad_params = getCadParams(repfor);	
		HashMap parametros = new HashMap();
		parametros.put("cad_params", cad_params);
		
		//ahora saco el reporte:
		
		File reporte = new File(  ruta + "reporte_saldos_ref_s.jasper");
		
		parametros.put("SUBREPORT_DIR", ruta );
		parametros.put("sql", getQuery(repfor, "reporte_saldos_referencia"));
		
	
		request.setAttribute("parametros", parametros);
		request.setAttribute("reporte", reporte);
	
	}

}
