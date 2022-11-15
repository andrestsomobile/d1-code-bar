<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.*,ingreso.control.*,ingreso.entity.*,ingreso.form.*, maestro.control.*, maestro.entity.*,administracion.entity.*, java.io.*,util.*, util.file.*"%>

<html>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">
	/*table td input {
	  position: absolute;
	  display: block;
	  top:0;
	  left:0;
	  margin: 0;
	  height: 100%;
	  width: 100%;
	  border: none;
	  padding: 10px;
	  box-sizing: border-box;
	}*/
	table td input {
	 /* position: absolute;*/
	  display: block;
	  top:0;
	  left:0;
	  margin: 0;
	  height: 100%;
	  width: 100%;
	  border: none;
	  padding: 2px;
	  box-sizing: border-box;
	}
	table td input:read-only {
		color: #000000;
		background-color: #FFFFFF;
	}
	
	
</style>
	
<script type="text/javascript">

function generarpdf(lctrafcodsx,trafcodsx) { 
	
	var miurl = "traficoAction.do?opcion=generaPdfInspeccionRecibo&lctrafcodsx="+lctrafcodsx+"&trafcodsx="+trafcodsx;
	
	//window.location = mirul;
	var inremuelle = $("input[id='inremuelle']").val();
	
	$.ajax({
	    url: miurl,
	    data: { 
		"inremuelle": $("input[id='inremuelle']").val(),
		"inreprecinto": $("input[id='inreprecinto']").val(),
		"inrevencimiento": $("input[id='inrevencimiento']").val(),
		"inrelote": $("input[id='inrelote']").val(),
		"inreestibas": $("input[id='inreestibas']").val(),
		"inrecajas": $("input[id='inrecajas']").val(),
		"inresaldo": $("input[id='inresaldo']").val(),
		"inrenovedades": $("input[id='inrenovedades']").val(),
		"inrerecuperadas": $("input[id='inrerecuperadas']").val(),
		"inretotalump": $("input[id='inretotalump']").val(),
		"inreesibasrequeridas": $("input[id='inreesibasrequeridas']").val(),
		"inrepesoestibavacia": $("input[id='inrepesoestibavacia']").val(),
		"inrepesototalestibasvacias": $("input[id='inrepesototalestibasvacias']").val(),
		"inrepesoestibapaletizada": $("input[id='inrepesoestibapaletizada']").val(),
		"inrepesoporump": $("input[id='inrepesoporump']").val(),
		"inrepesonetoproducto": $("input[id='inrepesonetoproducto']").val(),
		"inreobservaciones": $("input[id='inreobservaciones']").val(),
		"inrearlvigente_cal": $("input[id='inrearlvigente_cal']").val(),
		"inrearlvigente_obs": $("input[id='inrearlvigente_obs']").val(),
		"inrecarnet_cal": $("input[id='inrecarnet_cal']").val(),
		"inrecarnet_obs": $("input[id='inrecarnet_obs']").val(),
		"inreproteccion_cal": $("input[id='inreproteccion_cal']").val(),
		"inreproteccion_obs": $("input[id='inreproteccion_obs']").val(),
		"inrefumigacion_cal": $("input[id='inrefumigacion_cal']").val(),
		"inrefumigacion_obs": $("input[id='inrefumigacion_obs']").val(),
		"inremanipulacion_cal": $("input[id='inremanipulacion_cal']").val(),
		"inremanipulacion_obs": $("input[id='inremanipulacion_obs']").val(),
		"inreaseovehiculo_cal": $("input[id='inreaseovehiculo_cal']").val(),
		"inreaseovehiculo_obs": $("input[id='inreaseovehiculo_obs']").val(),
		"inresustanciasquimicas_cal": $("input[id='inresustanciasquimicas_cal']").val(),
		"inresustanciasquimicas_obs": $("input[id='inresustanciasquimicas_obs']").val(),
		"inretemperatura_cal": $("input[id='inretemperatura_cal']").val(),
		"inretemperatura_obs": $("input[id='inretemperatura_obs']").val(),
		"inreestadogeneral_cal": $("input[id='inreestadogeneral_cal']").val(),
		"inreestadogeneral_obs": $("input[id='inreestadogeneral_obs']").val(),
		"inrerevisiones_cal": $("input[id='inrerevisiones_cal']").val(),
		"inrerevisiones_obs": $("input[id='inrerevisiones_obs']").val(),
		"inreumprecibidas_cal": $("input[id='inreumprecibidas_cal']").val(),
		"inreumprecibidas_obs": $("input[id='inreumprecibidas_obs']").val(),
		"inreumprevisadas_cal": $("input[id='inreumprevisadas_cal']").val(),
		"inreumprevisadas_obs": $("input[id='inreumprevisadas_obs']").val(),
		"inretablanutricional_cal": $("input[id='inretablanutricional_cal']").val(),
		"inretablanutricional_obs": $("input[id='inretablanutricional_obs']").val(),
		"inreimportacioncinc_cal": $("input[id='inreimportacioncinc_cal']").val(),
		"inreimportacioncinc_obs": $("input[id='inreimportacioncinc_obs']").val(),
		"inrecalificacion_cal": $("input[id='inrecalificacion_cal']").val(),
		"inrecalificacion_obs": $("input[id='inrecalificacion_obs']").val(),
		"inrerecibido": $("input[id='inrerecibido']").val(),
		"inreconductor": $("input[id='inreconductor']").val(),
		"inrefechagenerado": $("input[id='inrefechagenerado']").val()

	    },
	    cache: false,
	    type: "POST",
	    success: function(response) { 
			alert("Se ha generado el PDF de la inspección, ya puede descargalo");
	    },
	    error: function(xhr) {

	    }
	});
}

