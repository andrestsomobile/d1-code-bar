select * from pedido where pednumpedido = '4855989'
"pedcodsx";"pedcompania";"pednumpedido";"pedordencompra";"pedguia";"pedfechasistema";"pedfecha";"pedfechavenc";"pedfechacita";"pedhoracita";"pedcliente";"pedsucursal";"peddireccion";"pedciudad";"peddepartamento";"pedobservaciones";"pedfactura";"pedestado";"pedsubtotal";"pediva";"peddescuento";"pedtotal";"pedtipo";"pedpicking";"pedpesoneto";"pedpesobruto";"pedhora";"pedzona";"pedcausal_hit";"resumen";"pedporc_iva";"pedtransportadora";"pedfactotal";"pedfechaalistamiento";"pedfechadespacho";"pedfechaentrega"
285;1;"4855989";"4855989";"285";"2019-10-04 16:41:46";"2019-10-04";"2019-10-03";"2019-10-04";"00:00:00";1;3;"Km 1.5 Via Cerrito La Florida Parque Industrial Zon Funza Bodega Koba 2";25214;25;"";"1";"TRAMITE";457.00;73.12;0.00;530.12;"NAC";;4461.00;4461.00;"16:41:46";5;1;"285 2019-10-04 16:41:46 4855989 285 4855989 1 TRAMITE BODEGA IMPORTADOS 6AI1 - BODEGA IMPORTADOS COTA CUNDINAMARCA 12000286 SPAGUETTI DELIZIARE 500 GRS X 20 12000294 CONSERVA DE PESCADO CARLO FORTE 425 GRS 12000330 ACEITE OLIVA EXTRAVIR CASTELL D F 500 ML";16.00;140;457.00;"2019-10-05 00:00:00";"2019-10-07 00:00:00";"2019-10-07 00:00:00"

select * from pedido where pedcodsx IN ( 324,325)
"pedcodsx";"pedcompania";"pednumpedido";"pedordencompra";"pedguia";"pedfechasistema";"pedfecha";"pedfechavenc";"pedfechacita";"pedhoracita";"pedcliente";"pedsucursal";"peddireccion";"pedciudad";"peddepartamento";"pedobservaciones";"pedfactura";"pedestado";"pedsubtotal";"pediva";"peddescuento";"pedtotal";"pedtipo";"pedpicking";"pedpesoneto";"pedpesobruto";"pedhora";"pedzona";"pedcausal_hit";"resumen";"pedporc_iva";"pedtransportadora";"pedfactotal";"pedfechaalistamiento";"pedfechadespacho";"pedfechaentrega"
284;1;"4855974";"4855974";"284";"2019-10-04 16:41:46";"2019-10-04";"2019-10-03";"2019-10-04";"00:00:00";1;3;"Km 1.5 Via Cerrito La Florida Parque Industrial Zon Funza Bodega Koba 2";25214;25;"";"1";"TRAMITE";460.00;73.60;0.00;533.60;"NAC";;4476.00;4476.00;"16:41:46";5;1;"284 2019-10-04 16:41:46 4855974 284 4855974 1 TRAMITE BODEGA IMPORTADOS 6AI1 - BODEGA IMPORTADOS COTA CUNDINAMARCA 12000204 ATUN EN AGUA CARLO FORTE 170 GRS 12000205 ATUN EN ACEITE CARLO FORTE 170 GRS 12000222 TOALLITAS HUMEDAS LITTLE ANGELS 72 UND 1200028 (...)";16.00;140;460.00;"2019-10-05 00:00:00";"2019-10-07 00:00:00";"2019-10-07 00:00:00"


select * from registro_pedido_detalle  where rpdenumpedido  = 285

update  registro_pedido_detalle set rpdeterminado ='S'  where rpdenumpedido  = 285



select * from registro_pedido_detalle  WHERE rpderegped = 195



update  registro_pedido_detalle set rpdeterminado ='N' WHERE rpderegped = 195 ---rpdecodsx = '245' 

"rpdecodsx";"rpderegped";"rpdenumpedido";"rpdetire";"rpdeterminado"
245;195;324;"00:00:00";"N"
246;195;323;"00:00:00";"N"

select * from registro_pedido  where repecodsx  = 195
"repecodsx";"repefecha";"repeempleado";"repehoin";"repehofi";"repecanped";"repeesta"
195;"2019-10-08";5;"11:22:07.461578";"00:00:00";0;"TRAMITE"

select * from registro_pedido_detalle  WHERE rpderegped = 195

update registro_pedido set repeesta='TRAMITE' where repecodsx  = 195;
update  registro_pedido_detalle set rpdeterminado ='N' WHERE rpderegped = 195  ;


select * from empleado  where empcodsx  = 5
"empcedula"
"1092342547"


 UPDATE registro_pedido_detalle set rpdeterminado = 'S', rpdetire = CURRENT_TIME-repehoin FROM registro_pedido  WHERE rpdecodsx = '245' ;--AND rpderegped = repecodsx;
  UPDATE registro_pedido_detalle set rpdeterminado = 'S', rpdetire = CURRENT_TIME-repehoin FROM registro_pedido  WHERE rpdecodsx = '246' ;--AND rpderegped = repecodsx;

select pedestado,* from pedido where pedcodsx IN ( 324,323)

update pedido set pedestado='TRAMITE' where pedcodsx IN ( 324,323)


 select * from registro_pedido_detalle  WHERE rpdecodsx = '245' AND rpderegped = repecodsx

 		String cad = "UPDATE registro_pedido_detalle set rpdeterminado = 'S', rpdetire = CURRENT_TIME-repehoin FROM registro_pedido "
					+ " WHERE rpdecodsx = " + (rpdecodsx == null ? "NULL" : "'" + rpdecodsx + "'")
					+ " AND rpderegped = repecodsx";
			int resp = db.executeUpdate(cad);


			Se finalizará alistamiento rpdecodsx= 245
2019-10-9 16:16:16 : UPDATE registro_pedido_detalle set rpdeterminado = 'S', rpdetire = CURRENT_TIME-repehoin FROM registro_pedido  WHERE rpdecodsx = '245'
2019-10-9 16:16:16 : SELECT rpdecodsx, pednumpedido, empnombre,repefecha,pedfechasistema FROM registro_pedido_detalle inner join registro_pedido on repecodsx = rpderegped and repeesta = 'TRAMITE' and rpdeterminado = 'N' inner join empleado on empcodsx = repeempleado and empcedula like '%1092342547%' inner join pedido on pedcodsx = rpdenumpedido order by rpdecodsx
Se finalizará alistamiento rpdecodsx= 246
2019-10-9 16:16:18 : UPDATE registro_pedido_detalle set rpdeterminado = 'S', rpdetire = CURRENT_TIME-repehoin FROM registro_pedido  WHERE rpdecodsx = '246'
2019-10-9 16:16:18 : SELECT rpdecodsx, pednumpedido, empnombre,repefecha,pedfechasistema FROM registro_pedido_detalle inner join registro_pedido on repecodsx = rpderegped and repeesta = 'TRAMITE' and rpdeterminado = 'N' inner join empleado on empcodsx = repeempleado and empcedula like '%1092342547%' inner join pedido on pedcodsx = rpdenumpedido order by rpdecodsx
