--ALTER TABLE public.config_bodega DROP COLUMN cbcodproducto;
--ALTER TABLE public.config_bodega DROP COLUMN cbproducto;

--ALTER TABLE public.config_bodega ADD COLUMN cbcodproducto integer;
--ALTER TABLE public.config_bodega ADD COLUMN cbproducto character varying;

 --select *,substring(cbposicion from 1 for 2) from config_bodega where cbestante = 'X' and cbnivel in (1,2,3,4,5)
 --limit 100 
 
--12000789	CERVEZA BRUNONIA LAGER 330 ML	24	100	LICORES	A	286	X(1,2,3,4,5/27-52);Y(2,3,4,5,6/27-52);W(1/27-50)52 DE 1/2 ESTIBA

 
update config_bodega set cbproducto = '12000789' where cbestante = 'X' and cbnivel in (1,2,3,4,5) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;
update config_bodega set cbproducto = '12000789' where cbestante = 'Y' and cbnivel in (2,3,4,5,6) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;
update config_bodega set cbproducto = '12000789' where cbestante = 'W' and cbnivel in (1) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;

--12000612	VINO CABERNET SAUVIGNON  RESERVA QLC 750	6	110	LICORES	A	78	T(4,5,6/27-52)

update config_bodega set cbproducto = '12000612' where cbestante = 'T' and cbnivel in (4,5,6) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;

--12000744	GALLETA BISCOLATA RELLENA	24	48	LINEA	A	500	B(6)-C(7)-D(7)-E(6);F(6);H(6);I(7)
update config_bodega set cbproducto = '12000744' where cbestante = 'B' and cbnivel in (7) ;
update config_bodega set cbproducto = '12000744' where cbestante = 'C' and cbnivel in (7) ;
update config_bodega set cbproducto = '12000744' where cbestante = 'D' and cbnivel in (7) ;
update config_bodega set cbproducto = '12000744' where cbestante = 'E' and cbnivel in (7) ;
update config_bodega set cbproducto = '12000744' where cbestante = 'F' and cbnivel in (7) ;
update config_bodega set cbproducto = '12000744' where cbestante = 'G' and cbnivel in (7) ;
update config_bodega set cbproducto = '12000744' where cbestante = 'H' and cbnivel in (7) ;
update config_bodega set cbproducto = '12000744' where cbestante = 'I' and cbnivel in (7) ;


--12000590	ATÚN ACEITE DE OLIVA CARLO FORTE 160 G	48	88	LINEA	A	78	V(1,2,3/1-26)
update config_bodega set cbproducto = '12000590' where cbestante = 'V' and cbnivel in (1,2,3) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12000717	SHAMPOO 2 EN 1 KOLORS 400 ML	12	120	LINEA	A	108	N(1,2)
update config_bodega set cbproducto = '12000717' where cbestante = 'N' and cbnivel in (1,2) ;

--12000285	CREMA AVELLANAS CON CACAO NUZART 350 GRS	12	120	LINEA	A	116	M(4;5)
update config_bodega set cbproducto = '12000285' where cbestante = 'M' and cbnivel in (4,5) ;

--12001563	BARQUILLOS RELLENOS DE CREMA NUZART 150G	12	120	LINEA	A	104	U(4,5,6/1-26); V(6/1-26)
update config_bodega set cbproducto = '12001563' where cbestante = 'U' and cbnivel in (4,5,6) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;
update config_bodega set cbproducto = '12001563' where cbestante = 'V' and cbnivel in (6) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12000204	ATÚN EN AGUA CARLO FORTE 170 GRS	48	88	LINEA	A	324	G-H(1,2,3)
update config_bodega set cbproducto = '12000744' where cbestante = 'G' and cbnivel in (1,2,3) ;
update config_bodega set cbproducto = '12000744' where cbestante = 'H' and cbnivel in (1,2,3) ;

--12000389	ATÚN RALLADO EL NAVÍO 170 GRS	48	88	LINEA	A	324	K-L(1,2,3)
update config_bodega set cbproducto = '12000389' where cbestante = 'K' and cbnivel in (1,2,3) ;
update config_bodega set cbproducto = '12000389' where cbestante = 'L' and cbnivel in (1,2,3) ;

