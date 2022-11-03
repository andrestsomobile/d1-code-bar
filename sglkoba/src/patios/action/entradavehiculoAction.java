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

import patios.control.gstentradavehiculo;
import patios.entity.entradavehiculo;
import patios.form.entradavehiculoForm;

public final class entradavehiculoAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		entradavehiculoForm _form = (entradavehiculoForm) form;
		gstentradavehiculo control = new gstentradavehiculo();
		String opcion = request.getParameter("opcion");
		opcion = opcion == null || (opcion != null && opcion.equals("")) ? "crear" : opcion;

		String destino = "";
		String mensaje = "";

		// opcion de activar una entradavehiculo:
		if (opcion.equals("activar")) {
			entradavehiculo entity = control.getentradavehiculo(request.getParameter("evcodsx"));
			
			boolean puede = true;
			// que no este en pedidos:
			/*Collection pedidos = new gst().getlistapedidoByentradavehiculo(entity.getingcodsx());
				if (!pedidos.isEmpty()) {
					mensaje = "No puede activar el entradavehiculo por que tiene Pedidos, revise";
					puede = false;
				}*/	
			if (puede) {
				entity.setEvestado("TRAMITE");
				try {
					control.updateentradavehiculo(entity);
					mensaje = "Se Activo con exito";
				} catch (SQLException e1) {
					mensaje = "No se pudo Activar <br>" + e1.getMessage();
					e1.printStackTrace();
					destino = "entradavehiculo_datos";
				}

			}
			entradavehiculoForm temp = new entradavehiculoForm();
			temp.setopcion("update");
			temp.llenar(entity);
			request.setAttribute("entradavehiculoForm", temp);
			destino = "entradavehiculo_datos";
		}

		// OPCION DE set:
		if (opcion.equals("set")) {
			entradavehiculo entity = control.getentradavehiculo(request.getParameter("evcodsx"));
			entradavehiculoForm temp = new entradavehiculoForm();
			temp.setopcion("update");
			temp.llenar(entity);
			request.setAttribute("entradavehiculoForm", temp);
			destino = "entradavehiculo_datos";
		}

		// opcion de CREAR
		if (opcion.equals("crear")) {
			String evcodcia = _form.getEvcodcia();
			String evfecha = _form.getEvfecha();
			String evdocumento = _form.getEvdocumento();
			String evestado = _form.getEvestado();
			
			try {
				destino = "entradavehiculo_datos";
				int nuevocodsx = control.crearentradavehiculo(evcodcia, evfecha, evdocumento, evestado);
				mensaje = "Se Creo con Exito";
				entradavehiculo temp = control.getentradavehiculo(nuevocodsx+"");
				entradavehiculoForm entityform  = new entradavehiculoForm();
				entityform.llenar(temp);
				entityform.setopcion("update");
				request.setAttribute("entradavehiculoForm", entityform);

			} catch (SQLException e) {
				e.printStackTrace();
				destino = "entradavehiculo_datos";
				mensaje = "No se pudo Crear el registro: <br> " + e.getLocalizedMessage();
			}
		}
		// Opcion de update
		if (opcion.equals("update")) {
			destino = "entradavehiculo_datos";
			try {
				entradavehiculo entityform = control.getentradavehiculo(_form.getEvcodsx());
				control.updateentradavehiculo(_form);
				mensaje = "Actualizado con Exito";
			} catch (SQLException e) {
				e.printStackTrace();
				mensaje = "No se pudo Actualizar: <br> " + e.getLocalizedMessage();
			}
		}
		// Opcion de eliminar
		if (opcion.equals("delete")) {
			String codsx = request.getParameter("evcodsx");
			destino = "entradavehiculo";
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
