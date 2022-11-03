select * from entrada

delete  from entrada

select * from lote_contenedor_trafico where lctrafingreso = 'S'

update lote_contenedor_trafico set lctrafingreso = 'N'

2022-1-27 12:15:18 : 
select distinct movimiento.entrada_x_estiba ( 1,procodsx,7,''::character varying,lctrafcantidad,max(reftpesoneto),
 max(reftpesoneto)*lctrafcantidad,max(reftpesoneto), max(reftpesoneto)*lctrafcantidad, 0,0,0,0,max(reftpesoneto),
 max(reftpesoneto)*lctrafcantidad,0,0,proump::character varying, lctraflote,lctrafcodsx)  
 from lote_trafico  
 inner join lote_contenedor_trafico on lctraflote = ltrafcodsx and lctrafcodsx = 21 inner join producto on procodsx = ltrafcodproducto  
 inner join factura_trafico on ftrafnumtrafico = ltrafnumtrafico  
 inner join referencia_trafico on reftnumfacturatrafico = ftrafcodsx and reftproducto = ltrafcodproducto  
 where ltrafnumtrafico = 1 and procodigocia = 1 
 group by procodsx, lctrafcantidad, proump, ltrafcodsx, lctrafcodsx 



2022-1-27 10:48:36 : 

select distinct
 movimiento.entrada_x_estiba ( 1,procodsx,7,''::character varying,lctrafcantidad,max(reftpesoneto), max(reftpesoneto)*lctrafcantidad,max(reftpesoneto),
  max(reftpesoneto)*lctrafcantidad, 0,0,0,0,max(reftpesoneto),max(reftpesoneto)*lctrafcantidad,0,0,proump::character varying, ltrafcodsx) 

   from lote_trafico  inner join lote_contenedor_trafico on lctraflote = ltrafcodsx and lctrafcodsx = 21 inner join producto on procodsx = ltrafcodproducto  inner join factura_trafico on ftrafnumtrafico = ltrafnumtrafico  inner join referencia_trafico on reftnumfacturatrafico = ftrafcodsx and reftproducto = ltrafcodproducto  where ltrafnumtrafico = 1 and procodigocia = 1 group by procodsx, lctrafcantidad, proump, ltrafcodsx, lctrafcodsx 






select (


select distinct movimiento.entrada_x_estiba
 ( 1,procodsx,7,''::character varying,lctrafcantidad,max(reftpesoneto), max(reftpesoneto)*lctrafcantidad,max(reftpesoneto), 
 max(reftpesoneto)*lctrafcantidad, 0,0,0,0,max(reftpesoneto),max(reftpesoneto)*lctrafcantidad,0,0,proump::character varying, ltrafcodsx)
 
  from lote_trafico  
  inner join lote_contenedor_trafico on lctraflote = ltrafcodsx and lctrafcodsx = 21 
  inner join producto on procodsx = ltrafcodproducto  
  inner join factura_trafico on ftrafnumtrafico = ltrafnumtrafico  
  inner join referencia_trafico on reftnumfacturatrafico = ftrafcodsx and reftproducto = ltrafcodproducto 
   where ltrafnumtrafico = 1 and procodigocia = 1 
   group by procodsx, lctrafcantidad, proump,ltrafcodsx,lctrafcodsx  
   --order by procodsx asc
