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
    is_rounded boolean NOT NULL
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
\.


--
-- Data for Name: indicator; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.indicator (id, slug, biom_id, is_rounded) FROM stdin;
1004	taux-boisement	f591fb1b-bf6f-486b-b89f-b9383eed8e6a	t
1003	especes-menacees	9f6e6310-56cd-4ef1-9d3d-90b88f9f15fb	t
1000	especes-exotiques-envahissantes	8ba9fc7e-12e9-4c7b-93b3-5b83af14a13d	t
1001	especes-endemiques	9493c8d0-0dfe-43d4-bbf6-d3c5f99f54d5	f
1007	recifs-coralliens	a2f912ab-19e6-4394-b3c8-57035e21e24e	t
1002	especes-inventoriees	b14bdecd-5a1d-4594-8303-5d6618bb2d0a	f
1006	nouvelles-especes	d880a1c3-bf90-46c5-b224-a46958529adf	f
1005	conservation-mangroves	94128379-c202-4ad6-b358-0c8d46bdb500	t
\.


--
-- Data for Name: indicator_category; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.indicator_category (indicator_id, category_id) FROM stdin;
1004	1002
1003	1000
1000	1000
1001	1001
1007	1003
1002	1001
1006	1001
1005	1003
\.


--
-- Data for Name: indicator_ecogesture; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.indicator_ecogesture (indicator_id, ecogesture_id) FROM stdin;
1005	1002
1005	1005
1004	1006
1004	1005
1003	1006
1003	1000
1003	1005
1000	1003
1001	1006
1001	1000
1001	1005
1007	1001
1002	1007
1006	1007
\.


--
-- Data for Name: indicator_value; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.indicator_value (id, indicator_id, territory, value, unit) FROM stdin;
1092	1000	NOUVELLE_CALEDONIE	38	
1095	1000	MAYOTTE	19	
1087	1000	OUTRE_MER	60	
1090	1000	SAINT_MARTIN	11	
1088	1000	GUADELOUPE	17	
1094	1000	REUNION	34	
1091	1000	SAINT_BARTHELEMY	11	
1093	1000	POLYNESIE_FRANCAISE	36	
1089	1000	MARTINIQUE	18	
1097	1005	OUTRE_MER	25	%
1054	1001	SAINT_PIERRE_ET_MIQUELON	0	
1075	1001	MAYOTTE	335	
1052	1001	NOUVELLE_CALEDONIE	8673	
1049	1001	OUTRE_MER	17846	
1050	1001	GUADELOUPE	1399	
1074	1001	SAINT_MARTIN	63	
1053	1001	REUNION	1558	
1072	1001	SAINT_BARTHELEMY	70	
1071	1001	GUYANE	2551	
1073	1001	POLYNESIE_FRANCAISE	2673	
1051	1001	MARTINIQUE	700	
1085	1003	MAYOTTE	35.92505855	%
1081	1003	OUTRE_MER	19.6979807	%
1082	1003	GUADELOUPE	28.63712677	%
1084	1003	REUNION	34.23298707	%
1086	1003	GUYANE	11.11842105	%
1083	1003	MARTINIQUE	19.40384829	%
1077	1007	MAYOTTE	30	%
1037	1007	NOUVELLE_CALEDONIE	18.51851852	%
1034	1007	OUTRE_MER	29.26829268	%
1076	1007	SAINT_MARTIN	33.33333333	%
1035	1007	GUADELOUPE	60	%
1038	1007	REUNION	21.42857143	%
1036	1007	MARTINIQUE	50	%
1021	1002	SAINT_PIERRE_ET_MIQUELON	2112	
1020	1002	MAYOTTE	6162	
1017	1002	NOUVELLE_CALEDONIE	28092	
1012	1002	OUTRE_MER	88966	
1015	1002	SAINT_MARTIN	2234	
1013	1002	GUADELOUPE	10527	
1019	1002	REUNION	10915	
1016	1002	SAINT_BARTHELEMY	2140	
1018	1002	POLYNESIE_FRANCAISE	11776	
1014	1002	MARTINIQUE	7422	
1033	1006	OUTRE_MER	583	
1046	1004	NOUVELLE_CALEDONIE	45.78774617	%
1043	1004	OUTRE_MER	84.64046368	%
1047	1004	REUNION	35.2	%
1096	1000	SAINT_PIERRE_ET_MIQUELON	7	
1048	1004	SAINT_PIERRE_ET_MIQUELON	13.04347826	%
1080	1004	MAYOTTE	15.78947368	%
1044	1004	GUADELOUPE	42.26190476	%
1078	1004	SAINT_BARTHELEMY	0	%
1079	1004	POLYNESIE_FRANCAISE	42.34972678	%
1045	1004	MARTINIQUE	46.22641509	%
\.


--
-- Data for Name: page; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.page (id, name, model_name, title) FROM stdin;
1025	protection-faune	ecogesture	Respecter la faune sauvage
1004	especes-exotiques-envahissantes	indicator	Espèces exotiques envahissantes
1028	exploitation-especes-protegees	ecogesture	Préserver les espèces protégées 
1024	protection-contre-eee	ecogesture	Protection contre les EEE
1027	protection-flore	ecogesture	Préserver la flore sauvage
1022	saint-pierre-et-miquelon	territory	Saint-Pierre-et-Miquelon
1018	ecogeste-agir	ecogesture-act	Encadré "agir pour la biodiversité" fiche écogeste
1030	mentions-legales	legal-terms	Mentions légales
1009	especes-inventoriees	indicator	Espèces indigènes
1003	territoires	territories	Découvrez les outre-mer
1013	nouvelles-especes	indicator	Nouvelles espèces décrites
1019	sciences-participatives	science	Sciences participatives
1008	especes-endemiques	indicator	Espèces endémiques
1002	antilles	territory-zone	bassin antillais
1029	s-investir-sur-le-terrain	ecogesture	S'investir sur le terrain
1011	taux-boisement	indicator	Proportion de forêts
1007	apropos	about	A propos
1020	nouvelle-caledonie	territory	Nouvelle-Calédonie
1005	indicateurs	indicators	Tous les indicateurs
1001	guadeloupe	territory	Guadeloupe
1010	especes-menacees	indicator	Espèces éteintes et menacées
1014	recifs-coralliens	indicator	Récifs coralliens
1012	conservation-mangroves	indicator	Conservation des mangroves d'outre-mer
1016	agir-ensemble	act	Agir ensemble
1006	protection-recifs-coralliens	ecogesture	Protéger les récifs coralliens
1023	ne-pas-jeter-dechets-nature	ecogesture	Je ne jette pas mes déchets dans la nature
1026	limiation-plastique	ecogesture	Réduire les déchets et le plastique
1017	ecogestes	ecogestures	Accueil écogestes
1015	martinique	territory	Martinique
1000	accueil	home	Accueil
1021	reunion	territory	La Réunion
\.


