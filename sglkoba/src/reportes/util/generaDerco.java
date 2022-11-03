package reportes.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.NumberFormat;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import maestro.control.gstcompania;
import maestro.entity.compania;
import reportes.form.reportesForm;
import util.Fecha;
import db.GstTabla;
import db.beanConnector;

public class generaDerco extends Command {
	
	public reporte rep = new reporte();
	
	public reporte getRep() {
		return rep;
	}

	public void setRep(reporte rep) {
		this.rep = rep;
	}

	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "derco" + File.separator;
		String nomarch = "datos.txt";
		String nomarchHis = "datosHis.txt";
		String nomarchresumen = "datosresumen.js";
		String nomarchexcel = "derco.xls";
		File archivoexcel = new File(ruta, nomarchexcel);
		gstcompania gstcom = new gstcompania();
		compania com = gstcom.getcompania("136");
		String fecha_hoy = Fecha.getFecha();
		Collection registros = rep.getResumenInv(repfor.getCompania());
		Collection registros_det = rep.getDetalle(repfor.getCompania());
		Collection registros_detHis = rep.getDetalleHis(repfor.getCompania());
		Iterator it = registros.iterator();
		Iterator it_det = registros_det.iterator();
		Iterator it_detHis = registros_detHis.iterator();
		int renglon = 0;
		BigDecimal total_actual = new BigDecimal("0");
		BigDecimal total_serv = new BigDecimal("0");
		BigDecimal total_pdi = new BigDecimal("0");
		BigDecimal total_nac= new BigDecimal("0");

		try {
			BufferedWriter outinfo = new BufferedWriter(new FileWriter(ruta+nomarchresumen, false));	
	    	outinfo.write("document.write('<tbody>"); 
			while (it.hasNext()) {
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
				outinfo.write("<tr><td>" + marca + "</td><td>" + actual + "</td><td>" + serv + "</td><td>" + pdi + "</td><td>" + nac + "</td></tr>" ); 
			}
			outinfo.write("</tbody>");
			outinfo.write("<tfoot>");
			outinfo.write("<tr><td>" + "TOTALES" + "</td><td>" + total_actual + "</td><td>" + total_serv + "</td><td>" + total_pdi + "</td><td>" + total_nac + "</td></tr>"); 
			outinfo.write("</tfoot>');");
			outinfo.close();
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } 

