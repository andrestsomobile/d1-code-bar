package pedido.control;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;

import nacionalizacion.control.gstnacionalizacion;
import nacionalizacion.control.gstnacionalizacion_detalle;
import nacionalizacion.entity.nacionalizacion_detalle;

import db.beanConnector;

import ingreso.control.gstentrada;
import ingreso.control.gstingreso;
import ingreso.entity.entrada;
import ingreso.entity.ingreso;
import maestro.control.gstcliente;
import maestro.control.gstcompania;
import maestro.control.gstproducto;
import maestro.entity.cliente;
import pedido.entity.despacho_pedido;
import pedido.entity.packing;
import pedido.entity.packing_detalle;
import pedido.entity.packing_detalle_posicion;
import pedido.entity.pedido;
import pedido.entity.picking;
import pedido.entity.picking_detalle;
import pedido.entity.picking_detalle_packing;
import pedido.entity.referencia_despacho;
import pedido.entity.referencia_pedido;
import util.Math;

/**
 * @author palito
 */
public class gestionSaldos {

	gstpedido gped = null;

	gstproducto gprod = null;

	gstentrada gent = null;

	gstreferencia_pedido grefp = null;

	gstnacionalizacion_detalle gnacdet = null;

	beanConnector db = null;

	String respuesta = null;

	boolean resp = false;

	gstingreso ging = null;

	public String respaldarProductoTotal(String pedcodsx, String entcodsx, String procodsx, String cantidad, String valorunit, String valorfacunit) throws SQLException {

		db = new beanConnector(false);
		gped = new gstpedido(db);
		gprod = new gstproducto(db);
		gent = new gstentrada(db);
		grefp = new gstreferencia_pedido(db);
		gnacdet = new gstnacionalizacion_detalle(db);
		ging = new gstingreso(db);

		pedido ped = gped.getpedido(pedcodsx);
		String tipo = ped.getpedtipo();

		if (tipo.equals("NAC"))
			respuesta = this.respaldarProductoTotalNAC(pedcodsx, entcodsx, procodsx, cantidad, valorunit, valorfacunit);
		else
			respuesta = this.respaldarProductoTotalSNAC(pedcodsx, entcodsx, procodsx, cantidad, valorunit, valorfacunit);
		resp = true;
		if (resp)
			db.commit();
		else
			db.rollback();
		return respuesta;

	}

