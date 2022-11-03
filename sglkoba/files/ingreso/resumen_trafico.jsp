<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import="java.util.*,ingreso.control.*, ingreso.entity.*, maestro.control.*, maestro.entity.*" %>  

		<%@page import="util.Math"%>
<%@page import="util.JhFormat"%>
<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 
  <%@ taglib uri="/WEB-INF/struts-bean.tld"  prefix="bean"%> 

		<div class="titulo"> Resumen / Impresion Trafico </div> 
		<br> 

<%   
gsttrafico gtraf = new gsttrafico();
gstcontenedor_trafico gcont = new gstcontenedor_trafico();
gstfactura_trafico gfact = new gstfactura_trafico();
gstreferencia_trafico gref = new gstreferencia_trafico();
gstcompania gcomp = new gstcompania();
gsttransportadora gtransp = new gsttransportadora();
gstproducto gprod = new gstproducto();
gstentrada gent = new  gstentrada();
String trafcodsx = request.getParameter("trafcodsx");
trafico entity = gtraf.gettrafico(trafcodsx);

compania comp = gcomp.getcompania(entity.gettrafcompania());
transportadora transp = gtransp.gettransportadora(entity.gettraftransportadora());
request.setAttribute("entity", entity);

%>		
		<table width="750" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td>
		
		<table width="750px" border="0" cellspacing="0" cellpadding="0" class="tabla_resumen">
        <caption>
        <b> Datos Generales </b> 
        </caption>
        <tr> 
          <td><strong>Codigo </strong> 
          <td><bean:write name="entity" property="trafcodsx"/> 
          <td><strong>Compania </strong> 
          <td> <%= comp.getcomcodsx() + "  "  + comp.getcomnombre() %> 
          <td><strong>Fecha Creacion </strong> 
          <td> <bean:write name="entity" property="traffechacreacion"/> &nbsp; 
        <tr> 
          <td><strong># Importación  </strong> 
          <td><bean:write name="entity" property="trafnumdta"/> &nbsp;
          <td><strong># BL</strong> 
          <td><bean:write name="entity" property="trafdocumento"/> &nbsp; 
          <td><strong>Recibo de Mercancía</strong>
          <td><bean:write name="entity" property="trafpedido"/> 
          
        <tr> 
          <td><strong>Procedencia </strong> 
          <td><bean:write name="entity" property="trafprocedencia"/> &nbsp; 
          <td><strong>Fecha Arribo Pto </strong> 
          <td> <bean:write name="entity" property="traffechaarribopuerto"/> &nbsp; 
          <td><strong>Origen</strong>
          <td> <bean:write name="entity" property="traforigen"/> &nbsp; 
        <tr> 
          <td><strong>Sobordo No </strong> 
          <td><bean:write name="entity" property="trafnumsobordo"/> &nbsp; 
          <td><strong>Fecha Sobordo</strong>
          <td><bean:write name="entity" property="traffechasobordo"/> 
          <td><strong>Fecha Descargue </strong> 
          <td><bean:write name="entity" property="traffechadescargue"/>
        <tr>       
          <td><strong>FOB </strong> 
          <td align="right"><%= JhFormat.getFormatedNumber( entity.gettraffob() ) %>&nbsp; USD 
          <td><strong>Fletes y seguro </strong> 
          <td align="right"><%= JhFormat.getFormatedNumber( entity.gettraffletesseguro() ) %>&nbsp; USD          
          <td><strong>CIF </strong> 
          <td align="right"><%= JhFormat.getFormatedNumber( entity.gettrafcif() ) %>&nbsp; USD
        <tr> 
          <td><strong>TRM </strong> 
          <td align="right">$ <%= JhFormat.getFormatedNumber( entity.gettraftrm() ) %>&nbsp; 
          <td><strong>Peso Neto</strong>
          <td align="right"><%= JhFormat.getFormatedNumber( entity.gettrafpesoneto() ) %>&nbsp; KGM
          <td><strong>Peso Bruto </strong> 
         <td align="right"><%=  JhFormat.getFormatedNumber(   entity.gettrafpesobruto()  ) %>&nbsp; KGM
        <tr> 
          <td><strong>Cia Transportadora </strong> 
          <td><%= transp == null ? "&nbsp;" : transp.gettranspnombre()  %> 
          <td><strong>Observaciones </strong> 
          <td colspan="5"><bean:write name="entity" property="trafobservaciones"/> 
            &nbsp; 
      </table>
		
 <br>		 <hr>		 <br>		
	<table align='center'  width='750px' border='0' cellspacing='0' cellpading='0' class="tabla_resumen">
        <caption> <b>         Facturas y Referencias </b>       </caption>
