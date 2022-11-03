package util.file;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ShowFiles extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           
        } finally {
            out.close();
        }
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        doPost(request, response);
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //try {
            //processRequest(request, response);
            //String directorio = "C://TMP/";
            //String directorio = "/home/ricardo/uploads/";
            HttpSession s= request.getSession(true);
	        String directorio= (String)s.getAttribute("ruta_upload");
            
            String evento = request.getParameter("evento");
            String id = request.getParameter("id");

            //if (evento != null && !evento.isEmpty() && id != null && !id.isEmpty()) {
            if (evento != null && id != null) {
                if (evento.equals("ver")) {
                    mostrarDatos(directorio, id, response, request);
                } else if (evento.equals("descargar")) {
                    descargar(directorio, id, response, request);
                } else if (evento.equals("eliminar")) {
                    eliminarArchivo(directorio, id, "", response);
                }
            }

            listaDatos(directorio, response, "diseno.css", request);
       //} catch (FaltaPropiedadException ex) {
            //Logger.getLogger(ShowFiles.class.getName()).log(Level.SEVERE, null, ex);
      //  }
    }

    
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

   
    public void mostrarDatos(String path, String file, HttpServletResponse response, HttpServletRequest request) {
       
        try {
            
            ServletOutputStream out = response.getOutputStream();
            
            InputStream in = new FileInputStream(path + file);
            
            byte[] buffer = new byte[1024];
            
            while (true) {
                int n = in.read(buffer);
                if (n < 0) {
                    break;
                
                }
                out.write(buffer);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    
    public void descargar(String path, String file, HttpServletResponse response, HttpServletRequest request) {
        
        try {
            ServletOutputStream out = response.getOutputStream();
            InputStream in = new FileInputStream(path + file);
            byte[] buffer = new byte[1024];
            while (true) {
                int n = in.read(buffer);
                if (n < 0) {
                    break;
                }
                out.write(buffer);
                response.setContentType("application/x-download");
                response.setHeader("Content-Disposition", "attachment; filename=" + file);

            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    
    public void listaDatos(String path, HttpServletResponse response, String hrefstyle, HttpServletRequest request) 
    {
        try {
            ServletOutputStream out = response.getOutputStream();
            File newDir = null;
            
            newDir = new File(path);
            
            String[] lista = newDir.list();
            int archivos = 1;
            int end = lista.length;
            
            out.println("<HEAD><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"></HEAD><TITLE>Listado de Directorio /</TITLE>");
            out.println("<H1>Listado de Directorio /</H1><HR noShade SIZE=1>");
            out.println("<TABLE cellSpacing=0 cellPadding=5 width=100% align=center><TBODY><TR><TD align=left><FONT size=+1><STRONG>Nombre de Archivo</STRONG>");
            out.println("</FONT></TD><TD align=middle><FONT size=+1><STRONG>Tamano</STRONG></FONT></TD>");
            out.println("<TD align=right><FONT size=+1><STRONG>Descargar</STRONG></FONT></TD>");
            out.println("<TD align=right><FONT size=+1><STRONG>Eliminar</STRONG></FONT></TD>");
            out.println("<TD align=right><FONT size=+1><STRONG>ultima Modificacion</STRONG></FONT></TD></TR>");
            
            for (archivos = 0; archivos < end; archivos++) {
                
                File file = new File(path + lista[archivos]);

                String nombre = lista[archivos];
                Date fecha = new Date(file.lastModified());

                long tamano = file.length();
                if (file.isDirectory()) {
                    out.println("<TR>");
                    out.println("<TD align=left>&nbsp;&nbsp;<a href=?id=" + nombre + "&evento=listar><TT>" + nombre + "</TT></a></TD>");
                    out.println("</TR>");
                } else {
                    out.println("<TR>");
                    out.println("<TD align=left>&nbsp;&nbsp;<a href=?id=" + nombre + "&evento=ver><TT>" + nombre + "</TT></a></TD>");
                    out.println("<TD align=right><TT>" + tamano + " Kb</TT></TD>");
                    out.println("<TD align=right><a href=?id=" + nombre + "&evento=descargar><TT>Descargar</TT></a></TD>");
                    out.println("<TD align=right><a href=?id=" + nombre + "&evento=eliminar><TT>Eliminar</TT></a></TD>");
                    out.println("<TD align=right><TT>" + fecha + "</TT></TD>");
                    out.println("</TR>");
                }
            }
            out.println("</TBODY></TABLE><HR noShade SIZE=1><H3>Underserver / FileSystem 1.1");

        } catch (Exception error) {
            System.out.println(error);
        }
    }

    public void eliminarArchivo(String path, String file, String hrefstyle, HttpServletResponse response) {
        try {
            ServletOutputStream out = response.getOutputStream();
            out.println("<head><link rel=stylesheet href=" + hrefstyle + "></head>");
            File archivo = new File(path + file);
            archivo.delete();

        } catch (Exception err) {
            System.out.println(err);
        }
    }
    
	public File[] getListaArchivosGenerados(String ruta) {
		File f = new File(ruta);
		return f.listFiles();
	}
}
