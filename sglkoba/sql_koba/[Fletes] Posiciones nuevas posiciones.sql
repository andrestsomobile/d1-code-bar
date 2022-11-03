select * from config_bodega order by 1,2,4

"cbbodega";"cbestante";"cbnivel";"cbposicion";"cbestado";"cbentrada";"cbcategoria";"cbproducto"
1;"A";1;"01-1";"AC";;;"12000222"


select * from bodega order by 1

update bodega set bodcodsx = 7 where bodcodsx = 6
update bodega set bodcodsx = 7 where bodcodsx = 6



ALTER TABLE config_bodega ADD COLUMN cbfrente_pos character varying 

update config_bodega set cbfrente_pos = '' where cbfrente_pos is null

ALTER TABLE public.config_bodega DROP CONSTRAINT pk_conf_bod;

ALTER TABLE public.config_bodega
  ADD CONSTRAINT pk_conf_bod PRIMARY KEY(cbbodega, cbestante, cbnivel, cbposicion, cbfrente_pos);

delete from config_bodega where cbbodega = 7

INSERT INTO public.config_bodega(
            cbbodega, cbestante, cbnivel, cbposicion, cbestado, cbfrente_pos)
    VALUES  

SELECT substring(estante,1,1)::text as estanteria, substring(estante,3,1)::int as nivel,*
FROM crosstab_mapa('select cbestante||''-''||cbnivel, cbnivel::text,case when cbestado=''AC'' then cbposicion else ''XX-X'' end::text from config_bodega where cbnivel = substring(cbposicion,4,1)::int and cbestante = ''A'' order by cbestante,cbnivel,cbposicion');


    