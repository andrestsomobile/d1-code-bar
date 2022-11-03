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

import patios.control.gstdespachovehiculo;
import patios.entity.despachovehiculo;
import patios.form.despachovehiculoForm;

public final class despachovehiculoAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		despachovehiculoForm _form = (despachovehiculoForm) form;
		gstdespachovehiculo control = new gstdespachovehiculo();
		String opcion = request.getParameter("opcion");
		opcion = opcion == null || (opcion != null && opcion.equals("")) ? "crear" : opcion;

		String destino = "";
		String mensaje = "";

		// opcion de activar una despachovehiculo:
		if (opcion.equals("activar")) {
			despachovehiculo entity = control.getdespachovehiculo(request.getParameter("codsx"));
			
			boolean puede = true;
			// que no este en despachos:
			/*Collection despachos = new gst().getlistadespachoBydespachovehiculo(entity.getingcodsx());
				if (!despachos.isEmpty()) {
					mensaje = "No puede activar el despachovehiculo por que tiene Pedidos, rdvise";
					puede = false;
				}*/	
			if (puede) {
				entity.setDvestado("TRAMITE");
				try {
					control.updatedespachovehiculo(entity);
					mensaje = "Se Activo con exito";
				} catch (SQLException e1) {
					mensaje = "No se pudo Activar <br>" + e1.getMessage();
					e1.printStackTrace();
					destino = "despachovehiculo_datos";
				}

			}
			despachovehiculoForm temp = new despachovehiculoForm();
			temp.setopcion("update");
			temp.llenar(entity);
			request.setAttribute("despachovehiculoForm", temp);
			destino = "despachovehiculo_datos";
		}

		// OPCION DE set:
		if (opcion.equals("set")) {
			despachovehiculo entity = control.getdespachovehiculo(request.getParameter("dvcodsx"));
			despachovehiculoForm temp = new despachovehiculoForm();
			temp.setopcion("update");
			temp.llenar(entity);
			request.setAttribute("despachovehiculoForm", temp);
			destino = "despachovehiculo_datos";
		}

		// opcion de CREAR
		if (opcion.equals("crear")) {
			String dvfecha = _form.getDvfecha();
			String dvcodpedido = _form.getDvcodpedido();
			String dvestado = _form.getDvestado();
			String dvcodtransportadora = _form.getDvcodtransportadora();
			String dvnotificacion = _form.getDvnotificacion();
			
			try {
				destino = "despachovehiculo_datos";
				int nudvocodsx = control.creardespachovehiculo(dvfecha, dvcodpedido, dvcodtransportadora, dvestado, dvnotificacion);
				mensaje = "Se Creo con Exito";
				despachovehiculo temp = control.getdespachovehiculo(nudvocodsx+"");
				despachovehiculoForm entityform  = new despachovehiculoForm();
				entityform.llenar(temp);
				entityform.setopcion("update");
				request.setAttribute("despachovehiculoForm", entityform);

			} catch (SQLException e) {
				e.printStackTrace();
				destino = "despachovehiculo_datos";
				mensaje = "No se pudo Crear el registro: <br> " + e.getLocalizedMessage();
			}
		}
		// Opcion de update
		if (opcion.equals("update")) {
			destino = "despachovehiculo_datos";
			try {
				String dvestado = _form.getDvestado();
				despachovehiculo entityform = control.getdespachovehiculo(_form.getDvcodsx());
				control.updatedespachovehiculo(_form);
				if (dvestado.equalsIgnoreCase("FINALIZADO") && entityform.getDvestado().equalsIgnoreCase("TRAMITE")) {
					
				}
				mensaje = "Actualizado con Exito";
			} catch (SQLException e) {
				e.printStackTrace();
				mensaje = "No se pudo Actualizar: <br> " + e.getLocalizedMessage();
			}
		}
		// Opcion de eliminar
		if (opcion.equals("delete")) {
			String codsx = request.getParameter("dvcodsx");
			destino = "despachovehiculo";
			try {
				control.eliminar(codsx);
				mensaje = "Se Elimino con Exito";

			} catch (SQLException e) {
				e.printStackTrace();
				mensaje = "No se pudo Eliminar: <br> " + e.getLocalizedMessage();
			}
		}
		ActionMessages e = getErrors(request);
		e.add("general", new ActionMessage(mensaje, false));
		addErrors(request, e);

		return mapping.findForward(destino);

	}
}
