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

public class reporte_inventario_vehiculos extends Command {

	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "Inventario_Vehiculos" + ".xls";
		File archivo = new File(ruta, nomarch);
		gstcompania gstcom = new gstcompania();
		reporte rep = new reporte();
		compania com = gstcom.getcompania(repfor.getCompania());
//		String fecha_ini = repfor.getFecha_ini();
//		String fecha_fin = repfor.getFecha_fin();
		String fecha_hoy = Fecha.getFecha();
		Collection registros = rep.getResumenInv(repfor.getCompania());
		Collection registros_det = rep.getDetalleInv(repfor.getCompania());
		Iterator it = registros.iterator();
		Iterator it_det = registros_det.iterator();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		NumberFormat numero = new jxl.write.NumberFormat ("#,##0");
		WritableCellFormat formatonumero = new jxl.write.WritableCellFormat (numero);  
		int renglon = 0;
		BigDecimal total_actual = new BigDecimal("0");
		BigDecimal total_serv = new BigDecimal("0");
		BigDecimal total_pdi = new BigDecimal("0");
		BigDecimal total_nac= new BigDecimal("0");
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("Inventario_Vehiculos", 0);
			hoja.addCell(new Label(0, renglon++, "Empresa: " + com.getcomnombre(), format));
			hoja.addCell(new Label(0, renglon, "Fecha: " + fecha_hoy, format));
			hoja.addCell(new Label(4, renglon++, "", format));
			hoja.addCell(new Label(0, renglon, "Marca", format));
			hoja.addCell(new Label(1, renglon, "Actual", format));
			hoja.addCell(new Label(2, renglon, "Serviautos", format));
			hoja.addCell(new Label(3, renglon, "Con PDI", format));
			hoja.addCell(new Label(4, renglon, "NAC", format));
			while (it.hasNext()) {
				renglon++;
				Collection datos = (Collection) it.next();
				Iterator data = datos.iterator();
				String marca = (String) data.next();
				String actual = (String) data.next();
				String serv = (String) data.next();
				String pdi = (String) data.next();
				String nac = (String) data.next();
				actual = actual != null ? actual : "0";
				serv = serv != null ? serv : "0";
				pdi = pdi != null ? pdi : "0";
				nac = nac != null ? nac : "0";
				total_actual = total_actual.add(new BigDecimal(actual));
				total_serv = total_serv.add(new BigDecimal(serv));
				total_pdi = total_pdi.add(new BigDecimal(pdi));
				total_nac = total_nac.add(new BigDecimal(nac));
				hoja.addCell(new Label(0, renglon, marca, format));
				hoja.addCell(new Number(1, renglon, Double.parseDouble(actual), formatonumero));
				hoja.addCell(new Number(2, renglon, Double.parseDouble(serv), formatonumero));
				hoja.addCell(new Number(3, renglon, Double.parseDouble(pdi), formatonumero));
				hoja.addCell(new Number(4, renglon, Double.parseDouble(nac), formatonumero));
			}
			renglon++;
			hoja.addCell(new Label(0, renglon, "TOTALES", format));
			hoja.addCell(new Number(1, renglon, total_actual.doubleValue(), formatonumero));
			hoja.addCell(new Number(2, renglon, total_serv.doubleValue(), formatonumero));
			hoja.addCell(new Number(3, renglon, total_pdi.doubleValue(), formatonumero));
			hoja.addCell(new Number(4, renglon, total_nac.doubleValue(), formatonumero));
			
			renglon++;
			int col = 0;
			// DETALLE DE VIN
			hoja.addCell(new Label(col++, renglon, "Code", format));
			hoja.addCell(new Label(col++, renglon, "Marca", format));
			hoja.addCell(new Label(col++, renglon, "Vin", format));
			hoja.addCell(new Label(col++, renglon, "Ubicacion", format));
			hoja.addCell(new Label(col++, renglon, "Alistamiento", format));
			hoja.addCell(new Label(col++, renglon, "Estado", format));
			hoja.addCell(new Label(col++, renglon, "Nac", format));
			hoja.addCell(new Label(col++, renglon, "FMM", format));
			hoja.addCell(new Label(col++, renglon, "Fecha Ingreso", format));
			hoja.addCell(new Label(col++, renglon, "BL", format));
			hoja.addCell(new Label(col++, renglon, "Novedad", format));
			