	private String respaldarProductoTotalNAC(String pedcodsx, String entcodsx, String procodsx, String cantidad, String valorunit, String valorfacunit) throws SQLException {
		// con el producto y el tipo de saldo saco la lista de entradas que tengan saldo del tipo seleccionado:
		Collection entradas = null;
		BigDecimal faltante = new BigDecimal(cantidad);
		BigDecimal valunit = new BigDecimal(valorunit);
		BigDecimal valfacunit = new BigDecimal(valorfacunit);
		BigDecimal total_respaldado = new BigDecimal("0");

		pedido ped = gped.getpedido(pedcodsx);
		cliente cli = new gstcliente().getcliente(ped.getpedcliente());
		gstcompania gcom = new gstcompania();
		String cominventario = gcom.getcompania(ped.getpedcompania()).getCominventario();
		System.out.println("Manejo Inventario= " + cominventario);
		if (cominventario.equals("A")) {
			entradas = gent.getlistaentradaFIFO(procodsx, "NAC");
		} else {
			entradas = gent.getlistaentradaManual(entcodsx, "NAC");
		}
		Iterator ite = entradas.iterator();

		while (ite.hasNext() && !faltante.equals(BigDecimal.ZERO)) {
			entrada ent = (entrada) ite.next();
			/***********************************************************************************************************************************************************************************************************************************************************************************************
			 * MODIFICACION PARA QUE SI EL CLIENTE NO RECIBE DEVOLUCIONES, Y LA ENTRADA ES DE UN INGRESO POR DEVOLUCION, LO SALTE
			 */
			ingreso ing = ging.getingreso(ent.getentcodingreso());
			if (cli.getClidevolucion().equals("N") && ing.getingtipo().equals("DEVOLUCION"))
				continue;

			BigDecimal saldo_ent = new BigDecimal(ent.getentsaldonac());
			if (saldo_ent.compareTo(BigDecimal.ZERO) == 0)
				continue; // si el saldo es cero no hago nada
			if (faltante.compareTo(saldo_ent) >= 0) {
				faltante = faltante.subtract(saldo_ent);
				// en el campo codproducto coloco el codsx de la tabla nacionalizaciondetalle... si es de tipo devolucion
				// o despiece esto sale null
				// String nacdetalle = ent.getentcodproducto();
				System.out.print("11111");
				String nacdetalle = ent.getentcodproducto();
				nacionalizacion_detalle nac = null;
				if (nacdetalle != null) {
					nac = gnacdet.getnacionalizacion_detalle(nacdetalle);
				}
				//nacionalizacion_detalle nac = gnacdet.nacionalizacion_detalle_nadcodnac(ent.getentcodsx());
				//nacdetalle = nac != null ? nac.getnadcodsx() : null;

				BigDecimal total = saldo_ent.multiply(valunit);
				BigDecimal totalfac = saldo_ent.multiply(valfacunit);
				BigDecimal neto = new BigDecimal(ent.getentpesoneto()).multiply(saldo_ent);
				BigDecimal bruto = new BigDecimal(ent.getentpesobruto()).multiply(saldo_ent);

				grefp.crearreferencia_pedido(pedcodsx, procodsx, ent.getEntbodega(), ent.getentposicion(), saldo_ent.toPlainString(), valorunit, total.toPlainString(), ent.getentcodsx(), nacdetalle, saldo_ent.toPlainString(), ent.getentpesoneto(), ent.getentpesobruto(), neto.toPlainString(), bruto
						.toPlainString(), valorfacunit, totalfac.toPlainString());

				// miro si el nacdetalle es diferente de nulo para restarle el saldo:
				if (nacdetalle != null) {
					nacionalizacion_detalle nacd = gnacdet.getnacionalizacion_detalle(nacdetalle);
					nacd.setNadsaldo("0");
					gnacdet.updatenacionalizacion_detalle(nacd);
				}
				entrada entor = gent.getentrada(ent.getentcodsx());
				BigDecimal saldonacor = new BigDecimal(entor.getentsaldonac());
				saldonacor = saldonacor.subtract(saldo_ent);
				entor.setentsaldonac(saldonacor.toPlainString());
				gent.updateentrada(entor);

				total_respaldado = total_respaldado.add(saldo_ent);

			} else {
				saldo_ent = saldo_ent.subtract(faltante);
				String nacdetalle = ent.getentcodproducto();
				nacionalizacion_detalle nac = null;
				if (nacdetalle != null) {
					nac = gnacdet.getnacionalizacion_detalle(nacdetalle);
					//nacionalizacion_detalle nac = gnacdet.nacionalizacion_detalle_nadcodnac(ent.getentcodsx());
				}
				//if (nac != null) {
					//nacdetalle = nac.getnadcodsx();
				//}
				BigDecimal total = faltante.multiply(valunit);
				BigDecimal totalfac = faltante.multiply(valfacunit);

				BigDecimal neto = new BigDecimal(ent.getentpesoneto()).multiply(faltante);
				BigDecimal bruto = new BigDecimal(ent.getentpesobruto()).multiply(faltante);

				grefp.crearreferencia_pedido(pedcodsx, procodsx, ent.getEntbodega(), ent.getentposicion(), faltante.toPlainString(), valorunit, total.toPlainString(), ent.getentcodsx(), nacdetalle, faltante.toPlainString(), ent.getentpesoneto(), ent.getentpesobruto(), neto.toPlainString(), bruto
						.toPlainString(), valorfacunit, totalfac.toPlainString());

				if (nacdetalle != null) {
					nacionalizacion_detalle nacd = gnacdet.getnacionalizacion_detalle(nacdetalle);
					nacd.setNadsaldo(saldo_ent.toPlainString());
					gnacdet.updatenacionalizacion_detalle(nacd);
				}
				entrada entor = gent.getentrada(ent.getentcodsx());
				BigDecimal saldonacor = new BigDecimal(entor.getentsaldonac());
				saldonacor = saldonacor.subtract(faltante);
				entor.setentsaldonac(saldonacor.toPlainString());
				gent.updateentrada(entor);

				faltante = BigDecimal.ZERO;

				total_respaldado = total_respaldado.add(faltante);
			}

			// ahora, voy a la entrada original y le resto la cantidad que esta saliendo

			if (faltante.compareTo(BigDecimal.ZERO) == 0)
				break;
		}

		String mensaje = "";
		if (faltante.compareTo(BigDecimal.ZERO) > 0) {
			mensaje = "Se respaldo un Total de " + total_respaldado.toPlainString() + ", El saldo nacionalizado no fue suficiente";
		} else
			mensaje = "Se respaldo completamente la cantidad solicitada";
		return mensaje;
	}

	public String respaldarProductoTotalFile(String pedcodsx, String entcodsx, String procodsx, String cantidad, String valorunit, String valorfacunit) throws SQLException {

		// db = new beanConnector(false);
		gped = new gstpedido();
		gprod = new gstproducto();
		gent = new gstentrada();
		grefp = new gstreferencia_pedido();
		gnacdet = new gstnacionalizacion_detalle();
		ging = new gstingreso();
		gped = new gstpedido();
		/*
		 * pedido ped = gped.getpedido(pedcodsx); String tipo = ped.getpedtipo();
		 */
		String tipo = "NAC";
		if (tipo.equals("NAC"))
			respuesta = this.respaldarProductoTotalFileNAC(pedcodsx, entcodsx, procodsx, cantidad, valorunit, valorfacunit);
		/*
		 * else respuesta = this.respaldarProductoTotalSNAC(pedcodsx, entcodsx, procodsx, cantidad, valorunit);
		 */
		resp = true;
		/*
		 * if (resp) //db.commit(); else //db.rollback();
		 */
		return respuesta;

	}

