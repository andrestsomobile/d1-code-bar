package pedido.form;import javax.servlet.http.HttpServletRequest;import org.apache.struts.action.ActionErrors;import org.apache.struts.action.ActionForm;import org.apache.struts.action.ActionMapping;import pedido.control.*;import pedido.entity.*;import org.apache.struts.action.ActionMessage;/** * CLASE GENERADA CON generator V3.0 By pablito****** */public class referencia_despacho_pedidoForm extends ActionForm {	private String refdpcodsx;	private String refdpcodrefd;	private String refdcodrefp;	/**	 * @uml.property name="refdcant"	 */	private String refdcant;	private String opcion;	/**	 * @uml.property name="refdvalorunit"	 */	private String refdvalorunit;	/**	 * @uml.property name="refdvalortotal"	 */	private String refdvalortotal;	/**	 * @uml.property name="refdpesoneto"	 */	private String refdpesoneto;	/**	 * @uml.property name="refdpesobruto"	 */	private String refdpesobruto;	/**	 * @uml.property name="refdpesonetototal"	 */	private String refdpesonetototal;	/**	 * @uml.property name="refdpesobrutototal"	 */	private String refdpesobrutototal;		private String refdvalorunitfac;		private String refdvalortotalfac;	public void setopcion(String newopcion) {		this.opcion = newopcion;	}	public String getopcion() {		return this.opcion;	}	public String getrefdpcodsx() {		return refdpcodsx;	}	public String getrefdpcodrefd() {		return refdpcodrefd;	}	public String getrefdcodrefp() {		return refdcodrefp;	}	public String getrefdcant() {		return refdcant;	}	public void setrefdpcodsx(String new_refdpcodsx) {		this.refdpcodsx = new_refdpcodsx;	}	public void setrefdpcodrefd(String new_refdpcodrefd) {		this.refdpcodrefd = new_refdpcodrefd;	}	public void setrefdcodrefp(String new_refdcodrefp) {		this.refdcodrefp = new_refdcodrefp;	}	public void setrefdcant(String new_refdcant) {		this.refdcant = new_refdcant;	}	public void reset(ActionMapping mapping, HttpServletRequest request) {	}	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {		ActionErrors errors = new ActionErrors();		gstreferencia_despacho_pedido greferencia_despacho_pedido = new gstreferencia_despacho_pedido();		opcion = opcion == null ? "crear" : opcion;		if (opcion.equals("set") || opcion.equals("delete"))			return null;		if (opcion.equals("crear")) {			// @todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS		}		// valido campos requeridos:		if (refdpcodrefd.equals(""))			errors.add("refdpcodrefd", new ActionMessage("El refdpcodrefd no puede ser vacio", false));		if (refdcodrefp.equals(""))			errors.add("refdcodrefp", new ActionMessage("El refdcodrefp no puede ser vacio", false));		if (refdcant.equals(""))			errors.add("refdcant", new ActionMessage("El refdcant no puede ser vacio", false));		if (!errors.isEmpty())			errors.add("general", new ActionMessage("No se pudo crear , revise", false));		return errors;	}	public void llenar(referencia_despacho_pedido entity) {		this.refdpcodsx = entity.getrefdpcodsx();		this.refdpcodrefd = entity.getrefdpcodrefd();		this.refdcodrefp = entity.getrefdcodrefp();		this.refdcant = entity.getrefdcant();		this.refdvalorunit = entity.getRefdvalorunit();		this.refdvalortotal = entity.getRefdvalortotal();		this.refdpesoneto = entity.getRefdpesoneto();		this.refdpesobruto = entity.getRefdpesobruto();		this.refdpesonetototal = entity.getRefdpesonetototal();		this.refdpesobrutototal = entity.getRefdpesobrutototal();		this.refdvalorunitfac = entity.getRefdvalorunitfac();		this.refdvalortotalfac = entity.getRefdvalortotalfac();	}	/**	 * @return	 * @uml.property name="refdcant"	 */	public String getRefdcant() {		return refdcant;	}	/**	 * @param refdcant	 * @uml.property name="refdcant"	 */	public void setRefdcant(String refdcant) {		this.refdcant = refdcant;	}	/**	 * @return	 * @uml.property name="refdpesobruto"	 */	public String getRefdpesobruto() {		return refdpesobruto;	}	/**	 * @param refdpesobruto	 * @uml.property name="refdpesobruto"	 */	public void setRefdpesobruto(String refdpesobruto) {		this.refdpesobruto = refdpesobruto;	}	/**	 * @return	 * @uml.property name="refdpesobrutototal"	 */	public String getRefdpesobrutototal() {		return refdpesobrutototal;	}	/**	 * @param refdpesobrutototal	 * @uml.property name="refdpesobrutototal"	 */	public void setRefdpesobrutototal(String refdpesobrutototal) {		this.refdpesobrutototal = refdpesobrutototal;	}	/**	 * @return	 * @uml.property name="refdpesoneto"	 */	public String getRefdpesoneto() {		return refdpesoneto;	}	/**	 * @param refdpesoneto	 * @uml.property name="refdpesoneto"	 */	public void setRefdpesoneto(String refdpesoneto) {		this.refdpesoneto = refdpesoneto;	}	/**	 * @return	 * @uml.property name="refdpesonetototal"	 */	public String getRefdpesonetototal() {		return refdpesonetototal;	}	/**	 * @param refdpesonetototal	 * @uml.property name="refdpesonetototal"	 */	public void setRefdpesonetototal(String refdpesonetototal) {		this.refdpesonetototal = refdpesonetototal;	}	/**	 * @return	 * @uml.property name="refdvalortotal"	 */	public String getRefdvalortotal() {		return refdvalortotal;	}	/**	 * @param refdvalortotal	 * @uml.property name="refdvalortotal"	 */	public void setRefdvalortotal(String refdvalortotal) {		this.refdvalortotal = refdvalortotal;	}	/**	 * @return	 * @uml.property name="refdvalorunit"	 */	public String getRefdvalorunit() {		return refdvalorunit;	}	/**	 * @param refdvalorunit	 * @uml.property name="refdvalorunit"	 */	public void setRefdvalorunit(String refdvalorunit) {		this.refdvalorunit = refdvalorunit;	}		public String getRefdvalortotalfac() {		return refdvalortotalfac;	}	public void setRefdvalortotalfac(String refdvalortotalfac) {		this.refdvalortotalfac = refdvalortotalfac;	}	public String getRefdvalorunitfac() {		return refdvalorunitfac;	}	public void setRefdvalorunitfac(String refdvalorunitfac) {		this.refdvalorunitfac = refdvalorunitfac;	}}