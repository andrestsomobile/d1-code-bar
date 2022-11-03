package reportes.util;

import java.io.File;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import jxl.Workbook;
import jxl.write.Formula;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.NumberFormat;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import maestro.control.gstcompania;
import maestro.entity.compania;
import reportes.form.reportesForm;
import db.GstTabla;
import db.beanConnector;

public class ocupacion_bim extends Command {

	public reporte rep = new reporte();
	
	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "OcupacionBIM" + ".xls";
		File archivo = new File(ruta, nomarch);
		gstcompania gstcom = new gstcompania();	
		WritableFont letraT = new WritableFont(WritableFont.TAHOMA, 12, WritableFont.BOLD);
		WritableCellFormat formatT = new WritableCellFormat(letraT);
		WritableFont letra = new WritableFont(WritableFont.TAHOMA, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		NumberFormat numero = new jxl.write.NumberFormat ("#,##0");
		WritableCellFormat formatonumero = new jxl.write.WritableCellFormat (numero);  
		

		
		int renglon = 0;
		int col = 0;
		
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("OcupacionBIM", 0); 
			//Merge col[0-11]
		    hoja.mergeCells(0, renglon, 4, renglon);
			hoja.addCell(new Label(col,renglon++,"Inventario Ocupacion BIM", formatT));
			hoja.mergeCells(0, renglon, 4, renglon);
			
				
				renglon = renglon + 1;
				Collection detalles = rep.detalle();
				Iterator itdet = detalles.iterator();
				
				if (itdet.hasNext()) {
			
					col = 0;
					hoja.addCell(new Label(col++, renglon, "", formatT));
					hoja.addCell(new Label(col++, renglon, "Total Posiciones", formatT));
					hoja.addCell(new Label(col++, renglon, "Posiciones Ocupadas", formatT));
					hoja.addCell(new Label(col++, renglon, "Posiciones Disponibles", formatT));
					hoja.addCell(new Label(col++, renglon, "% Ocupacion", formatT));

					renglon++;
					int reg_ini = renglon + 1;
					while (itdet.hasNext()) {
						col = 0;
						Collection datosdet = (Collection) itdet.next();
						Iterator datadet = datosdet.iterator();
						String tipo_posicion =  (String) datadet.next();
						String tot_pos =  (String) datadet.next();
						String tot_ocu =  (String) datadet.next();
						String tot_disp =  (String) datadet.next();
						String porc_ocupacion =  (String) datadet.next();
						
						hoja.addCell(new Label(col++, renglon, tipo_posicion, format));
						hoja.addCell(new Label(col++, renglon, tot_pos, format));
						hoja.addCell(new Label(col++, renglon, tot_ocu, format));
						hoja.addCell(new Label(col++, renglon, tot_disp, format));
						hoja.addCell(new Label(col++, renglon, porc_ocupacion, format));
						renglon++;
					}

				}
				renglon++;
			
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


		
		public Collection detalle ()  {

			String consulta = "select \r\n" + 
					"'ESTANTERIA' as tipo_ocupacion\r\n" + 
					", count(*) as tot_pos\r\n" + 
					", (select count(*) from config_bodega where cbentrada IS NOT NULL and cbestado = 'AC') as tot_ocu\r\n" + 
					", (select count(*) from config_bodega where cbentrada IS NULL and cbestado = 'AC') as tot_disp\r\n" + 
					", round(((select count(*) from config_bodega where cbentrada IS NOT NULL and cbestado = 'AC') / (select count(*) from config_bodega where cbestado = 'AC')::numeric) * 100,2) as porc_ocupado\r\n" + 
					"from config_bodega\r\n" + 
					"where cbestado = 'AC'\r\n" + 
					"\r\n" + 
					"union all\r\n" + 
					"\r\n" + 
					"select entposicion as tipo_ocupacion\r\n" + 
					",count(*) as tot_pos\r\n" + 
					",count(*) as tot_ocu\r\n" + 
					",0 as tot_disp\r\n" + 
					",round(100,2) as porc_ocupado\r\n" + 
					"from entrada \r\n" + 
					"left join config_bodega on cbentrada = entcodsx\r\n" + 
					"where entsaldonac + entsaldosinnac > 0 \r\n" +
					"and (case when substring(entposicion from '.$') ~ E'^\\\\d+$' then substring(entposicion from '.$')::integer  else 0 end)  = 0 \r\n" + 
					"and cbposicion is null\r\n" + 
					"group  by entposicion";
			
			
			return getListaDeListas(consulta);
		}
		
	}
		
}
