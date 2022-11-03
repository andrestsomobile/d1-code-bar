package reportes.util;

import java.io.File;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.NumberFormat;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import maestro.control.gstcategoria;
import maestro.control.gstcompania;
import maestro.control.gstproducto;
import maestro.entity.categoria;
import maestro.entity.compania;
import reportes.form.reportesForm;

public class inventario_unidades_detallado_excel_ent extends Command {


	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "INVENTARIO_UNIDADES_DETALLADO_ENT" + ".xls";
		File archivo = new File(ruta, nomarch);
		gstcategoria gstcat = new gstcategoria();
		gstcompania gstcom = new gstcompania();
		gstproducto gstpro = new gstproducto();
		Collection registroscat = gstcat.getlistacategoria(repfor.getCompania());
		compania com = gstcom.getcompania(repfor.getCompania());
		Iterator itcat = registroscat.iterator();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		NumberFormat numero = new jxl.write.NumberFormat ("#,##0");
		WritableCellFormat formatonumero = new jxl.write.WritableCellFormat (numero);  
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
				hoja.addCell(new Label(0,renglon++,"INVENTARIO DE UNIDADES DETALLADO_ENT-"+com.getcomnombre(), format));
				hoja.addCell(new Label(0,renglon,"Fecha Generacion:", format));
				hoja.addCell(new Label(1,renglon++,repfor.getFecha(), format));
				hoja.addCell(new Label(0,renglon,"Categoria:", format));
				hoja.addCell(new Label(1,renglon++,cat.getcatnombre(), format));
				hoja.addCell(new Label(0, renglon, "Modelo", format));
				hoja.addCell(new Label(1, renglon, "Descripcion", format));
				hoja.addCell(new Label(2, renglon, "Subcategoria", format));
				hoja.addCell(new Label(3, renglon, "EAN", format));
				hoja.addCell(new Label(4, renglon, "Saldo Nacionalizado", format));
				hoja.addCell(new Label(5, renglon, "Saldo No Nacionalizado ", format));
				hoja.addCell(new Label(6, renglon, "Ave Pleg Nac", format));
				hoja.addCell(new Label(7, renglon, "Ave prod Nac", format));
				hoja.addCell(new Label(8, renglon, "Saldo Reservado", format));
				hoja.addCell(new Label(9, renglon, "Total", format));
				Collection registros = gstpro.getInvUniDetExcel_Ent(repfor.getCompania(), cat.getcatcodsx());
				Iterator it = registros.iterator();
				while (it.hasNext()) {
					renglon++;
					Collection datos = (Collection) it.next();
					Iterator data = datos.iterator();
					String prodcodsx = (String) data.next();
					String modelo = (String) data.next();
					String descripcion = (String) data.next();
					String procatoster = (String) data.next();
					String codigobarras = (String) data.next();
					String saldonac = (String) data.next();
					saldonac = saldonac==null?"0":saldonac;
					String saldonnac = (String) data.next();
					saldonnac = saldonnac==null?"0":saldonnac;
					String saldoreservado = (String) data.next();
					saldoreservado = saldoreservado==null?"0":saldoreservado;
					String total = (String) data.next();
					total = total==null?"0":total;
					BigDecimal p_total = new BigDecimal(total);
					String aveplegnac = null;
				    String aveprodnac = null;
				    String aveplegnnac = null;
				    String aveprodnnac = null;
					Collection averias = gstpro.getInvUniDetExcel_Ave(prodcodsx);
					Iterator itaverias = averias.iterator();
					while (itaverias.hasNext()) {
						Collection datos_ave = (Collection) itaverias.next();
						Iterator data_ave = datos_ave.iterator();
						aveplegnac = (String) data_ave.next();
						aveplegnac = aveplegnac==null?"0":aveplegnac;
					    aveprodnac = (String) data_ave.next();
					    aveprodnac = aveprodnac==null?"0":aveprodnac;
					    aveplegnnac = (String) data_ave.next();
					    aveplegnnac = aveplegnnac==null?"0":aveplegnnac;
					    aveprodnnac = (String) data_ave.next();
					    aveprodnnac = aveprodnnac==null?"0":aveprodnnac;
					}
					  jxl.write.Number labelNF = new jxl.write.Number (1,1,3.1415926, formatonumero);  
					  hoja.addCell (labelNF);
					  
					jxl.write.Number number = new jxl.write.Number (3, 4, 3.14159); // put the number 3.14159 in cell D5  
					p_total = p_total.add(new BigDecimal(aveplegnac));
					p_total = p_total.add(new BigDecimal(aveprodnac));
					hoja.addCell(new Label(0, renglon, modelo, format));
					hoja.addCell(new Label(1, renglon, descripcion, format));
					hoja.addCell(new Label(2, renglon, procatoster, format));
					hoja.addCell(new Label(3, renglon, codigobarras, format));
					hoja.addCell(new Number(4, renglon, Double.parseDouble(saldonac), formatonumero));
					hoja.addCell(new Number(5, renglon, Double.parseDouble(saldonnac), formatonumero));
					hoja.addCell(new Number(6, renglon, Double.parseDouble(aveplegnac), formatonumero));
					hoja.addCell(new Number(7, renglon, Double.parseDouble(aveprodnac), formatonumero));
					hoja.addCell(new Number(8, renglon, Double.parseDouble(saldoreservado), formatonumero));
					hoja.addCell(new Number(9, renglon, p_total.doubleValue(), formatonumero));
					t_saldonac =  t_saldonac.add(new BigDecimal(saldonac));
					t_saldonnac = t_saldonnac.add(new BigDecimal(saldonnac));
					t_aveplegnac = t_aveplegnac.add(new BigDecimal(aveplegnac));
					t_aveprodnac = t_aveprodnac.add(new BigDecimal(aveprodnac));
					t_total = t_total.add(new BigDecimal(p_total.toPlainString()));
					t_saldoreservado = t_saldoreservado.add(new BigDecimal(saldoreservado));
				}
				renglon++;
				hoja.addCell(new Label(0, renglon, "TOTALES", format));
				hoja.addCell(new Number(4, renglon, t_saldonac.doubleValue(), formatonumero));
				hoja.addCell(new Number(5, renglon, t_saldonnac.doubleValue(), formatonumero));
				hoja.addCell(new Number(6, renglon, t_aveplegnac.doubleValue(), formatonumero));
				hoja.addCell(new Number(7, renglon, t_aveprodnac.doubleValue(), formatonumero));
				hoja.addCell(new Number(8, renglon, t_saldoreservado.doubleValue(), formatonumero));
				hoja.addCell(new Number(9, renglon, t_total.doubleValue(), formatonumero));
			}
			book.write();
			book.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
