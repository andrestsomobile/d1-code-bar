// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 07/07/2011 11:29:02 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   registro_pedido.java

package registro.entity;

import java.io.Serializable;

public class registro_almacenamiento implements Serializable {
	
	private String realcodsx;
	private String realaccion;
	private String realfecha;
	private String realempleado;
	private String realhoin;
	private String realhofi;
	private String realcantestibas;
	private String realestado;
	
	
	public registro_almacenamiento(String realcodsx, String realaccion, String realfecha, String realempleado, String realhoin, String realhofi, String realcantestibas, String realestado) {
		super();
		this.realcodsx = realcodsx;
		this.realaccion = realaccion;
		this.realfecha = realfecha;
		this.realempleado = realempleado;
		this.realhoin = realhoin;
		this.realhofi = realhofi;
		this.realcantestibas = realcantestibas;
		this.realestado = realestado;
	}
	
	public String getRealcodsx() {
		return realcodsx;
	}

	public void setRealcodsx(String realcodsx) {
		this.realcodsx = realcodsx;
	}

	public String getRealaccion() {
		return realaccion;
	}

	public void setRealaccion(String realaccion) {
		this.realaccion = realaccion;
	}

	public String getRealfecha() {
		return realfecha;
	}

	public void setRealfecha(String realfecha) {
		this.realfecha = realfecha;
	}

	public String getRealempleado() {
		return realempleado;
	}

	public void setRealempleado(String realempleado) {
		this.realempleado = realempleado;
	}

	public String getRealhoin() {
		return realhoin;
	}

	public void setRealhoin(String realhoin) {
		this.realhoin = realhoin;
	}

	public String getRealhofi() {
		return realhofi;
	}

	public void setRealhofi(String realhofi) {
		this.realhofi = realhofi;
	}

	public String getRealcantestibas() {
		return realcantestibas;
	}

	public void setRealcantestibas(String realcantestibas) {
		this.realcantestibas = realcantestibas;
	}

	public String getRealestado() {
		return realestado;
	}

	public void setRealestado(String realestado) {
		this.realestado = realestado;
	}
	
}