--12000383	TOALLA DESMAQUILLANT NATURAL FEEL 30 UND	24	84	LINEA	A	156	X(1,2,3/1-26); Y(1,2,3/1-26)
update config_bodega set cbproducto = '12000383' where cbestante = 'X' and cbnivel in (1,2,3) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;
update config_bodega set cbproducto = '12000383' where cbestante = 'Y' and cbnivel in (1,2,3) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12000801	ENSALADA ATÚN/VEGET/MAÍZ CARLO FO 160 GR	48	88	LINEA	A	78	U(1,2,3/1-26)
update config_bodega set cbproducto = '12000801' where cbestante = 'U' and cbnivel in (1,2,3) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12001027	CIRUELA PREM SIN SEMILLA SOFRUCO 200 GRS	40	56	LINEA	A	104	W(1,3,7/1-26)
update config_bodega set cbproducto = '12001027' where cbestante = 'W' and cbnivel in (1,3,7) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;


--12000718	GEL DE BAÑO NATURAL FEELING 750 ML	12	80	LINEA	A	162	O(1,2,3)
update config_bodega set cbproducto = '12000718' where cbestante = 'O' and cbnivel in (1,2,3) ;

--12000495	BEBIDA DE ALMENDRA ORIGINA	12	75	LINEA	A	116	P(4,5)
update config_bodega set cbproducto = '12000495' where cbestante = 'P' and cbnivel in (4,5);

--12000294	CONSERVA DE PESCADO CARLO FORTE 425 GRS	24	81	LINEA	A	216	M(1,2,3);P(2)
update config_bodega set cbproducto = '12000294' where cbestante = 'M' and cbnivel in (1,2,3);
update config_bodega set cbproducto = '12000294' where cbestante = 'P' and cbnivel in (2);

--12000356	CREMA DE AVELLANAS DUO NUZART 350 GRS	12	120	LINEA	A	104	S(4,5/1-26);T(4-5/1-26)
update config_bodega set cbproducto = '12000356' where cbestante = 'S' and cbnivel in (4,5) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;
update config_bodega set cbproducto = '12000356' where cbestante = 'T' and cbnivel in (4,5) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12000719	CREMA CORPORAL NATURAL FEELING 500 ML	12	115	LINEA	A	116	N(4,5)
update config_bodega set cbproducto = '12000719' where cbestante = 'N' and cbnivel in (4,5);

--12000330	ACEITE OLIVA EXTRAVIR CASTELL D F 500 ML	12	88	LINEA	A	348	R(4,5,6)-Q(4,5,6)
update config_bodega set cbproducto = '12000330' where cbestante = 'R' and cbnivel in (4,5,6);
update config_bodega set cbproducto = '12000330' where cbestante = 'Q' and cbnivel in (4,5,6);

--12000205	ATÚN EN ACEITE CARLO FORTE 170 GRS	48	88	LINEA	A	324	I-J(1,2,3)
update config_bodega set cbproducto = '12000205' where cbestante = 'I' and cbnivel in (1,2,3);
update config_bodega set cbproducto = '12000205' where cbestante = 'J' and cbnivel in (1,2,3);

--12000994	GALLETA NEGRITA 6 UND BLACK OUT 228 GRS	28	56	LINEA	A	330	R(1,2,3)-Q(1,2,3)
update config_bodega set cbproducto = '12000994' where cbestante = 'R' and cbnivel in (1,2,3);
update config_bodega set cbproducto = '12000994' where cbestante = 'Q' and cbnivel in (1,2,3);

--12000476	MASMELOS MICHEL 120 GRS	30	50	LINEA	A	284	J(7);K(6);M(6);P(7);S(1-26;6);T(1-26;6)
update config_bodega set cbproducto = '12000476' where cbestante = 'J' and cbnivel in (7);
update config_bodega set cbproducto = '12000476' where cbestante = 'K' and cbnivel in (6);
update config_bodega set cbproducto = '12000476' where cbestante = 'M' and cbnivel in (6);
update config_bodega set cbproducto = '12000476' where cbestante = 'P' and cbnivel in (7);
update config_bodega set cbproducto = '12000476' where cbestante = 'S' and cbnivel in (6) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;
update config_bodega set cbproducto = '12000476' where cbestante = 'T' and cbnivel in (6) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12000382	TOALLA DESINFECTANTE BRILLA KING 50 UND	24	50	LINEA	A	116	N(6);0(7)
update config_bodega set cbproducto = '12000382' where cbestante = 'N' and cbnivel in (6);
update config_bodega set cbproducto = '12000382' where cbestante = 'O' and cbnivel in (7);