	private String respaldarProductoTotalFileNAC(String pedcodsx, String entcodsx, String procodsx, String cantidad, String valorunit, String valorfacunit) throws SQLException {
		// con el producto y el tipo de saldo saco la lista de entradas que tengan saldo del tipo seleccionado:
		Collection entradas = null;
		System.out.println("---->" + cantidad);

		BigDecimal faltante = new BigDecimal(cantidad);
		// System.out.println("---->"+valorunit);
		BigDecimal valunit = new BigDecimal(valorunit);
		BigDecimal valfacunit = new BigDecimal(valorfacunit);
		System.out.println("---->fin");
		BigDecimal total_respaldado = new BigDecimal("0");

		System.out.println("!!!!!!!!!!!!!!!!------->pedido---" + pedcodsx);
		pedido ped = gped.getpedido(pedcodsx);
		System.out.println("!!!!!!!!!!!!!!!!------->cliente---" + ped.getpedcliente());
		cliente cli = new gstcliente().getcliente(ped.getpedcliente());
		/*
		 * gstcompania gcom = new gstcompania(); String cominventario = gcom.getcompania(ped.getpedcompania()).getCominventario(); System.out.println ("Manejo Inventario= "+cominventario); if (cominventario.equals("A")) {
		 */
		entradas = gent.getlistaentradaFIFO(procodsx, "NAC");
		/*
		 * } else { entradas = gent.getlistaentradaManual(entcodsx); }
		 */
		Iterator ite = entradas.iterator();

		while (ite.hasNext() && !faltante.equals(BigDecimal.ZERO)) {
			entrada ent = (entrada) ite.next();
			/***********************************************************************************************************************************************************************************************************************************************************************************************
			 * MODIFICACION PARA QUE SI EL CLIENTE NO RECIBE DEVOLUCIONES, Y LA ENTRADA ES DE UN INGRESO POR DEVOLUCION, LO SALTE
			 */
			ingreso ing = ging.getingreso(ent.getentcodingreso());
			if (cli.getClidevolucion().equals("N") && ing.getingtipo().equals("DEVOLUCION"))
				continue;

			BigDecimal saldo_ent = new BigDecimal(ent.getentsaldonac());
			if (saldo_ent.compareTo(BigDecimal.ZERO) == 0)
				continue; // si el saldo es cero no hago nada
			if (faltante.compareTo(saldo_ent) >= 0) {
				faltante = faltante.subtract(saldo_ent);
				// en el campo codproducto coloco el codsx de la tabla nacionalizaciondetalle... si es de tipo devolucion
				// o despiece esto sale null
				// String nacdetalle = ent.getentcodproducto();

				nacionalizacion_detalle nac = gnacdet.nacionalizacion_detalle_nadcodnac(ent.getentcodsx());
				String nacdetalle = nac.getnadcodsx();

				BigDecimal total = saldo_ent.multiply(valunit);
				BigDecimal totalfac = saldo_ent.multiply(valfacunit);
				BigDecimal neto = new BigDecimal(ent.getentpesoneto()).multiply(saldo_ent);
				BigDecimal bruto = new BigDecimal(ent.getentpesobruto()).multiply(saldo_ent);

				grefp.crearreferencia_pedido(pedcodsx, procodsx, ent.getEntbodega(), ent.getentposicion(), saldo_ent.toPlainString(), valorunit, total.toPlainString(), ent.getentcodsx(), nacdetalle, saldo_ent.toPlainString(), ent.getentpesoneto(), ent.getentpesobruto(), neto.toPlainString(), bruto
						.toPlainString(), valorfacunit, totalfac.toPlainString());

				// miro si el nacdetalle es diferente de nulo para restarle el saldo:
				if (nacdetalle != null) {
					nacionalizacion_detalle nacd = gnacdet.getnacionalizacion_detalle(nacdetalle);
					nacd.setNadsaldo("0");
					gnacdet.updatenacionalizacion_detalle(nacd);
				}
				entrada entor = gent.getentrada(ent.getentcodsx());
				BigDecimal saldonacor = new BigDecimal(entor.getentsaldonac());
				saldonacor = saldonacor.subtract(saldo_ent);
				entor.setentsaldonac(saldonacor.toPlainString());
				gent.updateentrada(entor);

				total_respaldado = total_respaldado.add(saldo_ent);

			} else {
				saldo_ent = saldo_ent.subtract(faltante);
				// String nacdetalle = ent.getentcodproducto();

				nacionalizacion_detalle nac = gnacdet.nacionalizacion_detalle_nadcodnac(ent.getentcodsx());
				String nacdetalle = nac.getnadcodsx();

				BigDecimal total = faltante.multiply(valunit);
				BigDecimal totalfac = faltante.multiply(valfacunit);
				BigDecimal neto = new BigDecimal(ent.getentpesoneto()).multiply(faltante);
				BigDecimal bruto = new BigDecimal(ent.getentpesobruto()).multiply(faltante);

				grefp.crearreferencia_pedido(pedcodsx, procodsx, ent.getEntbodega(), ent.getentposicion(), faltante.toPlainString(), valorunit, total.toPlainString(), ent.getentcodsx(), nacdetalle, faltante.toPlainString(), ent.getentpesoneto(), ent.getentpesobruto(), neto.toPlainString(), bruto
						.toPlainString(), valorfacunit, totalfac.toPlainString());

				if (nacdetalle != null) {
					nacionalizacion_detalle nacd = gnacdet.getnacionalizacion_detalle(nacdetalle);
					nacd.setNadsaldo(saldo_ent.toPlainString());
					gnacdet.updatenacionalizacion_detalle(nacd);
				}
				entrada entor = gent.getentrada(ent.getentcodsx());
				BigDecimal saldonacor = new BigDecimal(entor.getentsaldonac());
				saldonacor = saldonacor.subtract(faltante);
				entor.setentsaldonac(saldonacor.toPlainString());
				gent.updateentrada(entor);

				faltante = BigDecimal.ZERO;

				total_respaldado = total_respaldado.add(faltante);
			}

			// ahora, voy a la entrada original y le resto la cantidad que esta saliendo

			if (faltante.compareTo(BigDecimal.ZERO) == 0)
				break;
		}

		String mensaje = "";
		if (faltante.compareTo(BigDecimal.ZERO) > 0) {
			mensaje = "Se respaldo un Total de " + total_respaldado.toPlainString() + ", El saldo nacionalizado no fue suficiente";
		} else
			mensaje = "Se respaldo completamente la cantidad solicitada";
		return mensaje;
	}

