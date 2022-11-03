package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class inventario extends Command {

	public void execute(String ruta, HttpServletRequest request,
			reportesForm repfor) {
		String cad_params = getCadParams( repfor);
		HashMap parametros = new HashMap();
		
		parametros.put("cad_params", cad_params);
		
		//ahora saco el reporte:
		
		
		File reporte = new File(  ruta + "reporte_inventario_grande.jasper");
			
//		parametros.put("SUBREPORT_DIR", ruta );
		
		String sql = "select * from reporte_inventario_empresa(" + repfor.getCompania()+ ",'" + repfor.getFecha_ini()  +"','" + repfor.getFecha_fin() + "')";//getQuery(repfor,"reporte_inventario" );
		
		parametros.put("sql", sql);
		
		request.setAttribute("parametros", parametros);
		request.setAttribute("reporte", reporte);


	}


}
