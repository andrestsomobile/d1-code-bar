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
import reportes.form.reportesForm;

public class resumen_embarque extends Command {


	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "RESUMEN_EMBARQUE" + ".xls";
		File archivo = new File(ruta, nomarch);
		gsttrafico gsttrafico = new gsttrafico();
		Collection registros = gsttrafico.getListaResumenEmbarque(repfor.getCompania(), repfor.getFecha_ini(), repfor.getFecha_fin());
		Iterator it = registros.iterator();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		int renglon = 0;
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("RESUMEN_EMBARQUE", 0);
			hoja.addCell(new Label(0, renglon, "Embarque", format));
			hoja.addCell(new Label(1, renglon, "Documento", format));
			hoja.addCell(new Label(2, renglon, "Saldo Nac", format));
			hoja.addCell(new Label(3, renglon, "Saldo sin Nac", format));
			hoja.addCell(new Label(4, renglon, "Saldo Total", format));
			while (it.hasNext()) {
				renglon++;
				Collection datos = (Collection) it.next();
				Iterator data = datos.iterator();
				String embarque = (String) data.next();
				String doumento = (String) data.next();
				String saldonac = (String) data.next();
				String saldosinnac = (String) data.next();
				String saltototal = (String) data.next();
				hoja.addCell(new Label(0, renglon, embarque, format));
				hoja.addCell(new Label(1, renglon, doumento, format));
				hoja.addCell(new Label(2, renglon, saldonac, format));
				hoja.addCell(new Label(3, renglon, saldosinnac, format));
				hoja.addCell(new Label(4, renglon, saltototal, format));
			}
			book.write();
			book.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