	private String respaldarProductoTotalSNAC(String pedcodsx, String entcodsx, String procodsx, String cantidad, String valorunit, String valorfacunit ) throws SQLException {
		// con el producto y el tipo de saldo saco la lista de entradas que tengan saldo del tipo seleccionado:
		Collection entradas = null;
		BigDecimal faltante = new BigDecimal(cantidad);
		BigDecimal valunit = new BigDecimal(valorunit);
		BigDecimal valfacunit = new BigDecimal(valorfacunit);

		gstcompania gcom = new gstcompania();
		String cominventario = gcom.getcompania(gped.getpedido(pedcodsx).getpedcompania()).getCominventario();

		if (cominventario.equals("A")) {
			entradas = gent.getlistaentradaFIFO(procodsx, "SNAC");
		} else {
			entradas = gent.getlistaentradaManual(entcodsx, "SNAC");
		}

		Iterator ite = entradas.iterator();

		while (ite.hasNext() && !faltante.equals(BigDecimal.ZERO)) {
			entrada ent = (entrada) ite.next();
			BigDecimal saldo_ent = new BigDecimal(ent.getentsaldosinnac());
			if (saldo_ent.compareTo(BigDecimal.ZERO) == 0)
				continue; // si el saldo es cero no hago nada
			if (faltante.compareTo(saldo_ent) >= 0) {
				faltante = faltante.subtract(saldo_ent);
				// en el campo codproducto coloco el codsx de la tabla nacionalizaciondetalle... si es de tipo devolucion
				// o despiece esto sale null
				BigDecimal total = saldo_ent.multiply(valunit);
				BigDecimal totalfac = saldo_ent.multiply(valfacunit);
				BigDecimal neto = new BigDecimal(ent.getentpesoneto()).multiply(saldo_ent);
				BigDecimal bruto = new BigDecimal(ent.getentpesobruto()).multiply(saldo_ent);

				grefp.crearreferencia_pedido(pedcodsx, procodsx, ent.getEntbodega(), ent.getentposicion(), saldo_ent.toPlainString(), valorunit, total.toPlainString(), ent.getentcodsx(), null, saldo_ent.toPlainString(), ent.getentpesoneto(), ent.getentpesobruto(), neto.toPlainString(), bruto
						.toPlainString(), valorfacunit, totalfac.toPlainString());
				ent.setentsaldosinnac("0");
			} else {
				saldo_ent = saldo_ent.subtract(faltante);
				BigDecimal total = faltante.multiply(valunit);
				BigDecimal totalfac = faltante.multiply(valfacunit);
				BigDecimal neto = new BigDecimal(ent.getentpesoneto()).multiply(faltante);
				BigDecimal bruto = new BigDecimal(ent.getentpesobruto()).multiply(faltante);

				grefp.crearreferencia_pedido(pedcodsx, procodsx, ent.getEntbodega(), ent.getentposicion(), faltante.toPlainString(), valorunit, total.toPlainString(), ent.getentcodsx(), null, faltante.toPlainString(), ent.getentpesoneto(), ent.getentpesobruto(), neto.toPlainString(), bruto
						.toPlainString(), valorfacunit, totalfac.toPlainString());
				faltante = BigDecimal.ZERO;
				ent.setentsaldosinnac(saldo_ent.toPlainString());
			}
			gent.updateentrada(ent);
		}
		String mensaje = "";
		if (faltante.compareTo(BigDecimal.ZERO) > 0) {
			mensaje = "Se respaldo un Total de " + faltante.toPlainString() + ", El saldo Sin nacionalizar no fue suficiente";
		} else
			mensaje = "Se respaldo completamente la cantidad solicitada";
		return mensaje;
	}

