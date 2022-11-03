<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="maestro.control.*,maestro.entity.*,ingreso.control.*,ingreso.entity.*,java.util.*" %>

<%

String procodsx = request.getParameter("procodsx");
String bodcodsx = request.getParameter("bodega");
String campo = request.getParameter("campo");
String formulario = request.getParameter("formulario");

String tipo = request.getParameter("tipo");
if(tipo==null || ( tipo!=null && (!tipo.equals("NAC") && !tipo.equals("SNAC") && !tipo.equals("TODO")))) tipo = "TODO";

gstproducto gprod = new gstproducto();
gstcompania gcomp = new gstcompania();
gstentrada gent = new gstentrada();
gstbodega gbod = new gstbodega();
producto prod = gprod.getproducto(procodsx);
compania comp = null;
Collection posiciones =null; 
bodega bod = gbod.getbodega(bodcodsx);

if(prod!=null) {
	comp = gcomp.getcompania(prod.getprocodigocia());	 
	posiciones = gent.getListaPosicionesSaldo(procodsx, tipo, bodcodsx);
}



%>    

<%! 
private String getpixel(String posicion , Collection datos, String tipo ) {
	if(datos==null) return "";
	boolean tiene = datos.contains(posicion);
	return tiene ?tipo.equals("TODO") ? "_verde" : tipo.equals("NAC") ?  "_azul" : "_rojo" : "";
}

%>

<table width="715" cellpadding="0"  cellspacing="0"  border="1" bordercolor="#000000" >
  <tr> 
    <td align="center"> 
    <form name='saldo' action="mapa.jsp?bodega=<%= bodcodsx %>&campo=<%= campo %>&formulario=<%= formulario %>&procodsx=<%= procodsx %>" method="post" > 
    Bodega: <%= bod.getbodnombre() %> <br>
   <%if(comp!=null) { %> Compania: <%= comp.getcomnombre() %><br> <% }%>
  <% if(prod!=null) { %>  Producto: <%= prod.getpromodelo() + " - " + prod.getprodescripcion()%> <br> 
	Saldo Total: <%= gent.getSaldo(procodsx, tipo) %> <br>
	Tipo Saldo: <select name="tipo" onchange="document.forms[0].submit()"> 
		<option value="NAC" <%= tipo.equals("NAC")? "selected" : "" %> > NACIONALIZADO</option>
		<option value="SNAC" <%= tipo.equals("SNAC")? "selected" : "" %>>SIN NACIONALIZAR</option>
		<option value="TODO" <%= tipo.equals("TODO")? "selected" : "" %>>TODO</option>
	</select>
	<% } %>
	</form>
  <tr> 
    <td align="center"> 

