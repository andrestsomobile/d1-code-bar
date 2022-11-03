select 
* 
from reubicacion 
left join reubic_nacdetalle on renreubicacion = recodsx
left join nacionalizacion_detalle as ori on ori.nadcodsx = renacdetalle_or
left join nacionalizacion_detalle as fin on fin.nadcodsx = renacdetalle_fin

order by 1 desc limit 50

-- select * from reubic_nacdetalle limit 1

-- select * from nacionalizacion_detalle limit 1