	/**
	 * un packing siempre es de saldo nacionalizado
	 * 
	 * @param packcodsx
	 * @param procodsx
	 * @param cantidad
	 * @return
	 * @throws SQLException
	 */
	public String respaldarPackingTotalNAC(String packcodsx, String procodsx, String cantidad) throws SQLException {

		beanConnector db = new beanConnector(false);
		gstentrada gent = new gstentrada(db);
		gstnacionalizacion_detalle gnacdet = new gstnacionalizacion_detalle(db);
		gstpacking_detalle gpackd = new gstpacking_detalle(db);
		gstpacking_detalle_posicion gpd = new gstpacking_detalle_posicion(db);

		String respuesta = null;
		boolean resp = true;

		// con el producto y el tipo de saldo saco la lista de entradas que tengan saldo del tipo seleccionado:
		Collection entradas = gent.getlistaentradaFIFO(procodsx, "NAC");
		BigDecimal faltante = new BigDecimal(cantidad);
		BigDecimal total_respaldado = new BigDecimal("0");
		Iterator ite = entradas.iterator();

		// de primero creo el packing_detalle, con la cantidad completa que luego debo actualizar coon la cantidad
		// que de verdad pudo respaldar
		resp &= gpackd.crearpacking_detalle(packcodsx, procodsx);
		packing_detalle packd = gpackd.getpacking_detalle(packcodsx, procodsx);

		// ciclo para recorrer las entradas e ir respaldando lo que se pueda
		if (entradas.size() == 0) {
			db.rollback();
			throw new SQLException("No Hay Nada disponible nacionalizado para respaldar la cantidad solicitada, revise sus saldos");
		}

		while (ite.hasNext() && !faltante.equals(BigDecimal.ZERO)) {
			entrada ent = (entrada) ite.next();
			BigDecimal saldo_ent = new BigDecimal(ent.getentsaldonac());
			if (saldo_ent.compareTo(BigDecimal.ZERO) == 0)
				continue; // si el saldo es cero no hago nada
			if (faltante.compareTo(saldo_ent) >= 0) {
				total_respaldado = total_respaldado.add(saldo_ent);
				faltante = faltante.subtract(saldo_ent);
				// en el campo codproducto coloco el codsx de la tabla nacionalizaciondetalle... si es de tipo devolucion
				// o despiece esto sale null
				String nacdetalle = ent.getentcodproducto();
				// creo el registro picking_detalle_posicion
				BigDecimal pesonetototal = new BigDecimal(ent.getentpesoneto()).multiply(saldo_ent);
				BigDecimal pesobrutototal = new BigDecimal(ent.getentpesobruto()).multiply(saldo_ent);
				resp &= gpd.crearpacking_detalle_posicion(packd.getpackdcodsx(), ent.getEntbodega(), ent.getentposicion(), saldo_ent.toPlainString(), ent.getentcodsx(), nacdetalle, saldo_ent.toPlainString(), ent.getentpesoneto(), ent.getentpesobruto(), pesonetototal.toPlainString(), pesobrutototal
						.toPlainString());

				// resto el saldo en la tabla nacionalizacion_detalle, ya que me sale el saldo por nacionalizacion
				// asi la entrada se repita varias veces:
				if (nacdetalle != null) {
					nacionalizacion_detalle nacd = gnacdet.getnacionalizacion_detalle(nacdetalle);
					nacd.setNadsaldo("0");
					gnacdet.updatenacionalizacion_detalle(nacd);
				}
				entrada entor = gent.getentrada(ent.getentcodsx());
				BigDecimal saldonacor = new BigDecimal(entor.getentsaldonac());
				saldonacor = saldonacor.subtract(saldo_ent);
				entor.setentsaldonac(saldonacor.toPlainString());
				gent.updateentrada(entor);

			} else {
				saldo_ent = saldo_ent.subtract(faltante);
				String nacdetalle = ent.getentcodproducto();
				// creo el packing_detalle
				BigDecimal pesonetototal = new BigDecimal(ent.getentpesoneto()).multiply(faltante);
				BigDecimal pesobrutototal = new BigDecimal(ent.getentpesobruto()).multiply(faltante);

				resp &= gpd.crearpacking_detalle_posicion(packd.getpackdcodsx(), ent.getEntbodega(), ent.getentposicion(), faltante.toPlainString(), ent.getentcodsx(), nacdetalle, faltante.toPlainString(), ent.getentpesoneto(), ent.getentpesobruto(), pesonetototal.toPlainString(), pesobrutototal
						.toPlainString());
				if (nacdetalle != null) {
					nacionalizacion_detalle nacd = gnacdet.getnacionalizacion_detalle(nacdetalle);
					nacd.setNadsaldo(saldo_ent.toPlainString());
					gnacdet.updatenacionalizacion_detalle(nacd);
				}

				entrada entor = gent.getentrada(ent.getentcodsx());
				BigDecimal saldonacor = new BigDecimal(entor.getentsaldonac());
				saldonacor = saldonacor.subtract(faltante);
				entor.setentsaldonac(saldonacor.toPlainString());
				gent.updateentrada(entor);
				total_respaldado = total_respaldado.add(faltante);

				faltante = BigDecimal.ZERO;

			}

			// ahora, voy a la entrada original y le resto la cantidad que esta saliendo

			if (faltante.compareTo(BigDecimal.ZERO) == 0)
				break;

		}

		if (resp)
			db.commit();
		else
			db.rollback();

		if (faltante.compareTo(BigDecimal.ZERO) > 0) {
			respuesta = "Se respaldo un Total de " + total_respaldado.toPlainString() + ", El saldo nacionalizado no fue suficiente";
		} else
			respuesta = "Se respaldo completamente la cantidad solicitada (" + total_respaldado.toPlainString() + ") ";
		return respuesta;
	}

