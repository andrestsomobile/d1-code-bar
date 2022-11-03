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

public class generacion_bat extends Command {


	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "ARCHIVO_BAT" + ".xls";
		File archivo = new File(ruta, nomarch);
		gstdespacho gstdespacho = new gstdespacho();
		Collection registros = gstdespacho.getListaBAT(repfor.getCompania(), repfor.getFecha_ini(), repfor.getFecha_fin());
		Iterator it = registros.iterator();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		int renglon = 0;
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("BAT", 0);
			hoja.addCell(new Label(0, renglon, "PEDIDO", format));
			hoja.addCell(new Label(1, renglon, "SUCURSAL", format));
			hoja.addCell(new Label(2, renglon, "TRAFICO", format));
			hoja.addCell(new Label(3, renglon, "MODELO", format));
			hoja.addCell(new Label(4, renglon, "DESCRIPCION", format));
			hoja.addCell(new Label(5, renglon, "FECHA DESPACHO", format));
			hoja.addCell(new Label(6, renglon, "CANTIDAD", format));
			hoja.addCell(new Label(7, renglon, "CIUDAD", format));
			hoja.addCell(new Label(8, renglon, "PESO BRUTO", format));
			hoja.addCell(new Label(9, renglon, "OBSERVACIONES", format));
			while (it.hasNext()) {
				renglon++;
				Collection datos = (Collection) it.next();
				Iterator data = datos.iterator();
				String pedido = (String) data.next();
				String sucursal = (String) data.next();
				String trafico = (String) data.next();
				String modelo = (String) data.next();
				String descripcion = (String) data.next();
				String fecha = (String) data.next();
				String cantidad = (String) data.next();
				String ciudad = (String) data.next();
				String peso = (String) data.next();
				String obs = (String) data.next();
				hoja.addCell(new Label(0, renglon, pedido, format));
				hoja.addCell(new Label(1, renglon, sucursal, format));
				hoja.addCell(new Label(2, renglon, trafico, format));
				hoja.addCell(new Label(3, renglon, modelo, format));
				hoja.addCell(new Label(4, renglon, descripcion, format));
				hoja.addCell(new Label(5, renglon, fecha, format));
				hoja.addCell(new Label(6, renglon, cantidad, format));
				hoja.addCell(new Label(7, renglon, ciudad, format));
				hoja.addCell(new Label(8, renglon, peso, format));
				hoja.addCell(new Label(9, renglon, obs, format));
			}
			book.write();
			book.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
