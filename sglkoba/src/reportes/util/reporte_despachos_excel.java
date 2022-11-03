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

public class reporte_despachos_excel extends Command {


	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "REPORTE_DESPACHOS" + ".xls";
		File archivo = new File(ruta, nomarch);
		gstdespacho gstdespacho = new gstdespacho();
		Collection registros = gstdespacho.reporte_despachos_excel(repfor.getCompania(), repfor.getFecha_ini(), repfor.getFecha_fin());
		Iterator it = registros.iterator();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		int renglon = 0;
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("DESPACHOS", 0);
			hoja.addCell(new Label(0, renglon, "TRANSPORTADOR", format));
			hoja.addCell(new Label(1, renglon, "FECHA", format));
			hoja.addCell(new Label(2, renglon, "PEDIDO", format));
			hoja.addCell(new Label(3, renglon, "GUIA", format));
			hoja.addCell(new Label(4, renglon, "FACTURA", format));
			hoja.addCell(new Label(5, renglon, "SUCURSAL", format));
			hoja.addCell(new Label(6, renglon, "MODELO", format));
			hoja.addCell(new Label(7, renglon, "CATEGORIA", format));
			hoja.addCell(new Label(8, renglon, "CANTIDAD", format));
			hoja.addCell(new Label(9, renglon, "VALOR", format));
			hoja.addCell(new Label(10, renglon, "CIUDAD", format));
			while (it.hasNext()) {
				renglon++;
				Collection datos = (Collection) it.next();
				Iterator data = datos.iterator();
				String transportador = (String) data.next();
				String fecha = (String) data.next();
				String pedido = (String) data.next();
				String guia = (String) data.next();
				String factura = (String) data.next();
				String sucursal = (String) data.next();
				String modelo = (String) data.next();
				String categoria = (String) data.next();
				String cantidad = (String) data.next();
				String valor = (String) data.next();
				String ciudad = (String) data.next();
				hoja.addCell(new Label(0, renglon, transportador, format));
				hoja.addCell(new Label(1, renglon, fecha, format));
				hoja.addCell(new Label(2, renglon, pedido, format));
				hoja.addCell(new Label(3, renglon, guia, format));
				hoja.addCell(new Label(4, renglon, factura, format));
				hoja.addCell(new Label(5, renglon, sucursal, format));
				hoja.addCell(new Label(6, renglon, modelo, format));
				hoja.addCell(new Label(7, renglon, categoria, format));
				hoja.addCell(new Label(8, renglon, cantidad, format));
				hoja.addCell(new Label(9, renglon, valor, format));
				hoja.addCell(new Label(10, renglon, ciudad, format));
			}
			book.write();
			book.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
