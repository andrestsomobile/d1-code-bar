<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="maestro.control.*,maestro.entity.*,java.util.*" %>
<%

String procodsx = request.getParameter("procodsx");
String bodcodsx = request.getParameter("bodega");
String estanteria = request.getParameter("estanteria");
estanteria = estanteria == null ? "A" : estanteria;
bodcodsx = bodcodsx == null ? "1" : bodcodsx;
%>

<div class="titulo">Mapa de Bodega</div>
<br>
<br>

<form name="miforma" method='post' action="">
<table cellpadding="2"  cellspacing="2" align="left"  >
    <tr> 
		<td> Bodega:
		</td>
		<td> <select name='bodega'>
				<option value="1" <%=bodcodsx != null && bodcodsx.equals("1") ? "selected" : ""%>>CEDI IMPORTADOS</option>
				<option value="7" <%=bodcodsx != null && bodcodsx.equals("7") ? "selected" : ""%>>BODEGA 2</option>
			 </select>
		</td>
	</tr>	
	<tr> 
		<td> Estanter&iacute;a:
		</td>
		<td><input type="text" list="estantes" id='estanteria' value='<%=estanteria%>' name='estanteria' onkeyup="javascript:this.value=this.value.toUpperCase();">
				<!-- Lista de opciones -->
				<datalist id="estantes">
				  <option value="A">A</option>
				  <option value="B">B</option>
				  <option value="C">C</option>
				  <option value="D">D</option>
				  <option value="E">E</option>
				  <option value="F">F</option>
				  <option value="G">G</option>
				  <option value="H">H</option>
				  <option value="I">I</option>
				  <option value="J">J</option>
				  <option value="K">K</option>
				  <option value="L">L</option>
				  <option value="M">M</option>
				  <option value="N">N</option>
				  <option value="O">O</option>
				  <option value="P">P</option>
				  <option value="Q">Q</option>
				  <option value="R">R</option>
				  <option value="S">S</option>
				  <option value="T">T</option>
				  <option value="U">U</option>
				  <option value="V">V</option>
				  <option value="W">W</option>
				  <option value="X">X</option>
				  <option value="Y">Y</option>
				  <option value="Z">Z</option>
				</datalist>
		</td>
	</tr>	
	<tr>
		<td colspan="2" align="center"><input type='submit' name='ver' value='Ver Mapa'> </td>
	</tr>	
	<tr>
		<td colspan="2" align="center"><a href='main.jsp?app=maestro&modulo=generaMapaQR&estanteria=<%=estanteria%>&bodega=<%=bodcodsx%>'> Imprimir QR's para Estanter&iacute;a </a></td>
	</tr>
</table>
</form> 
<br>
<br>
<%	    


