package ingreso.action;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.Cell;
import jxl.CellType;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;
import maestro.control.gstbodega;
import maestro.control.gstconfig_bodega;
import maestro.control.gstproducto;
import maestro.control.gsttipoproducto;
import maestro.entity.bodega;
import maestro.entity.producto;
import maestro.entity.tipoproducto;
import nacionalizacion.control.gstnacionalizacion_detalle;
import nacionalizacion.entity.nacionalizacion_detalle;
import registro.control.gstregistro_almacenamiento_detalle;
import registro.form.registro_almacenamientoForm;
import util.Fecha;
import util.Math;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import db.beanConnector;
import ingreso.control.gstentrada;
import ingreso.control.gstingreso;
import ingreso.control.gstreubic_nacdetalle;
import ingreso.control.gstreubicacion;
import ingreso.entity.entrada;
import ingreso.entity.ingreso;
import ingreso.entity.reubicacion;
import ingreso.form.reubicacionForm;

public final class actualizarPosicionesAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		String ruta_llego = request.getParameter("ruta");
		File f = new File(ruta_llego);
		HttpSession se = request.getSession(true);
		String nombrearch = f.getName();
		nombrearch = nombrearch.substring(nombrearch.lastIndexOf("\\") + 1, nombrearch.length());
		String ruta = (String) se.getAttribute("ruta_upload") + nombrearch;// ruta donde quedo subido el archivo
		String trafico = request.getParameter("ingcodsx");
		System.out.println("***********************ruta_llego:" + ruta_llego);
		System.out.println("***********************ruta:" + ruta);
		String mensaje = "";
		String destino = "actualizarPosiciones";
		Vector inc = new Vector();
		try {
			inc = importar(ruta, trafico);
			mensaje = "Proceso Automatico Terminado... Para detalle sobre Observaciones verifique Log de Errores";
		} catch (Exception e) {
			mensaje = "Error al procesar... " + e.getLocalizedMessage();
		}
		
		ActionMessages e = getErrors(request);
		e.add("general", new ActionMessage(mensaje, false));
		addErrors(request, e);
		request.getSession().setAttribute("inconsistencias", inc);
		return mapping.findForward(destino);
	}

	public Vector importar (String ruta_archivo, String trafico) {
		Vector inconsistencias = new Vector();
		beanConnector db = new beanConnector();
		gstproducto gpro = new gstproducto();
		gstingreso ging = new gstingreso();
		gstentrada gent = new gstentrada();
		gstconfig_bodega gcbod = new gstconfig_bodega();
		gstbodega gbod = new gstbodega();
		String ingcodsx = "";
		
		int total = 0;
		int hechas = 0;
		try {
			Workbook book = Workbook.getWorkbook(new File(ruta_archivo));
			Sheet hoja = book.getSheet(0); 
			int rows = hoja.getRows();
			int columns = hoja.getColumns();
			System.out.println(rows + " " + columns);
			total = rows-1;

			for (int i = 1; i < rows; i++) { //EL ARCHIVO TIENE ENCABEZADO
				Cell[] celdas = hoja.getRow(i);
				if (celdas == null || (celdas != null && celdas.length < 9)) {
					inconsistencias.add("Error en la estructura. Son 9 celdas. " +
					"Los encabezados de las columnas son: MATERIAL/DESCRIPCIÓN/UMP/NUMERO DE IMP/CANTIDAD/BODEGA ACTUAL/POSICION ACTUAL/BODEGA NUEVA/POSICION NUEVA");
					break;
				}
                int col = 0;

				String	material = celdas[col++].getContents();
				String	descripcion	= celdas[col++].getContents();
				String	ump= celdas[col++].getContents();
				String	importacion	= celdas[col++].getContents();
				
				String	cantidad = ( (celdas[col].getType() == CellType.NUMBER)?((NumberCell) celdas[col]).getValue():0 ) + "";col++;
				String	bodegaactual = celdas[col++].getContents(); 
				String	posicionactual = celdas[col++].getContents(); 
				String	bodeganueva = celdas[col++].getContents(); 
				String	posicionnueva = celdas[col++].getContents(); 
				

				try {
					ingreso ing = ging.getIngresoByTrafico(trafico);
					
					if(ing == null) {
						inconsistencias.add("En fila " + rows + ": Material " + material + " la posicion "+ posicionnueva +" no es valida, la importación es incorrecta, validar con el trafico");
					} else {

						producto pro = gpro.getproductoByUk(ing.getingcodcia(), material);
						bodega bod_actual = gbod.getbodega_by_ukey(bodegaactual);
						bodega bod_nueva = gbod.getbodega_by_ukey(bodeganueva);
						if (bod_actual != null) {
							entrada ent = gent.getentradaActualizarPosicion(ing.getingcodsx(), pro.getprocodsx(), bod_actual.getbodcodsx(), posicionactual);/// OJO se esta validando siempre con la bodega 1
							if (ent != null) { 
								
								if (bod_nueva != null) {
									if (gcbod.es_posicion_valida(bod_nueva.getbodcodsx(), posicionnueva)) {  /// OJO se esta validando siempre con la bodega 1
										
										
										String mensaje = crearReubicacion(ent, bod_nueva.getbodcodsx(), posicionnueva, ing.getingcodsx());
										
										if(mensaje != null && !mensaje.isEmpty()) {
											inconsistencias.add("En fila " + rows + ": Material " + material + " la posicion "+ posicionnueva + " " + mensaje);
										}
										//gent.updatePosicion(ent.getentcodsx(), posicionnueva,bod_nueva.getbodcodsx());
										hechas++;
									} else {
										inconsistencias.add("En fila " + rows + ": Material " + material + " la posicion "+ posicionnueva +" no es valida, esta ocupada o es un tunel");
									}
								} else {
									inconsistencias.add("En fila " + rows + ": Bodega Nueva " + bodeganueva + " no existe");
								}
							} else {
								inconsistencias.add("En fila " + rows + ": Material " + material + " no se encontro en la posicion "+ posicionactual);
							}
						} else {
							inconsistencias.add("En fila " + rows + ": Bodega Actual " + bodegaactual + " no existe");
						}
					}
					
				} catch (Exception e) {
					e.printStackTrace();
					inconsistencias.add("En fila " + rows + ": Material " + material + " en la posicion "+ posicionactual + " se presento error " + e.getLocalizedMessage());

				}
				
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			inconsistencias.add("Error en archivo. " + ex.getMessage());
			hechas = 0;
		}
		if (hechas != 0) {
			inconsistencias.add("Importacion exitosa. Se cargaron " + hechas + " de un total de " + total + " registros.");
		} else {
			inconsistencias.add("Se presentaron errores al cargar el archivo.");
		}
		return inconsistencias;
	}
	
	public String crearReubicacion(entrada entor, String bodegafin, String posicionfin, String reingreso) {
		String reestado = "FINALIZADO"; // una reubicacion se crea finalizada y se puede activar, pero validando que no este
		String mensaje = null;
		String reentradaor = entor.getentcodsx();
		String retipo = "NACIONALIZADO";
		
		if(Integer.parseInt(entor.getentsaldosinnac()) > 0) {
			retipo = "SINNACIONALIZAR";
		}
		
		String reentradafin = null;

		String recodcia = null;
		String refecha = Fecha.getFecha();
		String retipomov = "FISICO";

		boolean resp = true;
		beanConnector db = new beanConnector(false);
		gstreubicacion control = new gstreubicacion(db);
		gstentrada gent = new gstentrada(db);
		gstnacionalizacion_detalle gnacdet = new gstnacionalizacion_detalle(db);
		gstreubic_nacdetalle grnac = new gstreubic_nacdetalle(db);
		gstconfig_bodega gcbod = new gstconfig_bodega();
		
		boolean estunel = gcbod.es_tunel(bodegafin, posicionfin);
		if (estunel) {
			mensaje = "La posicion de destino " + posicionfin + " esta en un TUNEL";
		} else {
			try {

				// primero saco la entrada original y sus datos
				reingreso = entor.getentcodingreso();
				//bodegafin = entor.getEntbodega();
				reubicacionForm rf = new reubicacionForm();
				gstproducto gpro = new gstproducto();
				gsttipoproducto gtp = new gsttipoproducto();
				producto pro = gpro.getproducto(entor.getentcodproducto());
				recodcia = pro.getprocodigocia();
				tipoproducto tipopro = gtp.gettipoproducto(pro.getprotipoproducto());
				String recantidad = pro.getprounimasterpac();
				//String miposicionfin = tipopro.gettiprcodigo() + posicionfin;
				
				//if (!bodegafin.equals(entor.getEntbodega()) || !posicionfin.equals(entor.getentposicion())) {
				if ( !posicionfin.equals(entor.getentposicion())) {

					BigDecimal pesoneto_or = new BigDecimal(entor.getentpesoneto());
					BigDecimal pesobruto_or = new BigDecimal(entor.getentpesobruto());
					BigDecimal saldopesoneto_or = new BigDecimal(entor.getentsaldopesoneto());
					BigDecimal saldopesobruto_or = new BigDecimal(entor.getentsaldopesobruto());
					BigDecimal saldonac_or = new BigDecimal(entor.getentsaldonac());
					BigDecimal saldosinnac_or = new BigDecimal(entor.getentsaldosinnac());

					BigDecimal valor = new BigDecimal(entor.getEntvalor());
					BigDecimal valortotal = valor.multiply(new BigDecimal(recantidad));
					BigDecimal recant = new BigDecimal(recantidad);
					// primero creo la entrada de destino:

					BigDecimal pesonetototal = pesoneto_or.multiply(recant);
					BigDecimal pesobrutototal = pesobruto_or.multiply(recant);
					BigDecimal saldopesoneto_dest = pesonetototal;
					BigDecimal saldopesobruto_dest = pesobrutototal;
					BigDecimal saldonac_dest = BigDecimal.ZERO;
					BigDecimal saldosinnac_dest = BigDecimal.ZERO;
					if (retipo.equals("NACIONALIZADO"))
						saldonac_dest = recant;
					else
						saldosinnac_dest = recant;

					
					System.out.println("saldonac_dest " + saldonac_dest);
					System.out.println("saldosinnac_dest " + saldosinnac_dest);
					// miro si la entrada existe o no para crearla o actualizarla

					entrada existe = gent.getentradaActualizarPosicion(reingreso, entor.getentcodproducto(), bodegafin, posicionfin);
					if (existe != null) {
						// le sumo al saldo nac / nnac y los saldos en peso:
						existe.setentsaldonac(Math.sumar_bigdecimal(saldonac_dest.toPlainString(), existe.getentsaldonac()) + "");
						existe.setentsaldosinnac(Math.sumar_bigdecimal(saldosinnac_dest.toPlainString(), existe.getentsaldosinnac()) + "");
						existe.setentsaldopesoneto(Math.sumar_bigdecimal(pesonetototal.toPlainString(), existe.getentsaldopesoneto()) + "");
						existe.setentsaldopesobruto(Math.sumar_bigdecimal(pesobrutototal.toPlainString(), existe.getentsaldopesobruto()) + "");
						// como existe le sumo tambien el saldo fisico
						existe.setEntsaldonacf(Math.sumar_bigdecimal(saldonac_dest.toPlainString(), existe.getEntsaldonacf()) + "");
						existe.setEntsaldosinnacf(Math.sumar_bigdecimal(saldosinnac_dest.toPlainString(), existe.getEntsaldosinnacf()) + "");
						// tambien se le suma la cantidad original ya que se debe de mover
						existe.setentcantidad(Math.sumar(recant.toPlainString(), existe.getentcantidad()));
						gent.updateentrada(existe);
					} else {
						// no existe, la creo se crea con todo igual al a entrada original menos los saldos en peso, del sx y fisicos:
						resp &= gent.crearentrada_original(reingreso, entor.getentcodproducto(), bodegafin, posicionfin, recantidad, entor.getentpesoneto(), pesonetototal + "", entor.getentpesobruto(), pesobrutototal + "", saldopesoneto_dest + "", saldopesobruto_dest + "", saldonac_dest + "",
								saldosinnac_dest + "", valor.toPlainString(), valortotal.toPlainString(), saldonac_dest + "", saldosinnac_dest + "", entor.getEntunidad(), entor.getentlote());

					}

					entrada entfin = gent.getentrada(reingreso, entor.getentcodproducto(), bodegafin, posicionfin);

					reentradafin = entfin != null ? entfin.getentcodsx() : null;

					// ahora resto saldos y pesos a la entrada original...
					saldopesoneto_or = saldopesoneto_or.subtract(saldopesoneto_dest);
					saldopesobruto_or = saldopesobruto_or.subtract(saldopesobruto_dest);
					saldonac_or = saldonac_or.subtract(saldonac_dest);
					saldosinnac_or = saldosinnac_or.subtract(saldosinnac_dest);

					// resto tambien al saldo fisico de la entrada original
					String saldo_fisico_nac_or = util.Math.restar_bigdecimal(entor.getEntsaldonacf(), saldonac_dest.toPlainString()).toPlainString();
					String saldo_fisico_nnac_or = util.Math.restar_bigdecimal(entor.getEntsaldosinnacf(), saldosinnac_dest.toPlainString()).toPlainString();

					entor.setentsaldopesoneto(saldopesoneto_or + "");
					entor.setentsaldopesobruto(saldopesobruto_or + "");
					entor.setentsaldonac(saldonac_or + "");
					entor.setentsaldosinnac(saldosinnac_or + "");
					entor.setEntsaldonacf(saldo_fisico_nac_or);
					entor.setEntsaldosinnacf(saldo_fisico_nnac_or);
					// resto a la entrada original la cantidad de la reubicacion para mover siempre la cantidad tambien
					entor.setentcantidad(Math.restar_bigdecimal(entor.getentcantidad(), recant.toPlainString()).toPlainString());
					// LOS PESOS TOTALES DE LA ENTRAA ORIGINAL NO SE RESTAN, SOLO LOS SALDOS!!!(en pesos y cant)

					resp &= gent.updateentrada(entor);

					// ahora si creo la reubicacion...

					resp &= control.crearreubicacion(recodcia, reingreso, retipo, reentradaor, reentradafin, recantidad, reestado, refecha, retipomov);

					reubicacion reubic = control.getreubicacion(recodcia, refecha);
					resp &= reubicarNacDetalles(reubic.getrecodsx(), entor.getentcodsx(), entfin.getentcodsx(), recantidad, gnacdet, grnac);

					if (!resp)
						mensaje = "No se pudo crear la reubicacion ";							

				} else {
					mensaje = "Posicion origen y destino deben ser diferentes";
					resp = false;
				}

			} catch (Exception e) {
				e.printStackTrace();
				mensaje = "No se pudo Crear el reubicacion, verifique el saldo ";
				resp = false;
			}
			if (resp)
				db.commit();
			else
				db.rollback();
		}
		
		
		return mensaje;
	}
	
	/**
	 * metodo llamado cuando la entrada que se va a mover, tiene saldo nacionalizado y tiene nacionalizacion_detalle asociadas, en este caso, hay que crear la nueva tabla reubicacion_nacdetalle en la que se registrara las nacdetalles que se restan, y a donde se suman.
	 * 
	 * @param entcodsx
	 * @return
	 */
	private boolean reubicarNacDetalles(String renreubicacion, String entor, String entfin, String cantidad, gstnacionalizacion_detalle gnacdet, gstreubic_nacdetalle grnac) {
		boolean resp = true;

		Collection nacdets = gnacdet.getlistanacionalizacion_detalleByEntrada(entor);
		// si no hay nacionalizaciones, no hace anda
		if (nacdets.isEmpty())
			return true;

		Iterator itenacd = nacdets.iterator();
		// por cada nacdetalle original que tengo, voy restando la cantidad y creando la nacdetalle fin

		BigDecimal faltante = new BigDecimal(cantidad);
		while (itenacd.hasNext() && faltante.compareTo(BigDecimal.ZERO) > 0) {

			nacionalizacion_detalle nacdetor = (nacionalizacion_detalle) itenacd.next();

			BigDecimal nadsaldo = new BigDecimal(nacdetor.getNadsaldo());

			String cant = "";
			String pesoneto = nacdetor.getNadpesoneto();
			String pesonetototal = nacdetor.getNadpesonetototal();
			String pesobruto = nacdetor.getNadpesobruto();
			String pesobrutototal = nacdetor.getNadpesobrutototal();
			String fob = nacdetor.getNadfob();

			String nadfobtotal = "0";
			if (faltante.compareTo(nadsaldo) > 0) {
				// si el faltante es mayor, cojo todo el saldo de la nacionalizacion
				cant = nadsaldo.toPlainString();
				nacdetor.setNadsaldo("0");
				nacdetor.setnadcantidad("0");

			} else {
				cant = faltante.toPlainString();
				nacdetor.setNadsaldo(Math.restar_bigdecimal(nadsaldo.toPlainString(), faltante.toPlainString()).toPlainString());
				nacdetor.setnadcantidad(Math.restar_bigdecimal(nacdetor.getnadcantidad(), faltante.toPlainString()).toPlainString());
			}

			try {
				// actualizo la original que ya le reste el saldo y reste las cantidades originales tambiem
				resp &= gnacdet.updatenacionalizacion_detalle(nacdetor);

				// miro si ya he nacionalizado algo de esa posicion:
				nacionalizacion_detalle nacdet = gnacdet.getnacionalizacion_detalle(entfin, nacdetor.getnadcodnac());

				if (nacdet == null) {
					// ahora creo la nacdetalle final
					resp &= gnacdet.crearnacionalizacion_detalle(nacdetor.getnadcodnac(), entfin, cant, cant, pesoneto, pesonetototal, pesobruto, pesobrutototal, fob, nadfobtotal);
				} else {
					// actualizo sumandole lo de la reubicacion:
					nacdet.setnadcantidad(util.Math.sumar(nacdet.getnadcantidad(), cant));
					nacdet.setNadsaldo(util.Math.sumar(nacdet.getNadsaldo(), cant));
					resp &= gnacdet.updatenacionalizacion_detalle(nacdet);
				}
				nacionalizacion_detalle nacdetfin = gnacdet.getnacionalizacion_detalle(entfin, nacdetor.getnadcodnac());

				// creo la relacion reuic_nacet para asi identificar en la reubicacion, lo que se movio con saldo
				// nac producto de nacionalizaciones se mueva bien
				resp &= grnac.crearreubic_nacdetalle(renreubicacion, nacdetor.getnadcodsx(), nacdetfin.getnadcodsx(), cant);
			} catch (SQLException ex) {

				ex.printStackTrace();
				resp = false;
				break;

			}

		}

		return resp;
	}
}