		// DETALLE DE VIN
		int cantidadreg = registros_det.size();
		int numreg = 0;
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivoexcel);
			WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
			WritableCellFormat format = new WritableCellFormat(letra);
			NumberFormat numero = new jxl.write.NumberFormat ("#,##0");
			WritableCellFormat formatonumero = new jxl.write.WritableCellFormat (numero);  
			BufferedWriter outinfo = new BufferedWriter(new FileWriter(ruta+nomarch, false));
			outinfo.write("{" + "\n" + "\"aaData\": [");
			String linea = null;
			WritableSheet hoja = book.createSheet("Derco", 0);
			int col = 0;
			hoja.addCell(new Label(col,renglon++,"INVENTARIO DERCO", format));
			hoja.addCell(new Label(col++, renglon, "CILCICO", format));
			hoja.addCell(new Label(col++, renglon, "CODE", format));
			hoja.addCell(new Label(col++, renglon, "MARCA", format));
			hoja.addCell(new Label(col++, renglon, "ENGINE", format));
			hoja.addCell(new Label(col++, renglon, "VIN", format));
			hoja.addCell(new Label(col++, renglon, "UBICACION", format));
			hoja.addCell(new Label(col++, renglon, "COLOR", format));
			hoja.addCell(new Label(col++, renglon, "FECHA DESPACHO", format));
			hoja.addCell(new Label(col++, renglon, "ALIST.", format));
			hoja.addCell(new Label(col++, renglon, "ESTADO", format));
			hoja.addCell(new Label(col++, renglon, "DESTINO", format));
			hoja.addCell(new Label(col++, renglon, "TRANSP", format));
			hoja.addCell(new Label(col++, renglon, "NAC", format));
			hoja.addCell(new Label(col++, renglon, "FECHA INGRESO", format));
			hoja.addCell(new Label(col++, renglon, "BL", format));
			hoja.addCell(new Label(col++, renglon, "NOVEDAD", format));
			hoja.addCell(new Label(col++, renglon++, "FMM", format));
			while (it_det.hasNext()) {
				numreg++;
				col = 0;
				System.out.print(" " + numreg);
				Collection datos_det = (Collection) it_det.next();
				Iterator data_det = datos_det.iterator();
				String ciclico = (String) data_det.next();
				String devreferencia = (String) data_det.next();
				String devmarca = (String) data_det.next();
				String devmotor = (String) data_det.next();
				String devvinchasis = (String) data_det.next();
				String devlocacion = (String) data_det.next();
				String devcolor = (String) data_det.next();
				String dvfecha = (String) data_det.next();
				String devfechaalistamiento = (String) data_det.next();
				String devestado = (String) data_det.next();
				String ciunombre = (String) data_det.next();
				String transpnombre = (String) data_det.next();
				String es_nac = (String) data_det.next();
				String devfechaingreso = (String) data_det.next();
				String evdocumento = (String) data_det.next();
				String devnovedades = (String) data_det.next();
				String nvfmm = (String) data_det.next();
				linea = "[" + "\"" + ciclico + "\"" + "," + "\"" + devreferencia + "\"" + "," + "\"" + devmarca + "\"" + "," + "\"" + devmotor + "\"" + "," + "\"" + devvinchasis + "\"" + "," + "\"" + devlocacion + "\"" + "," + "\"" + devcolor + "\"" + "," 
				+ "\"" + dvfecha + "\"" + "," + "\"" + devfechaalistamiento + "\"" + "," + "\"" + devestado + "\"" + "," + "\"" + ciunombre + "\"" + "," + "\"" + transpnombre + "\"" + "," + "\"" + es_nac + "\"" + "," + "\"" + devfechaingreso + "\"" + "," 
				+ "\"" +evdocumento + "\"" + "," + "\"" + devnovedades + "\"" + "," + "\"" + nvfmm + "\"" + "]";

				if (numreg != cantidadreg) {
					linea = linea + "," + "\n";
				}
				//linea = "<tr><td>" + devreferencia + "</td><td>" + devmarca + "</td><td>" + devmotor + "</td><td>" + devvinchasis + "</td><td>" + devlocacion + "</td><td>" + devcolor + "</td><td>" + dvfecha + "</td><td>" + devfechaalistamiento + "</td><td>" + devestado + "</td><td>" + ciunombre + "</td><td>" + transpnombre + "</td><td>" + es_nac + "</td><td>" + devfechaingreso + "</td><td>" +evdocumento + "</td><td>" + devnovedades + "</td><td>" + nvfmm + "</td></tr>";
				linea = linea.replaceAll("null", "");
				outinfo.write(linea);
				hoja.addCell(new Label(col++, renglon, ciclico, format));
				hoja.addCell(new Label(col++, renglon, devreferencia, format));
				hoja.addCell(new Label(col++, renglon, devmarca, format));
				hoja.addCell(new Label(col++, renglon, devmotor, format));
				hoja.addCell(new Label(col++, renglon, devvinchasis, format));
				hoja.addCell(new Label(col++, renglon, devlocacion, format));
				hoja.addCell(new Label(col++, renglon, devcolor, format));
				hoja.addCell(new Label(col++, renglon, dvfecha, format));
				hoja.addCell(new Label(col++, renglon, devfechaalistamiento, format));
				hoja.addCell(new Label(col++, renglon, devestado, format));
				hoja.addCell(new Label(col++, renglon, ciunombre, format));
				hoja.addCell(new Label(col++, renglon, transpnombre, format));
				hoja.addCell(new Label(col++, renglon, es_nac, format));
				hoja.addCell(new Label(col++, renglon, devfechaingreso, format));
				hoja.addCell(new Label(col++, renglon, evdocumento, format));
				hoja.addCell(new Label(col++, renglon, devnovedades, format));
				hoja.addCell(new Label(col++, renglon++, nvfmm, format));
			}	
			outinfo.write("\n ] }");
			//outinfo.write("</tbody>" + "\n");
			outinfo.close();
			book.write();
			book.close();
	    } catch (Exception e) {
			e.printStackTrace();
		}
		
		

		// DETALLE DE VIN historico
		cantidadreg = registros_detHis.size();
		numreg = 0;
		try {
			BufferedWriter outinfo = new BufferedWriter(new FileWriter(ruta+nomarchHis, false));
			outinfo.write("{" + "\n" + "\"aaData\": [");
			String linea = null;
			while (it_detHis.hasNext()) {
				numreg++;
				System.out.print(" " + numreg);
				Collection datos_det = (Collection) it_detHis.next();
				Iterator data_det = datos_det.iterator();
				String devreferencia = (String) data_det.next();
				String devmarca = (String) data_det.next();
				String devmotor = (String) data_det.next();
				String devvinchasis = (String) data_det.next();
				String devlocacion = (String) data_det.next();
				String devcolor = (String) data_det.next();
				String dvfecha = (String) data_det.next();
				String devfechaalistamiento = (String) data_det.next();
				String devestado = (String) data_det.next();
				String ciunombre = (String) data_det.next();
				String transpnombre = (String) data_det.next();
				String es_nac = (String) data_det.next();
				String devfechaingreso = (String) data_det.next();
				String evdocumento = (String) data_det.next();
				String devnovedades = (String) data_det.next();
				String nvfmm = (String) data_det.next();
				linea = "[" + "\"" + devreferencia + "\"" + "," + "\"" + devmarca + "\"" + "," + "\"" + devmotor + "\"" + "," + "\"" + devvinchasis + "\"" + "," + "\"" + devlocacion + "\"" + "," + "\"" + devcolor + "\"" + "," 
				+ "\"" + dvfecha + "\"" + "," + "\"" + devfechaalistamiento + "\"" + "," + "\"" + devestado + "\"" + "," + "\"" + ciunombre + "\"" + "," + "\"" + transpnombre + "\"" + "," + "\"" + es_nac + "\"" + "," + "\"" + devfechaingreso + "\"" + "," 
				+ "\"" +evdocumento + "\"" + "," + "\"" + devnovedades + "\"" + "," + "\"" + nvfmm + "\"" + "]";

				if (numreg != cantidadreg) {
					linea = linea + "," + "\n";
				}
				//linea = "<tr><td>" + devreferencia + "</td><td>" + devmarca + "</td><td>" + devmotor + "</td><td>" + devvinchasis + "</td><td>" + devlocacion + "</td><td>" + devcolor + "</td><td>" + dvfecha + "</td><td>" + devfechaalistamiento + "</td><td>" + devestado + "</td><td>" + ciunombre + "</td><td>" + transpnombre + "</td><td>" + es_nac + "</td><td>" + devfechaingreso + "</td><td>" +evdocumento + "</td><td>" + devnovedades + "</td><td>" + nvfmm + "</td></tr>";
				linea = linea.replaceAll("null", "");
				outinfo.write(linea);
			}	
			outinfo.write("\n ] }");
			//outinfo.write("</tbody>" + "\n");
			outinfo.close();
	    } catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	public class reporte extends GstTabla {
		
		public reporte() {
			db = new beanConnector();
		}

		public Collection getResumenInv(String codcia)  {
			String consulta = "select dev.marca,count(1),d1.serviautos,d2.pdi,d3.nac " + 
					"from cargue dev " +
					"left outer join (select dev1.marca, count(dev1.vin) as serviautos from cargue dev1 where dev1.estado in ('SER','SERVIAUTOS') group by dev1.marca ) as d1 on d1.marca = dev.marca " +
					"left outer join (select dev2.marca, count(dev2.vin) as pdi from cargue dev2 where dev2.alist = 'SI' and dev2.estado != 'ENTREGADO' group by dev2.marca ) as d2 on d2.marca = dev.marca " +
					"left outer join (select dev3.marca, count(dev3.vin) as nac from cargue dev3 where dev3.nac ='SI' and dev3.estado != 'ENTREGADO' group by dev3.marca ) as d3 on d3.marca = dev.marca " +
					"where dev.estado != 'ENTREGADO' " + 
					"group by dev.marca,d1.serviautos,d2.pdi,d3.nac " +
					"order by marca " ;	
			
			return getListaDeListas(consulta);
		}	
		

		
		public Collection getDetalle(String codcia)  {
			String consulta = "SELECT ciclico,code, marca, engine, vin, ubicacion, color, to_char(fechadespacho,'YYYY-MM-DD') as fechadespacho, alist, estado, destino, transp, nac, to_char(fechaingreso,'YYYY-MM-DD') as fechaingreso, bl, novedad, fmm " +
					" FROM patios.cargue " +
					" where estado = 'PATIOS' " +
					" order by marca, vin ";
			return getListaDeListas(consulta);
		}
		
		public Collection getDetalleHis(String codcia)  {
			String consulta = "SELECT code, marca, engine, vin, ubicacion, color, to_char(fechadespacho,'YYYY-MM-DD')  as fechadespacho, alist, estado, destino, transp, nac, to_char(fechaingreso,'YYYY-MM-DD') as fechaingreso, bl, novedad, fmm " +
					" FROM patios.cargue " +
					" where estado = 'ENTREGADO' " +
					" order by marca, vin ";
			return getListaDeListas(consulta);
		}		
		
		
	}
}