	/**
	 * METODO QUE RESPALDA CUANDO A UN PICKING SE LE QUIEREN AGREGAR UNAS CANTIDADES DETALLADAS DE UN PRODUCTO QUE DEBE ESTAR EN EL PACKING ASOCIADO AL PICKING
	 * 
	 * @param pickcodsx
	 * @param procodsx
	 * @param cantidad
	 * @return
	 * @throws SQLException
	 */
	public String respaldarPickingTotal(String pickcodsx, String procodsx, String cantidad, String valorunit) throws SQLException {

		beanConnector db = new beanConnector(false);

		gstpacking gpack = new gstpacking(db);
		gstpicking gpick = new gstpicking(db);
		gstpacking_detalle_posicion gpackpos = new gstpacking_detalle_posicion(db);
		gstpicking_detalle_packing gpickp = new gstpicking_detalle_packing(db);
		gstpicking_detalle gpickd = new gstpicking_detalle(db);
		String respuesta = null;
		boolean resp = true;

		picking pick = gpick.getpicking(pickcodsx);
		packing pack = gpack.getpacking(pick.getpickcodpacking());

		// con el producto y el packing saco las posiciones con saldo del packing..
		Collection lista_pack_pos = gpackpos.getlistapacking_detalle_posicionFIFO(pack.getpackcodsx(), procodsx);
		BigDecimal faltante = new BigDecimal(cantidad);
		BigDecimal total_respaldado = new BigDecimal("0");
		Iterator ite = lista_pack_pos.iterator();

		// ciclo para recorrer las entradas e ir respaldando lo que se pueda
		if (lista_pack_pos.size() == 0)
			throw new SQLException("No Hay Nada disponible nacionalizado para respaldar la cantidad solicitada, revise sus saldos");

		// primero creo el picking_detalle:
		resp &= gpickd.crearpicking_detalle(pickcodsx, procodsx, valorunit);
		picking_detalle pickd = gpickd.getpicking_detalle(pickcodsx, procodsx);
		if (pickd == null)
			throw new SQLException("No se pudo crear el detalle");

		while (ite.hasNext() && !faltante.equals(BigDecimal.ZERO)) {
			packing_detalle_posicion pds = (packing_detalle_posicion) ite.next();
			BigDecimal packpsaldo = new BigDecimal(pds.getPackpsaldo());
			if (packpsaldo.compareTo(BigDecimal.ZERO) == 0)
				continue;
			if (faltante.compareTo(packpsaldo) >= 0) {
				total_respaldado = total_respaldado.add(packpsaldo);
				faltante = faltante.subtract(packpsaldo);
				// creo el registro picking_detalle_packing
				BigDecimal neto = new BigDecimal(pds.getPackppesoneto()).multiply(packpsaldo);
				BigDecimal bruto = new BigDecimal(pds.getPackppesobruto()).multiply(packpsaldo);
				resp &= gpickp.crearpicking_detalle_packing(pickd.getpickdcodsx(), pds.getpackpcodsx(), packpsaldo.toPlainString(), pds.getPackppesoneto(), pds.getPackppesobruto(), neto.toPlainString(), bruto.toPlainString());
				// resto el saldo en la tabla packing_detalle_posicion

				pds.setPackpsaldo("0");
				gpackpos.updatepacking_detalle_posicion(pds);

			} else {
				packpsaldo = packpsaldo.subtract(faltante);
				BigDecimal neto = new BigDecimal(pds.getPackppesoneto()).multiply(faltante);
				BigDecimal bruto = new BigDecimal(pds.getPackppesobruto()).multiply(faltante);

				resp &= gpickp.crearpicking_detalle_packing(pickd.getpickdcodsx(), pds.getpackpcodsx(), faltante.toPlainString(), pds.getPackppesoneto(), pds.getPackppesobruto(), neto.toPlainString(), bruto.toPlainString());
				// resto el saldo en la tabla packing_detalle_posicion

				pds.setPackpsaldo(packpsaldo.toPlainString());
				gpackpos.updatepacking_detalle_posicion(pds);

				total_respaldado = total_respaldado.add(faltante);

				faltante = BigDecimal.ZERO;

			}

			if (faltante.compareTo(BigDecimal.ZERO) == 0)
				break;

		}

		if (resp)
			db.commit();
		else
			db.rollback();
		System.out.println(total_respaldado);
		System.out.println(faltante);

		if (faltante.compareTo(BigDecimal.ZERO) > 0) {
			respuesta = "Se respaldo un Total de " + total_respaldado.toPlainString() + ", El saldo del packing no fue suficiente";
		} else
			respuesta = "Se respaldo completamente la cantidad solicitada (" + total_respaldado.toPlainString() + ") ";
		return respuesta;
	}

	

