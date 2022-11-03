select * from usuario order by 1

SELECT comcodsx,comnombre, cominventario FROM compania 
--WHERE cominventario = 'V'
order by 1

select clicodsx, clinombre, clicodcompania, comnombre, cominventario
from cliente
inner join compania on comcodsx = clicodcompania
WHERE cominventario = 'V'
order by 1

select clicodsx, clinombre, clicodcompania, comnombre, succodsx, sucnombre, succodigo
from sucursal  
inner join cliente on clicodsx = succodcliente 
inner join compania on comcodsx = clicodcompania
--inner join config C on C.cfnombre = 'dn_182' and string_to_array(succodigo::text,',') && string_to_array(C.cfvalor,',')
--WHERE cominventario = 'V'
order by sucnombre

select * from distnal_ingreso limit 20 

select * from distnal_ingreso limit 20 

select * from distnal_despacho limit 20 

select* from sucursal
inner join config C on C.cfnombre = 'dn_182' and string_to_array(succodigo::text,',') && string_to_array(C.cfvalor,',')
		 