--12000286	SPAGUETTI DELIZIARE 500 GRS	12	144	LINEA	A	516	C-D-E-F-G(4,5NIVEL)
update config_bodega set cbproducto = '12000286' where cbestante = 'C' and cbnivel in (4,5);
update config_bodega set cbproducto = '12000286' where cbestante = 'D' and cbnivel in (4,5);
update config_bodega set cbproducto = '12000286' where cbestante = 'E' and cbnivel in (4,5);
update config_bodega set cbproducto = '12000286' where cbestante = 'F' and cbnivel in (4,5);
update config_bodega set cbproducto = '12000286' where cbestante = 'G' and cbnivel in (4,5);

--12000287	PENNE DELIZIARE 500 GRS	12	60	LINEA	A	350	A(4,5,6);B(4,5);C-D(6)
update config_bodega set cbproducto = '12000287' where cbestante = 'A' and cbnivel in (4,5,6);
update config_bodega set cbproducto = '12000287' where cbestante = 'B' and cbnivel in (4,5);
update config_bodega set cbproducto = '12000287' where cbestante = 'C' and cbnivel in (6);
update config_bodega set cbproducto = '12000287' where cbestante = 'D' and cbnivel in (6);

--12000222	TOALLITAS HÚMEDAS LITTLE ANGELS 72 UND	24	40	LINEA	A	840	A-F(1,2,3NIVEL)
update config_bodega set cbproducto = '12000222' where cbestante = 'A' and cbnivel in (1,2,3);
update config_bodega set cbproducto = '12000222' where cbestante = 'B' and cbnivel in (1,2,3);
update config_bodega set cbproducto = '12000222' where cbestante = 'C' and cbnivel in (1,2,3);
update config_bodega set cbproducto = '12000222' where cbestante = 'D' and cbnivel in (1,2,3);
update config_bodega set cbproducto = '12000222' where cbestante = 'E' and cbnivel in (1,2,3);
update config_bodega set cbproducto = '12000222' where cbestante = 'F' and cbnivel in (1,2,3);

--12000381	VINO CARMENERE QUINTA LAS CABRAS 750 ML	6	110	LICORES	B	112	U(1,2,3,4/27-52)
update config_bodega set cbproducto = '12000381' where cbestante = 'U' and cbnivel in (1,2,3,4) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;

--12000279	VINO CABERNET SAUVIGNON QLC 750 ML	6	110	LICORES	B	112	V(1,2,3,4/27-52)
update config_bodega set cbproducto = '12000279' where cbestante = 'V' and cbnivel in (1,2,3,4) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;

--12000280	VINO ROSE QLC 750 ML	6	110	LICORES	B	78	T(1,2,3/27-52)
update config_bodega set cbproducto = '12000280' where cbestante = 'T' and cbnivel in (1,2,3) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;

--12000278	VINO CARMENERE RESERVA QLC 750 ML	6	110	LICORES	B	74	S(1,2,3/27-52)
update config_bodega set cbproducto = '12000278' where cbestante = 'S' and cbnivel in (1,2,3) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;

--12001947	VINO RESERVA CHARDONNAY	6	110	LICORES	B	26	U(6/27-52)
update config_bodega set cbproducto = '12001947' where cbestante = 'U' and cbnivel in (6) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;

--12001792	AGUA MICELAR DELIA 200 ML	12	240	LINEA	B	52	X(4,5/1-26)
update config_bodega set cbproducto = '12001792' where cbestante = 'X' and cbnivel in (4,5) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12000281	VINO SAUVIGNON BLANC QLC 750 ML	6	110	LICORES	B	52	V(5,6/27-52)
update config_bodega set cbproducto = '12000281' where cbestante = 'V' and cbnivel in (5,6) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;

--12000419	GALLETA CARMELLO CLASSIC BERGEN 140 GRS	18	120	LINEA	B	116	G-L(6)
update config_bodega set cbproducto = '12000419' where cbestante = 'G' and cbnivel in (6);
update config_bodega set cbproducto = '12000419' where cbestante = 'H' and cbnivel in (6);
update config_bodega set cbproducto = '12000419' where cbestante = 'I' and cbnivel in (6);
update config_bodega set cbproducto = '12000419' where cbestante = 'J' and cbnivel in (6);
update config_bodega set cbproducto = '12000419' where cbestante = 'K' and cbnivel in (6);
update config_bodega set cbproducto = '12000419' where cbestante = 'L' and cbnivel in (6);

