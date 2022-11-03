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
    <td width="170" valign="top"> <table width="100%" border="0" cellspacing="6" cellpadding="0">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr align="center">
                      <td width="10%">I</td>
                      <td width="10%">H</td>
                      <td width="10%">G</td>
                      <td width="10%">F</td>
                      <td width="10%">E</td>
                      <td width="10%">D</td>
                      <td width="10%">C</td>
                      <td width="10%">B</td>
                      <td width="10%">A</td>
                      <td width="5%">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
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
                <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
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
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
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
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
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
                    <tr> 
					  <td><a href="javascript:pick('I02')"><img src="./disenno/mapas/pixel<%= getpixel("I02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
					  <td><a href="javascript:pick('H02')"><img src="./disenno/mapas/pixel<%= getpixel("H02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G02')"><img src="./disenno/mapas/pixel<%= getpixel("G02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F02')"><img src="./disenno/mapas/pixel<%= getpixel("F02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E02')"><img src="./disenno/mapas/pixel<%= getpixel("E02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D02')"><img src="./disenno/mapas/pixel<%= getpixel("D02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C02')"><img src="./disenno/mapas/pixel<%= getpixel("C02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B02')"><img src="./disenno/mapas/pixel<%= getpixel("B02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A02')"><img src="./disenno/mapas/pixel<%= getpixel("C02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>02</td>
                    </tr>
                    <tr> 
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
                    <% /*<tr> 
                      <td colspan="8" align="center">ZONA DE ALISTAMIENTO</td>
                    </tr>*/ %>
                  </table></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr align="center"> 
			    <td width="10%">I</td>
			    <td width="10%">H</td>
                <td width="10%">G</td>
                <td width="10%">F</td>
                <td width="10%">E</td>
                <td width="10%">D</td>
                <td width="10%">C</td>
                <td width="10%">B</td>
                <td width="10%">A</td>
                <td width="5%">&nbsp;</td>
              </tr>
            </table>
      
      <br>
          </td>
          <td width="27" valign="bottom"><br>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
                <td><img src="./disenno/mapas/pixel.gif" width="55" height="1">&nbsp;</td>
        </tr>
      </table></td>
          <td width="490"><table width="100%" border="0" cellspacing="0" cellpadding="4">
              <tr align="center"> 
                <td width="5%">&nbsp;</td>
                <td width="10%">A</td>
                <td width="10%">B</td>
                <td width="10%">C</td>
                <td width="10%">D</td>
                <td width="10%">E</td>
                <td width="10%">F</td>
                <td width="10%">G</td>
                <td width="10%">H</td>
                <td width="10%">I</td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="6" cellpadding="0">
			
			  <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>22</td>
                      <td><a href="javascript:pick('A22')"><img src="./disenno/mapas/pixel<%= getpixel("A22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B22')"><img src="./disenno/mapas/pixel<%= getpixel("B22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C22')"><img src="./disenno/mapas/pixel<%= getpixel("C22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                      <td><a href="javascript:pick('D22')"><img src="./disenno/mapas/pixel<%= getpixel("D22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E22')"><img src="./disenno/mapas/pixel<%= getpixel("E22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F22')"><img src="./disenno/mapas/pixel<%= getpixel("F22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G22')"><img src="./disenno/mapas/pixel<%= getpixel("G22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H22')"><img src="./disenno/mapas/pixel<%= getpixel("H22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I22')"><img src="./disenno/mapas/pixel<%= getpixel("I22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
            
			
			
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>23</td>
                      <td><a href="javascript:pick('A23')"><img src="./disenno/mapas/pixel<%= getpixel("A23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B23')"><img src="./disenno/mapas/pixel<%= getpixel("B23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C23')"><img src="./disenno/mapas/pixel<%= getpixel("C23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D23')"><img src="./disenno/mapas/pixel<%= getpixel("D23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E23')"><img src="./disenno/mapas/pixel<%= getpixel("E23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F23')"><img src="./disenno/mapas/pixel<%= getpixel("F23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G23')"><img src="./disenno/mapas/pixel<%= getpixel("G23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H23')"><img src="./disenno/mapas/pixel<%= getpixel("H23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I23')"><img src="./disenno/mapas/pixel<%= getpixel("I23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>24</td>
                      <td><a href="javascript:pick('A24')"><img src="./disenno/mapas/pixel<%= getpixel("A24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B24')"><img src="./disenno/mapas/pixel<%= getpixel("B24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C24')"><img src="./disenno/mapas/pixel<%= getpixel("C24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D24')"><img src="./disenno/mapas/pixel<%= getpixel("D24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E24')"><img src="./disenno/mapas/pixel<%= getpixel("E24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F24')"><img src="./disenno/mapas/pixel<%= getpixel("F24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G24')"><img src="./disenno/mapas/pixel<%= getpixel("G24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H24')"><img src="./disenno/mapas/pixel<%= getpixel("H24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I24')"><img src="./disenno/mapas/pixel<%= getpixel("I24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>

              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>25</td>
                      <td><a href="javascript:pick('A25')"><img src="./disenno/mapas/pixel<%= getpixel("A25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B25')"><img src="./disenno/mapas/pixel<%= getpixel("B25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C25')"><img src="./disenno/mapas/pixel<%= getpixel("C25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D25')"><img src="./disenno/mapas/pixel<%= getpixel("D25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E25')"><img src="./disenno/mapas/pixel<%= getpixel("E25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F25')"><img src="./disenno/mapas/pixel<%= getpixel("F25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G25')"><img src="./disenno/mapas/pixel<%= getpixel("G25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H25')"><img src="./disenno/mapas/pixel<%= getpixel("H25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I25')"><img src="./disenno/mapas/pixel<%= getpixel("I25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    </tr>
                    <tr> 
                      <td>26</td>
                      <td><a href="javascript:pick('A26')"><img src="./disenno/mapas/pixel<%= getpixel("A26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B26')"><img src="./disenno/mapas/pixel<%= getpixel("B26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C26')"><img src="./disenno/mapas/pixel<%= getpixel("C26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D26')"><img src="./disenno/mapas/pixel<%= getpixel("D26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E26')"><img src="./disenno/mapas/pixel<%= getpixel("E26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F26')"><img src="./disenno/mapas/pixel<%= getpixel("F26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G26')"><img src="./disenno/mapas/pixel<%= getpixel("G26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H26')"><img src="./disenno/mapas/pixel<%= getpixel("H26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I26')"><img src="./disenno/mapas/pixel<%= getpixel("I26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
   </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>27</td>
                      <td><a href="javascript:pick('A27')"><img src="./disenno/mapas/pixel<%= getpixel("A27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B27')"><img src="./disenno/mapas/pixel<%= getpixel("B27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C27')"><img src="./disenno/mapas/pixel<%= getpixel("C27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D27')"><img src="./disenno/mapas/pixel<%= getpixel("D27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E27')"><img src="./disenno/mapas/pixel<%= getpixel("E27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F27')"><img src="./disenno/mapas/pixel<%= getpixel("F27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G27')"><img src="./disenno/mapas/pixel<%= getpixel("G27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H27')"><img src="./disenno/mapas/pixel<%= getpixel("H27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I27')"><img src="./disenno/mapas/pixel<%= getpixel("I27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>28</td>
                      <td><a href="javascript:pick('A28')"><img src="./disenno/mapas/pixel<%= getpixel("A28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B28')"><img src="./disenno/mapas/pixel<%= getpixel("B28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C28')"><img src="./disenno/mapas/pixel<%= getpixel("C28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D28')"><img src="./disenno/mapas/pixel<%= getpixel("D28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E28')"><img src="./disenno/mapas/pixel<%= getpixel("E28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F28')"><img src="./disenno/mapas/pixel<%= getpixel("F28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G28')"><img src="./disenno/mapas/pixel<%= getpixel("G28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H28')"><img src="./disenno/mapas/pixel<%= getpixel("H28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I28')"><img src="./disenno/mapas/pixel<%= getpixel("I28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>29</td>
                      <td><a href="javascript:pick('A29')"><img src="./disenno/mapas/pixel<%= getpixel("A29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B29')"><img src="./disenno/mapas/pixel<%= getpixel("B29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C29')"><img src="./disenno/mapas/pixel<%= getpixel("C29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D29')"><img src="./disenno/mapas/pixel<%= getpixel("D29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E29')"><img src="./disenno/mapas/pixel<%= getpixel("E29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F29')"><img src="./disenno/mapas/pixel<%= getpixel("F29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G29')"><img src="./disenno/mapas/pixel<%= getpixel("G29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H29')"><img src="./disenno/mapas/pixel<%= getpixel("H29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I29')"><img src="./disenno/mapas/pixel<%= getpixel("I29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>30</td>
                      <td><a href="javascript:pick('A30')"><img src="./disenno/mapas/pixel<%= getpixel("A30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B30')"><img src="./disenno/mapas/pixel<%= getpixel("B30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C30')"><img src="./disenno/mapas/pixel<%= getpixel("C30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D30')"><img src="./disenno/mapas/pixel<%= getpixel("D30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E30')"><img src="./disenno/mapas/pixel<%= getpixel("E30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F30')"><img src="./disenno/mapas/pixel<%= getpixel("F30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G30')"><img src="./disenno/mapas/pixel<%= getpixel("G30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H30')"><img src="./disenno/mapas/pixel<%= getpixel("H30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I30')"><img src="./disenno/mapas/pixel<%= getpixel("I30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>31</td>
                      <td><a href="javascript:pick('A31')"><img src="./disenno/mapas/pixel<%= getpixel("A31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B31')"><img src="./disenno/mapas/pixel<%= getpixel("B31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C31')"><img src="./disenno/mapas/pixel<%= getpixel("C31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D31')"><img src="./disenno/mapas/pixel<%= getpixel("D31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E31')"><img src="./disenno/mapas/pixel<%= getpixel("E31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F31')"><img src="./disenno/mapas/pixel<%= getpixel("F31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G31')"><img src="./disenno/mapas/pixel<%= getpixel("G31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H31')"><img src="./disenno/mapas/pixel<%= getpixel("H31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I31')"><img src="./disenno/mapas/pixel<%= getpixel("I31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>32</td>
                      <td><a href="javascript:pick('A32')"><img src="./disenno/mapas/pixel<%= getpixel("A32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B32')"><img src="./disenno/mapas/pixel<%= getpixel("B32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C32')"><img src="./disenno/mapas/pixel<%= getpixel("C32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D32')"><img src="./disenno/mapas/pixel<%= getpixel("D32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E32')"><img src="./disenno/mapas/pixel<%= getpixel("E32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F32')"><img src="./disenno/mapas/pixel<%= getpixel("F32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G32')"><img src="./disenno/mapas/pixel<%= getpixel("G32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H32')"><img src="./disenno/mapas/pixel<%= getpixel("H32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I32')"><img src="./disenno/mapas/pixel<%= getpixel("I32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>33</td>
                      <td><a href="javascript:pick('A33')"><img src="./disenno/mapas/pixel<%= getpixel("A33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B33')"><img src="./disenno/mapas/pixel<%= getpixel("B33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C33')"><img src="./disenno/mapas/pixel<%= getpixel("C33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D33')"><img src="./disenno/mapas/pixel<%= getpixel("D33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E33')"><img src="./disenno/mapas/pixel<%= getpixel("E33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F33')"><img src="./disenno/mapas/pixel<%= getpixel("F33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G33')"><img src="./disenno/mapas/pixel<%= getpixel("G33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H33')"><img src="./disenno/mapas/pixel<%= getpixel("H33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I33')"><img src="./disenno/mapas/pixel<%= getpixel("I33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>34</td>
                      <td><a href="javascript:pick('A34')"><img src="./disenno/mapas/pixel<%= getpixel("A34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B34')"><img src="./disenno/mapas/pixel<%= getpixel("B34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C34')"><img src="./disenno/mapas/pixel<%= getpixel("C34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D34')"><img src="./disenno/mapas/pixel<%= getpixel("D34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E34')"><img src="./disenno/mapas/pixel<%= getpixel("E34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F34')"><img src="./disenno/mapas/pixel<%= getpixel("F34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G34')"><img src="./disenno/mapas/pixel<%= getpixel("G34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H34')"><img src="./disenno/mapas/pixel<%= getpixel("H34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I34')"><img src="./disenno/mapas/pixel<%= getpixel("I34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>35</td>
                      <td><a href="javascript:pick('A35')"><img src="./disenno/mapas/pixel<%= getpixel("A35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B35')"><img src="./disenno/mapas/pixel<%= getpixel("B35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C35')"><img src="./disenno/mapas/pixel<%= getpixel("C35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D35')"><img src="./disenno/mapas/pixel<%= getpixel("D35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E35')"><img src="./disenno/mapas/pixel<%= getpixel("E35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F35')"><img src="./disenno/mapas/pixel<%= getpixel("F35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G35')"><img src="./disenno/mapas/pixel<%= getpixel("G35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H35')"><img src="./disenno/mapas/pixel<%= getpixel("H35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I35')"><img src="./disenno/mapas/pixel<%= getpixel("I35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>36</td>
                      <td><a href="javascript:pick('A36')"><img src="./disenno/mapas/pixel<%= getpixel("A36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B36')"><img src="./disenno/mapas/pixel<%= getpixel("B36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C36')"><img src="./disenno/mapas/pixel<%= getpixel("C36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D36')"><img src="./disenno/mapas/pixel<%= getpixel("D36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E36')"><img src="./disenno/mapas/pixel<%= getpixel("E36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F36')"><img src="./disenno/mapas/pixel<%= getpixel("F36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G36')"><img src="./disenno/mapas/pixel<%= getpixel("G36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H36')"><img src="./disenno/mapas/pixel<%= getpixel("H36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I36')"><img src="./disenno/mapas/pixel<%= getpixel("I36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>37</td>
                      <td><a href="javascript:pick('A37')"><img src="./disenno/mapas/pixel<%= getpixel("A37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B37')"><img src="./disenno/mapas/pixel<%= getpixel("B37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C37')"><img src="./disenno/mapas/pixel<%= getpixel("C37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D37')"><img src="./disenno/mapas/pixel<%= getpixel("D37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E37')"><img src="./disenno/mapas/pixel<%= getpixel("E37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F37')"><img src="./disenno/mapas/pixel<%= getpixel("F37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G37')"><img src="./disenno/mapas/pixel<%= getpixel("G37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H37')"><img src="./disenno/mapas/pixel<%= getpixel("H37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I37')"><img src="./disenno/mapas/pixel<%= getpixel("I37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>38</td>
                      <td><a href="javascript:pick('A38')"><img src="./disenno/mapas/pixel<%= getpixel("A38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B38')"><img src="./disenno/mapas/pixel<%= getpixel("B38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C38')"><img src="./disenno/mapas/pixel<%= getpixel("C38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D38')"><img src="./disenno/mapas/pixel<%= getpixel("D38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E38')"><img src="./disenno/mapas/pixel<%= getpixel("E38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F38')"><img src="./disenno/mapas/pixel<%= getpixel("F38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G38')"><img src="./disenno/mapas/pixel<%= getpixel("G38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H38')"><img src="./disenno/mapas/pixel<%= getpixel("H38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I38')"><img src="./disenno/mapas/pixel<%= getpixel("I38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>39</td>
                      <td><a href="javascript:pick('A39')"><img src="./disenno/mapas/pixel<%= getpixel("A39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B39')"><img src="./disenno/mapas/pixel<%= getpixel("B39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C39')"><img src="./disenno/mapas/pixel<%= getpixel("C39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D39')"><img src="./disenno/mapas/pixel<%= getpixel("D39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E39')"><img src="./disenno/mapas/pixel<%= getpixel("E39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F39')"><img src="./disenno/mapas/pixel<%= getpixel("F39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G39')"><img src="./disenno/mapas/pixel<%= getpixel("G39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H39')"><img src="./disenno/mapas/pixel<%= getpixel("H39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I39')"><img src="./disenno/mapas/pixel<%= getpixel("I39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>40</td>
                      <td><a href="javascript:pick('A40')"><img src="./disenno/mapas/pixel<%= getpixel("A40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B40')"><img src="./disenno/mapas/pixel<%= getpixel("B40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C40')"><img src="./disenno/mapas/pixel<%= getpixel("C40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D40')"><img src="./disenno/mapas/pixel<%= getpixel("D40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E40')"><img src="./disenno/mapas/pixel<%= getpixel("E40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F40')"><img src="./disenno/mapas/pixel<%= getpixel("F40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G40')"><img src="./disenno/mapas/pixel<%= getpixel("G40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H40')"><img src="./disenno/mapas/pixel<%= getpixel("H40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I40')"><img src="./disenno/mapas/pixel<%= getpixel("I40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>41</td>
                      <td><a href="javascript:pick('A41')"><img src="./disenno/mapas/pixel<%= getpixel("A41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B41')"><img src="./disenno/mapas/pixel<%= getpixel("B41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C41')"><img src="./disenno/mapas/pixel<%= getpixel("C41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D41')"><img src="./disenno/mapas/pixel<%= getpixel("D41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E41')"><img src="./disenno/mapas/pixel<%= getpixel("E41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F41')"><img src="./disenno/mapas/pixel<%= getpixel("F41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G41')"><img src="./disenno/mapas/pixel<%= getpixel("G41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H41')"><img src="./disenno/mapas/pixel<%= getpixel("H41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I41')"><img src="./disenno/mapas/pixel<%= getpixel("I41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>42</td>
                      <td><a href="javascript:pick('A42')"><img src="./disenno/mapas/pixel<%= getpixel("A42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B42')"><img src="./disenno/mapas/pixel<%= getpixel("B42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C42')"><img src="./disenno/mapas/pixel<%= getpixel("C42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D42')"><img src="./disenno/mapas/pixel<%= getpixel("D42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E42')"><img src="./disenno/mapas/pixel<%= getpixel("E42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F42')"><img src="./disenno/mapas/pixel<%= getpixel("F42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G42')"><img src="./disenno/mapas/pixel<%= getpixel("G42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H42')"><img src="./disenno/mapas/pixel<%= getpixel("H42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I42')"><img src="./disenno/mapas/pixel<%= getpixel("I42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>43</td>
                      <td><a href="javascript:pick('A43')"><img src="./disenno/mapas/pixel<%= getpixel("A43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B43')"><img src="./disenno/mapas/pixel<%= getpixel("B43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C43')"><img src="./disenno/mapas/pixel<%= getpixel("C43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D43')"><img src="./disenno/mapas/pixel<%= getpixel("D43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E43')"><img src="./disenno/mapas/pixel<%= getpixel("E43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F43')"><img src="./disenno/mapas/pixel<%= getpixel("F43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G43')"><img src="./disenno/mapas/pixel<%= getpixel("G43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H43')"><img src="./disenno/mapas/pixel<%= getpixel("H43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('I43')"><img src="./disenno/mapas/pixel<%= getpixel("I43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr align="center"> 
                <td width="5%">&nbsp;</td>
                <td width="10%">A</td>
                <td width="10%">B</td>
                <td width="10%">C</td>
                <td width="10%">D</td>
                <td width="10%">E</td>
                <td width="10%">F</td>
                <td width="10%">G</td>
                <td width="10%">H</td>
                <td width="10%">I</td>
              </tr>
            </table> 
      <br>
          </td>
  </tr>
</table>

</table>