package sap.control;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

import sun.net.ftp.FtpClient;
import sun.net.ftp.FtpClientProvider;
import sun.net.ftp.FtpProtocolException;

import java.util.Locale;
import java.util.ResourceBundle;

public class gstsapftputil {
	
	public gstsapftputil(){
		
	}
	
	public boolean enviarArchivo(String ruta, String codcompania, String contenido){
	
		 boolean resultado = true;
		 
		 //Traer los datos de parametros
		 ResourceBundle archivoPropiedades;
		 archivoPropiedades = ResourceBundle.getBundle("parametrosInterfaces",Locale.getDefault());
	
		 //String server="192.168.0.34";
		 String server	 = archivoPropiedades.getString("ftp_ip");
	     String user	 = archivoPropiedades.getString("ftp_usuario");
	     String password = archivoPropiedades.getString("ftp_password");
	     String path	 = archivoPropiedades.getString("ftp_raiz_recogida");
	     String ftp_codcompania_defecto	= archivoPropiedades.getString("ftp_codcompania_defecto");
	     
	     OutputStream os = null;
	     InputStream fis = null;
	     FtpClient fc    = null;

		 try {
			 
			 fc = FtpClient.create(server);
		     fc.login(user,password.toCharArray());	     
		     
		     if(!ftp_codcompania_defecto.equals(codcompania)){//Es la compania por defecto, no usar subcarpetas
		    	 String carpetaCompania = path+"/codcompania_"+codcompania; //Ej: codcompania_1 = OSTER
		    	 if(!isFtpFileExists(fc,carpetaCompania)){
	        		 fc.makeDirectory(carpetaCompania);
	        		 path = carpetaCompania;
	        	 }
		     }
		     
		     fc.setBinaryType();
		     fc.changeDirectory(path);
		     		     
		     os 	 = null;
			 //FileInputStream fis = null;
			 fis = new ByteArrayInputStream(contenido.getBytes(StandardCharsets.UTF_8));
			//FTP file will be added to the output stream. The output to the FTP
			os = fc.putFileStream(ruta);			
			//Create a buffer		
			byte[] bytes = new byte[1024];
			int c;
			while((c = fis.read(bytes))!=-1){
				os.write(bytes,0,c);
			}
			//System.out.println("upload success!!");
		 } catch (FtpProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resultado = false;
		 } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resultado = false;
		 }finally{
			try {
				if(os!=null)
					os.close();
				if(fis!=null)
					fis.close();
				if(fc!=null)
					fc.close();				 
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
     
		 return resultado;
	     	     
 	}
	
	public static boolean isFtpFileExists(FtpClient ftpClient, String pathName){
		boolean resultado = false;
		
	    String codigo = "";
		try {
			codigo = ftpClient.getStatus(pathName);
		} catch (FtpProtocolException e) {			
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}
		
	    if(!codigo.equals("")){
	    	resultado = true;
	    }
	    return resultado;
	}
	

}
