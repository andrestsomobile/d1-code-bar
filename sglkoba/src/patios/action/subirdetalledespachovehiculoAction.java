package patios.action;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.Cell;
import jxl.CellType;
import jxl.DateCell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import patios.control.gstdespachovehiculo;
import patios.control.gstdetalleentradavehiculo;
import patios.control.gstdetalledespachovehiculo;
import patios.control.gstdetallepedidovehiculo;
import patios.entity.despachovehiculo;
import patios.entity.detalleentradavehiculo;
import patios.entity.detallepedidovehiculo;
import util.Fecha;

public final class subirdetalledespachovehiculoAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String destino = "subirdetalledespachovehiculo";
		String ruta_llego = request.getParameter("ruta");
		HttpSession se = request.getSession(true);
		String ruta = (String) se.getAttribute("ruta_upload");
		if (ruta == null) {
			ruta = "/home/ricardo/uploads/";
		}
		String ruta_error = ruta + File.separator + "erroresdespachoVeh";
		ruta = ruta + obtieneNombreArchivo(ruta_llego);
		String mensaje = "";
		try {
			cargarArchivo(ruta, ruta_error, request);
			mensaje = "Proceso Automatico Terminado... Para detalle sobre Observaciones Verifique Bloc de Errores";
		} catch (java.io.IOException ioex) {
			System.out.println("se presento el error: " + ioex.toString());
		}
		ActionMessages e = getErrors(request);
		e.add("general", new ActionMessage(mensaje, false));
		addErrors(request, e);
		return mapping.findForward(destino);
	}

	private void cargarArchivo(String ruta, String ruta_error, HttpServletRequest request) throws IOException {
		String mensaje = "";
		String observaciones = "";
		String fechahora = Fecha.getFecha();
		String nosub = "<br>RELACION REGISTROS NO CARGADOS<br>" + "\n" + "\n";
		Workbook book = null;
		gstdetalledespachovehiculo control = new gstdetalledespachovehiculo();
		gstdetalleentradavehiculo gdev = new gstdetalleentradavehiculo();
		gstdetallepedidovehiculo gdpv = new gstdetallepedidovehiculo();
		gstdespachovehiculo gdv = new gstdespachovehiculo();
		try {
			boolean resp = true;
			book = Workbook.getWorkbook(new File(ruta));
			Sheet hoja = book.getSheet(0);
			int rows = hoja.getRows();
			int columns = hoja.getColumns();
			System.out.println(rows + " " + columns);
			String dvcodsx = request.getParameter("dvcodsx");
			despachovehiculo dv = gdv.getdespachovehiculo(dvcodsx);
			if (dv != null && dv.getDvestado().equalsIgnoreCase("TRAMITE")) {
				for (int i = 1; i < rows; i++) { // EL ARCHIVO TIENE ENCABEZADO
					//VIN
					Cell[] celdas = hoja.getRow(i);
					if (celdas[0].getContents() == null)
						continue; // no procesa lineas en blanco
					String devvinchasis = celdas[0].getContents();
					detalleentradavehiculo dev = gdev.getdetalleentradavehiculo_vin(devvinchasis);
					if (dev != null && !dev.getDevestado().equalsIgnoreCase("ENTREGADO")) {
						detallepedidovehiculo dpv = gdpv.getdetallepedidovehiculo_vin(dev.getDevcodsx());
						if (dpv != null) {
							try {
								int ddvcodsx = control.creardetalledespachovehiculo(dvcodsx, dpv.getDpvcodsx());
								if (ddvcodsx == 0) {
									nosub += "<br>El vin " + devvinchasis + " no se cargo" + "\n";
								}
							} catch (SQLException se) {
								nosub += "<br>El vin " + devvinchasis + " no se cargo" + "\n";
							}
						} else {
							nosub += "<br>El vin " + devvinchasis + " no esta asociado al pedido " + dv.getDvcodpedido()+ "\n";
						}
					} else {
						nosub += "<br>El vin " + devvinchasis + " no existe o ya esta ENTREGADO" + "\n";
					}
				} // cierra el for
			} else {
				nosub += "<br>El despacho " + dvcodsx + " no existe o no esta en estado TRAMITE" + "\n";
			}
			book.close();
		} catch (IOException e) {
			e.printStackTrace();
			observaciones += "<br>\nError en el archivo";
			book.close();
		} catch (BiffException e) {
			observaciones += "<br>\nError en el archivo";
			e.printStackTrace();
			book.close();
		}

		try {
			FileWriter fw = new FileWriter(ruta_error + getFechaNombreArchivo() + ".htm");
			BufferedWriter bw = new BufferedWriter(fw);
			PrintWriter salida = new PrintWriter(bw);
			salida.println("ERRORES CARGUE " + "FECHA : " + fechahora + "\n<br>" + "<br>OBSERVACIONES :<br>" + "\n" + observaciones + "\n<br>" + "\n<br>" + nosub + "\n<br>" );
			salida.close();
			mensaje = "Proceso Automatico Terminado... Para detalle sobre Observaciones Verifique Bloc de Errores";
		} catch (java.io.IOException ioex) {
			System.out.println("se presento el error: " + ioex.toString());
		}
	}

	public String getFechaNombreArchivo() {
		DecimalFormat df = new DecimalFormat("00");
		Calendar x = Calendar.getInstance();
		int anno = x.get(Calendar.YEAR);
		int mes = x.get(Calendar.MONTH) + 1;
		int dia = x.get(Calendar.DATE);
		int hora = x.get(Calendar.HOUR_OF_DAY);
		int min = x.get(Calendar.MINUTE);
		int seg = x.get(Calendar.SECOND);
		return df.format(anno) + df.format(mes) + df.format(dia) + "_" + df.format(hora) + df.format(min) + df.format(seg);
	}

	private static String obtieneNombreArchivo(String ruta) {
		// System.out.println("=====>ruta " + ruta);
		String fileName = null;
		int pos = ruta.lastIndexOf("\\");
		// System.out.println("=====>pos " + pos);
		File f = new File(ruta);
		String dir = f.getPath();
		// System.out.println("=====>getName " + f.getName());
		fileName = ruta.substring(pos + 1);
		// System.out.println("=====>fileName " + fileName);
		return fileName;
	}

}
