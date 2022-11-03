package reportes.util;

import java.io.File;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import ingreso.control.gstreferencia_trafico;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import maestro.control.gstcompania;
import maestro.entity.compania;
import reportes.form.reportesForm;

public class reporte_inv_chasis extends Command {


	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "Inventario_Seriales" + ".xls";
		File archivo = new File(ruta, nomarch);
		gstreferencia_trafico gstreferencia_trafico = new gstreferencia_trafico();
		gstcompania gstcom = new gstcompania();
		compania com = gstcom.getcompania(repfor.getCompania());
		Collection registros = gstreferencia_trafico.getlistaInv_referencia_trafico(repfor.getCompania());
		Iterator it = registros.iterator();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		int renglon = 0;
		BigDecimal total = new BigDecimal("0");
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("Inventario de Chasis-Seriales", 0); 
			hoja.addCell(new Label(0,renglon++,"Inventario de Chasis-Seriales: "+com.getcomnombre(), format));
			hoja.addCell(new Label(0, renglon, "Modelo", format));
			hoja.addCell(new Label(1, renglon, "Serial-Chasis", format));
			hoja.addCell(new Label(2, renglon, "Cantidad", format));
			while (it.hasNext()) {
				renglon++;
				Collection datos = (Collection) it.next();
				Iterator data = datos.iterator();
				String modelo =  (String) data.next();
				String serial =  (String) data.next();
				String cantidad =  (String) data.next();
				total = total.add(new BigDecimal(cantidad));
				hoja.addCell(new Label(0, renglon, modelo, format));
				hoja.addCell(new Label(1, renglon, serial, format));
				hoja.addCell(new Label(2, renglon, cantidad, format));
			}
			renglon++;
			hoja.addCell(new Label(0, renglon, "TOTALES", format));
			hoja.addCell(new Label(2, renglon, total.toPlainString(), format));
			book.write();
			book.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