function cambioProducto(producto, contenedor, trafico) {
	var miurl = "traficoAction.do?producto="+producto + "&contenedor="+contenedor+"&trafico="+trafico;

	$.ajax({
	    url: miurl,
	    cache: false,
	    type: "GET",
	    success: function(response) { 
			console.log(response)
	    },
	    error: function(xhr) {

	    }
	});
}

</script>

<%
gsttrafico gtraf = new gsttrafico();
gstcontenedor_trafico gcont = new gstcontenedor_trafico();
gstlote_trafico glt = new gstlote_trafico();
gstlote_contenedor_trafico glct = new gstlote_contenedor_trafico();


gstcompania gcomp = new maestro.control.gstcompania();
gsttransportadora gtransp = new maestro.control.gsttransportadora();
gstproducto gprod = new maestro.control.gstproducto();
gstinspeccion_recibo ginre = new gstinspeccion_recibo();

String trafcodsx = request.getParameter("trafcodsx");
String lctrafcodsx = request.getParameter("lctrafcodsx");
String contenedor = request.getParameter("clave");


empresa emp = new administracion.control.gstempresa().getempresa("4");

trafico traf = gtraf.gettrafico(trafcodsx);
Collection<lote_contenedor_trafico> listCt = glct.getContenedorLoteTraficoByContenedor(contenedor, trafcodsx);
List<producto> listPro = new ArrayList<producto>();

for(Object obj: listCt) {
	lote_contenedor_trafico lct = (lote_contenedor_trafico)obj;
	lote_trafico lt = glt.getlote_trafico(lct.getlctraflote());
	producto pro = gprod.getproducto(lt.getltrafcodproducto());
	listPro.add(pro);
}

contenedor_trafico ct = gcont.getcontenedor_trafico(contenedor);
inspeccion_recibo inre = ginre.getinspeccion_recibo(trafcodsx, lctrafcodsx);
if (inre == null) {
	inre = new inspeccion_recibo(trafcodsx, lctrafcodsx);
}

String clave = trafcodsx;

String filePath = request.getRealPath("")+ File.separator;
String tipoAdjunto = "INSPECCION";
String ruta_pdf = Propiedades.getProperties("ruta_pdf");

%>

<table align="center" border="0">
	<tr>
		<td><img src="./disenno/images/logo.gif" width="120" height="120">
		<td align="center"><b> INSPECCION DE RECIBO <br>
		<%=emp.getempnombre()%> <br>
		<%=emp.getempdireccion()%><br>
		NIT <%=emp.getempnit()%> </b>
		<td><%=Fecha.getFechaSinHora()%>
