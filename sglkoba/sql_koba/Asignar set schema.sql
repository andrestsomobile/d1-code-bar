SHOW search_path
--"$user",public

SET search_path = "$user",public, movimiento,interfaces

select * from despacho limit 10