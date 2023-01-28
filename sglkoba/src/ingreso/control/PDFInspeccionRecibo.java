package ingreso.control;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;

import javax.imageio.ImageIO;

import com.itextpdf.text.pdf.PdfImage;
import com.itextpdf.text.pdf.parser.PdfImageObject;
import com.lowagie.text.BadElementException;
import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Image;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfImportedPage;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfReader;
import com.lowagie.text.pdf.PdfWriter;

import administracion.entity.empresa;
import ingreso.entity.contenedor_trafico;
import ingreso.entity.inspeccion_recibo;
import ingreso.entity.lote_contenedor_trafico;
import ingreso.entity.lote_trafico;
import ingreso.entity.trafico;
import maestro.control.gstcompania;
import maestro.control.gstproducto;
import maestro.control.gsttransportadora;
import maestro.entity.producto;
import util.Fecha;




public class PDFInspeccionRecibo {
	

	private Font fuenteBold_12 = new Font(Font.HELVETICA, 11, Font.BOLD, Color.BLACK);
	private Font fuenteNormal_12 = new Font(Font.HELVETICA, 11, Font.NORMAL, Color.BLACK);
	private Font fuenteNormal_10 = new Font(Font.HELVETICA, 9, Font.NORMAL, Color.BLACK);
	private Font fuenteBold_10 = new Font(Font.HELVETICA, 9, Font.BOLD, Color.BLACK);

	gsttrafico gtraf = new gsttrafico();
	gstcontenedor_trafico gcont = new gstcontenedor_trafico();
	gstlote_trafico glt = new gstlote_trafico();
	gstlote_contenedor_trafico glct = new gstlote_contenedor_trafico();


	gstcompania gcomp = new maestro.control.gstcompania();
	gsttransportadora gtransp = new maestro.control.gsttransportadora();
	gstproducto gprod = new maestro.control.gstproducto();
	gstinspeccion_recibo ginre = new gstinspeccion_recibo();
	
	public PDFInspeccionRecibo() {
	}
	
	public static void main(String[] arg) {
		PDFInspeccionRecibo pdf = new PDFInspeccionRecibo();
		Object res = pdf.pdf("3686", "C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps/sglkobad1\\pdf\\TRAFICO\\3686", "", "", "9413");
		System.out.print(res);
	}
	
	
	public HashMap<String, String> pdf(String lctrafcodsx, String rutaarchivo, String codusu, String rutaContexto, 
			String inrecontenedor) {
		
		Document documento = new Document();
	
		String nomarch = rutaarchivo + File.separator + "InspeccionRecibo_" + lctrafcodsx + "_" + inrecontenedor  + ".pdf";
		File f = new File(nomarch);
		f.delete();
		PdfWriter pw = null;
		HashMap<String, String> map = null;
		try {
			FileOutputStream fout = new FileOutputStream(nomarch);
			pw = PdfWriter.getInstance(documento, fout);
			
			documento.open();
			documento.add(new Chunk(""));
			map = agregarContenido(documento, lctrafcodsx, codusu, rutaarchivo, rutaContexto, inrecontenedor);
			
		} catch (DocumentException de) {
			System.err.println(de.getMessage());
			de.printStackTrace();
			System.out.print(de.getMessage());
			return null;
		} catch (IOException ioe) {
			System.err.println(ioe.getMessage());
			ioe.printStackTrace();
			System.out.print(ioe.getMessage());
			return null;
		} finally {
			//pw.close();
			documento.close();
		}
		
		return map;
	}
	

	private void agregarLineasEnBlanco(Paragraph parrafo, int nLineas) {
		for (int i = 0; i < nLineas; i++)
			parrafo.add(new Paragraph(" "));
	}
	
