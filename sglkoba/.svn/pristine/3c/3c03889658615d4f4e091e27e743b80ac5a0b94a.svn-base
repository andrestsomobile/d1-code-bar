package patios.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import patios.control.gstdetalleentradavehiculo;
import patios.entity.detalleentradavehiculo;
import patios.form.detalleentradavehiculoForm;
import util.Fecha;

public final class detalleentradavehiculoAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		detalleentradavehiculoForm _form = (detalleentradavehiculoForm) form;
		gstdetalleentradavehiculo control = new gstdetalleentradavehiculo();
		String opcion = request.getParameter("opcion");
		String evcodsx = request.getParameter("evcodsx");
		opcion = opcion == null || (opcion != null && opcion.equals("")) ? "busqueda" : opcion;

		String destino = "";
		String mensaje = "";



		// OPCION DE set:
		if (opcion.equals("set")) {
			
			detalleentradavehiculo entity = control.getdetalleentradavehiculo(request.getParameter("devcodsx"));
			detalleentradavehiculoForm temp = new detalleentradavehiculoForm();
			temp.setopcion("update");
			temp.llenar(entity);
			request.setAttribute("detalleentradavehiculoForm", temp);
			destino = "detalleentradavehiculo";
		}

		// opcion de CREAR
		if (opcion.equals("crear")) {
			String devreferencia = _form.getDevreferencia();
			String devmarca = _form.getDevmarca();
			String devmodelo = _form.getDevmodelo();
			String devmotor = _form.getDevmotor();
			String devvinchasis = _form.getDevvinchasis();
			String devcolor = _form.getDevcolor();
			String devfechaingreso = _form.getDevfechaingreso(); 
			String devlocacion = _form.getDevlocacion(); 
			String devestado = "PATIOS";
			String devfechasalida = null;
			String devfechaalistamiento = null;
			String devnovedades = _form.getDevnovedades();
			
			
			try {
				destino = "detallentradavehiculo";
				int nuevodevcodsx = control.creardetalleentradavehiculo(evcodsx, devreferencia, devmarca, devmodelo, devmotor, devvinchasis, devlocacion, devcolor, devestado, devfechaingreso, devfechasalida, devfechaalistamiento, devnovedades);
				mensaje = "Se Creo con Exito";
				detalleentradavehiculo temp = control.getdetalleentradavehiculo(nuevodevcodsx+"");
				detalleentradavehiculoForm entityform  = new detalleentradavehiculoForm();
				entityform.llenar(temp);
				entityform.setopcion("update");
				request.setAttribute("detalleentradavehiculoForm", entityform);

			} catch (SQLException e) {
				e.printStackTrace();
				destino = "detalleentradavehiculo";
				mensaje = "No se pudo Crear el registro: <br> " + e.getLocalizedMessage();
			}
		}
		// Opcion de update
		if (opcion.equals("update")) {
			destino = "detalleentradavehiculo";
			try {
				detalleentradavehiculo entityform = control.getdetalleentradavehiculo(_form.getDevcodsx());
				control.updatedetalleentradavehiculo(_form);
				mensaje = "Actualizado con Exito";
			} catch (SQLException e) {
				e.printStackTrace();
				mensaje = "No se pudo Actualizar: <br> " + e.getLocalizedMessage();
			}
		}
		// Opcion de eliminar
		if (opcion.equals("delete")) {
			String codsx = request.getParameter("devcodsx");
			destino = "detalleentradavehiculo";
			try {
				control.eliminar(codsx);
				mensaje = "Se Elimino con Exito";

			} catch (SQLException e) {
				e.printStackTrace();
				mensaje = "No se pudo Eliminar: <br> " + e.getLocalizedMessage();
			}
		}
		
		if (opcion.equals("updatecargue")) {
			String[] vin = request.getParameterValues("_vin");
			String[] campo = request.getParameterValues("_campo");
			String[] valor = request.getParameterValues("_valor");
			destino = "busqueda";
			if (vin != null) {		
				try {
					for (int i=0; i<vin.length; i++) {
						control.updatecargue(vin[i], campo[i], valor[i]);
					}
					mensaje = "Se actualizo con Exito";
				} catch (SQLException e) {
					e.printStackTrace();
					mensaje = "No se pudo actualizar: <br> " + e.getLocalizedMessage();
				}
			} else {
				mensaje = "No hay modificaciones pendientes";
			}
		}
		
		if (opcion.equals("busqueda")) {
			String param = request.getParameter("param");
			//System.out.println("lllllllllllllllllllllllllllllllllll  " + param);
			destino = "busqueda"; //&param="+param;
		}
		
		if (opcion.equals("generaplanilla")) {
			destino = "planilla";
		}
		
		if (opcion.equals("guardarplanilla")) {
			String[] vin = request.getParameterValues("_vin");
			String notif = request.getParameter("notif");
			String transp = request.getParameter("transp");
			String nomcond = request.getParameter("nomcond");
			String cedcond = request.getParameter("cedcond");
			String placa = request.getParameter("placa");
			destino = "planilla";
			if (vin != null) {		
				try {
					int no_planilla = control.creaplanilla(notif, transp, nomcond, cedcond, placa);
					if (no_planilla != 0) {
						for (int i=0; i<vin.length; i++) {
							control.updatecargue(vin[i], "planilla", no_planilla+"");
						}
						mensaje = "Se creo la planilla con Exito";
						request.setAttribute("planilla", no_planilla+"");
					} else {
						mensaje = "No se pudo crear la planilla";
					}
				} catch (SQLException e) {
					e.printStackTrace();
					mensaje = "No se pudo crear la planilla: <br> " + e.getLocalizedMessage();
				}
			} else {
				mensaje = "No hay datos para crear Planilla";
			}
		}
		
		if (opcion.equals("eliminaplanilla")) {
			String _planilla = request.getParameter("_planilla");
			destino = "datos_planilla";
			if (_planilla != null) {		
				try {
					control.updatecargue_planilla(_planilla);
					control.elimina_planilla(_planilla);
					mensaje = "Se elimino la planilla con Exito";
				} catch (SQLException e) {
					e.printStackTrace();
					mensaje = "No se pudo eliminar la planilla: <br> " + e.getLocalizedMessage();
				}
			} else {
				mensaje = "No hay datos para eliminar Planilla";
			}
		}
		
		
		ActionMessages e = getErrors(request);
		e.add("general", new ActionMessage(mensaje, false));
		addErrors(request, e);

		return mapping.findForward(destino);

	}
}
