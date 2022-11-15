package ingreso.entity;

@SuppressWarnings("serial")
public class inspeccion_recibo implements java.io.Serializable {
	private String inretrafico;

	private String inrelctrafico;

	private String inremuelle;

	private String inreprecinto;

	private String inrevencimiento;

	private String inrelote;

	private String inreestibas;

	private String inrecajas;

	private String inresaldo;

	private String inrenovedades;

	private String inrerecuperadas;

	private String inretotalump;

	private String inreesibasrequeridas;

	private String inrepesoestibavacia;

	private String inrepesototalestibasvacias;

	private String inrepesoestibapaletizada;

	private String inrepesoporump;

	private String inrepesonetoproducto;

	private String inreobservaciones;

	private String inrearlvigente_cal;

	private String inrearlvigente_obs;

	private String inrecarnet_cal;

	private String inrecarnet_obs;

	private String inreproteccion_cal;

	private String inreproteccion_obs;

	private String inrefumigacion_cal;

	private String inrefumigacion_obs;

	private String inremanipulacion_cal;

	private String inremanipulacion_obs;

	private String inreaseovehiculo_cal;

	private String inreaseovehiculo_obs;

	private String inresustanciasquimicas_cal;

	private String inresustanciasquimicas_obs;

	private String inretemperatura_cal;

	private String inretemperatura_obs;

	private String inreestadogeneral_cal;

	private String inreestadogeneral_obs;

	private String inrerevisiones_cal;

	private String inrerevisiones_obs;

	private String inreumprecibidas_cal;

	private String inreumprecibidas_obs;

	private String inreumprevisadas_cal;

	private String inreumprevisadas_obs;

	private String inretablanutricional_cal;

	private String inretablanutricional_obs;

	private String inreimportacioncinc_cal;

	private String inreimportacioncinc_obs;

	private String inrecalificacion_cal;

	private String inrecalificacion_obs;

	private String inrerecibido;

	private String inreconductor;

	private String inrefechagenerado;
	
	private String inreproducto;
	
	private String inrecontenedor;
	
	private String inretiponovedades;
	
	public inspeccion_recibo(String inretrafico, String inrelctrafico) {
		super();
		this.inretrafico = inretrafico;
		this.inrelctrafico = inrelctrafico;
	}
	
	public inspeccion_recibo() {
		super();
		this.inretrafico = "";
		this.inrelctrafico = "";
		this.inremuelle = "";
		this.inreprecinto = "";
		this.inrevencimiento = "";
		this.inrelote = "";
		this.inreestibas = "";
		this.inrecajas = "";
		this.inresaldo = "";
		this.inrenovedades = "";
		this.inrerecuperadas = "";
		this.inretotalump = "";
		this.inreesibasrequeridas = "";
		this.inrepesoestibavacia = "";
		this.inrepesototalestibasvacias = "";
		this.inrepesoestibapaletizada = "";
		this.inrepesoporump = "";
		this.inrepesonetoproducto = "";
		this.inreobservaciones = "";
		this.inrearlvigente_cal = "";
		this.inrearlvigente_obs = "";
		this.inrecarnet_cal = "";
		this.inrecarnet_obs = "";
		this.inreproteccion_cal = "";
		this.inreproteccion_obs = "";
		this.inrefumigacion_cal = "";
		this.inrefumigacion_obs = "";
		this.inremanipulacion_cal = "";
		this.inremanipulacion_obs = "";
		this.inreaseovehiculo_cal = "";
		this.inreaseovehiculo_obs = "";
		this.inresustanciasquimicas_cal = "";
		this.inresustanciasquimicas_obs = "";
		this.inretemperatura_cal = "";
		this.inretemperatura_obs = "";
		this.inreestadogeneral_cal = "";
		this.inreestadogeneral_obs = "";
		this.inrerevisiones_cal = "";
		this.inrerevisiones_obs = "";
		this.inreumprecibidas_cal = "";
		this.inreumprecibidas_obs = "";
		this.inreumprevisadas_cal = "";
		this.inreumprevisadas_obs = "";
		this.inretablanutricional_cal = "";
		this.inretablanutricional_obs = "";
		this.inreimportacioncinc_cal = "";
		this.inreimportacioncinc_obs = "";
		this.inrecalificacion_cal = "";
		this.inrecalificacion_obs = "";
		this.inrerecibido = "";
		this.inreconductor = "";
		this.inrefechagenerado = "";
		this.inreproducto = "";
		this.inrecontenedor = "";
		this.inretiponovedades = "";
	}

