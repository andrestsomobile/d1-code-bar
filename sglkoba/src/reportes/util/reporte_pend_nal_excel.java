package reportes.util;

import ingreso.control.gsttrafico;

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
import pedido.control.gstpedido;
import reportes.form.reportesForm;

public class reporte_pend_nal_excel extends Command {


	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "REPORTE_PENDIENTES_X_NACIONALIZAR" + ".xls";
		File archivo = new File(ruta, nomarch);
		gsttrafico gsttrafico = new gsttrafico();
		Collection registros = gsttrafico.reporte_pend_nal_excel(repfor.getCompania());
		Iterator it = registros.iterator();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		int renglon = 0;
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("PENDIENTES POR NACIONALIZAR", 0);
			hoja.addCell(new Label(0, renglon, "MODELO", format));
			hoja.addCell(new Label(1, renglon, "EMBARQUE", format));
			hoja.addCell(new Label(2, renglon, "TRAFICO", format));
			hoja.addCell(new Label(3, renglon, "PEDIDO", format));
			hoja.addCell(new Label(4, renglon, "CANTIDAD", format));
			while (it.hasNext()) {
				renglon++;
				Collection datos = (Collection) it.next();
				Iterator data = datos.iterator();
				String modelo = (String) data.next();
				String embarque = (String) data.next();
				String trafico = (String) data.next();
				String pedido = (String) data.next();
				String cantidad = (String) data.next();
				hoja.addCell(new Label(0, renglon, modelo, format));
				hoja.addCell(new Label(1, renglon, embarque, format));
				hoja.addCell(new Label(2, renglon, trafico, format));
				hoja.addCell(new Label(3, renglon, pedido, format));
				hoja.addCell(new Label(4, renglon, cantidad, format));
			}
			book.write();
			book.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
