package sap.control;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Locale;
import java.util.ResourceBundle;

import org.apache.commons.io.IOUtils;

import sun.net.ftp.FtpClient;
import sun.net.ftp.FtpDirEntry;
import sun.net.ftp.FtpProtocolException;
import util.Fecha;

public class gstsaprevisarftp{

	public gstsaprevisarftp() {		
		
	}
	
	public boolean esValidoToken(String token){
		boolean resultado = false;
		
		ResourceBundle archivoPropiedades;
		archivoPropiedades = ResourceBundle.getBundle("parametrosInterfaces",Locale.getDefault());
		
		String tokenValido	 = archivoPropiedades.getString("revisar_ftp_token");
		if(tokenValido.equals(token)){
			resultado = true;
		}
		
		return resultado;
	}
	
	public void revisarArchivosFtp(){
		
		ResourceBundle archivoPropiedades;
		archivoPropiedades = ResourceBundle.getBundle("parametrosInterfaces",Locale.getDefault());
			
		String server	                = archivoPropiedades.getString("ftp_ip");
	    String user	 	                = archivoPropiedades.getString("ftp_usuario");
	    String password                 = archivoPropiedades.getString("ftp_password");
	    String path	 	                = archivoPropiedades.getString("ftp_raiz_deposito");
	    String extension                = archivoPropiedades.getString("ftp_edi_extension");
	    String ftp_codcompania_defecto	= archivoPropiedades.getString("ftp_codcompania_defecto");
	    
	    gstsap controlsap = new gstsap();
	    
	    OutputStream os = null;
	    InputStream fis = null;
	    FtpClient fc    = null;

		 try {
			 fc = FtpClient.create(server);
		     fc.login(user,password.toCharArray());	     
		     
		     fc.setBinaryType();
		     fc.changeDirectory(path);
		     		     
		     os = null;
		     
		     //Una vez para la raiz para la ocmpania por defecto
		     verificarCarpetaCompania(fc,path,ftp_codcompania_defecto,extension,controlsap);
		     
		     //busco las demas companias
		     Iterator<FtpDirEntry> dir = fc.listFiles(path);
		     while (dir.hasNext()) {
		         FtpDirEntry f = dir.next();
		         String nombre = f.getName();
		         
		         String codcompania = "";
		         //Ej: codcompania_1		         		         
		         if(nombre.startsWith("codcompania")){
		        	 String[] lineas = nombre.split("_");
			         if(lineas.length >= 2){
			        	 codcompania = lineas[1];
			        	 String rutaCompania = path+"/"+nombre;
			        	 verificarCarpetaCompania(fc,rutaCompania,codcompania,extension,controlsap);
			         }
		         }
		     }
		 
		 } catch (FtpProtocolException e) {		
			e.printStackTrace();			
		 } catch (IOException e) {		
			e.printStackTrace();			
		 }finally{
			try {
				if(os!=null)
					os.close();
				if(fis!=null)
					fis.close();
				if(fc!=null)
					fc.close();				 
			} catch (IOException e) {				
				e.printStackTrace();
			}
		 }
	
	}
	
	private void verificarCarpetaCompania( FtpClient fc, String path, String codcompania, String extension,  gstsap controlsap ){
		try{
			Iterator<FtpDirEntry> dir = fc.listFiles(path);
		    
		     
		     
		     //Ej: codcompania_1_OSTER		     
		     
		     
		     while (dir.hasNext()) {
		         FtpDirEntry f = dir.next();
		         String nombre = f.getName();
		         
		         if(nombre.endsWith(extension)){
		        	 		        	 		        	 		        			        	 
		        	 String remoteFile1  = path+"/"+nombre;
		        	 InputStream archivo = fc.getFileStream(remoteFile1);
		        	 String contenido    = IOUtils.toString(archivo);		        	 
		        	 archivo.close();
		        	 
		        	 ArrayList<String[]> contenidoParseado =  controlsap.parsearStringInterface(contenido);
		        	 
		        	 String tipoArchivo = "";
		        	 String idDocumento = "";
		        	 
		        	 for(String[] campos : contenidoParseado){			 
		    			 if(campos.length >= 3){
		    				 String codigoFila = campos[0];				 
		    				 if(codigoFila.equals("ST")){
		    					 tipoArchivo = campos[1];
		    					 idDocumento = campos[2];		    					 
		    				 }				 
		    			 }			 				
		    		 }
		        	 
		        	 if(tipoArchivo.equals("940")){
		        		gstsapinterface940 gstsapinterface940 = new gstsapinterface940();	
		        		 		        					
	       			//gstsapinterface940.setSession(session);
		        		gstsapinterface940.setRutaArchivo(nombre);
		        		gstsapinterface940.setContenidoArchivo(contenido);
		        					
		        		gstsapresultadoimportacion resultadoImportacion = gstsapinterface940.importarInformacion(contenidoParseado, codcompania);
		        		
		        		String fecha = Fecha.getFechaYYYYMMDD();
			        	String ano   = fecha.substring(0,4);
		        		if(resultadoImportacion.isSuccess()){
		        			 /*Creacion de directorios de migracion*/				        	 				        	 
				        	 String carpetaProcesados = path+"/Procesados";
				        	 String carpetaAno 		  = path+"/Procesados/"+ano;
				        	 String carpetaDia 		  = path+"/Procesados/"+ano+"/"+fecha;
				        	 String archivoNuevo      = path+"/Procesados/"+ano+"/"+fecha+"/"+nombre;
				        	 
				        	 if(!isFtpFileExists(fc,carpetaProcesados)){
				        		 fc.makeDirectory(carpetaProcesados); 
				        	 }
				        	 
				        	 if(!isFtpFileExists(fc,carpetaAno)){
				        		 fc.makeDirectory(carpetaAno);
				        	 }
				        	 
				        	 if(!isFtpFileExists(fc,carpetaDia)){
				        		 fc.makeDirectory(carpetaDia);
				        	 }
				        	 		        	 		        	 
				        	 fc.rename(remoteFile1, archivoNuevo);
		        		}else{
		        			 /*Creacion de directorios de migracion*/				        	 				        	 
				        	 String carpetaProcesados = path+"/Errores";				        	 
				        	 String archivoNuevo      = path+"/Errores/"+nombre;
				        	 
				        	 if(!isFtpFileExists(fc,carpetaProcesados)){
				        		 fc.makeDirectory(carpetaProcesados); 
				        	 }
				        	 				        	 				        	 		        	 		        	
				        	 fc.rename(remoteFile1, archivoNuevo);
		        		}
		        			
		        	 }		        	 
		        	 //----------------------------------------------------------------------		        	 
		         }		         		         		        
		     }			
		} catch (FtpProtocolException e) {		
			e.printStackTrace();			
		} catch (IOException e) {		
			e.printStackTrace();			
		}
		
	} 
	
	
	
	public static boolean isFtpFileExists(FtpClient ftpClient, String pathName)
	{
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
