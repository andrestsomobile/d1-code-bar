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

public class informe_tiempos_almacenamiento extends Command {

	public reporte rep = new reporte();
	
	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "informe_tiempos_almacenamiento" + ".xls";
		File archivo = new File(ruta, nomarch);
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		String vectorTit[] = {
				"FECHA","ACCION","EMPLEADO","HORA INICIO","HORA FINAL","ESTIBAS","TIEMPO (HH, MIN:SS)"
				};
		int renglon = 0;
		int col = 0;
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("Informe_Tiempos_Amacenamiento", 0);
			hoja.addCell(new Label(0,renglon++,"INFORME DE TIEMPOS ALMACENAMIENTO", format));
			hoja.addCell(new Label(0,renglon,"Fechas Seleccionadas:", format));
			hoja.addCell(new Label(1,renglon++,repfor.getFecha_ini() + " a " + repfor.getFecha_fin(), format));

			for(int i = 0; i < vectorTit.length; i++){
				hoja.addCell(new Label(col++, renglon, vectorTit[i], format));
			}
			Collection registros = rep.informe_tiempos_almacenamiento(repfor.getFecha_ini(), repfor.getFecha_fin());
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


		
		public Collection informe_tiempos_almacenamiento (String fecha_ini,String fecha_fin)  {
			
			if(fecha_ini!=null && fecha_ini.indexOf(" ")==-1) fecha_ini += " 00:00:00";
			if(fecha_fin!=null && fecha_fin.indexOf(" ")==-1) fecha_fin+= " 23:59:59";
			String consulta = "select \r\n" + 
					"realfecha\r\n" + 
					", realaccion\r\n" + 
					", empnombre\r\n" + 
					", min(radetiempo ) as inicio\r\n" + 
					", max(radetiempo) as final\r\n" + 
					", sum(radeestibas) qtyestibas\r\n" + 
					", to_char(  ( realfecha || ' ' || max(radetiempo) ) ::timestamp without time zone   - ( realfecha || ' ' || min(radetiempo) )::timestamp without time zone , 'HH24, MI:SS') as tiempo\r\n" + 
					//", to_char(  ( realfecha || ' ' || max(radetiempo) ) ::timestamp without time zone   - ( realfecha || ' ' || min(radetiempo) )::timestamp without time zone , 'DD, HH24:MI:SS') as tiempo\r\n" + 
					"from registro_almacenamiento_detalle  " + 
					"inner join registro_almacenamiento on raderegalm = realcodsx\r\n" + 
					"inner join empleado on empcodsx = realempleado\r\n" + 
					"where realfecha between '" + fecha_ini + "' and '" + fecha_fin + "'\r\n" + 
					"group by realcodsx, realaccion,realfecha,realhoin,empnombre\r\n" + 
					"order by 2,1 ";
			return getListaDeListas(consulta);
		}
		
	}
		
}
