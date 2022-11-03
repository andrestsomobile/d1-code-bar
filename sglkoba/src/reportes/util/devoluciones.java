package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class devoluciones extends Command {

	public void execute(String ruta, HttpServletRequest request,reportesForm repfor) {
		
				
				String cad_params = getCadParams(repfor);	
			//	cad_params = cad_params + " ZONA: "  +( request.getParameter("zona").equals("") ? "TODAS" : request.getParameter("zona") );
				HashMap parametros = new HashMap();
				parametros.put("cad_params", cad_params);
				
				//ahora saco el reporte:
				
				File reporte = new File(  ruta + "reporte_devoluciones.jasper");
				
				String sql = getQuery(repfor, "reporte_devoluciones");
				sql += " and zonnombre like'%" + request.getParameter("zona") +"%'";
				parametros.put("sql", sql);
				
				request.setAttribute("parametros", parametros);
				request.setAttribute("reporte", reporte);

	}

}
