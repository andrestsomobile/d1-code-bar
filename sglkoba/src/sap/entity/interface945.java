package sap.entity;

public class interface945 implements java.io.Serializable  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String  intcodsx;	
	private String  usucodsx;    
	private String  usulogin;
	private String  intfecha;
	private String  intfilecode;
	private String  intfilename;
	private String  pedcodsx;
	
	public interface945(String intcodsx, String usucodsx, String usulogin, String intfecha, String intfilecode,
			String intfilename, String pedcodsx) {
		super();
		this.intcodsx = intcodsx;
		this.usucodsx = usucodsx;
		this.usulogin = usulogin;
		this.intfecha = intfecha;
		this.intfilecode = intfilecode;
		this.intfilename = intfilename;
		this.setPedcodsx(pedcodsx);
	}
	
	public interface945(String intcodsx, String usucodsx, String usulogin, String intfecha, String intfilecode,
			String intfilename, String pedcodsx, String intcontenidoarchivo) {
		super();
		this.intcodsx 	 = intcodsx;
		this.usucodsx	 = usucodsx;
		this.usulogin 	 = usulogin;
		this.intfecha 	 = intfecha;
		this.intfilecode = intfilecode;
		this.intfilename = intfilename;
		this.setPedcodsx(pedcodsx);
		//this.intcontenidoarchivo = intcontenidoarchivo;
	}
	
	public String getIntcodsx() {
		return intcodsx;
	}
	public void setIntcodsx(String intcodsx) {
		this.intcodsx = intcodsx;
	}
	public String getUsucodsx() {
		return usucodsx;
	}
	public void setUsucodsx(String usucodsx) {
		this.usucodsx = usucodsx;
	}
	public String getUsulogin() {
		return usulogin;
	}
	public void setUsulogin(String usulogin) {
		this.usulogin = usulogin;
	}
	public String getIntfecha() {
		return intfecha;
	}
	public void setIntfecha(String intfecha) {
		this.intfecha = intfecha;
	}
	public String getIntfilecode() {
		return intfilecode;
	}
	public void setIntfilecode(String intfilecode) {
		this.intfilecode = intfilecode;
	}
	public String getIntfilename() {
		return intfilename;
	}
	public void setIntfilename(String intfilename) {
		this.intfilename = intfilename;
	}

	public String getPedcodsx() {
		return pedcodsx;
	}

	public void setPedcodsx(String pedcodsx) {
		this.pedcodsx = pedcodsx;
	}
	
		
}
