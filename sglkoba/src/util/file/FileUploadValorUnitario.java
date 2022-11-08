package util.file;
/*
 * uploadFichero.java
 *
 * Created on 4 de agosto de 2003, 22:26
 */
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 *
 * @author  Roberto Canales
 * @version
 */
public class FileUploadValorUnitario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet</title>");
        out.println("</head>");
        out.println("<body>");

        System.out.println("Comenzamos procesamiento ficheros");
        


        procesaFicheros(request,out);

        out.println("</body>");
        out.println("</html>");

        out.close();
    }


    void depura(String cadena)
    {
        System.out.println("El error es " + cadena);
    }

    public boolean procesaFicheros(HttpServletRequest request, PrintWriter out ) {
        try {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            if(isMultipart){
            // Create a factory for disk-based file items
                FileItemFactory factory = new DiskFileItemFactory();
                
            

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
            
         // Parse the request
            List items = upload.parseRequest(request);
            
            

            // maximo numero de bytes
          //  fu.setSizeMax(1024*512); // 512 K

            depura("Ponemos el tamaño máximo");
            // tamaño por encima del cual los ficheros son escritos directamente en disco
        //    fu.setSizeThreshold(4096);

            // directorio en el que se escribirán los ficheros con tamaño superior al soportado en memoria
        //    fu.setRepositoryPath("/tmp");

            // ordenamos procesar los ficheros
        //    List fileItems = fu.parseRequest(req);

            if(items == null)
            {
                depura("La lista es nula");
                return false;
            }

            out.print("<br>El número de ficheros subidos es: " +  items.size());

            // Iteramos por cada fichero

	    Iterator i = items.iterator();
            FileItem actual = null;
            depura("estamos en la iteración");

            while (i.hasNext())
            {
                actual = (FileItem)i.next();
                String fileName = actual.getName();
                out.println("<br>Nos han subido el fichero: " + fileName);

                // construimos un objeto file para recuperar el trayecto completo
                File fichero = new File(fileName);
                depura("El nombre del fichero es " + fichero.getName());

                // nos quedamos solo con el nombre y descartamos el path
		        //String directorio = "C://TMP/";
		        //String directorio = "/home/ricardo/uploads/";
		        HttpSession s= request.getSession(true);
		        String directorio= (String)s.getAttribute("ruta_upload");
		        
                fichero = new  File(directorio + fichero.getName());

                // escribimos el fichero colgando del nuevo path
                actual.write(fichero);
            }

        }
        
            }
        
        catch(Exception e) {
            depura("Error de Aplicación " + e.getMessage());
            return false;
        } 

        return true;
    }
    
   


    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
}