</table>

<br>
<form action="traficoAction.do?app=movil&modulo=inspeccion_recibo_pdf"	method="post">

<table align="center" border="0" width='100%' cellpadding="3"
	cellspacing="0" class="tabla_resumen">

	<tr>
		<td>Muelle #
		<td colspan="3"><input type="text" name="inremuelle" id="inremuelle" value="<%=inre.getInremuelle() != null ? inre.getInremuelle() : ""%>">&nbsp;

	<tr>
		<td>Fecha
		<td><%=ct.getctrafiniciodescargue() != null ? ct.getctrafiniciodescargue():""%>&nbsp;
		<td>No. Precinto
		<td><input type="text" id="inreprecinto" value="<%=inre.getInreprecinto() != null ? inre.getInreprecinto() : ""%>">&nbsp;
	<tr>
		<td>Hora Inicio
		<td><%=ct.getctrafiniciodescargue() != null ? ct.getctrafiniciodescargue():""%>&nbsp;
		<td>Tipo Contenedor
		<td><%=ct.getctraftamano()%>&nbsp;
	<tr>
		<td>Hora Final
		<td><%=ct.getCtraffindescargue() != null ? ct.getCtraffindescargue():""%>&nbsp;
		<td>No. Contenedor
		<td><%=ct.getctrafnumero()%>&nbsp;
	<tr>
		<td>Importaci&oacute;n
		<td colspan="3"><%=traf.gettrafnumdta()%>&nbsp;
	<tr>
		<td>1. Identificaci&oacute;n del Veh&iacute;culo
		<td colspan="3">
	<tr>
		<td>Nombre Conductor
		<td><%=ct.getCtrafconductor()%> &nbsp;
		<td>Cedula Conductor
		<td><%=ct.getCtrafcedula()%> &nbsp;
	<tr>
		<td>Placa Veh&iacute;culo
		<td colspan="3"><%=ct.getctrafplaca()%> &nbsp;
	<tr>
		<td>2. Mercanc&iacute;a a Recibir
		<td colspan="3">&nbsp;		
	<tr>
		<td>Producto
		<td colspan="2">
		<select id="producto" onchange="cambioProducto(this.value,'<%=contenedor %>','<%=trafcodsx %>')">
		<option value="" onselect="">Seleccione</option>
		<logic:iterate id="pro" name="listPro" type="producto"  >
			<option value="<%=pro != null ? pro.getprocodsx(): ""%>"><%=pro != null ? pro.getpromodelo(): ""%></option>
		</logic:iterate>
		</select>	
	<tr>
		<td>Vencimiento
		<td colspan="3"><input type="date" id="inrevencimiento" value="<%=inre.getInrevencimiento() != null ? inre.getInrevencimiento() : lt.getLtrafvencimiento()%>">
	<tr>
		<td>Lote
		<td colspan="3"><input type="text" id="inrelote" value="<%=inre.getInrelote() != null ? inre.getInrelote() : lt.getLtraflote()%>">
	<tr>
		<td>Estibas
		<td><input type="number" id="inreestibas" value="<%=inre.getInreestibas() != null ? inre.getInreestibas() : ""%>">&nbsp;
		<td>Cajas
		<td><input type="number" id="inrecajas" value="<%=inre.getInrecajas() != null ? inre.getInrecajas() : lct.getlctrafcantidad()%>">
	<tr>
		<td>Saldo
		<td colspan="3"><input type="number" id="inresaldo" value="<%=inre.getInresaldo() != null ? inre.getInresaldo() : ""%>">&nbsp;
	<tr>
		<td>Novedades A(O) S(O) F(O) D(O)
		<td colspan="3"><input type="text" id="inrenovedades" value="<%=inre.getInrenovedades() != null ? inre.getInrenovedades() : ""%>">&nbsp;	
	<tr>
		<td>Recuparadas
		<td colspan="3"><input type="number" id="inrerecuperadas" value="<%=inre.getInrerecuperadas() != null ? inre.getInrerecuperadas() : ""%>">&nbsp;
	<tr>
		<td>TOTAL UMP
		<td colspan="3"><input type="number" id="inretotalump" value="<%=inre.getInretotalump() != null ? inre.getInretotalump() : lct.getlctrafcantidad()%>">&nbsp;
	<tr>
		<td>Estibas Requeridas
		<td colspan="3"><input type="number" id="inreesibasrequeridas" value="<%=inre.getInreesibasrequeridas() != null ? inre.getInreesibasrequeridas() : ""%>">&nbsp;
	<tr>
		<td>Peso Estiba Vacia	
		<td colspan="3"><input type="number" id="inrepesoestibavacia" value="<%=inre.getInrepesoestibavacia()!= null ? inre.getInrepesoestibavacia() : ""%>">&nbsp;					
	<tr>
		<td>Peso Total Estibas Vacias
		<td colspan="3"><input type="number" id="inrepesototalestibasvacias" value="<%=inre.getInrepesototalestibasvacias() != null ? inre.getInrepesototalestibasvacias() : ""%>">&nbsp;
	<tr>
		<td>Peso estiba Paletizada
		<td colspan="3"><input type="number" id="inrepesoestibapaletizada" value="<%=inre.getInrepesoestibapaletizada() != null ? inre.getInrepesoestibapaletizada() : ""%>">&nbsp;				
	<tr>
		<td>Peso por UMP
		<td colspan="3"><input type="number" id="inrepesoporump" value="<%=inre.getInrepesoporump()!= null ? inre.getInrepesoporump() : ""%>">&nbsp;	
	<tr>
		<td>PESO NETO PRODUCTO
		<td colspan="3"><input type="number" id="inrepesonetoproducto" value="<%=inre.getInrepesonetoproducto() != null ? inre.getInrepesonetoproducto() : ""%>">&nbsp;				
	<tr>
		<td>OBSERVACIONES
		<td colspan="3"><input type="text" id="inreobservaciones" value="<%=inre.getInreobservaciones() != null ? inre.getInreobservaciones() : ""%>">&nbsp;			
