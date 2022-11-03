package reportes.util;

import ingreso.control.gsttrafico;
import ingreso.entity.trafico;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import reportes.form.reportesForm;

public class ingreso extends Command {

	 public void execute( String  ruta, HttpServletRequest request,  reportesForm repfor) { 
			
			String cad_params = getCadParams( repfor);
			HashMap parametros = new HashMap();
			
			parametros.put("cad_params", cad_params);
			
			//ahora saco el reporte:
			
			
			File reporte = new File(  ruta + "reporte_ingresos.jasper");
			String embarque = repfor.getEmbarque();
			
			repfor.setEmbarque(null);
			String sql = getQuery(repfor,"reporte_ingresos" );
			
			if(embarque!=null && !embarque.equals("") ) {
				trafico traf = new gsttrafico().gettraficobyEmbarque(repfor.getCia_ini(), embarque);
				if(traf!=null)
					sql = sql  +" and ingtrafico =" + traf.gettrafcodsx()  ;
			}
			
			parametros.put("sql", sql);
			
			request.setAttribute("parametros", parametros);
			request.setAttribute("reporte", reporte);
		}


}
