package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class kardex_categoria_descargue extends Command {

	public void execute(String ruta, HttpServletRequest request,
			reportesForm repfor) {
		String cad_params = getCadParams( repfor);
		HashMap parametros = new HashMap();
		
		parametros.put("cad_params", cad_params);
		
		//ahora saco el reporte:
		
		
		File reporte = new File(  ruta + "kardex_categoria_descargue.jasper");
			

		
		String sql = "select * from reporte_kardex_categoria_descargue(" + repfor.getCompania() + "," + repfor.getCategoria() + ",'" +
		             repfor.getFecha_ini() + "','" + repfor.getFecha_fin() + "')";
		
		
		parametros.put("sql", sql);
		
		request.setAttribute("parametros", parametros);
		request.setAttribute("reporte", reporte);



	}

}
