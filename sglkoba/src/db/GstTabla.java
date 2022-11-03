/*
 * Created on 03-nov-2004
 */
package db;

import java.lang.reflect.Constructor;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.Collection;
import java.util.StringTokenizer;

import db.beanConnector;

public abstract class GstTabla {
	protected beanConnector db = null;
	protected int maxfilas=10;
	protected Class classEntidad; 
	protected Connection cx;
	
	public GstTabla(){
	}
	protected Object getEntidad(String consulta){
		try {
			ResultSet rs = db.executeQuery(consulta);
			if (rs.next()) {
				return getEntidad(rs);
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
			ex.printStackTrace();
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	protected ArrayList getLista(String consulta){
		ArrayList al = new ArrayList();
		try {
			ResultSet rs = db.executeQuery(consulta);
			@SuppressWarnings("unused")
			java.sql.ResultSetMetaData rsm = rs.getMetaData();
			while (rs.next()) {
				al.add(getEntidad(rs));
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
			ex.printStackTrace();
		}
		return al;
	}
	protected Collection<ArrayList<String>> getListaDeListas(String consulta){
		ArrayList<ArrayList<String>> al = new ArrayList<ArrayList<String>>();
		try {
			ResultSet rs = db.executeQuery(consulta);
			java.sql.ResultSetMetaData rsm = rs.getMetaData();
			while (rs.next()) {
				ArrayList<String> al1 = new ArrayList<String>();
				for(int i=1; i<=rsm.getColumnCount();i++){
					al1.add(rs.getString(rsm.getColumnName(i)));
				}
				al.add(al1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return al;
	}
	protected int getConteo(String consulta){
		int campos = 0;
		try {
			ResultSet rs = db.executeQuery(consulta);
			if (rs.next()) {
				campos = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
			ex.printStackTrace();
		}
		return campos;
	}	
	protected String getCampo(String consulta){
		String campo = null;
		try {
			ResultSet rs = db.executeQuery(consulta);
			if (rs.next()) {
				campo = rs.getString(1);
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
			ex.printStackTrace();
		}
		return campo;
	}	
	protected Object getEntidad(ResultSet rs) throws Exception{
		ResultSetMetaData rsm = rs.getMetaData();
		Class [] cargs = new Class[rsm.getColumnCount()];//arreglo del tipo de dato de los parametros del constructor a crear
		Object [] oargs = new Object[rsm.getColumnCount()];//arreglo de los parametros del constructor;
		for(int i=0; i < rsm.getColumnCount(); i++){
			oargs[i] = rs.getString(i+1);			
			cargs[i] = String.class;
		}
		//Class classEntidad = Class.forName(nombreEntidad);
		Constructor c = classEntidad.getConstructor(cargs);
		return c.newInstance(oargs);
	}
	
	
	
	protected int getPaginas(String consulta)	{
		int campos =getConteo(consulta);
		int paginas = 0;
		float r =	campos /(float) maxfilas   ;
		paginas = (int)Math.ceil(r);
		return paginas; 
	}
	public int getMaxfilas() {
		return maxfilas;
	}
	public void setMaxfilas(int maxfilas) {
		this.maxfilas = maxfilas;
	}
	/**
	 * convierte la cadena larga con espacios en una cadena de OR's en el campo RESUMEN
	 * @param cadena
	 * @return
	 */
	protected String getTextoBusquedaResumen(String cadena){
		
		if(cadena.equals("")) return " resumen like '%%'";
		
		StringTokenizer stk = new StringTokenizer(cadena.toUpperCase(), " ");
		cadena = "(" ;
		int tokens = stk.countTokens();
		int i=1;
		while(stk.hasMoreElements()) {
			cadena += " RESUMEN like '%"  + new String(stk.nextElement().toString()).toUpperCase() + "%' ";
			if(tokens != i++)		cadena += " and ";
		}
		cadena +=")";
		return cadena;
	}

	protected String getTextoBusquedaResumen(String tabla, String cadena){
		
		if(cadena.equals("")) return tabla + ".resumen like '%%'";
		
		StringTokenizer stk = new StringTokenizer(cadena.toUpperCase(), " ");
		cadena = "(" ;
		int tokens = stk.countTokens();
		int i=1;
		while(stk.hasMoreElements()) {
			cadena += tabla + ".RESUMEN like '%"  + new String(stk.nextElement().toString()).toUpperCase() + "%' ";
			if(tokens != i++)		cadena += " and ";
		}
		cadena +=")";
		return cadena;
	}
	
	protected String getTextoBusquedaResumen_OR(String cadena){
		
		if(cadena.equals("")) return " resumen like '%%'";
		
		StringTokenizer stk = new StringTokenizer(cadena.toUpperCase(), " ");
		cadena = "(" ;
		int tokens = stk.countTokens();
		int i=1;
		while(stk.hasMoreElements()) {
			cadena += " RESUMEN like '%"  + new String(stk.nextElement().toString()).toUpperCase() + "%' ";
			if(tokens != i++)		cadena += " or ";
		}
		cadena +=")";
		return cadena;
	}
}
