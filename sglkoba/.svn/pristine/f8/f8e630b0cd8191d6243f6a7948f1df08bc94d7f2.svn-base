// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 20/11/2008 04:20:49 p.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   pedidoForm.java

package pedido.form;

import java.util.Collection;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import maestro.control.gstciudad;
import maestro.control.gstcliente;
import maestro.control.gstdepartamento;
import maestro.control.gstsucursal;
import maestro.control.gsttransportadora;
import maestro.entity.ciudad;
import maestro.entity.cliente;
import maestro.entity.departamento;
import maestro.entity.sucursal;
import maestro.entity.transportadora;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import pedido.control.gstpedido;
import pedido.entity.pedido;

public class pedidoForm extends ActionForm {
	private String pedcodsx;

	private String pedcompania;

	private String pednumpedido;

	private String pedordencompra;

	private String pedguia;

	private String pedfechasistema;

	private String pedfecha;

	private String pedfechavenc;

	private String pedfechacita;

	private String pedhoracita;

	private String pedcliente;

	private String pedsucursal;

	private String peddireccion;

	private String pedciudad;

	private String peddepartamento;

	private String pedobservaciones;

	private String pedfactura;

	private String pedestado;

	private String pedsubtotal;

	private String pediva;

	private String peddescuento;

	private String pedtotal;

	private String pedtipo;

	private String opcion;

	private String clidesc;

	private String sucdesc;

	private String ciudesc;

	private String depdesc;

	private String pedpicking;

	private String pedpesoneto;

	private String pedpesobruto;

	private String pedhora;

	private String pedzona;

	private String pedcausal_hit;

	private String pedporc_iva;

	private String pedtransportadora;

	private String transpnombre;
	
	//private String pedinventario;

	private String pedfactotal;
	
	private String pedfechaalistamiento;
	
	private String pedfechadespacho;
	
	private String pedfechaentrega;
	
	public pedidoForm() {
	}

	public String getCiudesc() {
		return ciudesc;
	}

	public String getClidesc() {
		return clidesc;
	}

	public String getDepdesc() {
		return depdesc;
	}

	public String getopcion() {
		return opcion;
	}

	public String getPedcausal_hit() {
		return pedcausal_hit;
	}

	public String getpedciudad() {
		return pedciudad;
	}

	public String getpedcliente() {
		return pedcliente;
	}

	public String getpedcodsx() {
		return pedcodsx;
	}

	public String getpedcompania() {
		return pedcompania;
	}

	public String getpeddepartamento() {
		return peddepartamento;
	}

	public String getpeddescuento() {
		return peddescuento;
	}

	public String getpeddireccion() {
		return peddireccion;
	}

	public String getpedestado() {
		return pedestado;
	}

	public String getpedfactura() {
		return pedfactura;
	}

	public String getpedfecha() {
		return pedfecha;
	}

	public String getpedfechacita() {
		return pedfechacita;
	}

	public String getpedfechasistema() {
		return pedfechasistema;
	}

	public String getpedfechavenc() {
		return pedfechavenc;
	}

	public String getpedguia() {
		return pedguia;
	}

	public String getPedhora() {
		return pedhora;
	}

	public String getpedhoracita() {
		return pedhoracita;
	}

	public String getpediva() {
		return pediva;
	}

	public String getpednumpedido() {
		return pednumpedido;
	}

	public String getpedobservaciones() {
		return pedobservaciones;
	}

	public String getpedordencompra() {
		return pedordencompra;
	}

	public String getPedpesobruto() {
		return pedpesobruto;
	}

	public String getPedpesoneto() {
		return pedpesoneto;
	}

	public String getPedpicking() {
		return pedpicking;
	}

	public String getPedporc_iva() {
		return pedporc_iva;
	}

	public String getpedsubtotal() {
		return pedsubtotal;
	}

	public String getpedsucursal() {
		return pedsucursal;
	}

	public String getPedtipo() {
		return pedtipo;
	}

	public String getpedtotal() {
		return pedtotal;
	}

	public String getPedzona() {
		return pedzona;
	}

	public String getSucdesc() {
		return sucdesc;
	}

