package reportes.util;

import java.io.File;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import administracion.entity.usuario;
import jxl.Workbook;
import jxl.write.Formula;
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
import db.GstTabla;
import db.beanConnector;

public class informe_pedidos_pendientes extends Command {

	public reporte rep = new reporte();
	
	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {
		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "Informe_Pedidos_Pendientes" + ".xls";
		File archivo = new File(ruta, nomarch);
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);

		String vectorTit[] = {
				"Pedido"
				,"Empresa"
				,"Cliente"
				,"No. Solicitud"
				,"No. Petra"
				,"Guia"
				,"Fecha Sistema"
				,"Fecha Pedido"
				,"Destino"
				};
		int renglon = 0;
		int col = 0;
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("Informe_Pedidos_Pendientes", 0);
			hoja.addCell(new Label(0,renglon++,"INFORME PEDIDOS PENDIENTES DE DESPACHO", format));
			hoja.addCell(new Label(0,renglon,"Fechas Seleccionadas:", format));
			hoja.addCell(new Label(1,renglon++,repfor.getFecha_ini() + " a " + repfor.getFecha_fin(), format));

			for(int i = 0; i < vectorTit.length; i++){
				hoja.addCell(new Label(col++, renglon, vectorTit[i], format));
			}
			
			usuario usu = (usuario)request.getSession(true).getAttribute("usuario");
			String grupo = usu.getusugrupo();
			
			Collection registros = null;
			registros = rep.informe(repfor.getFecha_ini(), repfor.getFecha_fin());			
			
			Iterator it = registros.iterator();			
			while (it.hasNext()) {
				renglon++;
				col = 0;
				Collection datos = (Collection) it.next();
				Iterator data = datos.iterator();
				while (data.hasNext()) {
					String val =  (String) data.next();
					hoja.addCell(new Label(col++, renglon, val, format));
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

	
		public Collection informe(String fecha_ini, String fecha_fin)  {
			
			if(fecha_ini!=null && fecha_ini.indexOf(" ")==-1) fecha_ini += " 00:00:00";
			if(fecha_fin!=null && fecha_fin.indexOf(" ")==-1) fecha_fin+= " 23:59:59";
			
			String consulta = "select pedcodsx, comnombre, clinombre, pednumpedido, pedordencompra, pedguia, pedfechasistema, pedfecha, ciunombre from pedido \r\n" + 
					"inner join compania on comcodsx = pedcompania\r\n" + 
					"inner join cliente on clicodsx = pedcliente\r\n" + 
					"inner join ciudad on ciucodigo = pedciudad\r\n" + 
					"where pedcodsx in   \r\n" + 
					"(select distinct pedcodsx \r\n" + 
					" from pedido, referencia_pedido \r\n" + 
					" where pedfechasistema between '" + fecha_ini + "' and '" + fecha_fin + "'\r\n" + 
					//" and pedestado='FINALIZADO' \r\n" + 
					" and pedcodsx = refpnumpedido  \r\n" + 
					" and NOT EXISTS ( select * from despacho_pedido where despedpedido = pedcodsx  )  \r\n" + 
					" group by pedcodsx \r\n" + 
					" having sum(refpsaldo)>0  ) \r\n" + 
					" order by pedcodsx";
			return getListaDeListas(consulta);
		}
		
		
		
	}
		
}