	public inspeccion_recibo(String inretrafico, String inrelctrafico, String inremuelle, String inreprecinto, String inrevencimiento, String inrelote, String inreestibas, String inrecajas, String inresaldo, String inrenovedades, String inrerecuperadas, String inretotalump,
			String inreesibasrequeridas, String inrepesoestibavacia, String inrepesototalestibasvacias, String inrepesoestibapaletizada, String inrepesoporump, String inrepesonetoproducto, String inreobservaciones, String inrearlvigente_cal, String inrearlvigente_obs, String inrecarnet_cal,
			String inrecarnet_obs, String inreproteccion_cal, String inreproteccion_obs, String inrefumigacion_cal, String inrefumigacion_obs, String inremanipulacion_cal, String inremanipulacion_obs, String inreaseovehiculo_cal, String inreaseovehiculo_obs, String inresustanciasquimicas_cal,
			String inresustanciasquimicas_obs, String inretemperatura_cal, String inretemperatura_obs, String inreestadogeneral_cal, String inreestadogeneral_obs, String inrerevisiones_cal, String inrerevisiones_obs, String inreumprecibidas_cal, String inreumprecibidas_obs,
			String inreumprevisadas_cal, String inreumprevisadas_obs, String inretablanutricional_cal, String inretablanutricional_obs, String inreimportacioncinc_cal, String inreimportacioncinc_obs, String inrecalificacion_cal, String inrecalificacion_obs, String inrerecibido, String inreconductor,
			String inrefechagenerado, String inreproducto, 
			String inrecontenedor, String inretiponovedades) {
		super();
		this.inretrafico = inretrafico;
		this.inrelctrafico = inrelctrafico;
		this.inremuelle = inremuelle;
		this.inreprecinto = inreprecinto;
		this.inrevencimiento = inrevencimiento;
		this.inrelote = inrelote;
		this.inreestibas = inreestibas;
		this.inrecajas = inrecajas;
		this.inresaldo = inresaldo;
		this.inrenovedades = inrenovedades;
		this.inrerecuperadas = inrerecuperadas;
		this.inretotalump = inretotalump;
		this.inreesibasrequeridas = inreesibasrequeridas;
		this.inrepesoestibavacia = inrepesoestibavacia;
		this.inrepesototalestibasvacias = inrepesototalestibasvacias;
		this.inrepesoestibapaletizada = inrepesoestibapaletizada;
		this.inrepesoporump = inrepesoporump;
		this.inrepesonetoproducto = inrepesonetoproducto;
		this.inreobservaciones = inreobservaciones;
		this.inrearlvigente_cal = inrearlvigente_cal;
		this.inrearlvigente_obs = inrearlvigente_obs;
		this.inrecarnet_cal = inrecarnet_cal;
		this.inrecarnet_obs = inrecarnet_obs;
		this.inreproteccion_cal = inreproteccion_cal;
		this.inreproteccion_obs = inreproteccion_obs;
		this.inrefumigacion_cal = inrefumigacion_cal;
		this.inrefumigacion_obs = inrefumigacion_obs;
		this.inremanipulacion_cal = inremanipulacion_cal;
		this.inremanipulacion_obs = inremanipulacion_obs;
		this.inreaseovehiculo_cal = inreaseovehiculo_cal;
		this.inreaseovehiculo_obs = inreaseovehiculo_obs;
		this.inresustanciasquimicas_cal = inresustanciasquimicas_cal;
		this.inresustanciasquimicas_obs = inresustanciasquimicas_obs;
		this.inretemperatura_cal = inretemperatura_cal;
		this.inretemperatura_obs = inretemperatura_obs;
		this.inreestadogeneral_cal = inreestadogeneral_cal;
		this.inreestadogeneral_obs = inreestadogeneral_obs;
		this.inrerevisiones_cal = inrerevisiones_cal;
		this.inrerevisiones_obs = inrerevisiones_obs;
		this.inreumprecibidas_cal = inreumprecibidas_cal;
		this.inreumprecibidas_obs = inreumprecibidas_obs;
		this.inreumprevisadas_cal = inreumprevisadas_cal;
		this.inreumprevisadas_obs = inreumprevisadas_obs;
		this.inretablanutricional_cal = inretablanutricional_cal;
		this.inretablanutricional_obs = inretablanutricional_obs;
		this.inreimportacioncinc_cal = inreimportacioncinc_cal;
		this.inreimportacioncinc_obs = inreimportacioncinc_obs;
		this.inrecalificacion_cal = inrecalificacion_cal;
		this.inrecalificacion_obs = inrecalificacion_obs;
		this.inrerecibido = inrerecibido;
		this.inreconductor = inreconductor;
		this.inrefechagenerado = inrefechagenerado;
		this.inreproducto = inreproducto;
		this.inrecontenedor = inrecontenedor;
		this.inretiponovedades = inretiponovedades;
	}

