package ingreso.action;

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

import util.Fecha;

public final class subirRMAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String destino = "subirRM";
		String ruta_llego = request.getParameter("ruta");
		// System.out.println("=====>request.ruta " + ruta_llego);
		HttpSession se = request.getSession(true);
		String ruta = (String) se.getAttribute("ruta_upload");
		if (ruta == null) {
			ruta = "/home/ricardo/uploads/";
		}
		String ruta_error = ruta + File.separator + "erroresRMJDE";
		ruta = ruta + obtieneNombreArchivo(ruta_llego);
		String mensaje = "";
		// String ruta_error = "/home/ricardo/uploads/erroresRMJDE";
		// System.out.println("=====>va a cargar el archivo");
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
		// System.out.println("=====>inicio con " + ruta);
		String mensaje = "";
		String observaciones = "";
		String fechahora = Fecha.getFecha();
		String nosub = "<br>LISTADO DE DEVOLUCIONES NO SUBIDOS<br>" + "\n" + "\n";
		String refnosub = "\n" + "<br>LISTADO DE REFERENCIAS <br>" + "\n";
		Workbook book = null;
		try {
			gstingreso ging = new gstingreso();
			gstproducto gprod = new gstproducto();
			gstentrada gent = new gstentrada();
			gstcausal gcausal = new gstcausal();
			gstcliente gcliente = new gstcliente();

			boolean resp = true;
			book = Workbook.getWorkbook(new File(ruta));
			Sheet hoja = book.getSheet(0); // Hoja Items
			int rows = hoja.getRows();
			int columns = hoja.getColumns();
			System.out.println(rows + " " + columns);

			for (int i = 1; i < rows; i++) { // EL ARCHIVO TIENE ENCABEZADO
				Cell[] celdas = hoja.getRow(i);
				if (celdas[0].getContents() == null)
					continue; // no procesa lineas en blanco
				String ingcodcia = request.getParameter("compania");
				String ingfecha = Fecha.getFecha();
				String ingtipo = "DEVOLUCION";
				String ingtrafico = null;
				String ingobservacion = "RM " + celdas[0].getContents();
				String ingestado = "TRAMITE";
				String ingcausal = celdas[10].getContents();
				causal cau = gcausal.getcausalpornombre(ingcausal);
				if (cau != null) {
					ingcausal = cau.getcaucodsx();
				} else {
					refnosub += "<br>La devolucion " + ingobservacion + " Causal " + ingcausal + " no existe" + "\n";
					cau = gcausal.getcausalpornombre("Indefinido");
					if (cau != null) {
						ingcausal = cau.getcaucodsx();
					} else {
						refnosub += "<br>La devolucion " + ingobservacion + " Causal Indefinido no existe" + "\n";
						ingcausal = null;
					}
				}
				String ingclidevolucion = celdas[9].getContents();
				String ingciudad_dev = null;
				cliente cli = gcliente.getcliente_porCiayNom(ingcodcia, ingclidevolucion);
				if (cli != null) {
					ingclidevolucion = cli.getclicodsx();
					ingciudad_dev = cli.getcliciudad();
				} else {
					refnosub += "<br>La devolucion " + ingobservacion + " Cliente " + ingclidevolucion + " no existe" + "\n";
					cli = gcliente.getcliente_porCiayNom(ingcodcia, "Indefinido");
					if (cli == null) {
						try {
							gcliente.crearcliente("INDEFINIDO", "INDEFINIDO", "INDEFINIDO", "INDEFINIDO", "76001", "INDEFINIDO", "INDEFINIDO", "INDEFINIDO", ingcodcia, "N", "N");
							cli = gcliente.getcliente_porCiayNom(ingcodcia, "Indefinido");
						} catch (SQLException e) {
							refnosub += "<br>La devolucion " + ingobservacion + " Cliente Indefinido no se puede crear" + "\n";
							ingclidevolucion = null;
						}
					}
					if (cli != null) {
						ingclidevolucion = cli.getclicodsx();
						ingciudad_dev = cli.getcliciudad();
					} else {
						refnosub += "<br>La devolucion " + ingobservacion + " Cliente Indefinido no existe" + "\n";
						ingclidevolucion = null;
					} 
				}

				String ingconsec = "0";
				String ingconseczfp = "0";
				String ingplanilla = celdas[11].getContents();
				String ingpesoneto = "0";
				String ingpesobruto = "0";
				String ingfob = "0";
				String ingcantidad = "0";
				int valorcant;

				// si el RM no existe se crea, si existe y esta en tramite se agrega solo la entrada
				ingreso ing = ging.getingresoByKA(ingcodcia, ingobservacion);
				if (ing == null) {
					if (ingcausal != null && ingclidevolucion != null) {
						try {
							resp &= ging.crearingreso(ingcodcia, ingfecha, ingtipo, ingtrafico, ingobservacion, ingestado, ingcausal, ingclidevolucion, ingpesoneto, ingpesobruto, ingfob, ingcantidad, ingciudad_dev, ingconsec, ingconseczfp, ingplanilla);
						} catch (SQLException e) {
							nosub += "<br>\nLa devolucion " + ingobservacion + " no se pudo crear.";
						}
					} else {
						nosub += "<br>\nLa devolucion " + ingobservacion + " no tiene causal y/o cliente.";
					}
				} else {
					nosub += "<br>\nLa devolucion " + ingobservacion + " ya existe.";
				}
				ing = ging.getingresoByKA(ingcodcia, ingobservacion);
				if (ing == null) {
					continue;
				} else if (ing != null && ing.getIngestado().equals("TRAMITE")) {
					try {
						String referencia = celdas[16].getContents();
						producto pro = gprod.getproductoByUk(ingcodcia, referencia);
						if (pro == null) { // la referencia no existe
							refnosub += "<br>La devolucion " + ingobservacion + " Modelo " + referencia + " no existe" + "\n";
						} else {
							String entcodingreso = ing.getingcodsx();
							String entcodproducto = pro.getprocodsx();
							String entbodega = "18";
							String entposicion = "UNICA";
							entrada ent = gent.getentrada(entcodingreso, entcodproducto, entbodega, entposicion);
							if (ent != null) {
								refnosub += "<br>La devolucion " + ingobservacion + " Modelo " + referencia + " ya existe entrada en " + entbodega + "-" + entposicion + "\n";
							} else {
								String entcantidad = celdas[32].getContents();
								try {
									valorcant = Integer.parseInt(entcantidad);
									valorcant = valorcant * -1; // por que viene negativo
									if (valorcant > 0) { // validar cantidad negativa
										try {
											String entpesoneto = pro.getprokiloreal();
											String entpesonetototal = (Float.parseFloat(entpesoneto) * valorcant) + "";
											String entpesobruto = pro.getprokiloreal(); // pro.getpropesobmp(); modificado soilictud Orlando Mayo 16 / 2014
											String entpesobrutototal = (Float.parseFloat(entpesobruto) * valorcant) + "";
											String entsaldopesoneto = "0";
											String entsaldopesobruto = "0";
											String entsaldonac = "0";
											String entsaldosinnac = "0";
											String entvalor = "0";
											String entvalortotal = "0";
											String entsaldonacf = "0";
											String entsaldosinnacf = "0";
											String entunidad = "U";
											String entlote = "";
											gent.crearentrada(entcodingreso, entcodproducto, entbodega, entposicion, valorcant + "", entpesoneto, entpesonetototal, entpesobruto, entpesobrutototal, entsaldopesoneto, entsaldopesobruto, entsaldonac, entsaldosinnac, entvalor, entvalortotal,
													entsaldonacf, entsaldosinnacf, entunidad, entlote);
										} catch (Exception e) {
											refnosub += "<br>La devolucion " + ingobservacion + " Modelo " + referencia + " no se pudo crear" + "\n";
										}
									} else {
										refnosub += "<br>La devolucion " + ingobservacion + " Modelo " + referencia + " tiene cantidad negativa" + "\n";
									}
								} catch (Exception e) {
									refnosub += "<br>La devolucion " + ingobservacion + " Modelo " + referencia + " no tiene cantidad valida" + e.getMessage() + "\n";
								}

							}
						}
					} catch (Exception e) { // (SQLException e) {
						e.printStackTrace();
						nosub += "<br>\nLa devolucion " + ingobservacion + " No se pudo crear La devolucion";
					}
				} else {
					nosub += "<br>\nLa devolucion " + ingobservacion + " se encuentra en estado FINALIZADO<br>";
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
			salida.println("BLOC DE ERRORES JDE-SGL " + "FECHA : " + fechahora + "\n<br>" + "<br>OBSERVACIONES :<br>" + "\n" + observaciones + "\n<br>" + "\n<br>" + nosub + "\n<br>" + refnosub);
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
		 System.out.println("=====>ruta " + ruta);
		String fileName = null;
		int pos = ruta.lastIndexOf("\\");
		// System.out.println("=====>pos " + pos);
		File f = new File(ruta);
		String dir = f.getPath();
		// System.out.println("=====>getName " + f.getName());
		fileName = ruta.substring(pos + 1);
		 System.out.println("=====>fileName " + fileName);
		return fileName;
	}

}