--12000451	SALSA BOLOÑESA DELIZIARE 400 GRS	6	210	LINEA	B	116	J(4-5)
update config_bodega set cbproducto = '12000451' where cbestante = 'j' and cbnivel in (4,5);

--12000450	SALSA NAPOLITANA DELIZIARE 400 GRS	6	210	LINEA	B	116	I(4,5)
update config_bodega set cbproducto = '12000450' where cbestante = 'I' and cbnivel in (4,5);

--12002433	GALLETA HAPPY WAFER VAINILLA	36	63	LINEA	B	52	U(7);V(7)
update config_bodega set cbproducto = '12002433' where cbestante = 'U' and cbnivel in (7);
update config_bodega set cbproducto = '12002433' where cbestante = 'V' and cbnivel in (7);

--12000928	GALLETA BISCOLATA MINI 117G	24	128	LINEA	B	58	I(6)
update config_bodega set cbproducto = '12000928' where cbestante = 'I' and cbnivel in (6);

--12001744	MERMELADA FRUTOS BOSQUE LORETO X 350 G	12	136	LINEA	B	52	V(4,5/1-26)
update config_bodega set cbproducto = '12001744' where cbestante = 'V' and cbnivel in (4,5) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12000503	FRUTAS EN ALMÍBAR 4 UN TREE FRUTS 452 GR	12	77	LINEA	B	54	P(3)
update config_bodega set cbproducto = '12000503' where cbestante = 'P' and cbnivel in (3);

--12000555	BEBIDA ENERGIZANTE CONTACT DRINK 250 ML	24	128	LINEA	B	116	H(4,5)
update config_bodega set cbproducto = '12000555' where cbestante = 'H' and cbnivel in (4,5);

--12001238	MAÍZ GIGANTE FRITO SALADO NUTHOS FIESTA	12	96	LINEA	B	52	Z(6)
update config_bodega set cbproducto = '12001238' where cbestante = 'Z' and cbnivel in (6);

--12001102	GALLETA GRETA OLIVA/ORÉGANO SOLEN 120 GR	24	50	LINEA	B	130	S(6/27-52);T(7/27-52);U(7/27-52);V(7/27-52);W(7/27-52)
update config_bodega set cbproducto = '12001102' where cbestante = 'S' and cbnivel in (6) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;
update config_bodega set cbproducto = '12001102' where cbestante = 'T' and cbnivel in (7) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;
update config_bodega set cbproducto = '12001102' where cbestante = 'U' and cbnivel in (7) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;
update config_bodega set cbproducto = '12001102' where cbestante = 'V' and cbnivel in (7) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;
update config_bodega set cbproducto = '12001102' where cbestante = 'W' and cbnivel in (7) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;

--12000621	FUSILLI MIXTO DELIZIARE X 500GR	12	56	LINEA	B	232	K(4,5); L(4,5)
update config_bodega set cbproducto = '12000621' where cbestante = 'K' and cbnivel in (4,5);
update config_bodega set cbproducto = '12000621' where cbestante = 'L' and cbnivel in (4,5);

--12000681	CERVEZA WEIDMANN 330 ML	24	100	LICORES	C	182	Y(1/27-52);Z(1,2,3,4,5/27-52)DE LAS CUALES 52 SON POS PARA 1/2 EST
update config_bodega set cbproducto = '12000681' where cbestante = 'Y' and cbnivel in (1) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;
update config_bodega set cbproducto = '12000681' where cbestante = 'Z' and cbnivel in (1,2,3,4,5) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;


--12001807	SYRUP QUICKSY X 355 ML	12	95	LINEA	C	54	P(6/1-26)
update config_bodega set cbproducto = '12001807' where cbestante = 'P' and cbnivel in (6) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12002289	VINO TINTO COMPADRE GRAN MALBEC	6	110	LICORES	C	52	W(3,4/27-52)
update config_bodega set cbproducto = '12002289' where cbestante = 'W' and cbnivel in (3,4) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;

