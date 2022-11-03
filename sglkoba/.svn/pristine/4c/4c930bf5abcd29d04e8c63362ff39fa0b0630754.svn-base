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

public class movimientos_calidad extends Command {

	public reporte rep = new reporte();
	
	public void execute(String ruta, HttpServletRequest request, reportesForm repfor) {
		exportar(request, repfor);
	}

	private void exportar(HttpServletRequest request, reportesForm repfor) {
		String ruta = request.getRealPath("") + File.separator + "uploads" + File.separator;
		String nomarch = "Movimientos_Calidad" + ".xls";
		File archivo = new File(ruta, nomarch);
		WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
		WritableCellFormat format = new WritableCellFormat(letra);

		String vectorTit[] = {
				"Fecha"
				,"Remision de Salida"
				,"Material"
				,"Descripcion"
				,"Pedido"
				,"Sucursal"
				,"Cantidad"
				,"Estibas"
				,"Vencimiento Lote"
				,"Lote"
				,"Trasportadora"
				,"Placa"
				,"Tipo Veh"
				,"Observaciones"
				,"Alisto"
				,"Reviso"
				,"Precinto"
				,"Guia/Remesa"
				,"Fecha Entrada Veh"
				,"Hora Entrada Veh"
				,"Fecha Salida Veh"
				,"Hora Salida Veh"
				,"Costo Flete"
				};
		int renglon = 0;
		int col = 0;
		try {
			WritableWorkbook book = Workbook.createWorkbook(archivo);
			WritableSheet hoja = book.createSheet("Movimientos_Calidad", 0);
			hoja.addCell(new Label(0,renglon++,"MOVIMIENTOS BODEGA CALIDAD", format));
			hoja.addCell(new Label(0,renglon,"Fechas Seleccionadas:", format));
			hoja.addCell(new Label(1,renglon++,repfor.getFecha_ini() + " a " + repfor.getFecha_fin(), format));

			for(int i = 0; i < vectorTit.length; i++){
				hoja.addCell(new Label(col++, renglon, vectorTit[i], format));
			}
			
			usuario usu = (usuario)request.getSession(true).getAttribute("usuario");
			String grupo = usu.getusugrupo();
			
			Collection registros = rep.informe(repfor.getFecha_ini(), repfor.getFecha_fin());
				
			
			
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

	
		public Collection informe (String fecha_ini, String fecha_fin)  {
			
			if(fecha_ini!=null && fecha_ini.indexOf(" ")==-1) fecha_ini += " 00:00:00";
			if(fecha_fin!=null && fecha_fin.indexOf(" ")==-1) fecha_fin+= " 23:59:59";
			
			String consulta = "select distinct \r\n" + 
					"d.despfecha as \"Fecha\", d.despcodsx, pro.promodelo as \"Material\", regexp_replace(pro.prodescripcion, E'[\\\\n\\\\r]+', ' ', 'g') as \"Descripcion\", p.pednumpedido as \"Pedido\", s.sucnombre as \"Sucursal\", rd.refdcant as \"Cantidad\", round(rd.refdcant/pro.prounimasterpac) as \"Estibas\"\r\n" + 
					", string_agg(distinct to_char(l.ltrafvencimiento,'yyyy-mm-dd')::text,',') as \"Vencimiento Lote\", string_agg(distinct l.ltraflote::text,',') as \"Lote\", t.transpnombre as \"Trasportadora\", d.despplaca as \"Placa\", d.desptipoveh as \"Tipo Veh\", regexp_replace(d.despobservacion, E'[\\\\n\\\\r]+', ' ', 'g') as \"Observaciones\", emp.empnombre as \"Alisto\", 'N/A' as \"Reviso\", d.depprecinto as \"Precinto\"\r\n" + 
					", depguiaremesa, despfechalv as \"Fecha Entrada Veh\", desphoralv as \"Hora Entrada Veh\", despfechasv as \"Fecha Salida Veh\", desphorasv as \"Hora Salida Veh\"\r\n" + 
					", coalesce(despcostoflete,'0.00') " +
					"from despacho d\r\n" + 
					"inner join despacho_pedido dp on dp.despeddespacho = d.despcodsx\r\n" + 
					"inner join referencia_despacho rd on rd.refddespacho_pedido = dp.despedcodsx \r\n" + 
					"inner join producto pro on pro.procodsx = rd.refdproducto\r\n" + 
					"inner join pedido p on p.pedcodsx = dp.despedpedido\r\n" + 
					"inner join sucursal s on s.succodsx = pedsucursal\r\n" + 
					"inner join referencia_despacho_pedido rdp on rdp.refdpcodrefd = rd.refdcodsx \r\n" + 
					"inner join referencia_pedido rp on rp.refpcodsx = rdp.refdcodrefp\r\n" + 
					"inner join entrada e on e.entcodsx = rp.refpentrada\r\n" + 
					"inner join lote_trafico l on l.ltrafcodsx = e.entlote\r\n" + 
					"inner join transportadora t on t.transpcodsx = desptransportadora\r\n" + 
					"inner join registro_pedido_detalle rgpd on rgpd.rpdenumpedido = p.pedcodsx\r\n" + 
					"inner join registro_pedido rgp on rgp.repecodsx = rpderegped\r\n" + 
					"inner join empleado emp on emp.empcodsx = rgp.repeempleado\r\n" + 
					"where d.despfecha between '" + fecha_ini + "' and '" + fecha_fin + "'\r\n" + 
					"and entbodega = 11\r\n" + 
					"group by d.despfecha, d.despcodsx, pro.promodelo, pro.prodescripcion, p.pednumpedido, s.sucnombre, rd.refdcant, round(rd.refdcant/pro.prounimasterpac), t.transpnombre\r\n" + 
					", d.despplaca, d.desptipoveh,d.despobservacion, emp.empnombre, d.depprecinto, depguiaremesa, despfechalv, desphoralv, despfechasv, desphorasv, despcostoflete\r\n" +
					"order by 1 ";
			return getListaDeListas(consulta);
		}
		
		
		
	}
		
}
