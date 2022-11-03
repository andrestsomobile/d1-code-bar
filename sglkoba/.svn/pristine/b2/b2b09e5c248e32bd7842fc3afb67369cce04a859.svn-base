package util;

import java.util.ArrayList;
import java.util.Collection;

import maestro.control.gsttipoproducto;

public class Posiciones {
	public Posiciones() {

	}

	public Collection getPosicionesPorTipoProducto(String tipo, int maximo) {
		ArrayList al = new ArrayList();
		try {
			gsttipoproducto gtipr = new gsttipoproducto();
			String codigo = "";
			if (tipo != null && tipo != "")
				gtipr.gettipoproducto(tipo).gettiprcodigo();

			for (int i = 1; i <= maximo; i++) {
				al.add(codigo+String.valueOf(i));
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
			ex.printStackTrace();
		}
		return al;
	}
}
