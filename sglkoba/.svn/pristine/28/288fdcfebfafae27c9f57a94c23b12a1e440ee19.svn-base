package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class picking extends Command {

	public void execute(String ruta, HttpServletRequest request,
			reportesForm repfor) {
		
		String cad_params = getCadParams( repfor);
		HashMap parametros = new HashMap();
		
		parametros.put("cad_params", cad_params);
		
		//ahora saco el reporte:
		
		
		File reporte = new File(  ruta + "reporte_picking.jasper");
				  
		
		String sql = getQuery(repfor,"reporte_picking" );
		sql += " and pickcodpacking like '%" + request.getParameter("packing") + "%' ";
		parametros.put("sql", sql);
		
		request.setAttribute("parametros", parametros);
		request.setAttribute("reporte", reporte);

	}

}
