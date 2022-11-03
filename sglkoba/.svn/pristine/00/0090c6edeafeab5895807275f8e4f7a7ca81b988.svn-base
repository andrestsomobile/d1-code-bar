package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class kardex extends Command {

	public void execute(String ruta, HttpServletRequest request,
			reportesForm repfor) {
		String cad_params = getCadParams( repfor);
		HashMap parametros = new HashMap();
		
		parametros.put("cad_params", cad_params);
		
		//ahora saco el reporte:
		
		
		File reporte = new File(  ruta + "kardex.jasper");
			

		
		/*String sql = "select * from kardex where kardcompania=" + repfor.getCompania() +
					" and kardfecha >='" + repfor.getFecha_ini() + "' and kardfecha <='" + repfor.getFecha_fin() + "' " +
					" and kardmodelo='" + repfor.getReferencia() +"' order by kardfecha asc, kardcodsx asc";*/
		
		String sql = "select * from kardex, producto where kardcompania=" + repfor.getCompania() +
					 " and kardfecha >='" + repfor.getFecha_ini() + "' and kardfecha <='" + repfor.getFecha_fin() + "' " +
					 " and kardcodproducto=procodsx and promodelo='" + repfor.getReferencia() +
					 "' order by kardfecha asc, kardcodsx asc";
		
		
		parametros.put("sql", sql);
		
		request.setAttribute("parametros", parametros);
		request.setAttribute("reporte", reporte);



	}

}
