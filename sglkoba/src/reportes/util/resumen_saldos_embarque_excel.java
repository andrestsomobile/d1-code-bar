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
import util.Fecha;
import db.GstTabla;
import db.beanConnector;

public class resumen_saldos_embarque_excel extends Command {


	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "resumen_saldos_embarque" + ".xls";
		File archivo = new File(ruta, nomarch);
		reporte rep = new reporte();

		Collection registros = null;
		String fecha = Fecha.getFecha();
		registros = rep.getResumen_saldos_embarque(repfor.getCompania(),repfor.getEmbarque(),fecha);

		Iterator it = registros.iterator();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		int renglon = 0;
		try {			
			int col = 0;
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("ResumenSaldosEmbarque", 0); 

			
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
				renglon++;
				col= 0;
				Collection datos = (Collection) it.next();
				Iterator data = datos.iterator();
				while (data.hasNext()) {
					hoja.addCell(new Label(col++, renglon, (String) data.next(), format));
				}
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