</table>

<br>

<table align="center" border="0" width='100%' cellpadding="3"
	cellspacing="0" class="tabla_resumen">

	<tr>
		<td colspan="3">3. Condiciones sanitarias del Veh&iacute;culo
	<tr>
		<td>PUNTOS A EVALUAR
		<td>CALIFICACION
		<td>OBSERVACIONES
	<tr>
		<td>El personal de descargue cuenta con ARL vigente
		<td><input type="text" id="inrearlvigente_cal" value="<%=inre.getInrearlvigente_cal() != null ? inre.getInrearlvigente_cal() : ""%>">&nbsp;
		<td><input type="text" id="inrearlvigente_obs" value="<%=inre.getInrearlvigente_obs() != null ? inre.getInrearlvigente_obs() : ""%>">&nbsp;
	<tr>
		<td>El personal de descargue cuenta con Carné de manipulación de ...
		<td><input type="text" id="inrecarnet_cal" value="<%=inre.getInrecarnet_cal() != null ? inre.getInrecarnet_cal() : ""%>">&nbsp;
		<td><input type="text" id="inrecarnet_obs" value="<%=inre.getInrecarnet_obs() != null ? inre.getInrecarnet_obs() : ""%>">&nbsp;
	<tr>
		<td>El personal de descargue usa los elementos de protección personal
		<td><input type="text" id="inreproteccion_cal" value="<%=inre.getInreproteccion_cal() != null ? inre.getInreproteccion_cal() : ""%>">&nbsp;
		<td><input type="text" id="inreproteccion_obs" value="<%=inre.getInreproteccion_obs() != null ? inre.getInreproteccion_obs() : ""%>">&nbsp;
	<tr>
		<td>El vehículo cuenta con certificado de fumigación no menor a...
		<td><input type="text" id="inrefumigacion_cal" value="<%=inre.getInrefumigacion_cal() != null ? inre.getInrefumigacion_cal() : ""%>">&nbsp;
		<td><input type="text" id="inrefumigacion_obs" value="<%=inre.getInrefumigacion_obs() != null ? inre.getInrefumigacion_obs() : ""%>">&nbsp;
	<tr>
		<td>El personal de descargue cuenta con Carné de manipulación de alimentos vigente
		<td><input type="text" id="inremanipulacion_cal" value="<%=inre.getInremanipulacion_cal() != null ? inre.getInremanipulacion_cal() : ""%>">&nbsp;
		<td><input type="text" id="inremanipulacion_obs" value="<%=inre.getInremanipulacion_obs() != null ? inre.getInremanipulacion_obs() : ""%>">&nbsp;
	<tr>
		<td>El piso, techo y paredes del vehículo se encuentran limpias y en buen estado
		<td><input type="text" id="inreaseovehiculo_cal" value="<%=inre.getInreaseovehiculo_cal() != null ? inre.getInreaseovehiculo_cal() : ""%>">&nbsp;
		<td><input type="text" id="inreaseovehiculo_obs" value="<%=inre.getInreaseovehiculo_obs() != null ? inre.getInreaseovehiculo_obs() : ""%>">&nbsp;
	<tr>
		<td>El vehículo contiene materiales extraños o sustancias químicas 
		<td><input type="text" id="inresustanciasquimicas_cal" value="<%=inre.getInresustanciasquimicas_cal() != null ? inre.getInresustanciasquimicas_cal() : ""%>">&nbsp;
		<td><input type="text" id="inresustanciasquimicas_obs" value="<%=inre.getInresustanciasquimicas_obs() != null ? inre.getInresustanciasquimicas_obs() : ""%>">&nbsp;
	<tr>
		<td>Si el vehículo tiene thermoking registra la temperatura de llegada
		<td><input type="text" id="inretemperatura_cal" value="<%=inre.getInretemperatura_cal() != null ? inre.getInretemperatura_cal() : ""%>">&nbsp;
		<td><input type="text" id="inretemperatura_obs" value="<%=inre.getInretemperatura_obs() != null ? inre.getInretemperatura_obs() : ""%>">&nbsp;
	<tr>
		<td>Estado General del producto
		<td><input type="text" id="inreestadogeneral_cal" value="<%=inre.getInreestadogeneral_cal() != null ? inre.getInreestadogeneral_cal() : ""%>">&nbsp;
		<td><input type="text" id="inreestadogeneral_obs" value="<%=inre.getInreestadogeneral_obs() != null ? inre.getInreestadogeneral_obs() : ""%>">&nbsp;
	<tr>
		<td>Revisiones aleatorias efectuadas
		<td><input type="text" id="inrerevisiones_cal" value="<%=inre.getInrerevisiones_cal()!= null ? inre.getInrerevisiones_cal() : ""%>">&nbsp;
		<td><input type="text" id="inrerevisiones_obs" value="<%=inre.getInrerevisiones_obs() != null ? inre.getInrerevisiones_obs() : ""%>">&nbsp;
	<tr>
		<td>*UMP Recibidas
		<td><input type="text" id="inreumprecibidas_cal" value="<%=inre.getInreumprecibidas_cal()!= null ? inre.getInreumprecibidas_cal() : ""%>">&nbsp;
		<td><input type="text" id="inreumprecibidas_obs" value="<%=inre.getInreumprecibidas_obs() != null ? inre.getInreumprecibidas_cal() : ""%>">&nbsp;
	<tr>
		<td>*UMP Revisadas
		<td><input type="text" id="inreumprevisadas_cal" value="<%=inre.getInreumprevisadas_cal()!= null ? inre.getInreumprevisadas_cal() : ""%>">&nbsp;
		<td><input type="text" id="inreumprevisadas_obs" value="<%=inre.getInreumprevisadas_obs() != null ? inre.getInreumprevisadas_obs() : ""%>">&nbsp;
	<tr>
		<td>*Tabla Nutricional
		<td><input type="text" id="inretablanutricional_cal" value="<%=inre.getInretablanutricional_cal()!= null ? inre.getInretablanutricional_cal() : ""%>">&nbsp;
		<td><input type="text" id="inretablanutricional_obs" value="<%=inre.getInretablanutricional_obs() != null ? inre.getInretablanutricional_obs() : ""%>">&nbsp;
	<tr>
		<td>*Información Importación CINC
		<td><input type="text" id="inreimportacioncinc_cal" value="<%=inre.getInreimportacioncinc_cal()!= null ? inre.getInreimportacioncinc_cal() : ""%>">&nbsp;
		<td><input type="text" id="inreimportacioncinc_obs" value="<%=inre.getInreimportacioncinc_obs() != null ? inre.getInreimportacioncinc_obs() : ""%>">&nbsp;
	<tr>
		<td>Calificación/cumplimiento: SI Cumple; NO Cumple
		<td><input type="text" id="inrecalificacion_cal" value="<%=inre.getInrecalificacion_cal()!= null ? inre.getInrecalificacion_cal() : ""%>">&nbsp;
		<td><input type="text" id="inrecalificacion_obs" value="<%=inre.getInrecalificacion_obs() != null ? inre.getInrecalificacion_obs() : ""%>">&nbsp;
	
