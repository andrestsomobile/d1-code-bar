package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class auditoria_conexiones extends Command {

	 public void execute( String  ruta, HttpServletRequest request,  reportesForm repfor) { 
			
			String cad_params = getCadParams(repfor);	
			HashMap parametros = new HashMap();
			parametros.put("cad_params", cad_params);
			
			//ahora saco el reporte:
			
			File reporte = new File(  ruta + "reporte_auditoria_conexiones.jasper");
			
			parametros.put("SUBREPORT_DIR", ruta );
			
			String sql = "select * from auditoria_conexiones where audifecha >='" + repfor.getFecha_ini() + "' " +
					" and audifecha <='" + repfor.getFecha_fin() +"' " +
					" and ( audinombre like '%" + repfor.getUsuario() + "%') " +
				" order by audilogin, audifecha asc";
			System.out.println(sql);
			parametros.put("sql", sql);
			
			request.setAttribute("parametros", parametros);
			request.setAttribute("reporte", reporte);
		}

	


}
