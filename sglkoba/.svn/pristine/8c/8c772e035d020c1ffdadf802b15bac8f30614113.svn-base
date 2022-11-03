package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class indicador_zonas extends Command {

	public void execute(String ruta, HttpServletRequest request,
			reportesForm repfor) {
		
		String cad_params = getCadParams( repfor);
		HashMap parametros = new HashMap();
		
		parametros.put("cad_params", cad_params);
		
		//ahora saco el reporte:
		
		
		File reporte = new File(  ruta + "indicador_pedidos_zonas.jasper");
		
		String zona = repfor.getZona();
			zona  = zona.equals("TODOS") ? null :  zona;
		String sql = "select * from indicador_pedidos_zonas(" + repfor.getCompania() +", '" + repfor.getAnno() + "-" + repfor.getMes() + "-01' , " + zona + ")";
		String detallado = repfor.getDetallado();
		detallado = detallado.equals("DETALLADO") ? "S" : "N";
		
		parametros.put("sql", sql);
		parametros.put("detallado", detallado);
		
		request.setAttribute("parametros", parametros);
		request.setAttribute("reporte", reporte);

		
	}

}