	public String getInreproducto() {
		return inreproducto;
	}

	public void setInreproducto(String inreproducto) {
		this.inreproducto = inreproducto;
	}

	public String getInrecontenedor() {
		return inrecontenedor;
	}

	public void setInrecontenedor(String inrecontenedor) {
		this.inrecontenedor = inrecontenedor;
	}

	public String getInretiponovedades() {
		return inretiponovedades;
	}

	public void setInretiponovedades(String inretiponovedades) {
		this.inretiponovedades = inretiponovedades;
	}

	public String getInretrafico() {
		return inretrafico;
	}

	public void setInretrafico(String inretrafico) {
		this.inretrafico = inretrafico;
	}

	public String getInrelctrafico() {
		return inrelctrafico;
	}

	public void setInrelctrafico(String inrelctrafico) {
		this.inrelctrafico = inrelctrafico;
	}

	public String getInremuelle() {
		return inremuelle;
	}

	public void setInremuelle(String inremuelle) {
		this.inremuelle = inremuelle;
	}

	public String getInreprecinto() {
		return inreprecinto;
	}

	public void setInreprecinto(String inreprecinto) {
		this.inreprecinto = inreprecinto;
	}

	public String getInrevencimiento() {
		return inrevencimiento;
	}

	public void setInrevencimiento(String inrevencimiento) {
		this.inrevencimiento = inrevencimiento;
	}

	public String getInrelote() {
		return inrelote;
	}

	public void setInrelote(String inrelote) {
		this.inrelote = inrelote;
	}

	public String getInreestibas() {
		return inreestibas;
	}

	public void setInreestibas(String inreestibas) {
		this.inreestibas = inreestibas;
	}

	public String getInrecajas() {
		return inrecajas;
	}

	public void setInrecajas(String inrecajas) {
		this.inrecajas = inrecajas;
	}

	public String getInresaldo() {
		return inresaldo;
	}

	public void setInresaldo(String inresaldo) {
		this.inresaldo = inresaldo;
	}

	public String getInrenovedades() {
		return inrenovedades;
	}

	public void setInrenovedades(String inrenovedades) {
		this.inrenovedades = inrenovedades;
	}

	public String getInrerecuperadas() {
		return inrerecuperadas;
	}

	public void setInrerecuperadas(String inrerecuperadas) {
		this.inrerecuperadas = inrerecuperadas;
	}

	public String getInretotalump() {
		return inretotalump;
	}

	public void setInretotalump(String inretotalump) {
		this.inretotalump = inretotalump;
	}

	public String getInreesibasrequeridas() {
		return inreesibasrequeridas;
	}

	public void setInreesibasrequeridas(String inreesibasrequeridas) {
		this.inreesibasrequeridas = inreesibasrequeridas;
	}

	public String getInrepesoestibavacia() {
		return inrepesoestibavacia;
	}

	public void setInrepesoestibavacia(String inrepesoestibavacia) {
		this.inrepesoestibavacia = inrepesoestibavacia;
	}

	public String getInrepesototalestibasvacias() {
		return inrepesototalestibasvacias;
	}

	public void setInrepesototalestibasvacias(String inrepesototalestibasvacias) {
		this.inrepesototalestibasvacias = inrepesototalestibasvacias;
	}

	public String getInrepesoestibapaletizada() {
		return inrepesoestibapaletizada;
	}