<table cellpadding="0"  cellspacing="0"   >
  <tr valign="bottom"> 
    <td width="446"> <table width="100%" border="0" cellspacing="6" cellpadding="0">
        <tr> 
          <td> <table border="0" align="right" cellpadding="0" cellspacing="3" >
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                           <td><A href="javascript:pick('J41-5')"> <img src="./disenno/mapas/pixel<%= getpixel("J41-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('J41-4')"> <img src="./disenno/mapas/pixel<%= getpixel("J41-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('J41-3')"> <img src="./disenno/mapas/pixel<%= getpixel("J41-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('J41-2')"> <img src="./disenno/mapas/pixel<%= getpixel("J41-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('J41-1')"> <img src="./disenno/mapas/pixel<%= getpixel("J41-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						  </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                          <td><A href="javascript:pick('I41-5')"> <img src="./disenno/mapas/pixel<%= getpixel("I41-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('I41-4')"> <img src="./disenno/mapas/pixel<%= getpixel("I41-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('I41-3')"> <img src="./disenno/mapas/pixel<%= getpixel("I41-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('I41-2')"> <img src="./disenno/mapas/pixel<%= getpixel("I41-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('I41-1')"> <img src="./disenno/mapas/pixel<%= getpixel("I41-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						  </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                          <td><A href="javascript:pick('H41-5')"> <img src="./disenno/mapas/pixel<%= getpixel("H41-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('H41-4')"> <img src="./disenno/mapas/pixel<%= getpixel("H41-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('H41-3')"> <img src="./disenno/mapas/pixel<%= getpixel("H41-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('H41-2')"> <img src="./disenno/mapas/pixel<%= getpixel("H41-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('H41-1')"> <img src="./disenno/mapas/pixel<%= getpixel("H41-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						   </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                          <td><A href="javascript:pick('G41-5')"> <img src="./disenno/mapas/pixel<%= getpixel("G41-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('G41-4')"> <img src="./disenno/mapas/pixel<%= getpixel("G41-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('G41-3')"> <img src="./disenno/mapas/pixel<%= getpixel("G41-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('G41-2')"> <img src="./disenno/mapas/pixel<%= getpixel("G41-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('G41-1')"> <img src="./disenno/mapas/pixel<%= getpixel("G41-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						   </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('F41-5')"> <img src="./disenno/mapas/pixel<%= getpixel("F41-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('F41-4')"> <img src="./disenno/mapas/pixel<%= getpixel("F41-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('F41-3')"> <img src="./disenno/mapas/pixel<%= getpixel("F41-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('F41-2')"> <img src="./disenno/mapas/pixel<%= getpixel("F41-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('F41-1')"> <img src="./disenno/mapas/pixel<%= getpixel("F41-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						  </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('E41-5')"> <img src="./disenno/mapas/pixel<%= getpixel("E41-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('E41-4')"> <img src="./disenno/mapas/pixel<%= getpixel("E41-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('E41-3')"> <img src="./disenno/mapas/pixel<%= getpixel("E41-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('E41-2')"> <img src="./disenno/mapas/pixel<%= getpixel("E41-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('E41-1')"> <img src="./disenno/mapas/pixel<%= getpixel("E41-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						  </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('D41-5')"> <img src="./disenno/mapas/pixel<%= getpixel("D41-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('D41-4')"> <img src="./disenno/mapas/pixel<%= getpixel("D41-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('D41-3')"> <img src="./disenno/mapas/pixel<%= getpixel("D41-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('D41-2')"> <img src="./disenno/mapas/pixel<%= getpixel("D41-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('D41-1')"> <img src="./disenno/mapas/pixel<%= getpixel("D41-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						   </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('C41-5')"> <img src="./disenno/mapas/pixel<%= getpixel("C41-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('C41-4')"> <img src="./disenno/mapas/pixel<%= getpixel("C41-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('C41-3')"> <img src="./disenno/mapas/pixel<%= getpixel("C41-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('C41-2')"> <img src="./disenno/mapas/pixel<%= getpixel("C41-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('C41-1')"> <img src="./disenno/mapas/pixel<%= getpixel("C41-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						   </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('B41-5')"> <img src="./disenno/mapas/pixel<%= getpixel("B41-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('B41-4')"> <img src="./disenno/mapas/pixel<%= getpixel("B41-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('B41-3')"> <img src="./disenno/mapas/pixel<%= getpixel("B41-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('B41-2')"> <img src="./disenno/mapas/pixel<%= getpixel("B41-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('B41-1')"> <img src="./disenno/mapas/pixel<%= getpixel("B41-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						  </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('A41-5')"> <img src="./disenno/mapas/pixel<%= getpixel("A41-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('A41-4')"> <img src="./disenno/mapas/pixel<%= getpixel("A41-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('A41-3')"> <img src="./disenno/mapas/pixel<%= getpixel("A41-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('A41-2')"> <img src="./disenno/mapas/pixel<%= getpixel("A41-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('A41-1')"> <img src="./disenno/mapas/pixel<%= getpixel("A41-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						  </tr>
                        </table></td>
                      <td>41</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                          <td><A href="javascript:pick('J40-5')"> <img src="./disenno/mapas/pixel<%= getpixel("J40-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('J40-4')"> <img src="./disenno/mapas/pixel<%= getpixel("J40-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('J40-3')"> <img src="./disenno/mapas/pixel<%= getpixel("J40-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('J40-2')"> <img src="./disenno/mapas/pixel<%= getpixel("J40-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('J40-1')"> <img src="./disenno/mapas/pixel<%= getpixel("J40-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						 </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                          <td><A href="javascript:pick('I40-5')"> <img src="./disenno/mapas/pixel<%= getpixel("I40-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('I40-4')"> <img src="./disenno/mapas/pixel<%= getpixel("I40-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('I40-3')"> <img src="./disenno/mapas/pixel<%= getpixel("I40-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('I40-2')"> <img src="./disenno/mapas/pixel<%= getpixel("I40-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('I40-1')"> <img src="./disenno/mapas/pixel<%= getpixel("I40-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						 </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('H40-5')"> <img src="./disenno/mapas/pixel<%= getpixel("H40-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('H40-4')"> <img src="./disenno/mapas/pixel<%= getpixel("H40-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('H40-3')"> <img src="./disenno/mapas/pixel<%= getpixel("H40-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('H40-2')"> <img src="./disenno/mapas/pixel<%= getpixel("H40-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('H40-1')"> <img src="./disenno/mapas/pixel<%= getpixel("H40-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						 </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                             <td><A href="javascript:pick('G40-5')"> <img src="./disenno/mapas/pixel<%= getpixel("G40-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('G40-4')"> <img src="./disenno/mapas/pixel<%= getpixel("G40-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('G40-3')"> <img src="./disenno/mapas/pixel<%= getpixel("G40-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('G40-2')"> <img src="./disenno/mapas/pixel<%= getpixel("G40-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('G40-1')"> <img src="./disenno/mapas/pixel<%= getpixel("G40-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						</tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                             <td><A href="javascript:pick('F40-5')"> <img src="./disenno/mapas/pixel<%= getpixel("F40-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('F40-4')"> <img src="./disenno/mapas/pixel<%= getpixel("F40-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('F40-3')"> <img src="./disenno/mapas/pixel<%= getpixel("F40-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('F40-2')"> <img src="./disenno/mapas/pixel<%= getpixel("F40-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('F40-1')"> <img src="./disenno/mapas/pixel<%= getpixel("F40-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						 </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                             <td><A href="javascript:pick('E40-5')"> <img src="./disenno/mapas/pixel<%=getpixel("E40-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('E40-4')"> <img src="./disenno/mapas/pixel<%= getpixel("E40-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('E40-3')"> <img src="./disenno/mapas/pixel<%= getpixel("E40-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('E40-2')"> <img src="./disenno/mapas/pixel<%= getpixel("E40-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('E40-1')"> <img src="./disenno/mapas/pixel<%= getpixel("E40-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						</tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('D40-5')"> <img src="./disenno/mapas/pixel<%= getpixel("D40-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('D40-4')"> <img src="./disenno/mapas/pixel<%= getpixel("D40-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('D40-3')"> <img src="./disenno/mapas/pixel<%= getpixel("D40-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('D40-2')"> <img src="./disenno/mapas/pixel<%= getpixel("D40-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('D40-1')"> <img src="./disenno/mapas/pixel<%= getpixel("D40-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						</tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('C40-5')"> <img src="./disenno/mapas/pixel<%= getpixel("C40-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('C40-4')"> <img src="./disenno/mapas/pixel<%= getpixel("C40-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('C40-3')"> <img src="./disenno/mapas/pixel<%= getpixel("C40-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('C40-2')"> <img src="./disenno/mapas/pixel<%= getpixel("C40-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('C40-1')"> <img src="./disenno/mapas/pixel<%= getpixel("C40-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						</tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('B40-5')"> <img src="./disenno/mapas/pixel<%= getpixel("B40-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('B40-4')"> <img src="./disenno/mapas/pixel<%= getpixel("B40-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('B40-3')"> <img src="./disenno/mapas/pixel<%= getpixel("B40-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('B40-2')"> <img src="./disenno/mapas/pixel<%= getpixel("B40-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('B40-1')"> <img src="./disenno/mapas/pixel<%= getpixel("B40-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						</tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('A40-5')"> <img src="./disenno/mapas/pixel<%= getpixel("A40-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('A40-4')"> <img src="./disenno/mapas/pixel<%= getpixel("A40-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('A40-3')"> <img src="./disenno/mapas/pixel<%= getpixel("A40-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('A40-2')"> <img src="./disenno/mapas/pixel<%= getpixel("A40-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('A40-1')"> <img src="./disenno/mapas/pixel<%= getpixel("A40-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
						</tr>
                        </table></td>
                      <td>40</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                             <td><A href="javascript:pick('J39-5')"> <img src="./disenno/mapas/pixel<%= getpixel("J39-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('J39-4')"> <img src="./disenno/mapas/pixel<%= getpixel("J39-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('J39-3')"> <img src="./disenno/mapas/pixel<%= getpixel("J39-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('J39-2')"> <img src="./disenno/mapas/pixel<%= getpixel("J39-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('J39-1')"> <img src="./disenno/mapas/pixel<%= getpixel("J39-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
							</tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                             <td><A href="javascript:pick('I39-5')"> <img src="./disenno/mapas/pixel<%= getpixel("I39-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('I39-4')"> <img src="./disenno/mapas/pixel<%= getpixel("I39-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('I39-3')"> <img src="./disenno/mapas/pixel<%= getpixel("I39-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('I39-2')"> <img src="./disenno/mapas/pixel<%= getpixel("I39-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('I39-1')"> <img src="./disenno/mapas/pixel<%= getpixel("I39-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
							</tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('H39-5')"> <img src="./disenno/mapas/pixel<%= getpixel("H39-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('H39-4')"> <img src="./disenno/mapas/pixel<%= getpixel("H39-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('H39-3')"> <img src="./disenno/mapas/pixel<%= getpixel("H39-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('H39-2')"> <img src="./disenno/mapas/pixel<%= getpixel("H39-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('H39-1')"> <img src="./disenno/mapas/pixel<%= getpixel("H39-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
							 </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('G39-5')"> <img src="./disenno/mapas/pixel<%= getpixel("G39-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('G39-4')"> <img src="./disenno/mapas/pixel<%= getpixel("G39-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('G39-3')"> <img src="./disenno/mapas/pixel<%= getpixel("G39-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('G39-2')"> <img src="./disenno/mapas/pixel<%= getpixel("G39-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('G39-1')"> <img src="./disenno/mapas/pixel<%= getpixel("G39-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
							 </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('F39-5')"> <img src="./disenno/mapas/pixel<%= getpixel("F39-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('F39-4')"> <img src="./disenno/mapas/pixel<%= getpixel("F39-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('F39-3')"> <img src="./disenno/mapas/pixel<%= getpixel("F39-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('F39-2')"> <img src="./disenno/mapas/pixel<%= getpixel("F39-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('F39-1')"> <img src="./disenno/mapas/pixel<%= getpixel("F39-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
							 </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('E39-5')"> <img src="./disenno/mapas/pixel<%= getpixel("E39-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('E39-4')"> <img src="./disenno/mapas/pixel<%= getpixel("E39-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('E39-3')"> <img src="./disenno/mapas/pixel<%= getpixel("E39-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('E39-2')"> <img src="./disenno/mapas/pixel<%= getpixel("E39-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('E39-1')"> <img src="./disenno/mapas/pixel<%= getpixel("E39-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
							 </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                             <td><A href="javascript:pick('D39-5')"> <img src="./disenno/mapas/pixel<%= getpixel("D39-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('D39-4')"> <img src="./disenno/mapas/pixel<%= getpixel("D39-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('D39-3')"> <img src="./disenno/mapas/pixel<%= getpixel("D39-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('D39-2')"> <img src="./disenno/mapas/pixel<%= getpixel("D39-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('D39-1')"> <img src="./disenno/mapas/pixel<%= getpixel("D39-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
							</tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('C39-5')"> <img src="./disenno/mapas/pixel<%= getpixel("C39-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('C39-4')"> <img src="./disenno/mapas/pixel<%= getpixel("C39-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('C39-3')"> <img src="./disenno/mapas/pixel<%= getpixel("C39-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('C39-2')"> <img src="./disenno/mapas/pixel<%= getpixel("C39-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('C39-1')"> <img src="./disenno/mapas/pixel<%= getpixel("C39-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
							</tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('B39-5')"> <img src="./disenno/mapas/pixel<%= getpixel("B39-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('B39-4')"> <img src="./disenno/mapas/pixel<%= getpixel("B39-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('B39-3')"> <img src="./disenno/mapas/pixel<%= getpixel("B39-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('B39-2')"> <img src="./disenno/mapas/pixel<%= getpixel("B39-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('B39-1')"> <img src="./disenno/mapas/pixel<%= getpixel("B39-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
							 </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('A39-5')"> <img src="./disenno/mapas/pixel<%= getpixel("A39-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('A39-4')"> <img src="./disenno/mapas/pixel<%= getpixel("A39-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('A39-3')"> <img src="./disenno/mapas/pixel<%= getpixel("A39-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('A39-2')"> <img src="./disenno/mapas/pixel<%= getpixel("A39-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('A39-1')"> <img src="./disenno/mapas/pixel<%= getpixel("A39-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
							</tr>
                        </table></td>
                      <td>39</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
   							<td><A href="javascript:pick('J38-5')"> <img src="./disenno/mapas/pixel<%= getpixel("J38-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('J38-4')"> <img src="./disenno/mapas/pixel<%= getpixel("J38-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('J38-3')"> <img src="./disenno/mapas/pixel<%= getpixel("J38-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('J38-2')"> <img src="./disenno/mapas/pixel<%= getpixel("J38-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('J38-1')"> <img src="./disenno/mapas/pixel<%= getpixel("J38-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                                                    </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('I38-5')"> <img src="./disenno/mapas/pixel<%= getpixel("I38-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('I38-4')"> <img src="./disenno/mapas/pixel<%= getpixel("I38-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('I38-3')"> <img src="./disenno/mapas/pixel<%= getpixel("I38-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('I38-2')"> <img src="./disenno/mapas/pixel<%= getpixel("I38-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('I38-1')"> <img src="./disenno/mapas/pixel<%= getpixel("I38-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                          
                          </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
						    <td><A href="javascript:pick('H38-5')"> <img src="./disenno/mapas/pixel<%= getpixel("H38-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('H38-4')"> <img src="./disenno/mapas/pixel<%= getpixel("H38-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('H38-3')"> <img src="./disenno/mapas/pixel<%= getpixel("H38-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('H38-2')"> <img src="./disenno/mapas/pixel<%= getpixel("H38-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('H38-1')"> <img src="./disenno/mapas/pixel<%= getpixel("H38-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                                                    </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('G38-5')"> <img src="./disenno/mapas/pixel<%= getpixel("G38-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('G38-4')"> <img src="./disenno/mapas/pixel<%= getpixel("G38-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('G38-3')"> <img src="./disenno/mapas/pixel<%= getpixel("G38-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('G38-2')"> <img src="./disenno/mapas/pixel<%= getpixel("G38-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('G38-1')"> <img src="./disenno/mapas/pixel<%= getpixel("G38-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('F38-5')"> <img src="./disenno/mapas/pixel<%= getpixel("F38-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('F38-4')"> <img src="./disenno/mapas/pixel<%= getpixel("F38-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('F38-3')"> <img src="./disenno/mapas/pixel<%= getpixel("F38-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('F38-2')"> <img src="./disenno/mapas/pixel<%= getpixel("F38-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('F38-1')"> <img src="./disenno/mapas/pixel<%= getpixel("F38-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                          </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('E38-5')"> <img src="./disenno/mapas/pixel<%= getpixel("E38-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('E38-4')"> <img src="./disenno/mapas/pixel<%= getpixel("E38-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('E38-3')"> <img src="./disenno/mapas/pixel<%= getpixel("E38-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('E38-2')"> <img src="./disenno/mapas/pixel<%= getpixel("E38-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('E38-1')"> <img src="./disenno/mapas/pixel<%= getpixel("E38-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                          </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('D38-5')"> <img src="./disenno/mapas/pixel<%= getpixel("D38-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('D38-4')"> <img src="./disenno/mapas/pixel<%= getpixel("D38-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('D38-3')"> <img src="./disenno/mapas/pixel<%= getpixel("D38-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('D38-2')"> <img src="./disenno/mapas/pixel<%= getpixel("D38-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('D38-1')"> <img src="./disenno/mapas/pixel<%= getpixel("D38-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                          </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('C38-5')"> <img src="./disenno/mapas/pixel<%= getpixel("C38-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('C38-4')"> <img src="./disenno/mapas/pixel<%= getpixel("C38-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('C38-3')"> <img src="./disenno/mapas/pixel<%= getpixel("C38-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('C38-2')"> <img src="./disenno/mapas/pixel<%= getpixel("C38-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('C38-1')"> <img src="./disenno/mapas/pixel<%= getpixel("C38-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('B38-5')"> <img src="./disenno/mapas/pixel<%= getpixel("B38-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('B38-4')"> <img src="./disenno/mapas/pixel<%= getpixel("B38-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('B38-3')"> <img src="./disenno/mapas/pixel<%= getpixel("B38-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('B38-2')"> <img src="./disenno/mapas/pixel<%= getpixel("B38-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('B38-1')"> <img src="./disenno/mapas/pixel<%= getpixel("B38-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                          </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td><A href="javascript:pick('A38-5')"> <img src="./disenno/mapas/pixel<%= getpixel("A38-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('A38-4')"> <img src="./disenno/mapas/pixel<%= getpixel("A38-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('A38-3')"> <img src="./disenno/mapas/pixel<%= getpixel("A38-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('A38-2')"> <img src="./disenno/mapas/pixel<%= getpixel("A38-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                            <td><A href="javascript:pick('A38-1')"> <img src="./disenno/mapas/pixel<%= getpixel("A38-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> </A></td>
                          </tr>
                        </table></td>
                      <td>38</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" >
                    <tr> 
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td>5</td>
                            <td>4</td>
                            <td>3</td>
                            <td>2</td>
                            <td>1</td>
                          </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td>5</td>
                            <td>4</td>
                            <td>3</td>
                            <td>2</td>
                            <td>1</td>
                          </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td>5</td>
                            <td>4</td>
                            <td>3</td>
                            <td>2</td>
                            <td>1</td>
                          </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td>5</td>
                            <td>4</td>
                            <td>3</td>
                            <td>2</td>
                            <td>1</td>
                          </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td>5</td>
                            <td>4</td>
                            <td>3</td>
                            <td>2</td>
                            <td>1</td>
                          </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td>5</td>
                            <td>4</td>
                            <td>3</td>
                            <td>2</td>
                            <td>1</td>
                          </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td>5</td>
                            <td>4</td>
                            <td>3</td>
                            <td>2</td>
                            <td>1</td>
                          </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td>5</td>
                            <td>4</td>
                            <td>3</td>
                            <td>2</td>
                            <td>1</td>
                          </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td>5</td>
                            <td>4</td>
                            <td>3</td>
                            <td>2</td>
                            <td>1</td>
                          </tr>
                        </table></td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                          <tr> 
                            <td>5</td>
                            <td>4</td>
                            <td>3</td>
                            <td>2</td>
                            <td>1</td>
                          </tr>
                        </table></td>
                      <td><img src="./disenno/mapas/pixel.gif" width="17" height="35"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr align="center"> 
                      <td width="9%">J</td>
                      <td width="9%">I</td>
                      <td width="9%">H</td>
                      <td width="8%">G</td>
                      <td width="9%">F</td>
                      <td width="9%">E</td>
                      <td width="9%">D</td>
                      <td width="8%">C</td>
                      <td width="9%">B</td>
                      <td width="12%">A</td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr align="center"> 
                <td width="9%">K</td>
                <td width="9%">J</td>
                <td width="9%">I</td>
                <td width="9%">H</td>
                <td width="8%">G</td>
                <td width="9%">F</td>
                <td width="9%">E</td>
                <td width="9%">D</td>
                <td width="8%">C</td>
                <td width="9%">B</td>
                <td width="12%">A</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
              		  <td><a href="javascript:pick('K37')"><img src="./disenno/mapas/pixel<%= getpixel("K37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J37')"><img src="./disenno/mapas/pixel<%= getpixel("J37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I37')"><img src="./disenno/mapas/pixel<%= getpixel("I37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H37')"><img src="./disenno/mapas/pixel<%= getpixel("H37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G37')"><img src="./disenno/mapas/pixel<%= getpixel("G37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F37')"><img src="./disenno/mapas/pixel<%= getpixel("F37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E37')"><img src="./disenno/mapas/pixel<%= getpixel("E37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D37')"><img src="./disenno/mapas/pixel<%= getpixel("D37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C37')"><img src="./disenno/mapas/pixel<%= getpixel("C37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B37')"><img src="./disenno/mapas/pixel<%= getpixel("B37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A37')"><img src="./disenno/mapas/pixel<%= getpixel("A37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              	  <td>37</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
             		  <td><a href="javascript:pick('K36')"><img src="./disenno/mapas/pixel<%= getpixel("K36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J36')"><img src="./disenno/mapas/pixel<%= getpixel("J36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I36')"><img src="./disenno/mapas/pixel<%= getpixel("I36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H36')"><img src="./disenno/mapas/pixel<%= getpixel("H36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G36')"><img src="./disenno/mapas/pixel<%= getpixel("G36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F36')"><img src="./disenno/mapas/pixel<%= getpixel("F36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E36')"><img src="./disenno/mapas/pixel<%= getpixel("E36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D36')"><img src="./disenno/mapas/pixel<%= getpixel("D36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C36')"><img src="./disenno/mapas/pixel<%= getpixel("C36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B36')"><img src="./disenno/mapas/pixel<%= getpixel("B36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A36')"><img src="./disenno/mapas/pixel<%= getpixel("A36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              	  <td>36</td>
				  </tr>
              <tr> 
             		  <td><a href="javascript:pick('K35')"><img src="./disenno/mapas/pixel<%= getpixel("K35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J35')"><img src="./disenno/mapas/pixel<%= getpixel("J35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I35')"><img src="./disenno/mapas/pixel<%= getpixel("I35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H35')"><img src="./disenno/mapas/pixel<%= getpixel("H35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G35')"><img src="./disenno/mapas/pixel<%= getpixel("G35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F35')"><img src="./disenno/mapas/pixel<%= getpixel("F35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E35')"><img src="./disenno/mapas/pixel<%= getpixel("E35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D35')"><img src="./disenno/mapas/pixel<%= getpixel("D35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C35')"><img src="./disenno/mapas/pixel<%= getpixel("C35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B35')"><img src="./disenno/mapas/pixel<%= getpixel("B35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A35')"><img src="./disenno/mapas/pixel<%= getpixel("A35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              	   <td>35</td>
				   </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
              		  <td><a href="javascript:pick('K34')"><img src="./disenno/mapas/pixel<%= getpixel("K34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J34')"><img src="./disenno/mapas/pixel<%= getpixel("J34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I34')"><img src="./disenno/mapas/pixel<%= getpixel("I34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H34')"><img src="./disenno/mapas/pixel<%= getpixel("H34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G34')"><img src="./disenno/mapas/pixel<%= getpixel("G34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F34')"><img src="./disenno/mapas/pixel<%= getpixel("F34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E34')"><img src="./disenno/mapas/pixel<%= getpixel("E34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D34')"><img src="./disenno/mapas/pixel<%= getpixel("D34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C34')"><img src="./disenno/mapas/pixel<%= getpixel("C34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B34')"><img src="./disenno/mapas/pixel<%= getpixel("B34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A34')"><img src="./disenno/mapas/pixel<%= getpixel("A34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              	 <td>34</td>
              </tr>
              <tr> 
               		  <td><a href="javascript:pick('K33')"><img src="./disenno/mapas/pixel<%= getpixel("K33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J33')"><img src="./disenno/mapas/pixel<%= getpixel("J33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I33')"><img src="./disenno/mapas/pixel<%= getpixel("I33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H33')"><img src="./disenno/mapas/pixel<%= getpixel("H33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G33')"><img src="./disenno/mapas/pixel<%= getpixel("G33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F33')"><img src="./disenno/mapas/pixel<%= getpixel("F33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E33')"><img src="./disenno/mapas/pixel<%= getpixel("E33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D33')"><img src="./disenno/mapas/pixel<%= getpixel("D33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C33')"><img src="./disenno/mapas/pixel<%= getpixel("C33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B33')"><img src="./disenno/mapas/pixel<%= getpixel("B33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A33')"><img src="./disenno/mapas/pixel<%= getpixel("A33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              	  <td>33</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
              		  <td><a href="javascript:pick('K32')"><img src="./disenno/mapas/pixel<%= getpixel("K32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J32')"><img src="./disenno/mapas/pixel<%= getpixel("J32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I32')"><img src="./disenno/mapas/pixel<%= getpixel("I32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H32')"><img src="./disenno/mapas/pixel<%= getpixel("H32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G32')"><img src="./disenno/mapas/pixel<%= getpixel("G32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F32')"><img src="./disenno/mapas/pixel<%= getpixel("F32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E32')"><img src="./disenno/mapas/pixel<%= getpixel("E32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D32')"><img src="./disenno/mapas/pixel<%= getpixel("D32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C32')"><img src="./disenno/mapas/pixel<%= getpixel("C32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B32')"><img src="./disenno/mapas/pixel<%= getpixel("B32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A32')"><img src="./disenno/mapas/pixel<%= getpixel("A32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              	  <td>32</td>
              </tr>
              <tr> 
               		  <td><a href="javascript:pick('K31')"><img src="./disenno/mapas/pixel<%= getpixel("K31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J31')"><img src="./disenno/mapas/pixel<%= getpixel("J31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I31')"><img src="./disenno/mapas/pixel<%= getpixel("I31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H31')"><img src="./disenno/mapas/pixel<%= getpixel("H31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G31')"><img src="./disenno/mapas/pixel<%= getpixel("G31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F31')"><img src="./disenno/mapas/pixel<%= getpixel("F31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E31')"><img src="./disenno/mapas/pixel<%= getpixel("E31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D31')"><img src="./disenno/mapas/pixel<%= getpixel("D31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C31')"><img src="./disenno/mapas/pixel<%= getpixel("C31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B31')"><img src="./disenno/mapas/pixel<%= getpixel("B31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A31')"><img src="./disenno/mapas/pixel<%= getpixel("A31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              	 <td>31</td>
			   </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                      <td><a href="javascript:pick('K30')"><img src="./disenno/mapas/pixel<%= getpixel("K30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J30')"><img src="./disenno/mapas/pixel<%= getpixel("J30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I30')"><img src="./disenno/mapas/pixel<%= getpixel("I30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H30')"><img src="./disenno/mapas/pixel<%= getpixel("H30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G30')"><img src="./disenno/mapas/pixel<%= getpixel("G30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F30')"><img src="./disenno/mapas/pixel<%= getpixel("F30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E30')"><img src="./disenno/mapas/pixel<%= getpixel("E30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D30')"><img src="./disenno/mapas/pixel<%= getpixel("D30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C30')"><img src="./disenno/mapas/pixel<%= getpixel("C30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B30')"><img src="./disenno/mapas/pixel<%= getpixel("B30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A30')"><img src="./disenno/mapas/pixel<%= getpixel("A30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
               <td>30</td>
              </tr>
              <tr> 
                      <td><a href="javascript:pick('K29')"><img src="./disenno/mapas/pixel<%= getpixel("K29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J29')"><img src="./disenno/mapas/pixel<%= getpixel("J29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I29')"><img src="./disenno/mapas/pixel<%= getpixel("I29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H29')"><img src="./disenno/mapas/pixel<%= getpixel("H29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G29')"><img src="./disenno/mapas/pixel<%= getpixel("G29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F29')"><img src="./disenno/mapas/pixel<%= getpixel("F29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E29')"><img src="./disenno/mapas/pixel<%= getpixel("E29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D29')"><img src="./disenno/mapas/pixel<%= getpixel("D29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C29')"><img src="./disenno/mapas/pixel<%= getpixel("C29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B29')"><img src="./disenno/mapas/pixel<%= getpixel("B29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A29')"><img src="./disenno/mapas/pixel<%= getpixel("A29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              <td>29</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                      <td><a href="javascript:pick('K28')"><img src="./disenno/mapas/pixel<%= getpixel("K28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J28')"><img src="./disenno/mapas/pixel<%= getpixel("J28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I28')"><img src="./disenno/mapas/pixel<%= getpixel("I28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H28')"><img src="./disenno/mapas/pixel<%= getpixel("H28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G28')"><img src="./disenno/mapas/pixel<%= getpixel("G28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F28')"><img src="./disenno/mapas/pixel<%= getpixel("F28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E28')"><img src="./disenno/mapas/pixel<%= getpixel("E28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D28')"><img src="./disenno/mapas/pixel<%= getpixel("D28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C28')"><img src="./disenno/mapas/pixel<%= getpixel("C28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B28')"><img src="./disenno/mapas/pixel<%= getpixel("B28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A28')"><img src="./disenno/mapas/pixel<%= getpixel("A28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
               <td>28</td>
              </tr>
              <tr> 
                      <td><a href="javascript:pick('K27')"><img src="./disenno/mapas/pixel<%= getpixel("K27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J27')"><img src="./disenno/mapas/pixel<%= getpixel("J27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I27')"><img src="./disenno/mapas/pixel<%= getpixel("I27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H27')"><img src="./disenno/mapas/pixel<%= getpixel("H27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G27')"><img src="./disenno/mapas/pixel<%= getpixel("G27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F27')"><img src="./disenno/mapas/pixel<%= getpixel("F27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E27')"><img src="./disenno/mapas/pixel<%= getpixel("E27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D27')"><img src="./disenno/mapas/pixel<%= getpixel("D27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C27')"><img src="./disenno/mapas/pixel<%= getpixel("C27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B27')"><img src="./disenno/mapas/pixel<%= getpixel("B27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A27')"><img src="./disenno/mapas/pixel<%= getpixel("A27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
               <td>27</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                      <td><a href="javascript:pick('K26')"><img src="./disenno/mapas/pixel<%= getpixel("K26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J26')"><img src="./disenno/mapas/pixel<%= getpixel("J26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I26')"><img src="./disenno/mapas/pixel<%= getpixel("I26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H26')"><img src="./disenno/mapas/pixel<%= getpixel("H26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G26')"><img src="./disenno/mapas/pixel<%= getpixel("G26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F26')"><img src="./disenno/mapas/pixel<%= getpixel("F26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E26')"><img src="./disenno/mapas/pixel<%= getpixel("E26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D26')"><img src="./disenno/mapas/pixel<%= getpixel("D26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C26')"><img src="./disenno/mapas/pixel<%= getpixel("C26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B26')"><img src="./disenno/mapas/pixel<%= getpixel("B26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A26')"><img src="./disenno/mapas/pixel<%= getpixel("A26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              <td>26</td>
              </tr>
              <tr> 
                      <td><a href="javascript:pick('K25')"><img src="./disenno/mapas/pixel<%= getpixel("K25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J25')"><img src="./disenno/mapas/pixel<%= getpixel("J25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I25')"><img src="./disenno/mapas/pixel<%= getpixel("I25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H25')"><img src="./disenno/mapas/pixel<%= getpixel("H25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G25')"><img src="./disenno/mapas/pixel<%= getpixel("G25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F25')"><img src="./disenno/mapas/pixel<%= getpixel("F25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E25')"><img src="./disenno/mapas/pixel<%= getpixel("E25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D25')"><img src="./disenno/mapas/pixel<%= getpixel("D25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C25')"><img src="./disenno/mapas/pixel<%= getpixel("C25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B25')"><img src="./disenno/mapas/pixel<%= getpixel("B25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A25')"><img src="./disenno/mapas/pixel<%= getpixel("A25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              <td>25</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                      <td><a href="javascript:pick('K24')"><img src="./disenno/mapas/pixel<%= getpixel("K24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J24')"><img src="./disenno/mapas/pixel<%= getpixel("J24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I24')"><img src="./disenno/mapas/pixel<%= getpixel("I24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H24')"><img src="./disenno/mapas/pixel<%= getpixel("H24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G24')"><img src="./disenno/mapas/pixel<%= getpixel("G24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F24')"><img src="./disenno/mapas/pixel<%= getpixel("F24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E24')"><img src="./disenno/mapas/pixel<%= getpixel("E24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D24')"><img src="./disenno/mapas/pixel<%= getpixel("D24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C24')"><img src="./disenno/mapas/pixel<%= getpixel("C24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B24')"><img src="./disenno/mapas/pixel<%= getpixel("B24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A24')"><img src="./disenno/mapas/pixel<%= getpixel("A24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              <td>24</td>
              </tr>
              <tr> 
                      <td><a href="javascript:pick('K23')"><img src="./disenno/mapas/pixel<%= getpixel("K23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J23')"><img src="./disenno/mapas/pixel<%= getpixel("J23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I23')"><img src="./disenno/mapas/pixel<%= getpixel("I23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H23')"><img src="./disenno/mapas/pixel<%= getpixel("H23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G23')"><img src="./disenno/mapas/pixel<%= getpixel("G23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F23')"><img src="./disenno/mapas/pixel<%= getpixel("F23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E23')"><img src="./disenno/mapas/pixel<%= getpixel("E23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D23')"><img src="./disenno/mapas/pixel<%= getpixel("D23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C23')"><img src="./disenno/mapas/pixel<%= getpixel("C23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B23')"><img src="./disenno/mapas/pixel<%= getpixel("B23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A23')"><img src="./disenno/mapas/pixel<%= getpixel("A23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              <td>23</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                      <td><a href="javascript:pick('K22')"><img src="./disenno/mapas/pixel<%= getpixel("K22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J22')"><img src="./disenno/mapas/pixel<%= getpixel("J22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I22')"><img src="./disenno/mapas/pixel<%= getpixel("I22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H22')"><img src="./disenno/mapas/pixel<%= getpixel("H22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G22')"><img src="./disenno/mapas/pixel<%= getpixel("G22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F22')"><img src="./disenno/mapas/pixel<%= getpixel("F22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E22')"><img src="./disenno/mapas/pixel<%= getpixel("E22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D22')"><img src="./disenno/mapas/pixel<%= getpixel("D22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C22')"><img src="./disenno/mapas/pixel<%= getpixel("C22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B22')"><img src="./disenno/mapas/pixel<%= getpixel("B22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A22')"><img src="./disenno/mapas/pixel<%= getpixel("A22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
             <td>22</td>
              </tr>
              <tr> 
                      <td><a href="javascript:pick('K21')"><img src="./disenno/mapas/pixel<%= getpixel("K21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J21')"><img src="./disenno/mapas/pixel<%= getpixel("J21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H21')"><img src="./disenno/mapas/pixel<%= getpixel("H21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G21')"><img src="./disenno/mapas/pixel<%= getpixel("G21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F21')"><img src="./disenno/mapas/pixel<%= getpixel("F21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E21')"><img src="./disenno/mapas/pixel<%= getpixel("E21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D21')"><img src="./disenno/mapas/pixel<%= getpixel("D21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C21')"><img src="./disenno/mapas/pixel<%= getpixel("C21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B21')"><img src="./disenno/mapas/pixel<%= getpixel("B21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A21')"><img src="./disenno/mapas/pixel<%= getpixel("A21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              <td>21</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                      <td><a href="javascript:pick('K20')"><img src="./disenno/mapas/pixel<%= getpixel("K20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J20')"><img src="./disenno/mapas/pixel<%= getpixel("J20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I20')"><img src="./disenno/mapas/pixel<%= getpixel("I20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H20')"><img src="./disenno/mapas/pixel<%= getpixel("H20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G20')"><img src="./disenno/mapas/pixel<%= getpixel("G20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F20')"><img src="./disenno/mapas/pixel<%= getpixel("F20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E20')"><img src="./disenno/mapas/pixel<%= getpixel("E20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D20')"><img src="./disenno/mapas/pixel<%= getpixel("D20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C20')"><img src="./disenno/mapas/pixel<%= getpixel("C20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B20')"><img src="./disenno/mapas/pixel<%= getpixel("B20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A20')"><img src="./disenno/mapas/pixel<%= getpixel("A20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              <td>20</td>
              </tr>
              <tr> 
                      <td><a href="javascript:pick('K19')"><img src="./disenno/mapas/pixel<%= getpixel("K19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J19')"><img src="./disenno/mapas/pixel<%= getpixel("J19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I19')"><img src="./disenno/mapas/pixel<%= getpixel("I19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H19')"><img src="./disenno/mapas/pixel<%= getpixel("H19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G19')"><img src="./disenno/mapas/pixel<%= getpixel("G19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F19')"><img src="./disenno/mapas/pixel<%= getpixel("F19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E19')"><img src="./disenno/mapas/pixel<%= getpixel("E19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D19')"><img src="./disenno/mapas/pixel<%= getpixel("D19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C19')"><img src="./disenno/mapas/pixel<%= getpixel("C19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B19')"><img src="./disenno/mapas/pixel<%= getpixel("B19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A19')"><img src="./disenno/mapas/pixel<%= getpixel("A19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
               <td>19</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr align="center"> 
                <td width="9%">K</td>
                <td width="9%">J</td>
                <td width="9%">I</td>
                <td width="9%">H</td>
                <td width="8%">G</td>
                <td width="9%">F</td>
                <td width="9%">E</td>
                <td width="9%">D</td>
                <td width="8%">C</td>
                <td width="9%">B</td>
                <td width="12%">A</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr>  
                      <td><a href="javascript:pick('K18')"><img src="./disenno/mapas/pixel<%= getpixel("K18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J18')"><img src="./disenno/mapas/pixel<%= getpixel("J18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I18')"><img src="./disenno/mapas/pixel<%= getpixel("I18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H18')"><img src="./disenno/mapas/pixel<%= getpixel("H18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G18')"><img src="./disenno/mapas/pixel<%= getpixel("G18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F18')"><img src="./disenno/mapas/pixel<%= getpixel("F18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E18')"><img src="./disenno/mapas/pixel<%= getpixel("E18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D18')"><img src="./disenno/mapas/pixel<%= getpixel("D18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C18')"><img src="./disenno/mapas/pixel<%= getpixel("C18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B18')"><img src="./disenno/mapas/pixel<%= getpixel("B18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A18')"><img src="./disenno/mapas/pixel<%= getpixel("A18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
               <td>18</td>
              </tr>
              <tr> 
                      <td><a href="javascript:pick('K17')"><img src="./disenno/mapas/pixel<%= getpixel("K17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J17')"><img src="./disenno/mapas/pixel<%= getpixel("J17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I17')"><img src="./disenno/mapas/pixel<%= getpixel("I17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H17')"><img src="./disenno/mapas/pixel<%= getpixel("H17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G17')"><img src="./disenno/mapas/pixel<%= getpixel("G17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F17')"><img src="./disenno/mapas/pixel<%= getpixel("F17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E17')"><img src="./disenno/mapas/pixel<%= getpixel("E17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D17')"><img src="./disenno/mapas/pixel<%= getpixel("D17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C17')"><img src="./disenno/mapas/pixel<%= getpixel("C17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B17')"><img src="./disenno/mapas/pixel<%= getpixel("B17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A17')"><img src="./disenno/mapas/pixel<%= getpixel("A17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
               <td>17</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                      <td><a href="javascript:pick('K16')"><img src="./disenno/mapas/pixel<%= getpixel("K16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J16')"><img src="./disenno/mapas/pixel<%= getpixel("J16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I16')"><img src="./disenno/mapas/pixel<%= getpixel("I16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H16')"><img src="./disenno/mapas/pixel<%= getpixel("H16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G16')"><img src="./disenno/mapas/pixel<%= getpixel("G16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F16')"><img src="./disenno/mapas/pixel<%= getpixel("F16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E16')"><img src="./disenno/mapas/pixel<%= getpixel("E16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D16')"><img src="./disenno/mapas/pixel<%= getpixel("D16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C16')"><img src="./disenno/mapas/pixel<%= getpixel("C16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B16')"><img src="./disenno/mapas/pixel<%= getpixel("B16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A16')"><img src="./disenno/mapas/pixel<%= getpixel("A16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
               <td>16</td>
              </tr>
              <tr> 
                      <td><a href="javascript:pick('K15')"><img src="./disenno/mapas/pixel<%= getpixel("K15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J15')"><img src="./disenno/mapas/pixel<%= getpixel("J15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I15')"><img src="./disenno/mapas/pixel<%= getpixel("I15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H15')"><img src="./disenno/mapas/pixel<%= getpixel("H15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G15')"><img src="./disenno/mapas/pixel<%= getpixel("G15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F15')"><img src="./disenno/mapas/pixel<%= getpixel("F15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E15')"><img src="./disenno/mapas/pixel<%= getpixel("E15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D15')"><img src="./disenno/mapas/pixel<%= getpixel("D15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C15')"><img src="./disenno/mapas/pixel<%= getpixel("C15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B15')"><img src="./disenno/mapas/pixel<%= getpixel("B15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A15')"><img src="./disenno/mapas/pixel<%= getpixel("A15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              <td>15</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                      <td><a href="javascript:pick('K14')"><img src="./disenno/mapas/pixel<%= getpixel("K14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J14')"><img src="./disenno/mapas/pixel<%= getpixel("J14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I14')"><img src="./disenno/mapas/pixel<%= getpixel("I14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H14')"><img src="./disenno/mapas/pixel<%= getpixel("H14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G14')"><img src="./disenno/mapas/pixel<%= getpixel("G14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F14')"><img src="./disenno/mapas/pixel<%= getpixel("F14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E14')"><img src="./disenno/mapas/pixel<%= getpixel("E14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D14')"><img src="./disenno/mapas/pixel<%= getpixel("D14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C14')"><img src="./disenno/mapas/pixel<%= getpixel("C14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B14')"><img src="./disenno/mapas/pixel<%= getpixel("B14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A14')"><img src="./disenno/mapas/pixel<%= getpixel("A14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
               <td>14</td>
              </tr>
              <tr> 
                      <td><a href="javascript:pick('K13')"><img src="./disenno/mapas/pixel<%= getpixel("K13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J13')"><img src="./disenno/mapas/pixel<%= getpixel("J13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I13')"><img src="./disenno/mapas/pixel<%= getpixel("I13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H13')"><img src="./disenno/mapas/pixel<%= getpixel("H13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G13')"><img src="./disenno/mapas/pixel<%= getpixel("G13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F13')"><img src="./disenno/mapas/pixel<%= getpixel("F13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E13')"><img src="./disenno/mapas/pixel<%= getpixel("E13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D13')"><img src="./disenno/mapas/pixel<%= getpixel("D13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C13')"><img src="./disenno/mapas/pixel<%= getpixel("C13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B13')"><img src="./disenno/mapas/pixel<%= getpixel("B13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A13')"><img src="./disenno/mapas/pixel<%= getpixel("A13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              <td>13</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                      <td><a href="javascript:pick('K12')"><img src="./disenno/mapas/pixel<%= getpixel("K12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J12')"><img src="./disenno/mapas/pixel<%= getpixel("J12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I12')"><img src="./disenno/mapas/pixel<%= getpixel("I12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H12')"><img src="./disenno/mapas/pixel<%= getpixel("H12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G12')"><img src="./disenno/mapas/pixel<%= getpixel("G12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F12')"><img src="./disenno/mapas/pixel<%= getpixel("F12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E12')"><img src="./disenno/mapas/pixel<%= getpixel("E12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D12')"><img src="./disenno/mapas/pixel<%= getpixel("D12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C12')"><img src="./disenno/mapas/pixel<%= getpixel("C12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B12')"><img src="./disenno/mapas/pixel<%= getpixel("B12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A12')"><img src="./disenno/mapas/pixel<%= getpixel("A12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
               <td>12</td>
              </tr>
              <tr> 
                      <td><a href="javascript:pick('K11')"><img src="./disenno/mapas/pixel<%= getpixel("K11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J11')"><img src="./disenno/mapas/pixel<%= getpixel("J11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I11')"><img src="./disenno/mapas/pixel<%= getpixel("I11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H11')"><img src="./disenno/mapas/pixel<%= getpixel("H11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G11')"><img src="./disenno/mapas/pixel<%= getpixel("G11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F11')"><img src="./disenno/mapas/pixel<%= getpixel("F11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E11')"><img src="./disenno/mapas/pixel<%= getpixel("E11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D11')"><img src="./disenno/mapas/pixel<%= getpixel("D11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C11')"><img src="./disenno/mapas/pixel<%= getpixel("C11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B11')"><img src="./disenno/mapas/pixel<%= getpixel("B11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A11')"><img src="./disenno/mapas/pixel<%= getpixel("A11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
               <td>11</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                      <td><a href="javascript:pick('K10')"><img src="./disenno/mapas/pixel<%= getpixel("K10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J10')"><img src="./disenno/mapas/pixel<%= getpixel("J10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I10')"><img src="./disenno/mapas/pixel<%= getpixel("I10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H10')"><img src="./disenno/mapas/pixel<%= getpixel("H10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G10')"><img src="./disenno/mapas/pixel<%= getpixel("G10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F10')"><img src="./disenno/mapas/pixel<%= getpixel("F10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E10')"><img src="./disenno/mapas/pixel<%= getpixel("E10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D10')"><img src="./disenno/mapas/pixel<%= getpixel("D10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C10')"><img src="./disenno/mapas/pixel<%= getpixel("C10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B10')"><img src="./disenno/mapas/pixel<%= getpixel("B10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A10')"><img src="./disenno/mapas/pixel<%= getpixel("A10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
               <td>10</td>
              </tr>
              <tr> 
                      <td><a href="javascript:pick('K09')"><img src="./disenno/mapas/pixel<%= getpixel("K09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J09')"><img src="./disenno/mapas/pixel<%= getpixel("J09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I09')"><img src="./disenno/mapas/pixel<%= getpixel("I09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H09')"><img src="./disenno/mapas/pixel<%= getpixel("H09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G09')"><img src="./disenno/mapas/pixel<%= getpixel("G09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F09')"><img src="./disenno/mapas/pixel<%= getpixel("F09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E09')"><img src="./disenno/mapas/pixel<%= getpixel("E09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D09')"><img src="./disenno/mapas/pixel<%= getpixel("D09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C09')"><img src="./disenno/mapas/pixel<%= getpixel("C09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B09')"><img src="./disenno/mapas/pixel<%= getpixel("B09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A09')"><img src="./disenno/mapas/pixel<%= getpixel("A09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                <td>09</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                      <td><a href="javascript:pick('K08')"><img src="./disenno/mapas/pixel<%= getpixel("K08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J08')"><img src="./disenno/mapas/pixel<%= getpixel("J08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I08')"><img src="./disenno/mapas/pixel<%= getpixel("I08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H08')"><img src="./disenno/mapas/pixel<%= getpixel("H08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G08')"><img src="./disenno/mapas/pixel<%= getpixel("G08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F08')"><img src="./disenno/mapas/pixel<%= getpixel("F08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E08')"><img src="./disenno/mapas/pixel<%= getpixel("E08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D08')"><img src="./disenno/mapas/pixel<%= getpixel("D08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C08')"><img src="./disenno/mapas/pixel<%= getpixel("C08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B08')"><img src="./disenno/mapas/pixel<%= getpixel("B08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A08')"><img src="./disenno/mapas/pixel<%= getpixel("A08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                <td>08</td>
              </tr>
              <tr> 
                      <td><a href="javascript:pick('K07')"><img src="./disenno/mapas/pixel<%= getpixel("K07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J07')"><img src="./disenno/mapas/pixel<%= getpixel("J07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I07')"><img src="./disenno/mapas/pixel<%= getpixel("I07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H07')"><img src="./disenno/mapas/pixel<%= getpixel("H07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G07')"><img src="./disenno/mapas/pixel<%= getpixel("G07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F07')"><img src="./disenno/mapas/pixel<%= getpixel("F07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E07')"><img src="./disenno/mapas/pixel<%= getpixel("E07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D07')"><img src="./disenno/mapas/pixel<%= getpixel("D07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C07')"><img src="./disenno/mapas/pixel<%= getpixel("C07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B07')"><img src="./disenno/mapas/pixel<%= getpixel("B07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A07')"><img src="./disenno/mapas/pixel<%= getpixel("A07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                <td>07</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                      <td><a href="javascript:pick('K06')"><img src="./disenno/mapas/pixel<%= getpixel("K06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J06')"><img src="./disenno/mapas/pixel<%= getpixel("J06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I06')"><img src="./disenno/mapas/pixel<%= getpixel("I06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H06')"><img src="./disenno/mapas/pixel<%= getpixel("H06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G06')"><img src="./disenno/mapas/pixel<%= getpixel("G06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F06')"><img src="./disenno/mapas/pixel<%= getpixel("F06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E06')"><img src="./disenno/mapas/pixel<%= getpixel("E06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D06')"><img src="./disenno/mapas/pixel<%= getpixel("D06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C06')"><img src="./disenno/mapas/pixel<%= getpixel("C06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B06')"><img src="./disenno/mapas/pixel<%= getpixel("B06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A06')"><img src="./disenno/mapas/pixel<%= getpixel("A06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                <td>06</td>
              </tr>
              <tr> 
                      <td><a href="javascript:pick('K05')"><img src="./disenno/mapas/pixel<%= getpixel("K05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J05')"><img src="./disenno/mapas/pixel<%= getpixel("J05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I05')"><img src="./disenno/mapas/pixel<%= getpixel("I05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H05')"><img src="./disenno/mapas/pixel<%= getpixel("H05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G05')"><img src="./disenno/mapas/pixel<%= getpixel("G05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F05')"><img src="./disenno/mapas/pixel<%= getpixel("F05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E05')"><img src="./disenno/mapas/pixel<%= getpixel("E05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D05')"><img src="./disenno/mapas/pixel<%= getpixel("D05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C05')"><img src="./disenno/mapas/pixel<%= getpixel("C05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B05')"><img src="./disenno/mapas/pixel<%= getpixel("B05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A05')"><img src="./disenno/mapas/pixel<%= getpixel("A05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                <td>05</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                      <td><a href="javascript:pick('K04')"><img src="./disenno/mapas/pixel<%= getpixel("K04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J04')"><img src="./disenno/mapas/pixel<%= getpixel("J04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I04')"><img src="./disenno/mapas/pixel<%= getpixel("I04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H04')"><img src="./disenno/mapas/pixel<%= getpixel("H04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G04')"><img src="./disenno/mapas/pixel<%= getpixel("G04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F04')"><img src="./disenno/mapas/pixel<%= getpixel("F04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E04')"><img src="./disenno/mapas/pixel<%= getpixel("E04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D04')"><img src="./disenno/mapas/pixel<%= getpixel("D04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C04')"><img src="./disenno/mapas/pixel<%= getpixel("C04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B04')"><img src="./disenno/mapas/pixel<%= getpixel("B04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A04')"><img src="./disenno/mapas/pixel<%= getpixel("A04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                <td>04</td>
              </tr>
              <tr> 
                      <td><a href="javascript:pick('K03')"><img src="./disenno/mapas/pixel<%= getpixel("K03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J03')"><img src="./disenno/mapas/pixel<%= getpixel("J03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I03')"><img src="./disenno/mapas/pixel<%= getpixel("I03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H03')"><img src="./disenno/mapas/pixel<%= getpixel("H03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G03')"><img src="./disenno/mapas/pixel<%= getpixel("G03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F03')"><img src="./disenno/mapas/pixel<%= getpixel("F03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E03')"><img src="./disenno/mapas/pixel<%= getpixel("E03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D03')"><img src="./disenno/mapas/pixel<%= getpixel("D03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C03')"><img src="./disenno/mapas/pixel<%= getpixel("C03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B03')"><img src="./disenno/mapas/pixel<%= getpixel("B03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>     
					  <td><a href="javascript:pick('A03')"><img src="./disenno/mapas/pixel<%= getpixel("A03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                <td>03</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                      <td><a href="javascript:pick('K02')"><img src="./disenno/mapas/pixel<%= getpixel("K02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('J02')"><img src="./disenno/mapas/pixel<%= getpixel("J02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('I02')"><img src="./disenno/mapas/pixel<%= getpixel("I02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H02')"><img src="./disenno/mapas/pixel<%= getpixel("H02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G02')"><img src="./disenno/mapas/pixel<%= getpixel("G02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F02')"><img src="./disenno/mapas/pixel<%= getpixel("F02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E02')"><img src="./disenno/mapas/pixel<%= getpixel("E02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D02')"><img src="./disenno/mapas/pixel<%= getpixel("D02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C02')"><img src="./disenno/mapas/pixel<%= getpixel("C02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B02')"><img src="./disenno/mapas/pixel<%= getpixel("B02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('A02')"><img src="./disenno/mapas/pixel<%= getpixel("A02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                <td>02</td>
              </tr>
              <tr> 
                      <td><a href="javascript:pick('K01')"><img src="./disenno/mapas/pixel<%= getpixel("K01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
					  <td><a href="javascript:pick('J01')"><img src="./disenno/mapas/pixel<%= getpixel("J01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
					  <td><a href="javascript:pick('I01')"><img src="./disenno/mapas/pixel<%= getpixel("I01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('H01')"><img src="./disenno/mapas/pixel<%= getpixel("H01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('G01')"><img src="./disenno/mapas/pixel<%= getpixel("G01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('F01')"><img src="./disenno/mapas/pixel<%= getpixel("F01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('E01')"><img src="./disenno/mapas/pixel<%= getpixel("E01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('D01')"><img src="./disenno/mapas/pixel<%= getpixel("D01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('C01')"><img src="./disenno/mapas/pixel<%= getpixel("C01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>      
					  <td><a href="javascript:pick('B01')"><img src="./disenno/mapas/pixel<%= getpixel("B01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A01')"><img src="./disenno/mapas/pixel<%= getpixel("A01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                <td>01</td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr align="center">
          <td width="9%">K</td>
          <td width="9%">J</td>
          <td width="9%">I</td>
          <td width="9%">H</td>
          <td width="9%">G</td>
          <td width="9%">F</td>
          <td width="9%">E</td>
          <td width="9%">D</td>
          <td width="9%">C</td>
          <td width="9%">B</td>
          <td width="9%">A</td>
        </tr>
      </table>
      
      <br>
	   <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa" align="center">
        <tr>
          <td align="center"><br>
            Zona de Alistamiento<br>
            <br>
          </td>
        </tr>
      </table>
    </td>
    <td width="27" valign="bottom"><br>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
                <td><img src="./disenno/mapas/pixel.gif" width="55" height="1">&nbsp;</td>
        </tr>
      </table></td>
    <td width="240"><table width="100%" border="0" cellspacing="6" cellpadding="0">
        <tr> 
          <td><table width="100%" border="0" cellspacing="6" cellpadding="0">
		  <caption>Area Devoluciones</caption>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">

                    <tr> 
                      <td>46</td>
                      <td><a href="javascript:pick('A46')"><img src="./disenno/mapas/pixel<%= getpixel("A46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B46')"><img src="./disenno/mapas/pixel<%= getpixel("B46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C46')"><img src="./disenno/mapas/pixel<%= getpixel("C46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D46')"><img src="./disenno/mapas/pixel<%= getpixel("D46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E46')"><img src="./disenno/mapas/pixel<%= getpixel("E46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				 </tr>
                    <tr> 
                      <td>47</td>
                      <td><a href="javascript:pick('A47')"><img src="./disenno/mapas/pixel<%= getpixel("A47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B47')"><img src="./disenno/mapas/pixel<%= getpixel("B47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C47')"><img src="./disenno/mapas/pixel<%= getpixel("C47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D47')"><img src="./disenno/mapas/pixel<%= getpixel("D47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E47')"><img src="./disenno/mapas/pixel<%= getpixel("E47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>48</td>
                      <td><a href="javascript:pick('A48')"><img src="./disenno/mapas/pixel<%= getpixel("A48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B48')"><img src="./disenno/mapas/pixel<%= getpixel("B48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C48')"><img src="./disenno/mapas/pixel<%= getpixel("C48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D48')"><img src="./disenno/mapas/pixel<%= getpixel("D48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E48')"><img src="./disenno/mapas/pixel<%= getpixel("E48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				  </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr align="center"> 
                <td width="23%">A</td>
                <td width="21%">B</td>
                <td width="19%">C</td>
                <td width="17%">D</td>
                <td width="20%">E</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>49</td>
                      <td><a href="javascript:pick('A49')"><img src="./disenno/mapas/pixel<%= getpixel("A49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B49')"><img src="./disenno/mapas/pixel<%= getpixel("B49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C49')"><img src="./disenno/mapas/pixel<%= getpixel("C49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D49')"><img src="./disenno/mapas/pixel<%= getpixel("D49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E49')"><img src="./disenno/mapas/pixel<%= getpixel("E49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				 </tr>
              <tr> 
                <td>50</td>
                   <td><a href="javascript:pick('A50')"><img src="./disenno/mapas/pixel<%= getpixel("A50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B50')"><img src="./disenno/mapas/pixel<%= getpixel("B50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C50')"><img src="./disenno/mapas/pixel<%= getpixel("C50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D50')"><img src="./disenno/mapas/pixel<%= getpixel("D50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E50')"><img src="./disenno/mapas/pixel<%= getpixel("E50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>51</td>
                      <td><a href="javascript:pick('A51')"><img src="./disenno/mapas/pixel<%= getpixel("A51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B51')"><img src="./disenno/mapas/pixel<%= getpixel("B51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C51')"><img src="./disenno/mapas/pixel<%= getpixel("C51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D51')"><img src="./disenno/mapas/pixel<%= getpixel("D51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E51')"><img src="./disenno/mapas/pixel<%= getpixel("E51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
              <tr> 
                <td>52</td>
                      <td><a href="javascript:pick('A52')"><img src="./disenno/mapas/pixel<%= getpixel("A52" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B52')"><img src="./disenno/mapas/pixel<%= getpixel("B52" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C52')"><img src="./disenno/mapas/pixel<%= getpixel("C52" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D52')"><img src="./disenno/mapas/pixel<%= getpixel("D52" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E52')"><img src="./disenno/mapas/pixel<%= getpixel("E52" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>53</td>
                      <td><a href="javascript:pick('A53')"><img src="./disenno/mapas/pixel<%= getpixel("A53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B53')"><img src="./disenno/mapas/pixel<%= getpixel("B53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C53')"><img src="./disenno/mapas/pixel<%= getpixel("C53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D53')"><img src="./disenno/mapas/pixel<%= getpixel("D53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E53')"><img src="./disenno/mapas/pixel<%= getpixel("E53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				 </tr>
              <tr> 
                <td>54</td>
                      <td><a href="javascript:pick('A54')"><img src="./disenno/mapas/pixel<%= getpixel("A54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B54')"><img src="./disenno/mapas/pixel<%= getpixel("B54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C54')"><img src="./disenno/mapas/pixel<%= getpixel("C54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D54')"><img src="./disenno/mapas/pixel<%= getpixel("D54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E54')"><img src="./disenno/mapas/pixel<%= getpixel("E54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				 </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>55</td>
                      <td><a href="javascript:pick('A55')"><img src="./disenno/mapas/pixel<%= getpixel("A55" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B55')"><img src="./disenno/mapas/pixel<%= getpixel("B55" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C55')"><img src="./disenno/mapas/pixel<%= getpixel("C55" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D55')"><img src="./disenno/mapas/pixel<%= getpixel("D55" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E55')"><img src="./disenno/mapas/pixel<%= getpixel("E55" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
              <tr> 
                <td>56</td>
                      <td><a href="javascript:pick('A56')"><img src="./disenno/mapas/pixel<%= getpixel("A56" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B56')"><img src="./disenno/mapas/pixel<%= getpixel("B56" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C56')"><img src="./disenno/mapas/pixel<%= getpixel("C56" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D56')"><img src="./disenno/mapas/pixel<%= getpixel("D56" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E56')"><img src="./disenno/mapas/pixel<%= getpixel("E56" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				 </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>57</td>
                      <td><a href="javascript:pick('A57')"><img src="./disenno/mapas/pixel<%= getpixel("A57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B57')"><img src="./disenno/mapas/pixel<%= getpixel("B57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C57')"><img src="./disenno/mapas/pixel<%= getpixel("C57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D57')"><img src="./disenno/mapas/pixel<%= getpixel("D57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E57')"><img src="./disenno/mapas/pixel<%= getpixel("E57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				  </tr>
              <tr> 
                <td>58</td>
                      <td><a href="javascript:pick('A58')"><img src="./disenno/mapas/pixel<%= getpixel("A58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B58')"><img src="./disenno/mapas/pixel<%= getpixel("B58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C58')"><img src="./disenno/mapas/pixel<%= getpixel("C58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D58')"><img src="./disenno/mapas/pixel<%= getpixel("D58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E58')"><img src="./disenno/mapas/pixel<%= getpixel("E58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				 </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>59</td>
                      <td><a href="javascript:pick('A59')"><img src="./disenno/mapas/pixel<%= getpixel("A59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B59')"><img src="./disenno/mapas/pixel<%= getpixel("B59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C59')"><img src="./disenno/mapas/pixel<%= getpixel("C59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D59')"><img src="./disenno/mapas/pixel<%= getpixel("D59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E59')"><img src="./disenno/mapas/pixel<%= getpixel("E59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				  </tr>
              <tr> 
                <td>60</td>
                      <td><a href="javascript:pick('A60')"><img src="./disenno/mapas/pixel<%= getpixel("A60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B60')"><img src="./disenno/mapas/pixel<%= getpixel("B60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C60')"><img src="./disenno/mapas/pixel<%= getpixel("C60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D60')"><img src="./disenno/mapas/pixel<%= getpixel("D60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E60')"><img src="./disenno/mapas/pixel<%= getpixel("E60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				 </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>61</td>
                      <td><a href="javascript:pick('A61')"><img src="./disenno/mapas/pixel<%= getpixel("A61" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B61')"><img src="./disenno/mapas/pixel<%= getpixel("B61" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C61')"><img src="./disenno/mapas/pixel<%= getpixel("C61" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D61')"><img src="./disenno/mapas/pixel<%= getpixel("D61" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E61')"><img src="./disenno/mapas/pixel<%= getpixel("E61" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
              <tr> 
                <td>62</td>
                      <td><a href="javascript:pick('A62')"><img src="./disenno/mapas/pixel<%= getpixel("A62" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B62')"><img src="./disenno/mapas/pixel<%= getpixel("B62" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C62')"><img src="./disenno/mapas/pixel<%= getpixel("C62" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D62')"><img src="./disenno/mapas/pixel<%= getpixel("D62" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E62')"><img src="./disenno/mapas/pixel<%= getpixel("E62" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>63</td>
                      <td><a href="javascript:pick('A63')"><img src="./disenno/mapas/pixel<%= getpixel("A63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B63')"><img src="./disenno/mapas/pixel<%= getpixel("B63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C63')"><img src="./disenno/mapas/pixel<%= getpixel("C63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D63')"><img src="./disenno/mapas/pixel<%= getpixel("D63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E63')"><img src="./disenno/mapas/pixel<%= getpixel("E63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
              <tr> 
                <td>64</td>
                      <td><a href="javascript:pick('A64')"><img src="./disenno/mapas/pixel<%= getpixel("A64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B64')"><img src="./disenno/mapas/pixel<%= getpixel("B64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C64')"><img src="./disenno/mapas/pixel<%= getpixel("C64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D64')"><img src="./disenno/mapas/pixel<%= getpixel("D64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E64')"><img src="./disenno/mapas/pixel<%= getpixel("E64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				 </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>65</td>
                      <td><a href="javascript:pick('A65')"><img src="./disenno/mapas/pixel<%= getpixel("A65" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B65')"><img src="./disenno/mapas/pixel<%= getpixel("B65" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C65')"><img src="./disenno/mapas/pixel<%= getpixel("C65" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D65')"><img src="./disenno/mapas/pixel<%= getpixel("D65" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E65')"><img src="./disenno/mapas/pixel<%= getpixel("E65" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				 </tr>
              <tr> 
                <td>66</td>
                      <td><a href="javascript:pick('A66')"><img src="./disenno/mapas/pixel<%= getpixel("A66" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B66')"><img src="./disenno/mapas/pixel<%= getpixel("B66" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C66')"><img src="./disenno/mapas/pixel<%= getpixel("C66" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D66')"><img src="./disenno/mapas/pixel<%= getpixel("D66" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E66')"><img src="./disenno/mapas/pixel<%= getpixel("E66" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				 </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr align="center"> 
                <td width="23%">A</td>
                <td width="21%">B</td>
                <td width="19%">C</td>
                <td width="17%">D</td>
                <td width="20%">E</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>67</td>
                      <td><a href="javascript:pick('A67')"><img src="./disenno/mapas/pixel<%= getpixel("A67" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B67')"><img src="./disenno/mapas/pixel<%= getpixel("B67" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C67')"><img src="./disenno/mapas/pixel<%= getpixel("C67" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D67')"><img src="./disenno/mapas/pixel<%= getpixel("D67" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E67')"><img src="./disenno/mapas/pixel<%= getpixel("E67" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
              <tr> 
                <td>68</td>
                      <td><a href="javascript:pick('A68')"><img src="./disenno/mapas/pixel<%= getpixel("A68" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B68')"><img src="./disenno/mapas/pixel<%= getpixel("B68" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C68')"><img src="./disenno/mapas/pixel<%= getpixel("C68" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D68')"><img src="./disenno/mapas/pixel<%= getpixel("D68" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E68')"><img src="./disenno/mapas/pixel<%= getpixel("E68" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				 </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>69</td>
                      <td><a href="javascript:pick('A69')"><img src="./disenno/mapas/pixel<%= getpixel("A69" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B69')"><img src="./disenno/mapas/pixel<%= getpixel("B69" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C69')"><img src="./disenno/mapas/pixel<%= getpixel("C69" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D69')"><img src="./disenno/mapas/pixel<%= getpixel("D69" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E69')"><img src="./disenno/mapas/pixel<%= getpixel("E69" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
              <tr> 
                <td>70</td>
                      <td><a href="javascript:pick('A70')"><img src="./disenno/mapas/pixel<%= getpixel("A70" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B70')"><img src="./disenno/mapas/pixel<%= getpixel("B70" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C70')"><img src="./disenno/mapas/pixel<%= getpixel("C70" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D70')"><img src="./disenno/mapas/pixel<%= getpixel("D70" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E70')"><img src="./disenno/mapas/pixel<%= getpixel("E70" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>71</td>
                      <td><a href="javascript:pick('A71')"><img src="./disenno/mapas/pixel<%= getpixel("A71" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B71')"><img src="./disenno/mapas/pixel<%= getpixel("B71" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C71')"><img src="./disenno/mapas/pixel<%= getpixel("C71" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D71')"><img src="./disenno/mapas/pixel<%= getpixel("D71" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E71')"><img src="./disenno/mapas/pixel<%= getpixel("E71" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				 </tr>
              <tr> 
                <td>72</td>
                      <td><a href="javascript:pick('A72')"><img src="./disenno/mapas/pixel<%= getpixel("A72" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B72')"><img src="./disenno/mapas/pixel<%= getpixel("B72" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C72')"><img src="./disenno/mapas/pixel<%= getpixel("C72" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D72')"><img src="./disenno/mapas/pixel<%= getpixel("D72" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E72')"><img src="./disenno/mapas/pixel<%= getpixel("E72" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>73</td>
                	  <td><a href="javascript:pick('A73')"><img src="./disenno/mapas/pixel<%= getpixel("A73" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B73')"><img src="./disenno/mapas/pixel<%= getpixel("B73" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C73')"><img src="./disenno/mapas/pixel<%= getpixel("C73" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D73')"><img src="./disenno/mapas/pixel<%= getpixel("D73" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E73')"><img src="./disenno/mapas/pixel<%= getpixel("E73" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
              <tr> 
                <td>74</td>
                      <td><a href="javascript:pick('A74')"><img src="./disenno/mapas/pixel<%= getpixel("A74" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B74')"><img src="./disenno/mapas/pixel<%= getpixel("B74" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C74')"><img src="./disenno/mapas/pixel<%= getpixel("C74" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D74')"><img src="./disenno/mapas/pixel<%= getpixel("D74" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E74')"><img src="./disenno/mapas/pixel<%= getpixel("E74" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>75</td>
                	  <td><a href="javascript:pick('A75')"><img src="./disenno/mapas/pixel<%= getpixel("A75" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B75')"><img src="./disenno/mapas/pixel<%= getpixel("B75" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C75')"><img src="./disenno/mapas/pixel<%= getpixel("C75" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D75')"><img src="./disenno/mapas/pixel<%= getpixel("D75" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E75')"><img src="./disenno/mapas/pixel<%= getpixel("E75" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
              <tr> 
                <td>76</td>
               	      <td><a href="javascript:pick('A76')"><img src="./disenno/mapas/pixel<%= getpixel("A76" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B76')"><img src="./disenno/mapas/pixel<%= getpixel("B76" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C76')"><img src="./disenno/mapas/pixel<%= getpixel("C76" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D76')"><img src="./disenno/mapas/pixel<%= getpixel("D76" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E76')"><img src="./disenno/mapas/pixel<%= getpixel("E76" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>77</td>
               	      <td><a href="javascript:pick('A77')"><img src="./disenno/mapas/pixel<%= getpixel("A77" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B77')"><img src="./disenno/mapas/pixel<%= getpixel("B77" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C77')"><img src="./disenno/mapas/pixel<%= getpixel("C77" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D77')"><img src="./disenno/mapas/pixel<%= getpixel("D77" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E77')"><img src="./disenno/mapas/pixel<%= getpixel("E77" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
              <tr> 
                <td>78</td>
               	      <td><a href="javascript:pick('A78')"><img src="./disenno/mapas/pixel<%= getpixel("A78" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B78')"><img src="./disenno/mapas/pixel<%= getpixel("B78" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C78')"><img src="./disenno/mapas/pixel<%= getpixel("C78" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D78')"><img src="./disenno/mapas/pixel<%= getpixel("D78" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E78')"><img src="./disenno/mapas/pixel<%= getpixel("E78" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>79</td>
                 	  <td><a href="javascript:pick('A79')"><img src="./disenno/mapas/pixel<%= getpixel("A79" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B79')"><img src="./disenno/mapas/pixel<%= getpixel("B79" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C79')"><img src="./disenno/mapas/pixel<%= getpixel("C79" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D79')"><img src="./disenno/mapas/pixel<%= getpixel("D79" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E79')"><img src="./disenno/mapas/pixel<%= getpixel("E79" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
				</tr>
              <tr> 
                <td>80</td>
                 	  <td><a href="javascript:pick('A80')"><img src="./disenno/mapas/pixel<%= getpixel("A80" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B80')"><img src="./disenno/mapas/pixel<%= getpixel("B80" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C80')"><img src="./disenno/mapas/pixel<%= getpixel("C80" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D80')"><img src="./disenno/mapas/pixel<%= getpixel("D80" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E80')"><img src="./disenno/mapas/pixel<%= getpixel("E80" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
 				</tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>81</td>
                      <td><a href="javascript:pick('A81')"><img src="./disenno/mapas/pixel<%= getpixel("A81" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B81')"><img src="./disenno/mapas/pixel<%= getpixel("B81" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C81')"><img src="./disenno/mapas/pixel<%= getpixel("C81" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D81')"><img src="./disenno/mapas/pixel<%= getpixel("D81" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E81')"><img src="./disenno/mapas/pixel<%= getpixel("E81" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
           </tr>
              <tr> 
                <td>82</td>
                      <td><a href="javascript:pick('A82')"><img src="./disenno/mapas/pixel<%= getpixel("A82" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B82')"><img src="./disenno/mapas/pixel<%= getpixel("B82" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C82')"><img src="./disenno/mapas/pixel<%= getpixel("C82" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D82')"><img src="./disenno/mapas/pixel<%= getpixel("D82" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E82')"><img src="./disenno/mapas/pixel<%= getpixel("E82" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
            </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>83</td>
                      <td><a href="javascript:pick('A83')"><img src="./disenno/mapas/pixel<%= getpixel("A83" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B83')"><img src="./disenno/mapas/pixel<%= getpixel("B83" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C83')"><img src="./disenno/mapas/pixel<%= getpixel("C83" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D83')"><img src="./disenno/mapas/pixel<%= getpixel("D83" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E83')"><img src="./disenno/mapas/pixel<%= getpixel("E83" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
             </tr>
              <tr> 
                <td>84</td>
                      <td><a href="javascript:pick('A84')"><img src="./disenno/mapas/pixel<%= getpixel("A84" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B84')"><img src="./disenno/mapas/pixel<%= getpixel("B84" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C84')"><img src="./disenno/mapas/pixel<%= getpixel("C84" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D84')"><img src="./disenno/mapas/pixel<%= getpixel("D84" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E84')"><img src="./disenno/mapas/pixel<%= getpixel("E84" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td>85</td>
                      <td><a href="javascript:pick('A85')"><img src="./disenno/mapas/pixel<%= getpixel("A85" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B85')"><img src="./disenno/mapas/pixel<%= getpixel("B85" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C85')"><img src="./disenno/mapas/pixel<%= getpixel("C85" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D85')"><img src="./disenno/mapas/pixel<%= getpixel("D85" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E85')"><img src="./disenno/mapas/pixel<%= getpixel("E85" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr align="center">
          <td width="27%">A</td>
          <td width="18%">B</td>
          <td width="17%">C</td>
          <td width="18%">D</td>
          <td width="20%">E</td>
        </tr>
      </table> 
      <br>
      <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa" align="center">

        <tr>
          <td><br>
            Zona de Cargue y Descargue<br>
            <br>
          </td>
        </tr>
      </table> </td>
  </tr>
</table>

</table>

