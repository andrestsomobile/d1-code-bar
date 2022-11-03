package db;

import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;

import util.Fecha;
import util.Propiedades;

public class beanConnector implements Serializable {

	static InitialContext ic;

	private Connection cx;

	private Statement query;

	public static org.postgresql.jdbc2.optional.PoolingDataSource datasource;

	public static String dbname;

	static {
		String ipservidor = Propiedades.getProperties("ipservidor");
		String basedatos = Propiedades.getProperties("basedatos");
		String usuario = Propiedades.getProperties("usuario");
		String password = Propiedades.getProperties("password");
		String puerto = Propiedades.getProperties("puerto");
		datasource = new org.postgresql.jdbc2.optional.PoolingDataSource();
		datasource.setDataSourceName("A Data Source  ");
		datasource.setServerName(ipservidor);
		datasource.setDatabaseName(basedatos);
		datasource.setUser(usuario);
		datasource.setPassword(password);
		datasource.setPortNumber(Integer.parseInt(puerto));
		datasource.setMaxConnections(10);
	}

	/**
	 * En el constructor se establece una conexion a la BD, se hace con un archivo xml definido en el directorio de la aplicacion
	 */
	public beanConnector() {
		// datasource.setDatabaseName(this.dbname);
	}

	public beanConnector(boolean modoTransaccion) {
		try {
			System.out.println("-->Conexion a " + datasource.getServerName() + "|"
					+ datasource.getUser() + "|"
					+ datasource.getPassword() + "|"
					+ datasource.getPortNumber());
			cx = datasource.getConnection();
			cx.setAutoCommit(modoTransaccion);
			query = cx.createStatement();
			query.setFetchDirection(ResultSet.FETCH_UNKNOWN);
		} catch (Exception e) {
			System.out.println("Error en la BD " + e.getMessage());
			e.printStackTrace();
		}
	}

	public static void setDataBase(String name) {
		datasource.setDatabaseName(name);
	}

	/**
	 * Ejecuta consultas en la BD, retorna el resultset de la consulta
	 * 
	 * @param cadena
	 *            que se necesita para ejecutar la consulta
	 * @return el resultset de la consulta
	 */
	public ResultSet executeQuery(String cadena) throws SQLException {
		System.out.println(Fecha.getFecha() + " : " + cadena);
		if (cx != null && !cx.isClosed() && !cx.getAutoCommit()) {
			return query.executeQuery(cadena);// con transacci???n
		} else {
			cx = datasource.getConnection();
			cx.setAutoCommit(true);
			query = cx.createStatement();

			ResultSet res = null;
			try {
				res = query.executeQuery(cadena);
			} catch (SQLException EX) {
				cx.close();
				throw EX;
			}
			cx.close();
			return res;
		}
	}

	/**
	 * Metodo que ejecuta updates en la BD, recibe como parametro la cadena a ejecutar y retorna 0 si no l apudo hacer, 1 si fue exitoso el update
	 * 
	 * @param cadena
	 *            String para ejecutar la consulta
	 * @return el Entero que determina el numero de filas afectadas
	 */
	public int executeUpdate(String cadena) throws SQLException {
		System.out.println(Fecha.getFecha() + " : " + cadena);
		// miro si esta en modo transaccion o no:
		if (cx != null && !cx.isClosed() && !cx.getAutoCommit()) { // si la conexion existe y esta en modo autocommit falso
			// (hace transaccines)
			return query.executeUpdate(cadena);// con transacci???n
		} else {
			// sin transaccion... consulta normal
			cx = datasource.getConnection();
			cx.setAutoCommit(true);
			query = cx.createStatement();
			int r = 0;
			try {
				r = query.executeUpdate(cadena);
			} catch (SQLException ex) {
				ex.printStackTrace();
				cx.close();
				throw ex;
			}
			cx.close();
			return r;
		}
	} // executeUpdate(String cadena)

	/**
	 * M???todo que le da visto bueno a la base de datos para que guarde todos las consultas realizadas en el bloque begin-commit. El begin es realizado en el momento que se crea el beanConnector
	 * 
	 * @return True si no hubo problemas durante el commit. False cuando el objeto de conexi???n tiene habilitado el autocommit.
	 */
	public boolean commit() {
		try {
			cx.commit();
			cx.setAutoCommit(true);
			cx.close();

		} catch (SQLException s) {
			s.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * M???todo que deshace todos los cambios realizados desde el inicio de la transacci???n. La transacci???n da inicio desde la creaci???n del objeto de conexi???n.
	 * 
	 * @return Si el objeto de conexi???n tiene habilitado el autocommit la bd no entender??? el rollback, se lanzar??? un excepci???n y este m???todo retornora false.
	 */
	public boolean rollback() {
		try {
			cx.rollback();
			cx.setAutoCommit(true);
			cx.close();
		} catch (SQLException s) {
			s.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean executeProcedure(String cad) throws SQLException {
		boolean resp = false;
		System.out.println(Fecha.getFecha() + " : " + cad);
		cx = datasource.getConnection();
		CallableStatement cx_cll = cx.prepareCall("{" + cad + "}");
		resp = cx_cll.execute();
		cx.close();
		return resp;
	}

	public boolean testcx() throws SQLException {
		boolean resp = false;
		cx = datasource.getConnection();
		query = cx.createStatement();
		ResultSet rs = query.executeQuery("select count(1) from usuario");
		if (rs.next())
			resp = true;
		cx.close();
		return resp;

	}

	public Connection getCx() throws SQLException {
		return cx == null ? datasource.getConnection() : cx;
	}

	public void setCx(Connection cx) {
		this.cx = cx;
	}

	public ResultSet executeQueryUpdatable(String cadena) throws SQLException {
		System.out.println(Fecha.getFecha() + " : " + cadena);
		if (cx != null && !cx.getAutoCommit()) {
			return query.executeQuery(cadena);// con transacci???n
		} else {
			cx = datasource.getConnection();
			query = cx.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			query.setFetchDirection(ResultSet.FETCH_UNKNOWN);

			ResultSet res = null;
			try {
				res = query.executeQuery(cadena);
			} catch (SQLException EX) {
				cx.close();
				throw EX;
			}
			cx.close();
			return res;
		}
	}

}