	public void setInrepesoestibapaletizada(String inrepesoestibapaletizada) {
		this.inrepesoestibapaletizada = inrepesoestibapaletizada;
	}

	public String getInrepesoporump() {
		return inrepesoporump;
	}

	public void setInrepesoporump(String inrepesoporump) {
		this.inrepesoporump = inrepesoporump;
	}

	public String getInrepesonetoproducto() {
		return inrepesonetoproducto;
	}

	public void setInrepesonetoproducto(String inrepesonetoproducto) {
		this.inrepesonetoproducto = inrepesonetoproducto;
	}

	public String getInreobservaciones() {
		return inreobservaciones;
	}

	public void setInreobservaciones(String inreobservaciones) {
		this.inreobservaciones = inreobservaciones;
	}

	public String getInrearlvigente_cal() {
		return inrearlvigente_cal;
	}

	public void setInrearlvigente_cal(String inrearlvigente_cal) {
		this.inrearlvigente_cal = inrearlvigente_cal;
	}

	public String getInrearlvigente_obs() {
		return inrearlvigente_obs;
	}

	public void setInrearlvigente_obs(String inrearlvigente_obs) {
		this.inrearlvigente_obs = inrearlvigente_obs;
	}

	public String getInrecarnet_cal() {
		return inrecarnet_cal;
	}

	public void setInrecarnet_cal(String inrecarnet_cal) {
		this.inrecarnet_cal = inrecarnet_cal;
	}

	public String getInrecarnet_obs() {
		return inrecarnet_obs;
	}

	public void setInrecarnet_obs(String inrecarnet_obs) {
		this.inrecarnet_obs = inrecarnet_obs;
	}

	public String getInreproteccion_cal() {
		return inreproteccion_cal;
	}

	public void setInreproteccion_cal(String inreproteccion_cal) {
		this.inreproteccion_cal = inreproteccion_cal;
	}

	public String getInreproteccion_obs() {
		return inreproteccion_obs;
	}

	public void setInreproteccion_obs(String inreproteccion_obs) {
		this.inreproteccion_obs = inreproteccion_obs;
	}

	public String getInrefumigacion_cal() {
		return inrefumigacion_cal;
	}

	public void setInrefumigacion_cal(String inrefumigacion_cal) {
		this.inrefumigacion_cal = inrefumigacion_cal;
	}

	public String getInrefumigacion_obs() {
		return inrefumigacion_obs;
	}

	public void setInrefumigacion_obs(String inrefumigacion_obs) {
		this.inrefumigacion_obs = inrefumigacion_obs;
	}

	public String getInremanipulacion_cal() {
		return inremanipulacion_cal;
	}

	public void setInremanipulacion_cal(String inremanipulacion_cal) {
		this.inremanipulacion_cal = inremanipulacion_cal;
	}

	public String getInremanipulacion_obs() {
		return inremanipulacion_obs;
	}

	public void setInremanipulacion_obs(String inremanipulacion_obs) {
		this.inremanipulacion_obs = inremanipulacion_obs;
	}

	public String getInreaseovehiculo_cal() {
		return inreaseovehiculo_cal;
	}

	public void setInreaseovehiculo_cal(String inreaseovehiculo_cal) {
		this.inreaseovehiculo_cal = inreaseovehiculo_cal;
	}

	public String getInreaseovehiculo_obs() {
		return inreaseovehiculo_obs;
	}

	public void setInreaseovehiculo_obs(String inreaseovehiculo_obs) {
		this.inreaseovehiculo_obs = inreaseovehiculo_obs;
	}

	public String getInresustanciasquimicas_cal() {
		return inresustanciasquimicas_cal;
	}

	public void setInresustanciasquimicas_cal(String inresustanciasquimicas_cal) {
		this.inresustanciasquimicas_cal = inresustanciasquimicas_cal;
	}

	public String getInresustanciasquimicas_obs() {
		return inresustanciasquimicas_obs;
	}

	public void setInresustanciasquimicas_obs(String inresustanciasquimicas_obs) {
		this.inresustanciasquimicas_obs = inresustanciasquimicas_obs;
	}

	public String getInretemperatura_cal() {
		return inretemperatura_cal;
	}

