

<!DOCTYPE html>
<!-- saved from url=(0038)http://html.cerchez.com/metro-layout/# -->
<html lang="en" class="csstransforms csstransforms3d csstransitions"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<meta charset="utf-8">
	
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" media="all" href="./tabcontrol/metro.css">
	<script src="./tabcontrol/jquery.min.js"></script>
	<script src="./tabcontrol/jquery.plugins.min.js"></script>
	<script src="./tabcontrol/metro.js"></script>
	<!--[if lt IE 9]>
		<script src="js/respond.min.js"></script>
	<![endif]-->
</head> 
<body>
    <br>
	<div class="metro-layout vertical">
		<div class="header">
			<h2 align="center">Tablero Control</h2>
			<div class="controls">
				<span class="down" title="Scroll down" style=""></span>
				<span class="up" title="Scroll up" style=""></span>
				<span class="next" title="Scroll left" style="display: none;"></span>
				<span class="prev" title="Scroll right" style="display: none;"></span>
				<span class="toggle-view" title="Toggle layout"></span>
				<a href="../../main.jsp?app=pedido" ><img src="./tabcontrol/images/regresar.png" width="50" height="50"></a>

			</div>
		</div>
	
		<div class="content clearfix">
			<div class="items isotope" style="width: auto; height: 800px;">
				<a class="box isotope-item" href="./tabcontrol/reg_pedidos.jsp" style="position: absolute; left: 0px; top: 0px; transform: translate3d(564px, 320px, 0px); ">
					<span>Registro<br> Pedidos</span>
					<img class="icon" src="./tabcontrol/images/reg_pedidos.jpg" alt="Pedidos">
				</a>
				
				<a class="box isotope-item" href="./tabcontrol/alistamiento.jsp" style="position: absolute; left: 0px; top: 0px; transform: translate3d(564px, 320px, 0px); background: rgb(245, 141, 0);">
					<span>Finalizar<br>Alistamiento</span>
					<img class="icon" src="./tabcontrol/images/alistamiento.png" alt="Finalizar Alistamiento">
				</a>
				<a class="box isotope-item" href="#" style="position: absolute; left: 0px; top: 0px; transform: translate3d(20px, 160px, 0px);">
					<span></span>
					<img class="cover" src="./tabcontrol/images/bg2.jpg" alt="">
				</a>
				<a class="box isotope-item" href="./tabcontrol/pendientes_despacho.jsp" style="position: absolute; left: 0px; top: 0px; transform: translate3d(564px, 320px, 0px); background: rgb(211, 44, 44);">
					<span>Pedidos <br>Pendientes</span>
					<img class="icon" src="./tabcontrol/images/pedidos.png" alt="Pedidos">
				</a>
				<a class="box isotope-item" href="#" style="position: absolute; left: 0px; top: 0px; transform: translate3d(20px, 160px, 0px);">
					<span></span>
					<img class="cover" src="./tabcontrol/images/bg1.jpg" alt="">
				</a>
				<a class="box isotope-item" href="./tabcontrol/carga.jsp" style="position: absolute; left: 0px; top: 0px; transform: translate3d(836px, 160px, 0px); background: rgb(100, 15, 108);">
					<span>Carga</span>
					<img class="icon" src="./tabcontrol/images/carga.png" alt="">
				</a>
				<a class="box isotope-item" href="#" style="position: absolute; left: 0px; top: 0px; transform: translate3d(564px, 320px, 0px);">
<%-- 					<span><%@include file="./tabcontrol/resumen.jsp" %></span> --%>
						<img class="cover" src="./tabcontrol/images/bg.png" alt="">
				</a>
				<a class="box isotope-item" href="./tabcontrol/despachos.jsp"  style="position: absolute; left: 0px; top: 0px; transform: translate3d(836px, 160px, 0px); background: rgb(67, 181, 31);">
					<span>Despachos</span>
					<img class="icon" src="./tabcontrol/images/despachos.png" alt="">
				</a>
								

			</div>
		</div>
	</div>


</body></html>
