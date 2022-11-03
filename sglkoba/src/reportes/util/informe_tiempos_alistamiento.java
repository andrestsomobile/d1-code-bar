package reportes.util;

import java.io.File;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import db.GstTabla;
import db.beanConnector;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import reportes.form.reportesForm;

public class informe_tiempos_alistamiento extends Command {

	public reporte rep = new reporte();
	
	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "Informe_tiempos_alistamiento" + ".xls";
		File archivo = new File(ruta, nomarch);
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		String vectorTit[] = {
				"FECHA","ACCION","EMPLEADO","HORA INICIO","HORA FINAL","TIEMPO (HH, MIN:SS)","CANTIDAD PEDIDOS"
				};
		int renglon = 0;
		int col = 0;
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("Informe_Tiempos_Alistamiento", 0);
			hoja.addCell(new Label(0,renglon++,"INFORME DE TIEMPOS ALISTAMIENTO", format));
			hoja.addCell(new Label(0,renglon,"Fechas Seleccionadas:", format));
			hoja.addCell(new Label(1,renglon++,repfor.getFecha_ini() + " a " + repfor.getFecha_fin(), format));

			for(int i = 0; i < vectorTit.length; i++){
				hoja.addCell(new Label(col++, renglon, vectorTit[i], format));
			}
			Collection registros = rep.informe_tiempos_alistamiento(repfor.getFecha_ini(), repfor.getFecha_fin());
			Iterator it = registros.iterator();			
			while (it.hasNext()) {
				renglon++;
				col = 0;
				Collection datos = (Collection) it.next();
				Iterator data = datos.iterator();
				while (data.hasNext()) {
					String val =  (String) data.next();
					hoja.addCell(new Label(col++, renglon, val, format));
				}
			}
	
			book.write();
			book.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
	}
	
	
	public class reporte extends GstTabla {
		
		public reporte() {
			db = new beanConnector();
		}


		
		public Collection informe_tiempos_alistamiento (String fecha_ini,String fecha_fin)  {
			
			if(fecha_ini!=null && fecha_ini.indexOf(" ")==-1) fecha_ini += " 00:00:00";
			if(fecha_fin!=null && fecha_fin.indexOf(" ")==-1) fecha_fin+= " 23:59:59";
			String consulta = "select repefecha, 'ALISTAMIENTO', empnombre, repehoin, repehofi\r\n" + 
					",to_char(  ( repefecha || ' ' || max(repehofi) ) ::timestamp without time zone   - ( repefecha || ' ' || min(repehoin) )::timestamp without time zone , 'HH24, MI:SS') as tiempo\r\n" + 
					",count(rpdenumpedido) as qty\r\n" + 
					"from registro_pedido_detalle\r\n" + 
					"inner join registro_pedido on repecodsx = rpderegped\r\n" + 
					"inner join empleado on empcodsx = repeempleado\r\n" + 
					"where repefecha between '" + fecha_ini + "' and '" + fecha_fin + "' and repeesta = 'FINALIZADO' \r\n" + 
					"group by repefecha, empnombre,repehoin, repehofi\r\n" + 
					"order by 2,1,3 ";
			return getListaDeListas(consulta);
		}
		
	}
		
}
