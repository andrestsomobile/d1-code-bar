package reportes.util;

import ingreso.control.gsttrafico;
import ingreso.entity.trafico;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class ingreso_ajuste extends Command {

	 public void execute( String  ruta, HttpServletRequest request,  reportesForm repfor) { 
			
			String cad_params = getCadParams( repfor);
			HashMap parametros = new HashMap();
			
			parametros.put("cad_params", cad_params);
			
			//ahora saco el reporte:
			
			
			File reporte = new File(  ruta + "reporte_ingresos_ajuste.jasper");
			String embarque = repfor.getEmbarque();
			
			repfor.setEmbarque(null);
			String sql = getQuery(repfor,"reporte_ingresos" );
			
			sql += "  and ingtipo='AJUSTE'";
			
			parametros.put("sql", sql);
			
			request.setAttribute("parametros", parametros);
			request.setAttribute("reporte", reporte);
		}


}
