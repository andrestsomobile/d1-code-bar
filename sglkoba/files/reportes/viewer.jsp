
<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="net.sf.jasperreports.engine.util.*"%>
<%@ page import="net.sf.jasperreports.engine.fonts.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="reportes.form.*"%>


<% 
reportesForm repform = (reportesForm)request.getAttribute("reportesForm");
String tipo = repform.getTipo_reporte();

if (!tipo.equals("EXCELGENERADO")) {
	Map parameters = (HashMap)request.getAttribute("parametros"); //
	File reportFile = (File)request.getAttribute("reporte");

	db.beanConnector db = new db.beanConnector();
	java.sql.Connection cx = db.getCx();
	//JasperReport xjasperReport = (JasperReport) net.sf.jasperreports.engine.util.JRLoader.loadObject(reportFile.getPath());
	JasperReport jasperReport = (JasperReport) JRLoader.loadObject(reportFile);
	JasperPrint jasperPrint =   JasperFillManager.fillReport( jasperReport, parameters,cx );

	try {

		if(tipo.equals("PDF")) {
			net.sf.jasperreports.engine.export.JRPdfExporter exp = new net.sf.jasperreports.engine.export.JRPdfExporter();
			response.setContentType("application/pdf");
			exp.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
			exp.setParameter(JRExporterParameter.OUTPUT_STREAM, response.getOutputStream());
			exp.exportReport();

		}else if(tipo.equals("HTML")) {

		    net.sf.jasperreports.engine.export.JRHtmlExporter exporter = new net.sf.jasperreports.engine.export.JRHtmlExporter();
   			Map imagesMap = new HashMap();
   			session.setAttribute("IMAGES_MAP", imagesMap);
   			exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
   			exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);
   			exporter.setParameter(net.sf.jasperreports.engine.export.JRHtmlExporterParameter.IMAGES_MAP, imagesMap);
			//    exporter.setParameter(net.sf.jasperreports.engine.export.JRHtmlExporterParameter.IMAGES_URI, "/sgl/files/reportes/jasper/");
	    	exporter.setParameter(net.sf.jasperreports.engine.export.JRHtmlExporterParameter.IMAGES_URI, "./files/reportes/jasper/image.jsp?image=");
   			exporter.exportReport();
	
		}else if(tipo.equals("EXCEL")) {
	
			net.sf.jasperreports.engine.export.JRXlsExporter xlsExporter = new net.sf.jasperreports.engine.export.JRXlsExporter();
			ByteArrayOutputStream xlsReport = new ByteArrayOutputStream();
			xlsExporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
			xlsExporter.setParameter(JRExporterParameter.OUTPUT_STREAM, xlsReport);
			xlsExporter.exportReport();
			byte[]  bytes = xlsReport.toByteArray();
			response.setContentType("application/vnd.ms-excel");
			response.setContentLength(bytes.length);
			ServletOutputStream ouputStream = response.getOutputStream();
			ouputStream.write(bytes, 0, bytes.length);
			ouputStream.flush();
			ouputStream.close();
		}else if(tipo.equals("RTF")) {
				
			net.sf.jasperreports.engine.export.JRRtfExporter exp = new net.sf.jasperreports.engine.export.JRRtfExporter();
			ByteArrayOutputStream xlsReport = new ByteArrayOutputStream();
			exp.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
			exp.setParameter(JRExporterParameter.OUTPUT_STREAM, xlsReport);
			exp.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, "D:/xxx.rtf");
			exp.exportReport();
	
			byte[]  bytes = xlsReport.toByteArray();
			response.setContentType("application/rtf");
			response.setContentLength(bytes.length);
			ServletOutputStream ouputStream = response.getOutputStream();
			ouputStream.write(bytes, 0, bytes.length);
			ouputStream.flush();
			ouputStream.close();
		}	

	}catch(Exception ex) {ex.printStackTrace(); }
	cx.close();
} else {
	if (tipo.equals("EXCELGENERADO")) {
		String pagina = request.getParameter("pagina");
		response.sendRedirect(pagina);
	}
}
%>