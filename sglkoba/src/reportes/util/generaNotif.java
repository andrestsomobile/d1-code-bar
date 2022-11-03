package reportes.util;

import java.io.File;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import administracion.entity.usuario;


import jxl.Workbook;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.NumberFormat;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import pedido.control.gstdespacho;
import reportes.form.reportesForm;
import util.Fecha;

public class generaNotif extends Command {


	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		usuario usu = (usuario) request.getSession().getAttribute("usuario");
		String despcodsx = request.getParameter("despcodsx");
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "ARCHIVO_NOTIFICACION"+".xls";
		File archivo = new File(ruta, nomarch);
		gstdespacho gdesp = new gstdespacho();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		NumberFormat numero = new jxl.write.NumberFormat ("###0.000000");
		WritableCellFormat formatonumero = new jxl.write.WritableCellFormat (numero);
		int renglon = 0;
		int col = 0;
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("Despacho "+despcodsx, 0);
			hoja.addCell(new Label(col++, renglon, "FMM", format));
			hoja.addCell(new Label(col++, renglon, "Cantidad", format));
			hoja.addCell(new Label(col++, renglon, "Peso", format));
			Collection info = gdesp.getListaArchivoNotificacion(despcodsx);
			Iterator ite = info.iterator();
			while(ite.hasNext()) {
				renglon++;
				Collection datos = (Collection)ite.next();
				Iterator data = datos.iterator();
				String consec = (String)data.next();
				String cant = (String)data.next();
				String peso = (String)data.next();
				hoja.addCell(new Label(0, renglon, consec, format));
				hoja.addCell(new Number(1, renglon, Double.parseDouble(cant), formatonumero));
				hoja.addCell(new Number(2, renglon, Double.parseDouble(peso), formatonumero));
			}
			book.write();
			book.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		// se genera segundo archivo para cargar items a la notificacion
		String nomarch_item = "ARCHIVO_NOTIFICACION_ITEM"+".xls";
		File archivo_item = new File(ruta, nomarch_item);
		renglon = 0;
		col = 0;
		try {
			WritableWorkbook book1 = Workbook.createWorkbook(archivo_item);
			WritableSheet hoja1 = book1.createSheet("Despacho "+despcodsx, 0);
			hoja1.addCell(new Label(col++, renglon, "FMM", format));
			hoja1.addCell(new Label(col++, renglon, "Item", format));
			hoja1.addCell(new Label(col++, renglon, "Cantidad", format));
			Collection info = gdesp.getListaArchivoNotificacionItem(despcodsx);
			Iterator ite = info.iterator();
			while(ite.hasNext()) {
				renglon++;
				Collection datos = (Collection)ite.next();
				Iterator data = datos.iterator();
				String consec = (String)data.next();
				String item = (String)data.next();
				String cantidad = (String)data.next();
				hoja1.addCell(new Label(0, renglon, consec, format));
				hoja1.addCell(new Label(1, renglon, item, format));
				hoja1.addCell(new Number(2, renglon, Double.parseDouble(cantidad), formatonumero));
			}
			book1.write();
			book1.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
