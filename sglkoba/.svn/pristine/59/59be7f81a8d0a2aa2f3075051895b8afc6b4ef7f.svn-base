package reportes.util;

import java.io.File;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import pedido.control.gstdespacho;
import reportes.form.reportesForm;

public class despachos_sin_notificacion extends Command {


	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "DespachosSinNotificacion" + ".xls";
		File archivo = new File(ruta, nomarch);
		gstdespacho gdesp = new gstdespacho();

		Collection registros = null;
		registros = gdesp.despachos_sin_notificacion(repfor.getFecha_ini(),repfor.getFecha_fin());

		Iterator it = registros.iterator();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		int renglon = 0;
		try {			
			int col = 0;
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("DespachosSinNotificacion", 0); 
			hoja.addCell(new Label(col,renglon++,"Fechas de: " + repfor.getFecha_ini() + " hasta: " + repfor.getFecha_fin(),format));
			hoja.addCell(new Label(col++, renglon, "Consecutivo", format));
			hoja.addCell(new Label(col++, renglon, "Empresa", format));
			hoja.addCell(new Label(col++, renglon, "Fecha", format));
			hoja.addCell(new Label(col++, renglon, "Transportadora", format));
			while (it.hasNext()) {
				renglon++;
				col= 0;
				Collection datos = (Collection) it.next();
				Iterator data = datos.iterator();
				String num =  (String) data.next();
				String emp =  (String) data.next();
				String fec =  (String) data.next();
				String tra =  (String) data.next();
				hoja.addCell(new Label(col++, renglon, num, format));
				hoja.addCell(new Label(col++, renglon, emp, format));
				hoja.addCell(new Label(col++, renglon, fec, format));
				hoja.addCell(new Label(col++, renglon, tra, format));
			}
			book.write();
			book.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
