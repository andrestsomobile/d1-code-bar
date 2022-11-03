package ingreso.action;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import java.sql.SQLException;

import maestro.control.gstconfig_bodega;
import maestro.control.gstproducto;
import maestro.control.gsttipoproducto;
import maestro.entity.producto;
import maestro.entity.tipoproducto;
import nacionalizacion.control.gstnacionalizacion_detalle;
import nacionalizacion.entity.nacionalizacion_detalle;
import registro.control.gstregistro_almacenamiento_detalle;
import registro.form.registro_almacenamientoForm;

import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import ingreso.control.*;
import ingreso.entity.*;
import ingreso.form.*;
import org.apache.struts.action.*;

import util.Fecha;
import util.Math;

import db.beanConnector;

public final class reubicacionAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		reubicacionForm _form = (reubicacionForm) form;
		gstreubicacion control = new gstreubicacion();
		String opcion = request.getParameter("opcion");
		opcion = opcion == null || (opcion != null && opcion.equals("")) ? "crear" : opcion;
		String destino = "";
		String mensaje = "";
		if (opcion.equals("activar")) {
			gstentrada gent = new gstentrada();
			reubicacion entity = control.getreubicacion(request.getParameter("codsx"));

			// valido que la entrada ala que esta asociada esta reubicacion NO TENGA pedidos o pickings_detalle
			// respaldandose en ella:
			boolean puede = false;
			puede = gent.tienePackings(entity.getreentradafin()) || gent.tienePedidos(entity.getreentradafin());

			if (!puede) {
				entity.setreestado("TRAMITE");
				try {
					control.updatereubicacion(entity);
					mensaje = "Reubicacion ACTIVADA con exito";
				} catch (SQLException e1) {
					mensaje = "NO SE PUDO ACTIVAR LA REUBICACION: <br>" + e1.getMessage();
					e1.printStackTrace();
				}

			} else {
				mensaje = "LA REUBICACION YA ESTA RESPALDANDO SALIDAS DE MERCANCIA, NO PUEDE ACTIVARLA";
			}

			reubicacionForm temp = new reubicacionForm();
			temp.setopcion("update");
			temp.llenar(entity);
			request.setAttribute("reubicacionForm", temp);
			destino = "reubicacion";

		}

		// OPCION DE set:
		if (opcion.equals("set")) {
			reubicacion entity = control.getreubicacion(request.getParameter("codsx"));
			reubicacionForm temp = new reubicacionForm();
			temp.setopcion("update");
			temp.llenar(entity);
			request.setAttribute("reubicacionForm", temp);
			return mapping.findForward("reubicacion_datos");
		}

		// opcion de CREAR
		if (opcion.equals("crear")) {
			String recodcia = _form.getRecodcia();
			String reingreso = _form.getreingreso();
			String retipo = _form.getretipo();
			String reentradaor = _form.getreentradaor();
			String reentradafin = _form.getreentradafin();
			// de la entrada fin saco es la bodega y posicion de destino
			String bodegafin = _form.getBodegafin();
			String posicionfin = _form.getPosicionfin();

			String recantidad = _form.getrecantidad();
			String reestado = "FINALIZADO"; // una reubicacion se crea finalizada y se puede activar, pero validando que no este
			// respaldando ninguna salida
			String refecha = _form.getrefecha();
			String retipomov = _form.getRetipomov();

			boolean resp = true;
			beanConnector db = new beanConnector(false);
			control = new gstreubicacion(db);
			gstentrada gent = new gstentrada(db);
			gstnacionalizacion_detalle gnacdet = new gstnacionalizacion_detalle(db);
			gstreubic_nacdetalle grnac = new gstreubic_nacdetalle(db);
			
			try {

				// primero saco la entrada original y sus datos
				entrada entor = gent.getentrada(reentradaor);
				reubicacionForm rf = new reubicacionForm();
				gstproducto gpro = new gstproducto();
				gsttipoproducto gtp = new gsttipoproducto();
				producto pro = gpro.getproducto(entor.getentcodproducto());
				tipoproducto tipopro = gtp.gettipoproducto(pro.getprotipoproducto());
				//String miposicionfin = tipopro.gettiprcodigo() + posicionfin;
				if (!bodegafin.equals(entor.getEntbodega()) || !posicionfin.equals(entor.getentposicion())) {

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

					// miro si la entrada existe o no para crearla o actualizarla

					entrada existe = gent.getentrada(reingreso, entor.getentcodproducto(), bodegafin, posicionfin);
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

					if (resp)
						mensaje = "Reubicacion Creada con Exito";
					else
						mensaje = "No se pudo crear la reubicacion ";
							
					rf.llenar(control.getreubicacion(recodcia, refecha));
					rf.setopcion("update");

				} else {
					rf = _form;
					// rf.setreingreso(reingreso);
					mensaje = "Bodega, Posicion origen y destino deben ser diferentes";
					resp = false;
				}

				destino = "reubicacion_datos";
				rf.setPosicionfin(posicionfin);
				request.setAttribute("reubicacionForm", rf);

			} catch (Exception e) {
				e.printStackTrace();
				mensaje = "No se pudo Crear el reubicacion: <br> " + e.getLocalizedMessage();
				resp = false;
			}
			if (resp)
				db.commit();
			else
				db.rollback();

		}
		// Opcion de update
		if (opcion.equals("update")) {

			try {
				control.updatereubicacion(_form);
				mensaje = "Actualizacion exitosa";
				destino = "reubicacion_datos";
			} catch (Exception e) {
				e.printStackTrace();
				mensaje = "No se pudo Actualizar el reubicacion: <br> " + e.getLocalizedMessage();
			}
		}
		// Opcion de eliminar
		if (opcion.equals("delete")) {
			String codsx = request.getParameter("codsx");
			beanConnector db = new beanConnector(false);
			gstentrada gent = new gstentrada(db);
			control = new gstreubicacion(db);
			boolean resp = true;
			try {

				// saco la reubicacion:
				reubicacion reubic = control.getreubicacion(codsx);

				// saco la entrada origen y destino:
				entrada entor = gent.getentrada(reubic.getreentradaor());
				BigDecimal saldopesoneto_or = new BigDecimal(entor.getentsaldopesoneto());
				BigDecimal saldopesobruto_or = new BigDecimal(entor.getentsaldopesobruto());
				BigDecimal saldonac_or = new BigDecimal(entor.getentsaldonac());
				BigDecimal saldononac_or = new BigDecimal(entor.getentsaldosinnac());

				entrada entfin = gent.getentrada(reubic.getreentradafin());
				BigDecimal saldopesoneto_fin = new BigDecimal(entfin.getentsaldopesoneto());
				BigDecimal saldopesobruto_fin = new BigDecimal(entfin.getentsaldopesobruto());
				BigDecimal saldonac_fin = new BigDecimal(entfin.getentsaldonac());
				BigDecimal saldononac_fin = new BigDecimal(entfin.getentsaldosinnac());

				// sumo lo del fin a la entrada:
				String peso_neto_reubic = util.Math.multiplicar(entor.getentpesoneto(), reubic.getrecantidad());
				saldopesoneto_or = util.Math.sumar_bigdecimal(saldopesoneto_or.toPlainString(), peso_neto_reubic);

				String peso_bruto_reubic = util.Math.multiplicar(entor.getentpesobruto(), reubic.getrecantidad());
				saldopesobruto_or = util.Math.sumar_bigdecimal(saldopesobruto_or.toPlainString(), peso_bruto_reubic);

				String cantnac = "0";
				String cantnnac = "0";
				if (reubic.getretipo().equals("NO NACIONALIZADO"))
					cantnnac = reubic.getrecantidad();
				else
					cantnac = reubic.getrecantidad();

				saldonac_or = Math.sumar_bigdecimal(saldonac_or.toPlainString(), cantnac);
				saldononac_or = Math.sumar_bigdecimal(saldononac_or.toPlainString(), cantnnac);

				// actualizo los datos en la entrada original:
				entor.setentsaldonac(saldonac_or + "");
				entor.setentsaldosinnac(saldononac_or + "");
				entor.setentsaldopesobruto(saldopesobruto_or + "");
				entor.setentsaldopesoneto(saldopesoneto_or + "");

				// tambien sumo los saldos fisicos:
				String saldo_fisico_nac_or = util.Math.sumar(entor.getEntsaldonacf(), cantnac);
				String saldo_fisico_nnac_or = util.Math.sumar(entor.getEntsaldosinnacf(), cantnnac);

				entor.setEntsaldonacf(saldo_fisico_nac_or);
				entor.setEntsaldosinnacf(saldo_fisico_nnac_or);
				// tambien sumo la cantidad a la entradaor para dejarla como estaba
				entor.setentcantidad(util.Math.sumar(entor.getentcantidad(), reubic.getrecantidad()));

				// tengo que restar a la entrada final los saldos nac / nnac y peso neto y bruto:
				BigDecimal pesoneto = new BigDecimal(entor.getentpesoneto());
				BigDecimal pesobruto = new BigDecimal(entor.getentpesobruto());

				BigDecimal pesoneto_reubic = Math.multiplicar_bigdecimnal(pesoneto.toPlainString(), reubic.getrecantidad());
				BigDecimal pesobruto_reubic = Math.multiplicar_bigdecimnal(pesobruto.toPlainString(), reubic.getrecantidad());

				saldopesoneto_fin = Math.restar_bigdecimal(saldopesoneto_fin.toPlainString(), pesoneto_reubic.toPlainString());
				saldopesobruto_fin = Math.restar_bigdecimal(saldopesobruto_fin.toPlainString(), pesobruto_reubic.toPlainString());

				saldonac_fin = Math.restar_bigdecimal(saldonac_fin.toPlainString(), cantnac);
				saldononac_fin = Math.restar_bigdecimal(saldononac_fin.toPlainString(), cantnnac);

				entfin.setentsaldonac(saldonac_fin.toPlainString());
				entfin.setentsaldosinnac(saldononac_fin.toPlainString());
				entfin.setentsaldopesobruto(saldopesobruto_fin.toPlainString());
				entfin.setentsaldopesoneto(saldopesoneto_fin.toPlainString());
				// tambien resto los saldos fisicos:
				String saldo_fisico_nac_fin = util.Math.restar_bigdecimal(entfin.getEntsaldonacf(), cantnac).toPlainString();
				String saldo_fisico_nnac_fin = util.Math.restar_bigdecimal(entfin.getEntsaldosinnacf(), cantnnac).toPlainString();
				entfin.setEntsaldonacf(saldo_fisico_nac_fin);
				entfin.setEntsaldosinnacf(saldo_fisico_nnac_fin);
				// TAMBIEN LA CANTIDAD
				entfin.setentcantidad(util.Math.restar_bigdecimal(entfin.getentcantidad(), reubic.getrecantidad()).toPlainString());

				// primero elimino la reubicacion:
				resp &= control.eliminar(codsx);
				resp &= gent.updateentrada(entor);
				resp &= gent.updateentrada(entfin);

				/*
				 * 
				 * //resto a la entrada final en vez de eliminar, por que pueden haberlo puesto encima de otra mercancia, entonces //mejor resto el saldo:
				 * 
				 * BigDecimal saldonac_dest = BigDecimal.ZERO; BigDecimal saldosinnac_dest =BigDecimal.ZERO ; if(reubic.getretipo().equals("NACIONALIZADO")) saldonac_dest = new BigDecimal( reubic.getrecantidad()); else saldosinnac_dest = new BigDecimal( reubic.getrecantidad());
				 * 
				 * 
				 * saldonac_fin = Math.restar_bigdecimal( saldonac_fin.toPlainString(), saldonac_dest.toPlainString() ); saldononac_fin = Math.restar_bigdecimal( saldononac_fin.toPlainString(), saldosinnac_dest.toPlainString() ); saldopesoneto_fin = Math.restar_bigdecimal(
				 * saldopesoneto_fin.toPlainString(), saldosinnac_dest.toPlainString() ); saldopesobruto_fin // resp &= gent.eliminar( entfin.getentcodsx());
				 * 
				 */

				mensaje = "reubicacion Eliminado con Exito";

				destino = "reubicacion";
			} catch (SQLException e) {
				e.printStackTrace();
				mensaje = "No se pudo Eliminar el reubicacion: <br> " + e.getLocalizedMessage();
				resp = false;
				destino = "reubicacion";
			}
			if (resp)
				db.commit();
			else
				db.rollback();

		}


		// opcion de Reubicacion Movil
		if (opcion.equals("reubicacion_movil")) {
			String param = request.getParameter("param_movil");
			String pag = request.getParameter("pag_movil");
			String reentradaor = request.getParameter("reentradaor");
			String retipo = request.getParameter("tipo_movil");
			
			HttpSession sesion = request.getSession(true);
			registro_almacenamientoForm raf= (registro_almacenamientoForm)sesion.getAttribute("registro_almacenamientoForm");
			
			String reentradafin = null;
			String bodegafin =  request.getParameter("nuevabod");
			String posicionfin = request.getParameter("nuevapos");

			String recantidad = request.getParameter("recantidad");
			String reestado = "FINALIZADO"; // una reubicacion se crea finalizada y se puede activar, pero validando que no este respaldando ninguna salida
			String recodcia = null;
			String reingreso = null;
			String refecha = Fecha.getFecha();
			String retipomov = "FISICO";

			boolean resp = true;
			beanConnector db = new beanConnector(false);
			control = new gstreubicacion(db);
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
					entrada entor = gent.getentrada(reentradaor);
					reingreso = entor.getentcodingreso();
					//bodegafin = entor.getEntbodega();
					reubicacionForm rf = new reubicacionForm();
					gstproducto gpro = new gstproducto();
					gsttipoproducto gtp = new gsttipoproducto();
					producto pro = gpro.getproducto(entor.getentcodproducto());
					recodcia = pro.getprocodigocia();
					tipoproducto tipopro = gtp.gettipoproducto(pro.getprotipoproducto());
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
	
						// miro si la entrada existe o no para crearla o actualizarla
	
						entrada existe = gent.getentrada(reingreso, entor.getentcodproducto(), bodegafin, posicionfin);
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
	
						if (resp) {
							// si viene informacion para registro-almacenamiento la agrego al detalle
							if (raf != null) {
								gstregistro_almacenamiento_detalle gregalmdet = new gstregistro_almacenamiento_detalle(db);
								gregalmdet.crearregistro_almacenamiento_detalle(raf.getRealcodsx(), null, reubic.getrecodsx() , "1");
							}
						}
						if (resp)
							mensaje = "Reubicacion Creada con Exito";
						else
							mensaje = "No se pudo crear la reubicacion ";							
	
					} else {
						mensaje = "Posicion origen y destino deben ser diferentes";
						resp = false;
					}
	
				} catch (Exception e) {
					e.printStackTrace();
					mensaje = "No se pudo Crear el reubicacion: <br> " + e.getLocalizedMessage();
					resp = false;
				}
				if (resp)
					db.commit();
				else
					db.rollback();
			}
			
			ActionMessages e = getErrors(request);
			e.add("general", new ActionMessage(mensaje, false));
			addErrors(request, e);
			request.setAttribute("param_movil", param);
			request.setAttribute("pag_movil", pag);
			request.setAttribute("tipo_movil", retipo);
			return mapping.findForward("movil_reubicacion");

		}
		
		
		
		
		ActionMessages e = getErrors(request);
		e.add("general", new ActionMessage(mensaje, false));
		addErrors(request, e);
		return mapping.findForward(destino);

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