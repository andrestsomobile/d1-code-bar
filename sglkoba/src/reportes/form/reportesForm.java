package reportes.form;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

/**
 * @author  palito
 */
public class reportesForm extends ActionForm {
	
	/**
	 * @uml.property  name="fecha"
	 */
	private String fecha;	
	/**
	 * @uml.property  name="fecha_ini"
	 */
	private String fecha_ini;
	/**
	 * @uml.property  name="fecha_fin"
	 */
	private String fecha_fin;
	/**
	 * @uml.property  name="cliente_ini"
	 */
	private String cliente_ini;
	/**
	 * @uml.property  name="cliente_fin"
	 */
	private String cliente_fin;
	/**
	 * @uml.property  name="cia_ini"
	 */
	private String cia_ini ;
	/**
	 * @uml.property  name="cia_fin"
	 */
	private String cia_fin;
	/**
	 * @uml.property  name="ref_ini"
	 */
	private String ref_ini;
	/**
	 * @uml.property  name="ref_fin"
	 */
	private String ref_fin;
	/**
	 * @uml.property  name="reporte"
	 */
	private String reporte;
	/**
	 * @uml.property  name="detallado"
	 */
	private String detallado;
	/**
	 * @uml.property  name="bodega"
	 */
	private String bodega;
	/**
	 * @uml.property  name="posicion"
	 */
	private String posicion;
	/**
	 * @uml.property  name="entrada"
	 */
	private String entrada;
	/**
	 * @uml.property  name="causal_devolucion"
	 */
	private String causal_devolucion;
	/**
	 * @uml.property  name="embarque"
	 */
	private String embarque;
	/**
	 * @uml.property  name="tipo_reporte"
	 */
	private String tipo_reporte;
	/**
	 * @uml.property  name="mes"
	 */
	private String mes;
	/**
	 * @uml.property  name="compania"
	 */
	private String compania;
	/**
	 * @uml.property  name="anno"
	 */
	private String anno ;
	/**
	 * @uml.property  name="zona"
	 */
	private String zona;
	/**
	 * @uml.property  name="hit"
	 */
	private String hit;
	/**
	 * @uml.property  name="cliente"
	 */
	private String cliente;
	/**
	 * @uml.property  name="referencia"
	 */
	private String referencia;
	/**
	 * @uml.property  name="categoria"
	 */
	private String categoria;
	
	/**
	 * @return
	 * @uml.property  name="cia_fin"
	 */
	private String usuario;
	
	private String cons_ini;
	
	private String cons_fin;
	
	private String clientefacturacion;
	
	private String tipo_formato;
	
	public String getCia_fin() {
		return cia_fin;
	}

	/**
	 * @param cia_fin
	 * @uml.property  name="cia_fin"
	 */
	public void setCia_fin(String cia_fin) {
		this.cia_fin = cia_fin;
	}

	/**
	 * @return
	 * @uml.property  name="cia_ini"
	 */
	public String getCia_ini() {
		return cia_ini;
	}

	/**
	 * @param cia_ini
	 * @uml.property  name="cia_ini"
	 */
	public void setCia_ini(String cia_ini) {
		this.cia_ini = cia_ini;
	}

	/**
	 * @return
	 * @uml.property  name="cliente_fin"
	 */
	public String getCliente_fin() {
		return cliente_fin;
	}

	/**
	 * @param cliente_fin
	 * @uml.property  name="cliente_fin"
	 */
	public void setCliente_fin(String cliente_fin) {
		this.cliente_fin = cliente_fin;
	}

	/**
	 * @return
	 * @uml.property  name="cliente_ini"
	 */
	public String getCliente_ini() {
		return cliente_ini;
	}

	/**
	 * @param cliente_ini
	 * @uml.property  name="cliente_ini"
	 */
	public void setCliente_ini(String cliente_ini) {
		this.cliente_ini = cliente_ini;
	}

	/**
	 * @return
	 * @uml.property  name="fecha_fin"
	 */
	public String getFecha_fin() {
		if(fecha_fin!=null && fecha_fin.indexOf(" ")==-1) fecha_fin+= " 23:59:59";
		return fecha_fin;
	}

	/**
	 * @param fecha_fin
	 * @uml.property  name="fecha_fin"
	 */
	public void setFecha_fin(String fecha_fin) {
		this.fecha_fin = fecha_fin;
	}

	/**
	 * @return
	 * @uml.property  name="fecha_ini"
	 */
	public String getFecha_ini() {
		if(fecha_ini!=null && fecha_ini.indexOf(" ")==-1) fecha_ini += " 00:00:00";
		return fecha_ini;
	}

	/**
	 * @param fecha_ini
	 * @uml.property  name="fecha_ini"
	 */
	public void setFecha_ini(String fecha_ini) {
		this.fecha_ini = fecha_ini;
	}

	/**
	 * @return
	 * @uml.property  name="ref_fin"
	 */
	public String getRef_fin() {
		return ref_fin;
	}

	/**
	 * @param ref_fin
	 * @uml.property  name="ref_fin"
	 */
	public void setRef_fin(String ref_fin) {
		this.ref_fin = ref_fin;
	}

	/**
	 * @return
	 * @uml.property  name="ref_ini"
	 */
	public String getRef_ini() {
		return ref_ini;
	}

	/**
	 * @param ref_ini
	 * @uml.property  name="ref_ini"
	 */
	public void setRef_ini(String ref_ini) {
		this.ref_ini = ref_ini;
	}

