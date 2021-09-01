--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1 (Debian 13.1-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: app_user; Type: TABLE; Schema: public; Owner: biom
--

CREATE TABLE public.app_user (
    id bigint NOT NULL,
    login character varying NOT NULL,
    hashed_password character varying NOT NULL
);


ALTER TABLE public.app_user OWNER TO biom;

--
-- Name: app_user_seq; Type: SEQUENCE; Schema: public; Owner: biom
--

CREATE SEQUENCE public.app_user_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_seq OWNER TO biom;

--
-- Name: category; Type: TABLE; Schema: public; Owner: biom
--

CREATE TABLE public.category (
    id bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.category OWNER TO biom;

--
-- Name: category_seq; Type: SEQUENCE; Schema: public; Owner: biom
--

CREATE SEQUENCE public.category_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_seq OWNER TO biom;

--
-- Name: ecogesture; Type: TABLE; Schema: public; Owner: biom
--

CREATE TABLE public.ecogesture (
    id bigint NOT NULL,
    slug character varying NOT NULL
);


ALTER TABLE public.ecogesture OWNER TO biom;

--
-- Name: ecogesture_seq; Type: SEQUENCE; Schema: public; Owner: biom
--

CREATE SEQUENCE public.ecogesture_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ecogesture_seq OWNER TO biom;

--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: biom
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO biom;

--
-- Name: image; Type: TABLE; Schema: public; Owner: biom
--

CREATE TABLE public.image (
    id bigint NOT NULL,
    content_type character varying NOT NULL,
    original_file_name character varying NOT NULL
);


ALTER TABLE public.image OWNER TO biom;

--
-- Name: image_seq; Type: SEQUENCE; Schema: public; Owner: biom
--

CREATE SEQUENCE public.image_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_seq OWNER TO biom;

--
-- Name: indicator; Type: TABLE; Schema: public; Owner: biom
--

CREATE TABLE public.indicator (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    biom_id character varying NOT NULL,
    is_rounded boolean NOT NULL,
    rank integer NOT NULL
);


ALTER TABLE public.indicator OWNER TO biom;

--
-- Name: indicator_category; Type: TABLE; Schema: public; Owner: biom
--

CREATE TABLE public.indicator_category (
    indicator_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.indicator_category OWNER TO biom;

--
-- Name: indicator_ecogesture; Type: TABLE; Schema: public; Owner: biom
--

CREATE TABLE public.indicator_ecogesture (
    indicator_id bigint NOT NULL,
    ecogesture_id bigint NOT NULL
);


ALTER TABLE public.indicator_ecogesture OWNER TO biom;

--
-- Name: indicator_rank_seq; Type: SEQUENCE; Schema: public; Owner: biom
--

CREATE SEQUENCE public.indicator_rank_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicator_rank_seq OWNER TO biom;

--
-- Name: indicator_seq; Type: SEQUENCE; Schema: public; Owner: biom
--

CREATE SEQUENCE public.indicator_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicator_seq OWNER TO biom;

--
-- Name: indicator_value; Type: TABLE; Schema: public; Owner: biom
--

CREATE TABLE public.indicator_value (
    id bigint NOT NULL,
    indicator_id bigint,
    territory character varying NOT NULL,
    value double precision NOT NULL,
    unit character varying
);


ALTER TABLE public.indicator_value OWNER TO biom;

--
-- Name: indicator_value_seq; Type: SEQUENCE; Schema: public; Owner: biom
--

CREATE SEQUENCE public.indicator_value_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicator_value_seq OWNER TO biom;

--
-- Name: page; Type: TABLE; Schema: public; Owner: biom
--

CREATE TABLE public.page (
    id bigint NOT NULL,
    name character varying NOT NULL,
    model_name character varying NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.page OWNER TO biom;

--
-- Name: page_element; Type: TABLE; Schema: public; Owner: biom
--

CREATE TABLE public.page_element (
    id bigint NOT NULL,
    page_id bigint,
    type character varying NOT NULL,
    key character varying NOT NULL,
    text character varying,
    image_id bigint,
    alt character varying,
    href character varying,
    title boolean DEFAULT false NOT NULL
);


ALTER TABLE public.page_element OWNER TO biom;

--
-- Name: page_element_seq; Type: SEQUENCE; Schema: public; Owner: biom
--

CREATE SEQUENCE public.page_element_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_element_seq OWNER TO biom;

--
-- Name: page_seq; Type: SEQUENCE; Schema: public; Owner: biom
--

CREATE SEQUENCE public.page_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_seq OWNER TO biom;

--
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.app_user (id, login, hashed_password) FROM stdin;
1000	admin	R/9dHg1k8V2dlSqLiAuLqaYt8vEVMmC74KfKdQA17S6fTS/nJC4o7A==
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.category (id, name) FROM stdin;
1000	biodiversité & menaces
1001	biodiversité & connaissances
1002	écosystèmes terrestres
1003	écosystèmes marins & littoraux
\.


--
-- Data for Name: ecogesture; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.ecogesture (id, slug) FROM stdin;
1000	protection-faune
1001	protection-recifs-coralliens
1002	ne-pas-jeter-dechets-nature
1003	protection-contre-eee
1004	limiation-plastique
1005	protection-flore
1006	exploitation-especes-protegees
1007	s-investir-sur-le-terrain
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	0001	init	SQL	V0001__init.sql	1237318208	biom	2021-01-19 11:00:49.711606	183	t
2	0002	update-indicator	SQL	V0002__update-indicator.sql	412857269	biom	2021-01-19 11:00:49.921903	8	t
3	0003	add-indicator-rank	SQL	V0003__add-indicator-rank.sql	-1531005762	biom	2021-05-11 15:39:42.867998	313	t
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.image (id, content_type, original_file_name) FROM stdin;
1000	image/jpeg	homepage_carrousel_tortue.jpg
1001	image/jpeg	homepage_carrousel_colibri(redimensionné).jpg
1002	image/jpeg	homepage_temoignage_agentonb.jpg
1003	image/jpeg	homepage_agirensemble_hydrophis.jpg
1004	image/jpeg	homepage_carrousel_dendrobate(redimensionné).jpg
1005	image/jpeg	guadeloupe_presentation.jpg
1006	image/jpeg	guadeloupe_bloc_lieux_parcnational(redimensionné).jpg
1007	image/jpeg	guadeloupe_bloc_lieux_culdesac(redimensionné).jpg
1008	image/jpeg	guadeloupe_bloc_especes_fregate.jpg
1009	image/jpeg	guadeloupe_bloc_especes_ouassou.jpg
1010	image/jpeg	guadeloupe_bloc_ecosyst_foretaltitude.jpg
1011	image/jpeg	guadeloupe_bloc_ecosyst_plage.jpg
1012	image/jpeg	guadeloupe_bloc_ecosyst_forethumide.jpg
1013	image/jpeg	guadeloupe_pointe_grande_vigie_annie_mason.jpg
1014	image/jpeg	indicateur_eee_presentation_rascasse.jpg
1015	image/jpeg	indicateur_eee_miconia.jpg
1016	image/jpeg	accueil_indicateurs_bloc_presentation.jpg
1017	image/jpeg	ecogeste_connaissancebio_presentation.jpg
1018	application/pdf	Gandi_order_20201028_61714878.pdf
1019	image/jpeg	ecogeste_coraux_presentation.jpg
1020	image/png	noun_Boat_2306011 (1)@2x.png
1021	image/png	noun_Cream_2694240@2x.png
1022	image/png	noun_Diving_2855316 (1)@2x.png
1023	image/jpeg	guadeloupe_pointe_grande_vigie_annie_mason(redimensionné).jpg
1024	image/jpeg	guadeloupe_pointe_grande_vigie_annie_mason(redimensionné).jpg
1025	image/jpeg	guadeloupe_pointe_grande_vigie_annie_mason.jpg
1026	image/jpeg	guadeloupe_pointe_grande_vigie_annie_mason.jpg
1027	image/jpeg	indicateur_eee_miconia(redimensionné).jpg
1028	image/jpeg	apropos_presentation.JPG
1029	image/jpeg	apropos_objectif_2_tortue.JPG
1030	image/jpeg	apropos_objectif_1_jaguar(redimensionné).jpg
1031	image/jpeg	apropos_extra_oiseau(redimensionné).jpg
1032	image/jpeg	sciencespart_presentation.jpg
1033	image/png	logo_mom.png
1034	image/jpeg	indicateur_espendemiques_presentation_kaori(redimensionné).jpg
1035	image/jpeg	indicateur_espendemiques_colibri(redimensionné).jpg
1036	image/jpeg	indicateur_espendemiques_colibri.jpg
1037	image/jpeg	indicateur_espendemiques_colibri(redimensionné).jpg
1038	image/jpeg	ecogeste_connaissancebio_presentation.jpg
1039	image/jpeg	indicateur_espinvent_presentation_cacique.JPG
1040	image/jpeg	indicateur_espinvent_iguane(redimensionné).jpg
1041	image/jpeg	indicateur_espmenac_presentation_albatros.jpg
1042	image/jpeg	indicateur_espmenac_presentation_luth(redimensionné).jpg
1043	image/jpeg	indicateur_boisement_presentation_fougères(redimensionné).jpg
1044	image/jpeg	indicateur_boisement_mornerouge(redimensionné).jpg
1045	image/jpeg	indicateur_boisement_mornerouge(redimensionné).jpg
1046	image/jpeg	indicateur_boisement_mornerouge(redimensionné).jpg
1047	image/jpeg	indicateur_mangroves_presentation_culdesac.JPG
1048	image/jpeg	indicateur_mangroves_poissons(redimensionné).jpg
1049	image/jpeg	indicateur_mangroves_poissons(redimensionné).jpg
1050	image/jpeg	indicateur_nouvdesc_presentation_chenille(redimensionné).jpg
1051	image/jpeg	indicateur_nouvdesc_tri.jpg
1052	image/jpeg	indicateur_nouvdesc_tri.jpg
1053	image/jpeg	indicateur_recifs_presentation_mayotte.jpg
1054	image/jpeg	indicateur_recifs_corauxlagon(redimensionné).jpg
1055	image/jpeg	martinique_presentation.jpg
1056	image/jpeg	martinique_bloc_lieux_pnr.jpg
1057	image/jpeg	martinique_bloc_lieux_caravelle(redimensionné).jpg
1058	image/jpeg	martinique_bloc_lieux_salines.jpg
1059	image/jpeg	martinique_bloc_lieux_pelee.jpg
1060	image/jpeg	martinique_bloc_especes_iguane.jpg
1061	image/jpeg	martinique_bloc_especes_matoutou(redimensionné).jpg
1062	image/jpeg	martinique_bloc_especes_chelonia.jpg
1063	image/jpeg	martinique_bloc_especes_lambi(redimensionné).jpg
1064	image/jpeg	martinique_bloc_especes_ananas.jpg
1065	image/jpeg	martinique_bloc_especes_thalassia.jpg
1066	image/jpeg	martinique_bloc_ecosyst_plage.jpg
1067	image/jpeg	indicateur_boisement_mornerouge(redimensionné).jpg
1068	image/jpeg	martinique_bloc_ecosyst_mangrove.jpg
1069	image/jpeg	martinique_photo_indicateur.jpg
1070	image/jpeg	martinique_presentation(2).jpg
1071	image/jpeg	accueil_agirensemble_bloc_presentation.jpg
1072	image/jpeg	accueil_agirensemble_plongeuse_serpent.jpg
1073	image/jpeg	accueil_ecogestes_bloc_presentation.jpg
1074	image/jpeg	accueil_ecogestes_logo_BTV.jpg
1075	image/jpeg	sciencespart_presentation.jpg
1076	image/jpeg	sciencespart_prog_educ(redimensionné).jpg
1077	image/jpeg	sciencespart_prog_recherche(redimensionné).jpg
1078	image/png	sciencespart_bdd_collaboratives(redimensionné).png
1079	image/jpeg	sciencespart_prog_recherche(redimensionné).jpg
1080	image/jpeg	sciencespart_prog_educ(redimensionné).jpg
1081	image/jpeg	sciencespart_prog_kelonia.jpg
1082	image/jpeg	sciencespart_prog_oiseaux_guyane.jpg
1083	image/jpeg	sciencespart_prog_recifs_nc.jpg
1084	image/jpeg	sciencespart_prog_educ.jpg
1085	image/jpeg	sciencespart_prog_educ(redimensionné).jpg
1086	image/jpeg	sciencespart_prog_educ(redimensionné).jpg
1087	image/jpeg	sciencespart_prog_educ(redimensionné).jpg
1088	image/jpeg	nc_presentation.jpg
1089	image/jpeg	nc_bloc_lieux_mercorail.jpg
1090	image/jpeg	nc_bloc_lieux_entrecasteaux.JPG
1091	image/jpeg	nc_bloc_especes_cyathea.jpg
1092	image/jpeg	nc_bloc_ecosyst_forethumide.jpg
1093	image/jpeg	nc_bloc_ecosyst_lagons.jpg
1094	image/jpeg	nc_bloc_lieux_mercorail.jpg
1095	image/jpeg	reunion_presentation.jpg
1096	image/jpeg	reunion_bloc_lieux_pnr.JPG
1097	image/jpeg	reunion_bloc_especes_gecko.jpg
1098	image/jpeg	reunion_bloc_lieux_pnr(1).jpg
1099	image/jpeg	reunion_bloc_ecosyst_forethumide.JPG
1100	image/jpeg	reunion_bloc_ecosyst_foretseche.JPG
1101	image/jpeg	reunion_bloc_lieux_mafate.jpg
1102	image/jpeg	spm_bloc_lieux_grandbarachois.jpg
1103	image/jpeg	spm_bloc_lieux_isthme.jpg
1104	image/jpeg	spm_bloc_ecosyst_marais.jpg
1105	image/jpeg	spm_bloc_especes_cerf.jpg
1106	image/jpeg	spm_bloc_ecosyst_toundra.jpg
1107	image/jpeg	spm_bloc_ecosyst_foretboreale.jpg
1108	image/jpeg	spm_bloc_especes_macareux.jpg
1109	image/jpeg	24 (1).jpeg
1110	image/jpeg	spm_bloc_ecosyst_foretboreale.jpg
1111	image/jpeg	spm_presentation.jpg
1112	image/jpeg	ecogeste_dechets_presentation.jpg
1113	application/pdf	200325Corana-gestes dechets_A4 web.pdf
1114	image/png	Tracé 142@2x.png
1115	image/png	noun_cigarette butt_3523840@2x.png
1116	image/png	Layer 2@2x.png
1117	image/png	Tracé 142@2x.png
1118	image/jpeg	27082-13vr4qic8o-whr.jpg
1119	image/jpeg	ecogeste_eee_rat.jpg
1120	image/jpeg	ecogeste_eee_rat.jpg
1121	application/pdf	200325Corana-gestes dechets_A4 web.pdf
1122	image/png	noun_planting_3349277@2x.png
1123	image/png	noun_aquarium_3328913@2x.png
1124	image/png	noun_Snake_2997558@2x.png
1125	application/pdf	200325Corana-gestes dechets_A4 web.pdf
1126	image/jpeg	2U1A7981.jpg
1127	image/png	Groupe 27@2x.png
1128	image/png	noun_quietly_3050100@2x.png
1129	image/png	noun_man with dog_1445955@2x.png
1130	image/png	noun_call centre_2656084@2x.png
1131	image/png	noun_No Plastic_3380089@2x.png
1132	image/png	noun_candy jar_1285419@2x.png
1133	image/png	noun_Plastic Straw_2496759@2x.png
1134	application/pdf	200325Corana-gestes dechets_A4 web.pdf
1135	image/jpeg	ecogeste_plastique_presentation.jpg
1136	image/png	line expand@2x.png
1137	image/png	noun_Nature book_511511@2x.png
1138	image/png	Layer 2@2x.png
1139	application/pdf	200325Corana-gestes dechets_A4 web.pdf
1140	image/jpeg	IMG_3013.jpg
1141	application/pdf	200325Corana-gestes dechets_A4 web.pdf
1142	image/jpeg	ecogeste_exploitationespeces_presentation.jpg
1143	image/png	noun_Fishing_3098785@2x.png
1144	image/png	noun_bill lading_3152816@2x.png
1145	image/png	noun_Luggage_3498542@2x.png
1146	image/png	Groupe 26@2x.png
1147	application/pdf	200325Corana-gestes dechets_A4 web.pdf
1148	image/jpeg	Surveillance plage de Mana.jpg
1149	image/png	noun_Human_3385243@2x.png
1150	image/png	noun_Binoculars_952982@2x.png
1151	image/jpeg	martinique_presentation.jpg
1152	image/jpeg	nc_bloc_lieux_lacyate.jpg
1153	image/jpeg	nc_bloc_especes_kagou.JPG
1154	image/jpeg	nc_bloc_especes_dugong.jpg
1155	image/jpeg	nc_bloc_especes_tricotraye.jpg
1156	image/jpeg	reunion_bloc_lieux_mafate.jpg
1157	image/jpeg	reunion_bloc_lieux_fournaise.jpg
1158	image/jpeg	reunion_bloc_lieux_marelongue.jpg
1159	image/jpeg	reunion_bloc_especes_tuituit.jpg
1160	image/jpeg	reunion_bloc_especes_baleine.jpg
1161	image/jpeg	reunion_bloc_especes_molosse.jpg
1162	image/jpeg	1.jpg
1163	image/jpeg	spm_bloc_especes_lievre.jpg
1164	image/jpeg	ecogeste_dechets_presentation.jpg
1165	image/jpeg	guadeloupe_bloc_lieux_petiteterre(redimensionné).jpg
1166	image/jpeg	guadeloupe_bloc_especes_gaiac.jpg
1167	image/jpeg	guadeloupe_bloc_especes_gaiac.jpg
1168	image/jpeg	mangrove G.Vandersarren.jpg
1169	image/jpeg	Image à trouver.jpg
1170	image/jpeg	Image à trouver.jpg
1171	image/jpeg	Image à trouver.jpg
1172	image/jpeg	Image à trouver.jpg
1173	image/jpeg	Image à trouver.jpg
1174	image/jpeg	Image à trouver.jpg
1175	image/jpeg	Image à trouver.jpg
1176	image/jpeg	Image à trouver.jpg
1177	image/jpeg	Image à trouver.jpg
1178	image/jpeg	Image à trouver.jpg
1179	image/jpeg	Image à trouver.jpg
1180	image/jpeg	Image à trouver.jpg
1181	image/jpeg	Image à trouver.jpg
1182	image/jpeg	Image à trouver.jpg
1183	image/jpeg	Image à trouver.jpg
1184	image/jpeg	Image à trouver.jpg
1185	image/jpeg	Image à trouver.jpg
1186	image/jpeg	Image à trouver.jpg
1187	image/jpeg	Image à trouver.jpg
1188	image/jpeg	Image à trouver.jpg
1189	image/jpeg	Image à trouver.jpg
1190	image/jpeg	Image à trouver.jpg
1191	image/jpeg	Image à trouver.jpg
1192	image/jpeg	Image à trouver.jpg
1193	image/jpeg	Image à trouver.jpg
1194	image/jpeg	Image à trouver.jpg
1195	image/jpeg	Image à trouver.jpg
1196	image/jpeg	Image à trouver.jpg
1197	image/jpeg	Image à trouver.jpg
1198	image/jpeg	Image à trouver.jpg
1199	image/jpeg	Image à trouver.jpg
1200	image/jpeg	Image à trouver.jpg
1201	image/jpeg	Image à trouver.jpg
1202	image/jpeg	Image à trouver.jpg
1203	image/jpeg	Image à trouver.jpg
1204	image/jpeg	Image à trouver.jpg
1205	image/jpeg	Image à trouver.jpg
1206	image/jpeg	Image à trouver.jpg
1207	image/jpeg	Image à trouver.jpg
1208	image/jpeg	Image à trouver.jpg
1209	image/jpeg	Image à trouver.jpg
1210	image/jpeg	Image à trouver.jpg
1211	image/jpeg	Image à trouver.jpg
1212	image/jpeg	Image à trouver.jpg
1213	image/jpeg	Image à trouver.jpg
1214	image/jpeg	Image à trouver.jpg
1215	image/jpeg	Image à trouver.jpg
1216	image/jpeg	Le Grand Barachois Miquelon.jpeg
1217	image/jpeg	Le Grand Barachois Miquelon.jpeg
1218	image/jpeg	Sapin baumier.jpeg
1219	image/jpeg	Phoque Veau marin_Daniel Koelsch 4.jpg
1220	image/jpeg	Dunes de sable sur l'isthme de Miquelon-Langlade 2.jpeg
1221	image/jpeg	Vallée du Milieu été.jpeg
1222	image/jpeg	Sapin baumier.jpeg
1223	image/jpeg	Sapin baumier.jpeg
1224	image/jpeg	Image à trouver.jpg
1225	image/jpeg	2015-01 GUADELOUPE Pointe des Colibris Olivier Delzons(1).jpg
1226	image/jpeg	Pluvier siffleur - Patrick Hacala 2.jpg
1227	image/jpeg	Phoque Veau marin_Daniel Koelsch 4.jpg
1228	image/jpeg	Lièvre arctique (1)_D Koelsch.JPG
1229	image/jpeg	Macareux moine BL 1.jpg
1230	image/jpeg	Diapensine_DTAM.jpg
1231	image/jpeg	Cerf de Virginie BL 2.jpg
1232	image/jpeg	Grand-Colombier.jpeg
1233	image/jpeg	Grand-Colombier.jpeg
1234	image/jpeg	Vallée du Milieu - sarracénies pourpres.jpeg
1235	image/jpeg	Saint-Pierre LM 1(1).jpg
1236	image/jpeg	Vallée du Milieu été 3.jpeg
1237	image/jpeg	Image à trouver.jpg
1238	image/jpeg	NC_Chute de la Madeleine2_2009_Udo Helene.jpg
1239	image/jpeg	NC_Tricot rayé sur Ilot Tenia4_2011_Udo Helene.jpg
1240	image/jpeg	NC_dugong dans la baie de Thio_ Helene Udo.jpg
1241	image/jpeg	moqueur_gorgeblanche_martinique_vincent_lemoine_hd_3.jpg
1242	image/jpeg	moqueur_gorgeblanche_martinique_vincent_lemoine_hd_3.jpg
1243	image/jpeg	Image à trouver.jpg
1244	image/jpeg	Image à trouver.jpg
1245	image/jpeg	Image à trouver.jpg
1246	image/jpeg	logo_omb.jpg
1247	image/jpeg	Image à trouver.jpg
1248	image/jpeg	Image à trouver.jpg
1249	image/jpeg	Roche-Ecrite-IMGP9641 (1).JPG
1250	image/jpeg	13.jpg
1251	image/jpeg	Observations terrain_St Pierre et Miquelon_N De Lacoste.jpeg
1252	image/png	Screenshot_2021-04-01 Biodiversité - Se mobiliser.png
1253	image/png	Screenshot_2021-04-01 Biodiversité - Se mobiliser(1).png
1254	image/png	Screenshot_2021-04-01 Biodiversité - Se mobiliser(1).png
1255	image/png	Screenshot_2021-04-01 Biodiversité - Se mobiliser(1).png
1256	image/png	Screenshot_2021-04-01 Biodiversité - Se mobiliser(1).png
1257	image/png	Screenshot_2021-04-01 Biodiversité - Se mobiliser(1).png
1258	image/jpeg	DSC04574-Modifier.jpg
1259	image/jpeg	Martinique_Fabien Lefebvre.jpg
1260	image/jpeg	IMG_6438.jpg
1261	image/jpeg	DSC05001-Modifier.jpg
1262	image/jpeg	capture d'anaconda.jpg
1263	image/jpeg	Cerf de Virginie BL 1.jpg
1264	image/jpeg	Cap de Miquelon.jpeg
1265	image/jpeg	Paysage BL 3.jpg
1266	image/jpeg	2U1A9955.jpg
1267	image/jpeg	DSC04557-Modifier.jpg
1268	image/jpeg	IMG_4417.jpg
1269	image/jpeg	IMG_8325.jpg
1270	image/jpeg	DSC07212-Modifier.jpg
1271	image/jpeg	CRIOBE_1x1-150x150.jpg
1272	image/jpeg	logo DTAM 975.jpg
1273	image/png	47fa57ded8bb44833b43e61f868701b4_logo.png
1274	image/jpeg	omb_biodiversite_martinique_randonnee_pnm_1000px.jpg
1275	image/jpeg	cat8.jpg
1276	image/jpeg	Moqueur gorge blanche_Fabien Lefebvre (2).jpg
1277	image/jpeg	DSC04742-Modifier.jpg
1278	image/jpeg	2U1A9150-Modifier.jpg
1279	image/jpeg	DSC09469-Modifier.jpg
1280	image/jpeg	IMG_3514.jpg
1281	image/jpeg	logo_pnr_martinique.jpg
1282	image/jpeg	Image à trouver.jpg
1283	image/jpeg	Petit Cap Fluffy4.jpg
1284	image/jpeg	IMG_8325.jpg
1285	image/jpeg	Fig. 3 - Linnaea borealis (SPM).JPG
1286	image/jpeg	Botrychium multifidum8.JPG
1287	image/jpeg	71407.jpg
1288	image/jpeg	72586.jpg
1289	image/jpeg	26084.jpg
1290	image/jpeg	37367.jpg
1291	image/jpeg	41005.jpg
1292	image/png	OFB ramassage déchet.png
1293	image/jpeg	32221.jpg
1294	image/jpeg	Dynaste V. Prié association caracol.jpg
1295	image/jpeg	Tortue imbriquée Benjamin Guichard.jpg
1296	image/jpeg	Rhizophora mangle Benjamin Guichard.jpg
1297	image/jpeg	Trigonocéphale Mael Dewynter.jpg
1298	image/jpeg	Gommier blanc Cesar Delnatte.jpg
1299	image/jpeg	Tuit Tuit JP Siblet.jpg
1300	image/jpeg	Pétrel de Barau JB Siblet.jpg
1301	image/jpeg	Iguane des petites antilles Patrick Haffner.jpg
1302	image/jpeg	Iguane des petites antilles Patrick Haffner2.jpg
1303	image/jpeg	Anolis marmoratus speciosus Patrick Haffner.jpg
1304	image/jpeg	Ctenonotus marmoratus chrysops Julien Bonnaud.jpg
1305	image/jpeg	Ctenonotus ferreus Aurelien Miralle.jpg
1306	image/jpeg	Petit molosse Gildas Monnier GCOI.jpg
1307	image/jpeg	64305.jpg
1308	image/jpeg	37370.jpg
1309	image/jpeg	73380.jpg
1310	image/jpeg	908708 Sclerotheca raiateensis 137158 PF.jpg
1311	image/jpeg	2U1A0940.jpg
1312	image/jpeg	mâle - 2U1A7970-2-Modifier.jpg
1313	image/jpeg	mangrove G.Vandersarren.jpg
1314	image/jpeg	2U1A9955.jpg
1315	image/jpeg	Panie_christine Fort.jpg
1316	image/jpeg	Côte oubliée_Martial Dosdane.jpg
1317	image/jpeg	Cagou O. Gargominy.jpg
1318	image/jpeg	Rhacodactylus_leachianus_Matthias_DEUSS.jpg
1319	image/jpeg	Agathis_Vanessa Hequet.jpg
1320	image/jpeg	Nereis_Nathalie Baillon.jpg
1321	image/jpeg	Niaouli_Christine Fort.jpg
1322	image/jpeg	Syzygium acre_Vanessa Hequet.jpg
1323	image/jpeg	P. ornatus_Malik Oedin.jpg
1324	image/jpeg	baleine_opération cetacés.jpg
1325	image/jpeg	gymnocrinus-richeri_Pierre Lozouet.jpg
1326	image/jpeg	Image à trouver.jpg
1327	image/jpeg	Notou_Christine Fort.jpg
1328	image/jpeg	Nautile_Claude Payri.jpg
1329	image/jpeg	Maquis_Vanessa Hequet.jpg
1330	image/jpeg	Forêt sèche_CEN.jpg
1331	image/jpeg	Amborella_Vanessa Hequet.jpg
1332	image/jpeg	Tortue bwara.jpg
1333	image/jpeg	Image à trouver.jpg
1334	image/jpeg	Cantharellus noumaea Grégory Lasne.jpg
1335	image/jpeg	la-malavoune-la-campagne-en-shimaore-11d2daae-2b99-4f49-80a0-616e5e0c54e9(1).jpg
1336	image/jpeg	Herbier Claude Payri.jpg
1337	image/jpeg	Image à trouver.jpg
1338	image/jpeg	Image à trouver.jpg
1339	image/jpeg	mangrove_Christine-Fort.JPG
1340	image/jpeg	cabane-dobservation,-sentier-du-site-de-nidification-du-coq-de-roche-9a6b9865-f967-4cd0-b8f6-d59a654fe502.jpg
1341	image/jpeg	37370.jpg
1342	image/jpeg	cabane-dobservation,-sentier-du-site-de-nidification-du-coq-de-roche-9a6b9865-f967-4cd0-b8f6-d59a654fe502_copie.jpg
1343	image/jpeg	mission-dinventaire-du-mont-itoupe-67e621f9-ff4f-49b2-867c-b2a2d5c8c17a.jpg
1344	image/jpeg	24771.jpg
1345	image/jpeg	24771.jpg
1346	image/jpeg	Aspisoma ignitum Julien Touroult.jpg
1347	image/jpeg	Conure cuivré Raphael Gailhac.jpg
1348	image/jpeg	Caravelle_AERODREAM_PNRM 2.jpg
1349	image/jpeg	Etang des Saline_PNRM_Autrevue.jpg
1350	image/jpeg	Photos  Ste Luce 02082013 008 (ID 3180)_PNRM.jpg
1351	image/jpeg	Photos  Ste Luce 02082013 010 (ID 3177)_PNRM.jpg
1352	image/jpeg	Observations terrain_St Pierre et Miquelon_N De Lacoste.jpeg
1353	image/jpeg	OMB_biodiversite_martinique_dechets_PNRM.jpg
1354	image/jpeg	41013.jpg
1355	image/jpeg	37370.jpg
1356	image/jpeg	41005.jpg
1357	image/jpeg	randonnee_PNRM.JPG
1358	image/jpeg	randonnee_PNRM.JPG
1359	image/jpeg	OMB_biodiversite_martinique_randonnée_PNRM.jpg
1360	image/jpeg	OMB_biodiversite_martinique_randonnée_PNRM.jpg
1361	image/jpeg	41013.jpg
1362	image/jpeg	mi-air-mi-eau-64a08615-a5ad-4a12-9ae9-428ff04a0a6b.jpg
1363	image/jpeg	P4080320_PNRM.jpg
1364	image/jpeg	40999.jpg
1365	image/jpeg	Screenshot_2021-05-06 Raie pastenague.jpg
1366	image/jpeg	Screenshot_2021-05-06 Requin pointe noire polynesie française.jpg
1367	image/jpeg	Screenshot_2021-05-06 Forêt # 2.jpg
1368	image/jpeg	Screenshot_2021-05-06 Layon à travers la forêt de guyane.jpg
1369	image/jpeg	Screenshot_2021-05-06 Héliconias dans la forêt d'émeraude.jpg
1370	image/jpeg	Screenshot_2021-05-06 Dans la forêt.jpg
1371	image/jpeg	Screenshot_2021-05-06 Crique forestière à matoury.jpg
1372	image/jpeg	Screenshot_2021-05-06 Crique forestière à matoury2.jpg
1373	image/jpeg	Screenshot_2021-05-06 Forêt tropicale humide.jpg
1374	image/jpeg	Screenshot_2021-05-06 Forêt # 1.jpg
1375	image/jpeg	Screenshot_2021-05-06 Forêt tropicale humide.jpg
1376	image/jpeg	Screenshot_2021-05-06 Forêt # 2.jpg
1377	image/jpeg	foret-tropicale-humide-7ffb3e0a-ebb1-4273-b4c3-f92212626209(1)(1).jpg
1378	image/jpeg	Foret BL 3.jpg
1379	image/jpeg	Agathis montana Laurent Poncet.jpg
1380	image/jpeg	Agathis_lanceolata_Parc_de_la_rivière_bleue Mickael T.jpg
1381	image/jpeg	requin-pointe-noire-polynesie-francaise-f27d9fdc-17d9-4bfc-9bb8-14f063bdc478(1).jpg
1382	image/jpeg	coq de roche_Raphael Gailhac.jpg
1383	image/jpeg	Coraux_gregory lasne.jpg
1384	image/jpeg	NC_Plage de Maré_Iles Loyauté_Lionel Gardes.jpg
1385	image/jpeg	Géo-Graphique_RNISA_01.04.2019#005.jpg
1386	image/jpeg	Corbeau_Christine Fort.jpg
1387	image/jpeg	Notou_CFort (2).jpg
1388	image/jpeg	Fonds de baie envasées F Benzoni.jpg
1389	image/jpeg	Sargasses C.Geoffray.jpg
1390	image/jpeg	Sargasses C.Geoffray 2.jpg
1391	image/jpeg	Herbiers Payri 2.jpg
1392	image/jpeg	Fonds de baie envasées F Benzoni 2.jpg
1393	image/jpeg	Sargasses C.Geoffray 2.jpg
1394	image/jpeg	noun_aquarium_3328850.jpg
1395	image/jpeg	noun_aquarium_3328850.jpg
1396	image/jpeg	noun_aquarium_3328850_2.jpg
1397	image/jpeg	Tortue caouanne.jpg
1399	image/jpeg	copy-1258
1398	image/jpeg	copy-1351
1400	image/jpeg	copy-1260
1401	image/jpeg	copy-1262
1402	image/jpeg	copy-1258
1403	image/jpeg	copy-1260
1404	image/jpeg	copy-1364
1405	image/jpeg	copy-1028
1406	image/png	copy-1273
1407	image/jpeg	copy-1381
1408	image/jpeg	copy-1281
1409	image/jpeg	copy-1272
1410	image/jpeg	copy-1030
1411	image/jpeg	copy-1271
1412	image/jpeg	copy-1274
1413	image/jpeg	copy-1258
1414	image/jpeg	copy-1260
1415	image/jpeg	1258.jpg
1416	image/jpeg	1260.jpg
1417	image/jpeg	1258.jpg
1418	image/jpeg	1260.jpg
1419	image/jpeg	copy-1417
1420	image/jpeg	copy-1418
1421	image/jpeg	DSC04574-Modifier.jpg
1422	image/jpeg	IMG_6438.jpg
1423	image/jpeg	copy-1088
1424	image/jpeg	copy-1028.jpg
1425	image/jpeg	Ranitomeya amazonica.jpg
1426	image/jpeg	40999.jpg
1427	image/jpeg	Jaguar.jpg
1428	image/png	47fa57ded8bb44833b43e61f868701b4_logo.png
1429	image/jpeg	logo_pnr_martinique.jpg
1430	image/jpeg	CRIOBE_1x1-150x150.jpg
1431	image/jpeg	OMB_biodiversite_martinique_randonnée_PNRM.jpg
1432	image/jpeg	logo DTAM 975.jpg
1433	image/jpeg	requin-pointe-noire-polynesie-francaise-f27d9fdc-17d9-4bfc-9bb8-14f063bdc478(1).jpg
1434	image/jpeg	copy-1425
1435	image/jpeg	copy-1421
1436	image/jpeg	copy-1422
1437	image/jpeg	copy-1004
1438	image/jpeg	copy-1258
1439	image/jpeg	copy-1260
1440	image/jpeg	copy-1426
1441	image/jpeg	copy-1424
1442	image/jpeg	copy-1430
1443	image/jpeg	copy-1432
1444	image/jpeg	copy-1427
1445	image/jpeg	copy-1433
1446	image/png	copy-1428
1447	image/jpeg	copy-1429
1448	image/jpeg	copy-1431
1449	image/jpeg	copy-1004
1450	image/jpeg	copy-1258
1451	image/jpeg	copy-1351
1452	image/jpeg	copy-1260
1453	image/jpeg	copy-1262
1454	image/jpeg	Ranitomeya amazonica.jpg
1455	image/jpeg	Photos  Ste Luce 02082013 010 (ID 3177)_PNRM.jpg
1456	image/jpeg	capture d'anaconda.jpg
1457	image/jpeg	Rivière Corossol_Claire Roussel OFB.jpg
1458	image/jpeg	Plage de Grande Anse_Amandine Escarguel OFB.jpg
1459	image/jpeg	Pic de Guadeloupe C et P Guezennec INPN.jpg
1460	image/jpeg	Syagrus_amara_Hilo_Univ.jpg
1461	image/jpeg	Syagrus-amara-detail-de-la-couronne.jpg
1462	image/jpeg	la-soufriere-Helène Valenzuela.jpg
1463	application/pdf	affiche-ecogeste-connaissance.pdf
1464	application/pdf	affiche-ecogeste-je-m-investis-sur-terrain.pdf
1465	application/pdf	affiche-ecogeste-je-m-investis-sur-terrain.pdf
1466	application/pdf	affiche-ecogeste-je-ne-jette-pas-dechets-nature.pdf
1467	image/jpeg	La_Desirade,_vue_de_la_pointe_Est_Grook Da Oger.jpg
1468	application/pdf	affiche-ecogeste-je-preserve-flore-sauvage.pdf
1469	application/pdf	affiche-ecogeste-je-preserve-faune-sauvage.pdf
1470	application/pdf	affiche-ecogeste-je-reduis-consommation-plastique.pdf
1471	application/pdf	affiche-ecogeste-je-protege-milieux-especes-exotiques.pdf
1472	image/jpeg	ecogeste_introductionespeces_presentation_amy baugess.jpg
1473	image/jpeg	Sargassum decurrens paysage.jpg
1474	image/jpeg	Syringodium isoetifolium 2.jpg
1475	image/jpeg	NC_Ile des Pins, baie d'Oro -Hélène Udo.jpg
1476	image/jpeg	NC_Mont_Dzumac3_2010_Udo Helene.jpg
1477	image/jpeg	NC_Ile des Pins, baie d'Oro -Hélène Udo.jpg
1478	image/jpeg	PN Réunion_Remy Poncet.jpg
1479	image/jpeg	Chaetodon_trifasciatus_Réunion_Philippe Bourjon.jpg
1480	image/jpeg	Le_canal_du_Moulin_au_coeur_de_la_Réserve_Naturelle_Nationale_de_l'Etang_Saint-Paul_Giovanni Payet(1).jpg
1481	image/jpeg	Cyathea_glauca_fronds_B Navez(1).jpg
1482	image/jpeg	Acacia_heterophylla_1_B Navez.JPG
1483	image/jpeg	Acacia_heterophylla_3_B Navez.JPG
1484	image/jpeg	Bois d'ortie Caroline RobertPNRUn.jpg
1485	application/pdf	affiche-ecogeste-je-ne-participe-exploitation-especes.pdf
1486	image/jpeg	Papangue_JP Siblet.jpg
1487	application/pdf	affiche-ecogeste-je-protege-recifs.pdf
1488	image/jpeg	cascade-ephemere-du-cirque-de-salazie-7991681c-43d9-4d31-b2ce-2c1c91dcf5b5(1).jpg
1489	image/jpeg	copy-1004
1490	image/jpeg	copy-1455
1491	image/jpeg	copy-1260
1492	image/jpeg	copy-1456
1493	image/jpeg	copy-1258
1494	image/jpeg	784px-Poissons_du_lagon_de_la_Réunion_Philippe Bourjon.jpg
1495	image/jpeg	eruption-piton-de-la-fournaise-f011492b-18e3-4ba3-9597-ed2f4164b852(1).jpg
1496	application/pdf	affiche-ecogeste-je-ne-jette-pas-dechets-nature.pdf
1497	image/jpeg	capture d'anaconda.jpg
1498	image/jpeg	Photos  Ste Luce 02082013 008 (ID 3180)_PNRM.jpg
1499	image/jpeg	Photos  Ste Luce 02082013 010 (ID 3177)_PNRM.jpg
1500	image/jpeg	CaloenasStairiWolf.jpg
1501	image/jpeg	Image à trouver.jpg
1502	image/jpeg	vue sur Alofi depuis Futuna- ©Tristan BERR.jpg
1503	image/jpeg	Lalolalo (2)-©Enelio LIUFAU.jpg
1504	image/jpeg	ilot Nukula'ela'e depuis Nukufotu - ©Tristan BERR.jpg
1505	image/jpeg	Image à trouver.jpg
1506	image/jpeg	Image à trouver.jpg
1507	image/jpeg	Image à trouver.jpg
1508	image/jpeg	Boa du Pacifique à Alofi1 - © Enelio LIUFAU.jpg
1509	image/jpeg	Image à trouver.jpg
1510	image/jpeg	Roussette du Pacifique - ©Tristan BERR.jpg
1516	image/jpeg	Image à trouver.jpg
1517	image/jpeg	Image à trouver.jpg
1518	image/jpeg	Image à trouver.jpg
1519	image/jpeg	Image à trouver.jpg
1520	image/jpeg	Image à trouver.jpg
1521	image/jpeg	Image à trouver.jpg
1522	image/jpeg	Image à trouver.jpg
1523	image/jpeg	Image à trouver.jpg
1524	image/jpeg	Image à trouver.jpg
1525	image/jpeg	Image à trouver.jpg
1526	image/jpeg	Mangrove à Faioa1 - © Enelio LIUFAU.jpg
1527	image/jpeg	Alofi-01-05 sept 2014-Cyrtandra futunae fleurs ©Jean-Yves MEYER.jpg
1528	image/jpeg	Heliotropium foertherianum_V Boullet.jpg
1529	image/jpeg	herbier Wallis - ©Sandrine JOB.jpg
1530	image/jpeg	ilots du nord de Wallis - ©Tristan BERR.jpg
1531	image/jpeg	CaloenasStairiWolf1.jpg
1553	image/jpeg	Pluvier siffleur - Patrick Hacala 2.jpg
1562	image/jpeg	copy-1299.jpg
1563	image/jpeg	copy-1097.jpg
1564	image/jpeg	Image à trouver.jpg
1565	image/jpeg	C.maillardi-S.Caceres&JN Jasmin.jpg
1566	image/jpeg	Alofi-Alofitai & Mafa'a-19 nov 2008-vue littoral (JYM).jpg
1567	image/jpeg	Futuna-Vainifao-16 nov 2008-Aglaia psilopetala = samoensis fruits (JYM).jpg
1568	image/jpeg	Wallis-Fineveke-26 aout 2014-mangrove à Rhizophora samoensis = mangle (JYM).jpg
1569	image/jpeg	Wallis-Nukufotu-26 aout 2014-Tournefortia argentea = Heliotropium foerherianum (JYM).jpg
1570	image/jpeg	Rapa Nui-3 juin 2008-CONAF-Broussonetia papyfera (JYM).jpg
1571	image/jpeg	Alofi-01 sept 2014-sentier & sous-bois foret dense humide (JYM).jpg
1572	image/jpeg	Futuna-Puke-13 nov 2008-lande à fougère Dicranopteris linearis toafa (JYM).jpg
1573	image/jpeg	63 (6).JPG
1574	image/jpeg	stenogobius-keletaonaP. Keith, MNHN.jpg
1575	image/jpeg	MAT_6742-@Matthieu JUNCKER.jpg
1576	image/jpeg	MAT_6742-Matthieu JUNCKER.jpg
1577	image/jpeg	63 (6).jpg
1578	image/jpeg	Vue generale-3.jpg
1579	image/jpeg	sicyopus-sasaliP. Keith, MNHN.jpg
1580	image/jpeg	sicyopus-sasali@P. Keith, MNHN.jpg
1581	image/jpeg	Guyane-Rivière Inini_ Pascale Roche OFB.jpg
1582	image/jpeg	Image à trouver.jpg
1583	image/jpeg	Image à trouver.jpg
1584	image/jpeg	Image à trouver.jpg
1585	image/jpeg	Image à trouver.jpg
1586	image/jpeg	Image à trouver.jpg
1587	image/jpeg	foret-tropicale-humide-Guillaume Feuillet.jpg
1588	image/jpeg	Image à trouver.jpg
1589	image/jpeg	Image à trouver.jpg
1590	image/jpeg	Image à trouver.jpg
1591	image/jpeg	Image à trouver.jpg
1592	image/jpeg	Image à trouver.jpg
1593	image/jpeg	Image à trouver.jpg
1594	image/jpeg	Image à trouver.jpg
1595	image/jpeg	Image à trouver.jpg
1596	image/jpeg	Image à trouver.jpg
1597	image/jpeg	Image à trouver.jpg
1598	image/jpeg	Image à trouver.jpg
1599	image/jpeg	Jaguar.jpg
1600	image/jpeg	Image à trouver.jpg
1601	image/jpeg	Image à trouver.jpg
1602	image/jpeg	Image à trouver.jpg
1603	image/jpeg	Image à trouver.jpg
1604	image/jpeg	Image à trouver.jpg
1605	image/jpeg	Riviere Futuna_Jairo Talalua 1.jpg
1606	image/jpeg	Awala yalimapo, estuaire du Maroni.jpg
1607	image/jpeg	Titan_Julien Touroult.jpg
1608	image/jpeg	Dendrobates tinctorius.jpg
1609	image/jpeg	Toucan à bec rouge.jpg
1610	image/jpeg	Jaguar.jpg
1611	image/jpeg	Loutre géante.jpg
1612	image/jpeg	Tortue Luth.jpg
1613	image/jpeg	Carbet flottant sur la lac du barrage de petit saut.jpg
1614	image/jpeg	2U1A0284.jpg
1615	image/jpeg	le-systeme-copas-dans-la-reserve-naturelle-des-nouragues-PO Jay.jpg
1616	image/jpeg	le-fromager-Jean-Christophe Marsy.jpg
1617	image/jpeg	Foret-Sylvain Santelli.jpg
1618	image/jpeg	la-roche-koutou-plaine du bas Marouini-Olivier Tostain.jpg
1619	image/jpeg	une-savane-de-guyane-Bernard G.jpg
1620	image/jpeg	riviere-et-marais-de-kaw-PoJay.jpg
1621	image/jpeg	Longicorne Titanus giganteus (Touroult).jpg
1622	image/jpeg	la-malavoune-la-campagne-en-shimaore-Bertrand Fanonnel.jpg
1623	image/jpeg	Image à trouver.jpg
1624	image/jpeg	Image à trouver.jpg
1625	image/jpeg	Image à trouver.jpg
1626	image/jpeg	Mayotte_Mangrove Kaweni_Fanny Cautain OFB.jpg
1627	image/jpeg	Image à trouver.jpg
1628	image/jpeg	Image à trouver.jpg
1629	image/jpeg	Image à trouver.jpg
1630	image/jpeg	Image à trouver.jpg
1631	image/jpeg	Image à trouver.jpg
1632	image/jpeg	Image à trouver.jpg
1633	image/jpeg	Image à trouver.jpg
1634	image/jpeg	Image à trouver.jpg
1635	image/jpeg	Image à trouver.jpg
1636	image/jpeg	Image à trouver.jpg
1637	image/jpeg	Image à trouver.jpg
1638	image/jpeg	Image à trouver.jpg
1639	image/jpeg	Image à trouver.jpg
1640	image/jpeg	Image à trouver.jpg
1641	image/jpeg	Image à trouver.jpg
1642	image/jpeg	Image à trouver.jpg
1643	image/jpeg	vue-depuis-le-mont-choungui-Manuel Parizot.jpg
1644	image/jpeg	Baobab-Pierre Olivier Jay.jpg
1645	image/jpeg	Îlot_M'Bouzi_Frédéric Ducarme.jpg
1646	image/jpeg	Ilot M'bouzi_Paul Giannasi OFB.jpg
1647	image/jpeg	Vasière des badamiers_Alexandra Gigou OFB.jpg
1648	image/jpeg	Baie de Bouéni_Frédéric Ducarme.jpg
1649	image/jpeg	Vue des plages de Moya depuis les hauteurs du Dziani Dzaha_Soimadou Mahamoud.jpg
1650	image/jpeg	Maki de Mayotte_Emmanuel Broeks.jpg
1651	image/jpeg	Dauphins à long bec Stenella longirostris_Yannick Stephan Mayotte Découverte.jpg
1652	image/jpeg	Tortue verte_Alexandra Gigou OFB.jpg
1653	image/jpeg	Mangrove de Kaweni_Fanny Cautain OFB.jpg
1654	image/jpeg	Passe en S_Boris Daniel OFB.jpg
1655	image/jpeg	Ylang-Ylang_Cesar Delnatte.jpg
1656	image/jpeg	Bruguiera gymnorhiza_Vincent Boullet.jpg
1657	image/jpeg	Octopus cyanea_Benjamin Guichard.jpg
1658	image/jpeg	Mayotte lagon_Alexandra Gigou.jpg
1659	image/jpeg	Corail passe en S_Marine Dedeken OFB.jpg
1660	image/jpeg	Herbier_Marine Dedeken.jpg
1661	image/jpeg	Image à trouver.jpg
1662	image/jpeg	Choungui_nord_Frédéric Ducarme.jpg
1663	image/jpeg	Image à trouver.jpg
1664	image/jpeg	Image à trouver.jpg
1665	image/jpeg	Image à trouver.jpg
1666	image/jpeg	Image à trouver.jpg
1667	image/jpeg	mi-air-mi-eau-Franck Mazeas.jpg
1668	image/jpeg	Image à trouver.jpg
1669	image/jpeg	Image à trouver.jpg
1670	image/jpeg	Image à trouver.jpg
1671	image/jpeg	Image à trouver.jpg
1672	image/jpeg	Image à trouver.jpg
1673	image/jpeg	Image à trouver.jpg
1674	image/jpeg	Image à trouver.jpg
1675	image/jpeg	Image à trouver.jpg
1676	image/jpeg	Image à trouver.jpg
1677	image/jpeg	908708 Sclerotheca raiateensis 137158 PF.jpg
1678	image/jpeg	Image à trouver.jpg
1679	image/jpeg	Image à trouver.jpg
1680	image/jpeg	Image à trouver.jpg
1681	image/jpeg	Image à trouver.jpg
1682	image/jpeg	Image à trouver.jpg
1683	image/jpeg	Image à trouver.jpg
1684	image/jpeg	Image à trouver.jpg
1685	image/jpeg	Image à trouver.jpg
1686	image/jpeg	Huahine (2).jpg
1687	image/jpeg	Raiatea (1).jpg
1688	image/jpeg	Lac Pali_Andréa Poiret.jpg
1689	image/jpeg	CoupledeHoazinshuppés_Crédit Gwenn Quérel RNNKR.jpg
1690	image/jpeg	Crabe des cocotiers_O Gargominy.jpg
1691	image/jpeg	vu-sur-le-mont-otemanu-Julien Meillon.jpg
1692	image/jpeg	motu-dans-latoll-de-rangiroa-Claude Rives.jpg
1693	image/jpeg	nuku-hiva-2-Pamela Carzon.jpg
1694	image/jpeg	Fakarava (1).jpg
1695	image/jpeg	Image à trouver.jpg
1696	image/jpeg	Image à trouver.jpg
1697	image/jpeg	Image à trouver.jpg
1698	image/jpeg	Image à trouver.jpg
1699	image/jpeg	Image à trouver.jpg
1700	image/jpeg	Image à trouver.jpg
1701	image/jpeg	Image à trouver.jpg
1702	image/jpeg	Vallée de la Hébé Crozet Julie Tucoulet.jpg
1703	image/jpeg	Manchot Royal Baie du Marin Crozet Julie Tucoulet.jpg
1704	image/jpeg	Image à trouver.jpg
1705	image/jpeg	Manchot Royal Baie du Marin Crozet Julie Tucoulet.jpg
1706	image/jpeg	Manchot Royal Baie du Marin Crozet Julie Tucoulet.jpg
1707	image/jpeg	Harlaque_14-05-20_4.jpg
1708	image/jpeg	Harlaque_14-05-20_4.jpg
1709	image/jpeg	Image à trouver.jpg
1710	image/jpeg	ff.jpg
1711	image/jpeg	AVP Kaz'aNyamba3.jpg
1712	image/jpeg	Coordinateur.jpg
1713	image/jpeg	Image à trouver.jpg
1714	image/jpeg	Image à trouver.jpg
1715	image/jpeg	Image à trouver.jpg
1716	image/jpeg	Image à trouver.jpg
1717	image/jpeg	Image à trouver.jpg
1718	image/jpeg	Image à trouver.jpg
1719	image/jpeg	Image à trouver.jpg
1720	image/jpeg	Image à trouver.jpg
1721	image/jpeg	Albatros Hurleur Crozet Julie Tucoulet (4).jpg
1722	image/jpeg	Gorfou sauteur Crozet Julie Tucoulet.jpg
1723	image/jpeg	Azorelles Crozet Julie Tucoulet (2).jpg
1724	image/jpeg	Elephant de mer Baie du Marin Crozet Julie Tucoulet.jpg
1725	image/jpeg	721546 Pringlea antiscorbutica Paradis et Poncet 220575 TAAF.jpg
1726	image/jpeg	Baie du Marin Crozet Julie Tucoulet.jpg
1727	image/jpeg	Base Alfred Faure et Albatros_Crozet_Julie Tucoulet_VSC394 (Copier).jpg
1728	image/jpeg	La-base-permanente-Alfred-Faure-à-Crozet-1-1920x1080_Bruno Marie.jpg
1729	image/jpeg	Port aux Français_Ker_Bruno Marie.jpg
1730	image/jpeg	AMS_2013_000120_BM-1920x1080_St Paul vu du ciel_Bruno Marie.jpg
1731	image/jpeg	Chou de Kerguelen Crozet Julie Tucoulet.jpg
1732	image/jpeg	Le-cratère-Antonelli-et-ses-phylicas-dAmsterdam-1920x1080.jpg
1733	image/jpeg	Orque_Crozet_Julie Tucoulet.jpg
1734	image/jpeg	Manchot Royal Baie du Marin Crozet Julie Tucoulet (2).jpg
1735	image/jpeg	Gorfou doré et Manchot Royal Crozet Julie Tucoulet_recadrée.jpg
1736	image/jpeg	Otarie-à-fourrure-subtropicale-Phocidés-Otaridés_Ams_©Roald-Harivel.jpg
1737	image/jpeg	Anatalanta-aptera_TAAF.jpg
1738	image/jpeg	Baie du Marin Crozet Manchot Royal Marion Dufresne_Julie Tucoulet.jpg
1739	image/jpeg	Anatalanta-aptera_TAAF_2.jpg
1740	image/jpeg	Anatalanta-aptera_TAAF_3.jpg
1741	image/jpeg	Albatros hurleur Crozet Julie Tucoulet (3).jpg
1742	image/jpeg	Tahiti (presqu'ile).jpg
1743	image/jpeg	Rapa_-_Mont_Tautautu_à_gauche,_Pukumaru_à_droite_Sardon.jpg
1744	image/jpeg	Raivavae_Australes_Pierre Lesage.jpg
1745	image/jpeg	Monarque de Ua Huka_Fred Jacq.jpg
1746	image/jpeg	Vue_Mangareva2_Fred.jpg
1747	image/jpeg	908708 Sclerotheca raiateensis 137158 PF.jpg
1748	image/jpeg	Santal Polynésien_Fred Jacq.jpg
1749	image/jpeg	Tiaré Tahiti_Eole Wind.jpg
1750	image/jpeg	Monarque de Tahiti_Fred Jacq.jpg
1751	image/jpeg	Chelonia mydas - B. Guichard - 120315.jpg
1752	image/jpeg	Triton_conch_(Charonia_tritonis)_AntanO(1).jpg
1753	image/jpeg	Triton_conch_(Charonia_tritonis)_AntanO(1).jpg
1754	image/jpeg	Partula tristis_Fred Jacq.jpg
1755	image/jpeg	Tahiti-Aorai-31 décembre 2018-vue panoramique Mts Pihaiateta Pito Hiti Orohena coucher de soleil (JYHM).JPG
1756	image/jpeg	ff.jpg
1757	image/jpeg	3.jpg
1758	image/jpeg	AVP Kaz'aNyamba3.jpg
1759	image/jpeg	Coordinateur.jpg
\.


--
-- Data for Name: indicator; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.indicator (id, slug, biom_id, is_rounded, rank) FROM stdin;
1003	especes-menacees	ff0ae3a9-fe01-41c9-a6e2-603b26b266fa	t	4
1000	especes-exotiques-envahissantes	f30b866a-8646-45d7-9601-6fcb27735c3c	t	6
1001	especes-endemiques	e20583f1-0f88-4637-b2c8-f5a1d1c18e07	f	3
1005	conservation-mangroves	5678bfe3-6129-4111-a951-0e218aebd701	t	7
1006	nouvelles-especes	180e0245-ce7f-4c19-9138-a2300670bd58	t	8
1002	especes-inventoriees	ce355550-cd94-420c-a6eb-de0e7bf1eb9a	t	1
1007	recifs-coralliens	b5892f4b-9c4f-442c-a565-03182760af42	t	5
1004	taux-boisement	b7078fc3-bd3f-44c0-b3d0-7db78b9fbcc6	t	2
\.


--
-- Data for Name: indicator_category; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.indicator_category (indicator_id, category_id) FROM stdin;
1000	1000
1001	1001
1005	1003
1006	1001
1002	1001
1007	1003
1004	1002
1003	1000
\.


--
-- Data for Name: indicator_ecogesture; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.indicator_ecogesture (indicator_id, ecogesture_id) FROM stdin;
1003	1006
1003	1000
1003	1005
1000	1003
1001	1006
1001	1000
1001	1005
1005	1002
1005	1005
1006	1007
1002	1007
1007	1001
1004	1006
1004	1005
\.


--
-- Data for Name: indicator_value; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.indicator_value (id, indicator_id, territory, value, unit) FROM stdin;
1229	1000	SAINT_PIERRE_ET_MIQUELON	7	
1217	1000	OUTRE_MER	60	
1223	1000	POLYNESIE_FRANCAISE	36	
1221	1000	SAINT_BARTHELEMY	11	
1220	1000	SAINT_MARTIN	11	
1222	1000	NOUVELLE_CALEDONIE	38	
1228	1000	GUYANE	11	
1193	1003	OUTRE_MER	19	%
1232	1001	MARTINIQUE	700	
1231	1001	GUADELOUPE	1399	
1239	1001	MAYOTTE	335	
1238	1001	REUNION	1558	
1237	1001	WALLIS_ET_FUTUNA	29	
1242	1001	CLIPPERTON	16	
1244	1001	SAINT_PIERRE_ET_MIQUELON	0	
1245	1001	TERRE_ADELIE	2	
1230	1001	OUTRE_MER	17846	
1236	1001	POLYNESIE_FRANCAISE	2673	
1240	1001	ILES_SUBANTARCTIQUES	199	
1234	1001	SAINT_BARTHELEMY	70	
1233	1001	SAINT_MARTIN	63	
1235	1001	NOUVELLE_CALEDONIE	8673	
1241	1001	ILES_EPARSES	38	
1243	1001	GUYANE	2551	
1219	1000	MARTINIQUE	18	
1226	1000	MAYOTTE	19	
1225	1000	REUNION	34	
1218	1000	GUADELOUPE	17	
1224	1000	WALLIS_ET_FUTUNA	26	
1227	1000	CLIPPERTON	1	
1265	1002	MARTINIQUE	7422	
1264	1002	GUADELOUPE	10527	
1272	1002	MAYOTTE	6162	
1271	1002	REUNION	10915	
1270	1002	WALLIS_ET_FUTUNA	2691	
1275	1002	CLIPPERTON	915	
1277	1002	SAINT_PIERRE_ET_MIQUELON	2112	
1278	1002	TERRE_ADELIE	1007	
1263	1002	OUTRE_MER	88966	
1269	1002	POLYNESIE_FRANCAISE	11776	
1273	1002	ILES_SUBANTARCTIQUES	2613	
1267	1002	SAINT_BARTHELEMY	2140	
1266	1002	SAINT_MARTIN	2234	
1268	1002	NOUVELLE_CALEDONIE	28092	
1274	1002	ILES_EPARSES	2042	
1276	1002	GUYANE	28940	
1279	1007	OUTRE_MER	29	%
1376	1004	OUTRE_MER	85	%
1249	1006	MARTINIQUE	29	
1256	1006	MAYOTTE	6.333333333	
1255	1006	REUNION	13.33333333	
1248	1006	GUADELOUPE	23	
1254	1006	WALLIS_ET_FUTUNA	6	
1259	1006	CLIPPERTON	0.333333333	
1261	1006	SAINT_PIERRE_ET_MIQUELON	0	
1262	1006	TERRE_ADELIE	3.666666667	
1247	1006	OUTRE_MER	583.3333333	
1253	1006	POLYNESIE_FRANCAISE	49.66666667	
1257	1006	ILES_SUBANTARCTIQUES	2.666666667	
1250	1006	SAINT_MARTIN	1.333333333	
1251	1006	SAINT_BARTHELEMY	0.333333333	
1252	1006	NOUVELLE_CALEDONIE	281.6666667	
1258	1006	ILES_EPARSES	1.666666667	
1260	1006	GUYANE	179.6666667	
1246	1005	OUTRE_MER	25.21552908	%
\.


--
-- Data for Name: page; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.page (id, name, model_name, title) FROM stdin;
1008	especes-endemiques	indicator	Espèces endémiques
1009	especes-inventoriees	indicator	Espèces indigènes
1005	indicateurs	indicators	Tous les indicateurs
1014	recifs-coralliens	indicator	Récifs coralliens
1006	protection-recifs-coralliens	ecogesture	Protéger les récifs coralliens
1018	ecogeste-agir	ecogesture-act	Encadré "agir pour la biodiversité" fiche écogeste
1015	martinique	territory	Martinique
1000	accueil	home	Accueil
1012	conservation-mangroves	indicator	Conservation des mangroves d'outre-mer
1019	sciences-participatives	science	Sciences participatives
1003	territoires	territories	Découvrez les outre-mer
1001	guadeloupe	territory	Guadeloupe
1025	protection-faune	ecogesture	Respecter la faune sauvage
1026	limiation-plastique	ecogesture	Réduire les déchets et le plastique
1030	mentions-legales	legal-terms	Mentions légales
1024	protection-contre-eee	ecogesture	Protection contre les EEE
1017	ecogestes	ecogestures	Accueil écogestes
1042	Entretien avec Jeanne Wagner	interview	Entretien avec Jeanne Wagner
1039	mayotte	territory	Mayotte
1002	antilles	territory-zone	bassin antillais
1020	nouvelle-caledonie	territory	Nouvelle-Calédonie
1041	iles-subantarctiques	territory	Les Terres Australes françaises 
1004	especes-exotiques-envahissantes	indicator	Espèces exotiques envahissantes 2
1007	apropos	about	A propos
1022	saint-pierre-et-miquelon	territory	Saint-Pierre-et-Miquelon
1028	exploitation-especes-protegees	ecogesture	Préserver les espèces protégées 
1011	taux-boisement	indicator	Proportion de forêts
1023	ne-pas-jeter-dechets-nature	ecogesture	Je ne jette pas mes déchets dans la nature
1038	guyane	territory	Guyane
1027	protection-flore	ecogesture	Préserver la flore sauvage
1040	polynesie	territory	Polynésie française
1021	reunion	territory	La Réunion
1016	agir-ensemble	act	Agir ensemble
1010	especes-menacees	indicator	Espèces éteintes et menacées
1031	wallis-et-futuna	territory	Wallis-et-Futuna
1013	nouvelles-especes	indicator	Nouvelles espèces décrites
1029	s-investir-sur-le-terrain	ecogesture	S'investir sur le terrain
\.


--
-- Data for Name: page_element; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.page_element (id, page_id, type, key, text, image_id, alt, href, title) FROM stdin;
32525	1019	TEXT	presentation.title	Faire progresser ensemble les connaissances	\N	\N	\N	f
32526	1019	TEXT	examples.projects.2.subject	Espèces marines	\N	\N	\N	f
32527	1019	TEXT	examples.title	Quelques exemples de programmes participatifs	\N	\N	\N	f
32528	1019	TEXT	examples.projects.0.title	La photo-identification des tortues marines à La Réunion	\N	\N	\N	f
32529	1019	TEXT	examples.projects.0.subject	Suivi individuel des tortues marines	\N	\N	\N	f
32530	1019	LINK	examples.projects.3.more	En savoir plus	\N	\N	https://www.facebook.com/paladalik/	f
32531	1019	TEXT	examples.projects.4.subject	Insectes lumineux	\N	\N	\N	f
32532	1019	TEXT	examples.projects.3.title	Le Réseau d’observation des récifs coralliens (RORC) de Nouvelle-Calédonie	\N	\N	\N	f
32533	1019	TEXT	examples.projects.1.actor	Groupe d’étude et de protection des oiseaux de Guyane (GEPOG)	\N	\N	\N	f
32534	1019	IMAGE	examples.projects.1.image	\N	1347	Conure cuivré, Guyane © Raphael Gailhac	\N	f
32535	1019	IMAGE	images.2.image	\N	1341	Sensibilisation à la biodiversité des récifs de Mayotte © Fanny Cautain / OFB	\N	f
32536	1019	IMAGE	examples.projects.4.image	\N	1346	*Aspisoma ignitum* © Julien Touroult / INPN 	\N	f
32537	1019	TEXT	paragraphs.0.text	Certains programmes se basent sur l’application d’un **protocole précis** (durée d’observation, distance couverte, nombre de points d’écoute, etc.). Ils nécessitent souvent une formation à la méthode et une implication sérieuse et régulière, car la qualité des données récoltées dépend de la bonne mise en œuvre du protocole. C’est le cas par exemple du Suivi temporel des oiseaux communs (STOC).\n\nD’autres programmes proposent de **faire remonter les observations ponctuelles ciblant une ou plusieurs espèces spécifiques**, parfois à une période précise ou sur un espace délimité. Par exemple les programmes de photo-identification de tortues ou de mammifères marins.\n\nLes signalements opportunistes permettent de faire remonter des observations occasionnelles, **comme des évènements inhabituels**, ou sur des espèces, une période ou un site non-ciblés. 	\N	\N	\N	f
32538	1019	TEXT	examples.projects.2.description	S’appuyer sur les observations de tous les usagers de la mer pour mieux comprendre le milieu marin mahorais, c’est l’objectif du programme TsiÔno, « J’ai vu » en shimaoré.  \nLe projet vise à préciser les inventaires des espèces et leur répartition, suivre les habitudes de certains individus pour 6 espèces cibles (dont la Baleine à bosse et le Dugong) et alerter sur la présence de phénomènes anormaux, comme la prolifération d’espèces envahissantes ou le blanchissement de coraux. Des supports pédagogiques permettent aux observateurs de s’exercer à la reconnaissance des espèces du lagon. 	\N	\N	\N	f
32539	1019	LINK	examples.projects.2.more	En savoir plus	\N	\N	https://www.tsiono.fr/ 	f
32540	1019	TEXT	examples.projects.0.description	Développé par Kelonia, l’observatoire des tortues marines de La Réunion, pour contribuer à la compréhension de la biologie des tortues marines, ce programme invite les plongeurs à envoyer photos et observations du comportement des individus rencontrées. L'identification de chaque tortue repose sur la configuration unique des écailles de sa tête.	\N	\N	\N	f
50106	1039	TEXT	events.2.description	Plus anciennes traces d’occupations humaine de Mayotte	\N	\N	\N	f
50107	1039	TEXT	events.3.description	Ratification du traité de cession de Mayotte à la France	\N	\N	\N	f
50108	1039	IMAGE	identity.image	\N	1622	Image provisoire	\N	f
50109	1039	TEXT	events.7.description	Création du Parc naturel marin de Mayotte	\N	\N	\N	f
50110	1039	TEXT	events.7.date	2010	\N	\N	\N	f
50111	1039	TEXT	interests.locations.0.name	L’îlot Mbouzi 	\N	\N	\N	f
50112	1039	TEXT	events.0.description	Émergence de l’île de Mayotte	\N	\N	\N	f
50113	1039	TEXT	events.1.description	Séparation de Petite-Terre et Grande-Terre	\N	\N	\N	f
50114	1039	TEXT	events.8.description	Mayotte devient un département français d'outre-mer	\N	\N	\N	f
50115	1039	TEXT	events.9.description	Découverte d’un volcan sous-marin actif à plus de 3000 m de fond à 50 km à l’est des côtes de Mayotte	\N	\N	\N	f
50116	1039	IMAGE	ecosystems.image	\N	1626	Pêcheur sur une pirogue dans la mangrove © Fanny Cautain / Office français de la biodiversité	\N	f
50117	1039	TEXT	identity.species	6 039	\N	\N	\N	f
50118	1039	IMAGE	ecosystems.ecosystems.0.image	\N	1625	image manquante	\N	f
50119	1039	TEXT	species.8.name	Les palétuviers	\N	\N	\N	f
50120	1039	TEXT	events.6.description	Ouverture de l’antenne de Mayotte du Conservatoire botanique national de Mascarin	\N	\N	\N	f
50121	1039	TEXT	events.6.date	2009	\N	\N	\N	f
50122	1039	TEXT	events.4.description	Référendum d'autodétermination : la population de Mayotte choisit de rester française	\N	\N	\N	f
50123	1039	TEXT	events.5.description	Création de la Réserve naturelle nationale de l'îlot M'Bouzi	\N	\N	\N	f
50124	1039	TEXT	interests.locations.2.name	Le Mont Choungui	\N	\N	\N	f
50125	1039	TEXT	ecosystems.ecosystems.3.description	Plusieurs types de récifs se trouvent à Mayotte. Le lagon est entouré d’une barrière récifale de près de 140 km de long, large de 200 à 250 m et interrompue par douze passes. Elle est doublée par un récif interne sur 18 km au sud-ouest, phénomène rare dans le monde, et un récif frangeant longe les côtes. Les fonds sableux du lagon sont en partie colonisés par des herbiers de phanérogames. \nLa richesse des récifs et du lagon est exceptionnelle : plus de 760 espèces de poissons ont été inventoriées sur l’ensemble du milieu marin mahorais, dont 24 espèces de requins et 13 de raies, ainsi que 300 espèces de coraux. \n	\N	\N	\N	f
50126	1039	TEXT	ecosystems.ecosystems.4.description	Les herbiers sous-marins se trouvent tout autour de Grande Terre et des îlots, dans les zones côtières peu profondes à Mayotte. Peu denses et fragmentés, ils couvrent au total 760 hectares dans le lagon. \nOn y trouve 11 espèces de phanérogames marines, qui ne sont pas des algues mais bien des plantes à fleurs ! Ce sont des zones de refuge, de nurserie et d’alimentation pour de nombreuses espèces, comme les tortues marines et les dugongs mais aussi les poissons, mollusques et crustacés. \n	\N	\N	\N	f
50127	1039	TEXT	ecosystems.ecosystems.4.name	Les herbiers sous-marins 	\N	\N	\N	f
50128	1039	TEXT	statistics.3.text	de mammifères marins	\N	\N	\N	f
50129	1039	TEXT	events.10.date	2021	\N	\N	\N	f
50130	1039	IMAGE	species.1.image	\N	1631	image manquante	\N	f
50131	1039	TEXT	events.5.date	2007	\N	\N	\N	f
50132	1039	TEXT	identity.marineArea	73 600	\N	\N	\N	f
50133	1039	TEXT	events.8.date	2011	\N	\N	\N	f
50134	1039	IMAGE	interests.locations.0.image	\N	1646	Vue sur l'îlot M'Bouzi © Paul Giannasi / Office français de la biodiversité	\N	f
50135	1039	TEXT	species.6.name	Les dauphins	\N	\N	\N	f
50136	1039	IMAGE	interests.locations.3.image	\N	1647	Vue aérienne de la vasière des Badamiers © Alexandra Gigou / Office français de la biodiversité	\N	f
50137	1039	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
50138	1039	TEXT	interests.locations.3.name	La Vasière des Badamiers	\N	\N	\N	f
50139	1039	TEXT	statistics.1.text	de coraux	\N	\N	\N	f
50140	1039	TEXT	events.9.date	2019	\N	\N	\N	f
50141	1039	IMAGE	species.4.image	\N	1655	*Cananga odorata* © Cesar Delnatte	\N	f
50142	1039	TEXT	events.3.date	1843	\N	\N	\N	f
50143	1039	IMAGE	ecosystems.ecosystems.3.image	\N	1659	Récifs de la passe en S © Marine Dedeken / Office français de la biodiversité	\N	f
50144	1039	IMAGE	species.3.image	\N	1650	*Eulemur fulvus* © Emmanuel Broeks	\N	f
50145	1039	TEXT	species.1.name	Le Drongo de Mayotte	\N	\N	\N	f
50146	1039	TEXT	species.7.name	Les tortues marines	\N	\N	\N	f
50147	1039	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
50148	1039	TEXT	species.4.name	L’Ylang-ylang	\N	\N	\N	f
50149	1039	TEXT	identity.area	377	\N	\N	\N	f
50150	1039	TEXT	species.0.description	Le Crabier blanc ([*Ardeola idae*](https://inpn.mnhn.fr/espece/cd_nom/418710)) est un petit héron dont le plumage change de couleur au cours de l’année. En période de reproduction, il est reconnaissable à son plumage blanc immaculé, son bec bleu terminé par une pointe noire et ses pattes roses, tandis que le reste de l’année son plumage est marron strié de beige, son bec gris (toujours terminé d’une pointe noire) et ses pattes verdâtres. Il vit dans les zones humides où il se nourrit d’insectes, d’amphibiens et de petits poissons, et niche dans les mangroves.\nMayotte est l’une des quatre seules îles au monde où l’espèce se reproduit, avec Madagascar, Europa et Aldabra (Seychelles), ce qui confère au territoire une importance capitale dans sa conservation. L’espèce est notamment menacée par la destruction de ses habitats, la probable prédation des œufs et des poussins par les rats et le braconnage. \nUn plan national d’action a été élaboré pour le préserver, et des actions de conservation sont mises en place par le Groupe d’étude et de protection des oiseaux de Mayotte ([GEPOMAY](http://gepomay.fr/)) dans le cadre du programme [LIFE BIODIV OM](https://www.lifebiodivom.fr/especes/crabier-blanc/). \n\nStatut sur la Liste rouge des oiseaux de Mayotte : en danger critique. \n	\N	\N	\N	f
50151	1039	IMAGE	interests.locations.5.image	\N	1649	Vue sur le lac Dzaha et la plage de Moya © Soimadou Mahamoud	\N	f
50152	1039	TEXT	identity.highestPointName	Mont Bénara	\N	\N	\N	f
50153	1039	TEXT	ecosystems.ecosystems.2.name	Les mangroves 	\N	\N	\N	f
50154	1039	TEXT	species.7.description	Deux espèces de tortues marines viennent pondre sur les plages de Mayotte, la Tortue verte ([*Chelonia mydas*](https://inpn.mnhn.fr/espece/cd_nom/77338)) et la Tortue imbriquée ([*Eretmochelys imbricata*](https://inpn.mnhn.fr/espece/cd_nom/77347)). Les tortues vertes sont les plus nombreuses, herbivores, elles peuvent être observées se nourrissant sur les herbiers de phanérogames, tandis que les tortues imbriquées sont omnivores et se nourrissent de mollusques, crustacés, coraux et petits poissons. D’autres espèces peuvent être occasionnellement observées mais ne viennent pas s’y reproduire.\nToutes les espèces de tortues marines sont fortement menacées à travers le monde par les activités humaines : prises accidentelles dans les filets de pêche, collisions avec les bateaux, destruction des sites de ponte et d’alimentation, pollutions… Bien qu’elles soient protégées, le braconnage des tortues marines est toujours très présent à Mayotte. \n  \nStatut sur la Liste rouge mondiale :\nTortue verte : en danger.\nTortue imbriquée : en danger critique.  \n	\N	\N	\N	f
35634	1007	IMAGE	partners.partners.1.logo	\N	1429	Parc naturel régional de la Martinique	\N	f
35635	1007	TEXT	partners.partners.0.url	http://www.biodiversite-martinique.fr/	\N	\N	\N	f
35636	1007	TEXT	goal2.quote	*Le Compteur constituera un signal d’alerte et donnera une visibilité forte et essentielle pour sensibiliser à l’évolution de la biodiversité.*  Livre bleu des outre-mer, 2018. 	\N	\N	\N	f
35637	1007	TEXT	goal1.title	Partager la connaissance scientifique	\N	\N	\N	f
35638	1007	IMAGE	goal2.quoteImage	\N	1433	Requins pointe noire, Fakarava, Polynésie française © Franck Mazeas	\N	f
35639	1007	TEXT	goal2.description	De nombreuses actions locales sont mises en place afin de tenter de préserver les écosystèmes et les espèces. Donner de la visibilité aux acteurs locaux, partager les expériences et les réussites, au bénéfice de tous, c’est également l’un des objectifs du Compteur. 	\N	\N	\N	f
35640	1007	TEXT	goal3.description	Chacun, à son échelle, peut agir pour préserver la biodiversité. Connaitre et appliquer des gestes simples, modifier ses habitudes et son comportement ou encore s’investir dans des programmes de sciences participatives, tout le monde est concerné par la préservation de la biodiversité. Le rôle du Compteur est d’accompagner les citoyens en partageant des informations claires et adaptées à tous les territoires, et en encourageant à se mobiliser.	\N	\N	\N	f
47392	1031	IMAGE	species.9.image	\N	1570	*Broussonetia papyrifera* © J-Y. H. Meyer, Délégation à la Recherche de la Polynésie française	\N	f
47393	1031	TEXT	events.2.description	Traces des premiers habitants de l'archipel, la civilisation Lapita	\N	\N	\N	f
47394	1031	TEXT	events.3.description	Première arrivée des européens dans l'archipel	\N	\N	\N	f
47395	1031	IMAGE	identity.image	\N	1502	Vue sur Alofi depuis Futuna © Tristan Berr	\N	f
47396	1031	TEXT	events.7.description	Élaboration de la Stratégie pour la biodiversité de Wallis-et-Futuna	\N	\N	\N	f
47397	1031	TEXT	events.7.date	2016	\N	\N	\N	f
50155	1039	TEXT	species.8.description	On trouve sept espèces de palétuviers dans les mangroves de Mayotte. La plus commune est le palétuvier rouge, ([*Rhizophora mucronata*](https://inpn.mnhn.fr/espece/cd_nom/447468)), qui couvre 80 % des mangroves. Il se reconnait à ses racines en échasses et sa feuille lancéolée qui présente une pointe à son extrémité. \nOn trouve également le Palétuvier gros poumon ([*Bruguiera gymnorhiza*](https://inpn.mnhn.fr/espece/cd_nom/809530)) aux racines en forme de genou ou encore le Palétuvier blanc ([*Avicennia marina*](https://inpn.mnhn.fr/espece/cd_nom/672495)), le plus tolérant aux fortes concentrations en sel, qui doit son nom à la face inférieure blanche de ses feuilles.\nIls se répartissent dans les mangroves en fonction de différents paramètres tels que la salinité, la nature des sols ou les niveaux d’eau. \n\nStatuts sur la Liste rouge de la flore vasculaire de Mayotte :\n*Rhizophora mucronata* : quasi menacée. \n*Bruguiera gymnorhiza* : vulnérable. \n*Avicennia marina* : préoccupation mineure.\n	\N	\N	\N	f
50156	1039	IMAGE	species.2.image	\N	1657	*Octopus cyanea* © Benjamin Guichard	\N	f
50157	1039	IMAGE	ecosystems.ecosystems.4.image	\N	1660	Herbier sous-marin © Marine Dedeken / Office français de la biodiversité	\N	f
50158	1039	TEXT	species.3.description	Ce lémurien est considéré comme une sous-espèce ou une variété du Lémur fauve de Madagascar ([*Eulemur fulvus*](https://inpn.mnhn.fr/espece/cd_nom/418673)). Il aurait été introduit par l’homme à Mayotte il y a plusieurs siècles. Il possède un pelage variant du beige au roux avec une tête noire et des yeux orangés. Vivant en groupe dans les zones forestières et se nourrissant principalement de fruits, la dégradation et la diminution de son habitat peuvent le pousser à s’approcher des zones habitées et consommer les productions fruitières ce qui crée des conflits avec les agriculteurs. L’espèce est protégée à Mayotte.  \n\nStatut sur la Liste rouge mondiale : vulnérable.\n	\N	\N	\N	f
50159	1039	TEXT	statistics.3.number	24 espèces	\N	\N	\N	f
50160	1039	TEXT	species.1.description	Le Drongo de Mayotte ([*Dicrurus waldenii*](https://inpn.mnhn.fr/espece/cd_nom/418746)) est un oiseau insectivore au plumage entièrement noir et à la longue queue fourchue, endémique de Mayotte. Très territorial, il vit en couple toute l’année dans les forêts humides du territoire et se reproduit pendant la saison des pluies. \nLa destruction des forêts humides pour l’agriculture et les aménagements urbains est une menace pour sa conservation. \n\nStatut sur la Liste rouge des oiseaux de Mayotte : vulnérable.\n	\N	\N	\N	f
35641	1007	TEXT	partners.partners.3.url	http://www.saint-pierre-et-miquelon.developpement-durable.gouv.fr/	\N	\N	\N	f
35642	1007	TEXT	partners.title	Partenariats et collaborations 	\N	\N	\N	f
35643	1007	TEXT	goal1.description	Quelles sont les espèces présentes dans ce territoire ? Comment évoluent leurs populations ? Quel est l’état de santé des récifs coralliens ? Pour répondre à ces questions et bien d’autres, différents paramètres, appelés « indicateurs », sont mesurés par les scientifiques pour suivre l’évolution de l’état de la biodiversité. Le Compteur a pour mission de rendre compte de l’état de ces connaissances dans les territoires en s'appuyant notamment sur l'[ONB](https://naturefrance.fr/), l'[INPN](https://inpn.mnhn.fr/accueil/index) et les observatoires locaux. 	\N	\N	\N	f
35644	1007	IMAGE	goal3.image	\N	1431	 Randonneurs © Observatoire Martiniquais de la biodiversité	\N	f
35645	1007	TEXT	header.subtitle	C’est le Livre Bleu outre-mer, synthèse des travaux des Assises des outre-mer, qui propose en 2018 la création d’un Compteur de la biodiversité. Ce nouveau dispositif vient notamment enrichir le portail [Naturefrance](https://naturefrance.fr/) en présentant un focus sur les territoires ultramarins. Outil actualisé et pérenne, il favorisera la rencontre, la synergie des citoyens et des acteurs de la biodiversité.  \n  \nLa démarche est collaborative et partenariale avec les territoires, notamment pour relater les contextes culturels et mettre en avant des enjeux spécifiques. Des études, actuellement en cours, viennent compléter l’initiative : le premier panorama des programmes de sciences participatives dans les territoires, et une enquête sur la perception de la nature et l’utilisation des outils numériques. 	\N	\N	\N	f
35646	1007	TEXT	header.title	Pourquoi un Compteur de la biodiversité en outre-mer ?	\N	\N	\N	f
35647	1007	CHECKBOX	header.shadowed	true	\N	\N	\N	f
35648	1007	TEXT	goal3.title	Encourager chacun à agir	\N	\N	\N	f
35649	1007	TEXT	partners.partners.1.url	http://www.pn-martinique.com/	\N	\N	\N	f
35650	1007	IMAGE	partners.partners.3.logo	\N	1432	DTAM Saint-Pierre et Miquelon	\N	f
35651	1007	IMAGE	goal2.image	\N	1426	Sensibilisation des enfants, Mayotte © Fanny Cautain / OFB	\N	f
35652	1007	IMAGE	goal1.image	\N	1427	Jaguar, Guyane © Raphaël Gailhac	\N	f
35653	1007	IMAGE	partners.partners.2.logo	\N	1430	Criobe	\N	f
35064	1017	TEXT	presentation	Les activités humaines sont à l’origine du déclin de la biodiversité et la dégradation des écosystèmes. Aujourd’hui plus que jamais, il est nécessaire de remettre en question nos comportements et nos choix de consommation, au quotidien ou en voyage, chez soi ou en milieu naturel, pour mieux prendre soin de la biodiversité qui nous entoure. Petits efforts ou grands gestes, nous pouvons tous être acteurs du changement, pour limiter notre impact sur le monde qui nous entoure.  \n\nL’objectif du Compteur est de mettre en avant des écogestes adaptés aux contextes ultramarins.	\N	\N	\N	f
35065	1017	IMAGE	image	\N	1073	© DR	\N	f
35066	1017	TEXT	quote	Des actions concrètes pour agir dès maintenant et préserver cette biodiversité les espèces et les écosystèmes	\N	\N	\N	f
35067	1017	TEXT	question	Qu’est-ce qu’un écogeste ? 	\N	\N	\N	f
40494	1015	TEXT	events.2.description	Dernière éruption de la Montagne Pelée	\N	\N	\N	f
40495	1015	TEXT	events.3.description	Création du Parc naturel régional de Martinique et de la Réserve naturelle nationale de la presqu'île de la Caravelle	\N	\N	\N	f
40496	1015	IMAGE	identity.image	\N	1284	La Montagne Pelée depuis la mer © Fabien Lefebvre	\N	f
40497	1015	TEXT	events.7.description	Création de [l'Observatoire Martiniquais de la biodiversité](http://www.biodiversite-martinique.fr/#)	\N	\N	\N	f
40498	1015	TEXT	events.7.date	2015	\N	\N	\N	f
40499	1015	TEXT	interests.locations.0.name	Le Parc naturel régional de la Martinique	\N	\N	\N	f
40500	1015	TEXT	events.0.description	Premières traces d'occupation humaine en Martinique	\N	\N	\N	f
40501	1015	TEXT	events.1.description	La Martinique devient française	\N	\N	\N	f
40502	1015	TEXT	events.8.description	Expédition Madibenthos : inventaire de la faune et de la flore marine côtière	\N	\N	\N	f
40503	1015	TEXT	events.9.description	Création du [Parc naturel marin de Martinique](https://www.parc-marin-martinique.fr/)	\N	\N	\N	f
40504	1015	IMAGE	ecosystems.image	\N	1069	La Monnaie Caraïbes à ocelle (*Cyphoma gibbosum*), un mollusque présent dans les eaux de Martinique © Fabien Lefebvre	\N	f
35654	1007	TEXT	goal2.title	Valoriser les actions des territoires	\N	\N	\N	f
40505	1015	TEXT	identity.species	7 009	\N	\N	\N	f
40506	1015	IMAGE	ecosystems.ecosystems.0.image	\N	1307	Plage de Martinique © Antoine Forget / OFB	\N	f
40507	1015	TEXT	species.8.name	Le Gommier blanc	\N	\N	\N	f
40508	1015	TEXT	events.6.description	Création de la Réserve naturelle régionale marine du Prêcheur - Albert Falco	\N	\N	\N	f
40509	1015	TEXT	events.6.date	2014	\N	\N	\N	f
35655	1007	TEXT	partners.partners.2.url	http://www.criobe.pf/	\N	\N	\N	f
40510	1015	TEXT	events.4.description	Création de la Réserve naturelle nationale des îlets de Sainte Anne	\N	\N	\N	f
40511	1015	TEXT	events.5.description	Création du [Sanctuaire AGOA](https://sanctuaire-agoa.fr/) pour les mammifères marins qui couvre toutes les Antilles françaises	\N	\N	\N	f
40512	1015	TEXT	interests.locations.2.name	L’étang des Salines	\N	\N	\N	f
40513	1015	TEXT	ecosystems.ecosystems.3.description	Les herbiers sont composés principalement de phanérogames marines : ce ne sont pas des algues mais bien des plantes aquatiques. Ils sont des lieux de reproduction, de développement et d’alimentation de nombreuses espèces (poissons, oursins, tortues…). En Martinique, ils s’étendent sur les fonds sableux sur près de 5 000 ha.	\N	\N	\N	f
40514	1015	TEXT	ecosystems.ecosystems.4.description	Des communautés coralliennes se développent sur tous les petits fonds de l’île mais elles ne forment de véritables récifs que sur la côte atlantique de l’île et dans la baie de Fort de France. 40 espèces coralliennes sont recensées dans les eaux de l’île. Cependant, une importante partie des colonies sont considérées comme dégradées.	\N	\N	\N	f
35656	1007	IMAGE	header.background	\N	1424	Monts Pito Hiti et Orohena, Tahiti, Polynésie française © Jean-Yves Meyer	\N	f
40515	1015	TEXT	ecosystems.ecosystems.4.name	Les récifs coralliens	\N	\N	\N	f
40516	1015	TEXT	statistics.3.text	hectares de mangroves sur le territoire	\N	\N	\N	f
40517	1015	TEXT	events.10.date	2020	\N	\N	\N	f
40518	1015	IMAGE	species.1.image	\N	1302	*Iguana delicatissima* © Patrick Haffner	\N	f
35657	1007	IMAGE	partners.partners.0.logo	\N	1428	Observatoire Martiniquais de la biodiversité	\N	f
40083	1027	IMAGE	presentation.file	\N	1468	affiche écogeste préservation flore sauvage	\N	f
40084	1027	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
40085	1027	IMAGE	action.cards.2.icon	\N	1136	nettoyer	\N	f
40086	1027	TEXT	presentation.name	Je préserve la flore sauvage  	\N	\N	\N	f
40087	1027	IMAGE	action.cards.0.icon	\N	1138	balisage	\N	f
40088	1027	IMAGE	presentation.image	\N	1140	© Fabien Lefebvre	\N	f
40089	1027	TEXT	understand.text	Dans les territoires ultramarins, de nombreuses espèces de plantes sont endémiques et leur répartition est parfois limitée à une très petite zone. Piétinements ou cueillettes intensives peuvent menacer la survie de ces espèces végétales, déjà soumises à de plus importantes pressions : changements climatiques, défrichements pour créer des espaces agricoles, pâturages d’animaux domestiques, incendies…\n\nAttention également aux plantes exotiques envahissantes : certaines plantes peuvent se développer à partir de très petits fragments et les très petites graines de certaines espèces peuvent facilement se coincer dans les chaussures ! C’est pourquoi les gestionnaires prennent d’importantes précautions lorsqu'ils mettent en place des opérations d’éradication de ces espèces. \n	\N	\N	\N	f
40090	1027	IMAGE	action.cards.1.icon	\N	1137	protection	\N	f
40091	1027	TEXT	action.cards.2.description	Je nettoie mes chaussures et mon matériel de randonnée régulièrement pour ne pas disséminer d’espèces envahissantes.	\N	\N	\N	f
40092	1027	TEXT	presentation.category	Sur terre	\N	\N	\N	f
40093	1027	TEXT	action.cards.1.description	Je ne cueille pas de plantes sauvages, il peut s’agir d’espèces fragiles et protégées. Si je souhaite prélever des plantes, je me renseigne d’abord sur la règlementation et les espèces protégées.	\N	\N	\N	f
40094	1027	TEXT	presentation.description	Préserver la flore, c'est préserver l'équilibre des écosystèmes. 	\N	\N	\N	f
40095	1027	TEXT	action.title	Pour profiter des espaces naturels sans impacter la flore 	\N	\N	\N	f
40096	1027	TEXT	understand.quote	256 espèces de végétaux sont menacées en Guadeloupe	\N	\N	\N	f
40097	1027	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
40098	1027	TEXT	action.cards.0.description	Je ne sors pas des sentiers balisés, ils sont là pour me permettre de ne pas abimer les milieux.	\N	\N	\N	f
40519	1015	TEXT	events.5.date	2010	\N	\N	\N	f
40520	1015	TEXT	identity.marineArea	45 000	\N	\N	\N	f
40521	1015	TEXT	events.8.date	2016	\N	\N	\N	f
40522	1015	IMAGE	interests.locations.0.image	\N	1280	Cascade dans le Parc Naturel Régional de la Martinique © Fabien Lefebvre	\N	f
50161	1039	TEXT	species.2.description	Sur les 16 espèces présentes dans les eaux du territoire, [*Octopus cyanea*](https://inpn.mnhn.fr/espece/cd_nom/527348) est le plus grand : il peut dépasser 1 m de long et peser jusqu’à 8kg. Ordinairement de couleur brun-rouge, il change de couleur pour se camoufler dans son environnement. On le retrouve sur les zones récifales où il se cache dans des trous. \nCes mollusques céphalopodes sont remarquablement intelligents, capables d’utiliser des outils et disposent d’une impressionnante mémoire. Leur cycle de vie est court, entre 12 et 24 mois. Les mâles déclinent à la suite de la reproduction et les femelles meurent quelques jours après l’éclosion des œufs.  \nTrès appréciés à Mayotte, les poulpes sont pêchés à pied sur les platiers à marée basse. Pour préserver la ressource, des réserves de pêche sont mise en place à l’initiative de la population locale, la pêche est alors temporairement interdite afin de permettre aux poulpes de se reproduire.  \n\nStatut sur la Liste rouge mondiale pour *Octopus cyanea* : préoccupation mineure.\n	\N	\N	\N	f
50162	1039	TEXT	statistics.1.number	300 espèces	\N	\N	\N	f
47398	1031	TEXT	interests.locations.0.name	Le lac Lalolalo	\N	\N	\N	f
47399	1031	TEXT	events.0.description	Émergence de Futuna et Alofi	\N	\N	\N	f
47400	1031	TEXT	events.1.description	Émergence de Wallis et ses îlots	\N	\N	\N	f
50163	1039	TEXT	statistics.0.number	1 100 km<sup>2</sup>	\N	\N	\N	f
50164	1039	TEXT	statistics.2.number	667 hectares	\N	\N	\N	f
40523	1015	TEXT	species.6.name	Le Trigonocéphale	\N	\N	\N	f
40524	1015	IMAGE	interests.locations.3.image	\N	1059	Montagne Pelée © Youri Germany/Unsplash	\N	f
40525	1015	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
40526	1015	TEXT	interests.locations.3.name	La Montagne Pelée et les Pitons du Carbet	\N	\N	\N	f
40527	1015	TEXT	statistics.1.text	espèces de coraux recensées dans les eaux de l'île	\N	\N	\N	f
40528	1015	TEXT	events.9.date	2017	\N	\N	\N	f
40529	1015	IMAGE	species.4.image	\N	1064	*Aechmea reclinata* © Cesar Delnatte/OMB	\N	f
40530	1015	TEXT	events.3.date	1976	\N	\N	\N	f
40531	1015	IMAGE	ecosystems.ecosystems.3.image	\N	1270	Herbier et poisson, Martinique © Fabien Lefebvre	\N	f
40532	1015	IMAGE	species.3.image	\N	1279	*Chelonia mydas* © Fabien Lefebvre	\N	f
40533	1015	TEXT	species.1.name	L'Iguane des Petites Antilles	\N	\N	\N	f
40534	1015	TEXT	species.7.name	Le Moqueur gorge-blanche	\N	\N	\N	f
40535	1015	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
40536	1015	TEXT	species.4.name	L'Ananas bois	\N	\N	\N	f
40537	1015	TEXT	identity.area	1 128	\N	\N	\N	f
40538	1015	TEXT	species.0.description	Le Matoutou Falaise ([*Caribena versicolor*](https://inpn.mnhn.fr/espece/cd_nom/845739\n)) est une mygale arboricole endémique de la Martinique. D’une envergure totale pouvant aller jusqu’à 15 cm, elle se caractérise par ses couleurs : abdomen rouge vif, pattes roses violacées et thorax bleuté. Prédatrice nocturne, elle se nourrit principalement d'insectes et est inoffensive pour les humains. Longtemps prélevée par les terrariophiles, l’espèce est protégée depuis 2017 au niveau national et sa détention est illicite.  \n  \nStatut dans la Liste rouge mondiale : non évalué. 	\N	\N	\N	f
40539	1015	TEXT	identity.highestPointName	Montagne Pelée	\N	\N	\N	f
40540	1015	TEXT	ecosystems.ecosystems.2.name	Les mangroves	\N	\N	\N	f
40541	1015	TEXT	species.7.description	Le Moqueur gorge-blanche ([*Ramphocinclus brachyurus*](https://inpn.mnhn.fr/espece/cd_nom/442316\n)) est un petit oiseau à la face dorsale foncée et la face ventrale blanche endémique de la Martinique et de Sainte-Lucie. Il se trouve uniquement dans les zones boisées de la Presqu’île de la Caravelle. Considéré en danger d’extinction en raison de la petite taille de la population, il est victime de la prédation par les espèces introduites et fait l’objet d’un programme de conservation dans le cadre du programme [LIFE BIODIV’OM](https://www.lifebiodivom.fr/especes/moqueur-gorge-blanche/).\n\nStatut dans la Liste rouge des oiseaux de Martinique : en danger critique. 	\N	\N	\N	f
40542	1015	TEXT	species.8.description	Le Gommier blanc ([*Dacryodes excelsa*](https://inpn.mnhn.fr/espece/cd_nom/447568\n)) est l’un des plus grands arbres des forêts de Martinique, il peut atteindre 35 mètres de haut. Il est exploité pour son bois et sa résine.  \n  \nStatut dans la Liste rouge de la flore vasculaire de Martinique : non évalué.	\N	\N	\N	f
40543	1015	IMAGE	species.2.image	\N	1287	*Aliger gigas* © Benjamin Guichard / OFB	\N	f
40544	1015	IMAGE	ecosystems.ecosystems.4.image	\N	1267	Récif de Martinique © Fabien Lefebvre	\N	f
40545	1015	TEXT	species.3.description	La Tortue verte ([*Chelonia mydas*](https://inpn.mnhn.fr/espece/cd_nom/77338\n)) est l’une des cinq espèces de tortues marines qui fréquentent les eaux de Martinique. Si elle est régulièrement observable dans l’eau, en alimentation sur les herbiers, elle ne pond que rarement sur les plages de Martinique. Comme toutes les espèces de tortues marines, elle est menacée d'extinction, notamment en raison des captures accidentelles dans les filets de pêche et la dégradation des sites de ponte. Le dérangement répété par les baigneurs peut également occasionner une forte dépense d’énergie pour les tortues, c’est pourquoi il est recommandé de garder une distance minimum de quelques mètres et de ne pas tenter de les toucher.\n\nStatut dans la Liste rouge des reptiles de Martinique : en danger critique. 	\N	\N	\N	f
40546	1015	TEXT	statistics.3.number	2 000	\N	\N	\N	f
40547	1015	TEXT	species.1.description	L’Iguane des Petites Antilles ou Iguane péyi ([*Iguana delicatissima*](https://inpn.mnhn.fr/espece/cd_nom/350755\n)) était autrefois présent sur tout le nord des Petites Antilles, depuis Anguilla jusqu’à la Martinique. Il a aujourd’hui disparu de nombreux territoires, et est considéré en danger critique d’extinction. Sa survie est menacée par l’introduction de l’Iguane commun ([*Iguana iguana*](https://inpn.mnhn.fr/espece/cd_nom/350756\n)) avec qui il ne doit pas être confondu. L’Iguane commun exotique se reconnait aux rayures sombres sur la queue et à sa grosse plaque ronde sur la joue, sous le tympan, que ne possèdent pas l’Iguane des Petites Antilles.\n\nStatut dans la Liste rouge des reptiles de Martinique : en danger critique.	\N	\N	\N	f
47401	1031	TEXT	events.8.description	Publication de la liste des espèces protégées de Wallis-et-Futuna	\N	\N	\N	f
47402	1031	IMAGE	ecosystems.image	\N	1504	îlot Nukula'ela'e depuis Nukufotu © Tristan Berr	\N	f
39687	1028	IMAGE	presentation.file	\N	1485	affiche écogeste exploitation espèces protégées	\N	f
39688	1028	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
39689	1028	IMAGE	action.cards.2.icon	\N	1145	bagages	\N	f
39690	1028	TEXT	presentation.name	Je ne participe pas à l’exploitation des espèces protégées	\N	\N	\N	f
39691	1028	IMAGE	action.cards.0.icon	\N	1143	pêche	\N	f
39692	1028	IMAGE	presentation.image	\N	1142	Singe hurleur roux, Guyane © Fabien Lefebvre	\N	f
39693	1028	TEXT	understand.text	Bois précieux, espèces aux propriétés médicinales, chasse et pêche, nouveaux animaux de compagnie… L'exploitation illégale conduit à la réduction des populations de nombreuses espèces animales et végétales, voire à leur extinction, dans tous les territoires.\n\nLes tortues marines sont particulièrement victimes du braconnage, pour la consommation de leur viande. Si le phénomène est marqué à Mayotte, où plusieurs centaines de tortues sont encore braconnées chaque année lorsqu'elles viennent pondre sur les plages, on observe encore des captures illégales de tortues dans les collectivités des Caraïbes, en Guyane ou en Polynésie française.\n\nA La Réunion, des pêcheurs illégaux dans la Réserve marine sont régulièrement appréhendés de nuit avec des poissons et des langoustes. Sur terre, c'est notamment le Palmiste rouge, endémique du territoire, qui fait l'objet d'une exploitation illégale dans le Parc National.\nAutre exemple en Martinique, où les oursins blancs sont ramassés illégalement, parfois par centaines de kilos, alors que leur pêche n'est autorisée que quelques jours par an et uniquement réservée aux professionnels déclarés. En Guyane, oiseaux et reptiles font également l'objet de trafics.\n\nDes peines de prisons et de lourdes amendes sont régulièrement prononcées contre les braconniers. Pour ne pas conduire à l'extinction des espèces menacées, ne participons pas au trafic illégal d'espèces protégées.	\N	\N	\N	f
39694	1028	IMAGE	action.cards.1.icon	\N	1144	informations	\N	f
39695	1028	TEXT	action.cards.2.description	Je ne rapporte pas d’animaux ou de végétaux dans mes bagages.	\N	\N	\N	f
39696	1028	TEXT	presentation.category	Protéger les espèces	\N	\N	\N	f
39697	1028	TEXT	action.cards.1.description	Je me renseigne sur la provenance de ce que j’achète et je n'accepte pas de produits issus de l'exploitation illégale. 	\N	\N	\N	f
39698	1028	TEXT	presentation.description	Malgré des règlementations qui les protègent, certaines espèces menacées font toujours l’objet de braconnage et d’exploitation illégales.	\N	\N	\N	f
39699	1028	TEXT	action.title	Pour ne pas être complice de l’exploitation d’espèces protégées :	\N	\N	\N	f
39700	1028	TEXT	understand.quote	Certaines espèces peuvent toujours être exploitées ou chassées, mais les règlementations et les quotas doivent être respectés afin de permettre à la ressource de se renouveler durablement.	\N	\N	\N	f
39701	1028	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
39702	1028	TEXT	action.cards.0.description	Je respecte les règlementations de pêche (matériel, technique, zone d'exclusion,...) et ne prélève pas plus qu’autorisé. 	\N	\N	\N	f
50165	1039	IMAGE	interests.locations.4.image	\N	1648	Baie de Bouéni © Frédéric Ducarme	\N	f
50166	1039	TEXT	species.2.name	Les poulpes	\N	\N	\N	f
50167	1039	TEXT	risks.risks.1.name	Les récifs coralliens mahorais, des joyaux menacés	\N	\N	\N	f
50168	1039	TEXT	species.4.description	Cette plante ([*Cananga odorata*](https://inpn.mnhn.fr/espece/cd_nom/446902)) introduite à la fin du 18e siècle depuis l’Asie du Sud-est est devenue un emblème de l’île. L’arbre présente une écorce grise, et est généralement taillé pour rester à hauteur de cueillette, soit 2 à 3 m de haut alors qu’il peut atteindre 25 -30 m en milieu naturel. La floraison peut s’observer plusieurs fois par an. Les fleurs, très odoriférantes, présentent six longs pétales jaunes. On en extrait par distillation une huile essentielle très utilisée en cosmétique et en parfumerie.\n  \nStatut sur la Liste rouge mondiale : non évalué. \n	\N	\N	\N	f
50169	1039	TEXT	ecosystems.ecosystems.0.name	Les forêts primaires	\N	\N	\N	f
50170	1039	TEXT	species.5.description	On trouve à Mayotte deux espèces de baobabs, [*Adansonia digitata*](https://inpn.mnhn.fr/espece/cd_nom/448518) et [*Adansonia madagascariensis*](https://inpn.mnhn.fr/espece/cd_nom/807173). Le premier est également répandu en Afrique tandis que le second ne se rencontre qu’à Madagascar et Mayotte. *A. digitata* possède des fleurs blanches pendantes et sa floraison est très courte - l’ouverture des fleurs à lieu en fin d’après-midi et elles tombent le lendemain matin - tandis que le *A. madagascariensis* présente des fleurs rouge-orangées dirigées vers le ciel et sa floraison s’étend sur 3-4 jours. Ce dernier est devenu très rare à Mayotte où il ne reste que quelques individus, en raison du déclin des forêts sèches et du ramassage systématique des fruits. Il est inscrit parmi les espèces protégées et bénéficie d’un plan de conservation.  \n\nStatut sur la Liste rouge de la flore vasculaire de Mayotte :\nPour *A. madagascariensis* : en danger critique.\nPour *A. digitata* : préoccupation mineure.\n	\N	\N	\N	f
50171	1039	TEXT	species.6.description	Vingt-et-unes espèces de dauphins ont été observées à Mayotte. Les plus communes à l’extérieur du lagon sont le Stenelle tacheté ([*Stenella attenuata*](https://inpn.mnhn.fr/espece/cd_nom/60914)) et le Dauphin à long bec ([*Stenella longirostris*](https://inpn.mnhn.fr/espece/cd_nom/60916)), qui se déplacent en grands groupes. Les populations sont évaluées à plusieurs centaines d’individus pour le premier et un millier pour le second. Dans le lagon et sur le banc de l’Iris, on rencontre notamment le Grand Dauphin du Pacifique ([*Tursiops aduncus*](https://inpn.mnhn.fr/espece/cd_nom/528706)), observé seul ou en petits groupes et dont les effectifs dans les eaux mahoraises sont estimés entre 70 et 100 individus. \nLes dauphins sont menacés par la pêche, qui impacte leur alimentation par la réduction des stocks de poissons disponibles, et entraine des captures accidentelles dans les filets. \nLes excursions touristiques en bateau organisées pour les observer peuvent les perturber, il est nécessaire de respecter les [consignes de bonnes pratiques d’observation](https://parc-marin-mayotte.fr/editorial/quand-jobserve).\n\nStatut sur la Liste rouge mondiale : \n*Stenella attenuata* : préoccupation mineure.\n*Stenella longirostris* : préoccupation mineure.\n*Tursiops aduncus* : quasi-menacé. \n	\N	\N	\N	f
50172	1039	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
50173	1039	TEXT	interests.locations.5.name	Le Dziani Dzaha	\N	\N	\N	f
50174	1039	TEXT	events.0.date	-8 millions d'années	\N	\N	\N	f
32541	1019	TEXT	examples.projects.4.description	Relai guadeloupéen de l’Observatoire des vers luisants et lucioles, l’observatoire Ti bèt a limiè a commencé ses activités en 2019. Les participants sont invités à faire remonter leurs observations de plusieurs espèces d’insectes lumineux (lucioles et taupins), afin de mieux connaitre leur biologie et leur écologie, identifier les facteurs favorisant leur présence ou leur régression et sensibiliser la population à leur maintien.	\N	\N	\N	f
50175	1039	TEXT	identity.populationYear	2020	\N	\N	\N	f
33610	1005	LINK	onb.link	Retrouvez les indicateurs sur le site de l’ONB	\N	\N	https://naturefrance.fr/indicateurs	f
50176	1039	IMAGE	species.5.image	\N	1644	Baobab © Pierre-Olivier Jay	\N	f
47403	1031	TEXT	identity.species	2 691	\N	\N	\N	f
47404	1031	IMAGE	ecosystems.ecosystems.0.image	\N	1571	Forêt dense humide sur Alofi © J-Y. H. Meyer, Délégation à la Recherche de la Polynésie française	\N	f
47405	1031	TEXT	species.8.name	Le faux-tabac	\N	\N	\N	f
47406	1031	TEXT	events.6.description	Adoption du Code territorial de l'Environnement	\N	\N	\N	f
47407	1031	TEXT	events.6.date	2007	\N	\N	\N	f
47408	1031	TEXT	events.4.description	Wallis-et-Futuna devient un territoire d'outre-mer français par référundum	\N	\N	\N	f
47409	1031	TEXT	events.5.description	Création du Service de l'Environnement de Wallis-et-Futuna	\N	\N	\N	f
50177	1039	TEXT	statistics.0.text	de lagon	\N	\N	\N	f
50178	1039	TEXT	ecosystems.ecosystems.1.name	Les padzas	\N	\N	\N	f
50179	1039	TEXT	events.2.date	8e siècle	\N	\N	\N	f
32542	1019	IMAGE	images.1.image	\N	1352	Observations à la longue vue à Saint-Pierre et Miquelon © Nathalie De Lacoste	\N	f
32543	1019	TEXT	examples.projects.3.description	Sur les côtes néo-calédoniennes, plus de 80 stations coraliennes sont suivies annuellement selon une méthodologie appliquée par le réseau international [Reef Check](https://www.reefcheck.fr). Les observations protocolées sont réalisées sur quatre compartiments de l'environnement récifal (habitats, poissons, macro-invertébrés et perturbations du récif) pour évaluer sont état de santé. L'association Pala Dalik assure l’animation, la coordination et la formation des participants sur l'ensemble des trois provinces. 	\N	\N	\N	f
32544	1019	TEXT	examples.projects.2.actor	Parc marin de Mayotte	\N	\N	\N	f
32545	1019	LINK	examples.projects.4.more	En savoir plus	\N	\N	https://www.anbaloup-la.fr/observatoire-lucioles/	f
32546	1019	TEXT	paragraphs.1.text	La plupart des programmes permettent d’alimenter des bases de données collaboratives. Certains projets sont adossés à des programmes de recherche et visent à répondre à une question précise. D’autres mettent en avant en premier lieu un fort objectif de pédagogie, d’acquisition de connaissances et de sensibilisation à la démarche scientifique des observateurs.\n	\N	\N	\N	f
32547	1019	IMAGE	examples.projects.0.image	\N	1081	© Cynomana  / CC BY-SA 4.0 	\N	f
32548	1019	IMAGE	examples.projects.3.image	\N	1083	© Reefcheck France 	\N	f
32549	1019	TEXT	examples.projects.3.target	Plongeurs, apnéistes. Formation nécessaire. 	\N	\N	\N	f
32550	1019	TEXT	paragraphs.2.title	Un état des lieux en cours	\N	\N	\N	f
33611	1005	TEXT	inpn.description	L’INPN recense les espèces (animales, végétales et fongiques), les habitats naturels, les espaces protégés et le patrimoine géologique, en métropole et en outre-mer. L’ensemble des acteurs de l’environnement contribuent à la mise à jour régulière des informations sur le site de l’INPN dans le cadre du Système d’information de l’Inventaire national du patrimoine naturel (SINP). L’INPN met à disposition de tous des données de référence, validées par des réseaux d'experts. Le Muséum national d'Histoire naturelle en assure la responsabilité scientifique.	\N	\N	\N	f
33612	1005	IMAGE	image	\N	1016	Serpent liane perroquet © Raphaël Gailhac	\N	f
33613	1005	TEXT	questions.1.quote	Avec ses territoires d’outre-mer, la France a donc une forte responsabilité dans la conservation de la biodiversité mondiale.	\N	\N	\N	f
33614	1005	TEXT	questions.2.answer	De nombreux scientifiques alertent sur la crise de biodiversité actuelle, qui pourrait être la 6<sup>e</sup> extinction de masse à l’échelle des temps géologiques. En effet, le rythme actuel des disparitions d’espèces observé est 100 à 1000 fois supérieur au taux naturel de disparition ! On estime que près de la moitié des espèces vivantes pourrait disparaitre d’ici un siècle.\nLes activités humaines en sont les principales responsables. Cinq causes majeures sont identifiées, qui se conjuguent entre elles : destruction et fragmentation des milieux, surexploitation des espèces, pollutions, changements climatiques et introduction d’espèces exotiques envahissantes.	\N	\N	\N	f
33615	1005	TEXT	questions.0.answer	La biodiversité, ou diversité biologique, désigne la diversité des formes de vie sur terre, c’est à dire l’ensemble du tissu vivant de la planète : plantes, animaux, champignons, bactéries, etc. Elle est le produit de la lente évolution du monde du vivant, depuis les premiers organismes connus datant de 3,5 milliards d’années.\nElle comprend 3 niveaux de définition :\n    • La diversité des écosystèmes, c’est-à-dire des milieux de vie : océans, prairies, forêts, etc. jusqu’à l’échelle d’un organisme ou d’une cellule !\n    • La diversité des espèces qui vivent dans ces milieux, et sont en relation les unes avec les autres ;\n    • La diversité génétique, c’est-à-dire la diversité des individus au sein de ces espèces.\nDe nombreux biens et services indispensables aux activités humaines en dépendent : nourriture, pollinisation, médicaments, matières premières, fertilisation des sols, épuration de l’eau, etc. 	\N	\N	\N	f
33616	1005	TEXT	questions.0.quote	La biodiversité est encore largement méconnue : on connait seulement 1,8 million d’espèces sur une diversité estimée d’environ 100 millions d’espèces !	\N	\N	\N	f
33617	1005	TEXT	questions.1.answer	La majorité des territoires d’outre-mer français sont situés dans des régions particulièrement riches en espèces, notamment en espèces endémiques, ce qu’on appelle des points chauds de la biodiversité (« Hotspots » en anglais) (Nouvelle-Calédonie, Antilles, Mayotte, La Réunion, Wallis et Futuna, Polynésie française). Avec la Guyane, la France possède une partie du plus grand massif forestier de la planète, l’Amazonie, et les territoires français réunissent 10 % des récifs coralliens répartis dans trois océans. Certains territoires isolés comme les îles subantarctiques abritent une faune et une flore adaptées à des climats extrêmes. 	\N	\N	\N	f
33618	1005	TEXT	inpn.title	L'Inventaire national du patrimoine naturel	\N	\N	\N	f
33619	1005	TEXT	questions.2.question	La biodiversité menacée	\N	\N	\N	f
33620	1005	TEXT	onb.description	Depuis 2012, l’Observatoire national de la biodiversité, actuellement piloté par l’Office français pour la biodiversité (OFB), publie des indicateurs sur l’état de la biodiversité française, avec la contribution de nombreux partenaires. Ils sont régulièrement actualisés et enrichis.\nLe Compteur met en lumière les indicateurs de l’ONB qui concernent les outre-mer et contribue à la création de nouveaux indicateurs pour ces territoires.	\N	\N	\N	f
33621	1005	TEXT	understand.description	La conservation de la biodiversité dépend de sa connaissance et de la compréhension des phénomènes qui l’impactent. Les indicateurs sont développés à partir de données de suivis et de mesures sur le terrain, et permettent de suivre l’évolution de l’état de santé de la biodiversité et de l’environnement. Ils sont utilisés pour définir des stratégies de gestion ou encore mesurer l'efficacité des plans de gestion d'espèces menacées.  Cependant, ils connaissent des limites par manque de données disponibles, manque de moyens de recherche ou parce que certains paramètres sont très complexes à évaluer.	\N	\N	\N	f
33622	1005	TEXT	title	Compter la biodiversité : oui, mais comment ? 	\N	\N	\N	f
33623	1005	TEXT	onb.title	L’Observatoire national de la biodiversité	\N	\N	\N	f
33624	1005	TEXT	presentation	Les indicateurs sont des outils qui permettent de de décrire différentes composantes de la biodiversité et ainsi mesurer son évolution dans le temps. De nombreux paramètres sont étudiés : taille des populations, état de santé des écosystèmes, taux de pollutions, etc. Ils renseignent ainsi l’état de la biodiversité à un instant précis, mais également l’état des connaissances et des moyens scientifiques actuels. Avec ses collaborateurs, le Compteur vise aussi à développer de nouveaux indicateurs ou chiffres clés sur la biodiversité ultramarine, qui viendront peu à peu enrichir le dispositif.	\N	\N	\N	f
33625	1005	TEXT	quote	Documenter et présenter l’évolution de la biodiversité, c’est permettre à chacun de prendre conscience des enjeux et des menaces.	\N	\N	\N	f
33626	1005	CHECKBOX	shadowed	false	\N	\N	\N	f
33627	1005	IMAGE	understand.image	\N	1362	Fakarava, Polynésie française © Franck Mazeas	\N	f
33628	1005	TEXT	questions.0.question	Qu’est-ce que la biodiversité ?	\N	\N	\N	f
33629	1005	LINK	inpn.link	Visitez le site de l'INPN	\N	\N	https://inpn.mnhn.fr/	f
33630	1005	TEXT	questions.2.quote	L'érosion de la biodiversité est une menace pour l'avenir de l'humanité.	\N	\N	\N	f
33631	1005	TEXT	understand.title	Les indicateurs, des outils pour évaluer la biodiversité	\N	\N	\N	f
33632	1005	TEXT	questions.1.question	Les outre-mer, des points chauds de biodiversité	\N	\N	\N	f
47410	1031	TEXT	interests.locations.2.name	Le lagon de Wallis	\N	\N	\N	f
47411	1031	TEXT	ecosystems.ecosystems.3.description	Le lagon de Wallis présente plusieurs formations récifales différentes et riches, tandis qu'Alofi ne possède qu’un lagon très restreint et que Futuna ne présente que des récifs frangeants. On trouve dans les eaux de Wallis-et-Futuna 135 espèces de coraux et plus de 700 espèces de poissons. 	\N	\N	\N	f
36707	1029	IMAGE	presentation.file	\N	1465	Affiche écogeste	\N	f
36708	1029	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
36709	1029	TEXT	presentation.name	Je m'investis sur le terrain	\N	\N	\N	f
36710	1029	IMAGE	action.cards.0.icon	\N	1150	jumelles	\N	f
36711	1029	IMAGE	presentation.image	\N	1361	Sensibilisation aux oiseaux marins de Mayotte animée par le Gepomay © Fanny Cautain / OFB	\N	f
47412	1031	TEXT	ecosystems.ecosystems.4.description	Étendus à l’intérieur du lagon de Wallis, les herbiers sous-marins sont très importants dans l’équilibre de l’écosystème récifal et abritent de nombreuses espèces de mollusques, crustacés et juvéniles de poissons. On y trouve 3 espèces de phanérogames marines : [*Halodule pinifolia*](https://inpn.mnhn.fr/espece/cd_nom/643947), [*Halophila ovalis*](https://inpn.mnhn.fr/espece/cd_nom/446212) et [*Syringodium isoetifolium*](https://inpn.mnhn.fr/espece/cd_nom/627258).	\N	\N	\N	f
47413	1031	TEXT	ecosystems.ecosystems.4.name	Les herbiers sous-marins	\N	\N	\N	f
47414	1031	IMAGE	species.1.image	\N	1508	*Candoia bibroni* © Enelio Liufau	\N	f
47415	1031	TEXT	events.5.date	1997	\N	\N	\N	f
47416	1031	TEXT	identity.marineArea	262 500	\N	\N	\N	f
47417	1031	TEXT	species.9.name	Le mûrier à papier	\N	\N	\N	f
47418	1031	TEXT	events.8.date	2020	\N	\N	\N	f
47419	1031	IMAGE	interests.locations.0.image	\N	1503	Lac Lalolalo © Enelio Liufau	\N	f
47420	1031	TEXT	species.6.name	Les *langakali*	\N	\N	\N	f
47421	1031	IMAGE	interests.locations.3.image	\N	1566	Alofi © Jean-Yves Hiro Meyer, Délégation à la Recherche de la Polynésie française	\N	f
47422	1031	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
32551	1019	TEXT	examples.projects.1.subject	Suivi des populations d’oiseaux communs par échantillonnages réguliers le long de parcours prédéfinis	\N	\N	\N	f
32552	1019	LINK	application.downloadLink	Je télécharge l’application INPN Espèces	\N	\N	https://inpn.mnhn.fr/informations/inpn-especes	f
47423	1031	TEXT	interests.locations.3.name	Alofi	\N	\N	\N	f
47424	1031	TEXT	statistics.1.text	entre Wallis et les îles Horn (Futuna et Alofi)	\N	\N	\N	f
47425	1031	IMAGE	species.4.image	\N	1580	*Smilosicyopus sasali* © P. Keith	\N	f
47426	1031	TEXT	events.3.date	1616	\N	\N	\N	f
47427	1031	IMAGE	ecosystems.ecosystems.3.image	\N	1578	Récifs coralliens de Wallis © Sandrine JOB	\N	f
40548	1015	TEXT	species.2.description	Le Lambi ([*Aliger gigas*](https://inpn.mnhn.fr/espece/cd_nom/972164\n)) est un mollusque dont la coquille imposante peut atteindre 30 cm et 1,5 kg. Victime de la surpêche pour sa chair et parfois l’usage décoratif de sa coquille, son exploitation est aujourd’hui strictement contrôlée. La Martinique en a fait son emblème officiel.  \n  \nStatut dans la Liste rouge mondiale : non évalué.   	\N	\N	\N	f
40549	1015	TEXT	statistics.1.number	40	\N	\N	\N	f
40550	1015	TEXT	statistics.0.number	48	\N	\N	\N	f
40551	1015	TEXT	statistics.2.number	2/3	\N	\N	\N	f
40552	1015	IMAGE	interests.locations.4.image	\N	1385	Réserve des îlets de Sainte Anne © PNR de la Martinique / Géo-graphique	\N	f
40553	1015	TEXT	species.2.name	Le Lambi	\N	\N	\N	f
40554	1015	TEXT	risks.risks.1.name	Un Observatoire local de la biodiversité	\N	\N	\N	f
40301	1016	TEXT	science.project.title	TsiÔno, le réseau des observateurs du milieu marin mahorais	\N	\N	\N	f
40302	1016	TEXT	header.title	Agir ensemble pour préserver la biodiversité remarquable des outre-mer	\N	\N	\N	f
40303	1016	CHECKBOX	header.shadowed	true	\N	\N	\N	f
40304	1016	IMAGE	science.project.image	\N	1345	Plongeur à Mayotte © Alexandra Gigou / OFB	\N	f
40305	1016	TEXT	science.title	Les sciences participatives	\N	\N	\N	f
40306	1016	TEXT	science.project.description	S’appuyer sur les observations de tous les usagers de la mer pour mieux comprendre le milieu marin mahorais, c’est l’objectif du programme TsiÔno, « J’ai vu » en shimaoré. Le projet vise à préciser les inventaires des espèces et leur répartition, suivre les habitudes de certains individus pour 6 espèces cibles (dont la Baleine à bosse et le Dugong) et alerter sur la présence de phénomènes anormaux, comme la prolifération d’espèces envahissantes ou le blanchissement de coraux. 	\N	\N	\N	f
40307	1016	TEXT	science.subtitle	Les sciences participatives permettent à tous les curieux de la nature, du débutant à l’expérimenté, de contribuer à l'amélioration des connaissances sur la biodiversité en fournissant aux scientifiques un grand nombre de données de terrain.	\N	\N	\N	f
40308	1016	TEXT	ecogestures.title	Découvrez les écogestes	\N	\N	\N	f
40309	1016	IMAGE	header.background	\N	1335	Agricultrices, Mayotte © Bertrand Fanonnel	\N	f
40310	1016	TEXT	header.subtitle	Réfléchir à son impact, changer ses habitudes, participer à la progression des connaissances sur les espèces et les espaces, donner de son temps dans des actions de terrain : chacun, à son échelle, peut agir et s’investir pour la préservation de la biodiversité de son territoire.  \n  \nLa troisième Stratégie nationale pour la biodiversité engage les territoires français pour la prochaine décennie à enrayer le déclin de la biodiversité. Des concertations citoyennes se déroulerons au cours de l'année 2021. Participez et retrouvez toutes les informations sur [biodiversité.gouv.fr](https://biodiversite.gouv.fr/).	\N	\N	\N	f
40311	1016	TEXT	ecogestures.subtitle	Petits efforts ou grands gestes, nous pouvons tous être acteurs du changement, pour limiter notre impact sur le monde qui nous entoure.	\N	\N	\N	f
47428	1031	IMAGE	species.3.image	\N	1510	*Pteropus tonganus* © Tristan Berr	\N	f
40555	1015	TEXT	species.4.description	L’Ananas bois ([*Aechmea reclinata*](https://inpn.mnhn.fr/espece/cd_nom/629022\n)) a été décrite pour la première fois en 1999 par une équipe du Parc naturel régional. Endémique de Martinique, cette espèce n’a été observée qu’en arrière-mangrove de Genipa et sur la montagne du Vauclin. Peu après sa découverte, une grande part de son aire de répartition a été défrichée illégalement pour y planter de la canne à sucre, mettant en péril cette espèce tout juste inventoriée.\n\nStatut dans la Liste rouge de la flore vasculaire de Martinique : en danger critique. 	\N	\N	\N	f
40556	1015	TEXT	ecosystems.ecosystems.0.name	Les plages	\N	\N	\N	f
40557	1015	TEXT	species.5.description	L’Herbe à Tortue ([*Thalassia testudinum*](https://inpn.mnhn.fr/espece/cd_nom/627263)) est une plante marine qui compose les herbiers de phanérogames sous-marins, souvent accompagnée de l’Herbe à Lamentin ([*Syringodium filiforme*](https://inpn.mnhn.fr/espece/cd_nom/627259)). Son aire de répartition couvre l’ensemble des Caraïbes, et de nombreuses espèces marines s’en nourrissent. L'introduction d'une espèce exotique de phanérogame, [*Halophila stipulacea*](https://inpn.mnhn.fr/espece/cd_nom/368620), signalée depuis 2006 dans les eaux martiniquaises, représente une potentielle menace pour ces herbiers indigènes. Des études sont en cours pour suivre son expansion et mesurer ses impacts sur les communautés marines. \n\nStatut dans la Liste rouge mondiale : préoccupation mineure.\n	\N	\N	\N	f
36712	1029	TEXT	understand.text	On estime que seule 30% des espèces de faune et de flore présentes en outre-mer sont bien répertoriées. Les études pour suivre les espèces nécessitent beaucoup de temps d'observation, c’est pourquoi en multipliant les observateurs, on peut accumuler un plus grand nombre de données. De nombreux programmes de sciences participatives sont ainsi mis en place afin de permettre à chacun d'apporter sa pierre à l'édifice de la connaissance en faisant remonter ses observations. Certains programmes ont développé des applications mobiles accessibles directement depuis un smartphone. \n\nDans le cadre du Compteur de biodiversité outre-mer, une étude est actuellement en cours pour recenser tous ces programmes. Lorsque cet état des lieux sera terminé, le Compteur présentera un annuaire vous permettant de sélectionner les programmes qui vous correspondent en fonction de votre territoire et vos centres d'intérêt.\n\nDe nombreuses structures locales et associations font régulièrement appel à des bénévoles, par exemple pour participer à des opérations de restauration des milieux : arrachages de plantes exotiques envahissantes, plantations d'espèces indigènes, ramassages de déchets,... Des sorties découvertes sont également régulièrement organisées par les acteurs locaux afin d'en savoir plus sur les écosystèmes et leurs habitants, tout en les respectant.\n\n	\N	\N	\N	f
36713	1029	IMAGE	action.cards.1.icon	\N	1149	réseau	\N	f
40558	1015	TEXT	species.6.description	Serpent endémique venimeux, le Trigonocéphale ([*Bothrops lanceolatus*](https://inpn.mnhn.fr/espece/cd_nom/439142\n)) a été victime de sa mauvaise réputation bien que peu d’accidents aient été à déplorer et qu’un anti-venin existe. Des primes à la capture ont longtemps existé et dans les années 1980, la mangouste ([*Urva auropunctata*](https://inpn.mnhn.fr/espece/cd_nom/850071/)) a été introduite des Indes dans le but de le combattre, cependant le serpent étant nocturne et la mangouste diurne, celle-ci s’est rabattue sur les espèces indigènes. Il est aujourd’hui rare sur l’île.\n\nStatut dans la Liste rouge des reptiles de Martinique : en danger. 	\N	\N	\N	f
36714	1029	TEXT	presentation.category	Connaissance	\N	\N	\N	f
40559	1015	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
14284	1030	TEXT	paragraphs.0.title	Conception et édition	\N	\N	\N	f
14285	1030	TEXT	paragraphs.1.text	**Informations contenues dans le site**\nLe portail Compteur de biodiversité outre-mer est un site informatif. \nIl a pour objectif de présenter la biodiversité des territoires ultra-marins français et des actions et initiatives menées pour la protection de ces écosystèmes.\nAucune information contenue sur le site ne saurait posséder ou être interprétée comme ayant une quelconque valeur contractuelle. Les textes à caractère scientifique publiés dans le site sont valables à la date de leur publication et ne sauraient engager leurs auteurs dans le futur.\nToute information contenue sur le site peut être modifiée, à tout moment sans préavis, par le Muséum national d’histoire naturelle. Les informations contenues sur le site ne constituent pas une offre de services ou de produits ni une sollicitation commerciale de quelque nature que ce soit, ni une recommandation ou un conseil. Le Muséum national d’histoire naturelle ne sera pas tenu responsable pour toute décision prise ou non sur la base d’une information contenue sur le site, ni pour l’utilisation qui pourrait en être faite par un tiers. Ces informations ne sauraient engager la responsabilité du Muséum national d’histoire naturelle.\n\n**Propriété intellectuelle**\nL’ensemble du site « Compteur de biodiversité outre-mer » relève de la législation française et internationale sur le droit d’auteur et la propriété intellectuelle.\nTous les éléments présentés sur ce site (textes, photographies, vidéos, créations graphiques, illustrations) sont soumis à la législation relative au droit des informations publiques et sont couverts par le droit d'auteur. Ces éléments restent la propriété exclusive du Muséum national d’Histoire naturelle et/ou de ses auteurs.\nLa reproduction de tout ou partie de ce site sur un support électronique quel qu’il soit est formellement interdite sauf autorisation expresse du directeur de la publication. La reproduction de ce site sur un support papier est autorisée pour des fins personnelles, associatives ou professionnelles et sous réserve du respect des trois conditions suivantes :\n• gratuité de la diffusion ;\n• respect de l’intégrité des documents reproduits : pas de modification ni altération d’aucune sorte ;\n• citation claire et lisible de la source indiquant le nom "Muséum national d’Histoire naturelle", l’adresse internet du site web du MNHN : www.mnhn.fr et la mention : "© sur www.mnhn.fr - Reproduction interdite – Tous droits réservés".\nToutes diffusions ou utilisations à des fins commerciales ou publicitaires des informations sont strictement interdites. Pour d’autres utilisations envisagées, veuillez nous consulter.\n\n**Crédits photographiques**\nToutes les photographies présentes sur le site sont créditées de leurs auteurs et de la licence associée à leur utilisation si elle est mentionnée.\nLes contenus sous licence Creative Commons ont une mention spécifique avec le type de licence qui permet à l’utilisateur d’aller consulter les conditions d’utilisation de l’image concernée. \nExemple :\n(CC BY-NC-SA 3.0)	\N	\N	\N	f
36715	1029	TEXT	action.cards.1.description	Je m’informe auprès des structures locales pour participer à des évènements sur mon territoire.	\N	\N	\N	f
36716	1029	TEXT	presentation.description	Participer à des actions concrètes pour faire progresser la connaissance et la préservation de la biodiversité, c’est possible !	\N	\N	\N	f
36717	1029	TEXT	action.title	Pour contribuer activement à la connaissance et la préservation de la biodiversité :	\N	\N	\N	f
36718	1029	TEXT	understand.quote	À ce jour il existe plus d'une centaine de programmes de sciences participatifs actifs réparti sur les territoires d'outre-mer.	\N	\N	\N	f
32553	1019	TEXT	examples.projects.1.description	Débuté en 2012 dans le cadre du Life+ CapDOM, conjointement avec la Martinique et La Réunion, le STOC-Guyane a pour but de suivre les variations d'abondances d'oiseaux communs sur le long terme pour évaluer l'impact des activités humaines. Le programme demande une implication régulière et nécessite une formation au protocole utilisé et la reconnaissance des espèces. A ce jour, près de cinquante parcours sont échantillonnés annuellement et au total, plus de 50 000 données ont été collectées.	\N	\N	\N	f
32554	1019	IMAGE	images.0.image	\N	1291	Observation des oiseaux marins à Mayotte © Fanny Cautain / OFB	\N	f
32555	1019	TEXT	examples.projects.1.target	Ornithologues amateurs ou professionnels (à titre bénévole). Formation nécessaire. 	\N	\N	\N	f
32556	1019	TEXT	examples.projects.0.target	Plongeurs, apnéistes, pratiquant la photo sous-marine	\N	\N	\N	f
32557	1019	TEXT	examples.projects.3.subject	Suivi de l’état de santé des récifs de Nouvelle-Calédonie	\N	\N	\N	f
36719	1029	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
36720	1029	TEXT	action.cards.0.description	Je rejoins les réseaux de sciences participatives afin de faire remonter mes observations (annuaire prochainement disponible).	\N	\N	\N	f
40312	1010	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
40313	1010	TEXT	understand.text2	Chaque espèce est évaluée par un groupe d’experts selon des critères bien définis tels que la taille de la population, son aire de distribution ou encore la disparition de son habitat naturel, pour pouvoir lui attribuer une catégorie. \nLe chiffre présenté ici comprend les espèces classées dans les catégories « éteinte au niveau mondial », « éteinte à l’état sauvage », «&nbsp;disparue au niveau régional », « en danger critique d’extinction », « en danger » et «&nbsp;vulnérable » dans les Listes rouges réalisées en outre-mer.  \n\nIl faut noter qu’une espèce peut être classée menacée sur le territoire national mais pas à l’échelle mondiale si son statut est bon dans d’autres pays, cependant on trouve en outre-mer de nombreuses espèces [endémiques](/indicateurs/especes-endemiques) qui ne sont présentes nulle part ailleurs dans le monde.	\N	\N	\N	f
40314	1010	TEXT	understand.text1	L'Union internationale pour la conservation de la nature (UICN) développe depuis 1964 un outil de référence permettant de mesurer l'état de conservation de la faune et de la flore mondiale : la Liste rouge. Les espèces y sont classifiées par catégories selon leur degré de vulnérabilité. Cela permet d'identifier les priorités d'action, les progrès accomplis ou les défis à relever pour la conservation des espèces.  \n  \nEn France, l'élaboration de la [Liste rouge nationale des espèces menacées](https://inpn.mnhn.fr/programme/listes-rouges-especes/presentation) est mise en œuvre depuis 2008 par le Muséum national d'Histoire naturelle, l'Office français de la biodiversité et le [Comité français de l'UICN](https://uicn.fr/liste-rouge-france/), en collaboration avec un large réseau d'experts.\n\n	\N	\N	\N	f
40315	1010	TEXT	territories.title	Pourcentage d'espèces menacées	\N	\N	\N	f
40316	1010	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
40317	1010	TEXT	understand.title1	La Liste rouge de l'UICN	\N	\N	\N	f
40560	1015	TEXT	events.0.date	1<sup>e</sup> siècle	\N	\N	\N	f
40561	1015	TEXT	identity.populationYear	2017	\N	\N	\N	f
40562	1015	IMAGE	species.5.image	\N	1277	*Thalassia testudinum* © Fabien Lefebvre	\N	f
40563	1015	TEXT	statistics.0.text	Ilets répartis autour de l'île	\N	\N	\N	f
40564	1015	TEXT	ecosystems.ecosystems.1.name	La forêt humide tropicale	\N	\N	\N	f
40565	1015	TEXT	events.2.date	1929-1932	\N	\N	\N	f
47429	1031	TEXT	species.1.name	Le Boa du Pacifique	\N	\N	\N	f
47430	1031	TEXT	species.7.name	Les palétuviers	\N	\N	\N	f
47431	1031	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
47432	1031	TEXT	species.4.name	Les gobies d'eau douce	\N	\N	\N	f
47433	1031	TEXT	identity.area	142	\N	\N	\N	f
40318	1010	TEXT	understand.paragraphs.1.text	Selon l'IPBES*, les cinq facteurs directs de changement qui affectent la nature et qui ont les plus forts impacts à l’échelle mondiale sont, dans l'ordre : les changements d’usage des terres et de la mer, l'exploitation directe de certains organismes, le changement climatique, les pollutions et les espèces exotiques envahissantes. Les impacts de ces différents facteurs sont souvent liés et s'additionnent : l'installation de certaines espèces exotiques peut par exemple être facilitée par les changements climatiques. Dans les îles, les espèces exotiques envahissantes seraient le premier facteur de perte de biodiversité. \n\n*la Plateforme intergouvernementale scientifique et politique sur la biodiversité et les services écosystémiques (en anglais IPBES) est un groupement international d'experts de la biodiversité, créé sous l'égide de l'ONU en 2012. L'IPBES a publié le 6 mai 2019 [le premier rapport d'évaluation mondiale sur la biodiversité et les services écosystémiques](https://www.ipbes.net/news/Media-Release-Global-Assessment-Fr). 	\N	\N	\N	f
40319	1010	TEXT	understand.title2	Plusieurs catégories de risque d’extinction	\N	\N	\N	f
40320	1010	TEXT	presentation.descriptionTerritories	des espèces sont considérées comme éteintes ou menacées	\N	\N	\N	f
40321	1010	TEXT	understand.paragraphs.0.title	Encore beaucoup d'évaluations à réaliser	\N	\N	\N	f
40322	1010	TEXT	understand.keyword	menaces	\N	\N	\N	f
40323	1010	TEXT	ecogestures.title	Que puis-je faire pour protéger les espèces menacées ?	\N	\N	\N	f
40324	1010	IMAGE	presentation.image	\N	1041	Albatros hurleur, archipel de Crozet, TAAF © Julie Tucoulet	\N	f
40325	1010	TEXT	understand.paragraphs.1.title	Quelles menaces pèsent sur les espèces ?	\N	\N	\N	f
40326	1010	TEXT	understand.paragraphs.0.text	De nombreuses espèces ne sont pas encore évaluées ou sont classées dans la catégorie « données insuffisantes ». C’est le cas par exemple pour de nombreux invertébrés, les champignons, ou encore les lichens et mousses, qui sont pourtant essentiels au bon fonctionnement des écosystèmes. Les espèces marines souffrent également d'un important déficit d'évaluations. \nLes chiffres présentés dans les Listes rouges ne sont donc pas exhaustifs, ils se précisent régulièrement au fur et à mesure de l’amélioration des connaissances scientifiques et de la parution de nouveaux travaux.  \n\nDe nombreux territoires d'outre-mer ont développé des Listes rouges à l'échelle de leur territoire, mais certains, comme Saint-Pierre-et-Miquelon ou Wallis-et-Futuna sont trop petits pour que l'application de cette méthodologie soit pertinente à cette échelle.  	\N	\N	\N	f
40327	1010	IMAGE	understand.image	\N	1042	Tortue luth, Guyane © Raphael Gailhac	\N	f
40328	1010	TEXT	understand.paragraphs.2.title	Des programmes de conservation pour les espèces les plus menacées	\N	\N	\N	f
40329	1010	TEXT	understand.paragraphs.2.text	De nombreux programmes sont mis en place pour tenter de protéger les espèces menacées. Ils visent à organiser des suivis des populations, mettre en œuvre des actions favorables à la restauration de ces populations ou de leur habitat, informer le public et les élus et faciliter l'intégration de la protection de ces espèces dans les politiques publiques.   \n\nParmi ces outils, on trouve notamment les [Plans nationaux d’actions](https://www.ecologie.gouv.fr/plans-nationaux-dactions-en-faveur-des-especes-menacees) qui concernent de nombreuses espèces d’outre-mer telles que l’Albatros d’Amsterdam (TAAF), le Gecko vert de Manapany et le Bois de Papaye (La Réunion), l’Iguane des Petites Antilles (Antilles françaises), les tortues marines (Antilles françaises, Guyane et océan Indien) ou encore le Crabier Blanc (Mayotte). \nLa Commission européenne soutient également des programmes de conservation des espèces et des habitats via son programme de financements LIFE, par exemple le [LIFE+ Pétrels](https://www.petrels.re/) (La Réunion), le [LIFE+ BIODIV'OM](https://www.lifebiodivom.fr/) (5 espèces et un habitat, 5 territoires concernés : Mayotte, Guyane, Saint-Martin, Martinique, La Réunion) ou encore le [LIFE+ Forêt Sèche](https://www.foretseche.re/) (La Réunion).  \n\nIl existe encore bien d'autres initiatives comme un Plan d’action pour la sauvegarde du Cagou (Nouvelle-Calédonie), le [Plan de conservation en faveur des puffins de l'île de La Réunion](http://www.reunion.developpement-durable.gouv.fr/IMG/pdf/pdc_puffins_ld_interactif.pdf) ou différents programmes de conservation des [oiseaux menacés de Polynésie française](https://www.manu.pf/nos-actions/).	\N	\N	\N	f
40330	1010	TEXT	presentation.description	des espèces d’outre-mer sont considérées comme éteintes ou menacées	\N	\N	\N	f
40331	1010	TEXT	presentation.logoUrl	https://naturefrance.fr/indicateurs/proportion-despeces-eteintes-ou-menacees-dans-la-liste-rouge-nationale	\N	\N	\N	f
40332	1008	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
40333	1008	TEXT	understand.text2	On trouve un nombre plus important d’espèces endémiques dans les îles par rapport aux continents en raison de leur isolement géographique : les espèces y ont évolué séparément par rapport à celles sur le continent. Ainsi, plus une île est ancienne, plus il est probable que son taux d’endémisme soit élevé, comme par exemple en Nouvelle-Calédonie où 30 % des espèces du territoire sont uniques au monde.\nL’endémisme est également beaucoup plus important chez les espèces terrestres que chez les espèces marines, le milieu marin étant plus ouvert et permettant une connexion plus importante des habitats.	\N	\N	\N	f
40334	1008	TEXT	understand.text1	Qualifier une espèce d’endémique, cela veut dire que sa répartition est limitée à une zone géographique peu étendue et qu’elle ne se retrouve nulle part ailleurs dans le monde. Cela donne au territoire en question une responsabilité particulièrement forte dans la conservation du patrimoine mondial. On parle également d'espèces "sub-endémiques" lorsque leur répartition s'étend sur quelques territoires proches mais reste très limitée. \nEn raison de cette aire de répartition géographique restreinte, ces espèces sont généralements plus sensibles aux pressions liées aux activités humaines et se retrouvent plus souvent en danger de disparition que les espèces plus largement répandues. \n\nReflet de l'état actuel des connaissances, ce chiffre peut augmenter en raison de l'amélioration des connaissances scientifiques et de la [découverte de nouvelles espèces](/indicateurs/nouvelles-especes), mais il peut également diminuer lorsque des espèces s'éteignent.  	\N	\N	\N	f
40335	1008	TEXT	territories.title	Nombre d'espèces endémiques	\N	\N	\N	f
40566	1015	TEXT	identity.presentation	Au cœur de l’arc des Petites Antilles, la Martinique, baptisée *Ioünacaera* « l’île aux iguanes » par ses premiers occupants amérindiens, présente une grande diversité de paysages. Au nord, des forêts humides bien conservées entourent le volcan de la Montagne Pelée. Le sud, plus sec et d’une altitude plus faible, est plus peuplé et urbanisé. L'île est entourée de 48 îlets, répartis principalement sur la côte atlantique, sur lesquels on retrouve une végétation adaptée aux milieux très sec et qui accueillent de nombreux oiseaux nicheurs. 	\N	\N	\N	f
40567	1015	TEXT	identity.population	372 594	\N	\N	\N	f
40568	1015	TEXT	species.3.name	La Tortue verte	\N	\N	\N	f
40569	1015	IMAGE	species.8.image	\N	1298	*Dacryodes excelsa* © Cesar Delnatte	\N	f
40336	1008	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
40337	1008	TEXT	understand.title1	La notion d'endémisme	\N	\N	\N	f
40338	1008	TEXT	understand.title2	Un taux d’endémisme plus élevé dans les îles ? 	\N	\N	\N	f
40339	1008	TEXT	presentation.descriptionTerritories	espèces sont endémiques du territoire	\N	\N	\N	f
40340	1008	TEXT	understand.paragraphs.0.title	Quelques exemples	\N	\N	\N	f
40341	1008	TEXT	understand.keyword	endémique	\N	\N	\N	f
40342	1008	TEXT	ecogestures.title	Comment préserver les espèces endémiques ? 	\N	\N	\N	f
40343	1008	IMAGE	presentation.image	\N	1380	Kaori de forêt, Nouvelle-Calédonie © Mickaël T / CC	\N	f
40344	1008	TEXT	understand.paragraphs.0.text	Le Tiaré Apetahi ([*Sclerotheca raiateensis*](https://inpn.mnhn.fr/espece/cd_nom/908708)) en Polynésie Française, le Colibri à tête bleue ([*Cyanophaia bicolor*](https://inpn.mnhn.fr/espece/cd_nom/441841)) en Martinique, le Gecko vert de Manapany ([*Phelsuma inexpectata*](https://inpn.mnhn.fr/espece/cd_nom/528679)) à La Réunion, le Cagou ([*Rhynochetos jubatus*](https://inpn.mnhn.fr/espece/cd_nom/442324)) en Nouvelle-Calédonie, ou encore le Choux de Kerguelen ([*Pringlea antiscorbutica*](https://inpn.mnhn.fr/espece/cd_nom/721546)) dans les îles subantarctiques, chaque territoire d'outre-mer possède de nombreuses espèces uniques. Largement couverte par la très riche forêt amazonienne, la Guyane compte près de 9 % d'espèces endémiques (ou sub-endémiques de la région du plateau des Guyanes). Seul Saint-Pierre-et-Miquelon ne compte aucune espèce connue spécifique au territoire, l'archipel étant très proche de Terre Neuve.\n\nOn trouve malheureusement un grand nombre d'espèces endémiques éteintes, comme le Solitaire de La Réunion ([*Threskiornis solitarius*](https://inpn.mnhn.fr/espece/cd_nom/432588)) (souvent confondu à tord avec le Dodo de l'île Maurice) ou l'Amazone de la Martinique ([*Amazona martinicana*](https://inpn.mnhn.fr/espece/cd_nom/655175)), tous deux disparus depuis la fin du 18e siècle. De nombreuses espèces se sont sans doute éteintes avant même d'avoir été découvertes.	\N	\N	\N	f
40345	1008	IMAGE	understand.image	\N	1312	Colibri à tête bleue, Martinique © Fabien Lefebvre	\N	f
40346	1008	TEXT	presentation.description	espèces d’outre-mer sont endémiques	\N	\N	\N	f
40347	1008	TEXT	presentation.logoUrl	https://naturefrance.fr/indicateurs/nombre-despeces-endemiques-de-france	\N	\N	\N	f
40348	1009	SELECT	presentation.sourceSelect	inpn	\N	\N	\N	f
40349	1009	TEXT	understand.text2	Ce nombre comprend uniquement les espèces dites indigènes des territoires d'outre-mer, c’est-à-dire naturellement présentes sur les territoires. Il ne comprend pas les espèces introduites, volontairement ou involontairement, par les humains (animaux domestiques, plantes cultivées, etc.).\nCe nombre ne prend pas non plus en compte les espèces éteintes.	\N	\N	\N	f
40350	1009	TEXT	understand.text1	Dispersés au sein de trois océans, les territoires d’outre-mer français sont répartis de la zone équatoriale à la zone polaire. Cette diversité de situations géographiques est à l’origine de la très grande diversité biologique trouvées au sein de ces collectivités. De plus, le caractère insulaire de la plupart des territoires (la Guyane excepté) explique le très haut taux d'[endémisme](/indicateurs/especes-endemiques) de la faune et de la flore. \n\nAinsi, la plupart des territoires ultramarins français sont situés dans des zones du globe mondialement reconnues comme étant particulièrement riches en espèces, appelées "points chauds" (*hotspots*). Le milieu marin d'outre-mer couvre également une superficie gigantesque : il représente plus de 3 % des mers et océans du monde, et compte 55 000 km<sup>2</sup> de récifs coralliens et lagons. \n\n\n	\N	\N	\N	f
40351	1009	TEXT	territories.title	Nombre d'espèces indigènes	\N	\N	\N	f
40352	1009	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
40353	1009	TEXT	understand.title1	Un patrimoine biologique exceptionnel en outre-mer	\N	\N	\N	f
40354	1009	TEXT	understand.paragraphs.1.text	Sur les quelques centaines d’espèces de mammifères indigènes recensés, la plupart des espèces terrestres se trouvent en Guyane. On y rencontre par exemple le jaguar, le paresseux à deux doigts et plusieurs espèces de primates. Très peu de mammifères terrestres sont naturellement présents sur les îles et il s’agit quasiment uniquement de chauves-souris. Les autres mammifères recensés sont des espèces marines comme les baleines, les dauphins et les phoques.\n\nDe nombreuses espèces de mammifères ont été introduites par l’homme sur les îles et sont devenues [envahissantes](/indicateurs/especes-exotiques-envahissantes) : chats, rats, souris, lapins, cerfs, chiens, chèvres… Ces introductions sont à l'origine de grandes perturbations pour les écosystème fragiles de ces territoires, et de l'extinction de nombreuses espèces. 	\N	\N	\N	f
40570	1015	TEXT	species.0.name	Le Matoutou Falaise	\N	\N	\N	f
37313	1001	IMAGE	species.9.image	\N	1459	*Melanerpes herminieri* © C. et P. Guezennec / INPN	\N	f
37314	1001	TEXT	events.2.description	Disparition du Lamantin des Caraïbes ([*Trichechus manatus*](https://inpn.mnhn.fr/espece/cd_nom/821122)) des eaux de Guadeloupe	\N	\N	\N	f
40571	1015	TEXT	events.4.date	1995	\N	\N	\N	f
40572	1015	IMAGE	interests.locations.2.image	\N	1349	L’étang des Salines, Martinique © PNR de la Martinique / Autrevue	\N	f
40573	1015	IMAGE	ecosystems.ecosystems.2.image	\N	1278	Mangrove, Martinique © Fabien Lefebvre	\N	f
40574	1015	TEXT	events.10.description	Publication de la Liste rouge de la Faune de Martinique	\N	\N	\N	f
37510	1024	IMAGE	presentation.file	\N	1471	affiche écogeste introduction eee	\N	f
40355	1009	TEXT	understand.title2	Vous avez dit « espèce indigène » ? 	\N	\N	\N	f
40575	1015	TEXT	interests.locations.0.description	Créé en 1976, le [Parc naturel régional](http://pnr-martinique.com/) s’étend sur 32 communes et couvre les 2/3 de l’île. Son objectif est de conjuguer le développement de l’île avec la préservation de ses richesses naturelles et culturelles. 	\N	\N	\N	f
40576	1015	TEXT	risks.risks.1.description	Face aux enjeux  de la préservation et la valorisation de la biodiversité martiniquaise, 43 structures institutionnelles et associatives se sont réunies autour du Parc naturel régional de la Martinique pour la création d’un Observatoire Martiniquais de la biodiversité (OMB) afin de mutualiser les connaissances, sensibiliser le public et faciliter l’intégration de la biodiversité dans les politiques publiques.  \n\nLancé en 2015, l’OMB est ainsi un dispositif multi-partenarial au service des acteurs locaux et du grand public. Une plateforme internet [www.biodiversite-martinique.fr](http://www.biodiversite-martinique.fr/) a été créée pour remplir les missions de centralisation et de diffusion des connaissances. Il présente : un centre de ressources, des actualités, ainsi que la faune, la flore et les habitats naturels de l’île. Actuellement, un système d’informations est en cours de création et constituera le système d'information de l'inventaire du patrimoine naturel (SINP) régional. Les données relatives à la biodiversité terrestre, aquatique et marine y seront centralisées. 	\N	\N	\N	f
40577	1015	TEXT	interests.locations.2.description	D’une superficie de 207 ha, ce site géré par le Conservatoire du littoral abrite une importante faune et flore patrimoniale. 	\N	\N	\N	f
40578	1015	TEXT	interests.locations.1.description	A l'est de la Martinique, la presqu’île de la Caravelle présente une grande variété d’écosystèmes : savanes, falaises, forêt, mangroves. Le site est géré par le Parc naturel régional notamment pour y préserver le Moqueur gorge-blanche, oiseau endémique menacé.    	\N	\N	\N	f
40579	1015	TEXT	ecosystems.ecosystems.3.name	Les herbiers sous-marins	\N	\N	\N	f
40580	1015	TEXT	identity.subtitle	Des paysages contrastés	\N	\N	\N	f
40581	1015	IMAGE	species.7.image	\N	1276	*Ramphocinclus brachyurus* © Fabien Lefebvre	\N	f
40582	1015	TEXT	species.5.name	L'Herbe à Tortue 	\N	\N	\N	f
40583	1015	TEXT	risks.risks.0.description	L’expansion démographique et l’urbanisation, surtout au centre et au sud de l’île, impactent les milieux naturels de la Martinique : défrichements, rejets domestiques, industriels et agricoles,…\n\nLes mangroves de l'île sont des milieux particulièrement sensibles et soumis à de fortes pressions anthropiques : aménagements, décharge, pollution, activité agricole. Un projet de réserve naturelle régionale est à l’œuvre concernant les mangroves de la baie de Génipa.\nLes coupes illégales de bois et le trafic d’espèces indigènes, du Lambi ou du Matoutou falaise par exemple, sont des problématiques importantes, et la règlementation existante est difficile à faire appliquer.\n\nDe nombreuses espèces indigènes sont menacées par les espèces exotiques introduites : rat, mangouste, Iguane commun, etc. En milieu marin, le Poisson-lion, espèce originaire de la région indo-pacifique qui a colonisé toute la Caraïbe, est un consommateur vorace de poissons qui ne connait pas de prédateurs et a une stratégie de reproduction très efficace. Il est considéré comme une menace majeure pour la biodiversité marine.  \n\nLes échouages de sargasses sont un phénomène naturel dont l’ampleur a considérablement augmenté ces dernières années. Les radeaux denses et les dépôts épais qu’elles forment sur les plages piègent de nombreuses espèces dont des tortues, et ont également un impact sanitaire et économique important.\n\nLa chlordécone, pesticide utilisé dans les bananeraies entre les années 1970 et 1990 a massivement pollué les milieux naturels de l’île. Si ces impacts sur la santé humaine commencent à être reconnus, ses conséquences sur les espèces et les écosystèmes sont également étudiées. Des études ont notamment montré une importante contamination des organismes aquatiques ce qui a conduit à l'interdiction de la pêche dans tous les cours d'eau et sur une partie des zones côtières de l'île.  	\N	\N	\N	f
40584	1015	TEXT	ecosystems.ecosystems.2.description	A l’interface entre le milieu marin et le milieu terrestre, les mangrove ont des rôles fonctionnels très importants : protection contre l’érosion, piège à sédiment, puit de carbone… Elles couvrent actuellement plus de 2 000 ha en Martinique, mais occupaient autrefois des surfaces beaucoup plus importantes avant d’être déboisées.  \n  \nEn 2020, l'eau a temporairement pris une coloration rose peu commune dans certaines zones de mangroves ! La forte évaporation due à la sécheresse a provoqué une augmentation de la salinité, entrainant un "bloom" (forte multiplication) d'une microalgue qui a donné à l'eau cette couleur surprenante. 	\N	\N	\N	f
40585	1015	TEXT	ecosystems.ecosystems.1.description	Les forêts se trouvent principalement dans le nord, sur les massifs montagneux et difficilement accessibles des pitons du Carbet de la Montagne Pelée. On distingue plusieurs types de forêt présentant différents cortèges floristiques en fonction de l’altitude. On y trouve une importante diversité, notamment en espèces endémiques. 	\N	\N	\N	f
40586	1015	TEXT	ecosystems.ecosystems.0.description	Couvrant 50 km de l’île, surtout dans le sud, les plages sont des lieux de ponte pour 3 espèces de tortues marines et sont également bordées par un cortège floristique intéressant : patates bord de mer, pois bord de mer, raisinier bord de mer… Cette végétation est toutefois fortement dégradée par les installations touristiques et l’importante fréquentation de certaines plages. 	\N	\N	\N	f
40587	1015	TEXT	identity.highestPoint	1 397	\N	\N	\N	f
40588	1015	TEXT	interests.locations.4.description	Ces quatre îlets, gérés par le Parc naturel régional et l’Office national des forêts, sont l'un des plus importants sites de nidification des oiseaux marins des Petites Antilles. On y trouve entre autre puffins, sternes, moines…. L’accès en est strictement interdit.	\N	\N	\N	f
40589	1015	TEXT	risks.risks.0.name	Des préoccupations communes aux territoires antillais	\N	\N	\N	f
40590	1015	IMAGE	interests.locations.1.image	\N	1348	Presqu’île de la Caravelle © PNR de la Martinique / AERODREAM	\N	f
40591	1015	IMAGE	ecosystems.ecosystems.1.image	\N	1268	Forêt humide de Martinique © Fabien Lefebvre	\N	f
37315	1001	TEXT	events.3.description	Introduction du Raton-Laveur ([*Procyon lotor*](https://inpn.mnhn.fr/espece/cd_nom/60822)) en Guadeloupe depuis le continent américain	\N	\N	\N	f
37316	1001	IMAGE	identity.image	\N	1225	Pointe des Colibris © Olivier Delzon	\N	f
37317	1001	TEXT	events.7.description	Création du [Sanctuaire AGOA](https://sanctuaire-agoa.fr/) pour les mammifères marins qui couvre toutes les Antilles françaises	\N	\N	\N	f
37318	1001	TEXT	events.7.date	2010	\N	\N	\N	f
26460	1004	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
40592	1015	TEXT	interests.locations.3.description	Ces deux zones de forêt humide au nord de l'île sont classées en Réserve biologique intégrale, gérées par l'Office national des forêts. La forêt y est laissée en évolution naturelle, l'exploitation et les interventions y sont interdites, à l'exception des aménagements pour la sécurité du public. La Montagne Pelée, toujours en activité, est étroitement surveillée.	\N	\N	\N	f
40593	1015	TEXT	identity.title	La Martinique,  \n« l’île aux iguanes » 	\N	\N	\N	f
40594	1015	IMAGE	species.6.image	\N	1297	*Bothrops lanceolatus* © Maël Dewynter	\N	f
40595	1015	TEXT	interests.locations.1.name	La Réserve naturelle nationale de la presqu’île de la Caravelle	\N	\N	\N	f
40596	1015	TEXT	statistics.2.text	de l'île couverts par le Parc naturel régional 	\N	\N	\N	f
40597	1015	IMAGE	species.0.image	\N	1061	*Caribena versicolor* © A. Lacoeulhe/INPN	\N	f
40598	1015	TEXT	events.1.date	1635	\N	\N	\N	f
40599	1015	TEXT	interests.locations.4.name	La réserve naturelle nationale des îlets de Sainte Anne	\N	\N	\N	f
50180	1039	TEXT	identity.presentation	Située dans l’archipel des Comores, au nord-ouest de Madagascar, Mayotte est un trésor de biodiversité. Une barrière récifale de 140 km de long entoure les deux îles principales ainsi que 18 îlots, et délimite un vaste lagon, l’un des plus grands et des plus profonds du monde. Ces eaux abritent une incroyable diversité d’organismes marins : poissons, mollusques, coraux, mammifères marins...  \nLe milieu terrestre n’est pas en reste : Mayotte apparaît comme l’une des îles océaniques tropicales les plus riches du monde en termes de flore indigène, au regard de sa superficie. On y trouve de nombreuses espèces endémiques, ou sub-endémiques à l’archipel des Comores. Les milieux naturels mahorais sont cependant fortement dégradés par les activités humaines, en raison notamment d’une très forte densité de population.	\N	\N	\N	f
50181	1039	TEXT	identity.population	279 500	\N	\N	\N	f
50182	1039	TEXT	species.3.name	Le Maki de Mayotte	\N	\N	\N	f
50183	1039	TEXT	risks.risks.2.name	Une flore terrestre à préserver	\N	\N	\N	f
50184	1039	IMAGE	species.8.image	\N	1656	*Bruguiera gymnorhiza* © Vincent Boullet	\N	f
50185	1039	TEXT	species.0.name	Le Crabier blanc 	\N	\N	\N	f
50186	1039	TEXT	events.4.date	1976	\N	\N	\N	f
50187	1039	IMAGE	interests.locations.2.image	\N	1662	Mont Choungui vu du nord © Frédéric Ducarme	\N	f
50188	1039	IMAGE	ecosystems.ecosystems.2.image	\N	1653	Mangrove de Kawéni © Fanny Cautain / Office français de la biodiversité	\N	f
26461	1004	TEXT	understand.text2	Ces espèces exotiques envahissantes perturbent les équilibres environnementaux en entrant en compétition avec les espèces locales (pour la nourriture, les sites de reproduction ou de repos, la lumière, etc.), par prédation, introduction de pathogènes, hybridation ou encore en modifiant les paramètres physico-chimiques des habitats.  Elles ont ainsi de lourds impacts sur les milieux et les espèces indigènes, en particulier dans les îles où elles sont à l'origine de nombreuses extinctions.\n\nOn trouve des espèces exotiques envahissantes dans tous les groupes taxonomiques : champignons, algues, plantes vasculaires, invertébrés, reptiles, oiseaux, poissons, mammifères, etc. et dans tous les milieux : terrestres, marins ou d'eaux douces.	\N	\N	\N	f
26462	1004	TEXT	understand.text1	Une espèce exotique envahissante est une espèce introduite par l’Homme hors de son territoire d’origine et qui présente ensuite, sur son territoire d’introduction, une dispersion et un développement importants, engendrant des impacts environnementaux mais aussi sociaux et économiques. Ces introductions sont parfois volontaires (pour l’agriculture, l’ornementation, comme animaux de compagnie, etc.) ou involontaires (organismes présents dans les marchandises échangées internationalement, dans les eaux de ballast des bateaux, etc.).\n\nDe nombreuses espèces n’arrivent pas à s’adapter ou se reproduire dans leurs territoires d’introduction, cependant certaines trouvent au contraire des conditions favorables à leur développement et prolifèrent, profitant notamment de l’absence de leurs prédateurs ou parasites naturels. 	\N	\N	\N	f
26463	1004	TEXT	territories.title	Nombre d'espèces présentes sur la liste des 100 espèces exotiques les plus envahissantes au monde 	\N	\N	\N	f
26464	1004	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
26465	1004	TEXT	understand.title1	Des espèces introduites par l'Homme	\N	\N	\N	f
26466	1004	TEXT	understand.paragraphs.1.text	Des processus de biosécurité (désinfection, inspections minutieuses, utilisation de chiens formés à la détection, etc.) sont mis en œuvre par les territoires afin de limiter les risques d’entrée de nouvelles espèces exotiques. Pour les espèces déjà installées, de nombreuses interventions sont réalisées pour tenter de limiter leur propagation et atténuer leurs impacts, voire dans certains cas de les éradiquer pour préserver l'équilibre des écosystèmes et sauvegarder des espèces endémiques menacées. \n  \nLe Comité français de l'Union internationale pour la conservation de la nature anime depuis 2005 le [Réseau Espèces exotiques envahissantes en outre-mer](https://especes-envahissantes-outremer.fr/) afin de favoriser les échanges et le partage d'expériences entre les gestionnaires des différents territoires.	\N	\N	\N	f
26467	1004	TEXT	understand.title2	Une des principales causes d'érosion de la biodiversité dans les îles	\N	\N	\N	f
1799	1002	TEXT	description	Les Antilles sont un « point chaud » de la biodiversité mondiale. Si chacun des quatre territoires français du bassin a son identité et ses spécificités, les acteurs locaux collaborent autour de problématiques partagées. 	\N	\N	\N	f
26468	1004	TEXT	presentation.descriptionTerritories	espèces sur les 100 considérées comme les plus envahissantes au monde sont présentes sur le territoire	\N	\N	\N	f
26469	1004	TEXT	understand.paragraphs.0.title	Une liste mondiale des espèces les plus problématiques	\N	\N	\N	f
26470	1004	TEXT	understand.keyword	Espèces	\N	\N	\N	f
50189	1039	TEXT	events.10.description	Création de la Réserve naturelle nationale des forêts de Mayotte	\N	\N	\N	f
37319	1001	TEXT	interests.locations.0.name	Le Parc national de la Guadeloupe	\N	\N	\N	f
37320	1001	TEXT	events.0.description	Premières traces d'occupation humaine en Guadeloupe	\N	\N	\N	f
37321	1001	TEXT	events.1.description	La Guadeloupe devient française	\N	\N	\N	f
37322	1001	TEXT	events.8.description	Publication de la Liste rouge des oiseaux de Guadeloupe	\N	\N	\N	f
37323	1001	TEXT	events.9.description	Publication de la Liste rouge de la flore vasculaire de Guadeloupe	\N	\N	\N	f
37324	1001	IMAGE	ecosystems.image	\N	1462	Vue de la Soufrière © Hélène Valenzuela	\N	f
37325	1001	TEXT	identity.species	10 279	\N	\N	\N	f
37326	1001	IMAGE	ecosystems.ecosystems.0.image	\N	1010	La forêt d’altitude sur La Soufrière © Maël Gramain/Unsplash	\N	f
37327	1001	TEXT	species.8.name	La Tortue imbriquée	\N	\N	\N	f
37328	1001	TEXT	events.6.description	La Guadeloupe obtient le label «&nbsp;Réserve de Biosphère&nbsp;» de l’UNESCO	\N	\N	\N	f
37329	1001	TEXT	events.6.date	1993	\N	\N	\N	f
37330	1001	TEXT	events.4.description	Dernière éruption de la Soufrière	\N	\N	\N	f
37331	1001	TEXT	events.5.description	Création du Parc national de Guadeloupe	\N	\N	\N	f
32558	1019	TEXT	header.subtitle	Enrichir ses propres connaissances et développer son sens de l’observation tout en participant à la progression et l'amélioration des connaissances scientifiques pour préserver la biodiversité, c’est le pari des sciences participatives.  \n\nFaune, flore, milieu marin ou terrestre, observation ponctuelle ou programme protocolé, trouvez le programme qui vous correspond et contribuez au développement des connaissances !	\N	\N	\N	f
32559	1019	LINK	examples.projects.1.more	En savoir plus	\N	\N	http://www.gepog.org/Nos-actions/Milieux-terrestres/Suivi-Temporel-des-Oiseaux-Communs-STOC-EPS	f
32560	1019	TEXT	examples.projects.2.title	TsiÔno, le réseau des observateurs du milieu marin mahorais	\N	\N	\N	f
32561	1019	TEXT	header.title	C'est quoi les sciences participatives ?	\N	\N	\N	f
32562	1019	IMAGE	examples.projects.2.image	\N	1344	Plongeur à Mayotte © Alexandra Gigou / OFB	\N	f
32563	1019	CHECKBOX	header.shadowed	true	\N	\N	\N	f
37332	1001	TEXT	interests.locations.2.name	La Réserve naturelle nationale des îles de Petite Terre	\N	\N	\N	f
37333	1001	TEXT	ecosystems.ecosystems.3.description	En Guadeloupe, les mangroves se trouvent principalement en bordure du Grand et du Petit Cul-de-Sac marin et à Marie-Galante. On distingue 3 types de mangroves : la mangrove de bord de mer à la salinité constante est le territoire du Palétuvier rouge ([*Rhizophora mangle*](https://inpn.mnhn.fr/espece/cd_nom/447470)) ; la mangrove arbustive à une dizaine de mètres du rivage, où la salinité est extrême, où les Palétuviers noirs ([*Avicennia germinans*](https://inpn.mnhn.fr/espece/cd_nom/629127) et [*A. schaueriana*](https://inpn.mnhn.fr/espece/cd_nom/629128)) abondent ; la mangrove haute, au-delà, où l’on trouve Palétuviers blancs et gris ([*Laguncularia racemosa*](https://inpn.mnhn.fr/espece/cd_nom/630001) et [*Conocarpus erectus*](https://inpn.mnhn.fr/espece/cd_nom/629401)). On y trouve de nombreuses espèces de crabes et d’oiseaux. 	\N	\N	\N	f
37334	1001	TEXT	events.10.date	2020 - 2029	\N	\N	\N	f
32564	1019	TEXT	paragraphs.1.title	Différents objectifs	\N	\N	\N	f
32565	1019	TEXT	presentation.description	Le terme « sciences participatives » regroupe des programmes acquisition d’informations et de données scientifiques en impliquant une participation active des citoyens. Les observations sont réalisées de manière bénévole, le plus souvent par des non-professionnels. Dans certains cas, une formation au préalable est nécessaire, mais de nombreux programmes sont accessibles sans connaissances naturalistes poussées. 	\N	\N	\N	f
32566	1019	TEXT	examples.projects.3.actor	Association Pala Dalik	\N	\N	\N	f
32567	1019	TEXT	paragraphs.2.text	L’équipe du Compteur mène actuellement une étude pour **recenser tous les programmes de sciences participatives dans les territoires ultramarins**. Ces résultats seront disponibles prochainement afin de vous proposer un panorama complet des programmes auxquels vous pouvez participer. 	\N	\N	\N	f
32568	1019	TEXT	examples.projects.4.title	Ti bèt a limiè, l’Observatoire des lucioles en Guadeloupe	\N	\N	\N	f
32569	1019	TEXT	examples.projects.0.actor	Kelonia	\N	\N	\N	f
37335	1001	IMAGE	species.1.image	\N	1288	*Macrobrachium carcinus* © Benjamin Guichard / OFB	\N	f
37336	1001	TEXT	events.5.date	1989	\N	\N	\N	f
37337	1001	TEXT	identity.marineArea	90 000	\N	\N	\N	f
37338	1001	TEXT	species.9.name	Le Pic de Guadeloupe	\N	\N	\N	f
26471	1004	TEXT	ecogestures.title	Que puis-je faire pour éviter l’introduction et la dispersion d’espèces exotiques envahissantes ? 	\N	\N	\N	f
26472	1004	IMAGE	presentation.image	\N	1293	Poisson-lion (*Pterois volitans*) © Fabien Lefebvre	\N	f
26473	1004	TEXT	understand.paragraphs.1.title	De la prévention aux actions de gestion	\N	\N	\N	f
26474	1004	TEXT	understand.paragraphs.0.text	En 2007, l’Union internationale pour la conservation de la nature a publié [une liste de 100 espèces exotiques parmi les plus envahissantes du monde](https://portals.iucn.org/library/sites/library/files/documents/2000-126-Fr.pdf), c’est-à-dire celles avec le plus fort potentiel de dispersion et le plus lourd impact sur leur environnement d’accueil. On y trouve notamment le rat noir ([*Rattus rattus*](https://inpn.mnhn.fr/espece/cd_nom/61587)), introduit dans de nombreuses îles et responsable, entre autres, du déclin des populations de nombreuses espèces d’oiseau dans les outre-mer, ou encore le Miconia ([*Miconia calvescens*](https://inpn.mnhn.fr/espece/cd_nom/447324)), un arbre introduit à Tahiti en 1937 et aujourd’hui très répandu sur l’île où il remplace la végétation indigène. Ce dernier a également été introduit en Nouvelle-Calédonie et découvert récemment en Martinique et en Guadeloupe.  \n\nLes fourmis introduites sont également un important sujet de préoccupations. Plusieurs espèces fortement envahissantes se retrouvent dans les territoires d’outre-mer, telles que la Fourmi folle ([*Anoplolepsis gracilipes*](https://inpn.mnhn.fr/espece/cd_nom/264513)), la Fourmi à grosse-tête ([*Pheidole megacephala*](https://inpn.mnhn.fr/espece/cd_nom/219383)), la Fourmi électrique ([*Wasmannia auropuctata*](https://inpn.mnhn.fr/espece/cd_nom/532927)) ou encore la Fourmi de feu ([*Solenopsis invicta*](https://inpn.mnhn.fr/espece/cd_nom/532922)). Elles perturbent de nombreuses autres espèces (arthropodes, reptiles, oiseaux, mammifères), par leurs comportements agressifs et leurs modifications des habitats.	\N	\N	\N	f
26475	1004	IMAGE	understand.image	\N	1027	Miconia calvescens © Forest & Kim Starr / CC BY 3.0 	\N	f
26476	1004	TEXT	presentation.description	espèces sur les 100 considérées comme les plus envahissantes au monde se trouvent en outre-mer	\N	\N	\N	f
26477	1004	TEXT	presentation.logoUrl	http://indicateurs-biodiversite.naturefrance.fr/fr/indicateurs/nombre-despeces-en-outremer-parmi-les-plus-envahissantes-au-monde	\N	\N	\N	f
50190	1039	TEXT	interests.locations.0.description	Situé dans le lagon à l’est de Grande Terre, l’îlot Mbouzi est classé en Réserve naturelle nationale depuis 2007 afin de préserver sa relique de forêt sèche primaire, qui abrite des plantes remarquables et protégées dont le rare Ebène des Comores ([*Diospyros comorensis*](https://inpn.mnhn.fr/espece/cd_nom/807311)). On y trouve également la sous-espèce du Foudi des Comores endémique de Mayotte ([*Foudia eminentissima algondae*](https://inpn.mnhn.fr/espece/cd_nom/418756)). La réserve comprend une partie marine de 60 hectares qui abrite des communautés coralliennes remarquables. Elle est gérée par l’association les [Naturalistes de Mayotte](https://www.naturalistesmayotte.fr/).	\N	\N	\N	f
50191	1039	TEXT	risks.risks.2.description	Les inventaires naturalistes de la flore de Mayotte sont récents, le territoire n’ayant fait l’objet que de quelques prospections ponctuelles jusqu’au début des années 1990. Les travaux se sont intensifiés par la suite, avec notamment l’étendue de l’agrément du Conservatoire botanique national de Mascarin à Mayotte en 2007. \n\nLa flore indigène mahoraise présente des affinités avec la flore malgache, les vents, les courants marins et les oiseaux ayant permis un lien avec Madagascar, situé à environ 350 km de Mayotte, cependant près d’une cinquantaine d’espèces végétales sont endémiques strictes de Mayotte.  \n\nSelon la Liste rouge de la flore vasculaire publiée en 2014, 43 % des espèces végétales de Mayotte sont considérées menacées. Afin de préserver les reliques de forêts primaires et restaurer les forêts secondaires limitrophes, la Réserve naturelle nationale des forêts de Mayotte a été créée en 2021. Divisée en 6 zones distinctes, elle s’étend sur 2 800 hectares, soit 8 % de la superficie de l’île. Les activités humaines y sont règlementées.\n	\N	\N	\N	f
50192	1039	TEXT	risks.risks.1.description	Depuis 1998, l’Observatoire des Récifs Coralliens de Mayotte (ORC) étudie l’évolution de l’état de santé des récifs. Les [menaces qui pèsent sur les récifs coralliens sont nombreuses](https://biodiversite-outre-mer.fr/indicateurs/recifs-coralliens) et les suivis réalisés dans les eaux mahoraises montrent une dégradation sur près de la moitié (43 %) des stations étudiées entre 2015 et 2020.  \n\nLes récifs coralliens sont particulièrement sensibles aux modifications entrainées par le changement climatique (réchauffement et acidification des océans) qui entrainent des épisodes de blanchissement de plus en plus intenses et fréquents. Le dernier épisode de blanchissement à Mayotte, en 2016, a induit une mortalité d’environ 25 % des coraux.  \n\nLes coraux sont également dégradés par les rejets des eaux usées non traitées dans les rivières et le lagon, les apports terrigènes liés à l’érosion et les déchets, notamment les plastiques. Dans une moindre mesure, certaines pratiques de pêche (marche sur le platier à marée basse lors de la pêche à pied), les ancrages des bateaux ou les palmes des plongeurs ont des impacts localisés. Les coraux du genre *Porites* sont également prélevés pour la fabrication du *msindzano*, le masque de beauté traditionnel.\n	\N	\N	\N	f
50193	1039	TEXT	interests.locations.2.description	Au sud de Grande Terre, le Mont Choungui, second plus haut sommet de Mayotte, culmine à 593 m. Il présente une végétation très différente de celle trouvée sur les autres massifs montagneux de Mayotte, le mont Bénara ou le M’Sapéré, une originalité liée aux conditions particulières de relief, de vent et de pluviométrie sur ce mont isolé. Certaines espèces végétales indigènes ne se trouvent à Mayotte que sur ce site et plusieurs espèces endémiques y ont été découvertes. 	\N	\N	\N	f
50194	1039	TEXT	interests.locations.1.description	Créé en janvier 2010, le [Parc naturel marin de Mayotte](https://www.parc-marin-mayotte.fr/) englobe le lagon et l’ensemble de la zone économique exclusive (ZEE), soit près de 70 000 kms<sup>2</sup>. Il est géré par l’Office français de la biodiversité. L'objectif du Parc est de concilier la préservation de la biodiversité marine et le développement durable des activités maritimes à Mayotte. Parmi leurs activités, les agents du parc veillent à faire respecter les règlementations de pêche, sensibiliser la population et les élus et réaliser des études et des suivis pour mieux connaitre le milieu marin. 	\N	\N	\N	f
50195	1039	TEXT	ecosystems.ecosystems.3.name	Les récifs et le lagon	\N	\N	\N	f
50196	1039	TEXT	identity.subtitle	De nombreuses espèces terrestres endémiques	\N	\N	\N	f
37339	1001	TEXT	events.8.date	2012	\N	\N	\N	f
32570	1019	TEXT	application.title	Agir pour la science depuis son smartphone, c’est possible !	\N	\N	\N	f
32571	1019	TEXT	paragraphs.0.title	Différents types de programmes 	\N	\N	\N	f
32572	1019	TEXT	examples.projects.4.actor	An ba loup-la	\N	\N	\N	f
32573	1019	TEXT	application.subtitle	J'agis en ligne	\N	\N	\N	f
32574	1019	TEXT	examples.projects.4.target	Tous publics	\N	\N	\N	f
32575	1019	TEXT	examples.projects.1.title	Le Suivi temporel des oiseaux communs (STOC) en Guyane	\N	\N	\N	f
32576	1019	LINK	examples.projects.0.more	En savoir plus	\N	\N	https://museesreunion.fr/kelonia/actualites-et-savoirs-de-kelonia/la-photo-identification-des-tortues-marines/?fbclid=IwAR0W8NGqRTa20a8	f
32577	1019	TEXT	examples.projects.2.target	Usagers de la mer, tous publics	\N	\N	\N	f
32578	1019	IMAGE	header.background	\N	1342	 Observateur en forêt, Guyane © Pierre-Olivier Jay	\N	f
37340	1001	IMAGE	interests.locations.0.image	\N	1457	Rivière Corossol, Parc national de Guadeloupe © Claire Roussel / OFB	\N	f
37341	1001	TEXT	species.6.name	Le Palétuvier rouge	\N	\N	\N	f
40629	1000	TEXT	presentation.title	Le Compteur de biodiversité outre-mer	\N	\N	\N	f
40630	1000	TEXT	testimony.title	Des études inédites sur la biodiversité des outre-mer	\N	\N	\N	f
40631	1000	IMAGE	carousel.carouselElements.2.image	\N	1004	Dendrobate amazonien, Guyane © Raphael Gailhac	\N	f
40632	1000	CHECKBOX	carousel.carouselElements.2.shadowed	true	\N	\N	\N	f
40633	1000	TEXT	presentation.science	Participez aux programmes pour faire progresser la connaissance	\N	\N	\N	f
40634	1000	TEXT	science.text	Enrichir ses propres connaissances et développer son sens de l’observation tout en participant à la progression et l'amélioration des connaissances scientifiques pour préserver la biodiversité, c’est le pari des sciences participatives.	\N	\N	\N	f
40635	1000	TEXT	carousel.carouselElements.0.title	Partez à la rencontre des espèces et des écosystèmes ultramarins	\N	\N	\N	f
40636	1000	IMAGE	carousel.carouselElements.0.image	\N	1258	Fonds marins, Martinique © Fabien Lefebvre	\N	f
40637	1000	TEXT	carousel.carouselElements.1.title	Compter la biodiversité, oui mais comment ? 	\N	\N	\N	f
40638	1000	LINK	carousel.carouselElements.0.button	Découvrir les territoires	\N	\N	/territoires	f
40639	1000	LINK	carousel.carouselElements.1.button	Découvrir les indicateurs	\N	\N	/indicateurs	f
40640	1000	TEXT	testimony.quote	Dans le cadre du projet de Compteur, le premier état des lieux des programmes de sciences participatives dans les outre-mer est en cours de réalisation. 	\N	\N	\N	f
40641	1000	TEXT	presentation.ecogestures	Des gestes simples à mettre en place au quotidien	\N	\N	\N	f
40642	1000	LINK	carousel.carouselElements.2.button	Découvrir les écogestes	\N	\N	/ecogestes	f
40643	1000	TEXT	presentation.text	Les territoires d’outre-mer présentent une biodiversité particulièrement riche et variée, mais fragilisée par les activités humaines.\nLa mission du Compteur est de donner une vision d’ensemble des enjeux liés à la biodiversité en outre-mer afin que chacun, résident ou voyageur de passage, puisse s’informer et s’impliquer à son échelle pour la préservation de cette biodiversité exceptionnelle.  	\N	\N	\N	f
40644	1000	TEXT	carousel.carouselElements.1.text	Parcourez les chiffres et les notions clés pour comprendre les composantes de la biodiversité.	\N	\N	\N	f
40645	1000	TEXT	presentation.indicators	Des chiffres clés pour comprendre la biodiversité	\N	\N	\N	f
37342	1001	IMAGE	interests.locations.3.image	\N	1467	La pointe Est de la Désirade © Grook Da Oger	\N	f
40646	1000	IMAGE	testimony.image	\N	1497	Saisie d'un anaconda par des agents de l’OFB, Guyane © Raphael Gailhac	\N	f
40647	1000	CHECKBOX	carousel.carouselElements.1.shadowed	true	\N	\N	\N	f
40648	1000	TEXT	carousel.carouselElements.0.text	Naviguez parmi les portraits biodiversité des territoires pour mieux comprendre les enjeux avec une sélection de repères et de chiffres clés sur la nature.	\N	\N	\N	f
40649	1000	TEXT	presentation.territories	Découvrez l’identité de chaque territoire d’outre-mer	\N	\N	\N	f
37343	1001	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
37344	1001	TEXT	interests.locations.3.name	La Réserve naturelle nationale de la Désirade	\N	\N	\N	f
37345	1001	TEXT	statistics.1.text	du territoire couvert par la forêt	\N	\N	\N	f
37346	1001	TEXT	events.9.date	2019	\N	\N	\N	f
37347	1001	IMAGE	species.4.image	\N	1305	*Ctenonotus ferreus* © Aurélien Miralles	\N	f
37348	1001	TEXT	events.3.date	19<sup>e</sup> siècle	\N	\N	\N	f
37349	1001	IMAGE	ecosystems.ecosystems.3.image	\N	1168	Mangrove de Guadeloupe © Gaëlle Vandersarren	\N	f
37350	1001	IMAGE	species.3.image	\N	1294	*Dynastes hercules* © Vincent Prié / Caracol	\N	f
37351	1001	TEXT	species.1.name	Les Ouassous	\N	\N	\N	f
37352	1001	TEXT	species.7.name	Les Orchidées	\N	\N	\N	f
37353	1001	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
37354	1001	TEXT	species.4.name	Les Anolis	\N	\N	\N	f
37511	1024	CHECKBOX	presentation.shadowed	true	\N	\N	\N	f
40650	1000	TEXT	carousel.carouselElements.2.text	Consultez les écogestes et adaptez vos habitudes pour réduire votre impact sur la biodiversité.	\N	\N	\N	f
37355	1001	TEXT	identity.area	1 628	\N	\N	\N	f
37356	1001	TEXT	species.0.description	La Frégate superbe ([*Fregata magnificens*](https://inpn.mnhn.fr/espece/cd_nom/2468\n)) est un oiseau marin de grande taille reconnaissable à sa queue fourchue et ses ailes longues et effilées. Le mâle est noir et remarquable par la présence d’une poche rouge sous la gorge qu’il gonfle pendant les parades nuptiales. La femelle et les juvéniles sont tachés de blanc sur le dos et la poitrine. L’espèce n’est cependant plus nicheuse en Guadeloupe.\n\nStatut dans la Liste rouge des oiseaux de Guadeloupe : préoccupation mineure. 	\N	\N	\N	f
37357	1001	TEXT	identity.highestPointName	La Soufrière	\N	\N	\N	f
37358	1001	TEXT	ecosystems.ecosystems.2.name	La forêt humide	\N	\N	\N	f
37359	1001	TEXT	species.7.description	Parmi les dizaines d’espèces d’ochidées indigènes, 5 sont endémiques strictes de Guadeloupe, dont [*Octomeria ffrenchiana*](https://inpn.mnhn.fr/espece/cd_nom/630252\n), espèce rare d’altitude découverte il y a quelques années seulement. Environ deux tiers des orchidées de Guadeloupe sont épiphytes : elles utilisent une autre plante comme support. Ces espèces sont considérées comme d’excellents bio-indicateurs de la santé du milieu qui les héberge.\n\nStatut dans la Liste rouge de la flore vasculaire de Guadeloupe pour *Octomeria ffrenchiana* : en danger critique.  	\N	\N	\N	f
37360	1001	TEXT	species.8.description	La Tortue imbriquée ([*Eretmochelys imbricata*](https://inpn.mnhn.fr/espece/cd_nom/77347\n)) est l’une des trois espèces de tortues marines qui viennent pondre sur les plages de Guadeloupe. Les tortues marines sont menacées entre autres par les captures accidentelles de pêche, les collisions, l’ingestion de déchets, le braconnage ou encore la destruction de leurs sites d’alimentation. Toutes les espèces de tortues sont protégées, et le réseau des tortues marines de Guadeloupe présente une [charte de bonne conduite à respecter en présence de tortues](http://www.tortuesmarinesguadeloupe.org/les-tortues-marines/la-charte-de-bonne-conduite/) pour les préserver.\n\nStatut dans la Liste rouge mondiale : en danger critique.  	\N	\N	\N	f
37361	1001	IMAGE	species.2.image	\N	1167	*Guaiacum officinale* © César Delnatte	\N	f
37362	1001	TEXT	species.3.description	Le Dynaste scieur de long ([*Dynastes hercules*](https://inpn.mnhn.fr/espece/cd_nom/440144\n)) est l’un des plus gros coléoptères du monde : il peut atteindre 17 cm de long pour 20 cm d’envergure en vol ! Il est protégé sur le territoire depuis 2007. A l’heure actuelle, 1 350 espèces de coléoptères ont été recensées en Guadeloupe mais on estime qu’il pourrait y avoir plusieurs centaines d’espèces encore inconnues.\n  \nStatut dans la Liste rouge mondiale : non évalué.	\N	\N	\N	f
40651	1000	IMAGE	science.image	\N	1499	 Observations de terrain, Martinique © PNR de la Martinique	\N	f
40652	1000	TEXT	science.title	Faire progresser ensemble les connaissances	\N	\N	\N	f
40653	1000	TEXT	presentation.quote	Les outre-mer regroupent 80 % de la biodiversité française, réinventons, adaptons notre façon de vivre et de voyager	\N	\N	\N	f
40654	1000	TEXT	carousel.carouselElements.2.title	Tous acteurs de la préservation de la biodiversité	\N	\N	\N	f
40909	1003	TEXT	header.title	À la découverte des outre-mer	\N	\N	\N	f
40910	1003	TEXT	header.population	2,8 millions	\N	\N	\N	f
37363	1001	TEXT	species.1.description	Les Ouassous sont des crevettes d’eau douce. Ce terme recouvre une douzaine d’espèces différentes, parmi lesquelles [*Macrobrachium carcinus*](https://inpn.mnhn.fr/espece/cd_nom/534442\n), qui peut atteindre 30 cm de long. Elles sont très sensibles à la pollution des eaux (pesticides, détergents, hydrocarbures…) et plusieurs espèces sont considérées menacées en Guadeloupe. Bien que vivant la majeure partie de leur vie en eau douce, c’est en mer que se développent les premiers stades de leurs larves.  \n  \nStatut dans la Liste rouge mondiale pour *Macrobrachium carcinus* : préoccupation mineure.	\N	\N	\N	f
37364	1001	TEXT	species.2.description	Le Gaïac ([*Guaiacum officinale*](https://inpn.mnhn.fr/espece/cd_nom/629786\n)) est un petit arbre des milieux secs, utilisé pour son bois très dense et son usage médicinal. Surexploité et victime de la destruction de son habitat, il est aujourd’hui considéré en danger d’extinction en Guadeloupe et il est protégé. Les derniers individus sont localisés dans la Réserve naturelle nationale des îlets de Petite Terre.\n\nStatut dans la Liste rouge de la flore vasculaire de Guadeloupe : en danger. 	\N	\N	\N	f
37365	1001	TEXT	species.9.description	Aussi appelé Tapeur ou Toto bois, le Pic de Guadeloupe ([*Melanerpes herminieri*](https://inpn.mnhn.fr/espece/cd_nom/442063)) est le seul oiseau endémique de Guadeloupe et seul pic sédentaire des Petites Antilles. Il vit dans les milieux forestiers où il se nourrit principalement d'insectes qu'il trouve sous l'écorce du bois mort. De coloration noire, avec la gorge et l'abdomen rouge, on peut le reconnaitre à l'oreille au son caractéristique du tambourinage rapide que le mâle effectue sur les troncs pour parader et marquer son territoire.  \n\nStatut dans la Liste rouge des oiseaux de Guadeloupe : quasi-menacé. 	\N	\N	\N	f
37366	1001	TEXT	statistics.1.number	42 %	\N	\N	\N	f
37367	1001	TEXT	statistics.0.number	1 407	\N	\N	\N	f
37368	1001	TEXT	statistics.2.number	1989	\N	\N	\N	f
37369	1001	TEXT	species.2.name	Le Gaïac	\N	\N	\N	f
37370	1001	TEXT	species.4.description	Les Anolis sont des lézards communément observés sur tout le territoire. Ce terme regroupe plusieurs espèces et sous-espèces endémiques de la Guadeloupe et de ses dépendances, comme l'Anolis de Marie-Galante [*Ctenonotus ferreus*](https://inpn.mnhn.fr/espece/cd_nom/654829). Chaque île, voire presque chaque îlet des Antilles, possède une population d’anolis qui se différencie par ses couleurs et sa morphologie. Ils sont tous protégés.  \n  \nStatut dans la Liste rouge mondiale pour *Ctenonotus ferreus* : non évalué.	\N	\N	\N	f
37371	1001	TEXT	ecosystems.ecosystems.0.name	La forêt d’altitude	\N	\N	\N	f
37372	1001	TEXT	species.5.description	Le Palmier ti-koko ([*Syagrus amara*](https://inpn.mnhn.fr/espece/cd_nom/630761\n)), espèce protégé et endémique des Petites Antilles, est encore abondant en Guadeloupe alors qu'il a presque disparu de Martinique. Son allure ressemble au cocotier, son port est majestueux et ses fruits ressemblent à des petites noix de coco, d’où son nom.\n\nStatut dans la Liste rouge de la flore vasculaire de Guadeloupe : vulnérable. 	\N	\N	\N	f
37373	1001	TEXT	species.6.description	La mangrove de bord de mer est principalement constituée de Palétuvier rouge ([*Rhizophora mangle*](https://inpn.mnhn.fr/espece/cd_nom/447470\n)), reconnaissable à ses racines-échasses qui se fixent dans les fonds vaseux. Ses graines ont la particularité de germer alors qu’elles sont encore accrochées à l’arbre. Il joue un rôle capital dans la protection des côtes contre la houle, la filtration des eaux saumâtres et ses racines forment une véritable nurserie pour les poissons marins.\n\nStatut dans la Liste rouge de la flore vasculaire de Guadeloupe : Préoccupation mineure. 	\N	\N	\N	f
37374	1001	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
37375	1001	TEXT	events.0.date	-3000 ans	\N	\N	\N	f
37376	1001	TEXT	identity.populationYear	2017	\N	\N	\N	f
37377	1001	IMAGE	species.5.image	\N	1461	*Syagrus amara* © Edric	\N	f
37378	1001	TEXT	statistics.0.text	espèces endémiques du territoire	\N	\N	\N	f
37379	1001	TEXT	ecosystems.ecosystems.1.name	Les plages	\N	\N	\N	f
40356	1009	TEXT	presentation.descriptionTerritories	espèces sont indigènes sur le territoire	\N	\N	\N	f
40357	1009	TEXT	understand.paragraphs.0.title	Une importante diversité de plantes à fleurs et d'insectes	\N	\N	\N	f
40358	1009	TEXT	understand.keyword	indigene	\N	\N	\N	f
40359	1009	TEXT	ecogestures.title	Comment préserver la biodiversité indigène ?	\N	\N	\N	f
40360	1009	IMAGE	presentation.image	\N	1382	Coq-de-roche orange, Guyane © Raphael Gailhac	\N	f
40361	1009	TEXT	understand.paragraphs.1.title	Des mammifères terrestres peu nombreux sur les îles 	\N	\N	\N	f
40362	1009	TEXT	understand.paragraphs.0.text	Au niveau floristique, les plantes à fleurs présentent le plus grand nombre d’espèces : on en compte 12 306 dans tout l'outre-mer. Mais ce ne sont pas les seules espèces végétales : on compte également plusieurs centaines d’espèces de mousse, de lichens ou encore d’algues.  \n\nDu côté de la faune, c’est chez les invertébrés que se trouve la plus grande diversité : on compte plus de 12 000 espèces de Coléoptères et plus de 8 000 espèces de papillons ! Les mollusques sont également un groupe très diversifié, représentés aussi bien en milieu marin qu’en milieu terrestre et en eaux douces.\nChez les vertébrés, on dénombre 5 046 espèces de poissons, 1 435 espèces d'oiseaux, 381 espèces de reptiles, 321 espèces de mammifères et 138 espèces pour les amphibiens.  \n\nCes chiffres sont en perpétuelle évolution à mesure de la progression des connaissances scientifiques, de [nouvelles espèces](/indicateurs/nouvelles-especes) sont découvertes chaque année. Une importante disparité est observée entre le nombre d'espèces terrestres et d'espèces marines répertoriées : près de 80 % des espèces inventoriées sont terrestres ou d'eau douce. Si cela traduit en partie une réalité biologique, cela illustre également la difficulté d'acquérir des connaissances sur les espèces marines. 	\N	\N	\N	f
40363	1009	IMAGE	understand.image	\N	1040	Iguane des petites Antilles, Martinique © Fabien Lefebvre	\N	f
40364	1009	TEXT	presentation.description	espèces sont indigènes dans les outre-mer	\N	\N	\N	f
40365	1009	TEXT	presentation.logoUrl	https://inpn.mnhn.fr/espece/indicateur	\N	\N	\N	f
40366	1006	IMAGE	presentation.file	\N	1487	affiche écogeste protection récifs	\N	f
40367	1006	CHECKBOX	presentation.shadowed	true	\N	\N	\N	f
40368	1006	IMAGE	action.cards.2.icon	\N	1022	Plongée	\N	f
37380	1001	TEXT	events.2.date	18<sup>e</sup> siècle	\N	\N	\N	f
37381	1001	TEXT	identity.presentation	Formée de deux îles principales, Basse-Terre et Grande-Terre, séparées par un bras de mer et entourées de plusieurs dépendances et d’îlets, la Guadeloupe, en raison de sa taille, son altitude, sa géologie et la diversité de ses paysages, est le territoire le plus riche en espèces, notamment endémiques, des Petites Antilles.  	\N	\N	\N	f
37382	1001	TEXT	identity.population	390 253	\N	\N	\N	f
37383	1001	TEXT	species.3.name	Le Dynaste scieur de long	\N	\N	\N	f
37384	1001	IMAGE	species.8.image	\N	1295	*Eretmochelys imbricata* © Benjamin Guichard	\N	f
37385	1001	TEXT	species.0.name	La Frégate superbe	\N	\N	\N	f
37386	1001	TEXT	events.4.date	1976	\N	\N	\N	f
37387	1001	IMAGE	interests.locations.2.image	\N	1165	Les îles de la Petite Terre, avec vue sur la Désirade © Olivier Delzons	\N	f
37388	1001	IMAGE	ecosystems.ecosystems.2.image	\N	1012	La cascade aux écrevisses dans la forêt humide de Guadeloupe © Daniel Öberg/Unsplash	\N	f
37389	1001	TEXT	events.10.description	2e plan national d'actions en faveur des tortues marines des Antilles françaises	\N	\N	\N	f
37390	1001	TEXT	interests.locations.0.description	Créé en 1989 et premier parc national d’outre-mer, son aire d’adhésion s’étend sur 16 communes du territoire et son cœur de parc sur 21 850 ha dont 3 300 ha marins. Tout l’enjeu du [Parc national de Guadeloupe](http://www.guadeloupe-parcnational.fr/fr) est de conjuguer les activités humaines avec la préservation du patrimoine naturel de grande valeur de la Guadeloupe.	\N	\N	\N	f
37391	1001	TEXT	interests.locations.2.description	Composée de deux îles séparées par un chenal de 150 m de large, ce site présente l’une des plus importantes populations d’Iguane des Petites Antilles ([*Iguana delicatissima*](https://inpn.mnhn.fr/espece/cd_nom/350755)). C’est un refuge pour de nombreuses espèces d’oiseaux, un lieu de ponte pour les tortues marines, et on y trouve également le dernier peuplement de Gaïac ([*Guaiacum officinale*](https://inpn.mnhn.fr/espece/cd_nom/629786)), un petit arbre au bois très dense.	\N	\N	\N	f
37392	1001	TEXT	interests.locations.1.description	Entre Basse-Terre et Grande-Terre, cette baie est un véritable réservoir de biodiversité. Côté mer, des herbiers de phanérogames sont entourés par le récif corallien le plus long des Petites Antilles (39 km). Côté terre, la baie est bordée par des mangroves, des forêts marécageuses et marais herbacés sur plus de 5 000 ha. 	\N	\N	\N	f
37393	1001	TEXT	ecosystems.ecosystems.3.name	Les mangroves	\N	\N	\N	f
37394	1001	TEXT	identity.subtitle	Un archipel riche et diversifié	\N	\N	\N	f
37395	1001	IMAGE	species.7.image	\N	1173	Image manquante	\N	f
37396	1001	TEXT	species.5.name	Le Palmier ti-koko	\N	\N	\N	f
37512	1024	IMAGE	action.cards.2.icon	\N	1124	relaché	\N	f
37513	1024	TEXT	presentation.name	Je protège les milieux contre l’introduction d’espèces exotiques envahissantes	\N	\N	\N	f
37514	1024	IMAGE	action.cards.0.icon	\N	1122	Planter	\N	f
37515	1024	IMAGE	presentation.image	\N	1472	La Tortue de Floride, l'une des espèces les plus envahissantes du monde © Amy Baugess	\N	f
40369	1006	TEXT	presentation.name	Je protège les récifs coralliens	\N	\N	\N	f
40370	1006	IMAGE	action.cards.0.icon	\N	1020	Bateau	\N	f
40371	1006	IMAGE	presentation.image	\N	1289	Eco-plongeur dans les récifs de Nouvelle-Calédonie © Jean-Pascal Quod / Reefcheck	\N	f
40372	1006	TEXT	understand.text	Les récifs coralliens sont un écosystème très riche : ils abritent plus d’un tiers des espèces marines connues pour lesquelles ils représentent notamment une zone de nourricerie pour les juvéniles (poissons, crustacés, etc.). Ils forment également une barrière naturelle contre la houle, protégeant la côte lors des tempêtes.\n\nIls sont particulièrement fragiles, et [de nombreux facteurs les menacent](/indicateurs/recifs-coralliens) : le changement climatique, qui entrainent entre autres une augmentation de la température et une acidification des océans, les pollutions, des maladies virales ou bactériennes ou encore la destruction directe pour construire des infrastructures humaines. Par exemple, à Mayotte, le prolongement de la piste d'atterrissage de l'aéroport nécessiterait la destruction d'une importante zone de récifs.\n\nAu-delà de ces pressions globales, les activités de loisirs en mer pèsent également sur la santé des récifs. L’ancrage sauvage peut détériorer les récifs et les herbiers sous-marins. La toxicité pour l’environnement marin des composants de crèmes solaires, qui se dissolvent dans l’eau lors de la baignade, est de plus en plus étudiée et documentée. En plongée, un choc sur les coraux, ou même le simple fait de les toucher leur est néfaste, et cela peut contribuer à la propagation de maladies du corail. Les prélèvements, même de coraux déjà morts, sont préjudiciables pour l’environnement marin et sont rigoureusement interdits dans tous les territoires. 	\N	\N	\N	f
40373	1006	IMAGE	action.cards.1.icon	\N	1021	Crème solaire	\N	f
40374	1006	TEXT	action.cards.2.description	En plongée ou en snorkeling, je fais attention à ne pas toucher les coraux et je ne prélève rien. 	\N	\N	\N	f
40375	1006	TEXT	presentation.category	En mer	\N	\N	\N	f
40376	1006	TEXT	action.cards.1.description	Je choisis une crème solaire moins nocive pour l’environnement	\N	\N	\N	f
40377	1006	TEXT	presentation.description	Les récifs coralliens sont soumis à de multiples pressions, et les activités de loisirs en mer (plaisance, plongée, pêche, baignade…) peuvent participer à leur dégradation.  Prenons soin de ces écosystèmes particulièrement riches, mais fragiles. 	\N	\N	\N	f
40378	1006	TEXT	action.title	Pour profiter de la mer sans impacter les récifs	\N	\N	\N	f
40655	1000	TEXT	testimony.text	L'équipe du Compteur travaille avec ses partenaires sur le développement de nouveaux indicateurs pour enrichir les données disponibles. Des travaux sont également menés sur la perception de la nature et le rapport aux outils numériques. 	\N	\N	\N	f
40656	1000	CHECKBOX	carousel.carouselElements.0.shadowed	true	\N	\N	\N	f
40657	1000	IMAGE	carousel.carouselElements.1.image	\N	1260	Canal de Beauregard, Martinique © Fabien Lefebvre	\N	f
40911	1003	TEXT	header.species	88 966	\N	\N	\N	f
50197	1039	IMAGE	species.7.image	\N	1652	*Chelonia mydas* © Alexandra Gigou / Office français de la biodiversité	\N	f
37516	1024	TEXT	understand.text	Les espèces introduites par l’homme hors de leur territoire d’origine peuvent se développer de manière importante dans leur milieu d’introduction et [menacer la biodiversité locale](/indicateurs/especes-exotiques-envahissantes). Certaines espèces peuvent également avoir des conséquences économiques et sanitaires importantes.\n\nDes animaux de compagnie qui s'échappent ou sont lâchés volontairement dans la nature lorsque leurs propriétaires ne souhaitent pas les garder, c'est l'origine de l'introduction de nombreuses espèces animales exotiques aujourd'hui problématiques, par exemple les Tortues de Floride et autres reptiles, les poissons d'aquarium comme le Guppy ou le Poisson-zèbre ou encore des oiseaux comme le Bulbul Orphée ou le Rossignol du Japon.\n\nDes nombreuses espèces végétales importées ont été plantées dans les parcs et les  jardins pour leur intérêt esthétique, mais certaines n'ont pas tardé à se disperser largement dans les milieux naturels, et à entrer en compétition avec les espèces végétales locales.\n\nDes règlementations, plus ou moins strictes selon les territoires, existent désormais pour limiter l'introduction d'espèces potentiellement envahissantes, en particulier sur les territoires insulaires.	\N	\N	\N	f
37517	1024	IMAGE	action.cards.1.icon	\N	1396	aquarium	\N	f
37518	1024	TEXT	action.cards.2.description	Je ne relâche pas mes animaux de compagnie exotiques dans la nature. Certaines espèces sont désormais interdites de détention et nécessitent d’avoir des autorisations.  	\N	\N	\N	f
37519	1024	TEXT	presentation.category	Sur terre et en mer	\N	\N	\N	f
37520	1024	TEXT	action.cards.1.description	Je ne vidange pas mon aquarium dans la nature. Les plantes aquatiques et les poissons exotiques peuvent être dangereux pour l’équilibre des cours d’eau.	\N	\N	\N	f
37521	1024	TEXT	presentation.description	Les espèces exotiques envahissantes sont une menace majeure pour les écosystèmes, en particulier pour les espaces insulaires qui comptent de nombreuses espèces endémiques.	\N	\N	\N	f
37522	1024	TEXT	action.title	Pour limiter l’introduction et la dispersion d’espèces exotiques envahissantes 	\N	\N	\N	f
40912	1003	TEXT	header.text	Les territoires d’outre-mer présentent une biodiversité particulièrement riche et variée, mais fragilisée par les activités humaines. Naviguez parmi les portraits biodiversité des différents territoires et découvrez l’histoire des espèces et des écosystèmes qui les peuplent, les enjeux de chaque territoire et les initiatives des acteurs locaux pour les préserver.	\N	\N	\N	f
50198	1039	TEXT	species.5.name	Les baobabs	\N	\N	\N	f
50199	1039	TEXT	risks.risks.0.description	Mayotte présente la densité de population la plus forte de tous les territoires d’outre-mer, et la population ne cesse d’augmenter. Cette pression démographique entraine de nombreuses conséquences sur les milieux naturels.  \n\nLe déboisement massif pour l’agriculture, la construction d’infrastructures urbaines et l’utilisation de bois de coupe et de charbon ont drastiquement détérioré les écosystèmes terrestres et la végétation d’origine ne couvre plus qu’environ 10 % du territoire. Cette déforestation aggrave l’érosion des sols et le lessivage des sédiments qui provoque l’envasement du lagon et la dégradation des récifs coralliens.  \n\nLe manque d’assainissement est également l’un des problèmes environnementaux majeurs à Mayotte. En raison du trop faible nombre de stations d’épuration et du faible raccordement des foyers (seulement 10 % de la population raccordée en 2020), les eaux usées sont souvent déversées dans le lagon sans avoir été traitées, chargées de polluants d’origines domestiques, agricoles et industrielles.  \n\nLa pêche à pied est une pratique ancrée dans la culture locale. De nombreuses techniques sont utilisées : pêche à pied (au poulpe), en pirogue, au djarifa (pratiquée par les femmes à l’aide d’un grand tissu maintenu dans l’eau), chasse sous-marine, etc. Ces pratiques sont règlementées et certaines espèces sont interdites de capture. Les déchets issus de la pêche sont également une cause de dégradation du milieu marin.  \n\nDe nombreuses espèces exotiques envahissantes sont également présentes à Mayotte et impactent l’équilibre des écosystèmes, comme le Lantana ([*Lantana camara*](https://inpn.mnhn.fr/espece/cd_nom/104929)), un arbuste originaire des Antilles classé parmi les pires espèces envahissantes au monde, ou l’Avocat marron ([*Litsea glutinosa*](https://inpn.mnhn.fr/espece/cd_nom/656475)), un arbre qui prolifère dans les forêts du nord de l’île. \n	\N	\N	\N	f
50200	1039	TEXT	ecosystems.ecosystems.2.description	Forêt à l’interface entre le milieu marin et le milieu terrestre, dans la zone de balancement des marées, les mangroves couvrent environ 700 hectares répartis sur près de 120 sites le long du littoral mahorais. Zone de nidification pour les oiseaux, de nourrissage et de reproduction pour de nombreuses espèces (crabes, poissons, reptiles…), les mangroves limitent l’érosion et l’envasement du lagon, et permettent l’épuration de l’eau. \nSelon les récits, les *Wana Issa* (les enfants de Issa) sont des esprits qui peuplent les mangroves de Mayotte. Ils protégeraient tantôt les humains des maléfices de la mangrove, tantôt la mangrove des atteintes de l’homme.\nCet écosystème est soumis à de nombreuses pressions : défrichements pour l’agriculture, urbanisation ou encore rejets des eaux usées.   \nPour en savoir plus sur les mangroves de Mayotte, découvrez les [visites virtuelles](https://uicn.fr/Mangrove/M-hoko/visite.htm) développées par le [Pôle Relais Zones Humides Tropicales](https://www.pole-tropical.org/). \n	\N	\N	\N	f
37523	1024	TEXT	understand.quote	La Tortue de Floride, considérée comme l'une des 100 espèces les plus envahissantes du monde, est présente en milieu naturel dans quasiment tous les territoires d'outre-mer français (à l'exception de Saint-Pierre et Miquelon, Wallis et Futuna, et les TAAF)	\N	\N	\N	f
37524	1024	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
37525	1024	TEXT	action.cards.0.description	Je me renseigne sur les espèces végétales que je souhaite planter dans mon jardin et je privilégie d’utiliser des espèces locales. Je respecte la règlementation sur l'interdiction d'introduction d'espèces sur mon territoire.	\N	\N	\N	f
50201	1039	TEXT	ecosystems.ecosystems.1.description	Ce terme, qui signifie « mauvaise terre » désigne des zones de sols dégradés et de roche nue, bruns ou rougeâtres, décapés par l’érosion et dépourvus de végétation. Ce phénomène naturel est largement amplifié par les activités humaines (déforestation, brulis, surpâturages). En 2010, les padzas couvraient 1 100 hectares soit 3 % du territoire. \nLes premiers projets de réhabilitation mis en place utilisaient des végétaux exotiques, comme l’[*Acacia mangium*](https://inpn.mnhn.fr/espece/cd_nom/447341), une espèce au fort potentiel envahissant. D’autres techniques utilisant des espèces indigènes sont aujourd’hui à l’essai, notamment associées à des mycorhizes (champignons) pour fertiliser les sols. \nLa restauration de ces zones et la préservation des terrains boisés permettront de lutter contre les glissements de terrain, les risques d’inondation, le lessivage des sédiments dans le lagon, et permettra la préservation de la ressource en eau et le retour de la biodiversité. \n	\N	\N	\N	f
47434	1031	TEXT	species.0.description	La Gallicolombe de Stair ([*Alopecoenas stairi*](https://inpn.mnhn.fr/espece/cd_nom/784897)) est un oiseau de la famille des Colombidés, que l’on trouve également à Tonga, Fidji et aux Samoa. Si historiquement, l’espèce était probablement présente à Wallis et à Futuna, elle n’est attestée qu’à Alofi et les derniers signalements datent des années 1980. Les missions ornithologiques récentes n’ont pas permis de trouver de traces d’individus, il est donc fort possible que cette espèce soit désormais éteinte dans l’archipel, probablement victime des modifications de son habitat et de la prédation par les rats et les chiens errants. \n  \nStatut sur la Liste rouge mondiale : vulnérable.	\N	\N	\N	f
37397	1001	TEXT	risks.risks.0.description	Grâce à la création du Parc national en 1989, la Guadeloupe a permis de développer un statut de protection pour les écosystèmes et les espèces relativement tôt. Cependant, malgré les règlementations de protection, les obligations ne sont pas toujours respectées et les contrôles ne sont pas suffisamment appliqués. Les formations forestières, en particulier sur le littoral, régressent constamment à cause de l’augmentation des aménagements et infrastructures, et beaucoup de défrichements et de remblais sont pratiqués dans l’illégalité.  \n\nDe nombreuses espèces introduites représentent une menace importante pour la biodiversité comme la Petite mangouste indienne ([*Urva auropunctata*](https://inpn.mnhn.fr/espece/cd_nom/850071)), l’Iguane commun ([*Iguana iguana*](https://inpn.mnhn.fr/espece/cd_nom/350756)), la Fourmi manioc ([*Acromyrmex octospinosus*](https://inpn.mnhn.fr/espece/cd_nom/641267)), l’Escargot géant africain ([*Lissachatina fulica*](https://inpn.mnhn.fr/espece/cd_nom/824950)), ou encore le Tulipier du Gabon ([*Spathodea campanulata*](https://inpn.mnhn.fr/espece/cd_nom/448228)).\n\nComme en Martinique, la chlordécone, pesticide utilisé dans les bananeraies entre les années 1970 et 1990 a massivement pollué les milieux naturels de l’île. Si ces impacts sur la santé humaine commencent à être reconnus, ses conséquences sur les espèces et les écosystèmes sont également étudiées. Des études ont notamment montré une importante contamination des organismes marins côtiers, ce qui a conduit à interdire la pêche dans certaines zones.\n\nLe projet de réintroduction du Lamantin des Caraïbes ([*Trichechus manatus*](https://inpn.mnhn.fr/espece/cd_nom/443799)) porté depuis 2014 par le Parc national de Guadeloupe dans le cadre du LIFE SIRENIA, a été interrompu en 2018. 	\N	\N	\N	f
37398	1001	TEXT	ecosystems.ecosystems.2.description	Entre 300 et 1000 m d’altitude, la forêt est luxuriante : fougères, arbustes, herbacées, lianes et autres épiphytes, sous le couvert de très grands arbres tels que le Gommier ([*Dacryodes excelsa*](https://inpn.mnhn.fr/espece/cd_nom/447568)) ou l’Acomat boucan ([*Sloanea caribaea*](https://inpn.mnhn.fr/espece/cd_nom/630680)) qui étendent leurs branchages jusqu’à plus de 30 m de haut. 	\N	\N	\N	f
37399	1001	TEXT	ecosystems.ecosystems.1.description	Des plages sableuses emblématiques de « l’imaginaire » des îles tropicales aux plages rocheuses battues par la houle et aux falaises, le littoral guadeloupéen héberge une faune et une flore variée : patates bord-de-mer, amarante bord-de-mer, poirier-pays, fleurit-noël bord-de-mer, reptiles, oiseaux marins et limicoles… Cependant, la pression des activités humaines est forte sur les littoraux et peu de ces milieux sont encore vierges d'installations humaines. Cette artificialisation peut faire obstacle à la remontée des tortues marines lorsqu'elles viennent pondre sur les plages. 	\N	\N	\N	f
37400	1001	TEXT	ecosystems.ecosystems.0.description	A partir de 1 000 m d’altitude, soumise aux vents violents, à l’excès d’humidité et à la persistance des nuages, la végétation basse n’excède pas 1,50 m de haut. Cette « forêt de montagne » composée d’Ananas montagnes rouges ([*Pitcairnia bifrons*](https://inpn.mnhn.fr/espece/cd_nom/630443)) ou jaunes ([*Guzmania plumieri*](https://inpn.mnhn.fr/espece/cd_nom/629800)), de Thym-montagne ([*Tibouchina ornata*](https://inpn.mnhn.fr/espece/cd_nom/630806)), de palétuvier montagne ([*Clusia mangle*](https://inpn.mnhn.fr/espece/cd_nom/629372)) et de laurier rose ([*Podocarpus coriaceus*](https://inpn.mnhn.fr/espece/cd_nom/630457)) laisse place sur les très hauts sommets aux mousses et aux lichens. 	\N	\N	\N	f
47435	1031	TEXT	identity.highestPointName	Mont Puke (Futuna)	\N	\N	\N	f
37401	1001	TEXT	identity.highestPoint	1 467	\N	\N	\N	f
37402	1001	TEXT	risks.risks.0.name	Le premier Parc national dans les outre-mer	\N	\N	\N	f
37403	1001	IMAGE	interests.locations.1.image	\N	1007	Le lagon du Grand Cul-de-Sac Marin © Guilhem Pouxviel	\N	f
37404	1001	IMAGE	ecosystems.ecosystems.1.image	\N	1458	Plage de Grande Anse © Amandine Escarguel / OFB	\N	f
37405	1001	TEXT	interests.locations.3.description	Créée en 2011 pour préserver le patrimoine géologique exceptionnel de l’île, où l’on observe les très rares traces des prémices de la formation de la plaque tectonique des Caraïbes, l’île abrite également une végétation particulière avec plusieurs espèces rares dont le Cactus tête à l’Anglais ([*Melocactus intortus*](https://inpn.mnhn.fr/espece/cd_nom/447021)), ainsi que de nombreuses espèces d’oiseaux marins. 	\N	\N	\N	f
37406	1001	TEXT	identity.title	La Guadeloupe,  \n« l’île aux belles eaux »	\N	\N	\N	f
37407	1001	IMAGE	species.6.image	\N	1296	*Rhizophora mangle* © Benjamin Guichard	\N	f
37408	1001	TEXT	interests.locations.1.name	La baie de Grand Cul-de-Sac marin	\N	\N	\N	f
37409	1001	TEXT	statistics.2.text	Création du premier parc national d’outre-mer	\N	\N	\N	f
37410	1001	IMAGE	species.0.image	\N	1008	*Fregata magnificens* © macraegi /  CC BY-SA 2.0	\N	f
37411	1001	TEXT	events.1.date	1635	\N	\N	\N	f
14286	1030	TEXT	paragraphs.2.text	**Outils de mesure d’audience**\nLe site utilise l’outil d’analyse Matomo. Les traceurs de mesures d’audience issus de Matomo ne nécessitent pas de recueil préalable du consentement de l’utilisateur du fait qu’ils servent uniquement à produire des données statistiques anonymes.\nPour en savoir plus :\nhttps://fr.matomo.org/privacy/\n\n**Politique de confidentialité et RGPD**\nLe Muséum national d’Histoire naturelle porte la plus grande attention à vos données à caractère personnel et s’engage à les protéger.\nIl s'engage à ce que la collecte et le traitement de données à caractère personnel, effectués à partir du présent site, soient conformes à la loi n°78-17 du 6 janvier 1978 modifiée relative à l'informatique, aux fichiers et aux libertés ainsi qu’au Règlement (UE) 2016/679 du Parlement européen et du Conseil du 27 avril 2016 applicable le 25 mai 2018. \n\n**Données personnelles**\nSauf stipulation contraire directement mentionnée, aucune donnée personnelle n’est collectée ni traitée sur le portail « Compteur de biodiversité outre-mer ».	\N	\N	\N	f
14287	1030	TEXT	paragraphs.1.title	Conditions générales d’utilisation	\N	\N	\N	f
14288	1030	TEXT	title	Mentions légales	\N	\N	\N	f
14289	1030	TEXT	paragraphs.2.title	Mentions relatives à l’utilisation de cookies	\N	\N	\N	f
14290	1030	TEXT	paragraphs.0.text	**Editeur**\nMuséum national d'Histoire naturelle\nUMS Patrimoine Naturel \nCP41, 36 rue Geoffroy saint-Hilaire\n75005 Paris\n\n**Conception et hébergement**\nAgence Ninja Squad\nwww.ninja-squad.fr\n\nJean-Baptiste Giffard\nwww.digitaldesigner.cool\n\nSite hébergé par le Muséum national d’Histoire naturelle\n\n**Création graphique**\nDesign graphique réalisé par : \nAmélie Bracq\nEdouard Sastre\n\n**Création et mise à jour du contenu**\nLe contenu éditorial du site est produit et mis à jour par l’Unité Mixte de Service Patrimoine Naturel (UMS PatriNat) du MNHN.	\N	\N	\N	f
50202	1039	TEXT	interests.locations.5.description	Ce lac de cratère est la seule étendue d’eau naturelle de l’île de Petite Terre. D’une superficie de 23 ha, ses eaux de couleur verte sont uniquement peuplées de microorganismes (cyanobactéries, protozoaires…) en raison de conditions de vie particulièrement rudes : salinité plus élevée que l’eau de mer, eaux alcalines (ph entre 9 et 9,5), température de 30°C et surface sursaturée en oxygène mais anoxie au-delà d’1,5 m de profondeur. Il est bordé par des vestiges de forêt sèche.	\N	\N	\N	f
50203	1039	TEXT	ecosystems.ecosystems.0.description	Les forêts de Mayotte ont été largement perturbées par les activités humaines, et il ne subsiste que quelques reliques de forêts primaires. Sur les monts et les crêtes, la forêt est de type tropical humide, avec un sous-bois dense et de nombreuses mousses, fougères, lianes et épiphytes (végétaux utilisant d’autres plantes comme support). Il existe également des reliquats de forêts primaires sèches comme sur l’îlot MBouzi.  \nLes forêts primaires sont menacées par l’utilisation du bois, les brûlis, l’extension des zones agricoles et urbaines. La Réserve naturelle nationale des forêts de Mayotte a été créée en 2021 afin de préserver ces reliquats de forêts primaires qui abritent une grande partie de la biodiversité indigène et endémique mahoraise. \nLes forêts dites « secondaires », qui s’établissent suite aux perturbations humaines, sont moins riches en biodiversité et souvent composées d’espèces exotiques dont des espèces envahissantes. 	\N	\N	\N	f
50204	1039	TEXT	identity.highestPoint	660	\N	\N	\N	f
50205	1039	TEXT	interests.locations.4.description	Au sud-ouest de la Grande Terre, la Baie de Bouéni abrite la plus vaste mangrove de Mayotte. Celle-ci s’étale sur près de 200 hectares et abrite une faune nombreuse, dont le Crabier blanc ([*Ardeola idae*](https://inpn.mnhn.fr/espece/cd_nom/418710)), oiseau en danger critique d’extinction. Les formations récifales de la baie sont également très riches. Le site est reconnu comme zone nationale d’intérêt écologique, floristique et faunistique (ZNIEFF).	\N	\N	\N	f
50206	1039	TEXT	risks.risks.0.name	La biodiversité de Mayotte sous pression 	\N	\N	\N	f
50207	1039	IMAGE	interests.locations.1.image	\N	1658	Vue aérienne du lagon et de la barrière récifale © Alexandra Gigou / Office français de la biodiversité	\N	f
50208	1039	IMAGE	ecosystems.ecosystems.1.image	\N	1643	Padzas sur le Mont Choungui © Manuel Parizot	\N	f
50209	1039	TEXT	interests.locations.3.description	Cette lagune littorale saumâtre située au nord-ouest de Petite Terre est entourée de tombolos (cordons de sédiments) au nord et au sud, percés par des brèches permettant la circulation de l'eau avec le lagon, selon le cycle des marées. Ses fonds vaseux sont peuplés d’herbiers de phanérogames que viennent brouter les tortues et les abords du plan d’eau sont colonisés par la mangrove. Le site accueille une faune riche, dont 35 espèces d’oiseaux. Il est reconnu zone humide d’importance internationale au titre de la Convention de RAMSAR depuis 2011.	\N	\N	\N	f
28632	1014	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
28633	1014	TEXT	understand.text2	Cet indicateur présente l’évolution du recouvrement en corail vivant sur des stations réparties dans les différents territoires d’outre-mer. La situation est en réalité très hétérogène selon les collectivités : les récifs sont ainsi très dégradés en Martinique et Guadeloupe, mais beaucoup moins à Wallis-et-Futuna ou Mayotte. La situation est considérée comme stable pour 60 % des stations étudiées.  \n\nCet indicateur a cependant des limites, par exemple, le nombre de stations évaluées reste faible : on compte 82 stations évaluées sur plus de 600 existantes. De plus, il se base uniquement sur le caractère vivant du corail, mais pas sur les espèces de coraux présentes, ni les communautés associées (poissons, invertébrés). Des analyses plus complètes et plus fines sont nécessaires afin de bien comprendre l’évolution de l’état de santé des récifs coralliens.	\N	\N	\N	f
28634	1014	TEXT	understand.text1	Les récifs coralliens sont formés par des colonies de coraux, formées de polypes (petits organismes invertébrés de la même famille que les méduses) sécrétant un squelette calcaire, et vivant en symbiose avec des algues unicellulaires, les zooxanthelles, qui leur apportent des nutriments grâce à la photosynthèse.\nPoissons, crustacés, mollusques, concombres de mer, éponges... les récifs coralliens sont des écosystèmes extrêmement riches en biodiversité, ils représentent une zone de nourrissage, de refuge et de nurserie pour des milliers d'espèces marines.  \n \n10 % des récifs coralliens mondiaux sont situés dans les territoires d’outre-mer français, la France a donc une responsabilité importante à l’échelle mondiale sur la conservation des récifs coralliens.	\N	\N	\N	f
50210	1039	TEXT	identity.title	Mayotte,  \nun lagon d'une richesse exceptionnelle	\N	\N	\N	f
50211	1039	IMAGE	species.6.image	\N	1651	*Stenella longirostris* © Yannick Stephan - Mayotte Découverte	\N	f
50212	1039	TEXT	interests.locations.1.name	Le Parc naturel marin	\N	\N	\N	f
28635	1014	TEXT	territories.title	Pourcentage de surface des récifs coralliens en diminution	\N	\N	\N	f
28636	1014	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
28637	1014	TEXT	understand.title1	Le corail, constructeur du récif	\N	\N	\N	f
40379	1006	TEXT	understand.quote	La grande barrière de corail de Nouvelle-Calédonie est la deuxième plus grande au monde, après celle se trouvant sur la côte est de l'Australie.	\N	\N	\N	f
40380	1006	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
40381	1006	TEXT	action.cards.0.description	En bateau, je jette l'ancre sur des zones sableuses, et non pas à proximité de récifs ou d'herbiers. 	\N	\N	\N	f
50213	1039	TEXT	statistics.2.text	de mangrove	\N	\N	\N	f
50214	1039	IMAGE	species.0.image	\N	1624	image manquante	\N	f
50215	1039	TEXT	events.1.date	-7 000 ans 	\N	\N	\N	f
50216	1039	TEXT	interests.locations.4.name	La Baie de Bouéni	\N	\N	\N	f
40382	1018	TEXT	secondActionName	Je donne de mon temps	\N	\N	\N	f
40383	1018	LINK	secondActionLink	Découvrez les sciences participatives	\N	\N	/sciences-participatives	f
40384	1018	TEXT	description	Envie d’agir ? Signalez vos observations depuis votre smartphone ou participez à un programme de sciences participatives ! 	\N	\N	\N	f
40385	1018	TEXT	firstActionName	J'agis en ligne	\N	\N	\N	f
40386	1018	LINK	firstActionLink	Je télécharge l'application INPN Espèces	\N	\N	https://inpn.mnhn.fr/informations/inpn-especes	f
40387	1018	TEXT	title	Agir pour la biodiversité	\N	\N	\N	f
47436	1031	TEXT	ecosystems.ecosystems.2.name	La mangrove	\N	\N	\N	f
38394	1020	IMAGE	species.9.image	\N	1322	*Syzygium acre* © Vanessa Hequet	\N	f
38395	1020	TEXT	events.2.description	Création de la première aire protégée de l'archipel, l'îlot Leprédour	\N	\N	\N	f
38396	1020	TEXT	events.3.description	Inscription des lagons de Nouvelle-Calédonie au Patrimoine mondial de l'UNESCO	\N	\N	\N	f
38397	1020	IMAGE	identity.image	\N	1477	Baie d'Oro, Île des Pins, Nouvelle-Calédonie © Hélène Udo / OFB	\N	f
38398	1020	TEXT	events.7.description	Publication du Code de l'environnement de la Province des îles Loyauté	\N	\N	\N	f
38399	1020	TEXT	events.7.date	2016	\N	\N	\N	f
38400	1020	TEXT	interests.locations.0.name	Le Parc naturel de la Mer de Corail 	\N	\N	\N	f
38401	1020	TEXT	events.0.description	Dislocation du supercontinent Gondwana et séparation de la Nouvelle-Calédonie avec l’Australie et la Nouvelle-Zélande	\N	\N	\N	f
38402	1020	TEXT	events.1.description	Arrivée des explorateurs Lapita par la mer : première occupation humaine du territoire	\N	\N	\N	f
38403	1020	TEXT	events.8.description	Expédition naturaliste ["la Planète revisitée"](http://nouvellecaledonie.laplaneterevisitee.org/)	\N	\N	\N	f
38404	1020	TEXT	events.9.description	Création du parc provincial de la Côte oubliée	\N	\N	\N	f
38405	1020	IMAGE	ecosystems.image	\N	1476	Mont Dzumac © Hélène Udo / OFB	\N	f
38406	1020	TEXT	identity.species	26 984	\N	\N	\N	f
38407	1020	IMAGE	ecosystems.ecosystems.0.image	\N	1092	Forêt tropicale humide sur l’île de Lifou, Nouvelle-Calédonie © Benjamin Guichard / OFB	\N	f
38408	1020	TEXT	species.11.description	Au cours de l’hiver austral, les baleines à bosse ([*Megaptera novaeangliae*](https://www.endemia.nc/faune/fiche5266)) viennent se reproduire en Nouvelle-Calédonie. L’archipel abrite ainsi une petite population qui fréquente les eaux du lagon mais également les monts sous-marins peu profonds de la zone économique exclusive. Des études scientifiques visent à mieux comprendre la migration des baleines depuis et vers l’archipel et à évaluer la connectivité au sein du parc et avec les populations voisines, dans l’objectif d’estimer le statut de cette population pour contribuer à sa conservation.  \n\nStatut dans la Liste rouge mondiale : préoccupation mineure\n	\N	\N	\N	f
38409	1020	TEXT	ecosystems.ecosystems.6.name	Les grandes algueraies à Sargasses	\N	\N	\N	f
38410	1020	TEXT	species.12.description	Sur les sept espèces de tortues marines présentes dans le monde, trois fréquentent régulièrement les eaux calédoniennes : la Tortue Verte (*Chelonia mydas*), la Tortue imbriquée (*Etretmochelys imbricata*) et la Tortue grosse tête ou Tortue caouanne (*Caretta caretta*). Un plan d’action est en place depuis fin 2018, pour contribuer activement à la conservation des tortues marines et de leurs habitats, à l’échelle locale, régionale et internationale.  \n\nStatut dans la Liste rouge mondiale\n*Chelonia mydas* : en danger\n*Etretmochelys imbricata* : en danger critique \n*Caretta caretta* : vulnérable	\N	\N	\N	f
38411	1020	TEXT	species.8.name	Le Niaouli	\N	\N	\N	f
38412	1020	TEXT	species.14.description	Les nautiles sont considérés comme des fossiles vivants dont les ancêtres étaient proches des ammonites, éteintes à la fin de l’ère secondaire. Ils sont les seuls céphalopodes à posséder une coquille, comme les escargots. Habitants du fonds des océans, ils ont une durée de vie d'une vingtaine d'années et se caractérisent par une croissance lente et un faible taux de reproduction. \nSept espèces de nautiles sont aujourd’hui connues, dont [*Nautilus macromphalus*](https://endemia.nc/faune/fiche4911), qui est endémique à la Nouvelle-Calédonie.  \n  \nStatut dans la Liste rouge mondiale pour *Nautilus macromphalus* : non évalué. \n	\N	\N	\N	f
38413	1020	TEXT	events.6.description	Création du Parc marin de la mer de Corail ; Inscription des lacs du Grand Sud sur la liste des sites Ramsar	\N	\N	\N	f
38414	1020	TEXT	species.13.description	Ces dernières décennies, la prospection biologique des milieux profonds notamment des monts sous-marins a permis la découverte de fossiles vivants. Parmi eux, un crinoïde ([*Neogymnochrinus richeri*](https://inpn.mnhn.fr/espece/cd_nom/647041)), de la famille des Sclerocrinidae,  datant du jurassique et supposée éteinte. Il a été retrouvé à la fin des années 80 sur la ride de Norflok.  \n  \nStatut dans la Liste rouge mondiale : non évalué. \n\n\n	\N	\N	\N	f
38415	1020	TEXT	species.15.description	Plus gros pigeon arboricole du monde, le notou ([*Ducula goliath*](https://www.endemia.nc/faune/fiche71)) présente un plumage bleu gris, avec une pointe de pourpre sur les ailes, et ses yeux sont rouge vif. Il vit dans les forêts humides de la Grande Terre et contribue à sa régénération par dissémination des graines dont il se nourrit. Difficile à observer, il se repère toutefois facilement à son chant particulier, grave et sourd.  \n\nStatut dans la Liste rouge mondiale : non évalué.\n	\N	\N	\N	f
38416	1020	TEXT	events.6.date	2014	\N	\N	\N	f
38417	1020	TEXT	events.4.description	Publication des Codes de l'environnement des Provinces Sud et Nord	\N	\N	\N	f
38418	1020	TEXT	events.5.description	Création du [Conservatoire d'espaces naturels](https://www.cen.nc/especes-envahissantes/presentation)	\N	\N	\N	f
38419	1020	TEXT	interests.locations.2.name	La région des lacs du Grand Sud	\N	\N	\N	f
38420	1020	TEXT	ecosystems.ecosystems.3.description	Aussi dit « sclérophylle », ce type de forêt n’est plus présent que sur environ 175 km<sup>2</sup>, soit moins de 1 % du territoire et moins de 2 % de sa surface estimée d’origine. Localisées sur le littoral de la côte ouest, ces forêts sont très vulnérables, notamment aux aménagements agropastoraux, aux incendies et aux espèces exotiques envahissantes. Elles abritent une biodiversité élevée avec un taux d'endémisme de 60 %.   \nUn [programme de conservation](https://www.cen.nc/foret-seche/presentation) des forêts sèches, initié en 2001, est aujourd'hui coordonné par le Conservatoire d'espaces naturels de Nouvelle-Calédonie. 	\N	\N	\N	f
38421	1020	TEXT	ecosystems.ecosystems.4.description	Forêt de bord de mer aux pieds dans l’eau, cette formation arborescente adaptée aux conditions de salinité des eaux, au manque d'oxygène et à l'instabilité des sols, est majoritairement située sur la côte ouest du fait de vastes plaines propices à son installation. Elle couvre 258 km<sup>2</sup> sur l'ensemble de l'archipel.  \n\nProtection contre l’érosion, les tempêtes, la sédimentation dans le lagon, zone de nurserie pour de nombreux organismes, épuration de l’eau : les services rendus par cet écosystème sont nombreux et précieux.	\N	\N	\N	f
38422	1020	TEXT	ecosystems.ecosystems.4.name	La mangrove	\N	\N	\N	f
38423	1020	TEXT	ecosystems.ecosystems.5.description	Exposées aux activités humaines et vulnérables, ces prairies sous-marines occupent près de 940 km² de zones côtières peu profondes. On y compte 11 espèces de phanérogames marines parmi les 70 connues au niveau mondial. \nHabitat et source de nourriture pour de nombreuses espèces (dugong, tortues…), ces herbiers revêtent également une importance socio-économique en abritant diverses espèces pêchées, telles que les holothuries. En outre, elles protègent le littoral en fixant les sédiments et joueraient un rôle important dans la régulation du climat (stockage de carbone). \n	\N	\N	\N	f
38424	1020	TEXT	ecosystems.ecosystems.7.name	Les fonds de baie envasées	\N	\N	\N	f
38425	1020	TEXT	ecosystems.ecosystems.7.description	Le long du littoral de la Grande Terre se trouvent des baies protégées, aux fonds constitués de sédiments fins, souvent vaseux. Certains sont chargés en terre rouge provenant des sols naturellement délavés, d'autres ont une charge terrigène accrue par les activités humaines. \nUne communauté de coraux spéciale vit dans ces habitats singuliers, comme l’espèce endémique, *Cantharellus noumeae* ou *Acropora tortuosa*, produisant du mucus qui piège les sédiments ou encore *Catalaphyllia jardinei*, qui étale ses polypes mous et colorés.\n	\N	\N	\N	f
38426	1020	IMAGE	species.14.image	\N	1328	*Nautilus sp.* © Claude Payri	\N	f
38427	1020	TEXT	ecosystems.ecosystems.6.description	Forêts sous-marines, ces formations d’algues brunes où dominent les sargasses colonisent les dalles rocheuses du fond des lagons et forment une canopée d’une hauteur de plus d’un mètre sous la surface de l’eau. \nVéritables oasis, ces algueraies jouent un rôle essentiel pour le cycle biologique de différentes espèces animales, de micro et macroalgues. \nEncore mal connues, ces zones de transition écologique entre les zones littorales et récifales représentent un enjeu important pour le fonctionnement des récifs et lagons.\n	\N	\N	\N	f
38428	1020	IMAGE	ecosystems.ecosystems.5.image	\N	1474	Herbier de phanérogames © Claude Payri	\N	f
38429	1020	IMAGE	species.1.image	\N	1317	*Rhynochetos jubatus* © Olivier Gargominy / INPN	\N	f
38430	1020	TEXT	species.10.description	Sur les quatre espèces de roussettes (chauves-souris frugivores et nectarivores) présentes en Nouvelle-Calédonie, trois en sont endémiques. La Roussette rousse ([*Pteropus ornatus*](https://www.endemia.nc/faune/fiche1328) et celle du Pacifique ([*P. tonganus*](https://www.endemia.nc/faune/fiche1329)) sont également des espèces-gibiers très prisées, dont la chasse est réglementée. Elles constituent aussi les proies des chats harets. \nLe déclin actuel de ces espèces emblématiques pourrait également engendrer la perte des aspects culturels et des services écosystémiques associés, comme la dissémination des graines et la pollinisation. \n  \nStatuts dans la Liste rouge mondiale\n*Pteropus ornatus* (endémique) : vulnérable\n*Pteropus tonganus* : préoccupation mineure\n*Pteropus vetulus* (endémique): quasi-menacé\n*Notopteris neocaledonica* (endémique) : en danger	\N	\N	\N	f
38431	1020	TEXT	events.5.date	2011	\N	\N	\N	f
38432	1020	TEXT	identity.marineArea	1,4 million	\N	\N	\N	f
38433	1020	TEXT	species.9.name	*Syzygium acre*	\N	\N	\N	f
38434	1020	TEXT	events.8.date	2016-2019	\N	\N	\N	f
38435	1020	IMAGE	interests.locations.0.image	\N	1089	Parc naturel de la Mer de Corail © Anne Littaye / OFB	\N	f
37428	1025	IMAGE	presentation.file	\N	1469	affiche écogeste respect faune sauvage	\N	f
37429	1025	CHECKBOX	presentation.shadowed	true	\N	\N	\N	f
37430	1025	IMAGE	action.cards.2.icon	\N	1129	chien	\N	f
37431	1025	IMAGE	action.cards.3.icon	\N	1130	véto	\N	f
37432	1025	TEXT	presentation.name	Je respecte la faune sauvage	\N	\N	\N	f
38436	1020	TEXT	species.6.name	Le Gecko géant	\N	\N	\N	f
38437	1020	IMAGE	interests.locations.3.image	\N	1315	Réserve du Mont Panié © Christine Fort	\N	f
38438	1020	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
38439	1020	TEXT	species.14.name	Les Nautiles	\N	\N	\N	f
38440	1020	TEXT	interests.locations.3.name	La réserve de nature sauvage du Mont Panié	\N	\N	\N	f
38441	1020	TEXT	species.15.name	Le notou	\N	\N	\N	f
38442	1020	TEXT	statistics.1.text	Plus grande barrière de corail au monde (1 600 km)	\N	\N	\N	f
33123	1011	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
33124	1011	TEXT	understand.text2	On qualifie de primaire, ou vierge, une forêt où aucune trace d’activité humaine (défrichement, exploitation, fragmentation), passée ou présente, n’est clairement visible et où les processus écologiques ne sont pas perturbés. A l’échelle mondiale, on estime que plus de 80 % des forêts primaires ont disparu, remplacées par des forêts secondaires moins riches écologiquement, et les reliquats sont de plus en plus réduits et fragmentés.  \n\nAvec plus de 90 % de forêts encore intactes, la Guyane présente l’un des territoires les plus vastes de forêts primaires encore préservées.\n	\N	\N	\N	f
33125	1011	TEXT	understand.text1	Les forêts primaires et autres écosystèmes forestiers des outre-mer présentent une biodiversité considérable. Les territoires ultramarins sont cependant très hétérogènes dans leur couverture forestière et leurs caractéristiques : des forêts tropicales humides de Guyane qui couvrent la quasi-totalité du territoire aux forêts boréales de conifères de Saint-Pierre-et-Miquelon, chaque territoire possède une couverture forestière et une biodiversité qui lui est propre. Seules les îles subantarctiques et la Terre Adélie ne présentent pas de forêts sur leurs territoires. 	\N	\N	\N	f
33126	1011	TEXT	territories.title	Pourcentage du territoire occupé par la forêt	\N	\N	\N	f
38443	1020	TEXT	events.9.date	2019	\N	\N	\N	f
38444	1020	IMAGE	species.4.image	\N	1331	*Amborella trichopoda* © Vanessa Hequet	\N	f
38445	1020	IMAGE	species.12.image	\N	1397	*Caretta caretta* © Bwara	\N	f
33127	1011	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
33128	1011	TEXT	understand.title1	Les forêts, un réservoir de biodiversité	\N	\N	\N	f
33129	1011	TEXT	understand.paragraphs.1.text	Au-delà de leur rôle pour la préservation de la biodiversité, les forêts nous fournissent de nombreux services écosystémiques : elles protègent par exemple les sols de l’érosion, préservent les ressources en eau et stockent le carbone. Elles permettent de se fournir en bois de construction et plantes médicinales, bien que ces ressources puissent être surexploitées. Les forêts ont également une grande importance culturelle dans les territoires d'outre-mer, dans les légendes, les arts et le bien-être de la population.\n\nElles sont cependant soumises à de nombreuses pressions : déboisement pour l’agriculture, l’exploitation du bois ou de mines, artificialisation du territoire, introduction d’espèces exotiques envahissantes, effets des changements climatiques, etc. 	\N	\N	\N	f
33130	1011	TEXT	understand.title2	Qu’est-ce qu’une forêt primaire ?	\N	\N	\N	f
33131	1011	TEXT	presentation.descriptionTerritories	du territoire est occupé par des forêts	\N	\N	\N	f
33132	1011	TEXT	understand.paragraphs.0.title	Pourquoi mesurer le taux de boisement ? 	\N	\N	\N	f
33133	1011	TEXT	understand.keyword	forets	\N	\N	\N	f
33134	1011	TEXT	ecogestures.title	Que puis-je faire pour préserver la biodiversité forestière ? 	\N	\N	\N	f
33135	1011	IMAGE	presentation.image	\N	1377	Forêt tropicale humide, Montagne Trésor, Guyane  © Guillaume Feuillet	\N	f
33136	1011	TEXT	understand.paragraphs.1.title	Des services écosystémiques et une valeur patrimoniale	\N	\N	\N	f
33137	1011	TEXT	understand.paragraphs.0.text	La destruction des forêts est reconnue comme une pression majeure sur la biodiversité, le suivi du taux de boisement permet de suivre l’évolution de cette pression, et donc indirectement l’état de la biodiversité forestière. Sont exclues de ce calcul les forêts urbaines ou à vocation agricole.\n\nDepuis 1990, le taux de boisement reste pour le moment globalement stable pour les outre-mer français. Cependant, cet indicateur a des limites : il nous donne une indication sur la surface, mais ne renseigne pas sur le bon état écologique de ces forêts.  	\N	\N	\N	f
33138	1011	IMAGE	understand.image	\N	1378	Forêt boréale, Saint-Pierre-et-Miquelon ©  Bruno Letournel / OFB	\N	f
33139	1011	TEXT	presentation.description	du territoire d’outre-mer est occupé par des forêts	\N	\N	\N	f
33140	1011	TEXT	presentation.logoUrl	https://naturefrance.fr/indicateurs/taux-de-boisement-dans-les-outre-mer	\N	\N	\N	f
43530	1021	IMAGE	species.9.image	\N	1565	*Circus maillardi* © S. Caceres et JN Jasmin	\N	f
43531	1021	TEXT	events.2.description	Prise de possession française sous le nom d'*île Bourbon*	\N	\N	\N	f
43532	1021	TEXT	events.3.description	Dernière mention connue du Solitaire de La Réunion ([*Threskiornis solitarius*](https://inpn.mnhn.fr/espece/cd_nom/432588)) oiseau endémique	\N	\N	\N	f
43533	1021	IMAGE	identity.image	\N	1095	Cascades du Bras d’Annette à Grand Etang, La Réunion © Philippe Gourdain	\N	f
43534	1021	TEXT	events.7.description	Découverte du premier site de nidification du [Pétrel noir de Bourbon](https://www.petrels.re/les-especes/petrel-noir-de-bourbon/) ([*Pseudobulweria aterrima*](https://inpn.mnhn.fr/espece/cd_nom/442280)), oiseau endémique encore mal connu	\N	\N	\N	f
43535	1021	TEXT	events.7.date	2016	\N	\N	\N	f
43536	1021	TEXT	interests.locations.0.name	Le Parc national de La Réunion	\N	\N	\N	f
43537	1021	TEXT	events.0.description	Emergence de l’île	\N	\N	\N	f
43538	1021	TEXT	events.1.description	Dernière éruption du Piton des Neiges	\N	\N	\N	f
43539	1021	TEXT	events.8.description	Publication de la Liste rouge des coraux de l’Océan Indien	\N	\N	\N	f
43540	1021	IMAGE	ecosystems.image	\N	1495	Éruption du Piton de la Fournaise en 2018 © Fabrice H.	\N	f
43541	1021	TEXT	identity.species	10 463	\N	\N	\N	f
37433	1025	IMAGE	action.cards.0.icon	\N	1127	distance	\N	f
37434	1025	IMAGE	presentation.image	\N	1126	Iguane endémique des Petites Antilles © Fabien Lefebvre	\N	f
38446	1020	TEXT	events.3.date	2008	\N	\N	\N	f
38447	1020	IMAGE	ecosystems.ecosystems.3.image	\N	1330	Forêt sèche © CEN Nouvelle-Calédonie	\N	f
43542	1021	IMAGE	ecosystems.ecosystems.0.image	\N	1488	Forêts au cirque de Salazie © Alexandre Clair	\N	f
43543	1021	TEXT	species.8.name	Le Bois d’Ortie	\N	\N	\N	f
43544	1021	TEXT	events.6.description	Publication des Listes rouges de la Faune et de la Flore de La Réunion ; Inscription des cirques au Patrimoine mondial de l'UNESCO	\N	\N	\N	f
43545	1021	TEXT	events.6.date	2010	\N	\N	\N	f
43546	1021	TEXT	events.4.description	Publication des premiers volumes de La Flore des Mascareignes, avec la contribution du botaniste Thérésien Cadet.	\N	\N	\N	f
43547	1021	TEXT	events.5.description	Création du Parc national de La Réunion ; Création de la Réserve naturelle marine	\N	\N	\N	f
43548	1021	TEXT	interests.locations.2.name	Le massif de la Fournaise	\N	\N	\N	f
43549	1021	TEXT	ecosystems.ecosystems.3.description	Aussi appelés Pandanaies, ces habitats sont formés par le Pimpin des Hauts (*Padanus montanus*), un petit arbre aux racines en échasses endémique de La Réunion, qui sert de support pour de nombreuses espèces de mousses, fougères et orchidées. Uniques au monde, ces zones humides remarquables se trouvent principalement sur les versants de l'Est et du Sud-est de l'île. La [Pandanaie de la Plaine des Palmistes](file:///C:/Users/DBLOTT~1/AppData/Local/Temp/depliant_pandanaie_def.pdf), particulièrement riche en faune et flore, fait l'objet d'un arrêté de protection de biotope.	\N	\N	\N	f
43550	1021	IMAGE	interests.locations.6.image	\N	1564	Image manquante	\N	f
43551	1021	IMAGE	species.1.image	\N	1299	*Lalage newtoni* © Jean-Philippe Siblet	\N	f
43552	1021	TEXT	events.5.date	2007	\N	\N	\N	f
43553	1021	TEXT	identity.marineArea	318 300	\N	\N	\N	f
43554	1021	TEXT	species.9.name	Le Papangue	\N	\N	\N	f
43555	1021	TEXT	events.8.date	2020	\N	\N	\N	f
43556	1021	IMAGE	interests.locations.0.image	\N	1478	Parc national de La Réunion © Rémy Poncet	\N	f
43557	1021	TEXT	species.6.name	Le Latanier rouge	\N	\N	\N	f
37435	1025	TEXT	understand.text	Observer la faune dans son milieu naturel est une chance et une expérience formidable. Cependant, sur terre comme en mer, déranger un animal peut le mettre en péril en occasionnant un stress important et une dépense d’énergie inutile. Il risque également d’abandonner son nid ou ses petits, se blesser, être plus facilement à la merci d’un prédateur…\n\nLes conséquences sont d’autant plus importantes lorsqu’il s’agit d’espèces très menacées, pour laquelle la survie de chaque individu compte.\n\nL'impact des chiens peut être catastrophique pour la faune sensible des outre-mer, que ce soit par prédation ou par le stress qu'ils occasionnent (poursuite, aboiements, destruction de nids,...). En Nouvelle-Calédonie, ils ont joué un rôle non-négligeable dans le déclin de la population de Cagous.\nDans la plupart des espaces protégés, leur présence, même tenus en laisse n'est pas autorisée. 	\N	\N	\N	f
37436	1025	IMAGE	action.cards.1.icon	\N	1128	bruits	\N	f
37437	1025	TEXT	action.cards.3.description	Si un animal me parait en détresse, avant toute action, je contacte un professionnel (centre de soin, gestionnaires de réserve) afin de connaitre la démarche la plus adaptée pour lui porter secours.	\N	\N	\N	f
37438	1025	TEXT	action.cards.2.description	Je tiens mon chien en laisse et je respecte la règlementation dans les lieux où sa présence n’est pas autorisée.	\N	\N	\N	f
37439	1025	TEXT	presentation.category	Sur terre et en mer	\N	\N	\N	f
37440	1025	TEXT	action.cards.1.description	Je limite les bruits (cris, musique…) pour que ma présence reste discrète.  	\N	\N	\N	f
37441	1025	TEXT	presentation.description	Pour ne pas perturber les occupants des milieux naturels, mieux vaut se faire discret et ne pas laisser de traces de son passage.	\N	\N	\N	f
37442	1025	TEXT	action.title	Pour profiter de la nature sans déranger ses occupants 	\N	\N	\N	f
37443	1025	TEXT	understand.quote	Une tortue en ponte est très sensible au dérangement, cela peut la conduire à abandonner son nid. 	\N	\N	\N	f
37444	1025	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
37445	1025	TEXT	action.cards.0.description	Je reste à distance des animaux sauvages que je rencontre et je ne cherche pas à les toucher	\N	\N	\N	f
38448	1020	IMAGE	species.3.image	\N	1239	*Laticauda sp.* © Hélène Udo	\N	f
38449	1020	TEXT	species.1.name	Le Cagou	\N	\N	\N	f
38450	1020	TEXT	species.7.name	La Sterne néreis	\N	\N	\N	f
38451	1020	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
38452	1020	TEXT	species.16.description	Le Corbeau calédonien ([*Corvus moneduloides*](https://www.endemia.nc/faune/fiche159)) est un oiseau commun, endémique, familier des forêts mais fréquentant également les milieux plus ouverts. Il est surtout réputé pour son intelligence, puisqu’il est capable de fabriquer et d’utiliser des outils, notamment pour attraper ses proies dans la cavité des arbres.  \n\nStatut dans la Liste rouge mondiale : préoccupation mineure. \n	\N	\N	\N	f
38453	1020	TEXT	species.4.name	*Amborella trichopoda*	\N	\N	\N	f
38454	1020	TEXT	identity.area	16 624	\N	\N	\N	f
38455	1020	TEXT	species.0.description	[*Sphaeropteris intermedia*](https://www.endemia.nc/flore/fiche106) est une espèce de fougère arborescente endémique parmi les plus grandes au monde, qui peut atteindre 35 mètres de haut. Commune sur le territoire, cette plante est utilisée en médecine traditionnelle et son tronc très solide est également utilisé pour la sculpture ou la confection de sagaies.\n\nStatut dans la Liste rouge mondiale : Préoccupation mineure.  \nNom en langues kanak : Groubaï (drubéa)\n	\N	\N	\N	f
38456	1020	TEXT	identity.highestPointName	Mont Panié	\N	\N	\N	f
38457	1020	TEXT	ecosystems.ecosystems.2.name	Les maquis miniers	\N	\N	\N	f
38458	1020	TEXT	ecosystems.ecosystems.5.name	Les herbiers de phanérogames marines	\N	\N	\N	f
38459	1020	TEXT	species.7.description	Ce petit oiseau marin présente un dos gris, un ventre blanc, une tête pourvue d'une calotte noire et un bec droit et pointu. Une sous-espèce de la Sterne néreis, ([*Sternula nereis exul*](https://www.endemia.nc/faune/fiche52)) niche sur les îlots de Nouvelle-Calédonie, notamment dans le Lagon Sud, vers Koumac et aux îles Chesterfield. Cette sous-espèce est très menacée localement du fait de ses faibles effectifs de populations.  \n  \nStatut dans la Liste rouge mondiale : non évalué. 	\N	\N	\N	f
38460	1020	TEXT	species.8.description	Le Niaouli ([*Melaleuca quinquenervia*](https://www.endemia.nc/flore/fiche445)), est un arbre utilisé en médecine et pour la construction, que l’on retrouve dans les milieux ouverts et anthropisés. Il se développe particulièrement bien dans les zones touchées par les incendies en raison de ses propriétés ignifuges. Indigène en Nouvelle-Calédonie, cette espèce a été introduite dans d’autres territoires comme la Guyane où elle présente un profil envahissant.\n\nStatut dans la Liste rouge mondiale : préoccupation mineure.  \nNoms en langues kanak : itachou (paicî), pichöö (xârâcùù), bé (drubéa)	\N	\N	\N	f
38461	1020	IMAGE	species.13.image	\N	1325	*Neogymnochrinus richeri* © Pierre Lozouet / IRD	\N	f
38462	1020	IMAGE	species.2.image	\N	1240	*Dugong dugong* © Hélène Udo	\N	f
38463	1020	TEXT	species.11.name	La Baleine à bosses	\N	\N	\N	f
38464	1020	IMAGE	ecosystems.ecosystems.4.image	\N	1339	 Mangrove © Christine Fort	\N	f
38465	1020	TEXT	species.3.description	Sur les huit espèces de Tricots rayés ([*Laticauda sp.*](https://www.endemia.nc/faune/fiche1104)) connues au niveau mondial, deux sont présentes en Nouvelle-Calédonie dont une endémique. Largement répandues sur le territoire, ces serpents marins se nourrissent dans l’eau mais reviennent sur terre pour se reposer, digérer et pondre. Bien que porteurs d'un venin mortel, ils ne sont pas agressifs et au contraire plutôt craintifs. De fait, les morsures sont très rares.\n\nStatut dans la Liste rouge mondiale pour les deux espèces présentes en Nouvelle-Calédonie : préoccupation mineure. 	\N	\N	\N	f
38466	1020	TEXT	species.1.description	Emblème de la Nouvelle-Calédonie, le Cagou ([*Rhynochetos jubatus*](https://www.endemia.nc/faune/fiche144)), est un oiseau endémique qui ne vole pas mais court très vite, et dont le cri ressemble à l’aboiement d’un chien. Il vit dans les forêts humides de moyenne et haute altitude. Cette espèce est intégralement protégée.\n\nStatut dans la Liste rouge mondiale : en danger.	\N	\N	\N	f
43558	1021	IMAGE	interests.locations.3.image	\N	1158	Tronc d’un arbre Bois de pomme à Mare Longue © Philippe Gourdain	\N	f
43559	1021	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
43560	1021	TEXT	interests.locations.3.name	La forêt de Mare-Longue	\N	\N	\N	f
37446	1026	IMAGE	presentation.file	\N	1470	affiche écogeste réduction consommation plastique	\N	f
37447	1026	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
37448	1026	IMAGE	action.cards.2.icon	\N	1133	jetable	\N	f
37449	1026	TEXT	presentation.name	Je réduis mes déchets et limite ma consommation de plastique	\N	\N	\N	f
37450	1026	IMAGE	action.cards.0.icon	\N	1131	sacs	\N	f
37451	1026	IMAGE	presentation.image	\N	1135	Jasmin Sessler / Unsplash	\N	f
37452	1026	TEXT	understand.text	Lorsqu’ils terminent dans la nature, nos déchets polluent durablement les milieux et nous finissons par les ingérer également au quotidien dans l’eau, l’air et la nourriture. Mais même lorsqu'ils sont collectés, leur impact sur l'environnement reste important : leur incinération génère une pollution de l'air et l'émission de gaz à effet de serre, l'enfouissement pollue durablement les sols et les eaux et s'avère rapidement problématique dans les petits territoires insulaires.\n\nLe pire ? Les plastique à usage unique : pour quelques minutes d’utilisation, au mieux ils grossiront le stock de déchets à traiter, au pire ils pollueront durablement les écosystèmes !\n\nLe recyclage est une solution, mais elle a ses limites : certaines matières ne sont pas recyclables, et pour les celles qui le sont les territoires d’outre-mer n’ont pas toujours la capacité de les collecter et les traiter (insuffisance d’infrastructures, éloignement ou difficultés d’accès à certaines zones), ce qui implique un export, lui aussi coûteux et polluant.\n\nPour améliorer notre cadre de vie et notre environnement, réduisons le volume de nos poubelles en respectant 5 grands principes : refuser, réduire, réutiliser, recycler, composter.\nDes programmes "zéro déchets" et de nombreuses ressources existent pour vous accompagner dans ces démarches.\n	\N	\N	\N	f
37453	1026	IMAGE	action.cards.1.icon	\N	1132	vrac	\N	f
37454	1026	TEXT	action.cards.2.description	Je fais la chasse aux produits à usages uniques : gobelets, pailles, touillettes, et je les remplace par des alternatives durables ou biodégradables.	\N	\N	\N	f
37455	1026	TEXT	presentation.category	Consommation	\N	\N	\N	f
37456	1026	TEXT	action.cards.1.description	Je privilégie les produits achetés en vrac. J'utilise mes propres contenants réutilisables. 	\N	\N	\N	f
37457	1026	TEXT	presentation.description	Même lorsqu'ils sont collectés correctement, l'impact de nos déchets sur l'environnement reste important. 	\N	\N	\N	f
28638	1014	TEXT	understand.paragraphs.1.text	Créée en 1999, l’[Initiative française pour les récifs coralliens (IFRECOR)](https://ifrecor.fr/) agit pour protection et la gestion durable des récifs coralliens, des herbiers et des mangroves dans les collectivités françaises d’outre-mer. Chaque collectivité abritant ces écosystèmes possède un comité local rassemblant les acteurs concernés par leur protection et leur gestion durable. L’initiative collective porte un plan d'action sur 5 ans qui couvre 6 axes stratégiques : planifier pour prévenir ; réduire les effets négatifs dus aux activités humaines, tout en assurant leur développement durable ; connaître et comprendre pour gérer ; informer et éduquer pour modifier les comportements ; développer les échanges et la coopération pour renforcer les synergies et valoriser les expériences. \n  \nDéclinaison française de l’Initiative internationale pour les récifs coralliens (ICRI), l’IFRECOR représente les territoires français au niveau international. Elle est présidée par les ministres de la transition écologique et des outre-mer, dont les services assurent le secrétariat.	\N	\N	\N	f
28639	1014	TEXT	understand.title2	Un état de santé hétérogène selon les territoires	\N	\N	\N	f
28640	1014	TEXT	presentation.descriptionTerritories	des récifs coralliens sont en diminution	\N	\N	\N	f
28641	1014	TEXT	understand.paragraphs.0.title	Les coraux en danger 	\N	\N	\N	f
43561	1021	TEXT	statistics.1.text	Création du Parc national de La Réunion	\N	\N	\N	f
43562	1021	IMAGE	species.4.image	\N	1300	*Pterodroma baraui* © Jean-Philippe Siblet	\N	f
37458	1026	TEXT	action.title	Pour commencer à réduire mes déchets : 	\N	\N	\N	f
37459	1026	TEXT	understand.quote	A l’échelle mondiale, un tiers des déchets plastiques se retrouve dans la nature. Seuls 9% des déchets plastiques sont recyclés dans le monde.	\N	\N	\N	f
37460	1026	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
37461	1026	TEXT	action.cards.0.description	Je refuse les sacs plastiques à usage unique, j'utilise des sacs réutilisables en tissus ou en matières naturelles.	\N	\N	\N	f
28642	1014	TEXT	understand.keyword	corail	\N	\N	\N	f
28643	1014	TEXT	ecogestures.title	Comment préserver les coraux à mon échelle ? 	\N	\N	\N	f
28644	1014	IMAGE	presentation.image	\N	1053	Récif corallien, Parc naturel marin de Mayotte © Marine Dekenen / OFB	\N	f
28645	1014	TEXT	understand.paragraphs.1.title	L’IFRECOR, une initiative pour préserver les récifs 	\N	\N	\N	f
38467	1020	TEXT	species.2.description	Le Dugong ([*Dugong dugong*](https://www.endemia.nc/faune/fiche5263)), aussi appelé « vache marine » est un mammifère marin herbivore qui passe la majeure partie de son temps à brouter les herbiers marins. Longtemps chassé et braconné, il est également vulnérable face à la dégradation des habitats marins et aux activités humaines. La population néo-calédonienne de dugongs est estimée à environ 700 individus. Un [plan d'action pour sa conservation](https://www.cen.nc/plan-actions-dugong) a été mis en place en 2010. Il est animé depuis 2017 par le Conservatoire d'espaces naturels de Nouvelle-Calédonie. \n\nStatut dans la Liste rouge mondiale : vulnérable. 	\N	\N	\N	f
43563	1021	TEXT	events.3.date	1708	\N	\N	\N	f
43564	1021	IMAGE	ecosystems.ecosystems.3.image	\N	1196	Image manquante	\N	f
43565	1021	IMAGE	species.3.image	\N	1306	*Mormopterus francoismoutoui* © Gildas Monnier / GCOI	\N	f
43566	1021	TEXT	species.1.name	L'Échenilleur de La Réunion	\N	\N	\N	f
43567	1021	TEXT	species.7.name	Le Tamarin des Hauts	\N	\N	\N	f
43568	1021	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
43569	1021	TEXT	species.4.name	Le Pétrel de Barau	\N	\N	\N	f
43570	1021	TEXT	identity.area	2 512	\N	\N	\N	f
38468	1020	TEXT	species.9.description	[*Syzygium acre*](https://www.endemia.nc/flore/fiche1027) est un arbre cauliflore principalement observé dans le sud de la Grande Terre. Ses feuilles de très grande taille – parfois plus d’un mètre de long – sont rouge à mauve lorsqu’elles sont juvéniles. Sa floraison est caractéristique : les fleurs, d’une coloration rouge à rose, se trouvent par petits groupes le long du tronc.\n\nStatut dans la Liste rouge mondiale : en danger. 	\N	\N	\N	f
47437	1031	TEXT	species.7.description	Deux espèces de palétuvier sont présentes dans les mangroves de Wallis. L'espèce la plus commune, [*Rhizophora samoensis*](https://inpn.mnhn.fr/espece/cd_nom/672293), présente des racines en échasses tandis que la seconde espèce, [*Bruguiera gymnorhiza*](https://inpn.mnhn.fr/espece/cd_nom/809530\n), possède des racines coudées émergeant du sol, appelées pneumatophores. L'écorce sombre de cette dernière, riche en tanins, est utilisée en artisanat pour teindre les tissus.  \n\nStatut sur la liste rouge mondiale : \n*Rhizophora samoensis* : quasi-menacée.\n*Bruguiera gymnorhiza* : préoccupation mineure.\n\nNoms locaux : *Bruguiera gymnorhiza* : togo, tongo (futunien, wallisien)\n	\N	\N	\N	f
38469	1020	TEXT	statistics.1.number	2e	\N	\N	\N	f
38470	1020	TEXT	species.12.name	Les Tortues marines	\N	\N	\N	f
38471	1020	TEXT	statistics.0.number	76%	\N	\N	\N	f
38472	1020	TEXT	statistics.2.number	plus de 400 	\N	\N	\N	f
38473	1020	IMAGE	interests.locations.4.image	\N	1316	Parc provincial de la Côte oubliée © Martial Dosdane	\N	f
38474	1020	TEXT	species.2.name	Le Dugong	\N	\N	\N	f
38475	1020	TEXT	risks.risks.1.name	Une règlementation environnementale plurielle	\N	\N	\N	f
38476	1020	TEXT	species.4.description	Arbuste des forêts humides,[*Amborella trichopoda*](https://www.endemia.nc/flore/fiche254) est un taxon relique, considéré comme la plus ancienne des plantes à fleurs, son origine étant évaluée à 135 millions d’années avant notre ère. Elle est endémique de Nouvelle-Calédonie.\n\nStatut dans la Liste rouge mondiale : Préoccupation mineure. 	\N	\N	\N	f
38477	1020	TEXT	ecosystems.ecosystems.0.name	Les forêts denses humides	\N	\N	\N	f
47438	1031	TEXT	species.8.description	Le faux-tabac ([*Heliotropium foertherianum*](https://inpn.mnhn.fr/espece/cd_nom/446830\n)) est un petit arbre indigène, présent dans de nombreuses îles du Pacifique sud, très commun en forêt littorale. Ses feuilles sont utilisées en médecine traditionnelle pour traiter les effets de la ciguatera, intoxication alimentaire induite par la consommation de poissons contaminés par une toxine produite par des micro-algues.  \n  \nStatut sur la Liste rouge mondiale : préoccupation mineure.\n\nNoms locaux : tauhuni, sinu (futunien)\n	\N	\N	\N	f
47439	1031	IMAGE	species.2.image	\N	1576	*Cheilinus undulatus* © Matthieu Junker	\N	f
47440	1031	IMAGE	ecosystems.ecosystems.4.image	\N	1529	Plongeur étudiant les herbiers sous-marins © Sandrine Job	\N	f
43571	1021	TEXT	species.0.description	Le Gecko vert de Manapany ([*Phelsuma inexpectata*](https://inpn.mnhn.fr/espece/cd_nom/528679\n)), est endémique de La Réunion et n'est présent que sur une bande de 11 km de long dans le sud de l’île. Ce gecko diurne arboricole s’observe notamment sur les vacoas ([*Pandanus utilis*](https://inpn.mnhn.fr/espece/cd_nom/639093\n)). Considéré en danger critique d’extinction, il est protégé et fait l’objet d’un [Plan national d’action](http://www.reunion.developpement-durable.gouv.fr/le-pna-des-geckos-verts-de-la-reunion-a981.html) avec le Gecko vert de bourbon ([*Phelsuma  borbonica*](https://inpn.mnhn.fr/espece/cd_nom/432597)), également menacé.\n\nStatut dans la Liste rouge des reptiles de La Réunion : en danger critique. 	\N	\N	\N	f
47441	1031	TEXT	species.3.description	La Roussette du Pacifique ([*Pteropus tonganus*](https://inpn.mnhn.fr/espece/cd_nom/459607)) est une espèce de chauve-souris commune sur les trois îles. Elle joue un rôle clef dans la dissémination des gros fruits charnus de végétaux indigènes et donc dans la dynamique forestière. Si l’espèce n’est pas considérée comme menacée dans l'archipel, la pression de chasse sur les roussettes peut être importante. \n  \nStatut sur la Liste rouge mondiale : préoccupation mineure. 	\N	\N	\N	f
43572	1021	IMAGE	interests.locations.5.image	\N	1479	Poissons-papillons à La Réunion © Philippe Bourjon	\N	f
43573	1021	TEXT	identity.highestPointName	Piton des Neiges	\N	\N	\N	f
35068	1017	TEXT	answer	Les écogestes, ce sont tous ces changements de comportement individuels qui permettent de réduire son impact sur l’environnement. Faire attention à son utilisation énergétique, faire les bons choix de consommation, mieux gérer ses déchets, consommer moins de viande, etc. des plus petits gestes aux grands changements, chacun est acteur de la préservation de l’environnement et peut limiter son impact. La multiplication de ces comportements individuels peut entraîner des changements notables à plus grande échelle !\n\nTous ces gestes ne doivent pas faire oublier que de profonds changements de société seront nécessaire pour limiter les risques liés au déclin de la biodiversité et au changement climatique. Ils représentent des actions et des changements de comportements nécessaires, mais doivent être accompagnés de politiques environnementales à la hauteur des enjeux.  \nLa troisième Stratégie nationale pour la biodiversité engage les territoires français pour la prochaine décennie à enrayer le déclin de la biodiversité. Des concertations territoriales citoyennes se déroulerons au cours de l'année 2021. Participez et retrouvez toutes les informations sur [biodiversité.gouv.fr](https://biodiversite.gouv.fr/)	\N	\N	\N	f
43574	1021	TEXT	ecosystems.ecosystems.2.name	Les récifs coralliens	\N	\N	\N	f
47442	1031	TEXT	species.1.description	L’archipel compterait environ une quinzaine de reptiles indigènes, en majorité des lézards, mais un serpent indigène, le Boa du Pacifique ([*Candoia bibroni*](https://inpn.mnhn.fr/espece/cd_nom/456357)), est présent sur Alofi.  \n  \nStatut sur la Liste rouge mondiale : préoccupation mineure	\N	\N	\N	f
43575	1021	TEXT	species.7.description	Le Tamarin des Hauts ([*Acacia heterophylla*](https://inpn.mnhn.fr/espece/cd_nom/705753\n)) se trouve principalement en forêt humide de montagne entre 1100 et 1700 mètres d'altitude. Il peut atteindre 25 mètres de haut mais il est vulnérable aux cyclones en raison de son enracinement peu profond. Il s’agit d’une espèce endémique de l’île.\n\nStatut dans la Liste rouge de la flore vasculaire de La Réunion : préoccupation mineure. 	\N	\N	\N	f
43576	1021	TEXT	species.8.description	Le Bois d’Ortie ([*Obetia ficifolia*](https://inpn.mnhn.fr/espece/cd_nom/706579\n)) est une espèce rare et endémique des Mascareigne, qu’on retrouve dans les forêts sèches et semi-sèches. Il doit son nom à sa capacité à provoquer des irritations de la peau. Il est l’hôte d’un papillon endémique, le [*Salamis augustina augustina*](https://inpn.mnhn.fr/espece/cd_nom/458507), qui n’a cependant pas été observé depuis 2005, ce qui laisse à penser à sa disparition. Dans l’espoir de le voir réapparaitre, des plantations de bois d’Ortie sont réalisées notamment sur le massif de la Grande Chaloupe.\n\nStatut dans la Liste rouge de la flore vasculaire de La Réunion : en danger. 	\N	\N	\N	f
43577	1021	IMAGE	species.2.image	\N	1160	*Megaptera novaeangliae* © Laurent Bouveret	\N	f
43578	1021	TEXT	interests.locations.6.name	Le massif de la Roche Écrite	\N	\N	\N	f
35069	1017	TEXT	other.title	Retrouvez d'autres écogestes sur	\N	\N	\N	f
35070	1017	CHECKBOX	shadowed	false	\N	\N	\N	f
35071	1017	IMAGE	other.image	\N	1257	logo	\N	f
35072	1017	TEXT	other.text	Biodiversité Tous Vivants !	\N	\N	\N	f
35073	1017	TEXT	title	Adaptons nos comportement pour préserver la biodiversité	\N	\N	\N	f
31589	1022	TEXT	events.2.description	Fermeture naturelle de l’isthme	\N	\N	\N	f
31590	1022	TEXT	events.3.description	Première étude publiée sur la flore de Saint-Pierre et Miquelon (thèse de pharmacie d’Alphonse Gaulthier)	\N	\N	\N	f
31591	1022	IMAGE	identity.image	\N	1109	L'étang du Bois brûlé © Nathalie de Lacoste	\N	f
31592	1022	TEXT	events.7.description	Projet de Réserve naturelle nationale sur le Grand Barachois, finalement abandonné	\N	\N	\N	f
31593	1022	TEXT	events.7.date	1988 - 1992 	\N	\N	\N	f
31594	1022	TEXT	interests.locations.0.name	Le Grand Barachois	\N	\N	\N	f
28646	1014	TEXT	understand.paragraphs.0.text	Les coraux sont des organismes très fragiles : lorsqu’ils sont soumis à un stress, les polypes expulsent leurs algues, ce qui provoque le blanchissement du corail et finit par entrainer sa mort si cette situation est prolongée.\nDe nombreuses menaces pèsent sur les récifs coralliens : le changement climatique provoque l’augmentation de la température et l'acidification de l’eau, qui soumettent les coraux à un stress important. Les polluants issus des activités humaines, certaines techniques de pêche ou encore les activités touristiques ont également un lourd impact sur les récifs. Ces facteurs se conjuguent aux évènements naturels (cyclones, consommation massive par l’étoile de mer [*Acanthaster planci*](https://inpn.mnhn.fr/espece/cd_nom/444461)) et aggravent leurs effets.  \n\nLes coraux sont également très sensibles aux maladies, comme la maladie de la bande blanche ou la récente maladie corallienne liée à la perte de tissus (SCTLD), identifiée pour la première fois en Floride en 2014 et observée en Guadeloupe en 2020.	\N	\N	\N	f
28647	1014	IMAGE	understand.image	\N	1309	 Le stress provoque le blanchissement des coraux (ici à Mayotte) © Marine Dedeken / OFB	\N	f
28648	1014	TEXT	presentation.description	des récifs coralliens sont en diminution dans les territoires d'outre-mer	\N	\N	\N	f
28649	1014	TEXT	presentation.logoUrl	https://naturefrance.fr/indicateurs/evolution-de-letat-des-recifs-coralliens	\N	\N	\N	f
31595	1022	TEXT	events.0.description	Prise de possession française des îles par Jacques Cartier	\N	\N	\N	f
31596	1022	TEXT	events.1.description	Première installation permanente des pêcheurs bretons, normands et basques	\N	\N	\N	f
31597	1022	TEXT	events.8.description	Création du Conseil Scientifique Territorial du Patrimoine Naturel (CSTPN) et projet de Réserve naturelle nationale du Grand Colombier, gelé pour le moment	\N	\N	\N	f
31598	1022	TEXT	events.9.description	Ouverture de la maison de la nature et de l'environnement	\N	\N	\N	f
31599	1022	IMAGE	ecosystems.image	\N	1265	Paysage enneigé de Saint-Pierre-et-Miquelon © Bruno Letournel	\N	f
31600	1022	TEXT	identity.species	2 083	\N	\N	\N	f
31601	1022	IMAGE	ecosystems.ecosystems.0.image	\N	1264	Cap de Miquelon © Nathalie de Lacoste	\N	f
31602	1022	TEXT	species.8.name	Le Cerf de Virginie 	\N	\N	\N	f
31603	1022	TEXT	events.6.description	Disparition de l’archipel du Lagopède des saules (*Lagopus lagopus*), oiseau caractéristique des forêts boréales	\N	\N	\N	f
47443	1031	TEXT	species.2.description	648 espèces de poissons récifaux et lagonaires sont inventoriés dans les eaux de Wallis, dont le Napoléon ([*Cheilinus undulatus*](https://inpn.mnhn.fr/espece/cd_nom/423718*)). C'est l’un des plus grands poissons osseux des récifs coralliens, il peut atteindre plus de 2 m de long. L’espèce présente un hermaphrodisme successif appelée « protogynie » : les individus sont d’abord des femelles puis deviennent des mâles au cours de leur vie (autour de 15 ans selon les estimations). Le mâle est reconnaissable à sa bosse sur le front. Le Napoléon est le seul poisson marin figurant sur la liste des espèces protégées de Wallis-et-Futuna.  \n  \nStatut sur la Liste rouge mondiale : en danger.	\N	\N	\N	f
47444	1031	TEXT	species.9.description	Le mûrier à papier, ([*Broussonetia papyrifera*](https://inpn.mnhn.fr/espece/cd_nom/86817)), est un arbuste originaire d'Asie du Sud-Est introduit dans de nombreuses îles du Pacifique. Son écorce est utilisé dans la fabrication du traditionnel *tapa*, une étoffe végétale peinte avec des encres issues de matières naturelles, généralement de grande taille (plusieurs mètres) et dont les usages sont variés (habits traditionnels, cérémonies coutumières). \n  \nStatut sur la Liste rouge mondiale : préoccupation mineure.\n  \nNoms locaux : tutu, lafi	\N	\N	\N	f
31604	1022	TEXT	events.6.date	1985	\N	\N	\N	f
31605	1022	TEXT	events.4.description	Introduction volontaire du Lièvre d’Amérique pour la chasse	\N	\N	\N	f
31606	1022	TEXT	events.5.description	Introduction du Cerf de Virginie en 1953 à des fins cynégétiques	\N	\N	\N	f
31607	1022	TEXT	interests.locations.2.name	Le Grand Colombier	\N	\N	\N	f
31608	1022	TEXT	ecosystems.ecosystems.3.description	Espèces pionnières et graminées colonisent ces milieux littoraux souvent fragilisés par les dégradations (travaux, incendies, pâturages). Espèce typique de ces milieux dunaires, l’oyat (ou Ammophile à ligule courte, *Ammophila breviligulata*) joue un rôle essentiel dans la fixation des dunes et limite l’érosion. En arrière dune, une grande diversité d’espèces indigènes, parfois très rares, cohabitent avec des graminées introduites et naturalisées.	\N	\N	\N	f
31609	1022	IMAGE	species.1.image	\N	1229	Macareux moine © Bruno Letournel	\N	f
47445	1031	TEXT	statistics.1.number	230 km	\N	\N	\N	f
47446	1031	TEXT	statistics.0.number	19	\N	\N	\N	f
47447	1031	TEXT	statistics.2.number	369	\N	\N	\N	f
47448	1031	TEXT	species.2.name	Le Napoléon	\N	\N	\N	f
47449	1031	TEXT	risks.risks.1.name	La menace des espèces exotiques envahissantes	\N	\N	\N	f
38478	1020	TEXT	species.5.description	Les Kaoris, sont des arbres de grande taille, dont le tronc peut atteindre un diamètre impressionnant. On peut ainsi observer un spécimen au tronc de 2,70 m de diamètre dans le parc de la Rivière Bleu.  \nLa répartition du Kaori du mont Panié ([*Agathis montana*](https://www.endemia.nc/flore/fiche55)) est restreinte à la forêt de nuage du massif du même nom, tandis que le Kaori de forêt ([*Agathis lanceolata*](https://www.endemia.nc/flore/fiche57)) s'observe du sud de la Grande Terre jusqu'à Poya, voir Touho en Province Nord. Une troisième espèce ([*Agathis ovata*](https://www.endemia.nc/flore/fiche56)) est cantonnée à la moitié Sud de la Grande Terre. \n\nStatut dans la Liste rouge mondiale pour *Agathis montana* : en danger critique ; pour *Agathis lanceolata* : vulnérable.  \nNoms en langues kanak : Kaori du Mt Panié : Dayu Biik (nemi) ; Kaori de forêt : mugé (xârâcùù)	\N	\N	\N	f
31610	1022	TEXT	events.5.date	1953	\N	\N	\N	f
31611	1022	TEXT	identity.marineArea	12 300	\N	\N	\N	f
31612	1022	TEXT	events.8.date	2007	\N	\N	\N	f
31613	1022	IMAGE	interests.locations.0.image	\N	1217	Grand Barachois © Nathalie De Lacoste	\N	f
31614	1022	TEXT	species.6.name	La Linnée boréale	\N	\N	\N	f
31615	1022	IMAGE	interests.locations.3.image	\N	1236	La Vallée du Milieu © Nathalie De Lacoste	\N	f
31616	1022	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
31617	1022	TEXT	interests.locations.3.name	La Vallée du Milieu	\N	\N	\N	f
31618	1022	TEXT	statistics.1.text	des habitants de l'archipel résident à Saint-Pierre	\N	\N	\N	f
31619	1022	TEXT	events.9.date	2017	\N	\N	\N	f
31620	1022	IMAGE	species.4.image	\N	1223	Sapin Baumier © Nathalie De Lacoste	\N	f
31621	1022	TEXT	events.3.date	1866	\N	\N	\N	f
31622	1022	IMAGE	ecosystems.ecosystems.3.image	\N	1220	Dunes de sable sur l'isthme © Nathalie de Lacoste	\N	f
31623	1022	IMAGE	species.3.image	\N	1226	Pluvier siffleur en période de reproduction © Patrick Hacala	\N	f
31624	1022	TEXT	species.1.name	Le Macareux moine 	\N	\N	\N	f
31625	1022	TEXT	species.7.name	Les Botryches	\N	\N	\N	f
31626	1022	TEXT	interests.title	Lieux d’intérêt	\N	\N	\N	f
31627	1022	TEXT	species.4.name	Le Sapin baumier	\N	\N	\N	f
31628	1022	TEXT	identity.area	242	\N	\N	\N	f
31629	1022	TEXT	species.0.description	Une vingtaine d'espèces de mammifères marins fréquentent les eaux de Saint-Pierre et Miquelon, dont deux espèces de phoques : le Phoque veau-marin ([*Phoca vitulina*](https://inpn.mnhn.fr/espece/cd_nom/60811)) et le Phoque gris ([*Halichoerus grypus*](https://inpn.mnhn.fr/espece/cd_nom/60776)). C’est sur les bancs de sable de la lagune du Grand Barachois qu’ils se regroupent en plus grand nombre, mais peuvent être observés partout sur les côtes de l’archipel.\n\nStatut dans la Liste rouge mondiale : préoccupation mineure pour les deux espèces. 	\N	\N	\N	f
31630	1022	TEXT	identity.highestPointName	Morne de la Grande Montagne	\N	\N	\N	f
31631	1022	TEXT	ecosystems.ecosystems.2.name	La forêt boréale 	\N	\N	\N	f
31632	1022	TEXT	species.7.description	Dans les pelouses sableuses d’arrière dune se cachent plusieurs espèces rares de botryches, comme le Botryche à feuille de rue ([*Botrychium multifidum*](https://inpn.mnhn.fr/espece/cd_nom/121461\n)). Il s’agit de petites fougères vivaces dont le nom provient du grec « botrus » signifiant grappes, qui se réfère à l’aspect de ses fructifications.  \n  \nStatut dans la Liste rouge mondiale : espèce non évaluée (pour *Botrychium multifidum*). 	\N	\N	\N	f
38479	1020	TEXT	species.6.description	Le Gecko géant de Nouvelle-Calédonie ([*Rhacodactylus leachianus*](https://www.endemia.nc/faune/fiche1024)) est le plus grand gecko au monde. D’un aspect massif, avec une queue courte et une peau plissée grise à brune, il peut atteindre 25,5 cm de long. Nocturne et arboricole, on le rencontre dans les forêts humides, et en densité plus importante sur les îlots non envahis par les chats. Il est encore régulièrement braconné pour le marché de la terrariophilie.\n\nStatut dans la Liste rouge mondiale : préoccupation mineure. 	\N	\N	\N	f
38480	1020	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
38481	1020	TEXT	events.0.date	Entre -100 et -55 millions d’années	\N	\N	\N	f
38482	1020	TEXT	identity.populationYear	2017	\N	\N	\N	f
38483	1020	IMAGE	species.5.image	\N	1319	*Agathis sp.* © Vanessa Hequet	\N	f
38484	1020	TEXT	statistics.0.text	de la flore est endémique	\N	\N	\N	f
38485	1020	TEXT	ecosystems.ecosystems.1.name	Les récifs coralliens et les lagons	\N	\N	\N	f
38486	1020	TEXT	events.2.date	1940 	\N	\N	\N	f
38487	1020	TEXT	identity.presentation	La Nouvelle-Calédonie se caractérise par le taux d'endémisme particulièrement élevé de sa flore (76 % d'espèces endémiques) et de sa faune terrestre, ainsi que l'existence d'écosystèmes terrestres remarquables : forêt humide, maquis minier, zones humides... La biodiversité marine est également d'une richesse exceptionnelle avec plus de 20 000 espèces recensées, dont plus de 400 espèces de coraux, plus de 2 000 espèces de poissons et 30 espèces de mammifères marins. L'archipel abrite la seconde plus grande barrière récifale au monde, longue de 1 600 km et quasi-continue.  \nCette richesse est reconnue au niveau international par l'inscription des lagons de Nouvelle-Calédonie au Patrimoine mondial de l'UNESCO ou encore des lacs du Grand Sud sur la liste Ramsar. 	\N	\N	\N	f
38488	1020	TEXT	identity.population	271 407	\N	\N	\N	f
38489	1020	TEXT	species.3.name	Les Tricots rayés	\N	\N	\N	f
38490	1020	IMAGE	species.8.image	\N	1321	*Melaleuca quinquenervia* © Christine Fort	\N	f
38491	1020	TEXT	species.0.name	*Sphaeropteris intermedia*	\N	\N	\N	f
38492	1020	TEXT	events.4.date	2008-2009	\N	\N	\N	f
38493	1020	IMAGE	interests.locations.2.image	\N	1238	Chutes de la Madeleine, Nouvelle-Calédonie © Hélène Udo	\N	f
38494	1020	IMAGE	ecosystems.ecosystems.2.image	\N	1329	Maquis minier © Vanessa Hequet	\N	f
31633	1022	TEXT	species.8.description	Peu de mammifères terrestres sont indigènes de l’archipel. Le Cerf de Virginie ([*Odocoileus virginianus*](https://inpn.mnhn.fr/espece/cd_nom/645125\n)) a été introduit à Miquelon et Langlade en 1953 pour la chasse. Grâce à leurs importantes capacités d’adaptation et à l’absence de prédateur naturel, les populations de cerfs se sont largement développées et freinent désormais fortement la régénération de la forêt boréale. L’espèce n'est pas présente sur l’île de Saint-Pierre. \n  \nStatut dans la Liste rouge mondiale : préoccupation mineure.	\N	\N	\N	f
31634	1022	IMAGE	species.2.image	\N	1228	Lièvre arctique © Daniel Koelsch	\N	f
31635	1022	TEXT	species.3.description	Le Pluvier siffleur ([*Charadrius melodus*](https://inpn.mnhn.fr/espece/cd_nom/441752\n)) est un petit oiseau limicole, dont la couleur du plumage se confond avec le sable et les graviers des plages où il se nourrit et niche. Il est actuellement le limicole nicheur le plus menacé dans l'archipel, à cause du dérangement important causé par l’activité humaine au niveau de l’isthme entre Miquelon et Langlade, site à haute fréquentation locale et touristique pendant l’été. Faute de dispositifs de protection efficaces la dernière nichée observée en 2019 a été un échec, et un seul individu a été observé en 2020.  \n  \nStatut dans la Liste rouge mondiale : quasi menacé. 	\N	\N	\N	f
31636	1022	TEXT	species.1.description	Le Macareux moine ([*Fratercula arctica*](https://inpn.mnhn.fr/espece/cd_nom/3402\n)) est l’une des plus importantes populations d’oiseaux nicheurs de l’archipel, avec environ 10 000 couples présents sur l'îlot du Grand Colombier.\n\nStatut dans la Liste rouge mondiale : vulnérable. 	\N	\N	\N	f
38495	1020	IMAGE	species.11.image	\N	1324	*Megaptera novaeangliae* © Opération Cétacé	\N	f
31637	1022	TEXT	species.2.description	Le Lièvre américain ([*Lepus americanus*](https://inpn.mnhn.fr/espece/cd_nom/456604\n)) et le Lièvre arctique ([*Lepus arcticus*](https://inpn.mnhn.fr/espece/cd_nom/61707\n)) ont été introduits pour la chasse respectivement en 1881 et 1982. Présents sur les trois îles, ils occupent des milieux différents : le Lièvre américain se concentre dans les milieux forestiers, sur lesquels il exerce une pression non négligeable, tandis que le Lièvre arctique préfère la végétation de la toundra, formée d’arbustes à éricacées, de lichens et de mousses.  \n  \nStatut dans la Liste rouge mondiale : préoccupation mineure pour les deux espèces. 	\N	\N	\N	f
31638	1022	TEXT	statistics.1.number	86 %  	\N	\N	\N	f
31639	1022	TEXT	statistics.0.number	La seule 	\N	\N	\N	f
31640	1022	TEXT	statistics.2.number	1 000	\N	\N	\N	f
31641	1022	IMAGE	interests.locations.4.image	\N	1235	Saint-Pierre © Laurent Malthieux	\N	f
31642	1022	TEXT	species.2.name	Les lièvres	\N	\N	\N	f
31643	1022	TEXT	species.4.description	Le Sapin baumier ([*Abies balsamea*](https://inpn.mnhn.fr/espece/cd_nom/717022\n)) est le conifère dominant de la forêt boréale de Saint-Pierre-et-Miquelon (plus de 80% du peuplement). Caractéristique des forêts boréales nord-américaines, il est parfois accompagné d’autres conifères moins fréquents (Epicéa blanc, Epicéa noir, Mélèze laricin…). En plus de subir des attaques fréquentes de pestes forestières indigènes, il est actuellement menacé par un parasite introduit : le puceron lanigère ([*Adelges piceae*](https://inpn.mnhn.fr/espece/cd_nom/893616\n)).\n\nStatut dans la Liste rouge mondiale : préoccupation mineure. 	\N	\N	\N	f
31644	1022	TEXT	ecosystems.ecosystems.0.name	Les landes et la toundra	\N	\N	\N	f
31645	1022	TEXT	species.5.description	La Diapensine de Laponie ([*Diapensia lapponica*](https://inpn.mnhn.fr/espece/cd_nom/761885\n)) est une plante typique de la toundra arctico-alpine de l’archipel. Sa forme en coussinet est adaptée aux conditions climatiques très ventées de ce milieu.\n\nStatut dans la Liste rouge mondiale : espèce non évaluée. 	\N	\N	\N	f
31646	1022	TEXT	species.6.description	Reconnaissable à sa floraison en clochettes roses, la Linnée boréale ([*Linnaea borealis*](https://inpn.mnhn.fr/espece/cd_nom/106260\n)) est une herbacée abondante dans la forêt boréale.  \n  \nStatut dans la Liste rouge mondiale : espèce non évaluée. 	\N	\N	\N	f
31647	1022	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
31648	1022	TEXT	events.0.date	1535	\N	\N	\N	f
31649	1022	TEXT	identity.populationYear	2017	\N	\N	\N	f
31650	1022	IMAGE	species.5.image	\N	1230	Diapensine de Laponie © DTAM 975	\N	f
31651	1022	TEXT	statistics.0.text	forêt boréale française	\N	\N	\N	f
31652	1022	TEXT	ecosystems.ecosystems.1.name	Les marais tourbeux et les tourbières	\N	\N	\N	f
28734	1012	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
47450	1031	TEXT	species.4.description	Quatre espèces de gobies d’eau douce endémiques de Futuna ont été récemment découvertes et décrites :[*Stenogobius keletaona*](https://inpn.mnhn.fr/espece/cd_nom/641370\n), [*Smilosicyopus sasali*](https://inpn.mnhn.fr/espece/cd_nom/655131), [*Akihito futuna*](https://inpn.mnhn.fr/espece/cd_nom/641365\n) et [*Stiphodon rubromaculatus*](https://inpn.mnhn.fr/espece/cd_nom/641369\n). Ces petits poissons vivent principalement au fond des cours d’eau où ils se collent au substrat grâce à leurs nageoires pelviennes leur servant de ventouse. Chaque espèce ne se retrouve que dans une ou deux rivières de Futuna.  \n  \nStatut sur la Liste rouge mondiale : \n*Stenogobius keletaona* : vulnérable.\n*Smilosicyopus sasali* : en danger.\n*Akihito futuna* : en danger critique.\n*Stiphodon rubromaculatus* : en danger critique.	\N	\N	\N	f
28735	1012	TEXT	understand.text2	Ces milieux ont une importance au regard des services écosystémiques qu’ils procurent aux humains : régulation des crues et des inondations, protection des côtes de l’érosion et des tempêtes, épuration des eaux...\nSi des phénomènes naturels tels que les cyclones peuvent impacter les mangroves, de nombreuses causes de leur dégradation ont une origine humaine : changement climatique, artificialisation, exploitation intensive de ses ressources (bois, chasse, etc.), dépôts d’ordures, déversement des eaux usées, pollutions, pression touristique, etc. 	\N	\N	\N	f
28736	1012	TEXT	understand.text1	La mangrove est un écosystème forestier constitué principalement d'arbres appelés palétuviers, et se trouvant dans la zone de balancement des marées. Espace de transition entre le milieu terrestre et le milieu marin, cet écosystème abrite de nombreuses espèces qui en sont dépendantes pour une partie ou la totalité de leur cycle de vie.\n\nOn trouve des mangroves dans tous les territoires tropicaux d’outre-mer français, à l’exception de l’île de La Réunion. Au total, on estime leur superficie à 91 096 ha, la grande majorité se trouvant en Guyane et en Nouvelle-Calédonie. Cependant, en Polynésie, cet écosystème n’est pas présent naturellement : une espèce de palétuvier, [*Rhizophora stylosa*](https://inpn.mnhn.fr/espece/cd_nom/447469), a été introduite volontairement dans les années 1930, et s’est ensuite propagée à l’ensemble des îles de la Société, au détriment de certains écosystèmes natifs. 	\N	\N	\N	f
28737	1012	TEXT	territories.title	Surface couverte par la mangrove	\N	\N	\N	f
28738	1012	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
28739	1012	TEXT	understand.title1	La mangrove, un écosystème protecteur	\N	\N	\N	f
31653	1022	TEXT	events.2.date	18<sup>e</sup> siècle 	\N	\N	\N	f
31654	1022	TEXT	identity.presentation	Au sud de l'île de Terre Neuve (Canada), l'archipel se compose de la petit île de Saint-Pierre, où se concentre la majorité de la population, et des îles de Miquelon et Langlade, plus sauvages et préservées. Situé à la confluence du courant froid du Labrador et des eaux plus chaudes du Gulf Stream, l'archipel présente une biodiversité unique en France et une myriade d'écosystèmes, dont la seule forêt boréale française, de très importantes populations d'oiseaux marins et une grande richesse sous-marine.	\N	\N	\N	f
31655	1022	TEXT	identity.population	6 274	\N	\N	\N	f
31656	1022	TEXT	species.3.name	Le Pluvier siffleur	\N	\N	\N	f
31657	1022	IMAGE	species.8.image	\N	1263	Cerf de Virginie © Bruno Letournel	\N	f
47451	1031	TEXT	ecosystems.ecosystems.0.name	La forêt humide	\N	\N	\N	f
31658	1022	TEXT	species.0.name	Les phoques	\N	\N	\N	f
31659	1022	TEXT	events.4.date	1881	\N	\N	\N	f
31660	1022	IMAGE	interests.locations.2.image	\N	1233	L'îlot du Grand Colombier © Nathalie De Lacoste	\N	f
31661	1022	IMAGE	ecosystems.ecosystems.2.image	\N	1110	Forêt boréale © Nathalie de Lacoste	\N	f
31662	1022	TEXT	interests.locations.0.description	Cette lagune de 1 000 ha est bordée de marais et communique avec la mer par un goulet au sud-est. La lagune et les marais qui la bordent sont d’une importante richesse tant faunistique que floristique. Ses bancs de sable accueillent notamment la plus importante colonie reproductrice de phoques veaux-marins du territoire français. Un plan de gestion du site a été validé en 2011 visant à y protéger les espaces naturels remarquables tout en assurant autant que possible leur ouverture au public.	\N	\N	\N	f
31663	1022	TEXT	interests.locations.2.description	Cet ilot situé au nord de l’île de Saint-Pierre est un site de nidification remarquable. Il accueille une grande part des populations d’oiseaux marins nicheuses de l’archipel, voire la totalité des couples pour certaines espèces comme l’Océanite cul-blanc ou le Macareux moine. Pour ces deux espèces, il s’agit de colonies parmi les plus importantes au niveau mondial. 	\N	\N	\N	f
31664	1022	TEXT	interests.locations.1.description	Cette bande de sable de 12 km de long relie les îles de Miquelon et Langlade depuis la fin du 18<sup>e</sup> siècle. Les dunes colonisées par la végétation sont désormais longées par une piste permettant d'accéder à l'île de Langlade, habitée uniquement en période estivale.	\N	\N	\N	f
31665	1022	TEXT	ecosystems.ecosystems.3.name	Les dunes sableuses et cordons de galets	\N	\N	\N	f
31666	1022	TEXT	identity.subtitle	Un climat subarctique, froid et humide	\N	\N	\N	f
47452	1031	TEXT	species.5.description	Le Suka ([*Cyrtandra futunae*](https://inpn.mnhn.fr/espece/cd_nom/821352\n)) est l’une des 7 espèces végétales endémiques de l’archipel. Arbuste de sous-bois et de lisière de forêts humides, il présente des grandes feuilles simples à marge denticulées et de nombreuses petites fleurs blanches. Considéré comme peu commun à Futuna et rare à Alofi, il n’est pas présent à Wallis. \n \nStatut sur la liste rouge mondiale : non évalué.\n	\N	\N	\N	f
47453	1031	TEXT	species.6.description	Ce terme peut désigner deux espèces d'arbres du genre Aglaia : [*A. samoaensis*](https://inpn.mnhn.fr/espece/cd_nom/889358\n) et [*A. saltatorum*](https://inpn.mnhn.fr/espece/cd_nom/822659\n). Leurs fleurs sont utilisées traditionnellement pour réaliser des colliers et parfumer l’huile de coco. Leur écorce est également utilisée dans la médecine traditionnelle. *A. samoaensis*, indigène, est présente sur les trois îles bien que rare, tandis que *A. saltatorum* a probablement été introduite sur Futuna et Wallis, où elle est commune car cultivée. \n\nStatut sur la Liste rouge mondiale : \n*A. samoaensis* : quasi menacé \n*A. saltatorum* : vulnérable  \n  \nNoms locaux : *A. samoaensis* : langakali (wallisien, futunien) ; *A. saltatorum* : langakali uto, uto (futunien), polo uto (wallisien). 	\N	\N	\N	f
47454	1031	CHECKBOX	identity.shadowed	true	\N	\N	\N	f
47455	1031	TEXT	events.0.date	-22 millions d'années	\N	\N	\N	f
31667	1022	IMAGE	species.7.image	\N	1286	*Botrychium multifidum* © Serge Muller	\N	f
31668	1022	TEXT	species.5.name	La Diapensine	\N	\N	\N	f
31669	1022	TEXT	risks.risks.0.description	Les menaces pesant sur la biodiversité de Saint-Pierre-et-Miquelon sont nombreuses. Comme tous les territoires d’outre-mer, l’archipel subit la présence d’espèces exotiques envahissantes terrestres : le puceron lanigère (*Adelges piceae*), la Renouée du Japon (*Reynoutria japonica*) et le Séneçon Jacobée (*Jacobaea vulgaris*) sont les plus impactant.  \nLa forêt boréale, sous la pression combinée des herbivores introduits, des pathogènes et du réchauffement climatique, perd en moyenne une vingtaine d'hectares par an, et son état de conservation n'est guère rassurant. \n\nAu niveau marin, depuis l’effondrement des populations de morue des bancs de Terre-Neuve par la surpêche dans les années 70 à 90, la pression de la pêche a diminué, cependant la pêche au filet du Saumon Atlantique capture accidentellement de nombreux oiseaux, tortues et mammifères marins. Les espèces exotiques marines sont également une préoccupation, en particulier les populations de Crabe vert (*Carcinus maenas*), en augmentation.\n\nLa chasse est une question délicate sur l'archipel. Concernant les mammifères introduits, elle permet d'un côté leur régulation, mais de l'autre elle justifie également leur maintien. Quant à la chasse aux oiseaux migrateurs, elle peut freiner l'implantation de colonies nicheuses comme celles de l’Eider à duvet (*Somateria mollisima*).\n\nLe territoire est pour le moment le seul d’outre-mer français à ne disposer d’aucun dispositif de protection réglementaire (hormis les réserves de chasse et de faune sauvage). Après l'abandon d'un premier projet de Réserve naturelle du Grand Barachois au début des années 90, un projet de création de Réserve naturelle sur le Grand et le Petit Colombier a été lancé en 2007. Plaçant sous protection une surface terrestre de 47 ha et une zone maritime de 420 ha, il permettrait de préserver ce site de nidification remarquable. Malgré un avis favorable du Conseil national de protection de la nature, ce projet a été mal perçu par les populations locales qui craignaient des contraintes sur leurs activités traditionnelles, c’est pourquoi le projet est gelé pour le moment.\n\nSur l’archipel, 40 Zones naturelles d'intérêt écologique, faunistique et floristique (ZNIEFF), abritant au moins une espèce ou un habitat naturel remarquable ou rare, ont été délimitées. Cela couvre 89 % du territoire terrestre et traduit la richesse et la valeur écologique des écosystèmes de ces îles, toutefois ce statut n'engendre pas de protection juridique. Actuellement, seules des espèces de chauves-souris, de mammifères marins, d’oiseaux et de tortues marines bénéficient d’une protection réglementaire.\n	\N	\N	\N	f
31670	1022	TEXT	ecosystems.ecosystems.2.description	La seule forêt boréale du territoire français se trouve à Saint-Pierre-et-Miquelon. Fortement dégradée par les herbivores introduits, cette forêt présente une végétation arborescente dans les vallées abritées mais se limite à une strate arbustive ou rampante dans les secteurs exposés aux vents. Dominée par les conifères, on y retrouve le caractéristique Sapin baumier (*Abies balsamea*), l’Epinette blanche (*Picea glauca*), l’épinette noire (*Picea mariana*), dans certains milieux tourbeux le Mélèze laricin (*Larix laricina*), seul conifère qui perd ses épines en hiver, ou encore, bien que rare sur Langlade et Miquelon, l'If du Canada (*Taxus canadensis*) sous sa forme rampante.	\N	\N	\N	f
31671	1022	TEXT	ecosystems.ecosystems.1.description	Ces zones humides occupent des superficies importantes. Caractérisées par la formation et l’accumulation de tourbe, parfois sur plusieurs mètres d’épaisseur, elles présentent des groupements végétaux remarquables et variés, parmi lesquelles on trouve des sphaignes, des mousses, ainsi que des orchidées.	\N	\N	\N	f
31672	1022	TEXT	ecosystems.ecosystems.0.description	Au-dessus des forêts, les végétaux ligneux adoptent un port prostré et laissent place à des landes dominées par les éricacées au port rampant, dont le Kalmia à feuilles étroites (*Kalmia angustifolia*). Aux altitudes les plus élevées, cette formation laisse place à une toundra adaptée aux conditions très venteuses, typique des milieux alpins ou arctiques.	\N	\N	\N	f
47456	1031	TEXT	identity.populationYear	2018	\N	\N	\N	f
47457	1031	IMAGE	species.5.image	\N	1527	*Cyrtandra futunae* © J-Y. H. Meyer, Délégation à la Recherche de la Polynésie française	\N	f
40051	1023	IMAGE	presentation.file	\N	1496	affiche écogeste jeter ses déchets	\N	f
40052	1023	CHECKBOX	presentation.shadowed	true	\N	\N	\N	f
40053	1023	IMAGE	action.cards.2.icon	\N	1116	Tri	\N	f
40054	1023	TEXT	presentation.name	Je ne jette pas mes déchets dans la nature	\N	\N	\N	f
40055	1023	IMAGE	action.cards.0.icon	\N	1114	Poubelles	\N	f
40056	1023	IMAGE	presentation.image	\N	1164	Dustan Woodhouse/Unsplash	\N	f
40057	1023	TEXT	understand.text	Certains déchets libèrent des substances toxiques lorsqu’ils se décomposent, ils dégraderont peu à peu les milieux naturels et pollueront durablement les sols, d’autres seront de véritables pièges pour la faune sauvage par ingestion ou enchevêtrement, causant des dommages à de nombreuses espèces (occlusions, fausse satiété, blessures, amputations, noyades…). Les mégots et les morceaux de verre peuvent également être responsables de départs d’incendies qui détruirons les habitats et leurs occupants.\nDe plus, les décharges sauvages représentent souvent de parfaits gîtes à moustiques et peuvent donc favoriser la transmission de maladies (dengue, chikungunya, zika).\n\nAvec la pandémie du Covid-19, l'utilisation de masques à usages unique a considérablement augmenté. Fabriqués à partir de polypropylène, un plastique résistant, on estime qu'il leur faut 400 ans pour se dégrader dans l'océan, en engendrant de tout petits fragments appelés microplastiques, qui polluent durablement les écosystèmes.\n\nLes bio-plastiques, une bonne idée ? Attention au greenwashing ! Sous ce terme se trouvent des produits composés, parfois seulement en partie, de matières d'origine végétale (amidon de pomme de terre ou de maïs, canne à sucre, glucose dérivé de l'amidon ou encore huile végétale). Souvent vantés comme "biodégradables", la plupart ne sont en réalité compostables qu'en condition industrielles. Jetés dans la nature, ils ne se dégradent pas !\n\nPour éviter d'impacter durablement les milieux, prenons le temps de jeter correctement nos déchets.  	\N	\N	\N	f
40058	1023	IMAGE	action.cards.1.icon	\N	1115	Cigarette	\N	f
40059	1023	TEXT	action.cards.2.description	Je me renseigne sur le système de tri de mon territoire et je le respecte. Certains déchets nécessitent des traitements particuliers et ne doivent surtout pas être jetés avec les ordures ménagères (médicaments, électronique, etc.). 	\N	\N	\N	f
40060	1023	TEXT	presentation.category	Sur terre et en mer	\N	\N	\N	f
40061	1023	TEXT	action.cards.1.description	Si je suis fumeur, je ne jette jamais mon mégot dans la nature.\nJe peux acheter ou fabriquer un cendrier de poche à garder avec moi.	\N	\N	\N	f
40062	1023	TEXT	presentation.description	Mégots, sacs plastiques, piles, canettes, vieux filets de pêche, carcasses de voitures… Sur terre comme en mer, tous ces déchets abandonnés dégradent les écosystèmes !	\N	\N	\N	f
40063	1023	TEXT	action.title	Pour que mes déchets n’impactent pas les milieux 	\N	\N	\N	f
40064	1023	TEXT	understand.quote	A l’échelle mondiale, on estime que 8 millions de tonnes de plastique finissent chaque année dans les océans ! Et un mégot peut polluer à lui seul 500 litres d’eau.	\N	\N	\N	f
40065	1023	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
31673	1022	TEXT	identity.highestPoint	240	\N	\N	\N	f
31674	1022	TEXT	interests.locations.4.description	Chef-lieu du territoire, cette commune concentre 86% de la population de l’archipel. Restreint à la zone portuaire, la ville s’est beaucoup étendue en périphérie ces dernières années, ce qui n’est pas sans causer des problèmes en matière d’assainissement, de gestion des déchets, et de dérangement de la faune aviaire. 	\N	\N	\N	f
31675	1022	TEXT	risks.risks.0.name	Les ressources naturelles, un enjeu important	\N	\N	\N	f
31676	1022	IMAGE	interests.locations.1.image	\N	1103	Vue aérienne de l'isthme © DR	\N	f
31677	1022	IMAGE	ecosystems.ecosystems.1.image	\N	1104	Tourbière près de l’étang de Richepomme © Nathalie de Lacoste	\N	f
31678	1022	TEXT	interests.locations.3.description	Située dans le tissu urbain de la ville de Saint-Pierre, cette enclave de tourbières et étangs de 27 ha est l’une des dernières tourbières de la partie sud de l’île de Saint-Pierre. D’un intérêt écologique fort, en partie car de nombreuses espèces d’oiseaux y font étape durant leur trajet migratoire, le site fait l’objet d’un plan de gestion depuis 2018.\n\n	\N	\N	\N	f
31679	1022	TEXT	identity.title	Saint-Pierre-et-Miquelon,  \ndes terres et des eaux riches en biodiversité	\N	\N	\N	f
31680	1022	IMAGE	species.6.image	\N	1285	*Linnaea borealis* © Serge Muller	\N	f
31681	1022	TEXT	interests.locations.1.name	L’isthme	\N	\N	\N	f
31682	1022	TEXT	statistics.2.text	hectares de lagune et de marais au Grand Barachois	\N	\N	\N	f
31683	1022	IMAGE	species.0.image	\N	1227	Phoque veau-marin © Daniel Koelsch	\N	f
31684	1022	TEXT	events.1.date	17<sup>e</sup> siècle 	\N	\N	\N	f
31685	1022	TEXT	interests.locations.4.name	Saint-Pierre	\N	\N	\N	f
40066	1023	TEXT	action.cards.0.description	Je ne jette jamais mes déchets dans la nature. Si il n’y a pas de poubelles à proximité, je les conserve avec moi en attendant.	\N	\N	\N	f
47458	1031	TEXT	statistics.0.text	îlots dans le lagon autour de Wallis	\N	\N	\N	f
47459	1031	TEXT	ecosystems.ecosystems.1.name	La lande à *toafa*	\N	\N	\N	f
47460	1031	TEXT	events.2.date	1300 - 900 avant JC	\N	\N	\N	f
47461	1031	TEXT	identity.presentation	A l’est de la Nouvelle-Calédonie, trois îles aux profils très différents composent le territoire français le plus éloigné de la métropole : l’archipel de Wallis-et-Futuna. L’île de Wallis, aussi appelée *'Uvea*, est entourée par un vaste lagon et des îlots coralliens et concentre les 2/3 de la population. A 230 km à l’ouest se trouvent les îles Horn séparées par un détroit : Futuna, au relief escarpé, et Alofi, quasiment non-habitée et encore largement recouverte de forêt primaire. La connaissance de la biodiversité de l’archipel est encore assez incomplète mais a beaucoup progressé ces dernières années.	\N	\N	\N	f
47462	1031	TEXT	identity.population	11 558	\N	\N	\N	f
47463	1031	TEXT	species.3.name	La Roussette du Pacifique 	\N	\N	\N	f
47464	1031	TEXT	risks.risks.2.name	Préserver la biodiversité de Wallis-et-Futuna	\N	\N	\N	f
47465	1031	IMAGE	species.8.image	\N	1569	*Heliotropium foertherianum* © J-Y. H. Meyer, Délégation à la Recherche de la Polynésie française	\N	f
47466	1031	TEXT	species.0.name	La Gallicolombe de Stair 	\N	\N	\N	f
43579	1021	TEXT	species.3.description	Le Petit Molosse de La Réunion ([*Mormopterus francoismoutoui*](https://inpn.mnhn.fr/espece/cd_nom/458690\n)), est l’une des 3 espèces de chauve-souris présentes sur l’île et la seule strictement endémique encore présente. Les chauves-souris sont les seuls mammifères indigènes, toutes les autres espèces de mammifères présents ayant été introduits par l’homme, volontairement (élevage ou animaux domestiques) ou involontairement (souris, rats, etc.).\n\nStatut dans la Liste rouge des mammifères de La Réunion : préoccupation mineure. 	\N	\N	\N	f
43580	1021	TEXT	species.1.description	L'Échenilleur de La Réunion ([*Lalage newtoni*](https://inpn.mnhn.fr/espece/cd_nom/895898\n)), aussi appelé Tuit-Tuit en raison du chant du mâle, est un passereau endémique de la forêt de la Roche écrite, dans le nord de l’île. Victime de la prédation par les rats et les chats, sa population est actuellement estimée à quelques dizaines de couples reproducteurs et il est considéré en grand danger d’extinction. Grâce aux actions menées dans le cadre du [LIFE+ Biodiv'OM](https://www.lifebiodivom.fr/especes/lechenilleur-de-la-reunion/) et du [Plan national d'actions](http://www.reunion.developpement-durable.gouv.fr/IMG/pdf/PNA-Tuit-tuit-A4_avril_2014_version_WEB_cle0b1de7.pdf), comme la lutte contre les prédateurs introduits, ses effectifs remontent petit à petit.\n\nStatut dans la Liste rouge des oiseaux de La Réunion : en danger critique. 	\N	\N	\N	f
28740	1012	TEXT	understand.paragraphs.1.text	Créé en 2012, le [Pôle-relais dédié aux zones humides tropicales](https://www.pole-tropical.org/) (PRZHT) constitue un réseau d’échanges entre les acteurs concernés par la conservation, la gestion et la valorisation des zones humides dans les territoires tropicaux français. Il anime, entre autres, le [Réseau national d’observation et d’aide à la gestion des mangroves](https://www.pole-tropical.org/actions/les-actions-du-reseau-dobservation-des-mangroves/) (ROM), l’un des 3 réseaux de suivi de l’[Initiative française pour les Récifs Coralliens (IFRECOR)](https://ifrecor.fr/). Officiellement lancé en 2017, ce réseau regroupe les gestionnaires de mangroves des territoires français concernés aux Antilles, en Guyane, et dans les océans Indien et Pacifique. \n \nEn 2019, le ROM a développé une application smartphone pour permettre à tous de s’entrainer à reconnaitre les différentes espèces de palétuviers qui constituent la mangrove et à signaler les perturbations observées dans les mangroves (déchets, défrichements, mortalités, etc.). Chaque utilisateur peut ainsi devenir pleinement acteur de la protection des mangroves au sein de son territoire.  \nVous aussi, devenez observateurs en [téléchargeant l'application ROM](https://rom.pole-tropical.org/home) !\n	\N	\N	\N	f
28741	1012	TEXT	understand.title2	Des bénéfices pour l’Homme, mais un écosystème soumis à de nombreuses pressions 	\N	\N	\N	f
28742	1012	TEXT	presentation.descriptionTerritories	des mangroves font l'objet de mesures de conservation	\N	\N	\N	f
28743	1012	TEXT	understand.paragraphs.0.title	Des statuts de protection variés	\N	\N	\N	f
28744	1012	TEXT	understand.keyword	mangroves	\N	\N	\N	f
28745	1012	TEXT	ecogestures.title	Que puis-je faire pour aider à préserver les mangroves ? 	\N	\N	\N	f
28746	1012	IMAGE	presentation.image	\N	1047	Palétuviers, baie de Grand Cul-de-Sac marin, Guadeloupe © Gaëlle Vandersarren	\N	f
28747	1012	TEXT	understand.paragraphs.1.title	Un réseau participatif pour signaler les perturbations dans les mangroves	\N	\N	\N	f
28748	1012	TEXT	understand.paragraphs.0.text	Il existe un éventail de dispositions juridiques permettant de protéger les mangroves, par exemple le classement en Zone humide d’importance internationale par la Convention de Ramsar ou les arrêtés de protection de biotope, et de nombreuses zones de mangroves sont présentes dans les aires protégées des territoires (parcs nationaux, parcs naturels régionaux, réserves naturelles, etc.). Cependant, toutes les mangroves protégées ne font pas forcément l’objet de mesures de gestion.\nCet indicateur donne la part de mangroves bénéficiant d'un gestionnaire identifié et d'un document de gestion établit dans un but de conservation. Dans le cadre de la loi pour la reconquête de la biodiversité du 9 août 2016, l’État français s'était fixé pour objectif que 60 % de la surface nationale des mangroves soit gérée à des fins de conservation d'ici à 2020, cet objectif n'a donc pas été atteint. 	\N	\N	\N	f
38496	1020	IMAGE	species.15.image	\N	1387	*Ducula goliath* © Christine Fort	\N	f
38497	1020	TEXT	interests.locations.0.description	Créé en 2014, dans le but de « *de protéger la biodiversité exceptionnelle de l’espace maritime de Nouvelle-Calédonie, tout en permettant un développement économique responsable et durable* », le [Parc naturel de la mer de Corail](https://mer-de-corail.gouv.nc/) couvre 1,3 millions de km<sup>2</sup>, soit l’ensemble de la zone économique exclusive de la Nouvelle-Calédonie. Elle intègre les récifs d’Entrecasteaux, remarquables par les importantes populations de tortues vertes et d’oiseaux marins qui s’y reproduisent en grand nombre.	\N	\N	\N	f
38498	1020	IMAGE	ecosystems.ecosystems.6.image	\N	1473	Sargasses © G. Geoffray / IRD	\N	f
38499	1020	TEXT	risks.risks.1.description	Une même thématique relève le plus souvent de compétences « croisées » entre divers acteurs institutionnels. Chaque Province réglemente, contrôle et veille à la bonne application des réglementations environnementales mises en œuvre localement, sur son propre domaine géographique. Chacune dispose de son propre Code de l’environnement.  \nLe gouvernement de la Nouvelle-Calédonie réglemente et exerce quant à lui un droit d'exploration, d’exploitation, de gestion et de conservation des ressources naturelles, biologiques et non biologiques sur l’ensemble de la zone économique exclusive.  \nPar ailleurs, toutes les questions relatives à l’environnement ne peuvent s’envisager sans y intégrer une dimension coutumière et culturelle composante spécifique forte du territoire. \n\nToutes ces réglementations sont évolutives et régulièrement mises à jour et complétées, avec une volonté de cohérence à souligner entre les différents acteurs impliqués.  \nDans ce cadre, et au-delà des actions menées directement par les gestionnaires, d’autres acteurs publics et privés interviennent activement sur le terrain avec pour objectif la préservation de l’environnement (instituts de recherche, chambres consulaires, agences, GIP, associations, ONG).	\N	\N	\N	f
38500	1020	TEXT	interests.locations.2.description	Cette région de 43 970 ha, [inscrite sur la Convention de Ramsar](https://www.province-sud.nc/information/lacs-grand-sud-inscrits-convention-ramsar) depuis 2014, se compose de forêts humides, de maquis miniers, de marais arbustifs et de rivières, ruisseaux et lacs intermittents et permanents, notamment le lac de Yaté. Elle abrite des espèces qui ne vivent nulle part ailleurs. Considérée comme le plus grand réservoir d’eau douce de Nouvelle-Calédonie, cette région repose sur un réseau d’eau souterrain original et complexe, unique au monde.	\N	\N	\N	f
38501	1020	TEXT	interests.locations.1.description	Depuis juillet 2008, les lagons de Nouvelle-Calédonie sont inscrits sur la [Liste du patrimoine mondial de l’UNESCO](https://whc.unesco.org/fr/list/1115/) en raison de leur diversité exceptionnelle et de leur bon état de conservation. Ce bien "en série", c'est à dire composé de six zones géographiques distinctes a été le premier site ultra-marins à être reconnu comme tel. 	\N	\N	\N	f
38502	1020	TEXT	ecosystems.ecosystems.3.name	Les forêts sèches	\N	\N	\N	f
38503	1020	TEXT	identity.subtitle	Un endémisme terrestre remarquable et une diversité marine exceptionnelle	\N	\N	\N	f
38504	1020	IMAGE	species.7.image	\N	1320	*Sternula nereis* © Nathalie Baillon	\N	f
38505	1020	TEXT	species.5.name	Les Kaoris	\N	\N	\N	f
38506	1020	TEXT	risks.risks.0.description	La Nouvelle-Calédonie présente une flore et une faune remarquables, avec des taux d'endémismes très élevés. Trois principales menaces pèsent sur cette biodiversité : les incendies de forêts, les activités minières et les espèces exotiques envahissantes. S'y ajoutent d'autres menaces anthropiques liées à l'aménagement du territoires ou encore les pollutions. \n\nForte de 25 à 30% des réserves mondiales de nickel, la Nouvelle-Calédonie a comme principale activité économique l'exploitation de ces ressources. Cette exploitation est cependant à l’origine d’impacts notables sur la biodiversité terrestre et marine (érosion, sur-sédimentation…). La réhabilitation des zones exploitées est également un enjeu important.  \n\nLes [incendies de forêt](https://www.oeil.nc/fr/causes/les-incendies) sont particulièrement dévastateurs sur le territoire. Les épisodes sont fréquents et les moyens de lutte limités au regard des enjeux environnementaux. Plusieurs dizaines de milliers d’hectares sont brûlés chaque année. Outre la destruction de la flore, les incendies favorisent la colonisation d’espèces exotiques envahissantes, dégradent la ressource en eau et menacent également les populations humaines.  \n\nLes espèces exotiques envahissantes impactent fortement tous les écosystèmes. Plus de 2 000 espèces végétales, plus de 500 invertébrés et une quarantaine de vertébrés ont ainsi été introduits sur le territoire (dont [36 des 100 espèces considérées comme parmi les plus envahissantes au monde](https://preprod.biodiversite-outre-mer.fr/indicateurs/especes-exotiques-envahissantes)). Une [stratégie de lutte pays](https://www.cen.nc/especes-envahissantes/presentation) contre les espèces exotiques envahissantes dans les espaces naturels de Nouvelle-Calédonie est en place depuis 2016.  \n\nA une toute autre échelle, l’impact des changements climatiques sur les écosystèmes calédoniens soulève également de nombreuses questions.\n\n	\N	\N	\N	f
38507	1020	TEXT	ecosystems.ecosystems.2.description	Occupant un peu moins du quart de la surface du territoire, les maquis miniers présentent une végétation très particulière du fait de la richesse du sol en minerais (fer, magnésium, nickel) et de sa pauvreté en éléments nutritifs.  \nLa richesse floristique exceptionnelle qu'ils abritent (1 170 espèces à 89 % endémiques) peut être menacée par le développement de projets miniers et par les incendies. La faune locale, adaptée aux conditions de vie difficiles de ce milieu sec et rocailleux, compte principalement des insectes et des reptiles.	\N	\N	\N	f
38508	1020	TEXT	species.10.name	Les Roussettes	\N	\N	\N	f
38509	1020	TEXT	ecosystems.ecosystems.1.description	La Nouvelle-Calédonie possède la 2ème plus grande barrière de corail du monde, longue de 1 600 km et quasi-continue. D'une superficie totale de 23 400 kms<sup>2</sup>, les récifs et lagons calédoniens sont parmi les plus étendus et les plus riches de la planète. La diversité observée en termes d’espèces, d'habitats et de structures récifales, y est exceptionnelle.   \nChaque région et groupe d'île de la zone économique exclusive se caractérise par des assemblages uniques d'espèces et d'habitats coralliens. Ce constat renforce la nécessité de protection et de conservation du patrimoine naturel aussi bien à l'échelle locale qu'internationale. 	\N	\N	\N	f
38510	1020	TEXT	species.13.name	*Neogymnochrinus richeri*	\N	\N	\N	f
38511	1020	TEXT	species.16.name	Le Corbeau calédonien	\N	\N	\N	f
38512	1020	TEXT	ecosystems.ecosystems.0.description	Ces forêts dites « sempervirentes » couvrent un peu plus de 20 % du territoire, avec des massifs de plusieurs milliers d’hectares d’un seul tenant. Elles concentrent plus de 2 000 espèces végétales donc 80 % endémiques, et offrent un habitat à une faune diversifiée : oiseaux, reptiles, chauve-souris, insectes… Elles sont cependant victimes de fortes dégradations (incendies, exploitation minière, espèces exotiques envahissantes…). 	\N	\N	\N	f
38513	1020	TEXT	identity.highestPoint	1 628	\N	\N	\N	f
38514	1020	TEXT	interests.locations.4.description	Situé sur la côte Sud-Est de la Grande Terre, entre Thio et Yaté, ce [parc provincial](https://www.province-sud.nc/aires-protegees/parc-cote-oubliee) créé en 2019 protège désormais 93 000 ha terrestres et 29 200 ha marins. C'est un véritable trésor de biodiversité qui abrite 20 % des forêts humide du territoire, 82 % d’espèces végétales endémiques  et un patrimoine culturel et immatériel précieux. Ce classement a par ailleurs induit le gel d’une centaine de titres miniers. \n	\N	\N	\N	f
38515	1020	TEXT	risks.risks.0.name	Une richesse en biodiversité soumise à des fortes pressions 	\N	\N	\N	f
38516	1020	IMAGE	interests.locations.1.image	\N	1090	Poisson-coffre dans les récifs d’Entrecasteaux © DR	\N	f
38517	1020	IMAGE	ecosystems.ecosystems.1.image	\N	1383	Récif corallien de Nouvelle-Calédonie © Gregory Lasne	\N	f
38518	1020	TEXT	interests.locations.3.description	Autour du point culminant de la Nouvelle-Calédonie (1 627 m), cette réserve de 5 400 hectares a été créée en 1950. Cette réserve botanique exceptionnelle se caractérise par une mosaïque de formations forestières abritant une faune et une flore remarquable : kaoris, palmiers du genre *Clinosperma*, oiseaux (Méliphage noir, Pétrel de Tahiti), papillons...	\N	\N	\N	f
38519	1020	IMAGE	species.10.image	\N	1323	*Pteropus ornatus* © Malik Oedin / IAC	\N	f
38520	1020	TEXT	identity.title	La Nouvelle-Calédonie,\nun hotspot de biodiversité dans le Pacifique	\N	\N	\N	f
38521	1020	IMAGE	species.16.image	\N	1386	*Corvus moneduloides* © Christine Fort	\N	f
38522	1020	IMAGE	species.6.image	\N	1318	*Rhacodactylus leachianus* © Matthias Deuss	\N	f
38523	1020	TEXT	interests.locations.1.name	Les lagons, inscrits au Patrimoine mondial de l'UNESCO 	\N	\N	\N	f
38524	1020	TEXT	statistics.2.text	espèces de coraux 	\N	\N	\N	f
28749	1012	IMAGE	understand.image	\N	1314	Sentier aménagé dans la mangrove, Martinique © Fabien Lefebvre	\N	f
28750	1012	TEXT	presentation.description	des mangroves nationales font l’objet de mesures de conservation	\N	\N	\N	f
28751	1012	TEXT	presentation.logoUrl	https://naturefrance.fr/indicateurs/surface-de-mangroves-faisant-lobjet-de-mesures-de-conservation	\N	\N	\N	f
38525	1020	IMAGE	species.0.image	\N	1091	*Sphaeropteris intermedia* © Benjamin Guichard / OFB	\N	f
47467	1031	TEXT	events.4.date	1961	\N	\N	\N	f
47468	1031	IMAGE	interests.locations.2.image	\N	1530	Lagon et îlots au nord de Wallis © Tristan Berr	\N	f
38526	1020	TEXT	events.1.date	Entre - 1100 et -1050 ans	\N	\N	\N	f
38527	1020	IMAGE	ecosystems.ecosystems.7.image	\N	1392	© F. Benzoni / IRD	\N	f
38528	1020	TEXT	interests.locations.4.name	Le parc provincial de la Côte oubliée (*Woen Vùù – Pwa Pereeù*)	\N	\N	\N	f
47469	1031	IMAGE	ecosystems.ecosystems.2.image	\N	1526	Mangrove à Faioa © Enelio Liufau	\N	f
43581	1021	TEXT	species.2.description	Les baleines à bosses ([*Megaptera novaeangliae*](https://inpn.mnhn.fr/espece/cd_nom/60867\n)) viennent se reproduire le long des côtes réunionnaises entre juin et octobre. S’il est possible de les observer depuis un bateau, le respect de la [règlementation](https://cedtm-asso.org/quietude/la-reglementation/) est impératif pour préserver la tranquillité des cétacés, mais également pour la sécurité des observateurs.\n\nStatut dans la Liste rouge des mammifères marins de La Réunion : vulnérable. 	\N	\N	\N	f
43582	1021	TEXT	species.9.description	Le Papangue, ou Busard de Maillard ([*Circus maillardi*](https://inpn.mnhn.fr/espece/cd_nom/432596)) est le seul rapace nicheur endémique de l'île de La Réunion. Présent sur l'ensemble de l'île, sauf à haute altitude (plus de 2 200 m), il chasse à faible hauteur au dessus de la végétation. Longtemps victime de braconnage due à sa mauvaise réputation, accusé de tuer les animaux domestiques et porter malheur, l'espèce est protégé depuis 1989. Il est aujourd'hui principalement menacé par l'empoisonnement secondaire due à sa consommation de rongeurs empoisonnées et fait l'objet d'un [Plan national d'actions](http://www.reunion.developpement-durable.gouv.fr/le-pna-papangue-a983.html). L'île compterait aujourd'hui environ 200 couples reproducteurs.\n  \nStatut dans la Liste rouge des oiseaux de La Réunion : en danger.	\N	\N	\N	f
43583	1021	TEXT	statistics.1.number	2007	\N	\N	\N	f
47470	1031	TEXT	interests.locations.0.description	Le plus grand et le plus profond des cinq lacs de Wallis est issu de l’effondrement d’une ancienne caldeira. Il s’étend sur 400 m de diamètre et 80 m de profondeur et est entouré de parois verticales de plus de 30 m de hauteur. La forêt aux abords du lac, qui abrite de nombreux oiseaux et des roussettes, était autrefois protégée par un *Vao Tapu*, c’est-à-dire considérée comme taboue ou sacrée. 	\N	\N	\N	f
47471	1031	TEXT	risks.risks.2.description	L’archipel dispose d’un Code de l’environnement depuis 2007 et d’une Stratégie biodiversité depuis 2016. Le territoire ne compte pas d’aires protégées sur sens strict pour le moment, mais des réserves coutumières dites zones *Tapu* ont autrefois existé, par exemple au lac Lalolalo. Des volontés de créer des zones protégées existent, notamment concernant Alofi.\n  \nLe territoire de Wallis-et-Futuna participe au [programme PROTEGE](https://protege.spc.int/fr), projet de coopération régionale mis en œuvre par la Communauté du Pacifique (CPS) et le Programme régional océanien de l’environnement (PROE) pour une durée de 4 ans (2018-2022). Il vise à promouvoir le développement économique durable et résilient face aux changements climatiques des Pays et territoires d’outre-mer européens du Pacifique (PTOM) et concerne également la Nouvelle-Calédonie et la Polynésie française. Le programme s’articule autour de quatre volets : agriculture et foresterie, pêche côtière et aquaculture, eau et espèces envahissantes.\n	\N	\N	\N	f
47472	1031	TEXT	risks.risks.1.description	Au moins 416 espèces de plantes ont été introduites dans l'archipel, notamment comme ornementales dans les jardins. Parmi elles, plus de 150 sont considérées naturalisées, c’est-à-dire qu’elles se reproduisent sans intervention humaine, ce qui est beaucoup compte tenu de la petite taille du territoire. Les perturbations anthropiques ou naturelles (feux, déboisement, cyclone, etc.) peuvent faciliter leur installation et leur prolifération au détriment des plantes indigènes.  \n  \nLes lianes [*Merramia peltata*](https://inpn.mnhn.fr/espece/cd_nom/848283) et [*Mikania scandens*](https://inpn.mnhn.fr/espece/cd_nom/448111), ainsi que l’arbuste [*Clidemia hirta*](https://inpn.mnhn.fr/espece/cd_nom/912564), sont particulièrement envahissantes comme dans de nombreuses îles du Pacifique.\nAu niveau de la faune, rats, fourmis (dont la petite fourmi de feu [*Wasmannia auropunctata*](https://inpn.mnhn.fr/espece/cd_nom/532927)), escargots et oiseaux introduits sont également problématiques, ainsi que les cochons, chats et chiens féraux qui peuvent avoir des impacts écologiques importants, en particulier sur les îlots de Wallis.	\N	\N	\N	f
47473	1031	TEXT	interests.locations.2.description	Sur plus de 200 km<sup>2</sup> s’étend un ensemble varié et très riche de formations récifales et d’herbiers sous-marins, ainsi que 19 îlots boisés où se reproduisent des tortues marines et de nombreuses espèces d’oiseaux marins. La barrière récifale est interrompue par quatre passes : trois à l’ouest et une au sud. 	\N	\N	\N	f
47474	1031	TEXT	interests.locations.1.description	Au contraire de Wallis qui n’en possède aucune, le relief de Futuna est parcouru de plusieurs rivières qui abritent une faune d’eau douce dont plusieurs espèces de gobies endémiques, et sont pour le moment exemptes de poissons introduits.	\N	\N	\N	f
47475	1031	TEXT	ecosystems.ecosystems.3.name	Les récifs coralliens	\N	\N	\N	f
47476	1031	TEXT	identity.subtitle	Du lagon de Wallis aux forêts d'Alofi	\N	\N	\N	f
47477	1031	IMAGE	species.7.image	\N	1568	*Rhizophora samoensis* © J-Y. H. Meyer, Délégation à la Recherche de la Polynésie française	\N	f
47478	1031	TEXT	species.5.name	Le *Suka*	\N	\N	\N	f
47479	1031	TEXT	risks.risks.0.description	A Wallis, les milieux naturels ont été grandement modifiés par les activités humaines, en particulier les forêts qui sont très dégradées, remplacées par le *toafa*. Futuna et Alofi sont plus préservées et la biodiversité terrestre y est plus riche. A l’inverse, la biodiversité marine du vaste lagon de Wallis est plus importante que celles des récifs frangeants de Futuna. Cependant les connaissances sur la biodiversité de Wallis-et-Futuna sont encore largement lacunaires.\n  \nLa démographie n’est pas une contrainte sur l’archipel car la population est en baisse régulière depuis 2003, de nombreux jeunes wallisiens et futuniens émigrent, notamment vers la Nouvelle-Calédonie. Cependant, le traitement des eaux usées est l’un des enjeux majeurs : une pollution importante du lagon est observée, les eaux domestiques et d’élevage non traitées y sont directement rejetées.   \n  \nL’extraction de matériaux coralliens pour la construction et les remblais occasionnent également une dégradation du littoral et facilitent l’érosion du trait de côte. La pêche dans le lagon est une importante source de revenus et de nourriture pour les habitants de l’île. Si la pêche à la dynamite, technique destructrice utilisée par le passé, a été largement abandonnée, des pratiques comme la pêche au fusil de nuit ou pendant les périodes de frai contribuent à la fragilisation de la ressource. Des impacts lourds sont à noter en particulier sur les populations de perroquets à bosse ([*Bolbometopon muricatum*](https://inpn.mnhn.fr/espece/cd_nom/423493)). \nLes connaissances sur les poissons du large et des fonds marins sont encore très lacunaires.  \n  \nAlofi n’étant peuplée de manière permanente que par une seule personne, elle reste préservée bien que l’extension des défrichements pour les terres cultivables soit une menace à prendre en compte, ainsi que la présence de chiens domestiques. 	\N	\N	\N	f
47480	1031	TEXT	ecosystems.ecosystems.2.description	La mangrove est présente uniquement sur Wallis, essentiellement dans les petites anses vaseuses de la côte ouest où elle recouvre 36 hectares. Il s’agit d’une formation assez dense de 3-4m de hauteur environ, autour de deux espèces de palétuviers (*togo*), [*Bruguiera gymnorrhiza*](https://inpn.mnhn.fr/espece/cd_nom/809530\n) et [*Rhizophora samoensis*](https://inpn.mnhn.fr/espece/cd_nom/672293). Malgré la petite superficie des mangroves de Wallis, leurs bénéfices ne sont pas à négliger : limitation de l’érosion du littoral, atténuation des effets des cyclones (fréquents dans de l'archipel), stockage de carbone, filtre pour les eaux de ruissellement et habitat pour de nombreux organismes, dont les crabes de palétuviers, consommés par les habitants. 	\N	\N	\N	f
47481	1031	TEXT	ecosystems.ecosystems.1.description	Le mot *Toafa*, « désert » en wallisien, reflète la pauvreté floristique de cette lande due aux feux répétés, où se trouve principalement des fougères ([*Dicranopteris linearis*](https://inpn.mnhn.fr/espece/cd_nom/448035)).   \nPour restaurer ces habitats dégradés, des plantations de Pin des Caraïbes ([*Pinus caribaea*](https://inpn.mnhn.fr/espece/cd_nom/446369)), une espèce exotique, ont été mises en place dans les années 1970. Une recolonisation du sous-bois par les espèces indigènes est observée dans les pinèdes non entretenues. Les pins des Caraïbes apparaissent cependant moins résistants aux cyclones que les espèces indigènes.	\N	\N	\N	f
47482	1031	TEXT	ecosystems.ecosystems.0.description	Si la forêt dense occupait autrefois la quasi-totalité des îles, elle a aujourd’hui quasiment disparu de Wallis, hormis dans quelques zones peu accessibles. Elle est mieux conservée sur Futuna en raison du relief accidenté, bien que grignotée peu à peu par le défrichement pour les cultures. Sur Alofi, elle est encore relativement bien préservée, mais fait malgré tout l’objet d’exploitation par les agriculteurs de Futuna.	\N	\N	\N	f
47483	1031	TEXT	identity.highestPoint	524	\N	\N	\N	f
47484	1031	TEXT	risks.risks.0.name	Des pressions sur le lagon et les forêts 	\N	\N	\N	f
47485	1031	IMAGE	interests.locations.1.image	\N	1605	Rivière de Futuna © Jairo Talalua	\N	f
47486	1031	IMAGE	ecosystems.ecosystems.1.image	\N	1572	Lande à *Toafa* © Jean-Yves H. Meyer, Délégation à la Recherche de la Polynésie française	\N	f
47487	1031	TEXT	interests.locations.3.description	La plus petite île du groupe n’est habitée à l’année que par une seule personne mais fréquentée quasiment quotidiennement par les agriculteurs de Futuna. D’origine corallienne, elle est majoritairement recouverte par une forêt relativement bien conservée, malgré un défrichement de plus en plus important pour les cultures et le bois de construction.	\N	\N	\N	f
47488	1031	TEXT	identity.title	Wallis-et-Futuna,  \nun archipel au cœur du Pacifique  	\N	\N	\N	f
47489	1031	IMAGE	species.6.image	\N	1567	Fruits d'*Aglaia samoaensis* © J-Y. H. Meyer, Délégation à la Recherche de la Polynésie française	\N	f
47490	1031	TEXT	interests.locations.1.name	Les rivières de Futuna	\N	\N	\N	f
47491	1031	TEXT	statistics.2.text	espèces de plantes vasculaires indigènes	\N	\N	\N	f
47492	1031	IMAGE	species.0.image	\N	1531	Dessin d'*Alopecoenas stairi* © J. Wolf	\N	f
47493	1031	TEXT	events.1.date	-2 millions d'années	\N	\N	\N	f
43584	1021	TEXT	statistics.0.number	3 500	\N	\N	\N	f
43585	1021	TEXT	statistics.2.number	1 738 espèces	\N	\N	\N	f
43586	1021	IMAGE	interests.locations.4.image	\N	1480	Réserve de l'étang de Saint-Paul © Giovanni Payet	\N	f
43587	1021	TEXT	species.2.name	La Baleine à bosse	\N	\N	\N	f
43588	1021	TEXT	species.4.description	Le Pétrel de Barau ([*Pterodroma baraui*](https://inpn.mnhn.fr/espece/cd_nom/215079\n)), également appelé « Taille Vent », est un oiseau endémique nichant dans des terriers à même le sol, en haute altitude sur les contreforts du Piton des Neiges. Victimes de la prédation par les rats et les chats, de nombreux jeunes sont également désorientés par les éclairages publics lors de leur premier envol et s’échouent en milieu urbain. En danger d’extinction, l’espèce fait l’objet d’un plan de conservation [LIFE+ Pétrels](https://www.petrels.re/).\n\nStatut dans la Liste rouge des oiseaux de La Réunion : en danger. 	\N	\N	\N	f
43589	1021	TEXT	ecosystems.ecosystems.0.name	Les forêts humides	\N	\N	\N	f
43590	1021	TEXT	species.5.description	Les Fanjan sont des fougères arborescentes typiques des forêts de Bois de couleur des Hauts. On distingue 3 espèces différentes : [*Alsophila borbonica*](https://inpn.mnhn.fr/espece/cd_nom/707878\n), [*A. glaucifolia*](https://inpn.mnhn.fr/espece/cd_nom/707883\n) et [*A. celsa*](https://inpn.mnhn.fr/espece/cd_nom/707882\n). Traditionnellement utilisés pour la confection de pots à plantes vertes, leur prélèvement a entrainé une dégradation importante des écosystèmes et une menace pour la conservation de ces espèces. Une espèce proche originaire d’Australie ([*Sphaeropteris cooperi*](https://inpn.mnhn.fr/espece/cd_nom/707881)) a été introduite sur l’île et présente un caractère envahissant qui pourrait menacer les espèces indigènes.\n\nStatut dans la liste rouge de la flore vasculaire de La Réunion (pour les 3 espèces indigènes) : préoccupation mineure. 	\N	\N	\N	f
43591	1021	TEXT	species.6.description	Le Latanier rouge ([*Latania lontaroides*](https://inpn.mnhn.fr/espece/cd_nom/630013\n)) est un palmier endémique de La Réunion. A l’état naturel, on ne le trouve plus que dans le sud de l’île et il est considéré en danger critique d’extinction. Il était exploité pour son bois et ses palmes utilisées pour les toits.\n\nStatut dans la Liste rouge de la flore vasculaire de La Réunion : en danger critique. 	\N	\N	\N	f
43592	1021	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
43593	1021	TEXT	interests.locations.5.name	[La Réserve naturelle marine](http://www.reservemarinereunion.fr/)	\N	\N	\N	f
43594	1021	TEXT	events.0.date	-2 à 3 millions d’années,	\N	\N	\N	f
43595	1021	TEXT	identity.populationYear	2017	\N	\N	\N	f
43596	1021	IMAGE	species.5.image	\N	1481	*Alsophila glaucifolia*© B. Navez	\N	f
43597	1021	TEXT	statistics.0.text	hectares de récifs coralliens protégés par la réserve marine	\N	\N	\N	f
43598	1021	TEXT	ecosystems.ecosystems.1.name	La forêt sèche	\N	\N	\N	f
43599	1021	TEXT	events.2.date	1642	\N	\N	\N	f
43600	1021	TEXT	identity.presentation	« L’île intense » est située sur un point chaud de biodiversité et présente un fort taux d’endémisme. Les milieux naturels y sont relativement bien conservés par rapport aux autres îles des Mascareignes (Maurice et Rodrigues) en raison du relief escarpé. De nombreuses espèces ont toutefois disparu depuis l’arrivée des humains au 16<sup>e</sup> siècle sur une île alors inhabitée. Forêts humides, ravines et rivières, cirques et remparts, volcan, récif corallien... La Réunion présente une diversité d’écosystèmes et une forte volonté de les préserver.	\N	\N	\N	f
43601	1021	TEXT	identity.population	853 659	\N	\N	\N	f
43602	1021	TEXT	species.3.name	Le Petit Molosse de La Réunion	\N	\N	\N	f
43603	1021	IMAGE	species.8.image	\N	1484	*Obetia ficifolia* © Caroline Robert / PN La Réunion	\N	f
43604	1021	TEXT	species.0.name	Le Gecko vert de Manapany	\N	\N	\N	f
47494	1013	SELECT	presentation.sourceSelect	inpn	\N	\N	\N	f
47495	1013	TEXT	understand.text2	La taxonomie, ou taxinomie, est la science qui permet de décrire et de classer le vivant. L’espèce est l’unité taxonomique de base. Chaque espèce décrite est classée avec d’autres espèces aux caractéristiques communes au sein d’un même genre, puis d’une famille, d’un ordre, etc. Chaque espèce est identifiée par un nom scientifique latin en deux mots, par exemple *Pelecanus occidentalis* pour le Pelican brun. Cette dénomination en latin permet un référentiel mondial commun, car une même espèce peut posséder des dizaines de noms usuels différents (dits noms "vernaculaires") à travers le monde, selon les langues et les régions. 	\N	\N	\N	f
47496	1013	TEXT	understand.text1	Plus de 80 % des nouvelles découvertes d'espèces chaque année en France sont réalisées dans les territoires d'outre-mer. Certaines de ces nouvelles descriptions sont issues d’expéditions scientifiques, par exemple celles menées en Guyane en 2014 et en Nouvelle-Calédonie entre 2016 et 2019 par le Muséum national d’Histoire naturelle dans le cadre de la campagne « [la Planète revisitée](https://www.mnhn.fr/fr/recherche-expertise/lieux/planete-revisitee) », mais d’autres sont également réalisées par des taxonomistes non-professionnels. Il peut s'agir également d'espèces déjà décrites dans des territoires frontaliers mais dont la présence n'avait pas encore été observée sur le territoire national. Dans la plupart des cas, il s’agit de petits organismes invertébrés et d’organismes marins (insectes, mollusques, crustacés, vers marins).   \n  \nLe chiffre présenté ici représente une moyenne du nombre de découvertes par an sur les trois dernières années. 	\N	\N	\N	f
47497	1013	TEXT	territories.title	Nouvelles espèces décrites par an	\N	\N	\N	f
47498	1013	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
47499	1013	TEXT	understand.title1	L'outre-mer : un vivier d'espèces à découvrir	\N	\N	\N	f
47500	1013	TEXT	understand.paragraphs.1.text	Les estimations actuelles du nombre d'espèces présentes sur Terre oscillent entre 8 et 10 millions (hors bactéries), et seules un peu plus de 2 millions d'espèces ont été décrites à ce jour. A l’échelle mondiale, environ 20 000 nouvelles espèces sont décrites chaque année. Cette tâche titanesque est complexifiée par le manque de spécialistes qui s’y consacrent, en particulier chez les invertébrés. \nCependant, le travail de description morphologique est désormais accompagné de l’utilisation d’analyses ADN qui permettent de distinguer des espèces « cryptiques » c’est-à-dire très semblables morphologiquement mais en réalité différentes génétiquement, ce qui peut par exemple expliquer des différences d’adaptations aux conditions environnementales.	\N	\N	\N	f
47501	1013	TEXT	understand.title2	La taxonomie : la science de la description du vivant	\N	\N	\N	f
47502	1013	TEXT	presentation.descriptionTerritories	nouvelles espèces sont décrites par an	\N	\N	\N	f
47503	1013	TEXT	understand.paragraphs.0.title	Quelques exemples de découvertes récentes	\N	\N	\N	f
43605	1021	TEXT	events.4.date	1976	\N	\N	\N	f
43606	1021	IMAGE	interests.locations.2.image	\N	1157	Piton de la Fournaise © Philippe Gourdain	\N	f
43607	1021	IMAGE	ecosystems.ecosystems.2.image	\N	1494	Lagon de La Réunion © Philippe Bourjon	\N	f
43608	1021	TEXT	interests.locations.0.description	Créé en 2007, [le Parc national](http://www.reunion-parcnational.fr/fr) englobe la partie centrale des deux massifs volcaniques de l'île : celui du Piton des Neiges, le plus ancien avec les trois cirques, et celui du Piton de la Fournaise. La zone cœur de parc couvre 42 % de la superficie de l’île.	\N	\N	\N	f
43609	1021	TEXT	interests.locations.2.description	Le tiers sud-est de l’île est occupé par le Piton de la Fournaise, l’un des volcans les plus actifs du monde, de type effusif. Ses coulées de laves refroidies sont progressivement recolonisées par la végétation, lichens et fougères tout d'abord, puis plantes vasculaires.	\N	\N	\N	f
43610	1021	TEXT	interests.locations.1.description	Inscrits au patrimoine mondial de l’UNESCO en 2010, les trois cirques entourent le sommet de l’île : le Piton des Neiges. Chacun possède une identité particulière. Mafate n’est desservi par aucune route, Salazie est plus exposé aux précipitations tandis que Cilaos est plus sec.	\N	\N	\N	f
43611	1021	TEXT	ecosystems.ecosystems.3.name	Les fourrés à Pandanus 	\N	\N	\N	f
43612	1021	TEXT	identity.subtitle	Deux volcans et un relief escarpé	\N	\N	\N	f
43613	1021	IMAGE	species.7.image	\N	1483	*Acacia heterophylla* © B. Navez	\N	f
43614	1021	TEXT	species.5.name	Les Fanjan	\N	\N	\N	f
43615	1021	TEXT	risks.risks.0.description	Située au sein de l'un des 34 hauts lieux de la biodiversité mondiale (*"hotspot"*), l'environnement de l'île de La Réunion est exceptionnel. \n\nLa principale menace pour la biodiversité de l'île est la pression démographique, l’augmentation de la population entrainant le développement d’infrastructures et aménagements. La quasi-totalité des forêts de basse-altitude a déjà disparu et le littoral est particulièrement menacé par l’urbanisation, la pollution et la surfréquentation. La fréquence de ponte de tortues marines sur les plages de La Réunion est très faible et ces espèces sont également menacées par la pêche accidentelle et le braconnage. Hormis dans la Réserve naturelle marine, il n’existe aucun dispositif de protection ou de gestion des ressources dans la zone économique exclusive.  \n\nLes espèces exotiques envahissantes sont également une menace majeure. De nombreuses espèces végétales envahissent les milieux naturels, et les monocultures de Cryptomeria du Japon ([*Cryptomeria japonica*](https://inpn.mnhn.fr/espece/cd_nom/93471)) offrent des milieux favorables à l’envahissement par d’autres plantes exotiques. La lutte contre les rats et les chats harets est également un enjeu majeur de la conservation des oiseaux endémiques. Une [stratégie de lutte contre les espèces invasives](https://www.especesinvasives.re/strategie-de-lutte/la-strategie-reunionnaise/) est mise en place depuis 2010. Depuis le 1<sup>e</sup> avril 2019, un arrêté ministériel interdit tout usage d’une [liste de 150 plantes exotiques](http://www.reunion.developpement-durable.gouv.fr/IMG/pdf/0_defi_eee-outre-mer-la_reunion-web-br.pdf).  \n\nLa création du Parc national en 2007 et l'inscription au Patrimoine mondial de l'UNESCO en 2010 ont permis de renforcer la protection du patrimoine naturel de La Réunion. La mise en place d'une [Stratégie réunionnaise pour la biodiversité](http://www.reunion.developpement-durable.gouv.fr/IMG/pdf/SRB-2013-2020_cle093a71.pdf) depuis 2013 doit permettre d'intégrer la protection de la biodiversité dans les politiques publiques du territoire. De nombreux programmes de conservations ont été mis en place pour protéger les espèces patrimoniales (Plans nationaux d'actions, programmes LIFE+, etc.). \n	\N	\N	\N	f
43616	1021	TEXT	ecosystems.ecosystems.2.description	Malgré leur faible étendue (12 km<sup>2</sup>, entre le Cap La Houssaye et Grand Bois), les récifs coralliens de La Réunion sont très riches et diversifiés. On y compte au moins 226 espèces de coraux, ainsi que plusieurs centaines d’espèces d’échinodermes, mollusques, crustacés et poissons, dont de nombreuses espèces endémiques. La plus grande partie de ces récifs sont protégés sous le statut de la [Réserve naturelle marine](http://www.reservemarinereunion.fr/).	\N	\N	\N	f
43617	1021	TEXT	interests.locations.6.description	Au nord de l’île, le massif de la Roche Écrite, dont le sommet culmine à 2 276 m au-dessus des cirques de Mafate et de Salazie, est couvert par diverses formations végétales : forêts de tamarins, de bois de couleurs, landes d'altitude. Il est l’unique lieu de vie de l’Échenilleur de La Réunion, ou Tuit-Tuit ([*Lalage newtoni*](https://inpn.mnhn.fr/espece/cd_nom/895898\n)), oiseau endémique de l’île, classé en danger critique d’extinction. 	\N	\N	\N	f
43618	1021	TEXT	ecosystems.ecosystems.1.description	Située sur la côte ouest de l’île, la forêt sèche a perdu 99% de sa superficie de puis l’arrivée des humains et ce milieu est considérée comme « en danger critique d’extinction ». Un [projet LIFE+](https://www.foretseche.re/) lancé en 2015 a permis de replanter de nombreux arbres indigènes pour tenter de le conserver.	\N	\N	\N	f
43619	1021	TEXT	interests.locations.5.description	Créée en 2007, cette aire marine protégée couvre 3 500 hectares sur un linéaire de 40 km sur la côte ouest de l’île. Les activités nautiques, dont la pêche, y sont règlementées et dans les zones dites « sanctuaires », toute présence humaine est interdite quel qu’en soit le motif. 	\N	\N	\N	f
43620	1021	TEXT	ecosystems.ecosystems.0.description	Il existe plusieurs types de forêts et de cortèges floristiques répartis en fonction de l’altitude et de la pluviométrie. Elles se situent particulièrement dans l’est et le sud de l’île, moins urbanisés. On y trouve une grande diversité végétale : mousses, fougères, orchidées, arbres et arbustes, etc.	\N	\N	\N	f
43621	1021	TEXT	identity.highestPoint	3 071	\N	\N	\N	f
43622	1021	TEXT	interests.locations.4.description	Réserve naturelle nationale, cette zone humide de 447 hectares est également inscrite à la convention internationale Ramsar. Le site présente une valeur faunistique forte, avec de nombreuses espèces patrimoniales (oiseaux, poissons, macro-crustacés, insectes) malgré la présence d’espèces introduites.	\N	\N	\N	f
43623	1021	TEXT	risks.risks.0.name	Une pression démographique importante	\N	\N	\N	f
43624	1021	IMAGE	interests.locations.1.image	\N	1156	Vue sur le cirque de Mafate © Céline Soyer	\N	f
43625	1021	IMAGE	ecosystems.ecosystems.1.image	\N	1100	© Philippe Gourdain	\N	f
43626	1021	TEXT	interests.locations.3.description	Vestige de forêt humide primaire de basse altitude du sud sauvage, cette forêt a poussé sur une ancienne coulée de lave. Aujourd’hui réduite à une centaine d’hectares, elle abrite une richesse remarquable en espèces végétales, dont de nombreuses espèces endémiques. Si elle est encore dans un bon état de conservation, la disparition de la faune qui disséminait les graines (oiseaux, tortues géantes, chauves-souris) empêche sa régénération naturelle. 	\N	\N	\N	f
43627	1021	TEXT	identity.title	La Réunion,  \npoint chaud de l’océan Indien	\N	\N	\N	f
43628	1021	IMAGE	species.6.image	\N	1192	Image manquante	\N	f
43629	1021	TEXT	interests.locations.1.name	Les cirques de Mafate, Cilaos et Salazie	\N	\N	\N	f
43630	1021	TEXT	statistics.2.text	de plantes vasculaires indigènes	\N	\N	\N	f
43631	1021	IMAGE	species.0.image	\N	1097	*Phelsuma inexpectata* © Philippe Gourdain	\N	f
43632	1021	TEXT	events.1.date	-22 000 ans	\N	\N	\N	f
43633	1021	TEXT	interests.locations.4.name	[L’étang de Saint-Paul](https://reserve-etangsaintpaul.fr/fr/accueil)	\N	\N	\N	f
47504	1013	TEXT	understand.keyword	especes	\N	\N	\N	f
47505	1013	TEXT	ecogestures.title	Comment aider à la progression des connaissances scientifiques ?	\N	\N	\N	f
47506	1013	IMAGE	presentation.image	\N	1050	© Fabien Lefebvre	\N	f
47507	1013	TEXT	understand.paragraphs.1.title	Encore un grand nombre d’espèces inconnues	\N	\N	\N	f
47508	1013	TEXT	understand.paragraphs.0.text	Parmi les espèces récemment décrites dans les territoires d’outre-mer français, se trouvent par exemple une nouvelle espèce de grenouille, la Rainette *Boana courtoisae* en Guyane, un serpent fouisseur, *Madatyphlops eudelini*, à Mayotte ou encore *[Psychotria paulae](https://inpn.mnhn.fr/espece/cd_nom/851490)*, une plante extrêmement rare, endémique de Tahiti (Polynésie française).  \n  \nCes découvertes sont parfois réalisées parmi les spécimens conservés dans des musées, collectés depuis longtemps sans avoir été correctement identifiés. Malheureusement, il arrive qu’il s’agisse d’espèces déjà éteintes dans la nature, c’est par exemple le cas en Guadeloupe du lézard  *Leiocephalus roquetus* décrit en 2021. 	\N	\N	\N	f
47509	1013	IMAGE	understand.image	\N	1343	Tri d’échantillons récoltés sur le terrain en Guyane © Guillaume Feuillet 	\N	f
47510	1013	TEXT	presentation.description	nouvelles espèces décrites par an en outre-mer	\N	\N	\N	f
47511	1013	TEXT	presentation.logoUrl	https://inpn.mnhn.fr/docs/communication/livretInpn/Livret-INPN-especes-2020.pdf	\N	\N	\N	f
55873	1040	TEXT	interests.locations.8.description	L’île est la plus riche en oiseaux terrestres endémiques de Polynésie française car c’est seule île habitée des Marquises où le rat noir ([*Rattus rattus*](https://inpn.mnhn.fr/espece/cd_nom/61587)) n’est pas présent. On y trouve notamment la Perruche des Marquises ([*Vini ultramarina*](https://inpn.mnhn.fr/espece/cd_nom/418850)), le Monarque de Ua Huka ([*Pomarea iphis*](https://inpn.mnhn.fr/espece/cd_nom/418876)) ou encore la Rousserolle des Marquises nord ([*Acrocephalus percernis*](https://inpn.mnhn.fr/espece/cd_nom/644051)).	\N	\N	\N	f
55874	1040	TEXT	interests.locations.5.description	Ce vaste ensemble regroupe 76 atolls de taille et forme variées, dont des atolls soulevés comme Makatea. Les fonds marins y sont d’une grande richesse. Les atolls de Mururoa et Fangataufa sont tristement célèbres pour avoir été le lieu des essais nucléaires français entre 1966 et 1995.	\N	\N	\N	f
55875	1040	TEXT	interests.locations.9.description	Situés à l’est de la Polynésie française, les Gambier regroupent 14 îles hautes dont Mangareva, la plus grande, ainsi que quelques atolls.	\N	\N	\N	f
55876	1040	TEXT	ecosystems.ecosystems.0.description	compléter	\N	\N	\N	f
55877	1040	TEXT	identity.highestPoint	2 241	\N	\N	\N	f
55878	1040	TEXT	interests.locations.4.description	L’île la plus au sud de toute la Polynésie française, au climat subtropical, possède une richesse floristique et faunistique incroyablement élevée compte tenu de sa petite superficie (40 km<sup>2</sup>). Plus de 200 espèces de plantes y sont recensées, dont 30 % d’endémiques strictes, ainsi que des centaines d’invertébrés (insectes et mollusques) endémiques.	\N	\N	\N	f
55879	1040	TEXT	risks.risks.0.name	Un lien indissociable entre nature et culture mais une biodiversité vulnérable	\N	\N	\N	f
55880	1040	IMAGE	interests.locations.1.image	\N	1687	Forêt de Raiatea, Société © Céline Soyer	\N	f
55881	1040	TEXT	interests.locations.3.description	Situées au sud-ouest de la Polynésie française, les Australes regroupent 7 petites îles, dont Rapa, avec une richesse floristique et faunistique parmi les plus extraordinaires du monde.	\N	\N	\N	f
55882	1040	TEXT	identity.title	La Polynésie française,  \nun bien commun peuplé d'espèces emblématiques et remarquables	\N	\N	\N	f
55883	1040	TEXT	interests.locations.7.name	Les Marquises	\N	\N	\N	f
55884	1040	IMAGE	species.6.image	\N	1753	Coquille de *Charonia tritonis* © Antano	\N	f
55885	1040	TEXT	interests.locations.1.name	Raiatea (Société)	\N	\N	\N	f
55886	1040	TEXT	statistics.2.text	de mollusques terrestres, dont 95 % d'endémiques	\N	\N	\N	f
55887	1040	IMAGE	species.0.image	\N	1747	*Sclerotheca raiateensis* © Fred Jacq	\N	f
55888	1040	TEXT	events.1.date	300 	\N	\N	\N	f
55889	1040	TEXT	interests.locations.4.name	Rapa (Australes)	\N	\N	\N	f
55890	1040	TEXT	interests.locations.7.description	En marquisien *Fenua Enata*, la « Terre des Hommes », les Marquises regroupent 14 îles aux reliefs escarpés qui ne sont pas entourées par un récif de corail. Les écosystèmes marins des Marquises sont particulièrement riches en nutriments d’où la présence et l’abondance d’espèces remarquables comme les cétacés. La candidature des Marquises à l’inscription au patrimoine naturel et culturel de l’UNESCO est en cours d’instruction.	\N	\N	\N	f
54120	1041	TEXT	risks.risks.0.description	Bien que la Réserve naturelle nationale des Terres australes françaises constitue un territoire extrêmement préservé, il n’en demeure pas moins qu'il est sujet à un certain nombre de pressions qui relèvent non seulement de facteurs externes, ne pouvant être traités qu’à l’échelle de la planète (changements climatiques, polluants atmosphériques, etc.), mais également de facteurs locaux, liées aux activités humaines passées et/ou présentes sur ces îles :  \n  \nUn vaste cortège d’espèces végétales et animales ont été introduites au cours du temps, volontairement ou involontairement. C’est le cas, entre autres, des mammifères terrestres (rongeurs, lapins, chats). Les interactions entre ces espèces importées avec la flore et la faune locale sont relativement bien connues. Afin de réduire la probabilité de nouvelles introductions sur le territoire, des procédures strictes de biosécurité sont été mises en place par la Réserve avant tout accès.  \n  \nDes activités de pêche se déroulent dans la partie marine de la Réserve. La pêcherie de Kerguelen et de Crozet cible exclusivement la légine australe ([*Dissostichus eleginoides*](https://inpn.mnhn.fr/espece/cd_nom/424025)) mais entraine la capture d’espèces accessoires qui sont peu ou pas valorisées commercialement. Les oiseaux marins, attirés par les hameçons appâtés lors de la mise à l’eau des lignes et de leur remontée à bord, sont particulièrement vulnérables. Les prescriptions techniques mises en place par les TAAF pour limiter cette mortalité aviaire montrent de bons résultats. La déprédation des lignes par les orques et les cachalots, qui conduit à des modifications comportementales de ces mammifères marins et à une pression accrue sur la ressource, constitue un autre enjeu de gestion des pêcheries. Autour des îles Saint-Paul et Amsterdam, la pêche pratique est à la langouste et aux poissons. Si la pression exercée par les casiers et les engins de pêche sur certaines espèces et habitats est réelle, elle n’est néanmoins pour l’instant pas véritablement évaluée.  \n  \nLes autres menaces, bien que prises en compte par la Réserve naturelle dans le cadre de son plan de gestion, sont considérées comme mineures.  \nPour en savoir plus sur ces territoires, consultez le site des [Terres australes et antarctiques françaises](https://taaf.fr/) et le site de [la Réserve naturelle nationale des Terres australes françaises](https://reserve-australes.taaf.fr/). \n	\N	\N	\N	f
54121	1041	TEXT	events.3.date	1522	\N	\N	\N	f
54122	1041	IMAGE	species.3.image	\N	1724	Mâle de *Mirounga leonina* au milieu des manchots royaux © Julie Tucoulet	\N	f
54123	1041	TEXT	species.1.name	Les albatros	\N	\N	\N	f
54124	1041	TEXT	species.7.name	Le Phylica	\N	\N	\N	f
54125	1041	TEXT	interests.title	Les différentes îles	\N	\N	\N	f
54126	1041	TEXT	ecosystems.ecosystems.0.description	NA	\N	\N	\N	f
54127	1041	TEXT	identity.highestPoint	1 850	\N	\N	\N	f
54128	1041	TEXT	risks.risks.0.name	Un sanctuaire préservé, mais soumis à des pressions	\N	\N	\N	f
54129	1041	IMAGE	interests.locations.1.image	\N	1729	La base Port aux Français, Kerguelen © Bruno Marie	\N	f
54130	1041	TEXT	identity.title	Les Terres Australes françaises	\N	\N	\N	f
54131	1041	TEXT	species.4.name	L’Otarie à fourrure d’Amsterdam 	\N	\N	\N	f
54132	1041	TEXT	identity.area	7 621 	\N	\N	\N	f
54133	1041	TEXT	species.0.description	Les îles australes, et l’archipel Crozet en particulier, accueillent les plus grandes populations de manchots royaux ([*Aptenodytes patagonicus*](https://inpn.mnhn.fr/espece/cd_nom/441650)) du monde. Leurs immenses colonies peuvent parfois atteindre plus d’un million d’individus. Excellent plongeur, le manchot royal se nourrit en mer de poissons-lanternes et de calmars. On le distingue du Manchot empereur ([*Aptenodytes forsteri*](https://inpn.mnhn.fr/espece/cd_nom/441649)), qui vit en Antarctique, par sa tâche auriculaire (autour de l’oreille) jaune en forme de cuillère. Le duvet du jeune manchot avant sa première mue est marron, ce qui lui vaut le surnom de « kiwi ».  \n  \nStatut sur la Liste rouge des oiseaux des TAAF : préoccupation mineure. 	\N	\N	\N	f
54134	1041	IMAGE	species.6.image	\N	1731	*Pringlea antiscorbutica* © Julie Tucoulet	\N	f
54135	1041	TEXT	identity.highestPointName	Mont Ross (Kerguelen)	\N	\N	\N	f
54136	1041	TEXT	interests.locations.1.name	Kerguelen	\N	\N	\N	f
54137	1041	TEXT	statistics.2.text	de végétaux indigènes	\N	\N	\N	f
54138	1041	IMAGE	species.0.image	\N	1734	Couple d"*Aptenodytes patagonicus* et leur œuf © Julie Tucoulet	\N	f
54139	1041	TEXT	events.1.date	-8 millions d’années 	\N	\N	\N	f
51805	1038	TEXT	events.2.description	Deuxième abolition de l’esclavage en France, après une première abolition en 1794 et un rétablissement en 1804	\N	\N	\N	f
51806	1038	TEXT	events.3.description	Ouverture du bagne, lieu de déportation pour les condamnés aux travaux forcés jusqu’en 1946	\N	\N	\N	f
51807	1038	IMAGE	identity.image	\N	1581	image provisoire	\N	f
51808	1038	TEXT	events.7.description	Création du Groupe d'étude et de protection des oiseaux de Guyane (GEPOG)	\N	\N	\N	f
51809	1038	TEXT	events.7.date	1993 	\N	\N	\N	f
51810	1038	TEXT	interests.locations.0.name	Le Parc Amazonien de Guyane	\N	\N	\N	f
51811	1038	TEXT	events.0.description	Premières traces d’occupation humaine dans les Guyanes	\N	\N	\N	f
51812	1038	TEXT	events.1.description	Premières implantations européennes. L’introduction de nouvelles maladies provoquera une baisse démographique brutale chez les amérindiens.	\N	\N	\N	f
51813	1038	TEXT	events.8.description	Construction du barrage du Petit Saut	\N	\N	\N	f
51814	1038	TEXT	events.9.description	Création de la Réserve naturelle nationale des Nouragues	\N	\N	\N	f
51815	1038	IMAGE	ecosystems.image	\N	1689	Couple de Hoazins huppés © Gwen Quérel / RNN Kaw-Roura	\N	f
51816	1038	TEXT	identity.species	27 794	\N	\N	\N	f
51817	1038	IMAGE	ecosystems.ecosystems.0.image	\N	1617	Forêt dense humide © Sylvain Santelli	\N	f
51818	1038	TEXT	events.6.description	Création de la Réserve naturelle nationale de l’île du Grand Connétable	\N	\N	\N	f
51819	1038	TEXT	events.6.date	1992	\N	\N	\N	f
51820	1038	TEXT	events.4.description	Départementalisation de la Guyane	\N	\N	\N	f
51821	1038	TEXT	events.5.description	Création du Centre spatial guyanais à Kourou	\N	\N	\N	f
51822	1038	TEXT	statistics.4.text	de poissons d'eau douce et saumâtre	\N	\N	\N	f
51823	1038	TEXT	interests.locations.2.name	Les Nouragues	\N	\N	\N	f
51824	1038	TEXT	ecosystems.ecosystems.3.description	Les savanes de Guyane occupent très peu d’espace, seulement 0,3% du territoire. Ce sont des milieux ouverts herbacés, avec quelques arbres ou arbustes plus ou moins isolés, qui se trouvent répartis sur une fine bande le long de la côte, entre la forêt et les zones de marais, sur les plaines basses de sédiments argilo-sableux. Malgré leur faible étendue, elles représentent un milieu remarquable pour la biodiversité : elles abritent 16 % de la flore guyanaise et la végétation y est très spécialisée. \nLes savanes sont menacées par l’expansion démographique, ainsi que l’introduction de deux arbres envahissants, l’[*Acacia mangium*](https://inpn.mnhn.fr/espece/cd_nom/447341) et le Niaouli ([*Melaleuca quinquenervia*](https://inpn.mnhn.fr/espece/cd_nom/447400)) qui entrainent la fermeture du milieu. Depuis 2011, le Groupe d’étude et de protection des oiseaux de Guyane (GEPOG) mène des actions pour la [conservation des savanes de Guyane](https://www.savanes.fr/), dont la lutte contre les espèces végétales envahissantes, d’abord dans le cadre du programme LIFE+ Cap DOM, puis du LIFE+ BIODIV’OM.	\N	\N	\N	f
51825	1038	TEXT	ecosystems.ecosystems.4.description	De nombreuses zones humides se situent le long du trait de côte, en retrait des mangroves et en bordure des savanes. Des marais herbacés aux forêts marécageuses, on trouve une diversité de formations végétales qui abritent une faune importante, notamment des caïmans noirs, de nombreuses espèces de poissons d’eau douce ou saumâtre, des crustacés, de nombreux oiseaux en particulier des limicoles et des rapaces ou encore le remarquable Hoazin huppé ([*Opisthocomus hoazin*](https://inpn.mnhn.fr/espece/cd_nom/442155)).	\N	\N	\N	f
51826	1038	TEXT	ecosystems.ecosystems.4.name	Les marais et les forêts marécageuses	\N	\N	\N	f
51827	1038	TEXT	statistics.3.text	d'oiseaux	\N	\N	\N	f
51828	1038	TEXT	events.10.date	1996	\N	\N	\N	f
51829	1038	IMAGE	species.1.image	\N	1608	*Dendrobates tinctorius* © Raphaël Gailhac	\N	f
51830	1038	TEXT	events.5.date	1964	\N	\N	\N	f
51831	1038	TEXT	identity.marineArea	131 506	\N	\N	\N	f
51832	1038	TEXT	events.8.date	1994	\N	\N	\N	f
51833	1038	IMAGE	interests.locations.0.image	\N	1582	image manquante	\N	f
51834	1038	TEXT	species.6.name	Le Palmier pinot	\N	\N	\N	f
51835	1038	IMAGE	interests.locations.3.image	\N	1606	Plage d'Awala-Yalimapo © Raphaël Gailhac	\N	f
51836	1038	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
51837	1038	TEXT	interests.locations.3.name	Les plages d'Awala-Yalimapo	\N	\N	\N	f
51838	1038	TEXT	events.12.date	2006	\N	\N	\N	f
51839	1038	TEXT	statistics.1.text	espèces d'arbres	\N	\N	\N	f
51840	1038	TEXT	events.9.date	1995	\N	\N	\N	f
51841	1038	IMAGE	species.4.image	\N	1614	*Pteronura brasiliensis* © Fabien Lefebvre	\N	f
51842	1038	TEXT	events.3.date	1852	\N	\N	\N	f
51843	1038	IMAGE	ecosystems.ecosystems.3.image	\N	1619	Savanes de Guyane © Bernard G.	\N	f
51844	1038	IMAGE	species.3.image	\N	1610	*Panthera onca* © Raphaël Gailhac	\N	f
51845	1038	TEXT	species.1.name	Le Dendrobate à tapirer	\N	\N	\N	f
51846	1038	TEXT	species.7.name	Le Fromager	\N	\N	\N	f
51847	1038	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
51848	1038	TEXT	species.4.name	Les loutres	\N	\N	\N	f
51849	1038	TEXT	identity.area	83 846	\N	\N	\N	f
51850	1038	TEXT	species.0.description	Atteignant jusqu’à 17 cm de long, le Titan ([*Titanus giganteus*](https://inpn.mnhn.fr/espece/cd_nom/758743)) est le plus grand coléoptère du monde. On connait cependant peu de choses sur sa biologie : si les mâles sont attirés par la lumière, ce n’est pas le cas des femelles qui sont rarement observées. On suppose que les larves se développent dans le sol, au niveau des racines ou des souches, et consomment du bois décomposé.  \nCe longicorne attire particulièrement les collectionneurs, c’est pourquoi depuis le 25 juillet 2019, il existe un quota d’export limitant l’exportation à un spécimen par personne et par an.\nL’inventaire des insectes de Guyane est encore largement incomplet. Si la diversité des insectes est très importante, l’abondance de chaque espèce est généralement faible, ce qui rend leur recensement complexe.  \n  \nStatut sur la Liste rouge mondiale : non évalué.	\N	\N	\N	f
51851	1038	TEXT	identity.highestPointName	Montagne Bellevue	\N	\N	\N	f
51852	1038	TEXT	ecosystems.ecosystems.2.name	Les mangroves	\N	\N	\N	f
51853	1038	TEXT	species.7.description	Le Fromager ([*Ceiba pentandra*](https://inpn.mnhn.fr/espece/cd_nom/447007)) est un arbre géant largement répandu dans les forêts humides d’Amérique, d’Afrique et d’Asie. Très imposant, il peut atteindre plusieurs dizaines de mètres de haut et développe des contreforts avec l’âge. Son tronc lisse est pourvu de nombreuses épines coniques. Un individu particulièrement imposant (50 m de haut pour 40 m de circonférence) est observable dans le village de Saül. \nEn Guyane comme dans toute l’Amérique tropicale, cet arbre majestueux tient une place importante dans la cosmogonie de nombreux peuples, il est lié au chamanisme et est réputé habité par des esprits puissants et parfois dangereux. Ses contreforts sont appréciés par les Wayana pour faire des ciels de cases (disque rond occupant le faîte de leur maison ronde communautaire).\n\nStatut sur la Liste rouge mondiale : préoccupation mineure.\n	\N	\N	\N	f
51854	1038	IMAGE	species.2.image	\N	1609	*Ramphastos tucanus* © Raphaël Gailhac	\N	f
51855	1038	IMAGE	ecosystems.ecosystems.4.image	\N	1620	Rivière et marais de Kaw © Pierre-Olivier Jay	\N	f
51856	1038	TEXT	species.3.description	Solitaire et discret, le Jaguar ([*Panthera onca*](https://inpn.mnhn.fr/espece/cd_nom/443623)) est présent sur tout le département. Le félin tacheté est menacé par la destruction et la fragmentation de son habitat, la raréfaction des proies et le braconnage, bien que les populations soient considérées plutôt en bon état sur le territoire guyanais. \nIl tient une place importante dans les cultures amérindiennes, bushinenguées et créole. Souvent lié au chamanisme, et il représente également un personnage un peu lourdaud et pataud dans les contes populaires guyanais.\nLes attaques de ce carnivore sur les animaux domestiques, en particulier les chiens, sont relativement fréquentes en milieu péri-urbain. Un [guide pour une coexistence homme-jaguar](https://guyane.ofb.fr/wp-content/uploads/2021/04/OFB_LivretJaguar_MAJ_032020.pdf) est proposé par l’Office français de la biodiversité pour diminuer ces conflits. \n\nStatut sur la Liste rouge des mammifères de Guyane : quasi-menacé. \n	\N	\N	\N	f
51857	1038	TEXT	statistics.3.number	Près de 700 espèces	\N	\N	\N	f
51858	1038	TEXT	statistics.4.number	Plus de 500 espèces	\N	\N	\N	f
51859	1038	TEXT	species.1.description	Le Dendrobate à tapirer ([*Dendrobates tinctorius*](https://inpn.mnhn.fr/espece/cd_nom/436851)) est un amphibien présentant des variations de coloration allant du bleu au jaune, plus ou moins maculé de noir. Il vit principalement au sol mais on peut également l’observer dans les arbres. \nLes glandes présentes dans sa peau sécrètent un poison toxique, qui la protègent des prédateurs. Pour l’homme, elle n’est dangereuse que si le mucus qui la recouvre entre en contact avec une plaie ou des muqueuses. Les Amérindiens en faisaient une préparation qu’ils appliquaient sur des plumes d’oiseaux vertes pour leur donner une coloration jaune ou rouge et dont ils faisaient des parures. \nLe Dendrobate à tapirer est inscrit sur la liste des amphibiens de Guyane protégés sur l’ensemble du territoire national.\n  \nStatut sur la Liste rouge des amphibiens de Guyane : préoccupation mineure. 	\N	\N	\N	f
51860	1038	TEXT	species.2.description	Sept espèces de toucan, oiseaux à grand bec de la famille des Ramphastidés, sont présentes en Guyane. Le Toucan ariel ([*Ramphastos vitellinus*](https://inpn.mnhn.fr/espece/cd_nom/442312)) et le Toucan à bec rouge ([*Ramphastos tucanus*](https://inpn.mnhn.fr/espece/cd_nom/442311)) sont communément observés, notamment en fin de saison des pluies, où ils viennent dans la partie côtière s’alimenter sur les palmiers en fruits. Le Toucan toco ([*Ramphastos toco*](https://inpn.mnhn.fr/espece/cd_nom/442310)) est le plus grand représentant de cette famille. Caractérisé par son bec orange, il est plus rare et observable uniquement au nord du département. C’est la seule espèce de toucan intégralement protégée.  \nMalgré sa taille, la structure du bec des toucans est très légère et solide, formée de kératine et renforcée par des os poreux très légers.  \n\nStatut sur la Liste rouge des oiseaux de Guyane : \nToucan ariel : préoccupation mineure. \nToucan à bec rouge : préoccupation mineure. \nToucan toco : en danger. \n	\N	\N	\N	f
51861	1038	TEXT	statistics.1.number	Plus de 1 800	\N	\N	\N	f
51862	1038	TEXT	statistics.0.number	96 %	\N	\N	\N	f
51863	1038	TEXT	statistics.2.number	600 km<sup>2</sup>	\N	\N	\N	f
51864	1038	IMAGE	interests.locations.4.image	\N	1688	Lac Pali, dans les marais de Kaw © Andréa Poiret	\N	f
51865	1038	TEXT	species.2.name	Les toucans	\N	\N	\N	f
51866	1038	TEXT	risks.risks.1.name	Le fléau de l’orpaillage illégal	\N	\N	\N	f
51867	1038	TEXT	species.4.description	Deux espèces de loutres, la Loutre géante ([*Pteronura brasiliensis*](https://inpn.mnhn.fr/espece/cd_nom/443628)) et la Loutre commune ([*Lontra longicaudis*](https://inpn.mnhn.fr/espece/cd_nom/443627)) vivent dans les cours d’eau et sur les berges de Guyane. La première, de grande taille (jusqu’au 1,80 m de long), vit en groupes familiaux tandis que la seconde, plus petite, est souvent solitaire. \nConsommatrices de poissons et très sensibles à la dégradation des habitats, les loutres peuvent être considérées comme des indicatrices de la qualité des écosystèmes aquatiques. La loutre géante a fait l’objet d’une chasse intensive pour sa peau au siècle dernier, ce qui l’a conduite au bord de l’extinction au début des années 1970. Les deux espèces sont intégralement protégées mais leur habitat est fortement impacté par l’orpaillage. \n\nStatut sur la Liste rouge des mammifères de Guyane :\nLoutre géante : en danger. \nLoutre commune : préoccupation mineure. \n	\N	\N	\N	f
51868	1038	TEXT	ecosystems.ecosystems.0.name	La forêt humide	\N	\N	\N	f
51869	1038	TEXT	species.5.description	Les plages de Guyane comptent parmi les plus importants sites de ponte de tortues marines au monde. Elles accueillent principalement trois espèces : la Tortue verte ([*Chelonia mydas*](https://inpn.mnhn.fr/espece/cd_nom/77338)), la Tortue olivâtre ([*Lepidochelys olivacea*]) et la Tortue luth ([*Dermochelys coriacea*](https://inpn.mnhn.fr/espece/cd_nom/77367)). \nLa Tortue luth est la plus grosse espèce de tortue marine au monde, avec un poids moyen de 450 kg pour une taille de près d’1,60 mètre et elle se nourrit essentiellement de méduses. Contrairement aux autres tortues marines, elle ne possède pas d’écailles mais une dossière en cuir très épais, qui lui permet de plonger plus profondément que les autres espèces. Grandes migratrices, les tortues luths remontent jusqu’au nord de l’Atlantique. \nDe nombreuses menaces pèsent sur les tortues marines : braconnage, prises accidentelles dans les filets de pêche, prédation par des chiens errants, collisions avec des bateaux. En Guyane, il semble que les pontes de Tortue luth se raréfient ces dernières années. L’Office français de la biodiversité anime le plan national d’action Tortues marine en Guyane et coordonne l’ensemble des acteurs liés à leur protection. \n\nStatut sur la Liste rouge des reptiles de Guyane française : en danger\n	\N	\N	\N	f
51870	1038	TEXT	species.6.description	Également nommé wassaï (ou açaï), le Palmier pinot ([*Euterpe olaracea*](https://inpn.mnhn.fr/espece/cd_nom/731659)) produit des fruits de couleur violet très foncé utilisés pour de nombreux usages (jus, huile, poudre). Ils poussent en grappes le long du tronc qui peut s’élever jusqu’à 20 m de hauteur, et sont également consommés par la faune sauvage. Ces palmiers sont particulièrement présents en zones marécageuses où ils peuvent former de véritables « pinotières ».\nUtilisées depuis des siècles par les peuples d’Amazonie, les fruits du wassaï font désormais l’objet d’un intérêt mondial sur les marchés de l’alimentation, la cosmétique et la médecine. \n\nStatut sur la Liste rouge mondiale : non évalué.\n	\N	\N	\N	f
51871	1038	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
51872	1038	TEXT	events.0.date	-13 000 ans	\N	\N	\N	f
51873	1038	TEXT	identity.populationYear	2019	\N	\N	\N	f
51874	1038	IMAGE	species.5.image	\N	1612	*Dermochelys coriacea* © Raphaël Gailhac	\N	f
51875	1038	TEXT	events.13.date	2007	\N	\N	\N	f
51876	1038	TEXT	statistics.0.text	du territoire est recouvert de forêts	\N	\N	\N	f
51877	1038	TEXT	ecosystems.ecosystems.1.name	Les inselbergs	\N	\N	\N	f
51878	1038	TEXT	events.2.date	1844	\N	\N	\N	f
51879	1038	TEXT	identity.presentation	Située entre le Brésil et le Suriname, la Guyane est le plus vaste territoire d’outre-mer français, et le seul non insulaire. Il est en majorité recouvert de forêts tropicales humides, excepté sur la bande côtière où se trouve une mosaïque d’habitats plus ou moins ouverts : plages, mangroves, savanes, forêts marécageuses et marais. Il est difficile de résumer la diversité des espèces guyanaises tant elle est vaste, aussi bien chez la faune que la flore, et une grande partie est encore largement méconnue. Un hectare de forêt peut abriter plus de 300 espèces d’arbres, soit plus d’espèces qu’il n’y en a dans toute l’Europe continentale, et la diversité totale des insectes de Guyane est estimée à plus de 100 000 espèces. Bien que les milieux guyanais soient encore relativement préservés des activités humaines, certaines pressions, dont l’orpaillage, sont très préoccupantes.	\N	\N	\N	f
51880	1038	TEXT	identity.population	296 711	\N	\N	\N	f
51881	1038	TEXT	species.3.name	Le Jaguar	\N	\N	\N	f
51882	1038	TEXT	risks.risks.2.name	De vastes zones protégées, une gestion en concertation avec les communautés autochtones	\N	\N	\N	f
51883	1038	TEXT	species.0.name	Le Titan	\N	\N	\N	f
51884	1038	TEXT	events.4.date	1946	\N	\N	\N	f
51885	1038	IMAGE	interests.locations.2.image	\N	1615	Dispositif d'étude de la canopée dans la réserve des Nouragues © Pierre-Olivier Jay	\N	f
51886	1038	TEXT	events.11.date	1998	\N	\N	\N	f
51887	1038	IMAGE	ecosystems.ecosystems.2.image	\N	1589	image manquante	\N	f
51888	1038	TEXT	events.10.description	Création de la Réserve naturelle nationale de la Trinité	\N	\N	\N	f
51889	1038	TEXT	events.11.description	Création des réserves naturelles nationales de l’Amana et de Kaw-Roura	\N	\N	\N	f
51890	1038	TEXT	interests.locations.0.description	Créé en 2007, le [Parc amazonien de Guyane](https://www.parc-amazonien-guyane.fr/fr) s’étend sur 40 % du territoire (34 000 km<sup>2</sup>) dans la partie sud de la Guyane. Il représente le plus vaste parc national de France et de l’Union Européenne. Il a pour vocation de préserver la biodiversité exceptionnelle du massif forestier ainsi que les patrimoines culturels et les modes de vie traditionnels des populations, notamment amérindiennes et bushinenguées, vivant sur le territoire. 	\N	\N	\N	f
51891	1038	TEXT	risks.risks.2.description	Le territoire est riche en aires protégées, parmi les plus vastes de France. Outre le parc amazonien de Guyane qui couvre le sud de la Guyane, on compte six réserves naturelles nationales (Marais de Kaw-Roura, Mont Grand Matoury, Trinité, Amana, Grand Connétable et Nouragues) et une réserve naturelle régionale (Trésor). Trois zones humides sont classées au protocole de Ramsar (Basse Mana, les marais de Kaw et l’estuaire des fleuves Sinnamary et Iracoubo) et on compte également 14 000 ha protégés par le Conservatoire du littoral. La Guyane compte également deux réserves biologiques intégrales : la réserve de Petites Montagnes Tortue et la réserve de Lucifer Dékou-Dékou. La création d’une réserve biologique dirigée est en cours.\n\nLa conciliation de la préservation de la biodiversité avec le respect des modes de vie et des traditions des populations est un enjeu fort en Guyane. Le Parc national et l’OFB ont par exemple mené un programme d’étude pour mieux connaître les pratiques de chasse, évaluer l’état de conservation des gibiers et ainsi construire avec les communautés locales des modes de gestion adaptées. \n	\N	\N	\N	f
51892	1038	TEXT	events.13.description	Création du Parc national Amazonien de Guyane	\N	\N	\N	f
51893	1038	TEXT	risks.risks.1.description	La richesse du sol guyanais en ressources aurifères attire les convoitises. L’exploitation illégale, qui a explosé en Guyane ces dernières années, est un fléau pour la biodiversité que les actions de lutte ne réussissent pas à endiguer et qui n’épargne pas les espaces protégés.\n\nMalgré son interdiction en 2006, le mercure continue d’être utilisé par les *garimpeiros* (chercheurs d'or clandestins)pour amalgamer l’or et pollue durablement les cours d’eau et les organismes aquatiques que consomment les populations locales. Les taux de contamination observés chez ces populations sont élevés. Les eaux sont également impactées par le défrichement non raisonné de la forêt qui favorise l’érosion et le lessivage des sols, ils deviennent alors trop turbides et pauvres en oxygènes pour la faune et la flore aquatiques. Aux impacts sur l’environnement s’ajoutent d’importants problèmes humains, de misère sociale, de violence et de conflits avec les populations locales. \n\nDepuis 2008, l’opération Harpie implique de nombreux acteurs du territoire (armée, police, justice, douanes, ONF, PAG) dans des interventions qui visent notamment à bloquer l’acheminement du matériel, et procéder à des saisies et des arrestations. Ce problème complexe nécessite une coopération à l’échelle régionale, les orpailleurs clandestins et le matériel provenant majoritairement des pays limitrophes. Cette opération a permis de contenir le phénomène à l'échelle globale. En 2021, les sanctions pénales encourues par les orpailleurs illégaux ont été renforcées dans le cadre de la nouvelle loi Climat. Le renforcement de la traçabilité de l’or serait également nécessaire.\n\nSi l’activité des exploitants aurifères déclarés est encadrée par des dispositions visant à limiter ses conséquences, elle reste cependant impactante pour les milieux naturels. De plus, l’émergence de projets d’exploitation de l’or à l’échelle industrielle pose d’importante préoccupations. Le projet très controversé de la Montagne d’or à fait l’objet d’une importante opposition de la population locale et des associations environnementales. Il a pour le moment été abandonné mais la prolongation des concessions fait l’objet d’une procédure judiciaire toujours en cours.  \n	\N	\N	\N	f
51894	1038	TEXT	interests.locations.2.description	Créée en 1995, la [Réserve naturelle nationale des Nouragues](http://www.nouragues.fr/) protège 105 800 hectares de forêt, un réseau hydrographique dense avec une grande diversité d’habitats (criques, rivières, sauts rocheux) et des inselbergs. Elle porte le nom des amérindiens qui vivaient dans cette zone jusqu’au 18e siècle. La réserve accueille une station de recherche scientifique gérée par le CNRS, qui permet l’étude des écosystèmes de forêts tropicales à long terme. 	\N	\N	\N	f
51895	1038	TEXT	events.12.description	Création de la réserve naturelle nationale du Mont Grand Matoury	\N	\N	\N	f
51896	1038	TEXT	interests.locations.1.description	A 15 km au large de l’estuaire de l’Approuague, les îles du Grand et du Petit Connétable sont le seul site de reproduction pour les oiseaux marins de la côte amazonienne. Le site accueille chaque année plusieurs dizaines de milliers d’individus qui viennent y nidifier : sternes (dont 1/3 des effectifs mondiaux de la Sterne de Cayenne), frégates superbes, mouettes atricilles et noddis bruns. Le site est classé Réserve naturelle nationale depuis 1992. Le périmètre de la réserve s’étend sur plus de 7 000 ha marins autour des îles, permettant la conservation d’espèces marines menacées comme le Mérou géant.	\N	\N	\N	f
51897	1038	TEXT	ecosystems.ecosystems.3.name	Les savanes	\N	\N	\N	f
51898	1038	TEXT	identity.subtitle	Une diversité biologique exceptionnelle	\N	\N	\N	f
51899	1038	IMAGE	species.7.image	\N	1616	*Ceiba pentandra* © Jean-Christophe Marsy	\N	f
51900	1038	TEXT	species.5.name	La Tortue Luth	\N	\N	\N	f
51901	1038	TEXT	risks.risks.0.description	La richesse des écosystèmes de Guyane est impressionnante, aussi bien en vertébrés qu’en invertébrés, et surtout en végétaux. La diversité floristique a une répartition assez hétérogène : un petit nombre d’espèces est représenté par un grand nombre d’individus alors qu’un grand nombre d’espèces n’est représenté que par quelques individus. Relativement peu d’espèces sont endémiques strictes du territoire, la plupart se retrouvent également sur le reste du plateau des Guyanes. On peut cependant noter un endémisme important au niveau des poissons d’eau douce (35 à 40 % des espèces) dont la répartition peut parfois être très limitée.  \n\nIl n’y a pas de récifs coralliens dans les eaux de Guyane, les côtes sont instables en raison des apports de sédiments de l’Amazone qui forment des bancs de vase se déplaçant de 900 m environ par an, colonisés par la mangrove. Cependant, bien que sans originalité, les eaux guyanaises sont riches en poissons et abritent plusieurs espèces de requins dont le requin Pèlerin et le Grand requin marteau, ainsi qu’une vingtaine d’espèces de cétacés. \n\nLa Guyane est peu densément peuplée, et la majorité de la population se concentre sur la bordure atlantique. Bien que la forêt reste peu impactée, notamment au regard des pays voisins (Brésil), de nouvelles routes ouvrent des accès à des zones autrefois préservées. L’augmentation rapide de la démographie et les nouveaux aménagements qui l’accompagnent sont l’une des causes majeures de dégradation des milieux, en particulier sur le littoral.  \n\nL’espace maritime guyanais reste peu exploré. La pêche illégale pratiquée par les pêcheurs venus du Suriname et du Brésil impacte les stocks de poissons guyanais et les filets utilisés sont une cause de mortalité importante pour les tortues et les mammifères marins. \n\nLa règlementation du Code de l’environnement concernant la chasse ne s’applique pas en Guyane. Le permis de chasser n’est obligatoire que depuis janvier 2020. Le braconnage et le non-respect des règles de chasse (quotas, espèces chassables mais non commercialisables, périodes de chasse) sont des infractions régulièrement observées qui impactent la survie des espèces menacées. \n \nConstruit en 1994 sur le Sinnamary pour combler les besoins en électricité de la population guyanaise, le barrage de Petit Saut a eu un fort impact sur l’équilibre écologique de la région. La retenue d’eau de 365 km<sup>2</sup> ainsi créée a inondé brutalement la forêt, et la dégradation progressive de la matière organique immergée provoque des rejets de gaz (dioxyde de carbone, méthane, sulfure d’hydrogène) et une anoxie de l’eau, néfaste aux organismes aquatiques. Ces paramètres sont encore étudiés aujourd’hui afin de suivre l’impact de la construction du barrage à long terme.\n	\N	\N	\N	f
51902	1038	TEXT	ecosystems.ecosystems.2.description	Les mangroves sont des forêts localisées le long du littoral et des estuaires, dans la zone de balancement des marées. Elles sont formées principalement de palétuviers, des arbres aux racines en échasses, qui s’accommodent des conditions de vie en eaux saumâtres et dans des sols pauvres en oxygène. A l’interface entre le milieu marin et le milieu terrestre,\nelles ont un rôle très important pour la biodiversité et accueillent de nombreuses espèces de poissons, crustacés et oiseaux et ont un rôle de nurserie pour la faune marine. \nEn Guyane, les mangroves du littoral sont mobiles : elles se développent sur les bancs de vase issus de l’Amazone, qui se déplacent d’est en ouest suivant le courant équatorial.\n	\N	\N	\N	f
51903	1038	TEXT	ecosystems.ecosystems.1.description	De l’allemand « insel » : île et « berg » : montagne, ces sommets granitiques dénudés émergeant de la forêt amazonienne sont aussi appelés « savane-roches ». La roche nue est colonisée par des cyanobactéries, algues bleues microscopiques qui vont par la suite permettre l’installation des plantes vasculaires. On trouve sur les inselbergs de nombreuses espèces végétales caractéristiques dites lithophytes, adaptées aux conditions drastiques de sécheresse et fort ensoleillement, relictuelles des périodes de climat plus sec dans le bassin amazonien. En raison de leur isolement, certains inselbergs abritent des espèces endémiques. On compte environ 200 inselbergs en Guyane, en majorité dans le sud, le plus haut culminant à 740 m.  	\N	\N	\N	f
51904	1038	TEXT	ecosystems.ecosystems.0.description	La forêt humide tropicale couvre plus de 80 % du territoire de la Guyane et la diversité floristique y est exceptionnelle. Malgré une apparente uniformité, elle recèle de nombreuses variations de type en fonction de la prépondérance de certaines grandes familles botaniques et de facteurs physico-chimiques multiples, comme l’altitude, la nature du sol ou la pluviométrie. \nDans le sous-bois, les plantes développent des stratégies leur permettant de vivre avec peu de lumière tandis qu’au sommet, la canopée s’étend à 30 à 40 m du sol. L’humidité ambiante favorise le développement de mousses et de lichens qui s’installent parfois à la surface des feuilles, et de champignons qui jouent un rôle écologique important. \nLes chablis (chutes naturelles d’arbres, dus à des évènements climatiques comme les fortes pluies) permettent une régénération naturelle de la forêt en ouvrant des clairières qui permettent l’arrivée de la lumière dans le sous-bois et favorisent certaines espèces dites pionnières à la croissante extrêmement rapide.\n	\N	\N	\N	f
51905	1038	TEXT	identity.highestPoint	851	\N	\N	\N	f
51906	1038	TEXT	interests.locations.4.description	Sur la côte sud-est de la Guyane, cette zone de marais et forêts marécageuses est accessible uniquement par voie fluviale. On y trouve des espèces remarquables comme le Caïman noir et le Lamantin, et une très grande diversité d’oiseaux, dont le Coq-de-roche et la Harpie Féroce. Cette vaste zone humide est classée Réserve naturelle nationale depuis 1998.	\N	\N	\N	f
51907	1038	TEXT	risks.risks.0.name	Une biodiversité préservée, mais des impacts humains en expansion	\N	\N	\N	f
51908	1038	IMAGE	interests.locations.1.image	\N	1583	image manquante	\N	f
51909	1038	IMAGE	ecosystems.ecosystems.1.image	\N	1618	Inselberg de la roche Koutou © Olivier Tostain	\N	f
51910	1038	TEXT	interests.locations.3.description	Situées à l’extrémité nord-ouest la Guyane, le long du littoral à proximité de l’embouchure du fleuve Maroni, les plages d’Awala-Yalimapo, sont l’un des sites les plus importants au monde pour la ponte des tortues marines, principalement pour les tortues luths, vertes et olivâtres.  Elles sont protégées au sein de la Réserve naturelle nationale de l’Amana qui s’étend jusqu’à l’embouchure de la rivière Organabo et couvre 14 800 ha de plages, mangroves, marais et savanes. 	\N	\N	\N	f
51911	1038	TEXT	identity.title	La Guyane,  \nun trésor vert	\N	\N	\N	f
51912	1038	IMAGE	species.6.image	\N	1603	image manquante	\N	f
51913	1038	TEXT	interests.locations.1.name	Les îles du Grand et du Petit Connétable	\N	\N	\N	f
51914	1038	TEXT	statistics.2.text	de mangroves	\N	\N	\N	f
51915	1038	IMAGE	species.0.image	\N	1621	*Titanus giganteus* © Julien Touroult	\N	f
51916	1038	TEXT	events.1.date	16<sup>e</sup> siècle 	\N	\N	\N	f
51917	1038	TEXT	interests.locations.4.name	Les marais de Kaw-Roura	\N	\N	\N	f
55788	1040	TEXT	events.2.description	Création de la réserve de biosphère UNESCO de Fakarava	\N	\N	\N	f
55789	1040	TEXT	events.3.description	Publication des Listes rouges des oiseaux et de la flore vasculaire endémique de Polynésie française	\N	\N	\N	f
55790	1040	IMAGE	identity.image	\N	1686	Huahine (archipel de la Société) © Céline Soyer	\N	f
55791	1040	TEXT	interests.locations.0.name	Les îles de la Société	\N	\N	\N	f
55792	1040	TEXT	events.0.description	émergence de l'île de Tahiti	\N	\N	\N	f
55793	1040	TEXT	events.1.description	Premières traces d'occupation humaine des Marquises	\N	\N	\N	f
55794	1040	IMAGE	ecosystems.image	\N	1755	Vue sur les monts Pihaiateta, Pito Hiti et Orohena, Tahiti, Société © Jean-Yves Hiro Meyer / Délégation à la recherche de la Polynésie française	\N	f
55795	1040	TEXT	identity.species	11 776	\N	\N	\N	f
55796	1040	IMAGE	ecosystems.ecosystems.0.image	\N	1666	ajouter	\N	f
55797	1040	TEXT	species.8.name	Les escargots du genre *Partula*	\N	\N	\N	f
55798	1040	TEXT	events.6.description	Création de l'aire marine protégée *Te Tainui Atea*	\N	\N	\N	f
55799	1040	TEXT	events.6.date	2018	\N	\N	\N	f
55800	1040	TEXT	events.4.description	Création du sanctuaire pour les mammifères marins	\N	\N	\N	f
55801	1040	TEXT	events.5.description	Création du sanctuaire pour les requins	\N	\N	\N	f
55802	1040	TEXT	interests.locations.2.name	Tahiti (Société)	\N	\N	\N	f
55803	1040	TEXT	statistics.3.text	de plantes vasculaires indigènes	\N	\N	\N	f
55804	1040	IMAGE	interests.locations.6.image	\N	1694	Plage de Fakarava, Tuamotu © Céline Soyer	\N	f
55805	1040	IMAGE	species.1.image	\N	1749	*Gardenia taitensis* © Eole Wind	\N	f
55806	1040	TEXT	events.5.date	2012	\N	\N	\N	f
55807	1040	TEXT	identity.marineArea	4,8 millions	\N	\N	\N	f
55808	1040	IMAGE	interests.locations.0.image	\N	1691	Vue sur le mont Otemanu, Bora Bora, Société © Julien Meillon	\N	f
55809	1040	TEXT	species.6.name	Le Triton géant (*Pū*)	\N	\N	\N	f
55810	1040	IMAGE	interests.locations.3.image	\N	1744	Raivavae, Australes © Pierre Lesage	\N	f
55811	1040	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
55812	1040	TEXT	interests.locations.3.name	Les Australes	\N	\N	\N	f
55813	1040	TEXT	statistics.1.text	de lagons	\N	\N	\N	f
55814	1040	TEXT	interests.locations.9.name	Les Gambier	\N	\N	\N	f
55815	1040	IMAGE	species.4.image	\N	1750	*Pomarea nigra* © Fred Jacq	\N	f
55816	1040	TEXT	events.3.date	2015	\N	\N	\N	f
55817	1040	IMAGE	species.3.image	\N	1680	à ajouter	\N	f
55818	1040	TEXT	species.1.name	Le *Tiare Tahiti*	\N	\N	\N	f
55819	1040	TEXT	species.7.name	Le Crabe des cocotiers (*‘Aveu ou Kaveu*)	\N	\N	\N	f
55820	1040	TEXT	interests.title	Iles et archipels	\N	\N	\N	f
55821	1040	TEXT	species.4.name	Le Monarque de Tahiti (*‘Omama’o*)	\N	\N	\N	f
55822	1040	TEXT	identity.area	3 520 	\N	\N	\N	f
55823	1040	TEXT	species.0.description	Le *Tiare ‘apetahi* ([*Sclerotheca raiateensis*](https://inpn.mnhn.fr/espece/cd_nom/908708)) est un arbuste strictement endémique de l’île de Raiatea. La cueillette excessive de ses fleurs, l’attaque de ses tiges et son écorce par les rats, le piétinement accidentel de ses plantules par l’Homme, le fouissage des cochons ensauvagés, la compétition avec des plantes exotiques envahissantes et des micro-organismes pathogènes ont conduit à sa raréfaction. L’espèce est protégée depuis 1996 par le Code de l’Environnement polynésien et un plan de conservation a été mis en place en 2009 pour essayer de sauvegarder les dernières populations survivantes.  \n  \nStatut sur la Liste Rouge de la flore vasculaire endémique de Polynésie française : en danger critique.	\N	\N	\N	f
55824	1040	IMAGE	interests.locations.5.image	\N	1692	Motu dans l'atoll de Rangiroa, Tuamotu © Claude Rives	\N	f
55825	1040	TEXT	identity.highestPointName	Mont Orohena (Tahiti)	\N	\N	\N	f
55826	1040	TEXT	species.7.description	Le Crabe des cocotiers ([*Birgus latro*](https://inpn.mnhn.fr/espece/cd_nom/459621)) est le plus gros crabe terrestre au monde : son poids peut atteindre 4 kg et sa longueur 20 cm. Il appartient à la famille des bernard-l'hermite, cependant seuls les juvéniles récupèrent des coquilles de gastéropodes pour protéger leur abdomen. Ce crustacé passe l’ensemble de son cycle de vie sur la terre et possède un régime alimentaire omnivore opportuniste, se nourrissant majoritairement de graines et de fruits, dont les noix de coco, qu’il peut ouvrir grâce à ses pinces puissantes.\nLes populations de crabe des cocotiers sont en régression en Polynésie française en raison de leur surexploitation, car sa chair et ses œufs sont très appréciés. Il est interdit de capturer des individus dont la longueur entre la base de la tête et le début de l’abdomen est inférieure à 6 cm ainsi que les femelles qui portent des œufs ou encore les individus en mue pour ne pas mettre en danger l’espèce.  \n  \nStatut sur la Liste rouge mondiale : vulnérable.\n	\N	\N	\N	f
55827	1040	TEXT	species.8.description	Plus de 500 espèces et sous-espèces de gastéropodes terrestres ont été recensées en Polynésie françaises, et elles sont quasiment toutes endémiques. Leur répartition est parfois très limitée et beaucoup d’espèces sont malheureusement considérées comme éteintes.\nLes petits escargots arboricoles de la famille des Partula étaient autrefois très répandus, et leurs coquilles étaient très appréciées pour la réalisation de colliers. Cependant, l’introduction de l’escargot carnivore [*Euglandina rosea*](https://inpn.mnhn.fr/espece/cd_nom/433018) dans les années 1970, pour lutter contre un autre escargot introduit ([*Lissachatina fulica*](https://inpn.mnhn.fr/espece/cd_nom/824950)), a conduit à l’extinction d’une soixantaine d’espèces de Partulas sur les 75 alors répertoriées. \nOnze d'entre elles étaient encore conservées dans des zoos européens et américains. Un programme de réintroduction des Partulas, mis en place par la Direction de l’environnement de Polynésie française a permis de réintroduire 8 espèces éteintes à l'état sauvage entre 2015 et 2019.\n	\N	\N	\N	f
55828	1040	IMAGE	interests.locations.7.image	\N	1693	Vue aérienne de Nuku Hiva, Marquises © Pamela Carzon	\N	f
55829	1040	IMAGE	species.2.image	\N	1748	*Santalum insulare* © Fred Jacq	\N	f
55830	1040	TEXT	interests.locations.6.name	Fakarava (Tuamotu) 	\N	\N	\N	f
55831	1040	TEXT	species.3.description	A l’origine présent dans plusieurs îles de l'archipel des Australes et des îles Cook, le *‘Ura* ou Lori de Kuhl ([*Vini kuhlii*](https://inpn.mnhn.fr/espece/cd_nom/432653)) ne subsistait plus qu’à Rimarata, la plus petite île des Australes indemne de rat noir, dont il est devenu le symbole. Les chefs locaux utilisaient ses plumes pour se faire des parures, et il doit sa survie sur Rimarata à la reine Tamaeva Vahine qui avait édicté un *tapu* (une interdiction) sur cette utilisation. La population s’élèverai aujourd’hui à environ 850 individus à Rimarata, et il a réintroduit sur l’île de Atiu (îles Cook) en 2007. Une vigilance forte est de mise pour éviter que le rat noir ne s’installe sur l’île et ne l'impacte. Il est également fortement menacé par la destruction de la forêt naturelle.  \n  \nStatut sur la Liste rouge des oiseaux de Polynésie française : en danger critique. 	\N	\N	\N	f
55832	1040	TEXT	statistics.3.number	Plus de 885 espèces 	\N	\N	\N	f
54057	1041	TEXT	species.7.description	Le Phylica ([*Phylica arborea*](https://inpn.mnhn.fr/espece/cd_nom/780147)) est le seul arbre indigène des Terres australes françaises, et il est présent uniquement sur l’île d’Amsterdam. Les incendies et la dégradation par les bovins introduits avaient presque conduit à sa disparition. Il est aujourd’hui au centre d'un programme de restauration mené par la Réserve naturelle nationale des Terres australes françaises qui met en place la plantation de jeunes individus en milieu naturel afin de recréer des boisements sains dans son aire de distribution originelle, après l'éradication des bovins de l'île en 2010. \n  \nStatut sur la Liste rouge mondiale : en danger. \n	\N	\N	\N	f
54058	1041	TEXT	species.8.description	Les orques ([*Orcinus orca*](https://inpn.mnhn.fr/espece/cd_nom/60905)) sont des super-prédateurs fréquemment observées dans les eaux subantarctiques, où elles chassent notamment les juvéniles d’otaries et d’éléphant de mer. Elles vivent en groupes sociaux dirigés par la doyenne des femelles.  \n  \nStatut sur la Liste rouge des mammifères des TAAF : en danger.\n	\N	\N	\N	f
54059	1041	IMAGE	species.9.image	\N	1740	*Anatalanta aptera* © TAAF 	\N	f
54060	1041	TEXT	events.2.description	Émergence des îles Saint-Paul et Amsterdam	\N	\N	\N	f
54061	1041	TEXT	events.3.description	Découverte des îles Saint-Paul et Amsterdam par le navigateur Sébastian Del Cano et les compagnons de Magellan	\N	\N	\N	f
54062	1041	IMAGE	species.2.image	\N	1735	*Eudyptes chrysolophus* © Julie Tucoulet	\N	f
54063	1041	IMAGE	identity.image	\N	1702	Vallée de la Hébé, île de la Possession, Crozet © Julie Tucoulet	\N	f
54064	1041	TEXT	species.3.description	L’Éléphant de mer du sud ([*Mirounga leonina*](https://inpn.mnhn.fr/espece/cd_nom/528709)) est le plus gros représentant de la famille des phoques. Il doit son nom au nez en forme de trompe qui se développe chez les mâles dominants. Sa chasse massive pour sa graisse au cours des 19<sup>e</sup> et 20<sup>e</sup> siècles a mené l’espèce au bord de l’extinction, mais les populations se sont aujourd’hui bien reconstituées. Chaque année, environ 90 000 femelles viennent se reproduire sur les côtes de Kerguelen.  \n  \nStatut sur la Liste rouge des mammifères des TAAF : préoccupation mineure.\n	\N	\N	\N	f
54065	1041	TEXT	events.7.description	Création de la réserve naturelle nationale des Terres australes françaises	\N	\N	\N	f
54066	1041	TEXT	events.7.date	2006	\N	\N	\N	f
54067	1041	TEXT	interests.locations.0.name	L'archipel Crozet	\N	\N	\N	f
54068	1041	TEXT	species.1.description	Avec une envergure pouvant atteindre 3,7 m, l’Albatros hurleur ([*Diomedea exulans*](https://inpn.mnhn.fr/espece/cd_nom/988)) est le plus grand oiseau au monde. Ses longues ailes rendent son envol un peu difficile mais elles lui permettent de planer sans effort sur de grandes distances. Il ne revient sur terre qu’une fois tous les 2 ans pour la saison de reproduction. L’Albatros d’Amsterdam ([*Diomedea amsterdamensis*](https://inpn.mnhn.fr/espece/cd_nom/669383)) est endémique strict de l’île Amsterdam et se reproduit uniquement sur un haut plateau de l’île, le Plateau des Tourbières. La petite taille de sa population, estimée à 210-220 individus, en fait une des espèces d’oiseaux les plus rares au monde, en danger critique d’extinction. Un plan national d’actions vise à sa préservation, sur terre comme en mer. Les 2/3 de la population mondiale d’Albatros à bec jaune ([*Thalassarche carteri*](https://inpn.mnhn.fr/espece/cd_nom/713021)) se reproduisent dans les Terres australes françaises. Sur la seule île Amsterdam, on trouve la plus grande colonie au monde concentrée sur les falaises d’Entrecasteaux, qui représente 60 % de la population mondiale.\nD’autres espèces d’albatros nichent dans les terres australes, comme l’Albatros à sourcils noirs ([*Thalassarche melanophris*](https://inpn.mnhn.fr/espece/cd_nom/442424)) ou l’Albatros fuligineux ([*Phoebetria fusca*](https://inpn.mnhn.fr/espece/cd_nom/442214)).  \n\nStatut sur la Liste rouge des oiseaux des TAAF : \nAlbatros hurleur : en danger critique. \nAlbatros d’Amsterdam : en danger critique.\nAlbatros à bec jaune : en danger.\n	\N	\N	\N	f
54069	1041	TEXT	species.2.description	Les Gorfous dorés ([*Eudyptes chrysolophus*](https://inpn.mnhn.fr/espece/cd_nom/441903)), aussi appelés Gorfous macaronis, sont de petits manchots reconnaissables à la touffe de plumes jaunes de chaque côté de leur tête, appelée « aigrette ». Contrairement aux manchots royaux qui nichent sur les plages, ils nichent dans les espaces rocheux difficiles d’accès, en compagnie des Gorfous sauteurs ([*Eudyptes chrysocome*](https://inpn.mnhn.fr/espece/cd_nom/441902)), plus petits et possédant un bec plus court.  \n  \nStatut sur la Liste rouge des oiseaux des TAAF :\nGorfous dorés : préoccupation mineure.\nGorfous sauteurs : données insuffisantes.\n	\N	\N	\N	f
54070	1041	TEXT	species.9.description	La mouche [*Anatalanta aptera*](https://inpn.mnhn.fr/espece/cd_nom/782785), endémique de la région subantarctique, a une étrange particularité : elle n’a pas d’ailes ! Ce caractère morphologique est une adaptation aux conditions climatiques rigoureuses des Terres australes françaises et leurs vents forts et constants, ainsi qu’à l’absence de prédateurs natifs.  \n\nStatut sur la Liste rouge mondiale : non évalué.\n	\N	\N	\N	f
54071	1041	TEXT	events.0.description	Émergence de l’archipel Kerguelen 	\N	\N	\N	f
54072	1041	TEXT	events.1.description	Émergence de l’archipel Crozet	\N	\N	\N	f
54073	1041	TEXT	events.8.description	Classement des Terres et mers australes au Patrimoine mondial de l’UNESCO	\N	\N	\N	f
54074	1041	IMAGE	ecosystems.image	\N	1738	Manchotière de la Baie du Marin (Crozet), avec le Marion Dufresne, bateau ravitailleur des TAAF en arrière-plan © Julie Tucoulet	\N	f
54075	1041	TEXT	identity.species	2 378 	\N	\N	\N	f
54076	1041	TEXT	statistics.1.number	672 969 km<sup>2</sup>	\N	\N	\N	f
54077	1041	IMAGE	ecosystems.ecosystems.0.image	\N	1700	NA	\N	f
54078	1041	TEXT	statistics.0.number	47 espèces	\N	\N	\N	f
54079	1041	TEXT	statistics.2.number	35 espèces	\N	\N	\N	f
54080	1041	TEXT	species.2.name	Les gorfous	\N	\N	\N	f
54081	1041	TEXT	species.8.name	Les orques	\N	\N	\N	f
54082	1041	TEXT	species.4.description	Chassée pour sa fourrure, l’Otarie à fourrure d’Amsterdam ([*Arctocephalus tropicalis*](https://inpn.mnhn.fr/espece/cd_nom/528710)) a frôlé l’extinction au début du XXe siècle. Si les populations restent globalement inférieures au niveau de pré-exploitation, l’île Amsterdam abrite aujourd’hui la 3e plus grande population mondiale d’otarie d’Amsterdam.  \n  \nStatut sur la Liste rouge des mammifères des TAAF : préoccupation mineure. \n	\N	\N	\N	f
54083	1041	TEXT	events.6.description	Création du territoire des Terres Australes et Antarctiques françaises (TAAF), divisé en 3 districts	\N	\N	\N	f
54084	1041	TEXT	events.6.date	1955	\N	\N	\N	f
54085	1041	TEXT	ecosystems.ecosystems.0.name	NA	\N	\N	\N	f
54086	1041	TEXT	species.5.description	L’Azorelle ([*Azorella selago*](https://inpn.mnhn.fr/espece/cd_nom/721433)) est une plante à fleur à croissance très lente qui forme des coussins denses sur les étendues pierreuses de Kerguelen et Crozet. Un individu met 100 à 200 ans pour atteindre un mètre de diamètre ! A Kerguelen, les tapis d’Azorelle ont été fortement dégradés par les lapins introduits et ne sont aujourd’hui visibles que sur les îles et îlots où l’herbivore n’est pas présent.  \n  \nStatut sur la Liste rouge mondiale : non évalué.\n	\N	\N	\N	f
54087	1041	TEXT	species.6.description	Le Chou de Kerguelen ([*Pringlea antiscorbutica*](https://inpn.mnhn.fr/espece/cd_nom/721546)) est une plante vivace dont les feuilles ovales poussent en rosette. Il se rencontre dans des milieux divers et est capable de s’adapter à différentes contraintes : à basse altitude en milieu côtier il présente une forte résistance aux embruns ; à très haute altitude (entre 700 – 1000 m), il résiste au gel, et peut se développer sur des plateaux rocheux ou en falaise. Comme les autres plantes de la famille des Brassicacées, il est riche en vitamine C et a pu être historiquement consommé par les marins pour lutter contre le scorbut. A Kerguelen, ses populations ont été fortement réduites suite à l’introduction des lapins sur l’île.\nContrairement à ce que son nom laisse à penser, cette espèce emblématique de la zone subantarctique n’est pas uniquement présente à Kerguelen mais se trouve également à Crozet et dans les îles Marion, Heard, Prince Edwards et Mac Donald.  \n  \nStatut sur la Liste rouge mondiale : non évalué.\n	\N	\N	\N	f
54088	1041	TEXT	events.4.description	Premier débarquement de l’expédition de Marc-Joseph Marion du Fresne sur l’île de la Possession (Crozet) 	\N	\N	\N	f
54089	1041	TEXT	events.5.description	Découverte de Kerguelen par le navigateur français Yves Joseph Kerguelen de Trémarec	\N	\N	\N	f
54090	1041	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
54091	1041	TEXT	interests.locations.2.name	Les îles Saint-Paul et Amsterdam	\N	\N	\N	f
54092	1041	TEXT	events.0.date	-40 millions d’années	\N	\N	\N	f
54093	1041	TEXT	identity.populationYear	-	\N	\N	\N	f
54094	1041	IMAGE	species.5.image	\N	1723	*Azorella selago* © Julie Tucoulet	\N	f
54095	1041	TEXT	statistics.0.text	d'oiseaux marins	\N	\N	\N	f
54096	1041	IMAGE	species.1.image	\N	1721	*Diomedea exulans* © Julie Tucoulet	\N	f
54097	1041	TEXT	events.2.date	-100 000 ans	\N	\N	\N	f
54098	1041	TEXT	events.5.date	12 février 1772	\N	\N	\N	f
54099	1041	TEXT	identity.marineArea	1 655 098 	\N	\N	\N	f
54100	1041	TEXT	species.9.name	*Anatalanta aptera*	\N	\N	\N	f
54101	1041	TEXT	events.8.date	2019	\N	\N	\N	f
54102	1041	TEXT	identity.presentation	Fjords, glaciers, falaises, cratères, vallées à la végétation rase… Les Terres Australes françaises– aussi appelées îles subantarctiques - fascinent par leur isolement et leur nature brute et inhospitalière. Au sud de l’océan Indien entre les 40<sup>e</sup> rugissants et les 50<sup>e</sup> hurlants, ces îles volcaniques balayées par les vents présentent des paysages exceptionnels et abritent l’une des plus fortes concentrations et diversités d’oiseaux marins au monde. Leurs eaux sont également très riches, accueillant de nombreux mammifères marins qui viennent s’y nourrir. Ces îles sont classées en Réserve naturelle nationale depuis 2006 et inscrites sur la Liste du Patrimoine mondial de l’Unesco depuis 2019. 	\N	\N	\N	f
54103	1041	IMAGE	interests.locations.0.image	\N	1741	Albatros nicheur et falaises de Crozet © Julie Tucoulet	\N	f
54104	1041	TEXT	species.6.name	Le Chou de Kerguelen	\N	\N	\N	f
54105	1041	TEXT	identity.population	0	\N	\N	\N	f
54106	1041	TEXT	species.3.name	L’Éléphant de mer du sud	\N	\N	\N	f
54107	1041	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
54108	1041	IMAGE	species.8.image	\N	1733	*Orcinus orca* © Julie Tucoulet	\N	f
54109	1041	TEXT	species.0.name	Le Manchot royal	\N	\N	\N	f
54110	1041	TEXT	events.4.date	24 janvier 1772 	\N	\N	\N	f
54111	1041	IMAGE	interests.locations.2.image	\N	1730	Vue aérienne de l'île Saint-Paul © Bruno Marie	\N	f
55833	1040	TEXT	species.1.description	Le Tiare Tahiti ([*Gardenia taitensis*](https://inpn.mnhn.fr/espece/cd_nom/447489)) est un arbuste dont les fleurs blanches odorantes sont utilisées pour la fabrication du *monoi* (huile de coprah issu de la noix de coco, dans laquelle sont macérées des fleurs de tiaré). Originaire des îles du Pacifique ouest, il a été introduit par les premiers Polynésiens (comme d’autres plantes cultivées telles que l’arbre à pain, le taro, le bambou, etc.) et est devenu l’une des espèces emblématiques de la Polynésie française. \n  \nStatut sur la Liste rouge mondiale : non évalué. 	\N	\N	\N	f
54112	1041	TEXT	interests.locations.0.description	Cinq îles volcaniques dont l’origine remonterai à 8 millions d’années forment l’archipel de Crozet. Le groupe occidental des îles Froides comprend l’île aux Cochons, les îlots des Apôtres et l’île des Pingouins, il est distant d’environ 110 km des îles orientales : l’île de la Possession et l’île de l’Est. Toutes les îles sont classées en zone de protection intégrale, seule l’île de la Possession est en zone de protection réglementée et est par conséquent la seule accessible aux humains. Elle abrite depuis 1962 la base Alfred Faure. L’archipel accueille la plus grande population de manchots royaux au monde. 	\N	\N	\N	f
54113	1041	TEXT	interests.locations.2.description	Ces deux îles, distantes de 85 km, sont les plus récentes du groupe, elles ont émergé il y a environ 100 000 ans. Sur Amsterdam, on trouve la seule espèce d’arbre indigène des Terres australes françaises, le [*Phylica arborea*](https://inpn.mnhn.fr/espece/cd_nom/780147), dont la population a été largement endommagée par les activités humaines passées (incendies, prélèvements, pâturage, etc.). Des populations importantes d’otaries viennent se reproduire sur ses côtes, et ses eaux sont riches en poissons et en langoustes. L’île Saint-Paul est une réserve intégrale où toute présence humaine est interdite. 	\N	\N	\N	f
54114	1041	TEXT	interests.locations.1.description	La Grande Terre de Kerguelen, territoire le plus vaste des Terres australes françaises et le plus ancien (40 millions d’années), est célèbre pour ses côtes au relief extrêmement découpé, avec de nombreux fjords et baies secondaires. A l’ouest, une calotte glaciaire couvre le territoire. Le littoral est occupé par de nombreux animaux qui viennent s’y reproduire : éléphants de mer, manchots, albatros, gorfous… Si la rudesse du climat n’a pas favorisé le développement des plantes en hauteur, on y trouve des espèces remarquables et des communautés végétales originales et parfois uniques. La végétation sous-marine, avec de vastes forêts d’algues, est foisonnante, et les eaux environnantes sont caractérisées par la présence de la Légine australe ([*Dissostichus eleginoides*](https://inpn.mnhn.fr/espece/cd_nom/424025)). 	\N	\N	\N	f
54115	1041	TEXT	statistics.1.text	d'aires protégées	\N	\N	\N	f
54116	1041	TEXT	identity.subtitle	Un isolement extrême	\N	\N	\N	f
54117	1041	IMAGE	species.4.image	\N	1736	*Arctocephalus tropicalis* © Roald Harivel	\N	f
54118	1041	IMAGE	species.7.image	\N	1732	Bosquet de Phylicas© Réserve naturelle national des Terres australes françaises	\N	f
54119	1041	TEXT	species.5.name	L'Azorelle	\N	\N	\N	f
55834	1040	TEXT	species.2.description	Le Santal polynésien ([*Santalum insulare*](https://inpn.mnhn.fr/espece/cd_nom/447588)) est un arbre endémique de Polynésie française comprenant sept variétés endémiques dans les  archipels de la Société, Marquises et Australes. Hémiparasite, il a besoin de plantes-hôtes pour se développer. \nSon bois très odorant utilisé en médicine traditionnelle, parfumerie ou encore en sculpture, a été surexploité pour servir de monnaie d’échange au 19<sup>e</sup> siècle, ce qui a entrainé sa rareté actuelle. Sa régénération est aujourd’hui menacée par la prédation de ses graines par les rats introduits, ainsi que la disparition des oiseaux disséminateurs des graines, la destruction de son habitat et le développement des plantes exotiques envahissantes. Il est protégé par le Code de l’environnement polynésien. Un programme de sauvegarde mis en place à la fin des années 1990 a permis le reboisement de plusieurs parcelles après la culture de plants en pépinière.  \n  \nStatut sur la Liste rouge de la flore vasculaire endémique de Polynésie française : en danger critique à vulnérable selon les variétés.\n	\N	\N	\N	f
55835	1040	TEXT	statistics.1.number	15 000 km<sup>2</sup>	\N	\N	\N	f
55836	1040	TEXT	statistics.0.number	118 îles	\N	\N	\N	f
55837	1040	TEXT	statistics.2.number	Plus de 525 espèces 	\N	\N	\N	f
55838	1040	IMAGE	interests.locations.4.image	\N	1743	Rapa, Australes © Sardon	\N	f
55839	1040	TEXT	species.2.name	Le Santal polynésien	\N	\N	\N	f
55840	1040	TEXT	risks.risks.1.name	Les espèces exotiques envahissantes, une cause majeure de l’appauvrissement de la biodiversité polynésienne	\N	\N	\N	f
55841	1040	TEXT	species.4.description	Le Monarque de Tahiti ([*Pomarea nigra*](https://inpn.mnhn.fr/espece/cd_nom/418875)) est un passereau insectivore forestier endémique de l’île de Tahiti. L’adulte est entièrement noir, avec un bec et des pattes plus claires, tandis que le jeune est orangé. L’espèce est victime de l’introduction d’espèces exotiques envahissantes, majoritairement de la prédation des œufs par les rats, la compétition avec les oiseaux introduits (Martin triste ([*Acridotheres tristis*](https://inpn.mnhn.fr/espece/cd_nom/601183)) et Bulbul à ventre rouge ([*Pycnonotus cafer*](https://inpn.mnhn.fr/espece/cd_nom/432746))) et la dégradation de son habitat forestier naturel. Au bord de l’extinction, il ne subsistait plus que 12 individus lors de la mise en place d’un programme de conservation en 1998 par la [SOP Manu](https://www.manu.pf/). Avec environ 100 individus estimés en 2020, les effectifs de l’espèce sont en augmentation mais sa survie reste fragile.  \n  \nStatut sur la Liste rouge des oiseaux de Polynésie française : en danger critique. \n	\N	\N	\N	f
55842	1040	TEXT	ecosystems.ecosystems.0.name	Les récifs coralliens 	\N	\N	\N	f
55843	1040	TEXT	species.5.description	Sur les cinq espèces de tortues marines présentes en Polynésie française, la Tortue verte ([*Chelonia mydas*](https://inpn.mnhn.fr/espece/cd_nom/77338)) est la plus fréquemment observée. Ses sites de ponte connus se situent principalement à l’ouest de l’archipel de la Société, mais le statut des populations polynésiennes est encore mal connu. \nDans la culture traditionnelle polynésienne, les tortues marines sont des animaux sacrés, émanation de Ta’aroa ou Tangaroa, le Dieu des océans, elles guident les navigateurs lors des traversées du Pacifique.\nAutrefois protégées par un *tapu* (interdit), elles n’étaient consommées que par les hommes de haut rang lors de rites complexes et codifiés. Elles sont aujourd’hui intégralement protégées par le Code de l’Environnement de Polynésie, mais sont cependant toujours victimes de braconnage. La détérioration de leurs habitats et des sites de ponte sont également des menaces pour leur survie.  \n  \nStatut sur la Liste rouge mondiale : en danger. 	\N	\N	\N	f
55844	1040	TEXT	species.6.description	Le Triton géant ([*Charonia tritonis*](https://inpn.mnhn.fr/espece/cd_nom/368943)) aussi appelé Conque, est l’un des plus grands gastéropodes des récifs de la zone Indo-Pacifique. Sa coquille, qui peut mesurer jusqu’à 50 cm, est traditionnellement utilisée comme instrument de musique à vent. Carnivore, il est l’un des seuls prédateurs connus de l’étoile de mer corallivore [*Acanthaster planci*](https://inpn.mnhn.fr/espece/cd_nom/444461), parfois proliférante dans les lagons. Victime d’une récolte intensive, l’espèce est désormais protégée par le Code de l’Environnement polynésien et sa pêche est interdite.  \n  \nStatut sur la Liste rouge mondiale : non évalué.\n	\N	\N	\N	f
55845	1040	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
55846	1040	TEXT	interests.locations.5.name	Les Tuamotu	\N	\N	\N	f
55847	1040	TEXT	events.0.date	1,3 millions d'années	\N	\N	\N	f
55848	1040	TEXT	identity.populationYear	2020	\N	\N	\N	f
55849	1040	TEXT	interests.locations.8.name	Ua Huka (Marquises) 	\N	\N	\N	f
55850	1040	IMAGE	species.5.image	\N	1751	*Chelonia mydas* © Benjamin Guichard	\N	f
55851	1040	TEXT	statistics.0.text	réparties sur 5 archipels	\N	\N	\N	f
55852	1040	TEXT	events.2.date	1977	\N	\N	\N	f
55853	1040	TEXT	identity.presentation	À plusieurs milliers de kilomètres des continents les plus proches, la Polynésie française, avec ses 118 îles réparties en 5 archipels (Australes, Société, Marquises, Tuamotu, Gambier), s’étend sur une surface grande comme l’Europe. On trouve une grande diversité géomorphologique, des îles volcaniques hautes jeunes de moins d’un million d’années (Tahiti) aux atolls de plusieurs dizaines de millions d’années, ainsi qu’une grande amplitude climatique, allant du climat subtropical au quasi-équatorial. L’extrême isolement géographique des îles de la Polynésie française est à l’origine d’un taux d’endémisme particulièrement élevé de la faune et la flore terrestre, mais il rend aussi la gestion des espaces naturels plus difficile. La nature et la culture sont souvent indissociables dans les savoirs traditionnels du *fenua*.	\N	\N	\N	f
55854	1040	TEXT	identity.population	279 300 	\N	\N	\N	f
55855	1040	TEXT	species.3.name	Le *‘Ura* (ou *Vini ‘Ura*)	\N	\N	\N	f
55856	1040	TEXT	risks.risks.2.name	Des statuts de protection variés pour les espaces et les espèces	\N	\N	\N	f
55857	1040	IMAGE	species.8.image	\N	1754	*Partula tristis* © Fred Jacq	\N	f
55858	1040	TEXT	species.0.name	Le *Tiare 'apetahi*	\N	\N	\N	f
55859	1040	TEXT	events.4.date	2002	\N	\N	\N	f
55860	1040	IMAGE	interests.locations.2.image	\N	1742	Tahiti, Société © Céline Soyer	\N	f
55861	1040	IMAGE	interests.locations.9.image	\N	1746	Mangareva, Gambier © Fred	\N	f
55862	1040	TEXT	interests.locations.0.description	Cet ensemble est divisé en deux groupes : les îles du Vent à l’est, comprenant Tahiti, la plus grande, la plus haute et la plus peuplée des îles de Polynésie française et les îles sous le Vent, à l’ouest avec entre autres la célèbre île de Bora Bora.	\N	\N	\N	f
55863	1040	TEXT	risks.risks.2.description	Dès 2002, la Polynésie française a classé l’ensemble de son espace maritime en sanctuaire pour les mammifères marins. C’est également le premier territoire au monde dans lequel toutes les espèces de requin sont protégées. On retrouve ces dispositions dans la liste des espèces protégées du Code de l’Environnement polynésien, qui compte également entre autres les tortues marines, les raies Manta ou encore le corail noir. La pêche de nombreuses espèces, comme la Langouste, la Cigale de mer ou le Bénitier, est règlementée (tailles minimales, périodes de pêche, zones de pêche).  \n\nIl existe six catégories d’aires protégées selon le Code de l’Environnement polynésien. La création de zones protégées est longue et complexe et n’aboutit pas toujours en raison des conflits d’intérêts entre usagers et de problèmes fonciers (terres en indivision). La dispersion des îles sur une superficie gigantesque et la petite taille de certaines îles et atoll ne facilitent pas les suivis floristiques et faunistiques et la gestion de ces aires protégées. L’ensemble de la zone économique exclusive de Polynésie française a été déclarée « Grande aire marine gérée » depuis 2018 (catégorie VI du Code de l’Environnement polynésien) sous le nom tahitien de *Te Tainui Atea*.  \n\nDe nombreuses écoles de Polynésie française sont impliquées dans des projets d’aires marines éducatives (AME), initiative créée aux Marquises en 2012. Cette démarche pédagogique permet de sensibiliser le jeune public à la connaissance et la préservation du milieu marin, notamment lagonaire et littoral. Fort de son succès, le dispositif a été repris en métropole et dans les autres territoires ultra-marins.   \n  \nLe *rāhui*, outil ancestral de gestion des ressources naturelles tombé en désuétude, est repris aujourd’hui pour assurer l’exploitation durable des ressources naturelles marines. À l’instar d’une jachère, le *rāhui* protège temporairement une zone bien définie et limite ou interdit le prélèvement de ressources naturelles pour assurer sa régénération. Il peut être mis en place simplement entre usagers (pêcheurs), par une municipalité, ou par arrêté ministériel sur la base du Code de l’Environnement.\n	\N	\N	\N	f
55864	1040	TEXT	risks.risks.1.description	En raison de leur isolement, les écosystèmes de Polynésie française s’avèrent particulièrement vulnérables aux espèces introduites envahissantes. De nombreuses espèces très invasives sont à l’origine de régressions de populations chez la faune et la flore indigène. Le Miconia ([*Miconia calvescens*](https://inpn.mnhn.fr/espece/cd_nom/447324)), introduit en 1937 dans un jardin botanique à Tahiti, remplace les espèces végétales indigènes et endémiques et entraine l’appauvrissement des forêts humides des vallées et de montagne jusqu’à 1 300 m d’altitude. Surnommé «&nbsp;le cancer vert&nbsp;», il recouvre désormais deux tiers des forêts de Tahiti et a été introduit dans d’autres îles de la Société et des Marquises. D’autres espèces végétales, comme le Tulipier du Gabon ([*Spathodea campanulata*](https://inpn.mnhn.fr/espece/cd_nom/448228)), sont également préoccupantes en raison de leur expansion.  \n  \nComme dans de nombreux milieux insulaires à travers le globe, l’introduction des rats a des conséquences désastreuses pour les écosystèmes, en particulier pour les oiseaux dont les œufs sont prédatés, mais aussi pour la flore indigène, car les rats, en consommant les plantules et les graines, perturbent la régénération naturelle des forêts. Les chats harets (chats domestiques retournés à l’état sauvage) sont également une menace importante pour la biodiversité des îles de Polynésie française. Les études récentes montrent une forte prédation sur les oiseaux, dont des espèces endémiques aux Marquises, et les reptiles. D’autres espèces animales introduites, comme les fourmis (Petite fourmi de feu ([*Wasmannia auropunctata*](https://inpn.mnhn.fr/espece/cd_nom/532927)), Grande fourmi folle ([*Anopolepis gracilipes*](https://inpn.mnhn.fr/espece/cd_nom/264513)) etc.) ou des oiseaux (Merle des Moluques ([*Acridotheres tristis*](https://inpn.mnhn.fr/espece/cd_nom/601183)), Bulbul à ventre rouge ([*Pycnonotus cafer*](https://inpn.mnhn.fr/espece/cd_nom/432746)), Busard de Gould ([*Circus approximans*](https://inpn.mnhn.fr/espece/cd_nom/432707)), etc.) ont également un fort impact sur la biodiversité terrestre des îles de Polynésie française.  \n\nSi des actions sont entreprises pour lutter contre ces espèces dans les îles où elles ont été introduites, il s’agit également d’éviter leur dissémination sur des îles où elles ne sont pas encore présentes, en mettant en place des mesures de biosécurité (chiens détecteurs, inspections, interdiction de déplacer de la terre d’une île à l’autre…). L’introduction d’espèces non existante sur le territoire de la Polynésie française est interdite. \n	\N	\N	\N	f
55865	1040	TEXT	interests.locations.2.description	Tahiti est la plus grande et la plus haute île de Polynésie française, c'est également la plus peuplée. Elle est la seule à posséder des sommets de plus de 1 300 m d'altitude, dont trois à plus de 2&nbsp;000&nbsp;m. On y trouve des zones de forêts naturelles avec une végétation subalpine unique en Polynésie française et dans les îles océaniques du Pacifique sud. 	\N	\N	\N	f
55866	1040	TEXT	interests.locations.1.description	Les plateaux du mont Temehani à Raiatea hébergent une flore endémique exceptionnelle dont le fameux [Tiare 'apetahi](https://inpn.mnhn.fr/espece/cd_nom/908708), fleur protégée et symbole culturel de l’île. \nLe *marae Taputapuātea*, au sud de l’île, est inscrit au patrimoine mondial de l’UNESCO depuis 2017 comme un site d’importance culturelle et spirituelle dans le Triangle Polynésien. Les *marae* construits par le peuple *mā’ohi* du XIV<sup>e</sup> au XVIII<sup>e</sup> siècle étaient des espaces reliant le monde des vivants et celui des ancêtres et des dieux.\n	\N	\N	\N	f
55867	1040	TEXT	identity.subtitle	La nature indissociable du patrimoine culturel	\N	\N	\N	f
55868	1040	IMAGE	species.7.image	\N	1690	*Birgus latro* © Olivier Gargominy	\N	f
55869	1040	TEXT	species.5.name	La Tortue verte (*Honu*)	\N	\N	\N	f
55870	1040	TEXT	risks.risks.0.description	La nature est au fondement de la culture polynésienne, source de légendes et croyances, d’usages et de coutumes.  \n\nLa Polynésie française est le territoire comportant le plus grand nombre d’espèces animales et végétales éteintes ou menacées de toutes les collectivités françaises d’outre-mer. Les espèces terrestres endémiques sont particulièrement vulnérables au risque d’extinction au vu de leur répartition réduite et de leurs faibles effectifs. Plus de 142 plantes sont considérées comme rares, vulnérables ou menacées ; plus de 68 espèces de mollusques sont déjà éteints et 70 % des oiseaux terrestres endémiques sont menacés. \nDu fait du nombre important d’îles et de difficultés d’accès à certaines zones (montagnes, falaises), les inventaires sont nécessairement longs et difficiles à organiser et ils sont encore incomplets pour certains taxons, les insectes par exemple.  \n \nLes récifs coralliens et lagons de Polynésie française sont riches et diversifiés. Outre leur rôle écologique, ils ont un intérêt socio-économique vital pour les polynésiens. Les récifs coralliens de Polynésie française sont globalement en bon état, bien qu’ils souffrent des explosions démographiques de l’étoile de mer corallivore [*Acanthaster planci*](https://inpn.mnhn.fr/espece/cd_nom/444461) et d’épisodes de blanchissement de plus en plus intenses et fréquents, probables conséquences du changement climatique global. Ils sont également impactés par le rejet des eaux usées, la sédimentation et les aménagements côtiers, en majorité dans l’archipel de la Société où la densité de population humaine est la plus forte. \n	\N	\N	\N	f
55871	1040	IMAGE	interests.locations.8.image	\N	1745	Monarque de Ua Huka © Fred Jacq	\N	f
55872	1040	TEXT	interests.locations.6.description	L’atoll est célèbre pour sa richesse sous-marine, en particulier ses regroupements exceptionnels de requins gris ([*Carcharhinus amblyrhynchos*](https://inpn.mnhn.fr/espece/cd_nom/423537)). Le lagon, deuxième plus grand de Polynésie française après celui de Rangiroa, s’ouvre sur l’océan par deux passes, au sud et au nord. La passe nord, large de 1 600 m, est la plus grande de toute la Polynésie française. Fakarava, ainsi que six atolls et atolls soulevés environnants, sont classés Réserve de biosphère par l’UNESCO depuis 1977.	\N	\N	\N	f
56294	1042	TEXT	body.bodyElements.0.questionAnswer.question	Pouvez-vous nous présenter l’association et ses différentes missions ? 	\N	\N	\N	f
56295	1042	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
56296	1042	IMAGE	body.bodyElements.4.image.imageElement	\N	1757	légende et crédit	\N	f
56297	1042	TEXT	body.bodyElements.12.paragraph.paragraphText	Ensuite il y a un certain nombre de consignes à respecter pour **ne pas déranger les tortues lorsqu’on les observe, dans l’eau ou sur la plage**. Nous avons travaillé avec l’ensemble des partenaires sur [un dépliant](file://C:\\\\Users\\DBLOTT~1\\AppData\\Local\\Temp\\DEPLIANT_TORTUES_bdf.pdf), édité par le Parc naturel marin, qui explique touts les bons gestes à respecter. Nous organisons des sorties de nuit d’observation de ponte responsable, en respectant toutes les consignes qui empêchent le dérangement, toujours dans l’idée de sensibiliser le public et valoriser la tortue marine autrement. \nLa ponte a lieu le plus souvent la nuit, **il ne faut surtout pas déranger les tortues en ponte avec de la lumière**. Après l’éclosion des œufs, quand les bébés tortue sortent sur le sable, souvent les gens ont envie de les aider, de les mettre à l’eau, mais il ne faut surtout pas intervenir car le frottement du sable sur leur ventre est nécessaire à leur survie. Lorsqu’on croise une tortue dans l’eau, en snorkeling par exemple, il ne faut pas trop s’approcher, ne pas déranger l’animal dans son comportement et ses besoins vitaux.\n	\N	\N	\N	f
56298	1042	TEXT	body.bodyElements.9.paragraph.paragraphText	Il y aura une partie consacrée **au soin aux animaux en détresse**, qui nous permettra aussi de faire des suivis scientifiques pour avoir des informations sur les causes de leur détresse, les maladies... On pourra poser des balises sur les tortues relâchées pour avoir des informations sur leur écologie.  \n  \nNous allons également créer **une Maison de la Tortue**, un espace dédié à la sensibilisation des visiteurs, **ce sera la seule structure d’accueil dédiée à l’environnement marin à Mayotte et on sait déjà qu’on aura de la demande**. On espère modifier la tendance et que les personnes qui exploitent actuellement illégalement les tortues pour leur chair prennent conscience que c’est un meilleur moyen, plus durable, de valoriser la tortue.  \n  \nLes travaux doivent débuter cette année mais les restrictions et la crise des matériaux dus au covid vont sûrement nous impacter. Dans le meilleur des cas nous espérons une ouverture en fin d’année 2022.	\N	\N	\N	f
56299	1042	TEXT	body.bodyElements.15.questionAnswer.question	Est-il possible d’être bénévole à Oulanga Na Nyamba ? 	\N	\N	\N	f
56300	1042	TEXT	interviewee.presentation	Jeanne Wagner, directrice de l'association *Oulanga Na Nyamba*	\N	\N	\N	f
56301	1042	TEXT	body.bodyElements.6.questionAnswer.response	**Ici, il faut réussir à s’adapter à un contexte très instable**. Le covid par exemple pour nous, c’est une problématique parmi d’autre. On fait remonter les problématiques localement mais les priorités ne sont pas les mêmes pour tout le monde, et tout le monde manque de moyens.  \n  \nLe contexte de l’insécurité est très compliqué, on est souvent freiné au niveau des déplacements et de nos actions. Par exemple lorsque nos équipes signalent un braconnage, on ne peut pas être certain que la gendarmerie va pouvoir intervenir car il y a d’autres problèmes en cours et ils ne sont pas assez nombreux. **Ce type d’actions devient de plus en plus dangereux pour nous**.  \n\nLes problèmes de biodiversité à Mayotte sont encore peu connus en métropole et difficilement prises en compte, mais on essaye de faire remonter les problématiques en restant pédagogiques et diplomates. Même si l’Etat et le département nous appuient et nous financent, sur le terrain concrètement, ça manque de moyen.  \n  \n**On manque aussi d’expertise sur place, par exemple au niveau de la construction du centre de soin pour les tortues marines**. C’est beaucoup moins facile de le construire ici à Mayotte qu’en métropole, on n’a pas forcément l’expertise sur place par rapport aux pompes et aux bassins. Il va falloir les importer, est-ce qu’on aura les compétences pour bien les installer et les entretenir ? Il faut qu’on soit le plus autonomes possibles. Mais on a l’habitude et ça fait partie du quotidien.\n	\N	\N	\N	f
56302	1042	IMAGE	body.bodyElements.8.image.imageElement	\N	1758	légende et crédit	\N	f
56303	1042	TEXT	presentation.name	Protéger les tortues de Mayotte avec l'association *Oulanga Na Nyamba*	\N	\N	\N	f
56304	1042	TEXT	presentation.author	Doriane Blottière	\N	\N	\N	f
56305	1042	TEXT	body.bodyElements.7.questionAnswer.question	Ce centre de soin pour les tortues marines est le projet pour lequel vous avez été lauréat de l’appel à projet MobBiodiv’ 2020 de l’Office français pour la biodiversité. Pouvez-vous nous en dire plus ? 	\N	\N	\N	f
56306	1042	TEXT	body.bodyElements.5.paragraph.paragraphText	Nous avons aussi un axe de travail « connaissances » : on fait des suivis de tortues en alimentation ou en reproduction, **on participe à des projets de recherches pour tous ceux qui ont besoin de relais local, car à Mayotte nous n’avons pas d’institut de recherche** donc les chercheurs extérieurs ont besoin d’appui locaux pour mener à bien leurs travaux.  \n   \nNous essayons de collaborer avec le plus d’acteurs possibles et de les faire s’intéresser à la problématique, de mobiliser tout le monde pour trouver des solutions. Nous travaillons aussi avec les autres acteurs de la protection des tortues à Mayotte pour mieux fédérer nos moyens, et **nous nous investissons dans des projets sociaux-culturels ou éducatifs, qu'on utilise pour transmettre nos messages**, car une association écologiste environnementale pure et dure ne marcherai pas dans le contexte assez spécifique de Mayotte.\n	\N	\N	\N	f
56307	1042	TEXT	presentation.date	30 août 2021	\N	\N	\N	f
56308	1042	TEXT	body.bodyElements.10.questionAnswer.question	Comment les gens peuvent-ils agir concrètement à Mayotte pour protéger les tortues ? 	\N	\N	\N	f
56309	1042	IMAGE	body.bodyElements.1.image.imageElement	\N	1756	légende et credit	\N	f
56310	1042	TEXT	body.bodyElements.15.questionAnswer.response	**Notre association est très ouverte aux bénévoles !** Malgré le nombre de salariés qui augmente, on fonctionne avec beaucoup de bénévoles locaux. Nous avons aussi souvent des stagiaires. On préfère que les gens viennent pour de longues périodes pour s’adapter au contexte et d’être formés. Ça peut être sur l’ensemble des missions : suivis, actions de présence sur les plages, sensibilisation. Aujourd’hui nous avons un réseau d’une bonne trentaine de bénévoles qui sont présents tous les jours, et de nombreux adhérents qui participent aux sorties ou qui sont sympathisants. **Il y a une bonne cohésion et une bonne entente entre les bénévoles et les salariés. On est preneurs de toute aide !**	\N	\N	\N	f
56311	1042	TEXT	body.bodyElements.17.paragraph.paragraphText	Retrouvez plus d’informations sur [le site de l’association](https://oulangananyamba.com/) et suivez les actualités sur le Facebook d'[*Oulanga Na Nyamba*](https://www.facebook.com/OulangaNaNyamba976)  \nContact : [oulanga.nyamba@gmail.com](oulanga.nyamba@gmail.com)	\N	\N	\N	f
56312	1042	TEXT	body.bodyElements.3.paragraph.paragraphText	**Le deuxième axe de travail, c’est la protection**. La plus grande problématique pour les tortues marines à Mayotte, c’est le braconnage. Une femelle sur dix qui vient pondre est braconnée, c'est énorme et pas du tout soutenable pour les populations de tortues ! La vente de chair de tortue est très lucrative et en ce moment le braconnage augmente de plus en plus. **C’est une vision à court terme pour ceux qui braconnent**, ils ne regardent pas les conséquences alors qu'il n'y aura peut-être plus de tortues pour leurs enfants.  \n  \nNous avons une grande équipe, avec notamment des services civiques, qui sont présentes sur les différentes plages où il y a le plus de braconnage. Leur présence peut dissuader les braconniers et ils peuvent alerter la gendarmerie. **Et comme nous sommes une association agrée protection de l’environnement, nous pouvons porter plainte et on se constitue partie civile au tribunal pour tous les cas de braconnage**.	\N	\N	\N	f
56313	1042	TEXT	body.bodyElements.6.questionAnswer.question	Quelles sont les principales difficultés que vous rencontrez dans vos actions ? 	\N	\N	\N	f
56314	1042	TEXT	body.bodyElements.11.citation.citationElement	Quand les bébés tortue sortent sur le sable, souvent les gens ont envie de les aider, de les mettre à l’eau, mais il ne faut surtout pas intervenir car le frottement du sable sur leur ventre est nécessaire à leur survie.	\N	\N	\N	f
56315	1042	TEXT	body.bodyElements.0.questionAnswer.response	*Oulanga Na Nyamba* existe **depuis plus de 20 ans**, c'est une association localement très ancrée, nous travaillons avec beaucoup de partenaires, qui nous font confiance, et on sent que nos projets sont pris au sérieux. Il y a eu une belle évolution ces dernières années : nous sommes passés d’une salariée en 2018 à 8 salariés en 2021.  \n  \n\nNous avons plusieurs axes de travail : **le premier c’est la sensibilisation au sujet de l’environnement et des tortues marine**. On essaye de faire des animations adaptées aux publics partout où on le peut, notamment auprès des jeunes, des scolaires. Nous faisons aussi des formations auprès d’acteurs locaux, aussi bien dans des petites associations que pour les communes par exemple. On forme des ambassadeurs pour avoir des relais qui nous permettent de diffuser les informations encore plus loin. 	\N	\N	\N	f
56316	1042	TEXT	body.bodyElements.10.questionAnswer.response	Déjà, **ne pas manger de tortue et ne pas braconner**. On a fait des enquêtes à ce sujet, même si c’est aussi pour le goût, **c’est surtout sous l’influence de la société et des amis que la viande est consommée**. 	\N	\N	\N	f
56317	1042	IMAGE	presentation.image	\N	1708	credit à ajouter	\N	f
56318	1042	TEXT	body.bodyElements.14.paragraph.paragraphText	Il faut aussi bien **gérer ses déchets et ne pas polluer, ne pas abimer les habitats**. La plus grosse partie des impacts sur le milieu marin, c’est au niveau terrestre qu’on peut les résoudre. **Le défrichement provoque l’envasement du lagon et les constructions en bord de la plage font de la pollution lumineuse ou sont destructeurs d’habitats de tortue**. Les touristes peuvent choisir des logements écotouristiques, pour avoir un impact. Nous organisons aussi pas mal d’évènement de nettoyage par rapport à la lutte contre les pollutions.	\N	\N	\N	f
56319	1042	IMAGE	body.bodyElements.16.image.imageElement	\N	1759	légende et crédit 	\N	f
56320	1042	TEXT	body.bodyElements.2.citation.citationElement	La plus grande problématique pour les tortues marines à Mayotte, c’est le braconnage. Une femelle sur dix qui vient pondre est braconnée, c'est énorme et pas du tout soutenable pour les populations de tortues ! 	\N	\N	\N	f
56321	1042	TEXT	body.bodyElements.13.citation.citationElement	La plus grosse partie des impacts sur le milieu marin, c’est au niveau terrestre qu’on peut les résoudre. 	\N	\N	\N	f
56322	1042	IMAGE	interviewee.photo	\N	1709	test	\N	f
56323	1042	TEXT	body.introduction	En shimaoré, *Oulanga Na Nymaba* signifie « Environnement et Tortues ». L'association œuvre depuis 1998 pour la préservation de la biodiversité mahoraise, en particulier des tortues marines et de leur habitat.  \n  \nA Mayotte, la tortue verte et la tortue imbriquée se reproduisent et s’alimentent toute l’année, et d’autres espèces sont observées occasionnellement. Toutes les tortues marines sont considérées comme menacées d’extinction.\n	\N	\N	\N	f
56324	1042	TEXT	body.bodyElements.7.questionAnswer.response	On travaille dessus depuis 2015, **c’est un projet multi partenarial, attendu par tous les acteurs de l’environnement, du tourisme et par les élus qui nous appuient**. C’est un projet très attractif et aussi très utile pour les tortues.	\N	\N	\N	f
\.


--
-- Name: app_user_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.app_user_seq', 1000, true);


--
-- Name: category_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.category_seq', 1003, true);


--
-- Name: ecogesture_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.ecogesture_seq', 1007, true);


--
-- Name: image_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.image_seq', 1759, true);


--
-- Name: indicator_rank_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.indicator_rank_seq', 8, true);


--
-- Name: indicator_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.indicator_seq', 1007, true);


--
-- Name: indicator_value_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.indicator_value_seq', 1539, true);


--
-- Name: page_element_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.page_element_seq', 56324, true);


--
-- Name: page_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.page_seq', 1042, true);


--
-- Name: app_user app_user_login_un; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_login_un UNIQUE (login);


--
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: ecogesture ecogesture_pkey; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.ecogesture
    ADD CONSTRAINT ecogesture_pkey PRIMARY KEY (id);


--
-- Name: ecogesture ecogesture_slug_un; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.ecogesture
    ADD CONSTRAINT ecogesture_slug_un UNIQUE (slug);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: indicator indicator_biom_id_un; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT indicator_biom_id_un UNIQUE (biom_id);


--
-- Name: indicator_category indicator_category_pkey; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.indicator_category
    ADD CONSTRAINT indicator_category_pkey PRIMARY KEY (indicator_id, category_id);


--
-- Name: indicator_ecogesture indicator_ecogesture_pkey; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.indicator_ecogesture
    ADD CONSTRAINT indicator_ecogesture_pkey PRIMARY KEY (indicator_id, ecogesture_id);


--
-- Name: indicator indicator_pkey; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT indicator_pkey PRIMARY KEY (id);


--
-- Name: indicator indicator_slug_un; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT indicator_slug_un UNIQUE (slug);


--
-- Name: indicator_value indicator_value_pkey; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.indicator_value
    ADD CONSTRAINT indicator_value_pkey PRIMARY KEY (id);


--
-- Name: page_element page_element_key_un; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.page_element
    ADD CONSTRAINT page_element_key_un UNIQUE (page_id, key);


--
-- Name: page_element page_element_pkey; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.page_element
    ADD CONSTRAINT page_element_pkey PRIMARY KEY (id);


--
-- Name: page page_name_model_name_un; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.page
    ADD CONSTRAINT page_name_model_name_un UNIQUE (name, model_name);


--
-- Name: page page_pkey; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.page
    ADD CONSTRAINT page_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: biom
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: page_element_text_idx; Type: INDEX; Schema: public; Owner: biom
--

CREATE INDEX page_element_text_idx ON public.page_element USING gin (to_tsvector('french'::regconfig, (text)::text));


--
-- Name: indicator_category category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.indicator_category
    ADD CONSTRAINT category_id_fk FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: indicator_ecogesture ecogesture_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.indicator_ecogesture
    ADD CONSTRAINT ecogesture_id_fk FOREIGN KEY (ecogesture_id) REFERENCES public.ecogesture(id);


--
-- Name: page_element image_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.page_element
    ADD CONSTRAINT image_id_fk FOREIGN KEY (image_id) REFERENCES public.image(id);


--
-- Name: indicator_category indicator_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.indicator_category
    ADD CONSTRAINT indicator_id_fk FOREIGN KEY (indicator_id) REFERENCES public.indicator(id);


--
-- Name: indicator_value indicator_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.indicator_value
    ADD CONSTRAINT indicator_id_fk FOREIGN KEY (indicator_id) REFERENCES public.indicator(id);


--
-- Name: indicator_ecogesture indicator_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.indicator_ecogesture
    ADD CONSTRAINT indicator_id_fk FOREIGN KEY (indicator_id) REFERENCES public.indicator(id);


--
-- Name: page_element page_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.page_element
    ADD CONSTRAINT page_id_fk FOREIGN KEY (page_id) REFERENCES public.page(id);


--
-- PostgreSQL database dump complete
--

