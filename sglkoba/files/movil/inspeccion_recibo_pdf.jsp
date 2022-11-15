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

function generarpdf(lctrafcodsx,trafcodsx,contenedor) { 
	
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
		"inretiponovedades": $("select[id='inretiponovedades']").val(),
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
		"inrefechagenerado": $("input[id='inrefechagenerado']").val(),
		"inreproducto": $("select[id='producto']").val(),
		"inrecontenedor": contenedor

	    },
	    cache: false,
	    type: "POST",
	    success: function(response) { 
			alert("Se ha generado el PDF de la inspecci�n, ya puede descargalo");
	    },
	    error: function(xhr) {

	    }
	});
}

function cambioProducto(producto, contenedor, trafico) {
	var miurl = "contenedorTraficoProducto.do?producto="+producto + "&contenedor="+contenedor+"&trafico="+trafico;

	$.ajax({
	    url: miurl,
	    cache: false,
	    type: "GET",
	    success: function(response) { 
			console.log(response)
		$("input[id='inremuelle']").val(response.inremuelle),
		$("input[id='inreprecinto']").val(response.inreprecinto),
		$("input[id='inrevencimiento']").val(response.inrevencimiento),
		$("input[id='inrelote']").val(response.inrelote),
		$("input[id='inreestibas']").val(response.inreestibas),
		$("input[id='inrecajas']").val(response.inrecajas),
		$("input[id='inresaldo']").val(response.inresaldo),
		$("select[id='inretiponovedades']").val(response.inretiponovedades),
		$("input[id='inrenovedades']").val(response.inrenovedades),
		$("input[id='inrerecuperadas']").val(response.inrerecuperadas),
		$("input[id='inretotalump']").val(response.inretotalump),
		$("input[id='inreesibasrequeridas']").val(response.inreesibasrequeridas),
		$("input[id='inrepesoestibavacia']").val(response.inrepesoestibavacia),
		$("input[id='inrepesototalestibasvacias']").val(response.inrepesototalestibasvacias),
		$("input[id='inrepesoestibapaletizada']").val(response.inrepesoestibapaletizada),
		$("input[id='inrepesoporump']").val(response.inrepesoporump),
		$("input[id='inrepesonetoproducto']").val(response.inrepesonetoproducto),
		$("input[id='inreobservaciones']").val(response.inreobservaciones),
		$("input[id='inrearlvigente_cal']").val(response.inrearlvigente_cal),
		$("input[id='inrearlvigente_obs']").val(response.inrearlvigente_obs),
		$("input[id='inrecarnet_cal']").val(response.inrecarnet_cal),
		$("input[id='inrecarnet_obs']").val(response.inrecarnet_obs),
		$("input[id='inreproteccion_cal']").val(response.inreproteccion_cal),
		$("input[id='inreproteccion_obs']").val(response.inreproteccion_obs),
		$("input[id='inrefumigacion_cal']").val(response.inrefumigacion_cal),
		$("input[id='inrefumigacion_obs']").val(response.inrefumigacion_obs),
		$("input[id='inremanipulacion_cal']").val(response.inremanipulacion_cal),
		$("input[id='inremanipulacion_obs']").val(response.inremanipulacion_obs),
		$("input[id='inreaseovehiculo_cal']").val(response.inreaseovehiculo_cal),
		$("input[id='inreaseovehiculo_obs']").val(response.inreaseovehiculo_obs),
		$("input[id='inresustanciasquimicas_cal']").val(response.inresustanciasquimicas_cal),
		$("input[id='inresustanciasquimicas_obs']").val(response.inresustanciasquimicas_obs),
		$("input[id='inretemperatura_cal']").val(response.inretemperatura_cal),
		$("input[id='inretemperatura_obs']").val(response.inretemperatura_obs),
		$("input[id='inreestadogeneral_cal']").val(response.inreestadogeneral_cal),
		$("input[id='inreestadogeneral_obs']").val(response.inreestadogeneral_obs),
		$("input[id='inrerevisiones_cal']").val(response.inrerevisiones_cal),
		$("input[id='inrerevisiones_obs']").val(response.inrerevisiones_obs),
		$("input[id='inreumprecibidas_cal']").val(response.inreumprecibidas_cal),
		$("input[id='inreumprecibidas_obs']").val(response.inreumprecibidas_obs),
		$("input[id='inreumprevisadas_cal']").val(response.inreumprevisadas_cal),
		$("input[id='inreumprevisadas_obs']").val(response.inreumprevisadas_obs),
		$("input[id='inretablanutricional_cal']").val(response.inretablanutricional_cal),
		$("input[id='inretablanutricional_obs']").val(response.inretablanutricional_obs),
		$("input[id='inreimportacioncinc_cal']").val(response.inreimportacioncinc_cal),
		$("input[id='inreimportacioncinc_obs']").val(response.inreimportacioncinc_obs),
		$("input[id='inrecalificacion_cal']").val(response.inrecalificacion_cal),
		$("input[id='inrecalificacion_obs']").val(response.inrecalificacion_obs),
		$("input[id='inrerecibido']").val(response.inrerecibido),
		$("input[id='inreconductor']").val(response.inreconductor),
		$("input[id='inrefechagenerado']").val(response.inrefechagenerado)
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
request.setAttribute("listPro", listPro); 

for(Object obj: listCt) {
	lote_contenedor_trafico lct = (lote_contenedor_trafico)obj;
	lote_trafico lt = glt.getlote_trafico(lct.getlctraflote());
	producto prod = gprod.getproducto(lt.getltrafcodproducto());
	listPro.add(prod);
}

contenedor_trafico ct = gcont.getcontenedor_trafico(contenedor);

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
		<td colspan="3"><input type="text" name="inremuelle" id="inremuelle" value="">&nbsp;

	<tr>
		<td>Fecha
		<td><%=ct.getctrafiniciodescargue() != null ? ct.getctrafiniciodescargue():""%>&nbsp;
		<td>No. Precinto
		<td><input type="text" id="inreprecinto" value="">&nbsp;
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
		<td colspan="3"><input type="date" id="inrevencimiento" value="">
	<tr>
		<td>Lote
		<td colspan="3"><input type="text" id="inrelote" value="">
	<tr>
		<td>Estibas
		<td><input type="number" id="inreestibas" value="">&nbsp;
		<td>Cajas
		<td><input type="number" id="inrecajas" value="">
	<tr>
		<td>Saldo
		<td colspan="3"><input type="number" id="inresaldo" value="">&nbsp;
	<tr>
		<td>Tipo Novedad
		<td>
		<select id="inretiponovedades">
			<option value="" onselect="">Seleccione</option>
			<option value="Averia">Averia</option>
			<option value="Sobrante">Sobrante</option>
			<option value="Faltante">Faltante</option>
			<option value="Discrepancia">Discrepancia</option>
		</select>
		<td>Novedad
		<td>
		<input type="number" id="inrenovedades" value="">
		&nbsp;	
	<tr>
		<td>Recuparadas
		<td colspan="3"><input type="number" id="inrerecuperadas" value="">&nbsp;
	<tr>
		<td>TOTAL UMP
		<td colspan="3"><input type="number" id="inretotalump" value="">&nbsp;
	<tr>
		<td>Estibas Requeridas
		<td colspan="3"><input type="number" id="inreesibasrequeridas" value="">&nbsp;
	<tr>
		<td>Peso Estiba Vacia	
		<td colspan="3"><input type="number" id="inrepesoestibavacia" value="">&nbsp;					
	<tr>
		<td>Peso Total Estibas Vacias
		<td colspan="3"><input type="number" id="inrepesototalestibasvacias" value="">&nbsp;
	<tr>
		<td>Peso estiba Paletizada
		<td colspan="3"><input type="number" id="inrepesoestibapaletizada" value="">&nbsp;				
	<tr>
		<td>Peso por UMP
		<td colspan="3"><input type="number" id="inrepesoporump" value="">&nbsp;	
	<tr>
		<td>PESO NETO PRODUCTO
		<td colspan="3"><input type="number" id="inrepesonetoproducto" value="">&nbsp;				
	<tr>
		<td>OBSERVACIONES
		<td colspan="3"><input type="text" id="inreobservaciones" value="">&nbsp;			
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
		<td><input type="text" id="inrearlvigente_cal" value="">&nbsp;
		<td><input type="text" id="inrearlvigente_obs" value="">&nbsp;
	<tr>
		<td>El personal de descargue cuenta con Carn� de manipulaci�n de ...
		<td><input type="text" id="inrecarnet_cal" value="">&nbsp;
		<td><input type="text" id="inrecarnet_obs" value="">&nbsp;
	<tr>
		<td>El personal de descargue usa los elementos de protecci�n personal
		<td><input type="text" id="inreproteccion_cal" value="">&nbsp;
		<td><input type="text" id="inreproteccion_obs" value="">&nbsp;
	<tr>
		<td>El veh�culo cuenta con certificado de fumigaci�n no menor a...
		<td><input type="text" id="inrefumigacion_cal" value="">&nbsp;
		<td><input type="text" id="inrefumigacion_obs" value="">&nbsp;
	<tr>
		<td>El personal de descargue cuenta con Carn� de manipulaci�n de alimentos vigente
		<td><input type="text" id="inremanipulacion_cal" value="">&nbsp;
		<td><input type="text" id="inremanipulacion_obs" value="">&nbsp;
	<tr>
		<td>El piso, techo y paredes del veh�culo se encuentran limpias y en buen estado
		<td><input type="text" id="inreaseovehiculo_cal" value="">&nbsp;
		<td><input type="text" id="inreaseovehiculo_obs" value="">&nbsp;
	<tr>
		<td>El veh�culo contiene materiales extra�os o sustancias qu�micas 
		<td><input type="text" id="inresustanciasquimicas_cal" value="">&nbsp;
		<td><input type="text" id="inresustanciasquimicas_obs" value="">&nbsp;
	<tr>
		<td>Si el veh�culo tiene thermoking registra la temperatura de llegada
		<td><input type="text" id="inretemperatura_cal" value="">&nbsp;
		<td><input type="text" id="inretemperatura_obs" value="">&nbsp;
	<tr>
		<td>Estado General del producto
		<td><input type="text" id="inreestadogeneral_cal" value="">&nbsp;
		<td><input type="text" id="inreestadogeneral_obs" value="">&nbsp;
	<tr>
		<td>Revisiones aleatorias efectuadas
		<td><input type="text" id="inrerevisiones_cal" value="">&nbsp;
		<td><input type="text" id="inrerevisiones_obs" value="">&nbsp;
	<tr>
		<td>*UMP Recibidas
		<td><input type="text" id="inreumprecibidas_cal" value="">&nbsp;
		<td><input type="text" id="inreumprecibidas_obs" value="">&nbsp;
	<tr>
		<td>*UMP Revisadas
		<td><input type="text" id="inreumprevisadas_cal" value="">&nbsp;
		<td><input type="text" id="inreumprevisadas_obs" value="">&nbsp;
	<tr>
		<td>*Tabla Nutricional
		<td><input type="text" id="inretablanutricional_cal" value="">&nbsp;
		<td><input type="text" id="inretablanutricional_obs" value="">&nbsp;
	<tr>
		<td>*Informaci�n Importaci�n CINC
		<td><input type="text" id="inreimportacioncinc_cal" value="">&nbsp;
		<td><input type="text" id="inreimportacioncinc_obs" value="">&nbsp;
	<tr>
		<td>Calificaci�n/cumplimiento: SI Cumple; NO Cumple
		<td><input type="text" id="inrecalificacion_cal" value="">&nbsp;
		<td><input type="text" id="inrecalificacion_obs" value="">&nbsp;
	
</table>		
<br>
<br>
<br>
<table align="center" border="0" width="80%">
	<tr>
		<td align="center"><input type="text" id="inrerecibido" value="">&nbsp;<br>----------------------------<BR>
		RECIBIDO POR</td>
		<td align="center"><input type="text" id="inreconductor" value="">&nbsp;<br>----------------------------<BR>
		Conductor&nbsp;<%=ct.getCtrafconductor()%>
	</tr>
</table>

</form>

<body>
    <p>Firmar a continuaci�n:</p>
    <canvas id="canvas"></canvas>
    <br>
    <button id="btnLimpiar">Limpiar</button>
    <button id="btnDescargar">Firmar</button>
    <br>
    <script src="script.js"></script>
</body>

<div align="center">

<button value="Generar PDF" onclick="generarpdf(<%=lctrafcodsx %>,<%=trafcodsx %>,<%=contenedor %>)" style="color: blue" >Generar PDF</button>
</div>

<br>
<div align="center">
	<table border="1" cellpadding="0" cellspacing="0" class="lista-home">
	   <caption> INSPECCION Version 2022-09-15: <%=request.getParameter("clave")%> </caption>
	    <tr>
	      <th> Archivo 
	      <th> Tama�o
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

<script>

const $canvas = document.querySelector("#canvas"),
    $btnDescargar = document.querySelector("#btnDescargar"),
    $btnLimpiar = document.querySelector("#btnLimpiar");

const contexto = $canvas.getContext("2d");
const COLOR_PINCEL = "black";
const COLOR_FONDO = "white";
const GROSOR = 2;
let xAnterior = 0, yAnterior = 0, xActual = 0, yActual = 0;
const obtenerXReal = (clientX) => clientX - $canvas.getBoundingClientRect().left;
const obtenerYReal = (clientY) => clientY - $canvas.getBoundingClientRect().top;
let haComenzadoDibujo = false; // Bandera que indica si el usuario est� presionando el bot�n del mouse sin soltarlo


const limpiarCanvas = () => {
    // Colocar color blanco en fondo de canvas
    contexto.fillStyle = COLOR_FONDO;
    contexto.fillRect(0, 0, $canvas.width, $canvas.height);
};
limpiarCanvas();
$btnLimpiar.onclick = limpiarCanvas;
// Escuchar clic del bot�n para descargar el canvas
$btnDescargar.onclick = () => {
    const enlace = document.createElement('a');
    // El t�tulo
    enlace.download = "Firma.png";
    // Convertir la imagen a Base64 y ponerlo en el enlace
    enlace.href = $canvas.toDataURL();
    // Hacer click en �l
    enlace.click();
};

window.obtenerImagen = () => {
    return $canvas.toDataURL();
};


// Lo dem�s tiene que ver con pintar sobre el canvas en los eventos del mouse
$canvas.addEventListener("mousedown", evento => {
    // En este evento solo se ha iniciado el clic, as� que dibujamos un punto
    xAnterior = xActual;
    yAnterior = yActual;
    xActual = obtenerXReal(evento.clientX);
    yActual = obtenerYReal(evento.clientY);
    contexto.beginPath();
    contexto.fillStyle = COLOR_PINCEL;
    contexto.fillRect(xActual, yActual, GROSOR, GROSOR);
    contexto.closePath();
    // Y establecemos la bandera
    haComenzadoDibujo = true;
});

$canvas.addEventListener("mousemove", (evento) => {
    if (!haComenzadoDibujo) {
        return;
    }
    // El mouse se est� moviendo y el usuario est� presionando el bot�n, as� que dibujamos todo

    xAnterior = xActual;
    yAnterior = yActual;
    xActual = obtenerXReal(evento.clientX);
    yActual = obtenerYReal(evento.clientY);
    contexto.beginPath();
    contexto.moveTo(xAnterior, yAnterior);
    contexto.lineTo(xActual, yActual);
    contexto.strokeStyle = COLOR_PINCEL;
    contexto.lineWidth = GROSOR;
    contexto.stroke();
    contexto.closePath();
});
["mouseup", "mouseout"].forEach(nombreDeEvento => {
    $canvas.addEventListener(nombreDeEvento, () => {
        haComenzadoDibujo = false;
    });
});
</script>



</html>