	public void llenar(pedido entity) {
		pedcodsx = entity.getpedcodsx();
		pedcompania = entity.getpedcompania();
		pednumpedido = entity.getpednumpedido();
		pedordencompra = entity.getpedordencompra();
		pedguia = entity.getpedguia();
		pedfechasistema = entity.getpedfechasistema();
		pedfecha = entity.getpedfecha();
		pedfechavenc = entity.getpedfechavenc();
		pedfechacita = entity.getpedfechacita();
		pedhoracita = entity.getpedhoracita();
		pedcliente = entity.getpedcliente();
		pedsucursal = entity.getpedsucursal();
		peddireccion = entity.getpeddireccion();
		pedciudad = entity.getpedciudad();
		peddepartamento = entity.getpeddepartamento();
		pedobservaciones = entity.getpedobservaciones();
		pedfactura = entity.getpedfactura();
		pedestado = entity.getpedestado();
		pedsubtotal = entity.getpedsubtotal();
		pediva = entity.getpediva();
		peddescuento = entity.getpeddescuento();
		pedtotal = entity.getpedtotal();
		pedtipo = entity.getpedtipo();
		pedpicking = entity.getPedpicking();
		pedpesoneto = entity.getPedpesoneto();
		pedpesobruto = entity.getPedpesobruto();
		cliente cli = (new gstcliente()).getcliente(pedcliente);
		if (cli != null)
			clidesc = cli.getclinombre();
		sucursal suc = null; //(new gstsucursal()).getsuccodcursal(pedsucursal);
		if (suc == null)
			suc = (new gstsucursal()).getsucursal(pedsucursal);
		if (suc != null)
			sucdesc = suc.getsucnombre();
		departamento dep = (new gstdepartamento()).getdepartamento(peddepartamento);
		if (dep != null)
			depdesc = dep.getdepnombre();
		ciudad ciu = (new gstciudad()).getciudad(pedciudad);
		if (ciu != null)
			ciudesc = ciu.getciunombre();
		pedhora = entity.getPedhora();
		pedzona = entity.getPedzona();
		pedcausal_hit = entity.getPedcausal_hit();
		pedporc_iva = entity.getPedporc_iva();
		pedtransportadora = entity.getPedtransportadora();
		transportadora transp = (new gsttransportadora()).gettransportadora(pedtransportadora);
		if (transp != null)
			transpnombre = transp.gettranspnombre();
		//pedinventario = entity.getPedinventario();
		pedfactotal = entity.getPedfactotal();
		pedfechaalistamiento = entity.getPedfechaalistamiento();
		pedfechadespacho = entity.getPedfechadespacho();
		pedfechaentrega = entity.getPedfechaentrega();
	}

	public void reset(ActionMapping actionmapping, HttpServletRequest httpservletrequest) {
	}

	public void setCiudesc(String ciudesc) {
		this.ciudesc = ciudesc;
	}

	public void setClidesc(String clidesc) {
		this.clidesc = clidesc;
	}

	public void setDepdesc(String depdesc) {
		this.depdesc = depdesc;
	}

	public void setopcion(String newopcion) {
		opcion = newopcion;
	}

	public void setPedcausal_hit(String pedcausal_hit) {
		this.pedcausal_hit = pedcausal_hit;
	}

	public void setpedciudad(String new_pedciudad) {
		pedciudad = new_pedciudad;
	}

	public void setpedcliente(String new_pedcliente) {
		pedcliente = new_pedcliente;
	}

	public void setpedcodsx(String new_pedcodsx) {
		pedcodsx = new_pedcodsx;
	}

	public void setpedcompania(String new_pedcompania) {
		pedcompania = new_pedcompania;
	}

	public void setpeddepartamento(String new_peddepartamento) {
		peddepartamento = new_peddepartamento;
	}

	public void setpeddescuento(String new_peddescuento) {
		peddescuento = new_peddescuento;
	}

	public void setpeddireccion(String new_peddireccion) {
		peddireccion = new_peddireccion;
	}

	public void setpedestado(String new_pedestado) {
		pedestado = new_pedestado;
	}

	public void setpedfactura(String new_pedfactura) {
		pedfactura = new_pedfactura;
	}

	public void setpedfecha(String new_pedfecha) {
		pedfecha = new_pedfecha;
	}

	public void setpedfechacita(String new_pedfechacita) {
		pedfechacita = new_pedfechacita;
	}

	public void setpedfechasistema(String new_pedfechasistema) {
		pedfechasistema = new_pedfechasistema;
	}

