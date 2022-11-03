package reportes.util;

import java.io.File;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import reportes.form.reportesForm;

public class movimientos extends Command{
	

	 public void execute( String  ruta, HttpServletRequest request,  reportesForm repfor) { 
			
			String cad_params = getCadParams( repfor);
			HashMap parametros = new HashMap();
			
			parametros.put("cad_params", cad_params);
			
			
			//ahora saco el reporte:
			String entrada = repfor.getEntrada();
			String rep = entrada.equals("ENTRADA") ? "reporte_movimientos_ingreso" : "reporte_movimientos_salida";
			File reporte = new File(  ruta + rep + ".jasper");
					  
			
			parametros.put("SUBREPORT_DIR", ruta );
			
			String sql = getQuery(repfor,rep );
			
			parametros.put("sql", sql);
			
			request.setAttribute("parametros", parametros);
			request.setAttribute("reporte", reporte);
		}


	 
	 
	 

}
