package ingreso.action;

import ingreso.control.gstentrada;
import ingreso.control.gstingreso;
import ingreso.entity.entrada;
import ingreso.entity.ingreso;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import maestro.control.gstproducto;
import maestro.entity.producto;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import util.Fecha;

public final class subirDespieceAction extends Action {

        
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String destino = "subirDespiece";
        String ruta_llego = request.getParameter("ruta");
        //System.out.println("=====>request.ruta " + ruta_llego);
        HttpSession se = request.getSession(true);
        String ruta = (String) se.getAttribute("ruta_upload");
        if (ruta == null) {
            ruta = "/home/ricardo/uploads/";
        }
        String ruta_error = ruta + File.separator + "erroresKAJDE";
        ruta = ruta + obtieneNombreArchivo(ruta_llego);
        String mensaje = "";
        //System.out.println("=====>va a cargar el archivo");
        try {
            cargarArchivo(ruta, ruta_error);
            mensaje = "Proceso Automatico Terminado... Para detalle sobre Observaciones Verifique Bloc de Errores";
        } catch (java.io.IOException ioex) {
            System.out.println("se presento el error: " + ioex.toString());
        }
        ActionMessages e = getErrors(request);
        e.add("general", new ActionMessage(mensaje, false));
        addErrors(request, e);
        return mapping.findForward(destino);
    }

    private void cargarArchivo(String ruta, String ruta_error) throws IOException {
        //System.out.println("=====>inicio con " + ruta);
        String mensaje = "";
        String observaciones = "";
        String fechahora = Fecha.getFecha();
        String despiecenosub = "<br>LISTADO DE DESPIECES NO SUBIDOS<br>" + "\n" + "\n";
        String refnosub = "\n" + "<br>LISTADO DE REFERENCIAS <br>" + "\n";

        try {
            String texto = "";
            String contenedor[];
            int comas = 0;
            FileReader fr = new FileReader(ruta);
            System.out.println("=====>abro archivo " + ruta);
            BufferedReader entrada = new BufferedReader(fr);
            String s;
            gstingreso ging = new gstingreso();
            gstproducto gprod = new gstproducto();
            gstentrada gent = new gstentrada();
            boolean resp = true;
            try {
                while ((s = entrada.readLine()) != null) {
                    if (s != "\n") {
                        texto += s + "  \n";
                        contenedor = s.split(";");
                        if ((contenedor.length >= 1) && (contenedor.length < 3)) {
                            despiecenosub += "<br>El despiece con datos " + contenedor[0] + " presenta inconsistencias revise espacios en blanco\n";
                        }
                        if (contenedor.length >= 3) {
                            String ingcodcia = "1";
                            String ingfecha = Fecha.getFecha();
                            String ingtipo = "DESPIECE";
                            String ingtrafico = null;
                            String ingobservacion = "KA " + contenedor[0];
                            String ingestado = "TRAMITE";
                            String ingcausal = null;
                            String ingclidevolucion = null;
                            String ingciudad_dev = null;
                            String ingconsec = "0";
                            String ingconseczfp = "0";
                            String ingplanilla = null;
                            String ingpesoneto = "0";
                            String ingpesobruto = "0";
                            String ingfob = "0";
                            String ingcantidad = "0";
                            int valorcant;
                            // si el ka no existe se crea, si existe y esta en tramite se agrega solo la entrada
                            ingreso ing = ging.getingresoByKA(ingcodcia, ingobservacion);
                            if (ing == null) {
                                try {
                                    resp &= ging.crearingreso(ingcodcia, ingfecha, ingtipo, ingtrafico, ingobservacion, ingestado, ingcausal, ingclidevolucion, ingpesoneto, ingpesobruto, ingfob,
                                            ingcantidad, ingciudad_dev, ingconsec, ingconseczfp, ingplanilla);
                                } catch (SQLException e) {
                                    despiecenosub += "<br>\nEl despiece " + ingobservacion + " no se pudo crear.";
                                }
                            } else {
                                despiecenosub += "<br>\nEl despiece " + ingobservacion + " ya existe.";
                            }
                            ing = ging.getingresoByKA(ingcodcia, ingobservacion);
                            if (ing != null && ing.getIngestado().equals("TRAMITE")) {
                                try {
                                    String referencia = contenedor[1];
                                    producto pro = gprod.getproductoByUk(ingcodcia, referencia);
                                    if (pro == null) { // la referencia no existe
                                        refnosub += "<br>El despiece " + ingobservacion + " Modelo " + referencia + " no existe" + "\n";
                                    } else {
                                        String entcodingreso = ing.getingcodsx();
                                        String entcodproducto = pro.getprocodsx();
                                        String entbodega = "6"; // bodega A2C
                                        String entposicion = "43I";
                                        entrada ent = gent.getentrada(entcodingreso, entcodproducto, entbodega, entposicion);
                                        if (ent != null) {
                                            refnosub += "<br>El despiece " + ingobservacion + " Modelo " + referencia + " ya existe entrada en " + entbodega + "-" + entposicion + "\n";
                                        } else {
                                            String entcantidad = contenedor[2];
                                            try {
                                                valorcant = Integer.parseInt(entcantidad);
                                                if (valorcant > 0) { // validar cantidad negativa
                                                    try {
                                                    String entpesoneto = pro.getprokiloreal();
                                                    entpesoneto = entpesoneto != null ? entpesoneto : "0";
                                                    String entpesonetototal = (Float.parseFloat(entpesoneto) * Float.parseFloat(entcantidad)) + "";
                                                    //Se coloca prokilo real en lugar de propesobmp, pues este es el peso del masterpack
                                                    String entpesobruto = pro.getprokiloreal(); //pro.getpropesobmp();
                                                    entpesobruto = entpesobruto != null ? entpesobruto : "0";
                                                    String entpesobrutototal = (Float.parseFloat(entpesobruto) * Float.parseFloat(entcantidad)) + "";
                                                    String entsaldopesoneto = "0";
                                                    String entsaldopesobruto = "0";
                                                    String entsaldonac = "0";
                                                    String entsaldosinnac = "0";
                                                    String entvalor = "0";
                                                    String entvalortotal = "0";
                                                    String entsaldonacf = "0";
                                                    String entsaldosinnacf = "0";
                                                    String entunidad = "U";
                                                    String entlote = "";
                                                    gent.crearentrada(entcodingreso, entcodproducto, entbodega, entposicion, entcantidad, entpesoneto, entpesonetototal, entpesobruto,
                                                            entpesobrutototal, entsaldopesoneto, entsaldopesobruto, entsaldonac, entsaldosinnac, entvalor, entvalortotal, entsaldonacf,
                                                            entsaldosinnacf, entunidad, entlote);
                                                    } catch (Exception e) {
                                                    	e.printStackTrace();
                                                        refnosub += "<br>El despiece " + ingobservacion + " Modelo " + referencia + " no se pudo crear" + "\n";
                                                    }
                                                } else {
                                                    refnosub += "<br>El despiece " + ingobservacion + " Modelo " + referencia + " tiene cantidad negativa" + "\n";
                                                }
                                            } catch (Exception e) {
                                                refnosub += "<br>El despiece " + ingobservacion + " Modelo " + referencia + " no tiene cantidad valida" + e.getMessage() + "\n";
                                            }
                                                
                                            
                                        }
                                    }
                                } catch (Exception e) { // (SQLException e) {
                                    e.printStackTrace();
                                    despiecenosub += "<br>\nEl despiece " + ingobservacion + " No se pudo crear el despiece";
                                }
                            } else {
                                despiecenosub += "<br>\nEl despiece " + ingobservacion + " se encuentra en estado FINALIZADO<br>";
                            }
                            comas++;
                        }
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (java.io.FileNotFoundException fnfex) {
            observaciones += "<br>\nNo se encontro el archivo";
        }
        try {
            FileWriter fw = new FileWriter(ruta_error + getFechaNombreArchivo() + ".txt");
            BufferedWriter bw = new BufferedWriter(fw);
            PrintWriter salida = new PrintWriter(bw);
            salida.println("BLOC DE ERRORES JDE-SGL " + "FECHA : " + fechahora + "\n<br>" + "<br>OBSERVACIONES :<br>" + "\n" + observaciones + "\n<br>" + "\n<br>" + despiecenosub + "\n<br>"
                    + refnosub);
            salida.close();
            mensaje = "Proceso Automatico Terminado... Para detalle sobre Observaciones Verifique Bloc de Errores";
        } catch (java.io.IOException ioex) {
            System.out.println("se presento el error: " + ioex.toString());
        }
    }

    public String getFechaNombreArchivo() {
        DecimalFormat df = new DecimalFormat("00");
        Calendar x = Calendar.getInstance();
        int anno = x.get(Calendar.YEAR);
        int mes = x.get(Calendar.MONTH)+1;
        int dia = x.get(Calendar.DATE);
        int hora = x.get(Calendar.HOUR_OF_DAY);
        int min = x.get(Calendar.MINUTE);
        int seg = x.get(Calendar.SECOND);
        return  df.format(anno) + df.format(mes) + df.format(dia) + "_" + df.format(hora) + df.format(min) + df.format(seg);
    }
    
    private static String obtieneNombreArchivo(String ruta ){
        //System.out.println("=====>ruta " + ruta);
        String fileName = null;
        int pos = ruta.lastIndexOf("\\");
        //System.out.println("=====>pos " + pos);
        File f= new File(ruta);
        String dir = f.getPath();
        //System.out.println("=====>getName " + f.getName());
        fileName = ruta.substring(pos+1);  
        //System.out.println("=====>fileName " + fileName);
        return fileName;
    }
    public static void main(String[] args) {
        String error = "c:\\sli\\error";
        String archivo = "c:\\sli\\despiece.txt";
        String servidor = "localhost";
        String bd = "sgl";
        //obtieneNombreArchivo("D:\\SLI\\Interface Ingresos Despiece\\KA01DDMMYY.txt");
        
        try {
            if (args.length == 4) {
                servidor = args[0];
                bd = args[1];
                archivo = args[2];
                error = args[3];
                db.beanConnector.datasource = null;
                db.beanConnector.datasource = new org.postgresql.jdbc2.optional.PoolingDataSource();
                db.beanConnector.datasource.setServerName(servidor);
                db.beanConnector.datasource.setDatabaseName(bd);
                db.beanConnector.datasource.setUser("usersgl");
                db.beanConnector.datasource.setPassword("sgl");
                db.beanConnector.datasource.setPortNumber(5432);
                db.beanConnector.datasource.setMaxConnections(10);
                new subirDespieceAction().cargarArchivo(archivo, error);
            } else {
                System.out.println("USE: java -jar subirdespiece.jar servidor bd archivodatos archivoerrores");
                System.out.println("Ej: java -jar subirdespiece.jar localhost sgl c:\\sli\\KA01DDMMYY.txt c:\\sli\\errordespiece");
                db.beanConnector.datasource = null;
                db.beanConnector.datasource = new org.postgresql.jdbc2.optional.PoolingDataSource();
                db.beanConnector.datasource.setServerName(servidor);
                db.beanConnector.datasource.setDatabaseName(bd);
                db.beanConnector.datasource.setUser("usersgl");
                db.beanConnector.datasource.setPassword("sgl");
                db.beanConnector.datasource.setPortNumber(5432);
                db.beanConnector.datasource.setMaxConnections(10);
                new subirDespieceAction().cargarArchivo(archivo, error);
            }

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
