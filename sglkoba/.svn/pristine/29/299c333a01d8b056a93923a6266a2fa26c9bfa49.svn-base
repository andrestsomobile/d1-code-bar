package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class auditoria extends Command {

	 public void execute( String  ruta, HttpServletRequest request,  reportesForm repfor) { 
			
			String cad_params = getCadParams(repfor);	
			HashMap parametros = new HashMap();
			parametros.put("cad_params", cad_params);
			String tabla = request.getParameter("tabla");
			String param = request.getParameter("param");
			
			//ahora saco el reporte:
			
			File reporte = new File(  ruta + "reporte_auditoria.jasper");
			
			parametros.put("SUBREPORT_DIR", ruta );
			
			String sql = "select * from auditoria where audifecha >='" + repfor.getFecha_ini() + "' " +
					" and audifecha <='" + repfor.getFecha_fin() +"' " +
					" and ( audiusuario like '%" + repfor.getUsuario() + "%') " +
					" and ( auditabla like '%" + tabla + "%') " +
					" and ( audinuevo like '%" + param + "%' or audiviejo like '%" + param + "%') " +
				" order by audiusuario asc,audifecha asc";
			System.out.println(sql);
			parametros.put("sql", sql);
			
			request.setAttribute("parametros", parametros);
			request.setAttribute("reporte", reporte);
		}
}