	public void setInretemperatura_cal(String inretemperatura_cal) {
		this.inretemperatura_cal = inretemperatura_cal;
	}

	public String getInretemperatura_obs() {
		return inretemperatura_obs;
	}

	public void setInretemperatura_obs(String inretemperatura_obs) {
		this.inretemperatura_obs = inretemperatura_obs;
	}

	public String getInreestadogeneral_cal() {
		return inreestadogeneral_cal;
	}

	public void setInreestadogeneral_cal(String inreestadogeneral_cal) {
		this.inreestadogeneral_cal = inreestadogeneral_cal;
	}

	public String getInreestadogeneral_obs() {
		return inreestadogeneral_obs;
	}

	public void setInreestadogeneral_obs(String inreestadogeneral_obs) {
		this.inreestadogeneral_obs = inreestadogeneral_obs;
	}

	public String getInrerevisiones_cal() {
		return inrerevisiones_cal;
	}

	public void setInrerevisiones_cal(String inrerevisiones_cal) {
		this.inrerevisiones_cal = inrerevisiones_cal;
	}

	public String getInrerevisiones_obs() {
		return inrerevisiones_obs;
	}

	public void setInrerevisiones_obs(String inrerevisiones_obs) {
		this.inrerevisiones_obs = inrerevisiones_obs;
	}

	public String getInreumprecibidas_cal() {
		return inreumprecibidas_cal;
	}

	public void setInreumprecibidas_cal(String inreumprecibidas_cal) {
		this.inreumprecibidas_cal = inreumprecibidas_cal;
	}

	public String getInreumprecibidas_obs() {
		return inreumprecibidas_obs;
	}

	public void setInreumprecibidas_obs(String inreumprecibidas_obs) {
		this.inreumprecibidas_obs = inreumprecibidas_obs;
	}

	public String getInreumprevisadas_cal() {
		return inreumprevisadas_cal;
	}

	public void setInreumprevisadas_cal(String inreumprevisadas_cal) {
		this.inreumprevisadas_cal = inreumprevisadas_cal;
	}

	public String getInreumprevisadas_obs() {
		return inreumprevisadas_obs;
	}

	public void setInreumprevisadas_obs(String inreumprevisadas_obs) {
		this.inreumprevisadas_obs = inreumprevisadas_obs;
	}

	public String getInretablanutricional_cal() {
		return inretablanutricional_cal;
	}

	public void setInretablanutricional_cal(String inretablanutricional_cal) {
		this.inretablanutricional_cal = inretablanutricional_cal;
	}

	public String getInretablanutricional_obs() {
		return inretablanutricional_obs;
	}

	public void setInretablanutricional_obs(String inretablanutricional_obs) {
		this.inretablanutricional_obs = inretablanutricional_obs;
	}

	public String getInreimportacioncinc_cal() {
		return inreimportacioncinc_cal;
	}

	public void setInreimportacioncinc_cal(String inreimportacioncinc_cal) {
		this.inreimportacioncinc_cal = inreimportacioncinc_cal;
	}

	public String getInreimportacioncinc_obs() {
		return inreimportacioncinc_obs;
	}

	public void setInreimportacioncinc_obs(String inreimportacioncinc_obs) {
		this.inreimportacioncinc_obs = inreimportacioncinc_obs;
	}

	public String getInrecalificacion_cal() {
		return inrecalificacion_cal;
	}

	public void setInrecalificacion_cal(String inrecalificacion_cal) {
		this.inrecalificacion_cal = inrecalificacion_cal;
	}

	public String getInrecalificacion_obs() {
		return inrecalificacion_obs;
	}

	public void setInrecalificacion_obs(String inrecalificacion_obs) {
		this.inrecalificacion_obs = inrecalificacion_obs;
	}

	public String getInrerecibido() {
		return inrerecibido;
	}

	public void setInrerecibido(String inrerecibido) {
		this.inrerecibido = inrerecibido;
	}

	public String getInreconductor() {
		return inreconductor;
	}

	public void setInreconductor(String inreconductor) {
		this.inreconductor = inreconductor;
	}

	public String getInrefechagenerado() {
		return inrefechagenerado;
	}

	public void setInrefechagenerado(String inrefechagenerado) {
		this.inrefechagenerado = inrefechagenerado;
	}

}