--
-- Data for Name: page_element; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.page_element (id, page_id, type, key, text, image_id, alt, href, title) FROM stdin;
24652	1015	TEXT	ecosystems.ecosystems.1.description	Les forêts se trouvent principalement dans le nord, sur les massifs montagneux et difficilement accessibles des pitons du Carbet de la Montagne Pelée. On distingue plusieurs types de forêt présentant différents cortèges floristiques en fonction de l’altitude. On y trouve une importante diversité, notamment en espèces endémiques. 	\N	\N	\N	f
24653	1015	TEXT	ecosystems.ecosystems.0.description	Couvrant 50 km de l’île, surtout dans le sud, les plages sont des lieux de ponte pour 3 espèces de tortues marines et sont également bordées par un cortège floristique intéressant : patates bord de mer, pois bord de mer, raisinier bord de mer… Cette végétation est toutefois fortement dégradée par les installations touristiques et l’importante fréquentation de certaines plages. 	\N	\N	\N	f
24654	1015	TEXT	identity.highestPoint	1 397	\N	\N	\N	f
24655	1015	TEXT	interests.locations.4.description	Ces quatre îlets, gérés par le Parc naturel régional et l’Office national des forêts, sont l'un des plus importants sites de nidification des oiseaux marins des Petites Antilles. On y trouve entre autre puffins, sternes, moines…. L’accès en est strictement interdit.	\N	\N	\N	f
24656	1015	TEXT	risks.risks.0.name	Des préoccupations communes aux territoires antillais	\N	\N	\N	f
24657	1015	IMAGE	interests.locations.1.image	\N	1057	Presqu’île de la Caravelle © L. Léonard	\N	f
24658	1015	IMAGE	ecosystems.ecosystems.1.image	\N	1268	Forêt humide de Martinique © Fabien Lefebvre	\N	f
24659	1015	TEXT	interests.locations.3.description	Ces deux zones de forêt humide au nord de l'île sont classées en Réserve biologique intégrale, gérées par l'Office national des forêts. La forêt y est laissée en évolution naturelle, l'exploitation et les interventions y sont interdites, à l'exception des aménagements pour la sécurité du public. La Montagne Pelée, toujours en activité, est étroitement surveillée.	\N	\N	\N	f
24660	1015	TEXT	identity.title	La Martinique,  \n« l’île aux iguanes » 	\N	\N	\N	f
24661	1015	IMAGE	species.6.image	\N	1183	Image manquante	\N	f
24662	1015	TEXT	interests.locations.1.name	La Réserve naturelle nationale de la presqu’île de la Caravelle	\N	\N	\N	f
24663	1015	TEXT	statistics.2.text	de l'île couverts par le Parc naturel régional 	\N	\N	\N	f
24664	1015	IMAGE	species.0.image	\N	1061	*Caribena versicolor* © A. Lacoeulhe/INPN	\N	f
24665	1015	TEXT	events.1.date	1635	\N	\N	\N	f
24666	1015	TEXT	interests.locations.4.name	La réserve naturelle nationale des îlets de Sainte Anne	\N	\N	\N	f
22522	1022	TEXT	ecosystems.ecosystems.0.description	Au-dessus des forêts, les végétaux ligneux adoptent un port prostré et laissent place à des landes dominées par les éricacées au port rampant, dont le Kalmia à feuilles étroites (*Kalmia angustifolia*). Aux altitudes les plus élevées, cette formation laisse place à une toundra adaptée aux conditions très venteuses, typique des milieux alpins ou arctiques.	\N	\N	\N	f
22523	1022	TEXT	identity.highestPoint	240	\N	\N	\N	f
22524	1022	TEXT	interests.locations.4.description	Chef-lieu du territoire, cette commune concentre 86% de la population de l’archipel. Restreint à la zone portuaire, la ville s’est beaucoup étendue en périphérie ces dernières années, ce qui n’est pas sans causer des problèmes en matière d’assainissement, de gestion des déchets, et de dérangement de la faune aviaire. 	\N	\N	\N	f
22525	1022	TEXT	risks.risks.0.name	Les ressources naturelles, un enjeu important	\N	\N	\N	f
22526	1022	IMAGE	interests.locations.1.image	\N	1103	Vue aérienne de l'isthme © DR	\N	f
23406	1001	TEXT	species.7.description	Parmi les dizaines d’espèces d’ochidées indigènes, 5 sont endémiques strictes de Guadeloupe, dont [*Octomeria ffrenchiana*](https://inpn.mnhn.fr/espece/cd_nom/630252\n), espèce rare d’altitude découverte il y a quelques années seulement. Environ deux tiers des orchidées de Guadeloupe sont épiphytes : elles utilisent une autre plante comme support. Ces espèces sont considérées comme d’excellents bio-indicateurs de la santé du milieu qui les héberge.\n\nStatut dans la Liste rouge de la flore vasculaire de Guadeloupe pour *Octomeria ffrenchiana* : en danger critique.  	\N	\N	\N	f
23407	1001	TEXT	species.8.description	La Tortue imbriquée ([*Eretmochelys imbricata*](https://inpn.mnhn.fr/espece/cd_nom/77347\n)) est l’une des trois espèces de tortues marines qui viennent pondre sur les plages de Guadeloupe. Les tortues marines sont menacées entre autres par les captures accidentelles de pêche, les collisions, l’ingestion de déchets, le braconnage ou encore la destruction de leurs sites d’alimentation. Toutes les espèces de tortues sont protégées, et le réseau des tortues marines de Guadeloupe présente une [charte de bonne conduite à respecter en présence de tortues](http://www.tortuesmarinesguadeloupe.org/les-tortues-marines/la-charte-de-bonne-conduite/) pour les préserver.\n\nStatut dans la Liste rouge de la faune de Guadeloupe : quasi-menacée.  	\N	\N	\N	f
23408	1001	TEXT	events.2.description	Disparition du Lamantin des Caraïbes ([*Trichechus manatus*](https://inpn.mnhn.fr/espece/cd_nom/821122)) des eaux de Guadeloupe	\N	\N	\N	f
23409	1001	TEXT	events.3.description	Introduction du Raton-Laveur ([*Procyon lotor*](https://inpn.mnhn.fr/espece/cd_nom/60822)) en Guadeloupe depuis le continent américain	\N	\N	\N	f
23410	1001	IMAGE	species.2.image	\N	1167	*Guaiacum officinale* © César Delnatte	\N	f
23411	1001	IMAGE	identity.image	\N	1225	Pointe des Colibris © Olivier Delzon	\N	f
23412	1001	TEXT	species.3.description	Le Dynaste scieur de long ([*Dynastes hercules*](https://inpn.mnhn.fr/espece/cd_nom/440144\n)) est l’un des plus gros coléoptères du monde : il peut atteindre 17 cm de long pour 20 cm d’envergure en vol ! Il est protégé sur le territoire depuis 2007. A l’heure actuelle, 1 350 espèces de coléoptères ont été recensées en Guadeloupe mais on estime qu’il pourrait y avoir plusieurs centaines d’espèces encore inconnues.\n  \nStatut dans la Liste rouge de la faune de Guadeloupe : quasi-menacée.	\N	\N	\N	f
23413	1001	TEXT	events.7.description	Création du [Sanctuaire AGOA](https://sanctuaire-agoa.fr/) pour les mammifères marins qui couvre toutes les Antilles françaises	\N	\N	\N	f
23414	1001	TEXT	events.7.date	2010	\N	\N	\N	f
23415	1001	TEXT	interests.locations.0.name	Le Parc national de la Guadeloupe	\N	\N	\N	f
23416	1001	TEXT	species.1.description	Les Ouassous sont des crevettes d’eau douce. Ce terme recouvre une douzaine d’espèces différentes, parmi lesquelles [*Macrobrachium carcinus*](https://inpn.mnhn.fr/espece/cd_nom/534442\n), qui peut atteindre 30 cm de long. Elles sont très sensibles à la pollution des eaux (pesticides, détergents, hydrocarbures…) et plusieurs espèces sont considérées menacées en Guadeloupe. Bien que vivant la majeure partie de leur vie en eau douce, c’est en mer que se développent les premiers stades de leurs larves.  \n  \n\n\nStatut dans la Liste rouge de la faune de Guadeloupe pour *Macrobrachium carcinus* : vulnérable.	\N	\N	\N	f
22633	1006	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
22634	1023	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
21453	1009	SELECT	presentation.sourceSelect	inpn	\N	\N	\N	f
21454	1009	TEXT	understand.text2	Ce nombre comprend uniquement les espèces dites indigènes des territoires d'outre-mer, c’est-à-dire naturellement présentes sur les territoires. Il ne comprend pas les espèces introduites, volontairement ou involontairement, par les humains (animaux domestiques, plantes cultivées, etc.).\nCe nombre ne prend pas non plus en compte les espèces éteintes.	\N	\N	\N	f
22635	1024	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
22636	1025	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
22637	1026	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
22638	1027	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
22639	1028	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
22640	1029	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
22641	1017	CHECKBOX	shadowed	false	\N	\N	\N	f
22642	1016	CHECKBOX	header.shadowed	false	\N	\N	\N	f
22437	1022	TEXT	events.2.description	Fermeture naturelle de l’isthme	\N	\N	\N	f
22438	1022	TEXT	events.3.description	Première étude publiée sur la flore de Saint-Pierre et Miquelon (thèse de pharmacie d’Alphonse Gaulthier)	\N	\N	\N	f
22439	1022	IMAGE	identity.image	\N	1109	L'étang du Bois brûlé © Nathalie de Lacoste	\N	f
22440	1022	TEXT	events.7.description	Projet de Réserve naturelle nationale sur le Grand Barachois, finalement abandonné	\N	\N	\N	f
22441	1022	TEXT	events.7.date	1988 - 1992 	\N	\N	\N	f
22442	1022	TEXT	interests.locations.0.name	Le Grand Barachois	\N	\N	\N	f
22443	1022	TEXT	events.0.description	Prise de possession française des îles par Jacques Cartier	\N	\N	\N	f
22444	1022	TEXT	events.1.description	Première installation permanente des pêcheurs bretons, normands et basques	\N	\N	\N	f
22643	1019	CHECKBOX	header.shadowed	false	\N	\N	\N	f
22647	1022	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
22649	1004	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
22650	1008	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
22651	1009	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
22652	1010	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
22653	1011	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
22654	1012	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
22655	1013	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
22656	1014	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
22657	1020	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
22527	1022	IMAGE	ecosystems.ecosystems.1.image	\N	1104	Tourbière près de l’étang de Richepomme © Nathalie de Lacoste	\N	f
19303	1020	IMAGE	species.9.image	\N	1203	Image manquante	\N	f
19304	1020	TEXT	events.2.description	Création de la première aire protégée de l'archipel, l'îlot Leprédour	\N	\N	\N	f
19305	1020	TEXT	events.3.description	Inscription des lagons de Nouvelle-Calédonie au Patrimoine mondial de l'UNESCO	\N	\N	\N	f
24736	1000	TEXT	presentation.title	Le Compteur de biodiversité outre-mer	\N	\N	\N	f
24737	1000	TEXT	carousel.title	Partez à la rencontre des espèces et des écosystèmes ultramarins	\N	\N	\N	f
19306	1020	IMAGE	identity.image	\N	1088	Île des Pins, Nouvelle-Calédonie © Sébastien Jermer/Unsplash	\N	f
19307	1020	TEXT	events.7.description	Publication du Code de l'environnement de la Province des îles Loyauté	\N	\N	\N	f
24738	1000	TEXT	presentation.indicators	Des chiffres clés pour comprendre 	\N	\N	\N	f
24739	1000	TEXT	testimony.title	Une biodiversité unique mais fragile, protégeons-la !	\N	\N	\N	f
24740	1000	IMAGE	testimony.image	\N	1262	Agents de l’OFB en Guyane © Raphael Gailhac	\N	f
24741	1000	IMAGE	carousel.images.1.image	\N	1260	Martinique © Fabien Lefebvre	\N	f
24742	1000	TEXT	presentation.science	Participez aux programmes pour faire progresser la connaissance	\N	\N	\N	f
21847	1012	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
21848	1012	TEXT	understand.text2	Ces milieux ont une importance au regard des services écosystémiques qu’ils procurent aux humains : régulation des crues et des inondations, protection des côtes de l’érosion et des tempêtes, épuration des eaux...\nSi des phénomènes naturels tels que les cyclones peuvent impacter les mangroves, de nombreuses causes de leur dégradation ont une origine humaine : changement climatique, artificialisation, exploitation intensive de ses ressources (bois, chasse, etc.), dépôts d’ordures, déversement des eaux usées, pollutions, pression touristique, etc. 	\N	\N	\N	f
24743	1000	TEXT	science.text	Enrichir ses propres connaissances et développer son sens de l’observation tout en participant à la progression et l'amélioration des connaissances scientifiques pour préserver la biodiversité, c’est le pari des sciences participatives.	\N	\N	\N	f
24744	1000	TEXT	carousel.text	Naviguez parmi les portraits biodiversité des territoires pour mieux comprendre les enjeux avec une sélection de repères et chiffres clés sur la nature.	\N	\N	\N	f
24745	1000	CHECKBOX	carousel.images.0.shadowed	true	\N	\N	\N	f
24746	1000	IMAGE	carousel.images.2.image	\N	1004	Dendrobate à ventre tacheté *Ranitomeya amazonica* © Raphaël Gailhac	\N	f
24747	1000	TEXT	presentation.territories	Découvrez l’identité de chaque territoire d’outre-mer	\N	\N	\N	f
24748	1000	CHECKBOX	carousel.images.1.shadowed	false	\N	\N	\N	f
24749	1000	IMAGE	science.image	\N	1251	 Observations de terrain à Saint-Pierre-et-Miquelon © Nathalie De Lacoste	\N	f
24750	1000	TEXT	science.title	Faire progresser ensemble les connaissances	\N	\N	\N	f
24751	1000	TEXT	testimony.quote	Ces actions conjuguées entraînent un accroissement de la biodiversité, une amélioration de la qualité de l’eau, de l’air mais aussi de la qualité de vie.	\N	\N	\N	f
24752	1000	TEXT	presentation.ecogestures	Des gestes simples à mettre en place au quotidien	\N	\N	\N	f
24753	1000	TEXT	presentation.quote	Les outre-mer regroupent 80 % de la biodiversité française, réinventons, adaptons notre façon de vivre et de voyager	\N	\N	\N	f
24754	1000	IMAGE	carousel.images.0.image	\N	1258	Fonds marins en Martinique © Fabien Lefebvre	\N	f
24755	1000	TEXT	presentation.text	Les territoires d’outre-mer présentent une biodiversité particulièrement riche et variée, mais fragilisée par les activités humaines.\nLa mission du Compteur est de donner une vision d’ensemble des enjeux liés à la biodiversité en outre-mer afin que chacun, résident ou voyageur de passage, puisse s’informer et s’impliquer à son échelle pour la préservation de cette biodiversité exceptionnelle.  	\N	\N	\N	f
19308	1020	TEXT	events.7.date	2016	\N	\N	\N	f
19309	1020	TEXT	interests.locations.0.name	Le Parc naturel de la Mer de Corail 	\N	\N	\N	f
19310	1020	TEXT	events.0.description	Dislocation du supercontinent Gondwana et séparation de la Nouvelle-Calédonie avec l’Australie et la Nouvelle-Zélande	\N	\N	\N	f
19311	1020	TEXT	events.1.description	Arrivée des explorateurs Lapita par la mer : première occupation humaine du territoire	\N	\N	\N	f
19312	1020	TEXT	events.8.description	Expédition naturaliste ["la Planète revisitée"](http://nouvellecaledonie.laplaneterevisitee.org/)	\N	\N	\N	f
19313	1020	TEXT	events.9.description	Création du parc provincial de la Côte oubliée	\N	\N	\N	f
24756	1000	TEXT	carousel.territoriesButton	Découvrir les territoires	\N	\N	\N	f
24757	1000	CHECKBOX	carousel.images.2.shadowed	false	\N	\N	\N	f
19314	1020	IMAGE	ecosystems.image	\N	1094	test	\N	f
24758	1000	TEXT	testimony.text	La conservation de la biodiversité dépend de sa connaissance et de la compréhension des phénomènes qui l’impactent. Les indicateurs sont des outils qui permettent de suivre différents paramètres de la biodiversité, pour renseigner de son évolution.	\N	\N	\N	f
19315	1020	TEXT	identity.species	26 984	\N	\N	\N	f
19316	1020	IMAGE	ecosystems.ecosystems.0.image	\N	1092	Forêt tropicale humide sur l’île de Lifou, Nouvelle-Calédonie © Benjamin Guichard / OFB	\N	f
19317	1020	TEXT	species.11.description	A compléter	\N	\N	\N	f
19318	1020	TEXT	species.12.description	à compléter	\N	\N	\N	f
19319	1020	TEXT	species.8.name	Le Niaouli	\N	\N	\N	f
19320	1020	TEXT	events.6.description	Création du Parc marin de la mer de Corail ; Inscription des lacs du Grand Sud sur la liste des sites Ramsar	\N	\N	\N	f
19321	1020	TEXT	events.6.date	2014	\N	\N	\N	f
19322	1020	TEXT	events.4.description	Publication des Codes de l'environnement des Provinces Sud et Nord	\N	\N	\N	f
19323	1020	TEXT	events.5.description	Création du [Conservatoire d'espaces naturels](https://www.cen.nc/especes-envahissantes/presentation)	\N	\N	\N	f
19324	1020	TEXT	interests.locations.2.name	La région des lacs du Grand Sud	\N	\N	\N	f
24759	1021	TEXT	species.7.description	Le Tamarin des Hauts ([*Acacia heterophylla*](https://inpn.mnhn.fr/espece/cd_nom/705753\n)) se trouve principalement en forêt humide de montagne entre 1100 et 1700 mètres d'altitude. Il peut atteindre 25 mètres de haut mais il est vulnérable aux cyclones en raison de son enracinement peu profond. Il s’agit d’une espèce endémique de l’île.\n\nStatut dans la Liste rouge de la flore vasculaire de La Réunion : préoccupation mineure. 	\N	\N	\N	f
23417	1001	TEXT	species.2.description	Le Gaïac ([*Guaiacum officinale*](https://inpn.mnhn.fr/espece/cd_nom/629786\n)) est un petit arbre des milieux secs, utilisé pour son bois très dense et son usage médicinal. Surexploité et victime de la destruction de son habitat, il est aujourd’hui considéré en danger d’extinction en Guadeloupe et il est protégé. Les derniers individus sont localisés dans la Réserve naturelle nationale des îlets de Petite Terre.\n\nStatut dans la Liste rouge de la flore vasculaire de Guadeloupe : en danger. 	\N	\N	\N	f
23418	1001	TEXT	events.0.description	Premières traces d'occupation humaine en Guadeloupe	\N	\N	\N	f
23419	1001	TEXT	events.1.description	La Guadeloupe devient française	\N	\N	\N	f
23420	1001	TEXT	events.8.description	Publication de la Liste rouge des oiseaux de Guadeloupe	\N	\N	\N	f
23421	1001	TEXT	events.9.description	Publication de la Liste rouge de la flore vasculaire de Guadeloupe	\N	\N	\N	f
23422	1001	IMAGE	ecosystems.image	\N	1026	La pointe de la Grande Vigie © Annie Mason/Unsplash	\N	f
23423	1001	TEXT	identity.species	10 279	\N	\N	\N	f
23424	1001	TEXT	statistics.1.number	42 %	\N	\N	\N	f
23425	1001	IMAGE	ecosystems.ecosystems.0.image	\N	1010	La forêt d’altitude sur La Soufrière © Maël Gramain/Unsplash	\N	f
23426	1001	TEXT	statistics.0.number	1 407	\N	\N	\N	f
23427	1001	TEXT	statistics.2.number	1989	\N	\N	\N	f
23428	1001	TEXT	species.2.name	Le Gaïac	\N	\N	\N	f
23429	1001	TEXT	species.8.name	La Tortue imbriquée	\N	\N	\N	f
23430	1001	TEXT	species.4.description	Les Anolis sont des lézards communément observés sur tout le territoire. Ce terme regroupe plusieurs espèces et sous-espèces endémiques de la Guadeloupe et de ses dépendances. Chaque île, voire presque chaque îlet des Antilles, possède une population d’anolis qui se différencie par ses couleurs et sa morphologie. Ils sont tous protégés.  	\N	\N	\N	f
23431	1001	TEXT	events.6.description	La Guadeloupe obtient le label «&nbsp;Réserve de Biosphère&nbsp;» de l’UNESCO	\N	\N	\N	f
19325	1020	TEXT	ecosystems.ecosystems.3.description	Aussi dit « sclérophylle », ce type de forêt n’est plus présent que sur environ 175 km<sup>2</sup>, soit moins de 1 % du territoire et moins de 2 % de sa surface estimée d’origine. Localisées sur le littoral de la côte ouest, ces forêts très vulnérables, notamment aux aménagements agropastoraux, aux incendies et aux espèces exotiques envahissantes, abritent une biodiversité élevée avec un taux d'endémisme de 60 %.   \nLe [programme de conservation](https://www.cen.nc/foret-seche/presentation) des forêts sèches, mis en place en 2001, est aujourd'hui coordonné par le Conservatoire d'espaces naturels de Nouvelle-Calédonie. 	\N	\N	\N	f
19326	1020	TEXT	ecosystems.ecosystems.4.description	Forêt de bord de mer aux pieds dans l’eau, cette formation arborescente adaptée aux conditions de salinité des eaux, au manque d'oxygène et à l'instabilité des sols, est située en majorité sur la côte ouest du fait de vastes plaines propices à son installation. Elle couvre 258 km<sup>2</sup> sur l'ensemble de la Nouvelle-Calédonie.  \nProtection contre l’érosion, les tempêtes, la sédimentation dans le lagon, zone de nurserie pour de nombreux organismes, épuration de l’eau… les services rendus par cet écosystème sont nombreux et précieux.	\N	\N	\N	f
19327	1020	TEXT	ecosystems.ecosystems.4.name	La mangrove	\N	\N	\N	f
19328	1020	IMAGE	species.1.image	\N	1153	*Rhynochetos jubatus* © Pierre Fidenci / CC BY-SA 3.0	\N	f
19329	1020	TEXT	species.10.description	à compléter	\N	\N	\N	f
19330	1020	TEXT	events.5.date	2011	\N	\N	\N	f
19331	1020	TEXT	identity.marineArea	1,4 million	\N	\N	\N	f
19332	1020	TEXT	species.9.name	*Syzygium acre*	\N	\N	\N	f
19333	1020	TEXT	events.8.date	2016-2019	\N	\N	\N	f
19334	1020	IMAGE	interests.locations.0.image	\N	1089	Vue du Parc naturel de la Mer de Corail © Anne Littaye/ OFB	\N	f
19335	1020	TEXT	species.6.name	Le Gecko géant	\N	\N	\N	f
19336	1020	IMAGE	interests.locations.3.image	\N	1197	Image manquante	\N	f
19337	1020	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
19338	1020	TEXT	interests.locations.3.name	La réserve de nature sauvage du Mont Panié	\N	\N	\N	f
19339	1020	TEXT	statistics.1.text	Plus grande barrière de corail au monde (1 600 km)	\N	\N	\N	f
19340	1020	TEXT	events.9.date	2019	\N	\N	\N	f
19341	1020	IMAGE	species.4.image	\N	1198	Image manquante	\N	f
19342	1020	IMAGE	species.12.image	\N	1245	Image manquante	\N	f
19343	1020	TEXT	events.3.date	2008	\N	\N	\N	f
19344	1020	IMAGE	ecosystems.ecosystems.3.image	\N	1205	Image manquante	\N	f
19345	1020	IMAGE	species.3.image	\N	1239	*Laticauda sp.* © Hélène Udo	\N	f
19346	1020	TEXT	species.1.name	Le Cagou	\N	\N	\N	f
19347	1020	TEXT	species.7.name	La Sterne néreis	\N	\N	\N	f
19348	1020	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
19349	1020	TEXT	species.4.name	*Amborella trichopoda*	\N	\N	\N	f
19350	1020	TEXT	identity.area	16 624	\N	\N	\N	f
23432	1001	TEXT	events.6.date	1993	\N	\N	\N	f
23433	1001	TEXT	ecosystems.ecosystems.0.name	La forêt d’altitude	\N	\N	\N	f
24760	1021	TEXT	species.8.description	Le Bois d’Ortie ([*Obetia ficifolia*](https://inpn.mnhn.fr/espece/cd_nom/706579\n)) est une espèce rare et endémique des Mascareigne, qu’on retrouve dans les forêts sèches et semi-sèches. Il doit son nom à sa capacité à provoquer des irritations de la peau, mais il est réputé des tisaneurs pour être un remède contre l’asthme. Il est également connu pour être l’hôte d’un papillon endémique, le *Salamis augustina augustina*, qui n’a cependant pas été observé depuis 2005, ce qui laisse à penser à sa disparition. Dans l’espoir de le voir réapparaitre, des plantations de bois d’Ortie sont réalisées notamment sur le massif de la Grande Chaloupe.\n\nStatut dans la Liste rouge de la flore vasculaire de La Réunion : en danger. 	\N	\N	\N	f
24761	1021	TEXT	events.2.description	Dernière mention connue du Solitaire de la Réunion ([*Threskiornis solitarius*](https://inpn.mnhn.fr/espece/cd_nom/432588)) oiseau endémique	\N	\N	\N	f
24762	1021	TEXT	events.3.description	Publication des premiers volumes de La Flore des Mascareignes, avec la contribution du botaniste Thérésien Cadet.	\N	\N	\N	f
24763	1021	IMAGE	species.2.image	\N	1160	*Megaptera novaeangliae* © Laurent Bouveret	\N	f
24764	1021	IMAGE	identity.image	\N	1095	Cascades du Bras d’Annette à Grand Etang, La Réunion © Philippe Gourdain	\N	f
24765	1021	TEXT	species.3.description	Le Petit Molosse de La Réunion ([*Mormopterus francoismoutoui*](https://inpn.mnhn.fr/espece/cd_nom/458690\n)), est l’une des 3 espèces de chauve-souris présentes sur l’île et la seule strictement endémique encore présente. Les chauves-souris sont les seuls mammifères indigènes, toutes les autres espèces de mammifères présents ayant été introduits par l’homme, volontairement (élevage ou animaux domestiques) ou involontairement (souris, rats, etc.).\n\nStatut dans la Liste rouge des mammifères de La Réunion : préoccupation mineure. 	\N	\N	\N	f
24766	1021	TEXT	events.7.description	Publication de la Liste rouge des coraux de l’Océan Indien	\N	\N	\N	f
24767	1021	TEXT	events.7.date	2020	\N	\N	\N	f
24768	1021	TEXT	interests.locations.0.name	Le Parc national de La Réunion	\N	\N	\N	f
24769	1021	TEXT	species.1.description	L'Échenilleur de La Réunion ([*Lalage newtoni*](https://inpn.mnhn.fr/espece/cd_nom/895898\n)), aussi appelé Tuit-Tuit en raison du chant du mâle, est un passereau endémique de la forêt de la Roche écrite, dans le nord de l’île. Victime de la prédation par les rats et les chats, sa population est actuellement estimée à quelques dizaines de couples et il est considéré en grand danger d’extinction. Grâce aux programmes de lutte contre les prédateurs introduits, ses effectifs remontent petit à petit.\n\nStatut dans la Liste rouge des oiseaux de La Réunion : en danger critique. 	\N	\N	\N	f
24770	1021	TEXT	species.2.description	Les baleines à bosses ([*Megaptera novaeangliae*](https://inpn.mnhn.fr/espece/cd_nom/60867\n)) viennent se reproduire le long des côtes réunionnaises entre juin et octobre. S’il est possible de les observer depuis un bateau, le respect de la [règlementation](https://cedtm-asso.org/quietude/la-reglementation/) est impératif pour préserver la tranquillité des cétacés, mais également pour la sécurité des observateurs.\n\nStatut dans la Liste rouge des mammifères marins de La Réunion : vulnérable. 	\N	\N	\N	f
24771	1021	TEXT	events.0.description	Emergence de l’île	\N	\N	\N	f
24772	1021	TEXT	events.1.description	Dernière éruption du Piton des Neiges	\N	\N	\N	f
24773	1021	IMAGE	ecosystems.image	\N	1101	Cirque de Mafate © Céline Soyer	\N	f
24774	1021	TEXT	identity.species	10 463	\N	\N	\N	f
24775	1021	TEXT	statistics.1.number	2007	\N	\N	\N	f
23434	1001	TEXT	species.5.description	Le Palmier ti-koko ([*Syagrus amara*](https://inpn.mnhn.fr/espece/cd_nom/630761\n)), protégé et endémique des Petites Antilles, est encore abondant en Guadeloupe alors qu'il a presque disparu de Martinique. Son allure ressemble au cocotier, son port est majestueux et ses fruits ressemblent à des petites noix de coco, d’où son nom.\n\nStatut dans la Liste rouge de la flore vasculaire de Guadeloupe : vulnérable. 	\N	\N	\N	f
23435	1001	TEXT	species.6.description	La mangrove de bord de mer est principalement constituée de Palétuvier rouge ([*Rhizophora mangle*](https://inpn.mnhn.fr/espece/cd_nom/447470\n)), reconnaissable à ses racines-échasses qui se fixent dans les fonds vaseux. Ses graines ont la particularité de germer alors qu’elles sont encore accrochées à l’arbre. Il joue un rôle capital dans la protection des côtes contre la houle, la filtration des eaux saumâtres et ses racines sont une véritable nurserie pour les poissons marins.\n\nStatut dans la Liste rouge de la flore vasculaire de Guadeloupe : Préoccupation mineure. 	\N	\N	\N	f
23436	1001	TEXT	events.4.description	Dernière éruption de la Soufrière	\N	\N	\N	f
24776	1021	IMAGE	ecosystems.ecosystems.0.image	\N	1237	Sentier de randonnée dans la forêt humide © Philippe Gourdain	\N	f
24777	1021	TEXT	statistics.0.number	3 500	\N	\N	\N	f
24778	1021	TEXT	statistics.2.number	1 738 espèces	\N	\N	\N	f
24779	1021	IMAGE	interests.locations.4.image	\N	1188	Image manquante	\N	f
24780	1021	TEXT	species.2.name	La Baleine à bosse	\N	\N	\N	f
24781	1021	TEXT	species.8.name	Le Bois d’Ortie	\N	\N	\N	f
24782	1021	TEXT	species.4.description	Le Pétrel de Barau ([*Pterodroma baraui*](https://inpn.mnhn.fr/espece/cd_nom/215079\n)), également appelé « Taille Vent », est un oiseau endémique nichant dans des terriers à même le sol, en haute altitude sur les contreforts du Piton des Neiges. Victimes de la prédation par les rats et les chats, de nombreux jeunes sont également désorientés par les éclairages publics lors de leur premier envol et s’échouent en milieu urbain. En danger d’extinction, l’espèce fait l’objet d’un plan de conservation [LIFE+ Pétrels](https://www.petrels.re/).\n\nStatut dans la Liste rouge des oiseaux de La Réunion : en danger. 	\N	\N	\N	f
24783	1021	TEXT	events.6.description	Découverte du premier site de nidification du [Pétrel noir de Bourbon](https://www.petrels.re/les-especes/petrel-noir-de-bourbon/) ([*Pseudobulweria aterrima*](https://inpn.mnhn.fr/espece/cd_nom/442280)), oiseau endémique encore mal connu	\N	\N	\N	f
24784	1021	TEXT	events.6.date	2016	\N	\N	\N	f
24785	1021	TEXT	ecosystems.ecosystems.0.name	Les forêts humides	\N	\N	\N	f
24786	1021	TEXT	species.5.description	Les Fanjan sont des fougères arborescentes typiques des forêts de Bois de couleur des Hauts. On distingue 3 espèces différentes : [*Alsophila borbonica*](https://inpn.mnhn.fr/espece/cd_nom/707878\n), [*A. glaucifolia*](https://inpn.mnhn.fr/espece/cd_nom/707883\n) et [*A. celsa*](https://inpn.mnhn.fr/espece/cd_nom/707882\n). Traditionnellement utilisés pour la confection de pots à plantes vertes, leur prélèvement a entrainé une dégradation importante des écosystèmes et une menace pour la conservation de ces espèces. Une espèce proche originaire d’Australie (*Sphaeropteris cooperi*) a été introduite sur l’île et présente un caractère envahissant qui pourrait menacer les espèces indigènes.\n\nStatut dans la liste rouge de la flore vasculaire de La Réunion (pour les 3 espèces indigènes) : préoccupation mineure. 	\N	\N	\N	f
24787	1021	TEXT	species.6.description	Le Latanier rouge ([*Latania lontaroides*](https://inpn.mnhn.fr/espece/cd_nom/630013\n)) est un palmier endémique de La Réunion. A l’état naturel, on ne le trouve plus que dans le sud de l’île et il est considéré en danger critique d’extinction. Il était exploité pour son bois et ses palmes utilisées pour les toits.\n\nStatut dans la Liste rouge de la flore vasculaire de La Réunion : en danger critique. 	\N	\N	\N	f
24788	1021	TEXT	events.4.description	Création du Parc national de La Réunion ; Création de la Réserve naturelle marine	\N	\N	\N	f
24789	1021	TEXT	events.5.description	Publication des Listes rouges de la Faune et de la Flore de la Réunion ; Inscription des cirques au Patrimoine mondial de l'UNESCO	\N	\N	\N	f
24790	1021	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
24791	1021	TEXT	interests.locations.2.name	Le massif de la Fournaise	\N	\N	\N	f
24792	1021	TEXT	ecosystems.ecosystems.3.description	Aussi appelés Pandanaies, ces habitats sont formés par le Pimpin des Hauts (*Padanus montanus*), un petit arbre aux racines en échasses endémique de la Réunion, qui sert de support pour de nombreuses espèces de mousses, fougères et orchidées. Uniques au monde, ces zones humides remarquables se trouvent principalement sur les versants de l'Est et du Sud-est de l'île. La [Pandanaie de la Plaine des Palmistes](file:///C:/Users/DBLOTT~1/AppData/Local/Temp/depliant_pandanaie_def.pdf), particulièrement riche en faune et flore, fait l'objet d'un arrêté de protection de biotope.	\N	\N	\N	f
22528	1022	TEXT	interests.locations.3.description	Située dans le tissu urbain de la ville de Saint-Pierre, cette enclave de tourbières et étangs de 27 ha est l’une des dernières tourbières de la partie sud de l’île de Saint-Pierre. D’un intérêt écologique fort, en partie car de nombreuses espèces d’oiseaux y font étape durant leur trajet migratoire, le site fait l’objet d’un plan de gestion depuis 2018.\n\n	\N	\N	\N	f
22529	1022	TEXT	identity.title	Saint-Pierre-et-Miquelon,  \ndes eaux riches en biodiversité	\N	\N	\N	f
23437	1001	TEXT	events.5.description	Création du Parc national de Guadeloupe	\N	\N	\N	f
24793	1021	TEXT	interests.locations.5.name	[La Réserve naturelle marine](http://www.reservemarinereunion.fr/)	\N	\N	\N	f
24794	1021	TEXT	events.0.date	-2 à 3 millions d’années,	\N	\N	\N	f
24795	1021	TEXT	identity.populationYear	2017	\N	\N	\N	f
23438	1001	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
23439	1001	TEXT	interests.locations.2.name	La Réserve naturelle nationale des îles de Petite Terre	\N	\N	\N	f
23440	1001	TEXT	ecosystems.ecosystems.3.description	En Guadeloupe, les mangroves se trouvent principalement en bordure du Grand et du Petit Cul-de-Sac marin et à Marie-Galante. On distingue 3 types de mangroves : la mangrove de bord de mer à la salinité constante est le territoire du Palétuvier rouge (*Rhizophora mangle*) ; la mangrove arbustive à une dizaine de mètres du rivage, où la salinité est extrême, où les Palétuviers noirs (*Avicennia germinans* et *A. schaueriana*) abondent ; la mangrove haute, au-delà, où l’on trouve Palétuviers blancs et gris (*Laguncularia racemosa* et *Conocarpus erectus*). On y trouve de nombreuses espèces de crabes et d’oiseaux. 	\N	\N	\N	f
23441	1001	TEXT	events.10.date	2020 - 2029	\N	\N	\N	f
23442	1001	TEXT	events.0.date	-3000 ans	\N	\N	\N	f
23443	1001	TEXT	identity.populationYear	2017	\N	\N	\N	f
23444	1001	IMAGE	species.5.image	\N	1171	Image manquante	\N	f
23445	1001	TEXT	statistics.0.text	espèces endémiques du territoire	\N	\N	\N	f
23446	1001	IMAGE	species.1.image	\N	1009	*Macrobrachium carcinus* © Clinton & Charles Robertson / CC BY 2.0 	\N	f
23447	1001	TEXT	ecosystems.ecosystems.1.name	Les plages	\N	\N	\N	f
23448	1001	TEXT	events.2.date	18<sup>e</sup> siècle	\N	\N	\N	f
21455	1009	TEXT	understand.text1	Dispersés au sein de trois océans, les territoires d’outre-mer français sont répartis de la zone équatoriale à la zone polaire. Cette diversité de situations géographiques est à l’origine de la très grande diversité biologique trouvées au sein de ces collectivités. De plus, le caractère insulaire de la plupart des territoires (la Guyane excepté) explique le très haut taux d'[endémisme](https://preprod.biodiversite-outre-mer.fr/indicateurs/especes-endemiques) de la faune et de la flore. \n\nAinsi, la plupart des territoires ultramarins français sont situés dans des zones du globe mondialement reconnues comme étant particulièrement riches en espèces, appelées "points chauds" (*hotspots*). Le milieu marin d'outre-mer couvre également une superficie gigantesque : il représente plus de 3 % des mers et océans du monde, et compte 55 000 km<sup>2</sup> de récifs coralliens et lagons. \n\n\n	\N	\N	\N	f
21456	1009	TEXT	territories.title	Nombre d'espèces indigènes	\N	\N	\N	f
21457	1009	TEXT	understand.title1	Un patrimoine biologique exceptionnel en outre-mer	\N	\N	\N	f
23449	1001	TEXT	events.5.date	1989	\N	\N	\N	f
23450	1001	TEXT	identity.marineArea	90 000	\N	\N	\N	f
23451	1001	TEXT	events.8.date	2012	\N	\N	\N	f
23452	1001	TEXT	identity.presentation	Formée de deux îles principales, Basse-Terre et Grande-Terre, séparées par un bras de mer et entourées de plusieurs dépendances et d’îlets, la Guadeloupe, en raison de sa taille, son altitude, sa géologie et la diversité de ses paysages, est le territoire le plus riche en espèces, notamment endémiques, des Petites Antilles.  	\N	\N	\N	f
24796	1021	IMAGE	species.5.image	\N	1191	Image manquante	\N	f
23453	1001	IMAGE	interests.locations.0.image	\N	1006	Rivière dans le Parc national de Guadeloupe © Filo gèn' / CC BY-SA 4.0	\N	f
23454	1001	TEXT	species.6.name	Le Palétuvier rouge	\N	\N	\N	f
23455	1001	TEXT	identity.population	390 253	\N	\N	\N	f
20022	1016	TEXT	science.project.title	Un projet original en Nouvelle-Calédonie	\N	\N	\N	f
20023	1016	TEXT	header.title	Agir ensemble pour préserver la biodiversité remarquable des outre-mer	\N	\N	\N	f
14284	1030	TEXT	paragraphs.0.title	Conception et édition	\N	\N	\N	f
14285	1030	TEXT	paragraphs.1.text	**Informations contenues dans le site**\nLe portail Compteur de biodiversité outre-mer est un site informatif. \nIl a pour objectif de présenter la biodiversité des territoires ultra-marins français et des actions et initiatives menées pour la protection de ces écosystèmes.\nAucune information contenue sur le site ne saurait posséder ou être interprétée comme ayant une quelconque valeur contractuelle. Les textes à caractère scientifique publiés dans le site sont valables à la date de leur publication et ne sauraient engager leurs auteurs dans le futur.\nToute information contenue sur le site peut être modifiée, à tout moment sans préavis, par le Muséum national d’histoire naturelle. Les informations contenues sur le site ne constituent pas une offre de services ou de produits ni une sollicitation commerciale de quelque nature que ce soit, ni une recommandation ou un conseil. Le Muséum national d’histoire naturelle ne sera pas tenu responsable pour toute décision prise ou non sur la base d’une information contenue sur le site, ni pour l’utilisation qui pourrait en être faite par un tiers. Ces informations ne sauraient engager la responsabilité du Muséum national d’histoire naturelle.\n\n**Propriété intellectuelle**\nL’ensemble du site « Compteur de biodiversité outre-mer » relève de la législation française et internationale sur le droit d’auteur et la propriété intellectuelle.\nTous les éléments présentés sur ce site (textes, photographies, vidéos, créations graphiques, illustrations) sont soumis à la législation relative au droit des informations publiques et sont couverts par le droit d'auteur. Ces éléments restent la propriété exclusive du Muséum national d’Histoire naturelle et/ou de ses auteurs.\nLa reproduction de tout ou partie de ce site sur un support électronique quel qu’il soit est formellement interdite sauf autorisation expresse du directeur de la publication. La reproduction de ce site sur un support papier est autorisée pour des fins personnelles, associatives ou professionnelles et sous réserve du respect des trois conditions suivantes :\n• gratuité de la diffusion ;\n• respect de l’intégrité des documents reproduits : pas de modification ni altération d’aucune sorte ;\n• citation claire et lisible de la source indiquant le nom "Muséum national d’Histoire naturelle", l’adresse internet du site web du MNHN : www.mnhn.fr et la mention : "© sur www.mnhn.fr - Reproduction interdite – Tous droits réservés".\nToutes diffusions ou utilisations à des fins commerciales ou publicitaires des informations sont strictement interdites. Pour d’autres utilisations envisagées, veuillez nous consulter.\n\n**Crédits photographiques**\nToutes les photographies présentes sur le site sont créditées de leurs auteurs et de la licence associée à leur utilisation si elle est mentionnée.\nLes contenus sous licence Creative Commons ont une mention spécifique avec le type de licence qui permet à l’utilisateur d’aller consulter les conditions d’utilisation de l’image concernée. \nExemple :\n(CC BY-NC-SA 3.0)	\N	\N	\N	f
20024	1016	IMAGE	science.project.image	\N	1072	© Claire Goiran/UNC	\N	f
20025	1016	TEXT	science.title	Les sciences participatives	\N	\N	\N	f
24797	1021	TEXT	statistics.0.text	hectares de récifs coralliens protégés par la réserve marine	\N	\N	\N	f
24798	1021	IMAGE	species.1.image	\N	1159	Échenilleur de La Réunion © Jaime Martinez / CC BY-SA 4.0	\N	f
24799	1021	TEXT	ecosystems.ecosystems.1.name	La forêt sèche	\N	\N	\N	f
24800	1021	TEXT	events.2.date	1708	\N	\N	\N	f
20026	1016	TEXT	science.project.description	Un groupe de 7 plongeuses entre 60 et 75 ans ont collaboré avec les chercheurs de l’Université de Nouvelle-Calédonie pour étudier un serpent de mer méconnu, l’Hydrophis major, dans la baie des Citrons, au sud de Nouméa.	\N	\N	\N	f
20027	1016	TEXT	science.subtitle	Les sciences participatives permettent à tous les curieux de la nature, du débutant à l’expérimenté, de contribuer à l'amélioration des connaissances sur la biodiversité en fournissant aux scientifiques un grand nombre de données de terrain.	\N	\N	\N	f
20028	1016	TEXT	ecogestures.title	Découvrez les écogestes	\N	\N	\N	f
20029	1016	IMAGE	header.background	\N	1071	Manapany, La Réunion © Philippe Gourdain / OFB	\N	f
20030	1016	TEXT	header.subtitle	Réfléchir à son impact, changer ses habitudes, participer à la progression des connaissances sur les espèces et les espaces, donner de son temps dans des actions de terrain : chacun, à son échelle, peut agir et s’investir pour la préservation de la biodiversité de son territoire.	\N	\N	\N	f
20031	1016	TEXT	ecogestures.subtitle	Petits efforts ou grands gestes, nous pouvons tous être acteurs du changement, pour limiter notre impact sur le monde qui nous entoure.	\N	\N	\N	f
21458	1009	TEXT	understand.paragraphs.1.text	Sur les quelques centaines d’espèces de mammifères indigènes recensés, la plupart des espèces terrestres se trouvent en Guyane. On y rencontre par exemple le jaguar, le paresseux à deux doigts et plusieurs espèces de primates. Très peu de mammifères terrestres sont naturellement présents sur les îles et il s’agit quasiment uniquement de chauves-souris. Les autres mammifères recensés sont des espèces marines comme les baleines, les dauphins et les phoques.\n\nDe nombreuses espèces de mammifères ont été introduites par l’homme sur les îles et sont devenues [envahissantes](https://preprod.biodiversite-outre-mer.fr/indicateurs/especes-exotiques-envahissantes) : chats, rats, souris, lapins, cerfs, chiens, chèvres… Ces introductions sont à l'origine de grandes perturbations pour les écosystème fragiles de ces territoires, et de l'extinction de nombreuses espèces. 	\N	\N	\N	f
21459	1009	TEXT	understand.title2	Vous avez dit « espèce indigène » ? 	\N	\N	\N	f
21460	1009	TEXT	presentation.descriptionTerritories	espèces sont indigènes sur le territoire	\N	\N	\N	f
21461	1009	TEXT	understand.paragraphs.0.title	Une importante diversité de plantes à fleurs et d'insectes	\N	\N	\N	f
21462	1009	TEXT	understand.keyword	indigene	\N	\N	\N	f
21463	1009	TEXT	ecogestures.title	Comment préserver la biodiversité indigène ?	\N	\N	\N	f
21464	1009	IMAGE	presentation.image	\N	1039	Cacique à queue jaune © Raphael Gailhac	\N	f
21465	1009	TEXT	understand.paragraphs.1.title	Des mammifères terrestres peu nombreux sur les îles 	\N	\N	\N	f
21978	1004	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
21979	1004	TEXT	understand.text2	Ces espèces exotiques envahissantes perturbent les équilibres environnementaux en entrant en compétition avec les espèces locales (pour la nourriture, les sites de reproduction ou de repos, la lumière, etc.), par prédation, introduction de pathogènes, hybridation ou encore en modifiant les paramètres physico-chimiques des habitats.  Elles ont ainsi de lourds impacts sur les milieux et les espèces indigènes, en particulier dans les îles où elles sont à l'origine de nombreuses extinctions.\n\nOn trouve des espèces exotiques envahissantes dans tous les groupes taxonomiques : champignons, algues, plantes vasculaires, invertébrés, reptiles, oiseaux, poissons, mammifères, etc. et dans tous les milieux : terrestres, marins ou d'eaux douces.	\N	\N	\N	f
22530	1022	IMAGE	species.6.image	\N	1211	Image manquante	\N	f
22531	1022	TEXT	interests.locations.1.name	L’isthme	\N	\N	\N	f
24801	1021	TEXT	events.5.date	2010	\N	\N	\N	f
24802	1021	TEXT	identity.marineArea	318 300	\N	\N	\N	f
21980	1004	TEXT	understand.text1	Une espèce exotique envahissante est une espèce introduite par l’Homme hors de son territoire d’origine et qui présente ensuite, sur son territoire d’introduction, une dispersion et un développement importants, engendrant des impacts environnementaux mais aussi sociaux et économiques. Ces introductions sont parfois volontaires (pour l’agriculture, l’ornementation, comme animaux de compagnie, etc.) ou involontaires (organismes présents dans les marchandises échangées internationalement, dans les eaux de ballast des bateaux, etc.).\n\nDe nombreuses espèces n’arrivent pas à s’adapter ou se reproduire dans leurs territoires d’introduction, cependant certaines trouvent au contraire des conditions favorables à leur développement et prolifèrent, profitant notamment de l’absence de leurs prédateurs ou parasites naturels. 	\N	\N	\N	f
21981	1004	TEXT	territories.title	Nombre d'espèces présentes sur la liste des 100 espèces exotiques les plus envahissantes au monde 	\N	\N	\N	f
21982	1004	TEXT	understand.title1	Des espèces introduites par l'Homme	\N	\N	\N	f
21983	1004	TEXT	understand.paragraphs.1.text	Des processus de biosécurité (désinfection, inspections minutieuses, utilisation de chiens formés à la détection, etc.) sont mis en œuvre par les territoires afin de limiter les risques d’entrée de nouvelles espèces exotiques. Pour les espèces déjà installées, de nombreuses interventions sont réalisées pour tenter de limiter leur propagation et atténuer leurs impacts, voire dans certains cas de les éradiquer pour préserver l'équilibre des écosystèmes. \n  \nLe Comité français de l'Union internationale pour la conservation de la nature conduit depuis 2005 une [initiative sur les espèces exotiques envahissantes en outre-mer](https://especes-envahissantes-outremer.fr/) afin de favoriser les échanges et le partage d'expériences entre les gestionnaires des différents territoires.	\N	\N	\N	f
21984	1004	TEXT	understand.title2	Une des principales causes d'érosion de la biodiversité dans les îles	\N	\N	\N	f
21985	1004	TEXT	presentation.descriptionTerritories	espèces sur les 100 considérées comme les plus envahissantes au monde sont présentes sur le territoire	\N	\N	\N	f
21986	1004	TEXT	understand.paragraphs.0.title	Une liste mondiale des espèces les plus problématiques	\N	\N	\N	f
21987	1004	TEXT	understand.keyword	Espèces	\N	\N	\N	f
21988	1004	TEXT	ecogestures.title	Que puis-je faire pour éviter l’introduction et la dispersion d’espèces exotiques envahissantes ? 	\N	\N	\N	f
21989	1004	IMAGE	presentation.image	\N	1261	Poisson-lion (*Pterois volitans*) © Fabien Lefebvre	\N	f
21990	1004	TEXT	understand.paragraphs.1.title	De la prévention aux actions de gestion	\N	\N	\N	f
21991	1004	TEXT	understand.paragraphs.0.text	En 2007, l’Union internationale pour la conservation de la nature a publié [une liste de 100 espèces exotiques considérées comme les plus envahissantes du monde](https://portals.iucn.org/library/sites/library/files/documents/2000-126-Fr.pdf), c’est-à-dire celles avec le plus fort potentiel de dispersion et le plus lourd impact sur leur environnement d’accueil. On y trouve notamment le rat noir ([*Rattus rattus*](https://inpn.mnhn.fr/espece/cd_nom/61587)), introduit dans de nombreuses îles et responsable, entre autres, du déclin des populations de nombreuses espèces d’oiseau dans les outre-mer, ou encore le Miconia ([*Miconia calvescens*](https://inpn.mnhn.fr/espece/cd_nom/447324)), un arbre introduit à Tahiti en 1937 et aujourd’hui très répandu sur l’île où il remplace la végétation indigène. Ce dernier a également été introduit en Nouvelle-Calédonie et découvert récemment en Martinique et en Guadeloupe.  \n\nLes fourmis introduites sont également un important sujet de préoccupations. Plusieurs espèces fortement envahissantes se retrouvent dans les territoires d’outre-mer, telles que la Fourmi folle ([*Anoplolepsis gracilipes*](https://inpn.mnhn.fr/espece/cd_nom/264513)), la Fourmi à grosse-tête ([*Pheidole megacephala*](https://inpn.mnhn.fr/espece/cd_nom/219383)) ou encore la Fourmi de feu ([*Solenopsis invicta*](https://inpn.mnhn.fr/espece/cd_nom/532922)). Elles perturbent de nombreuses autres espèces (arthropodes, reptiles, oiseaux, mammifères), par leurs comportements agressifs et leurs modifications des habitats.	\N	\N	\N	f
21992	1004	IMAGE	understand.image	\N	1027	Miconia calvescens © Forest & Kim Starr / CC BY 3.0 	\N	f
21993	1004	TEXT	presentation.description	espèces sur les 100 considérées comme les plus envahissantes au monde se trouvent en outre-mer	\N	\N	\N	f
21994	1004	TEXT	presentation.logoUrl	http://indicateurs-biodiversite.naturefrance.fr/fr/indicateurs/nombre-despeces-en-outremer-parmi-les-plus-envahissantes-au-monde	\N	\N	\N	f
24803	1021	TEXT	identity.presentation	« L’île intense » est située sur un point chaud de biodiversité et présente un fort taux d’endémisme. Les milieux naturels y sont relativement bien conservés par rapport aux autres îles des Mascareignes (Maurice et Rodrigues) en raison de son relief escarpé. De nombreuses espèces ont toutefois disparu depuis l’arrivée des humains au 16<sup>e</sup> siècle sur une île alors inhabitée. Forêts humides, ravines et rivières, cirques et remparts, volcan, récif corallien... La Réunion présente une diversité d’écosystèmes et une forte volonté de préservation.	\N	\N	\N	f
24804	1021	IMAGE	interests.locations.0.image	\N	1098	Sentier dans le Parc national de La Réunion © Philippe Gourdain	\N	f
22532	1022	TEXT	statistics.2.text	hectares de lagune et de marais au Grand Barachois	\N	\N	\N	f
22533	1022	IMAGE	species.0.image	\N	1227	Phoque veau-marin © Daniel Koelsch	\N	f
22534	1022	TEXT	events.1.date	17<sup>e</sup> siècle 	\N	\N	\N	f
22535	1022	TEXT	interests.locations.4.name	Saint-Pierre	\N	\N	\N	f
23456	1001	IMAGE	interests.locations.3.image	\N	1175	Image manquante	\N	f
23457	1001	TEXT	species.3.name	Le Dynaste scieur de long	\N	\N	\N	f
24805	1021	TEXT	species.6.name	Le Latanier rouge	\N	\N	\N	f
23458	1001	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
24806	1021	TEXT	identity.population	853 659	\N	\N	\N	f
24807	1021	IMAGE	interests.locations.3.image	\N	1158	Tronc d’un arbre « bois de pomme » (*Syzygium borbonicum*), forêt de Mare Longue © Philippe Gourdain	\N	f
24808	1021	TEXT	species.3.name	Le Petit Molosse de La Réunion	\N	\N	\N	f
24809	1021	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
24810	1021	IMAGE	species.8.image	\N	1194	Image manquante	\N	f
24811	1021	TEXT	species.0.name	Le Gecko vert de Manapany	\N	\N	\N	f
24812	1021	TEXT	events.4.date	2007	\N	\N	\N	f
21466	1009	TEXT	understand.paragraphs.0.text	Au niveau floristique, les plantes à fleurs présentent le plus grand nombre d’espèces : on en compte 12 306 dans tout l'outre-mer. Mais ce ne sont pas les seules espèces végétales : on compte également plusieurs centaines d’espèces de mousse, de lichens ou encore d’algues.  \n\nDu côté de la faune, c’est chez les invertébrés que se trouve la plus grande diversité : on compte plus de 12 000 espèces de Coléoptères et plus de 8 000 espèces de papillons ! Les mollusques sont également un groupe très diversifié, représentés aussi bien en milieu marin qu’en milieu terrestre et en eaux douces.\nChez les vertébrés, on dénombre 5 046 espèces de poissons, 1 435 espèces d'oiseaux, 381 espèces de reptiles, 321 espèces de mammifères et 138 espèces pour les amphibiens.  \n\nCes chiffres sont en perpétuelle évolution à mesure de la progression des connaissances scientifiques, de [nouvelles espèces](https://preprod.biodiversite-outre-mer.fr/indicateurs/nouvelles-especes) sont découvertes chaque année. Une importante disparité est observée entre le nombre d'espèces terrestres et d'espèces marines répertoriées : près de 80 % des espèces inventoriées sont terrestres ou d'eau douce. Si cela traduit en partie une réalité biologique, cela illustre également la difficulté d'acquérir des connaissances sur les espèces marines. 	\N	\N	\N	f
21467	1009	IMAGE	understand.image	\N	1040	Iguane des petites Antilles © Fabien Lefebvre	\N	f
21468	1009	TEXT	presentation.description	espèces sont indigènes dans les outre-mer	\N	\N	\N	f
21469	1009	TEXT	presentation.logoUrl	https://inpn.mnhn.fr/espece/indicateur	\N	\N	\N	f
23459	1001	IMAGE	species.8.image	\N	1174	Image manquante	\N	f
23460	1001	TEXT	species.0.name	La Frégate superbe	\N	\N	\N	f
23461	1001	TEXT	events.4.date	1976	\N	\N	\N	f
20062	1006	IMAGE	presentation.file	\N	1018	Affiche	\N	f
20063	1006	IMAGE	action.cards.2.icon	\N	1022	Plongée	\N	f
20064	1006	TEXT	presentation.name	Je protège les récifs coralliens	\N	\N	\N	f
20065	1006	IMAGE	action.cards.0.icon	\N	1020	Bateau	\N	f
20066	1006	IMAGE	presentation.image	\N	1019	Eco-plongeur dans les récifs de Nouvelle-Calédonie © Jean-Pascal Quod / Reefcheck	\N	f
20067	1006	TEXT	understand.text	Les récifs coralliens sont un écosystème très riche : ils abritent plus d’un tiers des espèces marines connues pour lesquelles ils représentent notamment une zone de nourricerie pour les juvéniles (poissons, crustacés, etc.). Ils forment également une barrière naturelle contre la houle, protégeant la côte lors des tempêtes.\n\nIls sont particulièrement fragiles, et [de nombreux facteurs les menacent](https://preprod.biodiversite-outre-mer.fr/indicateurs/recifs-coralliens) : le changement climatique, qui entrainent entre autres une augmentation de la température et une acidification des océans, les pollutions, des maladies virales ou bactériennes ou encore la destruction directe pour construire des infrastructures humaines. Par exemple, à Mayotte, le prolongement de la piste d'atterrissage de l'aéroport nécessiterait la destruction d'une importante zone de récifs.\n\nAu-delà de ces pressions globales, les activités de loisirs en mer pèsent également sur la santé des récifs. L’ancrage sauvage peut détériorer les récifs et les herbiers sous-marins. La toxicité pour l’environnement marin des composants de crèmes solaires, qui se dissolvent dans l’eau lors de la baignade, est de plus en plus étudiée et documentée. En plongée, un choc sur les coraux, ou même le simple fait de les toucher leur est néfaste, et cela peut contribuer à la propagation de maladies du corail. Les prélèvements, même de coraux déjà morts, sont préjudiciables pour l’environnement marin et sont rigoureusement interdits dans tous les territoires. 	\N	\N	\N	f
20068	1006	IMAGE	action.cards.1.icon	\N	1021	Crème solaire	\N	f
20069	1006	TEXT	action.cards.2.description	En plongée ou en snorkeling, je fais attention à ne pas toucher les coraux et je ne prélève rien. 	\N	\N	\N	f
20070	1006	TEXT	presentation.category	En mer	\N	\N	\N	f
20071	1006	TEXT	action.cards.1.description	Je choisis une crème solaire moins nocive pour l’environnement	\N	\N	\N	f
20072	1006	TEXT	presentation.description	Les récifs coralliens sont soumis à de multiples pressions, et les activités de loisirs en mer (plaisance, plongée, pêche, baignade…) peuvent participer à leur dégradation.  Prenons soin de ces écosystèmes particulièrement riches, mais fragiles. 	\N	\N	\N	f
20073	1006	TEXT	action.title	Pour profiter de la mer sans impacter les récifs	\N	\N	\N	f
20074	1006	TEXT	understand.quote	La grande barrière de corail de Nouvelle-Calédonie est la deuxième plus grande au monde, après celle se trouvant sur la côte est de l'Australie.	\N	\N	\N	f
20075	1006	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
20076	1006	TEXT	action.cards.0.description	En bateau, je jette l'ancre sur des zones sableuses, et non pas à proximité de récifs ou d'herbiers. 	\N	\N	\N	f
23462	1001	IMAGE	interests.locations.2.image	\N	1165	Les îles de Petite Terre et Désirade © Olivier Delzons	\N	f
23463	1001	IMAGE	ecosystems.ecosystems.2.image	\N	1012	La cascade aux écrevisses dans la forêt humide de Guadeloupe © Daniel Öberg/Unsplash	\N	f
23464	1001	TEXT	interests.locations.3.name	La Réserve naturelle nationale de la Désirade	\N	\N	\N	f
23465	1001	TEXT	events.10.description	2e plan national d'actions en faveur des tortues marines des Antilles françaises	\N	\N	\N	f
23466	1001	TEXT	interests.locations.0.description	Créé en 1989 et premier parc national d’outre-mer, son aire d’adhésion s’étend sur 16 communes du territoire et son cœur de parc sur 21 850 ha dont 3 300 ha marins. Tout l’enjeu du [Parc national de Guadeloupe](http://www.guadeloupe-parcnational.fr/fr) est de conjuguer les activités humaines avec la préservation du patrimoine naturel de grande valeur de la Guadeloupe.	\N	\N	\N	f
23467	1001	TEXT	interests.locations.2.description	Composée de deux îles séparées par un chenal de 150 m de large, ce site présente l’une des plus importantes populations d’Iguane des Petites Antilles (*Iguana delicatissima*). C’est un refuge pour de nombreuses espèces d’oiseaux, un lieu de ponte pour les tortues marines, et on y trouve également le dernier peuplement de Gaïac (*Guaiacum officinale*), un petit arbre au bois très dense.	\N	\N	\N	f
24813	1021	IMAGE	interests.locations.2.image	\N	1157	Vue sur le Piton de la Fournaise © Philippe Gourdain	\N	f
24814	1021	IMAGE	ecosystems.ecosystems.2.image	\N	1195	Image manquante	\N	f
23468	1001	TEXT	interests.locations.1.description	Entre Basse-Terre et Grande-Terre, cette baie est un véritable réservoir de biodiversité. Côté mer, des herbiers de phanérogames sont entourés par le récif corallien le plus long des Petites Antilles (39 km). Côté terre, la baie est bordée par des mangroves, des forêts marécageuses et marais herbacés sur plus de 5 000 ha. 	\N	\N	\N	f
24815	1021	TEXT	interests.locations.3.name	La forêt de Mare-Longue	\N	\N	\N	f
24816	1021	TEXT	interests.locations.0.description	Créé en 2007, [le Parc national](http://www.reunion-parcnational.fr/fr) englobe la partie centrale des deux massifs volcaniques de l'île : celui du Piton des Neiges, le plus ancien avec les trois cirques, et celui du Piton de la Fournaise. La zone cœur de parc couvre 42 % de la superficie de l’île.	\N	\N	\N	f
24817	1021	TEXT	interests.locations.2.description	Le tiers sud-est de l’île est occupé par le Piton de la Fournaise, l’un des volcans les plus actifs du monde. De type effusif, ses coulées de laves refroidies sont progressivement recolonisées par la végétation, lichens et fougères tout d'abord, puis plantes vasculaires.	\N	\N	\N	f
24818	1021	TEXT	interests.locations.1.description	Inscrits au patrimoine mondial de l’UNESCO en 2010, les trois cirques entourent le sommet de l’île : le Piton des Neiges. Chacun possède une identité particulière. Mafate n’est desservi par aucune route, Salazie est plus exposé aux précipitations tandis que Cilaos est plus sec.	\N	\N	\N	f
24819	1021	TEXT	ecosystems.ecosystems.3.name	Les fourrés à Pandanus 	\N	\N	\N	f
24820	1021	TEXT	statistics.1.text	Création du Parc national de La Réunion	\N	\N	\N	f
24821	1021	TEXT	identity.subtitle	Deux volcans et un relief escarpé	\N	\N	\N	f
24822	1021	IMAGE	species.4.image	\N	1190	Image manquante	\N	f
24823	1021	IMAGE	species.7.image	\N	1193	Image manquante	\N	f
24824	1021	TEXT	species.5.name	Les Fanjan	\N	\N	\N	f
24825	1021	TEXT	risks.risks.0.description	Située au sein de l'un des 34 hauts lieux de la biodiversité mondiale (*"hotspot"*), l'environnement de l'île de la Réunion est exceptionnel. \nLa principale menace pour la biodiversité de l'île est la pression démographique, l’augmentation de la population entrainant le développement d’infrastructures et aménagements. La quasi-totalité des forêts de basse-altitude a déjà disparu et le littoral est particulièrement menacé par l’urbanisation, la pollution et la surfréquentation. La fréquence de ponte de tortues marines sur les plages de La Réunion est très faible et ces espèces sont également menacées par la pêche accidentelle et le braconnage. Hormis dans la [Réserve naturelle marine](http://www.reservemarinereunion.fr/), il n’existe aucun dispositif de protection ou de gestion des ressources dans la zone économique exclusive.  \n\nLes espèces exotiques envahissantes sont également une menace majeure. De nombreuses espèces végétales envahissent les milieux naturels, et les monocultures de Cryptomeria du Japon (*Cryptomeria japonica*) offrent des milieux favorables à l’envahissement par d’autres plantes exotiques. La lutte contre les rats et les chats harets est également un enjeu majeur de la conservation des oiseaux endémiques. Une [stratégie de lutte contre les espèces invasives](https://www.especesinvasives.re/strategie-de-lutte/la-strategie-reunionnaise/) est mise en place depuis 2010. Depuis le 1<sup>e</sup> avril 2019, un arrêté ministériel interdit tout usage d’une [liste de 150 plantes exotiques](http://www.reunion.developpement-durable.gouv.fr/IMG/pdf/0_defi_eee-outre-mer-la_reunion-web-br.pdf).  \n\nLa création du Parc national en 2007 et l'inscription au Patrimoine mondial de l'UNESCO en 2010 ont permis de renforcer la protection du patrimoine naturel de La Réunion. La mise en place d'une [Stratégie réunionnaise pour la biodiversité](http://www.reunion.developpement-durable.gouv.fr/IMG/pdf/SRB-2013-2020_cle093a71.pdf) depuis 2013 doit permettre d'intégrer la protection de la biodiversité dans les politiques publiques du territoire. De nombreux programmes de conservations ont été mis en place pour protéger les espèces patrimoniales (Plans nationaux d'actions, programmes LIFE+, etc.). \n	\N	\N	\N	f
24826	1021	TEXT	events.3.date	1976	\N	\N	\N	f
24827	1021	TEXT	ecosystems.ecosystems.2.description	Malgré leur faible étendue (12 km<sup>2</sup>, entre le Cap La Houssaye et Grand Bois), les récifs coralliens de La Réunion sont très riches et diversifiés. On y compte au moins 226 espèces de coraux, ainsi que plusieurs centaines d’espèces d’échinodermes, mollusques, crustacés et poissons, dont de nombreuses espèces endémiques. La plus grande partie de ces récifs sont protégés sous le statut de la [Réserve naturelle marine](http://www.reservemarinereunion.fr/).	\N	\N	\N	f
24828	1021	IMAGE	ecosystems.ecosystems.3.image	\N	1196	Image manquante	\N	f
24829	1021	IMAGE	species.3.image	\N	1161	*Mormopterus francoismoutoui* © Philippe Gourdain	\N	f
24830	1021	TEXT	species.1.name	L'Échenilleur de La Réunion	\N	\N	\N	f
24831	1021	TEXT	species.7.name	Le Tamarin des Hauts	\N	\N	\N	f
24832	1021	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
24833	1021	TEXT	ecosystems.ecosystems.1.description	Située sur la côte ouest de l’île, la forêt sèche a perdu 99% de sa superficie de puis l’arrivée des humains et ce milieu est considérée comme « en danger critique d’extinction ». Un [projet LIFE+](https://www.foretseche.re/) lancé en 2015 a permis de replanter de nombreux arbres indigènes pour tenter de le conserver.	\N	\N	\N	f
24834	1021	TEXT	interests.locations.5.description	Créée en 2007, cette aire marine protégée couvre 3 500 hectares sur un linéaire de 40 km sur la côte ouest de l’île. Les activités nautiques, dont la pêche, y sont règlementées et dans les zones dites « sanctuaires », toute présence humaine est interdite quel qu’en soit le motif. 	\N	\N	\N	f
24835	1021	TEXT	ecosystems.ecosystems.0.description	Il existe plusieurs types de forêts et de cortèges floristiques répartis en fonction de l’altitude et de la pluviométrie. Elles se situent particulièrement dans l’est et le sud de l’île, moins urbanisés. On y trouve une grande diversité végétale : mousses, fougères, orchidées, arbres et arbustes, etc.	\N	\N	\N	f
24836	1021	TEXT	identity.highestPoint	3 071	\N	\N	\N	f
24837	1021	TEXT	interests.locations.4.description	Réserve naturelle nationale, cette zone humide de 447 hectares est également inscrite à la convention internationale Ramsar. Le site présente une valeur faunistique forte, avec de nombreuses espèces patrimoniales (oiseaux, poissons, macro-crustacés, insectes) malgré la présence d’espèces introduites.	\N	\N	\N	f
24838	1021	TEXT	risks.risks.0.name	Une pression démographique importante	\N	\N	\N	f
24839	1021	IMAGE	interests.locations.1.image	\N	1156	Vue sur le cirque de Mafate © Céline Soyer	\N	f
24840	1021	IMAGE	ecosystems.ecosystems.1.image	\N	1100	© Philippe Gourdain	\N	f
23469	1001	TEXT	ecosystems.ecosystems.3.name	Les mangroves	\N	\N	\N	f
23470	1001	TEXT	statistics.1.text	du territoire couvert par la forêt	\N	\N	\N	f
24841	1021	TEXT	interests.locations.3.description	Vestige de forêt humide primaire de basse altitude du sud sauvage, cette forêt a poussé sur une ancienne coulée de lave. Aujourd’hui réduite à une centaine d’hectares, elle abrite une richesse remarquable en espèces végétales, dont de nombreuses espèces endémiques. Si elle est encore dans un bon état de conservation, la disparition de la faune qui disséminait les graines (oiseaux, tortues géantes, chauves-souris) empêche sa régénération naturelle. 	\N	\N	\N	f
24842	1021	TEXT	identity.title	La Réunion,  \npoint chaud de l’océan Indien	\N	\N	\N	f
24843	1021	TEXT	species.4.name	Le Pétrel de Barau	\N	\N	\N	f
24844	1021	TEXT	identity.area	2 512	\N	\N	\N	f
24845	1021	TEXT	species.0.description	Le Gecko vert de Manapany ([*Phelsuma inexpectata*](https://inpn.mnhn.fr/espece/cd_nom/528679\n)), est endémique de La Réunion et n'est présent que sur une bande de 11 km de long dans le sud de l’île. Ce gecko diurne arboricole s’observe notamment sur les vacoas ([*Pandanus utilis*](https://inpn.mnhn.fr/espece/cd_nom/639093\n)). Considéré en danger critique d’extinction, il est protégé et fait l’objet d’un [Plan national d’action](https://natureoceanindien.org/pna/).\n\nStatut dans la Liste rouge des reptiles de La Réunion : en danger critique. 	\N	\N	\N	f
24846	1021	IMAGE	interests.locations.5.image	\N	1189	Image manquante	\N	f
24847	1021	IMAGE	species.6.image	\N	1192	Image manquante	\N	f
24848	1021	TEXT	identity.highestPointName	Piton des Neiges	\N	\N	\N	f
24849	1021	TEXT	interests.locations.1.name	Les cirques de Mafate, Cilaos et Salazie	\N	\N	\N	f
24850	1021	TEXT	statistics.2.text	de plantes vasculaires indigènes	\N	\N	\N	f
24851	1021	IMAGE	species.0.image	\N	1097	*Phelsuma inexpectata* © Philippe Gourdain	\N	f
24852	1021	TEXT	events.1.date	-22 000 ans	\N	\N	\N	f
24853	1021	TEXT	ecosystems.ecosystems.2.name	Les récifs coralliens	\N	\N	\N	f
24854	1021	TEXT	interests.locations.4.name	[L’étang de Saint-Paul](https://reserve-etangsaintpaul.fr/fr/accueil)	\N	\N	\N	f
23471	1001	TEXT	events.9.date	2019	\N	\N	\N	f
23472	1001	TEXT	identity.subtitle	Un archipel riche et diversifié	\N	\N	\N	f
23473	1001	IMAGE	species.4.image	\N	1170	Image manquante	\N	f
23474	1001	IMAGE	species.7.image	\N	1173	Image manquante	\N	f
23475	1001	TEXT	species.5.name	Le Palmier ti-koko	\N	\N	\N	f
1799	1002	TEXT	description	Les Antilles sont un « point chaud » de la biodiversité mondiale. Si chacun des quatre territoires français du bassin a son identité et ses spécificités, les acteurs locaux collaborent autour de problématiques partagées. 	\N	\N	\N	f
21608	1029	IMAGE	presentation.file	\N	1147	test	\N	f
21609	1029	TEXT	presentation.name	Je m'investis sur le terrain	\N	\N	\N	f
21610	1029	IMAGE	action.cards.0.icon	\N	1150	jumelles	\N	f
21611	1029	IMAGE	presentation.image	\N	1148	© Raphael Gailhac	\N	f
21612	1029	TEXT	understand.text	On estime que seule 30% des espèces de faune et de flore présentes en outre-mer sont bien répertoriées. Les études pour suivre les espèces nécessitent beaucoup de temps d'observation, c’est pourquoi en multipliant les observateurs, on peut accumuler un plus grand nombre de données. De nombreux programmes de sciences participatives sont ainsi mis en place afin de permettre à chacun d'apporter sa pierre à l'édifice de la connaissance en faisant remonter ses observations. Certains programmes ont développé des applications mobiles accessibles directement depuis un smartphone. \n\nDans le cadre du Compteur de biodiversité outre-mer, une étude est actuellement en cours pour recenser tous ces programmes. Lorsque cet état des lieux sera terminé, le Compteur présentera un annuaire vous permettant de sélectionner les programmes qui vous correspondent en fonction de votre territoire et vos centres d'intérêt.\n\nDe nombreuses structures locales et associations font régulièrement appel à des bénévoles, par exemple pour participer à des opérations de restauration des milieux : arrachages de plantes exotiques envahissantes, plantations d'espèces indigènes, ramassages de déchets,... Des sorties découvertes sont également régulièrement organisées par les acteurs locaux afin d'en savoir plus sur les écosystèmes et leurs habitants, tout en les respectant.\n\n	\N	\N	\N	f
20682	1008	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
20683	1008	TEXT	understand.text2	On trouve un nombre plus important d’espèces endémiques dans les îles par rapport aux continents en raison de leur isolement géographique : les espèces y ont évolué séparément par rapport à celles sur le continent. Ainsi, plus une île est ancienne, plus il est probable que son taux d’endémisme soit élevé, comme par exemple en Nouvelle-Calédonie où 30 % des espèces du territoire sont uniques au monde.\nL’endémisme est également beaucoup plus important chez les espèces terrestres que chez les espèces marines, le milieu marin étant plus ouvert et permettant une connexion plus importante des habitats.	\N	\N	\N	f
21613	1029	IMAGE	action.cards.1.icon	\N	1149	réseau	\N	f
21614	1029	TEXT	presentation.category	Connaissance	\N	\N	\N	f
21615	1029	TEXT	action.cards.1.description	Je m’informe auprès des structures locales pour participer à des évènements sur mon territoire.	\N	\N	\N	f
21616	1029	TEXT	presentation.description	Participer à des actions concrètes pour faire progresser la connaissance et la préservation de la biodiversité, c’est possible !	\N	\N	\N	f
21617	1029	TEXT	action.title	Pour contribuer activement à la connaissance et la préservation de la biodiversité :	\N	\N	\N	f
21618	1029	TEXT	understand.quote	À ce jour il existe plus d'une centaine de programmes de sciences participatifs actifs réparti sur les territoires d'outre-mer.	\N	\N	\N	f
21619	1029	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
21620	1029	TEXT	action.cards.0.description	Je rejoins les réseaux de sciences participatives afin de faire remonter mes observations (annuaire prochainement disponible).	\N	\N	\N	f
23476	1001	TEXT	risks.risks.0.description	Grâce à la création du Parc national en 1989, la Guadeloupe a permis de développer un statut de protection pour les écosystèmes et les espèces relativement tôt. Cependant, malgré les règlementations de protection, les obligations ne sont pas toujours respectées et les contrôles ne sont pas suffisamment appliqués. Les formations forestières, en particulier sur le littoral, régressent constamment à cause de l’augmentation des aménagements et infrastructures, et beaucoup de défrichements et de remblais sont pratiqués dans l’illégalité.  \n\nDe nombreuses espèces introduites représentent une menace importante pour la biodiversité comme la Petite mangouste indienne (*Urva auropunctata*), l’Iguane commun (*Iguana iguana*), la Fourmi manioc (*Acromyrmex octospinosus*), l’Escargot géant africain (*Lissachatina fulica*), ou encore le Tulipier du Gabon (*Spathodea campanulata*).\n\nComme en Martinique, la chlordécone, pesticide utilisé dans les bananeraies entre les années 1970 et 1990 a massivement pollué les milieux naturels de l’île. Si ces impacts sur la santé humaine commencent à être connus, peu de données sont disponibles sur ses conséquences sur les espèces, cependant des études ont montré une importante contamination des organismes marins côtiers, ce qui a conduit à interdire la pêche dans certaines zones.\n\nLe projet de réintroduction du Lamantin des Caraïbes (*Trichechus manatus*) porté depuis 2014 par le Parc national de Guadeloupe dans le cadre du LIFE SIRENIA, a été interrompu en 2018. 	\N	\N	\N	f
23477	1001	TEXT	events.3.date	19<sup>e</sup> siècle	\N	\N	\N	f
23478	1001	TEXT	ecosystems.ecosystems.2.description	Entre 300 et 1000 m d’altitude, la forêt est luxuriante : fougères, arbustes, herbacées, lianes et autres épiphytes, sous le couvert de très grands arbres tels que le Gommier (*Dacryodes excelsa*) ou l’Acomat boucan (*Sloanea caribaea*) qui étendent leurs branchages jusqu’à plus de 30 m de haut. 	\N	\N	\N	f
23479	1001	IMAGE	ecosystems.ecosystems.3.image	\N	1168	Mangrove de Guadeloupe © Gaëlle Vandersarren	\N	f
23480	1001	IMAGE	species.3.image	\N	1169	Image manquante	\N	f
23481	1001	TEXT	species.1.name	Les Ouassous	\N	\N	\N	f
23482	1001	TEXT	species.7.name	Les Orchidées	\N	\N	\N	f
23483	1001	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
23484	1001	TEXT	ecosystems.ecosystems.1.description	Des plages sableuses emblématiques de « l’imaginaire » des îles tropicales aux plages rocheuses battues par la houle et aux falaises, le littoral guadeloupéen héberge une faune et une flore variée : patates bord-de-mer, amarante bord-de-mer, poirier-pays, fleurit-noël bord-de-mer, reptiles, oiseaux marins et limicoles… Cependant, la pression des activités humaines est forte sur les littoraux et peu de ces milieux sont encore vierges d'installations humaines. Cette artificialisation peut faire obstacle à la remontée des tortues marines lorsqu'elles viennent pondre sur les plages. 	\N	\N	\N	f
23485	1001	TEXT	ecosystems.ecosystems.0.description	A partir de 1 000 m d’altitude, soumise aux vents violents, à l’excès d’humidité et à la persistance des nuages, la végétation basse n’excède pas 1,50 m de haut. Cette « forêt de montagne » composée d’Ananas montagnes rouges (*Pitcairnia bifrons*) ou jaunes (*Guzmania plumieri*), de Thym-montagne (*Tibouchina ornata*), de palétuvier montagne (*Clusia mangle*) et de laurier rose (*Podocarpus coriaceus*) laisse place sur les très hauts sommets aux mousses et aux lichens. 	\N	\N	\N	f
23486	1001	TEXT	identity.highestPoint	1 467	\N	\N	\N	f
23487	1001	TEXT	risks.risks.0.name	Le premier Parc national dans les outre-mer	\N	\N	\N	f
23488	1001	IMAGE	interests.locations.1.image	\N	1007	Le lagon du Grand Cul-de-Sac Marin © Guilhem Pouxviel  / CC BY-SA 4.0 	\N	f
23489	1001	IMAGE	ecosystems.ecosystems.1.image	\N	1011	Plage à Deshaies © Stephane Wegner /Unsplash 	\N	f
19351	1020	TEXT	species.0.description	[*Sphaeropteris intermedia*](https://www.endemia.nc/flore/fiche106) est une espèce de fougère arborescente endémique parmi les plus grandes au monde, qui peut atteindre 35 mètres de haut. Commune sur le territoire, cette plante est utilisée en médecine traditionnelle et son tronc très solide est également utilisé pour la sculpture ou la confection de sagaies.\n\nStatut dans la Liste rouge mondiale : Préoccupation mineure.  \nNom en langues kanak : Groubaï (drubéa)\n	\N	\N	\N	f
19352	1020	TEXT	identity.highestPointName	Mont Panié	\N	\N	\N	f
19353	1020	TEXT	ecosystems.ecosystems.2.name	Les maquis miniers	\N	\N	\N	f
19354	1020	TEXT	species.7.description	Ce petit oiseau marin présente un dos gris, un ventre blanc, une tête pourvue d'une calotte noire et un bec droit et pointu. Une sous-espèce de la Sterne néreis, ([*Sternula nereis exul*](https://www.endemia.nc/faune/fiche52)) niche sur les îlots de Nouvelle-Calédonie, notamment autour des îlots du Lagon Sud, des îlots de Koumac et aux îles Chesterfield. Ses faibles effectifs de populations en font une sous-espèce très menacée.  \n  \nStatut dans la Liste rouge mondiale : non évalué. 	\N	\N	\N	f
23490	1001	TEXT	interests.locations.3.description	Créée en 2011 pour préserver le patrimoine géologique exceptionnel de l’île, où l’on observe les très rares traces des prémices de la formation de la plaque tectonique des Caraïbes, l’île abrite également une végétation particulière avec plusieurs espèces rares dont le Cactus tête à l’Anglais (*Melocactus intortus*), ainsi que de nombreuses espèces d’oiseaux marins. 	\N	\N	\N	f
23491	1001	TEXT	identity.title	La Guadeloupe,  \n« l’île aux belles eaux »	\N	\N	\N	f
23492	1001	TEXT	species.4.name	Les Anolis	\N	\N	\N	f
23493	1001	TEXT	identity.area	1 628	\N	\N	\N	f
23494	1001	TEXT	species.0.description	La Frégate superbe ([*Fregata magnificens*](https://inpn.mnhn.fr/espece/cd_nom/2468\n)) est un oiseau marin de grande taille reconnaissable à sa queue fourchue et ses ailes longues et effilées. Le mâle est noir et remarquable par la présence d’une poche rouge sous la gorge qu’il gonfle pendant les parades nuptiales. La femelle et les juvéniles sont tachés de blanc sur le dos et la poitrine. L’espèce n’est cependant plus nicheuse en Guadeloupe.\n\nStatut dans la Liste rouge des oiseaux de Guadeloupe : préoccupation mineure. 	\N	\N	\N	f
23495	1001	IMAGE	species.6.image	\N	1172	Image manquante	\N	f
23496	1001	TEXT	identity.highestPointName	La Soufrière	\N	\N	\N	f
23497	1001	TEXT	interests.locations.1.name	La baie de Grand Cul-de-Sac marin	\N	\N	\N	f
23498	1001	TEXT	statistics.2.text	Création du premier parc national d’outre-mer	\N	\N	\N	f
23499	1001	IMAGE	species.0.image	\N	1008	*Fregata magnificens* © macraegi /  CC BY-SA 2.0	\N	f
23500	1001	TEXT	events.1.date	1635	\N	\N	\N	f
19355	1020	TEXT	species.8.description	Le Niaouli ([*Melaleuca quinquenervia*](https://www.endemia.nc/flore/fiche445)), est un arbre utilisé en médecine et pour la construction, que l’on retrouve dans les milieux ouverts et anthropisés. Il se développe particulièrement bien dans les zones touchées par les incendies en raison de ses propriétés ignifuges. Indigène en Nouvelle-Calédonie, cette espèce a été introduite dans d’autres territoires comme la Guyane où elle présente un profil envahissant.\n\nStatut dans la Liste rouge mondiale : préoccupation mineure.  \nNoms en langues kanak : itachou (paicî), pichöö (xârâcùù), bé (drubéa)	\N	\N	\N	f
19356	1020	IMAGE	species.2.image	\N	1240	*Dugong dugong* © Hélène Udo	\N	f
19357	1020	TEXT	species.11.name	La Baleine à bosses	\N	\N	\N	f
19358	1020	IMAGE	ecosystems.ecosystems.4.image	\N	1206	Image manquante	\N	f
19359	1020	TEXT	species.3.description	Les Tricots rayés ([*Laticauda sp.*](https://www.endemia.nc/faune/fiche1104)) regroupent plusieurs espèces de serpents marins. Ils se nourrissent dans l’eau mais reviennent sur terre pour se reposer, digérer et pondre. Bien que porteurs d'un venin mortel, ils ne sont pas agressifs et au contraire plutôt craintifs, les morsures sont donc très rares.\n\nStatut dans la Liste rouge mondiale pour les 3 espèces présentes en Nouvelle-Calédonie : préoccupation mineure. 	\N	\N	\N	f
19360	1020	TEXT	species.1.description	Emblème de la Nouvelle-Calédonie, le Cagou ([*Rhynochetos jubatus*](https://www.endemia.nc/faune/fiche144)), est un oiseau endémique qui ne vole pas mais court très vite, et dont le cri ressemble à l’aboiement d’un chien. Il vit dans les forêts humides de moyenne et haute altitude. Cette espèce est intégralement protégée.\n\nStatut dans la Liste rouge mondiale : en danger.	\N	\N	\N	f
19361	1020	TEXT	species.2.description	Le Dugong ([*Dugong dugong*](https://www.endemia.nc/faune/fiche5263)), aussi appelé « vache marine » est un mammifère marin herbivore qui passe la majeure partie de son temps à brouter les herbiers marins. Longtemps chassé et braconné, il est également vulnérable face à la dégradation des habitats marins et aux activités humaines. La population néo-calédonienne de dugongs est estimée à environ 700 individus. Depuis 2010, [un plan d'action pour la conservation du Dugong](https://www.cen.nc/plan-actions-dugong) a été mis en place, animé depuis 2017 par le Conservatoire d'espaces naturels de Nouvelle-Calédonie. \n\nStatut dans la Liste rouge mondiale : vulnérable. 	\N	\N	\N	f
19362	1020	TEXT	species.9.description	[*Syzygium acre*](https://www.endemia.nc/flore/fiche1027) est un arbre principalement observé dans le sud de la Grande Terre. Ses feuilles de très grande taille – parfois plus d’un mètre de long – sont rouge à mauve lorsqu’elles sont juvéniles. Sa floraison est caractéristique : les fleurs, d’une coloration rouge à rose, se trouvent par petits groupes le long du tronc.\n\nStatut dans la Liste rouge mondiale : en danger. 	\N	\N	\N	f
19363	1020	TEXT	statistics.1.number	2e	\N	\N	\N	f
19364	1020	TEXT	species.12.name	Les Tortues 	\N	\N	\N	f
19365	1020	TEXT	statistics.0.number	76%	\N	\N	\N	f
19366	1020	IMAGE	interests.locations.4.image	\N	1224	Image manquante	\N	f
19367	1020	TEXT	species.2.name	Le Dugong	\N	\N	\N	f
19368	1020	TEXT	risks.risks.1.name	Une règlementation environnementale plurielle	\N	\N	\N	f
19369	1020	TEXT	species.4.description	Arbuste des forêts humides,[*Amborella trichopoda*](https://www.endemia.nc/flore/fiche254) est considéré comme la plus ancienne des plantes à fleurs, d'où son surnom de « mère de toutes les fleurs ». Cette plante présente le même aspect qu’à son origine, évaluée à 135 millions d’années avant notre ère. Elle est endémique de Nouvelle-Calédonie.\n\nStatut dans la Liste rouge mondiale : Préoccupation mineure. 	\N	\N	\N	f
19370	1020	TEXT	ecosystems.ecosystems.0.name	Les forêts denses humides	\N	\N	\N	f
19371	1020	TEXT	species.5.description	Les Kaoris, sont des arbres de grande taille, dont le tronc peut atteindre un diamètre impressionnant. La répartition du Kaori du mont Panié ([*Agathis montana*](https://www.endemia.nc/flore/fiche55)) est restreinte à la forêt de nuage du massif du même nom tandis que le Kaori de forêt ([*Agathis lanceolata*](https://www.endemia.nc/flore/fiche57)) se trouve au sud de la Grande Terre. Ce dernier, dont peut observer un spécimen au tronc de 2,70 m de diamètre dans le parc de la Rivière Bleu, a beaucoup souffert de l’exploitation de son bois.\n\nStatut dans la Liste rouge mondiale pour *Agathis montana* : en danger critique ; pour *Agathis lanceolata* : vulnérable.  \nNoms en langues kanak : Kaori du Mt Panié : Dayu Biik (nemi) ; Kaori de forêt : mugé (xârâcùù)	\N	\N	\N	f
19372	1020	TEXT	species.6.description	Le Gecko géant de Nouvelle-Calédonie ([*Rhacodactylus leachianus*](https://www.endemia.nc/faune/fiche1024)) est le plus grand gecko au monde. D’un aspect massif, avec une queue courte et une peau plissée grise à brune, il peut atteindre 25,5 cm de long. Nocturne et arboricole, on le trouve dans les forêts humides.\n\nStatut dans la Liste rouge mondiale : préoccupation mineure. 	\N	\N	\N	f
19373	1020	TEXT	events.0.date	Entre -100 et -55 millions d’années	\N	\N	\N	f
19374	1020	TEXT	identity.populationYear	2017	\N	\N	\N	f
19375	1020	IMAGE	species.5.image	\N	1199	Image manquante	\N	f
19376	1020	TEXT	statistics.0.text	de la flore est endémique	\N	\N	\N	f
19377	1020	TEXT	ecosystems.ecosystems.1.name	Les récifs coralliens et les lagons	\N	\N	\N	f
23501	1001	TEXT	ecosystems.ecosystems.2.name	La forêt humide	\N	\N	\N	f
19378	1020	TEXT	events.2.date	1940 	\N	\N	\N	f
19379	1020	TEXT	identity.presentation	La Nouvelle-Calédonie se caractérise par le taux d'endémisme particulièrement élevé de sa flore (76 % d'espèces endémiques) et de sa faune terrestre, ainsi que l'existence d'écosystèmes terrestres remarquables : forêt humide, maquis minier, zones humides... La biodiversité marine est également d'une richesse exceptionnelle, l'archipel abritant notamment la seconde plus grande barrière récifale au monde. Cette richesse est reconnue au niveau international par l'inscription des lagons de Nouvelle-Calédonie au Patrimoine mondial de l'UNESCO. 	\N	\N	\N	f
19380	1020	TEXT	identity.population	271 407	\N	\N	\N	f
19381	1020	TEXT	species.3.name	Les Tricots rayés	\N	\N	\N	f
19382	1020	IMAGE	species.8.image	\N	1202	Image manquante	\N	f
19383	1020	TEXT	species.0.name	*Sphaeropteris intermedia*	\N	\N	\N	f
19384	1020	TEXT	events.4.date	2008-2009	\N	\N	\N	f
19385	1020	IMAGE	interests.locations.2.image	\N	1238	Chutes de la Madeleine, Nouvelle-Calédonie © Hélène Udo	\N	f
19386	1020	IMAGE	ecosystems.ecosystems.2.image	\N	1204	Image manquante	\N	f
19387	1020	IMAGE	species.11.image	\N	1244	Image manquante	\N	f
19388	1020	TEXT	interests.locations.0.description	Créé en 2014, dans le but de « *de protéger la biodiversité exceptionnelle de l’espace maritime de Nouvelle-Calédonie, tout en permettant un développement économique responsable et durable* », le [Parc naturel de la mer de Corail](https://mer-de-corail.gouv.nc/) couvre 1,3 millions de km<sup>2</sup>, soit l’ensemble de la zone économique exclusive de la Nouvelle-Calédonie. Elle intègre les récifs d’Entrecasteaux, remarquables par les importantes populations de tortues vertes et d’oiseaux marins qui s’y reproduisent en grand nombre.	\N	\N	\N	f
19389	1020	TEXT	risks.risks.1.description	Une même thématique relève le plus souvent de compétences « croisées » entre divers acteurs institutionnels. Chaque Province réglemente, contrôle et veille à la bonne application des réglementations environnementales mises en œuvre localement, sur son propre domaine géographique. Chacune dispose de son propre Code de l’environnement.  \nLe gouvernement de la Nouvelle-Calédonie réglemente et exerce quant à lui un droit d'exploration, d’exploitation, de gestion et de conservation des ressources naturelles, biologiques et non biologiques sur l’ensemble de la zone économique exclusive.  \nPar ailleurs, toutes les questions relatives à l’environnement ne peuvent s’envisager sans y intégrer une dimension coutumière et culturelle composante spécifique forte du territoire. \n\nToutes ces réglementations sont évolutives et régulièrement mises à jour et complétées, avec une volonté de cohérence à souligner entre les différents acteurs impliqués.	\N	\N	\N	f
19390	1020	TEXT	interests.locations.2.description	Cette région de 43 970 ha, [inscrite sur la Convention de Ramsar](https://www.province-sud.nc/information/lacs-grand-sud-inscrits-convention-ramsar) depuis 2014, se compose de forêts humides, de maquis miniers, de marais arbustifs et de rivières, ruisseaux et lacs intermittents et permanents, notamment le lac de Yaté. Elle abrite des espèces qui ne vivent nulle part ailleurs. Considérée comme le plus grand réservoir d’eau douce de Nouvelle-Calédonie, cette région repose sur un réseau d’eau souterrain original et complexe, unique au monde.	\N	\N	\N	f
19391	1020	TEXT	interests.locations.1.description	Depuis juillet 2008, les lagons de Nouvelle-Calédonie sont inscrits sur la [Liste du patrimoine mondial de l’UNESCO](https://whc.unesco.org/fr/list/1115/) en raison de leur diversité exceptionnelle et de leur bon état de conservation. Ce bien "en série", c'est à dire composé de six zones géographiques distinctes a été le premier site ultra-marins à être reconnu comme tel. 	\N	\N	\N	f
19392	1020	TEXT	ecosystems.ecosystems.3.name	Les forêts sèches	\N	\N	\N	f
19393	1020	TEXT	identity.subtitle	Un endémisme remarquable	\N	\N	\N	f
19394	1020	IMAGE	species.7.image	\N	1201	Image manquante	\N	f
19395	1020	TEXT	species.5.name	Les Kaoris	\N	\N	\N	f
19396	1020	TEXT	risks.risks.0.description	La Nouvelle-Calédonie présente une flore et une faune remarquables, avec des taux d'endémismes très élevés. Trois principales menaces pèsent sur cette biodiversité : les incendies de forêts, les activités minières et les espèces exotiques envahissantes. S'y ajoutent d'autres menaces anthropiques liées à l'aménagement du territoires ou encore les pollutions. \n\nForte de 25 à 30% des réserves mondiales de nickel, la Nouvelle-Calédonie a comme principale activité économique l'exploitation de ces ressources. Cette exploitation est cependant à l’origine d’impacts notables sur la biodiversité terrestre et marine (érosion, sur-sédimentation…). La réhabilitation des zones exploitées est également un enjeu important.  \n\nLes [incendies de forêt](https://www.oeil.nc/fr/causes/les-incendies) sont particulièrement dévastateurs sur le territoire. Les épisodes sont fréquents et les moyens de lutte limités au regard des enjeux environnementaux. Plusieurs dizaines de milliers d’hectares sont brûlés chaque année. Outre la destruction de la flore, les incendies favorisent la colonisation d’espèces exotiques envahissantes, dégradent la ressource en eau et menacent également les populations humaines.  \n\nLes espèces exotiques envahissantes impactent fortement tous les écosystèmes. Plus de 2 000 espèces végétales, plus de 500 invertébrés et une quarantaine de vertébrés ont ainsi été introduits sur le territoire (dont [36 des 100 espèces considérées comme parmi les plus envahissantes au monde](https://preprod.biodiversite-outre-mer.fr/indicateurs/especes-exotiques-envahissantes)). Une [stratégie de lutte pays](https://www.cen.nc/especes-envahissantes/presentation) contre les espèces exotiques envahissantes dans les espaces naturels de Nouvelle-Calédonie est en place depuis 2016.  \n\nA une toute autre échelle, l’impact des changements climatiques sur les écosystèmes calédoniens soulève également de nombreuses questions.\n\n	\N	\N	\N	f
19397	1020	TEXT	ecosystems.ecosystems.2.description	Occupant un peu moins du quart de la surface du territoire, ces habitats ont une végétation très particulière du fait de la richesse du sol en minerais (fer, magnésium, nickel) et pauvre en éléments nutritifs. On en distingue plusieurs types en fonction de leur altitude. La richesse floristique exceptionnelle qu'ils abritent (1 170 espèces à 89 % endémiques) peut être menacée par le développement de projets miniers. La faune locale, adaptée aux conditions de vie difficile de ce milieu sec et rocailleux, compte principalement des insectes et des reptiles.	\N	\N	\N	f
19398	1020	TEXT	species.10.name	Les Roussettes	\N	\N	\N	f
19399	1020	TEXT	ecosystems.ecosystems.1.description	La Nouvelle-Calédonie possède la 2ème plus grande barrière de corail du monde, longue de 1 600 km et quasi-continue. D'une superficie totale de 23 400 kms<sup>2</sup>, les récifs et lagons calédoniens sont parmi les plus étendus et les plus riches de la planète ! La diversité observée, aussi bien en termes d’espèces que de structures récifales, y est exceptionnelle. Le lagon Sud constitue est une zone de reproduction privilégiée pour la Baleine à bosse. Six zones de lagons sont classées au patrimoine mondial de l’UNESCO depuis 2008.	\N	\N	\N	f
19400	1020	TEXT	ecosystems.ecosystems.0.description	Ces forêts dites « sempervirentes » couvrent un peu plus de 20 % du territoire, avec des massifs de plusieurs milliers d’hectares d’un seul tenant. Elles concentrent plus de 2000 espèces végétales donc 80 % endémiques, et offrent un habitat à une faune diversifiée : oiseaux, reptiles, chauve-souris, insectes… Elles sont cependant victimes de fortes dégradations (incendies, exploitation minière, espèces exotiques envahissantes…). 	\N	\N	\N	f
19401	1020	TEXT	identity.highestPoint	1 628	\N	\N	\N	f
19402	1020	TEXT	interests.locations.4.description	Situé sur la côte Sud-Est de la Grande Terre, entre Thio et Yaté, [ce parc provincial](https://www.province-sud.nc/aires-protegees/parc-cote-oubliee) créé en 2019 protège désormais 93 000 ha terrestres et 29 200 ha marins. Ce véritable trésor de biodiversité compte 98 % d’espèces végétales endémiques, des centaines d’espèces rares ou menacées, la moitié des forêts humides de la Nouvelle-Calédonie et un patrimoine culturel et immatériel précieux. Ce classement a par ailleurs induit le gel d’une centaine de titres miniers. \n	\N	\N	\N	f
19403	1020	TEXT	risks.risks.0.name	Une richesse en biodiversité soumise à des fortes pressions 	\N	\N	\N	f
19404	1020	IMAGE	interests.locations.1.image	\N	1090	Poisson-coffre dans les récifs d’Entrecasteaux © DR	\N	f
20684	1008	TEXT	understand.text1	Qualifier une espèce d’endémique, cela veut dire que sa répartition est limitée à une zone géographique peu étendue et qu’elle ne se retrouve nulle part ailleurs dans le monde. Cela donne au territoire en question une responsabilité particulièrement forte dans la conservation du patrimoine mondial. On parle également d'espèces "sub-endémiques" lorsque leur répartition s'étend sur quelques territoires proches mais reste très limitée. \nEn raison de cette aire de répartition géographique restreinte, ces espèces sont généralements plus sensibles aux pressions liées aux activités humaines et se retrouvent plus souvent en danger de disparition que les espèces plus largement répandues. \n\nReflet de l'état actuel des connaissances, ce chiffre peut augmenter en raison de l'amélioration des connaissances scientifiques et de la [découverte de nouvelles espèces](https://preprod.biodiversite-outre-mer.fr/indicateurs/nouvelles-especes), mais il peut également diminuer lorsque des espèces s'éteignent.  	\N	\N	\N	f
20685	1008	TEXT	territories.title	Nombre d'espèces endémiques	\N	\N	\N	f
20686	1008	TEXT	understand.title1	La notion d'endémisme	\N	\N	\N	f
20687	1008	TEXT	understand.title2	Un taux d’endémisme plus élevé dans les îles ? 	\N	\N	\N	f
20688	1008	TEXT	presentation.descriptionTerritories	espèces sont endémiques du territoire	\N	\N	\N	f
20689	1008	TEXT	understand.paragraphs.0.title	Quelques exemples	\N	\N	\N	f
20690	1008	TEXT	understand.keyword	endémique	\N	\N	\N	f
20691	1008	TEXT	ecogestures.title	Comment préserver les espèces endémiques ? 	\N	\N	\N	f
20692	1008	IMAGE	presentation.image	\N	1034	Kaori de forêt (Agathis lanceolata) © Mickaël T / CC BY 2.0	\N	f
19405	1020	IMAGE	ecosystems.ecosystems.1.image	\N	1093	La piscine naturelle de la baie d’Oro © Jeremy Zero/Unsplash	\N	f
19406	1020	TEXT	interests.locations.3.description	Autour du point culminant de la Nouvelle-Calédonie, cette réserve de 5 400 hectares a été créée en 1950. Cette réserve botanique exceptionnelle se caractérise par une mosaïque de formations forestières abritant une faune et une flore remarquable : kaoris, palmiers du genre *Clinosperma*, oiseaux (Méliphage noir, Pétrel de Tahiti), papillons...	\N	\N	\N	f
19407	1020	IMAGE	species.10.image	\N	1243	Image manquante	\N	f
19408	1020	TEXT	identity.title	La Nouvelle-Calédonie,\nun hotspot de biodiversité dans le Pacifique	\N	\N	\N	f
19409	1020	IMAGE	species.6.image	\N	1200	Image manquante	\N	f
19410	1020	TEXT	interests.locations.1.name	Les lagons, inscrits au Patrimoine mondial de l'UNESCO 	\N	\N	\N	f
22725	1018	TEXT	secondActionName	Je donne de mon temps	\N	\N	\N	f
22726	1018	LINK	secondActionLink	Tous les programmes de sciences participatives	\N	\N	https://preprod.biodiversite-outre-mer.fr/sciences-participatives	f
22727	1018	TEXT	description	Iorem ipsum	\N	\N	\N	f
20111	1023	IMAGE	presentation.file	\N	1113	jeter ses déchets covid	\N	f
20112	1023	IMAGE	action.cards.2.icon	\N	1116	Tri	\N	f
20113	1023	TEXT	presentation.name	Je ne jette pas mes déchets dans la nature	\N	\N	\N	f
20114	1023	IMAGE	action.cards.0.icon	\N	1114	Poubelles	\N	f
20115	1023	IMAGE	presentation.image	\N	1164	Dustan Woodhouse/Unsplash	\N	f
20116	1023	TEXT	understand.text	Certains déchets libèrent des substances toxiques lorsqu’ils se décomposent, ils dégraderont peu à peu les milieux naturels et polluerons durablement les sols, d’autres seront de véritables pièges pour la faune sauvage par ingestion ou enchevêtrement, causant des dommages à de nombreuses espèces (occlusions, fausse satiété, blessures, amputations, noyades…). Les mégots et les morceaux de verre peuvent également être responsables de départs d’incendies qui détruirons les habitats et leurs occupants.\nDe plus, les décharges sauvages représentent souvent de parfaits gîtes à moustiques et peuvent donc favoriser la transmission de maladies (dengue, chikungunya, zika).\n\nAvec la pandémie du Covid-19, l'utilisation de masques à usages unique a considérablement augmenté. Fabriqués à partir de polypropylène, un plastique résistant, on estime qu'il leur faut 400 ans pour se dégrader dans l'océan, en engendrant de tout petits fragments appelés microplastiques, qui polluent durablement les écosystèmes.\n\nLes bio-plastiques, une bonne idée ? Attention au greenwashing ! Sous ce terme se trouvent des produits composés, parfois seulement en partie, de matières d'origine végétale (amidon de pomme de terre ou de maïs, canne à sucre, glucose dérivé de l'amidon ou encore huile végétale). Souvent vantés comme "biodégradables", la plupart ne sont en réalité compostables qu'en condition industrielles. Jetés dans la nature, ils ne se dégradent pas !\n\nPour éviter d'impacter durablement les milieux, prenons le temps de jeter correctement nos déchets.  	\N	\N	\N	f
20117	1023	IMAGE	action.cards.1.icon	\N	1115	Cigarette	\N	f
20118	1023	TEXT	action.cards.2.description	Je me renseigne sur le système de tri de mon territoire et je le respecte. Certains déchets nécessitent des traitements particuliers et ne doivent surtout pas être jetés avec les ordures ménagères (médicaments, électronique, etc.). 	\N	\N	\N	f
20119	1023	TEXT	presentation.category	Sur terre et en mer	\N	\N	\N	f
20120	1023	TEXT	action.cards.1.description	Si je suis fumeur, je ne jette jamais mon mégot dans la nature.\nJe peux acheter ou fabriquer un cendrier de poche à garder avec moi.	\N	\N	\N	f
20121	1023	TEXT	presentation.description	Mégots, sacs plastiques, piles, canettes, vieux filets de pêche, carcasses de voitures… Sur terre comme en mer, tous ces déchets abandonnés dégradent les écosystèmes !	\N	\N	\N	f
20122	1023	TEXT	action.title	Pour que mes déchets n’impactent pas les milieux 	\N	\N	\N	f
22728	1018	TEXT	firstActionName	J'agis en ligne	\N	\N	\N	f
22729	1018	LINK	firstActionLink	Je télécharge l'application INPN Espèces	\N	\N	https://inpn.mnhn.fr/informations/inpn-especes	f
22730	1018	TEXT	title	Agir pour la biodiversité	\N	\N	\N	f
19411	1020	IMAGE	species.0.image	\N	1091	*Sphaeropteris intermedia* © Benjamin Guichard / OFB	\N	f
19412	1020	TEXT	events.1.date	Entre - 1100 et -1050 ans	\N	\N	\N	f
20123	1023	TEXT	understand.quote	A l’échelle mondiale, on estime que 8 millions de tonnes de plastique finissent chaque année dans les océans ! Et un mégot peut polluer à lui seul 500 litres d’eau.	\N	\N	\N	f
20124	1023	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
20125	1023	TEXT	action.cards.0.description	Je ne jette jamais mes déchets dans la nature. Si il n’y a pas de poubelles à proximité, je les conserve avec moi en attendant.	\N	\N	\N	f
20141	1025	IMAGE	presentation.file	\N	1125	test 	\N	f
20142	1025	IMAGE	action.cards.2.icon	\N	1129	chien	\N	f
20143	1025	IMAGE	action.cards.3.icon	\N	1130	véto	\N	f
20144	1025	TEXT	presentation.name	Je respecte la faune sauvage	\N	\N	\N	f
20145	1025	IMAGE	action.cards.0.icon	\N	1127	distance	\N	f
20146	1025	IMAGE	presentation.image	\N	1126	Iguane endémique des Petites Antilles © Fabien Lefebvre	\N	f
19413	1020	TEXT	interests.locations.4.name	Le parc provincial de la Côte oubliée (*Woen Vùù – Pwa Pereeù*)	\N	\N	\N	f
20126	1026	IMAGE	presentation.file	\N	1134	test	\N	f
20127	1026	IMAGE	action.cards.2.icon	\N	1133	jetable	\N	f
20128	1026	TEXT	presentation.name	Je réduis mes déchets et limite ma consommation de plastique	\N	\N	\N	f
20129	1026	IMAGE	action.cards.0.icon	\N	1131	sacs	\N	f
20130	1026	IMAGE	presentation.image	\N	1135	Jasmin Sessler / Unsplash	\N	f
20131	1026	TEXT	understand.text	Lorsqu’ils terminent dans la nature, nos déchets polluent durablement les milieux et nous finissons par les ingérer également au quotidien dans l’eau, l’air et la nourriture. Mais même lorsqu'ils sont collectés, leur impact sur l'environnement reste important : leur incinération génère une pollution de l'air et l'émission de gaz à effet de serre, l'enfouissement pollue durablement les sols et les eaux et s'avère rapidement problématique dans les petits territoires insulaires.\n\nLe pire ? Les plastique à usage unique : pour quelques minutes d’utilisation, au mieux ils grossiront le stock de déchets à traiter, au pire ils pollueront durablement les écosystèmes !\n\nLe recyclage est une solution, mais elle a ses limites : certaines matières ne sont pas recyclables, et pour les celles qui le sont les territoires d’outre-mer n’ont pas toujours la capacité de les collecter et les traiter (insuffisance d’infrastructures, éloignement ou difficultés d’accès à certaines zones), ce qui implique un export, lui aussi coûteux et polluant.\n\nPour améliorer notre cadre de vie et notre environnement, réduisons le volume de nos poubelles en respectant 5 grands principes : refuser, réduire, réutiliser, recycler, composter.\nDes programmes "zéro déchets" et de nombreuses ressources existent pour vous accompagner dans ces démarches.\n	\N	\N	\N	f
20132	1026	IMAGE	action.cards.1.icon	\N	1132	vrac	\N	f
20133	1026	TEXT	action.cards.2.description	Je fais la chasse aux produits à usages uniques : gobelets, pailles, touillettes, et je les remplace par des alternatives durables ou biodégradables.	\N	\N	\N	f
20134	1026	TEXT	presentation.category	Consommation	\N	\N	\N	f
20135	1026	TEXT	action.cards.1.description	Je privilégie les produits achetés en vrac. J'utilise mes propres contenants réutilisables. 	\N	\N	\N	f
20136	1026	TEXT	presentation.description	Même lorsqu'ils sont collectés correctement, l'impact de nos déchets sur l'environnement reste important. 	\N	\N	\N	f
20137	1026	TEXT	action.title	Pour commencer à réduire mes déchets : 	\N	\N	\N	f
20138	1026	TEXT	understand.quote	A l’échelle mondiale, un tiers des déchets plastiques se retrouve dans la nature. Seuls 9% des déchets plastiques sont recyclés dans le monde.	\N	\N	\N	f
20139	1026	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
20140	1026	TEXT	action.cards.0.description	Je refuse les sacs plastiques à usage unique, j'utilise des sacs réutilisables en tissus ou en matières naturelles.	\N	\N	\N	f
20147	1025	TEXT	understand.text	Observer la faune dans son milieu naturel est une chance et une expérience formidable. Cependant, sur terre comme en mer, déranger un animal peut le mettre en péril en occasionnant un stress important et une dépense d’énergie inutile. Il risque également d’abandonner son nid ou ses petits, se blesser, être plus facilement à la merci d’un prédateur…\n\nLes conséquences sont d’autant plus importantes lorsqu’il s’agit d’espèces très menacées, pour laquelle la survie de chaque individu compte.\n\nL'impact des chiens peut être catastrophique pour la faune sensible des outre-mer, que ce soit par prédation ou par le stress qu'ils occasionnent (poursuite, aboiements, destruction de nids,...). En Nouvelle-Calédonie, ils ont joué un rôle non-négligeable dans le déclin de la population de Cagous.\nDans la plupart des espaces protégés, leur présence, même tenus en laisse n'est pas autorisée. 	\N	\N	\N	f
20148	1025	IMAGE	action.cards.1.icon	\N	1128	bruits	\N	f
24561	1015	TEXT	events.2.description	Dernière éruption de la Montagne Pelée	\N	\N	\N	f
14286	1030	TEXT	paragraphs.2.text	**Outils de mesure d’audience**\nLe site utilise l’outil d’analyse Matomo. Les traceurs de mesures d’audience issus de Matomo ne nécessitent pas de recueil préalable du consentement de l’utilisateur du fait qu’ils servent uniquement à produire des données statistiques anonymes.\nPour en savoir plus :\nhttps://fr.matomo.org/privacy/\n\n**Politique de confidentialité et RGPD**\nLe Muséum national d’Histoire naturelle porte la plus grande attention à vos données à caractère personnel et s’engage à les protéger.\nIl s'engage à ce que la collecte et le traitement de données à caractère personnel, effectués à partir du présent site, soient conformes à la loi n°78-17 du 6 janvier 1978 modifiée relative à l'informatique, aux fichiers et aux libertés ainsi qu’au Règlement (UE) 2016/679 du Parlement européen et du Conseil du 27 avril 2016 applicable le 25 mai 2018. \n\n**Données personnelles**\nSauf stipulation contraire directement mentionnée, aucune donnée personnelle n’est collectée ni traitée sur le portail « Compteur de biodiversité outre-mer ».	\N	\N	\N	f
14287	1030	TEXT	paragraphs.1.title	Conditions générales d’utilisation	\N	\N	\N	f
24562	1015	TEXT	events.3.description	Création du Parc naturel régional de Martinique et de la Réserve naturelle nationale de la presqu'île de la Caravelle	\N	\N	\N	f
24563	1015	IMAGE	identity.image	\N	1269	La Montagne Pelée depuis la mer © Fabien Lefebvre	\N	f
24564	1015	TEXT	events.7.description	Création de [l'Observatoire Martiniquais de la biodiversité](http://www.biodiversite-martinique.fr/#)	\N	\N	\N	f
24565	1015	TEXT	events.7.date	2015	\N	\N	\N	f
24566	1015	TEXT	interests.locations.0.name	Le Parc naturel régional de la Martinique	\N	\N	\N	f
24567	1015	TEXT	events.0.description	Premières traces d'occupation humaine en Martinique	\N	\N	\N	f
24568	1015	TEXT	events.1.description	La Martinique devient française	\N	\N	\N	f
24569	1015	TEXT	events.8.description	Expédition Madibenthos : inventaire de la faune et de la flore marine côtière	\N	\N	\N	f
24570	1015	TEXT	events.9.description	Création du [Parc naturel marin de Martinique](https://www.parc-marin-martinique.fr/)	\N	\N	\N	f
24571	1015	IMAGE	ecosystems.image	\N	1069	Nudibranche © Fabien Lefebvre	\N	f
14288	1030	TEXT	title	Mentions légales	\N	\N	\N	f
14289	1030	TEXT	paragraphs.2.title	Mentions relatives à l’utilisation de cookies	\N	\N	\N	f
14290	1030	TEXT	paragraphs.0.text	**Editeur**\nMuséum national d'Histoire naturelle\nUMS Patrimoine Naturel \nCP41, 36 rue Geoffroy saint-Hilaire\n75005 Paris\n\n**Conception et hébergement**\nAgence Ninja Squad\nwww.ninja-squad.fr\n\nJean-Baptiste Giffard\nwww.digitaldesigner.cool\n\nSite hébergé par le Muséum national d’Histoire naturelle\n\n**Création graphique**\nDesign graphique réalisé par : \nAmélie Bracq\nEdouard Sastre\n\n**Création et mise à jour du contenu**\nLe contenu éditorial du site est produit et mis à jour par l’Unité Mixte de Service Patrimoine Naturel (UMS PatriNat) du MNHN.	\N	\N	\N	f
24572	1015	TEXT	identity.species	7 009	\N	\N	\N	f
24573	1015	IMAGE	ecosystems.ecosystems.0.image	\N	1066	Plage de Martinique © Daniel Öberg/Unsplash	\N	f
24574	1015	TEXT	species.8.name	Le Gommier blanc	\N	\N	\N	f
21504	1003	TEXT	header.title	À la découverte des outre-mer	\N	\N	\N	f
21505	1003	TEXT	header.population	2,8 millions	\N	\N	\N	f
21506	1003	TEXT	header.species	85 117	\N	\N	\N	f
21507	1003	TEXT	header.text	Les territoires d’outre-mer présentent une biodiversité particulièrement riche et variée, mais fragilisée par les activités humaines. Naviguez parmi les portraits biodiversité des différents territoires et découvrez l’histoire des espèces et des écosystèmes qui les peuplent, les enjeux de chaque territoire et les initiatives des acteurs locaux pour les préserver.	\N	\N	\N	f
24575	1015	TEXT	events.6.description	Création de la Réserve naturelle régionale marine du Prêcheur - Albert Falco	\N	\N	\N	f
24576	1015	TEXT	events.6.date	2014	\N	\N	\N	f
24577	1015	TEXT	events.4.description	Création de la Réserve naturelle nationale des îlets de Sainte Anne	\N	\N	\N	f
24578	1015	TEXT	events.5.description	Création du [Sanctuaire AGOA](https://sanctuaire-agoa.fr/) pour les mammifères marins qui couvre toutes les Antilles françaises	\N	\N	\N	f
21849	1012	TEXT	understand.text1	La mangrove est un écosystème forestier constitué principalement d'arbres appelés palétuviers, et se trouvant dans la zone de balancement des marées. Espace de transition entre le milieu terrestre et le milieu marin, cet écosystème abrite de nombreuses espèces qui en sont dépendantes pour une partie ou la totalité de leur cycle de vie.\n\nOn trouve des mangroves dans tous les territoires tropicaux d’outre-mer français, à l’exception de l’île de La Réunion. Au total, on estime leur superficie à 91 096 ha, la grande majorité se trouvant en Guyane et en Nouvelle-Calédonie. Cependant, en Polynésie, cet écosystème n’est pas présent naturellement : une espèce de palétuvier, [*Rhizophora stylosa*](https://inpn.mnhn.fr/espece/cd_nom/447469), a été introduite volontairement dans les années 1930, et s’est ensuite propagée à l’ensemble des îles de la Société, au détriment de certains écosystèmes natifs. 	\N	\N	\N	f
21850	1012	TEXT	territories.title	Surface couverte par la mangrove	\N	\N	\N	f
21851	1012	TEXT	understand.title1	La mangrove, un écosystème protecteur	\N	\N	\N	f
24579	1015	TEXT	interests.locations.2.name	L’étang des Salines	\N	\N	\N	f
24580	1015	TEXT	ecosystems.ecosystems.3.description	Les herbiers sont composés principalement de phanérogames marines : ce ne sont pas des algues mais bien des plantes aquatiques. Ils sont des lieux de reproduction, de développement et d’alimentation de nombreuses espèces (poissons, oursins, tortues…). En Martinique, ils s’étendent sur les fonds sableux sur près de 5 000 ha.	\N	\N	\N	f
24581	1015	TEXT	ecosystems.ecosystems.4.description	Des communautés coralliennes se développent sur tous les petits fonds de l’île mais elles ne forment de véritables récifs que sur la côte atlantique de l’île et dans la baie de Fort de France. 40 espèces coralliennes sont recensées dans les eaux de l’île. Cependant, une importante partie des colonies sont considérées comme dégradées.	\N	\N	\N	f
24582	1015	TEXT	ecosystems.ecosystems.4.name	Les récifs coralliens	\N	\N	\N	f
24583	1015	TEXT	statistics.3.text	hectares de mangroves sur le territoire	\N	\N	\N	f
24584	1015	TEXT	events.10.date	2020	\N	\N	\N	f
24585	1015	IMAGE	species.1.image	\N	1060	*Iguana delicatissima* © A. Pibot /OFB	\N	f
24586	1015	TEXT	events.5.date	2010	\N	\N	\N	f
24587	1015	TEXT	identity.marineArea	45 000	\N	\N	\N	f
24588	1015	TEXT	events.8.date	2016	\N	\N	\N	f
24589	1015	IMAGE	interests.locations.0.image	\N	1280	Cascade dans le Parc Naturel Régional de la Martinique © Fabien Lefebvre	\N	f
24590	1015	TEXT	species.6.name	Le Trigonocéphale	\N	\N	\N	f
24591	1015	IMAGE	interests.locations.3.image	\N	1059	Montagne Pelée © Youri Germany/Unsplash	\N	f
24592	1015	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
24593	1015	TEXT	interests.locations.3.name	La Montagne Pelée et les Pitons du Carbet	\N	\N	\N	f
24594	1015	TEXT	statistics.1.text	espèces de coraux recensées dans les eaux de l'île	\N	\N	\N	f
24595	1015	TEXT	events.9.date	2017	\N	\N	\N	f
24596	1015	IMAGE	species.4.image	\N	1064	*Aechmea reclinata* © Cesar Delnatte/OMB	\N	f
24597	1015	TEXT	events.3.date	1976	\N	\N	\N	f
24598	1015	IMAGE	ecosystems.ecosystems.3.image	\N	1270	Herbier et poisson © Fabien Lefebvre	\N	f
24599	1015	IMAGE	species.3.image	\N	1279	*Chelonia mydas* © Fabien Lefebvre	\N	f
24600	1015	TEXT	species.1.name	L'Iguane des Petites Antilles	\N	\N	\N	f
24601	1015	TEXT	species.7.name	Le Moqueur gorge-blanche	\N	\N	\N	f
24602	1015	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
24603	1015	TEXT	species.4.name	L'Ananas bois	\N	\N	\N	f
24604	1015	TEXT	identity.area	1 128	\N	\N	\N	f
24605	1015	TEXT	species.0.description	Le Matoutou Falaise ([*Caribena versicolor*](https://inpn.mnhn.fr/espece/cd_nom/845739\n)) est une mygale arboricole endémique de la Martinique. D’une envergure totale pouvant aller jusqu’à 15 cm, elle se caractérise par ses couleurs : abdomen rouge vif, pattes roses violacées et thorax bleuté. Prédatrice nocturne, elle se nourrit principalement d'insectes et est inoffensive pour les humains. Longtemps prélevée par les terrariophiles, l’espèce est protégée depuis 2017 au niveau national et sa détention est illicite.  \n  \nStatut dans la Liste rouge mondiale : non évalué. 	\N	\N	\N	f
22995	1007	IMAGE	partners.partners.1.logo	\N	1271	Criobe	\N	f
22996	1007	TEXT	partners.partners.0.url	http://www.biodiversite-martinique.fr/	\N	\N	\N	f
24606	1015	TEXT	identity.highestPointName	Montagne Pelée	\N	\N	\N	f
24607	1015	TEXT	ecosystems.ecosystems.2.name	Les mangroves	\N	\N	\N	f
24608	1015	TEXT	species.7.description	Le Moqueur gorge-blanche ([*Ramphocinclus brachyurus*](https://inpn.mnhn.fr/espece/cd_nom/442316\n)) est un petit oiseau à la face dorsale foncée et la face ventrale blanche endémique de la Martinique et de Sainte-Lucie. Il se trouve uniquement dans les zones boisées de la Presqu’île de la Caravelle. Considéré en danger d’extinction en raison de la petite taille de la population, il est victime de la prédation par les espèces introduites et fait l’objet d’un programme de conservation dans le cadre du programme [LIFE BIODIV’OM](https://www.lifebiodivom.fr/especes/moqueur-gorge-blanche/).\n\nStatut dans la Liste rouge des oiseaux de Martinique : en danger critique. 	\N	\N	\N	f
24609	1015	TEXT	species.8.description	Le Gommier blanc ([*Dacryodes excelsa*](https://inpn.mnhn.fr/espece/cd_nom/447568\n)) est l’un des plus grands arbres des forêts de Martinique, il peut atteindre 35 mètres de haut. Il est exploité pour son bois et sa résine.  \n  \nStatut dans la Liste rouge de la flore vasculaire de Martinique : non évalué.	\N	\N	\N	f
24610	1015	IMAGE	species.2.image	\N	1063	*Aliger gigas* © divermasterking2000 / CC BY 2.0	\N	f
24611	1015	IMAGE	ecosystems.ecosystems.4.image	\N	1267	Récif de Martinique © Fabien Lefebvre	\N	f
24612	1015	TEXT	species.3.description	La Tortue verte ([*Chelonia mydas*](https://inpn.mnhn.fr/espece/cd_nom/77338\n)) est l’une des cinq espèces de tortues marines qui fréquentent les eaux de Martinique. Si elle est régulièrement observable dans l’eau, en alimentation sur les herbiers, elle ne pond que rarement sur les plages de Martinique. Comme toutes les espèces de tortues marines, elle est menacée d'extinction, notamment en raison des captures accidentelles dans les filets de pêche et la dégradation des sites de ponte. Le dérangement répété par les baigneurs peut également occasionner une forte dépense d’énergie pour les tortues, c’est pourquoi il est recommandé de garder une distance minimum de quelques mètres et de ne pas tenter de les toucher.\n\nStatut dans la Liste rouge des reptiles de Martinique : en danger critique. 	\N	\N	\N	f
24613	1015	TEXT	statistics.3.number	2 000	\N	\N	\N	f
22997	1007	TEXT	goal2.quote	*Le Compteur constituera un signal d’alerte et donnera une visibilité forte et essentielle pour sensibiliser à l’évolution de la biodiversité.*  Livre bleu des outre-mer, 2018. 	\N	\N	\N	f
22998	1007	TEXT	goal1.title	Partager la connaissance scientifique	\N	\N	\N	f
22999	1007	IMAGE	goal2.quoteImage	\N	1031	Coq-de-roche © Raphaël Gailhac 	\N	f
23000	1007	TEXT	goal2.description	De nombreuses actions locales sont mises en place afin de tenter de préserver les écosystèmes et les espèces. Donner de la visibilité aux acteurs locaux, partager les expériences et les réussites, au bénéfice de tous, c’est également l’un des objectifs du Compteur. 	\N	\N	\N	f
23001	1007	TEXT	goal3.description	Chacun, à son échelle, peut agir pour préserver la biodiversité. Connaitre et appliquer des gestes simples, modifier ses habitudes et son comportement ou encore s’investir dans des programmes de sciences participatives, tout le monde est concerné par la préservation de la biodiversité. Le rôle du Compteur est d’accompagner les citoyens en partageant des informations claires et adaptées à tous les territoires, et en encourageant à se mobiliser.	\N	\N	\N	f
23002	1007	TEXT	partners.title	Les partenaires	\N	\N	\N	f
23003	1007	TEXT	goal1.description	Quelles sont les espèces présentes dans ce territoire ? Comment évoluent leurs populations ? Quel est l’état de santé des récifs coralliens ? Pour répondre à ces questions et bien d’autres, différents paramètres, appelés « indicateurs », sont mesurés par les scientifiques pour suivre l’évolution de l’état de la biodiversité. Le Compteur a pour mission de rendre compte de l’état de ces connaissances dans les territoires en s'appuyant notamment sur l'[ONB](https://naturefrance.fr/), l'[INPN](https://inpn.mnhn.fr/accueil/index) et les observatoires locaux. 	\N	\N	\N	f
23004	1007	IMAGE	goal3.image	\N	1274	 © Observatoire Martiniquais de la biodiversité	\N	f
24614	1015	TEXT	species.1.description	L’Iguane des Petites Antilles ou Iguane péyi ([*Iguana delicatissima*](https://inpn.mnhn.fr/espece/cd_nom/350755\n)) était autrefois présent sur tout le nord des Petites Antilles, depuis Anguilla jusqu’à la Martinique. Il a aujourd’hui disparu de nombreux territoires, et est considéré en danger critique d’extinction. Sa survie est menacée par l’introduction de l’Iguane commun ([*Iguana iguana*](https://inpn.mnhn.fr/espece/cd_nom/350756\n)) avec qui il ne doit pas être confondu. L’Iguane commun exotique se reconnait aux rayures sombres sur la queue et à sa grosse plaque ronde sur la joue, sous le tympan, que ne possèdent pas l’Iguane des Petites Antilles.\n\nStatut dans la Liste rouge des reptiles de Martinique : en danger critique.	\N	\N	\N	f
24615	1015	TEXT	species.2.description	Le Lambi ([*Aliger gigas*](https://inpn.mnhn.fr/espece/cd_nom/972164\n)) est un mollusque dont la coquille imposante peut atteindre 30 cm et 1,5 kg. Victime de la surpêche pour sa chair et parfois l’usage décoratif de sa coquille, son exploitation est aujourd’hui strictement contrôlée. La Martinique en a fait son emblème officiel.  \n  \nStatut dans la Liste rouge mondiale : non évalué.   	\N	\N	\N	f
24616	1015	TEXT	statistics.1.number	40	\N	\N	\N	f
24617	1015	TEXT	statistics.0.number	48	\N	\N	\N	f
24618	1015	TEXT	statistics.2.number	2/3	\N	\N	\N	f
24619	1015	IMAGE	interests.locations.4.image	\N	1182	Image manquante	\N	f
24620	1015	TEXT	species.2.name	Le Lambi	\N	\N	\N	f
24621	1015	TEXT	risks.risks.1.name	Un Observatoire local de la biodiversité	\N	\N	\N	f
24622	1015	TEXT	species.4.description	L’Ananas bois ([*Aechmea reclinata*](https://inpn.mnhn.fr/espece/cd_nom/629022\n)) a été décrite pour la première fois en 1999 par une équipe du Parc naturel régional. Endémique de Martinique, cette espèce n’a été observée qu’en arrière-mangrove de Genipa et sur la montagne du Vauclin. Peu après sa découverte, une grande part de son aire de répartition a été défrichée illégalement pour y planter de la canne à sucre, mettant en péril cette espèce tout juste inventoriée.\n\nStatut dans la Liste rouge de la flore vasculaire de Martinique : en danger critique. 	\N	\N	\N	f
24623	1015	TEXT	ecosystems.ecosystems.0.name	Les plages	\N	\N	\N	f
24624	1015	TEXT	species.5.description	L’Herbe à Tortue ([*Thalassia testudinum*](https://inpn.mnhn.fr/espece/cd_nom/627263)) est une plante marine qui compose les herbiers de phanérogames sous-marins, souvent accompagnée de l’Herbe à Lamentin ([*Syringodium filiforme*](https://inpn.mnhn.fr/espece/cd_nom/627259)). Son aire de répartition couvre l’ensemble des Caraïbes, et de nombreuses espèces marines s’en nourrissent. L'introduction d'une espèce exotique de phanérogame, [*Halophila stipulacea*](https://inpn.mnhn.fr/espece/cd_nom/368620), signalée depuis 2006 dans les eaux martiniquaises, représente une potentielle menace pour ces herbiers indigènes. Des études sont en cours pour suivre son expansion et mesurer ses impacts sur les communautés marines. \n\nStatut dans la Liste rouge mondiale : préoccupation mineure.\n	\N	\N	\N	f
24625	1015	TEXT	species.6.description	Serpent endémique venimeux, le Trigonocéphale ([*Bothrops lanceolatus*](https://inpn.mnhn.fr/espece/cd_nom/439142\n)) a été victime de sa mauvaise réputation bien que peu d’accidents aient été à déplorer et qu’un anti-venin existe. Des primes à la capture ont longtemps existé et dans les années 1980, la mangouste ([*Urva auropunctata*](https://inpn.mnhn.fr/espece/cd_nom/850071/)) a été introduite des Indes dans le but de le combattre, cependant le serpent étant nocturne et la mangouste diurne, celle-ci s’est rabattue sur les espèces indigènes. Il est aujourd’hui rare sur l’île.\n\nStatut dans la Liste rouge des reptiles de Martinique : en danger. 	\N	\N	\N	f
21909	1017	TEXT	presentation	Les activités humaines sont à l’origine du déclin de la biodiversité et la dégradation des écosystèmes. Aujourd’hui plus que jamais, il est nécessaire de remettre en question nos comportements et nos choix de consommation, au quotidien ou en voyage, chez soi ou en milieu naturel, pour mieux prendre soin de la biodiversité qui nous entoure. Petits efforts ou grands gestes, nous pouvons tous être acteurs du changement, pour limiter notre impact sur le monde qui nous entoure.  \n\nL’objectif du Compteur est de mettre en avant des écogestes adaptés aux contextes ultramarins.	\N	\N	\N	f
21910	1017	IMAGE	image	\N	1073	© DR	\N	f
21911	1017	TEXT	quote	Des actions concrètes pour agir dès maintenant et préserver cette biodiversité les espèces et les écosystèmes	\N	\N	\N	f
21912	1017	TEXT	question	Qu’est-ce qu’un écogeste ? 	\N	\N	\N	f
21913	1017	TEXT	answer	Les écogestes, ce sont tous ces changements de comportement individuels qui permettent de réduire son impact sur l’environnement. Faire attention à son utilisation énergétique, faire les bons choix de consommation, mieux gérer ses déchets, consommer moins de viande, etc. des plus petits gestes aux grands changements, chacun est acteur de la préservation de l’environnement et peut limiter son impact. La multiplication de ces comportements individuels peut entraîner des changements notables à plus grande échelle !\n\nTous ces gestes ne doivent pas faire oublier que de profonds changements de société seront nécessaire pour limiter les risques liés au déclin de la biodiversité et au changement climatique. Ils représentent des actions et des changements de comportements nécessaires, mais doivent être accompagnés de politiques environnementales à la hauteur des enjeux.	\N	\N	\N	f
21914	1017	TEXT	other.title	Retrouvez d'autres écogestes sur	\N	\N	\N	f
21915	1017	IMAGE	other.image	\N	1257	logo	\N	f
21916	1017	TEXT	other.text	Biodiversité Tous Vivants !	\N	\N	\N	f
21917	1017	TEXT	title	Adaptons nos comportement pour préserver la biodiversité	\N	\N	\N	f
24626	1015	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
24627	1015	TEXT	events.0.date	1<sup>e</sup> siècle	\N	\N	\N	f
24628	1015	TEXT	identity.populationYear	2017	\N	\N	\N	f
24629	1015	IMAGE	species.5.image	\N	1277	*Thalassia testudinum* © Fabien Lefebvre	\N	f
23005	1007	TEXT	header.subtitle	C’est le Livre Bleu outre-mer, synthèse des travaux des Assises des outre-mer, qui propose en 2018 la création d’un Compteur de la biodiversité. Ce nouveau dispositif vient notamment enrichir le portail [Naturefrance](https://naturefrance.fr/) en présentant un focus sur les territoires ultramarins. Outil actualisé et pérenne, il favorisera la rencontre, la synergie des citoyens et des acteurs de la biodiversité.  \n  \nLa démarche est collaborative et partenariale avec les territoires, notamment pour relater les contextes culturels et mettre en avant des enjeux spécifiques. Des études, actuellement en cours, viennent compléter l’initiative : le premier panorama des programmes de sciences participatives dans les territoires, et une enquête sur la perception de la nature et l’utilisation des outils numériques. 	\N	\N	\N	f
23006	1007	TEXT	header.title	Pourquoi un Compteur de la biodiversité en outre-mer ?	\N	\N	\N	f
23007	1007	CHECKBOX	header.shadowed	true	\N	\N	\N	f
23008	1007	TEXT	goal3.title	Encourager chacun à agir	\N	\N	\N	f
23009	1007	TEXT	partners.partners.1.url	http://www.criobe.pf/	\N	\N	\N	f
23010	1007	IMAGE	goal2.image	\N	1029	Tortue olivâtre, Guyane © Raphael Gailhac	\N	f
23011	1007	IMAGE	goal1.image	\N	1030	Jaguar, Guyane © Raphaël Gailhac	\N	f
24630	1015	TEXT	statistics.0.text	Ilets répartis autour de l'île	\N	\N	\N	f
23012	1007	IMAGE	partners.partners.2.logo	\N	1272	DTAM Saint-Pierre et Miquelon	\N	f
23013	1007	TEXT	goal2.title	Valoriser les actions des territoires	\N	\N	\N	f
23014	1007	TEXT	partners.partners.2.url	http://www.saint-pierre-et-miquelon.developpement-durable.gouv.fr/	\N	\N	\N	f
23015	1007	IMAGE	header.background	\N	1028	Monts Pito Hiti et Orohena, Tahiti © Jean-Yves Meyer	\N	f
24631	1015	TEXT	ecosystems.ecosystems.1.name	La forêt humide tropicale	\N	\N	\N	f
24632	1015	TEXT	events.2.date	1929-1932	\N	\N	\N	f
24633	1015	TEXT	identity.presentation	Au cœur de l’arc des Petites Antilles, la Martinique, baptisée *Ioünacaera* « l’île aux iguanes » par ses premiers occupants amérindiens, présente une grande diversité de paysages. Au nord, des forêts humides bien conservées entourent le volcan de la Montagne Pelée. Le sud, plus sec et d’une altitude plus faible, est plus peuplé et urbanisé. L'île est entourée de 48 îlets, répartis principalement sur la côte atlantique, sur lesquels on retrouve une végétation adaptée aux milieux très sec et qui accueillent de nombreux oiseaux nicheurs. 	\N	\N	\N	f
24634	1015	TEXT	identity.population	372 594	\N	\N	\N	f
24635	1015	TEXT	species.3.name	La Tortue verte	\N	\N	\N	f
24636	1015	IMAGE	species.8.image	\N	1185	Image manquante	\N	f
23016	1007	IMAGE	partners.partners.0.logo	\N	1273	Observatoire Martiniquais de la biodiversité	\N	f
24637	1015	TEXT	species.0.name	Le Matoutou Falaise	\N	\N	\N	f
24638	1015	TEXT	events.4.date	1995	\N	\N	\N	f
24639	1015	IMAGE	interests.locations.2.image	\N	1058	L’Anse Meunier dans l’étang des Salines, Martinique © Hervé Nicolas / CC BY-SA 4.0 	\N	f
24640	1015	IMAGE	ecosystems.ecosystems.2.image	\N	1278	Mangrove, Martinique © Fabien Lefebvre	\N	f
24641	1015	TEXT	events.10.description	Publication de la Liste rouge de la Faune de Martinique	\N	\N	\N	f
24642	1015	TEXT	interests.locations.0.description	Créé en 1976, le [Parc naturel régional](http://pnr-martinique.com/) s’étend sur 32 communes et couvre les 2/3 de l’île. Son objectif est de conjuguer le développement de l’île avec la préservation de ses richesses naturelles et culturelles. 	\N	\N	\N	f
24643	1015	TEXT	risks.risks.1.description	Face aux enjeux  de la préservation et la valorisation de la biodiversité martiniquaise, 43 structures institutionnelles et associatives se sont réunies autour du Parc naturel régional de la Martinique pour la création d’un [Observatoire Martiniquais de la biodiversité](http://www.biodiversite-martinique.fr/#) afin de mutualiser les connaissances, sensibiliser le public et faciliter l’intégration de la biodiversité dans les politiques publiques.	\N	\N	\N	f
24644	1015	TEXT	interests.locations.2.description	D’une superficie de 207 ha, ce site géré par le Conservatoire du littoral abrite une importante faune et flore patrimoniale. 	\N	\N	\N	f
24645	1015	TEXT	interests.locations.1.description	A l'est de la Martinique, la presqu’île de la Caravelle présente une grande variété d’écosystèmes : savanes, falaises, forêt, mangroves. Le site est géré par le Parc naturel régional notamment pour y préserver le Moqueur gorge-blanche, oiseau endémique menacé.    	\N	\N	\N	f
24646	1015	TEXT	ecosystems.ecosystems.3.name	Les herbiers sous-marins	\N	\N	\N	f
24647	1015	TEXT	identity.subtitle	Des paysages contrastés	\N	\N	\N	f
24648	1015	IMAGE	species.7.image	\N	1276	*Ramphocinclus brachyurus* © Fabien Lefebvre	\N	f
24649	1015	TEXT	species.5.name	L'Herbe à Tortue 	\N	\N	\N	f
24650	1015	TEXT	risks.risks.0.description	L’expansion démographique et l’urbanisation, surtout au centre et au sud de l’île, impactent les milieux naturels de la Martinique : défrichements, rejets domestiques, industriels et agricoles,…\n\nLes mangroves de l'île sont des milieux particulièrement sensibles et soumis à de fortes pressions anthropiques : aménagements, décharge, pollution, activité agricole. Un projet de réserve naturelle régionale est à l’œuvre concernant les mangroves de la baie de Génipa.\nLes coupes illégales de bois et le trafic d’espèces indigènes, du Lambi ou du Matoutou falaise par exemple, sont des problématiques importantes, et la règlementation existante est difficile à faire appliquer.\n\nDe nombreuses espèces indigènes sont menacées par les espèces exotiques introduites : rat, mangouste, Iguane commun, etc. En milieu marin, le Poisson-lion, espèce originaire de la région indo-pacifique qui a colonisé toute la Caraïbe, est un consommateur vorace de poissons qui ne connait pas de prédateurs et a une stratégie de reproduction très efficace. Il est considéré comme une menace majeure pour la biodiversité marine.  \n\nLes échouages de sargasses sont un phénomène naturel dont l’ampleur a considérablement augmenté ces dernières années. Les radeaux denses et les dépôts épais qu’elles forment sur les plages piègent de nombreuses espèces dont des tortues, et ont également un impact sanitaire et économique important.\n\nLa chlordécone, pesticide utilisé dans les bananeraies entre les années 1970 et 1990 a massivement pollué les milieux naturels de l’île. Si ces impacts sur la santé humaine commencent à être connus, peu de données sont disponibles sur ses conséquences sur les espèces. Cependant, des études ont montré une importante contamination des organismes marins côtiers ce qui a conduit à l'interdiction de la pêche dans tous les cours d'eau et sur une partie des zones côtières de l'île.  	\N	\N	\N	f
20149	1025	TEXT	action.cards.3.description	Si un animal me parait en détresse, avant toute action, je contacte un professionnel (centre de soin, gestionnaires de réserve) afin de connaitre la démarche la plus adaptée pour lui porter secours.	\N	\N	\N	f
20150	1025	TEXT	action.cards.2.description	Je tiens mon chien en laisse et je respecte la règlementation dans les lieux où sa présence n’est pas autorisée.	\N	\N	\N	f
20151	1025	TEXT	presentation.category	Sur terre et en mer	\N	\N	\N	f
20152	1025	TEXT	action.cards.1.description	Je limite les bruits (cris, musique…) pour que ma présence reste discrète.  	\N	\N	\N	f
20153	1025	TEXT	presentation.description	Pour ne pas perturber les occupants des milieux naturels, mieux vaut se faire discret et ne pas laisser de traces de son passage.	\N	\N	\N	f
20154	1025	TEXT	action.title	Pour profiter de la nature sans déranger ses occupants 	\N	\N	\N	f
20155	1025	TEXT	understand.quote	Une tortue en ponte est très sensible au dérangement, cela peut la conduire à abandonner son nid. 	\N	\N	\N	f
20156	1025	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
20157	1025	TEXT	action.cards.0.description	Je reste à distance des animaux sauvages que je rencontre et je ne cherche pas à les toucher	\N	\N	\N	f
21525	1013	SELECT	presentation.sourceSelect	inpn	\N	\N	\N	f
21526	1013	TEXT	understand.text2	La taxonomie, ou taxinomie, est la science qui permet de décrire et de classer le vivant. L’espèce est l’unité taxonomique de base. Chaque espèce décrite est classée avec d’autres espèces aux caractéristiques communes au sein d’un même genre, puis d’une famille, d’un ordre, etc. Chaque espèce est identifiée par un nom scientifique latin en deux mots, par exemple *Pelecanus occidentalis* pour le Pelican brun. Cette dénomination en latin permet un référentiel mondial commun, car une même espèce peut posséder des dizaines de noms usuels différents (dits noms "vernaculaires") à travers le monde, selon les langues et les régions. 	\N	\N	\N	f
21527	1013	TEXT	understand.text1	Plus de 80 % des nouvelles découvertes d'espèces chaque année en France sont réalisées dans les territoires d'outre-mer. Certaines de ces nouvelles descriptions sont issues d’expéditions scientifiques, par exemple celles menées en Guyane en 2014 et en Nouvelle-Calédonie entre 2016 et 2019 par le Muséum national d’Histoire naturelle dans le cadre de la campagne « [la Planète revisitée](https://www.mnhn.fr/fr/recherche-expertise/lieux/planete-revisitee) », mais d’autres sont également réalisées par des taxonomistes non-professionnels. Il peut s'agir également d'espèces déjà décrites dans des territoires frontaliers mais dont la présence n'avait pas encore été observée sur le territoire national. Dans la plupart des cas, il s’agit de petits organismes invertébrés et d’organismes marins (insectes, mollusques, crustacés, vers marins).   \n  \nLe chiffre présenté ici représente une moyenne du nombre de découvertes par an sur les trois dernières années. 	\N	\N	\N	f
21528	1013	TEXT	territories.title	Nouvelles espèces décrites par an	\N	\N	\N	f
21529	1013	TEXT	understand.title1	L'outre-mer : un vivier d'espèces à découvrir	\N	\N	\N	f
23017	1005	LINK	onb.link	Retrouvez les indicateurs sur le site de l’ONB	\N	\N	https://naturefrance.fr/indicateurs	f
23018	1005	TEXT	inpn.description	L’INPN recense les espèces (animales, végétales et fongiques), les habitats naturels, les espaces protégés et le patrimoine géologique, en métropole et en outre-mer. L’ensemble des acteurs de l’environnement contribuent à la mise à jour régulière des informations sur le site de l’INPN dans le cadre du Système d’information de l’Inventaire national du patrimoine naturel (SINP). L’INPN met à disposition de tous des données de référence, validées par des réseaux d'experts. Le Muséum national d'Histoire naturelle en assure la responsabilité scientifique.	\N	\N	\N	f
23019	1005	IMAGE	image	\N	1016	Serpent liane perroquet © Raphaël Gailhac	\N	f
22445	1022	TEXT	events.8.description	Création du Conseil Scientifique Territorial du Patrimoine Naturel (CSTPN) et projet de Réserve naturelle nationale du Grand Colombier, gelé pour le moment	\N	\N	\N	f
22446	1022	TEXT	events.9.description	Ouverture de la maison de la nature et de l'environnement	\N	\N	\N	f
22447	1022	IMAGE	ecosystems.image	\N	1265	Paysage enneigé de Saint-Pierre-et-Miquelon © Bruno Letournel	\N	f
22448	1022	TEXT	identity.species	2 083	\N	\N	\N	f
22449	1022	IMAGE	ecosystems.ecosystems.0.image	\N	1264	Cap de Miquelon © Nathalie de Lacoste	\N	f
23020	1005	TEXT	questions.1.quote	Avec ses territoires d’outre-mer, la France a dont une responsabilité forte dans la conservation de la biodiversité mondiale.	\N	\N	\N	f
23021	1005	TEXT	questions.2.answer	De nombreux scientifiques alertent sur la crise de biodiversité actuelle, qui pourrait être la 6<sup>e</sup> extinction de masse à l’échelle des temps géologiques. En effet, le rythme actuel des disparitions d’espèces observé est 100 à 1000 fois supérieur au taux naturel de disparition ! On estime que près de la moitié des espèces vivantes pourrait disparaitre d’ici un siècle.\nLes activités humaines en sont les principales responsables. Cinq causes majeures sont identifiées, qui se conjuguent entre elles : destruction et fragmentation des milieux, surexploitation des espèces, pollutions, changements climatiques et introduction d’espèces exotiques envahissantes.	\N	\N	\N	f
23022	1005	TEXT	questions.0.answer	La biodiversité, ou diversité biologique, désigne la diversité des formes de vie sur terre, c’est à dire l’ensemble du tissu vivant de la planète : plantes, animaux, champignons, bactéries, etc. Elle est le produit de la lente évolution du monde du vivant, depuis les premiers organismes connus datant de 3,5 milliards d’années.\nElle comprend 3 niveaux de définition :\n    • La diversité des écosystèmes, c’est-à-dire des milieux de vie : océans, prairies, forêts, etc. jusqu’à l’échelle d’un organisme ou d’une cellule !\n    • La diversité des espèces qui vivent dans ces milieux, et sont en relation les unes avec les autres ;\n    • La diversité génétique, c’est-à-dire la diversité des individus au sein de ces espèces.\nDe nombreux biens et services indispensables aux activités humaines en dépendent : nourriture, pollinisation, médicaments, matières premières, fertilisation des sols, épuration de l’eau, etc. 	\N	\N	\N	f
23023	1005	TEXT	questions.0.quote	La biodiversité est encore largement méconnue : on connait seulement 1,8 million d’espèces sur une diversité estimée d’environ 100 millions d’espèces !	\N	\N	\N	f
21530	1013	TEXT	understand.paragraphs.1.text	Les estimations actuelles du nombre d'espèces présentes sur Terre oscillent entre 8 et 10 millions (hors bactéries), et seules un peu plus de 2 millions d'espèces ont été décrites à ce jour. A l’échelle mondiale, environ 20 000 nouvelles espèces sont décrites chaque année. Cette tâche titanesque est complexifiée par le manque de spécialistes qui s’y consacrent, en particulier chez les invertébrés. \nCependant, le travail de description morphologique est désormais accompagné de l’utilisation d’analyses ADN qui permettent de distinguer des espèces « cryptiques » c’est-à-dire très semblables morphologiquement mais en réalité différentes génétiquement, ce qui peut par exemple expliquer des différences d’adaptations aux conditions environnementales.	\N	\N	\N	f
21531	1013	TEXT	understand.title2	La taxonomie : la science de la description du vivant	\N	\N	\N	f
21532	1013	TEXT	presentation.descriptionTerritories	nouvelles espèces ont été décrites par an	\N	\N	\N	f
21533	1013	TEXT	understand.paragraphs.0.title	Quelques exemples de découvertes récentes	\N	\N	\N	f
21534	1013	TEXT	understand.keyword	especes	\N	\N	\N	f
21535	1013	TEXT	ecogestures.title	Comment aider à la progression des connaissances scientifiques ?	\N	\N	\N	f
21536	1013	IMAGE	presentation.image	\N	1050	© Fabien Lefebvre	\N	f
21537	1013	TEXT	understand.paragraphs.1.title	Encore un grand nombre d’espèces inconnues	\N	\N	\N	f
22450	1022	TEXT	species.8.name	Le Cerf de Virginie 	\N	\N	\N	f
20797	1011	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
20798	1011	TEXT	understand.text2	On qualifie de primaire, ou vierge, une forêt où aucune trace d’activité humaine (défrichement, exploitation, fragmentation), passée ou présente, n’est clairement visible et où les processus écologiques ne sont pas perturbés. A l’échelle mondiale, on estime que plus de 80 % des forêts primaires ont disparu, remplacées par des forêts secondaires moins riches écologiquement, et les reliquats sont de plus en plus réduits et fragmentés.  \n\nAvec plus de 90 % de forêts encore intactes, la Guyane présente l’un des territoires les plus vastes de forêts primaires encore préservées.\n	\N	\N	\N	f
20799	1011	TEXT	understand.text1	Les forêts primaires et autres écosystèmes forestiers des outre-mer présentent une biodiversité considérable. Les territoires ultramarins sont cependant très hétérogènes dans leur couverture forestière et leurs caractéristiques : des forêts tropicales humides de Guyane qui couvrent la quasi-totalité du territoire aux forêts boréales de conifères de Saint-Pierre-et-Miquelon, chaque territoire possède une couverture forestière et une biodiversité qui lui est propre. Seules les îles subantarctiques et la Terre Adélie ne présentent pas de forêts sur leurs territoires. 	\N	\N	\N	f
20800	1011	TEXT	territories.title	Pourcentage du territoire occupé par la forêt	\N	\N	\N	f
20801	1011	TEXT	understand.title1	Les forêts, un réservoir de biodiversité	\N	\N	\N	f
20693	1008	TEXT	understand.paragraphs.0.text	Le Tiaré Apetahi ([*Sclerotheca raiateensis*](https://inpn.mnhn.fr/espece/cd_nom/908708)) en Polynésie Française, le Colibri à tête bleue ([*Cyanophaia bicolor*](https://inpn.mnhn.fr/espece/cd_nom/441841)) en Martinique, le Gecko vert de Manapany ([*Phelsuma inexpectata*](https://inpn.mnhn.fr/espece/cd_nom/528679)) à La Réunion, le Cagou ([*Rhynochetos jubatus*](https://inpn.mnhn.fr/espece/cd_nom/442324)) en Nouvelle-Calédonie, ou encore le Choux de Kerguelen ([*Pringlea antiscorbutica*](https://inpn.mnhn.fr/espece/cd_nom/721546)) dans les îles subantarctiques, chaque territoire d'outre-mer possède de nombreuses espèces uniques. Largement couverte par la très riche forêt amazonienne, la Guyane compte près de 9 % d'espèces endémiques (ou sub-endémiques de la région du plateau des Guyanes). Seul Saint-Pierre-et-Miquelon ne compte aucune espèce connue spécifique au territoire, l'archipel étant très proche de Terre Neuve.\n\nOn trouve malheureusement un grand nombre d'espèces endémiques éteintes, comme le Solitaire de La Réunion ([*Threskiornis solitarius*](https://inpn.mnhn.fr/espece/cd_nom/432588)) (souvent confondu à tord avec le Dodo de l'île Maurice) ou l'Amazone de la Martinique ([*Amazona martinicana*](https://inpn.mnhn.fr/espece/cd_nom/655175)), tous deux disparus depuis la fin du 18e siècle. De nombreuses espèces se sont sans doute éteintes avant même d'avoir été découvertes.	\N	\N	\N	f
20694	1008	IMAGE	understand.image	\N	1037	Colibri à tête bleue, Martinique © Fabien Lefebvre	\N	f
20695	1008	TEXT	presentation.description	espèces d’outre-mer sont endémiques	\N	\N	\N	f
20696	1008	TEXT	presentation.logoUrl	https://naturefrance.fr/indicateurs/nombre-despeces-endemiques-de-france	\N	\N	\N	f
20802	1011	TEXT	understand.paragraphs.1.text	Au-delà de leur rôle pour la préservation de la biodiversité, les forêts nous fournissent de nombreux services écosystémiques : elles protègent par exemple les sols de l’érosion, préservent les ressources en eau et stockent le carbone. Elles permettent de se fournir en bois de construction et plantes médicinales, bien que ces ressources puissent être surexploitées. Les forêts ont également une grande importance culturelle dans les territoires d'outre-mer, dans les légendes, les arts et le bien-être de la population.\n\nElles sont cependant soumises à de nombreuses pressions : déboisement pour l’agriculture, l’exploitation du bois ou de mines, artificialisation du territoire, introduction d’espèces exotiques envahissantes, effets des changements climatiques, etc. 	\N	\N	\N	f
20803	1011	TEXT	understand.title2	Qu’est-ce qu’une forêt primaire ?	\N	\N	\N	f
20804	1011	TEXT	presentation.descriptionTerritories	du territoire est occupé par des forêts	\N	\N	\N	f
20805	1011	TEXT	understand.paragraphs.0.title	Pourquoi mesurer le taux de boisement ? 	\N	\N	\N	f
20806	1011	TEXT	understand.keyword	forets	\N	\N	\N	f
20807	1011	TEXT	ecogestures.title	Que puis-je faire pour préserver la biodiversité forestière ? 	\N	\N	\N	f
20808	1011	IMAGE	presentation.image	\N	1043	Fougères arborescentes, La Réunion © Philippe Gourdain	\N	f
20809	1011	TEXT	understand.paragraphs.1.title	Des services écosystémiques et une valeur patrimoniale	\N	\N	\N	f
22451	1022	TEXT	events.6.description	Disparition de l’archipel du Lagopède des saules (*Lagopus lagopus*), oiseau caractéristique des forêts boréales	\N	\N	\N	f
20173	1028	IMAGE	presentation.file	\N	1141	test	\N	f
20174	1028	IMAGE	action.cards.2.icon	\N	1145	bagages	\N	f
20175	1028	TEXT	presentation.name	Je ne participe pas à l’exploitation des espèces protégées	\N	\N	\N	f
20176	1028	IMAGE	action.cards.0.icon	\N	1143	pêche	\N	f
20810	1011	TEXT	understand.paragraphs.0.text	La destruction des forêts est reconnue comme une pression majeure sur la biodiversité, le suivi du taux de boisement permet de suivre l’évolution de cette pression, et donc indirectement l’état de la biodiversité forestière. Sont exclues de ce calcul les forêts urbaines ou à vocation agricole.\n\nDepuis 1990, le taux de boisement reste pour le moment globalement stable pour les outre-mer français. Cependant, cet indicateur a des limites : il nous donne une indication sur la surface, mais ne renseigne pas sur le bon état écologique de ces forêts.  	\N	\N	\N	f
20811	1011	IMAGE	understand.image	\N	1046	Forêt de Morne-Rouge, Martinique ©  G. Gigot	\N	f
20812	1011	TEXT	presentation.description	du territoire d’outre-mer est occupé par des forêts	\N	\N	\N	f
20813	1011	TEXT	presentation.logoUrl	https://naturefrance.fr/indicateurs/taux-de-boisement-dans-les-outre-mer	\N	\N	\N	f
21538	1013	TEXT	understand.paragraphs.0.text	Parmi les espèces récemment décrites dans les territoires d’outre-mer français, se trouvent par exemple une nouvelle espèce de grenouille, la Rainette *Boana courtoisae* en Guyane, un serpent fouisseur, *Madatyphlops eudelini*, à Mayotte ou encore *[Psychotria paulae](https://inpn.mnhn.fr/espece/cd_nom/851490)*, une plante extrêmement rare, endémique de Tahiti (Polynésie française).  \n  \nCes découvertes sont parfois réalisées parmi les spécimens conservés dans des musées, collectés depuis longtemps sans avoir été correctement identifiés. Malheureusement, il arrive qu’il s’agisse d’espèces déjà éteintes dans la nature, c’est par exemple le cas en Guadeloupe du lézard  *Leiocephalus roquetus* décrit en 2021. 	\N	\N	\N	f
21539	1013	IMAGE	understand.image	\N	1052	Tri à la loupe binoculaire d’échantillons récoltés sur le terrain ©  T. Magniez/MNHN/PNI	\N	f
21540	1013	TEXT	presentation.description	nouvelles espèces décrites par an en outre-mer	\N	\N	\N	f
21541	1013	TEXT	presentation.logoUrl	https://inpn.mnhn.fr/docs/communication/livretInpn/Livret-INPN-especes-2020.pdf	\N	\N	\N	f
23024	1005	TEXT	questions.1.answer	La majorité des territoires d’outre-mer français sont situés dans des régions particulièrement riches en espèces, notamment en espèces endémiques, ce qu’on appelle des points chauds de la biodiversité (« Hotspots » en anglais) (Nouvelle-Calédonie, Antilles, Mayotte, La Réunion, Wallis et Futuna, Polynésie française). Avec la Guyane, la France possède une partie du plus grand massif forestier de la planète, l’Amazonie, et les territoires français réunissent 10 % des récifs coralliens répartis dans trois océans. Certains territoires isolés comme les îles subantarctiques abritent une faune et une flore adaptées à des climats extrêmes. 	\N	\N	\N	f
23025	1005	TEXT	inpn.title	L'Inventaire national du patrimoine naturel	\N	\N	\N	f
23026	1005	TEXT	questions.2.question	La biodiversité menacée	\N	\N	\N	f
23027	1005	TEXT	onb.description	Depuis 2012, l’Observatoire national de la biodiversité, actuellement piloté par l’Office français pour la biodiversité (OFB), publie des indicateurs sur l’état de la biodiversité française, avec la contribution de nombreux partenaires. Ils sont régulièrement actualisés et enrichis.\nLe Compteur met en lumière les indicateurs de l’ONB qui concernent les outre-mer et contribue à la création de nouveaux indicateurs pour ces territoires.	\N	\N	\N	f
21777	1010	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
21778	1010	TEXT	understand.text2	Chaque espèce est évaluée par un groupe d’experts selon des critères bien définis tels que la taille de la population, son aire de distribution ou encore la disparition de son habitat naturel, pour pouvoir lui attribuer une catégorie. \nLe chiffre présenté ici comprend les espèces classées dans les catégories « éteinte au niveau mondial », « éteinte à l’état sauvage », «&nbsp;disparue au niveau régional », « en danger critique d’extinction », « en danger » et «&nbsp;vulnérable » dans les Listes rouges réalisées en outre-mer.  \n\nIl faut noter qu’une espèce peut être classée menacée sur le territoire national mais pas à l’échelle mondiale si son statut est bon dans d’autres pays, cependant on trouve en outre-mer de nombreuses espèces [endémiques](https://preprod.biodiversite-outre-mer.fr/indicateurs/especes-endemiques) qui ne sont présentes nulle part ailleurs dans le monde.	\N	\N	\N	f
21779	1010	TEXT	understand.text1	L'Union internationale pour la conservation de la nature (UICN) développe depuis 1964 un outil de référence permettant de mesurer l'état de conservation de la faune et de la flore mondiale : la Liste rouge. Les espèces y sont classifiées par catégories selon leur degré de vulnérabilité. Cela permet d'identifier les priorités d'action, les progrès accomplis ou les défis à relever pour la conservation des espèces.  \n  \nEn France, l'élaboration de la [Liste rouge nationale des espèces menacées](https://inpn.mnhn.fr/programme/listes-rouges-especes/presentation) est mise en œuvre depuis 2008 par le Muséum national d'Histoire naturelle, l'Office français de la biodiversité et le Comité français de l'UICN, en collaboration avec un large réseau d'experts.\n\n	\N	\N	\N	f
21780	1010	TEXT	territories.title	Pourcentage d'espèces menacées	\N	\N	\N	f
23028	1005	TEXT	understand.description	La conservation de la biodiversité dépend de sa connaissance et de la compréhension des phénomènes qui l’impactent. Les indicateurs sont développés à partir de données de suivis et de mesures sur le terrain, et permettent de suivre l’évolution de l’état de santé de la biodiversité et de l’environnement. Ils sont utilisés pour définir des stratégies de gestion ou encore mesurer l'efficacité des plans de gestion d'espèces menacées.  Cependant, ils connaissent des limites par manque de données disponibles, manque de moyens de recherche ou parce que certains paramètres sont très complexes à évaluer.	\N	\N	\N	f
23029	1005	TEXT	title	Compter la biodiversité : oui, mais comment ? 	\N	\N	\N	f
23030	1005	TEXT	onb.title	L’Observatoire national de la biodiversité	\N	\N	\N	f
23031	1005	TEXT	presentation	Les indicateurs sont des outils qui permettent de de décrire différentes composantes de la biodiversité et ainsi mesurer son évolution dans le temps. De nombreux paramètres sont étudiés : taille des populations, état de santé des écosystèmes, taux de pollutions, etc. Ils renseignent ainsi l’état de la biodiversité à un instant précis, mais également l’état des connaissances et des moyens scientifiques actuels. Avec ses collaborateurs, le Compteur vise aussi à développer de nouveaux indicateurs ou chiffres clés sur la biodiversité ultramarine, qui viendront peu à peu enrichir le dispositif.	\N	\N	\N	f
23032	1005	TEXT	quote	Documenter et présenter l’évolution de la biodiversité, c’est permettre à chacun de prendre conscience des enjeux et des menaces.	\N	\N	\N	f
23033	1005	CHECKBOX	shadowed	false	\N	\N	\N	f
23034	1005	IMAGE	understand.image	\N	1017	Héron vert (*Butorides virecens*), Guadeloupe © Olivier Delzons	\N	f
23035	1005	TEXT	questions.0.question	Qu’est-ce que la biodiversité ?	\N	\N	\N	f
23036	1005	LINK	inpn.link	Visitez le site de l'INPN	\N	\N	https://inpn.mnhn.fr/	f
23037	1005	TEXT	questions.2.quote	L'érosion de la biodiversité est une menace pour l'avenir de l'humanité.	\N	\N	\N	f
23038	1005	TEXT	understand.title	Les indicateurs, des outils pour évaluer la biodiversité	\N	\N	\N	f
23039	1005	TEXT	questions.1.question	Les outre-mer, des points chauds de biodiversité	\N	\N	\N	f
21781	1010	TEXT	understand.title1	La Liste rouge de l'UICN	\N	\N	\N	f
21782	1010	TEXT	understand.paragraphs.1.text	Selon l'IPBES*, les cinq facteurs directs de changement qui affectent la nature et qui ont les plus forts impacts à l’échelle mondiale sont, dans l'ordre : les changements d’usage des terres et de la mer, l'exploitation directe de certains organismes, le changement climatique, les pollutions et les espèces exotiques envahissantes. Les impacts de ces différents facteurs sont souvent liés et s'additionnent : l'installation de certaines espèces exotiques peut par exemple être facilitée par les changements climatiques. Dans les îles, les espèces exotiques envahissantes seraient le premier facteur de perte de biodiversité. \n\n*la Plateforme intergouvernementale scientifique et politique sur la biodiversité et les services écosystémiques (en anglais IPBES) est un groupement international d'experts de la biodiversité, créé sous l'égide de l'ONU en 2012. L'IPBES a publié le 6 mai 2019 [le premier rapport d'évaluation mondiale sur la biodiversité et les services écosystémiques](https://www.ipbes.net/news/Media-Release-Global-Assessment-Fr). 	\N	\N	\N	f
21783	1010	TEXT	understand.title2	Plusieurs catégories de risque d’extinction	\N	\N	\N	f
21784	1010	TEXT	presentation.descriptionTerritories	des espèces sont considérées comme éteintes ou menacées	\N	\N	\N	f
21785	1010	TEXT	understand.paragraphs.0.title	Encore beaucoup d'évaluations à réaliser	\N	\N	\N	f
21786	1010	TEXT	understand.keyword	menaces	\N	\N	\N	f
21787	1010	TEXT	ecogestures.title	Que puis-je faire pour protéger les espèces menacées ?	\N	\N	\N	f
21788	1010	IMAGE	presentation.image	\N	1041	Albatros hurleur © Julie Tucoulet	\N	f
21789	1010	TEXT	understand.paragraphs.1.title	Quelles menaces pèsent sur les espèces ?	\N	\N	\N	f
22452	1022	TEXT	events.6.date	1985	\N	\N	\N	f
22453	1022	TEXT	events.4.description	Introduction volontaire du Lièvre d’Amérique pour la chasse	\N	\N	\N	f
22454	1022	TEXT	events.5.description	Introduction du Cerf de Virginie en 1953 à des fins cynégétiques	\N	\N	\N	f
22455	1022	TEXT	interests.locations.2.name	Le Grand Colombier	\N	\N	\N	f
20177	1028	IMAGE	presentation.image	\N	1142	© Fabien Lefebvre	\N	f
20178	1028	TEXT	understand.text	Bois précieux, espèces aux propriétés médicinales, chasse et pêche, nouveaux animaux de compagnie… L'exploitation illégale conduit à la réduction des populations de nombreuses espèces animales et végétales, voire à leur extinction, dans tous les territoires.\n\nLes tortues marines sont particulièrement victimes du braconnage, pour la consommation de leur viande. Si le phénomène est marqué à Mayotte, où plusieurs centaines de tortues sont encore braconnées chaque année lorsqu'elles viennent pondre sur les plages, on observe encore des captures illégales de tortues dans les collectivités des Caraïbes, en Guyane ou en Polynésie française.\n\nA La Réunion, des pêcheurs illégaux dans la Réserve marine sont régulièrement appréhendés de nuit avec des poissons et des langoustes. Sur terre, c'est notamment le Palmiste rouge, endémique du territoire, qui fait l'objet d'une exploitation illégale dans le Parc National.\nAutre exemple en Martinique, où les oursins blancs sont ramassés illégalement, parfois par centaines de kilos, alors que leur pêche n'est autorisée que quelques jours par an et uniquement réservée aux professionnels déclarés. En Guyane, oiseaux et reptiles font également l'objet de trafics.\n\nDes peines de prisons et de lourdes amendes sont régulièrement prononcées contre les braconniers. Pour ne pas conduire à l'extinction des espèces menacées, ne participons pas au trafic illégal d'espèces protégées.	\N	\N	\N	f
20179	1028	IMAGE	action.cards.1.icon	\N	1144	informations	\N	f
20180	1028	TEXT	action.cards.2.description	Je ne rapporte pas d’animaux ou de végétaux dans mes bagages.	\N	\N	\N	f
20181	1028	TEXT	presentation.category	Protéger les espèces	\N	\N	\N	f
20182	1028	TEXT	action.cards.1.description	Je me renseigne sur la provenance de ce que j’achète et je n'accepte pas de produits issus de l'exploitation illégale. 	\N	\N	\N	f
20183	1028	TEXT	presentation.description	Malgré des règlementations qui les protègent, certaines espèces menacées font toujours l’objet de braconnage et d’exploitation illégales.	\N	\N	\N	f
20184	1028	TEXT	action.title	Pour ne pas être complice de l’exploitation d’espèces protégées :	\N	\N	\N	f
20185	1028	TEXT	understand.quote	Certaines espèces peuvent toujours être exploitées ou chassées, mais les règlementations et les quotas doivent être respectés afin de permettre à la ressource de se renouveler durablement.	\N	\N	\N	f
20186	1028	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
20187	1028	TEXT	action.cards.0.description	Je respecte les règlementations de pêche (matériel, technique, zone d'exclusion,...) et ne prélève pas plus qu’autorisé. 	\N	\N	\N	f
21790	1010	TEXT	understand.paragraphs.0.text	De nombreuses espèces ne sont pas encore évaluées ou sont classées dans la catégorie « données insuffisantes ». C’est le cas par exemple pour de nombreux invertébrés, les champignons, ou encore les lichens et mousses, qui sont pourtant essentiels au bon fonctionnement des écosystèmes. Les espèces marines souffrent également d'un important déficit d'évaluations. \nLes chiffres présentés dans les Listes rouges ne sont donc pas exhaustifs, ils se précisent régulièrement au fur et à mesure de l’amélioration des connaissances scientifiques et de la parution de nouveaux travaux.  \n\nDe nombreux territoires d'outre-mer ont développé des Listes rouges à l'échelle de leur territoire, mais certains, comme Saint-Pierre-et-Miquelon ou Wallis-et-Futuna sont trop petits pour que l'application de cette méthodologie soit pertinente à cette échelle.  	\N	\N	\N	f
21791	1010	IMAGE	understand.image	\N	1042	Tortue luth © Raphael Gailhac	\N	f
21792	1010	TEXT	understand.paragraphs.2.title	Des programmes de conservation pour les espèces les plus menacées	\N	\N	\N	f
21793	1010	TEXT	understand.paragraphs.2.text	De nombreux programmes sont mis en place pour tenter de protéger les espèces menacées. Ils visent à organiser des suivis des populations, mettre en œuvre des actions favorables à la restauration de ces populations ou de leur habitat, informer le public et les élus et faciliter l'intégration de la protection de ces espèces dans les politiques publiques.   \n\nParmi ces outils, on trouve notamment les [Plans nationaux d’actions](https://www.ecologie.gouv.fr/plans-nationaux-dactions-en-faveur-des-especes-menacees) qui concernent de nombreuses espèces d’outre-mer telles que l’Albatros d’Amsterdam (TAAF), le Gecko vert de Manapany et le Bois de Papaye (La Réunion), l’Iguane des Petites Antilles (Antilles françaises), les tortues marines (Antilles françaises, Guyane et océan Indien) ou encore le Crabier Blanc (Mayotte). \nLa Commission européenne soutient également des programmes de conservation des espèces et des habitats via son programme de financements LIFE, par exemple le [LIFE+ Pétrels](https://www.petrels.re/) (La Réunion), le [LIFE+ BIODIV'OM](https://www.lifebiodivom.fr/) (5 espèces et un habitat, 5 territoires concernés : Mayotte, Guyane, Saint-Martin, Martinique, La Réunion) ou encore le [LIFE+ Forêt Sèche](https://www.foretseche.re/) (La Réunion).  \n\nIl existe encore bien d'autres initiatives comme un Plan d’action pour la sauvegarde du Cagou (Nouvelle-Calédonie), le [Plan de conservation en faveur des puffins de l'île de La Réunion](http://www.reunion.developpement-durable.gouv.fr/IMG/pdf/pdc_puffins_ld_interactif.pdf) ou différents programmes de conservation des [oiseaux menacés de Polynésie française](https://www.manu.pf/nos-actions/).	\N	\N	\N	f
21794	1010	TEXT	presentation.description	des espèces d’outre-mer sont considérées comme éteintes ou menacées	\N	\N	\N	f
21795	1010	TEXT	presentation.logoUrl	https://naturefrance.fr/indicateurs/proportion-despeces-eteintes-ou-menacees-dans-la-liste-rouge-nationale	\N	\N	\N	f
21542	1019	TEXT	presentation.title	Faire progresser ensemble les connaissances	\N	\N	\N	f
21543	1019	TEXT	examples.projects.2.subject	Espèces marines	\N	\N	\N	f
21544	1019	TEXT	examples.title	Quelques exemples de programmes participatifs	\N	\N	\N	f
21545	1019	TEXT	examples.projects.0.title	La photo-identification des tortues marines à La Réunion	\N	\N	\N	f
21546	1019	TEXT	examples.projects.0.subject	Suivi individuel des tortues marines	\N	\N	\N	f
21547	1019	LINK	examples.projects.3.more	En savoir plus	\N	\N	https://www.facebook.com/paladalik/	f
21548	1019	TEXT	examples.projects.4.subject	Insectes lumineux	\N	\N	\N	f
21549	1019	TEXT	examples.projects.3.title	Le Réseau d’observation des récifs coralliens (RORC) de Nouvelle-Calédonie	\N	\N	\N	f
21550	1019	TEXT	examples.projects.1.actor	Groupe d’étude et de protection des oiseaux de Guyane (GEPOG)	\N	\N	\N	f
21551	1019	IMAGE	examples.projects.1.image	\N	1082	Tangara évêque © P. Ingremeau 	\N	f
21552	1019	IMAGE	images.2.image	\N	1087	© Riccardo.salvini  / CC BY 4.0 	\N	f
21553	1019	IMAGE	examples.projects.4.image	\N	1248	Image provisoire	\N	f
21554	1019	TEXT	paragraphs.0.text	Il s’agit de projet d’inventaires et de signalements destinés aux amateurs sachant identifier les taxons observés. Les débutants y sont les bienvenus.\nL’objet principal est de partager de la connaissance, les données seront éventuellement mobilisables a posteriori dans un projet de recherche ou dans un objectif de conservation.	\N	\N	\N	f
21555	1019	TEXT	examples.projects.2.description	S’appuyer sur les observations de tous les usagers de la mer pour mieux comprendre le milieu marin mahorais, c’est l’objectif du programme TsiÔno, « J’ai vu » en shimaoré.  \nLe projet vise à préciser les inventaires des espèces et leur répartition, suivre les habitudes de certains individus pour 6 espèces cibles (dont la Baleine à bosse et le Dugong) et alerter sur la présence de phénomènes anormaux, comme la prolifération d’espèces envahissantes ou le blanchissement de coraux. Des supports pédagogiques permettent aux observateurs de s’exercer à la reconnaissance des espèces du lagon. 	\N	\N	\N	f
21556	1019	LINK	examples.projects.2.more	En savoir plus	\N	\N	https://www.tsiono.fr/ 	f
21557	1019	TEXT	examples.projects.0.description	Développé par Kelonia, l’observatoire des tortues marines de La Réunion, pour contribuer à la compréhension de la biologie des tortues marines, ce programme invite les plongeurs à envoyer photos et observations du comportement des individus rencontrées. L'identification de chaque tortue repose sur la configuration unique des écailles de sa tête.	\N	\N	\N	f
21796	1014	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
22456	1022	TEXT	ecosystems.ecosystems.3.description	Espèces pionnières et graminées colonisent ces milieux littoraux souvent fragilisés par les dégradations (travaux, incendies, pâturages). Espèce typique de ces milieux dunaires, l’oyat (ou Ammophile à ligule courte, *Ammophila breviligulata*) joue un rôle essentiel dans la fixation des dunes et limite l’érosion. En arrière dune, une grande diversité d’espèces indigènes, parfois très rares, cohabitent avec des graminées introduites et naturalisées.	\N	\N	\N	f
22457	1022	TEXT	ecosystems.ecosystems.4.description	« *Les Laminaires sont à la mer ce que la forêt est à la terre* » Daniel Abraham, naturaliste de l'archipel.\n\nFormant de véritables forêts sous-marines, ces grandes algues brunes jouent un rôle très important dans l’équilibre de l’océan, formant un habitat pour de nombreuses espèces animales et végétales. Elles contiennent également des composants utilisés dans le monde en pharmacologie ou agro-alimentaire.	\N	\N	\N	f
22458	1022	TEXT	ecosystems.ecosystems.4.name	Les forêts de laminaires	\N	\N	\N	f
22459	1022	IMAGE	species.1.image	\N	1229	Macareux moine © Bruno Letournel	\N	f
22460	1022	TEXT	events.5.date	1953	\N	\N	\N	f
20201	1024	IMAGE	presentation.file	\N	1121	test	\N	f
20202	1024	IMAGE	action.cards.2.icon	\N	1124	relaché	\N	f
22461	1022	TEXT	identity.marineArea	12 300	\N	\N	\N	f
22462	1022	TEXT	events.8.date	2007	\N	\N	\N	f
22463	1022	IMAGE	interests.locations.0.image	\N	1217	Grand Barachois © Nathalie De Lacoste	\N	f
21797	1014	TEXT	understand.text2	Cet indicateur présente l’évolution du recouvrement en corail vivant sur des stations réparties dans les différents territoires d’outre-mer. La situation est en réalité très hétérogène selon les collectivités : les récifs sont ainsi très dégradés en Martinique et Guadeloupe, mais beaucoup moins à Wallis-et-Futuna ou Mayotte. La situation est considérée comme stable pour 60 % des stations étudiées.  \n\nCet indicateur a cependant des limites, par exemple, le nombre de stations évaluées reste faible : on compte 82 stations évaluées sur plus de 600 existantes. De plus, il se base uniquement sur le caractère vivant du corail, mais pas sur les espèces de coraux présentes, ni les communautés associées (poissons, invertébrés). Des analyses plus complètes et plus fines sont nécessaires afin de bien comprendre l’évolution de l’état de santé des récifs coralliens.	\N	\N	\N	f
21798	1014	TEXT	understand.text1	Les récifs coralliens sont formés par des colonies de coraux, formées de polypes (petits organismes invertébrés de la même famille que les méduses) sécrétant un squelette calcaire, et vivant en symbiose avec des algues unicellulaires, les zooxanthelles, qui leur apportent des nutriments grâce à la photosynthèse.\nPoissons, crustacés, mollusques, concombres de mer, éponges... les récifs coralliens sont des écosystèmes extrêmement riches en biodiversité, ils représentent une zone de nourrissage, de refuge et de nurserie pour des milliers d'espèces marines.  \n \n10 % des récifs coralliens mondiaux sont situés dans les territoires d’outre-mer français, la France a donc une responsabilité importante à l’échelle mondiale sur la conservation des récifs coralliens.	\N	\N	\N	f
21799	1014	TEXT	territories.title	Pourcentage de surface des récifs coralliens en diminution	\N	\N	\N	f
21800	1014	TEXT	understand.title1	Le corail, constructeur du récif	\N	\N	\N	f
21801	1014	TEXT	understand.paragraphs.1.text	Créée en 1999, l’[Initiative française pour les récifs coralliens (IFRECOR)](https://ifrecor.fr/) agit pour protection et la gestion durable des récifs coralliens, des herbiers et des mangroves dans les collectivités françaises d’outre-mer. Chaque collectivité abritant ces écosystèmes possède un comité local rassemblant les acteurs concernés par leur protection et leur gestion durable. L’initiative collective porte un plan d'action sur 5 ans qui couvre 6 axes stratégiques : planifier pour prévenir ; réduire les effets négatifs dus aux activités humaines, tout en assurant leur développement durable ; connaître et comprendre pour gérer ; informer et éduquer pour modifier les comportements ; développer les échanges et la coopération pour renforcer les synergies et valoriser les expériences. \n  \nDéclinaison française de l’Initiative internationale pour les récifs coralliens (ICRI), l’IFRECOR représente les territoires français au niveau international. Elle est présidée par les ministres de la transition écologique et des outre-mer, dont les services assurent le secrétariat.	\N	\N	\N	f
21802	1014	TEXT	understand.title2	Un état de santé hétérogène selon les territoires	\N	\N	\N	f
21803	1014	TEXT	presentation.descriptionTerritories	des récifs coralliens sont en diminution	\N	\N	\N	f
21804	1014	TEXT	understand.paragraphs.0.title	Les coraux en danger 	\N	\N	\N	f
21805	1014	TEXT	understand.keyword	corail	\N	\N	\N	f
21806	1014	TEXT	ecogestures.title	Comment préserver les coraux à mon échelle ? 	\N	\N	\N	f
22464	1022	TEXT	species.6.name	La Linnée boréale	\N	\N	\N	f
22465	1022	IMAGE	interests.locations.3.image	\N	1236	La Vallée du Milieu © Nathalie De Lacoste	\N	f
22466	1022	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
22467	1022	TEXT	interests.locations.3.name	La Vallée du Milieu	\N	\N	\N	f
22468	1022	TEXT	statistics.1.text	des habitants de l'archipel résident à Saint-Pierre	\N	\N	\N	f
22469	1022	TEXT	events.9.date	2017	\N	\N	\N	f
22470	1022	IMAGE	species.4.image	\N	1223	Sapin Baumier © Nathalie De Lacoste	\N	f
21558	1019	TEXT	examples.projects.4.description	Relai guadeloupéen de l’Observatoire des vers luisants et lucioles, l’observatoire Ti bèt a limiè a commencé ses activités en 2019. Les participants sont invités à faire remonter leurs observations de plusieurs espèces d’insectes lumineux (lucioles et taupins), afin de mieux connaitre leur biologie et leur écologie, identifier les facteurs favorisant leur présence ou leur régression et sensibiliser la population à leur maintien.	\N	\N	\N	f
21559	1019	IMAGE	images.1.image	\N	1079	© Steveprutz / CC BY 3.0	\N	f
21560	1019	TEXT	examples.projects.3.description	Sur les côtes néo-calédoniennes, plus de 80 stations coraliennes sont suivies annuellement selon une méthodologie appliquée par le réseau international [Reef Check](https://www.reefcheck.fr). Les observations protocolées sont réalisées sur quatre compartiments de l'environnement récifal (habitats, poissons, macro-invertébrés et perturbations du récif) pour évaluer sont état de santé. L'association Pala Dalik assure l’animation, la coordination et la formation des participants sur l'ensemble des trois provinces. 	\N	\N	\N	f
21561	1019	TEXT	examples.projects.2.actor	Parc marin de Mayotte	\N	\N	\N	f
21562	1019	LINK	examples.projects.4.more	En savoir plus	\N	\N	https://www.anbaloup-la.fr/observatoire-lucioles/	f
22471	1022	TEXT	events.3.date	1866	\N	\N	\N	f
22472	1022	IMAGE	ecosystems.ecosystems.3.image	\N	1220	Dunes de sable sur l'isthme © Nathalie de Lacoste	\N	f
22473	1022	IMAGE	species.3.image	\N	1226	Pluvier siffleur en période de reproduction © Patrick Hacala	\N	f
22474	1022	TEXT	species.1.name	Le Macareux moine 	\N	\N	\N	f
22475	1022	TEXT	species.7.name	Les Botryches	\N	\N	\N	f
22476	1022	TEXT	interests.title	Lieux d’intérêt	\N	\N	\N	f
22477	1022	TEXT	species.4.name	Le Sapin baumier	\N	\N	\N	f
20203	1024	TEXT	presentation.name	Je protège les milieux contre l’introduction d’espèces exotiques envahissantes	\N	\N	\N	f
20204	1024	IMAGE	action.cards.0.icon	\N	1122	Planter	\N	f
20205	1024	IMAGE	presentation.image	\N	1120	© Hans-Jörg Hellwig / CC BY-SA 3.0	\N	f
22478	1022	TEXT	identity.area	242	\N	\N	\N	f
22479	1022	TEXT	species.0.description	Une vingtaine d'espèces de mammifères marins fréquentent les eaux de Saint-Pierre et Miquelon, dont deux espèces de phoques : le Phoque veau-marin ([*Phoca vitulina*](https://inpn.mnhn.fr/espece/cd_nom/60811)) et le Phoque gris ([*Halichoerus grypus*](https://inpn.mnhn.fr/espece/cd_nom/60776)). C’est sur les bancs de sable de la lagune du Grand Barachois qu’ils se regroupent en plus grand nombre, mais peuvent être observés partout sur les côtes de l’archipel.\n\nStatut dans la Liste rouge mondiale : préoccupation mineure pour les deux espèces. 	\N	\N	\N	f
22480	1022	TEXT	identity.highestPointName	Morne de la Grande Montagne	\N	\N	\N	f
22481	1022	TEXT	ecosystems.ecosystems.2.name	La forêt boréale 	\N	\N	\N	f
22482	1022	TEXT	species.7.description	Dans les pelouses sableuses d’arrière dune se cachent plusieurs espèces rares de botryches, comme le Botryche à feuille de Matricaire ([*Botrychium matricariifolium*](https://inpn.mnhn.fr/espece/cd_nom/86186\n)). Il s’agit de petites fougères vivaces dont le nom provient du grec « botrus » signifiant grappes, qui se réfère à l’aspect de ses fructifications.  \n  \nStatut dans la Liste rouge mondiale : espèce non évaluée (pour *Botrychium matricariifolium*). 	\N	\N	\N	f
22483	1022	TEXT	species.8.description	Peu de mammifères terrestres sont indigènes de l’archipel. Le Cerf de Virginie ([*Odocoileus virginianus*](https://inpn.mnhn.fr/espece/cd_nom/645125\n)) a été introduit à Miquelon et Langlade en 1953 pour la chasse. Grâce à leurs importantes capacités d’adaptation et à l’absence de prédateur naturel, les populations de cerfs se sont largement développées et freinent désormais fortement la régénération de la forêt boréale. L’espèce n'est pas présente sur l’île de Saint-Pierre. \n  \nStatut dans la Liste rouge mondiale : préoccupation mineure.	\N	\N	\N	f
22484	1022	IMAGE	species.2.image	\N	1228	Lièvre arctique © Daniel Koelsch	\N	f
22485	1022	IMAGE	ecosystems.ecosystems.4.image	\N	1215	Image manquante	\N	f
22486	1022	TEXT	species.3.description	Le Pluvier siffleur ([*Charadrius melodus*](https://inpn.mnhn.fr/espece/cd_nom/441752\n)) est un petit oiseau limicole, dont la couleur du plumage se confond avec le sable et les graviers des plages où il se nourrit et niche. Il est actuellement le limicole nicheur le plus menacé dans l'archipel, à cause du dérangement important causé par l’activité humaine au niveau de l’isthme entre Miquelon et Langlade, site à haute fréquentation locale et touristique pendant l’été. Faute de dispositifs de protection efficaces la dernière nichée observée en 2019 a été un échec, et un seul individu a été observé en 2020.  \n  \nStatut dans la Liste rouge mondiale : quasi menacé. 	\N	\N	\N	f
22487	1022	TEXT	species.1.description	Le Macareux moine ([*Fratercula arctica*](https://inpn.mnhn.fr/espece/cd_nom/3402\n)) est l’une des plus importantes populations d’oiseaux nicheurs de l’archipel, avec environ 10 000 couples présents sur l'îlot du Grand Colombier.\n\nStatut dans la Liste rouge mondiale : vulnérable. 	\N	\N	\N	f
22488	1022	TEXT	species.2.description	Le Lièvre américain ([*Lepus americanus*](https://inpn.mnhn.fr/espece/cd_nom/456604\n)) et le Lièvre arctique ([*Lepus arcticus*](https://inpn.mnhn.fr/espece/cd_nom/61707\n)) ont été introduits pour la chasse respectivement en 1881 et 1982. Présents sur les trois îles, ils occupent des milieux différents : le Lièvre américain se concentre dans les milieux forestiers, sur lesquels il exerce une pression non négligeable, tandis que le Lièvre arctique préfère la végétation de la toundra, formée d’arbustes à éricacées, de lichens et de mousses.  \n  \nStatut dans la Liste rouge mondiale : préoccupation mineure pour les deux espèces. 	\N	\N	\N	f
22489	1022	TEXT	statistics.1.number	86 %  	\N	\N	\N	f
22490	1022	TEXT	statistics.0.number	La seule 	\N	\N	\N	f
22491	1022	TEXT	statistics.2.number	1 000	\N	\N	\N	f
22492	1022	IMAGE	interests.locations.4.image	\N	1235	Saint-Pierre © Laurent Malthieux	\N	f
22493	1022	TEXT	species.2.name	Les lièvres	\N	\N	\N	f
20206	1024	TEXT	understand.text	Les espèces introduites par l’homme hors de leur territoire d’origine peuvent se développer de manière importante dans leur milieu d’introduction et [menacer la biodiversité locale](https://preprod.biodiversite-outre-mer.fr/indicateurs/especes-exotiques-envahissantes). Certaines espèces peuvent également avoir des conséquences économiques et sanitaires importantes.\n\nDes animaux de compagnie qui s'échappent ou sont lâchés volontairement dans la nature lorsque leurs propriétaires ne souhaitent pas les garder, c'est l'origine de l'introduction de nombreuses espèces animales exotiques aujourd'hui problématiques, par exemple les Tortues de Floride et autres reptiles, les poissons d'aquarium comme le Guppy ou le Poisson-zèbre ou encore des oiseaux comme le Bulbul Orphée ou le Rossignol du Japon.\n\nDes nombreuses espèces végétales importées ont été plantées dans les parcs et les  jardins pour leur intérêt esthétique, mais certaines n'ont pas tardé à se disperser largement dans les milieux naturels, et à entrer en compétition avec les espèces végétales locales.\n\nDes règlementations, plus ou moins strictes selon les territoires, existent désormais pour limiter l'introduction d'espèces potentiellement envahissantes, en particulier sur les territoires insulaires.	\N	\N	\N	f
22494	1022	TEXT	species.4.description	Le Sapin baumier ([*Abies balsamea*](https://inpn.mnhn.fr/espece/cd_nom/717022\n)) est le conifère dominant de la forêt boréale de Saint-Pierre-et-Miquelon (plus de 80% du peuplement). Caractéristique des forêts boréales nord-américaines, il est parfois accompagné d’autres conifères moins fréquents (Epicéa blanc, Epicéa noir, Mélèze laricin…). En plus de subir des attaques fréquentes de pestes forestières indigènes, il est actuellement menacé par un parasite introduit : le puceron lanigère ([*Adelges piceae*](https://inpn.mnhn.fr/espece/cd_nom/893616\n)).\n\nStatut dans la Liste rouge mondiale : préoccupation mineure. 	\N	\N	\N	f
22495	1022	TEXT	ecosystems.ecosystems.0.name	Les landes et la toundra	\N	\N	\N	f
22496	1022	TEXT	species.5.description	La Diapensine de Laponie ([*Diapensia lapponica*](https://inpn.mnhn.fr/espece/cd_nom/761885\n)) est une plante typique de la toundra arctico-alpine de l’archipel. Sa forme en coussinet est adaptée aux conditions climatiques très ventées de ce milieu.\n\nStatut dans la Liste rouge mondiale : espèce non évaluée. 	\N	\N	\N	f
22497	1022	TEXT	species.6.description	Reconnaissable à sa floraison en clochettes roses, la Linnée boréale ([*Linnaea borealis*](https://inpn.mnhn.fr/espece/cd_nom/106260\n)) est une herbacée abondante dans la forêt boréale.  \n  \nStatut dans la Liste rouge mondiale : espèce non évaluée. 	\N	\N	\N	f
22498	1022	TEXT	events.0.date	1535	\N	\N	\N	f
22499	1022	TEXT	identity.populationYear	2017	\N	\N	\N	f
22500	1022	IMAGE	species.5.image	\N	1230	Diapensine de Laponie © DTAM 975	\N	f
22501	1022	TEXT	statistics.0.text	forêt boréale française	\N	\N	\N	f
22502	1022	TEXT	ecosystems.ecosystems.1.name	Les marais tourbeux et les tourbières	\N	\N	\N	f
22503	1022	TEXT	events.2.date	18<sup>e</sup> siècle 	\N	\N	\N	f
20207	1024	IMAGE	action.cards.1.icon	\N	1123	aquarium	\N	f
20208	1024	TEXT	action.cards.2.description	Je ne relâche pas mes animaux de compagnie exotiques dans la nature. Certaines espèces sont désormais interdites de détention et nécessitent d’avoir des autorisations.  	\N	\N	\N	f
20209	1024	TEXT	presentation.category	Sur terre et en mer	\N	\N	\N	f
20210	1024	TEXT	action.cards.1.description	Je ne vidange pas mon aquarium dans la nature. Les plantes aquatiques et les poissons exotiques peuvent être dangereux pour l’équilibre des cours d’eau.	\N	\N	\N	f
22504	1022	TEXT	identity.presentation	Au sud de l'île de Terre Neuve (Canada), l'archipel se compose de la petit île de Saint-Pierre, où se concentre la majorité de la population, et des îles de Miquelon et Langlade, plus sauvages et préservées. Situé à la confluence du courant froid du Labrador et des eaux plus chaudes du Gulf Stream, l'archipel présente une biodiversité unique en France et une myriade d'écosystèmes, dont la seule forêt boréale française, de très importantes populations d'oiseaux marins et une grande richesse sous-marine.	\N	\N	\N	f
22505	1022	TEXT	identity.population	6 274	\N	\N	\N	f
22506	1022	TEXT	species.3.name	Le Pluvier siffleur	\N	\N	\N	f
22507	1022	IMAGE	species.8.image	\N	1263	Cerf de Virginie © Bruno Letournel	\N	f
22508	1022	TEXT	species.0.name	Les phoques	\N	\N	\N	f
22509	1022	TEXT	events.4.date	1881	\N	\N	\N	f
22510	1022	IMAGE	interests.locations.2.image	\N	1233	L'îlot du Grand Colombier © Nathalie De Lacoste	\N	f
20211	1024	TEXT	presentation.description	Les espèces exotiques envahissantes sont une menace majeure pour les écosystèmes, en particulier pour les espaces insulaires qui comptent de nombreuses espèces endémiques.	\N	\N	\N	f
20212	1024	TEXT	action.title	Pour limiter l’introduction et la dispersion d’espèces exotiques envahissantes 	\N	\N	\N	f
20213	1024	TEXT	understand.quote	La Tortue de Floride, considérée comme l'une des 100 espèces les plus envahissantes du monde, est présente en milieu naturel dans quasiment tous les territoires d'outre-mer français (à l'exception de Saint-Pierre et Miquelon, Wallis et Futuna, et les TAAF)	\N	\N	\N	f
20214	1024	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
20215	1024	TEXT	action.cards.0.description	Je me renseigne sur les espèces végétales que je souhaite planter dans mon jardin et je privilégie d’utiliser des espèces locales. Je respecte la règlementation sur l'interdiction d'introduction d'espèces sur mon territoire.	\N	\N	\N	f
22511	1022	IMAGE	ecosystems.ecosystems.2.image	\N	1110	Forêt boréale © Nathalie de Lacoste	\N	f
22512	1022	TEXT	interests.locations.0.description	Cette lagune de 1 000 ha est bordée de marais et communique avec la mer par un goulet au sud-est. La lagune et les marais qui la bordent sont d’une importante richesse tant faunistique que floristique. Ses bancs de sable accueillent notamment la plus importante colonie reproductrice de phoques veaux-marins du territoire français. Un plan de gestion du site a été validé en 2011 visant à y protéger les espaces naturels remarquables tout en assurant autant que possible leur ouverture au public.	\N	\N	\N	f
22513	1022	TEXT	interests.locations.2.description	Cet ilot situé au nord de l’île de Saint-Pierre est un site de nidification remarquable. Il accueille une grande part des populations d’oiseaux marins nicheuses de l’archipel, voire la totalité des couples pour certaines espèces comme l’Océanite cul-blanc ou le Macareux moine. Pour ces deux espèces, il s’agit de colonies parmi les plus importantes au niveau mondial. 	\N	\N	\N	f
20216	1027	IMAGE	presentation.file	\N	1139	test	\N	f
20217	1027	IMAGE	action.cards.2.icon	\N	1136	nettoyer	\N	f
20218	1027	TEXT	presentation.name	Je préserve la flore sauvage  	\N	\N	\N	f
20219	1027	IMAGE	action.cards.0.icon	\N	1138	balisage	\N	f
20220	1027	IMAGE	presentation.image	\N	1140	© Fabien Lefebvre	\N	f
20221	1027	TEXT	understand.text	Dans les territoires ultramarins, de nombreuses espèces de plantes sont endémiques et leur répartition est parfois limitée à une très petite zone. Piétinements ou cueillettes intensives peuvent menacer la survie de ces espèces végétales, déjà soumises à de plus importantes pressions : changements climatiques, défrichements pour créer des espaces agricoles, pâturages d’animaux domestiques, incendies…\n\nAttention également aux plantes exotiques envahissantes : certaines plantes peuvent se développer à partir de très petits fragments et les très petites graines de certaines espèces peuvent facilement se coincer dans les chaussures ! C’est pourquoi les gestionnaires prennent d’importantes précautions lorsqu'ils mettent en place des opérations d’éradication de ces espèces. \n	\N	\N	\N	f
20222	1027	IMAGE	action.cards.1.icon	\N	1137	protection	\N	f
20223	1027	TEXT	action.cards.2.description	Je nettoie mes chaussures et mon matériel de randonnée régulièrement pour ne pas disséminer d’espèces envahissantes.	\N	\N	\N	f
20224	1027	TEXT	presentation.category	Sur terre	\N	\N	\N	f
20225	1027	TEXT	action.cards.1.description	Je ne cueille pas de plantes sauvages, il peut s’agir d’espèces fragiles et protégées. Si je souhaite prélever des plantes, je me renseigne d’abord sur la règlementation et les espèces protégées.	\N	\N	\N	f
20226	1027	TEXT	presentation.description	test	\N	\N	\N	f
20227	1027	TEXT	action.title	Pour profiter des espaces naturels sans impacter la flore 	\N	\N	\N	f
20228	1027	TEXT	understand.quote	256 espèces de végétaux sont menacées en Guadeloupe	\N	\N	\N	f
20229	1027	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
20230	1027	TEXT	action.cards.0.description	Je ne sors pas des sentiers balisés, ils sont là pour me permettre de ne pas abimer les milieux.	\N	\N	\N	f
21807	1014	IMAGE	presentation.image	\N	1053	Récif corallien, Parc naturel marin de Mayotte © Marine Dekenen / OFB	\N	f
21808	1014	TEXT	understand.paragraphs.1.title	L’IFRECOR, une initiative pour préserver les récifs 	\N	\N	\N	f
21563	1019	TEXT	paragraphs.1.text	L’objet et les conditions de collecte des données sont très précisément définis, pour permettre l’exploitabilité des données et la réponse à une question précise. La nature du protocole va contraindre le type de public participant, mais cela peut inclure des débutants. Les données collectées peuvent également rejoindre bases de données collaboratives.\n	\N	\N	\N	f
21564	1019	IMAGE	examples.projects.0.image	\N	1081	© Cynomana  / CC BY-SA 4.0 	\N	f
21565	1019	IMAGE	examples.projects.3.image	\N	1083	© Reefcheck France 	\N	f
21566	1019	TEXT	examples.projects.3.target	Plongeurs, apnéistes. Formation nécessaire. 	\N	\N	\N	f
21567	1019	TEXT	paragraphs.2.title	Les programmes à visée éducative ou de gestion/conservation	\N	\N	\N	f
21568	1019	TEXT	examples.projects.1.subject	Suivi des populations d’oiseaux communs par échantillonnages réguliers le long de parcours prédéfinis	\N	\N	\N	f
21569	1019	LINK	application.downloadLink	Je télécharge l’application INPN Espèces	\N	\N	https://inpn.mnhn.fr/informations/inpn-especes	f
21570	1019	TEXT	examples.projects.1.description	Débuté en 2012 dans le cadre du Life+ CapDOM, conjointement avec la Martinique et La Réunion, le STOC-Guyane a pour but de suivre les variations d'abondances d'oiseaux communs sur le long terme pour évaluer l'impact des activités humaines. Le programme demande une implication régulière et nécessite une formation au protocole utilisé et la reconnaissance des espèces. A ce jour, près de cinquante parcours sont échantillonnés annuellement et au total, plus de 50 000 données ont été collectées.	\N	\N	\N	f
21571	1019	IMAGE	images.0.image	\N	1078	© U.S. Fish and Wildlife Service Southeast Region / CC BY 2.0	\N	f
21572	1019	TEXT	examples.projects.1.target	Ornithologues amateurs ou professionnels (à titre bénévole). Formation nécessaire. 	\N	\N	\N	f
21573	1019	TEXT	examples.projects.0.target	Plongeurs, apnéistes, pratiquant la photo sous-marine	\N	\N	\N	f
21574	1019	TEXT	examples.projects.3.subject	Suivi de l’état de santé des récifs de Nouvelle-Calédonie	\N	\N	\N	f
21575	1019	TEXT	header.subtitle	Enrichir ses propres connaissances et développer son sens de l’observation tout en participant à la progression et l'amélioration des connaissances scientifiques pour préserver la biodiversité, c’est le pari des sciences participatives.  \n\nFaune, flore, milieu marin ou terrestre, observation ponctuelle ou programme protocolé, trouvez le programme qui vous correspond et contribuez au développement des connaissances !	\N	\N	\N	f
21576	1019	LINK	examples.projects.1.more	En savoir plus	\N	\N	http://www.gepog.org/Nos-actions/Milieux-terrestres/Suivi-Temporel-des-Oiseaux-Communs-STOC-EPS	f
21577	1019	TEXT	examples.projects.2.title	TsiÔno, le réseau des observateurs du milieu marin mahorais	\N	\N	\N	f
21578	1019	TEXT	header.title	C'est quoi les sciences participatives ?	\N	\N	\N	f
21579	1019	IMAGE	examples.projects.2.image	\N	1247	Image provisoire	\N	f
21580	1019	TEXT	paragraphs.1.title	Les projets adossés à des programmes de recherche	\N	\N	\N	f
21581	1019	TEXT	presentation.description	Les observations sont réalisées de manière bénévole, le plus souvent par des non-professionnels, certains programmes nécessitent des formations au préalables. On distingue trois catégories de programmes participatifs selon les objectifs	\N	\N	\N	f
21582	1019	TEXT	examples.projects.3.actor	Association Pala Dalik	\N	\N	\N	f
21583	1019	TEXT	paragraphs.2.text	On trouve dans cette catégorie divers programmes de sensibilisation à la démarche scientifique ou aux enjeux de conservation. Certains d’entre eux n’impliquent pas de collecte d’information centralisée, leur objectif étant d’abord de permettre aux participants d’acquérir des connaissances. 	\N	\N	\N	f
21584	1019	TEXT	examples.projects.4.title	Ti bèt a limiè, l’Observatoire des lucioles en Guadeloupe	\N	\N	\N	f
21585	1019	TEXT	examples.projects.0.actor	Kelonia	\N	\N	\N	f
21586	1019	TEXT	application.title	Agir pour la science depuis son smartphone, c’est possible !	\N	\N	\N	f
21587	1019	TEXT	paragraphs.0.title	Les bases de données collaboratives	\N	\N	\N	f
21588	1019	TEXT	examples.projects.4.actor	An ba loup-la	\N	\N	\N	f
21589	1019	TEXT	application.subtitle	J'agis en ligne	\N	\N	\N	f
21590	1019	TEXT	examples.projects.4.target	Tous publics	\N	\N	\N	f
21591	1019	TEXT	examples.projects.1.title	Le Suivi temporel des oiseaux communs (STOC) en Guyane	\N	\N	\N	f
21592	1019	LINK	examples.projects.0.more	En savoir plus	\N	\N	https://museesreunion.fr/kelonia/actualites-et-savoirs-de-kelonia/la-photo-identification-des-tortues-marines/?fbclid=IwAR0W8NGqRTa20a8	f
21593	1019	TEXT	examples.projects.2.target	Usagers de la mer, tous publics	\N	\N	\N	f
21594	1019	IMAGE	header.background	\N	1075	Mont Orohena, Tahiti © Darko Cotoras	\N	f
21809	1014	TEXT	understand.paragraphs.0.text	Les coraux sont des organismes très fragiles : lorsqu’ils sont soumis à un stress, les polypes expulsent leurs algues, ce qui provoque le blanchissement du corail et finit par entrainer sa mort si cette situation est prolongée.\nDe nombreuses menaces pèsent sur les récifs coralliens : le changement climatique provoque l’augmentation de la température et l'acidification de l’eau, qui soumettent les coraux à un stress important. Les polluants issus des activités humaines, certaines techniques de pêche ou encore les activités touristiques ont également un lourd impact sur les récifs. Ces facteurs se conjuguent aux évènements naturels (cyclones, consommation massive par l’étoile de mer [*Acanthaster planci*](https://inpn.mnhn.fr/espece/cd_nom/444461)) et aggravent leurs effets.  \n\nLes coraux sont également très sensibles aux maladies, comme la maladie de la bande blanche ou la récente maladie corallienne liée à la perte de tissus (SCTLD), identifiée pour la première fois en Floride en 2014 et observée en Guadeloupe en 2020.	\N	\N	\N	f
21810	1014	IMAGE	understand.image	\N	1054	Les récifs coralliens sont des communautés animales vivant en symbiose avec des algues microscopiques © Julie Molinier/OFB	\N	f
21811	1014	TEXT	presentation.description	des récifs coralliens sont en diminution dans les territoires d'outre-mer	\N	\N	\N	f
21812	1014	TEXT	presentation.logoUrl	https://naturefrance.fr/indicateurs/evolution-de-letat-des-recifs-coralliens	\N	\N	\N	f
22514	1022	TEXT	interests.locations.1.description	Cette bande de sable de 12 km de long relie les îles de Miquelon et Langlade depuis la fin du 18<sup>e</sup> siècle. Les dunes colonisées par la végétation sont désormais longées par une piste permettant d'accéder à l'île de Langlade, habitée uniquement en période estivale.	\N	\N	\N	f
22515	1022	TEXT	ecosystems.ecosystems.3.name	Les dunes sableuses et cordons de galets	\N	\N	\N	f
22516	1022	TEXT	identity.subtitle	Un climat subarctique, froid et humide	\N	\N	\N	f
22517	1022	IMAGE	species.7.image	\N	1212	Image manquante	\N	f
22518	1022	TEXT	species.5.name	La Diapensine	\N	\N	\N	f
22519	1022	TEXT	risks.risks.0.description	Les menaces pesant sur la biodiversité de Saint-Pierre-et-Miquelon sont nombreuses. Comme tous les territoires d’outre-mer, l’archipel subit la présence d’espèces exotiques envahissantes terrestres : le puceron lanigère (*Adelges piceae*), la Renouée du Japon (*Reynoutria japonica*) et le Séneçon Jacobée (*Jacobaea vulgaris*) sont les plus impactant.  \nLa forêt boréale, sous la pression combinée des herbivores introduits, des pathogènes et du réchauffement climatique, perd en moyenne une vingtaine d'hectares par an, et son état de conservation n'est guère rassurant. \n\nAu niveau marin, depuis l’effondrement des populations de morue des bancs de Terre-Neuve par la surpêche dans les années 70 à 90, la pression de la pêche a diminué, cependant la pêche au filet du Saumon Atlantique capture accidentellement de nombreux oiseaux, tortues et mammifères marins. Les espèces exotiques marines sont également une préoccupation, en particulier les populations de Crabe vert (*Carcinus maenas*), en augmentation.\n\nLa chasse est une question délicate sur l'archipel. Concernant les mammifères introduits, elle permet d'un côté leur régulation, mais de l'autre elle justifie également leur maintien. Quant à la chasse aux oiseaux migrateurs, elle peut freiner l'implantation de colonies nicheuses comme celles de l’Eider à duvet (*Somateria mollisima*).\n\nLe territoire est pour le moment le seul d’outre-mer français à ne disposer d’aucun dispositif de protection réglementaire (hormis les réserves de chasse et de faune sauvage). Après l'abandon d'un premier projet de Réserve naturelle du Grand Barachois au début des années 90, un projet de création de Réserve naturelle sur le Grand et le Petit Colombier a été lancé en 2007. Plaçant sous protection une surface terrestre de 47 ha et une zone maritime de 420 ha, il permettrait de préserver ce site de nidification remarquable. Malgré un avis favorable du Conseil national de protection de la nature, ce projet a été mal perçu par les populations locales qui craignaient des contraintes sur leurs activités traditionnelles, c’est pourquoi le projet est gelé pour le moment.\n\nSur l’archipel, 40 Zones naturelles d'intérêt écologique, faunistique et floristique (ZNIEFF), abritant au moins une espèce ou un habitat naturel remarquable ou rare, ont été délimitées. Cela couvre 89 % du territoire terrestre et traduit la richesse et la valeur écologique des écosystèmes de ces îles, toutefois ce statut n'engendre pas de protection juridique. Actuellement, seules des espèces de chauves-souris, de mammifères marins, d’oiseaux et de tortues marines bénéficient d’une protection réglementaire.\n	\N	\N	\N	f
22520	1022	TEXT	ecosystems.ecosystems.2.description	La seule forêt boréale du territoire français se trouve à Saint-Pierre-et-Miquelon. Fortement dégradée par les herbivores introduits, cette forêt présente une végétation arborescente dans les vallées abritées mais se limite à une strate arbustive ou rampante dans les secteurs exposés aux vents. Dominée par les conifères, on y retrouve le caractéristique Sapin baumier (*Abies balsamea*), l’Epinette blanche (*Picea glauca*), l’épinette noire (*Picea mariana*), dans certains milieux tourbeux le Mélèze laricin (*Larix laricina*), seul conifère qui perd ses épines en hiver, ou encore, bien que rare sur Langlade et Miquelon, l'If du Canada (*Taxus canadensis*) sous sa forme rampante.	\N	\N	\N	f
22521	1022	TEXT	ecosystems.ecosystems.1.description	Ces zones humides occupent des superficies importantes. Caractérisées par la formation et l’accumulation de tourbe, parfois sur plusieurs mètres d’épaisseur, elles présentent des groupements végétaux remarquables et variés, parmi lesquelles on trouve des sphaignes, des mousses, ainsi que des orchidées.	\N	\N	\N	f
21852	1012	TEXT	understand.paragraphs.1.text	Créé en 2012, le [Pôle-relais dédié aux zones humides tropicales](https://www.pole-tropical.org/) (PRZHT) constitue un réseau d’échanges entre les acteurs concernés par la conservation, la gestion et la valorisation des zones humides dans les territoires tropicaux français. Il anime, entre autres, le [Réseau national d’observation et d’aide à la gestion des mangroves](https://www.pole-tropical.org/actions/les-actions-du-reseau-dobservation-des-mangroves/) (ROM), l’un des 3 réseaux de suivi de l’[Initiative française pour les Récifs Coralliens (IFRECOR)](https://ifrecor.fr/). Officiellement lancé en 2017, ce réseau regroupe les gestionnaires de mangroves des territoires français concernés aux Antilles, en Guyane, et dans les océans Indien et Pacifique. \n \nEn 2019, le ROM a développé une application smartphone pour permettre à tous de s’entrainer à reconnaitre les différentes espèces de palétuviers qui constituent la mangrove et à signaler les perturbations observées dans les mangroves (déchets, défrichements, mortalités, etc.). Chaque utilisateur peut ainsi devenir pleinement acteur de la protection des mangroves au sein de son territoire.  \nVous aussi, devenez observateurs en [téléchargeant l'application ROM](https://rom.pole-tropical.org/home) !\n	\N	\N	\N	f
21853	1012	TEXT	understand.title2	Des bénéfices pour l’Homme, mais un écosystème soumis à de nombreuses pressions 	\N	\N	\N	f
21854	1012	TEXT	presentation.descriptionTerritories	des mangroves font l'objet de mesures de conservation	\N	\N	\N	f
21855	1012	TEXT	understand.paragraphs.0.title	Des statuts de protection variés	\N	\N	\N	f
21856	1012	TEXT	understand.keyword	mangroves	\N	\N	\N	f
21857	1012	TEXT	ecogestures.title	Que puis-je faire pour aider à préserver les mangroves ? 	\N	\N	\N	f
21858	1012	IMAGE	presentation.image	\N	1047	Palétuviers à Grand Cul-de-Sac marin, Guadeloupe © Gaëlle Vandersarren	\N	f
21859	1012	TEXT	understand.paragraphs.1.title	Un réseau participatif pour signaler les perturbations dans les mangroves	\N	\N	\N	f
21860	1012	TEXT	understand.paragraphs.0.text	Il existe un éventail de dispositions juridiques permettant de protéger les mangroves, par exemple le classement en Zone humide d’importance internationale par la Convention de Ramsar ou les arrêtés de protection de biotope, et de nombreuses zones de mangroves sont présentes dans les aires protégées des territoires (parcs nationaux, parcs naturels régionaux, réserves naturelles, etc.). Cependant, toutes les mangroves protégées ne font pas forcément l’objet de mesures de gestion.\nCet indicateur donne la part de mangroves bénéficiant d'un gestionnaire identifié et d'un document de gestion établit dans un but de conservation. Dans le cadre de la loi pour la reconquête de la biodiversité du 9 août 2016, l’État français s'était fixé pour objectif que 60 % de la surface nationale des mangroves soit gérée à des fins de conservation d'ici à 2020, cet objectif n'a donc pas été atteint. 	\N	\N	\N	f
21861	1012	IMAGE	understand.image	\N	1049	La mangrove est un écosystème protecteur pour les poissons © UICN	\N	f
21862	1012	TEXT	presentation.description	des mangroves nationales font l’objet de mesures de conservation	\N	\N	\N	f
21863	1012	TEXT	presentation.logoUrl	https://naturefrance.fr/indicateurs/surface-de-mangroves-faisant-lobjet-de-mesures-de-conservation	\N	\N	\N	f
24651	1015	TEXT	ecosystems.ecosystems.2.description	A l’interface entre le milieu marin et le milieu terrestre, les mangrove ont des rôles fonctionnels très importants : protection contre l’érosion, piège à sédiment, puit de carbone… Elles couvrent actuellement plus de 2 000 ha en Martinique, mais occupaient autrefois des surfaces beaucoup plus importantes avant d’être déboisées.  \n  \nEn 2020, l'eau a temporairement pris une coloration rose peu commune dans certaines zones de mangroves ! La forte évaporation due à la sécheresse a provoqué une augmentation de la salinité, entrainant un "bloom" (forte multiplication) d'une microalgue qui a donné à l'eau cette couleur surprenante. 	\N	\N	\N	f
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

SELECT pg_catalog.setval('public.image_seq', 1280, true);


--
-- Name: indicator_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.indicator_seq', 1007, true);


--
-- Name: indicator_value_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.indicator_value_seq', 1097, true);


--
-- Name: page_element_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.page_element_seq', 24854, true);


--
-- Name: page_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.page_seq', 1030, true);


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

