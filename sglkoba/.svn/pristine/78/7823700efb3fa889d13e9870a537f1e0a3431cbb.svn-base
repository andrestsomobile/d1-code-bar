package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class indicador_pedidos_hit extends Command {

	public void execute(String ruta, HttpServletRequest request,
			reportesForm repfor) {
		String cad_params = getCadParams( repfor);
		HashMap parametros = new HashMap();
		
		parametros.put("cad_params", cad_params);
		
		//ahora saco el reporte:
		
		String hit = repfor.getHit();
			hit = hit.equals( "TODOS" ) ? null :  hit;
			
		File reporte = new File(  ruta + "indicador_pedidos_hit.jasper");
					
		String sql = "select * from indicador_pedidos_hit(" + repfor.getCompania() +", '" + repfor.getAnno() + "-" + repfor.getMes() + "-01' , " + hit  + ")";
		
		parametros.put("sql", sql);
		
		request.setAttribute("parametros", parametros);
		request.setAttribute("reporte", reporte);

	}

}
