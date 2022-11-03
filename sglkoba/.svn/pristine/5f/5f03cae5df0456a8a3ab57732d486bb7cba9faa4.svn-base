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
import maestro.control.gstcompania;
import maestro.entity.compania;
import reportes.form.reportesForm;
import reportes.util.reporte_kardex_bl.reporte;
import util.Fecha;
import db.GstTabla;
import db.beanConnector;

public class reporte_diario_vehiculos extends Command {

	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "Reporte_Diario_Vehiculos" + ".xls";
		File archivo = new File(ruta, nomarch);
		gstcompania gstcom = new gstcompania();
		reporte rep = new reporte();
		compania com = gstcom.getcompania(repfor.getCompania());
		String fecha_ini = repfor.getFecha_ini();
		String fecha_fin = repfor.getFecha_fin();
		String fecha_hoy = Fecha.getFecha();
		Collection registros = rep.getDatos(repfor.getCompania(), fecha_ini, fecha_fin);
		Iterator it = registros.iterator();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		NumberFormat numero = new jxl.write.NumberFormat ("#,##0");
		WritableCellFormat formatonumero = new jxl.write.WritableCellFormat (numero);  
		int renglon = 0;
		BigDecimal total_saldoi = new BigDecimal("0");
		BigDecimal total_entrada = new BigDecimal("0");
		BigDecimal total_salida = new BigDecimal("0");
		BigDecimal total_saldo = new BigDecimal("0");
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("Reporte_Diario_Vehiculos", 0);
			hoja.addCell(new Label(0, renglon++, "Empresa: " + com.getcomnombre(), format));
			hoja.addCell(new Label(0, renglon, "Fecha: " + fecha_hoy, format));
			hoja.addCell(new Label(4, renglon++, "", format));
			hoja.addCell(new Label(0, renglon, "Fecha", format));
			hoja.addCell(new Label(1, renglon, "Entradas", format));
			hoja.addCell(new Label(2, renglon, "Salidas", format));
			hoja.addCell(new Label(3, renglon, "Saldo", format));
			hoja.addCell(new Label(4, renglon, "Total a Pagar", format));
			while (it.hasNext()) {
				renglon++;
				Collection datos = (Collection) it.next();
				Iterator data = datos.iterator();
				String fecha = (String) data.next();
				String saldoi = (String) data.next();
				String entradas = (String) data.next();
				String salidas = (String) data.next();
				String saldo = (String) data.next();
				saldoi = saldoi != null ? saldoi : "0";
				entradas = entradas != null ? entradas : "0";
				salidas = salidas != null ? salidas : "0";
				saldo = saldo != null ? saldo : "0";
				total_saldoi = total_saldoi.add(new BigDecimal(saldoi));
				total_entrada = total_entrada.add(new BigDecimal(entradas));
				total_salida = total_salida.add(new BigDecimal(salidas));
				total_saldo = total_saldo.add(new BigDecimal(saldo));
				hoja.addCell(new Label(0, renglon, fecha, format));
				hoja.addCell(new Number(1, renglon, Double.parseDouble(entradas), formatonumero));
				hoja.addCell(new Number(2, renglon, Double.parseDouble(salidas), formatonumero));
				hoja.addCell(new Number(3, renglon, Double.parseDouble(saldo), formatonumero));
			}
			renglon++;
			hoja.addCell(new Label(0, renglon, "TOTALES", format));
			hoja.addCell(new Number(1, renglon, total_entrada.doubleValue(), formatonumero));
			hoja.addCell(new Number(2, renglon, total_salida.doubleValue(), formatonumero));
			hoja.addCell(new Number(3, renglon, total_saldo.doubleValue(), formatonumero));

			book.write();
			book.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public class reporte extends GstTabla {
		
		public reporte() {
			db = new beanConnector();
		}

		public Collection getDatos(String codcia, String fi, String ff)  {
			String consulta = "select '  mifi ' as fechamov, sum(1) as saldoanterior , 0 as entradasdia , 0 as salidasdia , 0 as saldofinal " +   
            "from detalleentradavehiculo de " +  
            "left outer join entradavehiculo  ev on ev.evcodsx = de.devcodentrada " +   
            "where (  de.devfechaingreso < '" + fi + "' and  de.devfechasalida >= '" + fi + "') or " +  
            "( de.devfechaingreso < '" + fi + "' and  de.devfechasalida is null) " +  
            "union  " +  
            "select to_char(fm.inicial,'yyyy/mm/dd') as fechamov ,0 as saldo, " +  
            "(select sum(1) from detalleentradavehiculo de  " + 
            "left outer join entradavehiculo  ev on ev.evcodsx = de.devcodentrada " +  
            "where de.devfechaingreso between fm.inicial and fm.final and de.devfechasalida is not null) as entradasdia , " +  
            "(select sum(1) from detalleentradavehiculo de  " + 
            "left outer join entradavehiculo  ev on ev.evcodsx = de.devcodentrada " +  
            "where de.devfechasalida between fm.inicial and fm.final and de.devfechasalida is not null) as salidasdia , " +  
            "0 as saldofinal  " + 
            "from fechadiaria fm  " + 
            "where fm.inicial >= '" + fi + "' and fm.final <= '" + ff + "' order by 1;" ;
			
			return getListaDeListas(consulta);
		}

	}
}
