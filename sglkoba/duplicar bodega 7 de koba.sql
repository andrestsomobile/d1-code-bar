select * from bodega
'bodcodsx';'bodnombre';'boddesc';'bodurlplano';'resumen'
7;'BODEGA 2';'BODEGA 2';'6';'7 BODEGA 2'

insert into bodega (bodcodsx,bodnombre,boddesc,bodurlplano) values (default,'BODEGA ESPEJO','BODEGA ESPEJO','Bodega Espejo')

'cbbodega';'cbestante';'cbnivel';'cbposicion';'cbestado';'cbentrada';'cbcategoria';'cbproducto';'cbfrente_pos'
7;'M';5;'17F-5';'AC';;;'12000204';'F'

insert into config_bodega
select (select bodcodsx from bodega where bodnombre = 'BODEGA ESPEJO')
,cbestante,cbnivel,cbposicion,cbestado,null,cbcategoria,cbproducto,cbfrente_pos
 from config_bodega where cbbodega = 7