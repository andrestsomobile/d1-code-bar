package pedido.action;import java.io.IOException;import javax.servlet.ServletException;import java.sql.SQLException;import org.apache.struts.action.ActionMessage; import org.apache.struts.action.ActionMessages; import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;import pedido.control.*;import pedido.entity.*;import pedido.form.*;import org.apache.struts.action.*;  public final class picking_detalleAction  extends Action{
			 public ActionForward execute(ActionMapping mapping,	ActionForm form, 			HttpServletRequest request,	HttpServletResponse response)			throws IOException, ServletException {
picking_detalleForm _form = (picking_detalleForm)form;  gstpicking_detalle control = new gstpicking_detalle();  String opcion = request.getParameter("opcion");  opcion = opcion==null || ( opcion!=null && opcion.equals("")) ? "crear" : opcion; 
 String mensaje = "";  String destino = ""; //OPCION DE set:  if(opcion.equals("set")) {  picking_detalle entity = control.getpicking_detalle(request.getParameter("codsx")); picking_detalleForm  temp  = new picking_detalleForm();  temp.setopcion("update"); temp.llenar(entity);  request.setAttribute("picking_detalleForm", temp);  destino = "picking_detalle_datos";  }  //opcion de CREAR  if(opcion.equals("crear")) {  String pickdcodpicking = _form.getpickdcodpicking();   String pickdproducto = _form.getpickdproducto();   String pickdtotal = _form.getpickdtotal();   String pickdvalorunit = _form.getPickdvalorunit(); destino = "picking_datos"; 
  try { 		 setPadre(pickdcodpicking, request ); //control.crearpicking_detalle(pickdcodpicking,pickdproducto,pickdtotal);//tengo que respaldar el total de acuerdo al packing del picking y sus productos...		 gestionSaldos gsaldo = new gestionSaldos();		mensaje= gsaldo.respaldarPickingTotal( pickdcodpicking, pickdproducto, pickdtotal, pickdvalorunit);		setPadre(pickdcodpicking, request );		   } catch (SQLException e) {   e.printStackTrace();  mensaje = "No se pudo Crear el picking_detalle: <br> " + e.getLocalizedMessage();   }  }  // Opcion de update  if(opcion.equals("update")) {   try {  destino = "picking_datos"; setPadre(_form.getpickdcodpicking(), request );  control.updatepicking_detalle(_form);    setPadre(_form.getpickdcodpicking(), request ); mensaje = "picking_detalle Actualizado con Exito";    } catch (SQLException e) { e.printStackTrace();   mensaje = "No se pudo Actualizar el picking_detalle: <br> " + e.getLocalizedMessage();  }  }  // Opcion de eliminar  if(opcion.equals("delete")) {  destino = "picking_datos"; String codsx = request.getParameter("codsx");  try {		picking_detalle pd = control.getpicking_detalle(codsx);	 setPadre(pd.getpickdcodpicking(), request );	   control.eliminar(codsx);     mensaje = "picking_detalle Eliminado con Exito"; setPadre(pd.getpickdcodpicking(), request );  } catch (SQLException e) { e.printStackTrace();   mensaje = "No se pudo Eliminar el picking_detalle: <br> " + e.getLocalizedMessage();  }  }  ActionMessages e = getErrors(request);  e.add("general", new ActionMessage(mensaje, false)); addErrors(request, e);  return mapping.findForward(destino);    }  private void setPadre(String codsx, HttpServletRequest request) {	 	 pickingForm pform = new pickingForm();	 gstpicking gpick = new gstpicking();	 picking pick = gpick.getpicking( codsx);	 pform.llenar( pick);	 pform.setopcion("update");	 request.setAttribute("pickingForm", pform);	  }  }