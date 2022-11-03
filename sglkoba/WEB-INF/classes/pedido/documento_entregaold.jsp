
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1" import ="nacionalizacion.entity.*, nacionalizacion.control.*, ingreso.control.*, ingreso.entity.*, java.util.*, administracion.control.gstpermiso, pedido.form.pedidoForm,pedido.control.*, maestro.control.*, maestro.entity.* " %>  

		<html> 
		<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

<%!

gstpedido gped = new gstpedido();
gstreferencia_pedido grefp = new gstreferencia_pedido();
gstcompania gcomp= new gstcompania();
gstproducto gprod = new gstproducto();
gstcliente gcli = new gstcliente();
gstsucursal gsuc = new gstsucursal();
gstciudad gciud = new gstciudad();
gstdepartamento gdep = new gstdepartamento();
gstbodega gbod = new gstbodega();
gstentrada gent = new gstentrada();
gstingreso ging = new gstingreso();
gsttrafico gtraf = new gsttrafico();

gstnacionalizacion gnac = new gstnacionalizacion();
gstnacionalizacion_detalle gnacdet = new gstnacionalizacion_detalle();


%>


<%
String pedcodsx = request.getParameter("pedcodsx");
String tipo = request.getParameter("tipo"); //puede ser DETALLADO  o RESUMIDO
tipo = tipo==null ? "DETALLADO" : tipo;

pedido.entity.pedido ped = gped.getpedido(pedcodsx);
cliente cli =  gcli.getcliente(ped.getpedcliente());
sucursal suc = gsuc.getsucursal( ped.getpedsucursal());
ciudad ciud = gciud.getciudad( ped.getpedciudad());
departamento dep = gdep.getdepartamento( ped.getpeddepartamento());
%>
<body>
<table width="96%" height="500" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr> 
    <td valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
        <tr align="center">
          <td colspan="2">Sistemas Logisticos Industriales<br>
              Zona Franca Palmaseca - Contiguo al Aeropuerto Alfonso Bonilla Aragon<br>
              Tel: (2)651 11 72 - Fax: 651 11 73               Cali 
            </td>
           <tr> 
          <td><b>Pedido No: </b><%= ped.getpednumpedido() %></td>
          <td align="right">Tipo Vista: <form action="main.jsp?app=pedido&modulo=documento_entrega&pedcodsx=<%=pedcodsx %>" method="post">
          	<select name="tipo" onchange="document.forms[0].submit();"> 
          		<option value="RESUMIDO" <%= tipo.equals("RESUMIDO") ? "selected" : "" %>>RESUMIDO</option>
          		<option value="DETALLADO" <%= tipo.equals("DETALLADO") ? "selected" : "" %>>DETALLADO</option>
          	</select>
          </form>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="pequeno">
      <caption>Datos Generales</caption>
        <tr> 
          <th width="25%">Fecha Pedido: <td width="25%"><%= ped.getpedfecha() %></td>
          <th width="25%"> Destinatario: <td width="25%"><%= suc.getsucnombre()%></td>
        </tr>
        <tr> 
          <th >&nbsp;<td>&nbsp;</td>
          <th>Telefono: <td><%= suc.getsuctelefono() %></td>
        </tr>
        <tr> 
          <th>No GUIA: <td><%= ped.getpedguia() %></td>
          <th>Direccion: <td><%= ped.getpeddireccion() %>
        </tr>
        <tr> 
          <th>Observacion<td><%= ped.getpedobservaciones() %>&nbsp;
          <th>Depto/Ciudad <td><%= dep.getdepnombre() %>/<%= ciud.getciunombre()  %></td>
        </tr>
      </table>
     
