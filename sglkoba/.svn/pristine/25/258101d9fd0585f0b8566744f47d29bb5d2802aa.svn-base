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
    <td align= "center"><table border="0" align="center" cellpadding="0" cellspacing="3" >
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>4</td>
                      <td><A href="javascript:pick('A4-5')"> <img src="./disenno/mapas/pixel<%= getpixel("A4-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('A4-4')"> <img src="./disenno/mapas/pixel<%= getpixel("A4-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('A4-3')"> <img src="./disenno/mapas/pixel<%= getpixel("A4-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('A4-2')"> <img src="./disenno/mapas/pixel<%= getpixel("A4-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('A4-1')"> <img src="./disenno/mapas/pixel<%= getpixel("A4-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('B4-5')"> <img src="./disenno/mapas/pixel<%= getpixel("B4-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('B4-4')"> <img src="./disenno/mapas/pixel<%= getpixel("B4-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('B4-3')"> <img src="./disenno/mapas/pixel<%= getpixel("B4-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('B4-2')"> <img src="./disenno/mapas/pixel<%= getpixel("B4-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('B4-1')"> <img src="./disenno/mapas/pixel<%= getpixel("B4-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('C4-5')"> <img src="./disenno/mapas/pixel<%= getpixel("C4-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('C4-4')"> <img src="./disenno/mapas/pixel<%= getpixel("C4-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('C4-3')"> <img src="./disenno/mapas/pixel<%= getpixel("C4-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('C4-2')"> <img src="./disenno/mapas/pixel<%= getpixel("C4-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('C4-1')"> <img src="./disenno/mapas/pixel<%= getpixel("C4-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('D4-5')"> <img src="./disenno/mapas/pixel<%= getpixel("D4-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('D4-4')"> <img src="./disenno/mapas/pixel<%= getpixel("D4-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('D4-3')"> <img src="./disenno/mapas/pixel<%= getpixel("D4-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('D4-2')"> <img src="./disenno/mapas/pixel<%= getpixel("D4-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('D4-1')"> <img src="./disenno/mapas/pixel<%= getpixel("D4-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('E4-5')"> <img src="./disenno/mapas/pixel<%= getpixel("E4-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('E4-4')"> <img src="./disenno/mapas/pixel<%= getpixel("E4-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('E4-3')"> <img src="./disenno/mapas/pixel<%= getpixel("E4-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('E4-2')"> <img src="./disenno/mapas/pixel<%= getpixel("E4-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('E4-1')"> <img src="./disenno/mapas/pixel<%= getpixel("E4-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('F4-5')"> <img src="./disenno/mapas/pixel<%= getpixel("F4-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('F4-4')"> <img src="./disenno/mapas/pixel<%= getpixel("F4-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('F4-3')"> <img src="./disenno/mapas/pixel<%= getpixel("F4-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('F4-2')"> <img src="./disenno/mapas/pixel<%= getpixel("F4-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('F4-1')"> <img src="./disenno/mapas/pixel<%= getpixel("F4-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('G4-5')"> <img src="./disenno/mapas/pixel<%= getpixel("G4-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('G4-4')"> <img src="./disenno/mapas/pixel<%= getpixel("G4-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('G4-3')"> <img src="./disenno/mapas/pixel<%= getpixel("G4-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('G4-2')"> <img src="./disenno/mapas/pixel<%= getpixel("G4-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('G4-1')"> <img src="./disenno/mapas/pixel<%= getpixel("G4-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('H4-5')"> <img src="./disenno/mapas/pixel<%= getpixel("H4-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('H4-4')"> <img src="./disenno/mapas/pixel<%= getpixel("H4-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('H4-3')"> <img src="./disenno/mapas/pixel<%= getpixel("H4-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('H4-2')"> <img src="./disenno/mapas/pixel<%= getpixel("H4-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('H4-1')"> <img src="./disenno/mapas/pixel<%= getpixel("H4-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('I4-5')"> <img src="./disenno/mapas/pixel<%= getpixel("I4-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('I4-4')"> <img src="./disenno/mapas/pixel<%= getpixel("I4-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('I4-3')"> <img src="./disenno/mapas/pixel<%= getpixel("I4-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('I4-2')"> <img src="./disenno/mapas/pixel<%= getpixel("I4-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('I4-1')"> <img src="./disenno/mapas/pixel<%= getpixel("I4-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>3</td>
                      <td><A href="javascript:pick('A3-5')"> <img src="./disenno/mapas/pixel<%= getpixel("A3-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('A3-4')"> <img src="./disenno/mapas/pixel<%= getpixel("A3-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('A3-3')"> <img src="./disenno/mapas/pixel<%= getpixel("A3-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('A3-2')"> <img src="./disenno/mapas/pixel<%= getpixel("A3-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('A3-1')"> <img src="./disenno/mapas/pixel<%= getpixel("A3-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('B3-5')"> <img src="./disenno/mapas/pixel<%= getpixel("B3-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('B3-4')"> <img src="./disenno/mapas/pixel<%= getpixel("B3-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('B3-3')"> <img src="./disenno/mapas/pixel<%= getpixel("B3-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('B3-2')"> <img src="./disenno/mapas/pixel<%= getpixel("B3-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('B3-1')"> <img src="./disenno/mapas/pixel<%= getpixel("B3-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('C3-5')"> <img src="./disenno/mapas/pixel<%= getpixel("C3-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('C3-4')"> <img src="./disenno/mapas/pixel<%= getpixel("C3-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('C3-3')"> <img src="./disenno/mapas/pixel<%= getpixel("C3-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('C3-2')"> <img src="./disenno/mapas/pixel<%= getpixel("C3-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('C3-1')"> <img src="./disenno/mapas/pixel<%= getpixel("C3-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('D3-5')"> <img src="./disenno/mapas/pixel<%= getpixel("D3-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('D3-4')"> <img src="./disenno/mapas/pixel<%= getpixel("D3-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('D3-3')"> <img src="./disenno/mapas/pixel<%= getpixel("D3-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('D3-2')"> <img src="./disenno/mapas/pixel<%= getpixel("D3-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('D3-1')"> <img src="./disenno/mapas/pixel<%= getpixel("D3-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('E3-5')"> <img src="./disenno/mapas/pixel<%=getpixel("E3-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('E3-4')"> <img src="./disenno/mapas/pixel<%= getpixel("E3-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('E3-3')"> <img src="./disenno/mapas/pixel<%= getpixel("E3-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('E3-2')"> <img src="./disenno/mapas/pixel<%= getpixel("E3-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('E3-1')"> <img src="./disenno/mapas/pixel<%= getpixel("E3-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('F3-5')"> <img src="./disenno/mapas/pixel<%= getpixel("F3-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('F3-4')"> <img src="./disenno/mapas/pixel<%= getpixel("F3-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('F3-3')"> <img src="./disenno/mapas/pixel<%= getpixel("F3-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('F3-2')"> <img src="./disenno/mapas/pixel<%= getpixel("F3-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('F3-1')"> <img src="./disenno/mapas/pixel<%= getpixel("F3-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('G3-5')"> <img src="./disenno/mapas/pixel<%= getpixel("G3-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('G3-4')"> <img src="./disenno/mapas/pixel<%= getpixel("G3-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('G3-3')"> <img src="./disenno/mapas/pixel<%= getpixel("G3-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('G3-2')"> <img src="./disenno/mapas/pixel<%= getpixel("G3-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('G3-1')"> <img src="./disenno/mapas/pixel<%= getpixel("G3-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('H3-5')"> <img src="./disenno/mapas/pixel<%= getpixel("H3-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('H3-4')"> <img src="./disenno/mapas/pixel<%= getpixel("H3-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('H3-3')"> <img src="./disenno/mapas/pixel<%= getpixel("H3-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('H3-2')"> <img src="./disenno/mapas/pixel<%= getpixel("H3-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('H3-1')"> <img src="./disenno/mapas/pixel<%= getpixel("H3-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('I3-5')"> <img src="./disenno/mapas/pixel<%= getpixel("I3-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('I3-4')"> <img src="./disenno/mapas/pixel<%= getpixel("I3-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('I3-3')"> <img src="./disenno/mapas/pixel<%= getpixel("I3-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('I3-2')"> <img src="./disenno/mapas/pixel<%= getpixel("I3-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('I3-1')"> <img src="./disenno/mapas/pixel<%= getpixel("I3-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>2</td>
                      <td><A href="javascript:pick('A2-5')"> <img src="./disenno/mapas/pixel<%= getpixel("A2-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('A2-4')"> <img src="./disenno/mapas/pixel<%= getpixel("A2-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('A2-3')"> <img src="./disenno/mapas/pixel<%= getpixel("A2-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('A2-2')"> <img src="./disenno/mapas/pixel<%= getpixel("A2-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('A2-1')"> <img src="./disenno/mapas/pixel<%= getpixel("A2-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('B2-5')"> <img src="./disenno/mapas/pixel<%= getpixel("B2-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('B2-4')"> <img src="./disenno/mapas/pixel<%= getpixel("B2-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('B2-3')"> <img src="./disenno/mapas/pixel<%= getpixel("B2-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('B2-2')"> <img src="./disenno/mapas/pixel<%= getpixel("B2-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('B2-1')"> <img src="./disenno/mapas/pixel<%= getpixel("B2-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('C2-5')"> <img src="./disenno/mapas/pixel<%= getpixel("C2-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('C2-4')"> <img src="./disenno/mapas/pixel<%= getpixel("C2-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('C2-3')"> <img src="./disenno/mapas/pixel<%= getpixel("C2-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('C2-2')"> <img src="./disenno/mapas/pixel<%= getpixel("C2-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('C2-1')"> <img src="./disenno/mapas/pixel<%= getpixel("C2-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('D2-5')"> <img src="./disenno/mapas/pixel<%= getpixel("D2-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('D2-4')"> <img src="./disenno/mapas/pixel<%= getpixel("D2-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('D2-3')"> <img src="./disenno/mapas/pixel<%= getpixel("D2-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('D2-2')"> <img src="./disenno/mapas/pixel<%= getpixel("D2-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('D2-1')"> <img src="./disenno/mapas/pixel<%= getpixel("D2-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('E2-5')"> <img src="./disenno/mapas/pixel<%= getpixel("E2-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('E2-4')"> <img src="./disenno/mapas/pixel<%= getpixel("E2-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('E2-3')"> <img src="./disenno/mapas/pixel<%= getpixel("E2-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('E2-2')"> <img src="./disenno/mapas/pixel<%= getpixel("E2-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('E2-1')"> <img src="./disenno/mapas/pixel<%= getpixel("E2-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('F2-5')"> <img src="./disenno/mapas/pixel<%= getpixel("F2-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('F2-4')"> <img src="./disenno/mapas/pixel<%= getpixel("F2-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('F2-3')"> <img src="./disenno/mapas/pixel<%= getpixel("F2-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('F2-2')"> <img src="./disenno/mapas/pixel<%= getpixel("F2-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('F2-1')"> <img src="./disenno/mapas/pixel<%= getpixel("F2-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('G2-5')"> <img src="./disenno/mapas/pixel<%= getpixel("G2-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('G2-4')"> <img src="./disenno/mapas/pixel<%= getpixel("G2-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('G2-3')"> <img src="./disenno/mapas/pixel<%= getpixel("G2-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('G2-2')"> <img src="./disenno/mapas/pixel<%= getpixel("G2-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('G2-1')"> <img src="./disenno/mapas/pixel<%= getpixel("G2-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('H2-5')"> <img src="./disenno/mapas/pixel<%= getpixel("H2-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('H2-4')"> <img src="./disenno/mapas/pixel<%= getpixel("H2-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('H2-3')"> <img src="./disenno/mapas/pixel<%= getpixel("H2-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('H2-2')"> <img src="./disenno/mapas/pixel<%= getpixel("H2-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('H2-1')"> <img src="./disenno/mapas/pixel<%= getpixel("H2-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('I2-5')"> <img src="./disenno/mapas/pixel<%= getpixel("I2-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('I2-4')"> <img src="./disenno/mapas/pixel<%= getpixel("I2-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('I2-3')"> <img src="./disenno/mapas/pixel<%= getpixel("I2-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('I2-2')"> <img src="./disenno/mapas/pixel<%= getpixel("I2-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('I2-1')"> <img src="./disenno/mapas/pixel<%= getpixel("I2-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>1</td>
                      <td><A href="javascript:pick('A1-5')"> <img src="./disenno/mapas/pixel<%= getpixel("A1-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('A1-4')"> <img src="./disenno/mapas/pixel<%= getpixel("A1-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('A1-3')"> <img src="./disenno/mapas/pixel<%= getpixel("A1-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('A1-2')"> <img src="./disenno/mapas/pixel<%= getpixel("A1-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('A1-1')"> <img src="./disenno/mapas/pixel<%= getpixel("A1-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('B1-5')"> <img src="./disenno/mapas/pixel<%= getpixel("B1-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('B1-4')"> <img src="./disenno/mapas/pixel<%= getpixel("B1-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('B1-3')"> <img src="./disenno/mapas/pixel<%= getpixel("B1-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('B1-2')"> <img src="./disenno/mapas/pixel<%= getpixel("B1-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('B1-1')"> <img src="./disenno/mapas/pixel<%= getpixel("B1-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('C1-5')"> <img src="./disenno/mapas/pixel<%= getpixel("C1-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('C1-4')"> <img src="./disenno/mapas/pixel<%= getpixel("C1-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('C1-3')"> <img src="./disenno/mapas/pixel<%= getpixel("C1-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('C1-2')"> <img src="./disenno/mapas/pixel<%= getpixel("C1-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('C1-1')"> <img src="./disenno/mapas/pixel<%= getpixel("C1-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('D1-5')"> <img src="./disenno/mapas/pixel<%= getpixel("D1-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('D1-4')"> <img src="./disenno/mapas/pixel<%= getpixel("D1-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('D1-3')"> <img src="./disenno/mapas/pixel<%= getpixel("D1-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('D1-2')"> <img src="./disenno/mapas/pixel<%= getpixel("D1-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('D1-1')"> <img src="./disenno/mapas/pixel<%= getpixel("D1-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('E1-5')"> <img src="./disenno/mapas/pixel<%= getpixel("E1-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('E1-4')"> <img src="./disenno/mapas/pixel<%= getpixel("E1-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('E1-3')"> <img src="./disenno/mapas/pixel<%= getpixel("E1-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('E1-2')"> <img src="./disenno/mapas/pixel<%= getpixel("E1-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('E1-1')"> <img src="./disenno/mapas/pixel<%= getpixel("E1-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('F1-5')"> <img src="./disenno/mapas/pixel<%= getpixel("F1-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('F1-4')"> <img src="./disenno/mapas/pixel<%= getpixel("F1-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('F1-3')"> <img src="./disenno/mapas/pixel<%= getpixel("F1-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('F1-2')"> <img src="./disenno/mapas/pixel<%= getpixel("F1-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('F1-1')"> <img src="./disenno/mapas/pixel<%= getpixel("F1-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('G1-5')"> <img src="./disenno/mapas/pixel<%= getpixel("G1-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('G1-4')"> <img src="./disenno/mapas/pixel<%= getpixel("G1-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('G1-3')"> <img src="./disenno/mapas/pixel<%= getpixel("G1-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('G1-2')"> <img src="./disenno/mapas/pixel<%= getpixel("G1-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('G1-1')"> <img src="./disenno/mapas/pixel<%= getpixel("G1-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('H1-5')"> <img src="./disenno/mapas/pixel<%= getpixel("H1-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('H1-4')"> <img src="./disenno/mapas/pixel<%= getpixel("H1-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('H1-3')"> <img src="./disenno/mapas/pixel<%= getpixel("H1-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('H1-2')"> <img src="./disenno/mapas/pixel<%= getpixel("H1-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('H1-1')"> <img src="./disenno/mapas/pixel<%= getpixel("H1-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><A href="javascript:pick('I1-5')"> <img src="./disenno/mapas/pixel<%= getpixel("I1-5" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('I1-4')"> <img src="./disenno/mapas/pixel<%= getpixel("I1-4" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('I1-3')"> <img src="./disenno/mapas/pixel<%= getpixel("I1-3" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('I1-2')"> <img src="./disenno/mapas/pixel<%= getpixel("I1-2" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                      <td><A href="javascript:pick('I1-1')"> <img src="./disenno/mapas/pixel<%= getpixel("I1-1" , posiciones, tipo)  %>.gif" width="8" height="15"  border="0"> 
                        </A></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" >
              <tr> 
                <td> <img src="./disenno/mapas/pixel.gif" width="11" height="8"/> 
                </td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa" style="font-size:15px">
                    <tr> 
                      <td>5</td>
                      <td>4</td>
                      <td>3</td>
                      <td>2</td>
                      <td>1</td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa" style="font-size:15px">
                    <tr> 
                      <td>5</td>
                      <td>4</td>
                      <td>3</td>
                      <td>2</td>
                      <td>1</td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa" style="font-size:15px">
                    <tr> 
                      <td>5</td>
                      <td>4</td>
                      <td>3</td>
                      <td>2</td>
                      <td>1</td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa" style="font-size:15px">
                    <tr> 
                      <td>5</td>
                      <td>4</td>
                      <td>3</td>
                      <td>2</td>
                      <td>1</td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa" style="font-size:15px">
                    <tr> 
                      <td>5</td>
                      <td>4</td>
                      <td>3</td>
                      <td>2</td>
                      <td>1</td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa" style="font-size:15px">
                    <tr> 
                      <td>5</td>
                      <td>4</td>
                      <td>3</td>
                      <td>2</td>
                      <td>1</td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa" style="font-size:15px">
                    <tr> 
                      <td>5</td>
                      <td>4</td>
                      <td>3</td>
                      <td>2</td>
                      <td>1</td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa" style="font-size:15px">
                    <tr> 
                      <td>5</td>
                      <td>4</td>
                      <td>3</td>
                      <td>2</td>
                      <td>1</td>
                    </tr>
                  </table></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa" style="font-size:15px">
                    <tr> 
                      <td>5</td>
                      <td>4</td>
                      <td>3</td>
                      <td>2</td>
                      <td>1</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr align="center">
                <td>&nbsp;</td>
                <td>A</td>
                <td>B</td>
                <td>C</td>
                <td>D</td>
                <td>E</td>
                <td>F</td>
                <td>G</td>
                <td>H</td>
                <td>I</td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table></table>