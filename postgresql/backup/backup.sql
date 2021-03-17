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
1007	participer-a-la-connaissance
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	0001	init	SQL	V0001__init.sql	1237318208	biom	2020-11-23 16:43:16.401988	140	t
2	0002	update-indicator	SQL	V0002__update-indicator.sql	412857269	biom	2021-01-18 16:23:14.718412	58	t
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
1216	application/pdf	affiche_exploitation_esp_protegees.pdf
1217	application/pdf	biom_affiche_exploitation_especes_protegees.pdf
1218	application/pdf	biom_affiche_protection_recifs_coralliens.pdf
1219	application/pdf	biom_affiche_je_reduis_consommation_plastique_compressed.pdf
1220	application/pdf	biom_affiche_reduction_dechets_compressed.pdf
1221	application/pdf	biom_affiche_je_participe_connaissance_biodiversite_compressed.pdf
1222	application/pdf	biom_affiche_introduction_especes_eee_compressed.pdf
1223	application/pdf	biom_affiche_protection_faune_sauvage_compressed.pdf
1224	application/pdf	biom_affiche_protection_flore_sauvage_compressed.pdf
1225	application/pdf	biom_affiche_protection_recifs_coralliens_compressed.pdf
\.


--
-- Data for Name: indicator; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.indicator (id, slug, biom_id, is_rounded) FROM stdin;
1007	recifs-coralliens	0a494ee4-1c21-415e-be5d-b71e8f4b0519	f
1001	especes-endemiques	d99e52c9-7c71-47b4-a720-c0878d2993f7	f
1000	especes-exotiques-envahissantes	f2a14850-23a9-43fc-b8d2-56aebb3562f8	f
1003	especes-menacees	7be2a5a6-f226-4fa9-a383-79ca56ca8046	f
1005	conservation-mangroves	e1c91e2e-418e-4bd2-bdfe-7e1025f0b907	f
1004	taux-boisement	8816092b-1ce3-4ae7-815d-019e99ecf545	f
1006	nouvelles-especes	d880a1c3-bf90-46c5-b224-a46958529adf	f
1002	especes-inventoriees	b14bdecd-5a1d-4594-8303-5d6618bb2d0a	f
\.


--
-- Data for Name: indicator_category; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.indicator_category (indicator_id, category_id) FROM stdin;
1000	1000
1001	1001
1003	1000
1004	1002
1005	1003
1007	1003
1006	1001
1002	1001
\.


--
-- Data for Name: indicator_ecogesture; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.indicator_ecogesture (indicator_id, ecogesture_id) FROM stdin;
1000	1003
1001	1006
1001	1000
1001	1005
1001	1001
1003	1000
1003	1005
1003	1006
1004	1005
1004	1006
1005	1005
1005	1002
1007	1001
1006	1007
1002	1007
\.


--
-- Data for Name: indicator_value; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.indicator_value (id, indicator_id, territory, value, unit) FROM stdin;
1052	1002	REUNION	10463	
1049	1002	SAINT_BARTHELEMY	1881	
1051	1002	POLYNESIE_FRANCAISE	11413	
1048	1002	SAINT_MARTIN	2219	
1054	1002	SAINT_PIERRE_ET_MIQUELON	2083	
1045	1002	OUTRE_MER	85117	
1053	1002	MAYOTTE	6039	
1050	1002	NOUVELLE_CALEDONIE	26984	
1047	1002	MARTINIQUE	7009	
1046	1002	GUADELOUPE	10279	
1044	1006	OUTRE_MER	583	
1043	1007	REUNION	21.42857143	%
1039	1007	OUTRE_MER	29.26829268	%
1041	1007	MARTINIQUE	50	%
1032	1005	OUTRE_MER	25	%
1004	1000	REUNION	34	
1000	1000	OUTRE_MER	60	
1002	1000	MARTINIQUE	18	
1001	1000	GUADELOUPE	17	
1005	1000	SAINT_PIERRE_ET_MIQUELON	7	
1003	1000	NOUVELLE_CALEDONIE	38	
1040	1007	GUADELOUPE	60	%
1042	1007	NOUVELLE_CALEDONIE	18.51851852	%
1025	1003	REUNION	34.23298707	%
1022	1003	OUTRE_MER	19.69798074	%
1024	1003	MARTINIQUE	19.40384829	%
1023	1003	GUADELOUPE	28.63712677	%
1030	1004	REUNION	35.2	%
1026	1004	OUTRE_MER	84.64046368	%
1028	1004	MARTINIQUE	46.22641509	%
1027	1004	GUADELOUPE	42.26190476	%
1031	1004	SAINT_PIERRE_ET_MIQUELON	13.04347826	%
1029	1004	NOUVELLE_CALEDONIE	45.78774617	%
1010	1001	REUNION	1487	
1006	1001	OUTRE_MER	16264	
1008	1001	MARTINIQUE	629	
1007	1001	GUADELOUPE	1369	
1011	1001	SAINT_PIERRE_ET_MIQUELON	0	
1009	1001	NOUVELLE_CALEDONIE	7670	
\.


--
-- Data for Name: page; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.page (id, name, model_name, title) FROM stdin;
1002	antilles	territory-zone	bassin antillais
1022	saint-pierre-et-miquelon	territory	Saint-Pierre-et-Miquelon
1014	recifs-coralliens	indicator	Récifs coralliens
1003	territoires	territories	Découvrez les outre-mer
1013	nouvelles-especes	indicator	Nouvelles espèces décrites
1009	especes-inventoriees	indicator	Espèces inventoriées
1010	especes-menacees	indicator	Espèces éteintes et menacées
1011	taux-boisement	indicator	Proportion de forêts
1012	conservation-mangroves	indicator	Conservation des mangroves d'outre-mer
1004	especes-exotiques-envahissantes	indicator	Espèces exotiques envahissantes
1030	mentions-legales	legal-terms	Mentions légales
1017	ecogestes	ecogestures	Accueil écogestes
1018	ecogeste-agir	ecogesture-act	Encadré "agir pour la science" fiche écogeste
1028	exploitation-especes-protegees	ecogesture	Préserver les espèces protégées 
1026	limiation-plastique	ecogesture	Réduire les déchets et le plastique
1023	ne-pas-jeter-dechets-nature	ecogesture	Je ne jette pas mes déchets dans la nature
1029	participer-a-la-connaissance	ecogesture	Participer à la connaissance
1024	protection-contre-eee	ecogesture	Protection contre les EEE
1015	martinique	territory	Martinique
1025	protection-faune	ecogesture	Respecter la faune sauvage
1027	protection-flore	ecogesture	Préserver la flore sauvage
1006	protection-recifs-coralliens	ecogesture	Protéger les récifs coralliens
1001	guadeloupe	territory	Guadeloupe
1021	reunion	territory	La Réunion
1007	apropos	about	A propos
1019	sciences-participatives	science	Sciences participatives
1016	agir-ensemble	act	Agir ensemble
1000	accueil	home	Accueil
1005	indicateurs	indicators	Tous les indicateurs
1020	nouvelle-caledonie	territory	Nouvelle-Calédonie
1008	especes-endemiques	indicator	Espèces endémiques
\.


--
-- Data for Name: page_element; Type: TABLE DATA; Schema: public; Owner: biom
--

