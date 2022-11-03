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

public class fletes_pedidos extends Command {

	public reporte rep = new reporte();
	
	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "FletesPedidos" + ".xls";
		File archivo = new File(ruta, nomarch);
		WritableFont letraT = new WritableFont(WritableFont.TAHOMA, 12, WritableFont.BOLD);
		WritableCellFormat formatT = new WritableCellFormat(letraT);
		WritableFont letra = new WritableFont(WritableFont.TAHOMA, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		NumberFormat numero = new jxl.write.NumberFormat ("#,##0.00");
		WritableCellFormat formatonumero = new jxl.write.WritableCellFormat (numero);  
		

		
		int renglon = 0;
		int col = 0;
		
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("FletesPedidos", 0); 
			//Merge col[0-11]
		    hoja.mergeCells(0, renglon, 4, renglon);
			hoja.addCell(new Label(col,renglon++,"Fletes de Pedidos", formatT));
			hoja.mergeCells(0, renglon, 4, renglon);
			
				
				renglon = renglon + 1;
				Collection detalles = rep.detalle();
				Iterator itdet = detalles.iterator();
				
				if (itdet.hasNext()) {
					col = 0;
					hoja.addCell(new Label(col++, renglon, "Pedido", formatT));
					hoja.addCell(new Label(col++, renglon, "Cod Ciudad", formatT));
					hoja.addCell(new Label(col++, renglon, "Ciudad", formatT));
					hoja.addCell(new Label(col++, renglon, "Transportadora", formatT));
					hoja.addCell(new Label(col++, renglon, "Valor", formatT));

					renglon++;
					int reg_ini = renglon + 1;
					while (itdet.hasNext()) {
						col = 0;
						Collection datosdet = (Collection) itdet.next();
						Iterator datadet = datosdet.iterator();
						String pedido =  (String) datadet.next();
						String codciudad =  (String) datadet.next();
						String ciudad =  (String) datadet.next();
						String transportadora =  (String) datadet.next();
						String valor =  (String) datadet.next();
						
						hoja.addCell(new Label(col++, renglon, pedido, format));
						hoja.addCell(new Label(col++, renglon, codciudad, format));
						hoja.addCell(new Label(col++, renglon, ciudad, format));
						hoja.addCell(new Label(col++, renglon, transportadora, format));
						hoja.addCell(new Number(col++, renglon, Double.parseDouble(valor) ,formatonumero));

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
			String consulta = "select pednumpedido, pedciudad, ciunombre, transpnombre,coalesce(flevalor,'0.00') "
					+ "from pedido "
					+ "inner join ciudad on ciucodigo = pedciudad "
					+ "inner join transportadora on transpcodsx = pedtransportadora "
					+ "left join flete on fleciudad = pedciudad and  fletransportadora = pedtransportadora "
					+ "order by  1" ;
			return getListaDeListas(consulta);
		}
		
	}
		
}
