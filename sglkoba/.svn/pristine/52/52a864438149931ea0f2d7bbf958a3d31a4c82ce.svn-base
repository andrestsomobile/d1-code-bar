package util;


import java.sql.SQLException;

import db.GstTabla;
import db.beanConnector;

/********************************************************
*****CLASE GENERADA CON generator V1.0 By pablito*******/

public class gstconfig extends GstTabla implements java.io.Serializable { 


public gstconfig() { 
db= new beanConnector();
this.classEntidad = config.class;
}

public gstconfig(beanConnector db) { 
	this.db= db;
	this.classEntidad = config.class;
	}


 public boolean crearconfig(String cfnombre, String cfvalor) throws SQLException    {
 String insert = "INSERT INTO config (cfnombre,cfvalor) VALUES (" + 
"'" +cfnombre  + "'  ,'" + cfvalor+ "')";
int resp = db.executeUpdate(insert);
  if(resp==0) return false; 
     return true;
  }

public config getconfig(String cfnombre) {
String cad = "SELECT * FROM config WHERE cfnombre  ='" +cfnombre+ "'";
return (config)getEntidad(cad);
}

public boolean updateconfig(
String cfnombre,String cfvalor) throws SQLException   {
  boolean r= false; 
 String cad = " update config set  " + 
" cfnombre ='" + cfnombre + "' ,"+ 
" cfvalor ='" + cfvalor + "' "+ 
 " where cfnombre = '" +cfnombre+ "'";
  int resp= db.executeUpdate(cad);
 if(resp == 0)  r = false; 
     else r = true; 
      return r;     } 

 public boolean eliminarconfig(String cfnombre) throws SQLException {  
String elim = " delete from config where cfnombre=  '" + cfnombre+ "'";
int r = db.executeUpdate(elim) ;
  if(r==0) return false; 
  return true; 
 }
 
 

 
 public static void main(String args[]) {
 	gstconfig g = new gstconfig();
 
 }
 }