<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' class="tabla_resumen" > 
      <caption>Detalle del Pedido</caption>
        <tr> 
          <th>Producto</th>
          <th>Descripcion</th>
          <th>Atributos
          <th>Cantidad</th>
          <th>Mpack</th>
          <th>Kilo Volumen</th>
          <th>Peso Bruto KGM</th>
          <%if(tipo.equals("DETALLADO")) {%>
          <th class="">Bodegas, Posiciones y Documentos</th>
          <%} else { %>
          <th>Documentos
          <% } %>
        </tr>
        <% 
        Collection productos = grefp.getProductosPedido( pedcodsx);
        Iterator ite = productos.iterator();
        gstproducto_cliente gprocc = new gstproducto_cliente();
        String pesoneto_total ="0";
        String pesobruto_total ="0";
        while(ite.hasNext()) {
        Collection temp = (Collection) ite.next();
        Iterator ite_temp= temp.iterator();
        String refpproducto = (String)ite_temp.next();
        String cantidad = (String)ite_temp.next();
        String pesoneto_unit = (String)ite_temp.next();
        String pesobruto_unit = (String)ite_temp.next();
        
        producto prod = gprod.getproducto( refpproducto);
        String unid_mpack = prod.getprounimasterpac();
        String mpack = util.Math.dividir( cantidad, unid_mpack);
        
        
        String pesoneto_ref = util.Math.multiplicar( prod.getprokilovolumen() , cantidad );
        String pesobruto_ref = pesobruto_unit; //util.Math.multiplicar( pesobruto_unit, cantidad );
        System.out.println("------"+pesoneto_unit);
        pesoneto_total = util.Math.sumar( pesoneto_total, pesoneto_ref);
        pesobruto_total = util.Math.sumar( pesobruto_total, pesobruto_ref);
        
        %>
        
        
        <tr> 
          <td><%= prod.getpromodelo()  %>
          <td><%= prod.getprodescripcion() %>
          <td><%
	producto_cliente procc = gprocc.getproducto_cliente( cli.getclicodsx(), prod.getprocodsx());
          
          %>
          <font  size="1">
          EAN:<%= procc==null ?"N": procc.getprocean() %>. 
          TAG:<%= procc==null ?"N": procc.getproctag() %>. 
          GARANTIA:<%= procc==null ?"N": procc.getprocgarantia() %>.
          COD BARRA:<%= procc==null ?"N": procc.getprocodbarra() %> / <br>
          <%
          if(procc!=null && procc.getprocodbarra().equals("S")) {
          %>
          	<%= procc.getprocnumcodigobarra() %>
          <%} %>
          </font>
          <td align="right"><%=  cantidad %>
          <td align="right"><%=util.JhFormat.getFormatedNumber( mpack )%>
          <td align="right"><%= util.JhFormat.getFormatedNumber(pesoneto_ref) %>
          <td align="right"><%= util.JhFormat.getFormatedNumber(pesobruto_ref )%>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr class="pequeno"> 
              <%
              if(tipo.equals("DETALLADO")) {
                  //ES DETALLADO:
              %>
                <th width="31%">Bod
                <th width="35%">Pos
                <th align="right" width="34%">Cant
                <TH align="right">MPacks
                <th width="34%">Embarque
                <th width="34%">Doc Transporte
                <th width="34%">DEC
              </tr>
              <%
gstproducto gprod = new gstproducto();
                  Collection detalles = grefp.getlistareferencia_pedido(pedcodsx, refpproducto);
                  Iterator ite_det = detalles.iterator();

              while(ite_det.hasNext()) {
            	  pedido.entity.referencia_pedido refp = (pedido.entity.referencia_pedido) ite_det.next();
            	  bodega bod =gbod.getbodega( refp.getRefpbodega());
            	  entrada ent = gent.getentrada( refp.getRefpentrada());
            	  ingreso ing = ging.getingreso( ent.getentcodingreso());
            	 
            	  String embarque= "";
            	  String BL= "&nbsp;";
            	  String declaracion ="&nbsp;";
            	  if(ing.getingtipo().equals("TRAFICO")) {
            	  	trafico traf = gtraf.gettrafico( ing.getingtrafico());
            	  	embarque = traf.gettrafembarque();
            	  	BL= traf.gettrafdocumento();
            	  }else {
            		  embarque = "Ingreso de tipo: " + ing.getingtipo();
            	  }
            	  if(refp.getRefpnacdetalle()!=null && !refp.getRefpnacdetalle().equals(""))  {
            		  nacionalizacion_detalle nacdet = gnacdet.getnacionalizacion_detalle(refp.getRefpnacdetalle() );
            		 nacionalizacion nac = gnac.getnacionalizacion( nacdet.getnadcodnac());
            		  declaracion = nac.getnacdeclaracion();
            	  }
            	  
            	  
              %>
              <tr class="pequeno"> 
                <td><%= bod.getbodnombre() %></td>
                <td><%= refp.getrefpposicion() %></td>
                <td><%= util.JhFormat.getFormatedNumber( refp.getrefpcantidad()) %></td>
                <td align="right"><%= util.JhFormat.getFormatedNumber( util.Math.dividir_bigdecimal( refp.getrefpcantidad(), prod.getprounimasterpac() ).toPlainString() ) %>
                <td><%= embarque %>
                <td><%= BL %>
                <td><%= declaracion %>
              </tr>
              <% }  } else {
            	  //es RESUMIDO:
            	  %>
			<th> Emb
			<th> BL
			<th> Dec
			<th>Cant
			<%
   		 Collection embarques = gped.getEmbarquePorPedido(pedcodsx, refpproducto);
			Iterator ite_emb = embarques.iterator();
            while(ite_emb.hasNext()) {
			Collection datos = (Collection)ite_emb.next(); 
			Iterator ite_datos = datos.iterator();
			%>			
		<tr>
			<td> <%= ite_datos.next() %>
			<td><%= ite_datos.next() %>
			<td><%= ite_datos.next() %>
			<td><%= util.JhFormat.getFormatedNumber((String) ite_datos.next() )%>
			<% } %>			              
              <% } %>
            </table></td>
        </tr>
        <%} %>
        
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td><td>&nbsp;</td>
          <th>TOTAL</th>
          <th align="right"><%=  util.JhFormat.getFormatedNumber(pesoneto_total ) %></th>
          <th align="right"><%= util.JhFormat.getFormatedNumber( pesobruto_total )%></th>
          <td>&nbsp;</td>
        </tr>
      </table>
          Valor Declarado: $<%=util.JhFormat.getFormatedNumber( ped.getpedsubtotal()  )%>
 <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td>_________________________</td>
          <td>_________________________</td>
          <td>_________________________</td>
        </tr>
        <tr> 
          <td>Remite (Firma y Sello)</td>
          <td>Firma y Sello Transportadora</td>
          <td>Firma y Sello Destinatario</td>
        </tr>
      </table>

      NOTA: En caso de presentarse cualquier novedad con la documentacion y / o mercancia de entrega, favor comunicarse con OSTER
      al (092) 333 12 37 -38-41 . CEL 3155707261 </td>
  </tr>
</table>
</body>