			while (it_det.hasNext()) {
				renglon++;
				col = 0;
				Collection datos_det = (Collection) it_det.next();
				Iterator data_det = datos_det.iterator();
				String devreferencia = (String) data_det.next();
				String devmarca = (String) data_det.next();
				String devvinchasis = (String) data_det.next();
				String devlocacion = (String) data_det.next();
				String devfechaalistamiento = (String) data_det.next();
				String devestado = (String) data_det.next();
				String es_nac = (String) data_det.next();
				String nvfmm = (String) data_det.next();
				String devfechaingreso = (String) data_det.next();
				String evdocumento = (String) data_det.next();
				String devnovedades = (String) data_det.next();
				
				hoja.addCell(new Label(col++, renglon, devreferencia, format));
				hoja.addCell(new Label(col++, renglon, devmarca, format));
				hoja.addCell(new Label(col++, renglon, devvinchasis, format));
				hoja.addCell(new Label(col++, renglon, devlocacion, format));
				hoja.addCell(new Label(col++, renglon, devfechaalistamiento, format));
				hoja.addCell(new Label(col++, renglon, devestado, format));
				hoja.addCell(new Label(col++, renglon, es_nac, format));
				hoja.addCell(new Label(col++, renglon, nvfmm, format));
				hoja.addCell(new Label(col++, renglon, devfechaingreso, format));
				hoja.addCell(new Label(col++, renglon, evdocumento, format));
				hoja.addCell(new Label(col++, renglon, devnovedades, format));
			}	
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

		public Collection getResumenInv(String codcia)  {
			String consulta = "select dev.devmarca,count(1),d1.serviautos,d2.pdi,d3.nac " + 
				"from detalleentradavehiculo dev " +
				"left outer join (select dev1.devmarca, count(dev1.devcodsx) as serviautos from detalleentradavehiculo dev1 where dev1.devestado in ('SER','SERVIAUTOS') group by dev1.devmarca ) as d1 on d1.devmarca = dev.devmarca " +
				"left outer join (select dev2.devmarca, count(dev2.devcodsx) as pdi from detalleentradavehiculo dev2 where dev2.devfechaalistamiento = 'SI' and dev2.devestado != 'ENTREGADO' group by dev2.devmarca ) as d2 on d2.devmarca = dev.devmarca " +
				"left outer join (select dev3.devmarca, count(dev3.devcodsx) as nac from detalleentradavehiculo dev3 where dev3.devcodsx in (select nvcodvin from nacionalizacionvehiculo) and dev3.devestado != 'ENTREGADO' group by dev3.devmarca ) as d3 on d3.devmarca = dev.devmarca " +
				"where dev.devestado != 'ENTREGADO' " + 
				"group by dev.devmarca,d1.serviautos,d2.pdi,d3.nac " +
				"order by devmarca " ;
			
			return getListaDeListas(consulta);
		}

		public Collection getDetalleInv(String codcia)  {
			String consulta = "select devreferencia, devmarca, devvinchasis, devlocacion, devfechaalistamiento,devestado,case when nvcodsx is null then 'NO' else 'SI' end as es_nac,nvfmm,devfechaingreso,evdocumento,devnovedades " +
				"from detalleentradavehiculo " +
				"inner join entradavehiculo on devcodentrada = evcodsx " + 
				"left outer join nacionalizacionvehiculo on nvcodvin = devcodsx " +
				"where devestado != 'ENTREGADO' " + 
				"order by devcodsx " ;
			
			return getListaDeListas(consulta);
		}

	}
}