	public void setpedfechavenc(String new_pedfechavenc) {
		pedfechavenc = new_pedfechavenc;
	}

	public void setpedguia(String new_pedguia) {
		pedguia = new_pedguia;
	}

	public void setPedhora(String pedhora) {
		this.pedhora = pedhora;
	}

	public void setpedhoracita(String new_pedhoracita) {
		pedhoracita = new_pedhoracita;
	}

	public void setpediva(String new_pediva) {
		pediva = new_pediva;
	}

	public void setpednumpedido(String new_pednumpedido) {
		pednumpedido = new_pednumpedido;
	}

	public void setpedobservaciones(String new_pedobservaciones) {
		pedobservaciones = new_pedobservaciones;
	}

	public void setpedordencompra(String new_pedordencompra) {
		pedordencompra = new_pedordencompra;
	}

	public void setPedpesobruto(String pedpesobruto) {
		this.pedpesobruto = pedpesobruto;
	}

	public void setPedpesoneto(String pedpesoneto) {
		this.pedpesoneto = pedpesoneto;
	}

	public void setPedpicking(String pedpicking) {
		this.pedpicking = pedpicking;
	}

	public void setPedporc_iva(String porc_iva) {
		pedporc_iva = porc_iva;
	}

	public void setpedsubtotal(String new_pedsubtotal) {
		pedsubtotal = new_pedsubtotal;
	}

	public void setpedsucursal(String new_pedsucursal) {
		pedsucursal = new_pedsucursal;
	}

	public void setPedtipo(String pedtipo) {
		this.pedtipo = pedtipo;
	}

	public void setpedtotal(String new_pedtotal) {
		pedtotal = new_pedtotal;
	}

	public void setPedzona(String pedzona) {
		this.pedzona = pedzona;
	}