gstconfig_bodega gconf_bog = new gstconfig_bodega();
Collection lista_posiciones = null;
if (estanteria != null) {
	lista_posiciones = gconf_bog.getMapa(bodcodsx,estanteria);
	//lista_posiciones = gconf_bog.getMapa();
	Iterator itpos = lista_posiciones != null ? lista_posiciones.iterator() : null;
              
	if (itpos != null && itpos.hasNext()) {
		while (itpos.hasNext()) {
%>

<%		
		
		Collection datos = (Collection) itpos.next();
		Iterator data = datos.iterator();
		String estante =  (String) data.next();
		String nivel =  (String) data.next();
		String est_nivel =  (String) data.next();
		String pos_01 =  (String) data.next();
		String pos_02 =  (String) data.next();
		String pos_03 =  (String) data.next();
		String pos_04 =  (String) data.next();
		String pos_05 =  (String) data.next();
		String pos_06 =  (String) data.next();
		String pos_07 =  (String) data.next();
		String pos_08 =  (String) data.next();
		String pos_09 =  (String) data.next();
		String pos_10 =  (String) data.next();
		String pos_11 =  (String) data.next();
		String pos_12 =  (String) data.next();
		String pos_13 =  (String) data.next();
		String pos_14 =  (String) data.next();
		String pos_15 =  (String) data.next();
		String pos_16 =  (String) data.next();
		String pos_17 =  (String) data.next();
		String pos_18 =  (String) data.next();
		String pos_19 =  (String) data.next();
		String pos_20 =  (String) data.next();
		String pos_21 =  (String) data.next();
		String pos_22 =  (String) data.next();
		String pos_23 =  (String) data.next();
		String pos_24 =  (String) data.next();
		String pos_25 =  (String) data.next();
		String pos_26 =  (String) data.next();
		String pos_27 =  (String) data.next();
		String pos_28 =  (String) data.next();
		String pos_29 =  (String) data.next();
		String pos_30 =  (String) data.next();
		String pos_31 =  (String) data.next();
		String pos_32 =  (String) data.next();
		String pos_33 =  (String) data.next();
		String pos_34 =  (String) data.next();
		String pos_35 =  (String) data.next();
		String pos_36 =  (String) data.next();
		String pos_37 =  (String) data.next();
		String pos_38 =  (String) data.next();
		String pos_39 =  (String) data.next();
		String pos_40 =  (String) data.next();
		String pos_41 =  (String) data.next();
		String pos_42 =  (String) data.next();
		String pos_43 =  (String) data.next();
		String pos_44 =  (String) data.next();
		String pos_45 =  (String) data.next();
		String pos_46 =  (String) data.next();
		String pos_47 =  (String) data.next();
		String pos_48 =  (String) data.next();
		String pos_49 =  (String) data.next();
		String pos_50 =  (String) data.next();
		String pos_51 =  (String) data.next();
		String pos_52 =  (String) data.next();
		String pos_53 =  (String) data.next();
		String pos_54 =  (String) data.next();
		String pos_55 =  (String) data.next();
		String pos_56 =  (String) data.next();
		String pos_57 =  (String) data.next();
		String pos_58 =  (String) data.next();
		/*String pos_59 =  (String) data.next();
		String pos_60 =  (String) data.next();
		String pos_61 =  (String) data.next();
		String pos_62 =  (String) data.next();
		String pos_63 =  (String) data.next();
		String pos_64 =  (String) data.next();
		String pos_65 =  (String) data.next();
		String pos_66 =  (String) data.next();
		String pos_67 =  (String) data.next();
		String pos_68 =  (String) data.next();
		String pos_69 =  (String) data.next();
		String pos_70 =  (String) data.next();
		String pos_71 =  (String) data.next();
		String pos_72 =  (String) data.next();
		String pos_73 =  (String) data.next();
		String pos_74 =  (String) data.next();
		String pos_75 =  (String) data.next();
		String pos_76 =  (String) data.next();
		String pos_77 =  (String) data.next();
		String pos_78 =  (String) data.next();
		String pos_79 =  (String) data.next();
		String pos_80 =  (String) data.next();*/
%>    


<table cellpadding="0"  cellspacing="0"   >
  <tr valign="bottom"> 
    <td width="170" valign="top"> 
              <tr> 
                <td><table width="90%" border="1" cellspacing="3" cellpadding="3">


                
 
                    <tr align="center">
                      <td rowspan='7'><%=estante%></td>
                      <td nowrap>&nbsp;<%=nivel%></td>
                      <td nowrap>&nbsp;<%=pos_01%><br><%=gconf_bog.getMaterial(estante, nivel, pos_01)%></td>
                      <td nowrap>&nbsp;<%=pos_02%><br><%=gconf_bog.getMaterial(estante, nivel, pos_02)%></td>
                      <td nowrap>&nbsp;<%=pos_03%><br><%=gconf_bog.getMaterial(estante, nivel, pos_03)%></td>
                      <td nowrap>&nbsp;<%=pos_04%><br><%=gconf_bog.getMaterial(estante, nivel, pos_04)%></td>
                      <td nowrap>&nbsp;<%=pos_05%><br><%=gconf_bog.getMaterial(estante, nivel, pos_05)%></td>
                      <td nowrap>&nbsp;<%=pos_06%><br><%=gconf_bog.getMaterial(estante, nivel, pos_06)%></td>
                      <td nowrap>&nbsp;<%=pos_07%><br><%=gconf_bog.getMaterial(estante, nivel, pos_07)%></td>
                      <td nowrap>&nbsp;<%=pos_08%><br><%=gconf_bog.getMaterial(estante, nivel, pos_08)%></td>
                      <td nowrap>&nbsp;<%=pos_09%><br><%=gconf_bog.getMaterial(estante, nivel, pos_09)%></td>
                      <td nowrap>&nbsp;<%=pos_10%><br><%=gconf_bog.getMaterial(estante, nivel, pos_10)%></td>
                      <td nowrap>&nbsp;<%=pos_11%><br><%=gconf_bog.getMaterial(estante, nivel, pos_11)%></td>
                      <td nowrap>&nbsp;<%=pos_12%><br><%=gconf_bog.getMaterial(estante, nivel, pos_12)%></td>
                      <td nowrap>&nbsp;<%=pos_13%><br><%=gconf_bog.getMaterial(estante, nivel, pos_13)%></td>
                      <td nowrap>&nbsp;<%=pos_14%><br><%=gconf_bog.getMaterial(estante, nivel, pos_14)%></td>
                      <td nowrap>&nbsp;<%=pos_15%><br><%=gconf_bog.getMaterial(estante, nivel, pos_15)%></td>
                      <td nowrap>&nbsp;<%=pos_16%><br><%=gconf_bog.getMaterial(estante, nivel, pos_16)%></td>
                      <td nowrap>&nbsp;<%=pos_17%><br><%=gconf_bog.getMaterial(estante, nivel, pos_17)%></td>
                      <td nowrap>&nbsp;<%=pos_18%><br><%=gconf_bog.getMaterial(estante, nivel, pos_18)%></td>
                      <td nowrap>&nbsp;<%=pos_19%><br><%=gconf_bog.getMaterial(estante, nivel, pos_19)%></td>
                      <td nowrap>&nbsp;<%=pos_20%><br><%=gconf_bog.getMaterial(estante, nivel, pos_20)%></td>
                      <td nowrap>&nbsp;<%=pos_21%><br><%=gconf_bog.getMaterial(estante, nivel, pos_21)%></td>
                      <td nowrap>&nbsp;<%=pos_22%><br><%=gconf_bog.getMaterial(estante, nivel, pos_22)%></td>
                      <td nowrap>&nbsp;<%=pos_23%><br><%=gconf_bog.getMaterial(estante, nivel, pos_23)%></td>
                      <td nowrap>&nbsp;<%=pos_24%><br><%=gconf_bog.getMaterial(estante, nivel, pos_24)%></td>
                      <td nowrap>&nbsp;<%=pos_25%><br><%=gconf_bog.getMaterial(estante, nivel, pos_25)%></td>
                      <td nowrap>&nbsp;<%=pos_26%><br><%=gconf_bog.getMaterial(estante, nivel, pos_26)%></td>
                      <td nowrap>&nbsp;<%=pos_27%><br><%=gconf_bog.getMaterial(estante, nivel, pos_27)%></td>
                      <td nowrap>&nbsp;<%=pos_28%><br><%=gconf_bog.getMaterial(estante, nivel, pos_28)%></td>
                      <td nowrap>&nbsp;<%=pos_29%><br><%=gconf_bog.getMaterial(estante, nivel, pos_29)%></td>
                      <td nowrap>&nbsp;<%=pos_30%><br><%=gconf_bog.getMaterial(estante, nivel, pos_30)%></td>
                      <td nowrap>&nbsp;<%=pos_31%><br><%=gconf_bog.getMaterial(estante, nivel, pos_31)%></td>
                      <td nowrap>&nbsp;<%=pos_32%><br><%=gconf_bog.getMaterial(estante, nivel, pos_32)%></td>
                      <td nowrap>&nbsp;<%=pos_33%><br><%=gconf_bog.getMaterial(estante, nivel, pos_33)%></td>
                      <td nowrap>&nbsp;<%=pos_34%><br><%=gconf_bog.getMaterial(estante, nivel, pos_34)%></td>
                      <td nowrap>&nbsp;<%=pos_35%><br><%=gconf_bog.getMaterial(estante, nivel, pos_35)%></td>
                      <td nowrap>&nbsp;<%=pos_36%><br><%=gconf_bog.getMaterial(estante, nivel, pos_36)%></td>
                      <td nowrap>&nbsp;<%=pos_37%><br><%=gconf_bog.getMaterial(estante, nivel, pos_37)%></td>
                      <td nowrap>&nbsp;<%=pos_38%><br><%=gconf_bog.getMaterial(estante, nivel, pos_38)%></td>
                      <td nowrap>&nbsp;<%=pos_39%><br><%=gconf_bog.getMaterial(estante, nivel, pos_39)%></td>
                      <td nowrap>&nbsp;<%=pos_40%><br><%=gconf_bog.getMaterial(estante, nivel, pos_40)%></td>
                      <td nowrap>&nbsp;<%=pos_41%><br><%=gconf_bog.getMaterial(estante, nivel, pos_41)%></td>
                      <td nowrap>&nbsp;<%=pos_42%><br><%=gconf_bog.getMaterial(estante, nivel, pos_42)%></td>
                      <td nowrap>&nbsp;<%=pos_43%><br><%=gconf_bog.getMaterial(estante, nivel, pos_43)%></td>
                      <td nowrap>&nbsp;<%=pos_44%><br><%=gconf_bog.getMaterial(estante, nivel, pos_44)%></td>
                      <td nowrap>&nbsp;<%=pos_45%><br><%=gconf_bog.getMaterial(estante, nivel, pos_45)%></td>
                      <td nowrap>&nbsp;<%=pos_46%><br><%=gconf_bog.getMaterial(estante, nivel, pos_46)%></td>
                      <td nowrap>&nbsp;<%=pos_47%><br><%=gconf_bog.getMaterial(estante, nivel, pos_47)%></td>
                      <td nowrap>&nbsp;<%=pos_48%><br><%=gconf_bog.getMaterial(estante, nivel, pos_48)%></td>
                      <td nowrap>&nbsp;<%=pos_49%><br><%=gconf_bog.getMaterial(estante, nivel, pos_49)%></td>
                      <td nowrap>&nbsp;<%=pos_50%><br><%=gconf_bog.getMaterial(estante, nivel, pos_50)%></td>
                      <td nowrap>&nbsp;<%=pos_51%><br><%=gconf_bog.getMaterial(estante, nivel, pos_51)%></td>
                      <td nowrap>&nbsp;<%=pos_52%><br><%=gconf_bog.getMaterial(estante, nivel, pos_52)%></td>
                      <td nowrap>&nbsp;<%=pos_53%><br><%=gconf_bog.getMaterial(estante, nivel, pos_53)%></td>
                      <td nowrap>&nbsp;<%=pos_54%><br><%=gconf_bog.getMaterial(estante, nivel, pos_54)%></td>
                      <td nowrap>&nbsp;<%=pos_55%><br><%=gconf_bog.getMaterial(estante, nivel, pos_55)%></td>
                      <td nowrap>&nbsp;<%=pos_56%><br><%=gconf_bog.getMaterial(estante, nivel, pos_56)%></td>
                      <td nowrap>&nbsp;<%=pos_57%><br><%=gconf_bog.getMaterial(estante, nivel, pos_57)%></td>
                      <td nowrap>&nbsp;<%=pos_58%><br><%=gconf_bog.getMaterial(estante, nivel, pos_58)%></td>
<%--                      <td nowrap>&nbsp;<%=pos_59%><br><%=gconf_bog.getMaterial(estante, nivel, pos_59)%></td> 
                      <td nowrap>&nbsp;<%=pos_60%><br><%=gconf_bog.getMaterial(estante, nivel, pos_60)%></td>
                      <td nowrap>&nbsp;<%=pos_61%><br><%=gconf_bog.getMaterial(estante, nivel, pos_61)%></td>
                      <td nowrap>&nbsp;<%=pos_62%><br><%=gconf_bog.getMaterial(estante, nivel, pos_62)%></td>
                      <td nowrap>&nbsp;<%=pos_63%><br><%=gconf_bog.getMaterial(estante, nivel, pos_63)%></td>
                      <td nowrap>&nbsp;<%=pos_64%><br><%=gconf_bog.getMaterial(estante, nivel, pos_64)%></td>
                      <td nowrap>&nbsp;<%=pos_65%><br><%=gconf_bog.getMaterial(estante, nivel, pos_65)%></td>
                      <td nowrap>&nbsp;<%=pos_66%><br><%=gconf_bog.getMaterial(estante, nivel, pos_66)%></td>
                      <td nowrap>&nbsp;<%=pos_67%><br><%=gconf_bog.getMaterial(estante, nivel, pos_67)%></td>
                      <td nowrap>&nbsp;<%=pos_68%><br><%=gconf_bog.getMaterial(estante, nivel, pos_68)%></td>
                      <td nowrap>&nbsp;<%=pos_69%><br><%=gconf_bog.getMaterial(estante, nivel, pos_69)%></td>
                      <td nowrap>&nbsp;<%=pos_70%><br><%=gconf_bog.getMaterial(estante, nivel, pos_70)%></td>
                      <td nowrap>&nbsp;<%=pos_71%><br><%=gconf_bog.getMaterial(estante, nivel, pos_71)%></td>
                      <td nowrap>&nbsp;<%=pos_72%><br><%=gconf_bog.getMaterial(estante, nivel, pos_72)%></td>
                      <td nowrap>&nbsp;<%=pos_73%><br><%=gconf_bog.getMaterial(estante, nivel, pos_73)%></td>
                      <td nowrap>&nbsp;<%=pos_74%><br><%=gconf_bog.getMaterial(estante, nivel, pos_74)%></td>
                      <td nowrap>&nbsp;<%=pos_75%><br><%=gconf_bog.getMaterial(estante, nivel, pos_75)%></td>
                      <td nowrap>&nbsp;<%=pos_76%><br><%=gconf_bog.getMaterial(estante, nivel, pos_76)%></td>
                      <td nowrap>&nbsp;<%=pos_77%><br><%=gconf_bog.getMaterial(estante, nivel, pos_77)%></td>
                      <td nowrap>&nbsp;<%=pos_78%><br><%=gconf_bog.getMaterial(estante, nivel, pos_78)%></td>
                      <td nowrap>&nbsp;<%=pos_79%><br><%=gconf_bog.getMaterial(estante, nivel, pos_79)%></td>
                      <td nowrap>&nbsp;<%=pos_80%><br><%=gconf_bog.getMaterial(estante, nivel, pos_80)%></td>
 --%>                    </tr>
                  </table></td>
              </tr>
     </td>
  </tr>
</table>
<% }
}
}
%>
