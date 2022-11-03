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

public class generaInvOnline extends Command {
	
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
		String ruta = request.getRealPath("") + File.separator + "inv_online" + File.separator;
		String nomarch = "datos.txt";
		String nomarchexcel = "inv_online.xls";
		File archivoexcel = new File(ruta, nomarchexcel);
		String fecha_hoy = Fecha.getFecha();
		Collection registros = rep.getResumen_saldos_embarque(repfor.getCompania(),"",fecha_hoy);

		Iterator it = registros.iterator();

		int renglon = 0;

		int cantidadreg = registros.size();
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
			WritableSheet hoja = book.createSheet("InvOnline", 0);
			int col = 0;
			hoja.addCell(new Label(col,renglon++,"INVENTARIO", format));
			hoja.addCell(new Label(col++, renglon, "Ingreso", format));
			hoja.addCell(new Label(col++, renglon, "Embarque", format));
			hoja.addCell(new Label(col++, renglon, "Documento", format));
			hoja.addCell(new Label(col++, renglon, "DTA", format));
			hoja.addCell(new Label(col++, renglon, "Fecha", format));
			hoja.addCell(new Label(col++, renglon, "Modelo", format));
			hoja.addCell(new Label(col++, renglon, "Descripcion", format));
			hoja.addCell(new Label(col++, renglon, "Cantidad", format));
			hoja.addCell(new Label(col++, renglon, "Peso Neto", format));
			hoja.addCell(new Label(col++, renglon, "Peso Bruto", format));
			hoja.addCell(new Label(col++, renglon, "Saldo Peso Neto", format));
			hoja.addCell(new Label(col++, renglon, "Saldo Peso Bruto", format));
			hoja.addCell(new Label(col++, renglon, "Saldo NAC", format));
			hoja.addCell(new Label(col++, renglon, "Saldo NNAC", format));
			hoja.addCell(new Label(col++, renglon, "Saldo Total", format));
			hoja.addCell(new Label(col++, renglon, "Averia Pleg NAC", format));
			hoja.addCell(new Label(col++, renglon, "Averia Pleg NNAC", format));
			hoja.addCell(new Label(col++, renglon, "Averia Prod NAC", format));
			hoja.addCell(new Label(col++, renglon, "Averia Pdro NNAC", format));
			
			while (it.hasNext()) {
				numreg++;
				col = 0;
				System.out.print(" " + numreg);
				Collection datos_det = (Collection) it.next();
				Iterator data_det = datos_det.iterator();
				String c1 = (String) data_det.next();
				String c2 = (String) data_det.next();
				String c3 = (String) data_det.next();
				String c4 = (String) data_det.next();
				String c5 = (String) data_det.next();
				String c6 = (String) data_det.next();
				String c7 = (String) data_det.next();
				String c8 = (String) data_det.next();
				String c9 = (String) data_det.next();
				String c10 = (String) data_det.next();
				String c11 = (String) data_det.next();
				String c12 = (String) data_det.next();
				String c13 = (String) data_det.next();
				String c14 = (String) data_det.next();
				String c15 = (String) data_det.next();
				String c16 = (String) data_det.next();
				String c17 = (String) data_det.next();
				String c18 = (String) data_det.next();
				String c19 = (String) data_det.next();
				linea = "[" + "\"" + c1 + "\"" + "," + "\"" + c2 + "\"" + "," + "\"" + c3 + "\"" + "," + "\"" + c4 + "\"" + "," + "\"" + c5 + "\"" + "," + "\"" + c6 + "\"" + "," + "\"" + c7 + "\"" + "," 
				+ "\"" + c8 + "\"" + "," + "\"" + c9 + "\"" + "," + "\"" + c10 + "\"" + "," + "\"" + c11 + "\"" + "," + "\"" + c12 + "\"" + "," + "\"" + c13 + "\"" + "," + "\"" + c14 + "\"" + "," 
				+ "\"" + c15 + "\"" + "," + "\"" + c16 + "\"" + "," + "\"" + c17 + "\"" + "," + "\"" + c18 + "\"" + "," + "\"" + c19 + "\"" + "]";

				if (numreg != cantidadreg) {
					linea = linea + "," + "\n";
				}
				linea = linea.replaceAll("null", "");
				outinfo.write(linea);
				hoja.addCell(new Label(col++, renglon, c1, format));
				hoja.addCell(new Label(col++, renglon, c2, format));
				hoja.addCell(new Label(col++, renglon, c3, format));
				hoja.addCell(new Label(col++, renglon, c4, format));
				hoja.addCell(new Label(col++, renglon, c5, format));
				hoja.addCell(new Label(col++, renglon, c6, format));
				hoja.addCell(new Label(col++, renglon, c7, format));
				hoja.addCell(new Label(col++, renglon, c8, format));
				hoja.addCell(new Label(col++, renglon, c9, format));
				hoja.addCell(new Label(col++, renglon, c10, format));
				hoja.addCell(new Label(col++, renglon, c11, format));
				hoja.addCell(new Label(col++, renglon, c12, format));
				hoja.addCell(new Label(col++, renglon, c13, format));
				hoja.addCell(new Label(col++, renglon, c14, format));
				hoja.addCell(new Label(col++, renglon, c15, format));
				hoja.addCell(new Label(col++, renglon, c16, format));
				hoja.addCell(new Label(col++, renglon, c17, format));
				hoja.addCell(new Label(col++, renglon, c18, format));
				hoja.addCell(new Label(col++, renglon++, c19, format));
			}	
			outinfo.write("\n ] }");
			outinfo.close();
			book.write();
			book.close();
	    } catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

	public class reporte extends GstTabla {
		
		public reporte() {
			db = new beanConnector();
		}

		public Collection getResumen_saldos_embarque(String codcia, String embarque, String fecha)  {
			String consulta = "select " +
					"ingcodsx,trafembarque,trafdocumento,trafnumdta,ingfecha,promodelo,prodescripcion, " +
					"sum(entcantidad) as cantidad,sum(entpesoneto) as pesoneto,sum(entpesobruto) as pesobruto, " +
					"sum(entsaldopesoneto) as saldopesoneto,sum(entsaldopesobruto) as saldopesobruto, " +
					"sum(entsaldonac) as saldonac,sum(entsaldosinnac) as saldosinnac,sum(entsaldonac+entsaldosinnac) as saldototal, " +
					"sum(avecant_pleg_nac) as avplegnac, sum(avecant_pleg_nnac) as avplegnnac, " +
					"sum(avecant_prod_nac) as avprodnac, sum(avecant_prod_nnac) as avpprodnnac " +
					"from resumen_saldos_embarque(" + codcia + ", '%" + embarque +"%' " + ", '" + fecha + "') " +
					"inner join entrada on entcodingreso = ingcodsx " +
					"inner join producto on procodsx = entcodproducto " +
					"left join averia on aveentrada = entcodsx " +
					"group by ingcodsx,trafembarque,trafdocumento,trafnumdta,ingfecha,promodelo,prodescripcion ";
			return getListaDeListas(consulta);
		}
			
		
		
	}
}