	public void setSucdesc(String sucdesc) {
		this.sucdesc = sucdesc;
	}

	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		gstpedido gpedido = new gstpedido();
		opcion = opcion != null ? opcion : "crear";
		if (opcion.equals("set") || opcion.equals("delete") || opcion.equals("activar") || opcion.equals("fijar_factura") || opcion.equals("cambiar_transportadora") || opcion.equals("fijar_observacion") || opcion.equals("fijar_fechasis"))
			return null;
		opcion.equals("crear");
		pedpicking = pedpicking == null || !pedpicking.equals("") ? pedpicking : null;
		if (pedcompania.equals(""))
			errors.add("pedcompania", new ActionMessage("La empresa no puede ser vacio", false));
		if (pednumpedido.equals(""))
			errors.add("pednumpedido", new ActionMessage("El Numero de pedido no puede ser vacio", false));
		if (pedordencompra.equals(""))
			errors.add("pedordencompra", new ActionMessage("La orden de compra no puede ser vacio", false));
		if (pedguia.equals(""))
			errors.add("pedguia", new ActionMessage("La guia del pedido no puede ser vacio", false));
		if (pedfecha.equals(""))
			errors.add("pedfecha", new ActionMessage("El Fecha del pedido no puede ser vacio", false));
		if (pedfechavenc.equals(""))
			errors.add("pedfechavenc", new ActionMessage("El Fecha vencimiento no puede ser vacio", false));
		if (pedcliente.equals(""))
			errors.add("pedcliente", new ActionMessage("El Cliente no puede ser vacio", false));
		if (pedsucursal.equals(""))
			errors.add("pedsucursal", new ActionMessage("La sucursal no puede ser vacio", false));
		if (peddireccion.equals(""))
			errors.add("peddireccion", new ActionMessage("La direccion no puede ser vacio", false));
		if (pedciudad.equals(""))
			errors.add("pedciudad", new ActionMessage("La ciudad no puede ser vacio", false));
		if (peddepartamento.equals(""))
			errors.add("peddepartamento", new ActionMessage("El Departamento no puede ser vacio", false));
		if (pedtipo == null)
			errors.add("pedtipo", new ActionMessage("El Tipo de pedido no puede ser vacio", false));
		if (pedcausal_hit.equals(""))
			errors.add("pedcausal_hit", new ActionMessage("El Causal HIT de pedido no puede ser vacio", false));
		if (pedporc_iva.equals(""))
			errors.add("pedporc_iva", new ActionMessage("El Porcentaje de IVA del pedido no puede ser vacio", false));
		if (pedtransportadora.equals(""))
			errors.add("pedtransportadora", new ActionMessage("La transportadora no puede ser vacio", false));
		if (!pedcompania.equals("") && !pedguia.equals("")) {
			Collection pedidos = gpedido.getlistapedidoByGuia(pedcompania, pedguia);
			if (!pedidos.isEmpty()) {
				Iterator ite = pedidos.iterator();
				if (ite.hasNext()) {
					pedido ped = (pedido) ite.next();
					String guia = ped.getpedguia();
					String cli = ped.getpedcliente();
					String suc = ped.getpedsucursal();
					if (guia.equals(pedguia))
						if (!cli.equals(pedcliente)) {
							cliente cl = (new gstcliente()).getcliente(cli);
							errors.add("pedguia", new ActionMessage((new StringBuilder("EL NUMERO DE GUIA ")).append(guia).append(" YA ESTA ASOCIADO AL PEDIDO ").append(" CON CONSECUTIVO ").append(ped.getpedcodsx()).append(", POR LO TANTO, EL CLIENTE DEBE SER EL MISMO ").append(
									" EN TODOS LOS PEDIDOS (CLIENTE ").append(cl.getclinombre()).append(" - ").append(cl.getclicodsx()).append(")").toString(), false));
						} else if (!suc.equals(pedsucursal)) {
							// sucursal su = (new gstsucursal()).getsucursal(suc);
							// Lucy: se modifica porque se genera error, pues no encuentra la sucursal
							sucursal su = (new gstsucursal()).getsuccodcursal(suc);
							cliente cl = (new gstcliente()).getcliente(cli);
							errors.add("pedsucursal", new ActionMessage((new StringBuilder("EL NUMERO DE GUIA ")).append(guia).append(" YA ESTA ASOCIADO AL PEDIDO ").append(" CON CONSECUTIVO ").append(ped.getpedcodsx()).append(", POR LO TANTO, EL CLIENTE DEBE SER EL MISMO ").append(
									" EN TODOS LOS PEDIDOS (CLIENTE ").append(cl.getclinombre()).append(" - ").append(cl.getclicodsx()).append(")").append(" y la sucursal ").append(su.getsucnombre()).append(" ubicada en la direccion:").append(su.getsucdireccion()).toString(), false));
						}
				}
			}
		}
		pedido ped = gpedido.getpedido(getpedcodsx());
		if (ped != null && ped.getpedestado().equals("TRAMITE") && getpedestado().equals("FINALIZADO") && getpedfactura().equals("")) {
			errors.add("pedfactura", new ActionMessage("UN PEDIDO SE PUEDE FINALIZAR SI TIENE EL NUMERO DE FACTURA", false));
			pedestado = "TRAMITE";
		}
		if (!errors.isEmpty())
			errors.add("general", new ActionMessage("No se han podido guardar los datos, revise", false));
		return errors;
	}

	public String getPedtransportadora() {
		return pedtransportadora;
	}

	public void setPedtransportadora(String pedtransportadora) {
		this.pedtransportadora = pedtransportadora;
	}

	public String getTranspnombre() {
		return transpnombre;
	}

	public void setTranspnombre(String transpnombre) {
		this.transpnombre = transpnombre;
	}
	/*
	public String getPedinventario() {
		return pedinventario;
	}

	public void setPedinventario(String pedinventario) {
		this.pedinventario = pedinventario;
	}
	*/
	
	public String getPedfactotal() {
		return pedfactotal;
	}

	public void setPedfactotal(String pedfactotal) {
		this.pedfactotal = pedfactotal;
	}

	public String getPedfechaalistamiento() {
		return pedfechaalistamiento;
	}

	public void setPedfechaalistamiento(String pedfechaalistamiento) {
		this.pedfechaalistamiento = pedfechaalistamiento;
	}

	public String getPedfechadespacho() {
		return pedfechadespacho;
	}

	public void setPedfechadespacho(String pedfechadespacho) {
		this.pedfechadespacho = pedfechadespacho;
	}

	public String getPedfechaentrega() {
		return pedfechaentrega;
	}

	public void setPedfechaentrega(String pedfechaentrega) {
		this.pedfechaentrega = pedfechaentrega;
	}
}