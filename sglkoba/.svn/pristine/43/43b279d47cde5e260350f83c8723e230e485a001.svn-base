-- Table: public.flete

-- DROP TABLE public.flete;

CREATE TABLE public.flete
(
  flecodsx serial not null,
  flecliente integer NOT NULL,
  flesucursal integer NOT NULL,
  fletransportadora integer NOT NULL,
  fletipoveh character varying NOT NULL,
  flevalor numeric(15,2) NOT NULL,
  resumen text,
  CONSTRAINT pk_flete PRIMARY KEY (flecodsx),
  CONSTRAINT fk_flete_cliente FOREIGN KEY (flecliente)
      REFERENCES public.cliente (clicodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_flete_sucursal FOREIGN KEY (flesucursal)
      REFERENCES public.sucursal (succodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,      
  CONSTRAINT fk_flete_transportador FOREIGN KEY (fletransportadora)
      REFERENCES public.transportadora (transpcodsx) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT uq_flete_transp UNIQUE (flecliente, flesucursal, fletransportadora,fletipoveh)
)
WITH (
  OIDS=TRUE
);
ALTER TABLE public.flete
  OWNER TO postgres;
COMMENT ON TABLE public.flete
  IS 'Guarda informacion de fletes para manejo de transportadora y sus tarifas';


select * from cliente order by 1 desc limit 50
"clicodsx";"clinombre";"clinit";"clidireccion";"clitelefono";"cliciudad";"clicontacto";"climail";"cliobservacion";"clicodcompania";"resumen";"clicodigo";"clidevolucion"
1;"6AI1 - BODEGA IMPORTADOS";"1";"Cra 50 # 97 b sur - 181";"(4) 4484540";25817;"0";"";"";1;"1 6AI1 - BODEGA IMPORTADOS 1 BODEGA IMPORTADOS 6AI1";"6AI1";"S"


select succodsx,sucnombre,succodigo from sucursal  where succodcliente =1 order by 3

select * from transportadora 

select distinct desptipoveh From despacho 
"desptipoveh"
"DOBLETROQUE"
"MULA"
"TURBO"
"MINIMULA"
"SENCILLO"

select distinct desptransportadora, transpnombre from despacho inner join transportadora on transpcodsx = desptransportadora order by 1

"desptransportadora";"transpnombre"
1;"Union Andina de Transportes S.A"
2;"AJUSTE SALIDAS "
3;"LOGITRANSPORTES"
4;"TIMON"
5;"ALDIA"
6;"NISSI"
7;"A&T"
27;"COLTANQUES"
34;"BOTERO SOTO"
47;"DITRANSA"
140;"KOBA"



update despacho set desptipoveh = 'MINIMULA' where desptipoveh = 'PATINETA'

select * from pedido order by 1 desc limit 10

select despcodsx, desptransportadora, transpnombre, desptipoveh, pedcodsx, pednumpedido
,*
from despacho
inner join transportadora on transpcodsx = desptransportadora
inner join despacho_pedido on despcodsx = despeddespacho
inner join pedido on pedcodsx = despedpedido
order by 1 desc

select * from flete order by 1

update flete set resumen = resumen ;

SELECT * FROM flete where resumen like '%%' order by flecodsx desc  limit 10 offset  0