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

public class generaPlanilla extends Command {


	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		usuario usu = (usuario) request.getSession().getAttribute("usuario");
		String despcodsx = request.getParameter("despcodsx");
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "Planilla"+despcodsx+".xls";
		File archivo = new File(ruta, nomarch);
		gstdespacho gdesp = new gstdespacho();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		NumberFormat numero_entero = new jxl.write.NumberFormat ("###0");
		NumberFormat numero_2dec = new jxl.write.NumberFormat ("###0.00");
		WritableCellFormat formatonumero_entero = new jxl.write.WritableCellFormat (numero_entero);
		WritableCellFormat formatonumero_2dec = new jxl.write.WritableCellFormat (numero_2dec);
		int renglon = 0;
		int col = 0;
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("Planilla"+despcodsx, 0);
			hoja.addCell(new Label(col++, renglon, "GUIA", format));
			hoja.addCell(new Label(col++, renglon, "CIUDAD ORIGEN", format));
			hoja.addCell(new Label(col++, renglon, "CIUDAD DESTINO", format));
			hoja.addCell(new Label(col++, renglon, "NOMBRE DESTINATARIO", format));
			hoja.addCell(new Label(col++, renglon, "DIRECCION DESTINATARIO", format));
			hoja.addCell(new Label(col++, renglon, "TELEFONO DESTINATARIO", format));
			hoja.addCell(new Label(col++, renglon, "CANTIDAD", format));
			hoja.addCell(new Label(col++, renglon, "PESO BRUTO", format));
			hoja.addCell(new Label(col++, renglon, "KILO VOLUMEN", format));
			hoja.addCell(new Label(col++, renglon, "SUBTOTAL", format));
			hoja.addCell(new Label(col++, renglon, "FACTURA", format));
			hoja.addCell(new Label(col++, renglon, "PEDIDO", format));
			hoja.addCell(new Label(col++, renglon, "ORDEN DE COMPRA", format));
			hoja.addCell(new Label(col++, renglon, "TOTAL", format));
			Collection info = gdesp.getArchivoPlanilla(despcodsx);
			Iterator ite = info.iterator();
			while(ite.hasNext()) {
				renglon++;
				Collection datos = (Collection)ite.next();
				Iterator data = datos.iterator();
				String guia = (String)data.next();
				String ciuorigen = (String)data.next();
				String ciudestino = (String)data.next();
				String nombre = (String)data.next();
				String direccion = (String)data.next();
				String telefono = (String)data.next();
				String numunidades = (String)data.next();
				String peso = (String)data.next();
				String kilovol = (String)data.next();
				String subtotal = (String)data.next();
				String factura = (String)data.next();
				String pedido = (String)data.next();
				String ordencompra = (String)data.next();
				String total = (String)data.next();
				col = 0;
				hoja.addCell(new Label(col++, renglon, "0", format));
				hoja.addCell(new Label(col++, renglon, ciuorigen, format));
				hoja.addCell(new Label(col++, renglon, ciudestino, format));
				hoja.addCell(new Label(col++, renglon, nombre, format));
				hoja.addCell(new Label(col++, renglon, direccion, format));
				hoja.addCell(new Label(col++, renglon, telefono, format));
				hoja.addCell(new Number(col++, renglon, Double.parseDouble(numunidades), formatonumero_entero));
				hoja.addCell(new Number(col++, renglon, Double.parseDouble(peso), formatonumero_2dec));
				hoja.addCell(new Number(col++, renglon, Double.parseDouble(kilovol), formatonumero_2dec));
				hoja.addCell(new Number(col++, renglon, Double.parseDouble(subtotal), formatonumero_entero));
				hoja.addCell(new Label(col++, renglon, factura, format));
				hoja.addCell(new Label(col++, renglon, pedido, format));
				hoja.addCell(new Label(col++, renglon, ordencompra, format));
				hoja.addCell(new Number(col++, renglon, Double.parseDouble(total), formatonumero_entero));
			}
			book.write();
			book.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
