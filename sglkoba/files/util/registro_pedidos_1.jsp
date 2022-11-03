<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<head>
<title>SLI Sistemas Logisticos Industriales S.A.</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="./disenno/templates/Principal/styles.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="./disenno/templates/Principal/images/favicon.ico">


<link rel="stylesheet" href="./disenno/editablegrid/editablegrid-2.0.1.css" type="text/css" media="screen">

<link rel="stylesheet" type="text/css" media="all" href="./files/pedido/tabcontrol/metro.css">
<link rel="stylesheet" type="text/css" href="./disenno/editablegrid/demo.css" media="screen" />

<style>
body {
	font-family: 'lucida grande', tahoma, verdana, arial, sans-serif;
	font-size: 11px;
}
h1 {
	font-size: 15px;
}
a {
	color: #548dc4;
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}
table.testgrid {
	border-collapse: collapse;
	border: 1px solid #CCB;
	width: 800px;
}
table.testgrid td,table.testgrid th {
	padding: 5px;
	border: 1px solid #E0E0E0;
}
table.testgrid th {
	background: #E5E5E5;
	text-align: left;
}
input.invalid {
	background: red;
	color: #FDFDFD;
}
</style>
<script type="text/javascript">
  
window.onload = function() {
  document.validacionFrm.cedula.focus();
}
</script>

</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" onload="">

<BR>
<div class="titulo"> <h1 align="center">REGISTRO DE PEDIDOS </h1></div> 
<div align="right" class="header">
		<a href="./files/pedido/tablero_control.jsp" ><img src="./files/pedido/tabcontrol/images/regresar.png" width="50" height="50"></a>

<table width="75" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000">
  <tr>

  <table width="75" border="0" align="center" cellpadding="0" cellspacing="0" >
          <br>

        <tr>


        </tr>
        <tr>
          <td width="60" align="center"> <table width="45%" border="0" cellpadding="1" cellspacing="1" bgcolor="#666666">
              <tr>
                <td bgcolor="E3EDFF">

				<form action=./registro_pedidos_detalle.jsp&opcion=crear name="validacionFrm" method='post'>
				<table width="90" border="0" cellpadding="2" cellspacing="0" class="principal">
                    <tr>
                      <td colspan="4" valign="top"><img src="./disenno/templates/Principal/images/index/spacer.gif" width="20" height="4"></td>
                    </tr>

                    <tr>
                      <td colspan="4" valign="middle"><img src="./disenno/templates/Principal/images/index/spacer.gif" width="20" height="4"></td>
                    </tr>
                    <tr>
                      <td valign="top">&nbsp;</td>
                      <td valign="middle"><img src="./disenno/templates/Principal/images/index/dots.gif" width="10" height="10"></td>
                      <td><font color="#666666">Empleado</font></td>
                      <td><input type="password" name="cedula" style="background-color: ffffff"> </td>
                    </tr>
                    <tr>

                    </tr>
                  </table>
				  </form>
				  </td>
              </tr>
            </table>
            <br>
            <br> </td>

        </tr>
        <tr>
          <td colspan="2" valign="bottom"><table width="82%" border="0" cellspacing="0" cellpadding="8">
<input type="hidden" value="crear" name="crear" />
            </table></td>
        </tr>
      </table>
  </tr>
</table>

</div>

</body>
</html>
