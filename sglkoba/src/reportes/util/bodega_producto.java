package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class bodega_producto extends Command {

	public void execute(String ruta, HttpServletRequest request,reportesForm repfor) {
		
				
				String cad_params = getCadParams(repfor);	
			//	cad_params = cad_params + " ZONA: "  +( request.getParameter("zona").equals("") ? "TODAS" : request.getParameter("zona") );
				HashMap parametros = new HashMap();
				parametros.put("cad_params", cad_params);
				
				//ahora saco el reporte:
				
				File reporte = new File(  ruta + "reporte_bodega_producto.jasper");
				
				String sql = "select * from reporte_bodega_producto(" + repfor.getCompania() + ") " + (repfor.getBodega().equals("TODOS") ? "" : " where bodnombre='" + repfor.getBodega() +"' ");
				parametros.put("sql", sql);
				
				request.setAttribute("parametros", parametros);
				request.setAttribute("reporte", reporte);

	}

}
