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

<table cellpadding="0"  cellspacing="0" border=1  >
  <tr valign="bottom"> 
    <td width="490" valign="top"> <table width="100%" border="0" cellspacing="6" cellpadding="0">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr align="center">
                      <td width="10%">B</td>
                      <td width="10%">A</td>
                      <td width="5%">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr> 
                      <td><a href="javascript:pick('B32')"><img src="./disenno/mapas/pixel<%= getpixel("B32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A32')"><img src="./disenno/mapas/pixel<%= getpixel("A32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>32</td>
                    </tr>
                    <tr> 
                      <td><a href="javascript:pick('B31')"><img src="./disenno/mapas/pixel<%= getpixel("B31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A31')"><img src="./disenno/mapas/pixel<%= getpixel("A31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>31</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr> 
                      <td><a href="javascript:pick('B30')"><img src="./disenno/mapas/pixel<%= getpixel("B30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A30')"><img src="./disenno/mapas/pixel<%= getpixel("A30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>30</td>
                    </tr>
                    <tr> 
                      <td><a href="javascript:pick('B29')"><img src="./disenno/mapas/pixel<%= getpixel("B29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A29')"><img src="./disenno/mapas/pixel<%= getpixel("A29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>29</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr> 
                      <td><a href="javascript:pick('B28')"><img src="./disenno/mapas/pixel<%= getpixel("B28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A28')"><img src="./disenno/mapas/pixel<%= getpixel("A28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>28</td>
                    </tr>
                    <tr> 
                      <td><a href="javascript:pick('B27')"><img src="./disenno/mapas/pixel<%= getpixel("B27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A27')"><img src="./disenno/mapas/pixel<%= getpixel("A27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>27</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr> 
                      <td><a href="javascript:pick('B26')"><img src="./disenno/mapas/pixel<%= getpixel("B26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A26')"><img src="./disenno/mapas/pixel<%= getpixel("A26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>26</td>
                    </tr>
                    <tr> 
                      <td><a href="javascript:pick('B25')"><img src="./disenno/mapas/pixel<%= getpixel("B25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A25')"><img src="./disenno/mapas/pixel<%= getpixel("A25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>25</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr> 
                      <td><a href="javascript:pick('B24')"><img src="./disenno/mapas/pixel<%= getpixel("B24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A24')"><img src="./disenno/mapas/pixel<%= getpixel("A24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>24</td>
                    </tr>
                    <tr> 
                      <td><a href="javascript:pick('B23')"><img src="./disenno/mapas/pixel<%= getpixel("B23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A23')"><img src="./disenno/mapas/pixel<%= getpixel("A23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>23</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr> 
                      <td><a href="javascript:pick('B22')"><img src="./disenno/mapas/pixel<%= getpixel("B22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A22')"><img src="./disenno/mapas/pixel<%= getpixel("A22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>22</td>
                    </tr>
                    <tr> 
                      <td><a href="javascript:pick('B21')"><img src="./disenno/mapas/pixel<%= getpixel("B21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A21')"><img src="./disenno/mapas/pixel<%= getpixel("A21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>21</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><a href="javascript:pick('B20')"><img src="./disenno/mapas/pixel<%= getpixel("B20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A20')"><img src="./disenno/mapas/pixel<%= getpixel("A20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>20</td>
                    </tr>
                    <tr> 
                      <td><a href="javascript:pick('B19')"><img src="./disenno/mapas/pixel<%= getpixel("B19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A19')"><img src="./disenno/mapas/pixel<%= getpixel("A19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>19</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><a href="javascript:pick('B18')"><img src="./disenno/mapas/pixel<%= getpixel("B18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A18')"><img src="./disenno/mapas/pixel<%= getpixel("A18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>18</td>
                    </tr>
                    <tr> 
                      <td><a href="javascript:pick('B17')"><img src="./disenno/mapas/pixel<%= getpixel("B17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A17')"><img src="./disenno/mapas/pixel<%= getpixel("A17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>17</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><a href="javascript:pick('B16')"><img src="./disenno/mapas/pixel<%= getpixel("B16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A16')"><img src="./disenno/mapas/pixel<%= getpixel("A16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>16</td>
                    </tr>
                    <tr> 
                      <td><a href="javascript:pick('B15')"><img src="./disenno/mapas/pixel<%= getpixel("B15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A15')"><img src="./disenno/mapas/pixel<%= getpixel("A15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>15</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><a href="javascript:pick('B14')"><img src="./disenno/mapas/pixel<%= getpixel("B14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A14')"><img src="./disenno/mapas/pixel<%= getpixel("A14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>14</td>
                    </tr>
                    <tr> 
                      <td><a href="javascript:pick('B13')"><img src="./disenno/mapas/pixel<%= getpixel("B13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A13')"><img src="./disenno/mapas/pixel<%= getpixel("A13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>13</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><a href="javascript:pick('B12')"><img src="./disenno/mapas/pixel<%= getpixel("B12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A12')"><img src="./disenno/mapas/pixel<%= getpixel("A12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>12</td>
                    </tr>
                    <tr> 
                      <td><a href="javascript:pick('B11')"><img src="./disenno/mapas/pixel<%= getpixel("B11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A11')"><img src="./disenno/mapas/pixel<%= getpixel("A11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>11</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><a href="javascript:pick('B10')"><img src="./disenno/mapas/pixel<%= getpixel("B10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A10')"><img src="./disenno/mapas/pixel<%= getpixel("A10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>10</td>
                    </tr>
                    <tr> 
                      <td><a href="javascript:pick('B09')"><img src="./disenno/mapas/pixel<%= getpixel("B09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A09')"><img src="./disenno/mapas/pixel<%= getpixel("A09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>09</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><a href="javascript:pick('B08')"><img src="./disenno/mapas/pixel<%= getpixel("B08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A08')"><img src="./disenno/mapas/pixel<%= getpixel("A08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>08</td>
                    </tr>
                    <tr> 
                      <td><a href="javascript:pick('B07')"><img src="./disenno/mapas/pixel<%= getpixel("B07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A07')"><img src="./disenno/mapas/pixel<%= getpixel("A07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>07</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><a href="javascript:pick('B06')"><img src="./disenno/mapas/pixel<%= getpixel("B06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A06')"><img src="./disenno/mapas/pixel<%= getpixel("A06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>06</td>
                    </tr>
                    <tr> 
                      <td><a href="javascript:pick('B05')"><img src="./disenno/mapas/pixel<%= getpixel("B05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A05')"><img src="./disenno/mapas/pixel<%= getpixel("A05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>05</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><a href="javascript:pick('B04')"><img src="./disenno/mapas/pixel<%= getpixel("B04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A04')"><img src="./disenno/mapas/pixel<%= getpixel("A04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>04</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td><a href="javascript:pick('B03')"><img src="./disenno/mapas/pixel<%= getpixel("B03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A03')"><img src="./disenno/mapas/pixel<%= getpixel("A03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>03</td>
                    </tr>
                    <tr> 
                      <td><a href="javascript:pick('B02')"><img src="./disenno/mapas/pixel<%= getpixel("B02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A02')"><img src="./disenno/mapas/pixel<%= getpixel("A02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>02</td>
                    </tr>
                    <tr> 
                      <td><a href="javascript:pick('B01')"><img src="./disenno/mapas/pixel<%= getpixel("B01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('A01')"><img src="./disenno/mapas/pixel<%= getpixel("A01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td>01</td>
                    </tr>
                    
                  </table></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr align="center"> 
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
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="6" cellpadding="0">
			
			                <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>33</td>
                      <td><a href="javascript:pick('A33')"><img src="./disenno/mapas/pixel<%= getpixel("A33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B33')"><img src="./disenno/mapas/pixel<%= getpixel("B33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>34</td>
                      <td><a href="javascript:pick('A34')"><img src="./disenno/mapas/pixel<%= getpixel("A34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B34')"><img src="./disenno/mapas/pixel<%= getpixel("B34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>35</td>
                      <td><a href="javascript:pick('A35')"><img src="./disenno/mapas/pixel<%= getpixel("A35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B35')"><img src="./disenno/mapas/pixel<%= getpixel("B35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>36</td>
                      <td><a href="javascript:pick('A36')"><img src="./disenno/mapas/pixel<%= getpixel("A36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B36')"><img src="./disenno/mapas/pixel<%= getpixel("B36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>37</td>
                      <td><a href="javascript:pick('A37')"><img src="./disenno/mapas/pixel<%= getpixel("A37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B37')"><img src="./disenno/mapas/pixel<%= getpixel("B37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>38</td>
                      <td><a href="javascript:pick('A38')"><img src="./disenno/mapas/pixel<%= getpixel("A38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B38')"><img src="./disenno/mapas/pixel<%= getpixel("B38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>39</td>
                      <td><a href="javascript:pick('A39')"><img src="./disenno/mapas/pixel<%= getpixel("A39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B39')"><img src="./disenno/mapas/pixel<%= getpixel("B39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>40</td>
                      <td><a href="javascript:pick('A40')"><img src="./disenno/mapas/pixel<%= getpixel("A40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B40')"><img src="./disenno/mapas/pixel<%= getpixel("B40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>41</td>
                      <td><a href="javascript:pick('A41')"><img src="./disenno/mapas/pixel<%= getpixel("A41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B41')"><img src="./disenno/mapas/pixel<%= getpixel("B41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>42</td>
                      <td><a href="javascript:pick('A42')"><img src="./disenno/mapas/pixel<%= getpixel("A42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B42')"><img src="./disenno/mapas/pixel<%= getpixel("B42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>43</td>
                      <td><a href="javascript:pick('A43')"><img src="./disenno/mapas/pixel<%= getpixel("A43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B43')"><img src="./disenno/mapas/pixel<%= getpixel("B43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>44</td>
                      <td><a href="javascript:pick('A44')"><img src="./disenno/mapas/pixel<%= getpixel("A44" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B44')"><img src="./disenno/mapas/pixel<%= getpixel("B44" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>45</td>
                      <td><a href="javascript:pick('A45')"><img src="./disenno/mapas/pixel<%= getpixel("A45" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B45')"><img src="./disenno/mapas/pixel<%= getpixel("B45" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>46</td>
                      <td><a href="javascript:pick('A46')"><img src="./disenno/mapas/pixel<%= getpixel("A46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B46')"><img src="./disenno/mapas/pixel<%= getpixel("B46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>

              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>47</td>
                      <td><a href="javascript:pick('A47')"><img src="./disenno/mapas/pixel<%= getpixel("A47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B47')"><img src="./disenno/mapas/pixel<%= getpixel("B47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    		</tr>
                    <tr> 
                      <td>48</td>
                      <td><a href="javascript:pick('A48')"><img src="./disenno/mapas/pixel<%= getpixel("A48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B48')"><img src="./disenno/mapas/pixel<%= getpixel("B48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
            </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>49</td>
                      <td><a href="javascript:pick('A49')"><img src="./disenno/mapas/pixel<%= getpixel("A49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B49')"><img src="./disenno/mapas/pixel<%= getpixel("B49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>50</td>
                      <td><a href="javascript:pick('A50')"><img src="./disenno/mapas/pixel<%= getpixel("A50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B50')"><img src="./disenno/mapas/pixel<%= getpixel("B50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>51</td>
                      <td><a href="javascript:pick('A51')"><img src="./disenno/mapas/pixel<%= getpixel("A51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B51')"><img src="./disenno/mapas/pixel<%= getpixel("B51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>52</td>
                      <td><a href="javascript:pick('A52')"><img src="./disenno/mapas/pixel<%= getpixel("A52" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B52')"><img src="./disenno/mapas/pixel<%= getpixel("B52" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>53</td>
                      <td><a href="javascript:pick('A53')"><img src="./disenno/mapas/pixel<%= getpixel("A53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B53')"><img src="./disenno/mapas/pixel<%= getpixel("B53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>54</td>
                      <td><a href="javascript:pick('A54')"><img src="./disenno/mapas/pixel<%= getpixel("A54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B54')"><img src="./disenno/mapas/pixel<%= getpixel("B54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>55</td>
                      <td><a href="javascript:pick('A55')"><img src="./disenno/mapas/pixel<%= getpixel("A55" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B55')"><img src="./disenno/mapas/pixel<%= getpixel("B55" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>56</td>
                      <td><a href="javascript:pick('A56')"><img src="./disenno/mapas/pixel<%= getpixel("A56" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B56')"><img src="./disenno/mapas/pixel<%= getpixel("B56" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>57</td>
                      <td><a href="javascript:pick('A57')"><img src="./disenno/mapas/pixel<%= getpixel("A57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B57')"><img src="./disenno/mapas/pixel<%= getpixel("B57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>58</td>
                      <td><a href="javascript:pick('A58')"><img src="./disenno/mapas/pixel<%= getpixel("A58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B58')"><img src="./disenno/mapas/pixel<%= getpixel("B58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>59</td>
                      <td><a href="javascript:pick('A59')"><img src="./disenno/mapas/pixel<%= getpixel("A59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B59')"><img src="./disenno/mapas/pixel<%= getpixel("B59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>60</td>
                      <td><a href="javascript:pick('A60')"><img src="./disenno/mapas/pixel<%= getpixel("A60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B60')"><img src="./disenno/mapas/pixel<%= getpixel("B60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>61</td>
                      <td><a href="javascript:pick('A61')"><img src="./disenno/mapas/pixel<%= getpixel("A61" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B61')"><img src="./disenno/mapas/pixel<%= getpixel("B61" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>62</td>
                      <td><a href="javascript:pick('A62')"><img src="./disenno/mapas/pixel<%= getpixel("A62" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B62')"><img src="./disenno/mapas/pixel<%= getpixel("B62" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>63</td>
                      <td><a href="javascript:pick('A63')"><img src="./disenno/mapas/pixel<%= getpixel("A63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B63')"><img src="./disenno/mapas/pixel<%= getpixel("B63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td>64</td>
                      <td><a href="javascript:pick('A64')"><img src="./disenno/mapas/pixel<%= getpixel("A64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B64')"><img src="./disenno/mapas/pixel<%= getpixel("B64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              
              
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr align="center"> 
                <td width="5%">&nbsp;</td>
                <td width="10%">A</td>
                <td width="10%">B</td>
              </tr>
            </table> 
      <br>
          </td>
  </tr>
</table>

</table>