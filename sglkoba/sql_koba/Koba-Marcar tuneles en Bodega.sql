-- ojo preguntar por tuneles AA

-- Marcar tuneles en la bodega
update config_bodega set cbestado = 'AC';

update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'B' and cbposicion in ('11-3','11-2','11-1','12-3','12-2','12-1','35-3','35-2','35-1','36-3','36-2','36-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'C' and cbposicion in ('11-3','11-2','11-1','12-3','12-2','12-1','35-3','35-2','35-1','36-3','36-2','36-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'D' and cbposicion in ('11-3','11-2','11-1','12-3','12-2','12-1','35-3','35-2','35-1','36-3','36-2','36-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'E' and cbposicion in ('11-3','11-2','11-1','12-3','12-2','12-1','35-3','35-2','35-1','36-3','36-2','36-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'F' and cbposicion in ('11-3','11-2','11-1','12-3','12-2','12-1','35-3','35-2','35-1','36-3','36-2','36-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'G' and cbposicion in ('19-3','19-2','19-1','20-3','20-2','20-1','43-3','43-2','43-1','44-3','44-2','44-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'H' and cbposicion in ('19-3','19-2','19-1','20-3','20-2','20-1','43-3','43-2','43-1','44-3','44-2','44-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'I' and cbposicion in ('19-3','19-2','19-1','20-3','20-2','20-1','43-3','43-2','43-1','44-3','44-2','44-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'J' and cbposicion in ('19-3','19-2','19-1','20-3','20-2','20-1','43-3','43-2','43-1','44-3','44-2','44-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'K' and cbposicion in ('19-3','19-2','19-1','20-3','20-2','20-1','43-3','43-2','43-1','44-3','44-2','44-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'L' and cbposicion in ('19-3','19-2','19-1','20-3','20-2','20-1','43-3','43-2','43-1','44-3','44-2','44-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'M' and cbposicion in ('19-3','19-2','19-1','20-3','20-2','20-1','43-3','43-2','43-1','44-3','44-2','44-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'N' and cbposicion in ('19-3','19-2','19-1','20-3','20-2','20-1','43-3','43-2','43-1','44-3','44-2','44-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'O' and cbposicion in ('19-3','19-2','19-1','20-3','20-2','20-1','43-3','43-2','43-1','44-3','44-2','44-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'P' and cbposicion in ('19-3','19-2','19-1','20-3','20-2','20-1','43-3','43-2','43-1','44-3','44-2','44-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'Q' and cbposicion in ('19-3','19-2','19-1','20-3','20-2','20-1','43-3','43-2','43-1','44-3','44-2','44-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'R' and cbposicion in ('01-3','01-2','01-1','02-3','02-2','02-1');
update config_bodega set cbentrada = null, cbestado = 'IN' where cbbodega = 1 and cbestante = 'S' and cbposicion in ('09-1','10-1','09-2','10-2','37-1','38-1','37-2','38-2');

--listado de tuneles

---   select * from config_bodega where cbestado = 'IN' order by cbestante,cbnivel,cbposicion