package reportes.util;

import java.io.File;
import util.Math;
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

public class inventario_producto_valorizado_excel extends Command {


	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "INVENTARIO_VALORIZADO" + ".xls";
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
                                String total_reporte_can="0";
                                String total_reporte_val="0";
                                
				BigDecimal t_saldonac = new BigDecimal(0);
				BigDecimal t_saldonnac = new BigDecimal(0);
				BigDecimal t_cosdolnac = new BigDecimal(0);
				BigDecimal t_cosdolnnac = new BigDecimal(0);
				BigDecimal t_can_total = new BigDecimal(0);
				BigDecimal t_val_total = new BigDecimal(0);
				categoria cat = (categoria) itcat.next();
				WritableSheet hoja = book.createSheet(cat.getcatnombre(), 0);
				hoja.addCell(new Label(0,renglon++,"INVENTARIO DE UNIDADES VALORIZADO-"+com.getcomnombre(), format));
				hoja.addCell(new Label(0,renglon,"Fecha Seleccionada:", format));
				hoja.addCell(new Label(1,renglon++,repfor.getFecha(), format));
				hoja.addCell(new Label(0,renglon,"Categoria:", format));
				hoja.addCell(new Label(1,renglon++,cat.getcatnombre(), format));
				hoja.addCell(new Label(0, renglon, "Modelo", format));
				hoja.addCell(new Label(1, renglon, "Descripcion", format));
				hoja.addCell(new Label(2, renglon, "Saldo Nacionalizado", format));
				hoja.addCell(new Label(3, renglon, "Saldo No Nacionalizado ", format));
				hoja.addCell(new Label(4, renglon, "Costo Nacionalizado", format));
				hoja.addCell(new Label(5, renglon, "Costo No Nacionalizado", format));
				hoja.addCell(new Label(6, renglon, "Cantidad Total", format));
				hoja.addCell(new Label(7, renglon, "Costo Total US", format));
				Collection registros;
                            registros = gstpro.getInvUniValExcel(repfor.getCompania(), cat.getcatcodsx(), repfor.getFecha());
				Iterator it = registros.iterator();
				while (it.hasNext()) {
					renglon++;
					Collection datos = (Collection) it.next();
					Iterator data = datos.iterator();
                                        String Procodsx = (String) data.next();
                                        String modelo = (String) data.next();
					String descripcion = (String) data.next();
					String saldonac = (String) data.next();
					String saldonnac = (String) data.next();
					
                                        String max_ingreso=gstpro.getMaxingresoTrafico(Procodsx);
                                        String valor_cif=gstpro.getCIFReferenciaProducto(Procodsx, max_ingreso);
                                        
                                        String cosdolnac=Math.multiplicar(saldonac,valor_cif);
                                        String cosdolnnac=Math.multiplicar(saldonnac,valor_cif);
		
		
                                        String can_total=Math.sumar(saldonac,saldonnac);
                                        String val_total=Math.sumar(cosdolnac,cosdolnnac);
		
                                        total_reporte_can=Math.sumar(can_total,total_reporte_can);
                                        total_reporte_val=Math.sumar(val_total,total_reporte_val);
                                        
                                        //String cosdolnac = (String) data.next();
					//String aveprodnac = (String) data.next();
					//String total = (String) data.next();
					//String saldoreservado = (String) data.next();
					hoja.addCell(new Label(0, renglon, modelo, format));
					hoja.addCell(new Label(1, renglon, descripcion, format));
					hoja.addCell(new Label(2, renglon, saldonac, format));
					hoja.addCell(new Label(3, renglon, saldonnac, format));
					hoja.addCell(new Label(4, renglon, cosdolnac, format));
					hoja.addCell(new Label(5, renglon, cosdolnnac, format));
					hoja.addCell(new Label(6, renglon, can_total, format));
					hoja.addCell(new Label(7, renglon, val_total, format));
					
					t_saldonac =  t_saldonac.add(new BigDecimal(saldonac));
					t_saldonnac = t_saldonnac.add(new BigDecimal(saldonnac));
					t_cosdolnac = t_cosdolnac.add(new BigDecimal(cosdolnac));
					t_cosdolnnac = t_cosdolnnac.add(new BigDecimal(cosdolnnac));
					t_can_total = t_can_total.add(new BigDecimal(can_total));
					t_val_total = t_val_total.add(new BigDecimal(val_total));
				}
				renglon++;
				hoja.addCell(new Label(0, renglon, "TOTALES", format));
				hoja.addCell(new Label(2, renglon, t_saldonac.toPlainString(), format));
				hoja.addCell(new Label(3, renglon, t_saldonnac.toPlainString(), format));
				hoja.addCell(new Label(4, renglon, t_cosdolnac.toPlainString(), format));
				hoja.addCell(new Label(5, renglon, t_cosdolnnac.toPlainString(), format));
				hoja.addCell(new Label(6, renglon, t_can_total.toPlainString(), format));
				hoja.addCell(new Label(7, renglon, t_val_total.toPlainString(), format));
			}
			book.write();
			book.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