<tr align='center'> 
          		<td> 
        <%
          Collection facturas = gfact.getlistafactura_trafico(entity.gettrafcodsx());
          request.setAttribute("facturas", facturas);
          %>
          <logic:iterate id="fac" name="facturas" type="factura_trafico">

          		
          		<table align='center'  width='750px' border='0' cellspacing='0' cellpading='0' class="tabla_resumen">
        <caption>         <b>Factura:</b><bean:write name="fac" property="ftrafnumfactura"/>         </caption>
        <tr> 
          <th> Material 
          <th> Descripcion 
          <th> Serial
          <th>Cantidad UMP
          <th>Cantidad Ingresada
          <th>Diferencia
          <th>UMP x Estiba 
          <th>Peso Neto (unit) KGM 
          <th>Peso Neto (Total) KGM
          <th>Peso Bruto (unit) KGM
          <th>Peso Bruto (Total) KGM
          <th>FOB Unit USD
          <th>Fob TOT USD
          <th>CIF Unit USD
          <th>CIF TOT USD
         <%
         Collection referencias = gref.getlistareferencia_trafico(fac.getftrafcodsx()); 
         request.setAttribute("referencias", referencias);
         %> 
         <logic:iterate id="ref" name="referencias" type="referencia_trafico">
    	<tr>    
    	<% 
    	producto prod = gprod.getproducto(ref.getreftproducto());
    	String cantidadIngresada = gent.getCantIngresadaTrafico(entity.gettrafcodsx(), ref.getreftproducto());    	
    	String diferencia = "";
    	if (cantidadIngresada == null) {
    		cantidadIngresada = "0";
    	}
    	diferencia = Math.restar_bigdecimal (cantidadIngresada,ref.getreftcantidad()).toPlainString();
    	
    	%>
    		<td> <%= prod.getpromodelo() %> </td>
    		<td> <%= prod.getprodescripcion() %> </td>
    		<td>  <%=(ref.getreftserial()!=null)?ref.getreftserial():"-"%> </td>
    		<td align="right" > <%= JhFormat.getFormatedNumber(ref.getreftcantidad() ) %>  </td>
    		<td align="right" > <%= JhFormat.getFormatedNumber(cantidadIngresada ) %>  </td>
    		<td align="right" > <%= JhFormat.getFormatedNumber(diferencia) %>  </td>
    		<td align="right"> <%= JhFormat.getFormatedNumber(ref.getReftmpacks() ) %>  </td>
    		<td align="right"> <%= JhFormat.getFormatedNumber(ref.getreftpesoneto() ) %>  </td>
    		<td align="right"><%= JhFormat.getFormatedNumber(ref.getReftpesonetototal() ) %> </td>
    		<td align="right"><%= JhFormat.getFormatedNumber(ref.getreftpesobruto() ) %> </td>
    		<td align="right"><%= JhFormat.getFormatedNumber(ref.getReftpesobrutototal() ) %> </td>
    		<td align="right"><%= JhFormat.getFormatedNumber(ref.getreftfobunit() ) %> </td>
    		<td align="right"><%= JhFormat.getFormatedNumber(ref.getreftfobtotal() ) %> </td>
    		<td align="right"><%= JhFormat.getFormatedNumber( ref.getreftcifunit() ) %> </td>
    		<td align="right"><%= JhFormat.getFormatedNumber(ref.getreftciftotal() ) %> </td>
    		
          	</logic:iterate>
         </table>
         </logic:iterate> 
          </table>

		<br>
		<hr>
		<br>
		
		<table align='center' width="300px"  border='0' cellspacing='0' cellpading='0' class="tabla_resumen">
		<caption><b>Veh&iacute;culos </b> </caption>
        <tr> 
          <th> Placa 
          <th> Conductor 
          <th> C&eacute;dula 
          <th> Contenedor 
          <th> Tamano 
          <%
          Collection contenedores = gcont.getlistacontenedor_trafico(entity.gettrafcodsx());
          request.setAttribute("contenedores", contenedores);
          %>
          <logic:iterate id="temp" type="contenedor_trafico" name="contenedores">
        <tr align='center'> 
          <td> <bean:write name="temp" property="ctrafplaca"/> 
          <td> <bean:write name="temp" property="ctrafconductor"/> 
          <td> <bean:write name="temp" property="ctrafcedula"/> 
          <td> <bean:write name="temp" property="ctrafnumero"/> 
          <td> <bean:write name="temp" property="ctraftamano"/>  
          
          </logic:iterate>
      </table>

          
          
		<br><br>
	</td>
  </tr>
</table>
<br><br>
</HTML>