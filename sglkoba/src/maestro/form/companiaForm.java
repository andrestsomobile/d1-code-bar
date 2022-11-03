package maestro.form;import javax.servlet.http.HttpServletRequest;import org.apache.struts.action.ActionErrors;import org.apache.struts.action.ActionForm;import org.apache.struts.action.ActionMapping;import maestro.control.*;import maestro.entity.*;import org.apache.struts.action.ActionMessage;/** * CLASE GENERADA CON generator V3.0 By pablito**** */public class companiaForm extends ActionForm {	private String comcodsx;	private String comdireccion;	private String comnombre;	private String comfax;	private String comciudad;	private String comemail;	private String comgerente;	private String comcontacto;	private String comcargo;	private String comtelefono;	private String opcion;	private String comnit;		private String comtipo;		private String cominventario;		private String commapa;		public void setopcion(String newopcion) {		this.opcion = newopcion;	}	public String getopcion() {		return this.opcion;	}	public String getcomcodsx() {		return comcodsx;	}	public String getcomdireccion() {		return comdireccion;	}	public String getcomnombre() {		return comnombre;	}	public String getcomfax() {		return comfax;	}	public String getcomciudad() {		return comciudad;	}	public String getcomemail() {		return comemail;	}	public String getcomgerente() {		return comgerente;	}	public String getcomcontacto() {		return comcontacto;	}	public String getcomcargo() {		return comcargo;	}	public String getcomtelefono() {		return comtelefono;	}	public void setcomcodsx(String new_comcodsx) {		this.comcodsx = new_comcodsx;	}	public void setcomdireccion(String new_comdireccion) {		this.comdireccion = new_comdireccion;	}	public void setcomnombre(String new_comnombre) {		this.comnombre = new_comnombre;	}	public void setcomfax(String new_comfax) {		this.comfax = new_comfax;	}	public void setcomciudad(String new_comciudad) {		this.comciudad = new_comciudad;	}	public void setcomemail(String new_comemail) {		this.comemail = new_comemail;	}	public void setcomgerente(String new_comgerente) {		this.comgerente = new_comgerente;	}	public void setcomcontacto(String new_comcontacto) {		this.comcontacto = new_comcontacto;	}	public void setcomcargo(String new_comcargo) {		this.comcargo = new_comcargo;	}	public void setcomtelefono(String new_comtelefono) {		this.comtelefono = new_comtelefono;	}	public void reset(ActionMapping mapping, HttpServletRequest request) {	}	public ActionErrors validate(ActionMapping mapping,			HttpServletRequest request) {		ActionErrors errors = new ActionErrors();		gstcompania gcompania = new gstcompania();		opcion = opcion == null || opcion.equals("") ? "crear" : opcion;		if (opcion.equals("set") || opcion.equals("delete"))			return null;				// valido campos requeridos:		if (comdireccion.equals(""))			errors.add("comdireccion", new ActionMessage(					"<b>La direcci�n no puede ser vacia</b>", false));		if (comnombre.equals(""))			errors.add("comnombre", new ActionMessage(					"<b>El Nombre no puede ser vacio</b>", false));		if (comcontacto.equals(""))			errors.add("comcontacto", new ActionMessage(					"<b>El Contacto no puede ser vacio</b>", false));		if (comtelefono.equals(""))			errors.add("comtelefono", new ActionMessage(					"<b>El Telefono no puede ser vacio</b>", false));		if (comnit.equals(""))			errors.add("comnit", new ActionMessage(					"<b>El NIT no puede ser vacio</b>", false));			if (comciudad.equals(""))			errors.add("comciudad", new ActionMessage(					"<b>la ciudad de la compania no puede ser vacio</b>", false));						if (opcion.equals("crear")) {			// @todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS			compania com = gcompania.getcompania_by_ukey(comnombre);			if (com != null) {				errors.add("comnombre", new ActionMessage("<b>La compa�ia "						+ comnombre + " ya existe</b>", false));						}		}		if (!errors.isEmpty())			errors.add("general", new ActionMessage(					"<b>No se pudo guardar los datos, revise</b> ", false));		return errors;	}	public void llenar(compania entity) {		this.comcodsx = entity.getcomcodsx();		this.comdireccion = entity.getcomdireccion();		this.comnombre = entity.getcomnombre();		this.comfax = entity.getcomfax();		this.comciudad = entity.getcomciudad();		this.comemail = entity.getcomemail();		this.comgerente = entity.getcomgerente();		this.comcontacto = entity.getcomcontacto();		this.comcargo = entity.getcomcargo();		this.comtelefono = entity.getcomtelefono();		this.comnit = entity.getComnit();		this.comtipo = entity.getComtipo();		this.cominventario = entity.getCominventario();		this.commapa = entity.getCommapa();	}	/**	 * @return	 * @uml.property  name="comnit"	 */	public String getComnit() {		return comnit;	}	/**	 * @param comnit	 * @uml.property  name="comnit"	 */	public void setComnit(String comnit) {		this.comnit = comnit;	}	public String getComtipo() {		return comtipo;	}	public String getCominventario() {		return cominventario;	}	public String getCommapa() {		return commapa;	}	public void setComtipo(String comtipo) {		this.comtipo = comtipo;	}	public void setCominventario(String cominventario) {		this.cominventario = cominventario;	}	public void setCommapa(String commapa) {		this.commapa = commapa;	}}