package registro.fotografico.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.json.JSONObject;

import ingreso.control.gstinspeccion_recibo;
import ingreso.control.gstlote_contenedor_trafico;
import ingreso.control.gstlote_trafico;
import ingreso.entity.inspeccion_recibo;
import ingreso.entity.lote_contenedor_trafico;
import ingreso.entity.lote_trafico;

public final class ContenedorTraficoProductoAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String producto = request.getParameter("producto");
		String contenedor = request.getParameter("contenedor");
		String trafico = request.getParameter("trafico");
		
		gstinspeccion_recibo ginre = new gstinspeccion_recibo();
		gstlote_trafico glt = new gstlote_trafico();
		gstlote_contenedor_trafico glct = new gstlote_contenedor_trafico();
		
		
		lote_trafico lt = glt.getLoteByProducto(contenedor, trafico, producto);
		lote_contenedor_trafico lct = glct.getLoteContenedorByProducto(contenedor, trafico, producto);
		inspeccion_recibo inre = ginre.getInspeccionByProducto(contenedor, trafico, producto);
		
		if(inre != null) {
			inre.setInrevencimiento(inre.getInrevencimiento() != null ? inre.getInrevencimiento() : lt.getLtrafvencimiento());
			inre.setInrelote(inre.getInrelote() != null ? inre.getInrelote() : lt.getLtraflote());
			inre.setInreestibas(inre.getInreestibas() != null ? inre.getInreestibas() : "");
			inre.setInrecajas(inre.getInrecajas() != null ? inre.getInrecajas() : lct.getlctrafcantidad());
			inre.setInresaldo(inre.getInresaldo() != null ? inre.getInresaldo() : "");
			inre.setInrenovedades(inre.getInrenovedades() != null ? inre.getInrenovedades() : "");
			inre.setInrerecuperadas(inre.getInrerecuperadas() != null ? inre.getInrerecuperadas() : "");
			inre.setInretotalump(inre.getInretotalump() != null ? inre.getInretotalump() : lct.getlctrafcantidad());
			inre.setInreesibasrequeridas(inre.getInreesibasrequeridas() != null ? inre.getInreesibasrequeridas() : "");
			inre.setInrepesoestibavacia(inre.getInrepesoestibavacia()!= null ? inre.getInrepesoestibavacia() : "");
			inre.setInrepesototalestibasvacias(inre.getInrepesototalestibasvacias() != null ? inre.getInrepesototalestibasvacias() : "");
			inre.setInrepesoestibapaletizada(inre.getInrepesoestibapaletizada() != null ? inre.getInrepesoestibapaletizada() : "");
			inre.setInrepesoporump(inre.getInrepesoporump()!= null ? inre.getInrepesoporump() : "");
			inre.setInrepesonetoproducto(inre.getInrepesonetoproducto() != null ? inre.getInrepesonetoproducto() : "");
			inre.setInreobservaciones(inre.getInreobservaciones() != null ? inre.getInreobservaciones() : "");
		} else {
			inre = new inspeccion_recibo();
		}
		
		
		JSONObject jsonObject = new JSONObject(inre);
		String myJson = jsonObject.toString();
		response.setContentType("application/json");
		// response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(myJson);

		return null;

	}
}
