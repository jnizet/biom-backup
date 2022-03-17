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
-- Name: api_key; Type: TABLE; Schema: public; Owner: biom
--

CREATE TABLE public.api_key (
    host character varying NOT NULL,
    key character varying NOT NULL
);


ALTER TABLE public.api_key OWNER TO biom;

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
-- Name: media_category; Type: TABLE; Schema: public; Owner: biom
--

CREATE TABLE public.media_category (
    id bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.media_category OWNER TO biom;

--
-- Name: media_category_relation; Type: TABLE; Schema: public; Owner: biom
--

CREATE TABLE public.media_category_relation (
    media_page_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.media_category_relation OWNER TO biom;

--
-- Name: media_category_seq; Type: SEQUENCE; Schema: public; Owner: biom
--

CREATE SEQUENCE public.media_category_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_category_seq OWNER TO biom;

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
-- Data for Name: api_key; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.api_key (host, key) FROM stdin;
\.


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
4	0004	add media categories-table	SQL	V0004__add_media_categories-table.sql	246307785	biom	2021-11-08 17:29:11.321268	316	t
5	0005	add-api-key-table	SQL	V0005__add-api-key-table.sql	912270206	biom	2022-02-09 10:31:09.801809	90	t
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
1860	image/jpeg	copy-1103
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
1760	image/jpeg	copy-1760
1761	image/jpeg	copy-1758
1762	image/jpeg	copy-1709
1763	image/jpeg	copy-1756
1764	image/jpeg	copy-1708
1765	image/jpeg	copy-1759
1766	image/jpeg	copy-1757
1767	image/jpeg	copy-1709
1768	image/jpeg	copy-1756
1769	image/jpeg	copy-1758
1770	image/jpeg	copy-1757
1771	image/jpeg	copy-1759
1772	image/jpeg	copy-1708
1773	image/jpeg	copy-1457
1774	image/jpeg	copy-1008
1775	image/jpeg	copy-1305
1776	image/jpeg	copy-1007
1777	image/jpeg	copy-1467
1778	image/jpeg	copy-1167
1779	image/jpeg	copy-1165
1780	image/jpeg	copy-1225
1781	image/jpeg	copy-1288
1782	image/jpeg	copy-1173
1783	image/jpeg	copy-1296
1784	image/jpeg	copy-1012
1785	image/jpeg	copy-1294
1786	image/jpeg	copy-1295
1787	image/jpeg	copy-1462
1788	image/jpeg	copy-1458
1789	image/jpeg	copy-1461
1790	image/jpeg	copy-1459
1791	image/jpeg	copy-1010
1792	image/jpeg	copy-1168
1793	image/jpeg	copy-1756
1794	image/jpeg	copy-1757
1795	image/jpeg	copy-1758
1796	image/jpeg	copy-1761
1797	image/jpeg	copy-1708
1798	image/jpeg	copy-1759
1799	image/jpeg	copy-1457
1800	image/jpeg	copy-1007
1801	image/jpeg	copy-1294
1802	image/jpeg	copy-1225
1803	image/jpeg	copy-1461
1804	image/jpeg	copy-1165
1805	image/jpeg	copy-1467
1806	image/jpeg	copy-1167
1807	image/jpeg	copy-1008
1808	image/jpeg	copy-1305
1809	image/jpeg	copy-1462
1810	image/jpeg	copy-1288
1811	image/jpeg	copy-1459
1812	image/jpeg	copy-1295
1813	image/jpeg	copy-1012
1814	image/jpeg	copy-1010
1815	image/jpeg	copy-1168
1816	image/jpeg	copy-1458
1817	image/jpeg	copy-1296
1818	image/jpeg	copy-1284
1819	image/jpeg	copy-1302
1820	image/jpeg	copy-1297
1821	image/jpeg	copy-1279
1822	image/jpeg	copy-1061
1823	image/jpeg	copy-1059
1824	image/jpeg	copy-1349
1825	image/jpeg	copy-1064
1826	image/jpeg	copy-1348
1827	image/jpeg	copy-1287
1828	image/jpeg	copy-1277
1829	image/jpeg	copy-1069
1830	image/jpeg	copy-1385
1831	image/jpeg	copy-1280
1832	image/jpeg	copy-1298
1833	image/jpeg	copy-1276
1834	image/jpeg	copy-1270
1835	image/jpeg	copy-1307
1836	image/jpeg	copy-1268
1837	image/jpeg	copy-1278
1838	image/jpeg	copy-1267
1839	image/jpeg	copy-1503
1840	image/jpeg	copy-1531
1841	image/jpeg	copy-1502
1842	image/jpeg	copy-1530
1843	image/jpeg	copy-1580
1844	image/jpeg	copy-1527
1845	image/jpeg	copy-1566
1846	image/jpeg	copy-1510
1847	image/jpeg	copy-1569
1848	image/jpeg	copy-1605
1849	image/jpeg	copy-1572
1850	image/jpeg	copy-1568
1851	image/jpeg	copy-1576
1852	image/jpeg	copy-1570
1853	image/jpeg	copy-1508
1854	image/jpeg	copy-1578
1855	image/jpeg	copy-1567
1856	image/jpeg	copy-1526
1857	image/jpeg	copy-1504
1858	image/jpeg	copy-1571
1859	image/jpeg	copy-1529
1861	image/jpeg	copy-1217
1862	image/jpeg	copy-1227
1863	image/jpeg	copy-1109
1864	image/jpeg	copy-1286
1865	image/jpeg	copy-1233
1870	image/jpeg	copy-1285
1873	image/jpeg	copy-1230
1874	image/jpeg	copy-1226
1876	image/jpeg	copy-1263
1878	image/jpeg	copy-1110
2285	image/jpeg	copy-1284
2292	image/jpeg	copy-1277
2307	image/jpeg	copy-1686
2314	image/jpeg	copy-1749
2336	image/jpeg	copy-1576
2348	image/jpeg	copy-1578
2355	image/jpeg	copy-1299
2369	image/jpeg	copy-1488
2374	image/jpeg	copy-1648
2382	image/jpeg	copy-1646
2386	image/jpeg	copy-1651
2390	image/jpeg	copy-1846
2405	image/jpeg	copy-1762
2407	image/jpeg	copy-1614
2411	image/jpeg	copy-1688
2412	image/jpeg	copy-1619
2414	image/jpeg	copy-1618
2416	image/jpeg	copy-1620
2426	image/jpeg	copy-1235
2428	image/jpeg	copy-1109
2429	image/jpeg	copy-1223
2432	image/jpeg	copy-1844
2435	image/jpeg	copy-1104
2450	image/jpeg	copy-1091
2457	image/jpeg	copy-1330
2479	image/jpeg	copy-1815
2488	image/jpeg	copy-1890
2496	image/jpeg	copy-1693
2503	image/jpeg	copy-1745
2507	image/jpeg	copy-1892
2520	image/jpeg	copy-1903
2528	image/jpeg	copy-1913
2533	image/jpeg	GLO_000194_B._MARIE.jpg
2544	image/jpeg	copy-1908
2567	image/jpeg	copy-1835
2586	image/jpeg	copy-1347
2598	image/jpeg	copy-1835
2601	image/jpeg	copy-1956
2615	image/png	copy-1131
2622	image/png	copy-1929
2627	image/jpeg	copy-2030
2636	image/jpeg	copy-2028
2646	image/jpeg	copy-2012
2660	image/jpeg	copy-1957
1866	image/jpeg	copy-1229
1867	image/jpeg	copy-1223
1868	image/jpeg	copy-1228
1869	image/jpeg	copy-1236
1871	image/jpeg	copy-1235
1872	image/jpeg	copy-1220
1875	image/jpeg	copy-1265
1877	image/jpeg	copy-1264
1879	image/jpeg	copy-1104
1880	image/jpeg	copy-1763
1881	image/jpeg	copy-1581
1882	image/jpeg	copy-1606
1883	image/jpeg	copy-1614
1884	image/jpeg	copy-1610
1885	image/jpeg	copy-1762
1886	image/jpeg	copy-1621
1887	image/jpeg	copy-1615
1888	image/jpeg	copy-1688
1889	image/jpeg	copy-1612
1890	image/jpeg	copy-1617
1891	image/jpeg	copy-1609
1893	image/jpeg	copy-1619
1892	image/jpeg	copy-1608
1894	image/jpeg	copy-1765
1895	image/jpeg	copy-1618
1896	image/jpeg	copy-1689
1897	image/jpeg	copy-1620
1898	image/jpeg	copy-1766
1899	image/jpeg	copy-1616
1900	image/jpeg	copy-1477
1901	image/jpeg	copy-1238
1902	image/jpeg	copy-1090
1903	image/jpeg	copy-1240
1904	image/jpeg	copy-1317
1905	image/jpeg	copy-1315
1906	image/jpeg	copy-1089
1907	image/jpeg	copy-1091
1908	image/jpeg	copy-1239
1909	image/jpeg	copy-1318
1910	image/jpeg	copy-1319
1911	image/jpeg	copy-1331
1912	image/jpeg	copy-1316
1913	image/jpeg	copy-1325
1914	image/jpeg	copy-1324
1915	image/jpeg	copy-1321
1916	image/jpeg	copy-1387
1917	image/jpeg	copy-1339
1918	image/jpeg	copy-1092
1919	image/jpeg	copy-1323
1920	image/jpeg	copy-1474
1921	image/jpeg	copy-1392
1922	image/jpeg	copy-1320
1923	image/jpeg	copy-1476
1924	image/jpeg	copy-1330
1925	image/jpeg	copy-1397
1926	image/jpeg	copy-1328
1927	image/jpeg	copy-1383
1928	image/jpeg	copy-1322
1929	image/jpeg	copy-1473
1930	image/jpeg	copy-1329
1931	image/jpeg	copy-1386
1932	image/jpeg	copy-1157
1933	image/jpeg	copy-1095
1934	image/jpeg	copy-1478
1935	image/jpeg	copy-1156
1936	image/jpeg	copy-1564
1937	image/jpeg	copy-1158
1938	image/jpeg	copy-1299
1939	image/jpeg	copy-1479
1940	image/jpeg	copy-1480
1941	image/jpeg	copy-1097
1942	image/jpeg	copy-1483
1943	image/jpeg	copy-1300
1944	image/jpeg	copy-1565
1945	image/jpeg	copy-1484
1946	image/jpeg	copy-1488
1947	image/jpeg	copy-1196
1948	image/jpeg	copy-1306
1949	image/jpeg	copy-1160
1950	image/jpeg	copy-1494
1951	image/jpeg	copy-1495
1952	image/jpeg	copy-1481
1953	image/jpeg	copy-1100
1954	image/jpeg	copy-1095
1955	image/jpeg	copy-1300
1956	image/jpeg	copy-1768
1957	image/jpeg	copy-1479
1958	image/jpeg	copy-1156
1959	image/jpeg	copy-1481
1960	image/jpeg	copy-1480
1961	image/jpeg	copy-1158
1962	image/jpeg	copy-1299
1963	image/jpeg	copy-1306
1964	image/jpeg	copy-1097
1965	image/jpeg	copy-1478
1966	image/jpeg	copy-1565
1967	image/jpeg	copy-1483
1968	image/jpeg	copy-1767
1969	image/jpeg	copy-1157
1970	image/jpeg	copy-1160
1971	image/jpeg	copy-1495
1972	image/jpeg	copy-1488
1973	image/jpeg	copy-1484
1974	image/jpeg	copy-1494
1975	image/jpeg	copy-1658
1976	image/jpeg	copy-1644
1977	image/jpeg	copy-1655
1978	image/jpeg	copy-1649
1979	image/jpeg	copy-1650
1980	image/jpeg	copy-1657
1981	image/jpeg	copy-1646
1982	image/jpeg	copy-1648
1983	image/jpeg	copy-1769
1984	image/jpeg	copy-1662
1985	image/jpeg	copy-1647
1986	image/jpeg	copy-1652
1987	image/jpeg	copy-1651
1988	image/jpeg	copy-1643
1989	image/jpeg	copy-1622
1990	image/jpeg	copy-1653
1991	image/jpeg	copy-1626
1992	image/jpeg	copy-1659
1993	image/jpeg	copy-1770
1994	image/jpeg	copy-1656
1995	image/jpeg	copy-1660
1996	image/jpeg	copy-1743
1997	image/jpeg	copy-1686
1998	image/jpeg	copy-1691
1999	image/jpeg	copy-1687
2000	image/jpeg	copy-1748
2001	image/jpeg	copy-1753
2002	image/jpeg	copy-1749
2003	image/jpeg	copy-1744
2004	image/jpeg	copy-1751
2005	image/jpeg	copy-1771
2006	image/jpeg	copy-1745
2007	image/jpeg	copy-1755
2286	image/jpeg	copy-1870
2302	image/jpeg	copy-1297
2305	image/jpeg	copy-1278
2308	image/jpeg	copy-1873
2337	image/jpeg	copy-1503
2343	image/jpeg	copy-1569
2352	image/jpeg	copy-1875
2375	image/jpeg	copy-1662
2379	image/jpeg	copy-1657
2391	image/jpeg	copy-1626
2398	image/jpeg	copy-1877
2420	image/jpeg	copy-1233
2427	image/jpeg	copy-1285
2439	image/jpeg	copy-1879
2452	image/jpeg	copy-1316
2454	image/jpeg	copy-1320
2458	image/jpeg	copy-1397
2459	image/jpeg	copy-1328
2467	image/jpeg	copy-1329
2468	image/jpeg	copy-1319
2481	image/jpeg	copy-1818
2497	image/jpeg	copy-1692
2505	image/jpeg	copy-1743
2510	image/jpeg	copy-1755
2521	image/jpeg	copy-1907
2531	image/jpeg	copy-1915
2534	image/jpeg	copy-1911
2537	image/jpeg	copy-1914
2545	image/jpeg	copy-1909
2546	image/jpeg	copy-1910
2551	image/jpeg	Malhec_IMG_7709_CEN.jpg
2552	image/jpeg	Aperçu_dashboard_FS.jpg
2553	image/jpeg	Malhec_FS_CEN.jpg
2554	image/jpeg	copy-1431
2556	image/png	copy-1926
2568	image/jpeg	copy-1832
2578	image/jpeg	copy-1344
2587	image/jpeg	copy-1424
2599	image/jpeg	copy-1497
2604	image/jpeg	copy-1835
2616	application/pdf	copy-1470
2628	image/jpeg	copy-2033
2637	image/jpeg	copy-2027
2649	image/jpeg	copy-2010
2655	image/jpeg	copy-2033
2008	image/jpeg	copy-1692
2013	image/jpeg	copy-1772
2287	image/jpeg	copy-1059
2291	image/jpeg	copy-1276
2309	image/jpeg	copy-1743
2315	image/jpeg	copy-1691
2323	image/jpeg	copy-1772
2342	image/jpeg	copy-1566
2344	image/jpeg	copy-1570
2353	image/jpeg	copy-1768
2363	image/jpeg	copy-1483
2372	image/jpeg	copy-1480
2373	image/jpeg	copy-1160
2376	image/jpeg	copy-1876
2394	image/jpeg	copy-1845
2397	image/jpeg	copy-1581
2402	image/jpeg	copy-1608
2421	image/jpeg	copy-1236
2424	image/jpeg	copy-1286
2434	image/jpeg	copy-1226
2440	image/jpeg	copy-1089
2447	image/jpeg	copy-1321
2462	image/jpeg	copy-1383
2472	image/jpeg	BIOM_Martinique_nov2021.jpg
2485	image/jpeg	copy-1864
2498	image/jpeg	copy-1753
2523	image/jpeg	copy-1905
2535	image/jpeg	copy-1902
2542	image/jpeg	copy-1912
2548	image/jpeg	BIOM_IlesEparses_dec2021.jpg
2555	image/jpeg	copy-1424
2557	image/png	copy-1927
2558	image/png	copy-1928
2569	image/jpeg	copy-1925
2579	image/jpeg	copy-1291
2588	image/jpeg	copy-1950
2605	image/jpeg	copy-1954
2617	image/png	copy-1132
2629	image/jpeg	copy-1955
2638	image/jpeg	copy-2030
2651	image/jpeg	copy-2007
2656	image/jpeg	copy-1832
2009	image/jpeg	copy-1754
2010	image/jpeg	copy-1693
2012	image/jpeg	copy-1750
2014	image/jpeg	copy-1694
2016	image/jpeg	copy-1747
2288	image/jpeg	copy-1061
2304	image/jpeg	copy-1069
2310	image/jpeg	copy-1692
2322	image/jpeg	copy-1694
2327	image/jpeg	copy-1754
2329	image/jpeg	copy-1755
2333	image/jpeg	copy-1508
2349	image/jpeg	copy-1504
2357	image/jpeg	copy-1481
2377	image/jpeg	copy-1652
2396	image/jpeg	copy-1660
2404	image/jpeg	copy-1612
2417	image/jpeg	copy-1617
2422	image/jpeg	copy-1229
2437	image/jpeg	copy-1843
2441	image/jpeg	copy-1090
2444	image/jpeg	copy-1318
2465	image/jpeg	copy-1473
2469	image/jpeg	copy-1392
2471	image/jpeg	copy-1387
2473	image/jpeg	copy-1819
2480	image/jpeg	copy-1811
2483	image/jpeg	copy-1888
2487	image/jpeg	copy-1816
2500	image/jpeg	copy-1742
2509	image/jpeg	copy-1694
2512	image/jpeg	copy-1772
2524	image/jpeg	copy-1902
2536	image/jpeg	copy-1907
2547	image/jpeg	copy-1915
2549	image/jpeg	Dziani Dzaha-Alexandra Gigou - OFB.jpg
2559	image/png	copy-1933
2570	image/jpeg	copy-1497
2580	image/jpeg	copy-1346
2589	image/jpeg	copy-1949
2592	image/jpeg	copy-1954
2596	image/jpeg	copy-1955
2606	image/jpeg	copy-1957
2618	image/jpeg	copy-1135
2621	image/jpeg	copy-1309
2630	image/jpeg	copy-1837
2639	image/jpeg	copy-2029
2652	image/jpeg	copy-2013
2661	image/jpeg	copy-2040
2011	image/jpeg	copy-1746
2015	image/jpeg	copy-1742
2017	image/jpeg	copy-1690
2018	image/jpeg	copy-1040
2019	image/jpeg	copy-1382
2020	image/jpeg	copy-1377
2021	image/jpeg	copy-1378
2022	image/jpeg	copy-1312
2023	image/jpeg	copy-1380
2024	image/jpeg	copy-1691
2025	image/jpeg	copy-1692
2026	image/jpeg	copy-1686
2027	image/jpeg	copy-1693
2028	image/jpeg	copy-1742
2029	image/jpeg	copy-1749
2030	image/jpeg	copy-1743
2031	image/jpeg	copy-1772
2032	image/jpeg	copy-1745
2033	image/jpeg	copy-1744
2034	image/jpeg	copy-1694
2035	image/jpeg	copy-1687
2036	image/jpeg	copy-1751
2037	image/jpeg	copy-1748
2038	image/jpeg	copy-1690
2039	image/jpeg	copy-1747
2040	image/jpeg	copy-1754
2041	image/jpeg	copy-1755
2042	image/jpeg	copy-1773
2043	image/jpeg	copy-1750
2044	image/jpeg	copy-1753
2045	image/jpeg	copy-1746
2046	image/jpeg	copy-1260
2047	image/jpeg	copy-1760
2048	image/jpeg	copy-1004
2049	image/jpeg	copy-1258
2050	image/jpeg	copy-1497
2051	image/jpeg	copy-1756
2052	image/jpeg	copy-1757
2053	image/jpeg	copy-1761
2054	image/jpeg	copy-1759
2055	image/jpeg	copy-1708
2056	image/jpeg	copy-1774
2057	image/jpeg	copy-1041
2058	image/jpeg	copy-1042
2059	image/jpeg	copy-1343
2060	image/jpeg	copy-1050
2061	image/jpeg	copy-1050
2062	image/jpeg	copy-1343
2063	image/jpeg	copy-1646
2064	image/jpeg	copy-1622
2065	image/jpeg	copy-1643
2066	image/jpeg	copy-1648
2067	image/jpeg	copy-1656
2068	image/jpeg	copy-1770
2069	image/jpeg	copy-1658
2070	image/jpeg	copy-1651
2071	image/jpeg	copy-1626
2072	image/jpeg	copy-1662
2073	image/jpeg	copy-1769
2074	image/jpeg	copy-1649
2075	image/jpeg	copy-1655
2076	image/jpeg	copy-1644
2077	image/jpeg	copy-1660
2078	image/jpeg	copy-1657
2079	image/jpeg	copy-1647
2080	image/jpeg	copy-1650
2081	image/jpeg	copy-1652
2082	image/jpeg	copy-1653
2083	image/jpeg	copy-1659
2084	image/jpeg	copy-1658
2085	image/jpeg	copy-1622
2086	image/jpeg	copy-1650
2087	image/jpeg	copy-1662
2088	image/jpeg	copy-1648
2089	image/jpeg	copy-1649
2090	image/jpeg	copy-1657
2091	image/jpeg	copy-1647
2092	image/jpeg	copy-1655
2093	image/jpeg	copy-1659
2094	image/jpeg	copy-1646
2095	image/jpeg	copy-1769
2096	image/jpeg	copy-1660
2097	image/jpeg	copy-1644
2098	image/jpeg	copy-1653
2099	image/jpeg	copy-1651
2100	image/jpeg	copy-1656
2101	image/jpeg	copy-1626
2102	image/jpeg	copy-1652
2103	image/jpeg	copy-1643
2104	image/jpeg	copy-1770
2106	image/jpeg	copy-1835
2105	image/jpeg	copy-1837
2107	image/jpeg	copy-1836
2108	image/jpeg	copy-1497
2109	image/jpeg	copy-1832
2110	image/jpeg	copy-1760
2111	image/jpeg	copy-1828
2112	image/jpeg	copy-1829
2113	image/jpeg	copy-1822
2114	image/jpeg	copy-1776
2115	image/jpeg	copy-1821
2116	image/jpeg	copy-1775
2117	image/jpeg	copy-1233
2118	image/jpeg	copy-1103
2119	image/jpeg	copy-1228
2120	image/jpeg	copy-1840
2121	image/jpeg	copy-1229
2122	image/jpeg	copy-1236
2123	image/jpeg	copy-1235
2124	image/jpeg	copy-1109
2125	image/jpeg	copy-1286
2126	image/jpeg	copy-1226
2127	image/jpeg	copy-1220
2128	image/jpeg	copy-1841
2129	image/jpeg	copy-1227
2130	image/jpeg	copy-1264
2131	image/jpeg	copy-1104
2132	image/jpeg	copy-1842
2133	image/jpeg	copy-1265
2134	image/jpeg	copy-1223
2135	image/jpeg	copy-1230
2136	image/jpeg	copy-1285
2137	image/jpeg	copy-1424
2138	image/png	copy-1144
2139	image/png	copy-1143
2140	application/pdf	copy-1485
2141	image/png	copy-1145
2142	image/jpeg	copy-1142
2143	image/jpeg	copy-1103
2144	image/jpeg	copy-1840
2145	image/jpeg	copy-1228
2146	image/jpeg	copy-1226
2147	image/jpeg	copy-1233
2148	image/jpeg	copy-1109
2149	image/jpeg	copy-1223
2150	image/jpeg	copy-1104
2151	image/jpeg	copy-1227
2152	image/jpeg	copy-1235
2153	image/jpeg	copy-1229
2155	image/jpeg	copy-1230
2289	image/jpeg	copy-1302
2311	image/jpeg	copy-1742
2324	image/jpeg	copy-1745
2328	image/jpeg	copy-1748
2334	image/jpeg	copy-1510
2356	image/jpeg	copy-1157
2358	image/jpeg	copy-1484
2371	image/jpeg	copy-1494
2378	image/jpeg	copy-1658
2389	image/jpeg	copy-1650
2393	image/jpeg	copy-1659
2401	image/jpeg	copy-1610
2431	image/jpeg	copy-1228
2442	image/jpeg	copy-1317
2455	image/jpeg	copy-1092
2461	image/jpeg	copy-1386
2474	image/jpeg	copy-1802
2489	image/jpeg	copy-1887
2490	image/jpeg	copy-1873
2501	image/jpeg	copy-1687
2506	image/jpeg	copy-1749
2515	image/jpeg	copy-1751
2525	image/jpeg	copy-1906
2538	image/jpeg	copy-1903
2550	image/jpeg	BIOM_TerreAdelie_dec2021.jpg
2560	image/png	copy-1929
2572	image/jpeg	copy-1900
2576	image/jpeg	projet pédagogique ecole.jpg
2581	image/jpeg	copy-1081
2590	image/jpeg	copy-1951
2594	image/jpeg	copy-1956
2607	image/jpeg	SciencesParticipatives_BIOM_carte_2022.jpg
2608	image/jpeg	SciencesParticipatives_BIOM_graphiques_2022.jpg
2609	image/jpeg	SciencesParticipatives_BIOM_donuts_2022.jpg
2619	image/png	copy-1133
2620	image/jpeg	copy-1053
2631	image/jpeg	copy-1832
2640	image/jpeg	copy-2034
2653	image/jpeg	copy-2009
2659	image/jpeg	copy-1835
2154	image/jpeg	copy-1842
2290	image/jpeg	copy-1280
2298	image/jpeg	copy-1298
2301	image/jpeg	copy-1267
2312	image/jpeg	copy-1746
2316	image/jpeg	copy-1690
2335	image/jpeg	copy-1531
2346	image/jpeg	copy-1572
2361	image/jpeg	copy-1095
2362	image/jpeg	copy-1767
2380	image/jpeg	copy-1649
2384	image/jpeg	copy-1769
2406	image/jpeg	copy-1615
2410	image/jpeg	copy-1766
2419	image/jpeg	copy-1227
2438	image/jpeg	copy-1841
2443	image/jpeg	copy-1477
2445	image/jpeg	copy-1239
2463	image/jpeg	copy-1322
2470	image/jpeg	copy-1476
2475	image/jpeg	copy-1812
2482	image/jpeg	copy-1866
2491	image/jpeg	copy-1686
2492	image/jpeg	copy-1746
2502	image/jpeg	copy-1690
2516	image/jpeg	copy-1828
2527	image/jpeg	copy-1910
2539	image/jpeg	copy-1906
2561	image/png	copy-1930
2562	image/png	copy-1931
2563	image/png	copy-1932
2573	image/png	copy-1896
2582	image/jpeg	copy-1352
2591	image/jpeg	copy-1953
2610	image/jpeg	copy-1953
2614	image/jpeg	copy-1953
2623	image/jpeg	copy-2027
2632	image/jpeg	copy-1957
2641	image/jpeg	copy-2038
2650	image/jpeg	copy-2008
2654	image/jpeg	copy-2005
2658	image/jpeg	copy-2039
2662	image/jpeg	copy-2042
2156	image/jpeg	copy-1286
2157	image/jpeg	copy-1236
2159	image/jpeg	copy-1841
2161	image/jpeg	copy-1265
2293	image/jpeg	copy-1349
2297	image/jpeg	copy-1279
2313	image/jpeg	copy-1747
2319	image/jpeg	copy-1750
2338	image/jpeg	copy-1502
2341	image/jpeg	copy-1567
2364	image/jpeg	copy-1156
2367	image/jpeg	copy-1306
2370	image/jpeg	copy-1495
2381	image/jpeg	copy-1644
2403	image/jpeg	copy-1609
2413	image/jpeg	copy-1765
2423	image/jpeg	copy-1103
2433	image/jpeg	copy-1265
2446	image/jpeg	copy-1331
2464	image/jpeg	copy-1339
2476	image/jpeg	copy-1813
2486	image/jpeg	copy-1889
2493	image/jpeg	copy-1747
2504	image/jpeg	copy-1744
2508	image/jpeg	copy-1754
2511	image/jpeg	copy-1773
2517	image/jpeg	copy-1829
2529	image/jpeg	copy-1909
2540	image/jpeg	copy-1904
2564	image/jpeg	copy-1837
2574	image/jpeg	copy-1895
2577	image/jpeg	projet pédagogique ecole.jpg
2583	image/jpeg	copy-1342
2593	image/jpeg	copy-1832
2602	image/jpeg	copy-1837
2611	image/jpeg	copy-1959
2624	image/jpeg	copy-2028
2633	image/jpeg	copy-2032
2642	image/jpeg	copy-2003
2645	image/jpeg	copy-2011
2158	image/jpeg	copy-1285
2294	image/jpeg	copy-1287
2306	image/jpeg	copy-1270
2317	image/jpeg	copy-1744
2325	image/jpeg	copy-1751
2330	image/jpeg	copy-1874
2347	image/jpeg	copy-1529
2366	image/jpeg	copy-1097
2383	image/jpeg	copy-1656
2392	image/jpeg	copy-1643
2400	image/jpeg	copy-1763
2409	image/jpeg	copy-1616
2418	image/jpeg	copy-1878
2436	image/jpeg	copy-1842
2448	image/jpeg	copy-1315
2453	image/jpeg	copy-1325
2456	image/jpeg	copy-1323
2466	image/jpeg	copy-1474
2477	image/jpeg	copy-1814
2484	image/jpeg	copy-1820
2494	image/jpeg	copy-1750
2513	image/jpeg	copy-1893
2518	image/jpeg	copy-1822
2530	image/jpeg	copy-1908
2541	image/jpeg	copy-1905
2565	image/jpeg	copy-1916
2571	image/png	BIOM_TerresAustrales_janv2022.png
2575	image/jpeg	copy-1897
2584	image/jpeg	copy-1083
2595	image/jpeg	copy-1837
2603	image/jpeg	copy-1955
2612	image/jpeg	copy-1958
2625	image/jpeg	copy-2029
2634	image/jpeg	copy-1835
2643	image/jpeg	copy-2004
2647	image/jpeg	copy-2015
2160	image/jpeg	copy-1843
2295	image/jpeg	copy-1385
2300	image/jpeg	copy-1307
2318	image/jpeg	copy-1687
2320	image/jpeg	copy-1753
2331	image/jpeg	copy-1530
2339	image/jpeg	copy-1580
2345	image/jpeg	copy-1571
2351	image/jpeg	copy-1527
2360	image/jpeg	copy-1478
2365	image/jpeg	copy-1565
2385	image/jpeg	copy-1647
2387	image/jpeg	copy-1655
2395	image/jpeg	copy-1653
2399	image/jpeg	copy-1606
2408	image/jpeg	copy-1621
2415	image/jpeg	copy-1689
2425	image/jpeg	copy-1840
2430	image/jpeg	copy-1230
2449	image/jpeg	copy-1238
2451	image/jpeg	copy-1240
2460	image/jpeg	copy-1324
2478	image/jpeg	copy-1817
2495	image/jpeg	copy-1691
2499	image/jpeg	copy-1748
2514	image/jpeg	copy-1894
2519	image/jpeg	copy-1911
2522	image/jpeg	copy-1912
2526	image/jpeg	copy-1914
2532	image/jpeg	copy-1904
2543	image/jpeg	copy-1913
2566	image/jpeg	copy-1924
2585	image/jpeg	copy-1341
2597	image/jpeg	copy-1954
2600	image/jpeg	copy-1832
2613	image/jpeg	copy-1960
2626	image/jpeg	copy-2016
2635	image/jpeg	copy-2016
2644	image/jpeg	copy-2006
2648	image/jpeg	copy-2014
2657	image/jpeg	copy-1837
2162	image/jpeg	copy-1844
2163	image/jpeg	copy-1622
2164	image/jpeg	copy-1622
2165	image/jpeg	DSC_1815.jpg
2166	image/jpeg	Tchaourembo 11022009.jpg
2167	image/jpeg	copy-1806
2168	image/jpeg	copy-1806
2169	image/jpeg	copy-1806
2170	image/jpeg	copy-1806
2171	image/jpeg	copy-1806
2172	image/jpeg	copy-1806
2173	image/jpeg	copy-1868
2174	image/jpeg	copy-1803
2175	image/jpeg	copy-1787
2176	image/jpeg	copy-1809
2177	image/jpeg	copy-1785
2178	image/jpeg	copy-1806
2179	image/jpeg	copy-1806
2180	image/jpeg	copy-1805
2181	image/jpeg	copy-1785
2182	image/jpeg	copy-1809
2183	image/jpeg	copy-1868
2184	image/jpeg	copy-1804
2185	image/jpeg	copy-1791
2186	image/jpeg	copy-1803
2187	image/jpeg	copy-1787
2188	image/jpeg	copy-1808
2189	image/jpeg	copy-1807
2190	image/jpeg	copy-1806
2191	image/jpeg	copy-1806
2192	image/jpeg	copy-1806
2193	image/jpeg	copy-1804
2194	image/jpeg	copy-1805
2195	image/jpeg	copy-1868
2196	image/jpeg	copy-1787
2197	image/jpeg	copy-1808
2198	image/jpeg	copy-1807
2199	image/jpeg	copy-1791
2200	image/jpeg	copy-1803
2201	image/jpeg	copy-1809
2202	image/jpeg	copy-1785
2203	image/jpeg	copy-1503
2204	image/jpeg	copy-1531
2205	image/jpeg	copy-1580
2206	image/jpeg	copy-1605
2207	image/jpeg	copy-1508
2208	image/jpeg	copy-1530
2209	image/jpeg	copy-1502
2210	image/jpeg	copy-1527
2211	image/jpeg	copy-1510
2212	image/jpeg	copy-1571
2213	image/jpeg	copy-1576
2214	image/jpeg	copy-1568
2215	image/jpeg	copy-1526
2216	image/jpeg	copy-1566
2217	image/jpeg	copy-1529
2218	image/jpeg	copy-1569
2219	image/jpeg	copy-1578
2220	image/jpeg	copy-1504
2221	image/jpeg	copy-1567
2222	image/jpeg	copy-1570
2223	image/jpeg	copy-1572
2224	image/jpeg	copy-1847
2225	image/jpeg	copy-1761
2226	image/jpeg	copy-1756
2227	image/jpeg	copy-1774
2228	image/jpeg	copy-1757
2229	image/jpeg	copy-1708
2230	image/jpeg	copy-1759
2231	image/jpeg	copy-1821
2232	image/jpeg	copy-1776
2233	image/jpeg	copy-1775
2234	image/jpeg	copy-1828
2235	image/jpeg	copy-1822
2236	image/jpeg	copy-1829
2237	image/jpeg	copy-1776
2238	image/jpeg	copy-1821
2239	image/jpeg	copy-1775
2240	image/jpeg	copy-1828
2241	image/jpeg	copy-1822
2242	image/jpeg	copy-1829
2243	image/jpeg	copy-1761
2244	image/jpeg	copy-1756
2245	image/jpeg	copy-1759
2246	image/jpeg	copy-1708
2247	image/jpeg	copy-1757
2248	image/jpeg	copy-1774
2249	image/jpeg	Poll_bardonMartial (2).jpeg
2250	image/jpeg	copy-1861
2251	image/jpeg	copy-1852
2252	image/jpeg	copy-1854
2253	image/jpeg	copy-1853
2254	image/jpeg	copy-1860
2255	image/jpeg	copy-1857
2256	image/jpeg	copy-1850
2257	image/jpeg	copy-1858
2258	image/jpeg	copy-1855
2259	image/jpeg	copy-1851
2260	image/jpeg	copy-1859
2261	image/jpeg	copy-1856
2262	image/jpeg	Paysage fleuve Guyane.jpg
2263	image/jpeg	BUG_MarilouHircq.jpg
2264	image/jpeg	BUG_MarilouHircq.jpg
2265	image/jpeg	copy-1457
2266	image/jpeg	copy-1167
2267	image/jpeg	copy-1869
2268	image/jpeg	copy-1165
2269	image/jpeg	copy-1008
2270	image/jpeg	copy-1295
2271	image/jpeg	copy-1007
2272	image/jpeg	copy-1288
2273	image/jpeg	copy-1225
2274	image/jpeg	copy-1296
2275	image/jpeg	copy-1467
2276	image/jpeg	copy-1294
2277	image/jpeg	copy-1459
2278	image/jpeg	copy-1462
2279	image/jpeg	copy-1012
2280	image/jpeg	copy-1305
2281	image/jpeg	copy-1461
2282	image/jpeg	copy-1010
2283	image/jpeg	copy-1168
2284	image/jpeg	copy-1458
2296	image/jpeg	copy-1348
2299	image/jpeg	copy-1064
2303	image/jpeg	copy-1268
2321	image/jpeg	copy-1693
2326	image/jpeg	copy-1773
2332	image/jpeg	copy-1605
2340	image/jpeg	copy-1568
2350	image/jpeg	copy-1526
2354	image/jpeg	copy-1158
2359	image/jpeg	copy-1479
2368	image/jpeg	copy-1300
2388	image/jpeg	copy-1622
\.


--
-- Data for Name: indicator; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.indicator (id, slug, biom_id, is_rounded, rank) FROM stdin;
1004	taux-boisement	f591fb1b-bf6f-486b-b89f-b9383eed8e6a	t	2
1007	recifs-coralliens	a2f912ab-19e6-4394-b3c8-57035e21e24e	t	5
1002	especes-inventoriees	b14bdecd-5a1d-4594-8303-5d6618bb2d0a	t	1
1006	nouvelles-especes	d880a1c3-bf90-46c5-b224-a46958529adf	t	8
1003	especes-menacees	9f6e6310-56cd-4ef1-9d3d-90b88f9f15fb	t	4
1001	especes-endemiques	9493c8d0-0dfe-43d4-bbf6-d3c5f99f54d5	f	3
1005	conservation-mangroves	94128379-c202-4ad6-b358-0c8d46bdb500	t	7
1000	especes-exotiques-envahissantes	8ba9fc7e-12e9-4c7b-93b3-5b83af14a13d	t	6
\.


--
-- Data for Name: indicator_category; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.indicator_category (indicator_id, category_id) FROM stdin;
1004	1002
1007	1003
1005	1003
1000	1000
1002	1001
1006	1001
1003	1000
1001	1001
\.


--
-- Data for Name: indicator_ecogesture; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.indicator_ecogesture (indicator_id, ecogesture_id) FROM stdin;
1004	1006
1004	1005
1007	1001
1005	1002
1005	1005
1000	1003
1002	1007
1006	1007
1003	1006
1003	1000
1003	1005
1001	1006
1001	1000
1001	1005
\.


--
-- Data for Name: indicator_value; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.indicator_value (id, indicator_id, territory, value, unit) FROM stdin;
1635	1003	OUTRE_MER	19.6979807	%
1641	1003	ILES_SUBANTARCTIQUES	31.03448276	%
1637	1003	MARTINIQUE	19.40384829	%
1638	1003	POLYNESIE_FRANCAISE	63	%
1639	1003	REUNION	34.23298707	%
1640	1003	MAYOTTE	35.92505855	%
1636	1003	GUADELOUPE	28.63712677	%
1644	1003	TERRE_ADELIE	46.15384615	%
1642	1003	ILES_EPARSES	22.22222222	%
1643	1003	GUYANE	11.11842105	%
1552	1007	OUTRE_MER	29.26829268	%
1556	1007	NOUVELLE_CALEDONIE	18.51851852	%
1554	1007	MARTINIQUE	50	%
1558	1007	WALLIS_ET_FUTUNA	25	%
1557	1007	POLYNESIE_FRANCAISE	40	%
1559	1007	REUNION	21.42857143	%
1560	1007	MAYOTTE	30	%
1553	1007	GUADELOUPE	60	%
1555	1007	SAINT_MARTIN	33.33333333	%
1601	1002	OUTRE_MER	88966	
1609	1002	REUNION	10915	
1602	1002	GUADELOUPE	10527	
1605	1002	SAINT_BARTHELEMY	2140	
1611	1002	ILES_SUBANTARCTIQUES	2613	
1603	1002	MARTINIQUE	7422	
1619	1006	OUTRE_MER	546.333333333333	
1624	1006	NOUVELLE_CALEDONIE	219.333333333333	
1625	1006	POLYNESIE_FRANCAISE	51	
1633	1006	SAINT_PIERRE_ET_MIQUELON	0	
1627	1006	REUNION	17.3333333333333	
1620	1006	GUADELOUPE	21.3333333333333	
1623	1006	SAINT_BARTHELEMY	0.666666666666667	
1622	1006	SAINT_MARTIN	1	
1631	1006	CLIPPERTON	15	
1629	1006	ILES_SUBANTARCTIQUES	2.66666666666667	
1621	1006	MARTINIQUE	38.6666666666667	
1626	1006	WALLIS_ET_FUTUNA	5	
1628	1006	MAYOTTE	9.33333333333333	
1634	1006	TERRE_ADELIE	4	
1630	1006	ILES_EPARSES	4	
1632	1006	GUYANE	177.666666666667	
1540	1004	OUTRE_MER	84.64046368	%
1545	1004	NOUVELLE_CALEDONIE	45.78774617	%
1547	1004	WALLIS_ET_FUTUNA	42.85714286	%
1551	1004	SAINT_PIERRE_ET_MIQUELON	13.04347826	%
1546	1004	POLYNESIE_FRANCAISE	42.34972678	%
1549	1004	MAYOTTE	15.78947368	%
1544	1004	SAINT_BARTHELEMY	0	%
1550	1004	GUYANE	98.64110653	%
1543	1004	SAINT_MARTIN	20	%
1588	1000	OUTRE_MER	60	
1593	1000	NOUVELLE_CALEDONIE	38	
1600	1000	SAINT_PIERRE_ET_MIQUELON	7	
1594	1000	POLYNESIE_FRANCAISE	36	
1596	1000	REUNION	34	
1589	1000	GUADELOUPE	17	
1592	1000	SAINT_BARTHELEMY	11	
1598	1000	CLIPPERTON	1	
1591	1000	SAINT_MARTIN	11	
1590	1000	MARTINIQUE	18	
1595	1000	WALLIS_ET_FUTUNA	26	
1597	1000	MAYOTTE	19	
1599	1000	GUYANE	11	
1587	1005	OUTRE_MER	25.21552908	%
1645	1001	OUTRE_MER	17846	
1650	1001	NOUVELLE_CALEDONIE	8673	
1659	1001	SAINT_PIERRE_ET_MIQUELON	0	
1651	1001	POLYNESIE_FRANCAISE	2673	
1653	1001	REUNION	1558	
1646	1001	GUADELOUPE	1399	
1649	1001	SAINT_BARTHELEMY	70	
1657	1001	CLIPPERTON	16	
1648	1001	SAINT_MARTIN	63	
1655	1001	ILES_SUBANTARCTIQUES	199	
1647	1001	MARTINIQUE	700	
1652	1001	WALLIS_ET_FUTUNA	29	
1654	1001	MAYOTTE	335	
1660	1001	TERRE_ADELIE	2	
1656	1001	ILES_EPARSES	38	
1658	1001	GUYANE	2551	
1606	1002	NOUVELLE_CALEDONIE	28092	
1615	1002	SAINT_PIERRE_ET_MIQUELON	2112	
1607	1002	POLYNESIE_FRANCAISE	11776	
1613	1002	CLIPPERTON	915	
1604	1002	SAINT_MARTIN	2234	
1608	1002	WALLIS_ET_FUTUNA	2691	
1610	1002	MAYOTTE	6162	
1616	1002	TERRE_ADELIE	1007	
1612	1002	ILES_EPARSES	2042	
1614	1002	GUYANE	28940	
1542	1004	MARTINIQUE	46.22641509	%
1548	1004	REUNION	35.2	%
1541	1004	GUADELOUPE	42.26190476	%
\.


--
-- Data for Name: media_category; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.media_category (id, name) FROM stdin;
1004	Mayotte
1005	Martinique
1006	Guyane
1007	Guadeloupe
1008	Terres Australes et Antarctiques françaises
1009	Nouvelle-Calédonie
1010	La Réunion
1011	Polynésie française
1012	Wallis-et-Futuna
1013	Saint-Pierre-et-Miquelon
1014	Clipperton
1015	Saint-Barthélemy
1016	Saint-Martin
1017	Tout territoires
\.


--
-- Data for Name: media_category_relation; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.media_category_relation (media_page_id, category_id) FROM stdin;
1043	1005
1042	1004
1047	1006
1050	1009
1044	1006
1051	1007
1052	1017
1053	1010
1053	1017
1054	1008
1049	1008
\.


--
-- Data for Name: page; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.page (id, name, model_name, title) FROM stdin;
1006	protection-recifs-coralliens	ecogesture	Protéger les récifs coralliens
1018	ecogeste-agir	ecogesture-act	Encadré "agir pour la biodiversité" fiche écogeste
1026	limiation-plastique	ecogesture	Réduire les déchets et le plastique
1024	protection-contre-eee	ecogesture	Protection contre les EEE
1017	ecogestes	ecogestures	Accueil écogestes
1002	antilles	territory-zone	bassin antillais
1023	ne-pas-jeter-dechets-nature	ecogesture	Je ne jette pas mes déchets dans la nature
1029	s-investir-sur-le-terrain	ecogesture	S'investir sur le terrain
1008	especes-endemiques	indicator	Espèces endémiques
1050	Tableau de bord forêts sèches	article	Tableau de bord forets seches
1009	especes-inventoriees	indicator	Espèces indigènes
1003	territoires	territories	Découvrez les outre-mer
1014	recifs-coralliens	indicator	Récifs coralliens
1000	accueil	home	Compteur Biodiversité Outre-mer
1010	especes-menacees	indicator	Espèces éteintes et menacées
1046	media	Accueil médias	Médias
1011	taux-boisement	indicator	Proportion de forêts
1001	guadeloupe	territory	Guadeloupe
1015	martinique	territory	Martinique
1028	exploitation-especes-protegees	ecogesture	Préserver les espèces protégées 
1025	protection-faune	ecogesture	Respecter la faune sauvage
1027	protection-flore	ecogesture	Préserver la flore sauvage
1054	Faune TAAF	report	La Faune sauvage des Terres Australes françaises
1039	mayotte	territory	Mayotte
1049	Balade dans les îles Eparses	report	Balade dans les îles Eparses
1045	terre-adelie	territory	La Terre Adélie
1041	iles-subantarctiques	territory	Les Terres Australes françaises 
1051	Ti bet a limie	interview	Ti bet a limie 
1043	Entretien Eddy Dumbardon-Martial - Pollinisateurs Caravelle	interview	Entretien Eddy Dumbardon - Martial
1044	Entretien avec Marilou Hircq - BUG	interview	Entretien avec Marilou Hircq - BUG
1042	Entretien avec Jeanne Wagner	interview	Entretien avec Jeanne Wagner
1031	wallis-et-futuna	territory	Wallis-et-Futuna
1021	reunion	territory	La Réunion
1019	sciences-participatives	science	Sciences participatives
1048	iles-eparses	territory	Iles Eparses
1020	nouvelle-caledonie	territory	Nouvelle-Calédonie
1052	Synthèse étude sciences participatives	article	synthese résultats etude sciences participatives outre-mer
1038	guyane	territory	Guyane
1022	saint-pierre-et-miquelon	territory	Saint-Pierre-et-Miquelon
1007	apropos	about	A propos
1047	agents-OFB-Guyane	report	Terrain agents OFB Guyane
1013	nouvelles-especes	indicator	Nouvelles espèces décrites
1040	polynesie	territory	Polynésie française
1053	Compagnonnage TeMeUm	article	Compagnonnage Te Me Um
1005	indicateurs	indicators	Tous les indicateurs
1016	agir-ensemble	act	Agir ensemble
1030	mentions-legales	legal-terms	Mentions légales
1004	especes-exotiques-envahissantes	indicator	Espèces exotiques envahissantes 2
1012	conservation-mangroves	indicator	Conservation des mangroves d'outre-mer
\.


--
-- Data for Name: page_element; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.page_element (id, page_id, type, key, text, image_id, alt, href, title) FROM stdin;
68825	1005	LINK	onb.link	Retrouvez les indicateurs sur le site de l’ONB	\N	\N	https://naturefrance.fr/indicateurs	f
68826	1005	TEXT	inpn.description	L’INPN recense les espèces (animales, végétales et fongiques), les habitats naturels, les espaces protégés et le patrimoine géologique, en métropole et en outre-mer. L’ensemble des acteurs de l’environnement contribuent à la mise à jour régulière des informations sur le site de l’INPN dans le cadre du Système d’information de l’Inventaire national du patrimoine naturel (SINP). L’INPN met à disposition de tous des données de référence, validées par des réseaux d'experts. Le Muséum national d'Histoire naturelle en assure la responsabilité scientifique.	\N	\N	\N	f
68827	1005	IMAGE	image	\N	1016	Serpent liane perroquet, *Leptophis ahaetulla*, Guyane © Raphaël Gailhac - OFB	\N	f
68828	1005	TEXT	questions.1.quote	Avec ses territoires d’outre-mer, la France a donc une forte responsabilité dans la conservation de la biodiversité mondiale.	\N	\N	\N	f
68829	1005	TEXT	questions.2.answer	De nombreux scientifiques alertent sur la crise de biodiversité actuelle, qui pourrait être la 6<sup>e</sup> extinction de masse à l’échelle des temps géologiques. En effet, le rythme actuel des disparitions d’espèces observé est 100 à 1000 fois supérieur au taux naturel de disparition ! On estime que près de la moitié des espèces vivantes pourrait disparaitre d’ici un siècle.\nLes activités humaines en sont les principales responsables. Cinq causes majeures sont identifiées, qui se conjuguent entre elles : destruction et fragmentation des milieux, surexploitation des espèces, pollutions, changements climatiques et introduction d’espèces exotiques envahissantes.	\N	\N	\N	f
69327	1025	IMAGE	presentation.file	\N	1469	affiche écogeste respect faune sauvage	\N	f
69328	1025	CHECKBOX	presentation.shadowed	true	\N	\N	\N	f
69329	1025	IMAGE	action.cards.2.icon	\N	1129	chien	\N	f
69330	1025	IMAGE	action.cards.3.icon	\N	1130	véto	\N	f
69331	1025	TEXT	presentation.name	Je respecte la faune sauvage	\N	\N	\N	f
69332	1025	IMAGE	action.cards.0.icon	\N	1127	distance	\N	f
69333	1025	IMAGE	presentation.image	\N	1126	Iguane endémique des Petites Antilles © Fabien Lefebvre - Association ACWAA	\N	f
69334	1025	TEXT	understand.text	Observer la faune dans son milieu naturel est une chance et une expérience formidable. Cependant, sur terre comme en mer, déranger un animal peut le mettre en péril en occasionnant un stress important et une dépense d’énergie inutile. Il risque également d’abandonner son nid ou ses petits, se blesser, être plus facilement à la merci d’un prédateur…\n\nLes conséquences sont d’autant plus importantes lorsqu’il s’agit d’espèces très menacées, pour laquelle la survie de chaque individu compte.\n\nL'impact des chiens peut être catastrophique pour la faune sensible des outre-mer, que ce soit par prédation ou par le stress qu'ils occasionnent (poursuite, aboiements, destruction de nids,...). En Nouvelle-Calédonie, ils ont joué un rôle non-négligeable dans le déclin de la population de Cagous.\nDans la plupart des espaces protégés, leur présence, même tenus en laisse n'est pas autorisée. 	\N	\N	\N	f
69335	1025	IMAGE	action.cards.1.icon	\N	1128	bruits	\N	f
69336	1025	TEXT	action.cards.3.description	Si un animal me parait en détresse, avant toute action, je contacte un professionnel (centre de soin, gestionnaires de réserve) afin de connaitre la démarche la plus adaptée pour lui porter secours.	\N	\N	\N	f
69337	1025	TEXT	action.cards.2.description	Je tiens mon chien en laisse et je respecte la règlementation dans les lieux où sa présence n’est pas autorisée.	\N	\N	\N	f
69338	1025	TEXT	presentation.category	Sur terre et en mer	\N	\N	\N	f
69339	1025	TEXT	action.cards.1.description	Je limite les bruits (cris, musique…) pour que ma présence reste discrète.  	\N	\N	\N	f
69340	1025	TEXT	presentation.description	Pour ne pas perturber les occupants des milieux naturels, mieux vaut se faire discret et ne pas laisser de traces de son passage.	\N	\N	\N	f
69341	1025	TEXT	action.title	Pour profiter de la nature sans déranger ses occupants 	\N	\N	\N	f
69342	1025	TEXT	understand.quote	Une tortue en ponte est très sensible au dérangement, cela peut la conduire à abandonner son nid. 	\N	\N	\N	f
69343	1025	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
69344	1025	TEXT	action.cards.0.description	Je reste à distance des animaux sauvages que je rencontre et je ne cherche pas à les toucher	\N	\N	\N	f
69619	1052	TEXT	body.titre_question.1.citation.citationElement	Qu’est-ce que les sciences participatives ?	\N	\N	\N	f
68359	1048	TEXT	events.2.description	Cartographie de l'archipel des Glorieuses par Mr. Du Guilly	\N	\N	\N	f
68360	1048	TEXT	events.3.description	Naufrage de l'*Utile* à Tromelin	\N	\N	\N	f
69620	1052	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
68361	1048	IMAGE	species.2.image	\N	2481	*Chelonia mydas* - Tortue verte © Maxime Amy - TAAF	\N	f
68362	1048	IMAGE	identity.image	\N	2473	Couple de fous à pieds rouges © Nelly Gravier - TAAF	\N	f
68784	1013	TEXT	visual.subtitle	Visualisez l'évolution du nombre de nouvelles espèces décrites par année	\N	\N	\N	f
68785	1013	TEXT	understand.title1	L'outre-mer : un vivier d'espèces à découvrir	\N	\N	\N	f
68786	1013	TEXT	understand.paragraphs.1.text	Les estimations actuelles du nombre d'espèces présentes sur Terre oscillent entre 8 et 10 millions (hors bactéries), et seules un peu plus de 2 millions d'espèces ont été décrites à ce jour. A l’échelle mondiale, environ 20 000 nouvelles espèces sont décrites chaque année. Cette tâche titanesque est complexifiée par le manque de spécialistes qui s’y consacrent, en particulier chez les invertébrés.  \n  \nCependant, le travail de description morphologique est désormais accompagné de l’utilisation d’analyses ADN qui permettent de distinguer des espèces « cryptiques » c’est-à-dire très semblables morphologiquement mais en réalité différentes génétiquement, ce qui peut par exemple expliquer des différences d’adaptations aux conditions environnementales.	\N	\N	\N	f
68787	1013	TEXT	understand.title2	La taxonomie : la science de la description du vivant	\N	\N	\N	f
68788	1013	TEXT	presentation.descriptionTerritories	nouvelles espèces sont décrites par an	\N	\N	\N	f
68789	1013	TEXT	understand.paragraphs.0.title	Quelques exemples de découvertes récentes	\N	\N	\N	f
68790	1013	TEXT	understand.keyword	especes	\N	\N	\N	f
68791	1013	TEXT	ecogestures.title	Comment aider à la progression des connaissances scientifiques ?	\N	\N	\N	f
68792	1013	IMAGE	presentation.image	\N	2061	Nymphale bois canon, *Historis Odius*, Martinique © Fabien Lefebvre - Association ACWAA	\N	f
68793	1013	TEXT	understand.paragraphs.1.title	Encore un grand nombre d’espèces inconnues	\N	\N	\N	f
68794	1013	IMAGE	visual.image	\N	2562	Figure evolution espèces décrites et groupes	\N	f
68795	1013	TEXT	visual.title	La description de nouvelles espèces en outre-mer	\N	\N	\N	f
68796	1013	LINK	understand.article	aucun	\N	\N	aucun	f
69345	1027	IMAGE	presentation.file	\N	1468	affiche écogeste préservation flore sauvage	\N	f
69346	1027	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
69347	1027	IMAGE	action.cards.2.icon	\N	1136	nettoyer	\N	f
69348	1027	TEXT	presentation.name	Je préserve la flore sauvage  	\N	\N	\N	f
69349	1027	IMAGE	action.cards.0.icon	\N	1138	balisage	\N	f
69350	1027	IMAGE	presentation.image	\N	1140	© Fabien Lefebvre - Association ACWAA	\N	f
69351	1027	TEXT	understand.text	Dans les territoires ultramarins, de nombreuses espèces de plantes sont endémiques et leur répartition est parfois limitée à une très petite zone. Piétinements ou cueillettes intensives peuvent menacer la survie de ces espèces végétales, déjà soumises à de plus importantes pressions : changements climatiques, défrichements pour créer des espaces agricoles, pâturages d’animaux domestiques, incendies…\n\nAttention également aux plantes exotiques envahissantes : certaines plantes peuvent se développer à partir de très petits fragments et les très petites graines de certaines espèces peuvent facilement se coincer dans les chaussures ! C’est pourquoi les gestionnaires prennent d’importantes précautions lorsqu'ils mettent en place des opérations d’éradication de ces espèces. \n	\N	\N	\N	f
69352	1027	IMAGE	action.cards.1.icon	\N	1137	protection	\N	f
69353	1027	TEXT	action.cards.2.description	Je nettoie mes chaussures et mon matériel de randonnée régulièrement pour ne pas disséminer d’espèces envahissantes.	\N	\N	\N	f
69354	1027	TEXT	presentation.category	Sur terre	\N	\N	\N	f
69355	1027	TEXT	action.cards.1.description	Je ne cueille pas de plantes sauvages, il peut s’agir d’espèces fragiles et protégées. Si je souhaite prélever des plantes, je me renseigne d’abord sur la règlementation et les espèces protégées.	\N	\N	\N	f
69356	1027	TEXT	presentation.description	Préserver la flore, c'est préserver l'équilibre des écosystèmes. 	\N	\N	\N	f
69357	1027	TEXT	action.title	Pour profiter des espaces naturels sans impacter la flore 	\N	\N	\N	f
69358	1027	TEXT	understand.quote	256 espèces de végétaux sont menacées en Guadeloupe	\N	\N	\N	f
69359	1027	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
69360	1027	TEXT	action.cards.0.description	Je ne sors pas des sentiers balisés, ils sont là pour me permettre de ne pas abimer les milieux.	\N	\N	\N	f
69621	1052	TEXT	body.titre_question.0.paragraph.paragraphText	Et l’enjeu est de taille ! Au moins 80% de la biodiversité française se situerait dans les territoires d’Outre-mer ! <strong> Un premier panorama, permettant l’inventaire et la caractérisation de ces activités de sciences participatives, vient d’être publié</strong>. Quelques 145 programmes de sciences participatives ont été identifiés. Nous vous proposons, ici, une synthèse de ce panorama pour en exposer les principales caractéristiques, mais aussi, les enjeux, difficultés et opportunités, liées au déploiement des Sciences Participatives dans les Outre-mer.	\N	\N	\N	f
69622	1052	TEXT	presentation.name	Panorama des programmes de sciences participatives ultramarins : les résultats 	\N	\N	\N	f
69623	1052	TEXT	body.titre_question.5.citation.citationElement	Quelles sont les caractéristiques d’un programme de Sciences participatives dans les Outre-mer ?	\N	\N	\N	f
35064	1017	TEXT	presentation	Les activités humaines sont à l’origine du déclin de la biodiversité et la dégradation des écosystèmes. Aujourd’hui plus que jamais, il est nécessaire de remettre en question nos comportements et nos choix de consommation, au quotidien ou en voyage, chez soi ou en milieu naturel, pour mieux prendre soin de la biodiversité qui nous entoure. Petits efforts ou grands gestes, nous pouvons tous être acteurs du changement, pour limiter notre impact sur le monde qui nous entoure.  \n\nL’objectif du Compteur est de mettre en avant des écogestes adaptés aux contextes ultramarins.	\N	\N	\N	f
35065	1017	IMAGE	image	\N	1073	© DR	\N	f
35066	1017	TEXT	quote	Des actions concrètes pour agir dès maintenant et préserver cette biodiversité les espèces et les écosystèmes	\N	\N	\N	f
35067	1017	TEXT	question	Qu’est-ce qu’un écogeste ? 	\N	\N	\N	f
69624	1052	IMAGE	presentation.image	\N	2614	 Observateur en forêt, Guyane © Pierre-Olivier Jay - 97px	\N	f
69625	1052	TEXT	presentation.author	Marine Didier et Jessica Coulon	\N	\N	\N	f
69626	1052	TEXT	body.titre_question.13.citation.citationElement	Conclusions et recommandations principales du rapport	\N	\N	\N	f
69627	1052	TEXT	presentation.date	15/02/2022	\N	\N	\N	f
69628	1052	IMAGE	body.titre_question.4.image.imageElement	\N	2612	*	\N	f
69629	1052	TEXT	body.titre_question.3.citation.citationElement	Où retrouve-t-on les programmes de sciences participatives ultramarins ? 	\N	\N	\N	f
69630	1052	IMAGE	body.titre_question.7.image.imageElement	\N	2611	*	\N	f
69631	1052	IMAGE	body.titre_question.11.image.imageElement	\N	2613	*	\N	f
69632	1052	TEXT	body.titre_question.9.citation.citationElement	Les sciences participatives dans les outre-mer : forces, faiblesses, menaces et opportunités	\N	\N	\N	f
68363	1048	TEXT	species.3.description	On trouve sur les différentes îles Éparses quinze espèces de reptiles terrestres. Il s'agit de scinques (lézards de la famille des Scincidés) et de geckos (famille des Gekkonidés). Certaines espèces ont probablement été introduites, mais cinq sont endémiques : deux d'Europa, deux de Juan de Nova et une aux Glorieuses. Ces populations fragiles sont menacées par les prédateurs introduits (chats, rats, souris).  \n  \nStatuts sur la Liste rouge des reptiles des îles Éparses, pour les cinq espèces endémiques :\n[*Cryptoblepharus caudatus*](https://inpn.mnhn.fr/espece/cd_nom/785476), [*Lygodactylus insularis*](https://inpn.mnhn.fr/espece/cd_nom/976758) et [*Flexiseps valhallae*](https://inpn.mnhn.fr/espece/cd_nom/902180) : en danger critique d'extinction\n[*Cryptoblepharus gloriosus gloriosus*](https://inpn.mnhn.fr/espece/cd_nom/714621) : vulnérable\n[*Cryptoblepharus bitaeniatus*](https://inpn.mnhn.fr/espece/cd_nom/712368) : quasi-menacée.	\N	\N	\N	f
68364	1048	TEXT	events.7.description	Classement d'Europa en site Ramsar	\N	\N	\N	f
68365	1048	TEXT	statistics.3.number	637 hectares	\N	\N	\N	f
68366	1048	TEXT	events.7.date	2011	\N	\N	\N	f
68367	1048	TEXT	interests.locations.0.name	L'archipel des Glorieuses	\N	\N	\N	f
68368	1048	TEXT	species.1.description	Le Filao ([*Casuarina equisetifolia*](https://inpn.mnhn.fr/espece/cd_nom/456837)) est un arbre aux rameaux filiforme qui pousse sur les sols sablonneux chargés en sel. Il peut atteindre une hauteur de 30 m, et bien qu'il ressemble à un pin, ce n'est pas un conifère. Ses fruits sont de petites billes formées de cônes à écailles pointues qui renferment les graines.  \n  \nOriginaire d'Asie du Sud-est et d'Australie, le Filao a été introduit à Europa, Juan de Nova et Grande Glorieuse, où il s’avère envahissant et modifie l’écosystème dans lequel il se développe, notamment car il libère des substances qui rendent le sol infertile pour les autres espèces. 	\N	\N	\N	f
68797	1013	TEXT	understand.paragraphs.0.text	Parmi les espèces récemment décrites dans les territoires d’outre-mer français, se trouvent par exemple une nouvelle espèce de grenouille, la Rainette [*Boana courtoisae*](https://inpn.mnhn.fr/espece/cd_nom/982223), en Guyane, un serpent fouisseur, [*Madatyphlops eudelini*](https://inpn.mnhn.fr/espece/cd_nom/979094), à Mayotte ou encore *[Psychotria paulae](https://inpn.mnhn.fr/espece/cd_nom/851490)*, une plante extrêmement rare, endémique de Tahiti (Polynésie française).  \n  \nCes découvertes sont parfois réalisées parmi les spécimens conservés dans des musées, collectés depuis longtemps sans avoir été correctement identifiés. Malheureusement, il arrive qu’il s’agisse d’espèces déjà éteintes dans la nature, c’est par exemple le cas en Guadeloupe du lézard [*Leiocephalus roquetus*](https://inpn.mnhn.fr/espece/cd_nom/977440) décrit en 2021. 	\N	\N	\N	f
64719	1020	IMAGE	species.9.image	\N	2463	*Syzygium acre* © Vanessa Hequet	\N	f
68369	1048	TEXT	species.2.description	Cinq des sept espèces de tortues marines se retrouvent dans l’océan Indien et les îles Éparses sont des sites majeurs pour leur alimentation et pour la reproduction de la Tortue verte ([*Chelonia mydas*](https://inpn.mnhn.fr/espece/cd_nom/77338)) et la Tortue imbriquée ([*Eretmochelys imbricata*](https://inpn.mnhn.fr/espece/cd_nom/77347)), en particulier Europa, où 2&nbsp;000 à 10&nbsp;000 femelles viennent pondre chaque année.\nUne même femelle revient pondre plusieurs fois dans la même saison, à quelques jours d'intervalle. A chaque fois, elle déposera entre 100 et 200 œufs, qui mettrons 8 à 10 semaines à éclore. \nGrandes migratrices, les tortues marines sont des espèces fortement menacées par les activités humaines : destruction de leurs habitats (sites de ponte et d'alimentation), prises accidentelles de pêche, collisions avec les engins motorisés et pollutions. Protégées, elles sont cependant toujours largement braconnées à travers le monde. \n\nStatut sur la Liste rouge des reptiles des îles Éparses : \nTortue imbriquée : en danger critique\nTortue verte : en danger.	\N	\N	\N	f
68370	1048	TEXT	events.0.description	Découverte de Juan de Nova par le navigateur du même nom, qu'il baptise d'abord *Agalega* (La Galicienne)	\N	\N	\N	f
68830	1005	TEXT	questions.0.answer	La biodiversité, ou diversité biologique, désigne la diversité des formes de vie sur terre, c’est à dire l’ensemble du tissu vivant de la planète : plantes, animaux, champignons, bactéries, etc. Elle est le produit de la lente évolution du monde du vivant, depuis les premiers organismes connus datant de 3,5 milliards d’années.\nElle comprend 3 niveaux de définition :\n    • La diversité des écosystèmes, c’est-à-dire des milieux de vie : océans, prairies, forêts, etc. jusqu’à l’échelle d’un organisme ou d’une cellule !\n    • La diversité des espèces qui vivent dans ces milieux, et sont en relation les unes avec les autres ;\n    • La diversité génétique, c’est-à-dire la diversité des individus au sein de ces espèces.\nDe nombreux biens et services indispensables aux activités humaines en dépendent : nourriture, pollinisation, médicaments, matières premières, fertilisation des sols, épuration de l’eau, etc. 	\N	\N	\N	f
68831	1005	TEXT	questions.0.quote	La biodiversité est encore largement méconnue : on connait seulement 1,8 million d’espèces sur une diversité estimée d’environ 100 millions d’espèces !	\N	\N	\N	f
68832	1005	TEXT	questions.1.answer	La majorité des territoires d’outre-mer français sont situés dans des régions particulièrement riches en espèces, notamment en espèces endémiques, ce qu’on appelle des points chauds de la biodiversité (« Hotspots » en anglais) (Nouvelle-Calédonie, Antilles, Mayotte, La Réunion, Wallis et Futuna, Polynésie française). Avec la Guyane, la France possède une partie du plus grand massif forestier de la planète, l’Amazonie, et les territoires français réunissent 10 % des récifs coralliens répartis dans trois océans. Certains territoires isolés comme les îles subantarctiques abritent une faune et une flore adaptées à des climats extrêmes. 	\N	\N	\N	f
68833	1005	TEXT	inpn.title	L'Inventaire national du patrimoine naturel	\N	\N	\N	f
68834	1005	TEXT	questions.2.question	La biodiversité menacée	\N	\N	\N	f
68835	1005	TEXT	onb.description	Depuis 2012, l’Observatoire national de la biodiversité, actuellement piloté par l’Office français pour la biodiversité (OFB), publie des indicateurs sur l’état de la biodiversité française, avec la contribution de nombreux partenaires. Ils sont régulièrement actualisés et enrichis.\nLe Compteur met en lumière les indicateurs de l’ONB qui concernent les outre-mer et contribue à la création de nouveaux indicateurs pour ces territoires.	\N	\N	\N	f
68836	1005	TEXT	understand.description	La conservation de la biodiversité dépend de sa connaissance et de la compréhension des phénomènes qui l’impactent. Les indicateurs sont développés à partir de données de suivis et de mesures sur le terrain, et permettent de suivre l’évolution de l’état de santé de la biodiversité et de l’environnement. Ils sont utilisés pour définir des stratégies de gestion ou encore mesurer l'efficacité des plans de gestion d'espèces menacées.  Cependant, ils connaissent des limites par manque de données disponibles, manque de moyens de recherche ou parce que certains paramètres sont très complexes à évaluer.	\N	\N	\N	f
68837	1005	TEXT	title	Compter la biodiversité : oui, mais comment ? 	\N	\N	\N	f
68838	1005	TEXT	onb.title	L’Observatoire national de la biodiversité	\N	\N	\N	f
68839	1005	TEXT	presentation	Les indicateurs sont des outils qui permettent de décrire différentes composantes de la biodiversité et ainsi mesurer son évolution dans le temps. De nombreux paramètres sont étudiés : taille des populations, état de santé des écosystèmes, taux de pollutions, etc. Ils renseignent ainsi l’état de la biodiversité à un instant précis, mais également l’état des connaissances et des moyens scientifiques actuels. Avec ses collaborateurs, le Compteur vise aussi à développer de nouveaux indicateurs ou chiffres clés sur la biodiversité ultramarine, qui viendront peu à peu enrichir le dispositif.	\N	\N	\N	f
68840	1005	LINK	understand.article	aucun	\N	\N	aucun	f
64288	1021	TEXT	events.2.description	Prise de possession française sous le nom d'*île Bourbon*	\N	\N	\N	f
68371	1048	TEXT	events.1.description	Découverte probable d'Europa	\N	\N	\N	f
68372	1048	TEXT	events.8.description	Création du Parc naturel marin des Glorieuses	\N	\N	\N	f
68373	1048	TEXT	events.9.description	Création de la Réserve naturelle nationale des Glorieuses	\N	\N	\N	f
68374	1048	IMAGE	ecosystems.image	\N	2484	Émergence de jeunes tortues marines à Europa © Florent Bignon - TAAF	\N	f
68375	1048	TEXT	identity.species	2 042	\N	\N	\N	f
68376	1048	TEXT	statistics.1.number	200 km<sup>2</sup>	\N	\N	\N	f
68377	1048	IMAGE	ecosystems.ecosystems.0.image	\N	2489	Récif des Glorieuses © Hendrik Sauvignet - OFB	\N	f
68378	1048	TEXT	statistics.0.number	6 %	\N	\N	\N	f
68841	1005	TEXT	quote	Documenter et présenter l’évolution de la biodiversité, c’est permettre à chacun de prendre conscience des enjeux et des menaces.	\N	\N	\N	f
68379	1048	TEXT	statistics.2.number	Des milliers	\N	\N	\N	f
68380	1048	IMAGE	interests.locations.4.image	\N	2479	Vue aérienne de Bassas da India © Stephanie Legeron - TAAF	\N	f
68842	1005	CHECKBOX	shadowed	false	\N	\N	\N	f
68843	1005	IMAGE	understand.image	\N	1362	Fakarava, Polynésie française © Franck Mazeas - 97px	\N	f
68844	1005	TEXT	questions.0.question	Qu’est-ce que la biodiversité ?	\N	\N	\N	f
68845	1005	LINK	inpn.link	Visitez le site de l'INPN	\N	\N	https://inpn.mnhn.fr/	f
68846	1005	TEXT	questions.2.quote	L'érosion de la biodiversité est une menace pour l'avenir de l'humanité.	\N	\N	\N	f
68847	1005	TEXT	understand.title	Les indicateurs, des outils pour évaluer l'état de la biodiversité	\N	\N	\N	f
68848	1005	TEXT	questions.1.question	Les outre-mer, des points chauds de biodiversité	\N	\N	\N	f
69187	1001	TEXT	ecosystems.ecosystems.1.description	Des plages sableuses emblématiques de « l’imaginaire » des îles tropicales aux plages rocheuses battues par la houle, le littoral guadeloupéen héberge une flore variée : Patate bord-de-mer ([*Ipomoea pes-caprae*](https://inpn.mnhn.fr/espece/cd_nom/445581)), Poirier-pays ([*Tabebuia heterophylla*](https://inpn.mnhn.fr/espece/cd_nom/447001)), Fleurit-noël ([*Euphorbia leucocephala*](https://inpn.mnhn.fr/espece/cd_nom/445630)), etc., ainsi que des reptiles, oiseaux marins et limicoles… Cependant, la pression des activités humaines est forte sur les littoraux et peu de ces milieux sont encore vierges d'installations humaines. Cette artificialisation peut faire obstacle à la remontée des tortues marines lorsqu'elles viennent pondre sur les plages. 	\N	\N	\N	f
69633	1052	TEXT	body.titre_question.12.paragraph.paragraphText	<strong>Les menaces</strong><br> \n<strong>Peu de financements dédiés.</strong> Beaucoup de programmes fonctionnent sans budget dédié ou en utilisant une petite partie de subventions acquises pour d’autres projets. L’interruption d’un financement, même temporaire, implique l'arrêt de suivis et donc une rupture dans la saisie des données, ce qui fragilise leur valorisation. Aussi, dans de petits territoires, l'attribution de financements peut vite devenir une affaire personnelle, faite de connivence ou de frictions, tant sont fortes les interconnexions entre acteurs associatifs et institutionnels.  <br> \n<strong>Des programmes particulièrement affectionnés par les métropolitains ?</strong> Ce sont eux, caractérisés par leur mobilité, que l’on retrouve principalement comme observateurs ou bénévoles. Cette situation peut remettre en question la pérennité de structures associatives et même influer sur les relations avec les partenaires institutionnels (équipes territoriales, gestionnaires d’espaces naturels) eux-mêmes soumis à ces mouvements de personnel.  \n<br>\n<strong>Les opportunités</strong>  \n<strong>Développer des outils communs :</strong> plateforme commune, base de données en ligne… une proportion non négligeable des données issues de sciences participatives dans les Outre-mer n’est pas suffisamment valorisée. Mettre en commun et standardiser les données serait pertinent pour en faire un usage scientifique et constituerait une opportunité de valorisation supplémentaire des programmes.<br> \n<strong>Etendre l’aire d’un réseau à l’échelle régionale :</strong> en adaptant des programmes à différents territoires (même internationaux) et en homogénéisant les protocoles, lorsque c’est faisable, il serait possible d’obtenir des tendances et des indicateurs régionaux (notamment pour les espèces migratrices).<br> \n	\N	\N	\N	f
69634	1052	TEXT	body.introduction	Rapporter des observations de requins ou de raies, surveiller l’état de santé de coraux, ou encore compter des lucioles: autant d’activités qui composent les Sciences Participatives dans les Outre-mer. Les citoyens ultramarins participent à l’aide de ces programmes et à l’instar de leurs compatriotes hexagonaux, à une meilleure compréhension de la biodiversité française. 	\N	\N	\N	f
64289	1021	TEXT	events.3.description	Dernière mention connue du Solitaire de La Réunion ([*Threskiornis solitarius*](https://inpn.mnhn.fr/espece/cd_nom/432588)) oiseau endémique	\N	\N	\N	f
64290	1021	IMAGE	identity.image	\N	2361	Cascades du Bras d’Annette à Grand Etang, La Réunion © Philippe Gourdain	\N	f
64720	1020	TEXT	events.2.description	Création de la première aire protégée de l'archipel, l'îlot Leprédour	\N	\N	\N	f
68381	1048	TEXT	zoom.title	Quelques repères dans les îles Éparses 	\N	\N	\N	f
68382	1048	TEXT	species.2.name	Les Tortues marines	\N	\N	\N	f
68383	1048	TEXT	species.4.description	Phaétons à brin rouge ou à bec jaune, Fou à pied rouge, Fou masqué, Frégate Ariel et Frégate Pacifique, sternes, puffins, noddis… il est difficile de résumer la diversité d’oiseaux marins qui peuplent les îles Éparses ! D’autant plus qu’on y trouve des sous-espèces endémiques. Pour certaines de ces espèces, Europa abrite les plus grandes colonies de l’océan Indien, c'est le cas par exemple pour la Sterne fuligineuse ([*Onychoprion fuscatus*](https://inpn.mnhn.fr/espece/cd_nom/528760)) dont les effectifs se comptent en millions d’individus.  \nLes îles Éparses hébergent également des espèces d'oiseaux terrestres, comme l'Aigrette Dimorphe ([*Egretta dimorpha*](https://inpn.mnhn.fr/espece/cd_nom/528811)) à Europa ou le Bulbul de Madagascar ([*Hypsipetes madagascariensis*](https://inpn.mnhn.fr/espece/cd_nom/418749)) aux Glorieuses. Europa est également l'une des 4 seules îles au monde où niche le Crabier blanc ([*Ardeola idae*](https://inpn.mnhn.fr/espece/cd_nom/418710)), un héron fortement menacé à l'échelle mondiale. \n\n	\N	\N	\N	f
36707	1029	IMAGE	presentation.file	\N	1465	Affiche écogeste	\N	f
36708	1029	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
36709	1029	TEXT	presentation.name	Je m'investis sur le terrain	\N	\N	\N	f
36710	1029	IMAGE	action.cards.0.icon	\N	1150	jumelles	\N	f
36711	1029	IMAGE	presentation.image	\N	1361	Sensibilisation aux oiseaux marins de Mayotte animée par le Gepomay © Fanny Cautain / OFB	\N	f
68384	1048	TEXT	events.6.description	Implantation d'une station météorologique permanente sur Tromelin	\N	\N	\N	f
68385	1048	TEXT	zoom.callToAction	Cliquez sur la carte thématique pour vous repérer en un coup d'œil !	\N	\N	\N	f
68386	1048	TEXT	events.6.date	1954	\N	\N	\N	f
68387	1048	TEXT	ecosystems.ecosystems.0.name	Les récifs coralliens	\N	\N	\N	f
68388	1048	TEXT	events.4.description	Prise de possession des Glorieuses par la France	\N	\N	\N	f
68389	1048	TEXT	events.5.description	Rattachement de Juan de Nova, Bassas da India et Europa à la France	\N	\N	\N	f
68390	1048	CHECKBOX	identity.shadowed	true	\N	\N	\N	f
68391	1048	TEXT	interests.locations.2.name	Juan de Nova	\N	\N	\N	f
68392	1048	TEXT	ecosystems.ecosystems.3.description	Aux Glorieuses, ces herbiers de phanérogames (plantes à fleurs) marines s’étendent sur une superficie de 36 km<sup>2</sup>. Ils représentent une zone d'alimentation, de refuge et de nurserie pour de nombreuses espèces, en particulier les tortues vertes et imbriquées. \n	\N	\N	\N	f
68393	1048	TEXT	statistics.3.text	de mangroves à Europa	\N	\N	\N	f
68394	1048	TEXT	events.0.date	1501	\N	\N	\N	f
68849	1016	TEXT	science.project.title	TsiÔno, le réseau des observateurs du milieu marin mahorais	\N	\N	\N	f
68850	1016	TEXT	header.title	Agir ensemble pour préserver la biodiversité remarquable des outre-mer	\N	\N	\N	f
68395	1048	TEXT	identity.populationYear	-	\N	\N	\N	f
68851	1016	CHECKBOX	header.shadowed	true	\N	\N	\N	f
68852	1016	IMAGE	science.project.image	\N	1345	Plongeur à Mayotte © Alexandra Gigou - OFB	\N	f
68853	1016	TEXT	science.title	Les sciences participatives	\N	\N	\N	f
68854	1016	TEXT	science.project.description	S’appuyer sur les observations de tous les usagers de la mer pour mieux comprendre le milieu marin mahorais, c’est l’objectif du programme TsiÔno, « J’ai vu » en shimaoré. Le projet vise à préciser les inventaires des espèces et leur répartition, suivre les habitudes de certains individus pour 6 espèces cibles (dont la Baleine à bosse et le Dugong) et alerter sur la présence de phénomènes anormaux, comme la prolifération d’espèces envahissantes ou le blanchissement de coraux. 	\N	\N	\N	f
68855	1016	TEXT	science.subtitle	Les sciences participatives permettent à tous les curieux de la nature, du débutant à l’expérimenté, de contribuer à l'amélioration des connaissances sur la biodiversité en fournissant aux scientifiques un grand nombre de données de terrain.	\N	\N	\N	f
36712	1029	TEXT	understand.text	On estime que seule 30% des espèces de faune et de flore présentes en outre-mer sont bien répertoriées. Les études pour suivre les espèces nécessitent beaucoup de temps d'observation, c’est pourquoi en multipliant les observateurs, on peut accumuler un plus grand nombre de données. De nombreux programmes de sciences participatives sont ainsi mis en place afin de permettre à chacun d'apporter sa pierre à l'édifice de la connaissance en faisant remonter ses observations. Certains programmes ont développé des applications mobiles accessibles directement depuis un smartphone. \n\nDans le cadre du Compteur de biodiversité outre-mer, une étude est actuellement en cours pour recenser tous ces programmes. Lorsque cet état des lieux sera terminé, le Compteur présentera un annuaire vous permettant de sélectionner les programmes qui vous correspondent en fonction de votre territoire et vos centres d'intérêt.\n\nDe nombreuses structures locales et associations font régulièrement appel à des bénévoles, par exemple pour participer à des opérations de restauration des milieux : arrachages de plantes exotiques envahissantes, plantations d'espèces indigènes, ramassages de déchets,... Des sorties découvertes sont également régulièrement organisées par les acteurs locaux afin d'en savoir plus sur les écosystèmes et leurs habitants, tout en les respectant.\n\n	\N	\N	\N	f
36713	1029	IMAGE	action.cards.1.icon	\N	1149	réseau	\N	f
36714	1029	TEXT	presentation.category	Connaissance	\N	\N	\N	f
70174	1054	TEXT	body.photos.3.description	« Prise de bec entre deux skuas antarctiques ([*Stercorarius antarcticus*](https://inpn.mnhn.fr/espece/cd_nom/626255)), aussi appelés labbes antarctiques. Cette photo a été prise à Pointe Basse, au nord-ouest de l’île de la Possession (archipel de Crozet) à côté du site nommé Jardin Japonais où se concentre la plus grande colonie de manchots royaux de l’île, environ 70 000 couples. Les skuas se tiennent à proximité de la colonie, où ils prédatent poussins et œufs. »	\N	\N	\N	f
36715	1029	TEXT	action.cards.1.description	Je m’informe auprès des structures locales pour participer à des évènements sur mon territoire.	\N	\N	\N	f
36716	1029	TEXT	presentation.description	Participer à des actions concrètes pour faire progresser la connaissance et la préservation de la biodiversité, c’est possible !	\N	\N	\N	f
36717	1029	TEXT	action.title	Pour contribuer activement à la connaissance et la préservation de la biodiversité :	\N	\N	\N	f
36718	1029	TEXT	understand.quote	À ce jour il existe plus d'une centaine de programmes de sciences participatifs actifs réparti sur les territoires d'outre-mer.	\N	\N	\N	f
70175	1054	IMAGE	body.photos.1.photo	\N	2654	© Bruno Marie	\N	f
68856	1016	TEXT	ecogestures.title	Découvrez les écogestes	\N	\N	\N	f
68857	1016	IMAGE	header.background	\N	1335	Agricultrices, Mayotte © Bertrand Fanonnel - 97px	\N	f
68858	1016	TEXT	header.subtitle	Réfléchir à son impact, changer ses habitudes, participer à la progression des connaissances sur les espèces et les espaces, donner de son temps dans des actions de terrain : chacun, à son échelle, peut agir et s’investir pour la préservation de la biodiversité de son territoire.  \n  \nLa troisième Stratégie nationale pour la biodiversité engage les territoires français pour la prochaine décennie à enrayer le déclin de la biodiversité. Des concertations citoyennes se déroulerons au cours de l'année 2021. Participez et retrouvez toutes les informations sur [biodiversité.gouv.fr](https://biodiversite.gouv.fr/).	\N	\N	\N	f
70176	1054	TEXT	body.photos.2.description	« Le nom des manchots papous ([*Pygoscelis papua*](https://inpn.mnhn.fr/espece/cd_nom/442304)) provient d’une erreur car il n’y a aucun manchot en Papouasie ! En français, le terme « manchot » est utilisé pour certaines espèces d’oiseaux non volants de l’hémisphère sud, tandis que « pingouin » est utilisé pour deux espèces de l’hémisphère nord : le Grand pingouin ([*Pinguinus impennis*](https://inpn.mnhn.fr/espece/cd_nom/199380)), disparu au 19<sup>e</sup> siècle, et le Petit pingouin ([*Alca torda*](https://inpn.mnhn.fr/espece/cd_nom/3388)) vivant en Europe du Nord.   \nAttention aux confusions car en anglais le terme « *pinguin* » est utilisé pour nommer… les manchots ! »	\N	\N	\N	f
70177	1054	TEXT	body.photos.4.description	« Le Damier du cap ([*Daption capense*](https://inpn.mnhn.fr/espece/cd_nom/1002)) doit son nom aux tâches noires et blanches dont son plumage dorsal est constellé. Facilement reconnaissable, il est souvent observé en vol autour des bateaux. »	\N	\N	\N	f
70178	1054	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
70179	1054	TEXT	body.photos.1.description	« Ces otaries à fourrure ([*Arctocephalus tropicalis*](https://inpn.mnhn.fr/espece/cd_nom/528710)) se reposent sur les rochers de l’île d’Amsterdam, l’une des principales zones de reproduction de l’espèce. Le mâle, ici au milieu, défend farouchement son territoire et son harem. » 	\N	\N	\N	f
68859	1016	TEXT	ecogestures.subtitle	Petits efforts ou grands gestes, nous pouvons tous être acteurs du changement, pour limiter notre impact sur le monde qui nous entoure.	\N	\N	\N	f
69188	1001	TEXT	ecosystems.ecosystems.0.description	A partir de 1 000 m d’altitude, soumise aux vents violents, à l’excès d’humidité et à la persistance des nuages, la végétation n’excède pas 1,50 m de haut. Cette « forêt de montagne » composée d’Ananas montagnes rouges ([*Pitcairnia bifrons*](https://inpn.mnhn.fr/espece/cd_nom/630443)) ou jaunes ([*Guzmania plumieri*](https://inpn.mnhn.fr/espece/cd_nom/629800)), de Thym-montagne ([*Tibouchina ornata*](https://inpn.mnhn.fr/espece/cd_nom/630806)), de Palétuvier montagne ([*Clusia mangle*](https://inpn.mnhn.fr/espece/cd_nom/629372)) et de Laurier rose ([*Podocarpus coriaceus*](https://inpn.mnhn.fr/espece/cd_nom/630457)) laisse place sur les très hauts sommets aux mousses et aux lichens. 	\N	\N	\N	f
69189	1001	TEXT	identity.highestPoint	1 467	\N	\N	\N	f
69190	1001	TEXT	risks.risks.0.name	Le premier Parc national dans les outre-mer	\N	\N	\N	f
69191	1001	IMAGE	interests.locations.1.image	\N	2271	Le lagon du Grand Cul-de-Sac Marin © Guilhem Pouxviel	\N	f
36719	1029	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
36720	1029	TEXT	action.cards.0.description	Je rejoins les réseaux de sciences participatives afin de faire remonter mes observations (annuaire prochainement disponible).	\N	\N	\N	f
69192	1001	IMAGE	ecosystems.ecosystems.1.image	\N	2284	Plage de Grande Anse © Amandine Escarguel - OFB	\N	f
69193	1001	TEXT	interests.locations.3.description	La réserve a été créée en 2011 pour préserver le patrimoine géologique exceptionnel de l’île de la Désirade, où l’on observe les très rares traces des prémices de la formation de la plaque tectonique des Caraïbes. L’île abrite également une végétation particulière avec plusieurs espèces rares dont le Cactus tête à l’Anglais ([*Melocactus intortus*](https://inpn.mnhn.fr/espece/cd_nom/447021)), ainsi que de nombreuses espèces d’oiseaux marins. 	\N	\N	\N	f
69194	1001	TEXT	identity.title	La Guadeloupe,  \n« l’île aux belles eaux »	\N	\N	\N	f
69195	1001	IMAGE	species.6.image	\N	2274	*Rhizophora mangle* © Benjamin Guichard - OFB	\N	f
69196	1001	TEXT	interests.locations.1.name	La baie de Grand Cul-de-Sac marin	\N	\N	\N	f
69197	1001	TEXT	statistics.2.text	Création du premier parc national d’outre-mer	\N	\N	\N	f
69198	1001	IMAGE	species.0.image	\N	2269	*Fregata magnificens* © macraegi /  CC BY-SA 2.0	\N	f
69199	1001	TEXT	events.1.date	1493	\N	\N	\N	f
69901	1007	IMAGE	partners.partners.1.logo	\N	1429	Parc naturel régional de la Martinique	\N	f
69902	1007	TEXT	partners.partners.0.url	http://www.biodiversite-martinique.fr/	\N	\N	\N	f
69903	1007	TEXT	goal2.quote	*Le Compteur constituera un signal d’alerte et donnera une visibilité forte et essentielle pour sensibiliser à l’évolution de la biodiversité.*  Livre bleu des outre-mer, 2018. 	\N	\N	\N	f
69635	1052	TEXT	body.titre_question.2.paragraph.paragraphText	Les sciences participatives sont définies comme une forme de production scientifique à laquelle <strong> des citoyens, qu’ils soient naturalistes, ou simples amoureux de la nature, écoliers, ou encore retraités, participent de manière active</strong> . Les programmes de sciences participatives sont un moyen d’acquérir des données sur des espèces de faune, de flore et même de fonge, très utiles aux chercheurs pour répondre à des questionnements scientifiques. Elles permettent aussi aux citoyens de développer leurs connaissances sur la biodiversité en général et les moyens de la préserver.  \n<br> \nSimples et accessibles au plus grand nombre, <strong>les données de base nécessaires</strong> pour valider une observation de sciences participatives sont : la date, l’heure, la localisation, si possible le nom de l’espèce, parfois aussi, une photo.\nDepuis une décennie, <strong>dans tous les territoires ultramarins, on observe un véritable essor des programmes de Sciences participatives</strong>.<br> 	\N	\N	\N	f
69636	1052	TEXT	body.titre_question.14.paragraph.paragraphText	L’étude conclut qu’il serait pertinent de développer et promouvoir des programmes qui visent <strong>à sensibiliser la jeunesse des territoires ultra marins.</strong> Bien que les jeunes et scolaires soient très représentés dans les Outre-mer, il n’existe pas beaucoup de programmes qui permettent à ce public d’aller sur le terrain, de mettre la tête sous l’eau, d’observer la nature et de se questionner sur son environnement.  \n<br> \nDe plus, parmi les actions promouvant la protection de la nature et qui fonctionnent très bien dans les Outre-mer, on trouve <strong>les opérations de ramassage de déchets.</strong> Ce type d'action remporte un vrai succès auprès de tous les publics (locaux, métropolitains, touristes). Il serait pertinent de s’adosser à ce genre d’activité pour promouvoir des programmes de sciences participatives et d’acquisition de connaissances sur la nature.  \n<br> \nEnfin, <strong>favoriser l’interconnaissance des acteurs et des programmes sur un territoire et encourager une dynamique de structuration en réseau</strong>, permettrait d’élaborer une vraie réflexion sur la création de méthodes et outils communs. Cela faciliterait également le dialogue avec le collectif national des sciences participatives-biodiversité, notamment pour le développement d’un indicateur sciences participatives dans les Outre-mer.  \n<br>\n<strong>Pour en savoir plus : </strong>téléchargez [le rapport *Premier panorama des sciences participatives dans les territoires d’Outre-mer. Inventaire et caractérisation*.](https://inpn.mnhn.fr/docs-web/docs/download/398569) et [l'infographie de synthèse](https://inpn.mnhn.fr/docs/OutreMer/2022-Sciences-participatives-BIOM-poster.png)..   \nUn annuaire des programmes de sciences participatives en outre-mer est à venir prochainement sur le site du Compteur biodiversité outre-mer, en attendant téléchargez [le tableau récapitulatif des programmes recensés]( https://inpn.mnhn.fr/docs/OutreMer/2021-Compilation-SPOM-recap.xlsx). <br>	\N	\N	\N	f
69904	1007	TEXT	goal1.title	Partager la connaissance scientifique	\N	\N	\N	f
69905	1007	IMAGE	goal2.quoteImage	\N	1433	Requins pointe noire, Fakarava, Polynésie française © Franck Mazeas - 97px	\N	f
69906	1007	TEXT	goal2.description	De nombreuses actions locales sont mises en place afin de tenter de préserver les écosystèmes et les espèces. Donner de la visibilité aux acteurs locaux, partager les expériences et les réussites, au bénéfice de tous, c’est également l’un des objectifs du Compteur. 	\N	\N	\N	f
68396	1048	TEXT	statistics.0.text	des eaux sous juridiction française	\N	\N	\N	f
68397	1048	IMAGE	species.1.image	\N	2478	*Casuarina equisetifolia* © Jean Hivert - TAAF	\N	f
64291	1021	TEXT	events.7.description	Découverte du premier site de nidification du [Pétrel noir de Bourbon](https://www.petrels.re/les-especes/petrel-noir-de-bourbon/) ([*Pseudobulweria aterrima*](https://inpn.mnhn.fr/espece/cd_nom/442280)), oiseau endémique encore mal connu	\N	\N	\N	f
64292	1021	TEXT	events.7.date	2016	\N	\N	\N	f
68398	1048	TEXT	ecosystems.ecosystems.1.name	Les mangroves lagonaires d'Europa	\N	\N	\N	f
67439	1047	TEXT	body.photos.3.description	« Prise dans un filet de pêche, cette tortue verte ([*Chelonia mydas*](https://inpn.mnhn.fr/espece/cd_nom/77338)) a pu être secourue à temps. Les filets laissés sans surveillance sont de véritables pièges pour de nombreuses espèces qui ne sont pas ciblées par les pêcheurs. »	\N	\N	\N	f
67440	1047	IMAGE	body.photos.1.photo	\N	2259	Raphaël Gailhac - OFB 	\N	f
67441	1047	TEXT	body.photos.2.description	« Les plages de Guyane comptent parmi les plus importants sites de pontes au monde pour les tortues marines. Ces deux jeunes tortues olivâtres ([*Lepidochelys olivacea*](https://inpn.mnhn.fr/espece/cd_nom/77360)) émergent de leur nid après une cinquantaine de jours d’incubation des œufs dans le sable. » 	\N	\N	\N	f
67442	1047	TEXT	body.photos.4.description	« Nous posons un collier GPS sur ce jaguar ([*Panthera onca*](https://inpn.mnhn.fr/espece/cd_nom/443623)) capturé sur le terrain d’un agriculteur. Le suivi de ses déplacements nous permettra d’acquérir de meilleures connaissances sur l’espèce, notamment sur la taille de son domaine vital. »	\N	\N	\N	f
67443	1047	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
67444	1047	TEXT	body.photos.1.description	« Pour lutter contre le braconnage des œufs et protéger les tortues marines, nous effectuons de nombreuses missions de surveillance sur les plages de ponte, ici sur la réserve de l’Amana. »	\N	\N	\N	f
67445	1047	TEXT	body.photos.5.description	« Après la pose du collier et une prise de sang, le jaguar est relâché en forêt, loin des habitations. L’espèce est accusée d’attaquer les animaux domestiques, en particulier les chiens, les ovins et les caprins. Des études sont réalisées pour mieux comprendre son comportement et permettre sa coexistence avec les activités humaines. » 	\N	\N	\N	f
67446	1047	TEXT	body.photos.7.description	« La difficulté principale de nos missions repose sur l'étendue du territoire, avec seulement 11 inspecteurs de l'environnement pour une étendue grande comme le Portugal ! L'accès aux milieux amazoniens est très difficile et prend parfois plusieurs jours. Cette photo a été prise lors d'une patrouille sur le lac du barrage de Petit Saut sur la commune de Sinnamary. »	\N	\N	\N	f
67447	1047	TEXT	presentation.name	Sur le terrain avec les agents de l’Office français de la biodiversité en Guyane	\N	\N	\N	f
67448	1047	TEXT	body.photos.0.description	« Cette photo a été prise en 2013, avant mon arrivée dans le service. Cet anaconda ([*Eunectes murinus*](https://inpn.mnhn.fr/espece/cd_nom/444031)) était détenu sans autorisation, il a été saisi puis relâché. La détention d’espèces sauvages est strictement réglementée pour protéger leurs populations. »	\N	\N	\N	f
67449	1047	TEXT	body.photos.6.description	« Je pose ici à côté de plusieurs dizaines de tortues charbonnières ([*Chelonoidis carbonarius*](https://inpn.mnhn.fr/espece/cd_nom/808589)) et denticulées ([*Chelonoidis denticulatus*](https://inpn.mnhn.fr/espece/cd_nom/808590)) saisies chez un commerçant. Ces espèces sont évaluées comme quasi-menacées sur la Liste rouge de l’Union Internationale pour la conservation de la nature établie pour la Guyane et leur commerce y est interdit. »	\N	\N	\N	f
67450	1047	TEXT	body.photos.8.description	« Ce qui me plaît le plus dans mes missions ? Contribuer à la protection de l'environnement, la diversité des missions, le relâché d'espèce sauvage suite à des saisies et la transmission des connaissances. Ici, une vue arienne d’une patrouille sur le lac du barrage de Petit Saut »	\N	\N	\N	f
67451	1047	IMAGE	body.photos.6.photo	\N	2261	Raphaël Gailhac - OFB 	\N	f
66987	1044	TEXT	body.bodyElements.1.paragraph.paragraphText	**En Guyane, une faune invertébrée abondante et peu documentée** : *15 000 espèces d’insectes sont connues en Guyane, mais les scientifiques estiment qu’il pourrait y en avoir plus de 80 000. Parmi les espèces d'insectes décrites, 650 sont des fourmis, mais 80&nbsp;% restent probablement à découvrir.  \nPour les champignons, on parle de 2 800 espèces identifiées, pour 50 000 estimées présentes.*	\N	\N	\N	f
66988	1044	TEXT	body.bodyElements.4.questionAnswer.question	Quelle relation ces jeunes entretiennent-ils avec la biodiversité commune, en particulier les fourmis et champignons ?	\N	\N	\N	f
66989	1044	TEXT	body.bodyElements.0.questionAnswer.question	Vous avez passé une partie des vacances scolaires à identifier les centaines d’échantillons de fourmis envoyés par les jeunes guyanais. Comment en êtes-vous arrivée à mobiliser tous ces naturalistes en herbe ? 	\N	\N	\N	f
67452	1047	TEXT	presentation.author	08/11/2021	\N	\N	\N	f
67453	1047	IMAGE	body.photos.9.photo	\N	2260	Raphaël Gailhac - OFB 	\N	f
67454	1047	TEXT	body.photos.9.description	« J’ai la chance de vivre dans un département particulièrement riche en faune et flore et d’habiter en forêt. Les palmiers pinot ([*Euterpe oleracea*](https://inpn.mnhn.fr/espece/cd_nom/731659)) qui donnent du wassaï nourrissent une multitude d’espèce sur mon terrain, comme ce conure cuivré ([*Eupsittula pertinax*](https://inpn.mnhn.fr/espece/cd_nom/828571)), que j'ai pris en photo directement depuis ma terrasse. »	\N	\N	\N	f
67455	1047	IMAGE	body.photos.4.photo	\N	2252	Raphaël Gailhac - OFB 	\N	f
67456	1047	IMAGE	body.photos.7.photo	\N	2255	Raphaël Gailhac - OFB 	\N	f
67457	1047	IMAGE	body.photos.2.photo	\N	2251	Raphaël Gailhac - OFB 	\N	f
67458	1047	IMAGE	presentation.image	\N	2250	Raphaël Gailhac - OFB 	\N	f
67459	1047	IMAGE	photograph.photo	\N	2254	Raphaël Gailhac 	\N	f
64721	1020	TEXT	events.3.description	Inscription des lagons de Nouvelle-Calédonie au Patrimoine mondial de l'UNESCO	\N	\N	\N	f
67460	1047	IMAGE	body.photos.3.photo	\N	2253	Raphaël Gailhac - OFB 	\N	f
67461	1047	TEXT	photograph.presentation	Raphaël Gailhac	\N	\N	\N	f
69907	1007	TEXT	goal3.description	Chacun, à son échelle, peut agir pour préserver la biodiversité. Connaitre et appliquer des gestes simples, modifier ses habitudes et son comportement ou encore s’investir dans des programmes de sciences participatives, tout le monde est concerné par la préservation de la biodiversité. Le rôle du Compteur est d’accompagner les citoyens en partageant des informations claires et adaptées à tous les territoires, et en encourageant à se mobiliser.	\N	\N	\N	f
64293	1021	TEXT	interests.locations.0.name	Le Parc national de La Réunion	\N	\N	\N	f
64294	1021	TEXT	events.0.description	Emergence de l’île	\N	\N	\N	f
64295	1021	TEXT	events.1.description	Dernière éruption du Piton des Neiges	\N	\N	\N	f
64722	1020	IMAGE	identity.image	\N	2443	Baie d'Oro, Île des Pins, Nouvelle-Calédonie © Hélène Udo / OFB	\N	f
69908	1007	TEXT	partners.partners.3.url	http://www.saint-pierre-et-miquelon.developpement-durable.gouv.fr/	\N	\N	\N	f
69909	1007	TEXT	partners.title	Partenariats et collaborations 	\N	\N	\N	f
69910	1007	TEXT	goal1.description	Quelles sont les espèces présentes dans ce territoire ? Comment évoluent leurs populations ? Quel est l’état de santé des récifs coralliens ? Pour répondre à ces questions et bien d’autres, différents paramètres, appelés « indicateurs », sont mesurés par les scientifiques pour suivre l’évolution de l’état de la biodiversité. Le Compteur a pour mission de rendre compte de l’état de ces connaissances dans les territoires en s'appuyant notamment sur l'[ONB](https://naturefrance.fr/), l'[INPN](https://inpn.mnhn.fr/accueil/index) et les observatoires locaux. 	\N	\N	\N	f
69911	1007	IMAGE	goal3.image	\N	1431	 Randonneurs © Observatoire Martiniquais de la biodiversité	\N	f
69912	1007	TEXT	header.subtitle	C’est le Livre Bleu outre-mer, synthèse des travaux des Assises des outre-mer, qui propose en 2018 la création d’un Compteur de la biodiversité. Ce nouveau dispositif vient notamment enrichir le portail [Naturefrance](https://naturefrance.fr/) en présentant un focus sur les territoires ultramarins. Outil actualisé et pérenne, il favorisera la rencontre, la synergie des citoyens et des acteurs de la biodiversité.  \n  \nLa démarche est collaborative et partenariale avec les territoires, notamment pour relater les contextes culturels et mettre en avant des enjeux spécifiques. Des études, actuellement en cours, viennent compléter l’initiative : le premier panorama des programmes de sciences participatives dans les territoires, et une enquête sur la perception de la nature et l’utilisation des outils numériques. 	\N	\N	\N	f
69913	1007	TEXT	header.title	Pourquoi un Compteur de la biodiversité en outre-mer ?	\N	\N	\N	f
69914	1007	CHECKBOX	header.shadowed	true	\N	\N	\N	f
69915	1007	TEXT	goal3.title	Encourager chacun à agir	\N	\N	\N	f
69916	1007	TEXT	partners.partners.1.url	http://pnr-martinique.com/	\N	\N	\N	f
69917	1007	IMAGE	partners.partners.3.logo	\N	1432	DTAM Saint-Pierre et Miquelon	\N	f
69918	1007	IMAGE	goal2.image	\N	1426	Sensibilisation des enfants, Mayotte © Fanny Cautain - OFB	\N	f
69919	1007	IMAGE	goal1.image	\N	1427	Jaguar, Guyane © Raphaël Gailhac - OFB	\N	f
67462	1047	IMAGE	body.photos.5.photo	\N	2258	Raphaël Gailhac - OFB 	\N	f
37510	1024	IMAGE	presentation.file	\N	1471	affiche écogeste introduction eee	\N	f
67463	1047	TEXT	body.introduction	Raphael Gailhac est agent au service départemental de Guyane de l’Office français de la biodiversité depuis 2017. L’essentiel de son travail repose sur des missions de police de l’environnement : lutte contre le commerce et la détention illégales d'espèces, police de la chasse, assistance aux réserves naturelles, protection des milieux dans le cadre de la police de l'eau et infractions liées à la pêche maritime. Il nous emmène avec lui et ses collègues sur quelques-unes de leurs interventions. 	\N	\N	\N	f
67464	1047	IMAGE	body.photos.8.photo	\N	2257	Raphaël Gailhac - OFB 	\N	f
67465	1047	IMAGE	body.photos.0.photo	\N	2256	OFB - ex-Service Mixte Police Environnement ONCFS 973 	\N	f
67814	1040	TEXT	risks.risks.2.description	Dès 2002, la Polynésie française a classé l’ensemble de son espace maritime en sanctuaire pour les mammifères marins. C’est également le premier territoire au monde dans lequel toutes les espèces de requin sont protégées. On retrouve ces dispositions dans la liste des espèces protégées du Code de l’Environnement polynésien, qui compte également entre autres les tortues marines, les raies Manta ou encore le corail noir. La pêche de nombreuses espèces, comme la Langouste, la Cigale de mer ou le Bénitier, est règlementée (tailles minimales, périodes et zones de pêche).  \n\nIl existe six catégories d’aires protégées selon le Code de l’Environnement polynésien. La création de zones protégées est longue et complexe et n’aboutit pas toujours en raison des conflits d’intérêts entre usagers et de problèmes fonciers (terres en indivision). La dispersion des îles sur une superficie gigantesque et la petite taille de certaines îles et atoll ne facilitent pas les suivis floristiques et faunistiques et la gestion de ces aires protégées. L’ensemble de la zone économique exclusive de Polynésie française a été déclarée « Grande aire marine gérée » depuis 2018 (catégorie VI du Code de l’Environnement polynésien) sous le nom tahitien de *Te Tainui Atea*.  \n\nDe nombreuses écoles de Polynésie française sont impliquées dans des projets d’aires marines éducatives (AME), initiative créée aux Marquises en 2012. Cette démarche pédagogique permet de sensibiliser le jeune public à la connaissance et la préservation du milieu marin, notamment lagonaire et littoral. Fort de son succès, le dispositif a été repris en métropole et dans les autres territoires ultra-marins.   \n  \nLe *rāhui*, outil ancestral de gestion des ressources naturelles tombé en désuétude, est repris aujourd’hui pour assurer l’exploitation durable des ressources naturelles marines. À l’instar d’une jachère, le *rāhui* protège temporairement une zone bien définie et limite ou interdit le prélèvement de ressources naturelles pour assurer sa régénération. Il peut être mis en place simplement entre usagers (pêcheurs), par une municipalité, ou par arrêté ministériel sur la base du Code de l’Environnement.\n	\N	\N	\N	f
67833	1040	TEXT	interests.locations.4.description	L’île la plus au sud de toute la Polynésie française, au climat subtropical, possède une richesse floristique et faunistique incroyablement élevée compte tenu de sa petite superficie (40 km<sup>2</sup>). Plus de 200 espèces de plantes y sont recensées, dont 30 % d’endémiques strictes, ainsi que des centaines d’invertébrés (insectes et mollusques) endémiques.	\N	\N	\N	f
67834	1040	TEXT	risks.risks.0.name	Un lien indissociable entre nature et culture mais une biodiversité vulnérable	\N	\N	\N	f
67835	1040	IMAGE	interests.locations.1.image	\N	2501	Forêt de Raiatea, Société © Céline Soyer	\N	f
67836	1040	IMAGE	ecosystems.ecosystems.1.image	\N	2511	Prairie à *Paspalum vaginatum* à Huahine © Jean-Yves H. Meyer - Délégation à la Recherche de la Polynésie française	\N	f
69920	1007	IMAGE	partners.partners.2.logo	\N	1430	Criobe	\N	f
69921	1007	TEXT	goal2.title	Valoriser les actions des territoires	\N	\N	\N	f
69922	1007	TEXT	partners.partners.2.url	http://www.criobe.pf/	\N	\N	\N	f
69923	1007	IMAGE	header.background	\N	1424	Monts Pito Hiti et Orohena, Tahiti, Polynésie française © Jean-Yves Meyer - Délégation à la recherche de Polynésie française	\N	f
69924	1007	IMAGE	partners.partners.0.logo	\N	1428	Observatoire Martiniquais de la biodiversité	\N	f
68399	1048	TEXT	events.2.date	1751	\N	\N	\N	f
68400	1048	TEXT	events.5.date	1897	\N	\N	\N	f
68401	1048	TEXT	identity.marineArea	634 853	\N	\N	\N	f
68402	1048	TEXT	events.8.date	2012	\N	\N	\N	f
64296	1021	TEXT	events.8.description	Publication de la Liste rouge des coraux de l’Océan Indien	\N	\N	\N	f
64297	1021	IMAGE	ecosystems.image	\N	2370	Éruption du Piton de la Fournaise en 2018 © Fabrice H.	\N	f
64298	1021	TEXT	identity.species	10 463	\N	\N	\N	f
64299	1021	IMAGE	ecosystems.ecosystems.0.image	\N	2369	Forêts au cirque de Salazie © Alexandre Clair	\N	f
64300	1021	TEXT	zoom.title	Quelques repères à La Réunion	\N	\N	\N	f
64301	1021	TEXT	species.8.name	Le Papangue	\N	\N	\N	f
68403	1048	TEXT	identity.presentation	Dans le canal du Mozambique, entre 10° et 25° de latitude sud, se répartissent l’archipel des Glorieuses, les îles Juan de Nova et Europa, et l’atoll de Bassas da India. Au nord de La Réunion, l’île de Tromelin complète cet ensemble de territoires français regroupés sous le nom d’îles Éparses, intégrés au sein des Terres australes et antarctiques françaises (TAAF).\nSi la surface terrestre cumulée de ces îles est réduite, elles permettent à la France de détenir un important territoire maritime sous sa juridiction. L’isolement et la faible occupation humaine permettent aux îles Éparses d’abriter une biodiversité remarquable au regard de leur petite taille. Elles hébergent notamment de grandes colonies d’oiseaux marin, des récifs coralliens dans un excellent état de conservation et sont des sites de pontes privilégiés pour les tortues marines.	\N	\N	\N	f
68404	1048	IMAGE	interests.locations.0.image	\N	2480	Ile du Lys, archipel des Glorieuses © Hendrik Sauvignet - Office français de la biodiversité	\N	f
68405	1048	TEXT	identity.population	0	\N	\N	\N	f
68406	1048	IMAGE	interests.locations.3.image	\N	2477	Vue aérienne d'Europa © TAAF	\N	f
68407	1048	TEXT	species.3.name	Les reptiles terrestres	\N	\N	\N	f
68408	1048	TEXT	risks.title	Enjeux et menaces 	\N	\N	\N	f
68409	1048	TEXT	species.0.name	Le Veloutier	\N	\N	\N	f
68410	1048	TEXT	events.4.date	1892	\N	\N	\N	f
68411	1048	IMAGE	interests.locations.2.image	\N	2476	Vue aérienne de Juan de Nova © Stephanie Legeron - TAAF	\N	f
68412	1048	IMAGE	ecosystems.ecosystems.2.image	\N	2486	Sansouïres d'Europa © B. Navez - Wikimedia commons	\N	f
68413	1048	TEXT	interests.locations.3.name	Europa	\N	\N	\N	f
68798	1013	IMAGE	understand.image	\N	2062	Tri d’échantillons récoltés sur le terrain en Guyane © Guillaume Feuillet - 97px	\N	f
68799	1013	TEXT	presentation.description	nouvelles espèces décrites par an en outre-mer	\N	\N	\N	f
68800	1013	TEXT	presentation.logoUrl	https://inpn.mnhn.fr/docs/communication/livretInpn/Livret-INPN-especes-2021.pdf	\N	\N	\N	f
68414	1048	TEXT	interests.locations.0.description	A l’entrée nord du canal du Mozambique, l’archipel regroupe quatre îles et rochers : Grande Glorieuse, l’île du Lys, les roches Vertes et le rocher du Sud. La biodiversité végétale est importante sur Grande Glorieuse, mais c’est surtout la richesse des récifs qui font des Glorieuses un point chaud de biodiversité, en particulier sur le banc du Geyser. L’ensemble des eaux de l’archipel a été classé en Parc naturel marin en 2012, puis en 2021 le Parc naturel marin a été remplacé par une Réserve naturelle nationale couvrant l’ensemble des îles de l’archipel et des eaux attenantes.	\N	\N	\N	f
68415	1048	TEXT	interests.locations.2.description	Cette île de 6 km de long sur 1,6 km de large est entourée par une barrière corallienne délimitant un vaste lagon (200 km<sup>2</sup>). L’île a été fortement modifiée par l’exploitation du phosphate issu de la transformation du guano (fientes d’oiseaux), entre 1900 et 1972. Des habitations et des cultures y avaient été aménagées. Malgré l’impact de cette présence humaine, la biodiversité terrestre, en particulier la végétation, demeure riche.	\N	\N	\N	f
68416	1048	TEXT	interests.locations.1.description	Cette petite île coralienne d’un kilomètre carré en forme d’amande est soumise à des conditions environnementales difficiles : nombreux cyclones, recouvrement par les vagues en cas de houle, forte salinité… C’est un lieu de ponte important pour les tortues vertes (entre 1 000 et 2 000 femelles par an). \nL’histoire de l’île a été marquée par l’échouage de l’*Utile*, un navire français transportant des esclaves, à la fin du 18<sup>e</sup> siècle. L’équipage parvint à rallier Madagascar sur une embarcation de fortune, abandonnant 60 esclaves à leur sort malgré la promesse de venir les chercher. Quinze ans plus tard, le chevalier de Tromelin, qui donna son nom à l’île, récupéra seulement huit survivants : sept femmes et un enfant. \n	\N	\N	\N	f
68417	1048	TEXT	ecosystems.ecosystems.3.name	Les herbiers sous-marins	\N	\N	\N	f
64302	1021	TEXT	events.6.description	Publication des Listes rouges de la Faune et de la Flore de La Réunion ; Inscription des cirques au Patrimoine mondial de l'UNESCO	\N	\N	\N	f
64723	1020	TEXT	events.7.description	Publication du Code de l'environnement de la Province des îles Loyauté	\N	\N	\N	f
1799	1002	TEXT	description	Les Antilles sont un « point chaud » de la biodiversité mondiale. Si chacun des quatre territoires français du bassin a son identité et ses spécificités, les acteurs locaux collaborent autour de problématiques partagées. 	\N	\N	\N	f
68418	1048	TEXT	statistics.1.text	de lagon à Europa	\N	\N	\N	f
64303	1021	TEXT	events.6.date	2010	\N	\N	\N	f
68419	1048	TEXT	events.9.date	2021	\N	\N	\N	f
68420	1048	TEXT	identity.subtitle	Une biodiversité remarquable sur des îles de petite taille	\N	\N	\N	f
68421	1048	IMAGE	species.4.image	\N	2482	*Onychoprion fuscatus* - Sterne fuligineuse © Maxime Amy - TAAF	\N	f
68422	1048	TEXT	risks.risks.0.description	Insularité, isolement, faible occupation humaine, ces caractères permettent aux îles Éparses d’abriter une biodiversité remarquable au regard de leur petite taille, en particulier d’impressionnantes colonies d’oiseaux marins et des récifs coralliens dans un état de conservation quasiment intact. Cependant, elles ne sont pas exemptes d'impacts des activités humaines et sont soumises aux menaces des changements globaux. \n  \nPlusieurs espèces non-indigènes ont été introduites sur les îles, volontairement ou involontairement, par les explorateurs. On y compte ainsi six espèces de mammifères et six espèces d’oiseaux naturalisés, mais aussi de nombreuses espèces végétales, des reptiles ou encore des insectes. Si les conséquences de la présence de certaines espèces introduites sont encore méconnues, l’impact des mammifères prédateurs est lui avéré : les chats et les rats déciment les colonies d’oiseaux. Pour y remédier, les agents des TAAF mènent des campagnes de dératisation, notamment à Tromelin, où leur l’effet a été nettement observable : les effectifs des populations ont augmenté et plusieurs espèces qui n’étaient plus observées sont revenu nicher, comme la Gygis blanche ([*Gygis alba*](https://inpn.mnhn.fr/espece/cd_nom/440187)) et le Noddi brun ([*Anous stolidus*](https://inpn.mnhn.fr/espece/cd_nom/199379)) .  \n  \nL’administration des Terres australes et antarctiques françaises s’est engagée aux cotés de La Réunion et de Mayotte pour la préservation des tortues marines, fortement menacées, par la mise en place d’un [Plan national d’action](https://taaf.fr/missions-et-activites/protection-de-lenvironnement/conservation-des-iles-eparses/le-plan-national-daction-en-faveur-des-tortues-marines/). Ses principaux objectifs : lutter contre le braconnage et les impacts de la pêche, préserver les sites de ponte (notamment contre les espèces introduites), préserver les herbiers de nourrissage et approfondir les connaissances scientifiques sur les tortues.  \n\nDu fait de leur richesse en poissons pélagiques (marlins, espadons, thons, bonites), les eaux de l’océan Indien sont parcourues par des flottilles industrielles de pêche. Dans les eaux sous juridiction françaises autour des îles Éparses, la pêche est autorisée mais règlementée, et certaines espèces comme le Thon albacore ([*Thunnus albacares*](https://inpn.mnhn.fr/espece/cd_nom/70412)) font l’objet de limitations de captures en raison du mauvais état estimé des stocks. Des observateurs de pêche sont embarqués à bord des bateaux de pêche afin de veiller au respect de ces règlementations et rapporter à l’Institut de Recherche et développement ([IRD](https://www.ird.fr/)) des données scientifiques pour étudier les populations de ces poissons. \n \n**Pour en savoir plus** : visitez le site des [Terres australes et antarctiques françaises](https://taaf.fr/collectivites/presentation-des-territoires/les-iles-eparses/) et consultez le [livret d'identification de la faune des îles Éparses](https://taaf.fr/ressources-pedagogiques/le-livret-didentification-de-la-faune-des-taaf/). \n	\N	\N	\N	f
68423	1048	TEXT	events.3.date	31 juillet 1761	\N	\N	\N	f
68424	1048	TEXT	ecosystems.ecosystems.2.description	Ces habitats de zone humide qui couvrent 65 hectares sur les plaines autour du lagon et de la mangrove d’Europa sont composés d’une végétation adaptée aux milieux salins et qui se développe sur des sédiments d’origine corallienne. On y trouve notamment des salicornes ([*Caroxylon littorale*](https://inpn.mnhn.fr/espece/cd_nom/899430)).\n	\N	\N	\N	f
68425	1048	IMAGE	ecosystems.ecosystems.3.image	\N	2483	Tortue verte au dessus d'un herbier de phanérogames marines © Hendrik Sauvignet - OFB	\N	f
64304	1021	TEXT	events.4.description	Publication des premiers volumes de La Flore des Mascareignes, avec la contribution du botaniste Thérésien Cadet.	\N	\N	\N	f
64305	1021	TEXT	events.5.description	Création du Parc national de La Réunion ; Création de la Réserve naturelle marine	\N	\N	\N	f
64306	1021	TEXT	interests.locations.2.name	Le massif de la Fournaise	\N	\N	\N	f
64307	1021	IMAGE	interests.locations.6.image	\N	2353	Hauteurs du massif de la Roche Écrite © Laurent Echiniscus	\N	f
64308	1021	IMAGE	species.1.image	\N	2355	*Lalage newtoni* © Jean-Philippe Siblet	\N	f
64309	1021	TEXT	events.5.date	2007	\N	\N	\N	f
64310	1021	TEXT	identity.marineArea	318 300	\N	\N	\N	f
64311	1021	TEXT	events.8.date	2020	\N	\N	\N	f
64312	1021	IMAGE	interests.locations.0.image	\N	2360	Parc national de La Réunion © Rémy Poncet	\N	f
64313	1021	TEXT	species.6.name	Le Tamarin des Hauts	\N	\N	\N	f
64314	1021	IMAGE	interests.locations.3.image	\N	2354	Tronc d’un arbre Bois de pomme à Mare Longue © Philippe Gourdain	\N	f
64315	1021	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
64316	1021	TEXT	interests.locations.3.name	La forêt de Mare-Longue	\N	\N	\N	f
64317	1021	TEXT	statistics.1.text	Création du Parc national de La Réunion	\N	\N	\N	f
68426	1048	IMAGE	species.3.image	\N	2485	*Cryptoblepharus caudatus* - Scinque aux yeux de serpent de Juan de Nova © Louis Dorémus - TAAF	\N	f
68427	1048	IMAGE	zoom.map	\N	2548	Cartographie îles Eparses	\N	f
68428	1048	TEXT	species.1.name	Le Filao	\N	\N	\N	f
66514	1039	TEXT	events.2.description	Plus anciennes traces d’occupations humaine de Mayotte	\N	\N	\N	f
66515	1039	TEXT	events.3.description	Ratification du traité de cession de Mayotte à la France	\N	\N	\N	f
64318	1021	IMAGE	species.4.image	\N	2368	*Pterodroma baraui* © Jean-Philippe Siblet	\N	f
64319	1021	TEXT	events.3.date	1708	\N	\N	\N	f
64320	1021	IMAGE	species.3.image	\N	2367	*Mormopterus francoismoutoui* © Gildas Monnier / GCOI	\N	f
68429	1048	TEXT	interests.title	Les différentes îles et archipels	\N	\N	\N	f
68430	1048	TEXT	ecosystems.ecosystems.1.description	Europa abrite les derniers reliquats de mangrove du sud-ouest de l'océan Indien dans un état de conservation exceptionnel. Cet écosystème primaire couvre 725 hectares autour du lagon. Il représente notamment un habitat favorable pour l'alimentation et le développement des tortues juvéniles et de certaines espèces de requins.	\N	\N	\N	f
68431	1048	TEXT	ecosystems.ecosystems.0.description	Les îles Éparses totalisent près de 800 km² de superficies récifales, qu'on trouve autour des îles et sur certains monts sous-marins éloignés comme le banc du Geyser (dans la ZEE des Glorieuses). Ces récifs coralliens abritent une biodiversité riche et diversifiée, avec 3 656 espèces recensées à ce jour : coraux, poissons, éponges, mollusques, crustacés, échinodermes, etc.  \nL'ensemble des récifs coralliens des îles Éparses présente un bon état de santé. Les pentes externes affichent des taux de recouvrement en corail vivant important, allant jusqu'à 80 % à Europa, où l'on retrouve une diversité et une biomasse en poissons récifaux exceptionnelle.	\N	\N	\N	f
68432	1048	TEXT	identity.highestPoint	14	\N	\N	\N	f
68433	1048	TEXT	interests.locations.4.description	Cet atoll circulaire d’environ 10 km de diamètre est formé par un récif dont la quasi-totalité est immergée à marée haute, ce qui empêche tout développement terrestre. La richesse de Bassas da India se trouve donc dans ses eaux, elle est cependant mal connue en raison de ces conditions d’accès difficiles.  	\N	\N	\N	f
68434	1048	TEXT	risks.risks.0.name	Des îles préservées, mais sous la pression des espèces introduites et des changements globaux	\N	\N	\N	f
68435	1048	IMAGE	interests.locations.1.image	\N	2475	Vue aérienne de Tromelin © Nelly Gravier - TAAF	\N	f
68436	1048	IMAGE	ecosystems.ecosystems.1.image	\N	2488	Tortue dans une mangrove à Europa © Bruno Marie - TAAF	\N	f
68437	1048	TEXT	interests.locations.3.description	Cette île est la plus grande des îles Éparses (31&nbsp;km<sup>2</sup>). Elle est entourée de récifs frangeants, et abrite, au nord-est, un petit lagon entouré par une mangrove. Le reste de la végétation se divise entre une forêt sèche au nord et une plaine herbacée au sud. Europa présente l’avifaune marine la plus diversifiée des îles Éparses : 8 espèces nicheuses dont une sous-espèce endémique (le Phaéton à bec jaune d’Europa, [*Phaeton lepturus europae*](https://inpn.mnhn.fr/espece/cd_nom/785477)). C’est également le site de ponte de tortues vertes le plus important de l’océan Indien, avec plusieurs milliers de pontes par an.	\N	\N	\N	f
68438	1048	TEXT	identity.title	Les îles Éparses,  \nchapelet d'îles autour de Madagascar	\N	\N	\N	f
68439	1048	TEXT	species.4.name	Les oiseaux	\N	\N	\N	f
68440	1048	TEXT	identity.area	43	\N	\N	\N	f
68441	1048	TEXT	species.0.description	Le Veloutier ([*Heliotropium foertherianum*](https://inpn.mnhn.fr/espece/cd_nom/446830)) est un arbuste qui compose l’essentiel de la maigre végétation de Tromelin. Il doit son nom à la texture veloutée de ses feuilles, et est utilisé par les oiseaux (fous à pieds rouges et gygis) comme support de nidification.  \n  \nStatut sur la Liste rouge mondiale : non évalué. 	\N	\N	\N	f
64321	1021	IMAGE	zoom.map	\N	2352	Carte La Réunion	\N	f
64322	1021	TEXT	species.1.name	L'Échenilleur de La Réunion	\N	\N	\N	f
64323	1021	TEXT	species.7.name	Le Bois d’Ortie	\N	\N	\N	f
64324	1021	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
64325	1021	TEXT	species.4.name	Le Pétrel de Barau	\N	\N	\N	f
64326	1021	TEXT	identity.area	2 512	\N	\N	\N	f
64724	1020	TEXT	events.7.date	2016	\N	\N	\N	f
64725	1020	TEXT	interests.locations.0.name	Le Parc naturel de la Mer de Corail 	\N	\N	\N	f
64726	1020	TEXT	events.0.description	Dislocation du supercontinent Gondwana et séparation de la Nouvelle-Calédonie avec l’Australie et la Nouvelle-Zélande	\N	\N	\N	f
64727	1020	TEXT	events.1.description	Arrivée des explorateurs Lapita par la mer : première occupation humaine du territoire	\N	\N	\N	f
68442	1048	TEXT	identity.highestPointName	sur l'île Glorieuse, non nommé	\N	\N	\N	f
68443	1048	TEXT	interests.locations.1.name	Tromelin	\N	\N	\N	f
68444	1048	TEXT	statistics.2.text	de pontes de tortues marines par an	\N	\N	\N	f
68445	1048	IMAGE	species.0.image	\N	2487	*Heliotropium foertherianum* © Florent Bignon - TAAF	\N	f
68446	1048	TEXT	events.1.date	16<sup>e</sup> siècle	\N	\N	\N	f
68447	1048	TEXT	ecosystems.ecosystems.2.name	Les sansouïres et les steppes salées d'Europa 	\N	\N	\N	f
68448	1048	TEXT	interests.locations.4.name	Bassas da India	\N	\N	\N	f
68914	1030	TEXT	paragraphs.0.title	Conception et édition	\N	\N	\N	f
69200	1015	TEXT	events.2.description	Dernière éruption de la Montagne Pelée	\N	\N	\N	f
69201	1015	TEXT	events.3.description	Création du Parc naturel régional de Martinique et de la Réserve naturelle nationale de la presqu'île de la Caravelle	\N	\N	\N	f
69202	1015	IMAGE	identity.image	\N	2285	La Montagne Pelée depuis la mer © Fabien Lefebvre - Association ACWAA	\N	f
69203	1015	TEXT	events.7.description	Création de [l'Observatoire Martiniquais de la biodiversité](http://www.biodiversite-martinique.fr/#)	\N	\N	\N	f
69204	1015	TEXT	events.7.date	2015	\N	\N	\N	f
69205	1015	TEXT	interests.locations.0.name	La presqu’île de la Caravelle	\N	\N	\N	f
69206	1015	TEXT	events.0.description	Premières traces d'occupation humaine en Martinique	\N	\N	\N	f
69207	1015	TEXT	events.1.description	La Martinique devient française	\N	\N	\N	f
64327	1021	TEXT	species.0.description	Le Gecko vert de Manapany ([*Phelsuma inexpectata*](https://inpn.mnhn.fr/espece/cd_nom/528679\n)), est endémique de La Réunion et n'est présent que sur une bande de 11 km de long dans le sud de l’île. Ce gecko diurne arboricole s’observe notamment sur les vacoas ([*Pandanus utilis*](https://inpn.mnhn.fr/espece/cd_nom/639093\n)). Considéré en danger critique d’extinction, il est protégé et fait l’objet d’un [Plan national d’action](http://www.reunion.developpement-durable.gouv.fr/le-pna-des-geckos-verts-de-la-reunion-a981.html) avec le Gecko vert de bourbon ([*Phelsuma  borbonica*](https://inpn.mnhn.fr/espece/cd_nom/432597)), également menacé.\n\nStatut dans la Liste rouge des reptiles de La Réunion : en danger critique. 	\N	\N	\N	f
64328	1021	IMAGE	interests.locations.5.image	\N	2359	Poissons-papillons à La Réunion © Philippe Bourjon	\N	f
64329	1021	TEXT	identity.highestPointName	Piton des Neiges	\N	\N	\N	f
64330	1021	TEXT	ecosystems.ecosystems.2.name	Les récifs coralliens	\N	\N	\N	f
64331	1021	TEXT	species.7.description	Le Bois d’Ortie ([*Obetia ficifolia*](https://inpn.mnhn.fr/espece/cd_nom/706579\n)) est une espèce rare et endémique des Mascareigne, qu’on retrouve dans les forêts sèches et semi-sèches. Il doit son nom à sa capacité à provoquer des irritations de la peau. Il est l’hôte d’un papillon endémique, le [*Salamis augustina augustina*](https://inpn.mnhn.fr/espece/cd_nom/458507), qui n’a cependant pas été observé depuis 2005, ce qui laisse à penser à sa disparition. Dans l’espoir de le voir réapparaitre, des plantations de bois d’Ortie sont réalisées notamment sur le massif de la Grande Chaloupe.\n\nStatut dans la Liste rouge de la flore vasculaire de La Réunion : en danger. 	\N	\N	\N	f
64332	1021	TEXT	species.8.description	Le Papangue, ou Busard de Maillard ([*Circus maillardi*](https://inpn.mnhn.fr/espece/cd_nom/432596)) est le seul rapace nicheur endémique de l'île de La Réunion. Présent sur l'ensemble de l'île, sauf à haute altitude (plus de 2 200 m), il chasse à faible hauteur au dessus de la végétation. Longtemps victime de braconnage due à sa mauvaise réputation, accusé de tuer les animaux domestiques et porter malheur, l'espèce est protégé depuis 1989. Il est aujourd'hui principalement menacé par l'empoisonnement secondaire due à sa consommation de rongeurs empoisonnées et fait l'objet d'un [Plan national d'actions](http://www.reunion.developpement-durable.gouv.fr/le-pna-papangue-a983.html). L'île compterait aujourd'hui environ 200 couples reproducteurs.\n  \nStatut dans la Liste rouge des oiseaux de La Réunion : en danger.	\N	\N	\N	f
64333	1021	IMAGE	species.2.image	\N	2373	*Megaptera novaeangliae* © Laurent Bouveret	\N	f
64334	1021	TEXT	interests.locations.6.name	Le massif de la Roche Écrite	\N	\N	\N	f
64335	1021	TEXT	species.3.description	Le Petit Molosse de La Réunion ([*Mormopterus francoismoutoui*](https://inpn.mnhn.fr/espece/cd_nom/458690\n)), est l’une des 3 espèces de chauve-souris présentes sur l’île et la seule strictement endémique encore présente. Les chauves-souris sont les seuls mammifères indigènes, toutes les autres espèces de mammifères présents ayant été introduits par l’homme, volontairement (élevage ou animaux domestiques) ou involontairement (souris, rats, etc.).\n\nStatut dans la Liste rouge des mammifères de La Réunion : préoccupation mineure. 	\N	\N	\N	f
64336	1021	TEXT	species.1.description	L'Échenilleur de La Réunion ([*Lalage newtoni*](https://inpn.mnhn.fr/espece/cd_nom/895898\n)), aussi appelé Tuit-Tuit en raison du chant du mâle, est un passereau endémique de la forêt de la Roche écrite, dans le nord de l’île. Victime de la prédation par les rats et les chats, sa population est actuellement estimée à quelques dizaines de couples reproducteurs et il est considéré en grand danger d’extinction. Grâce aux actions menées dans le cadre du [LIFE+ Biodiv'OM](https://www.lifebiodivom.fr/especes/lechenilleur-de-la-reunion/) et du [Plan national d'actions](http://www.reunion.developpement-durable.gouv.fr/IMG/pdf/PNA-Tuit-tuit-A4_avril_2014_version_WEB_cle0b1de7.pdf), comme la lutte contre les prédateurs introduits, ses effectifs remontent petit à petit.\n\nStatut dans la Liste rouge des oiseaux de La Réunion : en danger critique. 	\N	\N	\N	f
64337	1021	TEXT	species.2.description	Les baleines à bosses ([*Megaptera novaeangliae*](https://inpn.mnhn.fr/espece/cd_nom/60867\n)) viennent se reproduire le long des côtes réunionnaises entre juin et octobre. S’il est possible de les observer depuis un bateau, le respect de la [règlementation](https://cedtm-asso.org/quietude/la-reglementation/) est impératif pour préserver la tranquillité des cétacés, mais également pour la sécurité des observateurs.\n\nStatut dans la Liste rouge des mammifères marins de La Réunion : vulnérable. 	\N	\N	\N	f
64338	1021	TEXT	statistics.1.number	2007	\N	\N	\N	f
64339	1021	TEXT	statistics.0.number	3 500	\N	\N	\N	f
64340	1021	TEXT	statistics.2.number	1 738 espèces	\N	\N	\N	f
64341	1021	IMAGE	interests.locations.4.image	\N	2372	Réserve de l'étang de Saint-Paul © Giovanni Payet	\N	f
64342	1021	TEXT	species.2.name	La Baleine à bosse	\N	\N	\N	f
64728	1020	TEXT	events.8.description	Expédition naturaliste ["la Planète revisitée"](http://nouvellecaledonie.laplaneterevisitee.org/)	\N	\N	\N	f
64729	1020	TEXT	events.9.description	Création du parc provincial de la Côte oubliée	\N	\N	\N	f
64730	1020	IMAGE	ecosystems.image	\N	2470	Mont Dzumac © Hélène Udo / OFB	\N	f
64731	1020	TEXT	identity.species	26 984	\N	\N	\N	f
69208	1015	TEXT	events.8.description	Expédition Madibenthos : inventaire de la faune et de la flore marine côtière	\N	\N	\N	f
37511	1024	CHECKBOX	presentation.shadowed	true	\N	\N	\N	f
64343	1021	TEXT	species.4.description	Le Pétrel de Barau ([*Pterodroma baraui*](https://inpn.mnhn.fr/espece/cd_nom/215079\n)), également appelé « Taille Vent », est un oiseau endémique nichant dans des terriers à même le sol, en haute altitude sur les contreforts du Piton des Neiges. Victimes de la prédation par les rats et les chats, de nombreux jeunes sont également désorientés par les éclairages publics lors de leur premier envol et s’échouent en milieu urbain. En danger d’extinction, l’espèce fait l’objet d’un plan de conservation [LIFE+ Pétrels](https://www.petrels.re/).\n\nStatut dans la Liste rouge des oiseaux de La Réunion : en danger. 	\N	\N	\N	f
64344	1021	TEXT	zoom.callToAction	Cliquez sur la carte thématique pour vous repérer en un coup d'œil ! 	\N	\N	\N	f
64345	1021	TEXT	ecosystems.ecosystems.0.name	Les forêts humides	\N	\N	\N	f
64346	1021	TEXT	species.5.description	Les Fanjan sont des fougères arborescentes typiques des forêts de Bois de couleur des Hauts. On distingue 3 espèces différentes : [*Alsophila borbonica*](https://inpn.mnhn.fr/espece/cd_nom/707878\n), [*A. glaucifolia*](https://inpn.mnhn.fr/espece/cd_nom/707883\n) et [*A. celsa*](https://inpn.mnhn.fr/espece/cd_nom/707882\n). Traditionnellement utilisés pour la confection de pots à plantes vertes, leur prélèvement a entrainé une dégradation importante des écosystèmes et une menace pour la conservation de ces espèces. Une espèce proche originaire d’Australie ([*Sphaeropteris cooperi*](https://inpn.mnhn.fr/espece/cd_nom/707881)) a été introduite sur l’île et présente un caractère envahissant qui pourrait menacer les espèces indigènes.\n\nStatut dans la liste rouge de la flore vasculaire de La Réunion (pour les 3 espèces indigènes) : préoccupation mineure. 	\N	\N	\N	f
64347	1021	TEXT	species.6.description	Le Tamarin des Hauts ([*Acacia heterophylla*](https://inpn.mnhn.fr/espece/cd_nom/705753\n)) se trouve principalement en forêt humide de montagne entre 1 100 et 1 700 mètres d'altitude. Il peut atteindre 25 mètres de haut mais il est vulnérable aux cyclones en raison de son enracinement peu profond. Il s’agit d’une espèce endémique de l’île.\n\nStatut dans la Liste rouge de la flore vasculaire de La Réunion : préoccupation mineure. 	\N	\N	\N	f
64348	1021	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
64349	1021	TEXT	interests.locations.5.name	[La Réserve naturelle marine](http://www.reservemarinereunion.fr/)	\N	\N	\N	f
64350	1021	TEXT	events.0.date	-2 à 3 millions d’années,	\N	\N	\N	f
64351	1021	TEXT	identity.populationYear	2017	\N	\N	\N	f
64352	1021	IMAGE	species.5.image	\N	2357	*Alsophila glaucifolia*© B. Navez	\N	f
64353	1021	TEXT	statistics.0.text	hectares de récifs coralliens protégés par la réserve marine	\N	\N	\N	f
64354	1021	TEXT	ecosystems.ecosystems.1.name	La forêt sèche	\N	\N	\N	f
64355	1021	TEXT	events.2.date	1642	\N	\N	\N	f
64356	1021	TEXT	identity.presentation	« L’île intense » est située sur un point chaud de biodiversité et présente un fort taux d’endémisme. Les milieux naturels y sont relativement bien conservés par rapport aux autres îles des Mascareignes (Maurice et Rodrigues) en raison du relief escarpé. De nombreuses espèces ont toutefois disparu depuis l’arrivée des humains au 16<sup>e</sup> siècle sur une île alors inhabitée. Forêts humides, ravines et rivières, cirques et remparts, volcan, récif corallien... La Réunion présente une diversité d’écosystèmes et une forte volonté de les préserver.	\N	\N	\N	f
64357	1021	TEXT	identity.population	853 659	\N	\N	\N	f
64358	1021	TEXT	species.3.name	Le Petit Molosse de La Réunion	\N	\N	\N	f
64359	1021	IMAGE	species.8.image	\N	2365	*Circus maillardi* © S. Caceres et JN Jasmin	\N	f
64360	1021	TEXT	species.0.name	Le Gecko vert de Manapany	\N	\N	\N	f
64361	1021	TEXT	events.4.date	1976	\N	\N	\N	f
64362	1021	IMAGE	interests.locations.2.image	\N	2356	Piton de la Fournaise © Philippe Gourdain	\N	f
64363	1021	IMAGE	ecosystems.ecosystems.2.image	\N	2371	Lagon de La Réunion © Philippe Bourjon	\N	f
64364	1021	TEXT	interests.locations.0.description	Créé en 2007, [le Parc national](http://www.reunion-parcnational.fr/fr) englobe la partie centrale des deux massifs volcaniques de l'île : celui du Piton des Neiges, le plus ancien avec les trois cirques, et celui du Piton de la Fournaise. La zone cœur de parc couvre 42 % de la superficie de l’île.	\N	\N	\N	f
64365	1021	TEXT	interests.locations.2.description	Le tiers sud-est de l’île est occupé par le Piton de la Fournaise, l’un des volcans les plus actifs du monde, de type effusif. Ses coulées de laves refroidies sont progressivement recolonisées par la végétation, lichens et fougères tout d'abord, puis plantes vasculaires.	\N	\N	\N	f
64366	1021	TEXT	interests.locations.1.description	Inscrits au patrimoine mondial de l’UNESCO en 2010, les trois cirques entourent le sommet de l’île : le Piton des Neiges. Chacun possède une identité particulière. Mafate n’est desservi par aucune route, Salazie est plus exposé aux précipitations tandis que Cilaos est plus sec.	\N	\N	\N	f
64367	1021	TEXT	identity.subtitle	Deux volcans et un relief escarpé	\N	\N	\N	f
64368	1021	IMAGE	species.7.image	\N	2358	*Obetia ficifolia* © Caroline Robert / PN La Réunion	\N	f
64369	1021	TEXT	species.5.name	Les Fanjan	\N	\N	\N	f
64732	1020	IMAGE	ecosystems.ecosystems.0.image	\N	2455	Forêt tropicale humide sur l’île de Lifou, Nouvelle-Calédonie © Benjamin Guichard / OFB	\N	f
64733	1020	TEXT	species.11.description	Au cours de l’hiver austral, les baleines à bosse ([*Megaptera novaeangliae*](https://www.endemia.nc/faune/fiche5266)) viennent se reproduire en Nouvelle-Calédonie. L’archipel abrite ainsi une petite population qui fréquente les eaux du lagon mais également les monts sous-marins peu profonds de la zone économique exclusive. Des études scientifiques visent à mieux comprendre la migration des baleines depuis et vers l’archipel et à évaluer la connectivité au sein du parc et avec les populations voisines, dans l’objectif d’estimer le statut de cette population pour contribuer à sa conservation.  \n\nStatut dans la Liste rouge mondiale (pour la sous-population océanienne) : en danger.\n	\N	\N	\N	f
64734	1020	TEXT	ecosystems.ecosystems.6.name	Les grandes algueraies à Sargasses	\N	\N	\N	f
66516	1039	IMAGE	identity.image	\N	2388	Agricultrices à Mayotte © Bertrand Fanonnel	\N	f
66517	1039	TEXT	events.7.description	Création du Parc naturel marin de Mayotte	\N	\N	\N	f
70180	1054	TEXT	body.photos.5.description	« Ce groupe d’éléphants de mer ([*Mirounga leonina*](https://inpn.mnhn.fr/espece/cd_nom/528709)) se repose sur la plage de la Baie de l’Oiseau à Kerguelen. C’est sur cette plage qu’Yves-Joseph de Kerguelen de Trémarec fît laisser un message attestant de la prise de possession de l’île par la France en janvier 1774. La baie fût également baptisée Christmas Harbour (Port Christmas) le 25 décembre 1776 par James Cook lors de son troisième (et dernier) voyage d’exploration autour du monde. Au loin, on aperçoit les piliers de l’Arche des Kerguelen, formation rocheuse qui se serait effondrée, selon Rallier du Baty, entre ses deux voyages aux Kerguelen réalisés en 1908 et en 1913. »	\N	\N	\N	f
66518	1039	TEXT	events.7.date	2010	\N	\N	\N	f
66519	1039	TEXT	interests.locations.0.name	L’îlot Mbouzi 	\N	\N	\N	f
40366	1006	IMAGE	presentation.file	\N	1487	affiche écogeste protection récifs	\N	f
40367	1006	CHECKBOX	presentation.shadowed	true	\N	\N	\N	f
40368	1006	IMAGE	action.cards.2.icon	\N	1022	Plongée	\N	f
64370	1021	TEXT	risks.risks.0.description	Située au sein de l'un des 34 hauts lieux de la biodiversité mondiale (*"hotspot"*), l'environnement de l'île de La Réunion est exceptionnel. \n\nLa principale menace pour la biodiversité de l'île est la pression démographique, l’augmentation de la population entrainant le développement d’infrastructures et aménagements. La quasi-totalité des forêts de basse-altitude a déjà disparu et le littoral est particulièrement menacé par l’urbanisation, la pollution et la surfréquentation. La fréquence de ponte de tortues marines sur les plages de La Réunion est très faible et ces espèces sont également menacées par la pêche accidentelle et le braconnage. Hormis dans la Réserve naturelle marine, il n’existe aucun dispositif de protection ou de gestion des ressources dans la zone économique exclusive.  \n\nLes espèces exotiques envahissantes sont également une menace majeure. De nombreuses espèces végétales envahissent les milieux naturels, et les monocultures de Cryptomeria du Japon ([*Cryptomeria japonica*](https://inpn.mnhn.fr/espece/cd_nom/93471)) offrent des milieux favorables à l’envahissement par d’autres plantes exotiques. La lutte contre les rats et les chats harets est également un enjeu majeur de la conservation des oiseaux endémiques. Une [stratégie de lutte contre les espèces invasives](https://www.especesinvasives.re/strategie-de-lutte/la-strategie-reunionnaise/) est mise en place depuis 2010. Depuis le 1<sup>e</sup> avril 2019, un arrêté ministériel interdit tout usage d’une [liste de 150 plantes exotiques](http://www.reunion.developpement-durable.gouv.fr/IMG/pdf/0_defi_eee-outre-mer-la_reunion-web-br.pdf).  \n\nLa création du Parc national en 2007 et l'inscription au Patrimoine mondial de l'UNESCO en 2010 ont permis de renforcer la protection du patrimoine naturel de La Réunion. La mise en place d'une [Stratégie réunionnaise pour la biodiversité](http://www.reunion.developpement-durable.gouv.fr/IMG/pdf/SRB-2013-2020_cle093a71.pdf) depuis 2013 doit permettre d'intégrer la protection de la biodiversité dans les politiques publiques du territoire. De nombreux programmes de conservations ont été mis en place pour protéger les espèces patrimoniales (Plans nationaux d'actions, programmes LIFE+, etc.). \n	\N	\N	\N	f
64371	1021	TEXT	ecosystems.ecosystems.2.description	Malgré leur faible étendue (12 km<sup>2</sup>, entre le Cap La Houssaye et Grand Bois), les récifs coralliens de La Réunion sont très riches et diversifiés. On y compte au moins 226 espèces de coraux, ainsi que plusieurs centaines d’espèces d’échinodermes, mollusques, crustacés et poissons, dont de nombreuses espèces endémiques. La plus grande partie de ces récifs sont protégés sous le statut de la [Réserve naturelle marine](http://www.reservemarinereunion.fr/).	\N	\N	\N	f
64372	1021	TEXT	interests.locations.6.description	Au nord de l’île, le massif de la Roche Écrite, dont le sommet culmine à 2 276 m au-dessus des cirques de Mafate et de Salazie, est couvert par diverses formations végétales : forêts de tamarins, de bois de couleurs, landes d'altitude. Il est l’unique lieu de vie de l’Échenilleur de La Réunion, ou Tuit-Tuit ([*Lalage newtoni*](https://inpn.mnhn.fr/espece/cd_nom/895898\n)), oiseau endémique de l’île, classé en danger critique d’extinction. 	\N	\N	\N	f
64373	1021	TEXT	ecosystems.ecosystems.1.description	Située sur la côte ouest de l’île, la forêt sèche a perdu 99 % de sa superficie de puis l’arrivée des humains et ce milieu est considérée comme « en danger critique d’extinction ». Un [projet LIFE+](https://www.foretseche.re/) lancé en 2015 a permis de replanter de nombreux arbres indigènes pour tenter de le conserver.	\N	\N	\N	f
66520	1039	TEXT	events.0.description	Émergence de l’île de Mayotte	\N	\N	\N	f
66521	1039	TEXT	events.1.description	Séparation de Petite-Terre et Grande-Terre	\N	\N	\N	f
66522	1039	TEXT	events.8.description	Mayotte devient un département français d'outre-mer	\N	\N	\N	f
66523	1039	TEXT	events.9.description	Découverte d’un volcan sous-marin actif à plus de 3000 m de fond à 50 km à l’est des côtes de Mayotte	\N	\N	\N	f
66524	1039	IMAGE	ecosystems.image	\N	2391	Pêcheur sur une pirogue dans la mangrove © Fanny Cautain / Office français de la biodiversité	\N	f
66525	1039	TEXT	identity.species	6 039	\N	\N	\N	f
66526	1039	IMAGE	ecosystems.ecosystems.0.image	\N	2390	Forêt de Tchaourembo © Guillaume Viscardi - CBN Mascarin	\N	f
66527	1039	TEXT	zoom.title	Quelques repères à Mayotte	\N	\N	\N	f
37512	1024	IMAGE	action.cards.2.icon	\N	1124	relaché	\N	f
37513	1024	TEXT	presentation.name	Je protège les milieux contre l’introduction d’espèces exotiques envahissantes	\N	\N	\N	f
37514	1024	IMAGE	action.cards.0.icon	\N	1122	Planter	\N	f
37515	1024	IMAGE	presentation.image	\N	1472	La Tortue de Floride, l'une des espèces les plus envahissantes du monde © Amy Baugess	\N	f
40369	1006	TEXT	presentation.name	Je protège les récifs coralliens	\N	\N	\N	f
40370	1006	IMAGE	action.cards.0.icon	\N	1020	Bateau	\N	f
40371	1006	IMAGE	presentation.image	\N	1289	Eco-plongeur dans les récifs de Nouvelle-Calédonie © Jean-Pascal Quod / Reefcheck	\N	f
66528	1039	TEXT	species.8.name	Le Namoulohna	\N	\N	\N	f
66529	1039	TEXT	events.6.description	Ouverture de l’antenne de Mayotte du Conservatoire botanique national de Mascarin à Coconi	\N	\N	\N	f
66530	1039	TEXT	events.6.date	2009	\N	\N	\N	f
40372	1006	TEXT	understand.text	Les récifs coralliens sont un écosystème très riche : ils abritent plus d’un tiers des espèces marines connues pour lesquelles ils représentent notamment une zone de nourricerie pour les juvéniles (poissons, crustacés, etc.). Ils forment également une barrière naturelle contre la houle, protégeant la côte lors des tempêtes.\n\nIls sont particulièrement fragiles, et [de nombreux facteurs les menacent](/indicateurs/recifs-coralliens) : le changement climatique, qui entrainent entre autres une augmentation de la température et une acidification des océans, les pollutions, des maladies virales ou bactériennes ou encore la destruction directe pour construire des infrastructures humaines. Par exemple, à Mayotte, le prolongement de la piste d'atterrissage de l'aéroport nécessiterait la destruction d'une importante zone de récifs.\n\nAu-delà de ces pressions globales, les activités de loisirs en mer pèsent également sur la santé des récifs. L’ancrage sauvage peut détériorer les récifs et les herbiers sous-marins. La toxicité pour l’environnement marin des composants de crèmes solaires, qui se dissolvent dans l’eau lors de la baignade, est de plus en plus étudiée et documentée. En plongée, un choc sur les coraux, ou même le simple fait de les toucher leur est néfaste, et cela peut contribuer à la propagation de maladies du corail. Les prélèvements, même de coraux déjà morts, sont préjudiciables pour l’environnement marin et sont rigoureusement interdits dans tous les territoires. 	\N	\N	\N	f
40373	1006	IMAGE	action.cards.1.icon	\N	1021	Crème solaire	\N	f
40374	1006	TEXT	action.cards.2.description	En plongée ou en snorkeling, je fais attention à ne pas toucher les coraux et je ne prélève rien. 	\N	\N	\N	f
40375	1006	TEXT	presentation.category	En mer	\N	\N	\N	f
40376	1006	TEXT	action.cards.1.description	Je choisis une crème solaire moins nocive pour l’environnement	\N	\N	\N	f
40377	1006	TEXT	presentation.description	Les récifs coralliens sont soumis à de multiples pressions, et les activités de loisirs en mer (plaisance, plongée, pêche, baignade…) peuvent participer à leur dégradation.  Prenons soin de ces écosystèmes particulièrement riches, mais fragiles. 	\N	\N	\N	f
40378	1006	TEXT	action.title	Pour profiter de la mer sans impacter les récifs	\N	\N	\N	f
64374	1021	TEXT	interests.locations.5.description	Créée en 2007, cette aire marine protégée couvre 3 500 hectares sur un linéaire de 40 km sur la côte ouest de l’île. Les activités nautiques, dont la pêche, y sont règlementées et dans les zones dites « sanctuaires », toute présence humaine est interdite quel qu’en soit le motif. 	\N	\N	\N	f
64375	1021	TEXT	ecosystems.ecosystems.0.description	Il existe plusieurs types de forêts et de cortèges floristiques répartis en fonction de l’altitude et de la pluviométrie. Elles se situent particulièrement dans l’est et le sud de l’île, moins urbanisés. On y trouve une grande diversité végétale : mousses, fougères, orchidées, arbres et arbustes, etc.	\N	\N	\N	f
37516	1024	TEXT	understand.text	Les espèces introduites par l’homme hors de leur territoire d’origine peuvent se développer de manière importante dans leur milieu d’introduction et [menacer la biodiversité locale](/indicateurs/especes-exotiques-envahissantes). Certaines espèces peuvent également avoir des conséquences économiques et sanitaires importantes.\n\nDes animaux de compagnie qui s'échappent ou sont lâchés volontairement dans la nature lorsque leurs propriétaires ne souhaitent pas les garder, c'est l'origine de l'introduction de nombreuses espèces animales exotiques aujourd'hui problématiques, par exemple les Tortues de Floride et autres reptiles, les poissons d'aquarium comme le Guppy ou le Poisson-zèbre ou encore des oiseaux comme le Bulbul Orphée ou le Rossignol du Japon.\n\nDes nombreuses espèces végétales importées ont été plantées dans les parcs et les  jardins pour leur intérêt esthétique, mais certaines n'ont pas tardé à se disperser largement dans les milieux naturels, et à entrer en compétition avec les espèces végétales locales.\n\nDes règlementations, plus ou moins strictes selon les territoires, existent désormais pour limiter l'introduction d'espèces potentiellement envahissantes, en particulier sur les territoires insulaires.	\N	\N	\N	f
37517	1024	IMAGE	action.cards.1.icon	\N	1396	aquarium	\N	f
37518	1024	TEXT	action.cards.2.description	Je ne relâche pas mes animaux de compagnie exotiques dans la nature. Certaines espèces sont désormais interdites de détention et nécessitent d’avoir des autorisations.  	\N	\N	\N	f
37519	1024	TEXT	presentation.category	Sur terre et en mer	\N	\N	\N	f
37520	1024	TEXT	action.cards.1.description	Je ne vidange pas mon aquarium dans la nature. Les plantes aquatiques et les poissons exotiques peuvent être dangereux pour l’équilibre des cours d’eau.	\N	\N	\N	f
37521	1024	TEXT	presentation.description	Les espèces exotiques envahissantes sont une menace majeure pour les écosystèmes, en particulier pour les espaces insulaires qui comptent de nombreuses espèces endémiques.	\N	\N	\N	f
37522	1024	TEXT	action.title	Pour limiter l’introduction et la dispersion d’espèces exotiques envahissantes 	\N	\N	\N	f
64376	1021	TEXT	identity.highestPoint	3 071	\N	\N	\N	f
66531	1039	TEXT	events.4.description	Référendum d'autodétermination : la population de Mayotte choisit de rester française	\N	\N	\N	f
66532	1039	TEXT	events.5.description	Création de la Réserve naturelle nationale de l'îlot M'Bouzi	\N	\N	\N	f
37523	1024	TEXT	understand.quote	La Tortue de Floride, considérée comme l'une des 100 espèces les plus envahissantes du monde, est présente en milieu naturel dans quasiment tous les territoires d'outre-mer français (à l'exception de Saint-Pierre et Miquelon, Wallis et Futuna, et les TAAF)	\N	\N	\N	f
37524	1024	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
37525	1024	TEXT	action.cards.0.description	Je me renseigne sur les espèces végétales que je souhaite planter dans mon jardin et je privilégie d’utiliser des espèces locales. Je respecte la règlementation sur l'interdiction d'introduction d'espèces sur mon territoire.	\N	\N	\N	f
66533	1039	TEXT	interests.locations.2.name	Le Mont Choungui	\N	\N	\N	f
64377	1021	TEXT	interests.locations.4.description	Réserve naturelle nationale, cette zone humide de 447 hectares est également inscrite à la convention internationale Ramsar. Le site présente une valeur faunistique forte, avec de nombreuses espèces patrimoniales (oiseaux, poissons, macro-crustacés, insectes) malgré la présence d’espèces introduites.	\N	\N	\N	f
64378	1021	TEXT	risks.risks.0.name	Une pression démographique importante	\N	\N	\N	f
64379	1021	IMAGE	interests.locations.1.image	\N	2364	Vue sur le cirque de Mafate © Céline Soyer	\N	f
64380	1021	IMAGE	ecosystems.ecosystems.1.image	\N	2362	Grand Natte *Mimusops balata* dans la forêt sèche © B. Navez	\N	f
64381	1021	TEXT	interests.locations.3.description	Vestige de forêt humide primaire de basse altitude du sud sauvage, cette forêt a poussé sur une ancienne coulée de lave. Aujourd’hui réduite à une centaine d’hectares, elle abrite une richesse remarquable en espèces végétales, dont de nombreuses espèces endémiques. Si elle est encore dans un bon état de conservation, la disparition de la faune qui disséminait les graines (oiseaux, tortues géantes, chauves-souris) empêche sa régénération naturelle. 	\N	\N	\N	f
64382	1021	TEXT	identity.title	La Réunion,  \npoint chaud de l’océan Indien	\N	\N	\N	f
64383	1021	IMAGE	species.6.image	\N	2363	*Acacia heterophylla* © B. Navez	\N	f
64384	1021	TEXT	interests.locations.1.name	Les cirques de Mafate, Cilaos et Salazie	\N	\N	\N	f
64385	1021	TEXT	statistics.2.text	de plantes vasculaires indigènes	\N	\N	\N	f
67901	1050	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
69209	1015	TEXT	events.9.description	Création du [Parc naturel marin de Martinique](https://www.parc-marin-martinique.fr/)	\N	\N	\N	f
69210	1015	IMAGE	ecosystems.image	\N	2304	La Monnaie Caraïbes à ocelle (*Cyphoma gibbosum*), Martinique © Fabien Lefebvre - Association ACWAA	\N	f
66961	1043	TEXT	body.bodyElements.0.questionAnswer.question	A quoi ressemblent les insectes pollinisateurs en Martinique, région du globe à la fois tropicale et insulaire ?	\N	\N	\N	f
64386	1021	IMAGE	species.0.image	\N	2366	*Phelsuma inexpectata* © Philippe Gourdain	\N	f
64387	1021	TEXT	events.1.date	-22 000 ans	\N	\N	\N	f
64388	1021	TEXT	interests.locations.4.name	[L’étang de Saint-Paul](https://reserve-etangsaintpaul.fr/fr/accueil)	\N	\N	\N	f
66962	1043	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
66963	1043	IMAGE	body.bodyElements.4.image.imageElement	\N	2517	Participants au programme *Bet a flé* © Eddy Dumbardon-Martial	\N	f
66964	1043	TEXT	interviewee.presentation	Eddy Dumbardon-Martial, naturaliste et spécialiste des diptères, membre de Martinique Entomologie	\N	\N	\N	f
69211	1015	TEXT	identity.species	7 009	\N	\N	\N	f
69212	1015	IMAGE	ecosystems.ecosystems.0.image	\N	2300	Plage de Martinique © Antoine Forget - OFB	\N	f
67837	1040	TEXT	interests.locations.3.description	Situées au sud-ouest de la Polynésie française, les Australes regroupent 7 petites îles, dont Rapa, avec une richesse floristique et faunistique parmi les plus extraordinaires du monde.	\N	\N	\N	f
67838	1040	TEXT	identity.title	La Polynésie française,  \nun bien commun peuplé d'espèces emblématiques et remarquables	\N	\N	\N	f
67839	1040	TEXT	interests.locations.7.name	Les Marquises	\N	\N	\N	f
67840	1040	IMAGE	species.6.image	\N	2502	*Birgus latro* © Olivier Gargominy - INPN	\N	f
67841	1040	TEXT	interests.locations.1.name	Raiatea (Société)	\N	\N	\N	f
67842	1040	TEXT	statistics.2.text	espèces de mollusques terrestres, dont 95 % d'endémiques	\N	\N	\N	f
67843	1040	IMAGE	species.0.image	\N	2493	*Sclerotheca raiateensis* © Fred Jacq - INPN	\N	f
67844	1040	TEXT	events.1.date	Entre -150 avant J.C. et le 1<sup>e</sup> siècle 	\N	\N	\N	f
67845	1040	TEXT	interests.locations.4.name	Rapa (Australes)	\N	\N	\N	f
69213	1015	TEXT	zoom.title	Quelques repères en Martinique	\N	\N	\N	f
69214	1015	TEXT	species.8.name	Le Gommier blanc	\N	\N	\N	f
69215	1015	TEXT	events.6.description	Création de la Réserve naturelle régionale marine du Prêcheur - Albert Falco	\N	\N	\N	f
69216	1015	TEXT	events.6.date	2014	\N	\N	\N	f
69217	1015	TEXT	events.4.description	Création de la Réserve naturelle nationale des îlets de Sainte Anne	\N	\N	\N	f
68915	1030	TEXT	paragraphs.1.text	**Informations contenues dans le site**\nLe portail Compteur de biodiversité outre-mer est un site informatif. \nIl a pour objectif de présenter la biodiversité des territoires ultra-marins français et des actions et initiatives menées pour la protection de ces écosystèmes.\nAucune information contenue sur le site ne saurait posséder ou être interprétée comme ayant une quelconque valeur contractuelle. Les textes à caractère scientifique publiés dans le site sont valables à la date de leur publication et ne sauraient engager leurs auteurs dans le futur.\nToute information contenue sur le site peut être modifiée, à tout moment sans préavis, par le Muséum national d’histoire naturelle. Les informations contenues sur le site ne constituent pas une offre de services ou de produits ni une sollicitation commerciale de quelque nature que ce soit, ni une recommandation ou un conseil. Le Muséum national d’histoire naturelle ne sera pas tenu responsable pour toute décision prise ou non sur la base d’une information contenue sur le site, ni pour l’utilisation qui pourrait en être faite par un tiers. Ces informations ne sauraient engager la responsabilité du Muséum national d’histoire naturelle.\n\n**Propriété intellectuelle**\nL’ensemble du site « Compteur de biodiversité outre-mer » relève de la législation française et internationale sur le droit d’auteur et la propriété intellectuelle.\nTous les éléments présentés sur ce site (textes, photographies, vidéos, créations graphiques, illustrations) sont soumis à la législation relative au droit des informations publiques et sont couverts par le droit d'auteur. Ces éléments restent la propriété exclusive du Muséum national d’Histoire naturelle et/ou de ses auteurs.\nLa reproduction de tout ou partie de ce site sur un support électronique quel qu’il soit est formellement interdite sauf autorisation expresse du directeur de la publication. La reproduction de ce site sur un support papier est autorisée pour des fins personnelles, associatives ou professionnelles et sous réserve du respect des trois conditions suivantes :\n• gratuité de la diffusion ;\n• respect de l’intégrité des documents reproduits : pas de modification ni altération d’aucune sorte ;\n• citation claire et lisible de la source indiquant le nom "Muséum national d’Histoire naturelle", l’adresse internet du site web du MNHN : www.mnhn.fr et la mention : "© sur www.mnhn.fr - Reproduction interdite – Tous droits réservés".\nToutes diffusions ou utilisations à des fins commerciales ou publicitaires des informations sont strictement interdites. Pour d’autres utilisations envisagées, veuillez nous consulter.\n\n**Crédits photographiques**\nToutes les photographies présentes sur le site sont créditées de leurs auteurs et de la licence associée à leur utilisation si elle est mentionnée.\nLes contenus sous licence Creative Commons ont une mention spécifique avec le type de licence qui permet à l’utilisateur d’aller consulter les conditions d’utilisation de l’image concernée. \nExemple :\n(CC BY-NC-SA 3.0)	\N	\N	\N	f
68916	1030	TEXT	paragraphs.2.text	**Outils de mesure d’audience**\nLe site utilise l’outil d’analyse Matomo. Les traceurs de mesures d’audience issus de Matomo ne nécessitent pas de recueil préalable du consentement de l’utilisateur du fait qu’ils servent uniquement à produire des données statistiques anonymes.\nPour en savoir plus :\nhttps://fr.matomo.org/privacy/\n\n**Politique de confidentialité et RGPD**\nLe Muséum national d’Histoire naturelle porte la plus grande attention à vos données à caractère personnel et s’engage à les protéger.\nIl s'engage à ce que la collecte et le traitement de données à caractère personnel, effectués à partir du présent site, soient conformes à la loi n°78-17 du 6 janvier 1978 modifiée relative à l'informatique, aux fichiers et aux libertés ainsi qu’au Règlement (UE) 2016/679 du Parlement européen et du Conseil du 27 avril 2016 applicable le 25 mai 2018. \n\n**Données personnelles**\nSauf stipulation contraire directement mentionnée, aucune donnée personnelle n’est collectée ni traitée sur le portail « Compteur de biodiversité outre-mer ».	\N	\N	\N	f
70181	1054	TEXT	body.photos.7.description	« Portraits de face et de profil de deux cormorans de Kerguelen ([*Phalacrocorax verrucosus*](https://inpn.mnhn.fr/espece/cd_nom/432600)). Les excroissances charnues au-dessus du bec, appelées caroncules, gonflent en saison de reproduction et leur couleur orange devient plus marquée, tout comme la couleur bleue du pourtour de l’œil. » 	\N	\N	\N	f
70182	1054	TEXT	presentation.name	La faune sauvage des Terres Australes françaises	\N	\N	\N	f
70183	1054	TEXT	body.photos.0.description	« L’Albatros hurleur ([*Diomedea exulans*](https://inpn.mnhn.fr/espece/cd_nom/988)), ou Grand Albatros possède la plus grande envergure de tous les oiseaux actuels : ses ailes peuvent s’étendre jusqu’à 3,70 m. Grâce à cette grande portance, il plane sans efforts même par forts vents et parcours plusieurs milliers de kilomètres sans se poser à terre. Les grands albatros sont capables de faire une boucle complète autour de l’Antarctique en l’espace de trois semaines. »	\N	\N	\N	f
70184	1054	TEXT	body.photos.6.description	« Un mâle d’éléphant de mer se repose sur la route 66, qui relie sur Kerguelen la Base de Port-aux-Français aux installations du Centre national d’études spatiales (CNES), du Commissariat à l’énergie atomique et aux énergies alternatives (CEA) et au poste météo. Quelques routes bétonnées ont été construites sur les îles pour permettre notamment de transporter du matériel.»	\N	\N	\N	f
70185	1054	TEXT	body.photos.8.description	« À chacune de nos sorties dans le golfe du Morbihan de Kerguelen, nous pouvions croiser des dauphins de Commerson ([*Cephalorhynchus commersonii*](https://inpn.mnhn.fr/espece/cd_nom/535143)). Il s’agit d’une sous espèce endémique à Kerguelen. Ils sont très joueurs, comme le sont souvent les dauphins. »	\N	\N	\N	f
70186	1054	IMAGE	body.photos.6.photo	\N	2649	© Bruno Marie	\N	f
70187	1054	TEXT	presentation.author	15/03/2022	\N	\N	\N	f
70188	1054	TEXT	body.photos.11.description	« La gigantesque manchotière du Cap Ratmanoff sur la péninsule Courbet aux Kerguelen abrite la plus grande population de manchots royaux ([*Aptenodytes patagonicus*](https://inpn.mnhn.fr/espece/cd_nom/441650)) de l’archipel (plus de 100 000 couples). Le juvénile du manchot royal est couvert de duvet marron, qui lui vaut son surnom de « kiwi », contrairement à son cousin manchot empereur ([*Aptenodytes forsteri*](https://inpn.mnhn.fr/espece/cd_nom/441649)) en Antarctique, qui est couvert d’un duvet gris. »  \n<br>\nTextes extraits pour partie du livre « Escales au bout du monde » sur les TAAF - © Océindia (oceindia@icloud.com), S. Légeron, B. Marie, 2015. Plus de photos des TAAF sur le site web de Bruno Marie : [http://seaview.photodeck.com](http://seaview.photodeck.com/)  \n<strong>Pour en savoir plus</strong> sur les Terres australes françaises, découvrez [la page portrait du territoire](biodiversite-outre-mer.fr/territoires/iles-subantarctiques)\n<br>	\N	\N	\N	f
70189	1054	IMAGE	body.photos.9.photo	\N	2652	© Bruno Marie	\N	f
70190	1054	TEXT	body.photos.9.description	« Le gris acier des yeux de ce pétrel géant ([*Macronectes giganteus*](https://inpn.mnhn.fr/espece/cd_nom/994)) et la froideur de son regard impressionnent. C’est un redoutable prédateur, qui se repose ici au nid avec son petit. »	\N	\N	\N	f
70191	1054	IMAGE	body.photos.11.photo	\N	2647	© Bruno Marie	\N	f
68917	1030	TEXT	paragraphs.1.title	Conditions générales d’utilisation	\N	\N	\N	f
68918	1030	TEXT	title	Mentions légales	\N	\N	\N	f
68489	1038	TEXT	events.2.description	Abolition définitive de l'esclavage en France	\N	\N	\N	f
68490	1038	TEXT	events.3.description	Ouverture du bagne de Guyane, lieu de déportation pour les condamnés aux travaux forcés jusqu’en 1946	\N	\N	\N	f
68491	1038	IMAGE	identity.image	\N	2397	Rivière Inini © Pascale Roche - Office français de la biodiversité	\N	f
68492	1038	TEXT	events.7.description	Création du Groupe d'étude et de protection des oiseaux de Guyane ([GEPOG](http://www.gepog.org/))	\N	\N	\N	f
67846	1040	TEXT	interests.locations.7.description	En marquisien *Fenua Enata*, la « Terre des Hommes », les Marquises regroupent 14 îles aux reliefs escarpés qui ne sont pas entourées par un récif de corail. Les écosystèmes marins des Marquises sont particulièrement riches en nutriments d’où la présence et l’abondance d’espèces remarquables comme les cétacés. La candidature des Marquises à l’inscription au patrimoine naturel et culturel de l’UNESCO est en cours d’instruction.	\N	\N	\N	f
67902	1050	TEXT	body.titre_question.0.paragraph.paragraphText	<strong>La forêt sèche recèle une biodiversité élevée et de nombreuses espèces endémiques. Elle est le lieu de vie d’une faune très variée et joue un rôle de transition entre les forêts du littoral et les forêts humides de la chaîne centrale</strong>. Pour préserver sa biodiversité remarquable et son rôle écologique fort, les acteurs du territoire se mobilisent ! Neuf partenaires (État, Gouvernement de la Nouvelle-Calédonie, province Nord, province Sud, IAC, IRD, UNC, WWF-France et CIE*) sont engagés depuis 2001 pour sa protection et sa restauration, notamment à travers le *Programme de Conservation des Forêts Sèches* (PCFS), coordonné depuis 2012 par le Pôle Forêt Sèche du Conservatoire d’espaces naturels de Nouvelle-Calédonie (CEN).  \n<br>\nPour informer, mais aussi faciliter et encourager les actions de protection et de restauration écologique, le CEN, ses membres et partenaires <strong>s’attachent à diffuser au plus grand nombre les connaissances et données disponibles </strong>. Les enjeux sont importants, c’est pourquoi le CEN et la Direction du numérique et de la modernisation du Gouvernement de la Nouvelle-Calédonie (DINUM) ont développé un [tableau de bord numérique](http://carto.cen-foret-seche.georep.nc/) spécialement dédié à ce sujet.\n<br>	\N	\N	\N	f
40379	1006	TEXT	understand.quote	La grande barrière de corail de Nouvelle-Calédonie est la deuxième plus grande au monde, après celle se trouvant sur la côte est de l'Australie.	\N	\N	\N	f
40380	1006	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
40381	1006	TEXT	action.cards.0.description	En bateau, je jette l'ancre sur des zones sableuses, et non pas à proximité de récifs ou d'herbiers. 	\N	\N	\N	f
67903	1050	TEXT	presentation.name	Un tableau de bord dédié aux forêts sèches de Nouvelle-Calédonie	\N	\N	\N	f
68493	1038	TEXT	events.7.date	1993 	\N	\N	\N	f
68494	1038	TEXT	interests.locations.0.name	Le Parc Amazonien de Guyane	\N	\N	\N	f
68495	1038	TEXT	events.0.description	Premières traces d’occupation humaine dans les Guyanes	\N	\N	\N	f
40382	1018	TEXT	secondActionName	Je donne de mon temps	\N	\N	\N	f
40383	1018	LINK	secondActionLink	Découvrez les sciences participatives	\N	\N	/sciences-participatives	f
40384	1018	TEXT	description	Envie d’agir ? Signalez vos observations depuis votre smartphone ou participez à un programme de sciences participatives ! 	\N	\N	\N	f
40385	1018	TEXT	firstActionName	J'agis en ligne	\N	\N	\N	f
40386	1018	LINK	firstActionLink	Je télécharge l'application INPN Espèces	\N	\N	https://inpn.mnhn.fr/informations/inpn-especes	f
40387	1018	TEXT	title	Agir pour la biodiversité	\N	\N	\N	f
64735	1020	TEXT	species.12.description	Sur les sept espèces de tortues marines présentes dans le monde, trois fréquentent régulièrement les eaux calédoniennes : la Tortue Verte ([*Chelonia mydas*](https://endemia.nc/faune/fiche1127)), la Tortue imbriquée ([*Eretmochelys imbricata*](https://endemia.nc/faune/fiche1129)) et la Tortue grosse tête ou Tortue caouanne ([*Caretta caretta*](https://endemia.nc/faune/fiche1125))). Un plan d’action est en place depuis fin 2018, pour contribuer activement à la conservation des tortues marines et de leurs habitats, à l’échelle locale, régionale et internationale.  \n\nStatut dans la Liste rouge mondiale :\n*Chelonia mydas* : en danger\n*Etretmochelys imbricata* : en danger critique \n*Caretta caretta* : vulnérable.	\N	\N	\N	f
64736	1020	TEXT	zoom.title	Quelques repères en Nouvelle-Calédonie	\N	\N	\N	f
64737	1020	TEXT	species.8.name	Le Niaouli	\N	\N	\N	f
64738	1020	TEXT	species.14.description	Les nautiles sont considérés comme des fossiles vivants dont les ancêtres étaient proches des ammonites, éteintes à la fin de l’ère secondaire. Ils sont les seuls céphalopodes à posséder une coquille, comme les escargots. Habitants du fonds des océans, ils ont une durée de vie d'une vingtaine d'années et se caractérisent par une croissance lente et un faible taux de reproduction. \nSept espèces de nautiles sont aujourd’hui connues, dont [*Nautilus macromphalus*](https://endemia.nc/faune/fiche4911), qui est endémique à la Nouvelle-Calédonie.  \n  \nStatut dans la Liste rouge mondiale pour *Nautilus macromphalus* : non évalué. \n	\N	\N	\N	f
66534	1039	TEXT	ecosystems.ecosystems.3.description	Plusieurs types de récifs se trouvent à Mayotte. Le lagon est entouré d’une barrière récifale de près de 140 km de long, large de 200 à 250 m et interrompue par douze passes. Elle est doublée par un récif interne sur 18 km au sud-ouest, phénomène rare dans le monde, et un récif frangeant longe les côtes. Les fonds sableux du lagon sont en partie colonisés par des herbiers de phanérogames. \nLa richesse des récifs et du lagon est exceptionnelle : plus de 760 espèces de poissons ont été inventoriées sur l’ensemble du milieu marin mahorais, dont 24 espèces de requins et 13 de raies, ainsi que 300 espèces de coraux. \n	\N	\N	\N	f
66535	1039	TEXT	ecosystems.ecosystems.4.description	Les herbiers sous-marins se trouvent tout autour de Grande Terre et des îlots, dans les zones côtières peu profondes à Mayotte. Peu denses et fragmentés, ils couvrent au total 760 hectares dans le lagon. \nOn y trouve 11 espèces de phanérogames marines, qui ne sont pas des algues mais bien des plantes à fleurs ! Ce sont des zones de refuge, de nurserie et d’alimentation pour de nombreuses espèces, comme les tortues marines et les dugongs mais aussi les poissons, mollusques et crustacés. \n	\N	\N	\N	f
66536	1039	TEXT	ecosystems.ecosystems.4.name	Les herbiers sous-marins 	\N	\N	\N	f
66537	1039	TEXT	statistics.3.text	de mammifères marins	\N	\N	\N	f
66538	1039	TEXT	events.10.date	2021	\N	\N	\N	f
66539	1039	IMAGE	species.1.image	\N	2379	*Octopus cyanea* © Benjamin Guichard	\N	f
66540	1039	TEXT	events.5.date	2007	\N	\N	\N	f
66541	1039	TEXT	identity.marineArea	73 600	\N	\N	\N	f
66542	1039	TEXT	events.8.date	2011	\N	\N	\N	f
66543	1039	IMAGE	interests.locations.0.image	\N	2382	Vue sur l'îlot M'Bouzi © Paul Giannasi / Office français de la biodiversité	\N	f
66544	1039	TEXT	species.6.name	Les tortues marines	\N	\N	\N	f
66545	1039	IMAGE	interests.locations.3.image	\N	2385	Vue aérienne de la vasière des Badamiers © Alexandra Gigou / Office français de la biodiversité	\N	f
66546	1039	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
66547	1039	TEXT	interests.locations.3.name	La Vasière des Badamiers	\N	\N	\N	f
66548	1039	TEXT	statistics.1.text	de coraux	\N	\N	\N	f
66549	1039	TEXT	events.9.date	2019	\N	\N	\N	f
66550	1039	IMAGE	species.4.image	\N	2381	Baobab © Pierre-Olivier Jay	\N	f
66551	1039	TEXT	events.3.date	1843	\N	\N	\N	f
66552	1039	IMAGE	ecosystems.ecosystems.3.image	\N	2393	Récifs de la passe en S © Marine Dedeken / Office français de la biodiversité	\N	f
66553	1039	IMAGE	species.3.image	\N	2387	*Cananga odorata* © Cesar Delnatte	\N	f
66554	1039	IMAGE	zoom.map	\N	2376	Carte Mayotte	\N	f
66555	1039	TEXT	species.1.name	Les poulpes	\N	\N	\N	f
66556	1039	TEXT	species.7.name	Les palétuviers	\N	\N	\N	f
66557	1039	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
66558	1039	TEXT	species.4.name	Les baobabs	\N	\N	\N	f
66559	1039	TEXT	identity.area	377	\N	\N	\N	f
66560	1039	TEXT	species.0.description	Le Crabier blanc ([*Ardeola idae*](https://inpn.mnhn.fr/espece/cd_nom/418710)) est un petit héron dont le plumage change de couleur au cours de l’année. En période de reproduction, il est reconnaissable à son plumage blanc immaculé, son bec bleu terminé par une pointe noire et ses pattes roses, tandis que le reste de l’année son plumage est marron strié de beige, son bec gris (toujours terminé d’une pointe noire) et ses pattes verdâtres. Il vit dans les zones humides où il se nourrit d’insectes, d’amphibiens et de petits poissons, et niche dans les mangroves.\nMayotte est l’une des quatre seules îles au monde où l’espèce se reproduit, avec Madagascar, Europa et Aldabra (Seychelles), ce qui confère au territoire une importance capitale dans sa conservation. L’espèce est notamment menacée par la destruction de ses habitats, la probable prédation des œufs et des poussins par les rats et le braconnage. \nUn plan national d’action a été élaboré pour le préserver, et des actions de conservation sont mises en place par le Groupe d’étude et de protection des oiseaux de Mayotte ([GEPOMAY](http://gepomay.fr/)) dans le cadre du programme [LIFE BIODIV OM](https://www.lifebiodivom.fr/especes/crabier-blanc/). \n\nStatut sur la Liste rouge des oiseaux de Mayotte : en danger critique. \n	\N	\N	\N	f
66561	1039	IMAGE	interests.locations.5.image	\N	2549	Vue aérienne du lac Dzaha © Alexandra Gigou - OFB	\N	f
66562	1039	TEXT	identity.highestPointName	Mont Bénara	\N	\N	\N	f
66563	1039	TEXT	ecosystems.ecosystems.2.name	Les mangroves 	\N	\N	\N	f
66564	1039	TEXT	species.7.description	On trouve sept espèces de palétuviers dans les mangroves de Mayotte. La plus commune est le palétuvier rouge, ([*Rhizophora mucronata*](https://inpn.mnhn.fr/espece/cd_nom/447468)), qui couvre 80 % des mangroves. Il se reconnait à ses racines en échasses et sa feuille lancéolée qui présente une pointe à son extrémité. \nOn trouve également le Palétuvier gros poumon ([*Bruguiera gymnorhiza*](https://inpn.mnhn.fr/espece/cd_nom/809530)) aux racines en forme de genou ou encore le Palétuvier blanc ([*Avicennia marina*](https://inpn.mnhn.fr/espece/cd_nom/672495)), le plus tolérant aux fortes concentrations en sel, qui doit son nom à la face inférieure blanche de ses feuilles.\nIls se répartissent dans les mangroves en fonction de différents paramètres tels que la salinité, la nature des sols ou les niveaux d’eau. \n\nStatuts sur la Liste rouge de la flore vasculaire de Mayotte :\n*Rhizophora mucronata* : quasi menacée. \n*Bruguiera gymnorhiza* : vulnérable. \n*Avicennia marina* : préoccupation mineure.\n	\N	\N	\N	f
68496	1038	TEXT	events.1.description	Premières implantations européennes	\N	\N	\N	f
68497	1038	TEXT	events.8.description	Construction du barrage de Petit Saut	\N	\N	\N	f
68498	1038	TEXT	events.9.description	Création de la Réserve naturelle nationale des Nouragues	\N	\N	\N	f
68499	1038	IMAGE	ecosystems.image	\N	2415	Couple de Hoazins huppés © Gwen Quérel / RNN Kaw-Roura	\N	f
66965	1043	TEXT	body.bodyElements.6.questionAnswer.response	Certaines relations très spécialisées sont emblématiques. La pollinisation des Passiflores (fruits de la passion) par exemple ne peut pas être réalisée par l’abeille mellifère, celle-ci étant incapable d’atteindre l’étamine de la fleur du fait de sa taille. Une seule abeille peut y accéder : le vonvon ([*Xylocopa fimbriata*](https://inpn.mnhn.fr/espece/cd_nom/754400)), un xylocope très célèbre chez nous. **Autrefois très commune, l’espèce a beaucoup régressé**. Une des raisons est liée à la disparition des maisons en bois sur l’île, dans lesquelles le vonvon construisait ses nids. Avec la modernisation de l’habitat et la généralisation de matériaux à base d’aluminium et de béton, il a «&nbsp;déserté&nbsp;» les villes pour se «&nbsp;réfugier&nbsp;» en forêt.  \nHormis quelques exemples comme celui-ci, **on connait encore mal les relations entre les fleurs et les insectes dans les Antilles**. En Martinique les grandes cultures sont celles de la banane et de la canne à sucre qui ne dépendent pas de la pollinisation des insectes, d’où l’absence de travaux de recherche et de sensibilisation autour des problématiques liés aux pollinisateurs contrairement à ce qui existe ailleurs dans le monde. 	\N	\N	\N	f
66966	1043	TEXT	presentation.name	« Il faut amener les gens à s’intéresser aux insectes pollinisateurs de Martinique » 	\N	\N	\N	f
66967	1043	TEXT	presentation.author	Hugo Struna	\N	\N	\N	f
66968	1043	TEXT	body.bodyElements.7.questionAnswer.question	Selon vous et les données dont vous disposez, comment les insectes évoluent, en particulier les pollinisateurs ? Observez-vous une régression significative comme sur le continent ?	\N	\N	\N	f
66969	1043	TEXT	body.bodyElements.3.questionAnswer.question	Vous avez lancé il y a deux ans un programme de science participative, visant justement à améliorer la connaissance des insectes pollinisateurs. Comment avez-vous procédé ?	\N	\N	\N	f
66970	1043	TEXT	presentation.date	22/09/2021	\N	\N	\N	f
66971	1043	TEXT	body.bodyElements.1.questionAnswer.response	C’est très récent ! En Martinique, nous n’avons pas d’historique naturaliste aussi ancien qu’en Europe. Ici, il y a eu l’esclavage entre le 17<sup>e</sup> et le 19<sup>e</sup> siècle, ce qui n’a pas encouragé l’observation de la nature. Avec l’arrivée des premiers colons européens, les ecclésiastiques de l’époque ont entrepris les premiers inventaires. Mais hormis de rares exceptions, comme celle du père Pinchon qui nous a laissé 140 boîtes de plusieurs milliers d’insectes, notre région a surtout bénéficié des travaux des botanistes. **Le premier inventaire des abeilles en Martinique a eu lieu en 2006.** Aujourd’hui encore nous sommes peu à nous intéresser à cette biodiversité. Il y a encore du travail !	\N	\N	\N	f
66972	1043	TEXT	body.bodyElements.5.questionAnswer.response	L’inventaire des pollinisateurs de la Caravelle a permis de collecter des données très intéressantes qui viendront enrichir la base de données *bet a flé*. Certaines espèces sont peut-être nouvelles pour la science ! En particulier les abeilles appartenant à la famille des Halictidae, des abeilles noires à l’allure de fourmi assez communes dans la Réserve. Du côté des diptères, nous avons découvert un bombyle (Bombyliidae), une petite boule orange d’où sort une longue trompe rectiligne. Ces mouches possèdent souvent des pièces buccales allongées, elles ont tendance à butiner les fleurs en effectuant des vols stationnaires, un peu comme les colibris. **À partir des observations des participants à l’opération et des membres de l’association, nous allons concevoir un petit fascicule pédagogique sur les insectes de la Caravelle.** Sous forme de petites histoires naturelles, nous allons faire découvrir la particularité des insectes, des fleurs et de leurs interactions. Il sera abondamment illustré de photos et des dessins à l’aquarelle.	\N	\N	\N	f
66973	1043	TEXT	body.bodyElements.9.questionAnswer.response	Il faut amener gens à observer, c’est la meilleure façon de sensibiliser. Avant nous essayions de le faire en montrant des boîtes de papillons. C’était beau. C’était spectaculaire. Mais ça restait folklorique, selon moi. **Je vois bien que lorsque ces mêmes personnes observent les mêmes espèces vivantes, dans leur milieu naturel, elles s’ouvrent à un autre monde.** Elles touchent du doigt la diversité des formes vivantes et prennent conscience des relations complexes entre les espèces. Cela entraine généralement une réflexion sur l’impact de nos actions sur les écosystèmes.  \n<br>Mais au-delà des sciences participatives, il faut selon moi décloisonner la science, surtout l’entomologie et l’ouvrir à d’autres domaines, artistiques notamment. Le dessin, la photo rapprochent les gens des insectes, c’est ce chemin que nous essayons de prendre à l’association Martinique Entomologie. <br>	\N	\N	\N	f
66974	1043	TEXT	body.bodyElements.6.questionAnswer.question	Que sait-on des relations plantes-insectes en Martinique ? Y-a-t-il des phénomènes de coévolutions remarquables ? 	\N	\N	\N	f
67904	1050	TEXT	body.titre_question.5.paragraph.paragraphText	<strong>Consultez les outils numériques dédiés aux forêts sèches de Nouvelle-Calédonie </strong>: [le tableau de bord](https://dtsi-sgt.maps.arcgis.com/apps/opsdashboard/index.html#/03b75c712bfe4089ab9cfd971a2e9aec) et l’[explorateur cartographique des forêts sèches](https://dtsi-sgt.maps.arcgis.com/apps/webappviewer/index.html?id=d4d2b25f57d94ba6918d0a8d26831301). \n<strong>Pour en savoir plus </strong>sur la biodiversité des forêts sèches, rendez-vous sur le site du [Conservatoire d‘espaces naturels de Nouvelle-Calédonie](https://www.cen.nc/foret-seche/les-forets-seches-en-nc). \n	\N	\N	\N	f
67905	1050	TEXT	body.titre_question.2.citation.citationElement	On peut par exemple visualiser en un clic le nombre d’hectares reboisés (51,3 ha) ou la surface de forêt sèche classée en aire protégées (seulement 0,6 %).	\N	\N	\N	f
67906	1050	IMAGE	presentation.image	\N	2551	Forêt sèche de Malhec © Conservatoire d'espaces naturels de Nouvelle-Calédonie	\N	f
67907	1050	TEXT	presentation.author	Mélanie Boissenin 	\N	\N	\N	f
67908	1050	TEXT	presentation.date	13/12/22	\N	\N	\N	f
68500	1038	TEXT	identity.species	27 794	\N	\N	\N	f
68501	1038	IMAGE	ecosystems.ecosystems.0.image	\N	2417	Forêt dense humide © Sylvain Santelli - 97px	\N	f
68502	1038	TEXT	zoom.title	Quelques repères en Guyane	\N	\N	\N	f
68503	1038	TEXT	events.6.description	Création de la Réserve naturelle nationale de l’île du Grand Connétable	\N	\N	\N	f
68504	1038	TEXT	events.6.date	1992	\N	\N	\N	f
68505	1038	TEXT	events.4.description	Départementalisation de la Guyane	\N	\N	\N	f
70192	1054	IMAGE	body.photos.4.photo	\N	2650	© Bruno Marie	\N	f
70193	1054	IMAGE	body.photos.7.photo	\N	2645	© Bruno Marie	\N	f
70194	1054	IMAGE	body.photos.2.photo	\N	2644	© Bruno Marie	\N	f
66975	1043	TEXT	body.bodyElements.0.questionAnswer.response	Contrairement à ce qu’on pourrait penser, ce n’est pas très éloigné de ce qu’on retrouve en métropole. Les principaux groupes y sont présents : les Hyménoptères, les Diptères, les Coléoptères, les Lépidoptères. Il y a tout de même quelques différences. **La première est la faible diversité spécifique. Les îles sont des territoires exigus, isolés, peu d’espèces ont pu s’y établir.** Contrairement à la Guyane par exemple, qui jouit d’une faune et d’une flore extrêmement abondante en raison de sa situation continentale. En revanche, les îles se distinguent par un endémisme très élevé mais qui reste variable selon les groupes d’insectes. **Sur 18 espèces d’abeilles connues de Martinique, 8 sont endémiques, en tous cas à notre connaissance.** Si la plupart de ces espèces sont présentes dans plusieurs îles de l’archipel, certaines ne vivent que sur une seule d’entre elles ! Nous avons une forte responsabilité à l’échelle du monde du fait de nos espèces endémiques. Mais au risque de vous décevoir, il y a peu d’espèces spectaculaires quand bien même nous serions dans une région tropicale. Les espèces communes sont même en moyenne plus petites que sur le continent, ceci étant lié à des ressources plus limitées.	\N	\N	\N	f
66976	1043	TEXT	body.bodyElements.10.paragraph.paragraphText	**Pour en savoir plus**, consultez le site du projet [*Bet a flé*](https://www.betafle.fr) et suivez [Martinique Entomologie](https://www.facebook.com/martiniqueentomologie) sur Facebook. 	\N	\N	\N	f
66977	1043	IMAGE	presentation.image	\N	2518	Vonvon (*Xylocopa fimbriata*) butinant des fleurs de Glisérya (*Gliricidia sepium*) © Eddy Dumbardon-Martial	\N	f
66978	1043	TEXT	body.bodyElements.9.questionAnswer.question	Comme évoqué plus haut, la sensibilisation au sort des insectes est une de vos missions. Quel peut être le rôle de la population dans la sauvegarde de la biodiversité en Martinique ? 	\N	\N	\N	f
66979	1043	TEXT	body.bodyElements.1.questionAnswer.question	De quand datent les premiers inventaires d’insectes pollinisateurs en Martinique ?	\N	\N	\N	f
66980	1043	TEXT	body.bodyElements.2.citation.citationElement	«&nbsp;Mobiliser les gens autour de ces questions n’est pas une mince affaire, d’autant que nous avons ici des relations plus conflictuelles avec les insectes, souvent assimilés à des vecteurs de maladies.&nbsp;»	\N	\N	\N	f
66981	1043	TEXT	body.bodyElements.5.questionAnswer.question	Les bénévoles se sont tout de même prêtés à une campagne de piégeage d’insectes mais aussi à un marathon photo. Qu’avez-vous pu tirer de ces inventaires ? 	\N	\N	\N	f
66982	1043	TEXT	body.bodyElements.3.questionAnswer.response	Cela faisait quelques années que j’accumulais des données de terrain sur les insectes butinant les plantes à fleurs. J’ai voulu les formaliser et les rendre accessibles en créant le site [betafle.fr](betafle.fr), *Bet a flé* signifiant «&nbsp;bêtes à fleurs&nbsp;» en créole. Avec pour ambition d’enrichir cette base de données au fil des années. **C’est dans ce contexte que nous avons décidé avec l’association Martinique Entomologie de faire appel à la population.** Un projet de sciences participatives s’est mis en en place dans la presqu’île de la Caravelle, une des zones les plus anciennes de l’île. C’est aujourd’hui une réserve naturelle extrêmement riche. Ses paysages magnifiques de savanes, de forêts sèches, de mangroves sont très appréciés des martiniquais et des touristes. C’était le lieu idéal pour rassembler du public. Car l’objectif du projet «&nbsp;*Insectes pollinisateurs de la Réserve naturelle de la Caravelle*&nbsp;» ne se limitait pas à la mise en œuvre d’un simple inventaire&nbsp;: nous voulions profiter de l’occasion pour sensibiliser, faire de la pédagogie. Nous voulions orienter les regards vers les bet a flé, cette petite faune laissée pour compte dans la réserve, et pourtant omniprésente. Seule une dizaine de curieux a répondu à notre appel. La participation aurait pu être plus importante, mais **mobiliser les gens autour de ces questions n’est pas une mince affaire, d’autant que nous avons ici des relations plus conflictuelles avec les insectes, souvent assimilés à des vecteurs de maladies.** De plus nous n’avons pas pu conduire les actions de communication prévues à cause du manque de moyens financiers. Nous avons dû faire des choix.	\N	\N	\N	f
66983	1043	TEXT	body.bodyElements.8.citation.citationElement	«&nbsp;Il faut amener gens à observer, c’est la meilleure façon de sensibiliser.&nbsp;»	\N	\N	\N	f
70195	1054	IMAGE	presentation.image	\N	2642	© Bruno Marie	\N	f
70196	1054	IMAGE	body.photos.10.photo	\N	2648	© Bruno Marie	\N	f
70197	1054	IMAGE	photograph.photo	\N	2641	© Bruno Marie	\N	f
70198	1054	TEXT	body.photos.10.description	« Cette photo a été prise au Cap des Sourcils Noirs, sur la Presqu’île Jeanne d’Arc à Kerguelen, où une importante colonie d’Albatros à sourcils noirs ([*Thalassarche melanophris*](https://inpn.mnhn.fr/espece/cd_nom/442424)), suivie et étudiée depuis plusieurs décennies, côtoie une colonie de Gorfou macaroni ([*Eudyptes chrysolophus*](https://inpn.mnhn.fr/espece/cd_nom/441903)). On y trouve aussi de nombreux Albatros fuligineux à dos sombre ([*Phoebetria fusca*](https://inpn.mnhn.fr/espece/cd_nom/442214)) et Albatros à tête grise ([*Thalassarche chrysostoma*](https://inpn.mnhn.fr/espece/cd_nom/442423)). »	\N	\N	\N	f
70199	1054	IMAGE	body.photos.3.photo	\N	2651	© Bruno Marie	\N	f
70200	1054	TEXT	photograph.presentation	Bruno Marie	\N	\N	\N	f
64739	1020	TEXT	events.6.description	Création du Parc marin de la mer de Corail ; Inscription des lacs du Grand Sud sur la liste des sites Ramsar	\N	\N	\N	f
66984	1043	IMAGE	interviewee.photo	\N	2516	Eddy Dumbardon-Martial	\N	f
64740	1020	TEXT	species.13.description	Ces dernières décennies, la prospection biologique des milieux profonds notamment des monts sous-marins a permis la découverte de fossiles vivants. Parmi eux, un crinoïde ([*Neogymnochrinus richeri*](https://inpn.mnhn.fr/espece/cd_nom/647041)), de la famille des Sclerocrinidae,  datant du jurassique et supposée éteinte. Il a été retrouvé à la fin des années 80 sur la ride de Norflok.  \n  \nStatut dans la Liste rouge mondiale : non évalué. \n\n\n	\N	\N	\N	f
66985	1043	TEXT	body.introduction	Dans l’archipel des Antilles, l’abeille n’a pas la même aura qu’en métropole, du fait de l’indépendance des grandes cultures (banane et canne à sucre) à son égard. Malgré tout, Eddy Dumbardon-Martial, naturaliste et spécialiste des diptères tente de mettre en lumière les insectes pollinisateurs, une faune encore mal connue en Martinique et pourtant d’une haute valeur patrimoniale. Une de ses armes : les sciences participatives.	\N	\N	\N	f
67909	1050	IMAGE	body.titre_question.7.image.imageElement	\N	2553	Forêt sèche de Malhec © Conservatoire d'espaces naturels de Nouvelle-Calédonie	\N	f
67910	1050	TEXT	body.titre_question.1.paragraph.paragraphText	<strong>Le tableau de bord des forêts sèches de Nouvelle-Calédonie est une interface visuelle, en ligne depuis début 2021, qui centralise des données géographiques et renseigne plusieurs indicateurs chiffrés sur les forêts sèches de Nouvelle-Calédonie et les actions de protection et de restauration déployées pour leur conservation</strong>.	\N	\N	\N	f
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
70201	1054	IMAGE	body.photos.5.photo	\N	2653	© Bruno Marie	\N	f
70202	1054	TEXT	body.introduction	Crozet, Kerguelen, Saint Paul et Amsterdam, ces îles isolées du sud de l’océan Indien sont soumises à un climat rude et inhospitalier. Elles abritent cependant une faune exceptionnelle et préservée. Le photographe Bruno Marie nous emmène à la rencontre de quelques habitants des « *îles de la Désolation* ». 	\N	\N	\N	f
68506	1038	TEXT	events.5.description	Création du Centre spatial guyanais à Kourou	\N	\N	\N	f
70203	1054	IMAGE	body.photos.8.photo	\N	2646	© Bruno Marie	\N	f
37458	1026	TEXT	action.title	Pour commencer à réduire mes déchets : 	\N	\N	\N	f
37459	1026	TEXT	understand.quote	A l’échelle mondiale, un tiers des déchets plastiques se retrouve dans la nature. Seuls 9% des déchets plastiques sont recyclés dans le monde.	\N	\N	\N	f
37460	1026	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
37461	1026	TEXT	action.cards.0.description	Je refuse les sacs plastiques à usage unique, j'utilise des sacs réutilisables en tissus ou en matières naturelles.	\N	\N	\N	f
68507	1038	TEXT	statistics.4.text	de poissons d'eau douce et saumâtre	\N	\N	\N	f
70204	1054	IMAGE	body.photos.0.photo	\N	2643	© Bruno Marie	\N	f
70205	1049	TEXT	body.photos.3.description	« L’île d’Europa est l’un des plus importants sites de ponte de l’océan Indien pour les tortues marines. Après être montée en haut de la plage, cette femelle Tortue verte ([*Chelonia mydas*](https://inpn.mnhn.fr/espece/cd_nom/77338)) creuse un nid de quelques dizaines de centimètres de profondeur, dans lequel elle pondra une centaine d’œufs. \n<br>La ponte d’une tortue est une scène émouvante : elle peine beaucoup à se mouvoir au milieu de la végétation, des débris coralliens et des pierres qui jonchent les plages, sans compter le dénivelé. Se déplaçant à la force des nageoires, bien peu adaptées en milieu terrestre, certaines d’entre elles restent bloquées. Il est à Europa un lieu baptisé «&nbsp;le cimetière des tortues&nbsp;», une grande étendue de sable où nous avons vu nombre de carcasses de tortues n’ayant pu faire l'aller-retour du voyage qu’elles avaient entrepris pour donner la vie.»<br> \n	\N	\N	\N	f
70206	1049	IMAGE	body.photos.1.photo	\N	2540	Bruno Marie	\N	f
64741	1020	TEXT	species.15.description	Plus gros pigeon arboricole du monde, le Notou ([*Ducula goliath*](https://www.endemia.nc/faune/fiche71)) présente un plumage bleu gris, avec une pointe de pourpre sur les ailes, et ses yeux sont rouge vif. Il vit dans les forêts humides de la Grande Terre et contribue à sa régénération par dissémination des graines dont il se nourrit. Difficile à observer, il se repère toutefois facilement à son chant particulier, grave et sourd.  \n\nStatut dans la Liste rouge mondiale : non évalué.\n	\N	\N	\N	f
64742	1020	TEXT	events.6.date	2014	\N	\N	\N	f
66565	1039	TEXT	species.8.description	Le Namoulohna ([*Foetidia comorensis*](https://inpn.mnhn.fr/espece/cd_nom/807350)) est un arbre endémique de Mayotte, extrêmement rare&nbsp;: il n’est connu que d’une unique station de 600 m<sup>2</sup> avec environ 80 individus dénombrés en 2017. Connue depuis longtemps par les villageois locaux, elle n’a été décrite pour la science qu’en 2011. Menacée entre autres par les défrichements pour l’installation de cultures vivrières et le pâturage des animaux domestiques, l’espèce figure sur la liste des espèces protégée de Mayotte et un important travail de sensibilisation est mené autour de sa préservation.  \n  \nStatut sur la Liste rouge de la flore vasculaire de Mayotte : en danger critique.	\N	\N	\N	f
68508	1038	TEXT	interests.locations.2.name	Les Nouragues	\N	\N	\N	f
68509	1038	TEXT	ecosystems.ecosystems.3.description	Les savanes de Guyane occupent très peu d’espace : seulement 0,3% du territoire. Ce sont des milieux ouverts herbacés, avec quelques arbres ou arbustes plus ou moins isolés, qui se trouvent répartis sur une fine bande le long de la côte, entre la forêt et les zones de marais, sur les plaines basses de sédiments argilo-sableux. Malgré leur faible étendue, elles représentent un milieu remarquable pour la biodiversité : elles abritent 16 % de la flore guyanaise et la végétation y est très spécialisée. \nLes savanes sont menacées par l’expansion démographique, ainsi que l’introduction de deux arbres envahissants, l’[*Acacia mangium*](https://inpn.mnhn.fr/espece/cd_nom/447341) et le Niaouli ([*Melaleuca quinquenervia*](https://inpn.mnhn.fr/espece/cd_nom/447400)) qui entrainent la fermeture du milieu. Depuis 2011, le Groupe d’étude et de protection des oiseaux de Guyane (GEPOG) mène des actions pour la [conservation des savanes de Guyane](https://www.savanes.fr/), dont la lutte contre les espèces végétales envahissantes, d’abord dans le cadre du programme LIFE+ Cap DOM, puis du LIFE+ BIODIV’OM.	\N	\N	\N	f
68510	1038	TEXT	ecosystems.ecosystems.4.description	De nombreuses zones humides se situent le long du trait de côte, en retrait des mangroves et en bordure des savanes. Des marais herbacés aux forêts marécageuses, on trouve une diversité de formations végétales qui abritent une faune importante, notamment des caïmans noirs, de nombreuses espèces de poissons d’eau douce ou saumâtre, des crustacés, de nombreux oiseaux en particulier des limicoles et des rapaces ou encore le remarquable Hoazin huppé ([*Opisthocomus hoazin*](https://inpn.mnhn.fr/espece/cd_nom/442155)).	\N	\N	\N	f
68511	1038	TEXT	ecosystems.ecosystems.4.name	Les marais et les forêts marécageuses	\N	\N	\N	f
68512	1038	TEXT	statistics.3.text	d'oiseaux	\N	\N	\N	f
67911	1050	TEXT	body.titre_question.4.paragraph.paragraphText	<strong>Des onglets offrent l’accès aux informations disponibles selon 7 thèmes </strong> : la protection, la gestion, la restauration active, les menaces, le suivi, la sensibilisation, et la synthèse de ces données. Chaque onglet met en avant les données sous plusieurs formes : carte, graphique, jauge, chiffre, texte, image. On peut par exemple visualiser en un clic le nombre d’hectares reboisés (51,3 ha), la surface de forêt sèche classée en aire protégées (seulement 0,6 %) ou encore le nombre de sites faisant l’objet de suivis et d’études (8 sites de suivis de la dynamique forestière, 23 sites d’études ponctuelles).  \nUne liste déroulante en haut à droite de l’interface permet en un clic d’actualiser l’ensemble des indicateurs pour une emprise géographique donnée. <strong>Il est ainsi possible de consulter les données relatives à toute la Nouvelle-Calédonie, à une Province, ou à une commune</strong>.   \n<br>\nPour le grand public, le tableau de bord des forêts sèches se veut être <strong>une interface synthétique pour l’affichage rapide des principales informations sur chaque thème</strong>. Pour les professionnels, il permet de visualiser les données disponibles et peut constituer un outil d’aide à la décision.<br>\n<br>\nCe « tableau de bord des forêts sèches » bénéficiera de mises à jour annuelles en fonction des nouvelles connaissances acquises, de la définition de nouveaux indicateurs et de la remontée d’informations du réseau de partenaires.<br>\n	\N	\N	\N	f
67912	1050	TEXT	body.introduction	La forêt sèche, ou sclérophylle, est l’écosystème le plus menacé de disparition en Nouvelle-Calédonie. Il ne subsiste aujourd’hui que 175 km² de forêt sèche morcelée de l’extrême Nord au Sud-ouest de la Grande Terre, soit l’équivalent d’environ 2 % seulement de la surface d'origine de ces forêts qui recouvraient la Nouvelle-Calédonie.	\N	\N	\N	f
67913	1050	IMAGE	body.titre_question.3.image.imageElement	\N	2552	Aperçu de l'onglet de synthèse du tableau de bord numérique 	\N	f
68513	1038	TEXT	events.10.date	1996	\N	\N	\N	f
66566	1039	IMAGE	species.2.image	\N	2389	*Eulemur fulvus* © Emmanuel Broeks	\N	f
68514	1038	IMAGE	species.1.image	\N	2402	*Dendrobates tinctorius* © Raphaël Gailhac - OFB	\N	f
68515	1038	TEXT	events.5.date	1964	\N	\N	\N	f
68516	1038	TEXT	identity.marineArea	131 506	\N	\N	\N	f
68517	1038	TEXT	events.8.date	1994	\N	\N	\N	f
68919	1030	TEXT	paragraphs.2.title	Mentions relatives à l’utilisation de cookies	\N	\N	\N	f
35068	1017	TEXT	answer	Les écogestes, ce sont tous ces changements de comportement individuels qui permettent de réduire son impact sur l’environnement. Faire attention à son utilisation énergétique, faire les bons choix de consommation, mieux gérer ses déchets, consommer moins de viande, etc. des plus petits gestes aux grands changements, chacun est acteur de la préservation de l’environnement et peut limiter son impact. La multiplication de ces comportements individuels peut entraîner des changements notables à plus grande échelle !\n\nTous ces gestes ne doivent pas faire oublier que de profonds changements de société seront nécessaire pour limiter les risques liés au déclin de la biodiversité et au changement climatique. Ils représentent des actions et des changements de comportements nécessaires, mais doivent être accompagnés de politiques environnementales à la hauteur des enjeux.  \nLa troisième Stratégie nationale pour la biodiversité engage les territoires français pour la prochaine décennie à enrayer le déclin de la biodiversité. Des concertations territoriales citoyennes se déroulerons au cours de l'année 2021. Participez et retrouvez toutes les informations sur [biodiversité.gouv.fr](https://biodiversite.gouv.fr/)	\N	\N	\N	f
66986	1043	TEXT	body.bodyElements.7.questionAnswer.response	De façon objective, nous n’avons pas assez de recul sur l’évolution de la faune entomologique en Martinique. Et il n’y a jamais eu de suivis de pollinisateurs. On connait en revanche les menaces qui pèsent sur ces insectes. **D’abord l’urbanisation et plus généralement les activités humaines qui empiètent sur les espaces forestiers**. En métropole, ce sont certains écosystèmes ouverts d’intérêt écologique comme les prairies naturelles qui régressent alors que chez nous ce sont les forêts. **Problème : les espèces endémiques sont souvent inféodées aux espaces forestiers**. Donc les habitats se réduisent. Concernant les pesticides, souci majeur à l’échelle mondiale, on ne sait pas grand-chose, mais des études sont en cours pour évaluer l’exposition de la faune locale à ces produits.<br>\n<br>\nDe manière plus subjective, je pense que la pente que nous prenons a de quoi inquiéter. Déjà au niveau paysager la régression des forêts et l’ouverture des milieux perturbent les écosystèmes. Je vois se généraliser des espèces végétales invasives, essentiellement des graminées, comme l’[herbe de guinée](https://inpn.mnhn.fr/espece/cd_nom/672415), qui prennent le dessus sur les plantes à fleurs. Cela implique une modification de la ressource florale disponible pour les insectes pollinisateurs dans certains milieux. Dans quelle mesure&nbsp;? On n’en sait rien. **Il est donc nécessaire de mener des études sur les relations «&nbsp;insectes-plantes à fleurs&nbsp;», en tenant compte des particularités de nos territoires.** Aborder ce sujet impose une vision transversale, sur les plantes, les insectes, mais aussi l’écologie et la gestion. <br>	\N	\N	\N	f
67914	1050	TEXT	body.titre_question.6.paragraph.paragraphText	**Institut Agronomique neo-Calédonien (IAC), Institut de Recherche pour le Développement (IRD), Université de la Nouvelle-Calédonie (UNC), Fonds mondial pour la nature (WWF) et Centre d’Initiation à l’Environnement (CIE).*	\N	\N	\N	f
68199	1041	TEXT	species.7.description	Le Phylica ([*Phylica arborea*](https://inpn.mnhn.fr/espece/cd_nom/780147)) est le seul arbre indigène des Terres australes françaises, et il est présent uniquement sur l’île d’Amsterdam. Les incendies et la dégradation par les bovins introduits avaient presque conduit à sa disparition. Il est aujourd’hui au centre d'un programme de restauration mené par la Réserve naturelle nationale des Terres australes françaises qui met en place la plantation de jeunes individus en milieu naturel afin de recréer des boisements sains dans son aire de distribution originelle, après l'éradication des bovins de l'île en 2010. \n  \nStatut sur la Liste rouge mondiale : en danger. \n	\N	\N	\N	f
68200	1041	TEXT	species.8.description	Les orques ([*Orcinus orca*](https://inpn.mnhn.fr/espece/cd_nom/60905)) sont des super-prédateurs fréquemment observées dans les eaux subantarctiques, où elles chassent notamment les juvéniles d’otaries et d’éléphant de mer. Elles vivent en groupes sociaux dirigés par la doyenne des femelles.  \n  \nStatut sur la Liste rouge des mammifères des TAAF : en danger.\n	\N	\N	\N	f
35069	1017	TEXT	other.title	Retrouvez d'autres écogestes sur	\N	\N	\N	f
35070	1017	CHECKBOX	shadowed	false	\N	\N	\N	f
35071	1017	IMAGE	other.image	\N	1257	logo	\N	f
35072	1017	TEXT	other.text	Biodiversité Tous Vivants !	\N	\N	\N	f
35073	1017	TEXT	title	Adaptons nos comportement pour préserver la biodiversité	\N	\N	\N	f
68201	1041	IMAGE	species.9.image	\N	1740	*Anatalanta aptera* © TAAF 	\N	f
68202	1041	TEXT	events.2.description	Émergence des îles Saint-Paul et Amsterdam	\N	\N	\N	f
68203	1041	TEXT	events.3.description	Découverte des îles Saint-Paul et Amsterdam par le navigateur Sébastian Del Cano et les compagnons de Magellan	\N	\N	\N	f
68518	1038	IMAGE	interests.locations.0.image	\N	2400	Vue aérienne sur le territoire du Parc national © Guillaume Feuillet, PAG	\N	f
68519	1038	TEXT	species.6.name	Le Palmier pinot	\N	\N	\N	f
68520	1038	IMAGE	interests.locations.3.image	\N	2399	Plage d'Awala-Yalimapo © Raphaël Gailhac - OFB	\N	f
68521	1038	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
68522	1038	TEXT	interests.locations.3.name	Les plages d'Awala-Yalimapo	\N	\N	\N	f
68204	1041	IMAGE	species.2.image	\N	1735	*Eudyptes chrysolophus* © Julie Tucoulet	\N	f
68205	1041	IMAGE	identity.image	\N	1702	Vallée de la Hébé, île de la Possession, Crozet © Julie Tucoulet	\N	f
69637	1052	TEXT	body.titre_question.8.paragraph.paragraphText	<strong>Le financement des programmes </strong>  \nCe sont <strong>les services de l’Etat</strong> qui permettent de financer le plus de programmes, même si certaines associations parviennent à faire vivre leurs programmes sur fonds propres.  \n<br> \n<strong>Le public cible</strong>  \nLa moitié des programmes enquêtés concerne <strong>un public large</strong>, cependant, étant donné qu’une grande partie de ces programmes porte sur le milieu marin, les usagers de la mer (souvent les plongeurs sous-marins) sont particulièrement sollicités.      \nOn note également que <strong>la plupart des observateurs et bénévoles proviennent de France hexagonale.</strong> Appelés "métropolitains" dans les Outre-mer, ils s’installent pour raisons professionnelles dans un territoire ultra-marin, pour une durée courte, allant souvent d’une à cinq années.  \n<br> \n<strong>Le type d'observations</strong>  \n<strong>Une majorité des observations est faite de manière opportuniste et en autonomie.</strong> Les programmes qui utilisent un protocole scientifique ne représentent que 33% de l’ensemble enquêté.	\N	\N	\N	f
64743	1020	TEXT	events.4.description	Publication des Codes de l'environnement des Provinces Sud et Nord	\N	\N	\N	f
64744	1020	TEXT	events.5.description	Création du [Conservatoire d'espaces naturels](https://www.cen.nc)	\N	\N	\N	f
64745	1020	TEXT	interests.locations.2.name	La région des lacs du Grand Sud	\N	\N	\N	f
66567	1039	IMAGE	ecosystems.ecosystems.4.image	\N	2396	Herbier sous-marin © Marine Dedeken / Office français de la biodiversité	\N	f
66990	1044	TEXT	body.bodyElements.6.questionAnswer.question	Vous parlez de «&nbsp;chasse au trésor&nbsp;». Comment se passe précisément la partie pratique ?	\N	\N	\N	f
66991	1044	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
66992	1044	TEXT	body.bodyElements.0.questionAnswer.response	Tout est parti du projet BING, mené dans une trentaine de classes entre 2016 et 2019 dans toute la Guyane. **L’objectif était de faire découvrir aux écoliers la biodiversité commune, mal connue et «&nbsp;négligée&nbsp;»**, celle qui pourtant les entoure, dans leur école, dans leur ville, à la maison parfois. Pour cela deux chercheurs du CNRS et de l’INRAE, Jérôme Orivel et Heidy Schimann, ont choisi comme porte d’entrée deux groupes d’animaux dont ils sont spécialistes : respectivement les fourmis et les champignons. Ils ont proposé aux enseignants des activités pour faire découvrir des espèces fascinantes, susciter l’intérêt et sensibiliser par la pédagogie. **Cette campagne fut un succès, tant auprès des élèves que des enseignants, ce qui a fait naître un projet plus ambitieux : l’acquisition de données.**\nCette biodiversité, surtout dans les milieux urbains, reste extrêmement mal décrite. Peu de missions de terrains ont eu lieu dans les petites communes et dans les agglomérations comme Kourou. Quelles espèces de fourmis et de champignons y vivent ? Certaines espèces sont-elles potentiellement envahissantes ? Comment réagissent-elles aux activités humaines ? Mettre les écoliers à contribution pour dresser un état des lieux de cette biodiversité, par ailleurs facilement observable, répondait à une nécessité à la fois pédagogique et scientifique. Le projet BUG (Biodiversité Urbaine de Guyane) est né. Nous avons lancé un appel à participation auprès de tous les établissements de Guyane, et en deux jours nous étions submergés de réponses positives. **Depuis le lancement en janvier, plus de 400 élèves y ont participé, du CM1 à la 3ème**.	\N	\N	\N	f
66993	1044	TEXT	body.bodyElements.2.questionAnswer.response	Raconter des histoires étonnantes est le meilleur moyen d’intéresser les élèves. Et le moins que l’on puisse dire c’est que les fourmis et les champignons de Guyane n’en manquent pas ! **Connaissez-vous les fourmis zombies ?** Certaines fourmis se font parasiter par un champignon, le Cordyceps. Après avoir colonisé les muscles de l'insecte, le champignon s’attaque au cerveau. Il prend alors le contrôle de la fourmi. Comme une marionnette. Son objectif : conduire la fourmi en haut d’une branche, avant de l’achever et pouvoir disséminer ses spores le plus loin possible. **Autres phénomènes : les fourmis tac-tac.** Elles se caractérisent par de grandes mandibules disposant de poils ultra sensibles. Lorsque l’insecte chasse à l’affût et qu’une proie, une sauterelle par exemple, a le malheur d’effleurer un de ces poils, les mandibules se referment sur elle à une vitesse vertigineuse : 225 km/h ! C’est le mouvement le plus rapide du monde animal. Cela provoque un claquement, d’où son nom. En général ces histoires marquent les élèves. Surtout lorsqu’on leur apprend que ces espèces vivent autour d’eux…	\N	\N	\N	f
66994	1044	TEXT	body.bodyElements.2.questionAnswer.question	La prise de contact avec la classe se fait par une intervention, au cours de laquelle vous partagez quelques révélations sur les champignons et les fourmis de Guyane. Un exemple ? 	\N	\N	\N	f
66995	1044	TEXT	interviewee.presentation	Marilou Hircq, ingénieure au CNRS, coordinatrice du projet BUG	\N	\N	\N	f
66996	1044	TEXT	body.bodyElements.6.questionAnswer.response	Nous avons réalisé des protocoles de collecte simplifiés que les élèves mettent en place dans l’enceinte de l’école, avec l’enseignant. Les fourmis sont récupérées à l’aide d’une pince souple puis mises dans un tube contenant de l’éthanol dilué. Une fois prélevés, on les passe sous la loupe binoculaire pour une séance d’observation minutieuse. Pour les champignons, on collecte simplement un peu de terre dans un sachet. Les chercheurs se chargeront ensuite de déterminer les espèces présentes grâce à la détection d’ADN. Mais la pratique ne s’arrête pas là ! L’idée est que les élèves reproduisent l’échantillonnage chez eux, afin d’accroître de nombre d’échantillons dans toute la commune. Nous récupérons ensuite tous les échantillons pour analyse. **J’ai en ce moment en ma possession des organismes provenant de tout le territoire, dans des milieux très diversifiés.** Certains ont été prélevés dans de petites communes très isolées comme Camopi au bord fleuve, accessible qu’en pirogue il y a encore peu de temps. Il y a aussi les grandes villes comme Kourou, Saint-Laurent-du-Maroni ou Cayenne. Des villes côtières, forestières. Des maisons, des appartements de centre-ville. En quatre mois, nous avons reçu pas loin de 500 échantillons issus de 11 communes. **Grâce aux élèves nous allons découvrir une biodiversité encore inconnue en Guyane.**	\N	\N	\N	f
66997	1044	TEXT	presentation.name	"Grâce aux élèves, nous allons découvrir une biodiversité encore inconnue en Guyane"	\N	\N	\N	f
68523	1038	TEXT	events.12.date	2006	\N	\N	\N	f
68524	1038	TEXT	statistics.1.text	espèces d'arbres	\N	\N	\N	f
68525	1038	TEXT	events.9.date	1995	\N	\N	\N	f
68526	1038	IMAGE	species.4.image	\N	2407	*Pteronura brasiliensis* © Fabien Lefebvre	\N	f
68527	1038	TEXT	events.3.date	1852	\N	\N	\N	f
68528	1038	IMAGE	ecosystems.ecosystems.3.image	\N	2412	Savanes de Guyane © Bernard G. - 97px	\N	f
68529	1038	IMAGE	species.3.image	\N	2401	*Panthera onca* © Raphaël Gailhac - OFB	\N	f
68530	1038	IMAGE	zoom.map	\N	2398	Carte Guyane	\N	f
68531	1038	TEXT	species.1.name	Le Dendrobate à tapirer	\N	\N	\N	f
68532	1038	TEXT	species.7.name	Le Fromager	\N	\N	\N	f
68533	1038	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
68534	1038	TEXT	species.4.name	Les loutres	\N	\N	\N	f
68535	1038	TEXT	identity.area	83 846	\N	\N	\N	f
68536	1038	TEXT	species.0.description	Atteignant jusqu’à 17 cm de long, le Titan ([*Titanus giganteus*](https://inpn.mnhn.fr/espece/cd_nom/758743)) est le plus grand coléoptère du monde. On connait cependant peu de choses sur sa biologie : si les mâles sont attirés par la lumière, ce n’est pas le cas des femelles qui sont rarement observées. On suppose que les larves se développent dans le sol, au niveau des racines ou des souches, et consomment du bois décomposé.  \nCe longicorne attire particulièrement les collectionneurs, c’est pourquoi depuis le 25 juillet 2019, il existe un quota limitant l’exportation à un spécimen par personne et par an.\nL’inventaire des insectes de Guyane est encore largement incomplet. Si la diversité des insectes est très importante, l’abondance de chaque espèce est généralement faible, ce qui rend leur recensement complexe.  \n  \nStatut sur la Liste rouge mondiale : non évalué.	\N	\N	\N	f
68537	1038	TEXT	identity.highestPointName	Montagne Bellevue	\N	\N	\N	f
68538	1038	TEXT	ecosystems.ecosystems.2.name	Les mangroves	\N	\N	\N	f
68539	1038	TEXT	species.7.description	Le Fromager ([*Ceiba pentandra*](https://inpn.mnhn.fr/espece/cd_nom/447007)) est un arbre géant largement répandu dans les forêts humides d’Amérique, d’Afrique et d’Asie. Très imposant, il peut atteindre plusieurs dizaines de mètres de haut et développe des contreforts avec l’âge. Son tronc lisse est pourvu de nombreuses épines coniques. Un individu particulièrement imposant (50 m de haut pour 40 m de circonférence) est observable dans le village de Saül. \nEn Guyane comme dans toute l’Amérique tropicale, cet arbre majestueux tient une place importante dans la cosmogonie de nombreux peuples, il est lié au chamanisme et est réputé habité par des esprits puissants et parfois dangereux. Ses contreforts sont appréciés par les Wayana pour faire des ciels de cases (disque rond occupant le faîte de leur maison ronde communautaire).\n\nStatut sur la Liste rouge mondiale : préoccupation mineure.\n	\N	\N	\N	f
68540	1038	IMAGE	species.2.image	\N	2403	*Ramphastos tucanus* © Raphaël Gailhac - OFB	\N	f
68541	1038	IMAGE	ecosystems.ecosystems.4.image	\N	2416	Rivière et marais de Kaw © Pierre-Olivier Jay - 97px	\N	f
68542	1038	TEXT	species.3.description	Solitaire et discret, le Jaguar ([*Panthera onca*](https://inpn.mnhn.fr/espece/cd_nom/443623)) est présent sur tout le département. Le félin tacheté est menacé par la destruction et la fragmentation de son habitat, la raréfaction des proies et le braconnage, bien que les populations soient considérées plutôt en bon état sur le territoire guyanais. \nIl tient une place importante dans les cultures amérindiennes, bushinenguées et créole. Souvent lié au chamanisme, et il représente également un personnage un peu lourdaud et pataud dans les contes populaires guyanais.\nLes attaques de ce carnivore sur les animaux domestiques, en particulier les chiens, sont relativement fréquentes en milieu péri-urbain. Un [guide pour une coexistence homme-jaguar](https://guyane.ofb.fr/wp-content/uploads/2021/04/OFB_LivretJaguar_MAJ_032020.pdf) est proposé par l’Office français de la biodiversité pour diminuer ces conflits. \n\nStatut sur la Liste rouge des mammifères de Guyane : quasi-menacé. \n	\N	\N	\N	f
68543	1038	TEXT	statistics.3.number	Près de 700 espèces	\N	\N	\N	f
66568	1039	TEXT	species.3.description	Cette plante ([*Cananga odorata*](https://inpn.mnhn.fr/espece/cd_nom/446902)) introduite à la fin du 18e siècle depuis l’Asie du Sud-est est devenue un emblème de l’île. L’arbre présente une écorce grise, et est généralement taillé pour rester à hauteur de cueillette, soit 2 à 3 m de haut alors qu’il peut atteindre 25 -30 m en milieu naturel. La floraison peut s’observer plusieurs fois par an. Les fleurs, très odoriférantes, présentent six longs pétales jaunes. On en extrait par distillation une huile essentielle très utilisée en cosmétique et en parfumerie.\n  \nStatut sur la Liste rouge mondiale : non évalué. \n	\N	\N	\N	f
66569	1039	TEXT	statistics.3.number	24 espèces	\N	\N	\N	f
66570	1039	TEXT	species.1.description	Sur les 16 espèces présentes dans les eaux du territoire, [*Octopus cyanea*](https://inpn.mnhn.fr/espece/cd_nom/527348) est le plus grand : il peut dépasser 1 m de long et peser jusqu’à 8kg. Ordinairement de couleur brun-rouge, il change de couleur pour se camoufler dans son environnement. On le retrouve sur les zones récifales où il se cache dans des trous. \nCes mollusques céphalopodes sont remarquablement intelligents, capables d’utiliser des outils et disposent d’une impressionnante mémoire. Leur cycle de vie est court, entre 12 et 24 mois. Les mâles déclinent à la suite de la reproduction et les femelles meurent quelques jours après l’éclosion des œufs.  \nTrès appréciés à Mayotte, les poulpes sont pêchés à pied sur les platiers à marée basse. Pour préserver la ressource, des réserves de pêche sont mise en place à l’initiative de la population locale, la pêche est alors temporairement interdite afin de permettre aux poulpes de se reproduire.  \n\nStatut sur la Liste rouge mondiale pour *Octopus cyanea* : préoccupation mineure.\n	\N	\N	\N	f
68544	1038	TEXT	statistics.4.number	Plus de 500 espèces	\N	\N	\N	f
64746	1020	TEXT	ecosystems.ecosystems.3.description	Aussi dit « sclérophylle », ce type de forêt n’est plus présent que sur environ 175 km<sup>2</sup>, soit moins de 1 % du territoire et moins de 2&nbsp;% de sa surface estimée d’origine. Localisées sur le littoral de la côte ouest, ces forêts sont très vulnérables, notamment aux aménagements agropastoraux, aux incendies et aux espèces exotiques envahissantes. Elles abritent une biodiversité élevée avec un taux d'endémisme de 60 %.   \nUn [programme de conservation](https://www.cen.nc/foret-seche/les-forets-seches-en-nc) des forêts sèches, initié en 2001, est aujourd'hui coordonné par le Conservatoire d'espaces naturels de Nouvelle-Calédonie. 	\N	\N	\N	f
68545	1038	TEXT	species.1.description	Le Dendrobate à tapirer ([*Dendrobates tinctorius*](https://inpn.mnhn.fr/espece/cd_nom/436851)) est un amphibien présentant des variations de coloration allant du bleu au jaune, plus ou moins maculé de noir. Il vit principalement au sol mais on peut également l’observer dans les arbres. \nLes glandes présentes dans sa peau sécrètent un poison toxique, qui la protègent des prédateurs. Pour l’homme, elle n’est dangereuse que si le mucus qui la recouvre entre en contact avec une plaie ou des muqueuses. Les Amérindiens en faisaient une préparation qu’ils appliquaient sur des plumes d’oiseaux vertes pour leur donner une coloration jaune ou rouge et dont ils faisaient des parures. \nLe Dendrobate à tapirer est inscrit sur la liste des amphibiens de Guyane protégés sur l’ensemble du territoire national.\n  \nStatut sur la Liste rouge des amphibiens de Guyane : préoccupation mineure. 	\N	\N	\N	f
69218	1015	TEXT	events.5.description	Création du [Sanctuaire AGOA](https://sanctuaire-agoa.fr/) pour les mammifères marins qui couvre toutes les Antilles françaises	\N	\N	\N	f
69219	1015	TEXT	interests.locations.2.name	Le Parc naturel régional de la Martinique	\N	\N	\N	f
66571	1039	TEXT	species.2.description	Ce lémurien est considéré comme une sous-espèce ou une variété du Lémur fauve de Madagascar ([*Eulemur fulvus*](https://inpn.mnhn.fr/espece/cd_nom/418673)). Il aurait été introduit par l’homme à Mayotte il y a plusieurs siècles. Il possède un pelage variant du beige au roux avec une tête noire et des yeux orangés. Vivant en groupe dans les zones forestières et se nourrissant principalement de fruits, la dégradation et la diminution de son habitat peuvent le pousser à s’approcher des zones habitées et consommer les productions fruitières ce qui crée des conflits avec les agriculteurs. L’espèce est protégée à Mayotte.  \n\nStatut sur la Liste rouge mondiale : vulnérable.\n	\N	\N	\N	f
66572	1039	TEXT	statistics.1.number	300 espèces	\N	\N	\N	f
66573	1039	TEXT	statistics.0.number	1 100 km<sup>2</sup>	\N	\N	\N	f
66574	1039	TEXT	statistics.2.number	667 hectares	\N	\N	\N	f
66575	1039	IMAGE	interests.locations.4.image	\N	2374	Baie de Bouéni © Frédéric Ducarme	\N	f
66576	1039	TEXT	species.2.name	Le Maki de Mayotte	\N	\N	\N	f
66577	1039	TEXT	risks.risks.1.name	Les récifs coralliens mahorais, des joyaux menacés	\N	\N	\N	f
66578	1039	TEXT	species.4.description	On trouve à Mayotte deux espèces de baobabs, [*Adansonia digitata*](https://inpn.mnhn.fr/espece/cd_nom/448518) et [*Adansonia madagascariensis*](https://inpn.mnhn.fr/espece/cd_nom/807173). Le premier est également répandu en Afrique tandis que le second ne se rencontre qu’à Madagascar et Mayotte. *A. digitata* possède des fleurs blanches pendantes et sa floraison est très courte - l’ouverture des fleurs à lieu en fin d’après-midi et elles tombent le lendemain matin - tandis que le *A. madagascariensis* présente des fleurs rouge-orangées dirigées vers le ciel et sa floraison s’étend sur 3-4 jours. Ce dernier est devenu très rare à Mayotte où il ne reste que quelques individus, en raison du déclin des forêts sèches et du ramassage systématique des fruits. Il est inscrit parmi les espèces protégées et bénéficie d’un plan de conservation.  \n\nStatut sur la Liste rouge de la flore vasculaire de Mayotte :\nPour *A. madagascariensis* : en danger critique.\nPour *A. digitata* : préoccupation mineure.\n	\N	\N	\N	f
66579	1039	TEXT	zoom.callToAction	Cliquez sur la carte thématique pour vous repérer en un coup d'œil ! 	\N	\N	\N	f
66580	1039	TEXT	ecosystems.ecosystems.0.name	Les forêts primaires	\N	\N	\N	f
66581	1039	TEXT	species.5.description	Vingt-et-unes espèces de dauphins ont été observées à Mayotte. Les plus communes à l’extérieur du lagon sont le Stenelle tacheté ([*Stenella attenuata*](https://inpn.mnhn.fr/espece/cd_nom/60914)) et le Dauphin à long bec ([*Stenella longirostris*](https://inpn.mnhn.fr/espece/cd_nom/60916)), qui se déplacent en grands groupes. Les populations sont évaluées à plusieurs centaines d’individus pour le premier et un millier pour le second. Dans le lagon et sur le banc de l’Iris, on rencontre notamment le Grand Dauphin du Pacifique ([*Tursiops aduncus*](https://inpn.mnhn.fr/espece/cd_nom/528706)), observé seul ou en petits groupes et dont les effectifs dans les eaux mahoraises sont estimés entre 70 et 100 individus. \nLes dauphins sont menacés par la pêche, qui impacte leur alimentation par la réduction des stocks de poissons disponibles, et entraine des captures accidentelles dans les filets. \nLes excursions touristiques en bateau organisées pour les observer peuvent les perturber, il est nécessaire de respecter les [consignes de bonnes pratiques d’observation](https://parc-marin-mayotte.fr/editorial/quand-jobserve).\n\nStatut sur la Liste rouge mondiale : \n*Stenella attenuata* : préoccupation mineure.\n*Stenella longirostris* : préoccupation mineure.\n*Tursiops aduncus* : quasi-menacé. \n	\N	\N	\N	f
66582	1039	TEXT	species.6.description	Deux espèces de tortues marines viennent pondre sur les plages de Mayotte, la Tortue verte ([*Chelonia mydas*](https://inpn.mnhn.fr/espece/cd_nom/77338)) et la Tortue imbriquée ([*Eretmochelys imbricata*](https://inpn.mnhn.fr/espece/cd_nom/77347)). Les tortues vertes sont les plus nombreuses, herbivores, elles peuvent être observées se nourrissant sur les herbiers de phanérogames, tandis que les tortues imbriquées sont omnivores et se nourrissent de mollusques, crustacés, coraux et petits poissons. D’autres espèces peuvent être occasionnellement observées mais ne viennent pas s’y reproduire.\nToutes les espèces de tortues marines sont fortement menacées à travers le monde par les activités humaines : prises accidentelles dans les filets de pêche, collisions avec les bateaux, destruction des sites de ponte et d’alimentation, pollutions… Bien qu’elles soient protégées, le braconnage des tortues marines est toujours très présent à Mayotte. \n  \nStatut sur la Liste rouge mondiale :\nTortue verte : en danger.\nTortue imbriquée : en danger critique.  \n	\N	\N	\N	f
66583	1039	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
66584	1039	TEXT	interests.locations.5.name	Le Dziani Dzaha	\N	\N	\N	f
66585	1039	TEXT	events.0.date	-8 millions d'années	\N	\N	\N	f
66586	1039	TEXT	identity.populationYear	2020	\N	\N	\N	f
66587	1039	IMAGE	species.5.image	\N	2386	*Stenella longirostris* © Yannick Stephan - Mayotte Découverte	\N	f
66588	1039	TEXT	statistics.0.text	de lagon	\N	\N	\N	f
66589	1039	TEXT	ecosystems.ecosystems.1.name	Les padzas	\N	\N	\N	f
66590	1039	TEXT	events.2.date	8<sup>e</sup> siècle	\N	\N	\N	f
66591	1039	TEXT	identity.presentation	Située dans l’archipel des Comores, au nord-ouest de Madagascar, Mayotte est un trésor de biodiversité. Une barrière récifale de 140 km de long entoure les deux îles principales ainsi que 18 îlots, et délimite un vaste lagon, l’un des plus grands et des plus profonds du monde. Ces eaux abritent une incroyable diversité d’organismes marins : poissons, mollusques, coraux, mammifères marins...  \nLe milieu terrestre n’est pas en reste : Mayotte apparaît comme l’une des îles océaniques tropicales les plus riches du monde en termes de flore indigène, au regard de sa superficie. On y trouve de nombreuses espèces endémiques, ou sub-endémiques à l’archipel des Comores. Les milieux naturels mahorais sont cependant fortement dégradés par les activités humaines, en raison notamment d’une très forte densité de population.	\N	\N	\N	f
66592	1039	TEXT	identity.population	279 500	\N	\N	\N	f
66593	1039	TEXT	species.3.name	L’Ylang-ylang	\N	\N	\N	f
66594	1039	TEXT	risks.risks.2.name	Une flore terrestre à préserver	\N	\N	\N	f
66595	1039	IMAGE	species.8.image	\N	2394	Inflorescence de *Foetidia comorensis* © Abassi Dimassi - CBN Mascarin	\N	f
66596	1039	TEXT	species.0.name	Le Crabier blanc 	\N	\N	\N	f
66597	1039	TEXT	events.4.date	1976	\N	\N	\N	f
66598	1039	IMAGE	interests.locations.2.image	\N	2375	Mont Choungui vu du nord © Frédéric Ducarme	\N	f
68546	1038	TEXT	species.2.description	Sept espèces de toucan, oiseaux à grand bec de la famille des Ramphastidés, sont présentes en Guyane. Le Toucan ariel ([*Ramphastos vitellinus*](https://inpn.mnhn.fr/espece/cd_nom/442312)) et le Toucan à bec rouge ([*Ramphastos tucanus*](https://inpn.mnhn.fr/espece/cd_nom/442311)) sont communément observés, notamment en fin de saison des pluies, où ils viennent dans la partie côtière s’alimenter sur les palmiers en fruits. Le Toucan toco ([*Ramphastos toco*](https://inpn.mnhn.fr/espece/cd_nom/442310)) est le plus grand représentant de cette famille. Caractérisé par son bec orange, il est plus rare et observable uniquement au nord du département. C’est la seule espèce de toucan intégralement protégée.  \nMalgré sa taille, la structure du bec des toucans est très légère et solide, formée de kératine et renforcée par des os poreux très légers.  \n\nStatut sur la Liste rouge des oiseaux de Guyane : \nToucan ariel : préoccupation mineure. \nToucan à bec rouge : préoccupation mineure. \nToucan toco : en danger. \n	\N	\N	\N	f
68547	1038	TEXT	statistics.1.number	Plus de 1 800	\N	\N	\N	f
68548	1038	TEXT	statistics.0.number	96 %	\N	\N	\N	f
68549	1038	TEXT	statistics.2.number	600 km<sup>2</sup>	\N	\N	\N	f
68550	1038	IMAGE	interests.locations.4.image	\N	2411	Lac Pali, dans les marais de Kaw © Andréa Poiret	\N	f
68551	1038	TEXT	species.2.name	Les toucans	\N	\N	\N	f
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
68552	1038	TEXT	risks.risks.1.name	Le fléau de l’orpaillage illégal	\N	\N	\N	f
69220	1015	TEXT	ecosystems.ecosystems.3.description	Les herbiers sont composés principalement de phanérogames marines : ce ne sont pas des algues mais bien des plantes à fleurs aquatiques ! Ils sont des lieux de reproduction, de développement et d’alimentation de nombreuses espèces (poissons, oursins, tortues…). En Martinique, ils s’étendent sur les fonds sableux sur près de 5 000 ha.	\N	\N	\N	f
64747	1020	TEXT	ecosystems.ecosystems.4.description	Forêt de bord de mer aux pieds dans l’eau, cette formation arborescente adaptée aux conditions de salinité des eaux, au manque d'oxygène et à l'instabilité des sols, est majoritairement située sur la côte ouest du fait de vastes plaines propices à son installation. Elle couvre 258 km<sup>2</sup> sur l'ensemble de l'archipel.  \n\nProtection contre l’érosion, les tempêtes, la sédimentation dans le lagon, zone de nurserie pour de nombreux organismes, épuration de l’eau : les services rendus par cet écosystème sont nombreux et précieux.	\N	\N	\N	f
64748	1020	TEXT	ecosystems.ecosystems.4.name	La mangrove	\N	\N	\N	f
66599	1039	IMAGE	ecosystems.ecosystems.2.image	\N	2395	Mangrove de Kawéni © Fanny Cautain / Office français de la biodiversité	\N	f
68206	1041	TEXT	species.3.description	L’Éléphant de mer du sud ([*Mirounga leonina*](https://inpn.mnhn.fr/espece/cd_nom/528709)) est le plus gros représentant de la famille des phoques. Il doit son nom au nez en forme de trompe qui se développe chez les mâles dominants. Sa chasse massive pour sa graisse au cours des 19<sup>e</sup> et 20<sup>e</sup> siècles a mené l’espèce au bord de l’extinction, mais les populations se sont aujourd’hui bien reconstituées. Chaque année, environ 90 000 femelles viennent se reproduire sur les côtes de Kerguelen.  \n  \nStatut sur la Liste rouge des mammifères des TAAF : préoccupation mineure.\n	\N	\N	\N	f
68207	1041	TEXT	events.7.description	Création de la réserve naturelle nationale des Terres australes françaises	\N	\N	\N	f
68208	1041	TEXT	events.7.date	2006	\N	\N	\N	f
68209	1041	TEXT	interests.locations.0.name	L'archipel Crozet	\N	\N	\N	f
40066	1023	TEXT	action.cards.0.description	Je ne jette jamais mes déchets dans la nature. Si il n’y a pas de poubelles à proximité, je les conserve avec moi en attendant.	\N	\N	\N	f
64749	1020	TEXT	ecosystems.ecosystems.5.description	Exposées aux activités humaines et vulnérables, ces prairies sous-marines occupent près de 940 km² de zones côtières peu profondes. On y compte 11 espèces de phanérogames marines parmi les 70 connues au niveau mondial. \nHabitat et source de nourriture pour de nombreuses espèces (dugong, tortues…), ces herbiers revêtent également une importance socio-économique en abritant diverses espèces pêchées, telles que les holothuries. En outre, elles protègent le littoral en fixant les sédiments et joueraient un rôle important dans la régulation du climat (stockage de carbone). \n	\N	\N	\N	f
64750	1020	TEXT	ecosystems.ecosystems.7.name	Les fonds de baie envasés	\N	\N	\N	f
64751	1020	TEXT	ecosystems.ecosystems.7.description	Le long du littoral de la Grande Terre se trouvent des baies protégées, aux fonds constitués de sédiments fins, souvent vaseux. Certains sont chargés en terre rouge provenant des sols naturellement délavés, d'autres ont une charge terrigène accrue par les activités humaines.  \n   \nUne communauté de coraux spéciale vit dans ces habitats singuliers, comme l’espèce endémique, [*Cantharellus noumeae*](https://inpn.mnhn.fr/espece/cd_nom/445124) ou [*Acropora tortuosa*](https://inpn.mnhn.fr/espece/cd_nom/445206), qui produit du mucus piégeant les sédiments ou encore [*Catalaphyllia jardinei*](https://endemia.nc/faune/fiche8114), qui étale ses polypes mous et colorés.\n	\N	\N	\N	f
64752	1020	IMAGE	species.14.image	\N	2459	*Nautilus sp.* © Claude Payri	\N	f
68553	1038	TEXT	species.4.description	Deux espèces de loutres, la Loutre géante ([*Pteronura brasiliensis*](https://inpn.mnhn.fr/espece/cd_nom/443628)) et la Loutre commune ([*Lontra longicaudis*](https://inpn.mnhn.fr/espece/cd_nom/443627)) vivent dans les cours d’eau et sur les berges de Guyane. La première, de grande taille (jusqu’au 1,80 m de long), vit en groupes familiaux tandis que la seconde, plus petite, est souvent solitaire. \nConsommatrices de poissons et très sensibles à la dégradation des habitats, les loutres peuvent être considérées comme des indicatrices de la qualité des écosystèmes aquatiques. La Loutre géante a fait l’objet d’une chasse intensive pour sa peau au siècle dernier, ce qui l’a conduite au bord de l’extinction au début des années 1970. Les deux espèces sont intégralement protégées mais leur habitat est fortement impacté par l’orpaillage. \n\nStatut sur la Liste rouge des mammifères de Guyane :\nLoutre géante : en danger. \nLoutre commune : préoccupation mineure. \n	\N	\N	\N	f
68554	1038	TEXT	zoom.callToAction	Cliquez sur la carte thématique pour vous repérer en un coup d'œil ! 	\N	\N	\N	f
68555	1038	TEXT	ecosystems.ecosystems.0.name	La forêt humide	\N	\N	\N	f
68920	1030	TEXT	paragraphs.0.text	**Editeur**\nMuséum national d'Histoire naturelle\nUMS Patrimoine Naturel \nCP41, 36 rue Geoffroy saint-Hilaire\n75005 Paris\n\n**Conception et hébergement**\nAgence Ninja Squad\nwww.ninja-squad.fr\n\nJean-Baptiste Giffard\nwww.digitaldesigner.cool\n\nSite hébergé par le Muséum national d’Histoire naturelle\n\n**Création graphique**\nDesign graphique réalisé par : \nAmélie Bracq\nEdouard Sastre\n\n**Création et mise à jour du contenu**\nLe contenu éditorial du site est produit et mis à jour par PatriNat (OFB - CNRS - MNHN).	\N	\N	\N	f
68210	1041	TEXT	species.1.description	Avec une envergure pouvant atteindre 3,7 m, l’Albatros hurleur ([*Diomedea exulans*](https://inpn.mnhn.fr/espece/cd_nom/988)) est le plus grand oiseau au monde. Ses longues ailes rendent son envol un peu difficile mais elles lui permettent de planer sans effort sur de grandes distances. Il ne revient sur terre qu’une fois tous les 2 ans pour la saison de reproduction. L’Albatros d’Amsterdam ([*Diomedea amsterdamensis*](https://inpn.mnhn.fr/espece/cd_nom/669383)) est endémique strict de l’île Amsterdam et se reproduit uniquement sur un haut plateau de l’île, le Plateau des Tourbières. La petite taille de sa population, estimée à 210-220 individus, en fait une des espèces d’oiseaux les plus rares au monde, en danger critique d’extinction. Un plan national d’actions vise à sa préservation, sur terre comme en mer. Les 2/3 de la population mondiale d’Albatros à bec jaune ([*Thalassarche carteri*](https://inpn.mnhn.fr/espece/cd_nom/713021)) se reproduisent dans les Terres australes françaises. Sur la seule île Amsterdam, on trouve la plus grande colonie au monde concentrée sur les falaises d’Entrecasteaux, qui représente 60 % de la population mondiale.\nD’autres espèces d’albatros nichent dans les terres australes, comme l’Albatros à sourcils noirs ([*Thalassarche melanophris*](https://inpn.mnhn.fr/espece/cd_nom/442424)) ou l’Albatros fuligineux ([*Phoebetria fusca*](https://inpn.mnhn.fr/espece/cd_nom/442214)).  \n\nStatut sur la Liste rouge des oiseaux des TAAF : \nAlbatros hurleur : en danger critique. \nAlbatros d’Amsterdam : en danger critique.\nAlbatros à bec jaune : en danger.\n	\N	\N	\N	f
66600	1039	TEXT	events.10.description	Création de la Réserve naturelle nationale des forêts de Mayotte	\N	\N	\N	f
66601	1039	TEXT	interests.locations.0.description	Situé dans le lagon à l’est de Grande Terre, l’îlot Mbouzi est classé en Réserve naturelle nationale depuis 2007 afin de préserver sa relique de forêt sèche primaire, qui abrite des plantes remarquables et protégées dont le rare Ebène de Bernier ([*Diospyros bernieriana*](https://inpn.mnhn.fr/espece/cd_nom/967608)). On y trouve également la sous-espèce du Foudi des Comores endémique de Mayotte ([*Foudia eminentissima algondae*](https://inpn.mnhn.fr/espece/cd_nom/418756)). La réserve comprend une partie marine de 60 hectares qui abrite des communautés coralliennes remarquables. Elle est gérée par l’association les [Naturalistes de Mayotte](https://www.naturalistesmayotte.fr/).	\N	\N	\N	f
68211	1041	TEXT	species.2.description	Les Gorfous dorés ([*Eudyptes chrysolophus*](https://inpn.mnhn.fr/espece/cd_nom/441903)), aussi appelés Gorfous macaronis, sont de petits manchots reconnaissables à la touffe de plumes jaunes de chaque côté de leur tête, appelée « aigrette ». Contrairement aux manchots royaux qui nichent sur les plages, ils nichent dans les espaces rocheux difficiles d’accès, en compagnie des Gorfous sauteurs ([*Eudyptes chrysocome*](https://inpn.mnhn.fr/espece/cd_nom/441902)), plus petits et possédant un bec plus court.  \n  \nStatut sur la Liste rouge des oiseaux des TAAF :\nGorfous dorés : préoccupation mineure.\nGorfous sauteurs : données insuffisantes.\n	\N	\N	\N	f
69221	1015	TEXT	ecosystems.ecosystems.4.description	Des communautés coralliennes se développent sur tous les petits fonds de l’île mais elles ne forment de véritables récifs que sur la côte atlantique de l’île et dans la baie de Fort de France. 40 espèces coralliennes sont recensées dans les eaux de l’île, cependant, une importante partie des colonies sont considérées comme dégradées.	\N	\N	\N	f
69222	1015	TEXT	ecosystems.ecosystems.4.name	Les récifs coralliens	\N	\N	\N	f
66602	1039	TEXT	risks.risks.2.description	Les inventaires naturalistes de la flore de Mayotte sont récents, le territoire n’ayant fait l’objet que de quelques prospections ponctuelles jusqu’au début des années 1990. Les travaux se sont intensifiés par la suite, avec notamment l’étendue de l’agrément du Conservatoire botanique national de Mascarin à Mayotte en 2007 et l’ouverture de l’antenne de Coconi en 2009. \n\nLa flore indigène mahoraise présente des affinités avec la flore malgache, les vents, les courants marins et les oiseaux ayant permis un lien avec Madagascar, situé à environ 350 km de Mayotte, cependant près d’une cinquantaine d’espèces végétales sont endémiques strictes de Mayotte.  \n\nSelon la Liste rouge de la flore vasculaire publiée en 2014, 43 % des espèces végétales de Mayotte sont considérées menacées. Afin de préserver les reliques de forêts primaires et restaurer les forêts secondaires limitrophes, la Réserve naturelle nationale des forêts de Mayotte a été créée en 2021. Divisée en 6 zones distinctes, elle s’étend sur 2 800 hectares, soit 8 % de la superficie de l’île. Les activités humaines y sont règlementées.\n	\N	\N	\N	f
66603	1039	TEXT	risks.risks.1.description	Depuis 1998, l’Observatoire des Récifs Coralliens de Mayotte (ORC) étudie l’évolution de l’état de santé des récifs. Les [menaces qui pèsent sur les récifs coralliens sont nombreuses](https://biodiversite-outre-mer.fr/indicateurs/recifs-coralliens) et les suivis réalisés dans les eaux mahoraises montrent une dégradation sur près de la moitié (43 %) des stations étudiées entre 2015 et 2020.  \n\nLes récifs coralliens sont particulièrement sensibles aux modifications entrainées par le changement climatique (réchauffement et acidification des océans) qui entrainent des épisodes de blanchissement de plus en plus intenses et fréquents. Le dernier épisode de blanchissement à Mayotte, en 2016, a induit une mortalité d’environ 25 % des coraux.  \n\nLes coraux sont également dégradés par les rejets des eaux usées non traitées dans les rivières et le lagon, les apports terrigènes liés à l’érosion et les déchets, notamment les plastiques. Dans une moindre mesure, certaines pratiques de pêche (marche sur le platier à marée basse lors de la pêche à pied), les ancrages des bateaux ou les palmes des plongeurs ont des impacts localisés. Les coraux du genre *Porites* sont également prélevés pour la fabrication du *msindzano*, le masque de beauté traditionnel.\n	\N	\N	\N	f
66604	1039	TEXT	interests.locations.2.description	Au sud de Grande Terre, le Mont Choungui, second plus haut sommet de Mayotte, culmine à 593 m. Il présente une végétation très différente de celle trouvée sur les autres massifs montagneux de Mayotte, le mont Bénara ou le M’Sapéré, une originalité liée aux conditions particulières de relief, de vent et de pluviométrie sur ce mont isolé. Certaines espèces végétales indigènes ne se trouvent à Mayotte que sur ce site et plusieurs espèces endémiques y ont été découvertes, comme l'arbuste [*Eugenia chounguiensis*](https://inpn.mnhn.fr/espece/cd_nom/852782) décrit en 2016. 	\N	\N	\N	f
66998	1044	TEXT	body.bodyElements.4.questionAnswer.response	En Guyane c’est assez différent de la métropole. Nous n’avons pas la culture de la cueillette. **Il faut dire qu’hormis la chanterelle de Guyane il y a très peu de champignons destinés à l’alimentation**, ceux que nous mangeons proviennent de Chine ou d’Europe. **Les élèves découvrent généralement que les moisissures, omniprésentes ici en raison de la forte humidité, en font partie.** Quant aux fourmis, si elles accompagnent tout le monde au quotidien jusque dans les foyers, les connaissances varient fortement selon les écoles. A Camopi, village amérindien, les élèves se montrent beaucoup plus à l’aise. Les fourmis occupent une place importante dans leur culture. On utilise par exemple quelques grosses espèces comme les «&nbsp;balles de fusils&nbsp;» pour la vannerie, le tressage des feuilles. Lors du rituel du passage à l’âge adulte, le Maraké, on en dispose sur le corps du jeune qui doit résister aux piqûres. Ces enfants partent avec moins d’appréhension. Cela ne veut pas dire que les autres n’accrochent pas. La grande majorité des élèves finit par se prendre au jeu. La «&nbsp;chasse au fourmis&nbsp;» avec les enseignants provoquent une véritable excitation. Ils s’éclatent. Un élève a réussi à trouver une fourmi zombie dans la cour de l’école, on avait l’impression qu’il découvrait un trésor&nbsp;! Ce qui, vu sa rareté, en était un petit. Les fourmis tac-tac sont plus fréquentes, et font de la même manière l’objet d’une fascination partout où je me rends.	\N	\N	\N	f
66999	1044	IMAGE	body.bodyElements.3.image.imageElement	\N	2238	Intervention auprès des CM2 de l'école Augustine Duchange (Roura) © Marilou Hircq	\N	f
67000	1044	IMAGE	presentation.image	\N	2239	Classe de CM2 de l'école Augustine Duchange (Roura) en pleine chasse aux fourmis © Marilou Hircq	\N	f
67001	1044	TEXT	presentation.author	Hugo Struna	\N	\N	\N	f
67002	1044	TEXT	body.bodyElements.7.questionAnswer.question	Quel est l’avenir de ces données ? Que pourront nous apprendre tous ces prélèvements ?	\N	\N	\N	f
67003	1044	TEXT	presentation.date	09/11/2021	\N	\N	\N	f
67004	1044	IMAGE	interviewee.photo	\N	2237	Marilou Hircq	\N	f
67005	1044	TEXT	body.introduction	En Guyane, on ne s’intéresse pas qu’aux caïmans et aux jaguars ! Le projet BUG (Biodiversité Urbaine de Guyane) mobilise des centaines d’élèves depuis janvier pour inventorier les fourmis et les champignons. A l’école et chez eux.  \n  \nMarilou Hircq, ingénieure au CNRS, coordonne ce projet de sciences participatives unique dans cette région d’Outre-mer.	\N	\N	\N	f
70207	1049	TEXT	body.photos.2.description	« Construite en blocs de corail taillé, la maison Paturau est l’un des vestiges de l’occupation éphémère de l’île Juan de Nova pour l’exploitation du guano et de la roche phosphatée au cours du 20<sup>e</sup> siècle. C’est en réalité Edouard Lanier, prédécesseur d’Hector Paturau à la propriété de la concession, qui la fit construire. Sur une pierre de soubassement, l’inscription latine *Labor improbus omnia vincit* datée du 29 juillet 1911 promet qu’«&nbsp;un travail acharné vient à bout de tout&nbsp;». Cette belle demeure n’était cependant pas destinée aux ouvriers, qui vivaient dans des conditions difficiles. »	\N	\N	\N	f
68212	1041	TEXT	species.9.description	La mouche [*Anatalanta aptera*](https://inpn.mnhn.fr/espece/cd_nom/782785), endémique de la région subantarctique, a une étrange particularité : elle n’a pas d’ailes ! Ce caractère morphologique est une adaptation aux conditions climatiques rigoureuses des Terres australes françaises et leurs vents forts et constants, ainsi qu’à l’absence de prédateurs natifs.  \n\nStatut sur la Liste rouge mondiale : non évalué.\n	\N	\N	\N	f
68213	1041	TEXT	events.0.description	Émergence de l’archipel Kerguelen 	\N	\N	\N	f
68214	1041	TEXT	events.1.description	Émergence de l’archipel Crozet	\N	\N	\N	f
68215	1041	TEXT	events.8.description	Classement des Terres et mers australes au Patrimoine mondial de l’UNESCO	\N	\N	\N	f
64753	1020	TEXT	ecosystems.ecosystems.6.description	Forêts sous-marines, ces formations d’algues brunes où dominent les sargasses colonisent les dalles rocheuses du fond des lagons et forment une canopée d’une hauteur de plus d’un mètre sous la surface de l’eau. \nVéritables oasis, ces algueraies jouent un rôle essentiel pour le cycle biologique de différentes espèces animales, de micro et macroalgues. \nEncore mal connues, ces zones de transition écologique entre les zones littorales et récifales représentent un enjeu important pour le fonctionnement des récifs et lagons.\n	\N	\N	\N	f
64754	1020	IMAGE	ecosystems.ecosystems.5.image	\N	2466	Herbier de phanérogames © Claude Payri	\N	f
64755	1020	IMAGE	species.1.image	\N	2442	*Rhynochetos jubatus* © Olivier Gargominy / INPN	\N	f
64756	1020	TEXT	species.10.description	Sur les quatre espèces de roussettes (chauves-souris frugivores et nectarivores) présentes en Nouvelle-Calédonie, trois en sont endémiques. La Roussette rousse ([*Pteropus ornatus*](https://www.endemia.nc/faune/fiche1328)) et celle du Pacifique ([*P. tonganus*](https://www.endemia.nc/faune/fiche1329)) sont des espèces-gibiers très prisées, dont la chasse est réglementée. Elles constituent aussi les proies des chats harets. \nLe déclin actuel de ces espèces emblématiques pourrait également engendrer la perte des aspects culturels et des services écosystémiques associés, comme la dissémination des graines et la pollinisation. \n  \nStatuts dans la Liste rouge mondiale :\n*Pteropus ornatus* (endémique) : vulnérable\n*Pteropus tonganus* : préoccupation mineure\n*Pteropus vetulus* (endémique): quasi-menacé\n*Notopteris neocaledonica* (endémique) : en danger.	\N	\N	\N	f
64757	1020	TEXT	events.5.date	2011	\N	\N	\N	f
64758	1020	TEXT	identity.marineArea	1,4 million	\N	\N	\N	f
64759	1020	TEXT	species.9.name	*Syzygium acre*	\N	\N	\N	f
64760	1020	TEXT	events.8.date	2016-2019	\N	\N	\N	f
64761	1020	IMAGE	interests.locations.0.image	\N	2440	Parc naturel de la Mer de Corail © Anne Littaye / OFB	\N	f
64762	1020	TEXT	species.6.name	Le Gecko géant	\N	\N	\N	f
64763	1020	IMAGE	interests.locations.3.image	\N	2448	Réserve du Mont Panié © Christine Fort	\N	f
64764	1020	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
64765	1020	TEXT	species.14.name	Les Nautiles	\N	\N	\N	f
64766	1020	TEXT	interests.locations.3.name	La réserve de nature sauvage du Mont Panié	\N	\N	\N	f
64767	1020	TEXT	species.15.name	Le notou	\N	\N	\N	f
64768	1020	TEXT	statistics.1.text	Plus grande barrière de corail au monde (1 600 km)	\N	\N	\N	f
64769	1020	TEXT	events.9.date	2019	\N	\N	\N	f
64770	1020	IMAGE	species.4.image	\N	2446	*Amborella trichopoda* © Vanessa Hequet	\N	f
64771	1020	IMAGE	species.12.image	\N	2458	*Caretta caretta* © Bwara	\N	f
64772	1020	TEXT	events.3.date	2008	\N	\N	\N	f
64773	1020	IMAGE	ecosystems.ecosystems.3.image	\N	2457	Forêt sèche © CEN Nouvelle-Calédonie	\N	f
64774	1020	IMAGE	species.3.image	\N	2445	*Laticauda sp.* © Hélène Udo	\N	f
64775	1020	IMAGE	zoom.map	\N	2439	Carte Nouvelle-Calédonie	\N	f
64776	1020	TEXT	species.1.name	Le Cagou	\N	\N	\N	f
64777	1020	TEXT	species.7.name	La Sterne néreis	\N	\N	\N	f
64778	1020	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
64779	1020	TEXT	species.16.description	Le Corbeau calédonien ([*Corvus moneduloides*](https://www.endemia.nc/faune/fiche159)) est un oiseau commun, endémique, familier des forêts mais fréquentant également les milieux plus ouverts. Il est surtout réputé pour son intelligence, puisqu’il est capable de fabriquer et d’utiliser des outils, notamment pour attraper ses proies dans la cavité des arbres.  \n\nStatut dans la Liste rouge mondiale : préoccupation mineure. \n	\N	\N	\N	f
64780	1020	TEXT	species.4.name	*Amborella trichopoda*	\N	\N	\N	f
64781	1020	TEXT	identity.area	16 624	\N	\N	\N	f
64782	1020	TEXT	species.0.description	[*Sphaeropteris intermedia*](https://www.endemia.nc/flore/fiche106) est une espèce de fougère arborescente endémique parmi les plus grandes au monde, elle peut atteindre 35 mètres de haut. Commune sur le territoire, cette plante est utilisée en médecine traditionnelle et son tronc très solide est également utilisé pour la sculpture ou la confection de sagaies.\n\nStatut dans la Liste rouge mondiale : Préoccupation mineure.  \nNom en langues kanak : Groubaï (drubéa).\n	\N	\N	\N	f
64783	1020	TEXT	identity.highestPointName	Mont Panié	\N	\N	\N	f
64784	1020	TEXT	ecosystems.ecosystems.2.name	Les maquis miniers	\N	\N	\N	f
64785	1020	TEXT	ecosystems.ecosystems.5.name	Les herbiers de phanérogames marines	\N	\N	\N	f
64786	1020	TEXT	species.7.description	Ce petit oiseau marin présente un dos gris, un ventre blanc, une tête pourvue d'une calotte noire et un bec droit et pointu. Une sous-espèce de la Sterne néreis, ([*Sternula nereis exul*](https://www.endemia.nc/faune/fiche52)) niche sur les îlots de Nouvelle-Calédonie, notamment dans le Lagon Sud, vers Koumac et aux îles Chesterfield. Cette sous-espèce est très menacée localement du fait de ses faibles effectifs de populations.  \n  \nStatut dans la Liste rouge mondiale : non évalué. 	\N	\N	\N	f
64787	1020	TEXT	species.8.description	Le Niaouli ([*Melaleuca quinquenervia*](https://www.endemia.nc/flore/fiche445)), est un arbre utilisé en médecine et pour la construction, que l’on retrouve dans les milieux ouverts et anthropisés. Il se développe particulièrement bien dans les zones touchées par les incendies en raison de ses propriétés ignifuges. Indigène en Nouvelle-Calédonie, cette espèce a été introduite dans d’autres territoires comme la Guyane où elle présente un profil envahissant.\n\nStatut dans la Liste rouge mondiale : préoccupation mineure.  \nNoms en langues kanak : itachou (paicî), pichöö (xârâcùù), bé (drubéa).	\N	\N	\N	f
64788	1020	IMAGE	species.13.image	\N	2453	*Neogymnochrinus richeri* © Pierre Lozouet / IRD	\N	f
64789	1020	IMAGE	species.2.image	\N	2451	*Dugong dugong* © Hélène Udo	\N	f
64790	1020	TEXT	species.11.name	La Baleine à bosse	\N	\N	\N	f
64791	1020	IMAGE	ecosystems.ecosystems.4.image	\N	2464	 Mangrove © Christine Fort	\N	f
64792	1020	TEXT	species.3.description	Sur les huit espèces de Tricots rayés ([*Laticauda sp.*](https://www.endemia.nc/faune/fiche1104)) connues au niveau mondial, deux sont présentes en Nouvelle-Calédonie dont une endémique. Largement répandus sur le territoire, ces serpents marins se nourrissent dans l’eau mais reviennent sur terre pour se reposer, digérer et pondre. Bien que porteurs d'un venin mortel, ils ne sont pas agressifs et au contraire plutôt craintifs. De fait, les morsures sont très rares.\n\nStatut dans la Liste rouge mondiale pour les deux espèces présentes en Nouvelle-Calédonie : préoccupation mineure. 	\N	\N	\N	f
64793	1020	TEXT	species.1.description	Emblème de la Nouvelle-Calédonie, le Cagou ([*Rhynochetos jubatus*](https://www.endemia.nc/faune/fiche144)), est un oiseau endémique qui ne vole pas mais court très vite, et dont le cri ressemble à l’aboiement d’un chien. Il vit dans les forêts humides de moyenne et haute altitude. Cette espèce est intégralement protégée.\n\nStatut dans la Liste rouge mondiale : en danger.	\N	\N	\N	f
64794	1020	TEXT	species.2.description	Le Dugong ([*Dugong dugong*](https://www.endemia.nc/faune/fiche5263)), aussi appelé « vache marine » est un mammifère marin herbivore qui passe la majeure partie de son temps à brouter les herbiers marins. Longtemps chassé et braconné, il est également vulnérable face à la dégradation des habitats marins et aux activités humaines. La population néo-calédonienne de dugongs est estimée à environ 700 individus. Un [plan d'action pour sa conservation](https://www.cen.nc/plan-actions-dugong) a été mis en place en 2010. Il est animé depuis 2017 par le Conservatoire d'espaces naturels de Nouvelle-Calédonie. \n\nStatut dans la Liste rouge mondiale : vulnérable. 	\N	\N	\N	f
68921	1004	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
64795	1020	TEXT	species.9.description	[*Syzygium acre*](https://www.endemia.nc/flore/fiche1027) est un arbre cauliflore principalement observé dans le sud de la Grande Terre. Ses feuilles de très grande taille – parfois plus d’un mètre de long – sont rouge à mauve lorsqu’elles sont juvéniles. Sa floraison est caractéristique : les fleurs, d’une coloration rouge à rose, se trouvent par petits groupes directement le long du tronc.\n\nStatut dans la Liste rouge mondiale : en danger. 	\N	\N	\N	f
64796	1020	TEXT	statistics.1.number	2e	\N	\N	\N	f
64797	1020	TEXT	species.12.name	Les Tortues marines	\N	\N	\N	f
64798	1020	TEXT	statistics.0.number	76%	\N	\N	\N	f
64799	1020	TEXT	statistics.2.number	plus de 400 	\N	\N	\N	f
64800	1020	IMAGE	interests.locations.4.image	\N	2452	Parc provincial de la Côte oubliée © Martial Dosdane	\N	f
64801	1020	TEXT	species.2.name	Le Dugong	\N	\N	\N	f
64802	1020	TEXT	risks.risks.1.name	Une règlementation environnementale plurielle	\N	\N	\N	f
64803	1020	TEXT	species.4.description	Arbuste des forêts humides, [*Amborella trichopoda*](https://www.endemia.nc/flore/fiche254) est un taxon relique, considéré comme la plus ancienne des plantes à fleurs, son origine étant évaluée à 135 millions d’années avant notre ère. Elle est endémique de Nouvelle-Calédonie.\n\nStatut dans la Liste rouge mondiale : Préoccupation mineure. 	\N	\N	\N	f
64804	1020	TEXT	zoom.callToAction	Cliquez sur la carte thématique pour vous repérer en un coup d'œil ! 	\N	\N	\N	f
64805	1020	TEXT	ecosystems.ecosystems.0.name	Les forêts denses humides	\N	\N	\N	f
64806	1020	TEXT	species.5.description	Les Kaoris, sont des arbres de grande taille, dont le tronc peut atteindre un diamètre impressionnant. On peut ainsi observer un spécimen au tronc de 2,70 m de diamètre dans le parc de la Rivière Bleu.  \nLa répartition du Kaori du mont Panié ([*Agathis montana*](https://www.endemia.nc/flore/fiche55)) est restreinte à la forêt de nuage du massif du même nom, tandis que le Kaori de forêt ([*Agathis lanceolata*](https://www.endemia.nc/flore/fiche57)) s'observe du sud de la Grande Terre jusqu'à Poya, voir Touho en Province Nord. Une troisième espèce ([*Agathis ovata*](https://www.endemia.nc/flore/fiche56)) est cantonnée à la moitié Sud de la Grande Terre. \n\nStatut dans la Liste rouge mondiale pour *Agathis montana* : en danger critique ; pour *Agathis lanceolata* : vulnérable.  \nNoms en langues kanak : Kaori du Mt Panié : Dayu Biik (nemi) ; Kaori de forêt : mugé (xârâcùù).	\N	\N	\N	f
64807	1020	TEXT	species.6.description	Le Gecko géant de Nouvelle-Calédonie ([*Rhacodactylus leachianus*](https://www.endemia.nc/faune/fiche1024)) est le plus grand gecko au monde. D’un aspect massif, avec une queue courte et une peau plissée grise à brune, il peut atteindre 25,5 cm de long. Nocturne et arboricole, on le rencontre dans les forêts humides, et en densité plus importante sur les îlots non envahis par les chats. Il est encore régulièrement braconné pour le marché de la terrariophilie.\n\nStatut dans la Liste rouge mondiale : préoccupation mineure. 	\N	\N	\N	f
64808	1020	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
64809	1020	TEXT	events.0.date	Entre -100 et -55 millions d’années	\N	\N	\N	f
64810	1020	TEXT	identity.populationYear	2017	\N	\N	\N	f
64811	1020	IMAGE	species.5.image	\N	2468	*Agathis sp.* © Vanessa Hequet	\N	f
64812	1020	TEXT	statistics.0.text	de la flore est endémique	\N	\N	\N	f
68556	1038	TEXT	species.5.description	Les plages de Guyane comptent parmi les plus importants sites de ponte de tortues marines au monde. Elles accueillent principalement trois espèces : la Tortue verte ([*Chelonia mydas*](https://inpn.mnhn.fr/espece/cd_nom/77338)), la Tortue olivâtre ([*Lepidochelys olivacea*]) et la Tortue luth ([*Dermochelys coriacea*](https://inpn.mnhn.fr/espece/cd_nom/77367)). \nLa Tortue luth est la plus grosse espèce de tortue marine au monde, avec un poids moyen de 450 kg pour une taille de près d’1,60 mètre et elle se nourrit essentiellement de méduses. Contrairement aux autres tortues marines, elle ne possède pas d’écailles mais une dossière en cuir très épais, qui lui permet de plonger plus profondément que les autres espèces. Grandes migratrices, les tortues luths remontent jusqu’au nord de l’Atlantique. \nDe nombreuses menaces pèsent sur les tortues marines : braconnage, prises accidentelles dans les filets de pêche, prédation par des chiens errants, collisions avec des bateaux. En Guyane, il semble que les pontes de Tortue luth se raréfient ces dernières années. L’Office français de la biodiversité anime le plan national d’action Tortues marine en Guyane et coordonne l’ensemble des acteurs liés à leur protection. \n\nStatut sur la Liste rouge des reptiles de Guyane française : en danger\n	\N	\N	\N	f
69223	1015	TEXT	statistics.3.text	hectares de mangroves sur le territoire	\N	\N	\N	f
69224	1015	TEXT	events.10.date	2020	\N	\N	\N	f
69225	1015	IMAGE	species.1.image	\N	2289	*Iguana delicatissima* © Patrick Haffner - INPN	\N	f
69226	1015	TEXT	events.5.date	2010	\N	\N	\N	f
69227	1015	TEXT	identity.marineArea	45 000	\N	\N	\N	f
66605	1039	TEXT	interests.locations.1.description	Créé en janvier 2010, le [Parc naturel marin de Mayotte](https://www.parc-marin-mayotte.fr/) englobe le lagon et l’ensemble de la zone économique exclusive (ZEE), soit près de 70 000 kms<sup>2</sup>. Il est géré par l’Office français de la biodiversité. L'objectif du Parc est de concilier la préservation de la biodiversité marine et le développement durable des activités maritimes à Mayotte. Parmi leurs activités, les agents du parc veillent à faire respecter les règlementations de pêche, sensibiliser la population et les élus et réaliser des études et des suivis pour mieux connaitre le milieu marin. 	\N	\N	\N	f
69228	1015	TEXT	events.8.date	2016	\N	\N	\N	f
64813	1020	TEXT	ecosystems.ecosystems.1.name	Les récifs coralliens et les lagons	\N	\N	\N	f
64814	1020	TEXT	events.2.date	1940 	\N	\N	\N	f
64815	1020	TEXT	identity.presentation	La Nouvelle-Calédonie se caractérise par le taux d'endémisme particulièrement élevé de sa flore (76 % d'espèces endémiques) et de sa faune terrestre, ainsi que l'existence d'écosystèmes terrestres remarquables : forêt humide, maquis minier, zones humides... La biodiversité marine est également d'une richesse exceptionnelle avec plus de 20 000 espèces recensées, dont plus de 400 espèces de coraux, plus de 2 000 espèces de poissons et 30 espèces de mammifères marins. L'archipel abrite la seconde plus grande barrière récifale au monde, longue de 1 600 km et quasi-continue.  \nCette richesse est reconnue au niveau international par l'inscription des lagons de Nouvelle-Calédonie au Patrimoine mondial de l'UNESCO ou encore des lacs du Grand Sud sur la liste Ramsar. 	\N	\N	\N	f
64816	1020	TEXT	identity.population	271 407	\N	\N	\N	f
64817	1020	TEXT	species.3.name	Les Tricots rayés	\N	\N	\N	f
64818	1020	IMAGE	species.8.image	\N	2447	*Melaleuca quinquenervia* © Christine Fort	\N	f
64819	1020	TEXT	species.0.name	*Sphaeropteris intermedia*	\N	\N	\N	f
64820	1020	TEXT	events.4.date	2008-2009	\N	\N	\N	f
64821	1020	IMAGE	interests.locations.2.image	\N	2449	Chutes de la Madeleine, Nouvelle-Calédonie © Hélène Udo	\N	f
64822	1020	IMAGE	ecosystems.ecosystems.2.image	\N	2467	Maquis minier © Vanessa Hequet	\N	f
69229	1015	IMAGE	interests.locations.0.image	\N	2296	Presqu’île de la Caravelle © PNR de la Martinique - AERODREAM	\N	f
69230	1015	TEXT	species.6.name	Le Trigonocéphale	\N	\N	\N	f
69231	1015	IMAGE	interests.locations.3.image	\N	2295	Réserve des îlets de Sainte Anne © PNR de la Martinique - Géo-graphique	\N	f
69232	1015	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
64823	1020	IMAGE	species.11.image	\N	2460	*Megaptera novaeangliae* © Claire Garrigue - Opération Cétacé	\N	f
64824	1020	IMAGE	species.15.image	\N	2471	*Ducula goliath* © Christine Fort	\N	f
69233	1015	TEXT	interests.locations.3.name	Les îlets de Sainte Anne	\N	\N	\N	f
69234	1015	TEXT	statistics.1.text	espèces de coraux recensées dans les eaux de l'île	\N	\N	\N	f
69235	1015	TEXT	events.9.date	2017	\N	\N	\N	f
69236	1015	IMAGE	species.4.image	\N	2299	*Aechmea reclinata* © Cesar Delnatte - Observatoire martiniquais de la biodiversité 	\N	f
69237	1015	TEXT	events.3.date	1976	\N	\N	\N	f
69238	1015	IMAGE	ecosystems.ecosystems.3.image	\N	2306	Herbier et poisson, Martinique © Fabien Lefebvre - Association ACWAA	\N	f
69239	1015	IMAGE	species.3.image	\N	2297	*Chelonia mydas* © Fabien Lefebvre - Association ACWAA	\N	f
69240	1015	IMAGE	zoom.map	\N	2472	Carte Martinique	\N	f
69241	1015	TEXT	species.1.name	L'Iguane des Petites Antilles	\N	\N	\N	f
69242	1015	TEXT	species.7.name	Le Moqueur gorge-blanche	\N	\N	\N	f
69243	1015	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
69244	1015	TEXT	species.4.name	L'Ananas bois	\N	\N	\N	f
69245	1015	TEXT	identity.area	1 128	\N	\N	\N	f
64825	1020	TEXT	interests.locations.0.description	Créé en 2014, dans le but de « *de protéger la biodiversité exceptionnelle de l’espace maritime de Nouvelle-Calédonie, tout en permettant un développement économique responsable et durable* », le [Parc naturel de la mer de Corail](https://mer-de-corail.gouv.nc/) couvre 1,3 millions de km<sup>2</sup>, soit l’ensemble de la zone économique exclusive de la Nouvelle-Calédonie. Elle intègre les récifs d’Entrecasteaux, remarquables par les importantes populations de tortues vertes et d’oiseaux marins qui s’y reproduisent en grand nombre.	\N	\N	\N	f
64826	1020	IMAGE	ecosystems.ecosystems.6.image	\N	2465	Sargasses © G. Geoffray / IRD	\N	f
64827	1020	TEXT	risks.risks.1.description	Une même thématique relève le plus souvent de compétences « croisées » entre divers acteurs institutionnels. Chaque Province réglemente, contrôle et veille à la bonne application des réglementations environnementales mises en œuvre localement, sur son propre domaine géographique. Chacune dispose de son propre Code de l’environnement.  \nLe gouvernement de la Nouvelle-Calédonie réglemente et exerce quant à lui un droit d'exploration, d’exploitation, de gestion et de conservation des ressources naturelles, biologiques et non biologiques sur l’ensemble de la zone économique exclusive.  \nPar ailleurs, toutes les questions relatives à l’environnement ne peuvent s’envisager sans y intégrer une dimension coutumière et culturelle composante spécifique forte du territoire. \n\nToutes ces réglementations sont évolutives et régulièrement mises à jour et complétées, avec une volonté de cohérence à souligner entre les différents acteurs impliqués.  \nDans ce cadre, et au-delà des actions menées directement par les gestionnaires, d’autres acteurs publics et privés interviennent activement sur le terrain avec pour objectif la préservation de l’environnement (instituts de recherche, chambres consulaires, agences, GIP, associations, ONG).	\N	\N	\N	f
64828	1020	TEXT	interests.locations.2.description	Cette région de 43 970 ha, [inscrite sur la Convention de Ramsar](https://www.province-sud.nc/information/lacs-grand-sud-inscrits-convention-ramsar) depuis 2014, se compose de forêts humides, de maquis miniers, de marais arbustifs et de rivières, ruisseaux et lacs intermittents et permanents, notamment le lac de Yaté. Elle abrite des espèces qui ne vivent nulle part ailleurs. Considérée comme le plus grand réservoir d’eau douce de Nouvelle-Calédonie, cette région repose sur un réseau d’eau souterrain original et complexe, unique au monde.	\N	\N	\N	f
64829	1020	TEXT	interests.locations.1.description	Depuis juillet 2008, les lagons de Nouvelle-Calédonie sont inscrits sur la [Liste du patrimoine mondial de l’UNESCO](https://whc.unesco.org/fr/list/1115/) en raison de leur diversité exceptionnelle et de leur bon état de conservation. Ce bien "en série", c'est à dire composé de six zones géographiques distinctes a été le premier site ultra-marin à être reconnu comme tel. 	\N	\N	\N	f
64830	1020	TEXT	ecosystems.ecosystems.3.name	Les forêts sèches	\N	\N	\N	f
64831	1020	TEXT	identity.subtitle	Un endémisme terrestre remarquable et une diversité marine exceptionnelle	\N	\N	\N	f
64832	1020	IMAGE	species.7.image	\N	2454	*Sternula nereis* © Nathalie Baillon	\N	f
64833	1020	TEXT	species.5.name	Les Kaoris	\N	\N	\N	f
64834	1020	TEXT	risks.risks.0.description	La Nouvelle-Calédonie présente une flore et une faune remarquables, avec des taux d'endémismes très élevés. Trois principales menaces pèsent sur cette biodiversité : les incendies de forêts, les activités minières et les espèces exotiques envahissantes. S'y ajoutent d'autres menaces anthropiques liées à l'aménagement du territoires ou encore les pollutions. \n\nForte de 25 à 30 % des réserves mondiales de nickel, la Nouvelle-Calédonie a comme principale activité économique l'exploitation de ces ressources. Cette exploitation est cependant à l’origine d’impacts notables sur la biodiversité terrestre et marine (érosion, sur-sédimentation…). La réhabilitation des zones exploitées est également un enjeu important.  \n\nLes [incendies de forêt](https://www.oeil.nc/fr/causes/les-incendies) sont particulièrement dévastateurs sur le territoire. Les épisodes sont fréquents et les moyens de lutte limités au regard des enjeux environnementaux. Plusieurs dizaines de milliers d’hectares sont brûlés chaque année. Outre la destruction de la flore, les incendies favorisent la colonisation d’espèces exotiques envahissantes, dégradent la ressource en eau et menacent également les populations humaines.  \n\nLes espèces exotiques envahissantes impactent fortement tous les écosystèmes. Plus de 2 000 espèces végétales, plus de 500 invertébrés et une quarantaine de vertébrés ont ainsi été introduits sur le territoire (dont [36 des 100 espèces considérées comme parmi les plus envahissantes au monde](/indicateurs/especes-exotiques-envahissantes)). Une [stratégie de lutte pays](https://www.cen.nc/lutte-contre-les-eee-en-nouvelle-caledonie) contre les espèces exotiques envahissantes dans les espaces naturels de Nouvelle-Calédonie est en place depuis 2016.  \n\nA une toute autre échelle, l’impact des changements climatiques sur les écosystèmes calédoniens soulève également de nombreuses questions.\n\n	\N	\N	\N	f
64835	1020	TEXT	ecosystems.ecosystems.2.description	Occupant un peu moins du quart de la surface du territoire, les maquis miniers présentent une végétation très particulière du fait de la richesse du sol en minerais (fer, magnésium, nickel) et de sa pauvreté en éléments nutritifs.  \nLa richesse floristique exceptionnelle qu'ils abritent (1 170 espèces à 89 % endémiques) peut être menacée par le développement de projets miniers et par les incendies. La faune locale, adaptée aux conditions de vie difficiles de ce milieu sec et rocailleux, compte principalement des insectes et des reptiles.	\N	\N	\N	f
64836	1020	TEXT	species.10.name	Les Roussettes	\N	\N	\N	f
64837	1020	TEXT	ecosystems.ecosystems.1.description	La Nouvelle-Calédonie possède la 2ème plus grande barrière de corail du monde, longue de 1 600 km et quasi-continue. D'une superficie totale de 23 400 km<sup>2</sup>, les récifs et lagons calédoniens sont parmi les plus étendus et les plus riches de la planète. La diversité observée en termes d’espèces, d'habitats et de structures récifales, y est exceptionnelle.   \nChaque région et groupe d'île de la zone économique exclusive se caractérise par des assemblages uniques d'espèces et d'habitats coralliens. Ce constat renforce la nécessité de protection et de conservation du patrimoine naturel aussi bien à l'échelle locale qu'internationale. 	\N	\N	\N	f
64838	1020	TEXT	species.13.name	*Neogymnocrinus richeri*	\N	\N	\N	f
64839	1020	TEXT	species.16.name	Le Corbeau calédonien	\N	\N	\N	f
68216	1041	IMAGE	ecosystems.image	\N	1738	Manchotière de la Baie du Marin (Crozet), avec le Marion Dufresne, bateau ravitailleur des TAAF en arrière-plan © Julie Tucoulet	\N	f
66606	1039	TEXT	ecosystems.ecosystems.3.name	Les récifs et le lagon	\N	\N	\N	f
66607	1039	TEXT	identity.subtitle	De nombreuses espèces terrestres endémiques	\N	\N	\N	f
66608	1039	IMAGE	species.7.image	\N	2383	*Bruguiera gymnorhiza* © Vincent Boullet	\N	f
66609	1039	TEXT	species.5.name	Les dauphins	\N	\N	\N	f
68217	1041	TEXT	identity.species	2 378 	\N	\N	\N	f
69969	1053	TEXT	body.titre_question.1.citation.citationElement	Grâce à ce compagnonnage nous avons pu concevoir une structure d’accueil adéquate pour les chiroptères.	\N	\N	\N	f
69970	1053	IMAGE	body.titre_question.15.image.imageElement	\N	2640	Te Me Um	\N	f
69971	1053	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
69740	1022	TEXT	events.2.description	Fermeture naturelle de l’isthme	\N	\N	\N	f
69741	1022	TEXT	events.3.description	Première étude publiée sur la flore de Saint-Pierre et Miquelon (thèse de pharmacie d’Alphonse Gaulthier)	\N	\N	\N	f
69742	1022	IMAGE	identity.image	\N	2428	L'étang du Bois brûlé © Nathalie de Lacoste	\N	f
69743	1022	TEXT	events.7.description	Projet de Réserve naturelle nationale sur le Grand Barachois, finalement abandonné	\N	\N	\N	f
69744	1022	TEXT	events.7.date	1988 - 1992 	\N	\N	\N	f
69745	1022	TEXT	interests.locations.0.name	Le Grand Barachois	\N	\N	\N	f
69746	1022	TEXT	events.0.description	Prise de possession française des îles par Jacques Cartier	\N	\N	\N	f
69747	1022	TEXT	events.1.description	Première installation permanente des pêcheurs bretons, normands et basques	\N	\N	\N	f
68218	1041	TEXT	statistics.1.number	672 969 km<sup>2</sup>	\N	\N	\N	f
68219	1041	IMAGE	ecosystems.ecosystems.0.image	\N	1700	NA	\N	f
68220	1041	TEXT	statistics.0.number	47 espèces	\N	\N	\N	f
68221	1041	TEXT	statistics.2.number	35 espèces	\N	\N	\N	f
68222	1041	TEXT	zoom.title	Quelques repères dans les Terres australes françaises	\N	\N	\N	f
68223	1041	TEXT	species.2.name	Les gorfous	\N	\N	\N	f
68224	1041	TEXT	species.8.name	Les orques	\N	\N	\N	f
68225	1041	TEXT	species.4.description	Chassée pour sa fourrure, l’Otarie à fourrure d’Amsterdam ([*Arctocephalus tropicalis*](https://inpn.mnhn.fr/espece/cd_nom/528710)) a frôlé l’extinction au début du XXe siècle. Si les populations restent globalement inférieures au niveau de pré-exploitation, l’île Amsterdam abrite aujourd’hui la 3e plus grande population mondiale d’otarie d’Amsterdam.  \n  \nStatut sur la Liste rouge des mammifères des TAAF : préoccupation mineure. \n	\N	\N	\N	f
68226	1041	TEXT	events.6.description	Création du territoire des Terres Australes et Antarctiques françaises (TAAF), divisé en 3 districts	\N	\N	\N	f
68227	1041	TEXT	zoom.callToAction	Cliquez sur la carte thématique pour vous repérer en un coup d'œil !	\N	\N	\N	f
68228	1041	TEXT	events.6.date	1955	\N	\N	\N	f
68229	1041	TEXT	ecosystems.ecosystems.0.name	NA	\N	\N	\N	f
68230	1041	TEXT	species.5.description	L’Azorelle ([*Azorella selago*](https://inpn.mnhn.fr/espece/cd_nom/721433)) est une plante à fleur à croissance très lente qui forme des coussins denses sur les étendues pierreuses de Kerguelen et Crozet. Un individu met 100 à 200 ans pour atteindre un mètre de diamètre ! A Kerguelen, les tapis d’Azorelle ont été fortement dégradés par les lapins introduits et ne sont aujourd’hui visibles que sur les îles et îlots où l’herbivore n’est pas présent.  \n  \nStatut sur la Liste rouge mondiale : non évalué.\n	\N	\N	\N	f
69748	1022	TEXT	events.8.description	Création du Conseil Scientifique Territorial du Patrimoine Naturel (CSTPN) et projet de Réserve naturelle nationale du Grand Colombier, gelé pour le moment	\N	\N	\N	f
69749	1022	TEXT	events.9.description	Ouverture de la Maison de la nature et de l'environnement	\N	\N	\N	f
69750	1022	IMAGE	ecosystems.image	\N	2433	Paysage enneigé de Saint-Pierre-et-Miquelon © Bruno Letournel - Office français de la biodiversité	\N	f
69751	1022	TEXT	identity.species	2 083	\N	\N	\N	f
69752	1022	IMAGE	ecosystems.ecosystems.0.image	\N	2432	Paysage de toundra © DTAM 975	\N	f
69753	1022	TEXT	zoom.title	Quelques repères à Saint-Pierre-et-Miquelon	\N	\N	\N	f
69754	1022	TEXT	species.8.name	Le Cerf de Virginie 	\N	\N	\N	f
69755	1022	TEXT	events.6.description	Disparition de l’archipel du Lagopède des saules ([*Lagopus lagopus*](https://inpn.mnhn.fr/espece/cd_nom/2948)), oiseau caractéristique des forêts boréales	\N	\N	\N	f
69756	1022	TEXT	events.6.date	1985	\N	\N	\N	f
69757	1022	TEXT	events.4.description	Introduction volontaire du Lièvre d’Amérique pour la chasse	\N	\N	\N	f
69758	1022	TEXT	events.5.description	Introduction du Cerf de Virginie à des fins cynégétiques	\N	\N	\N	f
69759	1022	TEXT	interests.locations.2.name	Le Grand Colombier	\N	\N	\N	f
69760	1022	TEXT	ecosystems.ecosystems.3.description	Espèces pionnières et graminées colonisent ces milieux littoraux souvent fragilisés par les dégradations (travaux, incendies, pâturages). Espèce typique de ces milieux dunaires, l’oyat (ou Ammophile à ligule courte, [*Ammophila breviligulata*](https://inpn.mnhn.fr/espece/cd_nom/761890)) joue un rôle essentiel dans la fixation des dunes et limite l’érosion. En arrière dune, une grande diversité d’espèces indigènes, parfois très rares, cohabitent avec des graminées introduites et naturalisées.	\N	\N	\N	f
69761	1022	IMAGE	species.1.image	\N	2422	Macareux moine © Bruno Letournel - Office français de la biodiversité	\N	f
69762	1022	TEXT	events.5.date	1953	\N	\N	\N	f
69763	1022	TEXT	identity.marineArea	12 300	\N	\N	\N	f
69764	1022	TEXT	events.8.date	2007	\N	\N	\N	f
69765	1022	IMAGE	interests.locations.0.image	\N	2425	Grand Barachois © DTAM 975	\N	f
69766	1022	TEXT	species.6.name	La Linnée boréale	\N	\N	\N	f
69767	1022	IMAGE	interests.locations.3.image	\N	2421	La Vallée du Milieu © Nathalie De Lacoste	\N	f
69768	1022	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
68557	1038	TEXT	species.6.description	Également nommé wassaï (ou açaï), le Palmier pinot ([*Euterpe olaracea*](https://inpn.mnhn.fr/espece/cd_nom/731659)) produit des fruits de couleur violet très foncé utilisés pour de nombreux usages (jus, huile, poudre). Ils poussent en grappes le long du tronc qui peut s’élever jusqu’à 20 m de hauteur, et sont également consommés par la faune sauvage. Ces palmiers sont particulièrement présents en zones marécageuses où ils peuvent former de véritables « pinotières ».\nUtilisées depuis des siècles par les peuples d’Amazonie, les fruits du wassaï font désormais l’objet d’un intérêt mondial sur les marchés de l’alimentation, la cosmétique et la médecine. \n\nStatut sur la Liste rouge mondiale : non évalué.\n	\N	\N	\N	f
64840	1020	TEXT	ecosystems.ecosystems.0.description	Ces forêts dites « sempervirentes » couvrent un peu plus de 20&nbsp;% du territoire, avec des massifs de plusieurs milliers d’hectares d’un seul tenant. Elles concentrent plus de 2 000 espèces végétales donc 80&nbsp;% endémiques, et offrent un habitat à une faune diversifiée : oiseaux, reptiles, chauve-souris, insectes… Elles sont cependant victimes de fortes dégradations (incendies, exploitation minière, espèces exotiques envahissantes…). 	\N	\N	\N	f
64841	1020	TEXT	identity.highestPoint	1 628	\N	\N	\N	f
64842	1020	TEXT	interests.locations.4.description	Situé sur la côte Sud-Est de la Grande Terre, entre Thio et Yaté, ce [parc provincial](https://www.province-sud.nc/aires-protegees/parc-cote-oubliee) créé en 2019 protège désormais 93 000 ha terrestres et 29 200 ha marins. C'est un véritable trésor de biodiversité qui abrite 20 % des forêts humide du territoire, 82 % d’espèces végétales endémiques  et un patrimoine culturel et immatériel précieux. Ce classement a par ailleurs induit le gel d’une centaine de titres miniers. \n	\N	\N	\N	f
64843	1020	TEXT	risks.risks.0.name	Une richesse en biodiversité soumise à des fortes pressions 	\N	\N	\N	f
64844	1020	IMAGE	interests.locations.1.image	\N	2441	Poisson-coffre dans les récifs d’Entrecasteaux © DR	\N	f
64845	1020	IMAGE	ecosystems.ecosystems.1.image	\N	2462	Récif corallien de Nouvelle-Calédonie © Gregory Lasne	\N	f
64846	1020	TEXT	interests.locations.3.description	Autour du point culminant de la Nouvelle-Calédonie (1 627 m), cette réserve de 5 400 hectares a été créée en 1950. Cette réserve botanique exceptionnelle se caractérise par une mosaïque de formations forestières abritant une faune et une flore remarquable : kaoris, palmiers du genre *Clinosperma*, oiseaux ([Méliphage noir](https://inpn.mnhn.fr/espece/cd_nom/441962/), [Pétrel de Tahiti](https://inpn.mnhn.fr/espece/cd_nom/442281)), papillons, etc.	\N	\N	\N	f
64847	1020	IMAGE	species.10.image	\N	2456	*Pteropus ornatus* © Malik Oedin / IAC	\N	f
64848	1020	TEXT	identity.title	La Nouvelle-Calédonie,\nun hotspot de biodiversité dans le Pacifique	\N	\N	\N	f
64849	1020	IMAGE	species.16.image	\N	2461	*Corvus moneduloides* © Christine Fort	\N	f
64850	1020	IMAGE	species.6.image	\N	2444	*Rhacodactylus leachianus* © Matthias Deuss	\N	f
64851	1020	TEXT	interests.locations.1.name	Les lagons, inscrits au Patrimoine mondial de l'UNESCO 	\N	\N	\N	f
64852	1020	TEXT	statistics.2.text	espèces de coraux 	\N	\N	\N	f
64853	1020	IMAGE	species.0.image	\N	2450	*Sphaeropteris intermedia* © Benjamin Guichard / OFB	\N	f
64854	1020	TEXT	events.1.date	Entre - 1100 et -1050 ans	\N	\N	\N	f
64855	1020	IMAGE	ecosystems.ecosystems.7.image	\N	2469	Espèces coralliennes spécifiques des fonds de baie envasés © F. Benzoni / IRD	\N	f
64856	1020	TEXT	interests.locations.4.name	Le parc provincial de la Côte oubliée (*Woen Vùù – Pwa Pereeù*)	\N	\N	\N	f
68558	1038	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
68559	1038	TEXT	events.0.date	-13 000 ans	\N	\N	\N	f
68560	1038	TEXT	identity.populationYear	2019	\N	\N	\N	f
68561	1038	IMAGE	species.5.image	\N	2404	*Dermochelys coriacea* © Raphaël Gailhac - OFB	\N	f
68562	1038	TEXT	events.13.date	2007	\N	\N	\N	f
68563	1038	TEXT	statistics.0.text	du territoire est recouvert de forêts	\N	\N	\N	f
68564	1038	TEXT	ecosystems.ecosystems.1.name	Les inselbergs	\N	\N	\N	f
68565	1038	TEXT	events.2.date	1844	\N	\N	\N	f
68566	1038	TEXT	identity.presentation	Située entre le Brésil et le Suriname, la Guyane est le plus vaste territoire d’outre-mer français, et le seul non insulaire. Il est en majorité recouvert de forêts tropicales humides, excepté sur la bande côtière où se trouve une mosaïque d’habitats plus ou moins ouverts : plages, mangroves, savanes, forêts marécageuses et marais. Il est difficile de résumer la diversité des espèces guyanaises tant elle est vaste, aussi bien chez la faune que la flore, et une grande partie est encore largement méconnue. Un hectare de forêt peut abriter plus de 300 espèces d’arbres, soit plus d’espèces qu’il n’y en a dans toute l’Europe continentale, et la diversité totale des insectes de Guyane est estimée à plus de 100 000 espèces. Bien que les milieux guyanais soient encore relativement préservés des activités humaines, certaines pressions, dont l’orpaillage, sont très préoccupantes.	\N	\N	\N	f
68567	1038	TEXT	identity.population	296 711	\N	\N	\N	f
68568	1038	TEXT	species.3.name	Le Jaguar	\N	\N	\N	f
68569	1038	TEXT	risks.risks.2.name	De vastes zones protégées, une gestion en concertation avec les communautés autochtones	\N	\N	\N	f
68570	1038	TEXT	species.0.name	Le Titan	\N	\N	\N	f
68571	1038	TEXT	events.4.date	1946	\N	\N	\N	f
68572	1038	IMAGE	interests.locations.2.image	\N	2406	Dispositif d'étude de la canopée dans la réserve des Nouragues © Pierre-Olivier Jay - 97px	\N	f
68573	1038	TEXT	events.11.date	1998	\N	\N	\N	f
68574	1038	IMAGE	ecosystems.ecosystems.2.image	\N	2410	Mangrove sur le littoral de Guyane © Olivier Tostain - 97px	\N	f
68575	1038	TEXT	events.10.description	Création de la Réserve naturelle nationale de la Trinité	\N	\N	\N	f
68576	1038	TEXT	events.11.description	Création des réserves naturelles nationales de l’Amana et de Kaw-Roura	\N	\N	\N	f
69769	1022	TEXT	interests.locations.3.name	La Vallée du Milieu	\N	\N	\N	f
69770	1022	TEXT	statistics.1.text	des habitants de l'archipel résident à Saint-Pierre	\N	\N	\N	f
69771	1022	TEXT	events.9.date	2017	\N	\N	\N	f
69772	1022	IMAGE	species.4.image	\N	2429	Sapin Baumier © Nathalie De Lacoste	\N	f
69773	1022	TEXT	events.3.date	1866	\N	\N	\N	f
70208	1049	TEXT	body.photos.4.description	« Certains secteurs d'Europa, notamment les épaves, grouillent de ce bernard-l’hermite ([*Coenobita perlatus*](https://inpn.mnhn.fr/espece/cd_nom/595669)), en particulier à la tombée du jour. Par son régime alimentaire principalement détritivore, ce crustacé est un véritable agent d’entretien des plages ! »	\N	\N	\N	f
69638	1052	TEXT	body.titre_question.6.paragraph.paragraphText	<strong>Les porteurs </strong>  \nLes structures porteuses sont, à une écrasante majorité, <strong>des associations</strong>, même si l’on peut également retrouver des gestionnaires d’espaces naturels, des établissements publics et de recherche, des services de l’Etat (surtout intéressés par les Espèces Exotiques Envahissantes, pour ces derniers).  \n<br> \n<strong>Les thèmes </strong>  \n<strong>61% des programmes enquêtés portent sur le milieu marin</strong>, principalement sur la protection des tortues marines, l’observation de mammifères marins ou bien de raies et requins, mais aussi la surveillance des récifs coralliens. On trouve également des programmes terrestres permettant par exemple l’observation d’insectes et d’araignées, ou bien encore, la signalisation de déchets encombrants la mangrove. <strong>4 programmes seulement, sur l’ensemble enquêté, portent sur la flore.</strong>\n<br>  \n<strong>Des programmes locaux</strong>  \n<strong>La majorité des programmes sont issus d’initiatives locales.</strong> On trouve dans une moindre mesure des programmes adaptés de l’hexagone, comme les programmes de suivi des oiseaux « STOC », ou certains réseaux d’échouage. \n<br> 	\N	\N	\N	f
69774	1022	IMAGE	ecosystems.ecosystems.3.image	\N	2437	Milieux dunaires © DTAM 975	\N	f
69775	1022	IMAGE	species.3.image	\N	2434	Pluvier siffleur en période de reproduction © Patrick Hacala	\N	f
69776	1022	IMAGE	zoom.map	\N	2418	Carte Saint-Pierre-et-Miquelon	\N	f
69777	1022	TEXT	species.1.name	Le Macareux moine 	\N	\N	\N	f
69778	1022	TEXT	species.7.name	Les Botryches	\N	\N	\N	f
69779	1022	TEXT	interests.title	Lieux d’intérêt	\N	\N	\N	f
69780	1022	TEXT	species.4.name	Le Sapin baumier	\N	\N	\N	f
69781	1022	TEXT	identity.area	242	\N	\N	\N	f
70209	1049	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
68577	1038	TEXT	interests.locations.0.description	Créé en 2007, le [Parc amazonien de Guyane](https://www.parc-amazonien-guyane.fr/fr) s’étend sur 40 % du territoire (34 000 km<sup>2</sup>) dans la partie sud de la Guyane. Il représente le plus vaste parc national de France et de l’Union européenne. Il a pour vocation de préserver la biodiversité exceptionnelle du massif forestier ainsi que les patrimoines culturels et les modes de vie traditionnels des populations, notamment amérindiennes et bushinenguées, vivant sur le territoire. 	\N	\N	\N	f
68922	1004	TEXT	understand.text2	Ces espèces exotiques envahissantes perturbent les équilibres environnementaux en entrant en compétition avec les espèces locales (pour la nourriture, les sites de reproduction ou de repos, la lumière, etc.), par prédation, introduction de pathogènes, hybridation ou encore en modifiant les paramètres physico-chimiques des habitats.  Elles ont ainsi de lourds impacts sur les milieux et les espèces indigènes, en particulier dans les îles où elles sont à l'origine de nombreuses extinctions.\n\nOn trouve des espèces exotiques envahissantes dans tous les groupes taxonomiques : champignons, algues, plantes vasculaires, invertébrés, reptiles, oiseaux, poissons, mammifères, etc. et dans tous les milieux : terrestres, marins ou d'eaux douces.	\N	\N	\N	f
67815	1040	TEXT	risks.risks.1.description	En raison de leur isolement, les écosystèmes de Polynésie française s’avèrent particulièrement vulnérables aux espèces introduites envahissantes. De nombreuses espèces très invasives sont à l’origine de régressions de populations chez la faune et la flore indigène. Le Miconia ([*Miconia calvescens*](https://inpn.mnhn.fr/espece/cd_nom/447324)), introduit en 1937 dans un jardin botanique à Tahiti, remplace les espèces végétales indigènes et endémiques et entraine l’appauvrissement des forêts humides des vallées et de montagne jusqu’à 1 300 m d’altitude. Surnommé «&nbsp;le cancer vert&nbsp;», il recouvre désormais deux tiers des forêts de Tahiti et a été introduit dans d’autres îles de la Société et des Marquises. D’autres espèces végétales, comme le Tulipier du Gabon ([*Spathodea campanulata*](https://inpn.mnhn.fr/espece/cd_nom/448228)), sont également préoccupantes en raison de leur expansion.  \n  \nComme dans de nombreux milieux insulaires à travers le globe, l’introduction des rats a des conséquences désastreuses pour les écosystèmes, en particulier pour les oiseaux dont les œufs sont prédatés, mais aussi pour la flore indigène, car les rats, en consommant les plantules et les graines, perturbent la régénération naturelle des forêts. Les chats harets (chats domestiques retournés à l’état sauvage) sont également une menace importante pour la biodiversité des îles de Polynésie française. Les études récentes montrent une forte prédation sur les oiseaux, dont des espèces endémiques aux Marquises, et les reptiles. D’autres espèces animales introduites, comme les fourmis (Petite fourmi de feu ([*Wasmannia auropunctata*](https://inpn.mnhn.fr/espece/cd_nom/532927)), Grande fourmi folle ([*Anopolepis gracilipes*](https://inpn.mnhn.fr/espece/cd_nom/264513)) etc.) ou des oiseaux (Merle des Moluques ([*Acridotheres tristis*](https://inpn.mnhn.fr/espece/cd_nom/601183)), Bulbul à ventre rouge ([*Pycnonotus cafer*](https://inpn.mnhn.fr/espece/cd_nom/432746)), Busard de Gould ([*Circus approximans*](https://inpn.mnhn.fr/espece/cd_nom/432707)), etc.) ont également un fort impact sur la biodiversité terrestre des îles de Polynésie française.  \n\nSi des actions sont entreprises pour lutter contre ces espèces dans les îles où elles ont été introduites, il s’agit également d’éviter leur dissémination sur des îles où elles ne sont pas encore présentes, en mettant en place des mesures de biosécurité (chiens détecteurs, inspections, interdiction de déplacer de la terre d’une île à l’autre…). L’introduction d’espèces non existantes sur le territoire de la Polynésie française est interdite. \n	\N	\N	\N	f
67816	1040	TEXT	interests.locations.2.description	Tahiti est la plus grande et la plus haute île de Polynésie française, c'est également la plus peuplée. Elle est la seule à posséder des sommets de plus de 1 300 m d'altitude, dont trois à plus de 2&nbsp;000&nbsp;m. On y trouve des zones de forêts naturelles avec une végétation subalpine unique en Polynésie française et dans les îles océaniques du Pacifique sud. 	\N	\N	\N	f
67817	1040	TEXT	events.12.description	Création de l'aire marine protégée *Te Tainui Atea*	\N	\N	\N	f
67818	1040	TEXT	interests.locations.1.description	Les plateaux du mont Temehani à Raiatea hébergent une flore endémique exceptionnelle dont le fameux [Tiare 'apetahi](https://inpn.mnhn.fr/espece/cd_nom/908708), fleur protégée et symbole culturel de l’île. \nLe *marae Taputapuātea*, au sud de l’île, est inscrit au patrimoine mondial de l’UNESCO depuis 2017 comme un site d’importance culturelle et spirituelle dans le Triangle Polynésien. Les *marae* construits par le peuple *mā’ohi* du XIV<sup>e</sup> au XVIII<sup>e</sup> siècle étaient des espaces reliant le monde des vivants et celui des ancêtres et des dieux.\n	\N	\N	\N	f
67819	1040	TEXT	ecosystems.ecosystems.3.name	Les forêts humides	\N	\N	\N	f
67820	1040	TEXT	identity.subtitle	La nature indissociable du patrimoine culturel	\N	\N	\N	f
67821	1040	IMAGE	species.7.image	\N	2508	*Partula tristis* © Fred Jacq - INPN	\N	f
67822	1040	TEXT	species.5.name	Le Triton géant (*Pū*)	\N	\N	\N	f
66610	1039	TEXT	risks.risks.0.description	Mayotte présente la densité de population la plus forte de tous les territoires d’outre-mer, et la population ne cesse d’augmenter. Cette pression démographique entraine de nombreuses conséquences sur les milieux naturels.  \n\nLe déboisement massif pour l’agriculture, la construction d’infrastructures urbaines et l’utilisation de bois de coupe et de charbon ont drastiquement détérioré les écosystèmes terrestres et la végétation d’origine ne couvre plus qu’environ 10&nbsp;% du territoire. Cette déforestation aggrave l’érosion des sols et le lessivage des sédiments qui provoque l’envasement du lagon et la dégradation des récifs coralliens.  \n\nLe manque d’assainissement est également l’un des problèmes environnementaux majeurs à Mayotte. En raison du trop faible nombre de stations d’épuration et du faible raccordement des foyers (seulement 10 % de la population raccordée en 2020), les eaux usées sont souvent déversées dans le lagon sans avoir été traitées, chargées de polluants d’origines domestiques, agricoles et industrielles.  \n\nLa pêche est une pratique ancrée dans la culture locale. De nombreuses techniques sont utilisées : pêche à pied (au poulpe), en pirogue, au djarifa (pratiquée par les femmes à l’aide d’un grand tissu maintenu dans l’eau), chasse sous-marine, etc. Ces pratiques sont règlementées et certaines espèces sont interdites de capture. Les déchets issus de la pêche sont également une cause de dégradation du milieu marin.  \n\nDe nombreuses espèces exotiques envahissantes sont présentes à Mayotte et impactent l’équilibre des écosystèmes, comme le Lantana ([*Lantana camara*](https://inpn.mnhn.fr/espece/cd_nom/104929)), un arbuste originaire des Antilles classé parmi les pires espèces envahissantes au monde, ou l’Avocat marron ([*Litsea glutinosa*](https://inpn.mnhn.fr/espece/cd_nom/656475)), un arbre qui prolifère dans les forêts du nord de l’île. \n	\N	\N	\N	f
66611	1039	TEXT	ecosystems.ecosystems.2.description	Forêt à l’interface entre le milieu marin et le milieu terrestre, dans la zone de balancement des marées, les mangroves couvrent environ 700 hectares répartis sur près de 120 sites le long du littoral mahorais. Zone de nidification pour les oiseaux, de nourrissage et de reproduction pour de nombreuses espèces (crabes, poissons, reptiles…), les mangroves limitent l’érosion et l’envasement du lagon, et permettent l’épuration de l’eau. \nSelon les récits, les *Wana Issa* (les enfants de Issa) sont des esprits qui peuplent les mangroves de Mayotte. Ils protégeraient tantôt les humains des maléfices de la mangrove, tantôt la mangrove des atteintes de l’homme.\nCet écosystème est soumis à de nombreuses pressions, en particulier les remblais pour l’aménagement urbain et les rejets des eaux usées.  .   \nPour en savoir plus sur les mangroves de Mayotte, découvrez les [visites virtuelles](https://uicn.fr/Mangrove/M-hoko/visite.htm) développées par le [Pôle Relais Zones Humides Tropicales](https://www.pole-tropical.org/). \n	\N	\N	\N	f
66612	1039	TEXT	ecosystems.ecosystems.1.description	Ce terme, qui signifie « mauvaise terre » désigne des zones de sols dégradés et de roche nue, bruns ou rougeâtres, décapés par l’érosion et dépourvus de végétation. Ce phénomène naturel est largement amplifié par les activités humaines (déforestation, brulis, surpâturages). En 2010, les padzas couvraient 1 100 hectares soit 3 % du territoire. \nLes premiers projets de réhabilitation mis en place utilisaient des végétaux exotiques, comme l’[*Acacia mangium*](https://inpn.mnhn.fr/espece/cd_nom/447341), une espèce au fort potentiel envahissant. D’autres techniques utilisant des espèces indigènes sont aujourd’hui à l’essai, notamment associées à des mycorhizes (champignons) pour fertiliser les sols. \nLa restauration de ces zones et la préservation des terrains boisés permettront de lutter contre les glissements de terrain, les risques d’inondation, le lessivage des sédiments dans le lagon, et permettra la préservation de la ressource en eau et le retour de la biodiversité. \n	\N	\N	\N	f
66613	1039	TEXT	interests.locations.5.description	Ce lac de cratère est la seule étendue d’eau naturelle de l’île de Petite Terre. D’une superficie de 23 ha, ses eaux de couleur verte sont uniquement peuplées de microorganismes (cyanobactéries, protozoaires…) en raison de conditions de vie particulièrement rudes : salinité plus élevée que l’eau de mer, eaux alcalines (ph entre 9 et 9,5), température de 30°C et surface sursaturée en oxygène mais anoxie au-delà d’1,5 m de profondeur. Il est bordé par des vestiges de forêt sèche.	\N	\N	\N	f
66614	1039	TEXT	ecosystems.ecosystems.0.description	Les forêts de Mayotte ont été largement perturbées par les activités humaines, et il ne subsiste que quelques reliques de forêts primaires. Sur les monts et les crêtes, la forêt est de type tropical humide, avec un sous-bois dense et de nombreuses mousses, fougères, lianes et épiphytes (végétaux utilisant d’autres plantes comme support). Il existe également des reliquats de forêts primaires sèches comme sur l’îlot MBouzi.  \nLes forêts primaires sont menacées par l’utilisation du bois, les brûlis, l’extension des zones agricoles et urbaines. La Réserve naturelle nationale des forêts de Mayotte a été créée en 2021 afin de préserver ces reliquats de forêts primaires qui abritent une grande partie de la biodiversité indigène et endémique mahoraise. \nLes forêts dites « secondaires », qui s’établissent suite aux perturbations humaines, sont moins riches en biodiversité et souvent composées d’espèces exotiques dont des espèces envahissantes. 	\N	\N	\N	f
66615	1039	TEXT	identity.highestPoint	660	\N	\N	\N	f
66616	1039	TEXT	interests.locations.4.description	Au sud-ouest de la Grande Terre, la Baie de Bouéni abrite la plus vaste mangrove de Mayotte. Celle-ci s’étale sur près de 200 hectares et les 7 espèces de palétuviers présents à Mayotte y sont représentés. Cette mangrove abrite une faune nombreuse, dont le Crabier blanc ([*Ardeola idae*](https://inpn.mnhn.fr/espece/cd_nom/418710)), oiseau en danger critique d’extinction. Les formations récifales de la baie sont également très riches. Le site est reconnu comme zone nationale d’intérêt écologique, floristique et faunistique (ZNIEFF).	\N	\N	\N	f
66617	1039	TEXT	risks.risks.0.name	La biodiversité de Mayotte sous pression 	\N	\N	\N	f
66618	1039	IMAGE	interests.locations.1.image	\N	2378	Vue aérienne du lagon et de la barrière récifale © Alexandra Gigou / Office français de la biodiversité	\N	f
66619	1039	IMAGE	ecosystems.ecosystems.1.image	\N	2392	Padzas sur le Mont Choungui © Manuel Parizot	\N	f
66620	1039	TEXT	interests.locations.3.description	Cette lagune littorale saumâtre située au nord-ouest de Petite Terre est entourée de tombolos (cordons de sédiments) au nord et au sud, percés par des brèches permettant la circulation de l'eau avec le lagon, selon le cycle des marées. Ses fonds vaseux sont peuplés d’herbiers de phanérogames que viennent brouter les tortues et les abords du plan d’eau sont colonisés par la mangrove. Le site accueille une faune riche, dont 35 espèces d’oiseaux. Il est reconnu zone humide d’importance internationale au titre de la Convention de RAMSAR depuis 2011.	\N	\N	\N	f
66621	1039	TEXT	identity.title	Mayotte,  \nun lagon d'une richesse exceptionnelle	\N	\N	\N	f
66622	1039	IMAGE	species.6.image	\N	2377	*Chelonia mydas* © Alexandra Gigou / Office français de la biodiversité	\N	f
66623	1039	TEXT	interests.locations.1.name	Le Parc naturel marin	\N	\N	\N	f
66624	1039	TEXT	statistics.2.text	de mangrove	\N	\N	\N	f
66625	1039	IMAGE	species.0.image	\N	2384	*Ardeola idae* © Randrianarimanana	\N	f
66626	1039	TEXT	events.1.date	-7 000 ans 	\N	\N	\N	f
66627	1039	TEXT	interests.locations.4.name	La Baie de Bouéni	\N	\N	\N	f
67006	1044	TEXT	body.bodyElements.7.questionAnswer.response	**J’ai déjà pu identifier 107 espèces et 39 genres.** Certaines étaient attendues, d'autres non. **Certaines de ces espèces ne viennent pas de Guyane et ont un fort potentiel envahissant.** Pour le sol, un ingénieur en bioinformatique est en train d’extraire l’ADN présent dans les échantillons. Nous attendons les résultats. Après le traitement de ces données, on pourra commencer à envisager différents types d’exploitations. Une cartographie des espèces est prévue, probablement des articles sur les espèces envahissantes. Ces données pourront servir d’expertise de terrain aux gestionnaires et décideurs s’ils souhaitent mettre en place des mesures de gestion au sein de leur commune. Le programme devrait aussi évoluer dans les mois qui viennent. Nous allons publier très prochainement notre site web ([www.biodiversiteguyane.cnrs.fr](https://biodiversiteguyane.cnrs.fr/)), participer à des évènements, l’objectif étant de capter aussi un public non scolaire.   \n**Notre objectif fin 2022, date de clôture du projet, serait de parvenir à 3000 échantillons.** C’est un idéal. Reste la sensibilisation de la population, l’autre grand volet du programme. Nous avons déjà fait du chemin. Il paraît que la nièce d’une collègue devenue passionnée à la suite du programme, raconte des histoires de fourmis à toute sa famille. Elle a étonné tout le monde en prononçant le nom d’une espèce qui passait à la télé. **Une petite anecdote – parmi d’autres - qui font penser que notre travail porte ses fruits.**	\N	\N	\N	f
67007	1044	TEXT	body.bodyElements.8.paragraph.paragraphText	**Pour en savoir plus,** contactez Marilou Hircq [marilou.hircq@ecofog.gf](marilou.hircq@ecofog.gf).	\N	\N	\N	f
69972	1053	TEXT	body.titre_question.0.paragraph.paragraphText	<strong>Les territoires ultramarins ont en commun de nombreuses problématiques de conservation de la biodiversité</strong>, liées par exemple à l’insularité ou au climat, à la présence de nombreuses espèces endémiques souvent menacées, ou encore aux mêmes espèces exotiques envahissantes. Si la collaboration à distance est possible, elle connait de nombreuses limites, et rien ne remplace les échanges directement sur le terrain, pour se former, partager des expériences et réfléchir ensemble aux solutions adaptées à chaque territoire.  \n<br>\nPour répondre à ce besoin, <strong>l’Office français de la biodiversité a mis en place le programme de compagnonnage Te Me Um</strong>, un système d’échanges et d’immersion professionnelle qui permet à un.e professionnel.le d’être accueilli.e dans un autre territoire pour rencontrer un.e expert.e du domaine dans lequel il.elle souhaite se perfectionner. Une soixantaine de projets de ce type ont été financés depuis 2009. Nous proposons ici un focus sur les missions réalisées par la [Société d’étude ornithologique de La Réunion (SEOR)](https://www.seor.fr/), qui a bénéficié de ce programme à plusieurs reprises.\n<br>\n	\N	\N	\N	f
69639	1052	TEXT	body.titre_question.10.paragraph.paragraphText	<strong>Les forces </strong> <br> \n<strong>Des données parfois uniques !</strong> Pour certaines espèces protégées, rares ou méconnues, les observations permettent de compléter des jeux de données déjà existants ou sont même parfois la seule source d’informations.<br> \n<strong>Des espèces à fort capital sympathie </strong>: raies, tortues, oiseaux endémiques rares… S’intéresser à certaines espèces emblématiques, parfois mystérieuses, est un véritable atout pour les programmes qui y sont dédiés et qui deviennent par ce biais, bien plus attrayants pour le public.   \n<br> \n<strong>Les faiblesses </strong> <br> \n<strong>L’absence ou le peu d’animation de réseau !</strong> Il faut des moyens pour garantir une animation solide et continue, qui permette aux observateurs d’avoir des retours sur leur implication et qui mette en confiance les membres du réseau. Les difficultés d’animation peuvent aussi entraîner des manques en termes de communication : les programmes et structures ne se font pas assez connaître et donc restreignent leur utilisation, de fait, à un nombre de participants limité.<br> \n<strong>Une assise scientifique parfois trop légère</strong>. Les données opportunistes peuvent être une source d’informations intéressantes, cependant, le manque de rigueur scientifique du processus peut restreindre leur utilisation et leur valorisation. Il peut être intéressant de proposer de mettre en place différents niveaux d’observation, ou bien d’appliquer un protocole léger, mais validé scientifiquement.  \n<br> \n	\N	\N	\N	f
69782	1022	TEXT	species.0.description	Une vingtaine d'espèces de mammifères marins fréquente les eaux de Saint-Pierre-et-Miquelon, dont quatre espèces de phoques : le Phoque veau-marin ([*Phoca vitulina*](https://inpn.mnhn.fr/espece/cd_nom/60811)), le Phoque gris ([*Halichoerus grypus*](https://inpn.mnhn.fr/espece/cd_nom/60776)), et, plus rarement observés, le Phoque à capuchon ([*Cystophora cristata*](https://inpn.mnhn.fr/espece/cd_nom/60765)) et le Phoque du Groenland ([*Pagophilus groenlandicus*](https://inpn.mnhn.fr/espece/cd_nom/60797)). Seul le phoque veau-marin s'y reproduit. C’est sur les bancs de sable de la lagune du Grand Barachois qu’ils se regroupent en plus grand nombre, mais ils peuvent être observés sur toutes les côtes de l'archipel.\n\nStatut dans la Liste rouge mondiale : vulnérable pour le Phoque à capuchon, préoccupation mineure pour les trois autres espèces. 	\N	\N	\N	f
69783	1022	TEXT	identity.highestPointName	Morne de la Grande Montagne	\N	\N	\N	f
69784	1022	TEXT	ecosystems.ecosystems.2.name	La forêt boréale 	\N	\N	\N	f
69785	1022	TEXT	species.7.description	Dans les pelouses sableuses d’arrière dune se cachent plusieurs espèces rares de botryches, comme le Botryche à feuille de rue ([*Botrychium multifidum*](https://inpn.mnhn.fr/espece/cd_nom/121461\n)). Il s’agit de petites fougères vivaces dont le nom provient du grec « botrus » signifiant grappes, qui se réfère à l’aspect de ses fructifications.  \n  \nStatut dans la Liste rouge mondiale *Botrychium multifidum* : espèce non évaluée. 	\N	\N	\N	f
69786	1022	TEXT	species.8.description	Peu de mammifères terrestres sont indigènes de l’archipel. Le Cerf de Virginie ([*Odocoileus virginianus*](https://inpn.mnhn.fr/espece/cd_nom/645125\n)) a été introduit à Miquelon et Langlade en 1953 pour la chasse. Grâce à leurs importantes capacités d’adaptation et à l’absence de prédateur naturel, les populations de cerfs se sont largement développées et freinent désormais fortement la régénération de la forêt boréale. L’espèce n'est pas présente sur l’île de Saint-Pierre. \n  \nStatut local : espèce introduite.	\N	\N	\N	f
69787	1022	IMAGE	species.2.image	\N	2431	Lièvre arctique © Daniel Koelsch - DTAM 975	\N	f
69973	1053	TEXT	presentation.name	Le compagnonnage Te Me Um, un programme de formation original	\N	\N	\N	f
69974	1053	TEXT	body.titre_question.5.citation.citationElement	L’explication des dispositifs mis en place à Tahiti a permis les transposer à La Réunion en les adaptant à nos contraintes	\N	\N	\N	f
67008	1044	TEXT	body.bodyElements.5.citation.citationElement	L’idée est que les élèves reproduisent l’échantillonnage chez eux, afin d’accroître de nombre d’échantillons dans toute la commune.	\N	\N	\N	f
68578	1038	TEXT	risks.risks.2.description	Le territoire est riche en aires protégées, parmi les plus vastes de France. Outre le parc amazonien de Guyane qui couvre le sud de la Guyane, on compte six réserves naturelles nationales (Marais de Kaw-Roura, Mont Grand Matoury, Trinité, Amana, Grand Connétable et Nouragues) et une réserve naturelle régionale (Trésor). Trois zones humides sont classées au protocole de Ramsar (Basse Mana, les marais de Kaw et l’estuaire des fleuves Sinnamary et Iracoubo) et on compte également 14 000 ha protégés par le Conservatoire du littoral. La Guyane compte également deux réserves biologiques intégrales : la réserve de Petites Montagnes Tortue et la réserve de Lucifer Dékou-Dékou. La création d’une réserve biologique dirigée est en cours.\n\nLa conciliation de la préservation de la biodiversité avec le respect des modes de vie et des traditions des populations est un enjeu fort en Guyane. Le Parc national et l’OFB ont par exemple mené un programme d’étude pour mieux connaître les pratiques de chasse, évaluer l’état de conservation des gibiers et ainsi construire avec les communautés locales des modes de gestion adaptées. \n	\N	\N	\N	f
68579	1038	TEXT	events.13.description	Création du Parc national Amazonien de Guyane	\N	\N	\N	f
68580	1038	TEXT	risks.risks.1.description	La richesse du sol guyanais en ressources aurifères attire les convoitises. L’exploitation illégale, qui a explosé en Guyane ces dernières années, est un fléau pour la biodiversité que les actions de lutte ne réussissent pas à endiguer et qui n’épargne pas les espaces protégés.\n\nMalgré son interdiction en 2006, le mercure continue d’être utilisé par les *garimpeiros* (chercheurs d'or clandestins)pour amalgamer l’or et pollue durablement les cours d’eau et les organismes aquatiques que consomment les populations locales. Les taux de contamination observés chez ces populations sont élevés. Les eaux sont également impactées par le défrichement non raisonné de la forêt qui favorise l’érosion et le lessivage des sols, ils deviennent alors trop turbides et pauvres en oxygènes pour la faune et la flore aquatiques. Aux impacts sur l’environnement s’ajoutent d’importants problèmes humains, de misère sociale, de violence et de conflits avec les populations locales. \n\nDepuis 2008, l’opération Harpie implique de nombreux acteurs du territoire (armée, police, justice, douanes, ONF, PAG) dans des interventions qui visent notamment à bloquer l’acheminement du matériel, et procéder à des saisies et des arrestations. Ce problème complexe nécessite une coopération à l’échelle régionale, les orpailleurs clandestins et le matériel provenant majoritairement des pays limitrophes. Cette opération a permis de contenir le phénomène à l'échelle globale. En 2021, les sanctions pénales encourues par les orpailleurs illégaux ont été renforcées dans le cadre de la nouvelle loi Climat. Le renforcement de la traçabilité de l’or serait également nécessaire.\n\nSi l’activité des exploitants aurifères déclarés est encadrée par des dispositions visant à limiter ses conséquences, elle reste cependant impactante pour les milieux naturels. De plus, l’émergence de projets d’exploitation de l’or à l’échelle industrielle pose d’importante préoccupations. Le projet très controversé de la Montagne d’or à fait l’objet d’une importante opposition de la population locale et des associations environnementales. Il a pour le moment été abandonné mais la prolongation des concessions fait l’objet d’une procédure judiciaire toujours en cours.  \n	\N	\N	\N	f
68231	1041	TEXT	species.6.description	Le Chou de Kerguelen ([*Pringlea antiscorbutica*](https://inpn.mnhn.fr/espece/cd_nom/721546)) est une plante vivace dont les feuilles ovales poussent en rosette. Il se rencontre dans des milieux divers et est capable de s’adapter à différentes contraintes : à basse altitude en milieu côtier il présente une forte résistance aux embruns ; à très haute altitude (entre 700 – 1000 m), il résiste au gel, et peut se développer sur des plateaux rocheux ou en falaise. Comme les autres plantes de la famille des Brassicacées, il est riche en vitamine C et a pu être historiquement consommé par les marins pour lutter contre le scorbut. A Kerguelen, ses populations ont été fortement réduites suite à l’introduction des lapins sur l’île.\nContrairement à ce que son nom laisse à penser, cette espèce emblématique de la zone subantarctique n’est pas uniquement présente à Kerguelen mais se trouve également à Crozet et dans les îles Marion, Heard, Prince Edwards et Mac Donald.  \n  \nStatut sur la Liste rouge mondiale : non évalué.\n	\N	\N	\N	f
69975	1053	IMAGE	presentation.image	\N	2635	Echanges sur le terrain entre la SEOR et le GEPOMAY © SEOR	\N	f
69976	1053	TEXT	presentation.author	Doriane Blottière	\N	\N	\N	f
69977	1053	TEXT	presentation.date	02/03/2022	\N	\N	\N	f
69978	1053	IMAGE	body.titre_question.7.image.imageElement	\N	2639	Fresque représentant le Monarque de Tahiti en Polynésie française © SEOR	\N	f
69979	1053	IMAGE	body.titre_question.11.image.imageElement	\N	2636	Echanges autour du protocole du STOC © SEOR	\N	f
69980	1053	TEXT	body.titre_question.9.citation.citationElement	Nous avons décidé de prendre exemple sur le modèle de La Réunion	\N	\N	\N	f
69981	1053	TEXT	body.titre_question.4.paragraph.paragraphText	Et les échanges ne se sont pas limités à l’accueil des chauves-souris : les soigneuses ont aussi pu acquérir de l’expérience sur l’incubation artificielle d’œufs, parfois apportés au centre de soin, et l’élevage de jeunes oiseaux, et s’inspirer de l’aménagement du centre, comme le complète Julie Tourmetz : « *Le centre de soins Gérald Durrell possède une structure de volières vraiment exemplaire. Nous retenons les bonnes idées d’aménagements extérieurs pour nos futurs travaux.* »   \n<br>\nDepuis 2015, la SEOR a pris en charge 33 chauves-souris, majoritairement des petits molosses. <strong>Vingt ont pu être sauvés et relâchés</strong>. Avant le compagnonnage, le succès de sauvetage annuel était en moyenne de 30 %. Suite au compagnonnage et à la mise en place des acquis obtenus, il avoisine les 70&nbsp;% depuis 2018.\n	\N	\N	\N	f
70210	1049	TEXT	body.photos.1.description	« Ces récifs fossiles sur les plages de la Grande Glorieuse sont les témoins d’une époque – il y a plus de 100 000 ans – où la mer atteignait environ six mètres de plus que son niveau actuel. Ces vestiges coralliens de plusieurs mètres de haut apparaissent comme des montagnes sur ces îles où le point culminant ne s’élève que de quelques mètres. »	\N	\N	\N	f
70211	1049	TEXT	body.photos.5.description	« La sansouïre est un écosystème de zone humide qui se développe sur les plaines autour du lagon d’Europa, composé d’une végétation adaptée au milieu salin avec notamment des salicornes ([*Caroxylon littorale*](https://inpn.mnhn.fr/espece/cd_nom/899430)). »	\N	\N	\N	f
70212	1049	TEXT	body.photos.7.description	« Europa abrite une sous-espèce endémique du Phaéton à bec jaune ([*Phaethon lepturus europae*](https://inpn.mnhn.fr/espece/cd_nom/785477)). Cet oiseau est communément appelé Paille-en-queue en raison de ses deux longues plumes rectrices. Sa population à Europa ne compte que quelques centaines de couples et il niche surtout dans la forêt sèche. L’île recense également plus d’un millier de couples de Paille-en-queue à brins rouges ([*Phaethon rubricauda*](https://inpn.mnhn.fr/espece/cd_nom/432685)), soit l’une des plus grandes populations de l’ensemble de l’océan Indien. » 	\N	\N	\N	f
70213	1049	TEXT	presentation.name	Balade dans les îles Éparses 	\N	\N	\N	f
64183	1031	IMAGE	species.9.image	\N	2344	*Broussonetia papyrifera* © J-Y. H. Meyer, Délégation à la Recherche de la Polynésie française	\N	f
64184	1031	TEXT	events.2.description	Traces des premiers habitants de l'archipel, la civilisation Lapita	\N	\N	\N	f
64185	1031	TEXT	events.3.description	Première arrivée des européens dans l'archipel	\N	\N	\N	f
64186	1031	IMAGE	identity.image	\N	2338	Vue sur Alofi depuis Futuna © Tristan Berr	\N	f
64187	1031	TEXT	events.7.description	Élaboration de la Stratégie pour la biodiversité de Wallis-et-Futuna	\N	\N	\N	f
64188	1031	TEXT	events.7.date	2016	\N	\N	\N	f
64189	1031	TEXT	interests.locations.0.name	Le lac Lalolalo	\N	\N	\N	f
64190	1031	TEXT	events.0.description	Émergence de Futuna et Alofi	\N	\N	\N	f
64191	1031	TEXT	events.1.description	Émergence de Wallis et ses îlots	\N	\N	\N	f
64192	1031	TEXT	events.8.description	Publication de la liste des espèces protégées de Wallis-et-Futuna	\N	\N	\N	f
64193	1031	IMAGE	ecosystems.image	\N	2349	îlot Nukula'ela'e vu depuis Nukufotu © Tristan Berr	\N	f
64194	1031	TEXT	identity.species	2 691	\N	\N	\N	f
64195	1031	IMAGE	ecosystems.ecosystems.0.image	\N	2345	Forêt dense humide sur Alofi © J-Y. H. Meyer, Délégation à la Recherche de la Polynésie française	\N	f
64196	1031	TEXT	zoom.title	Quelques repères à Wallis-et-Futuna	\N	\N	\N	f
64197	1031	TEXT	species.8.name	Le faux-tabac	\N	\N	\N	f
64198	1031	TEXT	events.6.description	Adoption du Code territorial de l'Environnement	\N	\N	\N	f
64199	1031	TEXT	events.6.date	2007	\N	\N	\N	f
64200	1031	TEXT	events.4.description	Wallis-et-Futuna devient un territoire d'outre-mer français par référundum	\N	\N	\N	f
64201	1031	TEXT	events.5.description	Création du Service de l'Environnement de Wallis-et-Futuna	\N	\N	\N	f
64202	1031	TEXT	interests.locations.2.name	Le lagon de Wallis	\N	\N	\N	f
64203	1031	TEXT	ecosystems.ecosystems.3.description	Le lagon de Wallis présente plusieurs formations récifales différentes et riches, tandis qu'Alofi ne possède qu’un lagon très restreint et que Futuna ne présente que des récifs frangeants. On trouve dans les eaux de Wallis-et-Futuna 135 espèces de coraux et plus de 700 espèces de poissons. 	\N	\N	\N	f
64204	1031	TEXT	ecosystems.ecosystems.4.description	Étendus à l’intérieur du lagon de Wallis, les herbiers sous-marins sont très importants dans l’équilibre de l’écosystème récifal et abritent de nombreuses espèces de mollusques, crustacés et juvéniles de poissons. On y trouve 3 espèces de phanérogames marines : [*Halodule pinifolia*](https://inpn.mnhn.fr/espece/cd_nom/643947), [*Halophila ovalis*](https://inpn.mnhn.fr/espece/cd_nom/446212) et [*Syringodium isoetifolium*](https://inpn.mnhn.fr/espece/cd_nom/627258).	\N	\N	\N	f
64205	1031	TEXT	ecosystems.ecosystems.4.name	Les herbiers sous-marins	\N	\N	\N	f
64206	1031	IMAGE	species.1.image	\N	2333	*Candoia bibroni* © Enelio Liufau	\N	f
64207	1031	TEXT	events.5.date	1997	\N	\N	\N	f
64208	1031	TEXT	identity.marineArea	262 500	\N	\N	\N	f
64209	1031	TEXT	species.9.name	Le mûrier à papier	\N	\N	\N	f
64210	1031	TEXT	events.8.date	2020	\N	\N	\N	f
64211	1031	IMAGE	interests.locations.0.image	\N	2337	Lac Lalolalo © Enelio Liufau	\N	f
64212	1031	TEXT	species.6.name	Les *langakali*	\N	\N	\N	f
64213	1031	IMAGE	interests.locations.3.image	\N	2342	Alofi © Jean-Yves Hiro Meyer, Délégation à la Recherche de la Polynésie française	\N	f
64214	1031	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
64215	1031	TEXT	interests.locations.3.name	Alofi	\N	\N	\N	f
64216	1031	TEXT	statistics.1.text	entre Wallis et les îles Horn (Futuna et Alofi)	\N	\N	\N	f
64217	1031	IMAGE	species.4.image	\N	2339	*Smilosicyopus sasali* © P. Keith	\N	f
64218	1031	TEXT	events.3.date	1616	\N	\N	\N	f
64219	1031	IMAGE	ecosystems.ecosystems.3.image	\N	2348	Récifs coralliens de Wallis © Sandrine JOB	\N	f
64220	1031	IMAGE	species.3.image	\N	2334	*Pteropus tonganus* © Tristan Berr	\N	f
64221	1031	IMAGE	zoom.map	\N	2330	Carte Wallis-et-Futuna	\N	f
64222	1031	TEXT	species.1.name	Le Boa du Pacifique	\N	\N	\N	f
64223	1031	TEXT	species.7.name	Les palétuviers	\N	\N	\N	f
64224	1031	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
64225	1031	TEXT	species.4.name	Les gobies d'eau douce	\N	\N	\N	f
64226	1031	TEXT	identity.area	142	\N	\N	\N	f
64227	1031	TEXT	species.0.description	La Gallicolombe de Stair ([*Alopecoenas stairi*](https://inpn.mnhn.fr/espece/cd_nom/784897)) est un oiseau de la famille des Colombidés, que l’on trouve également à Tonga, Fidji et aux Samoa. Si historiquement, l’espèce était probablement présente à Wallis et à Futuna, elle n’est attestée qu’à Alofi et les derniers signalements datent des années 1980. Les missions ornithologiques récentes n’ont pas permis de trouver de traces d’individus, il est donc fort possible que cette espèce soit désormais éteinte dans l’archipel, probablement victime des modifications de son habitat et de la prédation par les rats et les chiens errants. \n  \nStatut sur la Liste rouge mondiale : vulnérable.	\N	\N	\N	f
64228	1031	TEXT	identity.highestPointName	Mont Puke (Futuna)	\N	\N	\N	f
64229	1031	TEXT	ecosystems.ecosystems.2.name	La mangrove	\N	\N	\N	f
64230	1031	TEXT	species.7.description	Deux espèces de palétuvier sont présentes dans les mangroves de Wallis. L'espèce la plus commune, [*Rhizophora samoensis*](https://inpn.mnhn.fr/espece/cd_nom/672293), présente des racines en échasses tandis que la seconde espèce, [*Bruguiera gymnorhiza*](https://inpn.mnhn.fr/espece/cd_nom/809530\n), possède des racines coudées émergeant du sol, appelées pneumatophores. L'écorce sombre de cette dernière, riche en tanins, est utilisée en artisanat pour teindre les tissus.  \n\nStatut sur la liste rouge mondiale : \n*Rhizophora samoensis* : quasi-menacée.\n*Bruguiera gymnorhiza* : préoccupation mineure.\n\nNoms locaux : *Bruguiera gymnorhiza* : togo, tongo (futunien, wallisien)\n	\N	\N	\N	f
67009	1042	TEXT	body.bodyElements.0.questionAnswer.question	Pouvez-vous nous présenter l’association et ses différentes missions ? 	\N	\N	\N	f
67010	1042	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
67011	1042	IMAGE	body.bodyElements.4.image.imageElement	\N	2247	Carapace de tortue verte femelle braconnée sur la plage de Papani © *Oulanga Na Nyamba*	\N	f
67012	1042	TEXT	body.bodyElements.12.paragraph.paragraphText	Ensuite, il y a un certain nombre de consignes à respecter pour **ne pas déranger les tortues lorsqu’on les observe, dans l’eau ou sur la plage**. Nous avons travaillé avec l’ensemble des partenaires sur [un dépliant](https://www.parc-marin-mayotte.fr/documentation/consignes-dobservation-des-tortues-marines), édité par le Parc naturel marin de Mayotte, qui explique tous les bons gestes à respecter. Nous organisons des sorties de nuit d’observation de ponte responsable, en respectant toutes les consignes qui empêchent le dérangement, toujours dans l’idée de sensibiliser le public et valoriser la tortue marine autrement. \nLa ponte a lieu la nuit, **il ne faut surtout pas déranger les tortues en ponte avec de la lumière**. Après l’éclosion des œufs, quand les bébés tortue sortent sur le sable, souvent les gens ont envie de les aider, de les mettre à l’eau, mais il ne faut surtout pas intervenir car ce parcours vers la mer est nécessaire à leur survie. Lorsqu’on croise une tortue dans l’eau, en snorkeling par exemple, il ne faut pas trop s’approcher, ne pas déranger l’animal dans son comportement et ses besoins vitaux.\n	\N	\N	\N	f
67013	1042	TEXT	body.bodyElements.9.paragraph.paragraphText	Il y aura une partie consacrée **au soin aux animaux en détresse**, qui nous permettra aussi de faire des suivis scientifiques pour avoir des informations sur les causes de leur détresse, les maladies... On pourra par exemple poser des balises sur les tortues relâchées pour avoir des informations sur leur écologie.  \n  \nNous allons également créer **une Maison de la Tortue**, un espace dédié à la sensibilisation des visiteurs, **ce sera la seule structure d’accueil dédiée à l’environnement marin à Mayotte et on sait déjà qu’on aura de la demande**. On espère modifier la tendance et que les personnes qui exploitent actuellement illégalement les tortues pour leur chair prennent conscience que c’est un meilleur moyen, plus durable, de valoriser la tortue.  \n  \nLes travaux doivent débuter cette année mais les restrictions et la crise des matériaux dues au covid vont sûrement nous impacter. Dans le meilleur des cas nous espérons une ouverture en fin d’année 2022.	\N	\N	\N	f
67014	1042	TEXT	body.bodyElements.15.questionAnswer.question	Est-il possible d’être bénévole à *Oulanga Na Nyamba* ? 	\N	\N	\N	f
67015	1042	TEXT	interviewee.presentation	Jeanne Wagner, directrice de l'association *Oulanga Na Nyamba*	\N	\N	\N	f
67016	1042	TEXT	body.bodyElements.6.questionAnswer.response	**Ici, il faut réussir à s’adapter à un contexte très instable**. Le covid par exemple pour nous, c’est une problématique parmi d’autres. On fait remonter les problématiques, localement et à l'échelle nationale, mais les priorités ne sont pas les mêmes pour tout le monde, et tout le monde manque de moyens.  \n  \nLe contexte de l’insécurité est très compliqué, on est souvent freiné au niveau des déplacements et de nos actions. Par exemple lorsque nos équipes signalent un braconnage, on ne peut pas être certain que la gendarmerie va pouvoir intervenir car il y a d’autres problèmes en cours et ils ne sont pas assez nombreux. **Ce type d’actions devient de plus en plus dangereux pour nous**.  \n\nLes problèmes de biodiversité à Mayotte sont encore peu connus en métropole et difficilement pris en compte, mais on essaye de faire remonter les problématiques en restant pédagogiques et diplomates. Même si l’État et le département nous appuient et nous financent, sur le terrain concrètement, ça manque de moyen.  \n  \n**On manque aussi d’expertise sur place, par exemple au niveau de la construction du centre de soin pour les tortues marines**. C’est beaucoup moins facile de le construire ici à Mayotte qu’en métropole, on n'a pas forcément l’expertise sur place par rapport aux pompes et aux bassins. Il va falloir les importer, est-ce qu’on aura les compétences pour bien les installer et les entretenir ? Il faut qu’on soit le plus autonomes possibles. Mais on a l’habitude, ça fait partie du quotidien.\n	\N	\N	\N	f
67017	1042	IMAGE	body.bodyElements.8.image.imageElement	\N	2248	Maquette 3D du futur centre de soin © *Oulanga Na Nyamba*	\N	f
67018	1042	TEXT	presentation.name	Protéger les tortues de Mayotte avec l'association *Oulanga Na Nyamba*	\N	\N	\N	f
67019	1042	TEXT	presentation.author	Doriane Blottière	\N	\N	\N	f
67020	1042	TEXT	body.bodyElements.7.questionAnswer.question	La *Kaz'a Nyamba*, centre de soin et de découverte des tortues marines, est le projet pour lequel vous avez été lauréat de l’appel à projet MobBiodiv’ 2020 de l’Office français pour la biodiversité. Pouvez-vous nous en dire plus ? 	\N	\N	\N	f
67021	1042	TEXT	body.bodyElements.5.paragraph.paragraphText	Nous avons aussi un axe de travail « connaissances » : on fait des suivis de tortues en alimentation ou en reproduction, **on participe à des projets de recherches pour tous ceux qui ont besoin de relais local, car à Mayotte nous n’avons pas d’institut de recherche** donc les chercheurs extérieurs ont besoin d’appuis locaux pour mener à bien leurs travaux.  \n   \nNous essayons de collaborer avec le plus d’acteurs possibles et de les faire s’intéresser à la problématique, de mobiliser tout le monde pour trouver des solutions. Nous travaillons aussi avec les autres acteurs de la protection des tortues à Mayotte pour mieux fédérer nos moyens, et **nous nous investissons dans des projets sociaux-culturels ou éducatifs, qu'on utilise pour transmettre nos messages**, car une association écologiste environnementale pure et dure ne marcherai pas dans le contexte assez spécifique de Mayotte.\n	\N	\N	\N	f
67022	1042	TEXT	presentation.date	01/09/2021	\N	\N	\N	f
67023	1042	TEXT	body.bodyElements.10.questionAnswer.question	Comment les gens peuvent-ils agir concrètement à Mayotte pour protéger les tortues ? 	\N	\N	\N	f
67024	1042	IMAGE	body.bodyElements.1.image.imageElement	\N	2244	Formation d'ambassadeurs de l'environnement © *Oulanga Na Nyamba*	\N	f
68232	1041	TEXT	events.4.description	Premier débarquement de l’expédition de Marc-Joseph Marion du Fresne sur l’île de la Possession (Crozet) 	\N	\N	\N	f
68233	1041	TEXT	events.5.description	Découverte de Kerguelen par le navigateur français Yves Joseph Kerguelen de Trémarec	\N	\N	\N	f
68234	1041	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
68235	1041	TEXT	interests.locations.2.name	Les îles Saint-Paul et Amsterdam	\N	\N	\N	f
68236	1041	TEXT	events.0.date	-40 millions d’années	\N	\N	\N	f
67025	1042	TEXT	body.bodyElements.15.questionAnswer.response	**Notre association est très ouverte aux bénévoles !** Malgré le nombre de salariés qui augmente, on fonctionne avec beaucoup de bénévoles locaux. Nous avons aussi souvent des stagiaires. On préfère que les gens viennent pour de longues périodes pour s’adapter au contexte et être formés. Ça peut être sur l’ensemble des missions : suivis, actions de présence sur les plages, sensibilisation. Aujourd’hui nous avons un réseau d’une bonne trentaine de bénévoles qui sont présents tous les jours, et de nombreux adhérents qui participent aux sorties ou qui sont sympathisants. **Il y a une bonne cohésion et une bonne entente entre les bénévoles et les salariés. On est preneurs de toute aide !**	\N	\N	\N	f
67026	1042	TEXT	body.bodyElements.17.paragraph.paragraphText	**Retrouvez plus d’informations sur [le site de l’association](https://oulangananyamba.com/) et suivez les actualités sur le Facebook d'[*Oulanga Na Nyamba*](https://www.facebook.com/OulangaNaNyamba976). Contact : [contact@oulangananyamba.com](contact@oulangananyamba.com)**	\N	\N	\N	f
67027	1042	TEXT	body.bodyElements.3.paragraph.paragraphText	**Le deuxième axe de travail, c’est la protection**. La plus grande problématique pour les tortues marines à Mayotte, c’est le braconnage. Une femelle sur dix qui vient pondre est braconnée, c'est énorme et pas du tout soutenable pour les populations de tortues ! La vente de chair de tortue est très lucrative. **C’est une vision à court terme pour ceux qui braconnent**, ils ne regardent pas les conséquences alors qu'il n'y aura peut-être plus de tortues pour leurs enfants.  \n  \nNous avons une grande équipe avec notamment des services civiques qui sont présents sur les différentes plages où il y a le plus de braconnage. Leur présence peut dissuader les braconniers et ils peuvent alerter la gendarmerie. **Et comme nous sommes une association agrée protection de l’environnement, nous pouvons porter plainte et on se constitue partie civile au tribunal pour tous les cas de braconnage**.	\N	\N	\N	f
67028	1042	TEXT	body.bodyElements.6.questionAnswer.question	Quelles sont les principales difficultés que vous rencontrez dans vos actions ? 	\N	\N	\N	f
67029	1042	TEXT	body.bodyElements.11.citation.citationElement	Quand les bébés tortue sortent sur le sable, souvent les gens ont envie de les aider, de les mettre à l’eau, mais il ne faut surtout pas intervenir car ce parcours vers la mer est nécessaire à leur survie.	\N	\N	\N	f
67030	1042	TEXT	body.bodyElements.0.questionAnswer.response	*Oulanga Na Nyamba* existe **depuis plus de 20 ans**, c'est une association localement très ancrée, nous travaillons avec beaucoup de partenaires, qui nous font confiance, et on sent que nos projets sont pris au sérieux. Il y a eu une belle évolution ces dernières années : nous sommes passés d’une salariée en 2018 à 8 salariés en 2021.  \n<br>\nNous avons plusieurs axes de travail : **le premier c’est la sensibilisation au sujet de l’environnement et des tortues marines**. On essaye de faire des animations adaptées aux publics partout où on le peut, notamment auprès des jeunes, des scolaires. Nous faisons aussi des formations auprès d’acteurs locaux, aussi bien dans des petites associations que pour les communes par exemple. On forme des ambassadeurs pour avoir des relais qui nous permettent de diffuser les informations encore plus loin. 	\N	\N	\N	f
67031	1042	TEXT	body.bodyElements.10.questionAnswer.response	Déjà, **ne pas manger de tortue et ne pas braconner**. On a fait des enquêtes à ce sujet, même si c’est aussi pour le goût, **c’est surtout sous l’influence de la société et des amis que la viande est consommée**. 	\N	\N	\N	f
68237	1041	TEXT	identity.populationYear	-	\N	\N	\N	f
67032	1042	IMAGE	presentation.image	\N	2246	Tortue verte juvénile dans la Vasière des Badamiers à Mayotte © François-Elie Paute, *Oulanga Na Nyamba*	\N	f
67033	1042	TEXT	body.bodyElements.14.paragraph.paragraphText	Il faut aussi bien **gérer ses déchets et ne pas polluer, ne pas abimer les habitats**. La plus grosse partie des impacts sur le milieu marin, c’est au niveau terrestre qu’on peut les résoudre. **Le défrichement provoque l’envasement du lagon et les constructions en bord de plage engendrent de la pollution lumineuse ou sont destructeurs d’habitats de tortue**. Les touristes peuvent choisir des logements écotouristiques, pour avoir un impact positif. Nous organisons aussi pas mal d’évènement de nettoyage par rapport à la lutte contre les pollutions.	\N	\N	\N	f
67034	1042	IMAGE	body.bodyElements.16.image.imageElement	\N	2245	Membres de l'association © *Oulanga Na Nyamba*	\N	f
67035	1042	TEXT	body.bodyElements.2.citation.citationElement	La plus grande problématique pour les tortues marines à Mayotte, c’est le braconnage. Une femelle sur dix qui vient pondre est braconnée, c'est énorme et pas du tout soutenable pour les populations de tortues ! 	\N	\N	\N	f
67036	1042	TEXT	body.bodyElements.13.citation.citationElement	La plus grosse partie des impacts sur le milieu marin, c’est au niveau terrestre qu’on peut les résoudre. 	\N	\N	\N	f
67037	1042	IMAGE	interviewee.photo	\N	2243	logo Oulanga Na Nyamba	\N	f
67038	1042	TEXT	body.introduction	En shimaoré, *Oulanga Na Nyamba* signifie «&nbsp;Environnement et Tortues&nbsp;». L'association œuvre depuis 1998 pour la préservation de la biodiversité mahoraise, en particulier des tortues marines et de leurs habitats.  \n  \nÀ Mayotte, la Tortue verte et la Tortue imbriquée se reproduisent et s’alimentent, et d’autres espèces sont observées occasionnellement. Toutes les tortues marines sont menacées d’extinction.  \n   \nRencontre avec Jeanne Wagner, la directrice de l'association. \n	\N	\N	\N	f
67039	1042	TEXT	body.bodyElements.7.questionAnswer.response	On travaille dessus depuis 2015, **c’est un projet multi-partenarial, attendu par tous les acteurs de l’environnement, du tourisme et par les élus qui nous appuient**. C’est un projet très attractif et aussi très utile pour les tortues.	\N	\N	\N	f
70214	1049	TEXT	body.photos.0.description	« Ces deux raies pastenagues nagent dans les eaux claires du lagon de la Grande Glorieuse. Le sable blanc y est extrêmement fin. Le cœur de l’île est principalement composé d’une très belle cocoteraie qui cache un étang d’eau saumâtre où l’on prévient le (rare) visiteur, par un panneau à tête de mort, des risques liés aux sables mouvants qui s’y trouveraient. »	\N	\N	\N	f
68238	1041	IMAGE	species.5.image	\N	1723	*Azorella selago* © Julie Tucoulet	\N	f
68239	1041	TEXT	statistics.0.text	d'oiseaux marins	\N	\N	\N	f
68240	1041	IMAGE	species.1.image	\N	1721	*Diomedea exulans* © Julie Tucoulet	\N	f
68923	1004	TEXT	understand.text1	Une espèce exotique envahissante est une espèce introduite par l’Homme hors de son territoire d’origine et qui présente ensuite, sur son territoire d’introduction, une dispersion et un développement importants, engendrant des impacts environnementaux mais aussi sociaux et économiques. Ces introductions sont parfois volontaires (pour l’agriculture, l’ornementation, comme animaux de compagnie, etc.) ou involontaires (organismes présents dans les marchandises échangées internationalement, dans les eaux de ballast des bateaux, etc.).\n\nDe nombreuses espèces n’arrivent pas à s’adapter ou se reproduire dans leurs territoires d’introduction, cependant certaines trouvent des conditions favorables à leur développement et prolifèrent, profitant notamment de l’absence de leurs prédateurs ou parasites naturels. 	\N	\N	\N	f
68241	1041	TEXT	events.2.date	-100 000 ans	\N	\N	\N	f
68242	1041	TEXT	events.5.date	12 février 1772	\N	\N	\N	f
68243	1041	TEXT	identity.marineArea	1 655 098 	\N	\N	\N	f
68244	1041	TEXT	species.9.name	*Anatalanta aptera*	\N	\N	\N	f
68245	1041	TEXT	events.8.date	2019	\N	\N	\N	f
68924	1004	TEXT	territories.title	Nombre d'espèces présentes sur la liste des 100 espèces exotiques les plus envahissantes au monde 	\N	\N	\N	f
68925	1004	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
64231	1031	TEXT	species.8.description	Le faux-tabac ([*Heliotropium foertherianum*](https://inpn.mnhn.fr/espece/cd_nom/446830\n)) est un petit arbre indigène, présent dans de nombreuses îles du Pacifique sud, très commun en forêt littorale. Ses feuilles sont utilisées en médecine traditionnelle pour traiter les effets de la ciguatera, intoxication alimentaire induite par la consommation de poissons contaminés par une toxine produite par des micro-algues.  \n  \nStatut sur la Liste rouge mondiale : préoccupation mineure.\n\nNoms locaux : tauhuni, sinu (futunien)\n	\N	\N	\N	f
64232	1031	IMAGE	species.2.image	\N	2336	*Cheilinus undulatus* © Matthieu Junker	\N	f
64233	1031	IMAGE	ecosystems.ecosystems.4.image	\N	2347	Plongeur étudiant les herbiers sous-marins © Sandrine Job	\N	f
70215	1049	TEXT	body.photos.6.description	« Originaire de Madagascar et des îles voisines, l’Araignée néphile dorée ([*Trichonephila inaurata*](https://inpn.mnhn.fr/espece/cd_nom/963153)) doit son nom à ses fils de soie de couleur dorée. Présente également à La Réunion, elle y est appelée localement « Bibe ». Malgré sa taille impressionnante (10 cm d’envergure), elle est inoffensive. »	\N	\N	\N	f
68581	1038	TEXT	interests.locations.2.description	Créée en 1995, la [Réserve naturelle nationale des Nouragues](http://www.nouragues.fr/) protège 105 800 hectares de forêt, un réseau hydrographique dense avec une grande diversité d’habitats (criques, rivières, sauts rocheux) et des inselbergs. Elle porte le nom des amérindiens qui vivaient dans cette zone jusqu’au 18<sup>e</sup> siècle. La réserve accueille une station de recherche scientifique gérée par le CNRS, qui permet l’étude des écosystèmes de forêts tropicales à long terme. 	\N	\N	\N	f
68582	1038	TEXT	events.12.description	Création de la réserve naturelle nationale du Mont Grand Matoury	\N	\N	\N	f
68583	1038	TEXT	interests.locations.1.description	A 15 km au large de l’estuaire de l’Approuague, les îles du Grand et du Petit Connétable sont le seul site de reproduction pour les oiseaux marins de la côte amazonienne. Le site accueille chaque année plusieurs dizaines de milliers d’individus qui viennent y nidifier : sternes (dont 1/3 des effectifs mondiaux de la [Sterne de Cayenne](https://inpn.mnhn.fr/espece/cd_nom/626905)), frégates superbes, mouettes atricilles et noddis bruns. Le site est classé Réserve naturelle nationale depuis 1992. Le périmètre de la réserve s’étend sur plus de 7&nbsp;000 ha marins autour des îles, permettant la conservation d’espèces marines menacées comme le [Mérou géant](https://inpn.mnhn.fr/espece/cd_nom/419226).	\N	\N	\N	f
68926	1004	TEXT	visual.subtitle	Quelques exemples parmi les espèces introduites les plus impactantes pour la biodiversité indigène.	\N	\N	\N	f
68927	1004	TEXT	understand.title1	Des espèces introduites par l'Homme	\N	\N	\N	f
68928	1004	TEXT	understand.paragraphs.1.text	Des processus de biosécurité (désinfection, inspections minutieuses, utilisation de chiens formés à la détection, etc.) sont mis en œuvre par les territoires afin de limiter les risques d’entrée de nouvelles espèces exotiques. Pour les espèces déjà installées, de nombreuses interventions sont réalisées pour tenter de limiter leur propagation et atténuer leurs impacts, voire dans certains cas de les éradiquer pour préserver l'équilibre des écosystèmes et sauvegarder des espèces endémiques menacées. \n  \nLe Comité français de l'Union internationale pour la conservation de la nature anime depuis 2005 le [Réseau Espèces exotiques envahissantes en outre-mer](https://especes-envahissantes-outremer.fr/) afin de favoriser les échanges et le partage d'expériences entre les gestionnaires des différents territoires.	\N	\N	\N	f
68929	1004	TEXT	understand.title2	Une des principales causes d'érosion de la biodiversité dans les îles	\N	\N	\N	f
68930	1004	TEXT	presentation.descriptionTerritories	espèces sur les 100 considérées comme les plus envahissantes au monde sont présentes sur le territoire	\N	\N	\N	f
68931	1004	TEXT	understand.paragraphs.0.title	Une liste mondiale des espèces les plus problématiques	\N	\N	\N	f
68584	1038	TEXT	ecosystems.ecosystems.3.name	Les savanes	\N	\N	\N	f
68585	1038	TEXT	identity.subtitle	Une diversité biologique exceptionnelle	\N	\N	\N	f
68586	1038	IMAGE	species.7.image	\N	2409	*Ceiba pentandra* © Jean-Christophe Marsy	\N	f
68587	1038	TEXT	species.5.name	La Tortue Luth	\N	\N	\N	f
68588	1038	TEXT	risks.risks.0.description	La richesse des écosystèmes de Guyane est impressionnante, aussi bien en vertébrés qu’en invertébrés, et surtout en végétaux. La diversité floristique a une répartition assez hétérogène : un petit nombre d’espèces est représenté par un grand nombre d’individus alors qu’un grand nombre d’espèces n’est représenté que par quelques individus. Relativement peu d’espèces sont endémiques strictes du territoire, la plupart se retrouvent également sur le reste du plateau des Guyanes. On peut cependant noter un endémisme important au niveau des poissons d’eau douce (35 à 40 % des espèces) dont la répartition peut parfois être très limitée.  \n\nIl n’y a pas de récifs coralliens dans les eaux de Guyane, les côtes sont instables en raison des apports de sédiments de l’Amazone qui forment des bancs de vase se déplaçant de 900 m environ par an, colonisés par la mangrove. Cependant, bien que sans originalité, les eaux guyanaises sont riches en poissons et abritent plusieurs espèces de requins dont le requin Pèlerin et le Grand requin marteau, ainsi qu’une vingtaine d’espèces de cétacés. \n\nLa Guyane est peu densément peuplée, et la majorité de la population se concentre sur la bordure atlantique. Bien que la forêt reste peu impactée, notamment au regard des pays voisins (Brésil), de nouvelles routes ouvrent des accès à des zones autrefois préservées. L’augmentation rapide de la démographie et les nouveaux aménagements qui l’accompagnent sont l’une des causes majeures de dégradation des milieux, en particulier sur le littoral.  \n\nL’espace maritime guyanais reste peu exploré. La pêche illégale pratiquée par les pêcheurs venus du Suriname et du Brésil impacte les stocks de poissons guyanais et les filets utilisés sont une cause de mortalité importante pour les tortues et les mammifères marins. \n\nLa règlementation du Code de l’environnement concernant la chasse ne s’applique pas en Guyane. Le permis de chasser n’est obligatoire que depuis janvier 2020. Le braconnage et le non-respect des règles de chasse (quotas, espèces chassables mais non commercialisables, périodes de chasse) sont des infractions régulièrement observées qui impactent la survie des espèces menacées. \n \nConstruit en 1994 sur le Sinnamary pour combler les besoins en électricité de la population guyanaise, le barrage de Petit Saut a eu un fort impact sur l’équilibre écologique de la région. La retenue d’eau de 365 km<sup>2</sup> ainsi créée a inondé brutalement la forêt, et la dégradation progressive de la matière organique immergée provoque des rejets de gaz (dioxyde de carbone, méthane, sulfure d’hydrogène) et une anoxie de l’eau, néfaste aux organismes aquatiques. Ces paramètres sont encore étudiés aujourd’hui afin de suivre l’impact de la construction du barrage à long terme.\n	\N	\N	\N	f
68589	1038	TEXT	ecosystems.ecosystems.2.description	Les mangroves sont des forêts localisées le long du littoral et des estuaires, dans la zone de balancement des marées. Elles sont formées principalement de palétuviers, des arbres aux racines en échasses, qui s’accommodent des conditions de vie en eaux saumâtres et dans des sols pauvres en oxygène. À l’interface entre le milieu marin et le milieu terrestre,\nelles ont un rôle très important pour la biodiversité et accueillent de nombreuses espèces de poissons, crustacés et oiseaux et ont un rôle de nurserie pour la faune marine. \nEn Guyane, les mangroves du littoral sont mobiles : elles se développent sur les bancs de vase issus de l’Amazone, qui se déplacent d’est en ouest suivant le courant équatorial.\n	\N	\N	\N	f
64234	1031	TEXT	species.3.description	La Roussette du Pacifique ([*Pteropus tonganus*](https://inpn.mnhn.fr/espece/cd_nom/459607)) est une espèce de chauve-souris commune sur les trois îles. Elle joue un rôle clef dans la dissémination des gros fruits charnus de végétaux indigènes et donc dans la dynamique forestière. Si l’espèce n’est pas considérée comme menacée dans l'archipel, la pression de chasse sur les roussettes peut être importante. \n  \nStatut sur la Liste rouge mondiale : préoccupation mineure. 	\N	\N	\N	f
64235	1031	TEXT	species.1.description	L’archipel compterait environ une quinzaine de reptiles indigènes, en majorité des lézards, mais un serpent indigène, le Boa du Pacifique ([*Candoia bibroni*](https://inpn.mnhn.fr/espece/cd_nom/456357)), est présent sur Alofi.  \n  \nStatut sur la Liste rouge mondiale : préoccupation mineure	\N	\N	\N	f
64236	1031	TEXT	species.2.description	648 espèces de poissons récifaux et lagonaires sont inventoriés dans les eaux de Wallis, dont le Napoléon ([*Cheilinus undulatus*](https://inpn.mnhn.fr/espece/cd_nom/423718*)). C'est l’un des plus grands poissons osseux des récifs coralliens, il peut atteindre plus de 2 m de long. L’espèce présente un hermaphrodisme successif appelée « protogynie » : les individus sont d’abord des femelles puis deviennent des mâles au cours de leur vie (autour de 15 ans selon les estimations). Le mâle est reconnaissable à sa bosse sur le front. Le Napoléon est le seul poisson marin figurant sur la liste des espèces protégées de Wallis-et-Futuna.  \n  \nStatut sur la Liste rouge mondiale : en danger.	\N	\N	\N	f
68932	1004	TEXT	understand.keyword	Espèces	\N	\N	\N	f
68933	1004	TEXT	ecogestures.title	Que puis-je faire pour éviter l’introduction et la dispersion d’espèces exotiques envahissantes ? 	\N	\N	\N	f
68934	1004	IMAGE	presentation.image	\N	1293	Poisson-lion (*Pterois volitans*) © Fabien Lefebvre - Association ACWAA	\N	f
68935	1004	TEXT	understand.paragraphs.1.title	De la prévention aux actions de gestion	\N	\N	\N	f
64237	1031	TEXT	species.9.description	Le mûrier à papier, ([*Broussonetia papyrifera*](https://inpn.mnhn.fr/espece/cd_nom/86817)), est un arbuste originaire d'Asie du Sud-Est introduit dans de nombreuses îles du Pacifique. Son écorce est utilisé dans la fabrication du traditionnel *tapa*, une étoffe végétale peinte avec des encres issues de matières naturelles, généralement de grande taille (plusieurs mètres) et dont les usages sont variés (habits traditionnels, cérémonies coutumières). \n  \nStatut sur la Liste rouge mondiale : préoccupation mineure.\n  \nNoms locaux : tutu, lafi	\N	\N	\N	f
64238	1031	TEXT	statistics.1.number	230 km	\N	\N	\N	f
64239	1031	TEXT	statistics.0.number	19	\N	\N	\N	f
64240	1031	TEXT	statistics.2.number	369	\N	\N	\N	f
64241	1031	TEXT	species.2.name	Le Napoléon	\N	\N	\N	f
64242	1031	TEXT	risks.risks.1.name	La menace des espèces exotiques envahissantes	\N	\N	\N	f
64243	1031	TEXT	species.4.description	Quatre espèces de gobies d’eau douce endémiques de Futuna ont été récemment découvertes et décrites :[*Stenogobius keletaona*](https://inpn.mnhn.fr/espece/cd_nom/641370\n), [*Smilosicyopus sasali*](https://inpn.mnhn.fr/espece/cd_nom/655131), [*Akihito futuna*](https://inpn.mnhn.fr/espece/cd_nom/641365\n) et [*Stiphodon rubromaculatus*](https://inpn.mnhn.fr/espece/cd_nom/641369\n). Ces petits poissons vivent principalement au fond des cours d’eau où ils se collent au substrat grâce à leurs nageoires pelviennes leur servant de ventouse. Chaque espèce ne se retrouve que dans une ou deux rivières de Futuna.  \n  \nStatut sur la Liste rouge mondiale : \n*Stenogobius keletaona* : vulnérable.\n*Smilosicyopus sasali* : en danger.\n*Akihito futuna* : en danger critique.\n*Stiphodon rubromaculatus* : en danger critique.	\N	\N	\N	f
64244	1031	TEXT	zoom.callToAction	Cliquez sur la carte thématique pour vous repérer en un coup d'œil !	\N	\N	\N	f
64245	1031	TEXT	ecosystems.ecosystems.0.name	La forêt humide	\N	\N	\N	f
64246	1031	TEXT	species.5.description	Le Suka ([*Cyrtandra futunae*](https://inpn.mnhn.fr/espece/cd_nom/821352\n)) est l’une des 7 espèces végétales endémiques de l’archipel. Arbuste de sous-bois et de lisière de forêts humides, il présente des grandes feuilles simples à marge denticulées et de nombreuses petites fleurs blanches. Considéré comme peu commun à Futuna et rare à Alofi, il n’est pas présent à Wallis. \n \nStatut sur la liste rouge mondiale : non évalué.\n	\N	\N	\N	f
64247	1031	TEXT	species.6.description	Ce terme peut désigner deux espèces d'arbres du genre Aglaia : [*A. samoaensis*](https://inpn.mnhn.fr/espece/cd_nom/889358\n) et [*A. saltatorum*](https://inpn.mnhn.fr/espece/cd_nom/822659\n). Leurs fleurs sont utilisées traditionnellement pour réaliser des colliers et parfumer l’huile de coco. Leur écorce est également utilisée dans la médecine traditionnelle. *A. samoaensis*, indigène, est présente sur les trois îles bien que rare, tandis que *A. saltatorum* a probablement été introduite sur Futuna et Wallis, où elle est commune car cultivée. \n\nStatut sur la Liste rouge mondiale : \n*A. samoaensis* : quasi menacé \n*A. saltatorum* : vulnérable  \n  \nNoms locaux : *A. samoaensis* : langakali (wallisien, futunien) ; *A. saltatorum* : langakali uto, uto (futunien), polo uto (wallisien). 	\N	\N	\N	f
64248	1031	CHECKBOX	identity.shadowed	true	\N	\N	\N	f
64249	1031	TEXT	events.0.date	-22 millions d'années	\N	\N	\N	f
64250	1031	TEXT	identity.populationYear	2018	\N	\N	\N	f
68936	1004	IMAGE	visual.image	\N	2556	Espèces exotiques envahissantes outre-mer	\N	f
68937	1004	TEXT	visual.title	Les espèces exotiques envahissantes en outre-mer	\N	\N	\N	f
68938	1004	LINK	understand.article	aucun	\N	\N	aucun	f
69246	1015	TEXT	species.0.description	Le Matoutou Falaise ([*Caribena versicolor*](https://inpn.mnhn.fr/espece/cd_nom/845739\n)) est une mygale arboricole endémique de la Martinique. D’une envergure totale pouvant aller jusqu’à 15 cm, elle se caractérise par ses couleurs : abdomen rouge vif, pattes roses violacées et thorax bleuté. Prédatrice nocturne, elle se nourrit principalement d'insectes et est inoffensive pour les humains. Longtemps prélevée par les terrariophiles, l’espèce est protégée depuis 2017 au niveau national et sa détention est illicite.  \n  \nStatut dans la Liste rouge mondiale : non évalué. 	\N	\N	\N	f
69247	1015	TEXT	identity.highestPointName	Montagne Pelée	\N	\N	\N	f
69248	1015	TEXT	ecosystems.ecosystems.2.name	Les mangroves	\N	\N	\N	f
69523	1019	TEXT	presentation.title	Faire progresser ensemble les connaissances	\N	\N	\N	f
69524	1019	TEXT	examples.projects.2.subject	Espèces marines	\N	\N	\N	f
69525	1019	TEXT	examples.title	Quelques exemples de programmes participatifs	\N	\N	\N	f
69526	1019	TEXT	examples.projects.0.title	La photo-identification des tortues marines à La Réunion	\N	\N	\N	f
69527	1019	TEXT	examples.projects.0.subject	Suivi individuel des tortues marines	\N	\N	\N	f
69528	1019	LINK	examples.projects.3.more	En savoir plus	\N	\N	https://www.facebook.com/paladalik/	f
69529	1019	TEXT	examples.projects.4.subject	Insectes lumineux	\N	\N	\N	f
68590	1038	TEXT	ecosystems.ecosystems.1.description	De l’allemand « *insel* » : île et « *berg* » : montagne, ces sommets granitiques dénudés émergeant de la forêt amazonienne sont aussi appelés « savane-roches ». La roche nue est colonisée par des cyanobactéries, algues bleues microscopiques, qui vont par la suite permettre l’installation des plantes vasculaires. On trouve sur les inselbergs de nombreuses espèces végétales caractéristiques dites lithophytes, adaptées aux conditions drastiques de sécheresse et fort ensoleillement, relictuelles des périodes de climat plus sec dans le bassin amazonien. En raison de leur isolement, certains inselbergs abritent des espèces endémiques. On compte environ 200 inselbergs en Guyane, en majorité dans le sud, le plus haut culminant à 740&nbsp;m.  	\N	\N	\N	f
69530	1019	TEXT	examples.projects.3.title	Le Réseau d’observation des récifs coralliens (RORC) de Nouvelle-Calédonie	\N	\N	\N	f
69531	1019	TEXT	examples.projects.1.actor	Groupe d’étude et de protection des oiseaux de Guyane (GEPOG)	\N	\N	\N	f
69532	1019	IMAGE	examples.projects.1.image	\N	2586	Conure cuivré, Guyane © Raphael Gailhac - OFB	\N	f
69533	1019	IMAGE	images.2.image	\N	2585	Sensibilisation à la biodiversité des récifs de Mayotte © Fanny Cautain - OFB	\N	f
69534	1019	IMAGE	examples.projects.4.image	\N	2580	*Aspisoma ignitum* © Julien Touroult - INPN 	\N	f
69535	1019	TEXT	paragraphs.0.text	Certains programmes se basent sur l’application d’un **protocole précis** (durée d’observation, distance couverte, nombre de points d’écoute, etc.). Ils nécessitent souvent une formation à la méthode et une implication sérieuse et régulière, car la qualité des données récoltées dépend de la bonne mise en œuvre du protocole. C’est le cas par exemple du Suivi temporel des oiseaux communs (STOC).\n\nD’autres programmes proposent de **faire remonter les observations ponctuelles ciblant une ou plusieurs espèces spécifiques**, parfois à une période précise ou sur un espace délimité. Par exemple les programmes de photo-identification de tortues ou de mammifères marins.\n\nLes signalements opportunistes permettent de faire remonter des observations occasionnelles, **comme des évènements inhabituels**, ou sur des espèces, une période ou un site non-ciblés. 	\N	\N	\N	f
64251	1031	IMAGE	species.5.image	\N	2351	*Cyrtandra futunae* © J-Y. H. Meyer, Délégation à la Recherche de la Polynésie française	\N	f
64252	1031	TEXT	statistics.0.text	îlots dans le lagon autour de Wallis	\N	\N	\N	f
64253	1031	TEXT	ecosystems.ecosystems.1.name	La lande à *toafa*	\N	\N	\N	f
64254	1031	TEXT	events.2.date	1300 - 900 avant JC	\N	\N	\N	f
64255	1031	TEXT	identity.presentation	A l’est de la Nouvelle-Calédonie, trois îles aux profils très différents composent le territoire français le plus éloigné de la métropole : l’archipel de Wallis-et-Futuna. L’île de Wallis, aussi appelée *'Uvea*, est entourée par un vaste lagon et des îlots coralliens et concentre les 2/3 de la population. A 230 km à l’ouest se trouvent les îles Horn séparées par un détroit : Futuna, au relief escarpé, et Alofi, quasiment non-habitée et encore largement recouverte de forêt primaire. La connaissance de la biodiversité de l’archipel est encore assez incomplète mais a beaucoup progressé ces dernières années.	\N	\N	\N	f
64256	1031	TEXT	identity.population	11 558	\N	\N	\N	f
64257	1031	TEXT	species.3.name	La Roussette du Pacifique 	\N	\N	\N	f
64258	1031	TEXT	risks.risks.2.name	Préserver la biodiversité de Wallis-et-Futuna	\N	\N	\N	f
64259	1031	IMAGE	species.8.image	\N	2343	*Heliotropium foertherianum* © J-Y. H. Meyer, Délégation à la Recherche de la Polynésie française	\N	f
64260	1031	TEXT	species.0.name	La Gallicolombe de Stair 	\N	\N	\N	f
64261	1031	TEXT	events.4.date	1961	\N	\N	\N	f
64262	1031	IMAGE	interests.locations.2.image	\N	2331	Lagon et îlots au nord de Wallis © Tristan Berr	\N	f
64263	1031	IMAGE	ecosystems.ecosystems.2.image	\N	2350	Mangrove à Faioa © Enelio Liufau	\N	f
64264	1031	TEXT	interests.locations.0.description	Le plus grand et le plus profond des cinq lacs de Wallis est issu de l’effondrement d’une ancienne caldeira. Il s’étend sur 400 m de diamètre et 80 m de profondeur et est entouré de parois verticales de plus de 30 m de hauteur. La forêt aux abords du lac, qui abrite de nombreux oiseaux et des roussettes, était autrefois protégée par un *Vao Tapu*, c’est-à-dire considérée comme taboue ou sacrée. 	\N	\N	\N	f
64265	1031	TEXT	risks.risks.2.description	L’archipel dispose d’un Code de l’environnement depuis 2007 et d’une Stratégie biodiversité depuis 2016. Le territoire ne compte pas d’aires protégées sur sens strict pour le moment, mais des réserves coutumières dites zones *Tapu* ont autrefois existé, par exemple au lac Lalolalo. Des volontés de créer des zones protégées existent, notamment concernant Alofi.\n  \nLe territoire de Wallis-et-Futuna participe au [programme PROTEGE](https://protege.spc.int/fr), projet de coopération régionale mis en œuvre par la Communauté du Pacifique (CPS) et le Programme régional océanien de l’environnement (PROE) pour une durée de 4 ans (2018-2022). Il vise à promouvoir le développement économique durable et résilient face aux changements climatiques des Pays et territoires d’outre-mer européens du Pacifique (PTOM) et concerne également la Nouvelle-Calédonie et la Polynésie française. Le programme s’articule autour de quatre volets : agriculture et foresterie, pêche côtière et aquaculture, eau et espèces envahissantes.\n	\N	\N	\N	f
64266	1031	TEXT	risks.risks.1.description	Au moins 416 espèces de plantes ont été introduites dans l'archipel, notamment comme ornementales dans les jardins. Parmi elles, plus de 150 sont considérées naturalisées, c’est-à-dire qu’elles se reproduisent sans intervention humaine, ce qui est beaucoup compte tenu de la petite taille du territoire. Les perturbations anthropiques ou naturelles (feux, déboisement, cyclone, etc.) peuvent faciliter leur installation et leur prolifération au détriment des plantes indigènes.  \n  \nLes lianes [*Merramia peltata*](https://inpn.mnhn.fr/espece/cd_nom/848283) et [*Mikania scandens*](https://inpn.mnhn.fr/espece/cd_nom/448111), ainsi que l’arbuste [*Clidemia hirta*](https://inpn.mnhn.fr/espece/cd_nom/912564), sont particulièrement envahissantes comme dans de nombreuses îles du Pacifique.\nAu niveau de la faune, rats, fourmis (dont la Petite fourmi de feu [*Wasmannia auropunctata*](https://inpn.mnhn.fr/espece/cd_nom/532927)), escargots et oiseaux introduits sont également problématiques, ainsi que les cochons, chats et chiens féraux qui peuvent avoir des impacts écologiques importants, en particulier sur les îlots de Wallis.	\N	\N	\N	f
69536	1019	TEXT	examples.projects.2.description	S’appuyer sur les observations de tous les usagers de la mer pour mieux comprendre le milieu marin mahorais, c’est l’objectif du programme TsiÔno, « J’ai vu » en shimaoré.  \nLe projet vise à préciser les inventaires des espèces et leur répartition, suivre les habitudes de certains individus pour 6 espèces cibles (dont la Baleine à bosse et le Dugong) et alerter sur la présence de phénomènes anormaux, comme la prolifération d’espèces envahissantes ou le blanchissement de coraux. Des supports pédagogiques permettent aux observateurs de s’exercer à la reconnaissance des espèces du lagon. 	\N	\N	\N	f
69537	1019	LINK	examples.projects.2.more	En savoir plus	\N	\N	https://www.tsiono.fr/ 	f
69538	1019	TEXT	examples.projects.0.description	Développé par Kelonia, l’observatoire des tortues marines de La Réunion, pour contribuer à la compréhension de la biologie des tortues marines, ce programme invite les plongeurs à envoyer photos et observations du comportement des individus rencontrées. L'identification de chaque tortue repose sur la configuration unique des écailles de sa tête.	\N	\N	\N	f
64267	1031	TEXT	interests.locations.2.description	Sur plus de 200 km<sup>2</sup> s’étend un ensemble varié et très riche de formations récifales et d’herbiers sous-marins, ainsi que 19 îlots boisés où se reproduisent des tortues marines et de nombreuses espèces d’oiseaux marins. La barrière récifale est interrompue par quatre passes : trois à l’ouest et une au sud. 	\N	\N	\N	f
64268	1031	TEXT	interests.locations.1.description	Au contraire de Wallis qui n’en possède aucune, le relief de Futuna est parcouru de plusieurs rivières qui abritent une faune d’eau douce dont plusieurs espèces de gobies endémiques, et sont pour le moment exemptes de poissons introduits.	\N	\N	\N	f
64269	1031	TEXT	ecosystems.ecosystems.3.name	Les récifs coralliens	\N	\N	\N	f
64270	1031	TEXT	identity.subtitle	Du lagon de Wallis aux forêts d'Alofi	\N	\N	\N	f
64271	1031	IMAGE	species.7.image	\N	2340	*Rhizophora samoensis* © J-Y. H. Meyer, Délégation à la Recherche de la Polynésie française	\N	f
64272	1031	TEXT	species.5.name	Le *Suka*	\N	\N	\N	f
64273	1031	TEXT	risks.risks.0.description	A Wallis, les milieux naturels ont été grandement modifiés par les activités humaines, en particulier les forêts qui sont très dégradées, remplacées par le *toafa*. Futuna et Alofi sont plus préservées et la biodiversité terrestre y est plus riche. A l’inverse, la biodiversité marine du vaste lagon de Wallis est plus importante que celles des récifs frangeants de Futuna. Cependant les connaissances sur la biodiversité de Wallis-et-Futuna sont encore largement lacunaires.\n  \nLa démographie n’est pas une contrainte sur l’archipel car la population est en baisse régulière depuis 2003, de nombreux jeunes wallisiens et futuniens émigrent, notamment vers la Nouvelle-Calédonie. Cependant, le traitement des eaux usées est l’un des enjeux majeurs : une pollution importante du lagon est observée, les eaux domestiques et d’élevage non traitées y sont directement rejetées.   \n  \nL’extraction de matériaux coralliens pour la construction et les remblais occasionnent également une dégradation du littoral et facilitent l’érosion du trait de côte. La pêche dans le lagon est une importante source de revenus et de nourriture pour les habitants de l’île. Si la pêche à la dynamite, technique destructrice utilisée par le passé, a été largement abandonnée, des pratiques comme la pêche au fusil de nuit ou pendant les périodes de frai contribuent à la fragilisation de la ressource. Des impacts lourds sont à noter en particulier sur les populations de perroquets à bosse ([*Bolbometopon muricatum*](https://inpn.mnhn.fr/espece/cd_nom/423493)). \nLes connaissances sur les poissons du large et des fonds marins sont encore très lacunaires.  \n  \nAlofi n’étant peuplée de manière permanente que par une seule personne, elle reste préservée bien que l’extension des défrichements pour les terres cultivables soit une menace à prendre en compte, ainsi que la présence de chiens domestiques. 	\N	\N	\N	f
64274	1031	TEXT	ecosystems.ecosystems.2.description	La mangrove est présente uniquement sur Wallis, essentiellement dans les petites anses vaseuses de la côte ouest où elle recouvre 36 hectares. Il s’agit d’une formation assez dense de 3-4m de hauteur environ, autour de deux espèces de palétuviers (*togo*), [*Bruguiera gymnorrhiza*](https://inpn.mnhn.fr/espece/cd_nom/809530\n) et [*Rhizophora samoensis*](https://inpn.mnhn.fr/espece/cd_nom/672293). Malgré la petite superficie des mangroves de Wallis, leurs bénéfices ne sont pas à négliger : limitation de l’érosion du littoral, atténuation des effets des cyclones (fréquents dans de l'archipel), stockage de carbone, filtre pour les eaux de ruissellement et habitat pour de nombreux organismes, dont les crabes de palétuviers, consommés par les habitants. 	\N	\N	\N	f
64275	1031	TEXT	ecosystems.ecosystems.1.description	Le mot *Toafa*, « désert » en wallisien, reflète la pauvreté floristique de cette lande due aux feux répétés, où se trouve principalement des fougères ([*Dicranopteris linearis*](https://inpn.mnhn.fr/espece/cd_nom/448035)).   \nPour restaurer ces habitats dégradés, des plantations de Pin des Caraïbes ([*Pinus caribaea*](https://inpn.mnhn.fr/espece/cd_nom/446369)), une espèce exotique, ont été mises en place dans les années 1970. Une recolonisation du sous-bois par les espèces indigènes est observée dans les pinèdes non entretenues. Les pins des Caraïbes apparaissent cependant moins résistants aux cyclones que les espèces indigènes.	\N	\N	\N	f
64276	1031	TEXT	ecosystems.ecosystems.0.description	Si la forêt dense occupait autrefois la quasi-totalité des îles, elle a aujourd’hui quasiment disparu de Wallis, hormis dans quelques zones peu accessibles. Elle est mieux conservée sur Futuna en raison du relief accidenté, bien que grignotée peu à peu par le défrichement pour les cultures. Sur Alofi, elle est encore relativement bien préservée, mais fait malgré tout l’objet d’exploitation par les agriculteurs de Futuna.	\N	\N	\N	f
64277	1031	TEXT	identity.highestPoint	524	\N	\N	\N	f
68939	1004	TEXT	understand.paragraphs.0.text	En 2007, l’Union internationale pour la conservation de la nature a publié [une liste de 100 espèces exotiques parmi les plus envahissantes du monde](https://portals.iucn.org/library/sites/library/files/documents/2000-126-Fr.pdf), c’est-à-dire celles avec le plus fort potentiel de dispersion et le plus lourd impact sur leur environnement d’accueil. On y trouve notamment le rat noir ([*Rattus rattus*](https://inpn.mnhn.fr/espece/cd_nom/61587)), introduit dans de nombreuses îles et responsable, entre autres, du déclin des populations de nombreuses espèces d’oiseau dans les outre-mer, ou encore le Miconia ([*Miconia calvescens*](https://inpn.mnhn.fr/espece/cd_nom/447324)), un arbre introduit à Tahiti en 1937 et aujourd’hui très répandu sur l’île où il remplace la végétation indigène. Ce dernier a également été introduit en Nouvelle-Calédonie et découvert récemment en Martinique et en Guadeloupe.  \n\nLes fourmis introduites sont également un important sujet de préoccupations. Plusieurs espèces fortement envahissantes se retrouvent dans les territoires d’outre-mer, telles que la Fourmi folle ([*Anoplolepsis gracilipes*](https://inpn.mnhn.fr/espece/cd_nom/264513)), la Fourmi à grosse-tête ([*Pheidole megacephala*](https://inpn.mnhn.fr/espece/cd_nom/219383)), la Fourmi électrique ([*Wasmannia auropuctata*](https://inpn.mnhn.fr/espece/cd_nom/532927)) ou encore la Fourmi de feu ([*Solenopsis invicta*](https://inpn.mnhn.fr/espece/cd_nom/532922)). Elles perturbent de nombreuses autres espèces (arthropodes, reptiles, oiseaux, mammifères), par leurs comportements agressifs et leurs modifications des habitats.	\N	\N	\N	f
68940	1004	IMAGE	understand.image	\N	1027	Miconia calvescens © Forest & Kim Starr / CC BY 3.0 	\N	f
68941	1004	TEXT	presentation.description	espèces sur les 100 considérées comme les plus envahissantes au monde se trouvent en outre-mer	\N	\N	\N	f
68942	1004	TEXT	presentation.logoUrl	https://naturefrance.fr/indicateurs/nombre-despeces-en-outremer-parmi-les-plus-envahissantes-au-monde	\N	\N	\N	f
69009	1009	SELECT	presentation.sourceSelect	inpn	\N	\N	\N	f
69010	1009	TEXT	understand.text2	Ce nombre comprend uniquement les espèces dites indigènes des territoires d'outre-mer, c’est-à-dire naturellement présentes sur les territoires. Il ne comprend pas les espèces introduites, volontairement ou involontairement, par les humains (animaux domestiques, plantes cultivées, etc.).\nCe nombre ne prend pas non plus en compte les espèces éteintes.	\N	\N	\N	f
69011	1009	TEXT	understand.text1	Dispersés au sein de trois océans, les territoires d’outre-mer français sont répartis de la zone équatoriale à la zone polaire. Cette diversité de situations géographiques est à l’origine de la très grande diversité biologique trouvée au sein de ces collectivités. De plus, le caractère insulaire de la plupart des territoires (la Guyane exceptée) explique le très haut taux d'[endémisme](/indicateurs/especes-endemiques) de la faune et de la flore. \n\nAinsi, la plupart des territoires ultramarins français sont situés dans des zones du globe mondialement reconnues comme étant particulièrement riches en espèces, appelées « points chauds » (*hotspots*). Le milieu marin d'outre-mer couvre également une superficie gigantesque : il représente plus de 3 % des mers et océans du monde, et compte 55 000 km<sup>2</sup> de récifs coralliens et lagons. \n\n\n	\N	\N	\N	f
69012	1009	TEXT	territories.title	Nombre d'espèces indigènes	\N	\N	\N	f
69013	1009	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
69014	1009	TEXT	visual.subtitle	Visualisez le nombre d'espèces décrites en outre-mer par groupe biologique	\N	\N	\N	f
69015	1009	TEXT	understand.title1	Un patrimoine biologique exceptionnel en outre-mer	\N	\N	\N	f
69539	1019	TEXT	examples.projects.4.description	Relai guadeloupéen de l’Observatoire des vers luisants et lucioles, l’observatoire Ti bèt a limiè a commencé ses activités en 2019. Les participants sont invités à faire remonter leurs observations de plusieurs espèces d’insectes lumineux (lucioles et taupins), afin de mieux connaitre leur biologie et leur écologie, identifier les facteurs favorisant leur présence ou leur régression et sensibiliser la population à leur maintien.	\N	\N	\N	f
69540	1019	IMAGE	images.1.image	\N	2582	Observations à la longue vue à Saint-Pierre et Miquelon © Nathalie De Lacoste	\N	f
69541	1019	TEXT	examples.projects.3.description	Sur les côtes néo-calédoniennes, plus de 80 stations coraliennes sont suivies annuellement selon une méthodologie appliquée par le réseau international [Reef Check](https://www.reefcheck.fr). Les observations protocolées sont réalisées sur quatre compartiments de l'environnement récifal (habitats, poissons, macro-invertébrés et perturbations du récif) pour évaluer sont état de santé. L'association Pala Dalik assure l’animation, la coordination et la formation des participants sur l'ensemble des trois provinces. 	\N	\N	\N	f
69542	1019	TEXT	examples.projects.2.actor	Parc marin de Mayotte	\N	\N	\N	f
69543	1019	LINK	examples.projects.4.more	En savoir plus	\N	\N	https://www.anbaloup-la.fr/observatoire-lucioles/	f
69544	1019	TEXT	paragraphs.1.text	La plupart des programmes permettent d’alimenter des bases de données collaboratives. Certains projets sont adossés à des programmes de recherche et visent à répondre à une question précise. D’autres mettent en avant en premier lieu un fort objectif de pédagogie, d’acquisition de connaissances et de sensibilisation à la démarche scientifique des observateurs.\n	\N	\N	\N	f
69545	1019	IMAGE	examples.projects.0.image	\N	2581	© Cynomana  / CC BY-SA 4.0 	\N	f
69546	1019	IMAGE	examples.projects.3.image	\N	2584	© Reefcheck France 	\N	f
69547	1019	TEXT	examples.projects.3.target	Plongeurs, apnéistes. Formation nécessaire. 	\N	\N	\N	f
69548	1019	TEXT	paragraphs.2.title	Un état des lieux des programmes ultramarins	\N	\N	\N	f
69549	1019	TEXT	examples.projects.1.subject	Suivi des populations d’oiseaux communs par échantillonnages réguliers le long de parcours prédéfinis	\N	\N	\N	f
69550	1019	LINK	application.downloadLink	Je télécharge l’application INPN Espèces	\N	\N	https://inpn.mnhn.fr/informations/inpn-especes	f
69551	1019	TEXT	examples.projects.1.description	Débuté en 2012 dans le cadre du Life+ CapDOM, conjointement avec la Martinique et La Réunion, le STOC-Guyane a pour but de suivre les variations d'abondances d'oiseaux communs sur le long terme pour évaluer l'impact des activités humaines. Le programme demande une implication régulière et nécessite une formation au protocole utilisé et la reconnaissance des espèces. A ce jour, près de cinquante parcours sont échantillonnés annuellement et au total, plus de 50 000 données ont été collectées.	\N	\N	\N	f
69552	1019	IMAGE	images.0.image	\N	2579	Observation des oiseaux marins à Mayotte © Fanny Cautain - OFB	\N	f
69553	1019	TEXT	examples.projects.1.target	Ornithologues amateurs ou professionnels (à titre bénévole). Formation nécessaire. 	\N	\N	\N	f
69554	1019	TEXT	examples.projects.0.target	Plongeurs, apnéistes, pratiquant la photo sous-marine	\N	\N	\N	f
69555	1019	TEXT	examples.projects.3.subject	Suivi de l’état de santé des récifs de Nouvelle-Calédonie	\N	\N	\N	f
69556	1019	TEXT	header.subtitle	Enrichir ses propres connaissances et développer son sens de l’observation tout en participant à la progression et l'amélioration des connaissances scientifiques pour préserver la biodiversité, c’est le pari des sciences participatives.  \n\nFaune, flore, milieu marin ou terrestre, observation ponctuelle ou programme protocolé, trouvez le programme qui vous correspond et contribuez au développement des connaissances !	\N	\N	\N	f
69557	1019	LINK	examples.projects.1.more	En savoir plus	\N	\N	http://www.gepog.org/Nos-actions/Milieux-terrestres/Suivi-Temporel-des-Oiseaux-Communs-STOC-EPS	f
69558	1019	TEXT	examples.projects.2.title	TsiÔno, le réseau des observateurs du milieu marin mahorais	\N	\N	\N	f
69559	1019	TEXT	header.title	C'est quoi les sciences participatives ?	\N	\N	\N	f
69560	1019	IMAGE	examples.projects.2.image	\N	2578	Plongeur à Mayotte © Alexandra Gigou - OFB	\N	f
68943	1012	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
68944	1012	TEXT	understand.text2	Ces milieux ont une importance au regard des services écosystémiques qu’ils procurent aux humains : régulation des crues et des inondations, protection des côtes de l’érosion et des tempêtes, épuration des eaux...\nSi des phénomènes naturels tels que les cyclones peuvent impacter les mangroves, de nombreuses causes de leur dégradation ont une origine humaine : changement climatique, artificialisation, exploitation intensive de ses ressources (bois, chasse, etc.), dépôts d’ordures, déversement des eaux usées, pollutions, pression touristique, etc. 	\N	\N	\N	f
69561	1019	CHECKBOX	header.shadowed	true	\N	\N	\N	f
69562	1019	TEXT	paragraphs.1.title	Différents objectifs	\N	\N	\N	f
69563	1019	TEXT	presentation.description	Le terme « sciences participatives » regroupe des programmes acquisition d’informations et de données scientifiques en impliquant une participation active des citoyens. Les observations sont réalisées de manière bénévole, le plus souvent par des non-professionnels. Dans certains cas, une formation au préalable est nécessaire, mais de nombreux programmes sont accessibles sans connaissances naturalistes poussées. 	\N	\N	\N	f
69564	1019	TEXT	examples.projects.3.actor	Association Pala Dalik	\N	\N	\N	f
69565	1019	TEXT	paragraphs.2.text	Les équipes du Compteur et de [Vigie Nature](https://www.vigienature.fr/) ont mené conjointement une étude pour **dresser le premier panorama des programmes de sciences participatives dans les territoires ultramarins**. Consultez [la synthèse des résultats de cet état des lieux](media/article/Synthèse%20étude%20sciences%20participatives) et téléchargez [le rapport](https://inpn.mnhn.fr/docs-web/docs/download/398569).\n  \nL'annuaire des programmes recensés sera prochainement disponible sur le site du Compteur. 	\N	\N	\N	f
64278	1031	TEXT	risks.risks.0.name	Des pressions sur le lagon et les forêts 	\N	\N	\N	f
64279	1031	IMAGE	interests.locations.1.image	\N	2332	Rivière de Futuna © Jairo Talalua	\N	f
64280	1031	IMAGE	ecosystems.ecosystems.1.image	\N	2346	Lande à *Toafa* © Jean-Yves H. Meyer, Délégation à la Recherche de la Polynésie française	\N	f
69566	1019	TEXT	examples.projects.4.title	Ti bèt a limiè, l’Observatoire des lucioles en Guadeloupe	\N	\N	\N	f
69567	1019	TEXT	examples.projects.0.actor	Kelonia	\N	\N	\N	f
69568	1019	TEXT	application.title	Agir pour la science depuis son smartphone, c’est possible !	\N	\N	\N	f
69569	1019	TEXT	paragraphs.0.title	Différents types de programmes 	\N	\N	\N	f
69570	1019	TEXT	examples.projects.4.actor	An ba loup-la	\N	\N	\N	f
69571	1019	TEXT	application.subtitle	J'agis en ligne	\N	\N	\N	f
69572	1019	TEXT	examples.projects.4.target	Tous publics	\N	\N	\N	f
69573	1019	TEXT	examples.projects.1.title	Le Suivi temporel des oiseaux communs (STOC) en Guyane	\N	\N	\N	f
69574	1019	LINK	examples.projects.0.more	En savoir plus	\N	\N	https://museesreunion.fr/kelonia/actualites-et-savoirs-de-kelonia/la-photo-identification-des-tortues-marines/?fbclid=IwAR0W8NGqRTa20a8	f
69575	1019	TEXT	examples.projects.2.target	Usagers de la mer, tous publics	\N	\N	\N	f
69576	1019	IMAGE	header.background	\N	2583	 Observateur en forêt, Guyane © Pierre-Olivier Jay - 97px	\N	f
69982	1053	TEXT	body.titre_question.12.paragraph.paragraphText	Cependant, le programme tel qu’il est mis en place en métropole, testé pendant quelques années, <strong>ne s’est pas avéré adapté au territoire mahorais</strong>. Les besoins du GEPOMAY étaient donc de bénéficier de l’expérience de la SEOR, qui coordonne le STOC à La Réunion depuis 2012 et qui a dû faire face aux mêmes problématiques initiales lors de sa mise en place. Le GEPOMAY souhaitait bénéficier de l’expertise et des conseils de la SEOR pour adapter le protocole aux spécificités de Mayotte, et pouvoir recruter et former un réseau d’observateurs.  \n<br>\nNicolas Laurent, en charge du STOC pour la SEOR, est donc venu en mars 2020 former les agents du GEPOMAY à la mise en place de ce dispositif. Emilien Dautrey, directeur du GEPOMAY, témoigne « *Le retour d’expérience de la SEOR nous a énormément aidé et cela a permis de compléter les premiers axes de réflexion engagés en 2019.* »  \n<br>\nL’expérience de la SEOR a en effet permis de faire des choix dans le protocole d’étude : « *<strong>Nous avons notamment décidé de prendre en compte moins d’habitats que prévus </strong>(les forêts, le milieu agricole et le milieu urbain) mais en caractérisant le couvert végétal pour le milieu agricole, qui semble influencer le cortège d’espèces d’oiseaux, <strong>et en indiquant si des espèces exotiques envahissantes sont présentes</strong> dans les forêts. Nous avons également décidé de prendre exemple sur le modèle de La Réunion en considérant des itinéraires sur lesquels se trouvent les 10 points d’écoute, contrairement à ce vers quoi le GEPOMAY s’orientait initialement à savoir des carrés avec 10 points à l’intérieur, comme c’est le cas en métropole.* »   \n	\N	\N	\N	f
69983	1053	IMAGE	body.titre_question.13.image.imageElement	\N	2638	Fiche utilisée pour le suivi des oiseaux © SEOR	\N	f
69984	1053	TEXT	body.introduction	Le système de compagnonnage mis en place par le programme Te Me Um permet aux acteurs de la préservation de la biodiversité ultramarine d’échanger leurs expériences sur le terrain, et ainsi de se former ou se perfectionner par une rencontre. Présentation de ce dispositif original à travers les expériences de la Société d’étude ornithologique de La Réunion (SEOR).	\N	\N	\N	f
69985	1053	TEXT	body.titre_question.2.paragraph.paragraphText	<strong>Se former au soin des chiroptères avec le centre de soin de Maurice</strong>  \n<br>\nDepuis 1997, la SEOR a mis en place un réseau de sauvetage de la faune sauvage en détresse de La Réunion. Elle dispose depuis 2009 d’un centre de soin qui fonctionne aujourd’hui avec deux capacitaires. Les animaux recueillis sont en grande majorité des oiseaux, en particulier des oiseaux marins (80 %) comme le Pétrel de Barau ([*Pterodroma baraui*](https://inpn.mnhn.fr/espece/cd_nom/215079)), endémique de l’île, dont les jeunes sont souvent désorientés par les lumières urbaines lors de leur premier envol.  \n<br>\nDeux premiers compagnonnages avaient été réalisés en 2013 et 2014, avec le centre de soin de l’Île-Grande en Bretagne et d’Audenge en Aquitaine, afin d’échanger sur les soins et les infrastructures nécessaires pour les oiseaux marins, ainsi que la partie administrative liée à l’accueil d’animaux sauvages. \n<br>\nCependant, ces dernières années, <strong>de plus en plus de chauves-souris ont été recueillies au centre</strong>. <stong>En effet, trois espèces de chiroptères sont présentes sur l’île de La Réunion </strong> : deux espèces de petite taille, le Petit molosse ([*Mormopterus francoismoutoui*](https://inpn.mnhn.fr/espece/cd_nom/458690)), endémique de l’île, et le Taphien de Maurice ([*Taphozous mauritianus*](https://inpn.mnhn.fr/espece/cd_nom/418762)), et une espèce de grande taille, la Roussette noire ([*Pteropus niger*](https://inpn.mnhn.fr/espece/cd_nom/418806)) endémique des Mascareignes. Cette dernière était considérée disparue de l’île jusqu’en 2007, où elle serait revenue depuis Maurice en faveur d’évènements climatiques particuliers, mais ses populations restent très limitées. Toutes les trois sont protégées (arrêté ministériel du 17 février 1989).  \n<br>\nEn novembre 2015, la SEOR a donc développé une extension chiroptère dans le but d’accueillir les chauves-souris en détresse, <strong>victimes principalement de collisions avec des véhicules, de prédation et d’empoisonnements secondaires</strong>. Cependant, les soigneuses ne disposaient pas des connaissances nécessaires pour l’accueil et les soins de ces animaux. Elles ont donc profité de l’opportunité de Te Me Um pour effectuer un 3<sup>e</sup> compagnonnage en 2016, cette fois avec le centre Gérald Durrell, à l’île Maurice.  \n<br>\n«*Au vu de notre manque d’expérience dans l’accueil de chiroptères, nos objectifs étaient principalement d’acquérir des réflexes adéquats à avoir avec les chauves-souris sauvages, des informations sur les types d’infrastructures nécessaires pour leur bon accueil et une expérience dans la mise en place de protocoles de diagnostics et de nourrissages.* » témoignent Julie Tourmetz, responsable du centre de soin, et Samantha Renault, son adjointe. «*Toutes les connaissances acquises vont être adaptées au centre de soins de la SEOR. Grâce à ce compagnonnage nous avons pu concevoir une structure d’accueil adéquate pour les chiroptères.* »\n	\N	\N	\N	f
69986	1053	IMAGE	body.titre_question.3.image.imageElement	\N	2637	Nourrissage d'une chauve-souris © SEOR	\N	f
69987	1053	TEXT	body.titre_question.14.paragraph.paragraphText	Emilien Dautrey termine : « *Les nombreux supports de formation utilisés par la SEOR nous ont été utiles pour réaliser nos propres supports, comme des fiches espèces pour aider les observateurs à reconnaitre les oiseaux communs et une sonothèque sur le site internet. Neuf premiers observateurs se sont portés volontaires pour 2021 et ont été formés fin 2020. Ils sont tous motivés pour réaliser ces suivis sur le long terme !* »  \n<br>\n<strong>Un nouvel appel à compagnonnages Te Me Um a été lancé le 1er mars 2022, les candidatures sont ouvertes jusqu’au 9 mai 2022. Retrouvez toutes les informations sur [le site du programme Te Me Um](http://temeum.ofb.fr/fr/compagnonnages2022%20). </strong>	\N	\N	\N	f
69988	1053	TEXT	body.titre_question.8.paragraph.paragraphText	L’objectif de ce compagnonnage était donc pour la SEOR de bénéficier de l’expérience de la SOP Manu dans la lutte contre les espèces exotiques envahissantes, afin de définir les modalités techniques et financières d’un plan de lutte contre ces espèces, pour la conservation de l’Échenilleur de La Réunion.  \n<br>\nDamien Fouillot explique : « *Nous avons pu discuter des avantages et des contraintes des méthodes employées, en conditions réelles. Chaque site ayant ses propres caractéristiques, en termes d’accessibilité par exemple, ou des espèces présentes. L’explication des dispositifs mis en place à Tahiti a permis de transposer ces opérations sur le terrain à La Réunion en les adaptant aux contraintes des sites de nidifications de l’échenilleur.*» \n<br>\nIl complète : « *Les résultats de ce compagnonnage ont nettement dépassé notre objectif initial ! Cette expérience nous a permis d’aboutir à un plan de lutte « chats et bulbul », développé dans le cadre du programme LIFE BIODIV’OM, en faveur de la conservation de l’Echenilleur de La Réunion.* ».  \n<br>\nL’espèce n’est pas encore sortie d’affaire mais les résultats sont encourageants : <strong>le nombre de couple identifiés de Tuit-Tuit est passé de 37 en 2018 à 48 en 2021</strong>.\n	\N	\N	\N	f
68246	1041	TEXT	identity.presentation	Fjords, glaciers, falaises, cratères, vallées à la végétation rase… Les Terres Australes françaises– aussi appelées îles subantarctiques - fascinent par leur isolement et leur nature brute et inhospitalière. Au sud de l’océan Indien entre les 40<sup>e</sup> rugissants et les 50<sup>e</sup> hurlants, ces îles volcaniques balayées par les vents présentent des paysages exceptionnels et abritent l’une des plus fortes concentrations et diversités d’oiseaux marins au monde. Leurs eaux sont également très riches, accueillant de nombreux mammifères marins qui viennent s’y nourrir. Ces îles sont classées en Réserve naturelle nationale depuis 2006 et inscrites sur la Liste du Patrimoine mondial de l’Unesco depuis 2019. 	\N	\N	\N	f
68247	1041	IMAGE	interests.locations.0.image	\N	1741	Albatros nicheur et falaises de Crozet © Julie Tucoulet	\N	f
68248	1041	TEXT	species.6.name	Le Chou de Kerguelen	\N	\N	\N	f
69821	1022	IMAGE	species.7.image	\N	2424	*Botrychium multifidum* © Serge Muller - MNHN	\N	f
69822	1022	TEXT	species.5.name	La Diapensine	\N	\N	\N	f
69989	1053	TEXT	body.titre_question.6.paragraph.paragraphText	<strong>Bénéficier de l’expérience de la Polynésie française dans la lutte contre les espèces exotiques envahissantes </strong>  \n<br>\nEn 2019, c’est en direction de la Polynésie française que s’est envolé Damien Fouillot, référent pour la conservation de l’Échenilleur de La Réunion ([*Lalage newtoni*](https://inpn.mnhn.fr/espece/cd_nom/895898)) à la SEOR. Cet oiseau endémique, appelé localement Tuit-Tuit en raison de son chant, ne se trouve que dans les forêts du massif de la Roche Écrite au nord de l’île. Il est <strong>en danger critique d’extinction</strong>, menacé notamment par les prédateurs exotiques envahissants tels que les chats et les rats, ainsi que par la compétition avec le Bulbul orphée ([*Pycnonotus jacosus*](https://inpn.mnhn.fr/espece/cd_nom/442300)), un oiseau introduit également envahissant.  \n<br>\nEn Polynésie française, c’est un autre oiseau, le Monarque de Tahiti ([*Pomara nigra*](https://inpn.mnhn.fr/espece/cd_nom/418875)), qui connait la même problématique : <strong>endémisme, prédateurs introduits, danger critique d’extinction</strong>. Sur place, l’association [SOP Manu](https://www.manu.pf/) met en place des actions pour la conservation de cet oiseau depuis de nombreuses années, qui permettent qui permettent une augmentation progressive des effectifs.\n	\N	\N	\N	f
68249	1041	TEXT	identity.population	0	\N	\N	\N	f
68250	1041	TEXT	species.3.name	L’Éléphant de mer du sud	\N	\N	\N	f
68251	1041	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
68252	1041	IMAGE	species.8.image	\N	1733	*Orcinus orca* © Julie Tucoulet	\N	f
68253	1041	TEXT	species.0.name	Le Manchot royal	\N	\N	\N	f
68254	1041	TEXT	events.4.date	24 janvier 1772 	\N	\N	\N	f
68255	1041	IMAGE	interests.locations.2.image	\N	1730	Vue aérienne de l'île Saint-Paul © Bruno Marie	\N	f
68256	1041	TEXT	interests.locations.0.description	Cinq îles volcaniques dont l’origine remonterai à 8 millions d’années forment l’archipel de Crozet. Le groupe occidental des îles Froides comprend l’île aux Cochons, les îlots des Apôtres et l’île des Pingouins, il est distant d’environ 110 km des îles orientales : l’île de la Possession et l’île de l’Est. Toutes les îles sont classées en zone de protection intégrale, seule l’île de la Possession est en zone de protection réglementée et est par conséquent la seule accessible aux humains. Elle abrite depuis 1962 la base Alfred Faure. L’archipel accueille la plus grande population de manchots royaux au monde. 	\N	\N	\N	f
68257	1041	TEXT	interests.locations.2.description	Ces deux îles, distantes de 85 km, sont les plus récentes du groupe, elles ont émergé il y a environ 100 000 ans. Sur Amsterdam, on trouve la seule espèce d’arbre indigène des Terres australes françaises, le [*Phylica arborea*](https://inpn.mnhn.fr/espece/cd_nom/780147), dont la population a été largement endommagée par les activités humaines passées (incendies, prélèvements, pâturage, etc.). Des populations importantes d’otaries viennent se reproduire sur ses côtes, et ses eaux sont riches en poissons et en langoustes. L’île Saint-Paul est une réserve intégrale où toute présence humaine est interdite. 	\N	\N	\N	f
68258	1041	TEXT	interests.locations.1.description	La Grande Terre de Kerguelen, territoire le plus vaste des Terres australes françaises et le plus ancien (40 millions d’années), est célèbre pour ses côtes au relief extrêmement découpé, avec de nombreux fjords et baies secondaires. A l’ouest, une calotte glaciaire couvre le territoire. Le littoral est occupé par de nombreux animaux qui viennent s’y reproduire : éléphants de mer, manchots, albatros, gorfous… Si la rudesse du climat n’a pas favorisé le développement des plantes en hauteur, on y trouve des espèces remarquables et des communautés végétales originales et parfois uniques. La végétation sous-marine, avec de vastes forêts d’algues, est foisonnante, et les eaux environnantes sont caractérisées par la présence de la Légine australe ([*Dissostichus eleginoides*](https://inpn.mnhn.fr/espece/cd_nom/424025)). 	\N	\N	\N	f
68259	1041	TEXT	statistics.1.text	d'aires protégées	\N	\N	\N	f
68260	1041	TEXT	identity.subtitle	Un isolement extrême	\N	\N	\N	f
68261	1041	IMAGE	species.4.image	\N	1736	*Arctocephalus tropicalis* © Roald Harivel	\N	f
68262	1041	IMAGE	species.7.image	\N	1732	Bosquet de Phylicas© Réserve naturelle national des Terres australes françaises	\N	f
68263	1041	TEXT	species.5.name	L'Azorelle	\N	\N	\N	f
68301	1051	TEXT	body.bodyElements.9.questionAnswer.response	Chez les insectes, il faut prendre en compte l’ensemble du cycle de vie. On a vu que la larve vit dans le sol donc tout ce qui perturbe le sol peut perturber la larve. Ensuite, elle fait son cocon - on l’appelle alors la pupe – <strong>à ce moment-là elle est très vulnérable au piétinement et à l’écrasement par des véhicules</strong>. Les adultes vivent souvent dans des espaces boisés ou arbustifs, donc <strong>la déforestation et l’arrachage des plantes locales détruisent les populations</strong>. Et puis il y a <strong>la pollution lumineuse : les lumières extérieures perturbent leur communication</strong>, les adultes ne peuvent pas se retrouver avec leurs signaux lumineux et ne peuvent donc pas se reproduire.  \n\n<br>Quand on sensibilise aux insectes lumineux, on sensibilise aussi à tous les autres insectes. Si les gens tondent leur gazon à ras par exemple, c’est mauvais pour les lucioles, mais aussi pour beaucoup d’insectes. Pour les gens, les insectes sont souvent dangereux, car ils sont méconnus. On comprend bien que laisser des herbes hautes autour des maison risque d’attirer des bêtes moins sympas, comme les scolopendres, qu’on n’a pas envie de voir entrer dans les maisons ! Mais lorsque les jardins sont grands, il faudrait pouvoir laisser une petite partie non tondue, pour la biodiversité.<br>\n	\N	\N	\N	f
64281	1031	TEXT	interests.locations.3.description	La plus petite île du groupe n’est habitée à l’année que par une seule personne mais fréquentée quasiment quotidiennement par les agriculteurs de Futuna. D’origine corallienne, elle est majoritairement recouverte par une forêt relativement bien conservée, malgré un défrichement de plus en plus important pour les cultures et le bois de construction.	\N	\N	\N	f
64282	1031	TEXT	identity.title	Wallis-et-Futuna,  \nun archipel au cœur du Pacifique  	\N	\N	\N	f
64283	1031	IMAGE	species.6.image	\N	2341	Fruits d'*Aglaia samoaensis* © J-Y. H. Meyer, Délégation à la Recherche de la Polynésie française	\N	f
68591	1038	TEXT	ecosystems.ecosystems.0.description	La forêt humide tropicale couvre plus de 80 % du territoire de la Guyane et la diversité floristique y est exceptionnelle. Malgré une apparente uniformité, elle recèle de nombreuses variations de type en fonction de la prépondérance de certaines grandes familles botaniques et de facteurs physico-chimiques multiples, comme l’altitude, la nature du sol ou la pluviométrie. \nDans le sous-bois, les plantes développent des stratégies leur permettant de vivre avec peu de lumière tandis qu’au sommet, la canopée s’étend à 30 à 40 m du sol. L’humidité ambiante favorise le développement de mousses et de lichens qui s’installent parfois à la surface des feuilles, et de champignons qui jouent un rôle écologique important. \nLes chablis (chutes naturelles d’arbres, dus à des évènements climatiques comme les fortes pluies) permettent une régénération naturelle de la forêt en ouvrant des clairières qui permettent l’arrivée de la lumière dans le sous-bois et favorisent certaines espèces dites pionnières à la croissante extrêmement rapide.\n	\N	\N	\N	f
68592	1038	TEXT	identity.highestPoint	851	\N	\N	\N	f
68945	1012	TEXT	understand.text1	La mangrove est un écosystème forestier constitué principalement d'arbres appelés palétuviers, et se trouvant dans la zone de balancement des marées. Espace de transition entre le milieu terrestre et le milieu marin, cet écosystème abrite de nombreuses espèces qui en sont dépendantes pour une partie ou la totalité de leur cycle de vie.\n\nOn trouve des mangroves dans tous les territoires tropicaux d’outre-mer français, à l’exception de l’île de La Réunion. Au total, on estime leur superficie à 91 096 ha, la grande majorité se trouvant en Guyane et en Nouvelle-Calédonie. Cependant, en Polynésie, cet écosystème n’est pas présent naturellement : une espèce de palétuvier, [*Rhizophora stylosa*](https://inpn.mnhn.fr/espece/cd_nom/447469), a été introduite volontairement dans les années 1930, et s’est ensuite propagée à l’ensemble des îles de la Société, au détriment de certains écosystèmes natifs. 	\N	\N	\N	f
68946	1012	TEXT	territories.title	Surface couverte par la mangrove	\N	\N	\N	f
64284	1031	TEXT	interests.locations.1.name	Les rivières de Futuna	\N	\N	\N	f
64285	1031	TEXT	statistics.2.text	espèces de plantes vasculaires indigènes	\N	\N	\N	f
64286	1031	IMAGE	species.0.image	\N	2335	Dessin d'*Alopecoenas stairi* © J. Wolf	\N	f
64287	1031	TEXT	events.1.date	-2 millions d'années	\N	\N	\N	f
68947	1012	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
68948	1012	TEXT	visual.subtitle	Visualisez les surfaces et la répartition des mangroves dans les territoires	\N	\N	\N	f
68949	1012	TEXT	understand.title1	La mangrove, un écosystème protecteur	\N	\N	\N	f
68950	1012	TEXT	understand.paragraphs.1.text	Créé en 2012, le [Pôle-relais dédié aux zones humides tropicales](https://www.pole-tropical.org/) (PRZHT) constitue un réseau d’échanges entre les acteurs concernés par la conservation, la gestion et la valorisation des zones humides dans les territoires tropicaux français. Il anime, entre autres, le [Réseau national d’observation et d’aide à la gestion des mangroves](https://www.pole-tropical.org/actions/les-actions-du-reseau-dobservation-des-mangroves/) (ROM), l’un des 3 réseaux de suivi de l’[Initiative française pour les Récifs Coralliens (IFRECOR)](https://ifrecor.fr/). Officiellement lancé en 2017, ce réseau regroupe les gestionnaires de mangroves des territoires français concernés aux Antilles, en Guyane, et dans les océans Indien et Pacifique. \n \nEn 2019, le ROM a développé une application smartphone pour permettre à tous de s’entrainer à reconnaitre les différentes espèces de palétuviers qui constituent la mangrove et à signaler les perturbations observées dans les mangroves (déchets, défrichements, mortalités, etc.). Chaque utilisateur peut ainsi devenir pleinement acteur de la protection des mangroves au sein de son territoire.  \nVous aussi, devenez observateurs en [téléchargeant l'application ROM](https://rom.pole-tropical.org/home) !\n	\N	\N	\N	f
68951	1012	TEXT	understand.title2	Des bénéfices pour l’Homme, mais un écosystème soumis à de nombreuses pressions 	\N	\N	\N	f
68952	1012	TEXT	presentation.descriptionTerritories	des mangroves font l'objet de mesures de conservation	\N	\N	\N	f
68953	1012	TEXT	understand.paragraphs.0.title	Des statuts de protection variés	\N	\N	\N	f
68954	1012	TEXT	understand.keyword	mangroves	\N	\N	\N	f
68955	1012	TEXT	ecogestures.title	Que puis-je faire pour aider à préserver les mangroves ? 	\N	\N	\N	f
68956	1012	IMAGE	presentation.image	\N	1047	Palétuviers, baie de Grand Cul-de-Sac marin, Guadeloupe © Gaëlle Vandersarren - Comité français UICN	\N	f
68957	1012	TEXT	understand.paragraphs.1.title	Un réseau participatif pour signaler les perturbations dans les mangroves	\N	\N	\N	f
68958	1012	IMAGE	visual.image	\N	2557	Carte mangroves outre-mer	\N	f
68959	1012	TEXT	visual.title	Les mangroves d'outre-mer	\N	\N	\N	f
68960	1012	LINK	understand.article	aucun	\N	\N	aucun	f
68961	1012	TEXT	understand.paragraphs.0.text	Il existe un éventail de dispositions juridiques permettant de protéger les mangroves, par exemple le classement en Zone humide d’importance internationale par la Convention de Ramsar ou les arrêtés de protection de biotope, et de nombreuses zones de mangroves sont présentes dans les aires protégées des territoires (parcs nationaux, parcs naturels régionaux, réserves naturelles, etc.). Cependant, toutes les mangroves protégées ne font pas forcément l’objet de mesures de gestion.\nCet indicateur donne la part de mangroves bénéficiant d'un gestionnaire identifié et d'un document de gestion établi dans un but de conservation. Dans le cadre de la loi pour la reconquête de la biodiversité du 9 août 2016, l’État français s'était fixé pour objectif que 60 % de la surface nationale des mangroves soit gérée à des fins de conservation d'ici à 2020, cet objectif n'a donc pas été atteint. 	\N	\N	\N	f
68962	1012	IMAGE	understand.image	\N	1314	Sentier aménagé dans la mangrove, Martinique © Fabien Lefebvre - Association ACWAA	\N	f
68963	1012	TEXT	presentation.description	des mangroves nationales font l’objet de mesures de conservation	\N	\N	\N	f
68964	1012	TEXT	presentation.logoUrl	https://naturefrance.fr/indicateurs/surface-de-mangroves-faisant-lobjet-de-mesures-de-conservation	\N	\N	\N	f
69823	1022	TEXT	risks.risks.0.description	Les menaces pesant sur la biodiversité de Saint-Pierre-et-Miquelon sont nombreuses. Comme tous les territoires d’outre-mer, l’archipel subit la présence d’espèces exotiques envahissantes terrestres, la Renouée du Japon ([*Reynoutria japonica*](https://inpn.mnhn.fr/espece/cd_nom/117503)) et le Séneçon Jacobée ([*Jacobaea vulgaris*](https://inpn.mnhn.fr/espece/cd_nom/610646)) sont parmi les plus impactant.  \nLa forêt boréale, sous la pression combinée des herbivores introduits, des pathogènes et du réchauffement climatique, perd en moyenne une vingtaine d'hectares par an, et son état de conservation n'est guère rassurant. \n\nAu niveau marin, depuis l’effondrement des populations de morue des bancs de Terre-Neuve par la surpêche dans les années 70 à 90, la pression de la pêche a diminué, cependant la pêche au filet du Saumon Atlantique capture accidentellement de nombreux oiseaux et mammifères marins. Les espèces exotiques marines sont également une préoccupation, en particulier les populations de Crabe vert ([*Carcinus maenas*](https://inpn.mnhn.fr/espece/cd_nom/18526)), en augmentation.\n\nLa chasse est une question délicate sur l'archipel. Concernant les mammifères introduits, elle permet d'un côté leur régulation, mais de l'autre elle justifie également leur maintien. Quant à la chasse aux oiseaux migrateurs, elle peut freiner l'implantation de colonies nicheuses comme celles de l’Eider à duvet ([*Somateria mollisima*](https://inpn.mnhn.fr/espece/cd_nom/2005)).\n\nLe territoire est pour le moment le seul d’outre-mer français à ne disposer d’aucun dispositif de protection réglementaire (hormis les réserves de chasse et de faune sauvage). Après l'abandon d'un premier projet de Réserve naturelle du Grand Barachois au début des années 90, un projet de création de Réserve naturelle sur le Grand et le Petit Colombier a été lancé en 2007. Plaçant sous protection une surface terrestre de 47 ha et une zone maritime de 420 ha, il permettrait de préserver ce site de nidification remarquable. Malgré un avis favorable du Conseil national de protection de la nature, ce projet a été mal perçu par les populations locales qui craignaient des contraintes sur leurs activités traditionnelles, c’est pourquoi le projet est gelé pour le moment.\n\nSur l’archipel, 40 Zones naturelles d'intérêt écologique, faunistique et floristique (ZNIEFF), abritant au moins une espèce ou un habitat naturel remarquable ou rare, ont été délimitées. Cela couvre 89 % du territoire terrestre et traduit la richesse et la valeur écologique des écosystèmes de ces îles, toutefois ce statut n'engendre pas de protection juridique. Actuellement, seules des espèces de chauves-souris, de mammifères marins, d’oiseaux et de tortues marines bénéficient d’une protection réglementaire.\n	\N	\N	\N	f
68593	1038	TEXT	interests.locations.4.description	Sur la côte sud-est de la Guyane, cette zone de marais et forêts marécageuses est accessible uniquement par voie fluviale. On y trouve des espèces remarquables comme le [Caïman noir](https://inpn.mnhn.fr/espece/cd_nom/443974) et le [Lamantin](https://inpn.mnhn.fr/espece/cd_nom/821122/), et une très grande diversité d’oiseaux, dont le [Coq-de-roche](https://inpn.mnhn.fr/espece/cd_nom/442329/) et la [Harpie féroce](https://inpn.mnhn.fr/espece/cd_nom/441972). Cette vaste zone humide est classée Réserve naturelle nationale depuis 1998.	\N	\N	\N	f
68594	1038	TEXT	risks.risks.0.name	Une biodiversité préservée, mais des impacts humains en expansion	\N	\N	\N	f
68595	1038	IMAGE	interests.locations.1.image	\N	2405	Comptages d'oiseaux au Grand Connétable © Réserve naturelle du Grand Connétable	\N	f
68596	1038	IMAGE	ecosystems.ecosystems.1.image	\N	2414	Inselberg de la roche Koutou © Olivier Tostain - 97px	\N	f
68597	1038	TEXT	interests.locations.3.description	Situées à l’extrémité nord-ouest la Guyane, le long du littoral à proximité de l’embouchure du fleuve Maroni, les plages d’Awala-Yalimapo sont l’un des sites les plus importants au monde pour la ponte des tortues marines, principalement pour les tortues luths, vertes et olivâtres. Ces plages sont protégées au sein de la Réserve naturelle nationale de l’Amana qui s’étend jusqu’à l’embouchure de la rivière Organabo et couvre 14 800 ha de plages, mangroves, marais et savanes. 	\N	\N	\N	f
68598	1038	TEXT	identity.title	La Guyane,  \nun trésor vert	\N	\N	\N	f
68599	1038	IMAGE	species.6.image	\N	2413	*Euterpe olaracea* © Cesar Delnatte - INPN	\N	f
68600	1038	TEXT	interests.locations.1.name	Les îles du Grand et du Petit Connétable	\N	\N	\N	f
68601	1038	TEXT	statistics.2.text	de mangroves	\N	\N	\N	f
68602	1038	IMAGE	species.0.image	\N	2408	*Titanus giganteus* © Julien Touroult - INPN	\N	f
68603	1038	TEXT	events.1.date	16<sup>e</sup> siècle 	\N	\N	\N	f
68604	1038	TEXT	interests.locations.4.name	Les marais de Kaw-Roura	\N	\N	\N	f
68965	1008	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
56515	1003	TEXT	header.title	À la découverte des outre-mer	\N	\N	\N	f
56516	1003	TEXT	header.population	2,8 millions	\N	\N	\N	f
56517	1003	TEXT	header.species	88 966	\N	\N	\N	f
56518	1003	TEXT	header.text	Les territoires d’outre-mer français présentent une biodiversité particulièrement riche et variée, mais fragilisée par les activités humaines. Naviguez parmi les portraits biodiversité des différents territoires et découvrez l’histoire des espèces et des écosystèmes qui les peuplent, les enjeux de chaque territoire et les initiatives des acteurs locaux pour les préserver.	\N	\N	\N	f
69990	1053	TEXT	body.titre_question.10.paragraph.paragraphText	<strong>Partager son expérience du suivi des oiseaux communs avec une association mahoraise</strong>  \n<br>\nPour le dernier compagnonnage en date, c’est cette fois l’association mahoraise [GEPOMAY](https://gepomay.fr/) qui a fait appel à l’expertise de la SEOR, en 2020. Le GEPOMAY souhaitait mettre en œuvre à Mayotte <strong>le programme STOC, le Suivi temporel des oiseaux communs</strong>. Ce programme de [sciences participatives](/sciences-participatives) est conçu pour évaluer les variations temporelles de l’abondance des populations nicheuses d’oiseaux communs. Il est basé sur des points d’écoutes localisés selon un plan d’échantillonnage précis, et effectués par des bénévoles ou partenaires formés à la reconnaissance des chants d’oiseaux.\n	\N	\N	\N	f
68966	1008	TEXT	understand.text2	On trouve un nombre plus important d’espèces endémiques dans les îles par rapport aux continents en raison de leur isolement géographique : les espèces y ont évolué séparément par rapport à celles sur le continent. Ainsi, plus une île est ancienne, plus il est probable que son taux d’endémisme soit élevé, comme par exemple en Nouvelle-Calédonie où 30 % des espèces du territoire sont uniques au monde.\nL’endémisme est également beaucoup plus important chez les espèces terrestres que chez les espèces marines, le milieu marin étant plus ouvert et permettant une connexion plus importante des habitats.	\N	\N	\N	f
68967	1008	TEXT	understand.text1	Qualifier une espèce d’endémique, cela veut dire que sa répartition est limitée à une zone géographique peu étendue et qu’elle ne se retrouve nulle part ailleurs dans le monde. Cela donne au territoire en question une responsabilité particulièrement forte dans la conservation du patrimoine mondial. On parle également d'espèces "sub-endémiques" lorsque leur répartition s'étend sur quelques territoires proches mais reste très limitée. \nEn raison de cette aire de répartition géographique restreinte, ces espèces sont généralements plus sensibles aux pressions liées aux activités humaines et se retrouvent plus souvent en danger de disparition que les espèces plus largement répandues. \n\nReflet de l'état actuel des connaissances, ce chiffre peut augmenter en raison de l'amélioration des connaissances scientifiques et de la [découverte de nouvelles espèces](/indicateurs/nouvelles-especes), mais il peut également diminuer lorsque des espèces s'éteignent.  	\N	\N	\N	f
68968	1008	TEXT	territories.title	Nombre d'espèces endémiques	\N	\N	\N	f
68969	1008	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
68970	1008	TEXT	visual.subtitle	Visualisez la proportion d'espèces endémiques par territoire	\N	\N	\N	f
68971	1008	TEXT	understand.title1	La notion d'endémisme	\N	\N	\N	f
68972	1008	TEXT	understand.title2	Un taux d’endémisme plus élevé dans les îles ? 	\N	\N	\N	f
68973	1008	TEXT	presentation.descriptionTerritories	espèces sont endémiques du territoire	\N	\N	\N	f
68974	1008	TEXT	understand.paragraphs.0.title	Quelques exemples	\N	\N	\N	f
68975	1008	TEXT	understand.keyword	endémique	\N	\N	\N	f
68976	1008	TEXT	ecogestures.title	Comment préserver les espèces endémiques ? 	\N	\N	\N	f
68977	1008	IMAGE	presentation.image	\N	2023	Kaori de forêt, Nouvelle-Calédonie © Mickaël T / CC	\N	f
68978	1008	IMAGE	visual.image	\N	2558	Carte part d'espèces endémiques outre-mer	\N	f
68979	1008	TEXT	visual.title	Les espèces endémiques d'outre-mer	\N	\N	\N	f
68980	1008	LINK	understand.article	aucun	\N	\N	aucun	f
68981	1008	TEXT	understand.paragraphs.0.text	Le Tiaré Apetahi ([*Sclerotheca raiateensis*](https://inpn.mnhn.fr/espece/cd_nom/908708)) en Polynésie Française, le Colibri à tête bleue ([*Cyanophaia bicolor*](https://inpn.mnhn.fr/espece/cd_nom/441841)) en Martinique, le Gecko vert de Manapany ([*Phelsuma inexpectata*](https://inpn.mnhn.fr/espece/cd_nom/528679)) à La Réunion, le Cagou ([*Rhynochetos jubatus*](https://inpn.mnhn.fr/espece/cd_nom/442324)) en Nouvelle-Calédonie, ou encore le Choux de Kerguelen ([*Pringlea antiscorbutica*](https://inpn.mnhn.fr/espece/cd_nom/721546)) dans les Terres australes françaises, chaque territoire d'outre-mer possède de nombreuses espèces uniques. Largement couverte par la très riche forêt amazonienne, la Guyane compte près de 9 % d'espèces endémiques (ou sub-endémiques de la région du plateau des Guyanes). Seul Saint-Pierre-et-Miquelon ne compte aucune espèce connue spécifique au territoire, l'archipel étant très proche de Terre Neuve.\n\nOn trouve malheureusement un grand nombre d'espèces endémiques éteintes, comme le Solitaire de La Réunion ([*Threskiornis solitarius*](https://inpn.mnhn.fr/espece/cd_nom/432588)) (souvent confondu à tord avec le Dodo de l'île Maurice) ou l'Amazone de la Martinique ([*Amazona martinicana*](https://inpn.mnhn.fr/espece/cd_nom/655175)), tous deux disparus depuis la fin du 18e siècle. De nombreuses espèces endémiques se sont sans doute éteintes avant même d'avoir été découvertes.	\N	\N	\N	f
68982	1008	IMAGE	understand.image	\N	2022	Colibri à tête bleue, Martinique © Fabien Lefebvre - Association ACWAA	\N	f
68983	1008	TEXT	presentation.description	espèces d’outre-mer sont endémiques	\N	\N	\N	f
68984	1008	TEXT	presentation.logoUrl	https://naturefrance.fr/indicateurs/nombre-despeces-endemiques-de-france	\N	\N	\N	f
69249	1015	TEXT	species.7.description	Le Moqueur gorge-blanche ([*Ramphocinclus brachyurus*](https://inpn.mnhn.fr/espece/cd_nom/442316\n)) est un petit oiseau à la face dorsale foncée et la face ventrale blanche endémique de la Martinique et de Sainte-Lucie. Il se trouve uniquement dans les zones boisées de la presqu’île de la Caravelle. Considéré en danger d’extinction en raison de la petite taille de la population, il est victime de la prédation par les espèces introduites et fait l’objet d’un programme de conservation dans le cadre du programme [LIFE BIODIV’OM](https://www.lifebiodivom.fr/especes/moqueur-gorge-blanche/).\n\nStatut dans la Liste rouge des oiseaux de Martinique : en danger critique. 	\N	\N	\N	f
70216	1049	TEXT	body.photos.8.description	« Le Scinque aux yeux de serpent d'Europa ([*Cryptoblepharus bitaeniatus*](https://inpn.mnhn.fr/espece/cd_nom/712368)) est un reptile terrestre endémique, diurne, qui mesure entre 8 et 10 cm à l’âge adulte. Préalablement considéré comme une sous espèce du Scinque de Bouton ([*Cryptoblepharus boutonii*](https://inpn.mnhn.fr/espece/cd_nom/459101)) présent à La Réunion et Mayotte, il a récemment été élevé au rang d’espèce à part entière, témoignant de la constante évolution de la taxonomie (science de classification du vivant). »	\N	\N	\N	f
70217	1049	IMAGE	body.photos.6.photo	\N	2545	Bruno Marie	\N	f
70218	1049	TEXT	presentation.author	01/12/2021	\N	\N	\N	f
69031	1014	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
69250	1015	TEXT	species.8.description	Le Gommier blanc ([*Dacryodes excelsa*](https://inpn.mnhn.fr/espece/cd_nom/447568\n)) est l’un des plus grands arbres des forêts de Martinique, il peut atteindre 35 mètres de haut. Il est exploité pour son bois et sa résine.  \n  \nStatut dans la Liste rouge de la flore vasculaire de Martinique : non évalué.	\N	\N	\N	f
69251	1015	IMAGE	species.2.image	\N	2294	*Aliger gigas* © Benjamin Guichard - OFB	\N	f
69252	1015	IMAGE	ecosystems.ecosystems.4.image	\N	2301	Récif de Martinique © Fabien Lefebvre - Association ACWAA	\N	f
69253	1015	TEXT	species.3.description	La Tortue verte ([*Chelonia mydas*](https://inpn.mnhn.fr/espece/cd_nom/77338\n)) est l’une des cinq espèces de tortues marines qui fréquentent les eaux de Martinique. Si elle est régulièrement observable dans l’eau, en alimentation sur les herbiers, elle ne pond que rarement sur les plages de Martinique. Comme toutes les espèces de tortues marines, elle est menacée d'extinction, notamment en raison des captures accidentelles dans les filets de pêche et la dégradation des sites de ponte. Le dérangement répété par les baigneurs peut également occasionner une forte dépense d’énergie pour les tortues, c’est pourquoi il est recommandé de garder une distance minimum de quelques mètres et de ne pas tenter de les toucher.\n\nStatut dans la Liste rouge des reptiles de Martinique : en danger critique. 	\N	\N	\N	f
69254	1015	TEXT	statistics.3.number	2 000	\N	\N	\N	f
69255	1015	TEXT	species.1.description	L’Iguane des Petites Antilles ou Iguane péyi ([*Iguana delicatissima*](https://inpn.mnhn.fr/espece/cd_nom/350755\n)) était autrefois présent sur tout le nord des Petites Antilles, depuis Anguilla jusqu’à la Martinique. Il a aujourd’hui disparu de nombreux territoires, et est considéré en danger critique d’extinction. Sa survie est menacée par l’introduction de l’Iguane commun ([*Iguana iguana*](https://inpn.mnhn.fr/espece/cd_nom/350756\n)) avec qui il ne doit pas être confondu. L’Iguane commun exotique se reconnait aux rayures sombres sur la queue et à sa grosse plaque ronde sur la joue, sous le tympan, que ne possèdent pas l’Iguane des Petites Antilles.\n\nStatut dans la Liste rouge des reptiles de Martinique : en danger critique.	\N	\N	\N	f
69256	1015	TEXT	species.2.description	Le Lambi ([*Aliger gigas*](https://inpn.mnhn.fr/espece/cd_nom/972164\n)) est un mollusque dont la coquille imposante peut atteindre 30 cm et 1,5 kg. Victime de la surpêche pour sa chair et parfois l’usage décoratif de sa coquille, son exploitation est aujourd’hui strictement contrôlée. La Martinique en a fait son emblème officiel.  \n  \nStatut dans la Liste rouge mondiale : non évalué.   	\N	\N	\N	f
69257	1015	TEXT	statistics.1.number	40	\N	\N	\N	f
69258	1015	TEXT	statistics.0.number	48	\N	\N	\N	f
69259	1015	TEXT	statistics.2.number	2/3	\N	\N	\N	f
69260	1015	IMAGE	interests.locations.4.image	\N	2293	L’étang des Salines, Martinique © PNR de la Martinique - Autrevue	\N	f
69261	1015	TEXT	species.2.name	Le Lambi	\N	\N	\N	f
69262	1015	TEXT	risks.risks.1.name	Des préoccupations communes aux territoires antillais	\N	\N	\N	f
69263	1015	TEXT	species.4.description	L’Ananas bois ([*Aechmea reclinata*](https://inpn.mnhn.fr/espece/cd_nom/629022\n)) a été décrit pour la première fois en 1999 par une équipe du Parc naturel régional. Endémique de Martinique, cette espèce n’a été observée qu’en arrière-mangrove de Genipa et sur la montagne du Vauclin. Peu après sa découverte, une grande part de son aire de répartition a été défrichée illégalement pour y planter de la canne à sucre, mettant en péril cette espèce tout juste inventoriée.\n\nStatut dans la Liste rouge de la flore vasculaire de Martinique : en danger critique. 	\N	\N	\N	f
69264	1015	TEXT	zoom.callToAction	Cliquez sur la carte thématique pour vous repérer en un coup d'œil ! 	\N	\N	\N	f
69265	1015	TEXT	ecosystems.ecosystems.0.name	Les plages	\N	\N	\N	f
69266	1015	TEXT	species.5.description	L’Herbe à Tortue ([*Thalassia testudinum*](https://inpn.mnhn.fr/espece/cd_nom/627263)) est une plante marine qui compose les herbiers de phanérogames sous-marins, souvent accompagnée de l’Herbe à Lamentin ([*Syringodium filiforme*](https://inpn.mnhn.fr/espece/cd_nom/627259)). Son aire de répartition couvre l’ensemble des Caraïbes, et de nombreuses espèces marines s’en nourrissent. L'introduction d'une espèce exotique de phanérogame, [*Halophila stipulacea*](https://inpn.mnhn.fr/espece/cd_nom/368620), signalée depuis 2006 dans les eaux martiniquaises, représente une potentielle menace pour ces herbiers indigènes. Des études sont en cours pour suivre son expansion et mesurer ses impacts sur les communautés marines. \n\nStatut dans la Liste rouge mondiale : préoccupation mineure.\n	\N	\N	\N	f
69267	1015	TEXT	species.6.description	Serpent endémique venimeux, le Trigonocéphale ([*Bothrops lanceolatus*](https://inpn.mnhn.fr/espece/cd_nom/439142\n)) a été victime de sa mauvaise réputation bien que peu d’accidents aient été à déplorer et qu’un anti-venin existe. Des primes à la capture ont longtemps existé et dans les années 1980, la Petite mangouste indienne ([*Urva auropunctata*](https://inpn.mnhn.fr/espece/cd_nom/850071/)) a été introduite depuis l'Inde dans le but de le combattre, cependant le serpent étant nocturne et la mangouste diurne, celle-ci s’est rabattue sur la consommation d'autres espèces indigènes. Le trigonocéphale est aujourd’hui rare sur l’île.\n\nStatut dans la Liste rouge des reptiles de Martinique : en danger. 	\N	\N	\N	f
69268	1015	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
69269	1015	TEXT	events.0.date	1<sup>e</sup> siècle	\N	\N	\N	f
69270	1015	TEXT	identity.populationYear	2017	\N	\N	\N	f
69271	1015	IMAGE	species.5.image	\N	2292	*Thalassia testudinum* © Fabien Lefebvre - Association ACWAA	\N	f
69272	1015	TEXT	statistics.0.text	Ilets répartis autour de l'île	\N	\N	\N	f
69273	1015	TEXT	ecosystems.ecosystems.1.name	La forêt humide tropicale	\N	\N	\N	f
69274	1015	TEXT	events.2.date	1929-1932	\N	\N	\N	f
70219	1049	TEXT	body.photos.11.description	« Ce canon est l’un des vestiges de l’*Utile*, navire qui fit naufrage à Tromelin en 1761. L’équipage construisit un radeau pour quitter l’île, y abandonnant 80 esclaves que le navire convoyait illégalement. Les « oubliés de Tromelin » resteront 15 ans sur l’île. Les derniers survivants, 7 femmes et un enfant, ne seront secourus qu’en 1776 par Jacques Marie de Tromelin. \n<br>Au second plan on aperçoit le drapeau des Terres australes et antarctique françaises sous le drapeau français, les îles Éparses étant l’un des 5 districts représentés par les étoiles autour des lettres TAAF entremêlées.»<br>\n  \n<br><strong>Textes extraits pour partie du livre « Escales au bout du monde » sur les TAAF </strong> © Océindia (oceindia@icloud.com), S. Légeron, B. Marie, 2015. Plus de photos des TAAF sur le site web de Bruno Marie : [http://seaview.photodeck.com/](http://seaview.photodeck.com/)\n<br><strong>Pour en savoir plus sur les îles Éparses</strong>, découvrez [la page portrait](/territoires/iles-eparses). <br>\n	\N	\N	\N	f
70220	1049	IMAGE	body.photos.9.photo	\N	2542	Bruno Marie	\N	f
70221	1049	TEXT	body.photos.9.description	« Ce petit passereau caché dans les broussailles est un Zostérops de Madagascar, aussi appelé oiseau-lunette. Il se trouve surtout dans les zones boisées et les mangroves. Le naturaliste allemand Alfred Voeltzkow décrivit en 1904 cette sous-espèce endémique d’Europa, qui sera nommée [*Zosterops maderaspatanus voeltzkowi*](https://inpn.mnhn.fr/espece/cd_nom/432599). »	\N	\N	\N	f
70222	1049	IMAGE	body.photos.11.photo	\N	2547	Bruno Marie	\N	f
70223	1049	IMAGE	body.photos.4.photo	\N	2536	Bruno Marie	\N	f
70224	1049	IMAGE	body.photos.7.photo	\N	2546	Bruno Marie	\N	f
70225	1049	IMAGE	body.photos.2.photo	\N	2541	Bruno Marie	\N	f
70226	1049	IMAGE	presentation.image	\N	2535	Plage de Grande Glorieuse © Bruno Marie	\N	f
70227	1049	IMAGE	body.photos.10.photo	\N	2537	Bruno Marie	\N	f
70228	1049	IMAGE	photograph.photo	\N	2534	Bruno Marie	\N	f
70229	1049	TEXT	body.photos.10.description	« Tromelin abrite une importante population de Fou à pied rouge ([*Sula sula*](https://inpn.mnhn.fr/espece/cd_nom/440197)). On observe deux types de plumage chez l’adulte : soit blanc avec l’extrémité des plumes noires, soit entièrement brun, comme celui-ci. Le duvet du poussin est quant à lui d’un blanc immaculé. Le jeune peut rester plusieurs mois au nid avant de pouvoir voler. »	\N	\N	\N	f
70230	1049	IMAGE	body.photos.3.photo	\N	2539	Bruno Marie	\N	f
70231	1049	TEXT	photograph.presentation	Bruno Marie	\N	\N	\N	f
69275	1015	TEXT	identity.presentation	Au cœur de l’arc des Petites Antilles, la Martinique, baptisée *Ioünacaera* « l’île aux iguanes » par ses premiers occupants amérindiens, présente une grande diversité de paysages. Au nord, des forêts humides bien conservées entourent le volcan de la Montagne Pelée. Le sud, plus sec et d’une altitude plus faible, est plus peuplé et urbanisé. L'île est entourée de 48 îlets, répartis principalement sur la côte atlantique, sur lesquels on retrouve une végétation adaptée aux milieux très secs et qui accueillent de nombreux oiseaux nicheurs. 	\N	\N	\N	f
69276	1015	TEXT	identity.population	372 594	\N	\N	\N	f
70232	1049	IMAGE	body.photos.5.photo	\N	2544	Bruno Marie	\N	f
70233	1049	TEXT	body.introduction	Éparpillées dans le Canal du Mozambique et l’océan Indien, les îles Éparses sont de minuscules territoires français inhabités. Entre 2012 et 2015, le photographe Bruno Marie a accompagné plusieurs expéditions scientifiques d’étude de la biodiversité de ces îles isolées. A travers ces images, il nous emmène avec lui explorer ces territoires préservés.	\N	\N	\N	f
69016	1009	TEXT	understand.paragraphs.1.text	Sur les quelques centaines d’espèces de mammifères indigènes recensés, la plupart des espèces terrestres se trouvent en Guyane. On y rencontre par exemple le jaguar, le paresseux à deux doigts et plusieurs espèces de primates. Très peu de mammifères terrestres sont naturellement présents sur les îles et il s’agit quasiment uniquement de chauves-souris. Les autres mammifères recensés sont des espèces marines comme les baleines, les dauphins et les phoques.\n\nDe nombreuses espèces de mammifères ont été introduites par l’homme sur les îles et sont devenues [envahissantes](/indicateurs/especes-exotiques-envahissantes) : chats, rats, souris, lapins, cerfs, chiens, chèvres… Ces introductions sont à l'origine de grandes perturbations pour les écosystème fragiles de ces territoires, et ont engendré l'extinction de nombreuses espèces. 	\N	\N	\N	f
70234	1049	IMAGE	body.photos.8.photo	\N	2543	Bruno Marie	\N	f
70235	1049	IMAGE	body.photos.0.photo	\N	2538	Bruno Marie	\N	f
69017	1009	TEXT	understand.title2	Vous avez dit « espèce indigène » ? 	\N	\N	\N	f
69018	1009	TEXT	presentation.descriptionTerritories	espèces sont indigènes sur le territoire	\N	\N	\N	f
69019	1009	TEXT	understand.paragraphs.0.title	Une importante diversité de plantes à fleurs et d'insectes	\N	\N	\N	f
69020	1009	TEXT	understand.keyword	indigene	\N	\N	\N	f
69021	1009	TEXT	ecogestures.title	Comment préserver la biodiversité indigène ?	\N	\N	\N	f
69022	1009	IMAGE	presentation.image	\N	2019	Coq-de-roche orange, Guyane © Raphael Gailhac - OFB	\N	f
69023	1009	TEXT	understand.paragraphs.1.title	Des mammifères terrestres peu nombreux sur les îles 	\N	\N	\N	f
69024	1009	IMAGE	visual.image	\N	2561	Infographie Saint-Pierre-et-Miquelon	\N	f
69025	1009	TEXT	visual.title	Les espèces indigènes d'outre-mer	\N	\N	\N	f
69026	1009	LINK	understand.article	aucun	\N	\N	aucun	f
69027	1009	TEXT	understand.paragraphs.0.text	Au niveau floristique, les plantes à fleurs présentent le plus grand nombre d’espèces : on en compte 12 306 dans tout l'outre-mer. Mais ce ne sont pas les seules espèces végétales : on compte également plusieurs centaines d’espèces de mousse, de lichens ou encore d’algues.  \n\nDu côté de la faune, c’est chez les invertébrés que se trouve la plus grande diversité : on compte plus de 12 000 espèces de coléoptères et plus de 8 000 espèces de papillons ! Les mollusques sont également un groupe très diversifié, représentés aussi bien en milieu marin qu’en milieu terrestre et en eaux douces.\nChez les vertébrés, on dénombre 5 046 espèces de poissons, 1 435 espèces d'oiseaux, 381 espèces de reptiles, 321 espèces de mammifères et 138 espèces pour les amphibiens.  \n\nCes chiffres sont en perpétuelle évolution à mesure de la progression des connaissances scientifiques, de [nouvelles espèces](/indicateurs/nouvelles-especes) sont découvertes chaque année. Une importante disparité est observée entre le nombre d'espèces terrestres et d'espèces marines répertoriées : près de 80 % des espèces inventoriées sont terrestres ou d'eau douce. Si cela traduit en partie une réalité biologique, cela illustre également la difficulté d'acquérir des connaissances sur les espèces marines. 	\N	\N	\N	f
69028	1009	IMAGE	understand.image	\N	2018	Iguane des petites Antilles, Martinique © Fabien Lefebvre - Association ACWAA	\N	f
69029	1009	TEXT	presentation.description	espèces sont indigènes dans les outre-mer	\N	\N	\N	f
69030	1009	TEXT	presentation.logoUrl	https://inpn.mnhn.fr/espece/indicateur	\N	\N	\N	f
69277	1015	TEXT	species.3.name	La Tortue verte	\N	\N	\N	f
69278	1015	TEXT	risks.risks.2.name	Un Observatoire local de la biodiversité	\N	\N	\N	f
69279	1015	IMAGE	species.8.image	\N	2298	*Dacryodes excelsa* © Cesar Delnatte - INPN	\N	f
69280	1015	TEXT	species.0.name	Le Matoutou Falaise	\N	\N	\N	f
69281	1015	TEXT	events.4.date	1995	\N	\N	\N	f
69282	1015	IMAGE	interests.locations.2.image	\N	2290	Cascade dans le Parc Naturel Régional de la Martinique © Fabien Lefebvre - Association ACWAA	\N	f
69283	1015	IMAGE	ecosystems.ecosystems.2.image	\N	2305	Mangrove, Martinique © Fabien Lefebvre - Association ACWAA	\N	f
69284	1015	TEXT	events.10.description	Publication de la Liste rouge de la Faune de Martinique	\N	\N	\N	f
69285	1015	TEXT	interests.locations.0.description	À l'est de la Martinique, la presqu’île de la Caravelle présente une grande variété d’écosystèmes : savanes, falaises, forêt, mangroves. Le site est classé Réserve naturelle nationale depuis 1976 car il est le refuge du Moqueur gorge-blanche ([*Ramphocinclus brachyurus*](https://inpn.mnhn.fr/espece/cd_nom/442316)), oiseau endémique fortement menacé.  	\N	\N	\N	f
69286	1015	TEXT	risks.risks.2.description	Face aux enjeux de la préservation et la valorisation de la biodiversité martiniquaise, 43 structures institutionnelles et associatives se sont réunies autour du Parc naturel régional de la Martinique pour la création d’un Observatoire Martiniquais de la biodiversité (OMB) afin de mutualiser les connaissances, sensibiliser le public et faciliter l’intégration de la biodiversité dans les politiques publiques.  \n\nLancé en 2015, l’OMB est ainsi un dispositif multi-partenarial au service des acteurs locaux et du grand public. Une plateforme internet [www.biodiversite-martinique.fr](http://www.biodiversite-martinique.fr/) a été créée pour remplir les missions de centralisation et de diffusion des connaissances. Il présente un centre de ressources, des actualités, ainsi que la faune, la flore et les habitats naturels de l’île. Actuellement, un système d’informations est en cours de création et constituera le système d'information de l'inventaire du patrimoine naturel (SINP) régional. Les données relatives à la biodiversité terrestre, aquatique et marine y seront centralisées. 	\N	\N	\N	f
69287	1015	TEXT	risks.risks.1.description	Comme en Guadeloupe, la chlordécone, pesticide utilisé dans les bananeraies entre les années 1970 et 1990 a massivement pollué les milieux naturels de l’île. Si ses impacts sur la santé humaine commencent à être reconnus, ses conséquences sur les espèces et les écosystèmes sont également étudiées. Des études ont notamment montré une importante contamination des organismes aquatiques ce qui a conduit à l'interdiction de la pêche dans tous les cours d'eau et sur une partie des zones côtières de l'île.\n\nLes échouages de sargasses sont un phénomène naturel dont l’ampleur a considérablement augmenté ces dernières années dans les Antilles. Les radeaux denses et les dépôts épais qu’elles forment sur les plages piègent de nombreuses espèces dont des tortues, et ont également un impact sanitaire et économique important.  	\N	\N	\N	f
69288	1015	TEXT	interests.locations.2.description	Créé en 1976, le [Parc naturel régional](http://pnr-martinique.com/) s’étend sur 32 communes et couvre les 2/3 de l’île. Son objectif est de conjuguer le développement de l’île avec la préservation de ses richesses naturelles et culturelles. 	\N	\N	\N	f
69289	1015	TEXT	interests.locations.1.description	Ces deux zones de forêt humide au nord de l'île sont classées en Réserve biologique intégrale, gérées par l'Office national des forêts. La forêt y est laissée en évolution naturelle, l'exploitation et les interventions y sont interdites, à l'exception des aménagements pour la sécurité du public. La Montagne Pelée, toujours en activité, est étroitement surveillée.	\N	\N	\N	f
69290	1015	TEXT	ecosystems.ecosystems.3.name	Les herbiers sous-marins	\N	\N	\N	f
69291	1015	TEXT	identity.subtitle	Des paysages contrastés	\N	\N	\N	f
69292	1015	IMAGE	species.7.image	\N	2291	*Ramphocinclus brachyurus* © Fabien Lefebvre - Association ACWAA	\N	f
69293	1015	TEXT	species.5.name	L'Herbe à Tortue 	\N	\N	\N	f
69032	1014	TEXT	understand.text2	Cet indicateur présente l’évolution du recouvrement en corail vivant sur des stations réparties dans les différents territoires d’outre-mer. La situation est en réalité très hétérogène selon les collectivités : les récifs sont ainsi très dégradés en Martinique et Guadeloupe, mais beaucoup moins à Wallis-et-Futuna ou Mayotte. La situation est considérée comme stable pour 60 % des stations étudiées.  \n\nCet indicateur a cependant des limites, par exemple, le nombre de stations évaluées reste faible : on compte 82 stations évaluées sur plus de 600 existantes. De plus, il se base uniquement sur le caractère vivant du corail, mais pas sur les espèces de coraux présentes, ni les communautés associées (poissons, invertébrés). Des analyses plus complètes et plus fines sont nécessaires afin de bien comprendre l’évolution de l’état de santé des récifs coralliens.	\N	\N	\N	f
69033	1014	TEXT	understand.text1	Les récifs coralliens sont formés par des colonies de coraux, constitués de polypes (petits organismes invertébrés de la même famille que les méduses) sécrétant un squelette calcaire, et vivant en symbiose avec des algues unicellulaires, les zooxanthelles, qui leur apportent des nutriments grâce à la photosynthèse.\nPoissons, crustacés, mollusques, concombres de mer, éponges... les récifs coralliens sont des écosystèmes extrêmement riches en biodiversité, ils représentent une zone de nourrissage, de refuge et de nurserie pour des milliers d'espèces marines.  \n \n10 % des récifs coralliens mondiaux sont situés dans les territoires d’outre-mer français, la France a donc une responsabilité importante à l’échelle mondiale sur la conservation des récifs coralliens.	\N	\N	\N	f
69034	1014	TEXT	territories.title	Pourcentage de surface des récifs coralliens en diminution	\N	\N	\N	f
69035	1014	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
69036	1014	TEXT	visual.subtitle	Visualisez le nombre de stations suivies et leur état de santé dans les outre-mer	\N	\N	\N	f
69037	1014	TEXT	understand.title1	Le corail, constructeur du récif	\N	\N	\N	f
69038	1014	TEXT	understand.paragraphs.1.text	Créée en 1999, l’[Initiative française pour les récifs coralliens (IFRECOR)](https://ifrecor.fr/) agit pour la protection et la gestion durable des récifs coralliens, des herbiers et des mangroves dans les collectivités françaises d’outre-mer. Chaque collectivité abritant ces écosystèmes possède un comité local rassemblant les acteurs concernés par leur protection et leur gestion durable. L’initiative collective porte un plan d'action sur 5 ans qui couvre 6 axes stratégiques : planifier pour prévenir ; réduire les effets négatifs dus aux activités humaines, tout en assurant leur développement durable ; connaître et comprendre pour gérer ; informer et éduquer pour modifier les comportements ; développer les échanges et la coopération pour renforcer les synergies et valoriser les expériences. \n  \nDéclinaison française de l’Initiative internationale pour les récifs coralliens (ICRI), l’IFRECOR représente les territoires français au niveau international. Elle est présidée par les ministres de la transition écologique et des outre-mer, dont les services assurent le secrétariat.	\N	\N	\N	f
69039	1014	TEXT	understand.title2	Un état de santé hétérogène selon les territoires	\N	\N	\N	f
69040	1014	TEXT	presentation.descriptionTerritories	des récifs coralliens sont en diminution	\N	\N	\N	f
69041	1014	TEXT	understand.paragraphs.0.title	Les coraux en danger 	\N	\N	\N	f
69042	1014	TEXT	understand.keyword	corail	\N	\N	\N	f
69043	1014	TEXT	ecogestures.title	Comment préserver les coraux à mon échelle ? 	\N	\N	\N	f
69044	1014	IMAGE	presentation.image	\N	1053	Récif corallien, Parc naturel marin de Mayotte © Marine Dekenen - OFB	\N	f
69045	1014	TEXT	understand.paragraphs.1.title	L’IFRECOR, une initiative pour préserver les récifs 	\N	\N	\N	f
69046	1014	IMAGE	visual.image	\N	2560	Carte récifs coralliens outre-mer	\N	f
69047	1014	TEXT	visual.title	Les récifs coralliens d'outre-mer	\N	\N	\N	f
69048	1014	LINK	understand.article	aucun	\N	\N	aucun	f
69049	1014	TEXT	understand.paragraphs.0.text	Les coraux sont des organismes très fragiles : lorsqu’ils sont soumis à un stress, les polypes expulsent leurs algues, ce qui provoque le blanchissement du corail et finit par entrainer sa mort si cette situation est prolongée.\nDe nombreuses menaces pèsent sur les récifs coralliens : le changement climatique provoque l’augmentation de la température et l'acidification de l’eau, qui soumettent les coraux à un stress important. Les polluants issus des activités humaines, certaines techniques de pêche ou encore les activités touristiques ont également un lourd impact sur les récifs. Ces facteurs se conjuguent aux évènements naturels (cyclones, consommation massive par l’étoile de mer [*Acanthaster planci*](https://inpn.mnhn.fr/espece/cd_nom/444461)) et aggravent leurs effets.  \n\nLes coraux sont également très sensibles aux maladies, comme la maladie de la bande blanche ou la récente maladie corallienne liée à la perte de tissus (SCTLD), identifiée pour la première fois en Floride en 2014 et observée en Guadeloupe en 2020.	\N	\N	\N	f
69050	1014	IMAGE	understand.image	\N	1309	 Le stress provoque le blanchissement des coraux (ici à Mayotte) © Marine Dedeken - OFB	\N	f
69051	1014	TEXT	presentation.description	des récifs coralliens sont en diminution dans les territoires d'outre-mer	\N	\N	\N	f
69052	1014	TEXT	presentation.logoUrl	https://naturefrance.fr/indicateurs/evolution-de-letat-des-recifs-coralliens	\N	\N	\N	f
69294	1015	TEXT	risks.risks.0.description	L’expansion démographique et l’urbanisation, surtout au centre et au sud de l’île, entraînent défrichements, rejets domestiques, industriels et agricoles, qui impactent fortement les milieux naturels de la Martinique. Les mangroves sont notamment des milieux particulièrement sensibles soumis à de fortes pressions anthropiques : aménagements, décharge, pollution, etc. Un projet de réserve naturelle régionale est à l’œuvre concernant les mangroves de la baie de Génipa.  \n  \nLes coupes illégales de bois et le trafic d’espèces indigènes, du Lambi ([*Aliger gigas*](https://inpn.mnhn.fr/espece/cd_nom/972164\n)) ou du Matoutou falaise ([*Caribena versicolor*](https://inpn.mnhn.fr/espece/cd_nom/845739\n)) par exemple, sont des problématiques importantes et la règlementation existante est difficile à faire appliquer.\n\nDe nombreuses espèces indigènes sont menacées par les espèces exotiques introduites : rats, mangouste, Iguane commun, etc. En milieu marin, le Poisson-lion ([*Pterois volitans*](https://inpn.mnhn.fr/espece/cd_nom/425417)), espèce originaire de la région indo-pacifique qui a colonisé toute la Caraïbe, est un consommateur vorace de poissons qui ne connaît pas de prédateurs et a une stratégie de reproduction très efficace. Il est considéré comme une menace majeure pour la biodiversité marine.  	\N	\N	\N	f
69295	1015	TEXT	ecosystems.ecosystems.2.description	A l’interface entre le milieu marin et le milieu terrestre, les mangroves ont des rôles fonctionnels très importants : protection contre l’érosion, piège à sédiment, puit de carbone, épuration de l'eau, nurserie pour poissons… Elles couvrent actuellement plus de 2 000 ha en Martinique, mais occupaient autrefois des surfaces beaucoup plus importantes avant d’être déboisées.  \n  \nEn 2020, et à nouveau en 2021, l'eau a temporairement pris une coloration rose peu commune dans certaines zones de mangroves ! La forte évaporation due à la sécheresse a provoqué une augmentation de la salinité, entraînant un "bloom" (forte multiplication) d'une microalgue qui a donné à l'eau cette couleur surprenante. 	\N	\N	\N	f
69296	1015	TEXT	ecosystems.ecosystems.1.description	Les forêts humides se trouvent principalement dans le nord, sur les massifs montagneux et difficilement accessibles des pitons du Carbet de la Montagne Pelée. On distingue plusieurs types de forêts présentant différents cortèges floristiques en fonction de l’altitude. On y trouve une importante diversité, notamment en espèces endémiques. 	\N	\N	\N	f
69297	1015	TEXT	ecosystems.ecosystems.0.description	Couvrant un linéaire de 50 km sur l’île, surtout dans le sud, les plages sont des lieux de ponte pour 3 espèces de tortues marines et sont également bordées par un cortège floristique intéressant : Patate bord-de-mer([*Ipomoea pes-caprae*](https://inpn.mnhn.fr/espece/cd_nom/445581)), Pois bord-de-mer ([*Canavalia rosea*](https://inpn.mnhn.fr/espece/cd_nom/447163)), Raisinier bord-de-mer ([*Coccoloba uvifera*](https://inpn.mnhn.fr/espece/cd_nom/447455))… Cette végétation est toutefois fortement dégradée par les installations touristiques et l’importante fréquentation de certaines plages. 	\N	\N	\N	f
69298	1015	TEXT	identity.highestPoint	1 397	\N	\N	\N	f
69299	1015	TEXT	interests.locations.4.description	D’une superficie de 207 ha, ce site géré par le Conservatoire du littoral abrite une importante faune et flore patrimoniale. 	\N	\N	\N	f
69300	1015	TEXT	risks.risks.0.name	Une biodiversité fragile, soumise à de nombreuses pressions	\N	\N	\N	f
69301	1015	IMAGE	interests.locations.1.image	\N	2287	Montagne Pelée © Youri Germany - Unsplash	\N	f
69302	1015	IMAGE	ecosystems.ecosystems.1.image	\N	2303	Forêt humide de Martinique © Fabien Lefebvre - Association ACWAA	\N	f
69303	1015	TEXT	interests.locations.3.description	Ces quatre îlets, classés Réserve naturelle nationale depuis 1995, sont l'un des plus importants sites de nidification des oiseaux marins des Petites Antilles. On y trouve entre autres puffins, sternes et noddis. L’accès en est strictement interdit.	\N	\N	\N	f
69304	1015	TEXT	identity.title	La Martinique,  \n« l’île aux iguanes » 	\N	\N	\N	f
69305	1015	IMAGE	species.6.image	\N	2302	*Bothrops lanceolatus* © Maël Dewynter - INPN	\N	f
69306	1015	TEXT	interests.locations.1.name	La Montagne Pelée et les Pitons du Carbet	\N	\N	\N	f
69307	1015	TEXT	statistics.2.text	de l'île couverts par le Parc naturel régional 	\N	\N	\N	f
69308	1015	IMAGE	species.0.image	\N	2288	*Caribena versicolor* © A. Lacoeulhe - INPN	\N	f
69309	1015	TEXT	events.1.date	1635	\N	\N	\N	f
69310	1015	TEXT	interests.locations.4.name	L’étang des Salines	\N	\N	\N	f
69311	1028	IMAGE	presentation.file	\N	1485	affiche écogeste exploitation espèces protégées	\N	f
69053	1010	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
69054	1010	TEXT	understand.text2	Chaque espèce est évaluée par un groupe d’experts selon des critères bien définis tels que la taille de ses populations, son aire de distribution ou encore la disparition de son habitat naturel, pour pouvoir lui attribuer une catégorie. \nLe chiffre présenté ici comprend les espèces classées dans les catégories « éteinte au niveau mondial », « éteinte à l’état sauvage », «&nbsp;disparue au niveau régional », « en danger critique d’extinction », « en danger » et «&nbsp;vulnérable » dans les Listes rouges réalisées en outre-mer.  \n\nIl faut noter qu’une espèce peut être classée menacée sur le territoire national mais pas à l’échelle mondiale si son statut est bon dans d’autres pays. Cependant on trouve en outre-mer de nombreuses espèces [endémiques](/indicateurs/especes-endemiques) qui ne sont présentes nulle part ailleurs dans le monde et dont le statut de menace mondial correspond donc au statut national.	\N	\N	\N	f
69055	1010	TEXT	understand.text1	L'Union internationale pour la conservation de la nature (UICN) développe depuis 1964 un outil de référence permettant de mesurer l'état de conservation de la faune et de la flore mondiale : la Liste rouge. Les espèces y sont classifiées par catégories selon leur degré de vulnérabilité. Cela permet d'identifier les priorités d'action, les progrès accomplis ou les défis à relever pour la conservation des espèces.  \n  \nEn France, l'élaboration de la [Liste rouge nationale des espèces menacées](https://inpn.mnhn.fr/programme/listes-rouges-especes/presentation) est mise en œuvre depuis 2008 par le Muséum national d'Histoire naturelle, l'Office français de la biodiversité et le [Comité français de l'UICN](https://uicn.fr/liste-rouge-france/), en collaboration avec un large réseau d'experts.\n\n	\N	\N	\N	f
69056	1010	TEXT	territories.title	Pourcentage d'espèces menacées	\N	\N	\N	f
69057	1010	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
69058	1010	TEXT	visual.subtitle	Quelques exemples, en part d'espèces menacées par groupe taxonomique	\N	\N	\N	f
69059	1010	TEXT	understand.title1	La Liste rouge de l'UICN	\N	\N	\N	f
69060	1010	TEXT	understand.paragraphs.1.text	Selon l'IPBES*, les cinq facteurs directs de changement qui affectent la nature et qui ont les plus forts impacts à l’échelle mondiale sont, dans l'ordre : les changements d’usage des terres et de la mer, l'exploitation directe de certains organismes, le changement climatique, les pollutions et les espèces exotiques envahissantes. Les impacts de ces différents facteurs sont souvent liés et s'additionnent : l'installation de certaines espèces exotiques peut par exemple être facilitée par les changements climatiques. Dans les îles, les espèces exotiques envahissantes seraient le premier facteur de perte de biodiversité. \n\n*la Plateforme intergouvernementale scientifique et politique sur la biodiversité et les services écosystémiques (IPBES en anglais) est un groupement international d'experts de la biodiversité, créé sous l'égide de l'ONU en 2012. L'IPBES a publié le 6 mai 2019 [le premier rapport d'évaluation mondiale sur la biodiversité et les services écosystémiques](https://www.ipbes.net/news/Media-Release-Global-Assessment-Fr). 	\N	\N	\N	f
69061	1010	TEXT	understand.title2	Plusieurs catégories de risque d’extinction	\N	\N	\N	f
69062	1010	TEXT	presentation.descriptionTerritories	des espèces sont considérées comme éteintes ou menacées	\N	\N	\N	f
69063	1010	TEXT	understand.paragraphs.0.title	Encore beaucoup d'évaluations à réaliser	\N	\N	\N	f
69064	1010	TEXT	understand.keyword	menaces	\N	\N	\N	f
69065	1010	TEXT	ecogestures.title	Que puis-je faire pour protéger les espèces menacées ?	\N	\N	\N	f
69066	1010	IMAGE	presentation.image	\N	2057	Albatros hurleur, archipel de Crozet, TAAF © Julie Tucoulet	\N	f
69067	1010	TEXT	understand.paragraphs.1.title	Quelles menaces pèsent sur les espèces ?	\N	\N	\N	f
69068	1010	IMAGE	visual.image	\N	2559	Carte espèces menacées outre-mer	\N	f
69069	1010	TEXT	visual.title	Les espèces menacées en outre-mer	\N	\N	\N	f
69070	1010	LINK	understand.article	aucun	\N	\N	aucun	f
69312	1028	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
69313	1028	IMAGE	action.cards.2.icon	\N	1145	bagages	\N	f
69314	1028	TEXT	presentation.name	Je ne participe pas à l’exploitation des espèces protégées	\N	\N	\N	f
69315	1028	IMAGE	action.cards.0.icon	\N	1143	pêche	\N	f
69316	1028	IMAGE	presentation.image	\N	1142	Singe hurleur roux, Guyane © Fabien Lefebvre - Association ACWAA	\N	f
69317	1028	TEXT	understand.text	Bois précieux, espèces aux propriétés médicinales, chasse et pêche, nouveaux animaux de compagnie… L'exploitation illégale conduit à la réduction des populations de nombreuses espèces animales et végétales, voire à leur extinction, dans tous les territoires.\n\nLes tortues marines sont particulièrement victimes du braconnage, pour la consommation de leur viande. Si le phénomène est marqué à Mayotte, où plusieurs centaines de tortues sont encore braconnées chaque année lorsqu'elles viennent pondre sur les plages, on observe encore des captures illégales de tortues dans les collectivités des Caraïbes, en Guyane ou en Polynésie française.\n\nA La Réunion, des pêcheurs illégaux dans la Réserve marine sont régulièrement appréhendés de nuit avec des poissons et des langoustes. Sur terre, c'est notamment le Palmiste rouge, endémique du territoire, qui fait l'objet d'une exploitation illégale dans le Parc National.\nAutre exemple en Martinique, où les oursins blancs sont ramassés illégalement, parfois par centaines de kilos, alors que leur pêche n'est autorisée que quelques jours par an et uniquement réservée aux professionnels déclarés. En Guyane, oiseaux et reptiles font également l'objet de trafics.\n\nDes peines de prisons et de lourdes amendes sont régulièrement prononcées contre les braconniers. Pour ne pas conduire à l'extinction des espèces menacées, ne participons pas au trafic illégal d'espèces protégées.	\N	\N	\N	f
69318	1028	IMAGE	action.cards.1.icon	\N	1144	informations	\N	f
69319	1028	TEXT	action.cards.2.description	Je ne rapporte pas d’animaux ou de végétaux dans mes bagages.	\N	\N	\N	f
69320	1028	TEXT	presentation.category	Protéger les espèces	\N	\N	\N	f
69321	1028	TEXT	action.cards.1.description	Je me renseigne sur la provenance de ce que j’achète et je n'accepte pas de produits issus de l'exploitation illégale. 	\N	\N	\N	f
69322	1028	TEXT	presentation.description	Malgré des règlementations qui les protègent, certaines espèces menacées font toujours l’objet de braconnage et d’exploitation illégales.	\N	\N	\N	f
69323	1028	TEXT	action.title	Pour ne pas être complice de l’exploitation d’espèces protégées :	\N	\N	\N	f
69071	1010	TEXT	understand.paragraphs.0.text	De nombreuses espèces ne sont pas encore évaluées ou sont classées dans la catégorie « données insuffisantes ». C’est le cas par exemple pour de nombreux invertébrés, les champignons, ou encore les lichens et mousses, qui sont pourtant essentiels au bon fonctionnement des écosystèmes. Les espèces marines souffrent également d'un important déficit d'évaluations. \nLes chiffres présentés dans les Listes rouges ne sont donc pas exhaustifs, ils se précisent régulièrement au fur et à mesure de l’amélioration des connaissances scientifiques et de la parution de nouveaux travaux.  \n\nDe nombreux territoires d'outre-mer ont développé des chapitres de Listes rouges à l'échelle de leur territoire, mais certains, comme Saint-Pierre-et-Miquelon ou Wallis-et-Futuna sont trop petits pour que l'application de cette méthodologie soit pertinente à cette échelle.  	\N	\N	\N	f
69072	1010	IMAGE	understand.image	\N	2058	Tortue luth, Guyane © Raphael Gailhac - OFB	\N	f
69073	1010	TEXT	understand.paragraphs.2.title	Des programmes de conservation pour les espèces les plus menacées	\N	\N	\N	f
66828	1045	TEXT	events.2.description	Création de la première base scientifique française, Port-Martin, détruite par un incendie deux ans plus tard	\N	\N	\N	f
66829	1045	TEXT	events.3.description	Création de la base Dumont d’Urville sur l'île des Pétrels	\N	\N	\N	f
66830	1045	IMAGE	species.2.image	\N	2199	*Leptonychotes weddellii* © Bruno Marie	\N	f
66831	1045	IMAGE	identity.image	\N	2192	Manchots Adélie © Terres australes et antarctiques françaises	\N	f
66832	1045	TEXT	species.3.description	Le krill désigne un ensemble de nombreuses espèces de crustacés d’eaux froides dont l’espèce la plus fréquente, l’[*Euphausia superba*](https://inpn.mnhn.fr/espece/cd_nom/839509), ressemble à une crevette. Au cœur du réseau alimentaire, le krill se nourrit de plancton, abondant dans les eaux polaires, et sert ensuite de nourriture de base aux poissons, baleines, phoques et oiseaux. Le krill représente sans doute la biomasse la plus abondante de la planète, estimée à plusieurs centaines de millions de tonnes.  \n  \nStatut sur la Liste rouge mondiale pour *Euphausia superba* : préoccupation mineure. 	\N	\N	\N	f
66833	1045	TEXT	events.7.description	Ratification du Protocole de Madrid par la France	\N	\N	\N	f
66834	1045	TEXT	events.7.date	1998	\N	\N	\N	f
66835	1045	TEXT	interests.locations.0.name	La base Dumont d’Urville	\N	\N	\N	f
66836	1045	TEXT	species.1.description	Le Manchot Adélie ([*Pygoscelis adeliae*](https://inpn.mnhn.fr/espece/cd_nom/442302)) est plus petit et plus léger que son cousin empereur. Il s’en distingue également par l’absence de tache auriculaire jaune, et plonge beaucoup moins profond pour sa recherche de nourriture (entre 20 et 30 m de profondeur maximum). La Terre Adélie compterait autour de 175 000 couples reproducteurs, soit 4,6 % de la population mondiale.  \n  \n Statut sur la Liste rouge des oiseaux de Terre Adélie et sur la Liste rouge mondiale : préoccupation mineure.	\N	\N	\N	f
66837	1045	TEXT	species.2.description	Le Phoque de Weddell ([*Leptonychotes weddellii*](https://inpn.mnhn.fr/espece/cd_nom/535503)) partage son temps entre la recherche de nourriture (poissons, calamars…) dans l’eau et le repos sur la banquise antarctique. Les femelles mettent bas sur la glace entre début octobre et mi-novembre. En mer, il est vulnérable face au léopard de mer et à l’orque.  \n  \nStatut sur la Liste rouge des mammifères de Terre Adélie et sur la Liste rouge mondiale : préoccupation mineure. 	\N	\N	\N	f
66838	1045	TEXT	events.0.description	Premières expéditions atteignant le continent blanc	\N	\N	\N	f
66839	1045	TEXT	events.1.description	Débarquement de Jules Dumont d’Urville sur le Rocher du Débarquement, qu’il baptise «&nbsp;Terre Adélie&nbsp;»	\N	\N	\N	f
66840	1045	TEXT	events.8.description	Création d'une aire marine protégée internationale sur la mer de Ross. La France défend aujourd’hui la création d’une vaste aire marine protégée en Antarctique Est bordant notamment de la Terre Adélie.	\N	\N	\N	f
66841	1045	TEXT	events.9.description	Mise en service de L’Astrolabe, nouveau brise-glace qui assure le ravitaillement de la base Dumont d’Urville depuis l’Australie	\N	\N	\N	f
66842	1045	IMAGE	ecosystems.image	\N	2201	Vue sur les glaces de l'océan Austral depuis l'Astrolabe © P. Piriou - TAAF-IPEV-MN	\N	f
66843	1045	TEXT	identity.species	1 007	\N	\N	\N	f
66844	1045	TEXT	statistics.1.number	16 espèces	\N	\N	\N	f
66845	1045	IMAGE	ecosystems.ecosystems.0.image	\N	2202	NA	\N	f
66846	1045	TEXT	statistics.0.number	8 espèces	\N	\N	\N	f
66847	1045	TEXT	statistics.2.number	0	\N	\N	\N	f
66848	1045	TEXT	zoom.title	Quelques repères en Terre Adélie	\N	\N	\N	f
66849	1045	TEXT	species.2.name	Le Phoque de Weddell 	\N	\N	\N	f
69324	1028	TEXT	understand.quote	Certaines espèces peuvent toujours être exploitées ou chassées, mais les règlementations et les quotas doivent être respectés afin de permettre à la ressource de se renouveler durablement.	\N	\N	\N	f
69325	1028	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
66850	1045	TEXT	risks.risks.1.name	Un territoire dédié à la recherche 	\N	\N	\N	f
66851	1045	TEXT	species.4.description	Les manchots ne sont pas les seuls à nicher en Terre Adélie : au total 8 espèces d’oiseaux marins se reproduisent sur l’archipel de Pointe Géologie. Outre le Manchot empereur et le Manchot d’Adélie, il s’agit du Pétrel géant antarctique ([*Macronectes giganteus*](https://inpn.mnhn.fr/espece/cd_nom/994)), du Pétrel des neiges ([*Pagodroma nivea*](https://inpn.mnhn.fr/espece/cd_nom/442180)), du Damier du Cap ([*Daption capense*](https://inpn.mnhn.fr/espece/cd_nom/1002)) du Skua antarctique ([*Stercorarius maccormicki*](https://inpn.mnhn.fr/espece/cd_nom/442378)), de l’Océanite de Wilson ([*Oceanites oceanicus*](https://inpn.mnhn.fr/espece/cd_nom/1039)) et du Fulmar antarctique ([*Fulmarus glacialoides*](https://inpn.mnhn.fr/espece/cd_nom/626335)). \nLes individus sont souvent fidèles à leur site de nidification d’une année sur l’autre. Ils nichent au printemps austral sur les falaises et pentes abruptes ou dans des cavités de la roche. Les effectifs sont variables selon les espèces : d’une quinzaine de couples pour le Pétrel géants à environ 1 500 couples pour l’Océanite de Wilson. D’autres oiseaux visiteurs sont parfois observées. \n\nStatut sur la Liste rouge des oiseaux de Terre Adélie :\nPétrel géant : en danger critique \nFulmar antarctique : vulnérable \nSkua : vulnérable \nDamier du cap : vulnérable \nPétrel des neiges : préoccupation mineure \nOcéanite de Wilson : données insuffisantes \n\nStatut sur la Liste rouge mondiale : préoccupation mineure (pour les 6 espèces). \n	\N	\N	\N	f
66852	1045	TEXT	events.6.description	Signature du Protocole au Traité de l'Antarctique, relatif à la protection de l'environnement en Antarctique (Protocole de Madrid)	\N	\N	\N	f
66853	1045	TEXT	zoom.callToAction	Cliquez sur la carte thématique pour vous repérer en un coup d'œil ! 	\N	\N	\N	f
66854	1045	TEXT	events.6.date	1991	\N	\N	\N	f
66855	1045	TEXT	ecosystems.ecosystems.0.name	NA	\N	\N	\N	f
66856	1045	TEXT	events.4.description	Signature du Traité sur l'Antarctique qui gèle les revendications territoriales et affirme la recherche scientifique comme seul objectif	\N	\N	\N	f
66857	1045	TEXT	events.5.description	Signature de la Convention sur la conservation de la faune et la flore marine de l'Antarctique	\N	\N	\N	f
66858	1045	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
66859	1045	TEXT	interests.locations.2.name	Port Martin	\N	\N	\N	f
66860	1045	TEXT	events.0.date	19<sup>e</sup> siècle	\N	\N	\N	f
66861	1045	TEXT	identity.populationYear	-	\N	\N	\N	f
66862	1045	TEXT	statistics.0.text	d'oiseaux marins nicheurs	\N	\N	\N	f
66863	1045	IMAGE	species.1.image	\N	2194	*Pygoscelis adeliae* © Grant C. 	\N	f
66864	1045	TEXT	events.2.date	1950	\N	\N	\N	f
66865	1045	TEXT	events.5.date	1980	\N	\N	\N	f
66866	1045	TEXT	identity.marineArea	0	\N	\N	\N	f
66867	1045	TEXT	events.8.date	2016	\N	\N	\N	f
66868	1045	TEXT	identity.presentation	Froid polaire, blizzards, longue nuit polaire, en Terre Adélie, secteur angulaire de l'Antarctique, les conditions de vie sont extrêmes et peu d’espèces sont capables de les supporter ! Le territoire est difficilement accessible : à partir du mois de mars, la mer qui borde le continent Antarctique se couvre d’une pellicule de glace qui s’épaissit pour atteindre un à deux mètres durant l’hiver, rendant la navigation et l’accès impossible. Le retour de l’été entraîne la débâcle de cette glace qui se fragmente en plaques partant à la dérive.  \n  \nL’Antarctique dispose d’un régime juridique unique basé sur le Traité sur l’Antarctique signé à Washington en 1959, qui pose le principe du gel de toute revendication territoriale, terrestre ou maritime. La France y fait figure d’«&nbsp;État possessionné&nbsp;». Ce traité est complété par le Protocole relatif à la protection de l'environnement en Antarctique (Protocole de Madrid), qui fait depuis 1991 de l’Antarctique une «&nbsp;*réserve naturelle consacrée à la paix et à la science*&nbsp;». La militarisation et l’exploitation des ressources minérales ne sont pas tolérées dans la zone du Traité.\n	\N	\N	\N	f
66869	1045	IMAGE	interests.locations.0.image	\N	2195	Base Dumont d'Urville © TAAF	\N	f
66870	1045	TEXT	identity.population	0	\N	\N	\N	f
66871	1045	TEXT	species.3.name	Le krill	\N	\N	\N	f
66872	1045	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
66873	1045	TEXT	species.0.name	Le Manchot empereur	\N	\N	\N	f
66874	1045	TEXT	events.4.date	1959	\N	\N	\N	f
66875	1045	IMAGE	interests.locations.2.image	\N	2196	Port Martin © Fonds Yves Vallette	\N	f
66876	1045	TEXT	interests.locations.0.description	Située sur l’île des Pétrels, dans l'archipel de Pointe Géologie à 5 km du continent Antarctique, la base héberge une trentaine de personnes (scientifiques et personnel de maintenance) pendant l’hivernage (de mars à novembre), et jusqu’à 88 pendant l’été. Pendant l’hiver austral, les hivernants sont coupés du monde car l’accès n’est possible ni par bateau, ni par voie aérienne. Construite en 1956, la base est opérationnellement gérée par l’Institut polaire français ([IPEV](https://institut-polaire.fr/fr/)).	\N	\N	\N	f
66877	1045	TEXT	risks.risks.1.description	Une trentaine de projets scientifiques sont menés en Terre Adélie chaque année, principalement en sciences de la Vie et de l’Environnement (stratégies de survie des organismes et adaptation des espèces aux conditions extrêmes, effets des changements climatiques…), en sciences de la Terre et de l’Univers (glaciologie, étude de l’atmosphère, géologie, physique du globe…) mais aussi en sciences humaines (biologie humaine et adaptation aux conditions d’hivernage). Ces expéditions sont orchestrées par l’[Institut Polaire Français](https://www.institut-polaire.fr/language/fr/). \n  \nLe traitement des déchets issus des bases scientifiques est une préoccupation importante pour limiter l’impact de la présence humaine sur le continent Antarctique. Un travail de réduction des volumes de déchet a été entrepris, ainsi que la mise au point de procédures de tri et de stockage. Les déchets sont ensuite rapatriés en Australie, voire en France pour certaines catégories de produits.\n\n**Pour en savoir plus**, visitez le [site des Terres australes et antarctiques françaises](https://taaf.fr/collectivites/presentation-des-territoires/la-terre-adelie/) et consultez le [livret d'identification de la faune de la Terre Adélie](https://taaf.fr/ressources-pedagogiques/le-livret-didentification-de-la-faune-des-taaf/). 	\N	\N	\N	f
66878	1045	TEXT	interests.locations.2.description	A 60 km de la base Dumont d’Urville se trouvent les vestiges de la base de Port Martin, première station française en Antarctique. Installée en 1950, la base a accueilli les missions scientifiques françaises jusqu’à son incendie accidentel dans la nuit du 23 au 24 janvier 1952. Les vestiges de la base sont placés sous un statut de protection particulier en vue de préserver le patrimoine culturel et historique qui s’y trouve.	\N	\N	\N	f
66879	1045	TEXT	interests.locations.1.description	Située à quelques kilomètres de la station Dumont d’Urville, cette base secondaire est occupée uniquement pendant l’été austral. Elle est dédiée à l’organisation des convois terrestres à destination de Concordia, une base franco-italienne implantée à plus de 1 100 km à l’intérieur des terres, sur le secteur angulaire australien.	\N	\N	\N	f
66880	1045	TEXT	statistics.1.text	de mammifères marins	\N	\N	\N	f
66881	1045	TEXT	events.9.date	2017	\N	\N	\N	f
66882	1045	TEXT	identity.subtitle	L'Antarctique, un sanctuaire dédié à la recherche et à la paix	\N	\N	\N	f
66883	1045	IMAGE	species.4.image	\N	2197	*Oceanites oceanicus* © TAAF	\N	f
69074	1010	TEXT	understand.paragraphs.2.text	De nombreux programmes sont mis en place pour tenter de protéger les espèces menacées. Ils visent à organiser des suivis des populations, mettre en œuvre des actions favorables à la restauration de ces populations ou de leur habitat, informer le public et les élus et faciliter l'intégration de la protection de ces espèces dans les politiques publiques.   \n\nParmi ces outils, on trouve notamment les [Plans nationaux d’actions](https://www.ecologie.gouv.fr/plans-nationaux-dactions-en-faveur-des-especes-menacees) qui concernent de nombreuses espèces d’outre-mer telles que l’[Albatros d’Amsterdam](https://inpn.mnhn.fr/espece/cd_nom/669383 \n) (Terres australes françaises), le [Gecko vert de Manapany](https://inpn.mnhn.fr/espece/cd_nom/528679) et le [Bois de Papaye](https://inpn.mnhn.fr/espece/cd_nom/706682) (La Réunion), l’[Iguane des Petites Antilles](https://inpn.mnhn.fr/espece/cd_nom/350755) (Antilles françaises), les tortues marines (Antilles françaises, Guyane et océan Indien) ou encore le [Crabier Blanc](https://inpn.mnhn.fr/espece/cd_nom/418710\n) (Mayotte).  \n  \nLa Commission européenne soutient également des programmes de conservation des espèces et des habitats via son programme de financements LIFE, par exemple le [LIFE+ Pétrels](https://www.petrels.re/) (La Réunion), le [LIFE+ BIODIV'OM](https://www.lifebiodivom.fr/) (5 espèces et un habitat, 5 territoires concernés : Mayotte, Guyane, Saint-Martin, Martinique, La Réunion) ou encore le [LIFE+ Forêt Sèche](https://www.foretseche.re/) (La Réunion).  \n\nIl existe encore bien d'autres initiatives comme un Plan d’action pour la sauvegarde du [Cagou](https://inpn.mnhn.fr/espece/cd_nom/442324) (Nouvelle-Calédonie), le [Plan de conservation en faveur des puffins de l'île de La Réunion](http://www.reunion.developpement-durable.gouv.fr/IMG/pdf/pdc_puffins_ld_interactif.pdf) ou différents programmes de conservation des [oiseaux menacés de Polynésie française](https://www.manu.pf/nos-actions/).	\N	\N	\N	f
69075	1010	TEXT	presentation.description	des espèces d’outre-mer sont considérées comme éteintes ou menacées	\N	\N	\N	f
69076	1010	TEXT	presentation.logoUrl	https://naturefrance.fr/indicateurs/proportion-despeces-eteintes-ou-menacees-dans-la-liste-rouge-nationale	\N	\N	\N	f
69077	1011	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
69078	1011	TEXT	understand.text2	On qualifie de primaire, ou vierge, une forêt où aucune trace d’activité humaine (défrichement, exploitation, fragmentation), passée ou présente, n’est clairement visible et où les processus écologiques ne sont pas perturbés. A l’échelle mondiale, on estime que plus de 80 % des forêts primaires ont disparu, remplacées par des forêts secondaires moins riches écologiquement, et les reliquats sont de plus en plus réduits et fragmentés.  \n\nAvec plus de 90 % de forêts encore intactes, la Guyane présente l’un des territoires les plus vastes de forêts primaires encore préservées.\n	\N	\N	\N	f
69079	1011	TEXT	understand.text1	Les forêts primaires et autres écosystèmes forestiers des outre-mer présentent une biodiversité considérable. Les territoires ultramarins sont cependant très hétérogènes dans leur couverture forestière et leurs caractéristiques : des forêts tropicales humides de Guyane qui couvrent la quasi-totalité du territoire aux forêts boréales de conifères de Saint-Pierre-et-Miquelon, chaque territoire possède une couverture forestière et une biodiversité qui lui est propre. Seuls Saint Barthélemy, les Terres australes françaises et la Terre Adélie ne présentent pas de forêts sur leurs territoires. 	\N	\N	\N	f
69080	1011	TEXT	territories.title	Pourcentage du territoire occupé par la forêt	\N	\N	\N	f
69081	1011	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
69082	1011	TEXT	visual.subtitle	Visualisez les taux de boisement et l'étendue des surfaces forestières en outre-mer	\N	\N	\N	f
69083	1011	TEXT	understand.title1	Les forêts, un réservoir de biodiversité	\N	\N	\N	f
69084	1011	TEXT	understand.paragraphs.1.text	Au-delà de leur rôle pour la préservation de la biodiversité, les forêts fournissent de nombreux services écosystémiques : elles protègent par exemple les sols de l’érosion, préservent les ressources en eau et stockent le carbone. Elles permettent de se fournir en bois de construction et plantes médicinales, bien que ces ressources puissent être surexploitées. Les forêts ont également une grande importance culturelle dans les territoires d'outre-mer, dans les légendes, les arts et le bien-être de la population.\n\nElles sont cependant soumises à de nombreuses pressions : déboisement pour l’agriculture, l’exploitation du bois ou de mines, artificialisation du territoire, introduction d’espèces exotiques envahissantes, effets des changements climatiques, etc. 	\N	\N	\N	f
69085	1011	TEXT	understand.title2	Qu’est-ce qu’une forêt primaire ?	\N	\N	\N	f
70093	1000	TEXT	presentation.title	Le Compteur de biodiversité outre-mer	\N	\N	\N	f
70094	1000	TEXT	testimony.title	Des études inédites sur la biodiversité des outre-mer	\N	\N	\N	f
70095	1000	TEXT	carousel.carouselElements.3.title	20 % d'espèces menacées 	\N	\N	\N	f
70096	1000	IMAGE	carousel.carouselElements.4.image	\N	2659	Plantation de palétuviers par les scolaires du village Utufua, Wallis-et-Futuna © Angelina Tofili	\N	f
69086	1011	TEXT	presentation.descriptionTerritories	du territoire est occupé par des forêts	\N	\N	\N	f
69087	1011	TEXT	understand.paragraphs.0.title	Pourquoi mesurer le taux de boisement ? 	\N	\N	\N	f
69088	1011	TEXT	understand.keyword	forets	\N	\N	\N	f
69089	1011	TEXT	ecogestures.title	Que puis-je faire pour préserver la biodiversité forestière ? 	\N	\N	\N	f
69090	1011	IMAGE	presentation.image	\N	2020	Forêt tropicale humide, Montagne Trésor, Guyane  © Guillaume Feuillet - 97px	\N	f
69091	1011	TEXT	understand.paragraphs.1.title	Des services écosystémiques et une valeur patrimoniale	\N	\N	\N	f
69092	1011	IMAGE	visual.image	\N	2563	Carte forêt outre-mer	\N	f
69093	1011	TEXT	visual.title	Les forêts d'outre-mer	\N	\N	\N	f
69094	1011	LINK	understand.article	aucun	\N	\N	aucun	f
69095	1011	TEXT	understand.paragraphs.0.text	La destruction des forêts est reconnue comme une pression majeure sur la biodiversité. Le suivi du taux de boisement permet de suivre l’évolution de cette pression et donc indirectement l’état de la biodiversité forestière. Sont exclues de ce calcul les forêts urbaines ou à vocation agricole.\n\nDepuis 1990, le taux de boisement reste globalement stable pour les outre-mer français. Cependant, cet indicateur a des limites : il nous donne une indication sur la surface, mais ne renseigne pas sur le bon état écologique de ces forêts.  	\N	\N	\N	f
69096	1011	IMAGE	understand.image	\N	2021	Forêt boréale, Saint-Pierre-et-Miquelon ©  Bruno Letournel - OFB	\N	f
70097	1000	LINK	carousel.carouselElements.4.button	Découvrir les écogestes	\N	\N	/ecogestes	f
70098	1000	IMAGE	carousel.carouselElements.2.image	\N	2657	Noddis noirs (*Anous minutus*), Wallis-et-Futuna © Tristan Berr	\N	f
70099	1000	CHECKBOX	carousel.carouselElements.2.shadowed	true	\N	\N	\N	f
70100	1000	TEXT	presentation.science	Participez aux programmes pour faire progresser la connaissance	\N	\N	\N	f
70101	1000	TEXT	science.text	Rapporter des observations de requins ou de raies, surveiller l’état de santé de coraux, ou encore compter des lucioles: autant d’activités qui composent les Sciences Participatives dans les Outre-mer. Un premier panorama, permettant l’inventaire et la caractérisation de ces activités vient d’être publié, nous en proposons ici une synthèse.  	\N	\N	\N	f
70102	1000	TEXT	carousel.carouselElements.0.title	La faune sauvage des Terres australes françaises	\N	\N	\N	f
70103	1000	IMAGE	carousel.carouselElements.0.image	\N	2658	Elephants de mer sur la plage de la Baie de l'Oiseau, Kerguelen © Bruno Marie	\N	f
70104	1000	TEXT	carousel.carouselElements.1.title	« Les résultats ont nettement dépassé notre objectif initial ! » 	\N	\N	\N	f
70105	1000	LINK	carousel.carouselElements.0.button	Voir le reportage	\N	\N	/media/report/Faune%20TAAF	f
70106	1000	LINK	carousel.carouselElements.1.button	Lire l'article	\N	\N	/media/article/Compagnonnage TeMeUm	f
70107	1000	TEXT	testimony.quote	Dans le cadre du projet de Compteur, le premier état des lieux des programmes de sciences participatives dans les outre-mer a été mené. Consultez [la synthèse des résultats](media/article/Synthèse%20étude%20sciences%20participatives). 	\N	\N	\N	f
70108	1000	TEXT	presentation.ecogestures	Des gestes simples à mettre en place au quotidien	\N	\N	\N	f
70109	1000	LINK	carousel.carouselElements.2.button	Découvrir les territoires	\N	\N	/territoires	f
70110	1000	LINK	carousel.carouselElements.3.button	Consulter l'indicateur	\N	\N	/indicateurs/especes-menacees	f
68264	1041	TEXT	risks.risks.0.description	Bien que la Réserve naturelle nationale des Terres australes françaises constitue un territoire extrêmement préservé, il n’en demeure pas moins qu'il est sujet à un certain nombre de pressions qui relèvent non seulement de facteurs externes, ne pouvant être traités qu’à l’échelle de la planète (changements climatiques, polluants atmosphériques, etc.), mais également de facteurs locaux, liées aux activités humaines passées et/ou présentes sur ces îles :  \n  \nUn vaste cortège d’espèces végétales et animales ont été introduites au cours du temps, volontairement ou involontairement. C’est le cas, entre autres, des mammifères terrestres (rongeurs, lapins, chats). Les interactions entre ces espèces importées avec la flore et la faune locale sont relativement bien connues. Afin de réduire la probabilité de nouvelles introductions sur le territoire, des procédures strictes de biosécurité sont été mises en place par la Réserve avant tout accès.  \n  \nDes activités de pêche se déroulent dans la partie marine de la Réserve. La pêcherie de Kerguelen et de Crozet cible exclusivement la légine australe ([*Dissostichus eleginoides*](https://inpn.mnhn.fr/espece/cd_nom/424025)) mais entraine la capture d’espèces accessoires qui sont peu ou pas valorisées commercialement. Les oiseaux marins, attirés par les hameçons appâtés lors de la mise à l’eau des lignes et de leur remontée à bord, sont particulièrement vulnérables. Les prescriptions techniques mises en place par les TAAF pour limiter cette mortalité aviaire montrent de bons résultats. La déprédation des lignes par les orques et les cachalots, qui conduit à des modifications comportementales de ces mammifères marins et à une pression accrue sur la ressource, constitue un autre enjeu de gestion des pêcheries. Autour des îles Saint-Paul et Amsterdam, la pêche pratique est à la langouste et aux poissons. Si la pression exercée par les casiers et les engins de pêche sur certaines espèces et habitats est réelle, elle n’est néanmoins pour l’instant pas véritablement évaluée.  \n  \nLes autres menaces, bien que prises en compte par la Réserve naturelle dans le cadre de son plan de gestion, sont considérées comme mineures.  \nPour en savoir plus sur ces territoires, consultez le site des [Terres australes et antarctiques françaises](https://taaf.fr/) et le site de [la Réserve naturelle nationale des Terres australes françaises](https://reserve-australes.taaf.fr/). \n	\N	\N	\N	f
68265	1041	TEXT	events.3.date	1522	\N	\N	\N	f
68266	1041	IMAGE	species.3.image	\N	1724	Mâle de *Mirounga leonina* au milieu des manchots royaux © Julie Tucoulet	\N	f
68267	1041	IMAGE	zoom.map	\N	2571	Carte Terres australes françaises	\N	f
68268	1041	TEXT	species.1.name	Les albatros	\N	\N	\N	f
68269	1041	TEXT	species.7.name	Le Phylica	\N	\N	\N	f
68270	1041	TEXT	interests.title	Les différentes îles	\N	\N	\N	f
68271	1041	TEXT	ecosystems.ecosystems.0.description	NA	\N	\N	\N	f
68272	1041	TEXT	identity.highestPoint	1 850	\N	\N	\N	f
68273	1041	TEXT	risks.risks.0.name	Un sanctuaire préservé, mais soumis à des pressions	\N	\N	\N	f
68274	1041	IMAGE	interests.locations.1.image	\N	1729	La base Port aux Français, Kerguelen © Bruno Marie	\N	f
68275	1041	TEXT	identity.title	Les Terres Australes françaises	\N	\N	\N	f
68276	1041	TEXT	species.4.name	L’Otarie à fourrure d’Amsterdam 	\N	\N	\N	f
68277	1041	TEXT	identity.area	7 621 	\N	\N	\N	f
68278	1041	TEXT	species.0.description	Les îles australes, et l’archipel Crozet en particulier, accueillent les plus grandes populations de manchots royaux ([*Aptenodytes patagonicus*](https://inpn.mnhn.fr/espece/cd_nom/441650)) du monde. Leurs immenses colonies peuvent parfois atteindre plus d’un million d’individus. Excellent plongeur, le manchot royal se nourrit en mer de poissons-lanternes et de calmars. On le distingue du Manchot empereur ([*Aptenodytes forsteri*](https://inpn.mnhn.fr/espece/cd_nom/441649)), qui vit en Antarctique, par sa tâche auriculaire (autour de l’oreille) jaune en forme de cuillère. Le duvet du jeune manchot avant sa première mue est marron, ce qui lui vaut le surnom de « kiwi ».  \n  \nStatut sur la Liste rouge des oiseaux des TAAF : préoccupation mineure. 	\N	\N	\N	f
68279	1041	IMAGE	species.6.image	\N	1731	*Pringlea antiscorbutica* © Julie Tucoulet	\N	f
68280	1041	TEXT	identity.highestPointName	Mont Ross (Kerguelen)	\N	\N	\N	f
68281	1041	TEXT	interests.locations.1.name	Kerguelen	\N	\N	\N	f
68282	1041	TEXT	statistics.2.text	de végétaux indigènes	\N	\N	\N	f
68283	1041	IMAGE	species.0.image	\N	1734	Couple d"*Aptenodytes patagonicus* et leur œuf © Julie Tucoulet	\N	f
68284	1041	TEXT	events.1.date	-8 millions d’années 	\N	\N	\N	f
69097	1011	TEXT	presentation.description	du territoire d’outre-mer est occupé par des forêts	\N	\N	\N	f
69098	1011	TEXT	presentation.logoUrl	https://naturefrance.fr/indicateurs/taux-de-boisement-dans-les-outre-mer	\N	\N	\N	f
69099	1001	TEXT	events.2.description	La Guadeloupe devient française	\N	\N	\N	f
69100	1001	TEXT	events.3.description	Disparition du Lamantin des Caraïbes ([*Trichechus manatus*](https://inpn.mnhn.fr/espece/cd_nom/821122)) des eaux de Guadeloupe	\N	\N	\N	f
69101	1001	IMAGE	identity.image	\N	2273	Pointe des Colibris © Olivier Delzon - INPN	\N	f
69102	1001	TEXT	events.7.description	La Guadeloupe obtient le label «&nbsp;Réserve de Biosphère&nbsp;» de l’UNESCO	\N	\N	\N	f
69103	1001	TEXT	events.7.date	1993	\N	\N	\N	f
69104	1001	TEXT	interests.locations.0.name	Le Parc national de la Guadeloupe	\N	\N	\N	f
69105	1001	TEXT	events.0.description	Premières traces d'occupation humaine en Guadeloupe	\N	\N	\N	f
69106	1001	TEXT	events.1.description	Christophe Colomb débarque sur l'île et la baptise Guadeloupe	\N	\N	\N	f
69107	1001	TEXT	events.8.description	Création du [Sanctuaire AGOA](https://sanctuaire-agoa.fr/) pour les mammifères marins qui couvre toutes les Antilles françaises	\N	\N	\N	f
69108	1001	TEXT	events.9.description	Publication de la Liste rouge des oiseaux de Guadeloupe	\N	\N	\N	f
69109	1001	IMAGE	ecosystems.image	\N	2278	Vue sur la Soufrière © Hélène Valenzuela	\N	f
69110	1001	TEXT	identity.species	10 279	\N	\N	\N	f
69111	1001	IMAGE	ecosystems.ecosystems.0.image	\N	2282	La forêt d’altitude sur La Soufrière © Maël Gramain - Unsplash	\N	f
69112	1001	TEXT	zoom.title	Quelques repères en Guadeloupe 	\N	\N	\N	f
69113	1001	TEXT	species.8.name	Le Pic de Guadeloupe	\N	\N	\N	f
69114	1001	TEXT	events.6.description	Création du Parc national de la Guadeloupe	\N	\N	\N	f
69115	1001	TEXT	events.6.date	1989	\N	\N	\N	f
69116	1001	TEXT	events.4.description	Introduction du Raton-Laveur ([*Procyon lotor*](https://inpn.mnhn.fr/espece/cd_nom/60822)) en Guadeloupe depuis le continent américain	\N	\N	\N	f
69117	1001	TEXT	events.5.description	Dernière éruption de la Soufrière	\N	\N	\N	f
69118	1001	TEXT	interests.locations.2.name	La Réserve naturelle nationale des îles de Petite Terre	\N	\N	\N	f
69119	1001	TEXT	ecosystems.ecosystems.3.description	En Guadeloupe, les mangroves se trouvent principalement en bordure du Grand et du Petit Cul-de-Sac marin et à Marie-Galante. On distingue 3 types de mangroves : la mangrove de bord de mer à la salinité constante est le territoire du Palétuvier rouge ([*Rhizophora mangle*](https://inpn.mnhn.fr/espece/cd_nom/447470)) ; la mangrove arbustive à une dizaine de mètres du rivage, où la salinité est extrême, où les Palétuviers noirs ([*Avicennia germinans*](https://inpn.mnhn.fr/espece/cd_nom/629127) et [*A. schaueriana*](https://inpn.mnhn.fr/espece/cd_nom/629128)) abondent ; la mangrove haute, au-delà, où l’on trouve Palétuviers blancs et gris ([*Laguncularia racemosa*](https://inpn.mnhn.fr/espece/cd_nom/630001) et [*Conocarpus erectus*](https://inpn.mnhn.fr/espece/cd_nom/629401)). On y trouve de nombreuses espèces de crabes et d’oiseaux. 	\N	\N	\N	f
69120	1001	TEXT	events.10.date	2019	\N	\N	\N	f
69121	1001	IMAGE	species.1.image	\N	2272	*Macrobrachium carcinus* © Benjamin Guichard - OFB	\N	f
69122	1001	TEXT	events.5.date	1976	\N	\N	\N	f
69123	1001	TEXT	identity.marineArea	90 000	\N	\N	\N	f
69124	1001	TEXT	events.8.date	2010	\N	\N	\N	f
69125	1001	IMAGE	interests.locations.0.image	\N	2265	Rivière Corossol, Parc national de Guadeloupe © Claire Roussel - OFB	\N	f
69126	1001	TEXT	species.6.name	Le Palétuvier rouge	\N	\N	\N	f
69127	1001	IMAGE	interests.locations.3.image	\N	2275	La pointe Est de la Désirade © Grook Da Oger	\N	f
69128	1001	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
69129	1001	TEXT	interests.locations.3.name	La Réserve naturelle nationale de la Désirade	\N	\N	\N	f
69130	1001	TEXT	statistics.1.text	du territoire couvert par la forêt	\N	\N	\N	f
69131	1001	TEXT	events.9.date	2012	\N	\N	\N	f
69132	1001	IMAGE	species.4.image	\N	2280	*Ctenonotus ferreus* © Aurélien Miralles	\N	f
69133	1001	TEXT	events.3.date	18<sup>e</sup> siècle	\N	\N	\N	f
69134	1001	IMAGE	ecosystems.ecosystems.3.image	\N	2283	Mangrove de Guadeloupe © Gaëlle Vandersarren - Comité français UICN	\N	f
69135	1001	IMAGE	species.3.image	\N	2276	*Dynastes hercules* © Vincent Prié - Caracol	\N	f
69136	1001	IMAGE	zoom.map	\N	2267	Carte Guadeloupe	\N	f
69137	1001	TEXT	species.1.name	Les Ouassous	\N	\N	\N	f
69138	1001	TEXT	species.7.name	La Tortue imbriquée	\N	\N	\N	f
69139	1001	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
69140	1001	TEXT	species.4.name	Les Anolis	\N	\N	\N	f
69141	1001	TEXT	identity.area	1 628	\N	\N	\N	f
69142	1001	TEXT	species.0.description	La Frégate superbe ([*Fregata magnificens*](https://inpn.mnhn.fr/espece/cd_nom/2468\n)) est un oiseau marin de grande taille reconnaissable à sa queue fourchue et ses ailes longues et effilées. Le mâle est noir et remarquable par la présence d’une poche rouge sous la gorge qu’il gonfle pendant les parades nuptiales. La femelle et les juvéniles sont tachés de blanc sur le dos et la poitrine. L’espèce n’est cependant plus nicheuse en Guadeloupe.\n\nStatut dans la Liste rouge des oiseaux de Guadeloupe : préoccupation mineure. 	\N	\N	\N	f
69143	1001	TEXT	identity.highestPointName	La Soufrière	\N	\N	\N	f
69144	1001	TEXT	ecosystems.ecosystems.2.name	La forêt humide	\N	\N	\N	f
69145	1001	TEXT	species.7.description	La Tortue imbriquée ([*Eretmochelys imbricata*](https://inpn.mnhn.fr/espece/cd_nom/77347\n)) est l’une des trois espèces de tortues marines qui viennent pondre sur les plages de Guadeloupe. Les tortues marines sont menacées entre autres par les captures accidentelles de pêche, les collisions, l’ingestion de déchets, le braconnage ou encore la destruction de leurs sites d’alimentation. Toutes les espèces de tortues sont protégées, et le réseau des tortues marines de Guadeloupe présente une [charte de bonne conduite à respecter en présence de tortues](http://www.tortuesmarinesguadeloupe.org/les-tortues-marines/la-charte-de-bonne-conduite/) pour les préserver.\n\nStatut dans la Liste rouge mondiale : en danger critique.  	\N	\N	\N	f
69146	1001	TEXT	species.8.description	Aussi appelé Tapeur ou Toto bois, le Pic de Guadeloupe ([*Melanerpes herminieri*](https://inpn.mnhn.fr/espece/cd_nom/442063)) est le seul oiseau endémique de Guadeloupe et seul pic sédentaire des Petites Antilles. Il vit dans les milieux forestiers où il se nourrit principalement d'insectes qu'il trouve sous l'écorce du bois mort. De coloration noire, avec la gorge et l'abdomen rouge, on peut le reconnaitre à l'oreille au son caractéristique du tambourinage rapide que le mâle effectue sur les troncs pour parader et marquer son territoire.  \n\nStatut dans la Liste rouge des oiseaux de Guadeloupe : quasi-menacé. 	\N	\N	\N	f
69147	1001	IMAGE	species.2.image	\N	2266	*Guaiacum officinale* © César Delnatte - INPN	\N	f
69326	1028	TEXT	action.cards.0.description	Je respecte les règlementations de pêche (matériel, technique, zone d'exclusion,...) et ne prélève pas plus qu’autorisé. 	\N	\N	\N	f
66884	1045	TEXT	risks.risks.0.description	Le continent Antarctique est à lui seul l’une des huit écozones de la planète (régions biogéographiques terrestres). Seuls quelques espèces d’oiseaux vivent sur les terres glacées de l’Antarctique et sur les 9 espèces d’oiseaux marins nichant en Antarctique, 8 sont présentes en nidification sur l’archipel de Pointe Géologie, où est installée la Base Dumont d’Urville.  \n  \nMalgré les conditions extrêmes, les eaux glacées de l’océan Austral qui bordent le continent blanc sont pleines de vie. Très riches en krill et en zooplancton, elles accueillent plusieurs espèces de mammifères marins qui viennent s’y nourrir. On y trouve également quelques dizaines d’espèces de poissons et de nombreuses espèces d’invertébrés : mollusques, étoiles de mer et oursins, cnidaires, etc.  \n  \nLe réchauffement climatique est une grande menace pour les colonies d’oiseaux antarctiques et les mammifères marins. La fonte des glaces, les modifications de température et de salinité de l’océan Austral bouleversent l’écosystème entrainant notamment une diminution du plancton et du krill, premiers maillons de la chaîne alimentaire. La plupart des colonies d’oiseaux ont déjà diminué et les scientifiques prédisent un déclin catastrophique d’ici la fin du siècle. \n\n\n	\N	\N	\N	f
66885	1045	TEXT	events.3.date	1956	\N	\N	\N	f
66886	1045	IMAGE	species.3.image	\N	2198	*Euphausia superba* © Uwe Kils	\N	f
66887	1045	IMAGE	zoom.map	\N	2550	Cartographie Terre Adélie	\N	f
66888	1045	TEXT	species.1.name	Le Manchot Adélie	\N	\N	\N	f
66889	1045	TEXT	interests.title	Les bases scientifiques	\N	\N	\N	f
66890	1045	TEXT	ecosystems.ecosystems.0.description	NA	\N	\N	\N	f
66891	1045	TEXT	identity.highestPoint	1 300	\N	\N	\N	f
66892	1045	TEXT	risks.risks.0.name	Des espèces adaptées aux conditions de vie polaires	\N	\N	\N	f
66893	1045	IMAGE	interests.locations.1.image	\N	2200	Cap Prud'homme © Matthieu Weber 	\N	f
66894	1045	TEXT	identity.title	La Terre Adélie,  \ndésert de glace	\N	\N	\N	f
66895	1045	TEXT	species.4.name	Les autres oiseaux marins nicheurs 	\N	\N	\N	f
66896	1045	TEXT	identity.area	432 000	\N	\N	\N	f
69148	1001	TEXT	species.3.description	Le Dynaste scieur de long ([*Dynastes hercules*](https://inpn.mnhn.fr/espece/cd_nom/440144\n)) est l’un des plus gros coléoptères du monde : il peut atteindre 17 cm de long pour 20 cm d’envergure en vol ! Il est protégé sur le territoire depuis 2007.   \nA l’heure actuelle, 1 350 espèces de coléoptères ont été recensées en Guadeloupe mais on estime qu’il pourrait y avoir plusieurs centaines d’espèces encore inconnues.\n  \nStatut dans la Liste rouge mondiale : non évalué.	\N	\N	\N	f
69149	1001	TEXT	species.1.description	Les Ouassous sont des crevettes d’eau douce. Ce terme recouvre une douzaine d’espèces différentes, parmi lesquelles [*Macrobrachium carcinus*](https://inpn.mnhn.fr/espece/cd_nom/534442\n), qui peut atteindre 30 cm de long. Elles sont très sensibles à la pollution des eaux (pesticides, détergents, hydrocarbures…) et plusieurs espèces sont considérées menacées en Guadeloupe. Bien que vivant la majeure partie de leur vie en eau douce, c’est en mer que se développent les premiers stades de leurs larves.  \n  \nStatut dans la Liste rouge mondiale pour *Macrobrachium carcinus* : préoccupation mineure.	\N	\N	\N	f
69150	1001	TEXT	species.2.description	Le Gaïac ([*Guaiacum officinale*](https://inpn.mnhn.fr/espece/cd_nom/629786\n)) est un petit arbre des milieux secs, utilisé pour son bois très dense et ses propriétés médicinales. Surexploité et victime de la destruction de son habitat, il est aujourd’hui considéré en danger d’extinction en Guadeloupe et il est protégé. Les derniers individus sont localisés dans la Réserve naturelle nationale des îlets de Petite Terre.\n\nStatut dans la Liste rouge de la flore vasculaire de Guadeloupe : en danger. 	\N	\N	\N	f
69151	1001	TEXT	statistics.1.number	42 %	\N	\N	\N	f
69152	1001	TEXT	statistics.0.number	1 399	\N	\N	\N	f
69153	1001	TEXT	statistics.2.number	1989	\N	\N	\N	f
69154	1001	TEXT	species.2.name	Le Gaïac	\N	\N	\N	f
69155	1001	TEXT	species.4.description	Les Anolis sont des lézards communément observés sur tout le territoire. Ce terme regroupe plusieurs espèces et sous-espèces endémiques de la Guadeloupe et de ses dépendances, comme l'Anolis de Marie-Galante ([*Ctenonotus ferreus*](https://inpn.mnhn.fr/espece/cd_nom/654829)). Chaque île, voire presque chaque îlet des Antilles, possède une population d’anolis qui se différencie par ses couleurs et sa morphologie. Ils sont tous protégés.  \n  \nStatut dans la Liste rouge mondiale pour *Ctenonotus ferreus* : non évalué.	\N	\N	\N	f
69156	1001	TEXT	zoom.callToAction	Cliquez sur la carte thématique pour vous repérer en un coup d’œil !	\N	\N	\N	f
69157	1001	TEXT	ecosystems.ecosystems.0.name	La forêt d’altitude	\N	\N	\N	f
69158	1001	TEXT	species.5.description	Le Palmier ti-koko ([*Syagrus amara*](https://inpn.mnhn.fr/espece/cd_nom/630761\n)), espèce protégé et endémique des Petites Antilles, est encore abondant en Guadeloupe alors qu'il a presque disparu de Martinique. Son allure ressemble au cocotier, son port est majestueux et ses fruits ressemblent à des petites noix de coco, d’où son nom.\n\nStatut dans la Liste rouge de la flore vasculaire de Guadeloupe : vulnérable. 	\N	\N	\N	f
66897	1045	TEXT	species.0.description	Le Manchot empereur ([*Aptenodytes forsteri*](https://inpn.mnhn.fr/espece/cd_nom/441649)) est l’espèce emblématique de l’Antarctique. La colonie de l’archipel de Pointe Géologie en Terre Adélie compte près de 4 000 couples reproducteurs, soit environ 1,3 % des effectifs mondiaux. Oiseau de l’extrême, le manchot empereur peut plonger jusqu’à 500 m de profondeur, parcourir d’importantes distances en marchant sur la glace, jeuner pendant plus de 100 jours et résister à des températures de -60°C. Contrairement aux autres espèces de la zone, il se reproduit durant l’hiver austral. Le manchot mâle couve l’œuf seul. Après la ponte, la femelle lui transfère l’œuf lors d’une opération délicate et il le gardera sur ses pattes, protégé par un épais repli de peau, pendant que la femelle regagne l’océan pour se nourrir, parfois à plus de 100 km. Par la suite, les parents partent chercher leur nourriture en mer à tour de rôle, l'un d'entre eux restant avec leur oisillon dans la colonie.  \n  \nStatut sur la Liste rouge des oiseaux de Terre Adélie : vulnérable.\nStatut sur la Liste rouge mondiale : quasi-menacé.	\N	\N	\N	f
66898	1045	TEXT	identity.highestPointName	non nommé	\N	\N	\N	f
66899	1045	TEXT	interests.locations.1.name	Cap Prud’Homme 	\N	\N	\N	f
66900	1045	TEXT	statistics.2.text	espèce exotique envahissante	\N	\N	\N	f
69159	1001	TEXT	species.6.description	La mangrove de bord de mer est principalement constituée de Palétuvier rouge ([*Rhizophora mangle*](https://inpn.mnhn.fr/espece/cd_nom/447470\n)), reconnaissable à ses racines-échasses qui se fixent dans les fonds vaseux. Ses graines ont la particularité de germer alors qu’elles sont encore accrochées à l’arbre. Il joue un rôle capital dans la protection des côtes contre la houle, la filtration des eaux saumâtres et ses racines forment une véritable nurserie pour les poissons marins.\n\nStatut dans la Liste rouge de la flore vasculaire de Guadeloupe : préoccupation mineure. 	\N	\N	\N	f
69160	1001	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
69161	1001	TEXT	events.0.date	-3000 ans	\N	\N	\N	f
69162	1001	TEXT	identity.populationYear	2017	\N	\N	\N	f
69163	1001	IMAGE	species.5.image	\N	2281	*Syagrus amara* © Edric - Wikimedia commons	\N	f
69164	1001	TEXT	statistics.0.text	espèces endémiques du territoire	\N	\N	\N	f
69165	1001	TEXT	ecosystems.ecosystems.1.name	Les plages	\N	\N	\N	f
69166	1001	TEXT	events.2.date	1635	\N	\N	\N	f
69167	1001	TEXT	identity.presentation	Formée de deux îles principales, Basse-Terre et Grande-Terre, séparées par un bras de mer et entourées de plusieurs dépendances et d’îlets, la Guadeloupe, en raison de sa taille, son altitude, sa géologie et la diversité de ses paysages, est le territoire le plus riche en espèces, notamment endémiques, des Petites Antilles.  	\N	\N	\N	f
69168	1001	TEXT	identity.population	390 253	\N	\N	\N	f
68779	1013	SELECT	presentation.sourceSelect	inpn	\N	\N	\N	f
68780	1013	TEXT	understand.text2	La taxonomie, ou taxinomie, est la science qui permet de décrire et de classer le vivant. L’espèce est l’unité taxonomique de base. Chaque espèce décrite est classée avec d’autres espèces aux caractéristiques communes au sein d’un même genre, puis d’une famille, d’un ordre, etc. Chaque espèce est identifiée par un nom scientifique latin en deux mots, par exemple [*Pelecanus occidentalis*](https://inpn.mnhn.fr/espece/cd_nom/442189) pour le Pélican brun. Cette dénomination en latin permet un référentiel mondial commun, car une même espèce peut posséder des dizaines de noms usuels différents (dits noms «&nbsp;vernaculaires&nbsp;») à travers le monde, selon les langues et les régions. 	\N	\N	\N	f
66901	1045	IMAGE	species.0.image	\N	2193	*Aptenodytes forsteri* © Nelly Gravier - TAAF	\N	f
66902	1045	TEXT	events.1.date	21 janvier 1840	\N	\N	\N	f
68285	1051	TEXT	body.bodyElements.4.questionAnswer.question	D’où la création de cet observatoire ? 	\N	\N	\N	f
68286	1051	TEXT	body.bodyElements.0.questionAnswer.question	Comment en êtes-vous venue à vous intéresser aux insectes lumineux ? 	\N	\N	\N	f
68287	1051	IMAGE	body.bodyElements.6.image.imageElement	\N	2572	Sortie nocturne d'observation des lucioles © Aline M. - An ba loup-la 	\N	f
68288	1051	TEXT	body.bodyElements.11.questionAnswer.question	L’observatoire pourrait s’étendre à d’autres territoires dans les Antilles et l’outre-mer ?	\N	\N	\N	f
68289	1051	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
68290	1051	TEXT	body.bodyElements.12.paragraph.paragraphText	<strong>Pour en savoir plus</strong> sur le programme *Ti bet a limiè*, consultez [le site internet d’An ba loup-la](https://www.anbaloup-la.fr/observatoire-lucioles/) et accédez au [formulaire de signalement](https://www.anbaloup-la.fr/observatoire-lucioles/je-participe-questionnaire-éclair/) des insectes lumineux. Vous pouvez également suivre les actualités sur [Facebook](https://www.facebook.com/An-ba-loup-la-104338044245248/?modal=admin_todo_tour). 	\N	\N	\N	f
68291	1051	TEXT	body.bodyElements.2.questionAnswer.response	En général, on appelle luciole tout insecte qui vole et qui fait de la lumière, mais pour être plus précis, <strong>il y a deux groupes d’insectes lumineux : les lucioles, qui sont de la famille des Lampyridés, et les taupins, qui sont des Elatéridés</strong>. Chez les lucioles, la lumière provient de l’abdomen, tandis que chez les taupins, on voit deux petits « phares » au niveau du « casque » qui protège la tête de l’insecte. Les lucioles et les taupins sont différents en termes d’écologie, ils n’ont pas les mêmes façons de vivre.\nEn Guadeloupe, on connait 3 espèces de lucioles et 2 espèces de taupins, mais il se pourrait qu’il y ait d’autres espèces qu’on ne connait pas encore.  \n  \n<br>Il n’y a malheureusement pas de données historiques sur l’évolution des populations de ces insectes. La science « d’avant » était vraiment centrée sur le fait de nommer les espèces et de les identifier, mais pas d’étudier le cycle de vie ou de l’état des populations. Combien de temps dure le stade larvaire ? Est-ce que toutes les espèces de lucioles vivent dans le même type de milieu ? <strong>La plupart du temps, on a juste la description morphologique des espèces, on ne sait pas grand-chose de leur écologie</strong>. Et en Guadeloupe, il y a peu de scientifiques locaux, la plupart des scientifiques viennent pour des études ponctuelles, ça complique le suivi à long terme. <br>	\N	\N	\N	f
68292	1051	TEXT	interviewee.presentation	Aline M., créatrice de l'observatoire des lucioles de Guadeloupe	\N	\N	\N	f
68293	1051	TEXT	presentation.name	« Quand on sensibilise aux lucioles, on sensibilise aussi à tous les autres insectes »	\N	\N	\N	f
68294	1051	IMAGE	body.bodyElements.3.image.imageElement	\N	2575	*Pyrophorus phosphorescens*, l'une des espèces de Taupins de Guadeloupe © Aline M. - An ba loup-la 	\N	f
68295	1051	TEXT	presentation.author	Doriane Blottière	\N	\N	\N	f
68296	1051	TEXT	body.bodyElements.7.questionAnswer.question	On dit que les lucioles sont des espèces bioindicatrices, ça veut dire quoi ? 	\N	\N	\N	f
68297	1051	TEXT	presentation.date	26/01/2022	\N	\N	\N	f
68298	1051	TEXT	body.bodyElements.10.questionAnswer.question	Qu’indiquent les premières observations que vous avez recueillies ?	\N	\N	\N	f
69169	1001	TEXT	species.3.name	Le Dynaste scieur de long	\N	\N	\N	f
69170	1001	IMAGE	species.8.image	\N	2277	*Melanerpes herminieri* © C. et P. Guezennec - INPN	\N	f
69171	1001	TEXT	species.0.name	La Frégate superbe	\N	\N	\N	f
69172	1001	TEXT	events.4.date	19<sup>e</sup> siècle	\N	\N	\N	f
69173	1001	IMAGE	interests.locations.2.image	\N	2268	Les îles de la Petite Terre, avec vue sur la Désirade © Olivier Delzons - INPN	\N	f
69174	1001	TEXT	events.11.date	2020 - 2029	\N	\N	\N	f
69175	1001	IMAGE	ecosystems.ecosystems.2.image	\N	2279	La cascade aux écrevisses dans la forêt humide de Guadeloupe © Daniel Öberg - Unsplash	\N	f
70111	1000	TEXT	presentation.text	Les territoires d’outre-mer français présentent une biodiversité particulièrement riche et variée, mais fragilisée par les activités humaines.\nLa mission du Compteur est de donner une vision d’ensemble des enjeux liés à la biodiversité en outre-mer afin que chacun, résident ou voyageur de passage, puisse s’informer et s’impliquer à son échelle pour la préservation de cette biodiversité exceptionnelle.  	\N	\N	\N	f
70112	1000	TEXT	carousel.carouselElements.4.text	Consultez les écogestes et adaptez vos habitudes pour réduire votre impact sur la biodiversité.	\N	\N	\N	f
70113	1000	CHECKBOX	carousel.carouselElements.4.shadowed	true	\N	\N	\N	f
70114	1000	TEXT	carousel.carouselElements.1.text	Le système de compagnonnage mis en place par le programme Te Me Um permet aux acteurs de la préservation de la biodiversité ultramarine d’échanger leurs expériences sur le terrain, et ainsi de se former ou se perfectionner par une rencontre. Présentation de ce dispositif original à travers les expériences de la Société d’étude ornithologique de La Réunion (SEOR).	\N	\N	\N	f
70115	1000	IMAGE	carousel.carouselElements.3.image	\N	2656	 Rainette de Gaucher (*Dendropsophus gaucheri*), Guyane © Raphael Gailhac - Office français de la biodiversité	\N	f
70116	1000	TEXT	presentation.indicators	Des chiffres clés pour comprendre la biodiversité	\N	\N	\N	f
70117	1000	IMAGE	testimony.image	\N	2660	Suivi des récifs coralliens à Wallis-et-Futuna © Sandrine Job	\N	f
67823	1040	TEXT	risks.risks.0.description	La nature est au fondement de la culture polynésienne, source de légendes et croyances, d’usages et de coutumes.  \n\nLa Polynésie française est le territoire comportant le plus grand nombre d’espèces animales et végétales éteintes ou menacées de toutes les collectivités françaises d’outre-mer. Les espèces terrestres endémiques sont particulièrement vulnérables au risque d’extinction au vu de leur répartition réduite et de leurs faibles effectifs. Plus de 142 plantes sont considérées comme rares, vulnérables ou menacées ; plus de 68 espèces de mollusques sont déjà éteints et 70 % des oiseaux terrestres endémiques sont menacés. \nDu fait du nombre important d’îles et de difficultés d’accès à certaines zones (montagnes, falaises), les inventaires sont nécessairement longs et difficiles à organiser et ils sont encore incomplets pour certains taxons, les insectes par exemple.  \n \nLes récifs coralliens et lagons de Polynésie française sont riches et diversifiés. Outre leur rôle écologique, ils ont un intérêt socio-économique vital pour les polynésiens. Les récifs coralliens de Polynésie française sont globalement en bon état, bien qu’ils souffrent des explosions démographiques de l’étoile de mer corallivore [*Acanthaster planci*](https://inpn.mnhn.fr/espece/cd_nom/444461) et d’épisodes de blanchissement de plus en plus intenses et fréquents, probables conséquences du changement climatique global. Ils sont également impactés par le rejet des eaux usées, la sédimentation et les aménagements côtiers, en majorité dans l’archipel de la Société où la densité de population humaine est la plus forte. \n	\N	\N	\N	f
67824	1040	TEXT	ecosystems.ecosystems.2.description	Dans les atolls, notamment dans l'archipel des Tuamotu, les forêts d’origine étaient dominées par les arbres indigènes [*Pisonia grandis*](https://inpn.mnhn.fr/espece/cd_nom/447419) et [*Pandanus tectorius*](https://inpn.mnhn.fr/espece/cd_nom/448797). Elles sont aujourd’hui largement dégradées, remplacées par des cocoteraies pour l’exploitation du coprah. Ces formations étaient également retrouvées dans les îles hautes à basse altitude ou sur les îlots sableux appelés *motus*, mais ont quasiment disparu en raison de l'urbanisation du littoral.	\N	\N	\N	f
67825	1040	IMAGE	interests.locations.8.image	\N	2503	Monarque de Ua Huka © Fred Jacq - INPN	\N	f
67826	1040	TEXT	interests.locations.6.description	L’atoll est célèbre pour sa richesse sous-marine, en particulier ses regroupements exceptionnels de requins gris ([*Carcharhinus amblyrhynchos*](https://inpn.mnhn.fr/espece/cd_nom/423537)). Le lagon, deuxième plus grand de Polynésie française après celui de Rangiroa, s’ouvre sur l’océan par deux passes, au sud et au nord. La passe nord, large de 1 600 m, est la plus grande de toute la Polynésie française. Fakarava, ainsi que six atolls et atolls soulevés environnants, sont classés Réserve de biosphère par l’UNESCO depuis 1977.	\N	\N	\N	f
67827	1040	TEXT	interests.locations.8.description	L’île est la plus riche en oiseaux terrestres endémiques de Polynésie française car c’est seule île habitée des Marquises où le rat noir ([*Rattus rattus*](https://inpn.mnhn.fr/espece/cd_nom/61587)) n’est pas présent. On y trouve notamment la Perruche des Marquises ([*Vini ultramarina*](https://inpn.mnhn.fr/espece/cd_nom/418850)), le Monarque de Ua Huka ([*Pomarea iphis*](https://inpn.mnhn.fr/espece/cd_nom/418876)) ou encore la Rousserolle des Marquises nord ([*Acrocephalus percernis*](https://inpn.mnhn.fr/espece/cd_nom/644051)).	\N	\N	\N	f
67828	1040	TEXT	ecosystems.ecosystems.1.description	Formation marécageuse occupant les zones littorales inondées, les embouchures des rivières et les secteurs marécageux, les submangroves sont dominée par l’arbre [*Hibiscus tiliaceus*](https://inpn.mnhn.fr/espece/cd_nom/710962) et la grande fougère [*Acrostichum aureum*](https://inpn.mnhn.fr/espece/cd_nom/447950). On trouve également des formations marécageuses herbacées, constituées essentiellement de tapis denses de l’herbe indigène [*Paspalum vaginatum*](https://inpn.mnhn.fr/espece/cd_nom/112515).\nCes formations indigènes sont potentiellement menacées par l’expansion des mangroves à [*Rhizophora stylosa*](https://inpn.mnhn.fr/espece/cd_nom/447469), palétuvier introduit à Moorea en 1933. Il est aujourd’hui naturalisé et s’est répandu sur d’autres îles de l’archipel de la Société. \n	\N	\N	\N	f
67829	1040	TEXT	interests.locations.5.description	Ce vaste ensemble regroupe 76 atolls de taille et forme variées, dont des atolls soulevés comme Makatea. Les fonds marins y sont d’une grande richesse. Les atolls de Mururoa et Fangataufa sont tristement célèbres pour avoir été le lieu des essais nucléaires français entre 1966 et 1995.	\N	\N	\N	f
67830	1040	TEXT	interests.locations.9.description	Situés à l’est de la Polynésie française, les Gambier regroupent 14 îles hautes dont Mangareva, la plus grande, ainsi que quelques atolls.	\N	\N	\N	f
67831	1040	TEXT	ecosystems.ecosystems.0.description	Plus de 15 000 km<sup>2</sup> de récifs et de lagons s’étendent autour des îles et atolls des différents archipels. Soumis à la prédation de l’étoile de mer corallivore [*Acanthaster planci*](https://inpn.mnhn.fr/espece/cd_nom/444461), aux épisodes de blanchissement de plus en plus fréquents et aux pressions anthropiques, l'état de santé des coraux varie selon les archipels.  \nAssociés aux écosystèmes récifaux, les herbiers sous-marins sont peu étendus en Polynésie française et sont présents par petits patchs.  	\N	\N	\N	f
67832	1040	TEXT	identity.highestPoint	2 241	\N	\N	\N	f
67720	1040	TEXT	events.2.description	Estimation de la première occupation humaine des îles de la Société	\N	\N	\N	f
67721	1040	TEXT	events.3.description	Première arrivée des européens aux Marquises	\N	\N	\N	f
67722	1040	IMAGE	identity.image	\N	2491	Huahine (archipel de la Société) © Céline Soyer	\N	f
67723	1040	TEXT	events.7.description	Création de la réserve de biosphère UNESCO de Fakarava (Tuamotu)	\N	\N	\N	f
67724	1040	TEXT	events.7.date	1977	\N	\N	\N	f
67725	1040	TEXT	interests.locations.0.name	Les îles de la Société	\N	\N	\N	f
67726	1040	TEXT	events.0.description	émergence de l'île de Tahiti	\N	\N	\N	f
67727	1040	TEXT	events.1.description	Premières traces d'occupation humaine des Marquises	\N	\N	\N	f
67728	1040	TEXT	events.8.description	Création du sanctuaire pour les mammifères marins sur l'ensemble de l'espace maritime	\N	\N	\N	f
67729	1040	TEXT	events.9.description	Publication du Code de l'Environnement de la Polynésie française	\N	\N	\N	f
67730	1040	IMAGE	ecosystems.image	\N	2510	Vue sur les monts Pihaiateta, Pito Hiti et Orohena, Tahiti, Société © Jean-Yves H. Meyer - Délégation à la recherche de la Polynésie française	\N	f
67731	1040	TEXT	identity.species	11 776	\N	\N	\N	f
67732	1040	IMAGE	ecosystems.ecosystems.0.image	\N	2512	Récifs de Taha'a, archipel de la Société © Pamela Carzon - 97px	\N	f
67733	1040	TEXT	zoom.title	Quelques repères en Polynésie française	\N	\N	\N	f
67734	1040	TEXT	events.6.description	Essais nucléaires français à Mururoa et Fantagaufa (Tuamotu)	\N	\N	\N	f
67735	1040	TEXT	events.6.date	1966 - 1995	\N	\N	\N	f
67736	1040	TEXT	events.4.description	Cession de la souveraineté des îles dépendant de la couronne de Tahiti à la France par le roi Pomare V	\N	\N	\N	f
67737	1040	TEXT	events.5.description	Les *Établissements français de l’Océanie* prennent le nom de Polynésie française	\N	\N	\N	f
67738	1040	TEXT	interests.locations.2.name	Tahiti (Société)	\N	\N	\N	f
67739	1040	TEXT	ecosystems.ecosystems.3.description	Sur les îles hautes d’origine volcanique, les forêts humides trouvées dans les vallées et sur les pentes de moyenne altitude sont dominées par le Mara ([*Neonauclea forsteri*](https://inpn.mnhn.fr/espece/cd_nom/447521)), un grand arbre indigène dans les îles de la Société, et le Nahe ([*Angiopteris evecta*](https://inpn.mnhn.fr/espece/cd_nom/448053)), une grande fougère indigène. Les zones au-delà de 900 m d'altitude sont le domaine des forêts de nuages, appelées ainsi en raison de la couverture nuageuse qui les entoure et qui entraine une saturation de l’air en eau et une réduction de la lumière, favorisant le développement des mousses et des épiphytes (plantes qui se servent d’autres plantes comme support). Elles sont particulièrement riches en flore et en faune endémique (en particulier les insectes et les mollusques). On estime qu’en Polynésie française, un tiers des forêts humides d’origine a disparu, surtout dans les zones de basse et moyenne altitude, en raison des incendies, des défrichements pour l'agriculture et l'urbanisation, de l’impact des plantes exotiques envahissantes (dont le petit arbre [*Miconia calvescens*](https://inpn.mnhn.fr/espece/cd_nom/447324)) ou du broutage par des animaux domestiques en divagation(chèvres et cochons notamment). \n	\N	\N	\N	f
67740	1040	TEXT	ecosystems.ecosystems.4.description	Sur les crêtes et les pics de haute altitude, comme les monts Orohena, Pito Hiti et Aorai de Tahiti, se trouve une végétation arbustive dite subalpine, adaptée aux températures basses des sommets et à la forte insolation. Sa superficie totale n'y dépasse pas 125 hectares.  \nCet écosystème est encore en bon état de conservation, car peu dégradé par l’homme en raison de son inaccessibilité, et parce que les conditions écologiques particulières des hauts reliefs ne conviennent pas à la plupart des espèces envahissantes. Cependant, ce milieu unique est fortement menacé par les changements climatiques, un réchauffement des températures pourrait conduire à sa disparition.\n	\N	\N	\N	f
67741	1040	TEXT	ecosystems.ecosystems.4.name	Les maquis sommitaux 	\N	\N	\N	f
67742	1040	TEXT	statistics.3.text	espèces de plantes vasculaires indigènes	\N	\N	\N	f
67743	1040	TEXT	events.10.date	2012	\N	\N	\N	f
67744	1040	IMAGE	interests.locations.6.image	\N	2509	Plage de Fakarava, Tuamotu © Céline Soyer	\N	f
67745	1040	IMAGE	species.1.image	\N	2506	*Gardenia taitensis* © Eole Wind - Wikimedia Commons	\N	f
67746	1040	TEXT	events.5.date	1957	\N	\N	\N	f
67747	1040	TEXT	identity.marineArea	4,8 millions	\N	\N	\N	f
67748	1040	TEXT	events.8.date	2002	\N	\N	\N	f
67749	1040	IMAGE	interests.locations.0.image	\N	2495	Vue sur le mont Otemanu, Bora Bora, Société © Julien Meillon - 97px	\N	f
67750	1040	TEXT	species.6.name	Le Crabe des cocotiers (*‘Aveu ou Kaveu*)	\N	\N	\N	f
67751	1040	IMAGE	interests.locations.3.image	\N	2504	Raivavae, Australes © Pierre Lesage - Wikimedia Commons	\N	f
67752	1040	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
67753	1040	TEXT	interests.locations.3.name	Les Australes	\N	\N	\N	f
67754	1040	TEXT	events.12.date	2018	\N	\N	\N	f
67755	1040	TEXT	statistics.1.text	de lagons	\N	\N	\N	f
67756	1040	TEXT	events.9.date	2003	\N	\N	\N	f
67757	1040	TEXT	interests.locations.9.name	Les Gambier	\N	\N	\N	f
67758	1040	IMAGE	species.4.image	\N	2515	*Chelonia mydas* © Benjamin Guichard - OFB	\N	f
67759	1040	TEXT	events.3.date	16<sup>e</sup> siècle	\N	\N	\N	f
67760	1040	IMAGE	ecosystems.ecosystems.3.image	\N	2513	Forêt humide de fond de vallée de Tahiti © Jean-Yves H. Meyer - Délégation à la Recherche de la Polynésie française	\N	f
67761	1040	IMAGE	species.3.image	\N	2494	*Pomarea nigra* © Fred Jacq - INPN	\N	f
67762	1040	IMAGE	zoom.map	\N	2490	Carte Polynésie française	\N	f
67763	1040	TEXT	species.1.name	Le *Tiare Tahiti*	\N	\N	\N	f
67764	1040	TEXT	species.7.name	Les escargots du genre *Partula*	\N	\N	\N	f
67765	1040	TEXT	interests.title	Iles et archipels	\N	\N	\N	f
67766	1040	TEXT	species.4.name	La Tortue verte (*Honu*)	\N	\N	\N	f
67767	1040	TEXT	identity.area	3 520 	\N	\N	\N	f
67768	1040	TEXT	species.0.description	Le *Tiare ‘apetahi* ([*Sclerotheca raiateensis*](https://inpn.mnhn.fr/espece/cd_nom/908708)) est un arbuste strictement endémique de l’île de Raiatea (archipel de la Société). La cueillette excessive de ses fleurs, l’attaque de ses tiges et son écorce par les rats, le piétinement accidentel de ses plantules par l’Homme, le fouissage des cochons ensauvagés, la compétition avec des plantes exotiques envahissantes et des micro-organismes pathogènes ont conduit à sa raréfaction. L’espèce est protégée depuis 1996 par le Code de l’Environnement polynésien et un plan de conservation a été mis en place en 2009 pour essayer de sauvegarder les dernières populations survivantes.  \n  \nStatut sur la Liste Rouge de la flore vasculaire endémique de Polynésie française : en danger critique.	\N	\N	\N	f
67769	1040	IMAGE	interests.locations.5.image	\N	2497	Motu dans l'atoll de Rangiroa, Tuamotu © Claude Rives - 97px	\N	f
67770	1040	TEXT	identity.highestPointName	Mont Orohena (Tahiti)	\N	\N	\N	f
67771	1040	TEXT	ecosystems.ecosystems.2.name	Les forêts supra-littorales	\N	\N	\N	f
67772	1040	TEXT	species.7.description	Plus de 500 espèces et sous-espèces de gastéropodes terrestres ont été recensées en Polynésie françaises, et elles sont quasiment toutes endémiques. Leur répartition est parfois très limitée et beaucoup d’espèces sont malheureusement considérées comme éteintes.\nLes petits escargots arboricoles de la famille des Partula étaient autrefois très répandus, et leurs coquilles étaient très appréciées pour la réalisation de colliers. Cependant, l’introduction de l’escargot carnivore [*Euglandina rosea*](https://inpn.mnhn.fr/espece/cd_nom/433018) dans les années 1970, pour lutter contre un autre escargot introduit ([*Lissachatina fulica*](https://inpn.mnhn.fr/espece/cd_nom/824950)), a conduit à l’extinction d’une soixantaine d’espèces de Partulas sur les 75 alors répertoriées. \nOnze d'entre elles étaient encore conservées dans des zoos européens et américains. Un programme de réintroduction des Partulas, mis en place par la Direction de l’environnement de Polynésie française a permis de réintroduire 8 espèces éteintes à l'état sauvage entre 2015 et 2019.\n	\N	\N	\N	f
67773	1040	IMAGE	interests.locations.7.image	\N	2496	Vue aérienne de Nuku Hiva, Marquises © Pamela Carzon - 97px	\N	f
67774	1040	IMAGE	species.2.image	\N	2499	*Santalum insulare* © Fred Jacq - INPN	\N	f
67775	1040	IMAGE	ecosystems.ecosystems.4.image	\N	2514	Végétation subalpine de crêtes à Hiva Oa (Marquises) © Jean-Yves H. Meyer - Délégation à la Recherche de la Polynésie française	\N	f
67776	1040	TEXT	interests.locations.6.name	Fakarava (Tuamotu) 	\N	\N	\N	f
67777	1040	TEXT	species.3.description	Le Monarque de Tahiti ([*Pomarea nigra*](https://inpn.mnhn.fr/espece/cd_nom/418875)) est un passereau insectivore forestier, endémique de l’île de Tahiti. L’adulte est entièrement noir, avec un bec et des pattes plus claires, tandis que le jeune est orangé. L’espèce est victime de l’introduction d’espèces exotiques envahissantes, majoritairement de la prédation des œufs par les rats, la compétition avec les oiseaux introduits (Martin triste ([*Acridotheres tristis*](https://inpn.mnhn.fr/espece/cd_nom/601183)) et Bulbul à ventre rouge ([*Pycnonotus cafer*](https://inpn.mnhn.fr/espece/cd_nom/432746))) et la dégradation de son habitat forestier naturel. Au bord de l’extinction, il ne subsistait plus que 12 individus lors de la mise en place d’un programme de conservation en 1998 par la [SOP Manu](https://www.manu.pf/). Avec environ 100 individus estimés en 2020, les effectifs de l’espèce sont en augmentation mais sa survie reste fragile.  \n  \nStatut sur la Liste rouge des oiseaux de Polynésie française : en danger critique. \n	\N	\N	\N	f
67778	1040	TEXT	statistics.3.number	Plus de 885	\N	\N	\N	f
67779	1040	TEXT	species.1.description	Le Tiare Tahiti ([*Gardenia taitensis*](https://inpn.mnhn.fr/espece/cd_nom/447489)) est un arbuste dont les fleurs blanches odorantes sont utilisées pour la fabrication du *monoi* (huile de coprah issue de la noix de coco, dans laquelle sont macérées des fleurs de tiaré). Originaire des îles du Pacifique ouest, il a été introduit par les premiers Polynésiens (comme d’autres plantes cultivées telles que l’arbre à pain, le taro ou le bambou) et est devenu l’une des espèces emblématiques de la Polynésie française. \n  \nStatut sur la Liste rouge mondiale : non évalué. 	\N	\N	\N	f
67780	1040	TEXT	species.2.description	Le Santal polynésien ([*Santalum insulare*](https://inpn.mnhn.fr/espece/cd_nom/447588)) est un arbre endémique de Polynésie française comprenant sept variétés endémiques dans les  archipels de la Société, Marquises et Australes. Hémiparasite, il a besoin de plantes-hôtes pour se développer. \nSon bois très odorant utilisé en médicine traditionnelle, parfumerie ou encore en sculpture, a été surexploité pour servir de monnaie d’échange au 19<sup>e</sup> siècle, ce qui a entrainé sa rareté actuelle. Sa régénération est aujourd’hui menacée par la prédation de ses graines par les rats introduits, ainsi que la disparition des oiseaux disséminateurs des graines, la destruction de son habitat et le développement des plantes exotiques envahissantes. Il est protégé par le Code de l’environnement polynésien. Un programme de sauvegarde mis en place à la fin des années 1990 a permis le reboisement de plusieurs parcelles après la culture de plants en pépinière.  \n  \nStatut sur la Liste rouge de la flore vasculaire endémique de Polynésie française : en danger critique à vulnérable selon les variétés.\n	\N	\N	\N	f
67781	1040	TEXT	statistics.1.number	15 000 km<sup>2</sup>	\N	\N	\N	f
70118	1000	TEXT	carousel.carouselElements.4.title	Tous acteurs de la préservation de la biodiversité	\N	\N	\N	f
67782	1040	TEXT	statistics.0.number	118 îles	\N	\N	\N	f
67783	1040	TEXT	statistics.2.number	Plus de 525 	\N	\N	\N	f
67784	1040	IMAGE	interests.locations.4.image	\N	2505	Rapa, Australes © Sardon - Wikimedia Commons	\N	f
67785	1040	TEXT	species.2.name	Le Santal polynésien (*ahi* ou *puahi*)	\N	\N	\N	f
67786	1040	TEXT	risks.risks.1.name	Les espèces exotiques envahissantes, une cause majeure de l’appauvrissement de la biodiversité polynésienne	\N	\N	\N	f
67787	1040	TEXT	species.4.description	Sur les cinq espèces de tortues marines présentes en Polynésie française, la Tortue verte ([*Chelonia mydas*](https://inpn.mnhn.fr/espece/cd_nom/77338)) est la plus fréquemment observée. Ses sites de ponte connus se situent principalement à l’ouest de l’archipel de la Société, mais le statut des populations polynésiennes est encore mal connu. \nDans la culture traditionnelle polynésienne, les tortues marines sont des animaux sacrés, émanation de Ta’aroa ou Tangaroa, le Dieu des océans, elles guident les navigateurs lors des traversées du Pacifique.\nAutrefois protégées par un *tapu* (interdit), elles n’étaient consommées que par les hommes de haut rang lors de rites complexes et codifiés. Elles sont aujourd’hui intégralement protégées par le Code de l’Environnement de Polynésie, mais sont cependant toujours victimes de braconnage. La détérioration de leurs habitats et des sites de ponte sont également des menaces pour leur survie.  \n  \nStatut sur la Liste rouge mondiale : en danger. 	\N	\N	\N	f
67788	1040	TEXT	zoom.callToAction	Cliquez sur la carte thématique pour vous repérer en un coup d'œil ! 	\N	\N	\N	f
67789	1040	TEXT	ecosystems.ecosystems.0.name	Les récifs coralliens et les lagons	\N	\N	\N	f
67790	1040	TEXT	species.5.description	Le Triton géant ([*Charonia tritonis*](https://inpn.mnhn.fr/espece/cd_nom/368943)) aussi appelé Conque, est l’un des plus grands gastéropodes des récifs de la zone Indo-Pacifique. Sa coquille, qui peut mesurer jusqu’à 50 cm, est traditionnellement utilisée comme instrument de musique à vent. Carnivore, il est l’un des seuls prédateurs connus de l’étoile de mer corallivore [*Acanthaster planci*](https://inpn.mnhn.fr/espece/cd_nom/444461), parfois proliférante dans les lagons. Victime d’une récolte intensive, l’espèce est désormais protégée par le Code de l’Environnement polynésien et sa pêche est interdite.  \n  \nStatut sur la Liste rouge mondiale : non évalué.\n	\N	\N	\N	f
67791	1040	TEXT	species.6.description	Le Crabe des cocotiers ([*Birgus latro*](https://inpn.mnhn.fr/espece/cd_nom/459621)) est le plus gros crabe terrestre au monde : son poids peut atteindre 4 kg et sa longueur 20 cm. Il appartient à la famille des bernard-l'hermite, cependant seuls les juvéniles récupèrent des coquilles de gastéropodes pour protéger leur abdomen. Ce crustacé passe l’ensemble de son cycle de vie sur la terre et possède un régime alimentaire omnivore opportuniste, se nourrissant majoritairement de graines et de fruits, dont les noix de coco, qu’il peut ouvrir grâce à ses pinces puissantes.\nLes populations de crabe des cocotiers sont en régression en Polynésie française en raison de leur surexploitation, car sa chair et ses œufs sont très appréciés. Il est interdit de capturer des individus dont la longueur entre la base de la tête et le début de l’abdomen est inférieure à 6 cm ainsi que les femelles qui portent des œufs ou encore les individus en mue, pour ne pas mettre en danger l’espèce.  \n  \nStatut sur la Liste rouge mondiale : vulnérable.\n	\N	\N	\N	f
67792	1040	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
67793	1040	TEXT	interests.locations.5.name	Les Tuamotu	\N	\N	\N	f
67794	1040	TEXT	events.0.date	1,3 millions d'années	\N	\N	\N	f
67795	1040	TEXT	identity.populationYear	2020	\N	\N	\N	f
67796	1040	TEXT	interests.locations.8.name	Ua Huka (Marquises) 	\N	\N	\N	f
67797	1040	IMAGE	species.5.image	\N	2498	Coquille de *Charonia tritonis* © Antano - Wikimedia Commons	\N	f
67798	1040	TEXT	statistics.0.text	réparties sur 5 archipels	\N	\N	\N	f
67799	1040	TEXT	ecosystems.ecosystems.1.name	La sub-mangrove et les prairies à *Paspalum vaginatum*	\N	\N	\N	f
67800	1040	TEXT	events.2.date	300	\N	\N	\N	f
67801	1040	TEXT	identity.presentation	À plusieurs milliers de kilomètres des continents les plus proches, la Polynésie française, avec ses 118 îles réparties en 5 archipels (Australes, Société, Marquises, Tuamotu, Gambier), s’étend sur une surface grande comme l’Europe. On trouve une grande diversité géomorphologique, des îles volcaniques hautes jeunes de moins d’un million d’années (Tahiti) aux atolls de plusieurs dizaines de millions d’années, ainsi qu’une grande amplitude climatique, allant du climat subtropical au quasi-équatorial. L’extrême isolement géographique des îles de la Polynésie française est à l’origine d’un taux d’endémisme particulièrement élevé de la faune et la flore terrestre, mais il rend aussi la gestion des espaces naturels plus difficile. La nature et la culture sont souvent indissociables dans les savoirs traditionnels du *fenua*.	\N	\N	\N	f
67802	1040	TEXT	identity.population	279 300 	\N	\N	\N	f
67803	1040	TEXT	species.3.name	Le Monarque de Tahiti (*‘Omama’o*)	\N	\N	\N	f
67804	1040	TEXT	risks.risks.2.name	Des statuts de protection variés pour les espaces et les espèces	\N	\N	\N	f
67805	1040	TEXT	species.0.name	Le *Tiare 'apetahi*	\N	\N	\N	f
67806	1040	TEXT	events.4.date	1880	\N	\N	\N	f
67807	1040	IMAGE	interests.locations.2.image	\N	2500	Tahiti, Société © Céline Soyer	\N	f
67808	1040	IMAGE	interests.locations.9.image	\N	2492	Mangareva, Gambier © Fred - Wikimedia Commons	\N	f
67809	1040	TEXT	events.11.date	2015	\N	\N	\N	f
67810	1040	IMAGE	ecosystems.ecosystems.2.image	\N	2507	Forêt à *Pandanus tectorius* sur l'atoll Morane (Tuamotu) © Jean-Yves H. Meyer - Délégation à la Recherche de la Polynésie française	\N	f
67811	1040	TEXT	events.10.description	Création du sanctuaire pour les requins sur l'ensemble de l'espace maritime	\N	\N	\N	f
67812	1040	TEXT	events.11.description	Publication des Listes rouges des oiseaux et de la flore vasculaire endémique de Polynésie française	\N	\N	\N	f
67813	1040	TEXT	interests.locations.0.description	Cet ensemble est divisé en deux groupes : les îles du Vent à l’est, comprenant Tahiti, la plus grande, la plus haute et la plus peuplée des îles de Polynésie française et les îles sous le Vent, à l’ouest avec entre autres la célèbre île de Bora Bora.	\N	\N	\N	f
70119	1000	LINK	science.more	Lire l'article	\N	\N	media/article/Synthèse%20étude%20sciences%20participatives	f
70120	1000	CHECKBOX	carousel.carouselElements.1.shadowed	true	\N	\N	\N	f
70121	1000	TEXT	carousel.carouselElements.3.text	Dans les territoires d’outre-mer, 20 % des espèces sont considérées comme éteintes ou en danger d’extinction selon la Liste rouge des espèces menacées. Comment ce chiffre est-il calculé ? Quelles sont les menaces qui pèsent sur les espèces ? Quelles actions sont mises en place pour les préserver ? 	\N	\N	\N	f
70122	1000	TEXT	carousel.carouselElements.0.text	Crozet, Kerguelen, Saint Paul et Amsterdam, ces îles isolées du sud de l’océan Indien sont soumises à un climat rude et inhospitalier. Elles abritent cependant une faune exceptionnelle et préservée. Le photographe Bruno Marie nous emmène à la rencontre de quelques habitants des « *îles de la Désolation* ».	\N	\N	\N	f
70123	1000	TEXT	presentation.territories	Découvrez l’identité de chaque territoire d’outre-mer	\N	\N	\N	f
70124	1000	TEXT	carousel.carouselElements.2.text	Naviguez parmi les portraits biodiversité des territoires pour mieux comprendre les enjeux avec une sélection de repères et de chiffres clés sur la nature.	\N	\N	\N	f
70125	1000	IMAGE	science.image	\N	2661	Observateur en forêt, Guyane © Pierre-Olivier Jay - 97px	\N	f
70126	1000	TEXT	science.title	Panorama des programmes de sciences participatives ultramarins : les résultats	\N	\N	\N	f
70127	1000	CHECKBOX	carousel.carouselElements.3.shadowed	true	\N	\N	\N	f
70128	1000	TEXT	presentation.quote	Les outre-mer regroupent 80 % de la biodiversité française, réinventons, adaptons notre façon de vivre et de voyager	\N	\N	\N	f
70129	1000	TEXT	carousel.carouselElements.2.title	Partez à la rencontre des espèces et des écosystèmes ultramarins	\N	\N	\N	f
70130	1000	TEXT	testimony.text	L'équipe du Compteur travaille avec ses partenaires sur le développement de nouveaux indicateurs pour enrichir les données disponibles. Des travaux sont également menés sur la perception de la nature et le rapport aux outils numériques. 	\N	\N	\N	f
70131	1000	CHECKBOX	carousel.carouselElements.0.shadowed	true	\N	\N	\N	f
70132	1000	IMAGE	carousel.carouselElements.1.image	\N	2655	Echanges sur le terrain entre les membres de la SEOR et du GEPOMAY © SEOR	\N	f
69176	1001	TEXT	events.10.description	Publication de la Liste rouge de la flore vasculaire de Guadeloupe	\N	\N	\N	f
69177	1001	TEXT	events.11.description	2e Plan national d'actions en faveur des tortues marines des Antilles françaises	\N	\N	\N	f
69178	1001	TEXT	interests.locations.0.description	Créé en 1989 et premier parc national d’outre-mer, son aire d’adhésion s’étend sur 16 communes du territoire et son cœur de parc sur 21 850 ha dont 3 300 ha marins. Tout l’enjeu du [Parc national de Guadeloupe](http://www.guadeloupe-parcnational.fr/fr) est de conjuguer les activités humaines avec la préservation du patrimoine naturel de grande valeur de la Guadeloupe.	\N	\N	\N	f
69179	1001	TEXT	interests.locations.2.description	Composée de deux îles séparées par un chenal de 150 m de large, ce site présente l’une des plus importantes populations d’Iguane des Petites Antilles ([*Iguana delicatissima*](https://inpn.mnhn.fr/espece/cd_nom/350755)). C’est un refuge pour de nombreuses espèces d’oiseaux, un lieu de ponte pour les tortues marines, et on y trouve également le dernier peuplement de Gaïac ([*Guaiacum officinale*](https://inpn.mnhn.fr/espece/cd_nom/629786)), un petit arbre au bois très dense.	\N	\N	\N	f
69180	1001	TEXT	interests.locations.1.description	Entre Basse-Terre et Grande-Terre, cette baie est un véritable réservoir de biodiversité. Côté mer, des herbiers de phanérogames sont entourés par le récif corallien le plus long des Petites Antilles (39 km). Côté terre, la baie est bordée par des mangroves, des forêts marécageuses et marais herbacés sur plus de 5 000 ha. 	\N	\N	\N	f
69181	1001	TEXT	ecosystems.ecosystems.3.name	Les mangroves	\N	\N	\N	f
69182	1001	TEXT	identity.subtitle	Un archipel riche et diversifié	\N	\N	\N	f
69183	1001	IMAGE	species.7.image	\N	2270	*Eretmochelys imbricata* © Benjamin Guichard - OFB	\N	f
69184	1001	TEXT	species.5.name	Le Palmier ti-koko	\N	\N	\N	f
69185	1001	TEXT	risks.risks.0.description	Grâce à la création du Parc national en 1989, la Guadeloupe a permis de développer un statut de protection pour les écosystèmes et les espèces relativement tôt. Cependant, malgré les règlementations de protection, les obligations ne sont pas toujours respectées et les contrôles ne sont pas suffisamment appliqués. Les formations forestières, en particulier sur le littoral, régressent constamment à cause de l’augmentation des aménagements et infrastructures, et beaucoup de défrichements et de remblais sont pratiqués dans l’illégalité.  \n\nDe nombreuses espèces introduites représentent une menace importante pour la biodiversité comme la Petite mangouste indienne ([*Urva auropunctata*](https://inpn.mnhn.fr/espece/cd_nom/850071)), l’Iguane commun ([*Iguana iguana*](https://inpn.mnhn.fr/espece/cd_nom/350756)), la Fourmi manioc ([*Acromyrmex octospinosus*](https://inpn.mnhn.fr/espece/cd_nom/641267)), l’Escargot géant africain ([*Lissachatina fulica*](https://inpn.mnhn.fr/espece/cd_nom/824950)), ou encore le Tulipier du Gabon ([*Spathodea campanulata*](https://inpn.mnhn.fr/espece/cd_nom/448228)).\n\nComme en Martinique, la chlordécone, pesticide utilisé dans les bananeraies entre les années 1970 et 1990 a massivement pollué les milieux naturels de l’île. Si ses impacts sur la santé humaine commencent à être reconnus, ses conséquences sur les espèces et les écosystèmes sont également étudiées. Des études ont notamment montré une importante contamination des organismes marins côtiers, ce qui a conduit à interdire la pêche dans certaines zones.\n\nLe projet de réintroduction du Lamantin des Caraïbes ([*Trichechus manatus*](https://inpn.mnhn.fr/espece/cd_nom/443799)) porté depuis 2014 par le Parc national de Guadeloupe dans le cadre du LIFE SIRENIA, a du être interrompu en 2018. 	\N	\N	\N	f
69186	1001	TEXT	ecosystems.ecosystems.2.description	Entre 300 et 1 000 m d’altitude, la forêt est luxuriante : fougères, arbustes, herbacées, lianes et autres épiphytes, sous le couvert de très grands arbres tels que le Gommier ([*Dacryodes excelsa*](https://inpn.mnhn.fr/espece/cd_nom/447568)) ou l’Acomat boucan ([*Sloanea caribaea*](https://inpn.mnhn.fr/espece/cd_nom/630680)) qui étendent leurs branchages jusqu’à plus de 30 m de haut. 	\N	\N	\N	f
68299	1051	TEXT	body.bodyElements.5.questionAnswer.response	On demande aux gens de nous signaler leurs observations d’insectes lumineux. Il y a [un formulaire en ligne sur le site internet](https://www.anbaloup-la.fr/observatoire-lucioles/) où nous demandons les informations de base : le lieu, la date, et le nombre d’insectes observés. Il y a aussi un questionnaire plus détaillé si les gens sont motivés à nous donner plus d’informations : si l’insecte était en vol, posé, sur quel support, son comportement, etc. Et on peut bien sûr nous envoyer des photos ! Le fait d’utiliser internet peut limiter certaines personnes : c’est aussi possible de faire un signalement par téléphone ou par courrier.  \n  \n<br>On organise aussi des sorties nature, parfois avec le Parc National de Guadeloupe. Le nombre de personnes est limité à une dizaine, pour éviter de perturber le milieu et la reproduction des lucioles. <strong>Les gens viennent en famille, on pique-nique, on apprend à reconnaitre les insectes, à faire la différence entre taupins et lucioles, on explique le cycle de vie, qu’est-ce que la bioluminescence, la fluorescence et la phosphorescence ? Quelles sont les conséquences de certaines lumières sur leur terrasse la nuit pour les insectes ?</strong> On le fait de façon ludique pour les jeunes, avec de la peinture à visage phosphorescente, du light painting... Ça permet aux enfants de s’amuser et découvrir, et aux adultes d’approfondir certains sujets. On parle plus largement de la protection de la biodiversité et  des milieux de Guadeloupe, des idées reçues, des pollutions, etc.<br>\n	\N	\N	\N	f
68300	1051	TEXT	body.bodyElements.11.questionAnswer.response	On a déjà eu des remontées d’infos issues de Saint Martin ou de la Martinique. On aimerait bien développer davantage le projet, mais on a déjà beaucoup à faire sur la Guadeloupe ! Quand on sera bien installés ici on pourra essayer de créer des partenariats avec des organismes dans les différents territoires, ce serait bien de développer l’observatoire sur tout l’outre-mer !	\N	\N	\N	f
68302	1051	TEXT	body.bodyElements.0.questionAnswer.response	Un soir chez moi en Guadeloupe, j’ai vu une luciole et je me suis dit « tiens c’est vrai qu’on n'en voit plus beaucoup, c’est étrange qu’on n’en voit pas plus que ça ». Jusqu’alors, je n’avais pas remarqué qu’on en voyait moins, quand on n’y fait pas attention on ne s’en rend pas compte. Et puis je me suis dit « mais en fait à quoi ça ressemble cette bestiole ? ». J’ai eu la démarche classique de tout un chacun qui s’intéresse à ce qui se passe autour de lui, et je suis partie à la pêche aux informations.  \n  \n<br>Lors de mes recherches, j'ai contacté l’Observatoire des Vers luisants et des Lucioles qui existe dans l'hexagone depuis 2015, il est porté par le Groupe Associatif Estuaire et un référent scientifique du CNRS. C’est comme ça qu’on a monté un partenariat et créé le relai guadeloupéen de l’observatoire, qu’on a nommé avec un terme local : <strong>*Ti bet a limiè*, qui veut dire “petites bêtes lumineuses” en créole antillais</strong>. Ça a un double sens, ça peut aussi vouloir dire “petits trucs lumineux” : même si on est davantage sur les insectes, si on a des infos qui nous parviennent sur d’autres organismes lumineux, on les prend aussi ! On a par exemple retrouvé un champignon bioluminescent. Mais notre spécialité, c’est les insectes lumineux !<br>	\N	\N	\N	f
68303	1051	TEXT	body.bodyElements.2.questionAnswer.question	Que sont justement ces petites bêtes ?	\N	\N	\N	f
68304	1051	TEXT	body.bodyElements.4.questionAnswer.response	Oui. Le rôle de l’observatoire est d’améliorer les connaissances sur les insectes lumineux de Guadeloupe, <stong>mais aussi que l’information revienne aux gens, que la connaissance soit accessible facilement à tout un chacun</stong>. Lors de mes recherches, j’ai trouvé que les informations au sujet de ces insectes étaient difficiles à trouver, même aujourd’hui avec internet. J’ai galéré et pourtant c’est mon domaine d’activité ! Alors même si les gens s’intéressent à ces sujets, ça peut vite décourager. 	\N	\N	\N	f
68305	1051	TEXT	body.bodyElements.10.questionAnswer.response	Le programme est récent, on a démarré en 2019, il faut le temps que l’information circule. La plupart des gens qui passent du temps dans la nature n’ont pas forcément le réflexe ou l’intérêt de venir signaler les petites bêtes, mais le nombre d’observations augmente petit à petit. Certaines personnes ne sont pas très précises sur les informations concernant le lieu, ils ont peut-être peur qu’on débarque dans leur jardin ! On les rassure, ce n’est pas du tout le cas.  \n  \n<br>La grande majorité des infos qu’on reçoit sont sur les espèces qu’on retrouve dans les jardins, dans les maisons ou en balade sur des altitudes basses ou moyennes, et qu’on peut voir plus facilement. Il y a une espèce de luciole endémique de Guadeloupe, [*Photinus discoideus*](https://inpn.mnhn.fr/espece/cd_nom/640037) qui est très peu connue. A priori elle vit sur les hauteurs, dans la forêt humide en altitude, là où il n’y a pas grand monde, donc forcément c’est limité au niveau des retours. <strong>Si on arrive à sensibiliser les promeneurs qui font des grands circuits, on pourrait avoir plus d’infos !</strong><br>\n	\N	\N	\N	f
68306	1051	IMAGE	presentation.image	\N	2574	A la découverte des lucioles de Guadeloupe et de leur milieu de vie © Aline M. - An ba loup-la 	\N	f
68307	1051	TEXT	body.bodyElements.9.questionAnswer.question	Quelles sont les autres causes de la disparition des insectes lumineux ? Pourquoi on observe-t-on moins qu’avant ?	\N	\N	\N	f
68308	1051	TEXT	body.bodyElements.5.questionAnswer.question	Comment peut-on participer à la connaissance des insectes lumineux en Guadeloupe ?	\N	\N	\N	f
68309	1051	TEXT	body.bodyElements.8.citation.citationElement	Les lumières extérieures perturbent leur communication, les adultes ne peuvent pas se retrouver avec leurs signaux lumineux et ne peuvent donc pas se reproduire. 	\N	\N	\N	f
68310	1051	IMAGE	interviewee.photo	\N	2573	Logo Ti bet a limiè	\N	f
68311	1051	TEXT	body.introduction	Depuis quelques années, la structure guadeloupéenne *An ba loup-la* (« sous la loupe » en créole antillais) anime le programme *Ti bet a limiè*, l’Observatoire des lucioles de Guadeloupe. L’objectif ? Recueillir des données sur ces insectes méconnus, mais aussi sensibiliser le public au rôle écologique des insectes et aux perturbations des milieux dont ils sont victimes. Rencontre avec Aline, la créatrice du projet. 	\N	\N	\N	f
68312	1051	TEXT	body.bodyElements.7.questionAnswer.response	<strong>Une espèce bioindicatrice, c’est une espèce qui peut nous renseigner sur l’état de l’environnement</strong>&nbsp;: par exemple si on sait que telle espèce est sensible à la pollution du sol, on sait que si on la trouve à un endroit, ça veut dire que le sol y est peu pollué.  \n  \nToutes les espèces de lucioles du monde ne sont pas forcément de bonnes bioindicatrices, ça dépend de leur cycle de vie. En Guadeloupe, elles pondent dans le sol, donc la qualité du sol et de la litière est importante, si le sol est pollué, par des pesticides par exemple, ça nuit à leur cycle de reproduction. Les larves se nourrissent d’escargots, de limaces, voire de vers de terre. Si ces animaux sont contaminés, la larve le sera aussi et n’arrivera pas au bout de son cycle car elle est très sensible.\n	\N	\N	\N	f
68313	1051	TEXT	body.bodyElements.1.citation.citationElement	Il n’y a malheureusement pas de données historiques sur l’évolution des populations de ces insectes. 	\N	\N	\N	f
68781	1013	TEXT	understand.text1	Plus de 80 % des nouvelles découvertes d'espèces chaque année en France sont réalisées dans les territoires d'outre-mer. Certaines de ces nouvelles descriptions sont issues d’expéditions scientifiques, par exemple celles menées en Guyane en 2014 et en Nouvelle-Calédonie entre 2016 et 2019 par le Muséum national d’Histoire naturelle dans le cadre de la campagne « [la Planète revisitée](https://www.mnhn.fr/fr/recherche-expertise/lieux/planete-revisitee) », mais d’autres sont également réalisées par des taxonomistes non-professionnels. Il peut s'agir également d'espèces déjà décrites dans des territoires frontaliers mais dont la présence n'avait pas encore été observée sur le territoire national. Dans la plupart des cas, il s’agit de petits organismes invertébrés et d’organismes marins (insectes, mollusques, crustacés, vers marins).   \n  \nLe chiffre présenté ici représente une moyenne du nombre de découvertes par an sur les trois dernières années. 	\N	\N	\N	f
68782	1013	TEXT	territories.title	Nouvelles espèces décrites par an	\N	\N	\N	f
68783	1013	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
69788	1022	TEXT	species.3.description	Le Pluvier siffleur ([*Charadrius melodus*](https://inpn.mnhn.fr/espece/cd_nom/441752\n)) est un petit oiseau limicole, dont la couleur du plumage se confond avec le sable et les graviers des plages où il se nourrit et niche. Il est actuellement le limicole nicheur le plus menacé dans l'archipel, à cause du dérangement important causé par l’activité humaine au niveau de l’isthme entre Miquelon et Langlade, site à haute fréquentation locale et touristique pendant l’été. Faute de dispositifs de protection efficaces la dernière nichée observée en 2019 a été un échec, et un seul individu a été observé en 2020.  \n  \nStatut dans la Liste rouge mondiale : quasi menacé. 	\N	\N	\N	f
69789	1022	TEXT	species.1.description	Les macareux moine ([*Fratercula arctica*](https://inpn.mnhn.fr/espece/cd_nom/3402\n)) représentent l’une des plus importantes populations d’oiseaux nicheurs de l’archipel, avec environ 10&nbsp;000 couples présents sur l'îlot du Grand Colombier.\n\nStatut dans la Liste rouge mondiale : vulnérable. 	\N	\N	\N	f
69790	1022	TEXT	species.2.description	Le Lièvre américain ([*Lepus americanus*](https://inpn.mnhn.fr/espece/cd_nom/456604\n)) et le Lièvre arctique ([*Lepus arcticus*](https://inpn.mnhn.fr/espece/cd_nom/61707\n)) ont été introduits pour la chasse respectivement en 1881 et 1982. Présents sur les trois îles, ils occupent des milieux différents : le Lièvre américain se concentre dans les milieux forestiers, sur lesquels il exerce une pression non négligeable, tandis que le Lièvre arctique préfère la végétation de la toundra, formée d’arbustes à éricacées, de lichens et de mousses.  \n  \nStatut local : espèces introduites. 	\N	\N	\N	f
69791	1022	TEXT	statistics.1.number	86 %  	\N	\N	\N	f
69792	1022	TEXT	statistics.0.number	La seule 	\N	\N	\N	f
69793	1022	TEXT	statistics.2.number	1 000	\N	\N	\N	f
69794	1022	IMAGE	interests.locations.4.image	\N	2426	Saint-Pierre © Laurent Malthieux	\N	f
69795	1022	TEXT	species.2.name	Les lièvres	\N	\N	\N	f
69796	1022	TEXT	species.4.description	Le Sapin baumier ([*Abies balsamea*](https://inpn.mnhn.fr/espece/cd_nom/717022\n)) est le conifère dominant de la forêt boréale de Saint-Pierre-et-Miquelon (plus de 80% du peuplement). Caractéristique des forêts boréales nord-américaines, il est parfois accompagné d’autres conifères moins fréquents (Epicéa blanc, Epicéa noir, Mélèze laricin…). En plus de subir des attaques fréquentes de pestes forestières indigènes, il est actuellement menacé par un parasite introduit : le puceron lanigère ([*Adelges piceae*](https://inpn.mnhn.fr/espece/cd_nom/893616\n)).\n\nStatut dans la Liste rouge mondiale : préoccupation mineure. 	\N	\N	\N	f
69797	1022	TEXT	zoom.callToAction	Cliquez sur la carte thématique pour vous repérer en un coup d'œil !	\N	\N	\N	f
69798	1022	TEXT	ecosystems.ecosystems.0.name	Les landes et la toundra	\N	\N	\N	f
69799	1022	TEXT	species.5.description	La Diapensine de Laponie ([*Diapensia lapponica*](https://inpn.mnhn.fr/espece/cd_nom/761885\n)) est une plante typique de la toundra arctico-alpine de l’archipel. Sa forme en coussinet est adaptée aux conditions climatiques très ventées de ce milieu.\n\nStatut dans la Liste rouge mondiale : espèce non évaluée. 	\N	\N	\N	f
69800	1022	TEXT	species.6.description	Reconnaissable à sa floraison en clochettes roses, la Linnée boréale ([*Linnaea borealis*](https://inpn.mnhn.fr/espece/cd_nom/106260\n)) est une herbacée abondante dans la forêt boréale.  \n  \nStatut dans la Liste rouge mondiale : espèce non évaluée. 	\N	\N	\N	f
69801	1022	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
69802	1022	TEXT	events.0.date	1535	\N	\N	\N	f
69803	1022	TEXT	identity.populationYear	2017	\N	\N	\N	f
69804	1022	IMAGE	species.5.image	\N	2430	Diapensine de Laponie © DTAM 975	\N	f
69805	1022	TEXT	statistics.0.text	forêt boréale française	\N	\N	\N	f
69806	1022	TEXT	ecosystems.ecosystems.1.name	Les marais tourbeux et les tourbières	\N	\N	\N	f
69807	1022	TEXT	events.2.date	18<sup>e</sup> siècle 	\N	\N	\N	f
69808	1022	TEXT	identity.presentation	Au sud de l'île de Terre Neuve (Canada), l'archipel se compose de la petit île de Saint-Pierre, où se concentre la majorité de la population, et des îles de Miquelon et Langlade, plus sauvages et préservées. Situé à la confluence du courant froid du Labrador et des eaux plus chaudes du Gulf Stream, l'archipel présente une biodiversité unique en France et une myriade d'écosystèmes, dont la seule forêt boréale française, de très importantes populations d'oiseaux marins et une grande richesse sous-marine.	\N	\N	\N	f
69809	1022	TEXT	identity.population	6 274	\N	\N	\N	f
69810	1022	TEXT	species.3.name	Le Pluvier siffleur	\N	\N	\N	f
69811	1022	IMAGE	species.8.image	\N	2438	Cerfs de Virginie © DTAM 975	\N	f
69812	1022	TEXT	species.0.name	Les phoques	\N	\N	\N	f
69813	1022	TEXT	events.4.date	1881	\N	\N	\N	f
69814	1022	IMAGE	interests.locations.2.image	\N	2420	L'îlot du Grand Colombier © Nathalie De Lacoste	\N	f
69815	1022	IMAGE	ecosystems.ecosystems.2.image	\N	2436	Forêt boréale © DTAM 975	\N	f
69816	1022	TEXT	interests.locations.0.description	Cette lagune de 1 000 ha est bordée de marais et communique avec la mer par un goulet au sud-est. La lagune et les marais qui la bordent sont d’une importante richesse tant faunistique que floristique. Ses bancs de sable accueillent notamment la plus importante colonie reproductrice de phoques veaux-marins du territoire français. Un plan de gestion du site a été validé en 2011 visant à y protéger les espaces naturels remarquables tout en assurant autant que possible leur ouverture au public.	\N	\N	\N	f
69817	1022	TEXT	interests.locations.2.description	Cet ilot situé au nord de l’île de Saint-Pierre est un site de nidification remarquable. Il accueille une grande part des populations d’oiseaux marins nicheuses de l’archipel, voire la totalité des couples pour certaines espèces comme l’Océanite cul-blanc ([*Hydrobates leucorhous*](https://inpn.mnhn.fr/espece/cd_nom/790986)) ou le Macareux moine ([*Fratercula arctica*](https://inpn.mnhn.fr/espece/cd_nom/3402)). Pour ces deux espèces, il s’agit de colonies parmi les plus importantes au niveau mondial. 	\N	\N	\N	f
69818	1022	TEXT	interests.locations.1.description	Cette bande de sable de 12 km de long relie les îles de Miquelon et Langlade depuis la fin du 18<sup>e</sup> siècle. Les dunes colonisées par la végétation sont désormais longées par une piste permettant d'accéder à l'île de Langlade, habitée uniquement en période estivale.	\N	\N	\N	f
69819	1022	TEXT	ecosystems.ecosystems.3.name	Les dunes sableuses et cordons de galets	\N	\N	\N	f
69820	1022	TEXT	identity.subtitle	Un climat subarctique, froid et humide	\N	\N	\N	f
69824	1022	TEXT	ecosystems.ecosystems.2.description	La seule forêt boréale du territoire français se trouve à Saint-Pierre-et-Miquelon. Fortement dégradée par les herbivores introduits, cette forêt présente une végétation arborescente dans les vallées abritées mais se limite à une strate arbustive ou rampante dans les secteurs exposés aux vents. Dominée par les conifères, on y retrouve le caractéristique Sapin baumier ([*Abies balsamea*](https://inpn.mnhn.fr/espece/cd_nom/717022)), l’Epinette blanche ([*Picea glauca*](https://inpn.mnhn.fr/espece/cd_nom/611390)), l’épinette noire ([*Picea mariana*](https://inpn.mnhn.fr/espece/cd_nom/762061)), dans certains milieux tourbeux le Mélèze laricin ([*Larix laricina*](https://inpn.mnhn.fr/espece/cd_nom/717287)), seul conifère qui perd ses épines en hiver, ou encore, bien que rare sur Langlade et Miquelon, l'If du Canada ([*Taxus canadensis*](https://inpn.mnhn.fr/espece/cd_nom/717885)) sous sa forme rampante.	\N	\N	\N	f
69825	1022	TEXT	ecosystems.ecosystems.1.description	Ces zones humides occupent des superficies importantes. Caractérisées par la formation et l’accumulation de tourbe, parfois sur plusieurs mètres d’épaisseur, elles présentent des groupements végétaux remarquables et variés, parmi lesquelles on trouve des sphaignes, des mousses, ainsi que des orchidées.	\N	\N	\N	f
69826	1022	TEXT	ecosystems.ecosystems.0.description	Au-dessus des forêts, les végétaux ligneux adoptent un port prostré et laissent place à des landes dominées par les éricacées au port rampant, dont le Kalmia à feuilles étroites ([*Kalmia angustifolia*](https://inpn.mnhn.fr/espece/cd_nom/762256)). Aux altitudes les plus élevées, cette formation laisse place à une toundra adaptée aux conditions très venteuses, typique des milieux alpins ou arctiques.	\N	\N	\N	f
69827	1022	TEXT	identity.highestPoint	240	\N	\N	\N	f
69828	1022	TEXT	interests.locations.4.description	Chef-lieu du territoire, cette commune concentre 86% de la population de l’archipel. Au début restreinte à la zone portuaire, la ville s’est beaucoup étendue en périphérie ces dernières années, ce qui n’est pas sans causer des problèmes en matière d’assainissement, de gestion des déchets, et de dérangement de la faune aviaire. 	\N	\N	\N	f
69829	1022	TEXT	risks.risks.0.name	Les ressources naturelles, un enjeu important	\N	\N	\N	f
69830	1022	IMAGE	interests.locations.1.image	\N	2423	Vue aérienne de l'isthme © DR	\N	f
69831	1022	IMAGE	ecosystems.ecosystems.1.image	\N	2435	Tourbière près de l’étang de Richepomme © Nathalie de Lacoste	\N	f
69832	1022	TEXT	interests.locations.3.description	Située dans le tissu urbain de la ville de Saint-Pierre, cette enclave de tourbières et étangs de 27 ha est l’une des dernières tourbières de la partie sud de l’île de Saint-Pierre. D’un intérêt écologique fort, en partie car de nombreuses espèces d’oiseaux y font étape durant leur trajet migratoire, le site fait l’objet d’un plan de gestion depuis 2018.\n\n	\N	\N	\N	f
69833	1022	TEXT	identity.title	Saint-Pierre-et-Miquelon,  \ndes terres et des eaux riches en biodiversité	\N	\N	\N	f
69834	1022	IMAGE	species.6.image	\N	2427	*Linnaea borealis* © Serge Muller - MNHN	\N	f
69835	1022	TEXT	interests.locations.1.name	L’isthme	\N	\N	\N	f
69836	1022	TEXT	statistics.2.text	hectares de lagune et de marais au Grand Barachois	\N	\N	\N	f
69837	1022	IMAGE	species.0.image	\N	2419	Juvénile de phoque à capuchon  © Daniel Koelsch - DTAM 975	\N	f
69838	1022	TEXT	events.1.date	17<sup>e</sup> siècle 	\N	\N	\N	f
69839	1022	TEXT	interests.locations.4.name	Saint-Pierre	\N	\N	\N	f
70138	1046	TEXT	article.date	15/03/2022	\N	\N	\N	f
70139	1046	LINK	article.button	Voir le reportage	\N	\N	/media/report/Faune%20TAAF	f
70140	1046	TEXT	article.author	Doriane Blottiere	\N	\N	\N	f
70141	1046	IMAGE	article.image	\N	2662	Elephants de mer sur la plage de la Baie de l'Oiseau © Bruno Marie	\N	f
70142	1046	TEXT	article.title	La faune sauvage des Terres australes françaises	\N	\N	\N	f
\.


--
-- Name: app_user_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.app_user_seq', 1000, true);


--
-- Name: category_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.category_seq', 1017, true);


--
-- Name: ecogesture_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.ecogesture_seq', 1007, true);


--
-- Name: image_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.image_seq', 2662, true);


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

SELECT pg_catalog.setval('public.indicator_value_seq', 1660, true);


--
-- Name: media_category_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.media_category_seq', 1000, false);


--
-- Name: page_element_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.page_element_seq', 70235, true);


--
-- Name: page_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.page_seq', 1054, true);


--
-- Name: api_key api_key_pkey; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.api_key
    ADD CONSTRAINT api_key_pkey PRIMARY KEY (host);


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
-- Name: media_category media_category_pkey; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.media_category
    ADD CONSTRAINT media_category_pkey PRIMARY KEY (id);


--
-- Name: media_category_relation media_category_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.media_category_relation
    ADD CONSTRAINT media_category_relation_pkey PRIMARY KEY (media_page_id, category_id);


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
-- Name: media_category_relation category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.media_category_relation
    ADD CONSTRAINT category_id_fk FOREIGN KEY (category_id) REFERENCES public.media_category(id);


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
-- Name: media_category_relation indicator_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.media_category_relation
    ADD CONSTRAINT indicator_id_fk FOREIGN KEY (media_page_id) REFERENCES public.page(id);


--
-- Name: page_element page_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: biom
--

ALTER TABLE ONLY public.page_element
    ADD CONSTRAINT page_id_fk FOREIGN KEY (page_id) REFERENCES public.page(id);


--
-- PostgreSQL database dump complete
--

