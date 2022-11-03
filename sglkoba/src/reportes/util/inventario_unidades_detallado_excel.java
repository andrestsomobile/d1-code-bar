package reportes.util;

import java.io.File;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import maestro.control.gstcategoria;
import maestro.control.gstcompania;
import maestro.control.gstproducto;
import maestro.entity.categoria;
import maestro.entity.compania;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import pedido.control.gstdespacho;
import pedido.control.gstpedido;
import reportes.form.reportesForm;

public class inventario_unidades_detallado_excel extends Command {


	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "INVENTARIO_UNIDADES_DETALLADO" + ".xls";
		File archivo = new File(ruta, nomarch);
		gstcategoria gstcat = new gstcategoria();
		gstcompania gstcom = new gstcompania();
		gstproducto gstpro = new gstproducto();
		Collection registroscat = gstcat.getlistacategoria(repfor.getCompania());
		compania com = gstcom.getcompania(repfor.getCompania());
		Iterator itcat = registroscat.iterator();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			while (itcat.hasNext()) {
				int renglon = 0;
				BigDecimal t_saldonac = new BigDecimal(0);
				BigDecimal t_saldonnac = new BigDecimal(0);
				BigDecimal t_aveplegnac = new BigDecimal(0);
				BigDecimal t_aveprodnac = new BigDecimal(0);
				BigDecimal t_total = new BigDecimal(0);
				BigDecimal t_saldoreservado = new BigDecimal(0);
				categoria cat = (categoria) itcat.next();
				WritableSheet hoja = book.createSheet(cat.getcatnombre(), 0);
				hoja.addCell(new Label(0,renglon++,"INVENTARIO DE UNIDADES DETALLADO-"+com.getcomnombre(), format));
				hoja.addCell(new Label(0,renglon,"Fecha Seleccionada:", format));
				hoja.addCell(new Label(1,renglon++,repfor.getFecha(), format));
				hoja.addCell(new Label(0,renglon,"Categoria:", format));
				hoja.addCell(new Label(1,renglon++,cat.getcatnombre(), format));
				hoja.addCell(new Label(0, renglon, "Modelo", format));
				hoja.addCell(new Label(1, renglon, "Descripcion", format));
				hoja.addCell(new Label(2, renglon, "Saldo Nacionalizado", format));
				hoja.addCell(new Label(3, renglon, "Saldo No Nacionalizado ", format));
				hoja.addCell(new Label(4, renglon, "Ave Pleg Nac", format));
				hoja.addCell(new Label(5, renglon, "Ave prod Nac", format));
				hoja.addCell(new Label(6, renglon, "Saldo Reservado", format));
				hoja.addCell(new Label(7, renglon, "Total", format));
				Collection registros = gstpro.getInvUniDetExcel(repfor.getCompania(), cat.getcatcodsx(), repfor.getFecha());
				Iterator it = registros.iterator();
				while (it.hasNext()) {
					renglon++;
					Collection datos = (Collection) it.next();
					Iterator data = datos.iterator();
					String modelo = (String) data.next();
					String descripcion = (String) data.next();
					String saldonac = (String) data.next();
					String saldonnac = (String) data.next();
					String aveplegnac = (String) data.next();
					String aveprodnac = (String) data.next();
					String total = (String) data.next();
					String saldoreservado = (String) data.next();
					hoja.addCell(new Label(0, renglon, modelo, format));
					hoja.addCell(new Label(1, renglon, descripcion, format));
					hoja.addCell(new Label(2, renglon, saldonac, format));
					hoja.addCell(new Label(3, renglon, saldonnac, format));
					hoja.addCell(new Label(4, renglon, aveplegnac, format));
					hoja.addCell(new Label(5, renglon, aveprodnac, format));
					hoja.addCell(new Label(6, renglon, saldoreservado, format));
					hoja.addCell(new Label(7, renglon, total, format));
					
					t_saldonac =  t_saldonac.add(new BigDecimal(saldonac));
					t_saldonnac = t_saldonnac.add(new BigDecimal(saldonnac));
					t_aveplegnac = t_aveplegnac.add(new BigDecimal(aveplegnac));
					t_aveprodnac = t_aveprodnac.add(new BigDecimal(aveprodnac));
					t_total = t_total.add(new BigDecimal(total));
					t_saldoreservado = t_saldoreservado.add(new BigDecimal(saldoreservado));
				}
				renglon++;
				hoja.addCell(new Label(0, renglon, "TOTALES", format));
				hoja.addCell(new Label(2, renglon, t_saldonac.toPlainString(), format));
				hoja.addCell(new Label(3, renglon, t_saldonnac.toPlainString(), format));
				hoja.addCell(new Label(4, renglon, t_aveplegnac.toPlainString(), format));
				hoja.addCell(new Label(5, renglon, t_aveprodnac.toPlainString(), format));
				hoja.addCell(new Label(6, renglon, t_saldoreservado.toPlainString(), format));
				hoja.addCell(new Label(7, renglon, t_total.toPlainString(), format));
			}
			book.write();
			book.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