	private HashMap<String, String> agregarContenido(Document documento, String lctrafcodsx, 
			String codusu, String rutaarchivo, String rutaContexto, String contenedor)
			throws DocumentException {
		lote_contenedor_trafico lct = glct.getlote_contenedor_trafico(lctrafcodsx);
		HashMap<String, String> map = new HashMap<String, String>();
		String table = "";
		contenedor_trafico ct = gcont.getcontenedor_trafico(lct.getlctrafcontenedor());
		trafico traf = gtraf.gettrafico(ct.getctrafnumtrafico());
		
		

		Paragraph ParrafoHoja = new Paragraph();
		PdfPCell cell = new PdfPCell();

		// Agregamos una linea en blanco
		agregarLineasEnBlanco(ParrafoHoja, 1);

		// Encabezado
		PdfPTable tabla = new PdfPTable(7); // Numero de columnas
		tabla.setWidthPercentage(100); // Porcentaje de la pagina que ocupa
		tabla.setHorizontalAlignment(Element.ALIGN_JUSTIFIED_ALL);// Alineacion horizontal
		
		addTableValue("INSPECCION DE RECIBO", fuenteBold_12, tabla, 2);
		
		addTableValue("Pagina " + (documento.getPageNumber()+1) + " de "+1, fuenteBold_10, tabla, 3);
		 
		addTableValue("Versión: 001-2019", fuenteNormal_10, tabla, 2);
		
		//TODO: Revisar forma de rowspan con inspaccion recibo
		addTableValue("", fuenteNormal_10, tabla, 2);
		
		//TODO: Revisar forma de rowspan con pagina
		addTableValue("", fuenteNormal_10, tabla, 3);
		
		addTableValue("Fecha de emisiòn:", fuenteNormal_10, tabla, 2);
		
		//TODO: Revisar forma de rowspan con inspaccion recibo
		addTableValue("", fuenteNormal_10, tabla, 2);
		
		//TODO: Revisar forma de rowspan con pagina
		addTableValue("", fuenteNormal_10, tabla, 3);
		
		Date d = new Date();
		Locale esLocale = new Locale("es", "ES");//para trabajar en español
		SimpleDateFormat sd = new SimpleDateFormat("d 'de' MMMM 'de' yyyy", esLocale);
		String fechaEmision = sd.format(d);
		
		addTableValue(fechaEmision, fuenteNormal_10, tabla, 2);
		
		addTableValue("Elaborado por:", fuenteNormal_10, tabla, 2);
		
		addTableValue("Revisasdo por:", fuenteNormal_10, tabla, 3);
		
		addTableValue("Aprobado por:", fuenteNormal_10, tabla, 2);
		
		addTableValue("Roberto Tibaquicha", fuenteNormal_10, tabla, 2);
		
		addTableValue("Milena Mendez", fuenteNormal_10, tabla, 3);
		
		addTableValue("Johanna Guzmàn", fuenteNormal_10, tabla, 2);
		
		addTableValue("Jefe de Bodega Importados", fuenteNormal_10, tabla, 2);
		
		addTableValue("Coordinador Logìstico de Importados", fuenteNormal_10, tabla, 3);
		
		addTableValue("Gerente Importados", fuenteNormal_10, tabla, 2);
		
		addTableValue("FECHA DE RECIBO:", fuenteBold_12, tabla, 2);
		
		addTableValue(Fecha.getFechaSinHora(), fuenteBold_12, tabla, 5);
		
		addTableValue("NUMERO DE CONTENEDOR:", fuenteBold_12, tabla, 2);
		
		addTableValue(ct.getctrafnumero(), fuenteBold_12, tabla, 5);
		
		addTableValue("NUMERO DE IMPORTACIÒN:", fuenteBold_12, tabla, 2);
		
		addTableValue(traf.gettrafnumdta(), fuenteBold_12, tabla, 5);
		
		addTableValue("TRANSPORTADORA:", fuenteBold_12, tabla, 2);
		String transportadora = traf.gettraftransportadora() != null ? gtransp.gettransportadora(traf.gettraftransportadora()).gettranspnombre(): "";
		addTableValue(transportadora, fuenteBold_12, tabla, 5);
		
		addTableValue("NUMERO DE ORDEN DE RECIBO:", fuenteBold_12, tabla, 2);
		
		//TODO: De donde se saca este valor
		String precinto = "";
		String orden = "";
		addTableValue(orden, fuenteBold_12, tabla, 5);
		
		addTableValue("PLACA", fuenteBold_10, tabla, 1);
		
		addTableValue("PRODUCTO", fuenteBold_10, tabla, 1);
		
		addTableValue("LOTE", fuenteBold_10, tabla, 1);
		
		addTableValue("FECHA DE VENCIMIENTO", fuenteBold_10, tabla, 1);
		
		addTableValue("CANTIDAD", fuenteBold_10, tabla, 1);
		
		addTableValue("ESTIBAS", fuenteBold_10, tabla, 1);
		
		addTableValue("OBSERVACIONES", fuenteBold_10, tabla, 1);
		
		Collection listInre = ginre.getInspeccionByContenedor(traf.gettrafcodsx(), contenedor);
		
		String productos = "";
		String asunto = traf.gettrafnumdta() + " ";
		inspeccion_recibo inre = new inspeccion_recibo();
		for(Object obj: listInre) {
			productos += "<tr>";
			inre = (inspeccion_recibo) obj;
			producto pro = gprod.getproducto(inre.getInreproducto());
			
			String placa = ct.getctrafplaca();
			String producto = pro.getprodescripcion();
			String lote = inre.getInrelote();
			String fechaVencimiento = inre.getInrevencimiento();
			String cantidad = inre.getInrecajas();
			String estibas = inre.getInreestibas();
			String observacion = inre.getInreobservaciones();
			
			asunto += producto + " ";
			productos += "<td>"+placa+"</td>";
			productos += "<td>"+producto+"</td>";
			productos += "<td>"+lote+"</td>";
			productos += "<td>"+fechaVencimiento+"</td>";
			productos += "<td>"+cantidad+"</td>";
			productos += "<td>"+estibas+"</td>";
			productos += "<td>"+observacion+"</td>";
			//TODO: de donde se obtiene
			addTableValue(placa, fuenteNormal_10, tabla, 1);
			
			addTableValue(producto, fuenteNormal_10, tabla, 1);
			
			addTableValue(lote, fuenteNormal_10, tabla, 1);
			
			addTableValue(fechaVencimiento, fuenteNormal_10, tabla, 1);
			
			addTableValue(cantidad, fuenteNormal_10, tabla, 1);
			
			addTableValue(estibas, fuenteNormal_10, tabla, 1);
			
			addTableValue(observacion, fuenteNormal_10, tabla, 1);
			
			productos += "</tr>";
		}
		
		table = getTableEmailBody(fechaEmision, Fecha.getFechaSinHora(), ct.getctrafnumero(), traf.gettrafnumdta(), precinto, transportadora, orden, productos);
		map.put("table", table);
		map.put("asunto", asunto);
		documento.add(tabla);//fuenteNormal_10
		
//Firmas
		
	    tabla = new PdfPTable(7); // Numero de columnas
		tabla.setWidthPercentage(100); // Porcentaje de la pagina que ocupa
		tabla.setHorizontalAlignment(Element.ALIGN_CENTER);// Alineacion horizontal
		
		cell = celdaDato(inre.getInrerecibido()!= null ? inre.getInrerecibido() : "", fuenteNormal_10, Element.ALIGN_LEFT);
		cell.setColspan(3);
		cell.setBorder(Rectangle.NO_BORDER);
		tabla.addCell(cell);
		
		cell = new PdfPCell();
		cell.setColspan(1);
		cell.setBorder(Rectangle.NO_BORDER);
		cell.addElement(new Paragraph(""));
		tabla.addCell(cell);

		cell = celdaDato(inre.getInreconductor()!= null ? inre.getInreconductor() : "", fuenteNormal_10, Element.ALIGN_LEFT);
		cell.setColspan(3);
		cell.setBorder(Rectangle.NO_BORDER);
		tabla.addCell(cell);
		
		
		
		
		Image imgFirma = null;
		try {
			String ruta = rutaContexto + File.separator + "pdf" + 
					File.separator + "FIRMARECIBIDO" + File.separator + 
					lct.getlctrafcontenedor();
					
					File f = new File(ruta);
					 File[] file =f.listFiles();
					 for (File uploadFiles : file) {
							String ruta_arch = ruta + File.separator+ uploadFiles.getName();
							imgFirma = Image.getInstance(ruta_arch);
							imgFirma.scaleAbsolute(150,70);
							
						}
			cell = new PdfPCell(imgFirma,false);
			cell.setColspan(3);
			cell.setBorder(Rectangle.NO_BORDER);
			tabla.addCell(cell);
		} catch (Exception e) {
			cell = new PdfPCell();
			cell.setColspan(3);
			cell.setBorder(Rectangle.NO_BORDER);
			cell.addElement(new Paragraph(""));
			tabla.addCell(cell);
        }
		
		cell = new PdfPCell();
		cell.setColspan(1);
		cell.setBorder(Rectangle.NO_BORDER);
		cell.addElement(new Paragraph(""));
		tabla.addCell(cell);
		
		try {
			String ruta = rutaContexto + File.separator + "pdf" + 
					File.separator + "FIRMACONDUCTOR" + File.separator + 
					lct.getlctrafcontenedor();
					
					File f = new File(ruta);
					 File[] file =f.listFiles();
					 for (File uploadFiles : file) {
							String ruta_arch = ruta + File.separator+ uploadFiles.getName();
							imgFirma = Image.getInstance(ruta_arch);
							imgFirma.scaleAbsolute(150,70);
							
						}
			cell = new PdfPCell(imgFirma,false);
			cell.setColspan(3);
			cell.setBorder(Rectangle.NO_BORDER);
			tabla.addCell(cell);
		} catch (Exception e) {
			cell = new PdfPCell();
			cell.setColspan(3);
			cell.setBorder(Rectangle.NO_BORDER);
			cell.addElement(new Paragraph(""));
			tabla.addCell(cell);
        }
		
		cell = new PdfPCell();
		cell.setColspan(3);
		cell.setBorder(Rectangle.NO_BORDER);
		cell.addElement(new Paragraph("_____________________________"));
		tabla.addCell(cell);
		
		cell = new PdfPCell();
		cell.setColspan(1);
		cell.setBorder(Rectangle.NO_BORDER);
		cell.addElement(new Paragraph(""));
		tabla.addCell(cell);
		

		cell = new PdfPCell();
		cell.setColspan(3);
		cell.setBorder(Rectangle.NO_BORDER);
		cell.addElement(new Paragraph("_____________________________"));
		tabla.addCell(cell);

		cell = celdaDato("RECIBIDO POR",fuenteNormal_12,Element.ALIGN_LEFT);
		cell.setColspan(3);
		cell.setBorder(Rectangle.NO_BORDER);
		tabla.addCell(cell);
		
		cell = new PdfPCell();
		cell.setColspan(1);
		cell.setBorder(Rectangle.NO_BORDER);
		cell.addElement(new Paragraph(""));
		tabla.addCell(cell);
		
		cell = celdaDato("CONDUCTOR " + ct.getCtrafconductor(),fuenteNormal_12,Element.ALIGN_LEFT);
		cell.setColspan(3);
		cell.setBorder(Rectangle.NO_BORDER);
		tabla.addCell(cell);

		cell = celdaDato("Válido como Firma",fuenteNormal_12,Element.ALIGN_LEFT);
		cell.setColspan(3);
		cell.setBorder(Rectangle.NO_BORDER);
		tabla.addCell(cell);
		
		cell = new PdfPCell();
		cell.setColspan(1);
		cell.setBorder(Rectangle.NO_BORDER);
		cell.addElement(new Paragraph(""));
		tabla.addCell(cell);
		
		cell = celdaDato("Válido como Firma",fuenteNormal_12,Element.ALIGN_LEFT);
		cell.setColspan(3);
		cell.setBorder(Rectangle.NO_BORDER);
		tabla.addCell(cell);
		
		
		
		documento.add(tabla);
		
		ParrafoHoja = new Paragraph();
		agregarLineasEnBlanco(ParrafoHoja, 3);
		documento.add(ParrafoHoja);

		try {
			///sglkobad1\pdf\REGFOTOGRAFICO\9407\\Firma.pn
			String ruta = rutaContexto + File.separator + "pdf" + 
			File.separator + "REGFOTOGRAFICO" + File.separator + 
			lct.getlctrafcontenedor();
			
			File f = new File(ruta);
			 File[] file =f.listFiles();
			 tabla = new PdfPTable(file.length); // Numero de columnas
			 tabla.setWidthPercentage(100); // Porcentaje de la pagina que ocupa
			 tabla.setHorizontalAlignment(Element.ALIGN_LEFT);// Alineacion horizontal
				
			 for (File uploadFiles : file) {
					String ruta_arch = ruta + File.separator+ uploadFiles.getName();
					Image img = Image.getInstance(ruta_arch);
		            img.scaleAbsolute(100,100);

	          	  	cell = new PdfPCell(img,false);
	                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	                tabla.addCell(cell);
				}
				documento.add(tabla);
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
		
		return map;
	}
	
	public static String getTableEmailBody(String fechaEmision, String fechaRecibo, String contenedor,
			String importacion, String precinto, String transportadora, String orden, String productos) {
		String table = "<table border=\"1\">\r\n"
				+ "\r\n"
				+ "<tr>\r\n"
				+ "<td rowspan=\"3\" colspan=\"2\"><b>INFORME DE RECIBO</b></td>\r\n"
				+ "<td rowspan=\"3\"  colspan=\"2\">P&aacute;gina 1 de 1</td>\r\n"
				+ "<td  colspan=\"3\">Versi&oacute;n: 001-2019</td>\r\n"
				+ "</tr>\r\n"
				+ "\r\n"
				+ "<tr>\r\n"
				+ "<td colspan=\"3\">Fecha de emisi&oacute;n:</td>\r\n"
				+ "</tr>\r\n"
				+ "\r\n"
				+ "<tr>\r\n"
				+ "<td colspan=\"3\">"+fechaEmision+"</td>\r\n"
				+ "</tr>\r\n"
				+ "\r\n"
				+ "<tr>\r\n"
				+ "<td colspan=\"2\">Elaborado por:</td>\r\n"
				+ "<td colspan=\"2\">Revisado por:</td>\r\n"
				+ "<td colspan=\"3\">Aprobado por:</td>\r\n"
				+ "</tr>\r\n"
				+ "\r\n"
				+ "<tr>\r\n"
				+ "<td colspan=\"2\">Roberto Tibaquicha</td>\r\n"
				+ "<td colspan=\"2\">Milena Mendez</td>\r\n"
				+ "<td colspan=\"3\">Johanna Guzm&aacute;n</td>\r\n"
				+ "</tr>\r\n"
				+ "\r\n"
				+ "<tr>\r\n"
				+ "<td colspan=\"2\">Coordinador Log&iacute;stico Importados</td>\r\n"
				+ "<td colspan=\"2\">Subgerente Log&iacute;stico Importados</td>\r\n"
				+ "<td colspan=\"3\">Directora de Importados</td>\r\n"
				+ "</tr>\r\n"
				+ "\r\n"
				+ "<tr>\r\n"
				+ "<td></td>\r\n"
				+ "<td></td>\r\n"
				+ "<td></td>\r\n"
				+ "</tr>\r\n"
				+ "\r\n"
				+ "<tr>\r\n"
				+ "<td colspan=\"2\"><b>FECHA DE RECIBO:</b></td>\r\n"
				+ "<td colspan=\"2\"><b>"+fechaRecibo+"</b></td>\r\n"
				+ "</tr>\r\n"
				+ "\r\n"
				+ "<tr>\r\n"
				+ "<td colspan=\"2\"><b>NUMERO DE CONTENEDOR:</b></td>\r\n"
				+ "<td colspan=\"2\"><b>"+contenedor+"</b></td>\r\n"
				+ "</tr>\r\n"
				+ "\r\n"
				+ "<tr>\r\n"
				+ "<td colspan=\"2\"><b>NUMERO DE IMPORTACI&Oacute;N:</b></td>\r\n"
				+ "<td colspan=\"2\"><b>"+importacion+"</b></td>\r\n"
				+ "</tr>\r\n"
				+ "\r\n"
				+ "<tr>\r\n"
				+ "<td colspan=\"2\"><b>PRECINTOS</b></td>\r\n"
				+ "<td colspan=\"2\"><b>"+precinto+"</b></td>\r\n"
				+ "</tr>\r\n"
				+ "\r\n"
				+ "<tr>\r\n"
				+ "<td colspan=\"2\"><b>TRANSPORTADORA:</b></td>\r\n"
				+ "<td colspan=\"2\"><b>"+transportadora+"</b></td>\r\n"
				+ "</tr>\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "<tr>\r\n"
				+ "<td colspan=\"2\"><b>NUMERO DE ORDEN DE RECIBO:</b></td>\r\n"
				+ "<td colspan=\"2\"><b>"+orden+"</b></td>\r\n"
				+ "</tr>\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "<tr>\r\n"
				+ "<td><b>PLACA</b></td>\r\n"
				+ "<td><b>PRODUCTO</b></td>\r\n"
				+ "<td><b>LOTE</b></td>\r\n"
				+ "<td><b>FECHA VENCIMIENTO</b></td>\r\n"
				+ "<td><b>CANTIDAD</b></td>\r\n"
				+ "<td><b>ESTIBAS</b></td>\r\n"
				+ "<td><b>OBSERVACIONES</b></td>\r\n"
				+ "</tr>\r\n"
				+ productos
				+ "</table>";
		
		return table;
	}
	
	public static void addTableValue(String text, Font fuente, PdfPTable tabla, int colspan) {
		PdfPCell cell = new PdfPCell();
		Paragraph ParrafoHoja = new Paragraph(text, fuente);
		ParrafoHoja.setAlignment(Element.ALIGN_LEFT);
		cell.addElement(ParrafoHoja);
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		cell.setColspan(colspan);
		tabla.addCell(cell);
	}

	private void agregarContenidoOld(Document documento, String lctrafcodsx, String codusu, String rutaarchivo, String rutaContexto)
			throws DocumentException {
		
		empresa emp = new administracion.control.gstempresa().getempresa("4");


		lote_contenedor_trafico lct = glct.getlote_contenedor_trafico(lctrafcodsx);
		lote_trafico lt = glt.getlote_trafico(lct.getlctraflote());
		contenedor_trafico ct = gcont.getcontenedor_trafico(lct.getlctrafcontenedor());
		trafico traf = gtraf.gettrafico(ct.getctrafnumtrafico());
		producto pro = gprod.getproducto(lt.getltrafcodproducto());
		inspeccion_recibo inre = ginre.getinspeccion_recibo(traf.gettrafcodsx(), lctrafcodsx);
		if (inre == null) {
			inre = new inspeccion_recibo(traf.gettrafcodsx(), lctrafcodsx);
		}

		Paragraph ParrafoHoja = new Paragraph();
		PdfPCell cell = new PdfPCell();

		// Agregamos una linea en blanco
		agregarLineasEnBlanco(ParrafoHoja, 1);

		// Encabezado
		PdfPTable tabla = new PdfPTable(3); // Numero de columnas
		tabla.setWidthPercentage(100); // Porcentaje de la pagina que ocupa
		tabla.setHorizontalAlignment(Element.ALIGN_JUSTIFIED_ALL);// Alineacion horizontal

		try {
			String ruta = rutaContexto + File.separator + "disenno" + File.separator + "images" + File.separator + "logo.gif";
            Image img = Image.getInstance(ruta);
            img.scaleAbsolute(100,100);
            cell = new PdfPCell(img,false);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
    		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            tabla.addCell(cell);
        } catch (Exception e) {
            cell = new PdfPCell();
            cell.addElement(new Paragraph(""));
            tabla.addCell(cell);
            System.out.print(e.getMessage());
        }
		
		cell = new PdfPCell();
		Paragraph p1 = new Paragraph("INSPECCION DE RECIBO" , fuenteBold_10);
		p1.setAlignment(Element.ALIGN_CENTER);
		cell.addElement(p1);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	    tabla.addCell(cell);
		 
		cell = new PdfPCell();
		Paragraph p2 = new Paragraph(emp.getempnombre() + "\n" + emp.getempdireccion() + "\n" + "NIT:" + emp.getempnit() + "\n"
				+ "FECHA DE IMPRESION:" + Fecha.getFechaSinHora(), fuenteBold_10);
		p2.setAlignment(Element.ALIGN_LEFT);
		cell.addElement(p2);
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		tabla.addCell(cell);

		documento.add(ParrafoHoja);
		documento.add(tabla);

		ParrafoHoja = new Paragraph();
		agregarLineasEnBlanco(ParrafoHoja, 3);
		documento.add(ParrafoHoja);
		

		// Columnas encabezado

		tabla = new PdfPTable(4); // Numero de columnas
		tabla.setWidthPercentage(100); // Porcentaje de la pagina que ocupa
		tabla.setHorizontalAlignment(Element.ALIGN_CENTER);// Alineacion horizontal
		
		
		tabla.addCell(celdaSubTitulo("Muelle #", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInremuelle() != null ? inre.getInremuelle() : "", fuenteNormal_10, Element.ALIGN_LEFT, 3));

		tabla.addCell(celdaSubTitulo("Fecha", fuenteNormal_10));
		tabla.addCell(celdaDato(ct.getctrafiniciodescargue() != null ? ct.getctrafiniciodescargue():"", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaSubTitulo("No. Precinto", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInreprecinto() != null ? inre.getInreprecinto() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		
		tabla.addCell(celdaSubTitulo("Hora Inicio", fuenteNormal_10));
		tabla.addCell(celdaDato(ct.getctrafiniciodescargue() != null ? ct.getctrafiniciodescargue():"", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaSubTitulo("Tipo Contenedor", fuenteNormal_10));
		tabla.addCell(celdaDato(ct.getctraftamano() != null ? ct.getctraftamano() : "", fuenteNormal_10, Element.ALIGN_LEFT));
	
		tabla.addCell(celdaSubTitulo("Hora Final", fuenteNormal_10));
		tabla.addCell(celdaDato(ct.getCtraffindescargue() != null ? ct.getCtraffindescargue():"", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaSubTitulo("No. Contenedor", fuenteNormal_10));
		tabla.addCell(celdaDato(ct.getctrafnumero() != null ? ct.getctrafnumero() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		
		tabla.addCell(celdaSubTitulo("Importación", fuenteNormal_10));
		tabla.addCell(celdaDato(traf.gettrafnumdta() != null ? traf.gettrafnumdta() : "", fuenteNormal_10, Element.ALIGN_LEFT, 3));
		
		tabla.addCell(celdaSubTitulo("1. Identificación del Vehículo", fuenteNormal_10));
		tabla.addCell(celdaDato("", fuenteNormal_10, Element.ALIGN_LEFT, 3));
		
		tabla.addCell(celdaSubTitulo("Nombre Conductor", fuenteNormal_10));
		tabla.addCell(celdaDato(ct.getCtrafconductor() != null ? ct.getCtrafconductor():"", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaSubTitulo("Cédula Conductor", fuenteNormal_10));
		tabla.addCell(celdaDato(ct.getCtrafcedula() != null ? ct.getCtrafcedula() : "", fuenteNormal_10, Element.ALIGN_LEFT));

		tabla.addCell(celdaSubTitulo("Placa Vehículo", fuenteNormal_10));
		tabla.addCell(celdaDato(ct.getctrafplaca() != null ? ct.getctrafplaca():"", fuenteNormal_10, Element.ALIGN_LEFT, 3));
		
		tabla.addCell(celdaSubTitulo("2. Mercancía a Recibir", fuenteNormal_10));
		tabla.addCell(celdaDato("", fuenteNormal_10, Element.ALIGN_LEFT, 3));
		
		tabla.addCell(celdaSubTitulo("Producto", fuenteNormal_10));
		tabla.addCell(celdaDato(pro != null ? pro.getpromodelo(): "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaSubTitulo("Descripción", fuenteNormal_10));
		tabla.addCell(celdaDato(pro != null ? pro.getprodescripcion() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		
		tabla.addCell(celdaSubTitulo("Vencimiento", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInrevencimiento() != null ? inre.getInrevencimiento() : lt.getLtrafvencimiento(), fuenteNormal_10, Element.ALIGN_LEFT, 3));
		
		tabla.addCell(celdaSubTitulo("Lote", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInrelote() != null ? inre.getInrelote() : lt.getLtraflote(), fuenteNormal_10, Element.ALIGN_LEFT, 3));
				
		tabla.addCell(celdaSubTitulo("Estibas", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInreestibas() != null ? inre.getInreestibas() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaSubTitulo("Cajas", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInrecajas() != null ? inre.getInrecajas() : lct.getlctrafcantidad(), fuenteNormal_10, Element.ALIGN_LEFT));
		
		tabla.addCell(celdaSubTitulo("Saldo", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInresaldo() != null ? inre.getInresaldo() : "", fuenteNormal_10, Element.ALIGN_LEFT, 3));

		tabla.addCell(celdaSubTitulo("Novedades A(O) S(O) F(O) D(O)", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInrenovedades() != null ? inre.getInrenovedades() : "", fuenteNormal_10, Element.ALIGN_LEFT, 3));
		
		tabla.addCell(celdaSubTitulo("Recuparadas", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInrerecuperadas() != null ? inre.getInrerecuperadas() : "", fuenteNormal_10, Element.ALIGN_LEFT, 3));
		
		tabla.addCell(celdaSubTitulo("TOTAL UMP", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInretotalump() != null ? inre.getInretotalump() : lct.getlctrafcantidad(), fuenteNormal_10, Element.ALIGN_LEFT, 3));
		
		tabla.addCell(celdaSubTitulo("Estibas Requeridas", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInreesibasrequeridas() != null ? inre.getInreesibasrequeridas() : "", fuenteNormal_10, Element.ALIGN_LEFT, 3));

		tabla.addCell(celdaSubTitulo("Peso Estiba Vacia", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInrepesoestibavacia()!= null ? inre.getInrepesoestibavacia() : "", fuenteNormal_10, Element.ALIGN_LEFT, 3));

		tabla.addCell(celdaSubTitulo("Peso Total Estibas Vacias", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInrepesototalestibasvacias() != null ? inre.getInrepesototalestibasvacias() : "", fuenteNormal_10, Element.ALIGN_LEFT, 3));

		tabla.addCell(celdaSubTitulo("Peso estiba Paletizada", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInrepesoestibapaletizada() != null ? inre.getInrepesoestibapaletizada() : "", fuenteNormal_10, Element.ALIGN_LEFT, 3));

		tabla.addCell(celdaSubTitulo("Peso por UMP", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInrepesoporump() != null ? inre.getInrepesoporump() : "", fuenteNormal_10, Element.ALIGN_LEFT, 3));

		tabla.addCell(celdaSubTitulo("PESO NETO PRODUCTO", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInrepesonetoproducto() != null ? inre.getInrepesonetoproducto() : "", fuenteNormal_10, Element.ALIGN_LEFT, 3));

		tabla.addCell(celdaSubTitulo("OBSERVACIONES", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInreobservaciones() != null ? inre.getInreobservaciones() : "", fuenteNormal_10, Element.ALIGN_LEFT, 3));

		
		documento.add(tabla);
			
			
		ParrafoHoja = new Paragraph();
		agregarLineasEnBlanco(ParrafoHoja, 1);
		documento.add(ParrafoHoja);
		

		// Columnas encabezado

		tabla = new PdfPTable(3); // Numero de columnas
		tabla.setWidthPercentage(100); // Porcentaje de la pagina que ocupa
		tabla.setHorizontalAlignment(Element.ALIGN_CENTER);// Alineacion horizontal
	    
		tabla.addCell(celdaSubTitulo("3. Condiciones sanitarias del Vehículo", fuenteNormal_10));
		tabla.addCell(celdaDato("", fuenteNormal_10, Element.ALIGN_LEFT, 2));
		
		tabla.addCell(celdaSubTitulo("PUNTOS A EVALUAR", fuenteNormal_10));
		tabla.addCell(celdaSubTitulo("CALIFICACION", fuenteNormal_10));
		tabla.addCell(celdaSubTitulo("OBSERVACIONES", fuenteNormal_10));
		
		tabla.addCell(celdaSubTitulo("El personal de descargue cuenta con ARL vigente", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInrearlvigente_cal() != null ? inre.getInrearlvigente_cal() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaDato(inre.getInrearlvigente_obs() != null ? inre.getInrearlvigente_obs() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		
		tabla.addCell(celdaSubTitulo("El personal de descargue cuenta con Carné de manipulación de ...", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInrecarnet_cal() != null ? inre.getInrecarnet_cal() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaDato(inre.getInrecarnet_obs() != null ? inre.getInrecarnet_obs() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		
		tabla.addCell(celdaSubTitulo("El personal de descargue usa los elementos de protección personal", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInreproteccion_cal() != null ? inre.getInreproteccion_cal() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaDato(inre.getInreproteccion_obs() != null ? inre.getInreproteccion_obs() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		
		tabla.addCell(celdaSubTitulo("El vehículo cuenta con certificado de fumigación no menor a...", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInrefumigacion_cal() != null ? inre.getInrefumigacion_cal() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaDato(inre.getInrefumigacion_obs() != null ? inre.getInrefumigacion_obs() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		
		tabla.addCell(celdaSubTitulo("El personal de descargue cuenta con Carné de manipulación de alimentos vigente", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInremanipulacion_cal() != null ? inre.getInremanipulacion_cal() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaDato(inre.getInremanipulacion_obs() != null ? inre.getInremanipulacion_obs() : "", fuenteNormal_10, Element.ALIGN_LEFT));		
		
		tabla.addCell(celdaSubTitulo("El piso, techo y paredes del vehículo se encuentran limpias y en buen estado", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInreaseovehiculo_cal() != null ? inre.getInreaseovehiculo_cal() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaDato(inre.getInreaseovehiculo_obs() != null ? inre.getInreaseovehiculo_obs() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		
		tabla.addCell(celdaSubTitulo("El vehículo contiene materiales extraños o sustancias químicas", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInresustanciasquimicas_cal() != null ? inre.getInresustanciasquimicas_cal() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaDato(inre.getInresustanciasquimicas_obs() != null ? inre.getInresustanciasquimicas_obs() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		
		tabla.addCell(celdaSubTitulo("Si el vehículo tiene thermoking registra la temperatura de llegada", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInretemperatura_cal() != null ? inre.getInretemperatura_cal() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaDato(inre.getInretemperatura_obs() != null ? inre.getInretemperatura_obs() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		
		tabla.addCell(celdaSubTitulo("Estado General del producto", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInreestadogeneral_cal() != null ? inre.getInreestadogeneral_cal() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaDato(inre.getInreestadogeneral_obs() != null ? inre.getInreestadogeneral_obs() : "", fuenteNormal_10, Element.ALIGN_LEFT));

		tabla.addCell(celdaSubTitulo("Revisiones aleatorias efectuadas", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInrerevisiones_cal() != null ? inre.getInrerevisiones_cal() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaDato(inre.getInrerevisiones_obs() != null ? inre.getInrerevisiones_obs() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		
		tabla.addCell(celdaSubTitulo("*UMP Recibidas", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInreumprecibidas_cal() != null ? inre.getInreumprecibidas_cal() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaDato(inre.getInreumprecibidas_obs() != null ? inre.getInreumprecibidas_obs() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		
		tabla.addCell(celdaSubTitulo("*UMP Revisadas", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInreumprevisadas_cal() != null ? inre.getInreumprevisadas_cal() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaDato(inre.getInreumprevisadas_obs() != null ? inre.getInreumprevisadas_obs() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		
		tabla.addCell(celdaSubTitulo("*Tabla Nutricional", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInretablanutricional_cal() != null ? inre.getInretablanutricional_cal() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaDato(inre.getInretablanutricional_obs() != null ? inre.getInretablanutricional_obs() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		
		tabla.addCell(celdaSubTitulo("*Información Importación CINC", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInreimportacioncinc_cal() != null ? inre.getInreimportacioncinc_cal() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaDato(inre.getInreimportacioncinc_obs() != null ? inre.getInreimportacioncinc_obs() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		
		tabla.addCell(celdaSubTitulo("Calificación/cumplimiento: SI Cumple; NO Cumple", fuenteNormal_10));
		tabla.addCell(celdaDato(inre.getInrecalificacion_cal() != null ? inre.getInrecalificacion_cal() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		tabla.addCell(celdaDato(inre.getInrecalificacion_obs() != null ? inre.getInrecalificacion_obs() : "", fuenteNormal_10, Element.ALIGN_LEFT));
		
		documento.add(tabla);
		
		ParrafoHoja = new Paragraph();
		agregarLineasEnBlanco(ParrafoHoja, 3);
		documento.add(ParrafoHoja);
		
		//Firmas
		
	    tabla = new PdfPTable(7); // Numero de columnas
		tabla.setWidthPercentage(100); // Porcentaje de la pagina que ocupa
		tabla.setHorizontalAlignment(Element.ALIGN_CENTER);// Alineacion horizontal
		
		cell = celdaDato(inre.getInrerecibido()!= null ? inre.getInrerecibido() : "", fuenteNormal_10, Element.ALIGN_LEFT);
		cell.setColspan(3);
		cell.setBorder(Rectangle.NO_BORDER);
		tabla.addCell(cell);
		
		cell = new PdfPCell();
		cell.setColspan(1);
		cell.setBorder(Rectangle.NO_BORDER);
		cell.addElement(new Paragraph(""));
		tabla.addCell(cell);

		cell = celdaDato(inre.getInreconductor()!= null ? inre.getInreconductor() : "", fuenteNormal_10, Element.ALIGN_LEFT);
		cell.setColspan(3);
		cell.setBorder(Rectangle.NO_BORDER);
		tabla.addCell(cell);
		
		
		
		
		Image imgFirma = null;
		try {
			String ruta = rutaContexto + File.separator + "pdf" + 
					File.separator + "FIRMARECIBIDO" + File.separator + 
					lct.getlctrafcontenedor();
					
					File f = new File(ruta);
					 File[] file =f.listFiles();
					 for (File uploadFiles : file) {
							String ruta_arch = ruta + File.separator+ uploadFiles.getName();
							imgFirma = Image.getInstance(ruta_arch);
							imgFirma.scaleAbsolute(150,70);
							
						}
			cell = new PdfPCell(imgFirma,false);
			cell.setColspan(3);
			cell.setBorder(Rectangle.NO_BORDER);
			tabla.addCell(cell);
		} catch (Exception e) {
			cell = new PdfPCell();
			cell.setColspan(3);
			cell.setBorder(Rectangle.NO_BORDER);
			cell.addElement(new Paragraph(""));
			tabla.addCell(cell);
        }
		
		cell = new PdfPCell();
		cell.setColspan(1);
		cell.setBorder(Rectangle.NO_BORDER);
		cell.addElement(new Paragraph(""));
		tabla.addCell(cell);
		
		try {
			String ruta = rutaContexto + File.separator + "pdf" + 
					File.separator + "FIRMACONDUCTOR" + File.separator + 
					lct.getlctrafcontenedor();
					
					File f = new File(ruta);
					 File[] file =f.listFiles();
					 for (File uploadFiles : file) {
							String ruta_arch = ruta + File.separator+ uploadFiles.getName();
							imgFirma = Image.getInstance(ruta_arch);
							imgFirma.scaleAbsolute(150,70);
							
						}
			cell = new PdfPCell(imgFirma,false);
			cell.setColspan(3);
			cell.setBorder(Rectangle.NO_BORDER);
			tabla.addCell(cell);
		} catch (Exception e) {
			cell = new PdfPCell();
			cell.setColspan(3);
			cell.setBorder(Rectangle.NO_BORDER);
			cell.addElement(new Paragraph(""));
			tabla.addCell(cell);
        }
		
		cell = new PdfPCell();
		cell.setColspan(3);
		cell.setBorder(Rectangle.NO_BORDER);
		cell.addElement(new Paragraph("_____________________________"));
		tabla.addCell(cell);
		
		cell = new PdfPCell();
		cell.setColspan(1);
		cell.setBorder(Rectangle.NO_BORDER);
		cell.addElement(new Paragraph(""));
		tabla.addCell(cell);
		

		cell = new PdfPCell();
		cell.setColspan(3);
		cell.setBorder(Rectangle.NO_BORDER);
		cell.addElement(new Paragraph("_____________________________"));
		tabla.addCell(cell);
		
		
		
		
		 
		cell = celdaDato("RECIBIDO POR",fuenteNormal_12,Element.ALIGN_LEFT);
		cell.setColspan(3);
		cell.setBorder(Rectangle.NO_BORDER);
		tabla.addCell(cell);
		
		cell = new PdfPCell();
		cell.setColspan(1);
		cell.setBorder(Rectangle.NO_BORDER);
		cell.addElement(new Paragraph(""));
		tabla.addCell(cell);
		
		cell = celdaDato("CONDUCTOR " + ct.getCtrafconductor(),fuenteNormal_12,Element.ALIGN_LEFT);
		cell.setColspan(3);
		cell.setBorder(Rectangle.NO_BORDER);
		tabla.addCell(cell);
		
		
		
		
		
		cell = celdaDato("Válido como Firma",fuenteNormal_12,Element.ALIGN_LEFT);
		cell.setColspan(3);
		cell.setBorder(Rectangle.NO_BORDER);
		tabla.addCell(cell);
		
		cell = new PdfPCell();
		cell.setColspan(1);
		cell.setBorder(Rectangle.NO_BORDER);
		cell.addElement(new Paragraph(""));
		tabla.addCell(cell);
		
		cell = celdaDato("Válido como Firma",fuenteNormal_12,Element.ALIGN_LEFT);
		cell.setColspan(3);
		cell.setBorder(Rectangle.NO_BORDER);
		tabla.addCell(cell);
		
		
		
		documento.add(tabla);
		
		ParrafoHoja = new Paragraph();
		agregarLineasEnBlanco(ParrafoHoja, 3);
		documento.add(ParrafoHoja);

		try {
			///sglkobad1\pdf\REGFOTOGRAFICO\9407\\Firma.pn
			String ruta = rutaContexto + File.separator + "pdf" + 
			File.separator + "REGFOTOGRAFICO" + File.separator + 
			lct.getlctrafcontenedor();
			
			File f = new File(ruta);
			 File[] file =f.listFiles();
			 tabla = new PdfPTable(file.length); // Numero de columnas
			 tabla.setWidthPercentage(100); // Porcentaje de la pagina que ocupa
			 tabla.setHorizontalAlignment(Element.ALIGN_LEFT);// Alineacion horizontal
				
			 for (File uploadFiles : file) {
					String ruta_arch = ruta + File.separator+ uploadFiles.getName();
					Image img = Image.getInstance(ruta_arch);
		            img.scaleAbsolute(100,100);

	          	  	cell = new PdfPCell(img,false);
	                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	                tabla.addCell(cell);
					
				}
		

				documento.add(tabla);
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
		
		
	}
	
	
	
	PdfPCell celdaTitulo(String dato, Font fuente) {
		PdfPCell cell = new PdfPCell();
		Paragraph p = new Paragraph(dato, fuente);
		p.setAlignment(Element.ALIGN_CENTER);
		cell.addElement(p);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setBackgroundColor(Color.LIGHT_GRAY);
		return cell;
	}
	
	
	PdfPCell celdaSubTitulo(String dato, Font fuente) {
		PdfPCell cell = new PdfPCell();
		Paragraph p = new Paragraph(dato, fuente);
		p.setAlignment(Element.ALIGN_LEFT);
		cell.addElement(p);
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		cell.setBackgroundColor(Color.LIGHT_GRAY);
		return cell;
	}
	
	PdfPCell celdaDato(String dato, Font fuente, int alineacion ) {
		PdfPCell cell = new PdfPCell();
		Paragraph p = new Paragraph(dato, fuente);
		p.setAlignment(alineacion);
		cell.addElement(p);
		cell.setHorizontalAlignment(alineacion);
		return cell;
	}
	
	PdfPCell celdaDato(String dato, Font fuente, int alineacion, int colspan ) {
		PdfPCell cell = new PdfPCell();
		Paragraph p = new Paragraph(dato, fuente);
		p.setAlignment(alineacion);
		cell.addElement(p);
		cell.setHorizontalAlignment(alineacion);
		cell.setColspan(colspan);	
		return cell;
	}
	
	
	    
	
}
