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
import pedido.control.gstpedido;
import reportes.form.reportesForm;

public class reporte_pedidos_excel extends Command {


	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "REPORTE_PEDIDOS" + ".xls";
		File archivo = new File(ruta, nomarch);
		gstpedido gstpedido = new gstpedido();
		Collection registros = gstpedido.reporte_pedido_excel(repfor.getCompania(), repfor.getFecha_ini(), repfor.getFecha_fin());
		Iterator it = registros.iterator();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		int renglon = 0;
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("PEDIDOS", 0);
			hoja.addCell(new Label(0, renglon, "FECHA", format));
			hoja.addCell(new Label(1, renglon, "PEDIDO", format));
			hoja.addCell(new Label(2, renglon, "FACTURA", format));
			hoja.addCell(new Label(3, renglon, "MODELO", format));
			hoja.addCell(new Label(4, renglon, "CANTIDAD", format));
			hoja.addCell(new Label(5, renglon, "VLR DECLARADO X REF", format));
			hoja.addCell(new Label(6, renglon, "VLR DECLARADO", format));
			hoja.addCell(new Label(7, renglon, "CLIENTE", format));
			hoja.addCell(new Label(8, renglon, "CIUDAD", format));
			while (it.hasNext()) {
				renglon++;
				Collection datos = (Collection) it.next();
				Iterator data = datos.iterator();
				String fecha = (String) data.next();
				String pedido = (String) data.next();
				String factura = (String) data.next();
				String modelo = (String) data.next();
				String cantidad = (String) data.next();
				String valorref = (String) data.next();
				String valordec = (String) data.next();
				String cliente = (String) data.next();
				String ciudad = (String) data.next();
				hoja.addCell(new Label(0, renglon, fecha, format));
				hoja.addCell(new Label(1, renglon, pedido, format));
				hoja.addCell(new Label(2, renglon, factura, format));
				hoja.addCell(new Label(3, renglon, modelo, format));
				hoja.addCell(new Label(4, renglon, cantidad, format));
				hoja.addCell(new Label(5, renglon, valorref, format));
				hoja.addCell(new Label(6, renglon, valordec, format));
				hoja.addCell(new Label(7, renglon, cliente, format));
				hoja.addCell(new Label(8, renglon, ciudad, format));
			}
			book.write();
			book.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
