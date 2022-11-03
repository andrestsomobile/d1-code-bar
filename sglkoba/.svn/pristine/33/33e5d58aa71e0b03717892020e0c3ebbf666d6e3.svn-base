package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class saldos_embarque_posicion extends Command {

	public void execute(String ruta, HttpServletRequest request,
			reportesForm repfor) {

		
		
		String cad_params = getCadParams(repfor);	
		HashMap parametros = new HashMap();
		parametros.put("cad_params", cad_params);
		
		//ahora saco el reporte:
		
		File reporte = new File(  ruta + "reporte_saldos_embarque_posicion.jasper");
		
		parametros.put("SUBREPORT_DIR", ruta );
		
		parametros.put( "sql","select * from reporte_saldos_embarque where comcodsx = "+ repfor.getCompania()+
				" and ingfecha >='"+ repfor.getFecha_ini() +"' and ingfecha <='" + repfor.getFecha_fin() +"' " +
				" and (trafembarque like'%" + repfor.getEmbarque() +"%' " +
				"      or trafdocumento like'%" + repfor.getEmbarque() +"%')");
		
		request.setAttribute("parametros", parametros);
		request.setAttribute("reporte", reporte);
	
	}

}
