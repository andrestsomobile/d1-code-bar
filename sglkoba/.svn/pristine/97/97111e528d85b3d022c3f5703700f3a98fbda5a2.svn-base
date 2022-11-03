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
import reportes.form.reportesForm;
import clientesvarios.control.gstentradacv;

public class reporte_auditoria_cv extends Command {


	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "AuditoriaClientesVarios" + ".xls";
		File archivo = new File(ruta, nomarch);
		gstentradacv gstentradacv = new gstentradacv();

		Collection registros = null;
		registros = gstentradacv.getReporteAuditoria(repfor.getFecha_ini(),repfor.getFecha_fin());

		Iterator it = registros.iterator();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		int renglon = 0;
		try {			
			int col = 0;
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("AuditoriaClientesVarios", 0); 
			hoja.addCell(new Label(col,renglon++,"Fechas de: " + repfor.getFecha_ini() + " hasta: " + repfor.getFecha_fin(),format));
			hoja.addCell(new Label(col++, renglon, "Tabla", format));
			hoja.addCell(new Label(col++, renglon, "Fecha", format));
			hoja.addCell(new Label(col++, renglon, "Accion", format));
			hoja.addCell(new Label(col++, renglon, "Codsx", format));
			hoja.addCell(new Label(col++, renglon, "Usuario", format));
			while (it.hasNext()) {
				renglon++;
				col= 0;
				Collection datos = (Collection) it.next();
				Iterator data = datos.iterator();
				String aucvcodsx =  (String) data.next();
				String aucvaccion =  (String) data.next();
				String aucvfecha =  (String) data.next();
				String aucvusuario =  (String) data.next();
				String aucvcodigo =  (String) data.next();
				String aucvtabla =  (String) data.next();
				String usunombre =  (String) data.next();
				hoja.addCell(new Label(col++, renglon, aucvtabla, format));
				hoja.addCell(new Label(col++, renglon, aucvfecha, format));
				hoja.addCell(new Label(col++, renglon, aucvaccion, format));
				hoja.addCell(new Label(col++, renglon, aucvcodigo, format));
				hoja.addCell(new Label(col++, renglon, usunombre, format));
			}
			book.write();
			book.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
