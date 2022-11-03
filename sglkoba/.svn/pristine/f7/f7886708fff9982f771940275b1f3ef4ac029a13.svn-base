package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class planilla_despachos_encabezado extends Command {

	public void execute(String ruta, HttpServletRequest request,
			reportesForm repfor) {
		
		
		
		String cad_params = getCadParams(repfor);	
		HashMap parametros = new HashMap();
		parametros.put("cad_params", cad_params);
		
		//ahora saco el reporte:
		
		File reporte = new File(  ruta + "reporte_despachos_encabezado.jasper");
		System.out.println("palnilla de despachos vista neu ********************");
		parametros.put("sql", getQuery(repfor, "reporte_despachos_encabezado_new"));
		
		request.setAttribute("parametros", parametros);
		request.setAttribute("reporte", reporte);
	}


}