--12001280	PROTECTOR SOLAR DELIA 100 ML	12	282	LINEA	C	52	Y(4/1-26)
update config_bodega set cbproducto = '12001280' where cbestante = 'Y' and cbnivel in (4) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12001819	CAFÉ HELADO CAPUCCINO EN BOTELLA 285 CC	12	120	LINEA	C	26	Z(4/1-26)
update config_bodega set cbproducto = '12001819' where cbestante = 'Z' and cbnivel in (4) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--ojojo--12000788	ACONDICIONADOR KOLORS 300 ML	12	165	LINEA	C	58	O(6)
update config_bodega set cbproducto = '12000788' where cbestante = 'O' and cbnivel in (6);

--12000716	SHAMPOO HIDRATANTE NATURAL FEELING 400ML	12	120	LINEA	C	116	O(4,5)
update config_bodega set cbproducto = '12000716' where cbestante = 'O' and cbnivel in (4,5);

--12002000	VINO MALBEC ARGENTINA	6	110	LICORES	C	52	S(4,5/27-52)
update config_bodega set cbproducto = '12002000' where cbestante = 'S' and cbnivel in (4,5) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;

--12001259	CREMA VEGETAL BATIDA SPRAY HOPLÁ 250 GR	12	130	LINEA	C	26	Z(5/1-26)
update config_bodega set cbproducto = '12001259' where cbestante = 'Z' and cbnivel in (5) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12002363	RON AÑEJO CARTAVIO BLACK BARREL	6	112	LICORES	C	26	U(5/27-52)
update config_bodega set cbproducto = '12002363' where cbestante = 'U' and cbnivel in (5) and substring(cbposicion from 1 for 2)::int between  27 and 52 ;

--12000914	ACEITUNA DESHUESADA RELLENA AINOA X 200G	16	140	LINEA	C	78	Z(1,2,3/1-26)
update config_bodega set cbproducto = '12000914' where cbestante = 'Z' and cbnivel in (1,2,3) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12000558	CREMA ANTIARRUGAS ARGAN Q10 DELIA 50 ML	12	204	LINEA	C	26	Y(5/1-26)
update config_bodega set cbproducto = '12000558' where cbestante = 'Y' and cbnivel in (5) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12000456	SALMÓN EN ACEITE CARLO FORTE 170 GRS	24	143	LINEA	C	26	T(3/1-26)
update config_bodega set cbproducto = '12000456' where cbestante = 'T' and cbnivel in (3) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12000810	CERVEZA TIPO RADLER WEIDMANN 330 ML	24	100	LICORES	C	26	W(2/24-52)
update config_bodega set cbproducto = '12000810' where cbestante = 'W' and cbnivel in (2) and substring(cbposicion from 1 for 2)::int between  24 and 52 ;

--12001811	QUINUA PREPARADA CUCINA & AMORE 225GR	24	40	LINEA	C	52	W(5,6/1-26)
update config_bodega set cbproducto = '12001811' where cbestante = 'W' and cbnivel in (5,6) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12000610	VINAGRETA ITALIANA ZEV X 240GR	12	116	LINEA	C	58	J(6)
update config_bodega set cbproducto = '12000610' where cbestante = 'J' and cbnivel in (6);

--12000915	ACEITUNA RELLENA AINOA X 200G	12	200	LINEA	C	26	W(4/1-26)
update config_bodega set cbproducto = '12000915' where cbestante = 'W' and cbnivel in (4) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12000616	JUGO ARÁNDANOS TREE FRUTS X 946 ML	12	60	LINEA	C	126	S(1,2,3/1-26);T(1,2/1-26)
update config_bodega set cbproducto = '12000616' where cbestante = 'S' and cbnivel in (1,2,3) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;
update config_bodega set cbproducto = '12000616' where cbestante = 'T' and cbnivel in (1,2) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--ojo --12000338	ESPUMANTE CHARDONNAY BRUT QLC 750 ML	6	110	LICORES	C	0	PISO B3

--12000157	BOLSA ECOLÓGICA REUTILIZABLE 40X42 CM D1	1	2400	LINEA	C	52	Y(6/1-26); X(7/1-26)
update config_bodega set cbproducto = '12000157' where cbestante = 'Y' and cbnivel in (6) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;
update config_bodega set cbproducto = '12000157' where cbestante = 'X' and cbnivel in (7) and substring(cbposicion from 1 for 2)::int between  1 and 26 ;

--12000715	SHAMPOO ANTICASPA XEN 400 ML	12	120	LINEA	C	54	N(3)
update config_bodega set cbproducto = '12000715' where cbestante = 'N' and cbnivel in (3);


