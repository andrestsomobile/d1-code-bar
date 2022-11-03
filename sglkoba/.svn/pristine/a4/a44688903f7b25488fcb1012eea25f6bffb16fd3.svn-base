package pedido.action;

import ingreso.control.gstentrada;
import ingreso.control.gstingreso;
import ingreso.entity.entrada;
import ingreso.entity.ingreso;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
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
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import maestro.control.gstcausal;
import maestro.control.gstcliente;
import maestro.control.gstproducto;
import maestro.entity.causal;
import maestro.entity.cliente;
import maestro.entity.producto;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import pedido.control.gstpedido;
import pedido.entity.pedido;

import util.Fecha;

public final class subirFacAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String destino = "subirFac";
		String ruta_llego = request.getParameter("ruta");
		HttpSession se = request.getSession(true);
		String ruta = (String) se.getAttribute("ruta_upload");
		if (ruta == null) {
			ruta = "/home/ricardo/uploads/";
		}
		String ruta_error = ruta + File.separator + "erroresFac";
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
		String nosub = "<br>LISTADO DE FACTURAS/PEDIDOS NO ACTUALIZADOS<br>" + "\n" + "\n";
		Workbook book = null;
		try {
			gstpedido gped = new gstpedido();
			boolean resp = true;
			book = Workbook.getWorkbook(new File(ruta));
			Sheet hoja = book.getSheet(0);
			int rows = hoja.getRows();
			int columns = hoja.getColumns();
			System.out.println(rows + " " + columns);
			String codcia = request.getParameter("compania");
			for (int i = 1; i < rows; i++) { // EL ARCHIVO TIENE ENCABEZADO
				Cell[] celdas = hoja.getRow(i);
				if (celdas[0].getContents() == null)
					continue; // no procesa lineas en blanco
				String numfac = celdas[0].getContents();
				String numped = celdas[1].getContents();
				try {
					numped = numped+celdas[2].getContents();
				} catch (Exception e) {
					e.printStackTrace();
				}
				pedido ped = gped.getpedido(codcia, numped);
				if (ped != null) {
					ped.setpedfactura(numfac);
					try {
						gped.updatepedido(ped);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				} else {
					nosub += "<br>El pedido " + numped + " no existe" + "\n";
				}
			} // cierra el for
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
			salida.println("BLOC DE ERRORES JDE-SGL " + "FECHA : " + fechahora + "\n<br>" + "<br>OBSERVACIONES :<br>" + "\n" + observaciones + "\n<br>" + "\n<br>" + nosub + "\n<br>" );
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