</table>		
<br>
<br>
<br>
<table align="center" border="0" width="80%">
	<tr>
		<td align="center"><input type="text" id="inrerecibido" value="<%=inre.getInrerecibido()!= null ? inre.getInrerecibido() : ""%>">&nbsp;<br>----------------------------<BR>
		RECIBIDO POR</td>
		<td align="center"><input type="text" id="inreconductor" value="<%=inre.getInreconductor()!= null ? inre.getInreconductor() : ""%>">&nbsp;<br>----------------------------<BR>
		Conductor&nbsp;<%=ct.getCtrafconductor()%>
	</tr>
</table>

</form>


<div align="center">

<button value="Generar PDF" onclick="generarpdf(<%=lctrafcodsx %>,<%=trafcodsx %>)" style="color: blue" >Generar PDF</button>
</div>

<br>
<div align="center">
	<table border="1" cellpadding="0" cellspacing="0" class="lista-home">
	   <caption> INSPECCION Version 2022-09-15: <%=request.getParameter("clave")%> </caption>
	    <tr>
	      <th> Archivo 
	      <th> Tamaño
	      <th> Fecha Creacion
	      <th colspan="2"> Opcion
	    </tr>
	<%
	String ruta = getServletContext().getRealPath("//") + File.separator + ruta_pdf + File.separator + tipoAdjunto + File.separator + clave + File.separator;
	String ruta_ver = request.getContextPath() + File.separator + ruta_pdf + File.separator + tipoAdjunto + File.separator + clave + File.separator;
	
	String elim = request.getParameter("eliminararchivo");
	if (elim!=null) {
		try {
	 		File f = new File(ruta + request.getParameter("nombrearchivo") );
	 f.delete();
	 }catch(Exception ex) {
	 ex.printStackTrace();
	 }
	}
	
	ShowFiles sf = new ShowFiles();
	File[] fs =  null;
	fs = sf.getListaArchivosGenerados( ruta);
	for(int i=0; fs!=null &&  i  <  fs.length ; i++) {
		File f = fs[i];
		String ruta_arch = ruta + f.getName();
		if(f.getName().equals("CVS")) continue;
	%>
	 
	<style>
	a.vClass:visited {color: red;} 
	a.vClass:hover {color: pink;} 
	a.vClass:active {color: orange;} 
	a.vClass:link {color: blue;} 
	</style>
	
	 <tr>
	      <td nowrap="nowrap"><%=f.getName() %>
	      <td nowrap="nowrap"><%= ( f.length() / 1000) %> Kb
	      <td nowrap="nowrap"><%= new Date( f.lastModified() )%>
	      <td nowrap="nowrap"><a href="<%= ruta_ver + f.getName()%>" target="_blank" class="vClass">Ver</a>
	      <td nowrap="nowrap"><a href='main.jsp?app=ingreso&modulo=inspeccion_recibo_pdf&clave=<%=clave%>&eliminararchivo=ok&nombrearchivo=<%=f.getName() %>'>Eliminar</a>
	    </tr>
	    
	<%
	}
	%>
	 </table>
</div>

</html>