	/**
	 * METODO QUE CREA LAS REFERENCIAS EN UN PEDIDO EN LA TABAL REFERENCIA_PEDIDO A PARTIR DE UN PICKING LO QUE SE HACE ES COPIAR TODO LO DEL PICKING A LA TABLA REFERENCIA_PEDIDO
	 * 
	 * @param pedcodsx
	 * @param pickcodsx
	 * @param _db
	 * @return
	 * @throws SQLException
	 */
	public boolean crearReferenciasPedidoByPicking(String pedcodsx, String pickcodsx, beanConnector _db) throws SQLException {
		gstreferencia_pedido grefp = new gstreferencia_pedido(_db);
		gstpicking_detalle gpickd = new gstpicking_detalle(_db);
		gstpicking_detalle_packing gpickdp = new gstpicking_detalle_packing(_db);
		gstpacking_detalle_posicion gpackdp = new gstpacking_detalle_posicion(_db);
		gstentrada gent = new gstentrada(_db);
		Collection dets = gpickd.getlistapicking_detalle(pickcodsx);
		Iterator itedets = dets.iterator();
		boolean resp = true;
		while (itedets.hasNext()) {
			picking_detalle pickd = (picking_detalle) itedets.next();
			// por cada detalle, saco las posiciones respaldadas:
			Collection detsp = gpickdp.getlistapicking_detalle_packing(pickd.getpickdcodsx());
			Iterator itedetsp = detsp.iterator();
			while (itedetsp.hasNext()) {
				picking_detalle_packing pickdp = (picking_detalle_packing) itedetsp.next();
				packing_detalle_posicion packdp = gpackdp.getpacking_detalle_posicion(pickdp.getpickppackingdet());
				entrada ent = gent.getentrada(packdp.getpackpentrada());
				// POR CADA respaldo individual, creo un registro de "referencia_pedido"
				String total = Math.multiplicar(pickdp.getpickpcantidad(), pickd.getPickdvalorunit());
				BigDecimal neto = new BigDecimal(ent.getentpesoneto()).multiply(new BigDecimal(pickdp.getpickpcantidad()));
				BigDecimal bruto = new BigDecimal(ent.getentpesobruto()).multiply(new BigDecimal(pickdp.getpickpcantidad()));

				resp &= grefp.crearreferencia_pedido(pedcodsx, pickd.getpickdproducto(), packdp.getpackpbodega(), packdp.getpackpposicion(), pickdp.getpickpcantidad(), pickd.getPickdvalorunit(), total, packdp.getpackpentrada(), packdp.getpackpnacdetalle(), pickdp.getpickpcantidad(), ent
						.getentpesoneto(), ent.getentpesobruto(), neto.toPlainString(), bruto.toPlainString(), "0", "0");
			}
		}
		return resp;
	}

	public boolean activarPickingEliminarReferenciasPedido(String pickcodsx) throws SQLException {

		boolean r = true;
		beanConnector db = new beanConnector(false);
		gstpicking gpick = new gstpicking(db);
		gstpedido gped = new gstpedido(db);
		gstreferencia_pedido grefp = new gstreferencia_pedido(db);

		picking pick = gpick.getpicking(pickcodsx);
		pedido ped = gped.getpedidoByPicking(pickcodsx);

		// lo primero es que aseguro que el estado del pedido sea TRAMITE
		ped.setpedestado("TRAMITE");
		r &= gped.updatepedido(ped);

		// luego borro todas las referencias:
		r &= grefp.eliminarReferenciasPedido(ped.getpedcodsx());

		// por ultimo activo el picking:
		pick.setpickestado("TRAMITE");
		r &= gpick.updatepicking(pick);

		if (r)
			db.commit();
		else
			db.rollback();

		return r;
	}

