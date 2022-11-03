package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class planilla_despachos extends Command {

	
	public void execute(String ruta, HttpServletRequest request,
			reportesForm repfor) {
		
		
		
		String cad_params = getCadParams(repfor);	
		HashMap parametros = new HashMap();
		parametros.put("cad_params", cad_params);
		
		//ahora saco el reporte:
		
		File reporte = new File(  ruta + "reporte_despachos_planilla.jasper");
		
		parametros.put("fecha_ini", repfor.getFecha_ini());
		parametros.put("fecha_fin", repfor.getFecha_fin());
		
			parametros.put("SUBREPORT_DIR", ruta );
		
		parametros.put("sql", getQuery(repfor, "reporte_despachos_encabezado_new"));
		
		request.setAttribute("parametros", parametros);
		request.setAttribute("reporte", reporte);
	}

}
