package reportes.util;

import ingreso.control.gstreferencia_trafico;

import java.io.File;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import maestro.control.gstcompania;
import maestro.control.gstproducto;
import maestro.entity.compania;

import facturacion.control.gstfactura;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import pedido.control.gstdespacho;
import reportes.form.reportesForm;
import util.Fecha;

public class reporte_auditoria_facturacion extends Command {


	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "AuditoriaFacturacion" + ".xls";
		File archivo = new File(ruta, nomarch);
		gstfactura gstfactura = new gstfactura();

		Collection registros = null;
		registros = gstfactura.getReporteAuditoriaFacturacion(repfor.getFecha_ini(),repfor.getFecha_fin(), null);

		Iterator it = registros.iterator();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		int renglon = 0;
		try {			
			int col = 0;
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("AuditoriaFacturacion", 0); 
			hoja.addCell(new Label(col,renglon++,"Fechas de: " + repfor.getFecha_ini() + " hasta: " + repfor.getFecha_fin(),format));
			hoja.addCell(new Label(col++, renglon, "Factura", format));
			hoja.addCell(new Label(col++, renglon, "Fecha", format));
			hoja.addCell(new Label(col++, renglon, "Accion", format));
			hoja.addCell(new Label(col++, renglon, "Concepto", format));
			hoja.addCell(new Label(col++, renglon, "Valor Concepto", format));
			hoja.addCell(new Label(col++, renglon, "Usuario", format));
			while (it.hasNext()) {
				renglon++;
				col= 0;
				Collection datos = (Collection) it.next();
				Iterator data = datos.iterator();
				String numfac =  (String) data.next();
				String fecha =  (String) data.next();
				String accion =  (String) data.next();
				String concepto =  (String) data.next();
				String valor =  (String) data.next();
				String usuario =  (String) data.next();
				hoja.addCell(new Label(col++, renglon, numfac, format));
				hoja.addCell(new Label(col++, renglon, fecha, format));
				hoja.addCell(new Label(col++, renglon, accion, format));
				hoja.addCell(new Label(col++, renglon, concepto, format));
				hoja.addCell(new Label(col++, renglon, valor, format));
				hoja.addCell(new Label(col++, renglon, usuario, format));
			}
			book.write();
			book.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
