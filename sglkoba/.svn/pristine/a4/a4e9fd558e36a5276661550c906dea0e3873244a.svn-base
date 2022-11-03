package reportes.util;

import java.io.File;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import db.GstTabla;
import db.beanConnector;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import maestro.control.gstcompania;
import maestro.entity.compania;
import reportes.form.reportesForm;

public class reporte_kardex_bl extends Command {

	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {

		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "Kardex_BL" + ".xls";
		File archivo = new File(ruta, nomarch);
		gstcompania gstcom = new gstcompania();
		reporte rep = new reporte();
		compania com = gstcom.getcompania(repfor.getCompania());
		String saldoinicial = rep.getSaldoInicial(repfor.getCompania(), repfor.getEmbarque(),repfor.getFecha_ini());
		Collection registros = rep.getListaMvtos(repfor.getCompania(), repfor.getEmbarque(),repfor.getFecha_ini(), repfor.getFecha_fin());
		Iterator it = registros.iterator();
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);
		int renglon = 0;
		saldoinicial = saldoinicial == null ? "0":saldoinicial;
		BigDecimal saldo = new BigDecimal(saldoinicial);
		BigDecimal total = new BigDecimal("0");
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("Kardex_BL", 0);
			hoja.addCell(new Label(0, renglon++, "Kardex por BL: " + repfor.getEmbarque() + " " + com.getcomnombre(), format));
			hoja.addCell(new Label(0, renglon, "Saldo Inicial", format));
			hoja.addCell(new Label(4, renglon++, saldoinicial, format));
			hoja.addCell(new Label(0, renglon, "Tipo", format));
			hoja.addCell(new Label(1, renglon, "Fecha", format));
			hoja.addCell(new Label(2, renglon, "Entrada", format));
			hoja.addCell(new Label(3, renglon, "Salida", format));
			hoja.addCell(new Label(4, renglon, "Saldo", format));
			while (it.hasNext()) {
				renglon++;
				Collection datos = (Collection) it.next();
				Iterator data = datos.iterator();
				String tipo = (String) data.next();
				String fecha = (String) data.next();
				String entrada = (String) data.next();
				String salida = (String) data.next();
				saldo = saldo.add(new BigDecimal(entrada));
				saldo = saldo.subtract(new BigDecimal(salida));
				total = total.add(saldo);
				hoja.addCell(new Label(0, renglon, tipo, format));
				hoja.addCell(new Label(1, renglon, fecha, format));
				hoja.addCell(new Label(2, renglon, entrada, format));
				hoja.addCell(new Label(3, renglon, salida, format));
				hoja.addCell(new Label(4, renglon, saldo.toPlainString(), format));
			}
			renglon++;
			//hoja.addCell(new Label(0, renglon, "TOTALES", format));
			//hoja.addCell(new Label(4, renglon, total.toPlainString(), format));
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

		public String getSaldoInicial(String codcia, String documento, String fecha_ini)  {
			String consulta = "select sum(cant) from (select kardfechaing as fecha,sum(kardcantingreso) as cant from trafico left join ingreso on (ingtrafico=trafcodsx) left join kardex on (kardcodigoingreso = ingcodsx) " +
			" where trafcompania = " + codcia + " and trafdocumento = '" + documento + "' group by kardfechaing " +
			" union " + 
			" select despfecha as fecha,-1*sum(referencia_despacho_pedido.refdcant) as cant from despacho, despacho_pedido, referencia_despacho, referencia_despacho_pedido,referencia_pedido, pedido, nacionalizacion, nacionalizacion_detalle, ingreso, trafico " +
			" where despcodsx = despeddespacho and despedcodsx = refddespacho_pedido and refdcodsx = refdpcodrefd and refdcodrefp = refpcodsx and refpnumpedido = pedcodsx and refpnacdetalle is not null and refpnacdetalle = nadcodsx and nadcodnac = naccodsx and nacingreso = ingcodsx and ingtrafico = trafcodsx " +
			" and trafcompania = " + codcia + " and trafdocumento = '" + documento + "' group by despfecha) as x " +
			" where fecha < '" + fecha_ini + "'";
			//" where fecha between '" + fecha_ini + "' and '" + fecha_fin + "'" + "order by 2 asc";
			
			return getCampo(consulta);
		}

		public Collection getListaMvtos(String codcia, String documento, String fecha_ini, String fecha_fin) {
			String consulta = "select * from (select 'Entrada' as tipo,kardfechaing as fecha, sum(kardcantingreso) as cant_entrada,0 as cant_salida from trafico left join ingreso on (ingtrafico=trafcodsx) left join kardex on (kardcodigoingreso = ingcodsx) " +
			" where trafcompania = " + codcia + " and trafdocumento = '" + documento + "' group by kardfechaing " +
			" union " + 
			" select 'Salida' as tipo, despfecha as fecha, 0 as cant_entrada, sum(referencia_despacho_pedido.refdcant) as cant_salida from despacho, despacho_pedido, referencia_despacho, referencia_despacho_pedido,referencia_pedido, pedido, nacionalizacion, nacionalizacion_detalle, ingreso, trafico " +
			" where despcodsx = despeddespacho and despedcodsx = refddespacho_pedido and refdcodsx = refdpcodrefd and refdcodrefp = refpcodsx and refpnumpedido = pedcodsx and refpnacdetalle is not null and refpnacdetalle = nadcodsx and nadcodnac = naccodsx and nacingreso = ingcodsx and ingtrafico = trafcodsx " +
			" and trafcompania = " + codcia + " and trafdocumento = '" + documento + "' group by 1,despfecha) as x " +
			" where fecha between '" + fecha_ini + "' and '" + fecha_fin + "'" + "order by 2 asc";
			return getListaDeListas(consulta);
		}
	}
}
