<html>
<head>
<script src="./disenno/editablegrid/extensions/jquery/jquery-1.6.4.min.js"></script>
<style type="text/css" media="print">
	@page  
	{ size: auto;   /* auto is the initial value */ 
	
	    /* this affects the margin in the printer settings */ 
	    margin: 5mm 5mm 5mm 5mm;  
	} 
    @media all {
		div.saltopagina { display: none; }
	}
   
	@media print{
   		div.saltopagina{ 
      		display:block; 
     		 page-break-before:always;
   		}
	}
</style> 

<script>
	$(document).ready(function(){
		var sOption="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
	       sOption+="scrollbars=yes,width=850,height=650,left=25,top=25"; 

	   var sWinHTML = document.getElementById('texto_ppal').innerHTML; 
	   
	   var winprint=window.open("","",sOption); 
	       winprint.document.open(); 
	       winprint.document.write('<html><body onload="window.print()">'); 
	       winprint.document.write(sWinHTML);          
	       winprint.document.write('</body><link href="./disenno/templates/Principal/styles.css" rel="stylesheet" type="text/css"  ></html>'); 
	       winprint.document.close(); 
	       winprint.focus(); 
		/*
		if ((navigator.appName == 'Netscape')) { 
			window.print() ;
		} else {
			var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
			document.body.insertAdjacentHTML('beforeEnd', WebBrowser); 
			WebBrowser1.ExecWB(6, -1); 
			WebBrowser1.outerHTML = "";
		}
		window.onfocus = function(){
		    window.close();
		};*/
	});
</script>
	
</head> 

<body>
  <jsp:include flush="true" page='documento_entrega.jsp?tipo=RESUMIDO' /> 
  
 <br><br><br><br><br><br>
  
  <div class="saltopagina"></div>
  
  <jsp:include flush="true" page='documento_entrega.jsp?tipo=DETALLADO' /> 
  
  </body>
  </html>