	/**
	 * @return
	 * @uml.property  name="reporte"
	 */
	public String getReporte() {
		return reporte;
	}

	/**
	 * @param reporte
	 * @uml.property  name="reporte"
	 */
	public void setReporte(String reporte) {
		this.reporte = reporte;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {  	} 

	 public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
	return null;
	 }

	/**
	 * @return
	 * @uml.property  name="detallado"
	 */
	public String getDetallado() {
		return detallado;
	}

	/**
	 * @param detallado
	 * @uml.property  name="detallado"
	 */
	public void setDetallado(String detallado) {
		this.detallado = detallado;
	}

	/**
	 * @return
	 * @uml.property  name="bodega"
	 */
	public String getBodega() {
		return bodega;
	}

	/**
	 * @param bodega
	 * @uml.property  name="bodega"
	 */
	public void setBodega(String bodega) {
		this.bodega = bodega;
	}

	/**
	 * @return
	 * @uml.property  name="posicion"
	 */
	public String getPosicion() {
		return posicion;
	}

	/**
	 * @param posicion
	 * @uml.property  name="posicion"
	 */
	public void setPosicion(String posicion) {
		this.posicion = posicion;
	}

	/**
	 * @return
	 * @uml.property  name="entrada"
	 */
	public String getEntrada() {
		return entrada;
	}

	/**
	 * @param entrada
	 * @uml.property  name="entrada"
	 */
	public void setEntrada(String entrada) {
		this.entrada = entrada;
	}

	/**
	 * @return
	 * @uml.property  name="causal_devolucion"
	 */
	public String getCausal_devolucion() {
		return causal_devolucion;
	}

	/**
	 * @param causal_devolucion
	 * @uml.property  name="causal_devolucion"
	 */
	public void setCausal_devolucion(String causal_devolucion) {
		this.causal_devolucion = causal_devolucion;
	}

	/**
	 * @return
	 * @uml.property  name="embarque"
	 */
	public String getEmbarque() {
		return embarque;
	}

	/**
	 * @param embarque
	 * @uml.property  name="embarque"
	 */
	public void setEmbarque(String embarque) {
		this.embarque = embarque;
	}

	/**
	 * @return
	 * @uml.property  name="tipo_reporte"
	 */
	public String getTipo_reporte() {
		return tipo_reporte;
	}

	/**
	 * @param tipo_reporte
	 * @uml.property  name="tipo_reporte"
	 */
	public void setTipo_reporte(String tipo_reporte) {
		this.tipo_reporte = tipo_reporte;
	}

	/**
	 * @return
	 * @uml.property  name="anno"
	 */
	public String getAnno() {
		return anno;
	}

	/**
	 * @param anno
	 * @uml.property  name="anno"
	 */
	public void setAnno(String anno) {
		this.anno = anno;
	}

	/**
	 * @return
	 * @uml.property  name="compania"
	 */
	public String getCompania() {
		return compania;
	}

	/**
	 * @param compania
	 * @uml.property  name="compania"
	 */
	public void setCompania(String compania) {
		this.compania = compania;
	}

	/**
	 * @return
	 * @uml.property  name="mes"
	 */
	public String getMes() {
		return mes;
	}

	/**
	 * @param mes
	 * @uml.property  name="mes"
	 */
	public void setMes(String mes) {
		this.mes = mes;
	}

	/**
	 * @return
	 * @uml.property  name="zona"
	 */
	public String getZona() {
		return zona;
	}

	/**
	 * @param zona
	 * @uml.property  name="zona"
	 */
	public void setZona(String zona) {
		this.zona = zona;
	}

	/**
	 * @return
	 * @uml.property  name="hit"
	 */
	public String getHit() {
		return hit;
	}

	/**
	 * @param hit
	 * @uml.property  name="hit"
	 */
	public void setHit(String hit) {
		this.hit = hit;
	}

	/**
	 * @return
	 * @uml.property  name="cliente"
	 */
	public String getCliente() {
		return cliente;
	}

	/**
	 * @param cliente
	 * @uml.property  name="cliente"
	 */
	public void setCliente(String cliente) {
		this.cliente = cliente;
	}

	/**
	 * @return
	 * @uml.property  name="referencia"
	 */
	public String getReferencia() {
		return referencia;
	}

	/**
	 * @param referencia
	 * @uml.property  name="referencia"
	 */
	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	/**
	 * @return
	 * @uml.property  name="categoria"
	 */
	public String getCategoria() {
		return categoria;
	}

	/**
	 * @param categoria
	 * @uml.property  name="categoria"
	 */
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	} 

	
	/**
	 * @return
	 * @uml.property  name="fecha"
	 */
	public String getFecha() {
		if(fecha!=null && fecha.indexOf(" ")==-1) fecha += " 23:59:59";
		return fecha;
	}

	/**
	 * @param fecha_ini
	 * @uml.property  name="fecha_ini"
	 */
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getCons_ini() {
		return cons_ini;
	}

	public void setCons_ini(String cons_ini) {
		this.cons_ini = cons_ini;
	}

	public String getCons_fin() {
		return cons_fin;
	}

	public void setCons_fin(String cons_fin) {
		this.cons_fin = cons_fin;
	}

	public String getClientefacturacion() {
		return clientefacturacion;
	}

	public void setClientefacturacion(String clientefacturacion) {
		this.clientefacturacion = clientefacturacion;
	}

	public String getTipo_formato() {
		return tipo_formato;
	}

	public void setTipo_formato(String tipo_formato) {
		this.tipo_formato = tipo_formato;
	}
		
	
}
