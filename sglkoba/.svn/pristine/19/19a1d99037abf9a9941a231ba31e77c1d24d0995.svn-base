package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class nacionalizaciones extends Command {


	 public void execute( String  ruta, HttpServletRequest request,  reportesForm repfor) { 
			
			String cad_params = getCadParams(repfor);
			HashMap parametros = new HashMap();
			parametros.put("cad_params", cad_params);
			
			
			//ahora saco el reporte:
			
			File reporte = new File(  ruta + "reporte_nacionalizaciones.jasper");
			
			
			parametros.put("sql", getQuery(repfor, "reporte_nacionalizaciones"));
			
			request.setAttribute("parametros", parametros);
			request.setAttribute("reporte", reporte);
		}


	 
	 
	 
}