	public boolean respaldarDespachoByPedidoCompleto(String despcodsx, String pedcodsx, beanConnector _db, String bultos, String bultosarmados) throws SQLException {
		boolean r = true;

		beanConnector db = _db;
		gstdespacho_pedido g_desp = new gstdespacho_pedido(db);
		gstreferencia_pedido grefp = new gstreferencia_pedido(db);
		gstreferencia_despacho grefdesp = new gstreferencia_despacho(db);
		gstreferencia_despacho_pedido gref_desp_ped = new gstreferencia_despacho_pedido(db);

		r &= g_desp.creardespacho_pedido(despcodsx, pedcodsx, bultos, bultosarmados);
		despacho_pedido dp = g_desp.getdespacho_pedido(despcodsx, pedcodsx);

		// apenas cree el pedido, agrego TODAS las referencias del pedido al despacho con toda
		// su cantidad, respaldandolos y restando el saldo de la tabla referencia_pedido

		Collection items_pedido = grefp.getProductosPedidoDisponible(pedcodsx);
		Iterator ite = items_pedido.iterator();
		while (ite.hasNext()) {
			Collection ltemp = (Collection) ite.next();
			Iterator ite_ltemp = ltemp.iterator();
			String refpproducto = (String) ite_ltemp.next();

			r &= grefdesp.crearreferencia_despacho(dp.getdespedcodsx(), refpproducto, "0", "0", "0", "0", null);
			referencia_despacho refdesp = grefdesp.getreferencia_despacho(dp.getdespedcodsx(), refpproducto);

			// ahora respaldo el total, eso es restar por referencia_pedido del total, que en ultimas es
			// poner el saldo en cero por entrada:
			Collection lista_refp = grefp.getlistareferencia_pedido_disponible(pedcodsx, refpproducto);
			Iterator ite_lrefp = lista_refp.iterator();
			while (ite_lrefp.hasNext()) {
				referencia_pedido refp = (referencia_pedido) ite_lrefp.next();

				BigDecimal val_total = new BigDecimal(refp.getrefpvalorunit()).multiply(new BigDecimal(refp.getRefpsaldo()));
				BigDecimal valfac_total = new BigDecimal(refp.getRefpvalorfacunit()).multiply(new BigDecimal(refp.getRefpsaldo()));
				BigDecimal neto_total = new BigDecimal(refp.getRefppesoneto()).multiply(new BigDecimal(refp.getRefpsaldo()));
				BigDecimal bruto_total = new BigDecimal(refp.getRefppesobruto()).multiply(new BigDecimal(refp.getRefpsaldo()));

				r &= gref_desp_ped.crearreferencia_despacho_pedido(refdesp.getrefdcodsx(), refp.getrefpcodsx(), refp.getRefpsaldo(), 
						refp.getrefpvalorunit(), val_total.toPlainString(), refp.getRefppesoneto(), refp.getRefppesobruto(),
						neto_total.toPlainString(), bruto_total.toPlainString(), refp.getRefpvalorfacunit(), valfac_total.toPlainString());

				refp.setRefpsaldo("0");
				grefp.updatereferencia_pedido(refp);
				// AKI TENGO QUE SUMAR EL PESO NETO, PESO BRUTO Y VALOR DE referencia_pedido al
				// despacho:

			}

		}

		return r;

	}

	public boolean respaldarDespachoByPedidoReferencia(String refddespacho_pedido, String procodsx, String cantidad, beanConnector _db) throws SQLException {
		boolean r = true;

		beanConnector db = _db;
		gstdespacho_pedido g_desp = new gstdespacho_pedido(db);
		gstreferencia_pedido grefp = new gstreferencia_pedido(db);
		gstreferencia_despacho grefdesp = new gstreferencia_despacho(db);
		gstreferencia_despacho_pedido gref_desp_ped = new gstreferencia_despacho_pedido(db);

		despacho_pedido dp = g_desp.getdespacho_pedido(refddespacho_pedido);

		String sal = grefp.getDisponible(dp.getdespedpedido(), procodsx);

		BigDecimal faltante = new BigDecimal(cantidad);
		BigDecimal saldo_total = new BigDecimal(sal);

		if (faltante.compareTo(saldo_total) > 0)
			throw new SQLException("El saldo disponible es mayor");

		r &= grefdesp.crearreferencia_despacho(dp.getdespedcodsx(), procodsx, "0", "0", "0", "0", null);
		referencia_despacho refdesp = grefdesp.getreferencia_despacho(dp.getdespedcodsx(), procodsx);

		// ahora respaldo el total, eso es restar por referencia_pedido del total, que en ultimas es
		// poner el saldo en cero por entrada:
		Collection lista_refp = grefp.getlistareferencia_pedido_disponible(dp.getdespedpedido(), procodsx);
		Iterator ite_lrefp = lista_refp.iterator();

		while (ite_lrefp.hasNext() && faltante.compareTo(BigDecimal.ZERO) > 0) {

			referencia_pedido refp = (referencia_pedido) ite_lrefp.next();
			BigDecimal disponible = new BigDecimal(refp.getRefpsaldo());
			if (disponible.compareTo(BigDecimal.ZERO) == 0)
				continue;
			String usado = "0";
			if (disponible.compareTo(faltante) > 0) {
				refp.setRefpsaldo((disponible.subtract(faltante)).toPlainString());
				usado = faltante.toPlainString();
				faltante = faltante.ZERO;
			} else {
				usado = disponible.toPlainString();
				faltante = faltante.subtract(disponible);
				refp.setRefpsaldo("0");
			}

			BigDecimal val_total = new BigDecimal(usado).multiply(new BigDecimal(refp.getrefpvalorunit()));
			BigDecimal valfac_total = new BigDecimal(refp.getRefpvalorfacunit()).multiply(new BigDecimal(refp.getRefpsaldo()));
			BigDecimal neto_total = new BigDecimal(usado).multiply(new BigDecimal(refp.getRefppesoneto()));
			BigDecimal bruto_total = new BigDecimal(usado).multiply(new BigDecimal(refp.getRefppesobruto()));

			r &= gref_desp_ped.crearreferencia_despacho_pedido(refdesp.getrefdcodsx(), refp.getrefpcodsx(), usado, refp.getrefpvalorunit(), 
					val_total.toPlainString(), refp.getRefppesoneto(), refp.getRefppesobruto(), neto_total.toPlainString(), 
					bruto_total.toPlainString(), refp.getRefpvalorfacunit(), valfac_total.toPlainString());

			r &= grefp.updatereferencia_pedido(refp);
		}

		return r;
	}

}
