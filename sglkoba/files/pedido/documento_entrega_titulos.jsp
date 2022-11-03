
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import ="nacionalizacion.entity.*, nacionalizacion.control.*, ingreso.control.*, ingreso.entity.*, java.util.*, administracion.control.gstpermiso, pedido.form.pedidoForm,pedido.control.*, maestro.control.*, maestro.entity.* " %>  

<html> 
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
<%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

      	<caption>Detalle del Pedido</caption>
        <tr> 
         
          <%if(tipo.equals("DETALLADO")) {%>

          <th>Pos</th>
          <th>Producto</th>
          <th>Descripcion</th>
          <th>Cantidad x UMP</th>
          <th># Estibas</th>
          <th>Kilo Volumen</th>
          <th>Peso Bruto KGM</th>
		  <th>Bodega Origen</th>         	
          <th>Vencimiento Lote</th>
          <th>Lote</th>
          <th>BL</th>
          <th>DEC</th>
          
        
          <%//<th class="">Bodegas, Posiciones y Documentos</th>
		  } else { 
          %>
          <th>Producto</th>
          <th>Descripcion</th>
          <th>Cantidad x UMP</th>
          <th># Estibas</th>
          <th>Kilo Volumen</th>
          <th>Peso Bruto KGM</th>
		  	<th class=""> Lote</th>
			<th class=""> BL</th>
			<th class=""> Dec</th>
			<th class=""> Cantidad x UMP</th>
		<%
          //<th>Documentos
           } %>
        </tr>