COPY public.page_element (id, page_id, type, key, text, image_id, alt, href, title) FROM stdin;
4629	1019	TEXT	presentation.title	Des sciences pour tous	\N	\N	\N	f
4630	1019	IMAGE	images.0.image	\N	1078	© U.S. Fish and Wildlife Service Southeast Region / CC BY 2.0	\N	f
4631	1019	TEXT	examples.projects.2.subject	Suivi de l’état de santé des récifs de La Nouvelle Calédonie	\N	\N	\N	f
4632	1019	TEXT	examples.title	3 exemples de programmes participatifs en outre-mer	\N	\N	\N	f
4633	1019	TEXT	examples.projects.1.target	Ornithologues à titre bénévole ou dans un cadre professionnels (Agents de zones protégées)	\N	\N	\N	f
4634	1019	TEXT	examples.projects.0.target	Plongeurs pratiquant la photo sous-marine	\N	\N	\N	f
4635	1019	TEXT	examples.projects.0.title	Photo-identification des tortues marines à la Réunion	\N	\N	\N	f
4636	1019	TEXT	examples.projects.0.subject	Suivi individuel des tortues marines	\N	\N	\N	f
4637	1019	TEXT	header.subtitle	Permettre à tous les curieux de la nature, du débutant à l’expérimenté, de faire progresser la recherche sur la biodiversité en fournissant aux scientifiques un grand nombre de données de terrain, c’est l’objectif des sciences participatives.\n\nFaune, flore, milieu marin ou terrestre, observations opportunistes ou programmes protocolés, trouvez le programme qui vous correspond et participez au développement des connaissances ! \n	\N	\N	\N	f
4638	1019	TEXT	examples.projects.1.actor	Groupe d’Etude et de Protection des Oiseaux de Guyane (GEPOG)	\N	\N	\N	f
4639	1019	LINK	examples.projects.1.more	En savoir plus	\N	\N	http://www.gepog.org/Nos-actions/Milieux-terrestres/Suivi-Temporel-des-Oiseaux-Communs-STOC-EPS	f
4640	1019	TEXT	examples.projects.2.title	Réseau d’Observation des Récifs Coralliens de Nouvelle-Calédonie	\N	\N	\N	f
4641	1019	TEXT	header.title	C'est quoi les Sciences participatives ?	\N	\N	\N	f
4642	1019	IMAGE	examples.projects.2.image	\N	1083	© Reefcheck France 	\N	f
7058	1015	TEXT	species.7.description	Le Moqueur gorge-blanche (*Ramphocinclus brachyurus*) est un petit oiseau à la face dorsale foncée et la face ventrale blanche endémique de la Martinique et de Sainte-Lucie. Il se trouve uniquement dans les zones boisées de la Presqu’île de la Caravelle. Considéré en danger d’extinction en raison de la petite taille de la population, il est victime de la prédation par les espèces introduites et fait l’objet d’un programme de conservation (LIFE BIODIV’OM).  \n  \nStatut sur la liste rouge des oiseaux de Martinique : en danger critique. 	\N	\N	\N	f
7059	1015	TEXT	species.8.description	Le Gommier blanc (*Dacryodes excelsa*) est l’un des plus grands arbres des forêts de Martinique, il peut atteindre 35 mètres de haut. Il est exploité pour son bois et sa résine.	\N	\N	\N	f
7060	1015	TEXT	events.2.description	Création du PNR de Martinique	\N	\N	\N	f
7061	1015	TEXT	events.3.description	Création de la RNN des ilets de Sainte Anne	\N	\N	\N	f
7062	1015	IMAGE	species.2.image	\N	1063	*Aliger gigas* © divermasterking2000 / CC BY 2.0	\N	f
7063	1015	IMAGE	identity.image	\N	1151	Vue de la Montagne Pelée depuis le Jardin Balata © Weronika/Unsplash	\N	f
7064	1015	IMAGE	ecosystems.ecosystems.4.image	\N	1187	Image manquante	\N	f
7065	1015	TEXT	species.3.description	La Tortue verte (*Chelonia mydas*) est l’une des cinq espèces de tortues marines qui fréquentes les eaux de Martinique. Si elle est régulièrement observable dans l’eau, en alimentation sur les herbiers, elle ne pond que rarement sur les plages de Martinique. Le dérangement répété par les baigneurs peut occasionner une forte dépense d’énergie pour les tortues, c’est pourquoi il est recommandé de garder une distance minimum de quelques mètres et de ne pas tenter de les toucher.  \n  \nStatut sur la Liste rouge des reptiles de Martinique : en danger critique. 	\N	\N	\N	f
7066	1015	TEXT	statistics.3.number	2 000	\N	\N	\N	f
7067	1015	TEXT	interests.locations.0.name	Le Parc naturel régional de Martinique	\N	\N	\N	f
7068	1015	TEXT	species.1.description	L’Iguane des petites Antilles (*Iguana delicatissima*) était autrefois présent sur tout le nord des Petites Antilles, depuis Anguilla jusqu’à la Martinique. Il a aujourd’hui disparu de nombreux territoires, et est classé en danger d’extinction. Sa survie est menacée par l’introduction de l’Iguane commun (*Iguana iguana*) avec qui il ne doit pas être confondu. L’Iguane commun exotique se reconnait aux rayures sombres sur la queue et à sa grosse plaque ronde sur la joue, sous le tympan, que ne possèdent pas l’Iguane des petites Antilles.  \n  \nStatut sur la Liste rouge des reptiles de Martinique : en danger critique.	\N	\N	\N	f
7069	1015	TEXT	species.2.description	Le Lambi (*Aliger gigas*) est un mollusque dont la coquille imposante peut atteindre 30 cm et 1,5 kg. Victime de la surpêche pour sa chair et parfois l’usage décoratif de sa coquille, son exploitation est aujourd’hui strictement contrôlée. La Martinique en a fait son emblème officiel.  	\N	\N	\N	f
7070	1015	TEXT	events.0.description	prise de possession française de l’île	\N	\N	\N	f
7071	1015	TEXT	events.1.description	dernière éruption de la montagne Pelée	\N	\N	\N	f
7072	1015	IMAGE	ecosystems.image	\N	1069	© Fabien Lefebvre	\N	f
7073	1015	TEXT	identity.species	7 009	\N	\N	\N	f
7074	1015	TEXT	statistics.1.number	40	\N	\N	\N	f
7075	1015	IMAGE	ecosystems.ecosystems.0.image	\N	1066	Plage de Martinique © Daniel Öberg/Unsplash	\N	f
7076	1015	TEXT	statistics.0.number	48	\N	\N	\N	f
7077	1015	TEXT	statistics.2.number	2/3	\N	\N	\N	f
7078	1015	IMAGE	interests.locations.4.image	\N	1182	Image manquante	\N	f
7079	1015	TEXT	species.2.name	Le Lambi	\N	\N	\N	f
7080	1015	TEXT	species.8.name	Le Gommier blanc	\N	\N	\N	f
7081	1015	TEXT	species.4.description	L’Ananas bois (*Aechmea reclinata*) a été décrite pour la première fois en 1998 par une équipe du PNRM. Endémique de Martinique, cette espèce n’a été observée qu’en arrière-mangrove de Genipa et sur la montagne du Vauclin. Peu après sa découverte, une grande part de son aire de répartition a été défrichée illégalement pour y planter de la canne à sucre, mettant en péril cette espèce tout juste inventoriée.  \n  \nStatut sur la Liste rouge de la flore vasculaire de Martinique : en danger critique. 	\N	\N	\N	f
7082	1015	TEXT	ecosystems.ecosystems.0.name	Les plages	\N	\N	\N	f
7083	1015	TEXT	species.5.description	L’Herbe à Tortue (*Thalassia testudinum*), également appelée, est une plante marine qui compose les herbiers de phanérogames sous-marins, souvent accompagnée de l’Herbe à Lamentin (*Syringodium filiforme*). Son aire de répartition couvre l’ensemble des Caraïbes, et de nombreuses espèces marines s’en nourrissent. \n  \nStatut sur la Liste rouge mondiale : préoccupation mineure. \n	\N	\N	\N	f
7084	1015	TEXT	species.6.description	Serpent endémique venimeux, le Trigonocéphale (*Bothrops lanceolatus*) a été victime de sa mauvaise réputation bien que peu d’accidents aient été à déplorer et qu’un anti-venin existe désormais. Des primes à la capture ont longtemps existé et dans les années 1980, la mangouste (*Herpestes javanicus*) a été introduite des Indes dans le but de le combattre, cependant le serpent étant nocturne et la mangouste diurne, celle-ci s’est rabattue sur les oiseaux indigènes. Il est aujourd’hui rare sur l’île.  \n  \nStatut sur la Liste rouge des reptiles de Martinique : en danger. 	\N	\N	\N	f
7085	1015	TEXT	events.4.description	publication des premiers résultats la flore de Martinique	\N	\N	\N	f
7086	1015	TEXT	events.5.description	publication de la liste rouge de la Faune de Martinique	\N	\N	\N	f
7087	1015	TEXT	interests.locations.2.name	L’étang des Salines	\N	\N	\N	f
7088	1015	TEXT	ecosystems.ecosystems.3.description	Les herbiers sont composés principalement de phanérogames marines : ce ne sont pas des algues mais bien des plantes aquatiques. Ils sont des lieux de reproduction, de développement et d’alimentation de nombreuses espèces (poissons, oursins, tortues…). En Martinique, ils s’étendent sur les fonds sableux sur près de 5 000 ha.	\N	\N	\N	f
7089	1015	TEXT	ecosystems.ecosystems.4.description	Des communautés coralliennes se développent sur tous les petits fonds de l’île mais elles ne forment de véritables récifs que sur la côte atlantique de l’île et dans la baie de Fort de France. 40 espèces coralliennes sont recensées dans les eaux de l’île. Cependant, une importante partie des colonies sont considérées comme dégradées.	\N	\N	\N	f
7090	1015	TEXT	ecosystems.ecosystems.4.name	Les récifs coralliens	\N	\N	\N	f
7091	1015	TEXT	statistics.3.text	hectares de mangroves sur le territoire	\N	\N	\N	f
7092	1015	TEXT	events.0.date	1635	\N	\N	\N	f
7093	1015	TEXT	identity.populationYear	2017	\N	\N	\N	f
7094	1015	IMAGE	species.5.image	\N	1065	*Thalassia testudinum* © James St. John / CC BY 2.0 	\N	f
7095	1015	TEXT	statistics.0.text	îlets répartis autour de l'île	\N	\N	\N	f
7096	1015	IMAGE	species.1.image	\N	1060	*Iguana delicatissima* © A. Pibot /OFB	\N	f
7097	1015	TEXT	ecosystems.ecosystems.1.name	La forêt humide tropicale	\N	\N	\N	f
7098	1015	TEXT	events.2.date	1976	\N	\N	\N	f
1069	1002	TEXT	description	Les Antilles sont un « point chaud » de la biodiversité mondiale. Si chacun des quatre territoires français du bassin a son identité et ses spécificités, les acteurs locaux collaborent autour de problématiques partagées. 	\N	\N	\N	f
7099	1015	TEXT	events.5.date	2020	\N	\N	\N	f
7100	1015	TEXT	identity.marineArea	45 000	\N	\N	\N	f
7101	1015	TEXT	identity.presentation	Au cœur de l’arc des Petites Antilles, la Martinique, surnommée « l’île aux fleurs » présente une grande diversité de paysages. Au nord, des forêts humides bien conservées entourent la montagne Pelée. Le sud, plus sec et d’une altitude plus faible, est plus peuplé et urbanisé.  	\N	\N	\N	f
7102	1015	IMAGE	interests.locations.0.image	\N	1056	Cascade dans le Parc National Régional de Martinique © B. Guichard / OFB	\N	f
10328	1007	TEXT	partners.partners.0.url	http://www.outre-mer.gouv.fr/	\N	\N	\N	f
10329	1007	TEXT	goal2.quote	Le Compteur constituera un signal d’alerte et donnera une visibilité forte et essentielle pour sensibiliser à l’évolution de la biodiversité.  Livre bleu des outre-mer, 2018. 	\N	\N	\N	f
7103	1015	TEXT	species.6.name	Le Trigonocéphale	\N	\N	\N	f
7104	1015	TEXT	identity.population	372 594	\N	\N	\N	f
7105	1015	IMAGE	interests.locations.3.image	\N	1059	Montagne Pelée © Youri Germany/Unsplash	\N	f
7106	1015	TEXT	species.3.name	La Tortue verte	\N	\N	\N	f
7107	1015	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
7108	1015	IMAGE	species.8.image	\N	1185	Image manquante	\N	f
7109	1015	TEXT	species.0.name	La Matoutou Falaise	\N	\N	\N	f
7110	1015	TEXT	events.4.date	2013	\N	\N	\N	f
7111	1015	IMAGE	interests.locations.2.image	\N	1058	L’Anse Meunier dans l’étang des Salines, Martinique © Hervé Nicolas / CC BY-SA 4.0 	\N	f
7112	1015	IMAGE	ecosystems.ecosystems.2.image	\N	1068	Mangrove, Martinique © schmitt.stelle / CC BY 2.0 	\N	f
7113	1015	TEXT	interests.locations.3.name	La Montagne Pelée et les Pitons du Carbet	\N	\N	\N	f
7114	1015	TEXT	interests.locations.0.description	Créé en 1976, le territoire du parc s’étend sur 32 communes et couvre les 2/3 de l’île. Son objectif est de conjuguer le développement de l’île avec la préservation de ses richesses naturelles et culturelles. 	\N	\N	\N	f
7115	1015	TEXT	interests.locations.2.description	D’une superficie de 207 ha, ce site géré par le Conservatoire du littoral abrite une importante faune et flore patrimoniale. 	\N	\N	\N	f
7116	1015	TEXT	interests.locations.1.description	Gérée par le PNR la presqu’île présente une grande variété d’écosystèmes : savane, falaises, forêt, mangroves. Habitat du moqueur. 	\N	\N	\N	f
10330	1007	TEXT	goal1.title	Partager la connaissance scientifique	\N	\N	\N	f
10331	1007	IMAGE	goal2.quoteImage	\N	1031	Coq de roche © Raphael Gailhac 	\N	f
10332	1007	TEXT	goal2.description	De nombreuses actions locales sont mises en place afin de tenter de préserver les écosystèmes et les espèces. Donner de la visibilité aux acteurs locaux, partager les expériences et les réussites, au bénéfice de tous, c’est également l’un des objectifs du compteur. 	\N	\N	\N	f
10333	1007	TEXT	goal3.description	Chacun, à son échelle, peut agir pour préserver la biodiversité. Connaitre et appliquer des gestes simples, modifier ses habitudes et son comportement ou encore s’investir dans des programmes de sciences participatives, tout le monde est concerné par la préservation de la biodiversité. Le rôle du compteur est d’accompagner les citoyens en partageant des informations claires et adaptées à tous les territoires, et en encourageant à se mobiliser.	\N	\N	\N	f
10334	1007	TEXT	partners.title	Nos partenaires	\N	\N	\N	f
10335	1007	TEXT	goal1.description	Quelles sont les espèces présentes dans ce territoire ? Comment évoluent leurs populations ? Quel est l’état de santé des récifs coralliens ? Pour répondre à ces questions et bien d’autres, différents paramètres, appelés « indicateurs », sont mesurés par les scientifiques pour suivre l’évolution de l’état de la biodiversité. Le compteur a pour mission de rendre compte de l’état de ces connaissances dans tous les territoires. 	\N	\N	\N	f
10336	1007	IMAGE	goal3.image	\N	1032	Mont Orohena, Tahiti © Jean-Yves Meyer	\N	f
10337	1007	TEXT	header.subtitle	La création du Compteur de la biodiversité outre-mer est l’une des mesures du Livre Bleu des outre-mer, lui-même issu des travaux des Assises des outre-mer ayant permis à l’ensemble des citoyens d’outre-mer de prendre la parole pour exprimer leurs besoins et leurs ambitions pour leurs territoires entre octobre 2017 et avril 2018. Un fort besoin de sensibilisation de la population à la richesse de la biodiversité en outre-mer et aux enjeux de sa conservation avait été exprimé. 	\N	\N	\N	f
10338	1007	TEXT	header.title	Pourquoi un compteur de la biodiversité en outre-mer ?	\N	\N	\N	f
10339	1007	CHECKBOX	header.shadowed	false	\N	\N	\N	f
10340	1007	TEXT	goal3.title	Encourager chacun à agir	\N	\N	\N	f
10341	1007	IMAGE	goal2.image	\N	1029	Tortue olivâtre, Guyane © Raphael Gailhac	\N	f
10342	1007	IMAGE	goal1.image	\N	1030	Jaguar, Guyane © Raphael Gailhac	\N	f
10343	1007	TEXT	goal2.title	Valoriser les actions des territoires	\N	\N	\N	f
10344	1007	IMAGE	header.background	\N	1028	Monts Pito Hiti et Orohena, Tahiti © Jean-Yves Meyer	\N	f
7117	1015	TEXT	ecosystems.ecosystems.3.name	Les herbiers sous-marins	\N	\N	\N	f
7118	1015	TEXT	statistics.1.text	espèces de coraux recensées dans les eaux de l'île	\N	\N	\N	f
7119	1015	TEXT	identity.subtitle	titre découverte	\N	\N	\N	f
7120	1015	IMAGE	species.4.image	\N	1064	*Aechmea reclinata* © C. Delnatte (DEAL) / Observatoire Martiniquais de la Biodiversité	\N	f
7121	1015	IMAGE	species.7.image	\N	1184	Image manquante	\N	f
7122	1015	TEXT	species.5.name	L'Herbe à Tortue 	\N	\N	\N	f
7123	1015	TEXT	risks.risks.0.description	L’expansion démographique et l’urbanisation, surtout au centre et au sud de l’île, impactent les milieux naturels : défrichements, rejets domestiques, industriels et agricoles, défrichements…  \n\nLes mangroves sont des milieux particulièrement sensibles et soumis à de fortes pressions anthropiques : aménagements, décharge, pollution, activité agricole. Un projet de réserve naturelle régionale est à l’œuvre concernant les mangroves de la baie de Génipa. \nLes coupes illégales de bois et le trafic d’espèces indigènes, de la Matoutou falaise par exemple, sont des problématiques importantes, et la règlementation existante est difficile à faire appliquer.  \n\nDe nombreuses espèces sont menacées par les espèces exotiques envahissantes : iguane commun, rats, mangouste… En milieu marin, le poisson-lion, espèce indo-pacifique qui a colonisé toute la Caraïbe, est un consommateur vorace de poissons qui ne connait pas de prédateurs et a une stratégie de reproduction très efficace, il est considéré comme une menace majeure pour la biodiversité marine. \nLes échouages de sargasses sont un phénomène naturel dont l’ampleur a considérablement augmenté ces dernières années. Les radeaux denses et les dépôts épais qu’elles forment sur les plages piègent de nombreuses espèces dont des tortues, et ont également un impact sanitaire et économique important.  \n\nLa chlordécone, pesticide utilisé dans les bananeraies entre les années 1970 et 1990 a massivement pollué les milieux naturels de l’île. Si ces impacts sur la santé humaine commencent à être connus, peu de données sont disponibles sur ses conséquences sur les espèces, cependant des études ont montré une importante contamination des organismes marins côtiers ce qui a conduit à règlementer la pêche.  	\N	\N	\N	f
7124	1015	TEXT	events.3.date	1995	\N	\N	\N	f
7125	1015	TEXT	ecosystems.ecosystems.2.description	A l’interface entre le milieu marin et le milieu terrestre, la mangrove a des rôles fonctionnels très important : protection contre l’érosion, piège à sédiment, puit de carbone… Elles couvrent actuellement plus de 2 000 ha en Martinique, mais occupaient autrefois des surfaces beaucoup plus importantes avant d’être déboisées. 	\N	\N	\N	f
7126	1015	IMAGE	ecosystems.ecosystems.3.image	\N	1186	Image manquante	\N	f
7127	1015	IMAGE	species.3.image	\N	1062	*Chelonia mydas* © Benjamin Guichard/OFB	\N	f
7128	1015	TEXT	species.1.name	L'Iguane des petites Antilles	\N	\N	\N	f
7129	1015	TEXT	species.7.name	Le Moqueur gorge-blanche	\N	\N	\N	f
7130	1015	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
7131	1015	TEXT	ecosystems.ecosystems.1.description	Les forêts se trouve principalement dans le nord, sur les massifs montagneux et difficilement accessible des pitons du Carbet de la Montagne Pelée. On distingue plusieurs types de forêt présentant différents cortèges floristiques en fonction de l’altitude. On y trouve une importante diversité, notamment en espèces endémiques. 	\N	\N	\N	f
7132	1015	TEXT	ecosystems.ecosystems.0.description	Couvrant 50 km de l’île, surtout dans le sud, les plages sont des lieux de ponte pour 3 espèces de tortues marines et sont également bordées par un cortège floristique intéressant : patates bord de mer, pois bord de mer, raisinier bord de mer… Cette végétation est toutefois fortement dégradée par les installations touristiques et l’importante fréquentation de certaines plages. 	\N	\N	\N	f
4643	1019	IMAGE	examples.projects.1.image	\N	1082	Tangara évêque © P. Ingremeau 	\N	f
4644	1019	IMAGE	images.2.image	\N	1087	© Riccardo.salvini  / CC BY 4.0 	\N	f
4645	1019	TEXT	paragraphs.1.title	Les projets adossés à des programmes de recherche	\N	\N	\N	f
4646	1019	TEXT	presentation.description	Les sciences participatives, par définition, sont réalisées par des non-professionnels et de manière bénévole. On peut distinguer trois catégories différentes de programmes participatifs selon leurs objectifs.	\N	\N	\N	f
4647	1019	TEXT	paragraphs.0.text	Il s’agit de projet d’inventaires et de signalements destinés aux amateurs sachant identifier les taxons observés. Les débutants y sont les bienvenus.\nL’objet principal est de partager de la connaissance, les données seront éventuellement mobilisables a posteriori dans un projet de recherche ou dans un objectif de conservation.	\N	\N	\N	f
7133	1015	TEXT	identity.highestPoint	1 397	\N	\N	\N	f
7134	1015	TEXT	interests.locations.4.description	Quatre ilets, gérés par le PNR et l’ONF, un des plus importants sites de nidification des oiseaux marins des petites Antilles (puffins, sternes, moines…). L’accès en est interdit.	\N	\N	\N	f
2191	1017	TEXT	presentation	Le compteur de biodiversité présente les écogestes permettant de limiter son impact direct sur les écosystèmes, la faune et la flore, au quotidien ou lors des activités en nature. Son objectif est également de mettre en avant des gestes adaptés aux spécificités des outre-mer.	\N	\N	\N	f
2192	1017	IMAGE	image	\N	1073	© DR	\N	f
2193	1017	TEXT	quote	Des actions concrètes pour agir dès maintenant et nous donner la possibilité de préserver cette biodiversité riche et fragile	\N	\N	\N	f
2194	1017	TEXT	question	Qu’est-ce qu’un écogeste ? 	\N	\N	\N	f
7135	1015	TEXT	risks.risks.0.name	Des problématiques communes aux Antilles 	\N	\N	\N	f
7136	1015	IMAGE	interests.locations.1.image	\N	1057	Presqu’île de la Caravelle © L. Léonard	\N	f
7137	1015	IMAGE	ecosystems.ecosystems.1.image	\N	1067	Sentier dans le Parc National de Martinique © G. Gigot	\N	f
7138	1015	TEXT	interests.locations.3.description	Réserve biologique intégrale, surface protégée la plus étendue de l’île. La Montagne Pelée endormie est toujours en activité et étroitement surveillée. 	\N	\N	\N	f
7139	1015	TEXT	identity.title	La Martinique,  \n« l’île aux fleurs » 	\N	\N	\N	f
7140	1015	TEXT	species.4.name	L'Ananas bois	\N	\N	\N	f
7141	1015	TEXT	identity.area	1 128	\N	\N	\N	f
7142	1015	TEXT	species.0.description	La Matoutou Falaise (*Caribena versicolor*) est une mygale arboricole endémique de la Martinique. D’une envergure totale pouvant aller jusqu’à 15 cm, elle se caractérise par ses couleurs : abdomen rouge vif, pattes roses violacées et thorax bleuté. Longtemps prélevée par les terrariophiles, l’espèces est protégée depuis 2017 au niveau national et sa détention est illicite.	\N	\N	\N	f
7143	1015	IMAGE	species.6.image	\N	1183	Image manquante	\N	f
7144	1015	TEXT	identity.highestPointName	Montagne Pelée	\N	\N	\N	f
7145	1015	TEXT	interests.locations.1.name	La presqu’île de la Caravelle	\N	\N	\N	f
7146	1015	TEXT	statistics.2.text	de l'île couverts par le Parc naturel régional 	\N	\N	\N	f
7147	1015	IMAGE	species.0.image	\N	1061	*Caribena versicolor* © A. Lacoeulhe	\N	f
7148	1015	TEXT	events.1.date	1930	\N	\N	\N	f
7149	1015	TEXT	ecosystems.ecosystems.2.name	Les mangroves	\N	\N	\N	f
7150	1015	TEXT	interests.locations.4.name	La réserve naturelle des îlets de Sainte Anne	\N	\N	\N	f
10345	1007	IMAGE	partners.partners.0.logo	\N	1033	Ministère des outre-mer	\N	f
8802	1008	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
8803	1008	TEXT	understand.text2	On trouve un nombre plus important d’espèces endémiques dans les îles par rapport aux continents en raison leur isolement géographique : les espèces y ont évolué séparément par rapport à celles sur le continent. Ainsi, plus une île est ancienne, plus il est probable que son taux d’endémisme soit élevé, comme par exemple en Nouvelle-Calédonie où 30% des espèces du territoire sont uniques au monde. \nL’endémisme est également beaucoup plus important chez les espèces terrestres que chez les espèces marines, le milieu marin étant plus ouvert et permettant une connexion plus importante des habitats.	\N	\N	\N	f
8804	1008	TEXT	understand.text1	Qualifier une espèce d’endémique, cela veut dire que sa répartition est limitée à une zone géographique peu étendue et qu’elle ne se retrouve nulle part ailleurs dans le monde. Cela donne au territoire en question une responsabilité particulièrement forte dans la conservation du patrimoine mondial. En raison de cette aire de répartition géographique restreinte, les menaces qui pèsent sur ces espèces sont plus fortes. On parle également d'espèces "sub-endémiques" lorsque leur répartition s'étend sur quelques territoires proches mais reste très limitée. Des espèces endémiques peuvent également avoir été déplacées par les humains dans d’autres régions du monde. 	\N	\N	\N	f
8805	1008	TEXT	territories.title	Nombre d'espèces endémiques par territoires	\N	\N	\N	f
8806	1008	TEXT	understand.title1	La notion d'endémisme	\N	\N	\N	f
8807	1008	TEXT	understand.title2	Un taux d’endémisme plus élevé dans les îles ? 	\N	\N	\N	f
8808	1008	TEXT	presentation.descriptionTerritories	espèces sont endémiques du territoire	\N	\N	\N	f
8809	1008	TEXT	understand.paragraphs.0.title	Quelques exemples	\N	\N	\N	f
8810	1008	TEXT	understand.keyword	endémique	\N	\N	\N	f
8811	1008	TEXT	ecogestures.title	Comment préserver les espèces endémiques ? 	\N	\N	\N	f
8812	1008	IMAGE	presentation.image	\N	1034	Kaori de forêt (Agathis lanceolata) © Mickaël T / CC BY 2.0	\N	f
8813	1008	TEXT	understand.paragraphs.0.text	Le Cagou en Nouvelle-Zélande, le Colibri à tête bleue en Martinique, le Gecko vert de Manapany à La Réunion, le Tiaré Apetahi en Polynésie Française, ou encore le Choux de Kerguelen dans les îles australes, chaque territoire d'outre-mer possède de nombreuses espèces uniques... ou presque : seul Saint-Pierre et Miquelon ne compte aucune espèce endémique, l'archipel étant trop proche de Terre Neuve. Au sein de la très riche forêt amazonienne, et bien que n'étant pas une île, la Guyane compte près de 9% d'espèces endémiques. \n\nOn trouve malheureusement parmi ces espèces endémiques un grand nombre d'espèces éteintes, comme le Solitaire de La Réunion (souvent confondu à tord avec le Dodo de l'île Maurice) ou l'Amazone de Martinique, tous deux disparus depuis la fin du 18e siècle. Et de nombreuses espèces se sont sans doute éteintes avant même d'avoir été découvertes... 	\N	\N	\N	f
8814	1008	IMAGE	understand.image	\N	1037	Colibri à tête bleue, Martinique © Fabien Lefebvre	\N	f
8815	1008	TEXT	presentation.description	espèces d’outre-mer sont endémiques	\N	\N	\N	f
8816	1008	TEXT	presentation.logoUrl	NA	\N	\N	\N	f
9542	1026	IMAGE	presentation.file	\N	1219	Affiche PDF	\N	f
9543	1026	IMAGE	action.cards.2.icon	\N	1133	jetable	\N	f
9544	1026	TEXT	presentation.name	Je réduis mes déchets et limite ma consommation de plastique	\N	\N	\N	f
9545	1026	IMAGE	action.cards.0.icon	\N	1131	sacs	\N	f
9546	1026	IMAGE	presentation.image	\N	1135	Jasmin Sessler / Unsplash	\N	f
1433	1003	TEXT	header.title	A la découverte des outre-mer	\N	\N	\N	f
1434	1003	TEXT	header.population	2.7 millions d'	\N	\N	\N	f
1435	1003	TEXT	header.species	16264	\N	\N	\N	f
1436	1003	TEXT	header.text	Les territoires d’outre-mer présentent une biodiversité particulièrement riche et variée, mais fragilisée par les activités humaines. Naviguez parmi les portraits biodiversité des différents territoires et découvrez l’histoire des espèces et des écosystèmes qui les peuplent, les enjeux de chaque territoire et les initiatives des acteurs locaux pour les préserver.	\N	\N	\N	f
10357	1016	TEXT	science.project.title	Un projet original en Nouvelle-Calédonie	\N	\N	\N	f
10358	1016	TEXT	header.title	Agir ensemble pour préserver la biodiversité remarquable des outre-mer	\N	\N	\N	f
10359	1016	CHECKBOX	header.shadowed	false	\N	\N	\N	f
10360	1016	IMAGE	science.project.image	\N	1072	© Claire Goiran/UNC	\N	f
10361	1016	TEXT	science.title	Les sciences participatives	\N	\N	\N	f
10362	1016	TEXT	science.project.description	Un groupe de 7 plongeuses entre 60 et 75 ans ont collaboré avec les chercheurs de l’Université de Nouvelle-Calédonie pour étudier un serpent de mer méconnu, l’Hydrophis major, dans la baie des Citrons, au sud de Nouméa.	\N	\N	\N	f
9490	1030	TEXT	paragraphs.0.title	Conception et édition	\N	\N	\N	f
10363	1016	TEXT	science.subtitle	Les sciences participatives permettent à tous les curieux de la nature, du débutant à l’expérimenté, de contribuer à la recherche sur la biodiversité en fournissant aux scientifiques un grand nombre de données de terrain.	\N	\N	\N	f
10364	1016	TEXT	ecogestures.title	Découvrez les écogestes	\N	\N	\N	f
10365	1016	IMAGE	header.background	\N	1071	Manapany, La Réunion © Philippe Gourdain / OFB	\N	f
10366	1016	TEXT	header.subtitle	Chacun, à son échelle, peut agir pour la préservation de la biodiversité. Le compteur met en avant les bons comportements pour que chacun puisse limiter son impact sur la nature et invite à contribuer aux programmes de sciences participatives pour faire progresser les connaissances. 	\N	\N	\N	f
2195	1017	TEXT	answer	Les écogestes, ce sont tous ces changements de comportement individuels qui permettent de réduire son impact sur l’environnement. Faire attention à son utilisation énergétique, faire les bons choix de consommation, mieux gérer ses déchets, consommer moins de viande, etc. des plus petits gestes aux grands changements, chacun est acteur de la préservation de l’environnement et peut limiter son impact. La multiplication de ces comportements individuels peut entraîner des changements notables à plus grande échelle !\n\nTous ces gestes ne doivent pas faire oublier que de profonds changements de société seront nécessaire pour limiter les risques liés au déclin de la biodiversité et aux changements climatique. Ils représentent des actions et des changements de comportements nécessaires, mais doivent être accompagnés de politiques environnementales à la hauteur des enjeux.	\N	\N	\N	f
2196	1017	TEXT	other.title	Retrouvez d'autres écogestes sur	\N	\N	\N	f
2197	1017	IMAGE	other.image	\N	1074	logo	\N	f
2198	1017	TEXT	other.text	Biodiversité Tous Vivants !	\N	\N	\N	f
2199	1017	TEXT	title	Adaptons notre comportement pour préserver la biodiversité	\N	\N	\N	f
4648	1019	TEXT	examples.projects.2.description	Quarante-cinq stations coraliennes sont suivies depuis dix ans selon la méthodologie par transects développée par Reef Check dans le cadre du Réseau d’Observations des Récifs Coraliens (RORC) sur les côtes Néo-calédoniennes. Pala Dalik assure l’animation, la coordination et la formation des participants, y compris auprès des scolaires et tache d’étendre ce réseau de sites.	\N	\N	\N	f
4649	1019	LINK	examples.projects.2.more	En savoir plus	\N	\N	https://www.reefcheck.fr/nouvelle-caledonie/	f
4650	1019	TEXT	examples.projects.0.description	Lancé par l’Observatoire des Tortues Marines de la Réunion, Kelonia, il utilise la base de données en ligne Toorsoi et contribue au Plan National d’Action en faveur des tortues marines sur les territoires français de l’océan Indien. Il repose sur la configuration des écailles de la tête pour l’identification individuelle des sujets suivis.	\N	\N	\N	f
4651	1019	IMAGE	images.1.image	\N	1079	© Steveprutz / CC BY 3.0	\N	f
10367	1016	TEXT	ecogestures.subtitle	Le compteur de biodiversité présente les écogestes permettant de limiter son impact direct sur les écosystèmes, la faune et la flore, au quotidien ou lors des activités en nature.	\N	\N	\N	f
4652	1019	TEXT	paragraphs.2.text	On trouve dans cette catégorie divers programmes de sensibilisation à la démarche scientifique ou aux enjeux de conservation. Certains d’entre eux n’impliquent pas de collecte d’information centralisée, leur objectif étant d’abord de permettre aux participants d’acquérir des connaissances. 	\N	\N	\N	f
4653	1019	TEXT	examples.projects.2.actor	Pala Dalik, association représentante de Reff Check en Nouvelle Calédonie	\N	\N	\N	f
4654	1019	TEXT	examples.projects.0.actor	Kelonia	\N	\N	\N	f
4655	1019	TEXT	application.title	Agir pour la science depuis son smartphone, c’est possible !	\N	\N	\N	f
4656	1019	TEXT	paragraphs.0.title	Les bases de données collaboratives	\N	\N	\N	f
4657	1019	TEXT	paragraphs.1.text	L’objet et les conditions de collecte des données sont alors très précisément définis, garantissant ainsi l’exploitabilité des données pour répondre à une question précise. La nature du protocole va contraindre le type de public participant, mais cela peut souvent inclure des débutants. Les données collectées peuvent être ensuite versées dans les projets de bases de données collaboratives.  \n	\N	\N	\N	f
9547	1026	TEXT	understand.text	Lorsqu’ils terminent dans la nature, nos déchets polluent durablement les milieux et nous finissons par les ingérer également au quotidien dans l’eau, l’air et la nourriture. Mais même lorsqu'ils sont collectés, leur impact sur l'environnement reste important : leur incinération génère une pollution de l'air et l'émission de gaz à effet de serre, l'enfouissement pollue durablement les sols et les eaux et s'avère rapidement problématique dans les petits territoires insulaires. \n\nLe pire ? Les plastique à usage unique : pour quelques minutes d’utilisation, au mieux ils grossiront le stock de déchets à traiter, au pire ils pollueront durablement les écosystèmes !\n\nLe recyclage est une solution, mais elle a ses limites : certaines matières ne sont pas recyclables, et pour les celles qui le sont les territoires d’outre-mer n’ont pas toujours la capacité de les collecter et les traiter (insuffisance d’infrastructures, éloignement ou difficultés d’accès à certaines zones), ce qui implique un export, lui aussi coûteux et polluant.\n\nAlors, pour améliorer notre cadre de vie et notre environnement, si on essayait de réduire le volume de notre poubelle ? Pour ça, 5 grands principes : refuser, réduire, réutiliser, recycler, composter. \nDes programmes "zéro déchets" et de nombreuses ressources existent pour vous accompagner dans ces démarches. \n	\N	\N	\N	f
9548	1026	IMAGE	action.cards.1.icon	\N	1132	vrac	\N	f
9549	1026	TEXT	action.cards.2.description	Je fais la chasse aux produits à usages uniques : gobelets, pailles, touillettes, et je les remplace par des alternatives durables ou biodégradables.	\N	\N	\N	f
9550	1026	TEXT	presentation.category	Consommation	\N	\N	\N	f
9551	1026	TEXT	action.cards.1.description	Je privilégie les produits achetés en vrac. J'utilise mes propres contenants réutilisables. 	\N	\N	\N	f
9552	1026	TEXT	presentation.description	Même lorsqu'ils sont collectés correctement, l'impact de nos déchets sur l'environnement reste important. 	\N	\N	\N	f
9553	1026	TEXT	action.title	Pour commencer à réduire mes déchets : 	\N	\N	\N	f
9554	1026	TEXT	understand.quote	A l’échelle mondiale, un tiers des déchets plastiques se retrouve dans la nature. Seuls 9% des déchets plastiques sont recyclés dans le monde.	\N	\N	\N	f
9555	1026	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
9556	1026	TEXT	action.cards.0.description	Je refuse les sacs plastiques à usage unique, je peux utiliser à la place des sacs en tissus ou en matières naturelles.	\N	\N	\N	f
9557	1023	IMAGE	presentation.file	\N	1220	Affiche PDF	\N	f
10368	1000	TEXT	presentation.title	Le compteur de biodiversité outre-mer	\N	\N	\N	f
10369	1000	TEXT	carousel.title	Découvrez la *biodiversité* des outre-mer	\N	\N	\N	f
10370	1000	TEXT	presentation.indicators	Des chiffres clés pour comprendre 	\N	\N	\N	f
10371	1000	TEXT	testimony.title	Une biodiversité unique mais fragile, protégeons-la !	\N	\N	\N	f
10372	1000	IMAGE	testimony.image	\N	1002	Un agent de l’ONB en Guyane © Raphael Gailhac	\N	f
10373	1000	IMAGE	carousel.images.1.image	\N	1001	Orthorhyncus cristatus © Olivier Delzons	\N	f
10374	1000	TEXT	presentation.science	Participez aux programmes pour faire progresser la connaissance	\N	\N	\N	f
10375	1000	TEXT	science.text	Un groupe de 7 plongeuses entre 60 et 75 ans ont collaboré avec les chercheurs de l’Université de Nouvelle-Calédonie pour étudier un serpent de mer méconnu, l’Hydrophis major, dans la baie des Citrons, au sud de Nouméa. 	\N	\N	\N	f
10376	1000	TEXT	carousel.text	Partez à la rencontre des *espèces* et des écosystèmes des territoires français d’outre-mer. 	\N	\N	\N	f
10377	1000	CHECKBOX	carousel.images.0.shadowed	true	\N	\N	\N	f
10378	1000	IMAGE	carousel.images.2.image	\N	1004	Ranitomeya amazonica © Raphael Gailhac	\N	f
10379	1000	TEXT	presentation.territories	Découvrez l’identité de chaque territoire d’outre-mer	\N	\N	\N	f
10380	1000	CHECKBOX	carousel.images.1.shadowed	true	\N	\N	\N	f
10381	1000	IMAGE	science.image	\N	1003	Hydrophis major © Claire Goiran / CC BY 3.0 	\N	f
10382	1000	TEXT	science.title	Un projet original en Nouvelle-Calédonie	\N	\N	\N	f
9898	1001	TEXT	species.7.description	Parmi les dizaines d’espèces d’ochidées indigènes, 5 sont endémiques strictes de Guadeloupe, dont *Octomeria ffrenchiana*, espèce rare d’altitude découverte il y a quelques années seulement. Environ deux tiers des orchidées de Guadeloupe sont épiphytes : elles utilisent une autre plante comme support. Ces espèces sont considérées comme d’excellent bio-indicateurs de la santé du milieu qui les héberge.  \n  \nStatut sur la Liste rouge de la flore vasculaire de Guadeloupe : En danger critique.  	\N	\N	\N	f
9899	1001	TEXT	species.8.description	La Tortue imbriquée (*Eretmochelys imbricata*) est l’une des trois espèces de tortues marines qui viennent pondre sur les plages de Guadeloupe. Les tortues marines sont menacées entre autres par les captures accidentelles de pêche, les collisions, l’ingestion de déchets, le braconnage ou encore la destruction de leurs sites d’alimentation. Toutes les espèces de tortues sont protégées, et le réseau des tortues marines de Guadeloupe présente une charte de bonne conduite à respecter en présence de tortues, pour les préserver. \n\nStatut sur la Liste rouge mondiale : En danger critique.  	\N	\N	\N	f
9900	1001	TEXT	events.2.description	La Guadeloupe obtient le label « Réserve de Biosphère » de l’UNESCO	\N	\N	\N	f
4658	1019	TEXT	application.subtitle	J'agis en ligne	\N	\N	\N	f
4659	1019	IMAGE	examples.projects.0.image	\N	1081	© Cynomana  / CC BY-SA 4.0 	\N	f
2221	1018	TEXT	secondActionName	Je donne de mon temps	\N	\N	\N	f
2222	1018	LINK	secondActionLink	Tous les programmes de sciences participatives	\N	\N	https://test.biodiversite-outre-mer.fr/sciences-participatives	f
2223	1018	TEXT	description	La majorité des territoires d’outre-mer français sont situés dans des régions particulièrement riches en espèces, notamment en espèces endémiques, ce qu’on appelle des points chauds de la biodiversité	\N	\N	\N	f
2224	1018	TEXT	firstActionName	J'agis en ligne	\N	\N	\N	f
2225	1018	LINK	firstActionLink	Je télécharge l'application INPN Espèces	\N	\N	https://inpn.mnhn.fr/informations/inpn-especes	f
2226	1018	TEXT	title	Agir pour la science	\N	\N	\N	f
4660	1019	TEXT	examples.projects.1.title	Suivi Temporel des Oiseaux Communs en Guyane	\N	\N	\N	f
4661	1019	LINK	examples.projects.0.more	En savoir plus	\N	\N	https://museesreunion.fr/kelonia/actualites-et-savoirs-de-kelonia/la-photo-identification-des-tortues-marines/?fbclid=IwAR0W8NGqRTa20a8	f
4662	1019	TEXT	paragraphs.2.title	Les programmes à visée éducative ou de gestion/conservation	\N	\N	\N	f
4663	1019	TEXT	examples.projects.2.target	Pratiquants de plongée	\N	\N	\N	f
9558	1023	IMAGE	action.cards.2.icon	\N	1116	Tri	\N	f
9512	1028	IMAGE	presentation.file	\N	1217	PDF écogeste	\N	f
9513	1028	IMAGE	action.cards.2.icon	\N	1145	bagages	\N	f
9514	1028	TEXT	presentation.name	Je ne participe pas à l’exploitation des espèces protégées	\N	\N	\N	f
9515	1028	IMAGE	action.cards.0.icon	\N	1143	pêche	\N	f
9516	1028	IMAGE	presentation.image	\N	1142	© Fabien Lefebvre	\N	f
9517	1028	TEXT	understand.text	Bois précieux, espèces aux propriétés médicinales, chasse et pêche, nouveaux animaux de compagnie… L'exploitation illégale conduit à la réduction des populations de nombreuses espèces animales et végétales, voire à leur extinction, dans tous les territoires. \n\nLes tortues marines sont particulièrement victimes du braconnage, pour la consommation de la viande. Si le phénomène est marqué à Mayotte, où plusieurs centaines de tortues sont encore braconnées chaque année alors qu'elles viennent pondre sur les plages, on observe encore des captures illégales de tortues dans les collectivités des Caraïbes, en Guyane ou en Polynésie française.  \n\nA La Réunion, des pêcheurs illégaux dans la Réserve marine sont régulièrement appréhendés de nuit avec des poissons et des langoustes. Sur terre, c'est notamment le palmiste rouge, endémique du territoire, qui fait l'objet d'une exploitation illégale dans le Parc National. \nAutre exemple en Martinique, où les oursins blancs sont ramassés illégalement, parfois par centaines de kilos, alors que leur pêche n'est autorisées que quelques jours par an et uniquement réservée aux professionnels déclarés. En Guyane, oiseaux et reptiles font également l'objet de trafics.\n\nDes peines de prisons et de lourdes amendes sont régulièrement prononcées contre les braconniers. \n\nPour ne pas conduire à l'extinction des espèces menacées, ne participons pas au trafic illégal d'espèces protégées.   \n	\N	\N	\N	f
9518	1028	IMAGE	action.cards.1.icon	\N	1144	informations	\N	f
9519	1028	TEXT	action.cards.2.description	Je ne rapporte pas d’animaux ou de végétaux dans mes bagages.	\N	\N	\N	f
9520	1028	TEXT	presentation.category	Protéger les espèces	\N	\N	\N	f
9521	1028	TEXT	action.cards.1.description	Je me renseigne sur la provenance de ce que j’achète et je n'accepte pas de produits issus de l'exploitation illégale. 	\N	\N	\N	f
9522	1028	TEXT	presentation.description		\N	\N	\N	f
9559	1023	IMAGE	action.cards.3.icon	\N	1117	Poubelle	\N	f
9560	1023	TEXT	presentation.name	Je ne jette pas mes déchets dans la nature	\N	\N	\N	f
9561	1023	IMAGE	action.cards.0.icon	\N	1114	Poubelles	\N	f
9562	1023	IMAGE	presentation.image	\N	1164	Dustan Woodhouse/Unsplash	\N	f
4664	1019	IMAGE	header.background	\N	1075	Mont Orohena, Tahiti © Darko Cotoras	\N	f
4665	1019	TEXT	examples.projects.1.subject	Suivi des populations d’oiseaux communs par échantillonnages ponctuels simples le long de parcours prédéfinis	\N	\N	\N	f
4666	1019	LINK	application.downloadLink	Je télécharge l’application INPN Espèces	\N	\N	https://inpn.mnhn.fr/informations/inpn-especes	f
9523	1028	TEXT	action.title	Pour ne pas être complice de l’exploitation d’espèces protégées :	\N	\N	\N	f
9524	1028	TEXT	understand.quote	Certaines espèces peuvent toujours être exploitées ou chassées, mais les règlementations et les quotas doivent être respectés afin de permettre à la ressource de se renouveler durablement.	\N	\N	\N	f
9525	1028	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
9526	1028	TEXT	action.cards.0.description	Je respecte les règlementations de pêche (matériel, technique, zone d'exclusion,...) et ne prélève pas plus qu’autorisé. 	\N	\N	\N	f
9901	1001	TEXT	events.3.description	Création du sanctuaire AGOA pour les mammifères marins qui couvre toutes les Antilles françaises	\N	\N	\N	f
9902	1001	IMAGE	species.2.image	\N	1167	*Guaiacum officinale* © C. Delnatte	\N	f
9903	1001	IMAGE	identity.image	\N	1005	Vue de Saint-Louis, Guadeloupe / Crédits : Fabrice Smet / Unsplash	\N	f
9904	1001	TEXT	species.3.description	Le Dynaste scieur de long (*Dynaste hercules*) est l’un des plus gros coléoptères du monde : il peut atteindre 17 cm de long pour 20 cm d’envergure en vol ! Il est protégé sur le territoire depuis 2007. A l’heure actuelle, 1 350 espèces de coléoptères ont été recensées en Guadeloupe mais on estime qu’il pourrait y avoir plusieurs centaines d’espèces encore inconnues ! \n	\N	\N	\N	f
9905	1001	TEXT	interests.locations.0.name	Le Parc National de la Guadeloupe	\N	\N	\N	f
9906	1001	TEXT	species.1.description	Les Ouassous sont des crevettes d’eau douce. Ce terme recouvre une douzaine d’espèces différentes, parmi lesquelles *Machrobachium carcinus*, qui peut atteindre 30 cm de long. Elles sont très sensibles à la pollution des eaux (pesticides, détergents, hydrocarbures…) et plusieurs espèces sont considérées menacées en Guadeloupe. Bien que vivant la majeure partie de leur vie en eau douce, c’est en mer que se développent les premiers stades de leurs larves.  \n  \nStatut sur la Liste rouge mondiale : Préoccupation mineure.	\N	\N	\N	f
9907	1001	TEXT	species.2.description	Le Gaïac (*Guaiacum officinale*) est un petit arbre des milieux secs, endémique de Guadeloupe. Surexploité pour son bois très dense et son usage médicinal, ajouté à la destruction de son habitat, la plupart de ses populations ont aujourd’hui disparu et il est aujourd’hui considéré en danger d’extinction. Les derniers individus sont localisés dans la réserve naturelle nationale des îlets de Petite Terre.  \n  \nStatut sur la Liste rouge de la flore vasculaire de Guadeloupe : En danger. 	\N	\N	\N	f
9908	1001	TEXT	events.0.description	disparition du Lamentin d’Amérique (*Trichechus manatus*) des eaux de Guadeloupe	\N	\N	\N	f
10383	1000	TEXT	testimony.quote	Ces actions conjuguées entraînent un accroissement de la biodiversité, une amélioration de la qualité de l’eau, de l’air mais aussi de la qualité de vie.	\N	\N	\N	f
10384	1000	TEXT	presentation.ecogestures	Des gestes simples à mettre en place au quotidien	\N	\N	\N	f
10385	1000	TEXT	presentation.quote	Les outre-mer regroupent 80 % de la biodiversité française, réinventons, adaptons notre façon de vivre et de voyager	\N	\N	\N	f
10386	1000	IMAGE	carousel.images.0.image	\N	1000	Chelonia mydas ©  B. Guichard	\N	f
10387	1000	TEXT	presentation.text	Les territoires d’outre-mer présentent une biodiversité particulièrement riche et variée, mais fragilisée par les activités humaines. \nLa mission du compteur est de donner une vision d’ensemble des enjeux liés à la biodiversité en outre-mer afin que chacun, résident ou voyageur de passage, puisse s’informer et s’impliquer à son échelle pour la préservation de cette biodiversité exceptionnelle.  	\N	\N	\N	f
9909	1001	TEXT	events.1.description	Création du Parc National de Guadeloupe	\N	\N	\N	f
9910	1001	IMAGE	ecosystems.image	\N	1026	La pointe de la Grande Vigie © Annie Mason/Unsplash	\N	f
9911	1001	TEXT	identity.species	10 279	\N	\N	\N	f
10388	1000	TEXT	carousel.territoriesButton	Découvrir les territoires	\N	\N	\N	f
10389	1000	CHECKBOX	carousel.images.2.shadowed	true	\N	\N	\N	f
10390	1000	TEXT	testimony.text	La conservation de la biodiversité dépend de sa connaissance et de la compréhension des phénomènes qui l’impactent. Les indicateurs sont des outils qui permettent de suivre différents paramètres de la biodiversité, pour renseigner de son évolution.	\N	\N	\N	f
4667	1019	TEXT	examples.projects.1.description	Adossé au suivi mis en place en métropole en 1989, le STOC-Guyane a débuté en 2012 dans le cadre du Life+ CapDOM, conjointement avec la Martinique et la Réunion. A ce jour, près de cinquante parcours sont échantillonnés annuellement et au total, plus de 50 000 données ont été collectées.	\N	\N	\N	f
10171	1021	TEXT	species.7.description	Le Tamarin des Hauts (*Acacia heterophylla*) se trouve principalement en forêt humide de montagne entre 1100 et 1700 mètres d'altitude. Il peut atteindre 25 mètres de haut mais il est vulnérable aux cyclones en raison de son enracinement peu profond. Il s’agit encore une fois d’une espèce endémique de l’île.  \n  \nStatut sur la Liste rouge de la flore vasculaire de la Réunion : préoccupation mineure. 	\N	\N	\N	f
10172	1021	TEXT	species.8.description	Le Bois d’Ortie (*Obetia ficifolia*) est une espèce rare et endémique des Mascareigne, qu’on retrouve dans les forêts sèches et semi-sèches. Il doit son nom à sa capacité à provoquer des irritations de la peau, mais il est réputé des tisaneurs pour être un remède contre l’asthme. Il est également connu pour être l’hôte d’un papillon endémique, le *alamis augustina augustina*, qui n’a cependant pas été observé depuis 2005, ce qui laisse à penser à sa disparition. Dans l’espoir de le voir réapparaitre, des plantations de bois d’Ortie sont réalisées notamment sur le massif de la Grande Chaloupe.  \n  \nStatut sur la Liste rouge de la flore vasculaire de la Réunion : en danger. 	\N	\N	\N	f
10173	1021	TEXT	events.2.description	dernière mention connue du Solitaire de la Réunion (Threskiornis solitarius) oiseau endémique	\N	\N	\N	f
10174	1021	TEXT	events.3.description	Création du parc national de La Réunion	\N	\N	\N	f
10175	1021	IMAGE	species.2.image	\N	1160	*Megaptera novaeangliae* © Laurent Bouveret	\N	f
10176	1021	IMAGE	identity.image	\N	1095	Cascades du Bras d’Annette à Grand Etang, La Réunion © Philippe Gourdain	\N	f
6359	1013	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
6360	1013	TEXT	understand.text2	La taxonomie, ou taxinomie, est la science qui permet de décrire et de classer le vivant. L’espèce est l’unité taxonomique de base. Chaque espèce décrite est classée avec d’autres espèces aux caractéristiques communes au sein d’un même genre, puis d’une famille, d’un ordre, etc. Chaque espèce est identifiée par un nom scientifique latin en deux mots, par exemple Pelecanus occidentalis pour le Pelican brun. Cette dénomination en latin permet un référentiel mondial commun, car une même espèce peut posséder des dizaines de noms usuels différents (dits "vernaculaires") à travers le monde, selon les langues et les régions. 	\N	\N	\N	f
6361	1013	TEXT	understand.text1	Plus de 80% des nouvelles découvertes d'espèces chaque année en France sont réalisées dans les territoires d'outre-mer. Certaines de ces nouvelles descriptions sont issues d’expéditions scientifiques, par exemple celles menées en Guyane en 2014 et en Nouvelle-Calédonie en 2016 - 2017 par le Muséum national d’Histoire naturelle dans le cadre de la campagne « la Planète revisitée », mais d’autres sont également réalisées par des taxonomistes non-professionnels. \n\nDans la plupart des cas, il s’agit de petits organismes, d’organismes marins (mollusques, crustacés, insectes, vers marins) ou de végétaux. L’utilisation d’analyses ADN permet également de distinguer des espèces proches qui peuvent se confondre. 	\N	\N	\N	f
6362	1013	TEXT	territories.title	Les chiffres par territoires	\N	\N	\N	f
6363	1013	TEXT	understand.title1	L'outre-mer : un vivier de découvertes d'espèces	\N	\N	\N	f
6364	1013	TEXT	understand.title2	La taxonomie : la science de la description du vivant	\N	\N	\N	f
6365	1013	TEXT	presentation.descriptionTerritories	nouvelles espèces ont été décrites entre 2016 et 2018	\N	\N	\N	f
6366	1013	TEXT	understand.paragraphs.0.title	Les sciences participatives : quand les citoyens aident les scientifiques	\N	\N	\N	f
6367	1013	TEXT	understand.keyword	especes	\N	\N	\N	f
6368	1013	TEXT	ecogestures.title	Comment aider à la progression des connaissances scientifiques ?	\N	\N	\N	f
6369	1013	IMAGE	presentation.image	\N	1050	© Fabien Lefebvre	\N	f
6370	1013	TEXT	understand.paragraphs.0.text	Les sciences participatives permettent à tous, quel que soit le niveau de connaissance de la nature, de s’investir dans l’amélioration des connaissances, en fournissant des observations qui seront ensuite analysées par des scientifiques. Ces programmes peuvent parfois aboutir à la découverte d’espèces non encore décrites. 	\N	\N	\N	f
9563	1023	TEXT	understand.text	Certains déchets libèrent des substances toxiques lorsqu’ils se décomposent, ils dégraderont peu à peu les milieux naturels et polluerons durablement les sols, d’autres seront de véritables pièges pour la faune sauvage qui s’y coincera ou les ingèrera, provoquant problèmes de croissance, blessures, intoxications, étouffements... Les mégots et les morceaux de verre peuvent également être responsables de départs d’incendies qui détruirons les habitats et leurs occupants.\nDe plus, les décharges sauvages représentent souvent de parfaits gîtes à moustiques et peuvent donc favoriser la transmission de maladies (dengue, chikungunya, zika). \n\nAvec la pandémie du Covid-19, l'utilisation de masques à usages unique a considérablement augmenté. Fabriqués à partir de polypropylène, un plastique résistant, on estime qu'il leur faut 400 ans pour se dégrader dans l'océan, en engendrant de tout petits fragments appelés microplastiques, qui polluent durablement les écosystèmes. \n\nLes bio-plastiques, une bonne idée ? Attention au greenwashing ! Sous ce terme se trouvent des produits composés, parfois seulement en partie, de matières d'origine végétale (amidon de pomme de terre ou de maïs, canne à sucre, glucose dérivé de l'amidon ou encore huile végétale). Souvent vantés comme "biodégradables", la plupart ne sont en réalité compostables qu'en condition industrielles. Jetés dans la nature, ils se dégradent pas !\n\nAlors, pour éviter d'impacter durablement les milieux, prenons le temps de jeter correctement nos déchets.  	\N	\N	\N	f
9564	1023	IMAGE	action.cards.1.icon	\N	1115	Cigarette	\N	f
9565	1023	TEXT	action.cards.3.description	Je signale lorsque je trouve une zone de dépôts sauvages. 	\N	\N	\N	f
9566	1023	TEXT	action.cards.2.description	Je me renseigne sur le système de tri de mon territoire et je le respecte. Le recyclage réduit l'impact environnemental des déchets. Certains déchets nécessitent des traitements particuliers et ne doivent surtout pas être jetés avec les ordures ménagères (médicaments, électronique, etc.). 	\N	\N	\N	f
9912	1001	TEXT	statistics.1.number	42 %	\N	\N	\N	f
9913	1001	IMAGE	ecosystems.ecosystems.0.image	\N	1010	La forêt d’altitude sur La Soufrière © Maël Gramain/Unsplash	\N	f
9914	1001	TEXT	statistics.0.number	1 407	\N	\N	\N	f
9915	1001	TEXT	statistics.2.number	1989	\N	\N	\N	f
9916	1001	TEXT	species.2.name	Le Gaïac	\N	\N	\N	f
9917	1001	TEXT	species.8.name	La Tortue imbriquée	\N	\N	\N	f
9918	1001	TEXT	species.4.description	Les Anolis sont des lézards communément observés sur tout le territoire. Ce terme regroupe plusieurs espèces et sous-espèces endémiques de la Guadeloupe et de ses dépendances. Chaque île, voire presque chaque îlet des Antilles, possède une population d’anolis qui se différencie par ses couleurs et sa morphologie. Ils sont tous protégés.  	\N	\N	\N	f
9919	1001	TEXT	events.6.description	2e plan national d'action en faveur des tortues marines des Antilles françaises	\N	\N	\N	f
9920	1001	TEXT	events.6.date	2020 - 2029	\N	\N	\N	f
9921	1001	TEXT	ecosystems.ecosystems.0.name	La forêt d’altitude	\N	\N	\N	f
9922	1001	TEXT	species.5.description	Le Palmier ti-koko (*Syagrus amara*), protégé et endémique des petites Antilles, est encore abondant en Guadeloupe alors qu'il a presque disparu de Martinique. Son allure ressemble au cocotier, son port est majestueux et ses fruits ressemblent à des petites noix de coco, d’où son nom.  \n\nStatut sur la Liste rouge de la flore vasculaire de Guadeloupe : Vulnérable. 	\N	\N	\N	f
9923	1001	TEXT	species.6.description	La mangrove de bord de mer est principalement constituée de Palétuvier rouge (*Rhizophora mangle*), reconnaissable à ses racines-échasses qui se fixent dans les fonds vaseux. Ses graines ont la particularité de germer alors qu’elles sont encore accrochées à l’arbre. Il joue un rôle capital dans la protection des côtes contre la houle, la filtration des eaux saumâtres et ses racines sont une véritable nurserie pour les poissons marins.  \n  \nStatut sur la Liste rouge de la flore vasculaire de Guadeloupe : Préoccupation mineure. 	\N	\N	\N	f
9924	1001	TEXT	events.4.description	Publication de la Liste rouge des oiseaux de Guadeloupe	\N	\N	\N	f
9925	1001	TEXT	events.5.description	Publication de la Liste rouge de la Flore vasculaire de Guadeloupe	\N	\N	\N	f
9926	1001	TEXT	interests.locations.2.name	La Réserve naturelle nationale des îles de Petite Terre	\N	\N	\N	f
9927	1001	TEXT	ecosystems.ecosystems.3.description	En Guadeloupe, les mangroves se trouvent principalement en bordure du Grand et du Petit Cul-de-Sac Marin et à Marie-Galante. On distingue 3 types de mangroves : la mangrove de bord de mer à la salinité constante est le territoire du palétuvier rouge (*Rhizophora mangle*) ; la mangrove arbustive à une dizaine de mètres du rivage, où la salinité est extrême, où les palétuviers noirs (*Avicennia germinans* et *A. schaueriana*) abondent ; la mangrove haute, au-delà, où l’on trouve palétuviers blancs et gris (*Laguncularia racemosa* et *Conocarpus erectus*). On y trouve de nombreuses espèces de crabes et d’oiseaux. 	\N	\N	\N	f
9928	1001	TEXT	events.0.date	18e siècle	\N	\N	\N	f
9929	1001	TEXT	identity.populationYear	2017	\N	\N	\N	f
9930	1001	IMAGE	species.5.image	\N	1171	Image manquante	\N	f
9931	1001	TEXT	statistics.0.text	espèces endémiques du territoire	\N	\N	\N	f
6371	1013	IMAGE	understand.image	\N	1052	Tri à la loupe binoculaire d’échantillons récoltés sur le terrain ©  T. Magniez/MNHN/PNI	\N	f
9932	1001	IMAGE	species.1.image	\N	1009	*Machrobachium carcinus* © Clinton & Charles Robertson / CC BY 2.0 	\N	f
9933	1001	TEXT	ecosystems.ecosystems.1.name	Les plages	\N	\N	\N	f
9934	1001	TEXT	events.2.date	1993	\N	\N	\N	f
9935	1001	TEXT	events.5.date	2019	\N	\N	\N	f
9936	1001	TEXT	identity.marineArea	90 000	\N	\N	\N	f
6372	1013	TEXT	presentation.description	nouvelles espèces décrites en outre-mer en moyenne entre 2016 et 2018	\N	\N	\N	f
6373	1013	TEXT	presentation.logoUrl	NA	\N	\N	\N	f
6374	1009	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
6375	1009	TEXT	understand.text2	Ce nombre comprend uniquement les espèces dites indigènes des territoires d'outre-mer, c’est-à-dire naturellement présentes sur les territoires. Il ne comprend pas les espèces introduites, volontairement ou involontairement, par les humains (animaux domestiques, plantes cultivées, etc.). \nCe nombre ne prends pas non plus en compte les espèces éteintes.	\N	\N	\N	f
6376	1009	TEXT	understand.text1	Au niveau floristique, les plantes à fleurs présentent le plus grand nombre d’espèces : on en compte 12 306. Ce ne sont pas les seules espèces végétales : on compte également plusieurs centaines d’espèces de mousse, de lichens, ou encore d’algues. \nDu côté de la faune, c’est chez les invertébrés que se trouve la plus grande diversité : plus de 12 000 espèces de Coléoptères et plus de 8 000 espèces de papillons ! Les mollusques sont également un groupe très diversifié, on en trouve aussi bien en milieu marin qu’en milieu terrestre et en eaux douces. \nChez les vertébrés, on compte 5 046 pour les poissons, 1 435 espèces pour les oiseaux, 381 pour les reptiles, 321 espèces pour les mammifères et 138 pour les amphibiens.\n\nLes plus grandes diversités d'organismes sont observés sur les "points chauds" de biodiversité, comme la Nouvelle-Calédonie, dont le patrimoine naturel est exceptionnel ! \n	\N	\N	\N	f
6377	1009	TEXT	territories.title	Les chiffres par territoire	\N	\N	\N	f
6378	1009	TEXT	understand.title1	Une importante diversité de plantes à fleurs et d'insectes	\N	\N	\N	f
6379	1009	TEXT	understand.title2	Vous avez dit « espèce indigène » ? 	\N	\N	\N	f
6380	1009	TEXT	presentation.descriptionTerritories	sont inventoriées sur le territoire	\N	\N	\N	f
6381	1009	TEXT	understand.paragraphs.0.title	Des mammifères terrestres peu nombreux sur les îles 	\N	\N	\N	f
6382	1009	TEXT	understand.keyword	indigene	\N	\N	\N	f
6383	1009	TEXT	ecogestures.title	Comment préserver la biodiversité indigène ?	\N	\N	\N	f
6384	1009	IMAGE	presentation.image	\N	1039	Cacique à queue jaune © Raphael Gailhac	\N	f
9937	1001	TEXT	identity.presentation	Deux îles principales séparées par un bras de mer, entourées de plusieurs îles « satellites » et d’îlets : en raison de sa taille, son altitude, et de la diversité de ses paysages, la Guadeloupe est l’île la plus riche en espèces, notamment endémiques, des Petites Antilles.  	\N	\N	\N	f
9938	1001	IMAGE	interests.locations.0.image	\N	1006	Rivière dans le Parc National de Guadeloupe © Filo gèn' / CC BY-SA 4.0	\N	f
6385	1009	TEXT	understand.paragraphs.0.text	Sur les quelques centaines d’espèces de mammifères indigènes recensés, la plupart des espèces terrestres se trouvent en Guyane. On y rencontre par exemple le jaguar, le paresseux à deux doigts et plusieurs espèces de primates. Très peu de mammifères terrestres sont naturellement présents sur les îles et il s’agit quasiment uniquement de chauves-souris. Les autres sont des espèces marines comme les baleines, les dauphins et les phoques.\nDe nombreuses espèces de mammifères ont été introduites par l’homme sur les îles : chats, rats, souris, lapins, cerfs, chiens, chèvres… Ces introductions sont à l'origine de grandes perturbations pour les écosystème fragiles de ces territoires, et de l'extinction de nombreuses espèces. 	\N	\N	\N	f
6386	1009	IMAGE	understand.image	\N	1040	Iguane des petites Antilles © Fabien Lefebvre	\N	f
6387	1009	TEXT	presentation.description	espèces indigènes inventoriées dans les outre-mer	\N	\N	\N	f
9939	1001	TEXT	species.6.name	Le Palétuvier rouge	\N	\N	\N	f
6388	1009	TEXT	presentation.logoUrl	NA	\N	\N	\N	f
6404	1011	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
6405	1011	TEXT	understand.text2	La destruction des forêts est reconnue comme une pression majeure sur la biodiversité, le suivi du taux de boisement permet de suivre l’évolution de cette pression, et donc indirectement l’état de la biodiversité forestière. Sont exclues de ce calcul les forêts urbaines ou à vocation agricole. \n\nDepuis 1990, le taux de boisement reste pour le moment globalement stable pour les outre-mer français, cependant, cet indicateur à des limites : il nous donne une indication sur la surface, mais ne renseigne pas sur le bon état écologique de ces forêts. 	\N	\N	\N	f
9119	1022	TEXT	species.7.description	Dans les pelouses sableuses d’arrière dune se cachent plusieurs espèces rares de botryches, comme le Botryche à feuille de Matricaire (*Botrychium matricariifolium*). Il s’agit de petites fougères vivaces dont le nom provient du grec « botrus » signifiant grappes, qui se réfère à l’aspect de ses fructifications.	\N	\N	\N	f
9120	1022	TEXT	species.8.description	Une vingtaine d'espèces de mammifères marins fréquentent les eaux de Saint-Pierre et Miquelon, dont deux espèces de phoques : le Phoque veau-marin (*Phoca vitulina*) et le Phoque gris (*Halichoerus grypus*). On les observe en particulier dans la lagune du Grand Barachois.  \n  \nStatut sur la Liste rouge mondiale : préoccupation mineure pour les deux espèces. 	\N	\N	\N	f
9121	1022	TEXT	events.2.description	première installation permanente des pêcheurs bretons, normands et basques	\N	\N	\N	f
9122	1022	TEXT	events.3.description	première étude publiée sur la flore de Saint-Pierre et Miquelon (thèse de pharmacie d’Alphonse Gaulthier)	\N	\N	\N	f
9123	1022	IMAGE	species.2.image	\N	1108	© Richard Bartz / CC BY-SA 3.0	\N	f
9124	1022	IMAGE	identity.image	\N	1109	L'étang du Bois brûlé © Nathalie de Lacoste	\N	f
9567	1023	TEXT	presentation.category	Sur terre et en mer	\N	\N	\N	f
9568	1023	TEXT	action.cards.1.description	Si je suis fumeur, je ne jette jamais ma cigarette dans la nature. \nJe peux acheter ou fabriquer un cendrier de poche que je garde toujours avec moi pour y mettre mes mégots.	\N	\N	\N	f
9940	1001	TEXT	identity.population	390 253	\N	\N	\N	f
9941	1001	IMAGE	interests.locations.3.image	\N	1175	Image manquante	\N	f
9942	1001	TEXT	species.3.name	Le Dynaste scieur de long	\N	\N	\N	f
9943	1001	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
9944	1001	IMAGE	species.8.image	\N	1174	Image manquante	\N	f
9945	1001	TEXT	species.0.name	La Frégate superbe	\N	\N	\N	f
9946	1001	TEXT	events.4.date	2012	\N	\N	\N	f
9947	1001	IMAGE	interests.locations.2.image	\N	1165	Les îles de Petite Terre et Désirade © Olivier Delzons	\N	f
10177	1021	TEXT	species.3.description	Le Petit molosse de la Réunion (*Mormopterus francoismoutoui*), est l’une des 3 espèces de chauve-souris présentes sur l’île et la seule strictement endémique encore présente. Les chauves-souris sont les seuls mammifères indigènes, toutes les autres espèces de mammifères présents ayant été introduits par l’homme, volontairement (élevage ou animaux domestiques) ou involontairement (souris, rats, etc.).  \n  \nStatut sur la Liste rouge des mammifères marins de la Réunion : préoccupation mineure. 	\N	\N	\N	f
10178	1021	TEXT	interests.locations.0.name	Le Parc national de la Réunion	\N	\N	\N	f
10179	1021	TEXT	species.1.description	Le Tuit-Tuit (*Coracina newtoni*), nommé ainsi en raison du chant du mâle, est un passereau endémique de la forêt de la Roche écrite, dans le nord de l’île. Victime de la prédation par les rats et les chats, sa population est estimée à quelques dizaines de couples et il est considéré en grand danger d’extinction. Grâce aux programmes de lutte contre les prédateurs introduits mis en place par la SEOR, ses effectifs remontent petit à petit.  \n  \nStatut sur la Liste rouge des oiseaux de la Réunion : en danger critique. 	\N	\N	\N	f
9125	1022	IMAGE	ecosystems.ecosystems.4.image	\N	1215	Image manquante	\N	f
9126	1022	TEXT	species.3.description	Le Pluvier siffleur (*Charadrius melodus*) est un oiseau très rare dans l’archipel, seuls quelques couples sont observés annuellement au niveau de l’isthme entre Miquelon et Langlade.  \n  \nStatut sur la Liste rouge mondiale : quasi menacé. 	\N	\N	\N	f
9127	1022	TEXT	events.7.description	Ouverture de la maison de la nature et de l'environnement	\N	\N	\N	f
9128	1022	TEXT	events.7.date	2017	\N	\N	\N	f
9129	1022	TEXT	interests.locations.0.name	Le Grand Barachois	\N	\N	\N	f
9130	1022	TEXT	species.1.description	Le Lièvre américain (*Lepus americanus*) et le Lièvre arctique (*Lepus arcticus*) ont également été introduits pour la chasse respectivement en 1881 et 1982. Le premier occupe les milieux forestiers, sur lesquels il exerce une forte pression, tandis que le second préfère la végétation des landes et de la toundra. Leurs populations sont désormais importantes et leur observation est fréquente.	\N	\N	\N	f
9131	1022	TEXT	species.2.description	Le Macareux moine (*Fratercula arctica*) présente l’une des plus importantes populations d’oiseaux nicheurs de l’archipel (environ 10 000 couples). On le trouve en particulier sur les îlots du Petit et du Grand Colombier.  \n  \nStatut sur la Liste rouge mondiale : vulnérable. 	\N	\N	\N	f
9132	1022	TEXT	events.0.description	prise de possession française des îles par Jacques Cartier	\N	\N	\N	f
9133	1022	TEXT	events.1.description	fermeture naturelle de l’isthme	\N	\N	\N	f
9134	1022	IMAGE	ecosystems.image	\N	1111	© Nathalie de Lacoste	\N	f
10180	1021	TEXT	species.2.description	Les baleines à bosses (*Megaptera novaeangliae*) viennent se reproduire le long des côtes réunionnaises entre juin et octobre. S’il est possible de les observer depuis un bateau, le respect de la [règlementation](https://cedtm-asso.org/quietude/la-reglementation/) est impératif pour préserver la tranquillité des cétacés, mais également pour la sécurité des observateurs.\n\nStatut dans la Liste rouge des mammifères marins de La Réunion : vulnérable. \nStatut sur la Liste rouge des mammifères marins de la Réunion : vulnérable. 	\N	\N	\N	f
10181	1021	TEXT	events.0.description	émergence de l’île	\N	\N	\N	f
10182	1021	TEXT	events.1.description	dernière éruption du Piton des Neiges	\N	\N	\N	f
10183	1021	IMAGE	ecosystems.image	\N	1101	Cirque de Mafate © Céline Soyer	\N	f
10184	1021	TEXT	identity.species	10 463	\N	\N	\N	f
10185	1021	TEXT	statistics.1.number	3 500	\N	\N	\N	f
9569	1023	TEXT	presentation.description	Mégots, sacs plastiques, piles, canettes, vieux filets de pêche, carcasses de voitures… Sur terre comme en mer, tous ces déchets abandonnés dégradent les écosystèmes !	\N	\N	\N	f
9570	1023	TEXT	action.title	Pour que mes déchets n’impactent pas les milieux 	\N	\N	\N	f
9571	1023	TEXT	understand.quote	A l’échelle mondiale, on estime que 8 millions de tonnes de plastique finissent chaque année dans les océans ! Et un mégot peut polluer à lui seul 500 litres d’eau.	\N	\N	\N	f
9572	1023	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
9573	1023	TEXT	action.cards.0.description	Je ne jette jamais mes déchets dans la nature, même si ils me semblent biodégradables. Si il n’y a pas de poubelles à proximité, je les garde avec moi en attendant.	\N	\N	\N	f
10186	1021	IMAGE	ecosystems.ecosystems.0.image	\N	1099	Sentier de randonnée dans la forêt humide © Philippe Gourdain	\N	f
10187	1021	TEXT	statistics.0.number	2007	\N	\N	\N	f
10188	1021	TEXT	statistics.2.number	1 738 espèces	\N	\N	\N	f
9948	1001	IMAGE	ecosystems.ecosystems.2.image	\N	1012	La cascade aux écrevisses dans la forêt humide de Guadeloupe © Daniel Öberg/Unsplash	\N	f
9949	1001	TEXT	interests.locations.3.name	La Réserve naturelle nationale de la Désirade	\N	\N	\N	f
6389	1010	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
6390	1010	TEXT	understand.text2	De nombreuses espèces ne sont pas encore évaluées ou sont classées dans la catégories "données insuffisantes". C’est le cas par exemple pour de nombreux invertébrés ou pour la fonge (les champignons), qui sont pourtant essentiels au bon fonctionnement des écosystèmes. De nombreux territoires d'outre-mer ont développé des Listes rouges à l'échelle de leur territoire, mais certains, comme la Nouvelle-Calédonie ou Wallis et Futuna n'en disposent pas encore. \nLes chiffres présentés dans les listes rouges ne sont donc pas exhaustifs, ils se précisent régulièrement au fur et à mesure de l’amélioration des connaissances scientifiques et de la parution de nouveaux travaux.	\N	\N	\N	f
9950	1001	TEXT	interests.locations.0.description	Créé en 1989 et premier parc national d’outre-mer, son aire d’adhésion s’étend sur 16 communes du territoire et son cœur de parc sur 21 850 ha dont 3 300 ha marins. Tout l’enjeu du PNG est de conjuguer les activités humaines avec la préservation du patrimoine naturel de grande valeur de la Guadeloupe.	\N	\N	\N	f
9951	1001	TEXT	interests.locations.2.description	Composée de deux îles séparées par un chenal de 150m de large, ce site présente l’une des plus importantes populations d’Iguane des Petites Antilles (*Iguana delicatissima*). C’est également un refuge pour de nombreuses espèces d’oiseaux, un lieu de ponte pour les tortues marines, et on y trouve également le dernier peuplement de Gaïac (*Guaiacum officinale*), un petit arbre au bois très dense.	\N	\N	\N	f
9952	1001	TEXT	interests.locations.1.description	Entre Basse Terre et Grande Terre, cette baie est un véritable réservoir de biodiversité. Côté mer, des herbiers de phanérogames sont entourés par le récif coralliens le plus long des petites Antilles (39 km). Côté terre, la baie est bordée par des mangroves, des forêts marécageuses et marais herbacés sur plus de 5 000 ha. 	\N	\N	\N	f
9953	1001	TEXT	ecosystems.ecosystems.3.name	Les mangroves	\N	\N	\N	f
9954	1001	TEXT	statistics.1.text	du territoire couvert par la forêt	\N	\N	\N	f
9955	1001	TEXT	identity.subtitle	titre découverte	\N	\N	\N	f
9956	1001	IMAGE	species.4.image	\N	1170	Image manquante	\N	f
9957	1001	IMAGE	species.7.image	\N	1173	Image manquante	\N	f
9958	1001	TEXT	species.5.name	Le Palmier ti-koko	\N	\N	\N	f
9959	1001	TEXT	risks.risks.0.description	Grâce à la création du parc national, la Guadeloupe a permis de développer un statut de protection pour les écosystèmes et les espèces relativement tôt. Cependant, malgré les règlementations de protection, les obligations ne sont pas toujours respectées et les contrôles ne sont pas suffisamment appliqués par manque de moyens. Les formations forestières, en particulier sur le littoral, régressent constamment à cause de l’augmentation des aménagements et infrastructures, et beaucoup de défrichements et de remblais sont pratiqués dans l’illégalité. \nLes plantations de Mahogany ont détruit des milliers d’hectares de forêts mésophiles.  \n\nDe nombreuses espèces introduites représentent une menace importante pour la biodiversité comme la petite mangouste indienne (*Herpestes javanicus*), l’Iguane commun (*Iguana iguana*), la Fourmi manioc (*Acromyrmex octospinosus*), l’Escargot géant africain (*Achatina fulica*), ou encore le Tulipier du Gabon (*Spathodea campanulata*).  \n\nComme en Martinique, la chlordécone, pesticide utilisé dans les bananeraies entre les années 1970 et 1990 a massivement pollué les milieux naturels de l’île. Si ces impacts sur la santé humaine commencent à être connus, peu de données sont disponibles sur ses conséquences sur les espèces, cependant des études ont montré une importante contamination des organismes marins côtiers ce qui a conduit à interdire la pêche dans certaines zones.  \n\nLe projet de réintroduction du Lamentin d’Amérique (Trichechus manatus) porté depuis 2014 par le Parc National de Guadeloupe dans le cadre du LIFE Sirenia, a finalement dû être interrompu en en 2018. 	\N	\N	\N	f
9960	1001	TEXT	events.3.date	2010	\N	\N	\N	f
9961	1001	TEXT	ecosystems.ecosystems.2.description	Entre 300 et 1000 m d’altitude, la forêt est luxuriante : fougères, arbustes, herbacées, lianes et autres épiphytes, sous le couvert de très grands arbres tels que le Gommier (*Dacryodes excelsa*) ou l’Acomat boucan (*Sloanea caribaea*) qui étendent leur branchage jusqu’à plus de 30 m de haut. 	\N	\N	\N	f
9962	1001	IMAGE	ecosystems.ecosystems.3.image	\N	1168	Mangrove de Guadeloupe © Gaëlle Vandersarren	\N	f
9963	1001	IMAGE	species.3.image	\N	1169	Image manquante	\N	f
9964	1001	TEXT	species.1.name	Les Ouassous	\N	\N	\N	f
9965	1001	TEXT	species.7.name	Les Orchidées	\N	\N	\N	f
9966	1001	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
9967	1001	TEXT	ecosystems.ecosystems.1.description	Des plages sableuses emblématiques de « l’imaginaire » des îles tropicales aux plages rocheuses battues par la houle et aux falaises, le littoral guadeloupéen héberge une faune et une flore variée : patates bord-de-mer, amarante bord-de-mer, cocotiers, poirier-pays, fleurit-noël bord-de-mer, reptiles, oiseaux marins et limicoles… Cependant, la pression des activités humaines est forte sur les littoraux et peu de ces milieux sont encore à l’état naturel. 	\N	\N	\N	f
9968	1001	TEXT	ecosystems.ecosystems.0.description	A partir de 1 000m d’altitude, soumise aux vents violents, à l’excès d’humidité et à la persistance des nuages, la végétation n’excède pas 1,50 m de haut et présente un aspect rabougri. Cette « forêt de montagne » composée d’ananas montagnes rouges (*Pitcaimia bifrons*) ou jaunes (*Guzmania plumierii*), de thym-montagne (*Tibouchina ornat*a), de mangle de montagne (*Clusia venosa*) et de laurier rose (*Podocarpus coriaceus*) laisse place sur les très hauts sommets aux mousses et aux lichens. 	\N	\N	\N	f
9969	1001	TEXT	identity.highestPoint	1 467	\N	\N	\N	f
9970	1001	TEXT	risks.risks.0.name	Le premier parc national dans les outre-mer	\N	\N	\N	f
9971	1001	IMAGE	interests.locations.1.image	\N	1007	Le lagon paradisiaque de Grand Cul-de-Sac Marin © Guilhem Pouxviel  / CC BY-SA 4.0 	\N	f
9972	1001	IMAGE	ecosystems.ecosystems.1.image	\N	1011	Plage de Deshaies © Stephane Wegner /Unsplash 	\N	f
9973	1001	TEXT	interests.locations.3.description	Créée en 2011 pour préserver le patrimoine géologique exceptionnel de l’île, où l’on observe les très rares traces des prémices de la formation de la plaque tectonique des Caraïbes, l’île abrite également une végétation particulière avec plusieurs espèces rares dont le Cactus tête à l’Anglais (*Melocactus intortus*), ainsi que de nombreuses espèces d’oiseaux marins. 	\N	\N	\N	f
9974	1001	TEXT	identity.title	La Guadeloupe,  \n« l’île aux belles eaux »	\N	\N	\N	f
9975	1001	TEXT	species.4.name	Les Anolis	\N	\N	\N	f
9574	1029	IMAGE	presentation.file	\N	1221	Affiche PDF	\N	f
9575	1029	TEXT	presentation.name	Je participe au développement des connaissances et la préservation de la biodiversité des outre-mer	\N	\N	\N	f
9576	1029	IMAGE	action.cards.0.icon	\N	1150	jumelles	\N	f
9976	1001	TEXT	identity.area	1 628	\N	\N	\N	f
9977	1001	TEXT	species.0.description	La Frégate superbe (*Fregata magnificens*) est un oiseau marin de grande taille reconnaissable à sa queue fourchue et ses ailes longues et effilées. Le mâle est noir et remarquable par la présence d’une poche rouge sous la gorge qu’il gonfle pendant les parades nuptiales. La femelle et les juvéniles sont tachés de blanc sur le dos et la poitrine. L’espèce n’est cependant pas nicheuse en Guadeloupe.  \n  \nStatut sur la Liste rouge des oiseaux de Guadeloupe : Préoccupation mineure. 	\N	\N	\N	f
9978	1001	IMAGE	species.6.image	\N	1172	Image manquante	\N	f
9979	1001	TEXT	identity.highestPointName	La Soufrière	\N	\N	\N	f
9980	1001	TEXT	interests.locations.1.name	La baie de Grand Cul-de-Sac Marin	\N	\N	\N	f
9981	1001	TEXT	statistics.2.text	Création du premier parc national d’outre-mer	\N	\N	\N	f
9982	1001	IMAGE	species.0.image	\N	1008	*Fregata magnificens* © macraegi /  CC BY-SA 2.0	\N	f
9983	1001	TEXT	events.1.date	1989	\N	\N	\N	f
9984	1001	TEXT	ecosystems.ecosystems.2.name	La forêt humide	\N	\N	\N	f
10189	1021	IMAGE	interests.locations.4.image	\N	1188	Image manquante	\N	f
9577	1029	IMAGE	presentation.image	\N	1148	© Raphael Gailhac	\N	f
10190	1021	TEXT	species.2.name	La Baleine à bosse	\N	\N	\N	f
10191	1021	TEXT	species.8.name	Le Bois d’Ortie	\N	\N	\N	f
10192	1021	TEXT	species.4.description	Le Pétrel de Barau (*Pterodroma baraui*), également appelé « Taille Vent », est un oiseau endémique nichant dans des terriers à même le sol, en haute altitude sur les contreforts du Piton des Neiges. Victimes de la prédation par les rats et les chats, de nombreux jeunes sont également désorientés par les éclairages publics lors de leur premier envol et s’échouent en milieu urbain. En danger d’extinction, l’espèce fait l’objet d’un plan de conservation [LIFE+ Pétrels](https://www.petrels.re/).\n\nStatut dans la Liste rouge des oiseaux de La Réunion : en danger. 	\N	\N	\N	f
10193	1021	TEXT	events.6.description	Publication des premiers volumes de La Flore des Mascareignes, auquel le botaniste Thérésien Cadet a apporté une contribution considérable.	\N	\N	\N	f
10194	1021	TEXT	events.6.date	1976	\N	\N	\N	f
10195	1021	TEXT	ecosystems.ecosystems.0.name	Les forêts humides	\N	\N	\N	f
10196	1021	TEXT	species.5.description	Les Fanjan sont des fougères arborescentes typiques des forêts de Bois de couleur des Hauts. On distingue 3 espèces différentes : *Cyathea borbonica*, *C. glaucifolia* et *C. celsa*. Traditionnellement utilisés pour la confection de pots à plantes vertes, leur prélèvement a entrainé une dégradation importante des écosystèmes et une menace pour la conservation de ces espèces. Une autre espèce de Cyathea, originaire d’Australie (*C. cooperi*) a été introduite sur l’île et présente un caractère envahissant qui pourrait menacer les espèces indigènes.  \n  \nStatut sur la liste rouge de la flore vasculaire de la Réunion (pour les 3 espèces indigènes) : préoccupation mineure. 	\N	\N	\N	f
10197	1021	TEXT	species.6.description	Le Latanier rouge (*Latania lontaroides*) est un palmier endémique de La Réunion. A l’état naturel, on ne le trouve plus que dans le sud de l’île et il est considéré en danger critique d’extinction. Il était exploité pour son bois et ses palmes utilisées pour les toits.  \n  \nStatut sur la Liste rouge de la flore vasculaire de la Réunion : en danger critique. 	\N	\N	\N	f
10198	1021	TEXT	events.4.description	publication des listes rouges de la Faune et de la Flore de la Réunion	\N	\N	\N	f
10199	1021	TEXT	events.5.description	publication de la liste rouge des coraux de l’Océan Indien	\N	\N	\N	f
10200	1021	TEXT	interests.locations.2.name	La forêt de Mare-Longue	\N	\N	\N	f
10201	1021	TEXT	ecosystems.ecosystems.3.description	Aussi appelés Pandanaies, ces habitats sont formés par le Pimpin des Hauts (*Padanus montanus*), un petit arbre aux racines en échasses endémique de la Réunion, qui sert de support pour de nombreuses espèces de mousses, fougères et orchidées. Uniques au monde, ces zones humides remarquables se trouvent principalement sur les versants de l'Est et du Sud-est de l'île. La [Pandanaie de la Plaine des Palmistes](file:///C:/Users/DBLOTT~1/AppData/Local/Temp/depliant_pandanaie_def.pdf), particulièrement riche en faune et flore, fait l'objet d'un arrêté de protection de biotope.	\N	\N	\N	f
10202	1021	TEXT	interests.locations.5.name	La Réserve naturelle marine	\N	\N	\N	f
10203	1021	TEXT	events.0.date	2 à 3 millions d’années,	\N	\N	\N	f
10204	1021	TEXT	identity.populationYear	2017	\N	\N	\N	f
10205	1021	IMAGE	species.5.image	\N	1191	Image manquante	\N	f
6391	1010	TEXT	understand.text1	L'Union internationale pour la conservation de la nature (UICN) développe depuis 1964 un outil permettant de mesurer l'état de conservation de la faune et de la flore mondiale : la Liste rouge. Les espèces y sont classifiées par catégories selon leur degré de vulnérabilité. Cela permet d'identifier les priorités d'action, les progrès accomplis ou les défis à relever pour la conservation des espèces. En France, l'élaboration des Listes rouges est mise en oeuvre par le Muséum national d'histoire naturelle, le Comité français de l'UICN et l'Office français de la biodiversité, en collaboration avec un large réseau d'experts. \n\nLe chiffre présenté ici comprend les espèces classées dans les catégories « éteintes », « éteintes à l’état naturel », « en danger critique d’extinction », « en danger » et « vulnérables » dans les Listes rouges réalisées en outre-mer. Parmi ces espèces menacées, on trouve de nombreuses espèces endémiques.	\N	\N	\N	f
6392	1010	TEXT	territories.title	Nombre d'espèces menacées par territoire	\N	\N	\N	f
6393	1010	TEXT	understand.title1	La Liste rouge de l'UICN	\N	\N	\N	f
6394	1010	TEXT	understand.title2	Un manque de connaissances et d'évaluations	\N	\N	\N	f
6395	1010	TEXT	presentation.descriptionTerritories	des espèces sont considérées comme éteintes ou menacées	\N	\N	\N	f
6396	1010	TEXT	understand.paragraphs.0.title	Quelles sont ces menaces ?	\N	\N	\N	f
6397	1010	TEXT	understand.keyword	menaces	\N	\N	\N	f
6398	1010	TEXT	ecogestures.title	Que puis-je faire pour protéger les espèces menacées ?	\N	\N	\N	f
6399	1010	IMAGE	presentation.image	\N	1041	Albatros hurleur © Julie Tucoulet	\N	f
6400	1010	TEXT	understand.paragraphs.0.text	Selon l'IPBES*, les cinq facteurs directs de changement qui affectent la nature et qui ont les plus forts impacts à l’échelle mondiale sont, dans l'ordre : les changements d’usage des terres et de la mer, l'exploitation directe de certains organismes, le changement climatique, les pollutions et les espèces exotiques envahissantes. Dans les îles, les espèces exotiques envahissantes seraient le premier facteur de perte de biodiversité. Les impacts de ces différents facteurs sont souvent liés et s'additionnent : l'installation de certaines espèces exotiques peut par exemple être facilitée par les changements climatiques. \n\nDes programmes de conservation sont mis en place pour tenter de protéger ces espèces menacées, notamment en préservant leurs milieux de vie et en règlementant les activités humaines pour limiter leurs impacts.\n\n*la Plateforme intergouvernementale scientifique et politique sur la biodiversité et les services écosystémiques (en anglais IPBES) est un groupement international d'experts de la biodiversité, créé sous l'égide de l'ONU en 2012. L'IPBES a publié le 6 mai 2019 le premier rapport d'évaluation mondiale sur la biodiversité et les services écosystémiques. 	\N	\N	\N	f
6401	1010	IMAGE	understand.image	\N	1042	Tortue luth © Raphael Gailhac	\N	f
6402	1010	TEXT	presentation.description	des espèces d’outre-mer sont considérées comme éteintes ou menacées	\N	\N	\N	f
6403	1010	TEXT	presentation.logoUrl	NA	\N	\N	\N	f
9578	1029	TEXT	understand.text	On estime que seule 30% des espèces de faune et de flore présentes en outre-mer sont bien répertoriées. La mise en place d’études pour suivre les espèces nécessite beaucoup de temps de la part de chercheurs, c’est pourquoi pour les compléter, de nombreux programmes de sciences participatives sont mis en place afin de permettre à chacun de participer à la connaissance en faisant remonter ses observations.\n\nUne étude est actuellement en cours pour recenser tous les programmes de sciences participatives en outre-mer. Lorsque l'état des lieux sera terminé, le Compteur présentera un annuaire vous permettant de sélectionner les programmes qui vous correspondent en fonction de votre territoire et vos centres d'intérêt.\n\nDe plus, de nombreuses associations font régulièrement appel à des bénévoles, par exemple pour participer à des opérations de restauration des milieux : arrachages de plantes exotiques envahissantes, plantations d'espèces indigènes, ramassages de déchets,... Des sorties découvertes sont également régulièrement organisées par les acteurs locaux afin d'en savoir plus sur les écosystèmes et leurs habitants, tout en les respectant. \n\n	\N	\N	\N	f
9579	1029	IMAGE	action.cards.1.icon	\N	1149	réseau	\N	f
9580	1029	TEXT	presentation.category	Connaissance	\N	\N	\N	f
9581	1029	TEXT	action.cards.1.description	Je m’informe sur les actions mises en place par les associations locales pour participer à des chantiers participatifs ou des sorties nature.	\N	\N	\N	f
9582	1029	TEXT	presentation.description	En participant à des programmes de sciences participatives ou des activitées organisées par les acteurs locaux. 	\N	\N	\N	f
9583	1029	TEXT	action.title	Pour contribuer activement à la connaissance et la préservation de la biodiversité :	\N	\N	\N	f
9584	1029	TEXT	understand.quote	il faudrait un chiffre ou une citation sur l'implication dans les sciences participatives en outre-mer	\N	\N	\N	f
9585	1029	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
9586	1029	TEXT	action.cards.0.description	Je rejoins les réseaux de sciences participatives afin de faire remonter mes observations (annuaire prochainement disponible).	\N	\N	\N	f
10206	1021	TEXT	statistics.0.text	Création du Parc National de La Réunion	\N	\N	\N	f
10207	1021	IMAGE	species.1.image	\N	1159	*Coracina newtoni*© Jaime Martinez / CC BY-SA 4.0	\N	f
10208	1021	TEXT	ecosystems.ecosystems.1.name	La forêt sèche	\N	\N	\N	f
10209	1021	TEXT	events.2.date	1708	\N	\N	\N	f
9135	1022	TEXT	identity.species	2 083	\N	\N	\N	f
10210	1021	TEXT	events.5.date	2020	\N	\N	\N	f
10211	1021	TEXT	identity.marineArea	318 300	\N	\N	\N	f
10392	1005	LINK	onb.link	Retrouvez les indicateurs sur le site de l’ONB	\N	\N	 http://indicateurs-biodiversite.naturefrance.fr/	f
10393	1005	TEXT	inpn.description	empty description please fill me	\N	\N	\N	f
10394	1005	IMAGE	image	\N	1016	Serpent liane perroquet © Raphael Gailhac	\N	f
10395	1005	TEXT	questions.1.quote	Avec ses territoires d’outre-mer, la France a dont une responsabilité forte dans la conservation de la biodiversité mondiale.	\N	\N	\N	f
6406	1011	TEXT	understand.text1	Les forêts primaires et autres écosystèmes forestiers des outre-mer présentent une biodiversité considérable. Les territoires ultra marins sont cependant très hétérogènes dans leur couverture forestière et leurs caractéristiques : des forêts tropicales humides de Guyane qui couvrent la quasi-totalité du territoire aux forêts boréales de conifères de Saint-Pierre et Miquelon, chaque territoire possède une couverture forestière et une biodiversité qui lui est propre. Seuls Saint-Barthélemy, les îles australes et la Terre Adélie ne présentent pas de forêts sur leurs territoires. 	\N	\N	\N	f
6407	1011	TEXT	territories.title	La proportion de forêt par territoire	\N	\N	\N	f
6408	1011	TEXT	understand.title1	Les forêts, un réservoir de biodiversité	\N	\N	\N	f
6409	1011	TEXT	understand.title2	Pourquoi mesurer le taux de boisement ? 	\N	\N	\N	f
6410	1011	TEXT	presentation.descriptionTerritories	du territoire est occupé par des forêts	\N	\N	\N	f
6411	1011	TEXT	understand.paragraphs.0.title	Des services écosystémiques et une valeur patrimoniale	\N	\N	\N	f
6412	1011	TEXT	understand.keyword	forets	\N	\N	\N	f
6413	1011	TEXT	ecogestures.title	Que puis-je faire pour préserver la biodiversité forestière ? 	\N	\N	\N	f
6414	1011	IMAGE	presentation.image	\N	1043	Fougères arborescentes, La Réunion © Philippe Gourdain	\N	f
6415	1011	TEXT	understand.paragraphs.0.text	Au-delà de leur rôle pour la préservation de la biodiversité, les forêts nous fournissent de nombreux services écosystémiques : elles protègent par exemple les sols de l’érosion, préservent les ressources en eau et stockent le carbone. Elles permettent de se fournir en bois de construction et plantes médicinales, bien que ces ressources puissent être surexploitées. Les forêts ont également une grande importance culturelle dans les territoires d'outre-mer, dans les légendes, les arts et le bien-être de la population.   \n\nElles sont cependant soumises à de nombreuses pressions : déboisement pour l’agriculture, l’exploitation du bois ou de mines, artificialisation du territoire, introduction d’espèces exotiques envahissantes, effets des changements climatiques... 	\N	\N	\N	f
6416	1011	IMAGE	understand.image	\N	1046	Forêt de Morne-Rouge, Martinique ©  G. Gigot	\N	f
6417	1011	TEXT	presentation.description	du territoire d’outre-mer est occupé par des forêts	\N	\N	\N	f
6418	1011	TEXT	presentation.logoUrl	NA	\N	\N	\N	f
9136	1022	TEXT	statistics.1.number	86 %  	\N	\N	\N	f
9137	1022	IMAGE	ecosystems.ecosystems.0.image	\N	1106	© Nathalie de Lacoste	\N	f
9138	1022	TEXT	statistics.0.number	La seule 	\N	\N	\N	f
9139	1022	TEXT	statistics.2.number	1 000	\N	\N	\N	f
9140	1022	TEXT	species.2.name	Le Macareux moine 	\N	\N	\N	f
9141	1022	TEXT	species.8.name	Les phoques	\N	\N	\N	f
9142	1022	TEXT	species.4.description	Le Sapin baumier (*Abies balsamea*) est le conifère dominant de la forêt boréale. Caractéristique des forêts boréales nord-américaines, il est parfois accompagné d’autres conifères moins fréquents.  \n  \nStatut sur la Liste rouge mondiale : préoccupation mineure. 	\N	\N	\N	f
9143	1022	TEXT	events.6.description	création du Conseil Scientifique Territorial du Patrimoine Naturel (CSTPN) et projet de réserve naturelle nationale du Grand Colombier	\N	\N	\N	f
9144	1022	TEXT	events.6.date	2007	\N	\N	\N	f
9145	1022	TEXT	ecosystems.ecosystems.0.name	Les landes et la toundra	\N	\N	\N	f
10212	1021	TEXT	identity.presentation	« L’île intense » est située sur un point chaud de biodiversité et présente un fort taux d’endémisme. Les milieux naturels y sont relativement bien conservés par rapport aux autres îles des Mascareignes (Maurice et Rodrigues) en raison de son relief escarpé. De nombreuses espèces ont toutefois disparu depuis l’arrivée des humains au 16e siècle sur une île alors inhabitée. Forêts humides, ravines et rivières, cirques et remparts, volcan, récif corallien... La Réunion présente une diversité d’écosystèmes et une forte volonté de préservation.	\N	\N	\N	f
10213	1021	IMAGE	interests.locations.0.image	\N	1098	Sentier dans le Parc national de la Réunion © Philippe Gourdain	\N	f
10214	1021	TEXT	species.6.name	Le Latanier rouge	\N	\N	\N	f
10215	1021	TEXT	identity.population	853 659	\N	\N	\N	f
10216	1021	IMAGE	interests.locations.3.image	\N	1157	Vue sur le Piton de la Fournaise © Philippe Gourdain	\N	f
6449	1012	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
6450	1012	TEXT	understand.text2	Ces milieux ont également une importance au regard des services écosystémiques qu’ils procurent aux humains : régulation des crues et des inondations, protection des côtes de l’érosion et des tempêtes, épuration des eaux... \nSi des phénomènes naturels tels que les cyclones peuvent impacter les mangroves, de nombreuses causes de leur dégradation ont une origine humaine : changement climatique, artificialisation, exploitation intensive de ses ressources (bois, chasse, etc.), dépôts d’ordures, déversement des eaux usées, pollutions, pression touristique, etc. 	\N	\N	\N	f
10217	1021	TEXT	species.3.name	Le Petit molosse de la Réunion	\N	\N	\N	f
10218	1021	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
10219	1021	IMAGE	species.8.image	\N	1194	Image manquante	\N	f
10220	1021	TEXT	species.0.name	Le Gecko vert de Manapany	\N	\N	\N	f
10221	1021	TEXT	events.4.date	2010	\N	\N	\N	f
10222	1021	IMAGE	interests.locations.2.image	\N	1158	Tronc d’un arbre « bois de pomme » (Syzygium borbonicum), forêt de Mare Longue © Philippe Gourdain	\N	f
10223	1021	IMAGE	ecosystems.ecosystems.2.image	\N	1195	Image manquante	\N	f
10224	1021	TEXT	interests.locations.3.name	Le massif de la Fournaise	\N	\N	\N	f
10225	1021	TEXT	interests.locations.0.description	Le Parc national englobe la partie centrale des deux massifs volcaniques de l'île : celui du Piton des\nNeiges, le plus ancien avec les trois cirques, et celui du Piton de la Fournaise. La zone cœur de parc\ncouvre 42 % de la superficie de l’île.	\N	\N	\N	f
10226	1021	TEXT	interests.locations.2.description	Vestige de forêt humide primaire de basse altitude, cette forêt aujourd’hui réduite à une centaine d’hectares est cependant bien conservée. Elle abrite une richesse remarquable en espèces végétales, dont de nombreuses espèces endémiques.	\N	\N	\N	f
9587	1024	IMAGE	presentation.file	\N	1222	Affiche PDF	\N	f
9588	1024	IMAGE	action.cards.2.icon	\N	1124	relaché	\N	f
9589	1024	TEXT	presentation.name	Je protège les milieux contre l’introduction d’espèces exotiques envahissantes	\N	\N	\N	f
9590	1024	IMAGE	action.cards.0.icon	\N	1122	Planter	\N	f
9591	1024	IMAGE	presentation.image	\N	1120	© Hans-Jörg Hellwig / CC BY-SA 3.0	\N	f
9592	1024	TEXT	understand.text	Les espèces introduites par l’homme hors de leur territoire d’origine peuvent se développer de manière importante dans leur milieu d’introduction et menacer la biodiversité locale, par compétition (pour l'espace, la nourriture, la lumière...), la prédation, ou encore en entrainant des modifications du milieu. Certaines espèces peuvent également avoir des conséquences économiques et sanitaires importantes. Lien voir l'indicateur ? \n\nDes animaux de compagnie qui s'échappent ou sont lâchés volontairement dans la nature lorsque leur propriétaire ne souhaitent pas les garder, c'est l'origine de l'introduction de nombreuses espèces animales exotiques aujourd'hui problématiques, souvent communes aux territoires d'outre-mer : Tortues de Floride et autres reptiles, poissons d'aquarium comme le guppy ou le poisson-zèbre, des oiseaux comme le bulbul Orphée ou le rossignol du Japon...\n\nDes nombreuses espèces végétales importées ont été plantées dans les parcs et les  jardins pour leur intérêt esthétique, mais certaines n'ont pas tardé à se disperser largement dans les milieux naturels, et à entrer en compétition avec les espèces végétales locales. \n\nDésormais, des règlementations, plus ou moins strictes selon les territoires, existent pour limiter l'introduction d'espèces potentiellement envahissantes.\n\nA noter : les chats sont l'une des espèces introduites les plus impactantes pour les écosystèmes insulaires. Ils se reproduisent rapidement et prédatent de nombreuses espèces indigènes, en particulier de reptiles et d'oiseaux. Une thèse réalisée en Nouvelle-Calédonie en 2017 a par exemple montré que les chats consommaient 44 espèces différentes, dont 20 étaient classées sur la liste rouge des espèces menacées. Pour limiter l'impact de votre chat domestique, stérilisez-le et appliquer quelques recommandations simples : lien vers ressource. 	\N	\N	\N	f
9593	1024	IMAGE	action.cards.1.icon	\N	1123	aquarium	\N	f
9594	1024	TEXT	action.cards.2.description	Je ne relâche pas mes animaux de compagnie exotique dans la nature. Si je souhaite ne pas conserver mon animal, je me renseigne sur les solutions alternatives. Certaines espèces sont désormais interdites de détention et nécessitent d’avoir des autorisations.  	\N	\N	\N	f
9595	1024	TEXT	presentation.category	Sur terre et en mer	\N	\N	\N	f
9596	1024	TEXT	action.cards.1.description	Je ne vidange pas mon aquarium dans la nature. Les plantes aquatiques et les poissons exotiques peuvent être dangereux pour l’équilibre des cours d’eau.	\N	\N	\N	f
9597	1024	TEXT	presentation.description	Les espèces exotiques envahissantes sont une menace majeure pour les écosystèmes, en particulier pour les espaces insulaires qui comptent de nombreuses espèces endémiques.	\N	\N	\N	f
9598	1024	TEXT	action.title	Pour limiter l’introduction et la dispersion d’espèces exotiques envahissantes 	\N	\N	\N	f
9599	1024	TEXT	understand.quote	La Tortue de Floride, considérée comme l'une des 100 espèces les plus envahissantes du monde, est présente en milieu naturel dans quasiment tous les territoires d'outre-mer français (à l'exception de Saint-Pierre et Miquelon, Wallis et Futuna, et les TAAF)	\N	\N	\N	f
9600	1024	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
9601	1024	TEXT	action.cards.0.description	Je me renseigne sur les espèces végétales que je souhaite planter dans mon jardin et je privilégie d’utiliser des espèces locales. Certaines espèces sont interdites d’introduction et d’utilisation sur certains territoires, je respecte la règlementation.	\N	\N	\N	f
9602	1025	IMAGE	presentation.file	\N	1223	test 	\N	f
9603	1025	IMAGE	action.cards.2.icon	\N	1129	chien	\N	f
9604	1025	IMAGE	action.cards.3.icon	\N	1130	véto	\N	f
9605	1025	TEXT	presentation.name	Je respecte la faune sauvage	\N	\N	\N	f
9606	1025	IMAGE	action.cards.0.icon	\N	1127	distance	\N	f
9607	1025	IMAGE	presentation.image	\N	1126	Iguane endémique des Petites Antilles © Fabien Lefebvre	\N	f
9608	1025	TEXT	understand.text	Observer la faune dans son milieu naturel est une chance et une expérience formidable. Cependant, sur terre comme en mer, déranger un animal peut le mettre en péril en occasionnant un stress important et une dépense d’énergie inutile. Il risque également d’abandonner son nid ou ses petits, se blesser, être plus facilement à la merci d’un prédateur… \n\nLes conséquences sont d’autant plus importantes lorsqu’il s’agit d’espèces très menacées, pour laquelle la survie de chaque individu compte.\n\nL'impact des chiens peut être catastrophique pour la faune sensible des outre-mer, que ce soit par prédation ou par le stress qu'ils occasionnent (poursuite, aboiements, destruction de nids,...). En Nouvelle-Calédonie, ils ont joué un rôle non-négligeable dans le déclin de la population de Cagous. \nDans la plupart des espaces protégés, leur présence, même tenus en laisse n'est pas autorisée. 	\N	\N	\N	f
9609	1025	IMAGE	action.cards.1.icon	\N	1128	bruits	\N	f
10396	1005	TEXT	questions.2.answer	De nombreux scientifiques alertent sur la crise de biodiversité actuelle, qui pourrait être la 6e extinction de masse à l’échelle des temps géologique. En effet, le rythme actuel des disparitions d’espèces observé est 100 à 1000 fois supérieur au taux naturel de disparition ! On estime que près de la moitié des espèces vivantes pourrait disparaitre d’ici un siècle. \nLes activités humaines en sont les principales responsables. Cinq causes majeures sont identifiées, qui se conjuguent entre elles : destruction et fragmentation des milieux, surexploitation des espèces, pollutions, changements climatiques et introduction d’espèces exotiques envahissantes.	\N	\N	\N	f
9610	1025	TEXT	action.cards.3.description	Si un animal me parait en détresse, avant toute action, je contacte un professionnel (centre de soin, gestionnaires de réserve) afin de connaitre la démarche la plus adaptée pour lui porter secours.	\N	\N	\N	f
9146	1022	TEXT	species.5.description	La Diapensine de Laponie (*Diapensia lapponica*) est une plante typique de la toundra arcto-alpine de l’archipel. Sa forme en coussinet est adaptée aux conditions climatiques très ventées de ce milieu.  \n  \nStatut sur la Liste rouge mondiale : 	\N	\N	\N	f
6451	1012	TEXT	understand.text1	La mangrove un écosystème forestier constitué principalement de palétuviers, et se trouvant dans la zone de balancement des marées. Espace de transition entre le milieu terrestre et le milieu marin, cet écosystème abrite de nombreuses espèces qui en sont dépendantes pour une partie ou la totalité de leur cycle de vie. \n\nOn estime que les mangroves d’outre-mer couvrent 91 096 ha, la grande majorité se trouvant en Guyane et en Nouvelle-Calédonie. On trouve des mangroves dans tous les écosystèmes tropicaux d’outre-mer, à l’exception de l’île de la Réunion. Cependant, en Polynésie, cet écosystème n’est pas présent naturellement : une espèce de palétuvier, Rhizophora stylosa, a été introduite volontairement dans les années 1930, et s’est ensuite propagée à l’ensemble des îles de la Société, au détriment de certains écosystèmes natifs. 	\N	\N	\N	f
6452	1012	TEXT	territories.title	Les chiffres par territoire	\N	\N	\N	f
6453	1012	TEXT	understand.title1	La mangrove, un écosystème protecteur	\N	\N	\N	f
6454	1012	TEXT	understand.title2	Des bénéfices pour l’Homme, mais de nombreuses pressions 	\N	\N	\N	f
6455	1012	TEXT	presentation.descriptionTerritories	des mangroves font l'objet de mesures de conservation	\N	\N	\N	f
6456	1012	TEXT	understand.paragraphs.0.title	Des statuts de protection variés	\N	\N	\N	f
6457	1012	TEXT	understand.keyword	mangroves	\N	\N	\N	f
6458	1012	TEXT	ecogestures.title	Comment préserver les mangroves à mon échelle ? 	\N	\N	\N	f
6459	1012	IMAGE	presentation.image	\N	1047	Palétuviers à Grand Cul-de-Sac marin, Guadeloupe © Gaëlle Vandersarren	\N	f
6460	1012	TEXT	understand.paragraphs.0.text	Il existe un éventail de dispositions juridiques permettant de protéger les mangroves (sites classés « Ramsar », arrêté de protection de biotope, etc.) et de nombreuses zones de mangroves sont présentes dans les aires protégées des territoires (parcs nationaux, parcs naturels régionaux, réserves naturelles, etc.), cependant, toutes les mangroves protégées ne font pas forcément l’objet de mesures de gestion. \nCet indicateur représente les mangroves bénéficiant d'un gestionnaire identifié et d'un document de gestion établit dans un but de conservation. L’État français fixe la part des surfaces nationales de mangroves gérées à des fins de conservation à 60%, cet objectif n'est donc pas atteint pour le moment. 	\N	\N	\N	f
6461	1012	IMAGE	understand.image	\N	1049	La mangrove est un écosystème protecteur pour les poissons © UICN	\N	f
9147	1022	TEXT	species.6.description	Reconnaissable à sa floraison en clochettes roses, la Linnée boréale (*Linnaea borealis*) est une herbacée abondante dans la forêt boréale.	\N	\N	\N	f
9148	1022	TEXT	events.4.description	introduction volontaire du Lièvre d’Amérique pour la chasse	\N	\N	\N	f
6462	1012	TEXT	presentation.description	des mangroves nationales font l’objet de mesures de conservation	\N	\N	\N	f
6463	1012	TEXT	presentation.logoUrl	NA	\N	\N	\N	f
9149	1022	TEXT	events.5.description	disparition de l’archipel du Lagopède des saules (Lagopus lagopus), oiseau caractéristique des fo-rêts boréales	\N	\N	\N	f
9150	1022	TEXT	interests.locations.2.name	Saint-Pierre	\N	\N	\N	f
9151	1022	TEXT	ecosystems.ecosystems.3.description	Espèces pionnières et graminées colonisent ces milieux littoraux souvent fragilisés par les dégradations (travaux, incendies, pâturages). Espèce typique de ces milieux dunaires, l’oyat (ou Ammophile à ligule courte, *Ammophila breviligulata*) joue un rôle essentiel dans la fixation des dunes et limite l’érosion. En arrière dune, une grande diversité d’espèces indigènes, parfois très rares, cohabitent avec des graminées introduites et naturalisées.	\N	\N	\N	f
9152	1022	TEXT	ecosystems.ecosystems.4.description	« *Les Laminaires sont à la mer ce que la forêt est à la terre* » Daniel Abraham, naturaliste de l'archipel.  \n \nFormant de véritables forêts sous-marines, ces grandes algues brunes jouent un rôle très important dans l’équilibre de l’océan, formant un habitat pour de nombreuses espèces animales et végétales. Elles contiennent également des composants utilisés dans le monde en pharmacologie ou agro-alimentaire.	\N	\N	\N	f
9153	1022	TEXT	ecosystems.ecosystems.4.name	Les forêts de laminaires	\N	\N	\N	f
9154	1022	TEXT	events.0.date	1535	\N	\N	\N	f
9155	1022	TEXT	identity.populationYear	2017	\N	\N	\N	f
9156	1022	IMAGE	species.5.image	\N	1210	Image manquante	\N	f
9157	1022	TEXT	statistics.0.text	forêt boréale française	\N	\N	\N	f
9158	1022	IMAGE	species.1.image	\N	1163	Sans attribution	\N	f
9159	1022	TEXT	ecosystems.ecosystems.1.name	Les marais tourbeux et les tourbières	\N	\N	\N	f
9160	1022	TEXT	events.2.date	17e siècle 	\N	\N	\N	f
9161	1022	TEXT	events.5.date	1985	\N	\N	\N	f
9162	1022	TEXT	identity.marineArea	12 300	\N	\N	\N	f
9163	1022	TEXT	identity.presentation	Au sud de Terre Neuve (Canada), cet archipel se situe à la confluence du courant froid du Labrador et des eaux plus chaudes du Gulf Stream, offrant des eaux riches en biodiversité. La proximité de l’océan influence les écosystèmes terrestres : dunes, prairies côtières, lagunes, marais. On y trouve également la seule forêt boréale française.	\N	\N	\N	f
9164	1022	IMAGE	interests.locations.0.image	\N	1102	© DR	\N	f
9165	1022	TEXT	species.6.name	La Linnée boréale	\N	\N	\N	f
9166	1022	TEXT	identity.population	6 274	\N	\N	\N	f
9167	1022	TEXT	species.3.name	Le Pluvier siffleur	\N	\N	\N	f
9168	1022	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
9169	1022	IMAGE	species.8.image	\N	1213	Image manquante	\N	f
9170	1022	TEXT	species.0.name	Le Cerf de Virginie 	\N	\N	\N	f
9171	1022	TEXT	events.4.date	1881	\N	\N	\N	f
9172	1022	IMAGE	interests.locations.2.image	\N	1162	Vue de Saint-Pierre depuis ? © Nathalie De Lacoste	\N	f
9173	1022	IMAGE	ecosystems.ecosystems.2.image	\N	1110	© Nathalie de Lacoste	\N	f
9611	1025	TEXT	action.cards.2.description	Je tiens mon chien en laisse et je respecte la règlementation dans les lieux où sa présence n’est pas autorisée.	\N	\N	\N	f
9612	1025	TEXT	presentation.category	Sur terre et en mer	\N	\N	\N	f
9613	1025	TEXT	action.cards.1.description	Je limite les bruits (cris, musique…) pour que ma présence reste discrète.  	\N	\N	\N	f
9174	1022	TEXT	interests.locations.0.description	Cette lagune de 1 000 ha est bordée de marais et communique avec la mer par un goulet au sud-est. Le plan d’eau et les marais qui le bordent sont d’une importante richesse tant faunistique que floristique. Ses bancs de sable et ses plages accueillent notamment la plus importante colonie reproductrice de phoques veaux-marins du territoire français. Un plan de gestion du site a été validé en 2011 visant à y protéger les espaces naturels remarquables tout en assurant autant que possible leur ouverture au public.	\N	\N	\N	f
9175	1022	TEXT	interests.locations.2.description	Chef-lieu du territoire, cette commune concentre 86% de la population de l’archipel.	\N	\N	\N	f
9176	1022	TEXT	interests.locations.1.description	Cette bande de sable de 12 km de long relie les îles de Miquelon et Langlade depuis la fin du 18e siècle. Les dunes colonisées par la végétation sont désormais longées par une route 	\N	\N	\N	f
9177	1022	TEXT	ecosystems.ecosystems.3.name	Les dunes sableuses et cordons de galets	\N	\N	\N	f
9178	1022	TEXT	statistics.1.text	des habitants de l'archipel résident à Saint-Pierre	\N	\N	\N	f
9179	1022	TEXT	identity.subtitle	Un climat subarctique, froid et humide	\N	\N	\N	f
9180	1022	IMAGE	species.4.image	\N	1209	Image manquante	\N	f
9181	1022	IMAGE	species.7.image	\N	1212	Image manquante	\N	f
9182	1022	TEXT	species.5.name	La Diapensine	\N	\N	\N	f
9183	1022	TEXT	risks.risks.0.description	Le territoire est pour le moment le seul d’outre-mer français à ne disposer d’aucun dispositif de protection réglementaire (hormis les réserves de chasse et de faune sauvage).\n\nLes espèces exotiques envahissantes, en particulier les mammifères terrestres qui dégradent la forêt boréale mais également des espèces végétales telles que les Renouées (*Reynoutria sp.*) ou des espèces marines comme le Crabe vert (*Carcinus maenas*), ont des impacts potentiellement préoccupants sur les écosystèmes de l'archipel.\n\nLa chasse, bien que permettant la régulation des mammifères introduits, est une question délicate, et freine l’augmentation des populations de plusieurs espèces d’oiseaux dont l’Eider à duvet (*Somateria mollisima*).  \nL’économie de l’archipel a été victime de la surpêche et de l’effondrement des populations de morue des bancs de Terre Neuve, mais la pêche est toujours responsable de nombreuses captures accidentelles (mammifères marins, oiseaux, tortues marines).\n\nUn projet de création de la réserve naturelle des Grand et Petit Colombier a été lancé en 2007. Plaçant sous protection une surface terrestre de 47 ha et une zone maritime de 420 ha, il permettrait de préserver ce site de nidification remarquable. Malgré un avis favorable du Conseil national de protection de la nature, ce projet a été mal perçu par les populations locales craignant des contraintes sur leurs activités traditionnelles, c’est pourquoi il n’a pour le moment pas abouti.  \n  \nSur l’archipel, 40 Zones naturelles d'intérêt écologique, faunistique et floristique (ZNIEFF), abritant au moins une espèce ou un habitat naturel remarquable ou rare, ont été délimitées. Cela couvre 89 % du territoire terrestre et traduit la richesse et la valeur écologique des écosystèmes de ces îles, toutefois ce statut n'engendre pas de protection juridique. Actuellement, seules des espèces de mammifères terrestres et marins, d’oiseaux et de tortues marines bénéficient d’une protection réglementaire. \n	\N	\N	\N	f
9184	1022	TEXT	events.3.date	1866	\N	\N	\N	f
9185	1022	TEXT	ecosystems.ecosystems.2.description	La seule forêt boréale du territoire français se trouve à Saint-Pierre et Miquelon. Fortement dégra-dée par un ancien déboisement intensif, cette forêt présente une végétation arborescente dans les vallées abritées mais se limite à une strate arbustive ou rampante dans les secteurs exposés aux vents. Dominée par les conifères, on y retrouve le caractéristique Sapin baumier (Abies balsa-mea), le Mélèze laricin (Larix laricina), seul conifère qui perd ses épines en hivers ou encore le rare If du Canada (Taxus canadensis).	\N	\N	\N	f
9186	1022	IMAGE	ecosystems.ecosystems.3.image	\N	1214	Image manquante	\N	f
9187	1022	IMAGE	species.3.image	\N	1208	Image manquante	\N	f
9188	1022	TEXT	species.1.name	Les lièvres	\N	\N	\N	f
9189	1022	TEXT	species.7.name	Les Botryches	\N	\N	\N	f
9190	1022	TEXT	interests.title	Lieux d’intérêt	\N	\N	\N	f
9191	1022	TEXT	ecosystems.ecosystems.1.description	Ces zones humides occupent des superficies importantes. Caractérisées par la formation et l’accumulation de tourbe, parfois sur plusieurs mètres d’épaisseur, elles présentent des groupements végétaux remarquables et variés, parmi lesquelles on trouve des sphaignes, des mousses, ainsi que des orchidées.	\N	\N	\N	f
9192	1022	TEXT	ecosystems.ecosystems.0.description	Au-dessus des forêts, les végétaux ligneux adoptent un port prostré et laissent place à des landes dominées par les éricacées au port rampant, dont le Kalmia à feuilles étroites (Kalmia angustifo-lia). Aux altitudes les plus élevées, cette formation laisse place à une toundra adaptée aux condi-tions très venteuses, typique des milieux alpins ou arctiques.	\N	\N	\N	f
9193	1022	TEXT	identity.highestPoint	240	\N	\N	\N	f
9194	1022	TEXT	risks.risks.0.name	Les ressources naturelles, un enjeu important	\N	\N	\N	f
9195	1022	IMAGE	interests.locations.1.image	\N	1103	© DR	\N	f
9196	1022	IMAGE	ecosystems.ecosystems.1.image	\N	1104	© Nathalie de Lacoste	\N	f
9197	1022	TEXT	identity.title	Saint-Pierre-et-Miquelon,  \ndes eaux riches en biodiversité	\N	\N	\N	f
9198	1022	TEXT	species.4.name	Le Sapin baumier	\N	\N	\N	f
9199	1022	TEXT	identity.area	242	\N	\N	\N	f
9200	1022	TEXT	species.0.description	Peu de mammifères terrestres sont indigènes de l’archipel. Le Cerf de Virginie (*Odocoileus virginianus*) a été introduit à Miquelon et Langlade en 1953 pour la chasse. Grâce à leurs importantes capacités d’adaptation et à l’absence de prédateur naturel, les populations de cerfs se sont largement développées et freinent désormais fortement la régénération de la forêt boréale. L’espèce n'est pas présente sur l’île de Saint-Pierre. 	\N	\N	\N	f
9201	1022	IMAGE	species.6.image	\N	1211	Image manquante	\N	f
9202	1022	TEXT	identity.highestPointName	Morne de la Grande Montagne	\N	\N	\N	f
9203	1022	TEXT	interests.locations.1.name	L’isthme	\N	\N	\N	f
9204	1022	TEXT	statistics.2.text	hectares de lagune et de marais au Grand Barachois	\N	\N	\N	f
9205	1022	IMAGE	species.0.image	\N	1105	© Irina Babina	\N	f
9206	1022	TEXT	events.1.date	18e siècle 	\N	\N	\N	f
9207	1022	TEXT	ecosystems.ecosystems.2.name	La forêt boréale 	\N	\N	\N	f
9614	1025	TEXT	presentation.description	Pour ne pas perturber les occupants des milieux naturels, mieux vaut se faire discret et ne pas laisser de traces de son passage.	\N	\N	\N	f
9615	1025	TEXT	action.title	Pour profiter de la nature sans déranger ses occupants 	\N	\N	\N	f
9616	1025	TEXT	understand.quote	Une tortue en ponte est très sensible au dérangement, cela peut la conduire à abandonner son nid. 	\N	\N	\N	f
9208	1014	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
9209	1014	TEXT	understand.text2	Les récifs coralliens sont formés par des colonies de coraux, formées de polypes (petits organismes invertébrés de la même famille que les méduses) sécrétant un squelette calcaire, et vivant en symbiose avec des algues unicellulaires, les zooxanthelles, qui leur apportent des nutriments grâce à la photosynthèse. Poissons, crustacés, mollusques, concombres de mer, éponges... : les récifs coralliens sont des écosystèmes extrêmement riches en biodiversité, ils représentent une zone de nourrissage, de refuge et de nurserie pour des milliers d'espèces marines. 	\N	\N	\N	f
9210	1014	TEXT	understand.text1	Cet indicateur présente l’évolution du recouvrement en corail vivant sur des stations réparties dans les différents territoires d’outre-mer. La situation est en réalité très hétérogène selon les collectivités : les récifs sont ainsi très dégradés en Martinique et Guadeloupe, mais beaucoup moins à [Wallis et Futuna](https://www.mnhn.fr) ou Mayotte. La situation est considérée comme stable pour **60 % des stations étudiées**.\n\nCet indicateur a cependant des limites, par exemple, le nombre de stations évaluées reste faible : on compte 82 stations évaluées sur plus de 600 existantes. De plus, il se base uniquement sur le caractère vivant du corail, mais pas sur les espèces de coraux présentes, ni les communautés associées (poissons, invertébrés). Des analyses plus complètes et plus fines sont nécessaires afin de bien comprendre l’évolution de l’état de santé des récifs coralliens. \n	\N	\N	\N	f
9211	1014	TEXT	territories.title	Les chiffres par territoires 	\N	\N	\N	f
9212	1014	TEXT	understand.title1	Un état de santé hétérogène selon les territoires	\N	\N	\N	f
9213	1014	TEXT	understand.title2	Le corail, constructeur du récif	\N	\N	\N	f
9214	1014	TEXT	presentation.descriptionTerritories	des récifs coralliens sont en diminution	\N	\N	\N	f
9215	1014	TEXT	understand.paragraphs.0.title	Les coraux en danger	\N	\N	\N	f
9216	1014	TEXT	understand.keyword	corail	\N	\N	\N	f
9217	1014	TEXT	ecogestures.title	Comment préserver les coraux à mon échelle ? 	\N	\N	\N	f
9218	1014	IMAGE	presentation.image	\N	1053	Récif corallien, Parc naturel marin de Mayotte © Marine Dekenen / OFB	\N	f
9219	1014	TEXT	understand.paragraphs.0.text	Les coraux sont des organismes très fragiles : lorsqu’ils sont soumis à un stress, les polypes expulsent leurs algues, ce qui provoque le blanchissement du corail et finit par entrainer sa mort si cette situation est prolongée.   \nDe nombreuses menaces pèsent sur les récifs coralliens : le changement climatique provoque l’augmentation de la température et l'acidification de l’eau, qui soumettent les coraux à un stress important. Les polluants issus des activités humaines, certaines techniques de pêche ou encore les activités touristiques ont également un lourd impact sur les récifs. Ces facteurs se conjuguent aux évènements naturels (cyclones, consommation massive par l’étoile de mer Acanthaster planci) et aggravent leurs effets. \nLes coraux sont également très sensibles aux maladies, comme la maladie de la bande blanche ou la récente maladie corallienne liée à la perte de tissus (SCTLD), identifiée pour la première fois en Floride en 2014 et observée en Guadeloupe en 2020.\n\n10% des récifs coralliens mondiaux sont situés dans les territoires d’outre-mer français, la France a donc une responsabilité importante à l’échelle mondiale sur la conservation des récifs coralliens. 	\N	\N	\N	f
9617	1025	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
9618	1025	TEXT	action.cards.0.description	Je reste à distance des animaux sauvages que je rencontre et je ne cherche pas à les toucher	\N	\N	\N	f
10397	1005	TEXT	questions.0.answer	La biodiversité, ou diversité biologique, désigne la diversité des formes de vie sur terre, c’est à dire l’ensemble du tissu vivant de la planète : plantes, animaux, champignons, bactéries, etc. Elle est le produit de la lente évolution du monde du vivant, depuis les premiers organismes connus datant de 3,5 milliards d’années.\nElle comprend 3 niveaux de définition : \n    • La diversité des écosystèmes, c’est-à-dire des milieux de vie : océans, prairies, forêts, etc. jusqu’à l’échelle d’un organisme ou d’une cellule ! \n    • La diversité des espèces qui vivent dans ces milieux, et sont en relation les unes avec les autres ;\n    • La diversité génétique, c’est-à-dire la diversité des individus au sein de ces espèces. \nDe nombreux biens et services indispensable aux activités humaines en dépendent : nourriture, pollinisation, médicaments, matières premières, fertilisation des sols, épuration de l’eau, etc. 	\N	\N	\N	f
10398	1005	TEXT	questions.0.quote	La biodiversité est encore largement méconnue : on connait seulement 1,8 million d’espèces sur une diversité estimée d’environ 100 millions d’espèces !	\N	\N	\N	f
10399	1005	TEXT	questions.1.answer	La majorité des territoires d’outre-mer français sont situés dans des régions particulièrement riches en espèces, notamment en espèces endémiques, ce qu’on appelle des points chauds de la biodiversité (« Hotspots » en anglais) (Nouvelle-Calédonie, Antilles, Mayotte, La Réunion, Wallis et Futuna, Polynésie française). Avec la Guyane, la France possède une partie du plus grand massif forestier de la planète, l’Amazonie, et les territoires français réunissent 10 % des récifs coralliens répartis dans trois océans. Certains territoires isolés comme les îles des Terres australes et antarctiques abritent une faune et une flore adaptés à des climats extrêmes. 	\N	\N	\N	f
10400	1005	TEXT	inpn.title	L'Inventaire national du patrimoine naturel	\N	\N	\N	f
10401	1005	TEXT	questions.2.question	La biodiversité menacée	\N	\N	\N	f
6464	1004	SELECT	presentation.sourceSelect	onb	\N	\N	\N	f
6465	1004	TEXT	understand.text2	Ces espèces exotiques envahissantes ont de lourds impacts sur les milieux et les espèces indigènes, en particulier dans les îles où elles sont à l'origine de nombreuses extinctions. Elles perturbent les équilibres environnementaux en entrant en compétition avec les espèces locales (pour la nourriture, les sites de reproduction ou de repos, la lumière...), par prédation, introduction de pathogènes, hybridation ou encore en modifiant les paramètres physico-chimiques des habitats.\n\nOn trouve des espèces exotiques envahissantes dans tous les groupes taxonomiques : champignons, algues, plantes vasculaires, invertébrés, reptiles, oiseaux, poissons, mammifères, etc. et dans tous les milieux : terrestres, marins ou d'eaux douces.	\N	\N	\N	f
9619	1027	IMAGE	presentation.file	\N	1224	test	\N	f
9620	1027	IMAGE	action.cards.2.icon	\N	1136	nettoyer	\N	f
9621	1027	TEXT	presentation.name	Je préserve la flore sauvage  	\N	\N	\N	f
9622	1027	IMAGE	action.cards.0.icon	\N	1138	balisage	\N	f
9623	1027	IMAGE	presentation.image	\N	1140	© Fabien Lefebvre	\N	f
9624	1027	TEXT	understand.text	De nombreuses espèces de plantes sur les territoires d’outre-mer sont endémiques et leur répartition est parfois limitée à une très petite zone. Piétinements ou cueillettes intensives peuvent menacer la survie de ces espèces végétales, déjà soumises à de plus importantes pressions : défrichements pour créer des espaces agricoles, pâtures d’animaux domestiques, feux…\n\nAttention également aux plantes exotiques envahissantes : certaines plantes peuvent repartir à partir de très petits fragments, et les petites graines de certaines espèces peuvent facilement se coincer dans les chaussures ! C’est pourquoi les gestionnaires prennent l’importantes précautions lors des opérations d’éradication\n	\N	\N	\N	f
9625	1027	IMAGE	action.cards.1.icon	\N	1137	protection	\N	f
9626	1027	TEXT	action.cards.2.description	Je nettoie mes chaussures et mon matériel de randonnée régulièrement pour ne pas disséminer d’espèces envahissantes.	\N	\N	\N	f
9627	1027	TEXT	presentation.category	Sur terre	\N	\N	\N	f
9628	1027	TEXT	action.cards.1.description	Je ne cueille pas de plantes sauvages, il peut s’agir d’espèces fragiles et protégées. Si je souhaite prélever des plantes, je me renseigne d’abord sur la règlementation et les espèces protégées.	\N	\N	\N	f
9629	1027	TEXT	presentation.description	test	\N	\N	\N	f
9630	1027	TEXT	action.title	Pour profiter des espaces naturels sans impacter la flore 	\N	\N	\N	f
9631	1027	TEXT	understand.quote	256 espèces de végétaux sont menacées en Guadeloupe	\N	\N	\N	f
9632	1027	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
9633	1027	TEXT	action.cards.0.description	Je ne sors pas des sentiers balisés, ils sont là pour me permettre de ne pas abimer les milieux.	\N	\N	\N	f
10402	1005	TEXT	onb.description	Depuis 2012, l’Observatoire national de la biodiversité, actuellement piloté par l’Office français pour la biodiversité (OFB), publie des indicateurs sur l’état de la biodiversité française, avec la contribution de nombreux partenaires. Ils sont régulièrement actualisés et enrichis.  \nLe Compteur met en lumière les indicateurs de l’ONB qui concernent les outre-mer et contribue à la création de nouveaux indicateurs pour ces territoires.	\N	\N	\N	f
10403	1005	TEXT	understand.description	La conservation de la biodiversité dépend de sa connaissance et de la compréhension des phénomènes qui l’impactent. Les indicateurs sont développés à partir de données de suivis et de mesures sur le terrain, et permettent de suivre l’évolution de l’état de santé de la biodiversité et de l’environnement. Ils sont utilisés pour définir des stratégies de gestion ou encore mesurer l'efficacité des plans de gestion d'espèces menacées.  Cependant, ils connaissent des limites par manque de données disponibles, manque de moyens de recherche ou parce que certains paramètres sont très complexes à évaluer.	\N	\N	\N	f
10404	1005	TEXT	title	Compter la biodiversité : oui, mais comment ? 	\N	\N	\N	f
10405	1005	TEXT	onb.title	L’Observatoire national de la biodiversité	\N	\N	\N	f
10406	1005	TEXT	presentation	Les indicateurs sont des outils qui permettent de suivre différents paramètres de la biodiversité et ainsi mesurer son évolution dans le temps. De nombreux paramètres sont étudiés : effectifs des populations, état de santé des écosystèmes, taux de pollutions, etc. Ils renseignent ainsi l’état de la biodiversité à un instant précis, mais également l’état des connaissances et des moyens scientifiques actuels. 	\N	\N	\N	f
9220	1014	IMAGE	understand.image	\N	1054	Les récifs coralliens sont des communautés animales vivant en symbiose avec des algues microscopiques © Julie Molinier/OFB	\N	f
9221	1014	TEXT	presentation.description	des récifs coralliens sont en diminution dans les territoires d'outre-mer	\N	\N	\N	f
9222	1014	TEXT	presentation.logoUrl	http://indicateurs-biodiversite.naturefrance.fr/fr/indicateurs/evolution-de-letat-des-recifs-coralliens	\N	\N	\N	f
10407	1005	TEXT	quote	Documenter et présenter l’évolution de la biodiversité, c’est permettre à chacun de prendre conscience des enjeux et des menaces.	\N	\N	\N	f
10408	1005	CHECKBOX	shadowed	true	\N	\N	\N	f
10409	1005	IMAGE	understand.image	\N	1017	Héron vert (Butorides virecens), Guadeloupe © Olivier Delzons	\N	f
10410	1005	TEXT	questions.0.question	Qu’est-ce que la biodiversité ?	\N	\N	\N	f
10411	1005	LINK	inpn.link	Retrouvez les indicateurs sur le site de l'INPN	\N	\N	https://inpn.mnhn.fr/	f
10412	1005	TEXT	questions.2.quote	L’être humain étant une composante de la biodiversité, son érosion est une menace pour l’avenir de l’humanité.	\N	\N	\N	f
10413	1005	TEXT	understand.title	Les indicateurs, des outils pour évaluer la biodiversité	\N	\N	\N	f
10414	1005	TEXT	questions.1.question	Les outre-mer, des points chauds de biodiversité	\N	\N	\N	f
9634	1006	IMAGE	presentation.file	\N	1225	PDF écogeste	\N	f
9635	1006	IMAGE	action.cards.2.icon	\N	1022	Plongée	\N	f
9636	1006	TEXT	presentation.name	Je protège les récifs coralliens	\N	\N	\N	f
9637	1006	IMAGE	action.cards.0.icon	\N	1020	Bateau	\N	f
9638	1006	IMAGE	presentation.image	\N	1019	Eco-plongeur dans les récifs de Nouvelle-Calédonie © Jean-Pascal Quod / Reefcheck	\N	f
9639	1006	TEXT	understand.text	Les récifs coralliens sont un écosystème très riche : ils abritent plus d’un tiers des espèces marines connues pour lesquelles ils représentent notamment une zone de nourricerie pour les juvéniles. Ils forment également une barrière naturelle contre la houle, protégeant la côte lors des tempêtes.  \n\nIls sont particulièrement fragiles, et de nombreux facteurs les menacent : les changements climatiques, qui entrainent entre autres une augmentation de la température et une acidification des océans, les pollutions, des maladies virales ou bactériennes (comme la maladie de la bande blanche) ou encore la destruction directe pour construire des infrastructures humaines. Ainsi, à Mayotte, le prolongement de la piste d'atterrissage nécessiterai la destruction d'une importante zone de récifs. \n\nPour ne pas peser encore plus sur les écosystèmes coralliens, adoptons quelques comportements simples lors de nos activités aquatiques.	\N	\N	\N	f
9640	1006	IMAGE	action.cards.1.icon	\N	1021	Crème solaire	\N	f
9641	1006	TEXT	action.cards.2.description	En plongée, je fais attention à ne pas toucher les coraux (y compris avec mes palmes) et je ne prélève pas de coraux. 	\N	\N	\N	f
9642	1006	TEXT	presentation.category	En mer	\N	\N	\N	f
9643	1006	TEXT	action.cards.1.description	Je choisis une crème solaire non-nocive pour l’environnement	\N	\N	\N	f
9644	1006	TEXT	presentation.description	Les récifs corraliens forment un écosystème extrêmement riche, mais très vulnérable.	\N	\N	\N	f
9645	1006	TEXT	action.title	Pour profiter de la mer sans impacter les récifs	\N	\N	\N	f
9646	1006	TEXT	understand.quote	La grande barrière de corail de Nouvelle-Calédonie est la deuxième plus grande au monde, après celle se trouvant sur la côte est de l'Australie.	\N	\N	\N	f
9647	1006	TEXT	understand.title	Comprendre l'écogeste	\N	\N	\N	f
9648	1006	TEXT	action.cards.0.description	En bateau, je ne jette pas l’ancre à proximité de récifs ou des herbiers, je préfère les zones sableuses. 	\N	\N	\N	f
10415	1020	TEXT	species.7.description	Une sous-espèce de la Sterne néreis, (*Sterna nereis exsul*) niche sur les îlots de Nouvelle-Calédonie, notamment autour des récifs d’Entrecasteaux. Ses faibles effectifs de populations en font une espèce très menacée.   	\N	\N	\N	f
10416	1020	TEXT	species.8.description	Le Niaouli (*Melaleuca quinquenervia*), est un arbre utilisé en médecine ainsi que pour la construction que l’on retrouve dans les milieux ouverts et anthropisés. Il se développe particulièrement bien dans les zones touchées par les incendies en raison de ses propriétés ignifuges. Indigène en Nouvelle-Calédonie, cette espèce a été introduite dans d’autres territoires comme la Guyane où elle présente un profil envahissant.  \n  \nStatut sur la Liste rouge mondiale : préoccupation mineure.  	\N	\N	\N	f
10417	1020	IMAGE	species.9.image	\N	1203	Image manquante	\N	f
10418	1020	TEXT	events.2.description	création du Parc marin de la mer de Corail	\N	\N	\N	f
10419	1020	IMAGE	species.2.image	\N	1154	*Dugong dugong* © Kris Mikael Krister /Unsplash	\N	f
10420	1020	IMAGE	identity.image	\N	1088	Île des Pins, Nouvelle-Calédonie © Sébastien Jermer/Unsplash	\N	f
10421	1020	IMAGE	ecosystems.ecosystems.4.image	\N	1206	Image manquante	\N	f
10422	1020	TEXT	species.3.description	Les Tricots rayés (*Laticauda sp.*) regroupent plusieurs espèces de serpents marins. Ils se nourrissent dans l’eau mais reviennent sur terre pour se reposer, digérer et pondre. Bien que très venimeux, ils ne sont pas agressifs et au contraire plutôt craintifs, les morsures sont donc très rares.  \n  \nStatut sur la Liste rouge mondiale de *Laticauda laticauda* : préoccupation mineure. 	\N	\N	\N	f
10423	1020	TEXT	interests.locations.0.name	Le Parc naturel de la Mer de Corail 	\N	\N	\N	f
6466	1004	TEXT	understand.text1	Une espèce exotique envahissante est une espèce introduite par l’Homme hors de son territoire d’origine et qui présente ensuite, sur son territoire d’introduction, une dispersion et un développement importants, et engendrent des impacts environnementaux mais aussi sociaux et économiques. Ces introductions sont parfois volontaires (pour l’agriculture, l’ornementation, comme animaux de compagnie, etc.) ou involontaires (via la multiplication des voyages internationaux, des « passagers clandestins » dans les marchandises échangées, dans les eaux de ballast des bateaux, etc.). \n\nDe nombreuses espèces n’arrivent pas à s’adapter ou se reproduire dans leurs territoires d’introduction, cependant certaines s’adaptent très bien et prolifèrent, profitant notamment de l’absence de leurs prédateurs ou parasites naturels. 	\N	\N	\N	f
6467	1004	TEXT	territories.title	Les chiffres par territoires 	\N	\N	\N	f
6468	1004	TEXT	understand.title1	Des espèces introduites par l'Homme	\N	\N	\N	f
6469	1004	TEXT	understand.title2	Une des principales causes d'érosion de la biodiversité	\N	\N	\N	f
6470	1004	TEXT	presentation.descriptionTerritories	espèces sur les 100 considérées comme les plus envahissantes au monde sont présentes sur le territoire	\N	\N	\N	f
6471	1004	TEXT	understand.paragraphs.0.title	Une liste mondiale des espèces les plus problématiques	\N	\N	\N	f
6472	1004	TEXT	understand.keyword	Espèces	\N	\N	\N	f
6473	1004	TEXT	ecogestures.title	Que puis-je faire pour éviter l’introduction et la dispersion d’espèces exotiques envahissantes ? 	\N	\N	\N	f
6474	1004	IMAGE	presentation.image	\N	1014	Rascasse volante (Pterois volitans) dans les fonds sous-marins de Martinique © Alain Pibot / OFB	\N	f
10424	1020	TEXT	species.1.description	Emblème de la Nouvelle-Calédonie, le Cagou ([*Rhynochetos jubatus*](https://www.endemia.nc/faune/fiche144)), est un oiseau endémique qui ne vole pas mais court très vite, et dont le cri ressemble à l’aboiement d’un chien. Il vit dans les forêts humides de moyenne et haute altitude. Cette espèce est intégralement protégée.\n\nStatut dans la Liste rouge mondiale : en danger.	\N	\N	\N	f
6475	1004	TEXT	understand.paragraphs.0.text	En 2007, l’Union international pour la conservation de la nature a publié une liste de 100 espèces exotiques considérées comme les plus envahissantes du monde, c’est-à-dire celles avec le plus fort potentiel de dispersion et le plus lourd impact sur leur environnement d’accueil. On y trouve notamment le rat noir (Rattus rattus), introduit dans de nombreuses îles et responsable, entre autres, du déclin des populations de nombreuses espèces d’oiseau dans les outre-mer, ou encore le Miconia (Miconia calvescens), un arbre introduit à Tahiti en 1937 et aujourd’hui très répandu sur l’île où il remplace la végétation indigène. Ce dernier a également été introduit en Nouvelle-Calédonie et découvert récemment en Martinique et en Guadeloupe. \nDe nombreuses interventions sont réalisées pour éradiquer ces espèces ou à défaut tenter de limiter leur propagation et leurs impacts., et de nombreuses collectivités mettent en œuvre des processus de biosécurité à l’entrée des territoires afin de limiter les risques d’entrée d’espèces exotiques. 	\N	\N	\N	f
6476	1004	IMAGE	understand.image	\N	1027	Miconia calvescens © Forest & Kim Starr / CC BY 3.0 	\N	f
6477	1004	TEXT	presentation.description	espèces sur les 100 considérées comme les plus envahissantes au monde se trouvent en outre-mer	\N	\N	\N	f
6478	1004	TEXT	presentation.logoUrl	http://indicateurs-biodiversite.naturefrance.fr/fr/indicateurs/nombre-despeces-en-outremer-parmi-les-plus-envahissantes-au-monde	\N	\N	\N	f
10227	1021	TEXT	interests.locations.1.description	Inscrits au patrimoine mondial de l’UNESCO en 2010, les trois cirques entourent le sommet de l’île, le Piton des Neiges. Chacun possède une identité particulière : Mafate, le plus sauvage, n’est desservi par aucune route. Salazie est plus exposé aux précipitations tandis que Cilaos est plus sec.	\N	\N	\N	f
10228	1021	TEXT	ecosystems.ecosystems.3.name	Les fourrés à Pandanus 	\N	\N	\N	f
10229	1021	TEXT	statistics.1.text	hectares de récifs coralliens protégés par la réserve marine	\N	\N	\N	f
10230	1021	TEXT	identity.subtitle	titre découverte	\N	\N	\N	f
10231	1021	IMAGE	species.4.image	\N	1190	Image manquante	\N	f
10232	1021	IMAGE	species.7.image	\N	1193	Image manquante	\N	f
10233	1021	TEXT	species.5.name	Les Fanjan	\N	\N	\N	f
10234	1021	TEXT	risks.risks.0.description	Située au sein de l'un des 34 hauts lieux de la biodiversité mondiale (*"hotspot"*), l'environnement de l'île de la Réunion est exceptionnel. \nLa principale menace pour la biodiversité de l'île est la pression démographique, l’augmentation de la population entrainant le développement d’infrastructures et aménagements. La quasi-totalité des forêts de basse-altitude a déjà disparu et le littoral est particulièrement menacé par l’urbanisation, la pollution et la surfréquentation. La fréquence de ponte de tortues marines sur les plages de La Réunion est très faible et ces espèces sont également menacées par la pêche accidentelle et le braconnage. Hormis dans la [Réserve naturelle marine](http://www.reservemarinereunion.fr/), il n’existe aucun dispositif de protection ou de gestion des ressources dans la zone économique exclusive.  \n\nLes espèces exotiques envahissantes sont également une menace majeure. De nombreuses espèces végétales envahissent les milieux naturels, et les monocultures de Cryptomeria du Japon (*Cryptomeria japonica*) offrent des milieux favorables à l’envahissement par d’autres plantes exotiques. La lutte contre les rats et les chats harets est également un enjeu majeur de la conservation des oiseaux endémiques. Une [stratégie de lutte contre les espèces invasives](https://www.especesinvasives.re/strategie-de-lutte/la-strategie-reunionnaise/) est mise en place depuis 2010. Depuis le 1<sup>e</sup> avril 2019, un arrêté ministériel interdit tout usage d’une [liste de 150 plantes exotiques](http://www.reunion.developpement-durable.gouv.fr/IMG/pdf/0_defi_eee-outre-mer-la_reunion-web-br.pdf).  \n\nLa création du Parc national en 2007 et l'inscription au Patrimoine mondial de l'UNESCO en 2010 ont permis de renforcer la protection du patrimoine naturel de La Réunion. La mise en place d'une [Stratégie réunionnaise pour la biodiversité](http://www.reunion.developpement-durable.gouv.fr/IMG/pdf/SRB-2013-2020_cle093a71.pdf) depuis 2013 doit permettre d'intégrer la protection de la biodiversité dans les politiques publiques du territoire. De nombreux programmes de conservations ont été mis en place pour protéger les espèces patrimoniales (Plans nationaux d'actions, programmes LIFE+, etc.). \n	\N	\N	\N	f
10425	1020	TEXT	species.2.description	Le Dugong (*Dugong dugong*), aussi appelé « vache marine » est un mammifère marin herbivore qui passe la majeure partie de son temps à brouter les herbiers marins. Longtemps chassé et braconné, il est également vulnérable face à la dégradation des habitats marins et aux activités humaines. La population néo-calédonienne de dugongs est estimée à environ 700 individus.  \n  \nStatut sur la Liste rouge mondiale : vulnérable. 	\N	\N	\N	f
10426	1020	TEXT	species.9.description	Le Syzygium acre est un arbre principalement observé dans le sud de la Grande Terre. Ses feuilles de très grande taille – parfois plus d’un mètre de long – sont rouge à mauve lorsqu’elles sont juvéniles. Sa floraison est caractéristique : les fleurs, d’une coloration rouge à rose, se trouvent par petits groupes le long du tronc.  \n  \nStatut sur la Liste rouge mondiale : en danger. 	\N	\N	\N	f
10427	1020	TEXT	events.0.description	dislocation du supercontinent Gondwana et séparation de la Nouvelle-Calédonie avec l’Australie et la Nouvelle-Zélande	\N	\N	\N	f
10235	1021	TEXT	events.3.date	2007	\N	\N	\N	f
10236	1021	TEXT	ecosystems.ecosystems.2.description	Malgré leur faible étendue (12 km<sup>2</sup>, entre le Cap La Houssaye et Grand Bois), les récifs coralliens de La Réunion sont très riches et diversifiés. On y compte au moins 226 espèces de coraux, ainsi que plusieurs centaines d’espèces d’échinodermes, mollusques, crustacés et poissons, dont de nombreuses espèces endémiques. La plus grande partie de ces récifs sont protégés sous le statut de la [Réserve naturelle marine](http://www.reservemarinereunion.fr/).	\N	\N	\N	f
10237	1021	IMAGE	ecosystems.ecosystems.3.image	\N	1196	Image manquante	\N	f
10238	1021	IMAGE	species.3.image	\N	1161	*Mormopterus francoismoutoui* © Philippe Gourdain	\N	f
10239	1021	TEXT	species.1.name	Le Tuit-tuit	\N	\N	\N	f
10240	1021	TEXT	species.7.name	Le Tamarin des Hauts	\N	\N	\N	f
10241	1021	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
10242	1021	TEXT	ecosystems.ecosystems.1.description	Située sur la côte ouest de l’île, la forêt sèche a perdu 99% de sa superficie de puis l’arrivée des humains\nsur l’île et ce milieu est considérée comme « en danger critique d’extinction ». Un projet LIFE+ lancé en\n\n2015 a permis de replanter de nombreux arbres indigènes pour tenter de le conserver.	\N	\N	\N	f
10243	1021	TEXT	interests.locations.5.description	Créée en 2007, cette aire marine protégée couvre 3 500 hectares sur un linéaire de 40 km sur la côte ouest de l’île. Les activités nautiques, dont la pêche, y sont règlementées et dans les zones dites « sanctuaires », toute présence humaine est interdite quel qu’en soit le motif. 	\N	\N	\N	f
10244	1021	TEXT	ecosystems.ecosystems.0.description	Il existe plusieurs types de forêts et de cortèges floristiques répartis en fonction de l’altitude et de la\npluviométrie. Elles se situent particulièrement dans l’est et le sud de l’île, moins urbanisés. On y trouve une\ngrande diversité végétale : mousses, fougères, orchidées, arbres et arbustes, etc.	\N	\N	\N	f
10245	1021	TEXT	identity.highestPoint	3 071	\N	\N	\N	f
10246	1021	TEXT	interests.locations.4.description	Réserve naturelle nationale, cette zone humide de 447 hectares est également inscrite à la convention internationale Ramsar. Le site présente une valeur faunistique forte, avec de nombreuses espèces de faune patrimoniales (oiseaux, poissons, macro-crustacés, insectes) malgré la présence d’espèces introduites.	\N	\N	\N	f
10247	1021	TEXT	risks.risks.0.name	Une pression démographique importante	\N	\N	\N	f
10248	1021	IMAGE	interests.locations.1.image	\N	1156	Vue sur le cirque de Mafate © Céline Soyer	\N	f
10249	1021	IMAGE	ecosystems.ecosystems.1.image	\N	1100	© Philippe Gourdain	\N	f
10250	1021	TEXT	interests.locations.3.description	Le tiers sud-est de l’île est occupé par le Piton de la Fournaise, l’un des volcans les plus actifs du monde. De type effusif, ses coulées de laves refroidies sont progressivement recolonisées par la végétation, lichens et fougères en premier.	\N	\N	\N	f
10251	1021	TEXT	identity.title	La Réunion,  \npoint chaud de l’océan Indien	\N	\N	\N	f
10252	1021	TEXT	species.4.name	Le Pétrel de Barau	\N	\N	\N	f
10253	1021	TEXT	identity.area	2 512	\N	\N	\N	f
10254	1021	TEXT	species.0.description	Le Gecko vert de Manapany (*Phelsuma inexpectata*), est endémique d’une bande de 11 km de long dans le sud de l’île. Ce gecko diurne arboricole s’observe notamment sur les vacoas (*Pandanus utilis*). Considéré comme « en danger critique d’extinction », il est protégé et fait l’objet d’un Plan national d’action.  \n  \nStatut sur la Liste rouge des reptiles de la Réunion : en danger critique. 	\N	\N	\N	f
10255	1021	IMAGE	interests.locations.5.image	\N	1189	Image manquante	\N	f
10256	1021	IMAGE	species.6.image	\N	1192	Image manquante	\N	f
10257	1021	TEXT	identity.highestPointName	Piton des Neiges	\N	\N	\N	f
10258	1021	TEXT	interests.locations.1.name	Les cirques de Mafate, Cilaos et Salazie	\N	\N	\N	f
10259	1021	TEXT	statistics.2.text	de plantes vasculaires indigènes	\N	\N	\N	f
10260	1021	IMAGE	species.0.image	\N	1097	*Phelsuma inexpectata* © Philippe Gourdain	\N	f
10261	1021	TEXT	events.1.date	22 000 ans	\N	\N	\N	f
10262	1021	TEXT	ecosystems.ecosystems.2.name	Les récifs coralliens	\N	\N	\N	f
10263	1021	TEXT	interests.locations.4.name	L’étang de Saint-Paul 	\N	\N	\N	f
10428	1020	TEXT	events.1.description	arrivée des premiers humains	\N	\N	\N	f
10429	1020	IMAGE	ecosystems.image	\N	1094	test	\N	f
10430	1020	TEXT	identity.species	26 984	\N	\N	\N	f
10431	1020	IMAGE	ecosystems.ecosystems.0.image	\N	1092	Forêt tropicale humide sur l’île de Lifou, Nouvelle-Calédonie © Benjamin Guichard / OFB	\N	f
10432	1020	TEXT	statistics.0.number	76%	\N	\N	\N	f
10433	1020	TEXT	species.2.name	Le Dugong	\N	\N	\N	f
10434	1020	TEXT	risks.risks.1.name	Des manques dans la règlementation	\N	\N	\N	f
10435	1020	TEXT	species.8.name	Le Niaouli	\N	\N	\N	f
10436	1020	TEXT	species.4.description	*Amborella trichopoda* surnommée la « mère de toutes les fleurs » est considérée comme la plus ancienne des plantes à fleur. Elle présente le même aspect qu’à son origine, évaluée à 135 millions d’années avant notre ère. Elle est endémique de Nouvelle-Calédonie.  \n  \nStatut sur la Liste rouge mondiale : Préoccupation mineure. 	\N	\N	\N	f
10268	1006	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
10269	1023	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
10270	1024	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
10271	1025	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
10272	1026	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
10273	1027	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
10274	1028	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
10275	1029	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
10276	1017	CHECKBOX	shadowed	false	\N	\N	\N	f
10278	1019	CHECKBOX	header.shadowed	false	\N	\N	\N	f
10279	1001	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
10280	1015	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
10281	1021	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
10282	1022	CHECKBOX	identity.shadowed	false	\N	\N	\N	f
10284	1004	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
10285	1008	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
10286	1009	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
10287	1010	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
10288	1011	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
10289	1012	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
10290	1013	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
10291	1014	CHECKBOX	presentation.shadowed	false	\N	\N	\N	f
10437	1020	TEXT	ecosystems.ecosystems.0.name	La forêt dense humide	\N	\N	\N	f
10438	1020	TEXT	species.5.description	Les Kaoris, sont des arbres de grande taille, dont le tronc peut atteindre un diamètre impressionnant. La répartition du Kaori du mont Panié (*Agathis montana*) est restreinte à la forêt de nuage du massif du même nom tandis que le Kaori de forêt (*Agathis lanceolata*) se trouve au sud de Grande Terre. Ce dernier, dont peut observer un spécimen au tronc de 2,70 m de diamètre dans le parc de la Rivière Bleu, a beaucoup souffert de l’exploitation de son bois.  \n  \nStatut sur la Liste rouge mondiale pour *Agathis montana* : en danger critique ; pour *Agathis lanceolata* : préoccupation mineure	\N	\N	\N	f
10439	1020	TEXT	species.6.description	Le Gecko géant de Nouvelle-Calédonie (*Rhacodactylus leachianus*) est le plus grand gecko au monde. D’un aspect massif, avec une queue courte et une peau plissée grise à brune, il peut atteindre 35 cm. Nocturne et arboricole, on le trouve dans les forêts humides.  \n  \nStatut sur la Liste rouge mondiale : préoccupation mineure. 	\N	\N	\N	f
10440	1020	CHECKBOX	identity.shadowed	true	\N	\N	\N	f
10441	1020	TEXT	interests.locations.2.name	La région des lacs du Grand Sud	\N	\N	\N	f
10442	1020	TEXT	ecosystems.ecosystems.3.description	Aussi dit « sclérophylle », ce type de forêt n’est plus présent que sur environ 45 km2, soit 1% de sa surface estimée d’origine. Localisé sur le littoral de la côte ouest, cet habitat très vulnérable, notamment aux incendies et aux espèces exotiques envahissantes, concentre plusieurs dizaines d’espèces strictement endémiques. Un programme de conservation a été mis en place par le Conservatoire des espaces naturels pour tenter d’en préserver les derniers reliquats.	\N	\N	\N	f
10443	1020	TEXT	ecosystems.ecosystems.4.description	Forêt de bord de mer aux pieds dans l’eau, la mangrove couvre environ 80% du littoral de la côte ouest de la Grande Terre et totalise 350 km2 sur l’ensemble de la Nouvelle-Calédonie. Protection contre l’érosion, les tempêtes, la sédimentation dans le lagon, zone de nurserie pour de nombreux organismes, épuration de l’eau… les services rendus par cet écosystème sont nombreux et précieux.	\N	\N	\N	f
10444	1020	TEXT	ecosystems.ecosystems.4.name	La mangrove	\N	\N	\N	f
10445	1020	TEXT	events.0.date	65 millions d’années	\N	\N	\N	f
10446	1020	TEXT	identity.populationYear	2017	\N	\N	\N	f
10447	1020	IMAGE	species.5.image	\N	1199	Image manquante	\N	f
10448	1020	TEXT	statistics.0.text	de la flore est endémique	\N	\N	\N	f
10449	1020	IMAGE	species.1.image	\N	1153	*Rhynochetos jubatus* © Pierre Fidenci / CC BY-SA 3.0	\N	f
10450	1020	TEXT	ecosystems.ecosystems.1.name	Les récifs coralliens et les lagons	\N	\N	\N	f
10451	1020	TEXT	events.2.date	2014	\N	\N	\N	f
10452	1020	TEXT	identity.marineArea	1,4 million	\N	\N	\N	f
10453	1020	TEXT	species.9.name	Le Syzygium acre 	\N	\N	\N	f
10454	1020	TEXT	identity.presentation	« Le Caillou » et les îles calédoniennes sont l’un des territoires les plus riches du monde en biodiversité, avec un très fort taux d’endémisme, en particulier chez les plantes. Forêts sèches, forêts humides, savane, mangrove recouvrent le milieu terrestre tandis que les eaux calédoniennes abritent l’une des plus grandes structures récifales du globe, dont la beauté et la richesse sont inscrites au patrimoine mondial de l'Unesco depuis 2008. 	\N	\N	\N	f
10455	1020	IMAGE	interests.locations.0.image	\N	1089	Vue du Parc naturel de la Mer de Corail © Anne Littaye/ OFB	\N	f
10456	1020	TEXT	species.6.name	Le Gecko géant	\N	\N	\N	f
10457	1020	TEXT	identity.population	271 407	\N	\N	\N	f
10458	1020	IMAGE	interests.locations.3.image	\N	1197	Image manquante	\N	f
10459	1020	TEXT	species.3.name	Les Tricots rayés	\N	\N	\N	f
10460	1020	TEXT	risks.title	Enjeux et menaces	\N	\N	\N	f
10461	1020	IMAGE	species.8.image	\N	1202	Image manquante	\N	f
10462	1020	TEXT	species.0.name	Cyathea intermedia	\N	\N	\N	f
10463	1020	IMAGE	interests.locations.2.image	\N	1152	Vue sur les chutes de la Madeleine, Nouvelle-Calédonie © uphillblok / CC BY-SA 2.0	\N	f
10464	1020	IMAGE	ecosystems.ecosystems.2.image	\N	1204	Image manquante	\N	f
10465	1020	TEXT	interests.locations.3.name	La réserve de nature sauvage du Mont Panié	\N	\N	\N	f
10466	1020	TEXT	interests.locations.0.description	Créé en 2014, dans le but de « *de protéger la biodiversité exceptionnelle de l’espace maritime de Nouvelle-Calédonie, tout en permettant un développement économique responsable et durable* », le [Parc naturel de la mer de Corail](https://mer-de-corail.gouv.nc/) couvre 1,3 millions de km<sup>2</sup>, soit l’ensemble de la zone économique exclusive de la Nouvelle-Calédonie. Elle intègre les récifs d’Entrecasteaux, remarquables par les importantes populations de tortues vertes et d’oiseaux marins qui s’y reproduisent en grand nombre.	\N	\N	\N	f
10467	1020	TEXT	risks.risks.1.description	Dans le parc naturel de la mer de Corail, la règlementation n’est pas considérée à la hauteur des enjeux pour de nombreux acteurs. La pêche industrielle reste ouverte dans une grande partie des eaux, notamment la pêche à la longue ligne qui serait responsable de la mort de nombreuses captures accessoires (requins, cétacés, tortues, oiseaux). La fréquentation touristique des îlots est également remise en cause du fait des dérangement des oiseaux marins pendant leurs périodes de reproduction, ainsi que des pontes de tortues marines.\n\nMalgré des Codes de l’environnement des Provinces encadrant la chasse et la collecte d’espèces locales, le braconnage reste une pratique courante, l’endémisme attirant des collectionneurs du monde entier.	\N	\N	\N	f
10468	1020	TEXT	interests.locations.2.description	Cette région de 43 970 ha, [inscrite sur la Convention de Ramsar](https://www.province-sud.nc/information/lacs-grand-sud-inscrits-convention-ramsar) depuis 2014, se compose de forêts humides, de maquis miniers, de marais arbustifs et de rivières, ruisseaux et lacs intermittents et permanents, notamment le lac de Yaté. Elle abrite des espèces qui ne vivent nulle part ailleurs. Considérée comme le plus grand réservoir d’eau douce de Nouvelle-Calédonie, cette région repose sur un réseau d’eau souterrain original et complexe, unique au monde.	\N	\N	\N	f
10469	1020	TEXT	interests.locations.1.description	Depuis juillet 2008, les lagons de Nouvelle-Calédonie sont inscrits sur la [Liste du patrimoine mondial de l’UNESCO](https://whc.unesco.org/fr/list/1115/) en raison de leur diversité exceptionnelle et de leur bon état de conservation. Ce bien "en série", c'est à dire c'est à dire composé de six zones géographiques distinctes est le premier site ultra-marins à être reconnu comme tel. 	\N	\N	\N	f
10470	1020	TEXT	ecosystems.ecosystems.3.name	La forêt sèche	\N	\N	\N	f
10471	1020	TEXT	identity.subtitle	Des lagons classés au patrimoine mondial de l'Unesco	\N	\N	\N	f
10472	1020	IMAGE	species.4.image	\N	1198	Image manquante	\N	f
10473	1020	IMAGE	species.7.image	\N	1201	Image manquante	\N	f
10474	1020	TEXT	species.5.name	Les Kaoris	\N	\N	\N	f
10475	1020	TEXT	risks.risks.0.description	Séparée depuis longtemps des autres territoires, la flore et la faune de Nouvelle-Calédonie se sont développées de façon remarquable, présentant des taux d'endémisme très élevés. Cette richesse est cependant menacée par l’exploitation du nickel présent dans le sol calédonien. Les projets miniers sur Grande Terre sont à l’origine d’impacts importants sur la faune et la flore terrestre, ainsi que dans les milieux marins, impactés notamment par la sur-sédimentation qui en découle. Les pratiques minières ont aujourd’hui largement évolué mais restent dégradantes. La réhabilitation des zones exploitées est également un enjeu important.\n\nLes incendies constituent également une forte menace. Les épisodes sont fréquents et les moyens de lutte limités, bien que des campagnes de sensibilisation soient menées. On estime que plus de 400 000 hectares de végétation ont brulé entre 2000 et 2015. Outre la destruction de la flore, les incendies favorisent la colonisation d’espèces exotiques envahissantes, dégradent la ressource en eau et menacent également les populations humaines.\n	\N	\N	\N	f
10476	1020	TEXT	ecosystems.ecosystems.2.description	Ces habitats ont une végétation très particulière du fait de la richesse du sol en minerais (fer, magnésium, nickel) et pauvre en éléments nutritifs. On en distingue plusieurs types en fonction de leur altitude. Cette richesse floristique exceptionnelle (1 170 espèces à 88% endémiques) peut être menacée par le développement de projets miniers. La faune, adaptée aux conditions de vie difficile de ce milieu sec et rocailleux, compte principalement des insectes et des reptiles.	\N	\N	\N	f
10477	1020	IMAGE	ecosystems.ecosystems.3.image	\N	1205	Image manquante	\N	f
10478	1020	IMAGE	species.3.image	\N	1155	*Laticauda sp.* © Christian Gloor / CC BY 2.0	\N	f
10479	1020	TEXT	species.1.name	Le Cagou	\N	\N	\N	f
10480	1020	TEXT	species.7.name	La Sterne néreis	\N	\N	\N	f
10481	1020	TEXT	interests.title	Lieux emblématiques	\N	\N	\N	f
10482	1020	TEXT	ecosystems.ecosystems.1.description	Les récifs et lagons calédoniens sont parmi les plus étendus et les plus riches du monde. La diversité observée, aussi bien en termes d’espèces que de structures récifales, y est exceptionnelle. Six zones de lagons ont ainsi été classé au patrimoine mondial de l’UNESCO en raison de leur valeur remarquable. 	\N	\N	\N	f
10483	1020	TEXT	ecosystems.ecosystems.0.description	Cette forêt dire « sempervirente » couvre un peu plus de 20% du territoire, avec des massifs de plusieurs milliers d’hectares d’un seul tenant. Elle concentre plus de 2000 espèces végétales donc 80% endémiques, et offre un habitat à une faune diversifiée : oiseaux, reptiles, chauve-souris, insectes… Elle est cependant victime de fortes dégradations (incendies, exploitation minière, espèces exotiques envahissantes…). 	\N	\N	\N	f
10484	1020	TEXT	identity.highestPoint	1 628	\N	\N	\N	f
10485	1020	TEXT	risks.risks.0.name	Une richesse soumise à des fortes pressions 	\N	\N	\N	f
10486	1020	IMAGE	interests.locations.1.image	\N	1090	Poisson-coffre dans les récifs d’Entrecasteaux © DR	\N	f
10487	1020	IMAGE	ecosystems.ecosystems.1.image	\N	1093	La piscine naturelle de la baie d’Oro © Jeremy Zero/Unsplash	\N	f
10488	1020	TEXT	interests.locations.3.description	Autour du point culminant de la Nouvelle-Calédonie, cette réserve de 5 000 hectares a été créée en 1950. Plusieurs profils de forêts y abritent une faune et une flore remarquable.	\N	\N	\N	f
10489	1020	TEXT	identity.title	Nouvelle-Calédonie,  \nun endémisme remarquable	\N	\N	\N	f
10490	1020	TEXT	species.4.name	*Amborella trichopoda*	\N	\N	\N	f
10491	1020	TEXT	identity.area	16 624	\N	\N	\N	f
10492	1020	TEXT	species.0.description	[*Sphaeropteris intermedia*](https://www.endemia.nc/flore/fiche106) est une espèce de fougère arborescente endémique parmi les plus grandes au monde, qui peut atteindre 35 mètres de haut. Commune sur le territoire, cette plante est utilisée en médecine traditionnelle et son tronc très solide est également utilisé pour la sculpture ou la confection de sagaies.\n\nStatut dans la Liste rouge mondiale : Préoccupation mineure. 	\N	\N	\N	f
10493	1020	IMAGE	species.6.image	\N	1200	Image manquante	\N	f
10494	1020	TEXT	identity.highestPointName	Mont Panié	\N	\N	\N	f
10495	1020	TEXT	interests.locations.1.name	Les lagons, inscrits au Patrimoine mondial de l'UNESCO 	\N	\N	\N	f
10496	1020	IMAGE	species.0.image	\N	1091	*Cyathea intermedia* © Benjamin Guichard / OFB	\N	f
10497	1020	TEXT	events.1.date	3 500 ans	\N	\N	\N	f
10498	1020	TEXT	ecosystems.ecosystems.2.name	Les maquis miniers	\N	\N	\N	f
9491	1030	TEXT	paragraphs.1.text	**Informations contenues dans le site**\n\nLe portail Compteur de biodiversité outre-mer est un site informatif. \nIl a pour objectif de présenter la biodiversité des territoires ultra-marins français et des actions et initiatives menées pour la protection de ces écosystèmes.\nAucune information contenue sur le site ne saurait posséder ou être interprétée comme ayant une quelconque valeur contractuelle. Les textes à caractère scientifique publiés dans le site sont valables à la date de leur publication et ne sauraient engager leurs auteurs dans le futur.\nToute information contenue sur le site peut être modifiée, à tout moment sans préavis, par le Muséum national d’histoire naturelle. Les informations contenues sur le site ne constituent pas une offre de services ou de produits ni une sollicitation commerciale de quelque nature que ce soit, ni une recommandation ou un conseil. Le Muséum national d’histoire naturelle ne sera pas tenu responsable pour toute décision prise ou non sur la base d’une information contenue sur le site, ni pour l’utilisation qui pourrait en être faite par un tiers. Ces informations ne sauraient engager la responsabilité du Muséum national d’histoire naturelle.\n\n**Propriété intellectuelle**\nL’ensemble du site « Compteur de biodiversité outre-mer » relève de la législation française et internationale sur le droit d’auteur et la propriété intellectuelle.\nTous les éléments présentés sur ce site (textes, photographies, vidéos, créations graphiques, illustrations) sont soumis à la législation relative au droit des informations publiques et sont couverts par le droit d'auteur. Ces éléments restent la propriété exclusive du Muséum national d’Histoire naturelle et/ou de ses auteurs.\nLa reproduction de tout ou partie de ce site sur un support électronique quel qu’il soit est formellement interdite sauf autorisation expresse du directeur de la publication. La reproduction de ce site sur un support papier est autorisée pour des fins personnelles, associatives ou professionnelles et sous réserve du respect des trois conditions suivantes :\n• gratuité de la diffusion ;\n• respect de l’intégrité des documents reproduits : pas de modification ni altération d’aucune sorte ;\n• citation claire et lisible de la source indiquant le nom "Muséum national d’Histoire naturelle", l’adresse internet du site web du MNHN : www.mnhn.fr et la mention : "© sur www.mnhn.fr - Reproduction interdite – Tous droits réservés".\nToutes diffusions ou utilisations à des fins commerciales ou publicitaires des informations sont strictement interdites. Pour d’autres utilisations envisagées, veuillez nous consulter.\n\n**Crédits photographiques**\nToutes les photographies présentes sur le site sont créditées de leurs auteurs et de la licence associée à leur utilisation si elle est mentionnée.\nLes contenus sous licence Creative Commons ont une mention spécifique avec le type de licence qui permet à l’utilisateur d’aller consulter les conditions d’utilisation de l’image concernée. \nExemple :\n(CC BY-NC-SA 3.0)	\N	\N	\N	f
9492	1030	TEXT	paragraphs.2.text	**Outils de mesure d’audience**\nLe site utilise l’outil d’analyse Matomo. Les traceurs de mesures d’audience issus de Matomo ne nécessitent pas de recueil préalable du consentement de l’utilisateur du fait qu’ils servent uniquement à produire des données statistiques anonymes.\nPour en savoir plus :\nhttps://fr.matomo.org/privacy/\n\n**Politique de confidentialité et RGPD**\nLe Muséum national d’Histoire naturelle porte la plus grande attention à vos données à caractère personnel et s’engage à les protéger.\nIl s'engage à ce que la collecte et le traitement de données à caractère personnel, effectués à partir du présent site, soient conformes à la loi n°78-17 du 6 janvier 1978 modifiée relative à l'informatique, aux fichiers et aux libertés ainsi qu’au Règlement (UE) 2016/679 du Parlement européen et du Conseil du 27 avril 2016 applicable le 25 mai 2018. \n\n**Données personnelles**\nSauf stipulation contraire directement mentionnée, aucune donnée personnelle n’est collectée ni traitée sur le portail « Compteur de biodiversité outre-mer ».	\N	\N	\N	f
9493	1030	TEXT	paragraphs.1.title	Conditions générales d’utilisation	\N	\N	\N	f
9494	1030	TEXT	title	Mentions légales	\N	\N	\N	f
9495	1030	TEXT	paragraphs.2.title	Mentions relatives à l’utilisation de cookies	\N	\N	\N	f
9496	1030	TEXT	paragraphs.0.text	**Editeur**\nMuséum national d'Histoire naturelle\nUMS Patrimoine Naturel \nCP41, 36 rue Geoffroy saint-Hilaire\n75005 Paris\n\n**Conception et hébergement**\nAgence Ninja Squad\nwww.ninja-squad.fr\n\nJean-Baptiste Giffard\nwww.digitaldesigner.cool\n\nSite hébergé par le Muséum national d’Histoire naturelle\n\n**Création graphique**\nDesign graphique réalisé par :\nAmélie Bracq\n\nEdouard Sastre\n\n**Création et mise à jour du contenu**\n\nLe contenu éditorial du site est produit et mis à jour par l’Unité Mixte de Service Patrimoine Naturel (UMS PatriNat) du MNHN.\n	\N	\N	\N	f
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

SELECT pg_catalog.setval('public.image_seq', 1225, true);


--
-- Name: indicator_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.indicator_seq', 1007, true);


--
-- Name: indicator_value_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.indicator_value_seq', 1054, true);


--
-- Name: page_element_seq; Type: SEQUENCE SET; Schema: public; Owner: biom
--

SELECT pg_catalog.setval('public.page_element_seq', 10498, true);


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

