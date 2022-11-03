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

import patios.control.gstpedidovehiculo;
import patios.entity.pedidovehiculo;
import patios.form.pedidovehiculoForm;

public final class pedidovehiculoAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		pedidovehiculoForm _form = (pedidovehiculoForm) form;
		gstpedidovehiculo control = new gstpedidovehiculo();
		String opcion = request.getParameter("opcion");
		opcion = opcion == null || (opcion != null && opcion.equals("")) ? "crear" : opcion;

		String destino = "";
		String mensaje = "";

		// opcion de activar una pedidovehiculo:
		if (opcion.equals("activar")) {
			pedidovehiculo entity = control.getpedidovehiculo(request.getParameter("pvcodsx"));
			
			boolean puede = true;
			// que no este en pedidos:
			/*Collection pedidos = new gst().getlistapedidoBypedidovehiculo(entity.getingcodsx());
				if (!pedidos.isEmpty()) {
					mensaje = "No puede activar el pedidovehiculo por que tiene Pedidos, rpvise";
					puede = false;
				}*/	
			if (puede) {
				entity.setPvestado("TRAMITE");
				try {
					control.updatepedidovehiculo(entity);
					mensaje = "Se Activo con exito";
				} catch (SQLException e1) {
					mensaje = "No se pudo Activar <br>" + e1.getMessage();
					e1.printStackTrace();
					destino = "pedidovehiculo_datos";
				}

			}
			pedidovehiculoForm temp = new pedidovehiculoForm();
			temp.setopcion("update");
			temp.llenar(entity);
			request.setAttribute("pedidovehiculoForm", temp);
			destino = "pedidovehiculo_datos";
		}

		// OPCION DE set:
		if (opcion.equals("set")) {
			pedidovehiculo entity = control.getpedidovehiculo(request.getParameter("pvcodsx"));
			pedidovehiculoForm temp = new pedidovehiculoForm();
			temp.setopcion("update");
			temp.llenar(entity);
			request.setAttribute("pedidovehiculoForm", temp);
			destino = "pedidovehiculo_datos";
		}

		// opcion de CREAR
		if (opcion.equals("crear")) {
			String pvcodcia = _form.getPvcodcia();
			String pvfecha = _form.getPvfecha();
			String pvnumeropedido = _form.getPvnumeropedido();
			String pvestado = _form.getPvestado();
			String pvcodcliente = _form.getPvcodcliente();
			String pvcodciudaddestino = _form.getPvcodciudaddestino();
			String pvdireccion = _form.getPvdireccion();
			
			try {
				destino = "pedidovehiculo_datos";
				int nupvocodsx = control.crearpedidovehiculo(pvfecha, pvcodcia, pvnumeropedido, pvcodcliente, pvcodciudaddestino, pvdireccion, pvestado);
				mensaje = "Se Creo con Exito";
				pedidovehiculo temp = control.getpedidovehiculo(nupvocodsx+"");
				pedidovehiculoForm entityform  = new pedidovehiculoForm();
				entityform.llenar(temp);
				entityform.setopcion("update");
				request.setAttribute("pedidovehiculoForm", entityform);

			} catch (SQLException e) {
				e.printStackTrace();
				destino = "pedidovehiculo_datos";
				mensaje = "No se pudo Crear el registro: <br> " + e.getLocalizedMessage();
			}
		}
		// Opcion de update
		if (opcion.equals("update")) {
			destino = "pedidovehiculo_datos";
			try {
				pedidovehiculo entityform = control.getpedidovehiculo(_form.getPvcodsx());
				control.updatepedidovehiculo(_form);
				mensaje = "Actualizado con Exito";
			} catch (SQLException e) {
				e.printStackTrace();
				mensaje = "No se pudo Actualizar: <br> " + e.getLocalizedMessage();
			}
		}
		// Opcion de eliminar
		if (opcion.equals("delete")) {
			String codsx = request.getParameter("pvcodsx");
			destino = "pedidovehiculo";
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
