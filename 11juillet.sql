--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.11
-- Dumped by pg_dump version 9.5.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE "SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE "SequelizeMeta" OWNER TO valentin;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO valentin;

--
-- Name: computer_disks; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE computer_disks (
    id bigint NOT NULL,
    disk_type integer DEFAULT 1,
    size integer,
    interface character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE computer_disks OWNER TO valentin;

--
-- Name: computer_disks_id_seq; Type: SEQUENCE; Schema: public; Owner: valentin
--

CREATE SEQUENCE computer_disks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE computer_disks_id_seq OWNER TO valentin;

--
-- Name: computer_disks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valentin
--

ALTER SEQUENCE computer_disks_id_seq OWNED BY computer_disks.id;


--
-- Name: computers; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE computers (
    id integer NOT NULL,
    os_id integer DEFAULT 1,
    cpu_id integer DEFAULT 1,
    gpu_id integer DEFAULT 1,
    activity_id integer DEFAULT 1,
    chipset_id integer DEFAULT 1,
    picture character varying(512),
    designation character varying(256),
    model character varying(256) NOT NULL,
    connector_available character varying(2048),
    weight character varying(16),
    length character varying(16),
    width character varying(16),
    height character varying(16),
    memory_type character varying(128),
    memory_size character varying(128),
    memory_max_size character varying(128),
    keyboard_type character varying(128),
    keyboard_numpad boolean,
    keyboard_light boolean,
    screen_type character varying(256),
    screen_resolution character varying(256),
    screen_refresh_rate integer,
    screen_size double precision,
    screen_format character varying(16),
    network character varying(128),
    webcam boolean,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    brand_id integer
);


ALTER TABLE computers OWNER TO valentin;

--
-- Name: computers_activities; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE computers_activities (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(512)
);


ALTER TABLE computers_activities OWNER TO valentin;

--
-- Name: computers_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: valentin
--

CREATE SEQUENCE computers_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE computers_activities_id_seq OWNER TO valentin;

--
-- Name: computers_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valentin
--

ALTER SEQUENCE computers_activities_id_seq OWNED BY computers_activities.id;


--
-- Name: computers_brands; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE computers_brands (
    id integer NOT NULL,
    name character varying,
    description character varying
);


ALTER TABLE computers_brands OWNER TO valentin;

--
-- Name: computers_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: valentin
--

CREATE SEQUENCE computers_brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE computers_brands_id_seq OWNER TO valentin;

--
-- Name: computers_brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valentin
--

ALTER SEQUENCE computers_brands_id_seq OWNED BY computers_brands.id;


--
-- Name: computers_chipsets; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE computers_chipsets (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(512)
);


ALTER TABLE computers_chipsets OWNER TO valentin;

--
-- Name: computers_chipsets_id_seq; Type: SEQUENCE; Schema: public; Owner: valentin
--

CREATE SEQUENCE computers_chipsets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE computers_chipsets_id_seq OWNER TO valentin;

--
-- Name: computers_chipsets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valentin
--

ALTER SEQUENCE computers_chipsets_id_seq OWNED BY computers_chipsets.id;


--
-- Name: computers_cpus; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE computers_cpus (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    score double precision DEFAULT 0.0,
    description character varying(512)
);


ALTER TABLE computers_cpus OWNER TO valentin;

--
-- Name: computers_cpus_id_seq; Type: SEQUENCE; Schema: public; Owner: valentin
--

CREATE SEQUENCE computers_cpus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE computers_cpus_id_seq OWNER TO valentin;

--
-- Name: computers_cpus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valentin
--

ALTER SEQUENCE computers_cpus_id_seq OWNED BY computers_cpus.id;


--
-- Name: computers_disks; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE computers_disks (
    id integer NOT NULL,
    computer_id integer NOT NULL,
    size integer,
    interface character varying(1024),
    type integer
);


ALTER TABLE computers_disks OWNER TO valentin;

--
-- Name: computers_disks_id_seq; Type: SEQUENCE; Schema: public; Owner: valentin
--

CREATE SEQUENCE computers_disks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE computers_disks_id_seq OWNER TO valentin;

--
-- Name: computers_disks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valentin
--

ALTER SEQUENCE computers_disks_id_seq OWNED BY computers_disks.id;


--
-- Name: computers_gpus; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE computers_gpus (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    score double precision DEFAULT 0.0,
    description character varying(1024),
    memory_type character varying,
    max_memory integer
);


ALTER TABLE computers_gpus OWNER TO valentin;

--
-- Name: computers_gpus_id_seq; Type: SEQUENCE; Schema: public; Owner: valentin
--

CREATE SEQUENCE computers_gpus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE computers_gpus_id_seq OWNER TO valentin;

--
-- Name: computers_gpus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valentin
--

ALTER SEQUENCE computers_gpus_id_seq OWNED BY computers_gpus.id;


--
-- Name: computers_id_seq; Type: SEQUENCE; Schema: public; Owner: valentin
--

CREATE SEQUENCE computers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE computers_id_seq OWNER TO valentin;

--
-- Name: computers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valentin
--

ALTER SEQUENCE computers_id_seq OWNED BY computers.id;


--
-- Name: computers_os; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE computers_os (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(128)
);


ALTER TABLE computers_os OWNER TO valentin;

--
-- Name: computers_os_id_seq; Type: SEQUENCE; Schema: public; Owner: valentin
--

CREATE SEQUENCE computers_os_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE computers_os_id_seq OWNER TO valentin;

--
-- Name: computers_os_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valentin
--

ALTER SEQUENCE computers_os_id_seq OWNED BY computers_os.id;


--
-- Name: computers_prices; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE computers_prices (
    id integer NOT NULL,
    computer_id integer NOT NULL,
    trader_id integer NOT NULL,
    url character varying(512),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    pricing hstore,
    last_price integer
);


ALTER TABLE computers_prices OWNER TO valentin;

--
-- Name: computers_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: valentin
--

CREATE SEQUENCE computers_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE computers_prices_id_seq OWNER TO valentin;

--
-- Name: computers_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valentin
--

ALTER SEQUENCE computers_prices_id_seq OWNED BY computers_prices.id;


--
-- Name: computers_quests; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE computers_quests (
    id integer NOT NULL,
    activity_id integer NOT NULL,
    rank integer NOT NULL,
    quest character varying(512) NOT NULL,
    domain character varying(16),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE computers_quests OWNER TO valentin;

--
-- Name: computers_quests_id_seq; Type: SEQUENCE; Schema: public; Owner: valentin
--

CREATE SEQUENCE computers_quests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE computers_quests_id_seq OWNER TO valentin;

--
-- Name: computers_quests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valentin
--

ALTER SEQUENCE computers_quests_id_seq OWNED BY computers_quests.id;


--
-- Name: computers_quests_resps; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE computers_quests_resps (
    id integer NOT NULL,
    quest_id integer NOT NULL,
    resp character varying(32) NOT NULL,
    indice character varying(32) NOT NULL
);


ALTER TABLE computers_quests_resps OWNER TO valentin;

--
-- Name: computers_quests_resps_id_seq; Type: SEQUENCE; Schema: public; Owner: valentin
--

CREATE SEQUENCE computers_quests_resps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE computers_quests_resps_id_seq OWNER TO valentin;

--
-- Name: computers_quests_resps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valentin
--

ALTER SEQUENCE computers_quests_resps_id_seq OWNED BY computers_quests_resps.id;


--
-- Name: computers_traders; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE computers_traders (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(512)
);


ALTER TABLE computers_traders OWNER TO valentin;

--
-- Name: computers_traders_id_seq; Type: SEQUENCE; Schema: public; Owner: valentin
--

CREATE SEQUENCE computers_traders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE computers_traders_id_seq OWNER TO valentin;

--
-- Name: computers_traders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valentin
--

ALTER SEQUENCE computers_traders_id_seq OWNED BY computers_traders.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO valentin;

--
-- Name: users_auth; Type: TABLE; Schema: public; Owner: valentin
--

CREATE TABLE users_auth (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    description character varying(128)
);


ALTER TABLE users_auth OWNER TO valentin;

--
-- Name: users_auth_id_seq; Type: SEQUENCE; Schema: public; Owner: valentin
--

CREATE SEQUENCE users_auth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_auth_id_seq OWNER TO valentin;

--
-- Name: users_auth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valentin
--

ALTER SEQUENCE users_auth_id_seq OWNED BY users_auth.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computer_disks ALTER COLUMN id SET DEFAULT nextval('computer_disks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers ALTER COLUMN id SET DEFAULT nextval('computers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_activities ALTER COLUMN id SET DEFAULT nextval('computers_activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_brands ALTER COLUMN id SET DEFAULT nextval('computers_brands_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_chipsets ALTER COLUMN id SET DEFAULT nextval('computers_chipsets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_cpus ALTER COLUMN id SET DEFAULT nextval('computers_cpus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_disks ALTER COLUMN id SET DEFAULT nextval('computers_disks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_gpus ALTER COLUMN id SET DEFAULT nextval('computers_gpus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_os ALTER COLUMN id SET DEFAULT nextval('computers_os_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_prices ALTER COLUMN id SET DEFAULT nextval('computers_prices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_quests ALTER COLUMN id SET DEFAULT nextval('computers_quests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_quests_resps ALTER COLUMN id SET DEFAULT nextval('computers_quests_resps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_traders ALTER COLUMN id SET DEFAULT nextval('computers_traders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY users_auth ALTER COLUMN id SET DEFAULT nextval('users_auth_id_seq'::regclass);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY "SequelizeMeta" (name) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-05-24 14:05:23.086961	2018-05-24 14:05:23.086961
\.


--
-- Data for Name: computer_disks; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY computer_disks (id, disk_type, size, interface, created_at, updated_at) FROM stdin;
\.


--
-- Name: computer_disks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valentin
--

SELECT pg_catalog.setval('computer_disks_id_seq', 1, false);


--
-- Data for Name: computers; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY computers (id, os_id, cpu_id, gpu_id, activity_id, chipset_id, picture, designation, model, connector_available, weight, length, width, height, memory_type, memory_size, memory_max_size, keyboard_type, keyboard_numpad, keyboard_light, screen_type, screen_resolution, screen_refresh_rate, screen_size, screen_format, network, webcam, active, created_at, updated_at, brand_id) FROM stdin;
7735	1332	1939	1414	1	1	\N	\N	Apple MacBook Pro 15 Touch Bar 512 Go Gris sidéral 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:14.972997	2018-07-05 16:02:14.972997	1379
7736	1324	1559	1314	1	1	\N	\N	Asus VivoBook S15 S510UN-BQ041T Or	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:15.332838	2018-07-05 16:02:15.332838	1379
7737	1332	1938	1547	3	1	\N	\N	Apple MacBook Pro 13 256 Go Gris Sidéral 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:15.691725	2018-07-05 16:02:15.691725	1379
7738	1324	1893	1314	1	1	\N	\N	Asus VivoBook S14 S410UN-EB189T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:15.999248	2018-07-05 16:02:15.999248	1379
7739	1324	1910	1547	3	1	\N	\N	Asus VivoBook 17 X705UA-BX138T Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:16.213841	2018-07-05 16:02:16.213841	1379
7740	1324	1559	1547	3	1	\N	\N	Asus ZenBook Flip S UX370-716512 Bleu	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:16.477447	2018-07-05 16:02:16.477447	1379
7741	1324	1562	1304	1	1	\N	\N	Asus VivoBook Pro 15 N580VD-FJ510T Or	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:16.743721	2018-07-05 16:02:16.743721	1379
7742	1324	1567	1396	2	1	\N	\N	Asus ROG Strix GL703GS-E5020T Scar Edition	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:16.998297	2018-07-05 16:02:16.998297	1379
7743	1324	1841	1547	3	1	\N	\N	HP Spectre 13 13-AF002NF Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:17.313406	2018-07-05 16:02:17.313406	1379
7744	1314	1504	1304	1	1	\N	\N	HP Pavilion 17 17-AB309NF Noir	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:17.532914	2018-07-05 16:02:17.532914	1379
7745	1334	1940	1543	3	1	\N	\N	Apple MacBook Pro 15 Retina 256 Go Silver 2015	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:18.065293	2018-07-05 16:02:18.065293	1379
7746	1314	1504	1436	3	1	\N	\N	Acer Aspire 5 A517-51G-54J9	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:18.410141	2018-07-05 16:02:18.410141	1379
7747	1330	1556	1296	2	1	\N	\N	Razer Blade 14 RZ09-01952F33-R3F1	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:18.628086	2018-07-05 16:02:18.628086	1379
7748	1329	1506	1304	1	1	\N	\N	MSI GL72M 7RDX-886XFR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:18.876054	2018-07-05 16:02:18.876054	1379
7749	1329	1506	1296	2	1	\N	\N	MSI GL62MVR 7RFX-1052XFR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:19.278512	2018-07-05 16:02:19.278512	1379
7750	1324	1556	1296	2	1	\N	\N	Asus ROG G752VM-GC091T	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:19.617553	2018-07-05 16:02:19.617553	1379
7751	1324	1559	1314	1	1	\N	\N	Asus VivoBook Pro 17 N705UN-GC053T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:19.938148	2018-07-05 16:02:19.938148	1379
7752	1323	1504	1334	3	1	\N	\N	HP Pavilion 15 15-CC508NF Argent	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:20.182163	2018-07-05 16:02:20.182163	1379
7753	1324	1841	1547	3	1	\N	\N	Asus VivoBook S15 S501UA-EJ645T Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:20.547633	2018-07-05 16:02:20.547633	1379
7754	1324	1559	1547	3	1	\N	\N	Asus ZenBook Flip UX360UAK-DQ405T Noir	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:20.795289	2018-07-05 16:02:20.795289	1379
7755	1324	1562	1552	3	1	\N	\N	Asus ROG Strix GL702VS-GC250T Titanium	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:21.031244	2018-07-05 16:02:21.031244	1379
7756	1330	1556	1296	2	1	\N	\N	Razer Blade 14 RZ09-01952F32-R3F1	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:21.261115	2018-07-05 16:02:21.261115	1379
7757	1314	1774	1547	3	1	\N	\N	HP Notebook 15 15-BS083NF Noir	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:21.520903	2018-07-05 16:02:21.520903	1379
7758	1333	1567	1296	2	1	\N	\N	Gigabyte Aero 15 15W-V8-B544W10P-FR Noir	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:21.745347	2018-07-05 16:02:21.745347	1379
7760	1325	1442	1547	3	1	\N	\N	Thomson HERO11 HERO11C-2GR32 Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:22.398553	2018-07-05 16:02:22.398553	1379
7761	1324	1893	1547	3	1	\N	\N	Asus ZenBook Flip S UX370-78256 Bleu	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:22.676682	2018-07-05 16:02:22.676682	1379
7762	1324	1567	1296	2	1	\N	\N	Asus ROG Strix GL703GM-EE019T Scar Edition	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:22.961135	2018-07-05 16:02:22.961135	1379
7763	1314	1504	1547	3	1	\N	\N	HP Pavilion 14 14-BF012NF Argent	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:23.192606	2018-07-05 16:02:23.192606	1379
7764	1323	1559	1344	3	1	\N	\N	HP Notebook 17 17-BS088NF Argent	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:23.451542	2018-07-05 16:02:23.451542	1379
7765	1333	1567	1548	3	1	\N	\N	MSI GS65 8RF-225FR Stealth Thin	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:23.697315	2018-07-05 16:02:23.697315	1379
7766	1324	1893	1547	3	1	\N	\N	HP Spectre 13 13-AF007NF Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:24.177397	2018-07-05 16:02:24.177397	1379
7767	1314	1893	1547	3	1	\N	\N	HP Spectre X360 13-AE009NF Argent	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:24.427306	2018-07-05 16:02:24.427306	1379
7768	1326	1567	1304	1	1	\N	\N	Gigabyte Sabre 15 P45G-V8-C30D-FR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:24.639902	2018-07-05 16:02:24.639902	1379
7769	1322	1594	1547	3	1	\N	\N	Asus VivoBook Flip 14 TP401NA-BZ002T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:24.844577	2018-07-05 16:02:24.844577	1379
7770	1324	1559	1547	3	1	\N	\N	Asus ZenBook Flip S UX370-78256 Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:25.099243	2018-07-05 16:02:25.099243	1379
7771	1332	1938	1547	3	1	\N	\N	Apple MacBook Pro 13 Touch Bar 512 Go Gris sidéral 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:25.33558	2018-07-05 16:02:25.33558	1379
7772	1314	1506	1296	2	1	\N	\N	HP Omen 15 15-CE025NF	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:25.637035	2018-07-05 16:02:25.637035	1379
7773	1323	1559	1344	3	1	\N	\N	HP Notebook 17 17-BS009NF Argent	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:25.977354	2018-07-05 16:02:25.977354	1379
7776	1330	1556	1549	3	1	\N	\N	Razer Blade Pro 4K RZ09-01662F52-R3F1	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:26.768858	2018-07-05 16:02:26.768858	1379
7777	1314	1891	1291	2	1	\N	\N	HP Omen X 17-AP005NF	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:26.985954	2018-07-05 16:02:26.985954	1379
7778	1324	1559	1547	3	1	\N	\N	Asus ZenBook 3 UX390UA-GS038T Bleu	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:27.212981	2018-07-05 16:02:27.212981	1379
7779	1314	1921	1547	3	1	\N	\N	HP Notebook 15 15-BS069NF Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:27.442181	2018-07-05 16:02:27.442181	1379
7780	1314	1506	1304	1	1	\N	\N	HP Pavilion Power 15 15-CB001NF	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:27.713678	2018-07-05 16:02:27.713678	1379
7782	1330	1567	1550	3	1	\N	\N	Razer Blade 15 RZ09-02385F92-R3F1	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:28.300334	2018-07-05 16:02:28.300334	1379
7783	1323	1797	1459	3	1	\N	\N	HP Notebook 17 17-BS041NF Argent	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:28.530635	2018-07-05 16:02:28.530635	1379
7784	1324	1797	1547	3	1	\N	\N	Asus VivoBook 14 X405UA-EB713T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:28.76308	2018-07-05 16:02:28.76308	1379
7785	1332	1938	1547	3	1	\N	\N	Apple MacBook Pro 13 256 Go Silver 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:29.094218	2018-07-05 16:02:29.094218	1379
7786	1314	1891	1291	2	1	\N	\N	HP Omen X 17-AP003NF	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:29.411828	2018-07-05 16:02:29.411828	1379
7787	1325	1567	1551	3	1	\N	\N	Asus ROG Zephyrus M GM501GM-EI005T	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:29.638436	2018-07-05 16:02:29.638436	1379
7788	1330	1891	1549	3	1	\N	\N	Razer Blade Pro 4K RZ09-01663F53-R3F1	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:29.865388	2018-07-05 16:02:29.865388	1379
7789	1314	1891	1396	2	1	\N	\N	HP Omen X 17-AP000NF	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:30.091477	2018-07-05 16:02:30.091477	1379
7790	1314	1382	1547	3	1	\N	\N	Acer Aspire ES1 ES1-524-98L1	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:30.31011	2018-07-05 16:02:30.31011	1379
7791	1330	1891	1549	3	1	\N	\N	Razer Blade Pro 4K RZ09-01663F52-R3F1	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:30.508752	2018-07-05 16:02:30.508752	1379
7792	1332	1941	1547	3	1	\N	\N	Apple MacBook 12'' 256 Go Gris Sidéral 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:30.717652	2018-07-05 16:02:30.717652	1379
7793	1314	1506	1304	1	1	\N	\N	Acer Nitro 5 AN515-51-56G8	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:31.257282	2018-07-05 16:02:31.257282	1379
7794	1314	1921	1547	3	1	\N	\N	HP Notebook 14 14-BS010NF Noir	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:31.594204	2018-07-05 16:02:31.594204	1379
7795	1314	1891	1396	2	1	\N	\N	HP Omen X 17-AP002NF	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:31.839167	2018-07-05 16:02:31.839167	1379
7796	1314	1891	1396	2	1	\N	\N	HP Omen X 17-AP001NF	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:32.089253	2018-07-05 16:02:32.089253	1379
7797	1335	1841	1547	3	1	\N	\N	Acer Swift 5 SF514-52T-57MK Bleu	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:32.339098	2018-07-05 16:02:32.339098	1379
7759	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/04/10/90/LD0004109014_2_0004109423_0004142012_0004698300.jpg	\N	MSI GS63VR 7RG-092FR Stealth Pro	\N	1.9	249.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:02:22.125773	2018-07-05 16:12:04.999153	1387
7798	1324	1893	1314	1	1	\N	\N	Asus VivoBook S14 S410UN-EB136T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:32.564082	2018-07-05 16:02:32.564082	1379
7800	1330	1559	1448	3	1	\N	\N	Lenovo IdeaPad 320 320-15IKBN Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:33.11571	2018-07-05 16:02:33.11571	1379
7801	1324	1910	1547	3	1	\N	\N	Asus VivoBook 17 F705UA-BX268T Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:33.346199	2018-07-05 16:02:33.346199	1379
7802	1314	1509	1552	3	1	\N	\N	Acer Predator Helios 500 PH517-51-59FE	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:33.565371	2018-07-05 16:02:33.565371	1379
7803	1328	1504	1547	3	1	\N	\N	Microsoft Surface Laptop D9P-00012 Platine	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:33.808715	2018-07-05 16:02:33.808715	1379
7804	1325	1567	1304	1	1	\N	\N	Gigabyte Sabre 15 P45G-V8-C35W10-FR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:34.028378	2018-07-05 16:02:34.028378	1379
7805	1325	1442	1547	3	1	\N	\N	Thomson Neo X X6-2.32BL Bleu	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:34.252013	2018-07-05 16:02:34.252013	1379
7806	1333	1567	1405	1	1	\N	\N	Gigabyte Aero 14 14K-V8-G50W10P-FR Vert	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:34.478125	2018-07-05 16:02:34.478125	1379
7807	1314	1506	1304	1	1	\N	\N	HP Pavilion Power 15 15-CB002NF	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:34.708942	2018-07-05 16:02:34.708942	1379
7808	1326	1506	1304	1	1	\N	\N	Asus FX753VD-GC261	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:34.987829	2018-07-05 16:02:34.987829	1379
7809	1326	1567	1304	1	1	\N	\N	Gigabyte Sabre 17 P47G-V8-C30D-FR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:35.236735	2018-07-05 16:02:35.236735	1379
7811	1324	1889	1547	3	1	\N	\N	HP Spectre X2 12-C001NF Argent cendré	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:35.802167	2018-07-05 16:02:35.802167	1379
7812	1333	1567	1396	2	1	\N	\N	Gigabyte Aero 15X 15X-V8-B4K5W10P-FR Noir	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:36.042778	2018-07-05 16:02:36.042778	1379
7813	1325	1567	1304	1	1	\N	\N	Gigabyte Sabre 17 P47G-V8-C35W10-FR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:36.277033	2018-07-05 16:02:36.277033	1379
7814	1324	1567	1552	3	1	\N	\N	Asus ROG Griffin G703GS-E5007T Titanium	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:36.498098	2018-07-05 16:02:36.498098	1379
7815	1325	1567	1296	2	1	\N	\N	Gigabyte Sabre 15 P45W-V8-C350W10-FR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:36.699684	2018-07-05 16:02:36.699684	1379
7816	1324	1910	1547	3	1	\N	\N	Asus VivoBook S14 S405UA-BV706T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:36.899141	2018-07-05 16:02:36.899141	1379
7818	1314	1569	1552	3	1	\N	\N	Acer Predator Helios 500 PH517-51-91Q5	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:37.412288	2018-07-05 16:02:37.412288	1379
7819	1314	1569	1552	3	1	\N	\N	Acer Predator Helios 500 PH517-51-91Q5	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:37.636022	2018-07-05 16:02:37.636022	1379
7820	1324	1562	1304	1	1	\N	\N	Asus VivoBook Pro 15 N580VD-FI366T Or	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:37.878066	2018-07-05 16:02:37.878066	1379
7821	1324	1567	1553	3	1	\N	\N	Asus ROG Griffin G703GI-E5083T Titanium	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:38.152369	2018-07-05 16:02:38.152369	1379
7822	1329	1562	1304	1	1	\N	\N	MSI GL62M 7RDX-2617XFR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:38.376012	2018-07-05 16:02:38.376012	1379
7824	1324	1569	1553	3	1	\N	\N	Asus ROG Griffin G703GI-E5120T Titanium	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:38.953537	2018-07-05 16:02:38.953537	1379
7825	1325	1442	1547	3	1	\N	\N	Thomson Neo X NEOX13C-4RD64 Rouge	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:39.195631	2018-07-05 16:02:39.195631	1379
7827	1330	1567	1548	3	1	\N	\N	Razer Blade 15 RZ09-02386F92-R3F1	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:39.736204	2018-07-05 16:02:39.736204	1379
7828	1332	1941	1547	3	1	\N	\N	Apple MacBook 12'' 256 Go Or 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:39.946143	2018-07-05 16:02:39.946143	1379
7831	1333	1838	1547	3	1	\N	\N	Microsoft Surface Book 2 HMW-00005	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:40.693156	2018-07-05 16:02:40.693156	1379
7832	1330	1562	1296	2	1	\N	\N	Razer Blade 14 RZ09-01953F52-R3F1	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:40.913583	2018-07-05 16:02:40.913583	1379
7833	1333	1567	1405	1	1	\N	\N	Gigabyte Aero 14 14K-V8-B50W10P-FR Noir	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:41.170414	2018-07-05 16:02:41.170414	1379
7834	1330	1562	1296	2	1	\N	\N	Razer Blade 14 RZ09-01953F73-R3F1	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:41.508641	2018-07-05 16:02:41.508641	1379
7835	1333	1884	1411	1	1	\N	\N	Microsoft Surface Book 9ER-00003	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:41.765027	2018-07-05 16:02:41.765027	1379
7836	1333	1567	1405	1	1	\N	\N	Gigabyte Aero 14 14K-V8-M50W10P-FR Orange	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:42.073662	2018-07-05 16:02:42.073662	1379
7838	1314	1567	1552	3	1	\N	\N	Acer Predator Helios 500 PH517-51-7577	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:42.631723	2018-07-05 16:02:42.631723	1379
7839	1325	1937	1547	3	1	\N	\N	Thomson NEO14 NEO14.2-32BS Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:42.884696	2018-07-05 16:02:42.884696	1379
7840	1333	1565	1304	1	1	\N	\N	Microsoft Surface Book 2 HNN-00005	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:43.205677	2018-07-05 16:02:43.205677	1379
7841	1333	1884	1411	1	1	\N	\N	Microsoft Surface Book PA9-00003	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:43.412716	2018-07-05 16:02:43.412716	1379
7842	1314	1567	1552	3	1	\N	\N	Acer Predator Helios 500 PH517-51-7577	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:43.677147	2018-07-05 16:02:43.677147	1379
7843	1325	1569	1553	3	1	\N	\N	Aorus X9 X9-DT-V8-K644W10-FR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:43.901375	2018-07-05 16:02:43.901375	1379
7845	1332	1938	1547	3	1	\N	\N	Apple MacBook 12'' 512 Go Silver 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:44.413514	2018-07-05 16:02:44.413514	1379
7847	1331	1567	1296	2	1	\N	\N	MSI GS63 8RE-016FR Stealth	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:44.905259	2018-07-05 16:02:44.905259	1379
7848	1332	1938	1547	3	1	\N	\N	Apple MacBook 12'' 512 Go Or 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:45.134837	2018-07-05 16:02:45.134837	1379
7849	1332	1939	1414	1	1	\N	\N	Apple MacBook Pro 15 Touch Bar 512 Go Silver 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:46.130671	2018-07-05 16:02:46.130671	1379
7850	1325	1891	1552	3	1	\N	\N	Aorus X5 X5-V7-C4K0NW10-FR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:46.441432	2018-07-05 16:02:46.441432	1379
7851	1328	1504	1547	3	1	\N	\N	Microsoft Surface Laptop DAG-00012 Platine	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:46.682816	2018-07-05 16:02:46.682816	1379
7854	1332	1938	1547	3	1	\N	\N	Apple MacBook Pro 13 Touch Bar 256 Go Silver 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:47.405362	2018-07-05 16:02:47.405362	1379
7855	1332	1941	1547	3	1	\N	\N	Apple MacBook 12'' 256 Go Or rose 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:47.635228	2018-07-05 16:02:47.635228	1379
7856	1328	1561	1547	3	1	\N	\N	Microsoft Surface Laptop DAJ-00006 Platine	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:47.87649	2018-07-05 16:02:47.87649	1379
7857	1335	1364	1547	3	1	\N	\N	Acer Aspire ES1 ES1-523-4410	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:48.114898	2018-07-05 16:02:48.114898	1379
7859	1314	1921	1547	3	1	\N	\N	HP Notebook 15 15-BS002NF Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:48.55965	2018-07-05 16:02:48.55965	1379
7860	1332	1941	1547	3	1	\N	\N	Apple MacBook 12'' 256 Go Silver 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:48.802716	2018-07-05 16:02:48.802716	1379
7853	1314	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/85/52/LD0004855257_2_0004856341.jpg	\N	MSI GE73 8RE-031FR Raider RGB	\N	3.1	287.1	419.2	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:02:47.173908	2018-07-05 16:11:29.672069	1387
7844	1314	1567	1405	1	1	https://media.ldlc.com/ld/products/00/04/87/02/LD0004870274_2.jpg	\N	MSI GL63 8RD-020FR	\N	2.2	260.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:02:44.163439	2018-07-05 16:11:40.302356	1387
7826	1314	1567	1405	1	1	https://media.ldlc.com/ld/products/00/04/85/73/LD0004857359_2_0004857897.jpg	\N	MSI GP73 8RD-007FR Leopard	\N	2.7	287.0	419.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:02:39.458947	2018-07-05 16:11:57.645304	1387
7823	1315	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/86/34/LD0004863448_2_0004863757.jpg	\N	MSI GS65 8RE-052FR Stealth Thin	\N	1.8	247.7	357.7	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	144	15	16/9	\N	t	t	2018-07-05 16:02:38.705395	2018-07-05 16:12:05.539052	1387
7852	1314	1891	1546	3	1	https://media.ldlc.com/ld/products/00/04/55/71/LD0004557161_2.jpg	\N	MSI GT75VR 7RE-061FR Titan SLI 4K	\N	4.73	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:02:46.915667	2018-07-05 16:12:22.777041	1387
7862	1330	1567	1548	3	1	\N	\N	Razer Blade 15 RZ09-02386F91-R3F1	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:49.532939	2018-07-05 16:02:49.532939	1379
7863	1324	1841	1547	3	1	\N	\N	Asus VivoBook S15 S501UA-EJ1200T Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:49.764639	2018-07-05 16:02:49.764639	1379
7865	1325	1562	1296	2	1	\N	\N	Gigabyte Sabre 15 P45W-V7-C52W10-FR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:50.235231	2018-07-05 16:02:50.235231	1379
7866	1332	1939	1313	1	1	\N	\N	Apple MacBook Pro 15 Touch Bar 256 Go Gris sidéral 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:50.424586	2018-07-05 16:02:50.424586	1379
7868	1324	1841	1547	3	1	\N	\N	Asus VivoBook S14 S406UA-BM216T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:50.955923	2018-07-05 16:02:50.955923	1379
7869	1332	1938	1547	3	1	\N	\N	Apple MacBook 12'' 512 Go Gris Sidéral 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:51.192735	2018-07-05 16:02:51.192735	1379
7871	1325	1567	1405	1	1	\N	\N	Gigabyte Sabre 17 P47K-V8-C35W10-FR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:51.748479	2018-07-05 16:02:51.748479	1379
7872	1330	1567	1550	3	1	\N	\N	Razer Blade 15 RZ09-02385F71-R3F1	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:51.960587	2018-07-05 16:02:51.960587	1379
7873	1324	1559	1547	3	1	\N	\N	Asus ZenBook Flip UX360UAK-DQ405T Noir	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:52.182833	2018-07-05 16:02:52.182833	1379
7874	1324	1841	1436	3	1	\N	\N	Asus VivoBook 17 R702UF-GC116T Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:52.427227	2018-07-05 16:02:52.427227	1379
7875	1326	1506	1304	1	1	\N	\N	HP Pavilion Power 15 15-CB016NF	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:52.659673	2018-07-05 16:02:52.659673	1379
7876	1325	1567	1296	2	1	\N	\N	Gigabyte Sabre 17 P47W-V8-C350W10-FR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:52.967367	2018-07-05 16:02:52.967367	1379
7877	1324	1506	1296	2	1	\N	\N	Asus ROG Strix GL703VM-BA114T Scar Edition	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:53.205694	2018-07-05 16:02:53.205694	1379
7878	1324	1922	1547	3	1	\N	\N	Asus VivoBook 14 X407MA-EB129T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:53.416157	2018-07-05 16:02:53.416157	1379
7879	1325	1568	1552	3	1	\N	\N	Aorus X5 X5-V8-K644W10-FR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:53.638182	2018-07-05 16:02:53.638182	1379
7882	1333	1921	1547	3	1	\N	\N	Asus VivoBook 14 E406SA-EB110T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:54.360508	2018-07-05 16:02:54.360508	1379
7883	1324	1841	1547	3	1	\N	\N	Asus VivoBook 15 R520UA-EJ1147T Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:54.579626	2018-07-05 16:02:54.579626	1379
7884	1323	1504	1547	3	1	\N	\N	Asus VivoBook S14 S405UA-BM717T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:54.795412	2018-07-05 16:02:54.795412	1379
7885	1314	1594	1547	3	1	\N	\N	Acer Swift 1 SF113-31-P1CP Rose	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:55.037918	2018-07-05 16:02:55.037918	1379
7886	1325	1568	1553	3	1	\N	\N	Aorus X7 X7-DT-V8-K644W10-FR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:55.566888	2018-07-05 16:02:55.566888	1379
7887	1332	1938	1547	3	1	\N	\N	Apple MacBook Pro 13 Touch Bar 512 Go Silver 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:55.914693	2018-07-05 16:02:55.914693	1379
8406	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/54/44/LD0004544410_2_0004566925.jpg	\N	MSI GE63VR 7RE-066FR Raider	\N	2.2	265.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:11:26.907355	2018-07-05 16:11:26.917183	1387
7775	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/04/54/44/LD0004544410_2_0004544475_0004710097.jpg	\N	MSI GE63VR 7RF-208FR Raider	\N	2.2	265.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:02:26.533101	2018-07-05 16:11:27.455093	1387
8407	1	1502	1296	2	1	https://media.ldlc.com/ld/products/00/03/80/35/LD0003803553_2_0003955668_0003961169.jpg	\N	MSI GE72VR 6RF-238XFR Apache Pro	\N	2.7	287.8	419.9	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:11:27.989419	2018-07-05 16:11:28.000517	1387
8408	1	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/11/89/LD0004118935_2_0004119141_0004119231.jpg	\N	MSI GE72VR 7RF-427XFR Apache Pro	\N	2.9	287.8	419.9	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:11:28.542793	2018-07-05 16:11:28.557555	1387
8409	1	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/58/44/LD0004584429_2.jpg	\N	MSI GE72VR 7RF-427XFR Apache Pro + Pack MSI Back to School OFFERT !	\N	2.9	287.8	419.9	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:11:29.09606	2018-07-05 16:11:29.10576	1387
8410	1	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/85/52/LD0004855257_2_0004856341_0004856902.jpg	\N	MSI GE73 8RE-032XFR Raider RGB	\N	3.1	287.1	419.2	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:11:30.206086	2018-07-05 16:11:30.218004	1387
8411	1	1567	1396	2	1	https://media.ldlc.com/ld/products/00/04/85/52/LD0004855257_2_0004855679.jpg	\N	MSI GE73 8RF-030XFR Raider RGB	\N	3.1	287.1	419.2	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:11:30.751351	2018-07-05 16:11:30.764269	1387
7846	1314	1567	1396	2	1	https://media.ldlc.com/ld/products/00/04/85/52/LD0004855257_2.jpg	\N	MSI GE73 8RF-071FR Raider RGB	\N	3.1	287.1	419.2	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:02:44.634284	2018-07-05 16:11:32.299722	1387
8412	1314	1502	1415	1	1	https://media.ldlc.com/ld/products/00/03/71/96/LD0003719619_2_0003767452.jpg	\N	MSI GL62 6QF-624FR	\N	2.3	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:33.063922	2018-07-05 16:11:33.072417	1387
8413	1	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/50/00/LD0004500021_2_0004546869.jpg	\N	MSI GL62M 7RDX-1628XFR	\N	2.2	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:34.575375	2018-07-05 16:11:34.585179	1387
8414	1	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/50/00/LD0004500021_2_0004546869_0004630860.jpg	\N	MSI GL62M 7RDX-2074XFR	\N	2.2	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:35.103354	2018-07-05 16:11:35.112727	1387
8415	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/50/00/LD0004500021_2_0004630258_0004685698.jpg	\N	MSI GL62M 7RDX-2231FR	\N	2.2	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:35.627522	2018-07-05 16:11:35.640209	1387
8416	1	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/50/00/LD0004500021_2_0004630258_0004770561.jpg	\N	MSI GL62M 7RDX-2613XFR	\N	2.2	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:36.139291	2018-07-05 16:11:36.147583	1387
8417	1314	1506	1405	1	1	https://media.ldlc.com/ld/products/00/04/50/00/LD0004500021_2_0004546869_0004770229.jpg	\N	MSI GL62M 7REX-2612FR	\N	2.2	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:36.699024	2018-07-05 16:11:36.70897	1387
8418	1	1506	1296	2	1	https://media.ldlc.com/ld/products/00/04/78/18/LD0004781836_2.jpg	\N	MSI GL62MVR 7RFX-1233XFR	\N	2.2	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:37.240761	2018-07-05 16:11:37.251315	1387
8419	1314	1506	1296	2	1	https://media.ldlc.com/ld/products/00/04/78/18/LD0004781836_2_0004942865.jpg	\N	MSI GL62MVR 7RFX-1240FR	\N	2.2	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:37.754199	2018-07-05 16:11:37.763527	1387
7864	1	1509	1304	1	1	https://media.ldlc.com/ld/products/00/04/87/02/LD0004870274_2_0004870911_0004871059.jpg	\N	MSI GL63 8RC-022XFR	\N	2.2	260.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:02:49.977917	2018-07-05 16:11:38.29616	1387
7867	1314	1567	1405	1	1	https://media.ldlc.com/ld/products/00/04/86/24/LD0004862451_2_0004863163.jpg	\N	MSI GP63 8RD-083FR Leopard	\N	2.2	260.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:02:50.729632	2018-07-05 16:11:48.074189	1387
7861	1314	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/85/73/LD0004857359_2.jpg	\N	MSI GP73 8RE-033FR Leopard	\N	2.7	287.0	419.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:02:49.302836	2018-07-05 16:11:59.238961	1387
7896	1315	1634	1545	3	1	https://media.ldlc.com/ld/products/00/04/25/03/LD0004250374_2.jpg	\N	LDLC Bellone XK82B-32-H20S2-P10	\N	5.5	308.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:04:52.446382	2018-07-05 16:06:27.738066	1379
7897	1314	1442	1489	3	1	https://media.ldlc.com/ld/products/00/04/72/66/LD0004726628_2.jpg	\N	LDLC Mercure MH33-4SW	\N	1.3	216.0	327.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:04:52.967264	2018-07-05 16:06:28.343901	1379
7898	1314	1776	1489	3	1	https://media.ldlc.com/ld/products/00/04/72/65/LD0004726579_2.jpg	\N	LDLC Mercure MH34-4TW	\N	1.3	216.0	327.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:04:53.562247	2018-07-05 16:06:28.910751	1379
7901	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/40/23/LD0004402340_2_0004404541.jpg	\N	LDLC Saturne AK51B-I5-8-H10S2-H10	\N	3.1	284.0	418.5	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:04:56.406437	2018-07-05 16:06:31.056631	1379
7903	1314	1465	1460	3	1	https://media.ldlc.com/ld/products/00/04/45/51/LD0004455157_2.jpg	\N	LDLC Aurore Ci3-4-H20-H10	\N	3.1	272.8	413.0	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:04:57.517474	2018-07-05 16:06:32.118937	1379
7904	1314	1374	1529	3	1	https://media.ldlc.com/ld/products/00/04/49/27/LD0004492783_2_0004514432_0004679174.jpg	\N	Acer Aspire 3 A315-21-656R	\N	2.1	259.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:04:58.053716	2018-07-05 16:06:32.652814	1380
7889	1314	1465	1460	3	1	https://media.ldlc.com/ld/products/00/04/45/52/LD0004455297_2.jpg	\N	LDLC Aurore CI3-8-S1H10-H10	\N	3.1	272.8	413.0	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:04:47.754709	2018-07-05 16:06:23.770817	1379
7905	1314	1374	1529	3	1	https://media.ldlc.com/ld/products/00/04/49/27/LD0004492783_2.jpg	\N	Acer Aspire 3 A315-21-66HG	\N	2.1	259.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:04:58.562637	2018-07-05 16:06:33.153046	1380
7906	1314	1714	1530	3	1	https://media.ldlc.com/ld/products/00/04/49/27/LD0004492783_2_0004514432_0004669006_0004678992.jpg	\N	Acer Aspire 3 A315-21-97JA	\N	2.1	259.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:04:59.073815	2018-07-05 16:06:33.675062	1380
7907	1314	1714	1459	3	1	https://media.ldlc.com/ld/products/00/04/49/27/LD0004492783_2_0004514432_0004669006.jpg	\N	Acer Aspire 3 A315-21G-96NH	\N	2.1	259.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:04:59.603085	2018-07-05 16:06:34.203259	1380
7650	1314	1442	1489	3	1	https://media.ldlc.com/ld/products/00/04/49/27/LD0004492783_2_0004514352.jpg	\N	Acer Aspire 3 A315-31-C389	\N	2.1	259.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:01:50.733116	2018-07-05 16:06:34.694838	1380
7909	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/48/97/LD0004489747_2_0004491284_0004491493_0004749340_0004777058.jpg	\N	Acer Aspire 5 515-51-370K Noir	\N	2.2	263.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:01.13759	2018-07-05 16:06:35.732151	1380
7910	1314	1797	1436	3	1	https://media.ldlc.com/ld/products/00/04/48/97/LD0004489747_2_0004491284_0004491493_0004749340.jpg	\N	Acer Aspire 5 515-51G-337Y Noir	\N	2.2	263.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:01.692183	2018-07-05 16:06:36.223645	1380
7911	1314	1470	1461	3	1	https://media.ldlc.com/ld/products/00/04/48/97/LD0004489747_2_0004491284_0004668460_0004919986_0004920535.jpg	\N	Acer Aspire 5 A515-51-32S4	\N	2.2	263.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:02.245511	2018-07-05 16:06:36.732333	1380
7912	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/48/97/LD0004489747_2_0004491284_0004491756_0004492021.jpg	\N	Acer Aspire 5 A515-51-34LE Noir	\N	2.2	263.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:02.768556	2018-07-05 16:06:37.219665	1380
7913	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/48/97/LD0004489747_2_0004491284_0004491756_0004492021_0004500910.jpg	\N	Acer Aspire 5 A515-51-35TL Noir	\N	2.2	263.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:03.292531	2018-07-05 16:06:37.718334	1380
7914	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/48/97/LD0004489747_2_0004491284_0004491756_0004492021_0004500910_0004514377.jpg	\N	Acer Aspire 5 A515-51-382L Noir	\N	2.2	263.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:03.79753	2018-07-05 16:06:38.256335	1380
7915	1314	1470	1461	3	1	https://media.ldlc.com/ld/products/00/04/48/97/LD0004489747_2_0004491284_0004668460_0004919986.jpg	\N	Acer Aspire 5 A515-51-39Q4	\N	2.2	263.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:04.355156	2018-07-05 16:06:38.756622	1380
7916	1314	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/48/97/LD0004489747_2_0004491284_0004491756_0004492021_0004789188_0004920644.jpg	\N	Acer Aspire 5 A515-51-520H	\N	2.2	263.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:04.90268	2018-07-05 16:06:39.279827	1380
7917	1314	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/48/97/LD0004489747_2_0004491284_0004491756.jpg	\N	Acer Aspire 5 A515-51-55BQ Noir	\N	2.2	263.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:05.46093	2018-07-05 16:06:39.787246	1380
7918	1314	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/48/97/LD0004489747_2_0004491284_0004491756_0004492021_0004789188.jpg	\N	Acer Aspire 5 A515-51-5871 Noir	\N	2.2	263.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:06.032765	2018-07-05 16:06:40.35841	1380
7919	1314	1470	1436	3	1	https://media.ldlc.com/ld/products/00/04/48/97/LD0004489747_2_0004491284_0004668460_0004919986_0004920909.jpg	\N	Acer Aspire 5 A515-51G-3118	\N	2.2	263.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:06.575547	2018-07-05 16:06:40.898194	1380
7920	1314	1797	1334	3	1	https://media.ldlc.com/ld/products/00/04/48/97/LD0004489747_2_0004491284_0004491493.jpg	\N	Acer Aspire 5 A515-51G-32LL Noir	\N	2.2	263.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:07.12128	2018-07-05 16:06:41.395109	1380
7921	1314	1504	1334	3	1	https://media.ldlc.com/ld/products/00/04/48/97/LD0004489747_2_0004491284.jpg	\N	Acer Aspire 5 A515-51G-526Y Noir	\N	2.2	263.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:07.642334	2018-07-05 16:06:41.906613	1380
7922	1314	1504	1436	3	1	https://media.ldlc.com/ld/products/00/04/48/97/LD0004489747_2_0004491284_0004668460_0004748965.jpg	\N	Acer Aspire 5 A515-51G-538N	\N	2.2	263.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:08.188029	2018-07-05 16:06:43.463065	1380
7923	1314	1504	1334	3	1	https://media.ldlc.com/ld/products/00/04/48/97/LD0004489747_2_0004491284_0004491493_0004668694.jpg	\N	Acer Aspire 5 A515-51G-57CP	\N	2.2	263.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:09.677057	2018-07-05 16:06:43.971965	1380
7890	1315	1465	1460	3	1	https://media.ldlc.com/ld/products/00/04/45/53/LD0004455327_2.jpg	\N	LDLC Aurore CI3-8-S1H10-P10	\N	3.1	272.8	413.0	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:04:48.354558	2018-07-05 16:06:24.305967	1379
7908	1314	1594	1489	3	1	https://media.ldlc.com/ld/products/00/04/49/27/LD0004492783_2_0004514352_0004665836.jpg	\N	Acer Aspire 3 A315-31-P2QN	\N	2.1	259.0	381.6	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:00.617895	2018-07-05 16:06:35.193948	1380
7925	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/66/77/LD0004667770_2_0004667949_0004668034_0004668109.jpg	\N	Acer Aspire 5 A517-51-33KJ	\N	3.0	289.91	423.32	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:10.752635	2018-07-05 16:06:45.498054	1380
7927	1314	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/66/77/LD0004667770_2_0004667949_0004668034_0004668380_0004748310.jpg	\N	Acer Aspire 5 A517-51-5098	\N	3.0	289.91	423.32	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:12.354029	2018-07-05 16:06:46.52207	1380
7928	1314	1797	1436	3	1	https://media.ldlc.com/ld/products/00/04/66/77/LD0004667770_2_0004667949_0004668034_0004748486_0004748680.jpg	\N	Acer Aspire 5 A517-51G-39MT	\N	3.0	289.91	423.32	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:12.870499	2018-07-05 16:06:47.061852	1380
7929	1314	1797	1436	3	1	https://media.ldlc.com/ld/products/00/04/66/77/LD0004667770_2_0004667949_0004668034_0004748486.jpg	\N	Acer Aspire 5 A517-51G-39YS	\N	3.0	289.91	423.32	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:13.390731	2018-07-05 16:06:47.59459	1380
7930	1314	1841	1436	3	1	https://media.ldlc.com/ld/products/00/04/66/77/LD0004667770_2_0004746657_0004746999_0004747246.jpg	\N	Acer Aspire 5 A517-51G-50TQ	\N	3.0	289.91	423.32	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:13.933581	2018-07-05 16:06:48.094875	1380
7683	1314	1841	1314	1	1	https://media.ldlc.com/ld/products/00/04/66/77/LD0004667770_2.jpg	\N	Acer Aspire 5 A517-51G-51UU	\N	3.0	289.91	423.32	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:02:00.097201	2018-07-05 16:06:48.618079	1380
7932	1314	1504	1334	3	1	https://media.ldlc.com/ld/products/00/04/66/77/LD0004667770_2_0004667949.jpg	\N	Acer Aspire 5 A517-51G-53K1	\N	3.0	289.91	423.32	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:15.657125	2018-07-05 16:06:49.83595	1380
7933	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/66/77/LD0004667770_2_0004746657.jpg	\N	Acer Aspire 5 A517-51G-86KE	\N	3.0	289.91	423.32	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:16.197788	2018-07-05 16:06:50.389582	1380
7934	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/52/97/LD0004529780_2_0004529934.jpg	\N	Acer Aspire 7 A715-71G-56YF Noir	\N	2.35	262.8	381.6	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:16.699612	2018-07-05 16:06:50.867865	1380
7935	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/52/97/LD0004529780_2.jpg	\N	Acer Aspire 7 A715-71G-57JW Noir	\N	2.35	262.8	381.6	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:17.202706	2018-07-05 16:06:51.415884	1380
7936	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/52/97/LD0004529780_2_0004530092.jpg	\N	Acer Aspire 7 A715-71G-58TH Noir	\N	2.35	262.8	381.6	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:17.746675	2018-07-05 16:06:52.904645	1380
7937	1314	1562	1405	1	1	https://media.ldlc.com/ld/products/00/04/52/97/LD0004529780_2_0004529934_0004668806.jpg	\N	Acer Aspire 7 A715-71G-79YK	\N	2.35	262.8	381.6	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:18.272129	2018-07-05 16:06:53.408159	1380
7938	1314	1506	1405	1	1	https://media.ldlc.com/ld/products/00/04/50/78/LD0004507884_2_0004508590.jpg	\N	Acer Aspire 7 A717-71G-552V Noir	\N	3.04	289.91	423.32	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:18.785008	2018-07-05 16:06:53.94182	1380
7939	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/50/78/LD0004507884_2_0004508590_0004667479.jpg	\N	Acer Aspire 7 A717-71G-584T Noir	\N	3.04	289.91	423.32	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:20.263838	2018-07-05 16:06:54.471658	1380
7940	1314	1506	1405	1	1	https://media.ldlc.com/ld/products/00/04/50/78/LD0004507884_2_0004508590_0004509058.jpg	\N	Acer Aspire 7 A717-71G-58P6 Noir	\N	3.04	289.91	423.32	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:20.796117	2018-07-05 16:06:54.96277	1380
7941	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/50/78/LD0004507884_2.jpg	\N	Acer Aspire 7 A717-71G-73LN Noir	\N	3.04	289.91	423.32	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:21.306151	2018-07-05 16:06:55.518459	1380
7942	1314	1703	1531	3	1	https://media.ldlc.com/ld/products/00/04/35/82/LD0004358281_2_0004524796.jpg	\N	Acer Aspire E5-523G-61ML	\N	2.23	259.0	381.6	30.2	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:21.85612	2018-07-05 16:06:56.035031	1380
7943	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/03/77/32/LD0003773229_2_0004004901_0004013482_0004078214_0004357682.jpg	\N	Acer Aspire E5-575-38YB	\N	2.23	259.0	381.6	30.2	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:22.373553	2018-07-05 16:06:56.532465	1380
7944	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/03/81/55/LD0003815505_2_0004489021.jpg	\N	Acer Aspire E5-774-3798	\N	3.1	281.9	423.0	31.65	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:22.992996	2018-07-05 16:06:57.043051	1380
7945	1314	1797	1334	3	1	https://media.ldlc.com/ld/products/00/03/81/55/LD0003815540_2_0004007098_0004017456_0004082636_0004267751.jpg	\N	Acer Aspire E5-774G-33XK	\N	3.1	281.9	423.32	33.1	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:23.52516	2018-07-05 16:06:57.562496	1380
7946	1314	1797	1334	3	1	https://media.ldlc.com/ld/products/00/04/64/29/LD0004642996_2.jpg	\N	Acer Aspire E5-774G-33XK + Acer Notebook Starter Kit 17" OFFERT !	\N	3.1	281.9	423.32	33.1	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:24.109119	2018-07-05 16:06:58.069837	1380
7947	1314	1504	1334	3	1	https://media.ldlc.com/ld/products/00/03/81/55/LD0003815540_2_0003929149_0004125972.jpg	\N	Acer Aspire E5-774G-50TS	\N	3.1	281.9	423.32	33.1	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:24.633092	2018-07-05 16:06:59.567487	1380
7948	1314	1391	1532	3	1	https://media.ldlc.com/ld/products/00/04/14/69/LD0004146995_2_0004266420_0004429646.jpg	\N	Acer Aspire ES1-523-24HN	\N	2.23	258.0	381.8	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:25.162979	2018-07-05 16:07:00.549405	1380
7949	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/09/78/LD0004097821_2.jpg	\N	Acer Aspire ES1-572-301M	\N	2.4	258.0	381.8	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	\N	15	16/9	\N	t	t	2018-07-05 16:05:25.699596	2018-07-05 16:07:01.03292	1380
7950	1314	1593	1533	3	1	https://media.ldlc.com/ld/products/00/03/57/33/LD0003573300_2.jpg	\N	Acer Aspire ES1-731-P25X	\N	3.0	289.91	423.32	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:26.233547	2018-07-05 16:07:01.532879	1380
7924	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/66/77/LD0004667770_2_0004667949_0004668034_0004748486_0004748680_0004748817.jpg	\N	Acer Aspire 5 A517-51-30Y	\N	3.0	289.91	423.32	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:10.226607	2018-07-05 16:06:44.544744	1380
7926	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/66/77/LD0004667770_2_0004667949_0004668034_0004668380.jpg	\N	Acer Aspire 5 A517-51-3827	\N	3.0	289.91	423.32	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:11.848395	2018-07-05 16:06:46.019073	1380
7931	1314	1841	1314	1	1	https://media.ldlc.com/ld/products/00/04/66/77/LD0004667770_2_0004746657_0004746999.jpg	\N	Acer Aspire 5 A517-51G-522G	\N	3.0	289.91	423.32	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:14.936095	2018-07-05 16:06:49.106291	1380
7953	1316	1798	1468	3	1	https://media.ldlc.com/ld/products/00/04/21/14/LD0004211417_2_0004542514.jpg	\N	Acer Chromebook 14 CP5-471-32J3	\N	1.45	227.0	330.9	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:27.865203	2018-07-05 16:07:03.08043	1380
7954	1316	1500	1468	3	1	https://media.ldlc.com/ld/products/00/04/21/14/LD0004211417_2_0004542514_0004909479.jpg	\N	Acer Chromebook 14 CP5-471-596L	\N	1.45	227.0	330.9	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:28.370424	2018-07-05 16:07:03.601185	1380
7955	1316	1929	1480	3	1	https://media.ldlc.com/ld/products/00/04/21/14/LD0004211417_2.jpg	\N	Acer Chromebook 14 CP5-471-C67N	\N	1.45	227.0	330.9	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:28.871178	2018-07-05 16:07:04.090379	1380
7956	1316	1930	1534	3	1	https://media.ldlc.com/ld/products/00/04/90/88/LD0004908885_2.jpg	\N	Acer Chromebook R13 CB5-312T-K62F	\N	1.49	228.0	326.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:05:29.381545	2018-07-05 16:07:04.651923	1380
7957	1315	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/39/17/LD0004391720_2_0004809360.jpg	\N	Acer Extensa 2540-32WS	\N	2.4	258.0	381.8	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:29.905913	2018-07-05 16:07:05.141288	1380
7958	1314	1506	1405	1	1	https://media.ldlc.com/ld/products/00/04/54/74/LD0004547492_2_0004548361.jpg	\N	Acer Nitro 5 AN515-51-56UX	\N	2.7	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:30.426678	2018-07-05 16:07:05.683497	1380
7959	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/54/74/LD0004547492_2.jpg	\N	Acer Nitro 5 AN515-51-50CD	\N	2.7	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:31.035325	2018-07-05 16:07:06.172139	1380
7960	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/54/74/LD0004547492_2_0004668669.jpg	\N	Acer Nitro 5 AN515-51-50DX	\N	2.7	266.0	390.0	\N	DDR4	8 Go	32 Go	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:31.716705	2018-07-10 13:37:35.151163	1380
7961	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/54/74/LD0004547492_2_0004548361_0004548436_0004746467.jpg	\N	Acer Nitro 5 AN515-51-53BW	\N	2.7	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:32.493084	2018-07-05 16:07:07.194629	1380
7962	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/54/74/LD0004547492_2_0004548361_0004548436.jpg	\N	Acer Nitro 5 AN515-51-53S2	\N	2.7	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:33.033849	2018-07-05 16:07:07.69549	1380
7963	1314	1562	1405	1	1	https://media.ldlc.com/ld/products/00/04/54/74/LD0004547492_2_0004548067_0004746095.jpg	\N	Acer Nitro 5 AN515-51-7088	\N	2.7	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:34.53865	2018-07-05 16:07:08.194032	1380
7964	1314	1506	1296	2	1	https://media.ldlc.com/ld/products/00/03/97/99/LD0003979942_2_0003980654_0004020279_0004344249.jpg	\N	Acer Predator 15 G9-593-523M	\N	3.7	299.5	391.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:35.075822	2018-07-05 16:07:08.686024	1380
7965	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/03/97/99/LD0003979942_2_0004271244.jpg	\N	Acer Predator 15 G9-593-72YL	\N	3.7	299.5	391.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:35.579054	2018-07-05 16:07:09.236346	1380
7966	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/03/97/99/LD0003979942_2_0004271244_0004667909.jpg	\N	Acer Predator 15 G9-593-77VQ	\N	3.7	299.5	391.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:36.094415	2018-07-05 16:07:09.765554	1380
7967	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/03/97/99/LD0003979942_2_0004271244_0004666710.jpg	\N	Acer Predator 15 G9-593-79Q4	\N	3.7	299.5	391.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:36.66019	2018-07-05 16:07:10.29137	1380
7968	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/01/22/LD0004012215_2_0004012405_0004030327_0004030584_0004271547_0004666765.jpg	\N	Acer Predator 17 G9-793-75EU	\N	4.2	321.5	423.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:37.191655	2018-07-05 16:07:10.8151	1380
7969	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/04/01/22/LD0004012215_2_0004012405_0004030327_0004030584_0004271547_0004514803.jpg	\N	Acer Predator 17 G9-793-79QF	\N	4.2	321.5	423.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:38.708226	2018-07-05 16:07:11.357321	1380
7970	1314	1891	1291	2	1	https://media.ldlc.com/ld/products/00/04/07/13/LD0004071353_2_0004088095.jpg	\N	Acer Predator 17X GX-792-78VQ	\N	4.55	321.5	423.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:39.263536	2018-07-05 16:07:11.918643	1380
7971	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/51/14/LD0004511426_2.jpg	\N	Acer Predator Helios 300 G3-572-750M	\N	2.7	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:39.763607	2018-07-05 16:07:12.411221	1380
7972	1314	1562	1405	1	1	https://media.ldlc.com/ld/products/00/04/51/14/LD0004511426_2_0004712283.jpg	\N	Acer Predator Helios 300 G3-572-7884	\N	2.7	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:40.295786	2018-07-05 16:07:12.903419	1380
7973	1314	1506	1405	1	1	https://media.ldlc.com/ld/products/00/04/51/46/LD0004514645_2_0004514698_0004514778.jpg	\N	Acer Predator Helios 300 PH317-51-52ZD	\N	3.0	289.91	432.32	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	\N	17	16/9	\N	t	t	2018-07-05 16:05:40.815235	2018-07-05 16:07:13.405649	1380
7974	1314	1562	1405	1	1	https://media.ldlc.com/ld/products/00/04/51/46/LD0004514645_2_0004514698.jpg	\N	Acer Predator Helios 300 PH317-51-73XK	\N	3.0	289.91	432.32	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	\N	17	16/9	\N	t	t	2018-07-05 16:05:41.370204	2018-07-05 16:07:13.929818	1380
7975	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/51/46/LD0004514645_2.jpg	\N	Acer Predator Helios 300 PH317-51-7815	\N	3.0	289.91	432.32	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	\N	17	16/9	\N	t	t	2018-07-05 16:05:41.889938	2018-07-05 16:07:14.420557	1380
7976	1314	1562	1291	2	1	https://media.ldlc.com/ld/products/00/04/71/29/LD0004712932_2.jpg	\N	Acer Predator Triton 700 PT715-51-709K	\N	2.4	266.0	393.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:05:42.40949	2018-07-05 16:07:14.942217	1380
7977	1314	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/77/59/LD0004775932_2.jpg	\N	Acer Spin 3 SP314-51-58BE	\N	1.7	230.0	335.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:42.913092	2018-07-05 16:07:15.442529	1380
7978	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/03/93/70/LD0003937099_2_0004059462.jpg	\N	Acer Spin 5 SP513-51-33RB	\N	1.6	228.5	328.8	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:05:43.424351	2018-07-05 16:07:15.946084	1380
7951	1314	1594	1379	3	1	https://media.ldlc.com/ld/products/00/04/12/85/LD0004128595_2_0004539498.jpg	\N	Acer Aspire ES1-732-P9A1	\N	2.8	289.91	423.32	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:26.722886	2018-07-05 16:07:02.050824	1380
7952	1314	1502	1415	1	1	https://media.ldlc.com/ld/products/00/03/32/95/LD0003329589_2.jpg	\N	Acer Aspire V Nitro VN7-592G-512W Black Edition	\N	2.4	262.8	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:27.259365	2018-07-05 16:07:02.559852	1380
7673	1314	1594	1379	3	1	https://media.ldlc.com/ld/products/00/04/74/04/LD0004740431_2.jpg	\N	Acer Swift 1 SF113-31-P0ZF Or	\N	1.3	225.0	319.5	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:01:57.586115	2018-07-05 16:07:18.306337	1380
7982	1314	1594	1379	3	1	https://media.ldlc.com/ld/products/00/04/74/04/LD0004740436_2.jpg	\N	Acer Swift 1 SF113-31-P3P0 Argent	\N	1.3	225.0	319.5	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:05:47.781482	2018-07-05 16:07:19.393111	1380
7983	1314	1594	1379	3	1	https://media.ldlc.com/ld/products/00/04/74/04/LD0004740426_2.jpg	\N	Acer Swift 1 SF113-31-P6VV Argent	\N	1.3	225.0	319.5	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:05:48.321268	2018-07-05 16:07:19.953211	1380
7984	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/03/93/38/LD0003933857_2_0004058507.jpg	\N	Acer Swift 3 SF314-51-39ZJ Argent	\N	1.5	236.6	341.0	\N	\N	\N	\N	AZERTY	f	t	LED	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:48.89933	2018-07-05 16:07:20.423867	1380
7985	1314	1504	1359	3	1	https://media.ldlc.com/ld/products/00/03/93/38/LD0003933857_2_0003993079_0004082777.jpg	\N	Acer Swift 3 SF314-51-56LK Argent	\N	1.5	236.6	341.0	\N	\N	\N	\N	AZERTY	f	t	LED	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:49.427152	2018-07-05 16:07:20.903575	1380
7986	1314	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/74/04/LD0004740471_2.jpg	\N	Acer Swift 3 SF314-52-305B Gris	\N	1.7	234.0	338.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:49.924516	2018-07-05 16:07:21.46516	1380
7987	1314	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/74/04/LD0004740476_2.jpg	\N	Acer Swift 3 SF314-52-38Z7 Gris	\N	1.7	234.0	338.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:50.459963	2018-07-05 16:07:21.977775	1380
7988	1314	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/74/04/LD0004740481_2.jpg	\N	Acer Swift 3 SF314-52-39VU Bleu	\N	1.7	234.0	338.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:50.980992	2018-07-05 16:07:22.479064	1380
7989	1314	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/74/05/LD0004740573_2.jpg	\N	Acer Swift 3 SF314-52-5451 Gris	\N	1.6	234.0	338.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:51.49939	2018-07-05 16:07:22.981975	1380
7990	1314	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/74/05/LD0004740551_2.jpg	\N	Acer Swift 3 SF314-52-54LU Bleu	\N	1.6	234.0	338.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:51.987182	2018-07-05 16:07:23.56506	1380
7991	1314	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/74/05/LD0004740534_2.jpg	\N	Acer Swift 3 SF314-52-59GC Gris	\N	1.6	234.0	338.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:52.523856	2018-07-05 16:07:24.050811	1380
7992	1314	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/74/05/LD0004740583_2.jpg	\N	Acer Swift 3 SF314-52-70AR Gris	\N	1.6	234.0	338.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:54.053082	2018-07-05 16:07:24.542848	1380
7993	1314	1504	1314	1	1	https://media.ldlc.com/ld/products/00/04/74/05/LD0004740578_2.jpg	\N	Acer Swift 3 SF314-52G-52M7 Gris	\N	1.7	234.0	338.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:54.645008	2018-07-05 16:07:25.041171	1380
7994	1314	1559	1314	1	1	https://media.ldlc.com/ld/products/00/04/74/05/LD0004740588_2.jpg	\N	Acer Swift 3 SF314-52G-72R4 Gris	\N	1.7	234.0	338.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:55.135835	2018-07-05 16:07:25.554321	1380
7995	1314	1504	1314	1	1	https://media.ldlc.com/ld/products/00/04/75/84/LD0004758447_2.jpg	\N	Acer Swift 3 SF315-51G-54NE Gris	\N	2.1	255.0	370.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:55.675015	2018-07-05 16:07:26.058409	1380
7996	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/79/05/LD0004790592_2.jpg	\N	Acer Swift 3 SF315-51G-87HR Gris	\N	2.1	255.0	370.5	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:56.163268	2018-07-05 16:07:26.562169	1380
7997	1314	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/75/40/LD0004754050_2.jpg	\N	Acer Swift 5 SF514-52T-85ZX Bleu	\N	0.97	228.0	329.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:56.687343	2018-07-05 16:07:27.083781	1380
7999	1315	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/54/13/LD0004541370_2_0004542474.jpg	\N	Acer TravelMate P238-M-32E6	\N	1.5	228.0	327.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:05:57.232881	2018-07-05 16:07:27.580445	1380
8000	1315	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/54/13/LD0004541370_2_0004542474_0004809290.jpg	\N	Acer TravelMate P238-M-37HW	\N	1.6	228.0	327.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:05:57.72448	2018-07-05 16:07:28.067717	1380
8001	1315	1500	1468	3	1	https://media.ldlc.com/ld/products/00/04/54/13/LD0004541370_2_0004602252.jpg	\N	Acer TravelMate P238-M-531H	\N	1.5	228.0	327.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:05:58.240816	2018-07-05 16:07:28.644862	1380
8003	1315	1500	1468	3	1	https://media.ldlc.com/ld/products/00/04/04/57/LD0004045721_2.jpg	\N	Acer TravelMate P238-M-54XJ	\N	1.5	228.0	327.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:05:58.707449	2018-07-05 16:07:29.098788	1380
8005	1315	1500	1468	3	1	https://media.ldlc.com/ld/products/00/04/54/13/LD0004541370_2.jpg	\N	Acer TravelMate P238-M-560Q	\N	1.5	228.0	327.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:05:59.236701	2018-07-05 16:07:30.576559	1380
8008	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/88/26/LD0004882684_2.jpg	\N	Acer TravelMate P2510-M-53VP	\N	2.1	254.0	379.5	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:59.762093	2018-07-05 16:07:31.075877	1380
8010	1315	1798	1468	3	1	https://media.ldlc.com/ld/products/00/04/21/21/LD0004212152_2_0004404857_0004547074.jpg	\N	Acer TravelMate P259-M-30YX	\N	2.2	259.0	381.6	30.2	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:06:00.349242	2018-07-05 16:07:32.584243	1380
8011	1315	1500	1468	3	1	https://media.ldlc.com/ld/products/00/04/21/21/LD0004212152_2_0004404857_0004409228.jpg	\N	Acer TravelMate P259-M-50DZ	\N	2.2	259.0	381.6	30.2	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:06:00.916523	2018-07-05 16:07:33.261141	1380
8012	1315	1500	1468	3	1	https://media.ldlc.com/ld/products/00/04/21/21/LD0004212152_2_0004404857.jpg	\N	Acer TravelMate P259-M-52MP	\N	2.2	259.0	381.6	30.2	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:06:01.454095	2018-07-05 16:07:33.785824	1380
8013	1315	1553	1468	3	1	https://media.ldlc.com/ld/products/00/04/21/21/LD0004212152_2_0004404857_0004408153.jpg	\N	Acer TravelMate P259-M-76PC	\N	2.2	259.0	381.6	30.2	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:06:01.951938	2018-07-05 16:07:34.279327	1380
7979	1314	1841	1304	1	1	https://media.ldlc.com/ld/products/00/04/90/66/LD0004906645_2.jpg	\N	Acer Spin 5 SP515-51GN-54GU	\N	2.2	258.1	381.5	\N	\N	\N	\N	AZERTY	t	t	LED tactile	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:43.95615	2018-07-05 16:07:16.434373	1380
7980	1314	1564	1475	3	1	https://media.ldlc.com/ld/products/00/03/93/57/LD0003935734_2.jpg	\N	Acer Spin 7 SP714-51-M37P	\N	1.2	229.6	324.6	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:05:44.726672	2018-07-05 16:07:17.1193	1380
7981	1314	1594	1379	3	1	https://media.ldlc.com/ld/products/00/04/74/04/LD0004740441_2.jpg	\N	Acer Swift 1 SF113-31-P14U Or	\N	1.3	225.0	319.5	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:05:46.302796	2018-07-05 16:07:18.834743	1380
8420	1	1509	1304	1	1	https://media.ldlc.com/ld/products/00/04/87/02/LD0004870274_2_0004870911_0004871059_0004922966.jpg	\N	MSI GL63 8RC-274XFR	\N	2.2	260.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:39.779112	2018-07-05 16:11:39.787634	1387
8421	1	1509	1405	1	1	https://media.ldlc.com/ld/products/00/04/87/02/LD0004870274_2_0004870911.jpg	\N	MSI GL63 8RD-021XFR	\N	2.2	260.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:40.839859	2018-07-05 16:11:40.848554	1387
8422	1	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/54/74/LD0004547462_2_0004729456.jpg	\N	MSI GL72M 7RDX-1453XFR	\N	2.7	287.0	419.0	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:11:41.342898	2018-07-05 16:11:41.35528	1387
8423	1	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/54/74/LD0004547462_2_0004729456_0004948277.jpg	\N	MSI GL72M 7RDX-1472XFR	\N	2.7	287.0	419.0	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:11:41.868788	2018-07-05 16:11:41.878504	1387
7728	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/54/74/LD0004547462_2_0004649278.jpg	\N	MSI GL72M 7RDX-858FR	\N	2.7	287.0	419.0	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:02:12.737336	2018-07-05 16:11:42.411799	1387
7837	1	1567	1304	1	1	https://media.ldlc.com/ld/products/00/04/87/18/LD0004871881_2.jpg	\N	MSI GL73 8RC-025XFR	\N	2.7	287.0	419.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:02:42.388475	2018-07-05 16:11:42.897666	1387
7998	1	1465	1460	3	1	https://media.ldlc.com/ld/products/00/04/45/52/LD0004455252_2.jpg	\N	LDLC Aurore CI3-8-S1H10	\N	3.1	272.8	413.0	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:05:56.724566	2018-07-05 16:06:23.234359	1379
8002	1	1465	1460	3	1	https://media.ldlc.com/ld/products/00/04/45/59/LD0004455979_2.jpg	\N	LDLC Aurore Ti3-4-H5	\N	2.5	252.0	374.0	31.4	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:58.282878	2018-07-05 16:06:24.862403	1379
8004	1	1465	1460	3	1	https://media.ldlc.com/ld/products/00/04/45/60/LD0004456029_2.jpg	\N	LDLC Aurore Ti3-8-S2	\N	2.5	252.0	374.0	31.4	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:05:58.78826	2018-07-05 16:06:25.386512	1379
8006	1	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/45/67/LD0004456789_2.jpg	\N	LDLC Aurore TK3D-4-S1	\N	1.3	225.0	329.8	\N	\N	\N	\N	AZERTY	f	f	LED	1600 x 900 pixels	60	13	16/9	\N	t	t	2018-07-05 16:05:59.26781	2018-07-05 16:06:25.975684	1379
8007	1	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/45/68/LD0004456869_2.jpg	\N	LDLC Aurore TK3D-8-H10S1	\N	1.3	225.0	329.8	\N	\N	\N	\N	AZERTY	f	f	LED	1600 x 900 pixels	60	13	16/9	\N	t	t	2018-07-05 16:05:59.756862	2018-07-05 16:06:26.611743	1379
8009	1	1634	1545	3	1	https://media.ldlc.com/ld/products/00/04/25/03/LD0004250349_2.jpg	\N	LDLC Bellone XK82B-32-H20S2	\N	5.5	308.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:06:00.332378	2018-07-05 16:06:27.128305	1379
8015	1	1442	1489	3	1	https://media.ldlc.com/ld/products/00/04/00/97/LD0004009717_2.jpg	\N	LDLC Mercure ML4-4-H10	\N	1.2	210.5	292.4	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	11	16/9	\N	t	t	2018-07-05 16:06:02.507559	2018-07-05 16:06:29.441215	1379
8017	1	1442	1489	3	1	https://media.ldlc.com/ld/products/00/04/00/96/LD0004009637_2.jpg	\N	LDLC Mercure ML4-4-S1	\N	1.2	210.5	292.4	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	11	16/9	\N	t	t	2018-07-05 16:06:03.052286	2018-07-05 16:06:30.004185	1379
8019	1	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/40/23/LD0004402340_2.jpg	\N	LDLC Saturne AK51B-I5-8-H10S2	\N	3.1	284.0	418.5	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:06:03.57496	2018-07-05 16:06:30.48868	1379
8022	1	1465	1460	3	1	https://media.ldlc.com/ld/products/00/04/45/51/LD0004455112_2.jpg	\N	LDLC Aurore Ci3-4-H20	\N	3.1	272.8	413.0	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:06:04.620342	2018-07-05 16:06:31.588885	1379
7870	1	1509	1405	1	1	https://media.ldlc.com/ld/products/00/04/87/18/LD0004871881_2_0004871987.jpg	\N	MSI GL73 8RD-024XFR	\N	2.7	287.0	419.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:02:51.449681	2018-07-05 16:11:43.4182	1387
8424	1	1502	1318	1	1	https://media.ldlc.com/ld/products/00/03/41/16/LD0003411662_2_0003425876_0003494792.jpg	\N	MSI GP62 6QE-806XFR Leopard Pro	\N	2.4	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:43.936222	2018-07-05 16:11:43.948752	1387
8425	1314	1562	1405	1	1	https://media.ldlc.com/ld/products/00/04/49/62/LD0004496293_2.jpg	\N	MSI GP62 7REX-818FR Leopard Pro	\N	2.4	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:44.501474	2018-07-05 16:11:44.514279	1387
8426	1	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/69/85/LD0004698532_2.jpg	\N	MSI GP62M 7RDX-1484XFR Leopard	\N	2.2	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:45.039205	2018-07-05 16:11:45.047833	1387
8427	1314	1506	1405	1	1	https://media.ldlc.com/ld/products/00/04/69/85/LD0004698532_2_0004757339.jpg	\N	MSI GP62M 7REX-2063FR Leopard Pro	\N	2.2	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:45.569677	2018-07-05 16:11:45.582714	1387
8428	1	1506	1296	2	1	https://media.ldlc.com/ld/products/00/04/54/47/LD0004544741_2_0004546818_0004579600.jpg	\N	MSI GP62MVR 7RFX-1010XFR Leopard Pro	\N	2.2	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:46.104742	2018-07-05 16:11:46.114979	1387
8429	1	1506	1296	2	1	https://media.ldlc.com/ld/products/00/04/69/03/LD0004690319_2.jpg	\N	MSI GP62MVR 7RFX-1010XFR Leopard Pro + Pack MSI Xmas 2017 OFFERT !	\N	2.2	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:46.673492	2018-07-05 16:11:46.687034	1387
8430	1314	1506	1296	2	1	https://media.ldlc.com/ld/products/00/04/54/47/LD0004544741_2_0004546818_0004579600_0004893345.jpg	\N	MSI GP62MVR 7RFX-1277FR Leopard Pro	\N	2.2	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:47.27564	2018-07-05 16:11:47.292382	1387
8431	1	1567	1405	1	1	https://media.ldlc.com/ld/products/00/04/86/24/LD0004862451_2_0004862715_0004863025_0004863287.jpg	\N	MSI GP63 8RD-084XFR Leopard	\N	2.2	260.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:11:48.603957	2018-07-05 16:11:48.612905	1387
8432	1314	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/86/24/LD0004862451_2.jpg	\N	MSI GP63 8RE-030FR Leopard	\N	2.2	260.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:11:49.125173	2018-07-05 16:11:49.133632	1387
8433	1	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/86/24/LD0004862451_2_0004862516.jpg	\N	MSI GP63 8RE-031XFR Leopard	\N	2.2	260.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:11:49.669287	2018-07-05 16:11:49.678488	1387
8434	1314	1509	1296	2	1	https://media.ldlc.com/ld/products/00/04/86/24/LD0004862451_2_0004862715.jpg	\N	MSI GP63 8RE-095FR Leopard	\N	2.2	260.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:11:50.193681	2018-07-05 16:11:50.203573	1387
8435	1	1509	1296	2	1	https://media.ldlc.com/ld/products/00/04/86/24/LD0004862451_2_0004862715_0004863025.jpg	\N	MSI GP63 8RE-096XFR Leopard	\N	2.2	260.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:11:50.739906	2018-07-05 16:11:50.753992	1387
8441	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/68/86/LD0004688617_2.jpg	\N	MSI GP72MVR 7RFX-683FR Leopard Pro	\N	2.7	287.8	419.9	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:11:54.926946	2018-07-05 16:11:54.937221	1387
8442	1314	1506	1296	2	1	https://media.ldlc.com/ld/products/00/04/68/86/LD0004688617_2_0004729309.jpg	\N	MSI GP72MVR 7RFX-844FR Leopard Pro	\N	2.7	287.8	419.9	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:11:55.48216	2018-07-05 16:11:55.494453	1387
8443	1	1506	1296	2	1	https://media.ldlc.com/ld/products/00/04/64/24/LD0004642463_2.jpg	\N	MSI GP72VR 7RF-430XFR Leopard Pro	\N	2.7	287.8	419.9	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:11:56.02108	2018-07-05 16:11:56.032471	1387
8014	1315	1500	1468	3	1	https://media.ldlc.com/ld/products/00/04/20/60/LD0004206084_2_0004207134_0004400957.jpg	\N	Acer TravelMate X349-M-580J	\N	1.53	236.6	341.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:06:02.470836	2018-07-05 16:07:35.728964	1380
8016	1315	1553	1468	3	1	https://media.ldlc.com/ld/products/00/04/20/60/LD0004206084_2_0004207134_0004400957_0004409113.jpg	\N	Acer TravelMate X349-M-761F	\N	1.53	236.6	341.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:06:03.038295	2018-07-05 16:07:36.253412	1380
8018	1316	1442	1489	3	1	https://media.ldlc.com/ld/products/00/04/90/81/LD0004908117_2.jpg	\N	Acer Chromebook Spin 11 R751TN-C8GM	\N	1.4	206.0	296.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1366 x 768 pixels	60	11	16/9	\N	t	t	2018-07-05 16:06:03.573677	2018-07-05 16:07:36.799199	1380
8020	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/04/01/22/LD0004012215_2_0004012405_0004030327_0004030584_0004271547.jpg	\N	Acer Predator 17 G9-793-720A	\N	4.2	321.5	423.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:06:04.080284	2018-07-05 16:07:37.29919	1380
8021	1314	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/75/40/LD0004754055_2.jpg	\N	Acer Swift 5 SF514-52T-8240 Bleu	\N	0.97	228.0	329.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:06:04.583541	2018-07-05 16:07:37.813144	1380
8023	1315	1462	1372	3	1	https://media.ldlc.com/ld/products/00/03/54/32/LD0003543248_2_0003701196.jpg	\N	Acer TravelMate P236-M-31SW	\N	1.5	228.0	327.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:06:05.108978	2018-07-05 16:07:38.378762	1380
8436	1	1506	1405	1	1	https://media.ldlc.com/ld/products/00/03/13/00/LD0003130090_2_0003377179_0003484718_0004119431.jpg	\N	MSI GP72 7RE-209XFR Leopard Pro	\N	2.7	287.8	419.9	33.5	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:11:51.287307	2018-07-05 16:11:51.299767	1387
8437	1	1506	1405	1	1	https://media.ldlc.com/ld/products/00/03/13/00/LD0003130090_2_0003377179_0003484718_0004119431_0004474478.jpg	\N	MSI GP72 7RE-210XFR Leopard Pro	\N	2.7	287.8	419.9	33.5	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:11:51.805266	2018-07-05 16:11:51.818013	1387
8438	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/57/07/LD0004570770_2_0004689136.jpg	\N	MSI GP72M 7RDX-1259FR Leopard	\N	2.7	287.8	419.9	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:11:53.371062	2018-07-05 16:11:53.380337	1387
8439	1	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/57/07/LD0004570770_2.jpg	\N	MSI GP72M 7RDX-871XFR Leopard	\N	2.7	287.8	419.9	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:11:53.871578	2018-07-05 16:11:53.880127	1387
8440	1314	1562	1405	1	1	https://media.ldlc.com/ld/products/00/04/68/86/LD0004688617_2_0004710681.jpg	\N	MSI GP72M 7REX-1257FR Leopard Pro	\N	2.7	287.8	419.9	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:11:54.397031	2018-07-05 16:11:54.40678	1387
8444	1	1567	1405	1	1	https://media.ldlc.com/ld/products/00/04/85/73/LD0004857359_2_0004857897_0004858129.jpg	\N	MSI GP73 8RD-014XFR Leopard	\N	2.7	287.0	419.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:11:58.159577	2018-07-05 16:11:58.168166	1387
7881	1	1509	1405	1	1	https://media.ldlc.com/ld/products/00/04/85/73/LD0004857359_2_0004857897_0004858129_0004858465.jpg	\N	MSI GP73 8RD-021XFR Leopard	\N	2.7	287.0	419.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:02:54.100212	2018-07-05 16:11:58.71375	1387
8445	1315	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/10/90/LD0004109014_2_0004109423_0004141151_0004141732_0004558196.jpg	\N	MSI GS63 7RD-059FR Stealth	\N	1.9	249.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:59.753781	2018-07-05 16:11:59.762577	1387
8446	1314	1562	1405	1	1	https://media.ldlc.com/ld/products/00/04/10/90/LD0004109014_2_0004109423_0004141151_0004141732.jpg	\N	MSI GS63 7RE-013FR Stealth Pro	\N	1.9	249.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:00.315795	2018-07-05 16:12:00.328534	1387
8447	1314	1562	1405	1	1	https://media.ldlc.com/ld/products/00/04/74/18/LD0004741816_2.jpg	\N	MSI GS63 7RE-013FR Stealth Pro + Pack MSI Back to School OFFERT !	\N	1.9	249.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:00.832849	2018-07-05 16:12:00.845198	1387
8448	1	1562	1405	1	1	https://media.ldlc.com/ld/products/00/04/10/90/LD0004109014_2_0004109423_0004141151.jpg	\N	MSI GS63 7RE-014XFR Stealth Pro	\N	1.9	249.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:01.373606	2018-07-05 16:12:01.386269	1387
8449	1314	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/86/02/LD0004860206_2.jpg	\N	MSI GS63 8RE-016FR Stealth UHD	\N	1.89	249.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:02.081679	2018-07-05 16:12:02.091229	1387
7829	1314	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/86/02/LD0004860206_2_0004860484.jpg	\N	MSI GS63 8RE-017FR Stealth	\N	1.89	249.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:02:40.208141	2018-07-05 16:12:02.617138	1387
8450	1	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/10/90/LD0004109014_2.jpg	\N	MSI GS63VR 7RF-264XFR Stealth Pro	\N	1.9	249.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:03.346038	2018-07-05 16:12:03.356925	1387
8451	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/10/90/LD0004109014_2_0004109423_0004892695.jpg	\N	MSI GS63VR 7RF-692FR Stealth Pro	\N	1.9	249.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:12:03.900564	2018-07-05 16:12:03.912159	1387
8452	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/04/10/90/LD0004109014_2_0004109423_0004142012.jpg	\N	MSI GS63VR 7RG-009FR Stealth Pro	\N	1.9	249.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:12:04.442304	2018-07-05 16:12:04.453048	1387
8453	1315	1567	1396	2	1	https://media.ldlc.com/ld/products/00/04/86/34/LD0004863448_2.jpg	\N	MSI GS65 8RF-046FR Stealth Thin	\N	1.8	247.7	357.7	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	144	15	16/9	\N	t	t	2018-07-05 16:12:06.171526	2018-07-05 16:12:06.183939	1387
7799	1315	1567	1396	2	1	https://media.ldlc.com/ld/products/00/04/86/34/LD0004863448_2_0004863732.jpg	\N	MSI GS65 8RF-048FR Stealth Thin	\N	1.8	247.7	357.7	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	144	15	16/9	\N	t	t	2018-07-05 16:02:32.852866	2018-07-05 16:12:06.719038	1387
8454	1314	1567	1396	2	1	https://media.ldlc.com/ld/products/00/04/86/34/LD0004863448_2_0004863732_0004893817.jpg	\N	MSI GS65 8RF-049FR Stealth Thin	\N	1.8	247.7	357.7	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	144	15	16/9	\N	t	t	2018-07-05 16:12:07.246022	2018-07-05 16:12:07.255301	1387
8024	1315	1500	1354	3	1	https://media.ldlc.com/ld/products/00/03/54/11/LD0003541146_2_0003794367_0004045495_0004208291_0004602058.jpg	\N	Acer TravelMate P278-MG-58R2	\N	3.0	281.9	423.0	31.65	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:07:38.861184	2018-07-05 16:07:38.88571	1380
8025	1314	1891	1396	2	1	https://media.ldlc.com/ld/products/00/04/57/60/LD0004576093_2.jpg	\N	AORUS X5 v7 C4K0NW10-FR	\N	2.5	272.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	15	16/9	\N	t	t	2018-07-05 16:07:40.428575	2018-07-05 16:07:40.450053	1381
8026	1314	1568	1396	2	1	https://media.ldlc.com/ld/products/00/04/87/22/LD0004872275_2.jpg	\N	AORUS X5 v8 K644W10-FR	\N	2.5	272.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	144	15	16/9	\N	t	t	2018-07-05 16:07:41.089682	2018-07-05 16:07:41.114424	1381
8027	1314	1891	1546	3	1	https://media.ldlc.com/ld/products/00/04/64/64/LD0004646466_2.jpg	\N	AORUS X9 v7 K220NW10-FR	\N	3.59	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	2560 x 1440 pixels	120	17	16/9	\N	t	t	2018-07-05 16:07:41.628052	2018-07-05 16:07:41.644596	1381
8028	1314	1891	1291	2	1	https://media.ldlc.com/ld/products/00/04/56/18/LD0004561890_2_0004585028_0004669234.jpg	\N	AORUS X7 DT v7 K220NW10-FR	\N	3.2	305.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	2560 x 1440 pixels	120	17	16/9	\N	t	t	2018-07-05 16:07:42.139057	2018-07-05 16:07:42.16101	1381
8029	1314	1568	1291	2	1	https://media.ldlc.com/ld/products/00/04/87/43/LD0004874356_2.jpg	\N	AORUS X7 DT v8 K644W10-FR	\N	3.2	305.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	144	17	16/9	\N	t	t	2018-07-05 16:07:42.646164	2018-07-05 16:07:42.662269	1381
8030	1314	1891	1396	2	1	https://media.ldlc.com/ld/products/00/04/56/18/LD0004561890_2.jpg	\N	AORUS X7 v7 K220NW10-FR	\N	3.2	305.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	2560 x 1440 pixels	120	17	16/9	\N	t	t	2018-07-05 16:07:43.250319	2018-07-05 16:07:43.263998	1381
8031	1314	1569	1291	2	1	https://media.ldlc.com/ld/products/00/04/87/59/LD0004875908_2.jpg	\N	AORUS X9 DT v8 K644W10-FR	\N	3.59	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	144	17	16/9	\N	t	t	2018-07-05 16:07:43.807638	2018-07-05 16:07:43.817241	1381
8032	1315	1500	1468	3	1	https://media.ldlc.com/ld/products/00/04/68/52/LD0004685284_2.jpg	\N	ASUS B8430UA-FA0833R	\N	1.5	236.0	339.0	20.48	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	\N	14	16/9	\N	t	t	2018-07-05 16:07:44.321467	2018-07-05 16:07:44.332187	1382
8033	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/15/95/LD0004159526_2_0004363863_0004531857_0004740032.jpg	\N	ASUS B9440UA 90NX0151-M02540	\N	1.05	216.2	321.3	15.0	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	\N	t	2018-07-05 16:07:44.833573	2018-07-05 16:07:44.844988	1382
8034	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/15/95/LD0004159526_2_0004363863_0004531857.jpg	\N	ASUS B9440UA-GV0046RB	\N	1.05	216.2	321.3	15.0	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	\N	t	2018-07-05 16:07:45.37223	2018-07-05 16:07:45.380834	1382
8035	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/15/95/LD0004159526_2_0004363863_0004531857_0004916304.jpg	\N	ASUS B9440UA-GV0474R	\N	1.05	216.2	321.3	15.0	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	\N	t	2018-07-05 16:07:45.84774	2018-07-05 16:07:45.868289	1382
8036	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/15/95/LD0004159526_2_0004363863_0004531857_0004916304_0004916958.jpg	\N	ASUS B9440UA-GV0475R	\N	1.05	216.2	321.3	15.0	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	\N	t	2018-07-05 16:07:46.60009	2018-07-05 16:07:46.6147	1382
8038	1316	1573	1376	3	1	https://media.ldlc.com/ld/products/00/04/93/05/LD0004930568_2.jpg	\N	ASUS Chromebook Flip C302CA-GU009	\N	1.2	210.0	304.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1920 x 1080 pixels	60	12	16/9	\N	t	t	2018-07-05 16:07:47.655467	2018-07-05 16:07:47.668622	1382
8039	1314	1931	1530	3	1	https://media.ldlc.com/ld/products/00/03/44/73/LD0003447390_2_0003452180_0003970533_0004327221_0004500477_0004609469_0004722837.jpg	\N	ASUS EeeBook E402BA-FA010T Bleu	\N	1.65	235.0	339.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:07:48.184222	2018-07-05 16:07:48.202328	1382
8040	1314	1374	1530	3	1	https://media.ldlc.com/ld/products/00/03/44/73/LD0003447390_2_0003452180_0003970533_0004327221_0004500477_0004609469.jpg	\N	ASUS EeeBook E402BA-FA159T Bleu	\N	1.65	235.0	339.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:07:48.692951	2018-07-05 16:07:48.70751	1382
8041	1314	1440	1533	3	1	https://media.ldlc.com/ld/products/00/03/16/50/LD0003165020_2.jpg	\N	ASUS EeeBook E403SA-WX0004T	\N	1.5	235.0	339.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	\N	14	16/9	\N	t	t	2018-07-05 16:07:49.161042	2018-07-05 16:07:49.180253	1382
8042	1317	1774	1537	3	1	https://media.ldlc.com/ld/products/00/04/72/41/LD0004724118_2_0004724232_0004814314.jpg	\N	ASUS EeeBook E406SA-BV005TS	\N	1.3	227.0	326.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:07:49.658369	2018-07-05 16:07:49.674478	1382
8043	1317	1921	1538	3	1	https://media.ldlc.com/ld/products/00/04/72/41/LD0004724118_2.jpg	\N	ASUS EeeBook E406SA-EB087TS	\N	1.3	227.0	326.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:07:50.178096	2018-07-05 16:07:50.189237	1382
8044	1314	1932	1537	3	1	https://media.ldlc.com/ld/products/00/03/62/32/LD0003623288_2_0003960073.jpg	\N	ASUS EeeBook X206HA-FD0077T Bleu	\N	0.98	193.3	286.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	11	16/9	\N	t	t	2018-07-05 16:07:50.676919	2018-07-05 16:07:50.687447	1382
8045	1314	1594	1448	3	1	https://media.ldlc.com/ld/products/00/04/53/39/LD0004533943_2.jpg	\N	ASUS F751NV-TY014T Blanc	\N	2.8	272.0	415.0	35.5	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:07:51.213043	2018-07-05 16:07:51.225835	1382
8046	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/59/78/LD0004597829_2.jpg	\N	ASUS FX503VD-DM051T	\N	2.2	262.0	384.0	25.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:07:51.716173	2018-07-05 16:07:51.732167	1382
8047	1318	1562	1405	1	1	https://media.ldlc.com/ld/products/00/04/58/45/LD0004584527_2_0004584796.jpg	\N	ASUS FX553VE-DM353	\N	2.5	255.0	383.0	30.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:07:52.238605	2018-07-05 16:07:52.247193	1382
8048	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/17/98/LD0004179801_2_0004180425_0004331002_0004597212_0004599010.jpg	\N	ASUS FX753VD-GC261T	\N	3.0	273.0	415.0	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:07:52.730091	2018-07-05 16:07:52.740208	1382
8049	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/17/98/LD0004179801_2_0004180425_0004331002.jpg	\N	ASUS FX753VD-GC307T	\N	3.0	273.0	415.0	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:07:53.235903	2018-07-05 16:07:53.245033	1382
8050	1314	1504	1334	3	1	https://media.ldlc.com/ld/products/00/04/18/78/LD0004187830_2.jpg	\N	ASUS K401UQ-FA079T	\N	1.65	241.0	343.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:07:53.802941	2018-07-05 16:07:53.8239	1382
8051	1314	1553	1415	1	1	https://media.ldlc.com/ld/products/00/03/55/62/LD0003556267_2_0003775116.jpg	\N	ASUS K501UW-DM013T	\N	2.0	255.0	382.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:07:54.416442	2018-07-05 16:07:54.439429	1382
8052	1314	1504	1334	3	1	https://media.ldlc.com/ld/products/00/03/58/25/LD0003582530_2_0003660960_0003990342_0004021077_0004042271_0004103376.jpg	\N	ASUS K756UQ-TY277T	\N	2.69	274.0	415.0	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:07:54.981743	2018-07-05 16:07:54.990555	1382
8053	1317	1442	1489	3	1	https://media.ldlc.com/ld/products/00/04/72/69/LD0004726900_2.jpg	\N	ASUS Laptop TP202NA-EH008TS	\N	1.27	198.0	280.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1366 x 768 pixels	60	11	16/9	\N	t	t	2018-07-05 16:07:55.515043	2018-07-05 16:07:55.527203	1382
8054	1315	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/74/09/LD0004740995_2.jpg	\N	ASUS P1400UA-BV739R	\N	1.6	260.0	326.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:07:56.052271	2018-07-05 16:07:56.06072	1382
8055	1315	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/74/09/LD0004740995_2_0004741029.jpg	\N	ASUS P1400UA-BV752R	\N	1.6	260.0	326.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:07:57.943065	2018-07-05 16:07:57.953818	1382
8056	1315	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/93/26/LD0004932630_2.jpg	\N	ASUS P1410UA-BV469R	\N	1.43	226.0	326.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:07:58.463401	2018-07-05 16:07:58.472822	1382
8057	1315	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/53/92/LD0004539293_2_0004539322_0004733874_0004734239_0004769916.jpg	\N	ASUS P1501UA-DM496R	\N	2.3	251.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:07:59.036689	2018-07-05 16:07:59.054231	1382
8058	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/53/92/LD0004539293_2_0004539322_0004733874_0004754621.jpg	\N	ASUS P1501UA-DM598R	\N	2.3	251.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:07:59.541122	2018-07-05 16:07:59.549317	1382
8059	1315	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/53/92/LD0004539293_2_0004539322_0004733874_0004734239.jpg	\N	ASUS P1501UA-GQ495R	\N	2.3	251.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:00.083848	2018-07-05 16:08:00.093101	1382
8060	1315	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/53/92/LD0004539293_2_0004539322_0004733874_0004734239_0004734548.jpg	\N	ASUS P1501UA-GQ502R	\N	2.3	251.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:00.587643	2018-07-05 16:08:00.5982	1382
8061	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/53/92/LD0004539293_2_0004539322_0004733874.jpg	\N	ASUS P1501UA-GQ599R	\N	2.3	251.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:01.097636	2018-07-05 16:08:01.106298	1382
8062	1315	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/53/92/LD0004539293_2_0004539322_0004733874_0004734239_0004916155.jpg	\N	ASUS P1501UA-GQ739R	\N	2.3	251.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:01.670955	2018-07-05 16:08:01.683465	1382
8063	1315	1893	1436	3	1	https://media.ldlc.com/ld/products/00/04/73/46/LD0004734681_2_0004921856.jpg	\N	ASUS P1501UF-DM205R	\N	2.3	251.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:02.193437	2018-07-05 16:08:02.206057	1382
8064	1315	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/64/91/LD0004649132_2.jpg	\N	ASUS P1510UA-GQ280R	\N	2.3	251.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:02.691899	2018-07-05 16:08:02.700445	1382
8065	1315	1797	1359	3	1	https://media.ldlc.com/ld/products/00/04/73/34/LD0004733473_2_0004910070.jpg	\N	ASUS P1700UA-BX171R	\N	2.6	270.0	411.0	29.5	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:03.2129	2018-07-05 16:08:03.222168	1382
8066	1315	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/73/34/LD0004733473_2.jpg	\N	ASUS P1700UA-BX286R	\N	2.6	270.0	411.0	29.5	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:03.713031	2018-07-05 16:08:03.723245	1382
8067	1315	1841	1359	3	1	https://media.ldlc.com/ld/products/00/04/73/34/LD0004733473_2_0004733759.jpg	\N	ASUS P1700UA-BX298R	\N	2.6	270.0	411.0	29.5	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:04.200928	2018-07-05 16:08:04.212438	1382
8068	1315	1841	1359	3	1	https://media.ldlc.com/ld/products/00/04/73/34/LD0004733473_2_0004733759_0004905851.jpg	\N	ASUS P1700UA-BX403R	\N	2.6	270.0	411.0	29.5	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:04.721469	2018-07-05 16:08:04.735331	1382
8069	1315	1893	1507	3	1	https://media.ldlc.com/ld/products/00/04/73/34/LD0004733473_2_0004733759_0004742079_0004909290.jpg	\N	ASUS P1700UB-GC054R	\N	2.6	270.0	411.0	29.5	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:05.244473	2018-07-05 16:08:05.253473	1382
8070	1315	1841	1507	3	1	https://media.ldlc.com/ld/products/00/04/73/34/LD0004733473_2_0004733759_0004742079_0004909290_0004910648.jpg	\N	ASUS P1700UB-GC063R	\N	2.6	270.0	411.0	29.5	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:05.775595	2018-07-05 16:08:05.788208	1382
8071	1315	1500	1468	3	1	https://media.ldlc.com/ld/products/00/03/63/62/LD0003636215_2_0003636374_0004058396_0004430765.jpg	\N	ASUS P2530UA-DM0179RB	\N	2.37	256.0	380.0	22.6	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:06.268616	2018-07-05 16:08:06.280751	1382
8072	1314	1500	1468	3	1	https://media.ldlc.com/ld/products/00/03/49/84/LD0003498413_2_0003498772.jpg	\N	ASUS R301UA-FN031T Blanc	\N	1.59	234.0	328.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:08:07.776471	2018-07-05 16:08:07.786222	1382
8073	1314	1797	1480	3	1	https://media.ldlc.com/ld/products/00/04/72/05/LD0004720565_2_0004721158_0004721548.jpg	\N	ASUS R407UA-EB019T	\N	1.6	246.0	328.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:08.301352	2018-07-05 16:08:08.310571	1382
8074	1314	1797	1507	3	1	https://media.ldlc.com/ld/products/00/04/72/05/LD0004720565_2_0004721158.jpg	\N	ASUS R407UB-EB012T	\N	1.6	246.0	328.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:08.8221	2018-07-05 16:08:08.834908	1382
8075	1314	1504	1507	3	1	https://media.ldlc.com/ld/products/00/04/72/05/LD0004720565_2.jpg	\N	ASUS R407UB-EB035T	\N	1.6	246.0	328.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:09.351659	2018-07-05 16:08:09.363901	1382
8076	1314	1797	1507	3	1	https://media.ldlc.com/ld/products/00/04/83/42/LD0004834292_2.jpg	\N	ASUS R410UB-EB079T	\N	2.0	246.0	328.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:09.8749	2018-07-05 16:08:09.883833	1382
8077	1314	1553	1334	3	1	https://media.ldlc.com/ld/products/00/03/56/76/LD0003567680_2_0003624828.jpg	\N	ASUS R415UQ-FR014T	\N	1.65	241.0	343.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:10.388368	2018-07-05 16:08:10.397475	1382
8078	1314	1910	1480	3	1	https://media.ldlc.com/ld/products/00/04/72/18/LD0004721821_2.jpg	\N	ASUS R418UA-BV773T	\N	1.42	226.0	326.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:10.903682	2018-07-05 16:08:10.916645	1382
8079	1314	1504	1448	3	1	https://media.ldlc.com/ld/products/00/03/81/49/LD0003814946_2_0003952056_0004029374.jpg	\N	ASUS R457UVKBL-FA047T	\N	1.9	242.0	348.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:11.433642	2018-07-05 16:08:11.446874	1382
8080	1314	1482	1318	1	1	https://media.ldlc.com/ld/products/00/02/98/45/LD0002984500_2_0002985153_0003239754_0003240259.jpg	\N	ASUS R510JX-DM225T	\N	2.45	251.0	380.0	31.7	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:12.041635	2018-07-05 16:08:12.054977	1382
8081	1314	1462	1372	3	1	https://media.ldlc.com/ld/products/00/03/92/28/LD0003922825_2_0004877636.jpg	\N	ASUS R540LA-DM1245T	\N	2.0	252.0	381.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:12.574806	2018-07-05 16:08:12.6005	1382
8082	1314	1462	1354	3	1	https://media.ldlc.com/ld/products/00/03/54/59/LD0003545921_2_0003795931.jpg	\N	ASUS R540LJ-DM502T	\N	2.0	252.0	381.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:13.131467	2018-07-05 16:08:13.141141	1382
8083	1314	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/74/16/LD0004741646_2.jpg	\N	ASUS R540UA-GO033T	\N	2.0	252.0	381.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:13.64949	2018-07-05 16:08:13.661077	1382
8084	1318	1797	1507	3	1	https://media.ldlc.com/ld/products/00/03/92/28/LD0003922825_2_0004877636_0004877748.jpg	\N	ASUS R540UB-DM206	\N	2.0	252.0	381.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:14.414459	2018-07-05 16:08:14.426315	1382
8455	1	1562	1405	1	1	https://media.ldlc.com/ld/products/00/04/12/47/LD0004124748_2_0004428236_0004475972.jpg	\N	MSI GS73 7RE-007XFR Stealth Pro	\N	2.43	284.9	411.8	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:07.794445	2018-07-05 16:12:07.803271	1387
8456	1314	1567	1405	1	1	https://media.ldlc.com/ld/products/00/04/85/15/LD0004851576_2_0004853120_0004853692_0004854581.jpg	\N	MSI GS73 8RD-002FR Stealth	\N	2.43	284.9	411.8	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:08.324127	2018-07-05 16:12:08.332521	1387
8457	1314	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/85/54/LD0004855434_2.jpg	\N	MSI GS73 8RE-002FR Stealth	\N	2.43	284.9	411.8	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:08.856841	2018-07-05 16:12:08.868757	1387
8458	1314	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/85/15/LD0004851576_2_0004853592.jpg	\N	MSI GS73 8RE-016FR Stealth UHD	\N	2.43	284.9	411.8	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:09.442784	2018-07-05 16:12:09.451608	1387
8459	1314	1567	1396	2	1	https://media.ldlc.com/ld/products/00/04/85/15/LD0004851576_2.jpg	\N	MSI GS73 8RF-022FR Stealth UHD	\N	2.43	284.9	411.8	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:09.93571	2018-07-05 16:12:09.94675	1387
8460	1314	1567	1396	2	1	https://media.ldlc.com/ld/products/00/04/85/15/LD0004851576_2_0004853120.jpg	\N	MSI GS73 8RF-023FR Stealth	\N	2.43	284.9	411.8	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:10.466336	2018-07-05 16:12:10.478505	1387
8461	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/12/47/LD0004124748_2_0004631093.jpg	\N	MSI GS73VR 7RF-251FR Stealth Pro 4K	\N	2.43	284.9	411.8	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:11.010677	2018-07-05 16:12:11.020679	1387
8462	1	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/12/47/LD0004124748_2.jpg	\N	MSI GS73VR 7RF-253XFR Stealth Pro	\N	2.43	284.9	411.8	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:11.578499	2018-07-05 16:12:11.589412	1387
8463	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/12/47/LD0004124748_2_0004710937.jpg	\N	MSI GS73VR 7RF-428FR Stealth Pro	\N	2.43	284.9	411.8	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:12.101898	2018-07-05 16:12:12.111755	1387
8464	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/04/12/47/LD0004124748_2_0004142667.jpg	\N	MSI GS73VR 7RG-012FR Stealth Pro 4K	\N	2.43	284.9	411.8	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:12.641185	2018-07-05 16:12:12.654175	1387
8465	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/04/12/47/LD0004124748_2_0004142667_0004142987_0004638064.jpg	\N	MSI GS73VR 7RG-049FR Stealth Pro	\N	2.43	284.9	411.8	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:13.185088	2018-07-05 16:12:13.193957	1387
7880	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/04/12/47/LD0004124748_2_0004142667_0004142987_0004711177.jpg	\N	MSI GS73VR 7RG-086FR Stealth Pro	\N	2.43	284.9	411.8	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:02:53.888445	2018-07-05 16:12:14.714692	1387
7774	1	1562	1396	2	1	https://media.ldlc.com/ld/products/00/04/54/44/LD0004544410_2_0004544475.jpg	\N	MSI GE63VR 7RF-011XFR Raider	\N	2.2	265.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:02:26.255697	2018-07-05 16:12:37.80221	1387
8501	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/54/47/LD0004544741_2.jpg	\N	MSI GP62MVR 7RFX-842FR Leopard Pro	\N	2.2	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:38.304529	2018-07-05 16:12:38.315707	1387
8502	1	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/85/73/LD0004857359_2_0004857601.jpg	\N	MSI GP73 8RE-034XFR Leopard	\N	2.7	287.0	419.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:38.813071	2018-07-05 16:12:38.82154	1387
8503	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/12/04/LD0004120402_2.jpg	\N	MSI GS43VR 7RE-086FR Phantom Pro	\N	1.8	245.0	345.0	22.8	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:12:39.332523	2018-07-05 16:12:39.346456	1387
8504	1314	1556	1302	1	1	https://media.ldlc.com/ld/products/00/03/47/79/LD0003477954_2_0003720403_0003768253_0004056951.jpg	\N	MSI GS72 6QE-408FR Stealth Pro - Garantie 2 ans + 1 an OFFERT !	\N	2.6	287.0	418.5	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:40.837304	2018-07-05 16:12:40.847364	1387
7810	1314	1562	1291	2	1	https://media.ldlc.com/ld/products/00/03/80/37/LD0003803788_2_0003803842_0004110620_0004111045_0004111360_0004111461_0004440954_0004628855.jpg	\N	MSI GT73EVR 7RF-1012FR Titan Pro	\N	4.14	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:02:35.558123	2018-07-05 16:12:41.360483	1387
8505	1315	1567	1304	1	1	https://media.ldlc.com/ld/products/00/04/54/76/LD0004547692_2_0004702754_0004761867_0004896096.jpg	\N	MSI PE72 8RC-025FR	\N	2.7	287.8	419.9	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:42.850298	2018-07-05 16:12:42.860273	1387
8506	1315	1562	1298	1	1	https://media.ldlc.com/ld/products/00/04/49/80/LD0004498018_2_0004557859.jpg	\N	MSI WS63 7RK-406FR	\N	\N	249.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:43.367598	2018-07-05 16:12:43.376439	1387
8507	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/88/09/LD0004880983_2.jpg	\N	Razer Blade 14" RZ09-01953F52-R3F1	\N	1.93	235.0	345.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	3840 x 2160 pixels	60	14	16/9	\N	t	t	2018-07-05 16:12:43.912521	2018-07-05 16:12:43.924258	1388
8508	1314	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/92/37/LD0004923709_2.jpg	\N	Razer Blade 15" RZ09-02385F71-R3F1	\N	2.07	235.0	355.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:44.433422	2018-07-05 16:12:44.445374	1388
8509	1314	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/92/37/LD0004923709_2_0004924129.jpg	\N	Razer Blade 15" RZ09-02385F92-R3F1	\N	2.07	235.0	355.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	144	15	16/9	\N	t	t	2018-07-05 16:12:46.056087	2018-07-05 16:12:46.067277	1388
8510	1314	1567	1396	2	1	https://media.ldlc.com/ld/products/00/04/92/37/LD0004923709_2_0004924129_0004924524_0004924986.jpg	\N	Razer Blade 15" RZ09-02386F92-R3F1	\N	2.1	235.0	355.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	144	15	16/9	\N	t	t	2018-07-05 16:12:46.576935	2018-07-05 16:12:46.58988	1388
8511	1314	1891	1291	2	1	https://media.ldlc.com/ld/products/00/04/56/01/LD0004560148_2.jpg	\N	Razer Blade Pro RZ09-01663F52-R3F1	\N	3.49	281.0	424.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:47.100405	2018-07-05 16:12:47.112193	1388
8512	1314	1891	1291	2	1	https://media.ldlc.com/ld/products/00/04/56/01/LD0004560148_2_0004561739.jpg	\N	Razer Blade Pro RZ09-01663F53-R3F1	\N	3.49	281.0	424.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:47.668604	2018-07-05 16:12:47.678987	1388
8085	1314	1841	1507	3	1	https://media.ldlc.com/ld/products/00/04/87/88/LD0004878857_2.jpg	\N	ASUS R540UB-DM208T	\N	2.0	252.0	381.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:14.93195	2018-07-05 16:08:14.94446	1382
8086	1314	1504	1448	3	1	https://media.ldlc.com/ld/products/00/04/74/16/LD0004741651_2.jpg	\N	ASUS R540UV-DM025T	\N	2.0	252.0	381.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:15.451688	2018-07-05 16:08:15.460027	1382
8087	1314	1841	1436	3	1	https://media.ldlc.com/ld/products/00/04/53/92/LD0004539293_2_0004565192_0004585904_0004786915.jpg	\N	ASUS R542UF-DM179T	\N	2.3	251.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:16.040401	2018-07-05 16:08:16.052256	1382
8088	1314	1504	1336	3	1	https://media.ldlc.com/ld/products/00/04/53/92/LD0004539293_2.jpg	\N	ASUS R542UR-DM150T	\N	2.3	251.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	\N	15	16/9	\N	t	t	2018-07-05 16:08:16.548221	2018-07-05 16:08:16.558002	1382
8089	1314	1504	1336	3	1	https://media.ldlc.com/ld/products/00/04/53/92/LD0004539293_2_0004565192.jpg	\N	ASUS R542UR-DM153T	\N	2.3	251.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:17.093712	2018-07-05 16:08:17.103741	1382
8090	1314	1797	1359	3	1	https://media.ldlc.com/ld/products/00/04/53/37/LD0004533769_2_0004585185_0004612106_0004612575.jpg	\N	ASUS R702UA-BX095T	\N	2.1	270.0	411.0	22.7	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:17.643562	2018-07-05 16:08:17.653703	1382
8091	1314	1841	1436	3	1	https://media.ldlc.com/ld/products/00/04/53/37/LD0004533769_2_0004538652_0004593174_0004714663.jpg	\N	ASUS R702UF-GC043T	\N	2.2	270.0	411.0	21.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:18.120262	2018-07-05 16:08:18.129246	1382
8092	1314	1910	1448	3	1	https://media.ldlc.com/ld/products/00/04/53/37/LD0004533769_2_0004538652_0004593174_0004599517.jpg	\N	ASUS R702UV-BX196T	\N	2.1	270.0	411.0	22.7	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:18.641616	2018-07-05 16:08:18.654123	1382
8093	1314	1504	1448	3	1	https://media.ldlc.com/ld/products/00/04/53/37/LD0004533769_2_0004585185.jpg	\N	ASUS R702UV-GC192T	\N	2.1	270.0	411.0	22.7	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:19.183843	2018-07-05 16:08:19.193476	1382
8094	1314	1800	1334	3	1	https://media.ldlc.com/ld/products/00/04/84/55/LD0004845547_2.jpg	\N	ASUS R753UQ-T4501T	\N	2.69	274.0	415.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:19.707586	2018-07-05 16:08:19.716942	1382
8095	1314	1891	1291	2	1	https://media.ldlc.com/ld/products/00/04/04/74/LD0004047423_2_0004047873_0004464901_0004794932.jpg	\N	ASUS ROG Chimera G701VIK-BA044T	\N	3.6	309.0	429.0	44.6	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:08:20.249924	2018-07-05 16:08:20.267344	1382
8096	1314	1891	1291	2	1	https://media.ldlc.com/ld/products/00/04/04/74/LD0004047423_2_0004047873_0004464901_0004794932_0004795598.jpg	\N	ASUS ROG Chimera G701VIK-GB046T	\N	3.6	309.0	429.0	44.6	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:20.759581	2018-07-05 16:08:20.774033	1382
8097	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/83/48/LD0004834879_2_0004928495.jpg	\N	ASUS ROG GL703VM-BA291T	\N	2.95	280.0	418.0	25.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:21.257523	2018-07-05 16:08:21.268507	1382
8098	1314	1569	1291	2	1	https://media.ldlc.com/ld/products/00/04/92/12/LD0004921240_2.jpg	\N	ASUS ROG Griffin G703GI-E5048T	\N	4.7	319.0	425.0	51.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	144	17	16/9	\N	t	t	2018-07-05 16:08:21.752578	2018-07-05 16:08:21.762222	1382
8099	1314	1567	1396	2	1	https://media.ldlc.com/ld/products/00/04/90/22/LD0004902219_2.jpg	\N	ASUS ROG Griffin G703GS-E5036T	\N	4.7	319.0	425.0	51.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	144	17	16/9	\N	t	t	2018-07-05 16:08:22.268698	2018-07-05 16:08:22.280448	1382
8100	1314	1569	1291	2	1	https://media.ldlc.com/ld/products/00/04/82/36/LD0004823622_2.jpg	\N	ASUS ROG Griffin-E5092T	\N	4.7	319.0	425.0	51.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	144	17	16/9	\N	t	t	2018-07-05 16:08:22.782233	2018-07-05 16:08:22.793471	1382
8101	1315	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/83/45/LD0004834544_2.jpg	\N	ASUS ROG Station 15 GL503VD-FY036R	\N	2.2	262.0	384.0	23.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:23.340496	2018-07-05 16:08:23.352587	1382
8102	1315	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/76/77/LD0004767768_2.jpg	\N	ASUS ROG Station 17 GL703VD-GC068R	\N	2.93	280.0	418.0	25.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:23.877524	2018-07-05 16:08:23.889144	1382
8103	1314	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/90/08/LD0004900816_2.jpg	\N	ASUS ROG Station GL703GM-EE056R	\N	2.95	280.0	415.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:08:24.417792	2018-07-05 16:08:24.42996	1382
8104	1315	1567	1304	1	1	https://media.ldlc.com/ld/products/00/04/91/46/LD0004914626_2.jpg	\N	ASUS ROG Station PX504GD-EN142R	\N	2.2	262.0	384.0	25.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:08:25.030349	2018-07-05 16:08:25.04368	1382
8105	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/46/10/LD0004461020_2_0004550227.jpg	\N	ASUS ROG STRIX GL502VM-FY534T	\N	2.24	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:25.572541	2018-07-05 16:08:25.585484	1382
8106	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/46/10/LD0004461020_2.jpg	\N	ASUS ROG STRIX GL502VM-GZ580T	\N	2.24	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:08:26.071055	2018-07-05 16:08:26.081332	1382
8107	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/04/46/10/LD0004461020_2_0004462611_0004462866.jpg	\N	ASUS ROG STRIX GL502VS-GZ227T	\N	2.24	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:08:26.611805	2018-07-05 16:08:26.624469	1382
8108	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/04/46/10/LD0004461020_2_0004462611.jpg	\N	ASUS ROG STRIX GL502VS-GZ422T	\N	2.24	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:08:27.157484	2018-07-05 16:08:27.16677	1382
8109	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/04/46/10/LD0004461020_2_0004462611_0004462866_0004462906.jpg	\N	ASUS ROG STRIX GL502VS-GZ423T	\N	2.24	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:08:27.686519	2018-07-05 16:08:27.697408	1382
8110	1314	1567	1405	1	1	https://media.ldlc.com/ld/products/00/04/83/45/LD0004834514_2_0004890960.jpg	\N	ASUS ROG STRIX GL503GE-EN040T	\N	2.6	262.0	384.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:08:28.239378	2018-07-05 16:08:28.250054	1382
8111	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/83/44/LD0004834483_2.jpg	\N	ASUS ROG STRIX GL503VD-FY005T	\N	2.3	262.0	384.0	23.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:28.769299	2018-07-05 16:08:28.780634	1382
8112	1314	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/66/54/LD0004665461_2.jpg	\N	ASUS ROG STRIX GL553VD-DM067T	\N	2.5	255.0	383.0	30.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:29.291211	2018-07-05 16:08:29.301342	1382
8113	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/66/54/LD0004665436_2.jpg	\N	ASUS ROG STRIX GL553VD-DM287T	\N	2.5	255.0	383.0	30.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:29.810737	2018-07-05 16:08:29.81966	1382
8114	1314	1654	1297	2	1	https://media.ldlc.com/ld/products/00/04/67/68/LD0004676871_2.jpg	\N	ASUS ROG Strix GL702ZC-GC201T	\N	3.2	280.0	415.0	34.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:30.354805	2018-07-05 16:08:30.368493	1382
8115	1314	1567	1405	1	1	https://media.ldlc.com/ld/products/00/04/83/48/LD0004834879_2_0004890439.jpg	\N	ASUS ROG STRIX GL703GE-GC024T	\N	3.05	280.0	415.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:30.888384	2018-07-05 16:08:30.896898	1382
8116	1314	1567	1405	1	1	https://media.ldlc.com/ld/products/00/04/83/48/LD0004834879_2_0004890439_0004890809.jpg	\N	ASUS ROG STRIX GL703GE-GC036T	\N	3.05	280.0	415.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:31.452247	2018-07-05 16:08:31.463405	1382
8117	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/83/48/LD0004834879_2.jpg	\N	ASUS ROG STRIX GL703VM-GC105T	\N	2.73	280.0	418.0	25.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:31.978143	2018-07-05 16:08:31.98924	1382
8118	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/11/57/LD0004115726_2_0004155681_0004329063_0004463856.jpg	\N	ASUS ROG STRIX GL753VD-GC197T	\N	3.0	273.0	415.0	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:33.54021	2018-07-05 16:08:33.548742	1382
8119	1314	1562	1405	1	1	https://media.ldlc.com/ld/products/00/04/11/57/LD0004115726_2_0004155681_0004331071.jpg	\N	ASUS ROG STRIX GL753VE-GC018T	\N	3.0	273.0	415.0	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:34.063492	2018-07-05 16:08:34.075802	1382
8120	1314	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/83/45/LD0004834514_2.jpg	\N	ASUS ROG STRIX HERO Edition GL503VD-GZ149T	\N	2.3	262.0	385.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:08:34.600814	2018-07-05 16:08:34.612404	1382
8121	1314	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/94/69/LD0004946945_2.jpg	\N	ASUS ROG Strix Hero II GL504GM-ES171T	\N	2.4	262.0	361.0	26.1	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	144	15	16/9	\N	t	t	2018-07-05 16:08:35.09801	2018-07-05 16:08:35.108588	1382
8122	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/83/45/LD0004834569_2.jpg	\N	ASUS ROG STRIX SCAR Edition GL503VM-ED033T	\N	2.3	262.0	385.0	25.7	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:08:36.591011	2018-07-05 16:08:36.602622	1382
8123	1314	1567	1291	2	1	https://media.ldlc.com/ld/products/00/04/68/64/LD0004686426_2_0004793414.jpg	\N	ASUS ROG Zephyrus GX501GI-EI008T	\N	2.24	262.0	379.0	17.9	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	144	15	16/9	\N	t	t	2018-07-05 16:08:38.073264	2018-07-05 16:08:38.088155	1382
8124	1314	1567	1291	2	1	https://media.ldlc.com/ld/products/00/04/68/64/LD0004686426_2_0004793414_0004889788.jpg	\N	ASUS ROG Zephyrus GX501GI-EI022T	\N	2.24	262.0	379.0	17.9	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	144	15	16/9	\N	t	t	2018-07-05 16:08:38.586459	2018-07-05 16:08:38.597828	1382
8125	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/04/83/50/LD0004835069_2.jpg	\N	ASUS ROG Zephyrus GX501VS-GZ024T	\N	2.24	262.0	379.0	17.8	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:08:39.085631	2018-07-05 16:08:39.095139	1382
8126	1314	1567	1396	2	1	https://media.ldlc.com/ld/products/00/04/89/96/LD0004899663_2.jpg	\N	ASUS ROG Zephyrus M GM501GS-EI005T	\N	2.45	262.0	384.0	19.9	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	144	15	16/9	\N	t	t	2018-07-05 16:08:39.61154	2018-07-05 16:08:39.619949	1382
8127	1314	1933	1533	3	1	https://media.ldlc.com/ld/products/00/03/25/68/LD0003256807_2.jpg	\N	ASUS Transformer Book T100HA-FU029T	\N	1.0	175.0	265.0	18.4	\N	\N	\N	AZERTY	f	f	LED tactile	1280 x 800 pixels	\N	10	16/10	\N	t	t	2018-07-05 16:08:40.108701	2018-07-05 16:08:40.12025	1382
8128	1314	1932	1533	3	1	https://media.ldlc.com/ld/products/00/03/80/54/LD0003805482_2_0003805566.jpg	\N	ASUS Transformer Book T101HA-GR004T Gris avec clavier	\N	1.04	175.0	261.0	19.0	\N	\N	\N	AZERTY	f	f	LED tactile	1280 x 800 pixels	60	10	16/10	\N	t	t	2018-07-05 16:08:40.620996	2018-07-05 16:08:40.632449	1382
8129	1314	1932	1533	3	1	https://media.ldlc.com/ld/products/00/03/80/54/LD0003805482_2.jpg	\N	ASUS Transformer Book T101HA-GR005T Gris avec clavier	\N	1.04	175.0	261.0	19.0	\N	\N	\N	AZERTY	f	f	LED tactile	1280 x 800 pixels	60	10	16/10	\N	t	t	2018-07-05 16:08:41.109347	2018-07-05 16:08:41.118958	1382
8130	1315	1932	1533	3	1	https://media.ldlc.com/ld/products/00/03/99/16/LD0003991642_2_0004428901.jpg	\N	ASUS Transformer Book T101HA-GR029RB Gris avec clavier	\N	1.04	175.0	261.0	19.0	\N	\N	\N	AZERTY	f	f	LED tactile	1280 x 800 pixels	60	10	16/10	\N	t	t	2018-07-05 16:08:41.619297	2018-07-05 16:08:41.632087	1382
8131	1315	1932	1533	3	1	https://media.ldlc.com/ld/products/00/03/99/16/LD0003991642_2_0004428901_0004532339.jpg	\N	ASUS Transformer Book T101HA-GR030RB Gris avec clavier	\N	1.04	175.0	261.0	19.0	\N	\N	\N	AZERTY	f	f	LED tactile	1280 x 800 pixels	60	10	16/10	\N	t	t	2018-07-05 16:08:42.165769	2018-07-05 16:08:42.178558	1382
8132	1314	1932	1533	3	1	https://media.ldlc.com/ld/products/00/03/99/16/LD0003991642_2_0004584478.jpg	\N	ASUS Transformer Book T101HA-GR041T Gris avec clavier	\N	1.08	175.0	261.0	19.0	\N	\N	\N	AZERTY	f	f	LED tactile	1280 x 800 pixels	60	10	16/10	\N	t	t	2018-07-05 16:08:42.904666	2018-07-05 16:08:42.917542	1382
8133	1315	1932	1533	3	1	https://media.ldlc.com/ld/products/00/04/73/01/LD0004730122_2.jpg	\N	ASUS Transformer Mini T103HAF-GR025R Gris avec clavier	\N	0.87	173.0	262.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1280 x 800 pixels	60	10	16/10	\N	t	t	2018-07-05 16:08:43.414901	2018-07-05 16:08:43.431926	1382
8134	1314	1910	1480	3	1	https://media.ldlc.com/ld/products/00/04/60/82/LD0004608241_2.jpg	\N	ASUS VivoBook 14 X405UA-BM519T	\N	1.42	226.0	326.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:43.937103	2018-07-05 16:08:43.945829	1382
8135	1317	1442	1489	3	1	https://media.ldlc.com/ld/products/00/04/60/14/LD0004601400_2.jpg	\N	ASUS VivoBook E12 E203NA-FD026T	\N	0.98	193.0	286.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	11	16/9	\N	t	t	2018-07-05 16:08:44.46544	2018-07-05 16:08:44.474076	1382
8136	1317	1442	1489	3	1	https://media.ldlc.com/ld/products/00/04/60/14/LD0004601400_2_0004603306_0004724492.jpg	\N	ASUS VivoBook E12 E203NA-FD084T	\N	0.98	193.0	286.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	11	16/9	\N	t	t	2018-07-05 16:08:44.978641	2018-07-05 16:08:44.988387	1382
8137	1	1932	1533	3	1	https://media.ldlc.com/ld/products/00/04/34/56/LD0004345616_2.jpg	\N	ASUS Vivobook E200HA-FD0041TS	\N	0.98	193.0	286.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	11	16/9	\N	t	t	2018-07-05 16:08:45.446365	2018-07-05 16:08:45.455572	1382
8138	1317	1594	1379	3	1	https://media.ldlc.com/ld/products/00/03/16/50/LD0003165020_2_0004609097.jpg	\N	ASUS VivoBook E403NA-FA049T	\N	1.5	235.0	339.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:45.987441	2018-07-05 16:08:45.999839	1382
8139	1314	1594	1379	3	1	https://media.ldlc.com/ld/products/00/04/84/50/LD0004845070_2.jpg	\N	ASUS VivoBook E502NA-GO108T	\N	1.86	258.0	383.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:46.480209	2018-07-05 16:08:46.492176	1382
8140	1314	1442	1489	3	1	https://media.ldlc.com/ld/products/00/04/47/79/LD0004477964_2.jpg	\N	ASUS Vivobook Flip 12 TP203NA-BP027T Gris	\N	1.1	198.0	293.0	17.2	\N	\N	\N	AZERTY	f	f	LED tactile	1366 x 768 pixels	60	11	16/9	\N	t	t	2018-07-05 16:08:46.954855	2018-07-05 16:08:46.966008	1382
8141	1317	1442	1489	3	1	https://media.ldlc.com/ld/products/00/04/72/45/LD0004724569_2.jpg	\N	ASUS Vivobook Flip J401NA-BZ060TS	\N	1.5	226.0	327.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:47.460489	2018-07-05 16:08:47.478304	1382
8142	1314	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/55/30/LD0004553089_2.jpg	\N	ASUS VivoBook Flip TP410UA-EC229T	\N	1.5	226.0	327.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:48.060313	2018-07-05 16:08:48.072474	1382
8143	1314	1841	1359	3	1	https://media.ldlc.com/ld/products/00/04/55/30/LD0004553089_2_0004616222.jpg	\N	ASUS VivoBook Flip TP410UA-EC380T	\N	1.5	226.0	327.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:48.557911	2018-07-05 16:08:48.568745	1382
8144	1315	1567	1304	1	1	https://media.ldlc.com/ld/products/00/04/91/52/LD0004915279_2.jpg	\N	ASUS VivoBook Pro 15 NX580GD-FI050R	\N	2.3	256.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:49.060451	2018-07-05 16:08:49.070059	1382
8145	1315	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/76/09/LD0004760956_2.jpg	\N	ASUS VivoBook Pro 15 NX580VD-FI667R	\N	2.3	256.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:49.571728	2018-07-05 16:08:49.580362	1382
8146	1314	1567	1304	1	1	https://media.ldlc.com/ld/products/00/04/38/12/LD0004381285_2_0004519045_0004616463_0004879324.jpg	\N	ASUS VivoBook Pro N580GD-DM078T	\N	1.99	256.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:50.069648	2018-07-05 16:08:50.07831	1382
8147	1314	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/38/12/LD0004381285_2_0004519045_0004616463.jpg	\N	ASUS VivoBook Pro N580VD-FJ693T	\N	2.29	256.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED tactile	3840 x 2160 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:50.595646	2018-07-05 16:08:50.607776	1382
8148	1314	1841	1304	1	1	https://media.ldlc.com/ld/products/00/04/53/91/LD0004539121_2_0004599605_0004611391.jpg	\N	ASUS VivoBook Pro N705UD-GC124T	\N	2.1	270.0	411.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:51.095851	2018-07-05 16:08:51.104366	1382
8149	1314	1841	1436	3	1	https://media.ldlc.com/ld/products/00/04/53/91/LD0004539121_2_0004599605_0004611391_0004873393_0004873785.jpg	\N	ASUS VivoBook Pro N705UF-GC007T	\N	2.1	270.0	411.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:51.621903	2018-07-05 16:08:51.632368	1382
8150	1314	1893	1436	3	1	https://media.ldlc.com/ld/products/00/04/53/91/LD0004539121_2_0004599605_0004611391_0004873393.jpg	\N	ASUS VivoBook Pro N705UF-GC009T	\N	2.1	270.0	411.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:52.161804	2018-07-05 16:08:52.174985	1382
8151	1314	1841	1314	1	1	https://media.ldlc.com/ld/products/00/04/53/91/LD0004539121_2_0004599605_0004713193.jpg	\N	ASUS VivoBook Pro N705UN-GC129T	\N	2.1	270.0	411.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:52.66343	2018-07-05 16:08:52.673917	1382
8152	1315	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/53/91/LD0004539121_2_0004599605_0004611391_0004611596_0004877113.jpg	\N	ASUS VivoBook Pro N705UN-GC137R	\N	2.2	270.0	411.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:53.200099	2018-07-05 16:08:53.212499	1382
8153	1314	1841	1334	3	1	https://media.ldlc.com/ld/products/00/04/53/91/LD0004539121_2_0004599605_0004611391_0004611596.jpg	\N	ASUS VivoBook Pro N705UQ-GC141T	\N	2.1	270.0	411.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:08:53.780834	2018-07-05 16:08:53.789605	1382
8154	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/86/97/LD0004869772_2_0004946915.jpg	\N	ASUS VivoBook R507UA-EJ396T	\N	1.68	266.0	365.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:08:54.336968	2018-07-05 16:08:54.345919	1382
8155	1314	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/61/88/LD0004618817_2_0004619569_0004718877.jpg	\N	ASUS Vivobook S14 S406UA-BM176T	\N	1.2	226.0	328.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:54.888366	2018-07-05 16:08:54.900591	1382
8156	1314	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/61/88/LD0004618817_2_0004619569_0004718877_0004719217.jpg	\N	ASUS Vivobook S14 S406UA-BM240T	\N	1.2	226.0	328.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:55.396834	2018-07-05 16:08:55.408962	1382
8157	1314	1841	1359	3	1	https://media.ldlc.com/ld/products/00/04/65/69/LD0004656948_2.jpg	\N	ASUS Vivobook S14 S410UA-EB063T	\N	1.43	226.0	326.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:55.955448	2018-07-05 16:08:55.96708	1382
8158	1314	1841	1359	3	1	https://media.ldlc.com/ld/products/00/04/65/69/LD0004656923_2.jpg	\N	ASUS Vivobook S14 S410UA-EB145T	\N	1.43	226.0	326.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:56.509795	2018-07-05 16:08:56.533705	1382
8159	1314	1841	1436	3	1	https://media.ldlc.com/ld/products/00/04/65/69/LD0004656923_2_0004719772.jpg	\N	ASUS Vivobook S14 S410UF-EB004T	\N	1.43	226.0	326.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:57.057843	2018-07-05 16:08:57.067973	1382
8160	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/65/67/LD0004656748_2.jpg	\N	ASUS Vivobook S14 S410UN-EB078T	\N	1.43	226.0	326.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:57.585322	2018-07-05 16:08:57.597137	1382
8161	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/65/67/LD0004656773_2.jpg	\N	ASUS Vivobook S14 S410UN-EB079T	\N	1.43	226.0	326.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:58.079089	2018-07-05 16:08:58.09022	1382
8162	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/65/67/LD0004656798_2.jpg	\N	ASUS Vivobook S14 S410UN-EB080T	\N	1.43	226.0	326.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:08:59.556893	2018-07-05 16:08:59.566195	1382
8163	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/65/67/LD0004656773_2_0004718502.jpg	\N	ASUS Vivobook S14 S410UN-EB226T	\N	1.43	226.0	326.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:00.09046	2018-07-05 16:09:00.102103	1382
8164	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/65/67/LD0004656773_2_0004718323.jpg	\N	ASUS Vivobook S14 S410UN-EB227T	\N	1.43	226.0	326.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:00.605555	2018-07-05 16:09:00.617744	1382
8165	1314	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/74/36/LD0004743695_2.jpg	\N	ASUS Vivobook S15 S501UA-BR709T	\N	1.7	243.0	361.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:01.071181	2018-07-05 16:09:01.079609	1382
8166	1314	1841	1436	3	1	https://media.ldlc.com/ld/products/00/04/71/52/LD0004715284_2.jpg	\N	ASUS Vivobook S15 S510UF-BQ050T	\N	1.7	243.0	361.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:01.596116	2018-07-05 16:09:01.608169	1382
8167	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/42/71/LD0004427166_2_0004565310.jpg	\N	ASUS Vivobook S15 S510UN-BQ090T	\N	2.0	243.0	361.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:02.102217	2018-07-05 16:09:02.112869	1382
8168	1314	1841	1314	1	1	https://media.ldlc.com/ld/products/00/04/42/71/LD0004427166_2_0004565310_0004617062_0004617136.jpg	\N	ASUS Vivobook S15 S510UN-BQ183T	\N	2.0	243.0	361.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:02.653326	2018-07-05 16:09:02.665185	1382
8169	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/42/71/LD0004427166_2_0004565310_0004617062.jpg	\N	ASUS Vivobook S15 S510UN-BQ184T	\N	2.0	243.0	361.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:03.23161	2018-07-05 16:09:03.242238	1382
8170	1314	1841	1314	1	1	https://media.ldlc.com/ld/products/00/04/42/71/LD0004427166_2_0004565310_0004617062_0004617136_0004617286.jpg	\N	ASUS Vivobook S15 S510UN-BQ187T	\N	2.0	243.0	361.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:03.733522	2018-07-05 16:09:03.745993	1382
8171	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/42/71/LD0004427166_2_0004565310_0004902458.jpg	\N	ASUS Vivobook S15 S510UN-BQ388T	\N	1.7	243.0	361.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:04.229549	2018-07-05 16:09:04.242154	1382
8172	1314	1910	1480	3	1	https://media.ldlc.com/ld/products/00/04/61/01/LD0004610196_2_0004719877_0004872837.jpg	\N	ASUS VivoBook S405UA-BV876T	\N	1.42	226.0	326.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:04.770397	2018-07-05 16:09:04.7821	1382
8173	1314	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/61/01/LD0004610196_2_0004719877.jpg	\N	ASUS VivoBook S405UA-EB654T	\N	1.42	226.0	326.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:05.280219	2018-07-05 16:09:05.290107	1382
8174	1314	1714	1530	3	1	https://media.ldlc.com/ld/products/00/04/61/04/LD0004610424_2.jpg	\N	ASUS Vivobook S505BA-BR016T	\N	1.7	244.0	361.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:05.808552	2018-07-05 16:09:05.823184	1382
8175	1314	1714	1539	3	1	https://media.ldlc.com/ld/products/00/04/61/04/LD0004610424_2_0004610453.jpg	\N	ASUS Vivobook S505BP-BR057T	\N	1.7	244.0	361.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:06.343031	2018-07-05 16:09:06.354103	1382
8176	1314	1374	1530	3	1	https://media.ldlc.com/ld/products/00/04/72/35/LD0004723592_2.jpg	\N	ASUS X441BA-FA052T	\N	1.75	242.0	348.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:06.936843	2018-07-05 16:09:06.945259	1382
8177	1314	1462	1372	3	1	https://media.ldlc.com/ld/products/00/04/63/50/LD0004635046_2.jpg	\N	ASUS X540LA-DM1052T	\N	2.0	252.0	381.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:07.607322	2018-07-05 16:09:07.6179	1382
8178	1314	1594	1379	3	1	https://media.ldlc.com/ld/products/00/04/51/27/LD0004512726_2_0004635322.jpg	\N	ASUS X541NA-GO526T	\N	2.0	252.0	381.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:08.09052	2018-07-05 16:09:08.105289	1382
8179	1314	1714	1530	3	1	https://media.ldlc.com/ld/products/00/04/53/94/LD0004539440_2.jpg	\N	ASUS X555BA-DM155T	\N	2.03	256.0	382.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:08.614429	2018-07-05 16:09:08.62676	1382
8180	1314	1921	1448	3	1	https://media.ldlc.com/ld/products/00/04/32/97/LD0004329790_2.jpg	\N	ASUS X751SV-TY002T Blanc	\N	2.8	272.0	415.0	35.5	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:09:09.386626	2018-07-05 16:09:09.400421	1382
8181	1315	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/68/18/LD0004681874_2.jpg	\N	ASUS Zenbook 13 UX331UA-EG011R	\N	1.2	216.0	310.0	13.9	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:09.909854	2018-07-05 16:09:09.921968	1382
8182	1315	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/68/18/LD0004681874_2_0004779739.jpg	\N	ASUS Zenbook 13 UX331UA-EG011RB	\N	1.2	216.0	310.0	13.9	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:10.424702	2018-07-05 16:09:10.437138	1382
8183	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/68/18/LD0004681874_2_0004682202.jpg	\N	ASUS Zenbook 13 UX331UA-EG012R	\N	1.2	216.0	310.0	13.9	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:10.998886	2018-07-05 16:09:11.009494	1382
8184	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/68/18/LD0004681874_2_0004761348.jpg	\N	ASUS Zenbook 13 UX331UA-EG012RB	\N	1.2	216.0	310.0	13.9	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:11.511689	2018-07-05 16:09:11.523252	1382
8185	1314	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/63/53/LD0004635383_2_0004636288_0004636451_0004636692.jpg	\N	ASUS Zenbook 13 UX331UA-EG013T	\N	1.12	216.0	310.0	13.9	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:12.094641	2018-07-05 16:09:12.104422	1382
8186	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/63/53/LD0004635383_2.jpg	\N	ASUS Zenbook 13 UX331UN-EG036T	\N	1.2	216.0	310.0	13.9	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:12.607755	2018-07-05 16:09:12.616582	1382
8187	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/63/53/LD0004635383_2_0004636288_0004636451.jpg	\N	ASUS Zenbook 13 UX331UN-EG037T	\N	1.2	216.0	310.0	13.9	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:13.182555	2018-07-05 16:09:13.19755	1382
8188	1314	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/77/75/LD0004777553_2.jpg	\N	ASUS Zenbook 3 3U-GS124T	\N	0.95	191.0	296.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	12	16/9	\N	t	t	2018-07-05 16:09:13.775462	2018-07-05 16:09:13.785065	1382
8189	1314	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/64/69/LD0004646980_2.jpg	\N	ASUS Zenbook Flip 14 UX461UA-E1010T	\N	1.4	226.0	327.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:14.282523	2018-07-05 16:09:14.291524	1382
8466	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/04/12/47/LD0004124748_2_0004142667_0004142987_0004729215.jpg	\N	MSI GS73VR 7RG-088FR Stealth Pro	\N	2.43	284.9	411.8	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:15.229574	2018-07-05 16:12:15.241964	1387
8467	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/03/80/31/LD0003803152_2_0004109798_0004110470.jpg	\N	MSI GT62VR 7RE-264FR Dominator Pro	\N	2.94	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:15.750474	2018-07-05 16:12:15.759455	1387
8468	1314	1567	1396	2	1	https://media.ldlc.com/ld/products/00/04/90/40/LD0004904003_2.jpg	\N	MSI GT63 8RF-021FR Titan	\N	2.94	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:12:16.279859	2018-07-05 16:12:16.289451	1387
8469	1314	1567	1291	2	1	https://media.ldlc.com/ld/products/00/04/90/40/LD0004904003_2_0004904235.jpg	\N	MSI GT63 8RG-049FR Titan	\N	2.94	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:16.809476	2018-07-05 16:12:16.821945	1387
8470	1	1562	1296	2	1	https://media.ldlc.com/ld/products/00/03/80/37/LD0003803788_2_0003803842_0004110620_0004111045_0004111360_0004111461_0004440954_0004442094_0004442334.jpg	\N	MSI GT73EVR 7RD-829XFR Titan	\N	4.14	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:17.354666	2018-07-05 16:12:17.367118	1387
8471	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/03/80/37/LD0003803788_2_0003803842_0004110620_0004111045_0004111360_0004111461_0004440954.jpg	\N	MSI GT73EVR 7RE-827FR Titan	\N	4.14	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:17.915566	2018-07-05 16:12:17.928482	1387
8472	1314	1557	1546	3	1	https://media.ldlc.com/ld/products/00/03/80/28/LD0003802829_2.jpg	\N	MSI GT73VR 6RE-073FR Titan SLI 4K	\N	3.9	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:18.463903	2018-07-05 16:12:18.472898	1387
8473	1314	1891	1546	3	1	https://media.ldlc.com/ld/products/00/03/80/37/LD0003803788_2_0003803842_0004110620_0004111295.jpg	\N	MSI GT73VR 7RE-486FR Titan SLI 4K	\N	4.14	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:19.005648	2018-07-05 16:12:19.020461	1387
8190	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/64/69/LD0004646980_2_0004647742_0004735715_0004735958.jpg	\N	ASUS Zenbook Flip 14 UX461UA-E1012RB	\N	1.5	226.0	327.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:14.802736	2018-07-05 16:09:14.813738	1382
8191	1315	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/64/69/LD0004646980_2_0004647742_0004735715.jpg	\N	ASUS Zenbook Flip 14 UX461UA-E1017R	\N	1.5	226.0	327.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:15.306129	2018-07-05 16:09:15.316361	1382
8192	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/64/69/LD0004646980_2_0004647742.jpg	\N	ASUS Zenbook Flip 14 UX461UN-E1035T	\N	1.5	226.0	327.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:15.805347	2018-07-05 16:09:15.814098	1382
8193	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/73/61/LD0004736187_2.jpg	\N	ASUS Zenbook Flip 15 UX561UA-BO020RB	\N	1.9	246.0	364.0	\N	\N	\N	\N	AZERTY	t	t	LED tactile	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:16.310015	2018-07-05 16:09:16.323237	1382
8194	1315	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/73/61/LD0004736187_2_0004736907_0004737061.jpg	\N	ASUS Zenbook Flip 15 UX561UA-BO021R	\N	1.9	246.0	364.0	\N	\N	\N	\N	AZERTY	t	t	LED tactile	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:16.824182	2018-07-05 16:09:16.841801	1382
8195	1315	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/73/61/LD0004736187_2_0004736907_0004737061_0004737498.jpg	\N	ASUS Zenbook Flip 15 UX561UA-BO021RB	\N	1.9	246.0	364.0	\N	\N	\N	\N	AZERTY	t	t	LED tactile	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:17.322122	2018-07-05 16:09:17.331177	1382
8196	1314	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/52/55/LD0004525511_2.jpg	\N	ASUS Zenbook Flip 58256-B	\N	1.1	211.0	311.0	11.2	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	\N	13	16/9	\N	t	t	2018-07-05 16:09:17.853777	2018-07-05 16:09:17.866251	1382
8197	1314	1893	1359	3	1	https://media.ldlc.com/ld/products/00/04/74/43/LD0004744327_2.jpg	\N	ASUS Zenbook Flip S U7R16512-B Bleu	\N	1.1	211.0	311.0	11.2	\N	\N	\N	AZERTY	f	t	LED tactile	3840 x 2160 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:18.379404	2018-07-05 16:09:18.3903	1382
8198	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/53/29/LD0004532916_2_0004666963_0004735449.jpg	\N	ASUS Zenbook Flip S UX370UA-C4198R	\N	1.1	218.0	313.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:19.856159	2018-07-05 16:09:19.864692	1382
8199	1315	1893	1359	3	1	https://media.ldlc.com/ld/products/00/04/53/29/LD0004532916_2_0004666963.jpg	\N	ASUS Zenbook Flip S UX370UA-C4237R	\N	1.1	218.0	313.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:20.397531	2018-07-05 16:09:20.406591	1382
8200	1315	1893	1359	3	1	https://media.ldlc.com/ld/products/00/04/53/29/LD0004532916_2_0004666963_0004735449_0004735540.jpg	\N	ASUS Zenbook Flip S UX370UA-C4237RB	\N	1.1	218.0	313.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:20.918019	2018-07-05 16:09:20.930166	1382
8201	1315	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/61/38/LD0004613850_2_0004615572_0004711890_0004770889.jpg	\N	ASUS Zenbook Pro UX550VD-BN022R	\N	1.8	251.0	367.0	18.9	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:21.462768	2018-07-05 16:09:21.473022	1382
8202	1315	1567	1304	1	1	https://media.ldlc.com/ld/products/00/04/93/97/LD0004939748_2.jpg	\N	ASUS Zenbook Pro UX550VD-BO005R	\N	2.0	251.0	367.0	18.9	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:21.939241	2018-07-05 16:09:21.950114	1382
8203	1315	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/61/38/LD0004613850_2_0004615572_0004711890_0004767797.jpg	\N	ASUS Zenbook Pro UX550VD-BO098RB	\N	1.8	251.0	367.0	18.9	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:22.48959	2018-07-05 16:09:22.502251	1382
8204	1314	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/61/38/LD0004613850_2.jpg	\N	ASUS Zenbook Pro UX550VD-E3156T	\N	1.8	251.0	367.0	18.9	\N	\N	\N	AZERTY	f	t	LED	3840 x 2160 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:22.99834	2018-07-05 16:09:23.007129	1382
8205	1314	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/60/39/LD0004603918_2.jpg	\N	ASUS ZenBook Pro-14-78256	\N	1.05	216.0	321.0	1.5	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	\N	t	2018-07-05 16:09:23.558198	2018-07-05 16:09:23.571592	1382
8206	1314	1504	1359	3	1	https://media.ldlc.com/ld/products/00/03/82/66/LD0003826685_2_0004060428_0004060658_0004125339_0004143317_0004327110.jpg	\N	ASUS Zenbook UX310UA-GL437T Gris	\N	1.45	223.0	323.0	19.0	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:24.071965	2018-07-05 16:09:24.089772	1382
8207	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/01/63/LD0004016359_2.jpg	\N	ASUS Zenbook UX330UA-FB136R	\N	1.2	221.0	323.0	\N	\N	\N	\N	AZERTY	f	t	LED	3200 x 1800 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:24.633947	2018-07-05 16:09:24.646733	1382
8208	1315	1841	1359	3	1	https://media.ldlc.com/ld/products/00/04/04/64/LD0004046421_2_0004150869_0004326421_0004347236_0004355261_0004732524.jpg	\N	ASUS Zenbook UX410UA-GV351R	\N	1.4	223.0	323.0	19.0	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:25.138099	2018-07-05 16:09:25.150552	1382
8209	1315	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/04/64/LD0004046421_2_0004150869_0004326421_0004347236_0004355261_0004732524_0004771125.jpg	\N	ASUS Zenbook UX410UA-GV352R	\N	1.4	223.0	323.0	19.0	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:25.668212	2018-07-05 16:09:25.679347	1382
8210	1314	1893	1436	3	1	https://media.ldlc.com/ld/products/00/04/04/64/LD0004046421_2_0004150869_0004326421_0004718637_0004847411.jpg	\N	ASUS Zenbook UX410UF-GV028T	\N	1.4	223.0	323.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:26.170988	2018-07-05 16:09:26.185767	1382
8211	1314	1893	1436	3	1	https://media.ldlc.com/ld/products/00/04/04/64/LD0004046421_2_0004150869_0004326421_0004718637.jpg	\N	ASUS Zenbook UX410UF-GV046T	\N	1.4	223.0	323.0	19.0	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:26.712696	2018-07-05 16:09:26.72375	1382
8212	1314	1841	1314	1	1	https://media.ldlc.com/ld/products/00/04/61/81/LD0004618185_2_0004848911.jpg	\N	ASUS Zenbook UX430UN-GV033T	\N	1.3	225.0	324.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:27.228088	2018-07-05 16:09:27.237198	1382
8213	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/61/81/LD0004618185_2.jpg	\N	ASUS Zenbook UX430UN-GV103T	\N	1.3	225.0	324.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:27.726352	2018-07-05 16:09:27.735069	1382
8214	1314	1559	1334	3	1	https://media.ldlc.com/ld/products/00/04/51/95/LD0004519576_2.jpg	\N	ASUS Zenbook UX430UQ-GV154T	\N	1.3	225.0	324.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:28.279323	2018-07-05 16:09:28.288785	1382
8215	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/74/44/LD0004744479_2.jpg	\N	ASUS Zenbook+N-GRIS-7R8256	\N	1.3	225.0	324.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:28.810367	2018-07-05 16:09:28.819452	1382
8216	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/15/95/LD0004159526_2_0004363863_0004740201.jpg	\N	ASUS B9440UA 90NX0151-M02370	\N	1.05	216.2	321.3	15.0	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	\N	t	2018-07-05 16:09:29.310039	2018-07-05 16:09:29.321705	1382
8217	1314	1553	1448	3	1	https://media.ldlc.com/ld/products/00/03/61/64/LD0003616438_2_0003793588_0004046566_0004048523.jpg	\N	ASUS R558UV-DM345T	\N	2.3	256.0	382.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:29.862112	2018-07-05 16:09:29.871908	1382
8218	1314	1567	1396	2	1	https://media.ldlc.com/ld/products/00/04/68/63/LD0004686376_2_0004825827_0004827813_0004891831.jpg	\N	ASUS ROG SCAR GL703GS-E5045T	\N	2.95	274.0	412.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	144	17	16/9	\N	t	t	2018-07-05 16:09:30.354161	2018-07-05 16:09:30.362505	1382
8219	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/64/69/LD0004646980_2_0004647742_0004735715_0004735958_0004739230.jpg	\N	ASUS Zenbook Flip 14 UX461UA-E1012R	\N	1.5	226.0	327.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:30.852715	2018-07-05 16:09:30.861505	1382
8220	1314	1569	1405	1	1	https://media.ldlc.com/ld/products/00/04/94/29/LD0004942947_2.jpg	\N	ASUS Zenbook Pro 15 UX580GE-E2048T	\N	1.89	251.0	365.0	18.9	\N	\N	\N	AZERTY	f	t	LED tactile	3840 x 2160 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:32.409221	2018-07-05 16:09:32.418077	1382
8221	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/61/81/LD0004618185_2_0004642677_0004749594.jpg	\N	ASUS Zenbook UX430UN-GV031T	\N	1.3	225.0	324.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:32.912841	2018-07-05 16:09:32.922519	1382
8222	1315	1500	1468	3	1	https://media.ldlc.com/ld/products/00/04/94/63/LD0004946317_2.jpg	\N	Fujitsu LIFEBOOK S936 VFY:S9360M3TABFR	\N	1.32	214.0	316.0	\N	\N	\N	\N	AZERTY	t	f	LED tactile	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:34.4	2018-07-05 16:09:34.408557	1391
8223	1315	1567	1405	1	1	https://media.ldlc.com/ld/products/00/04/58/73/LD0004587346_2_0004837488.jpg	\N	Gigabyte Aero 14K v8 B50W10P-FR Noir	\N	1.9	250.0	336.0	\N	\N	\N	\N	AZERTY	f	t	LED	2560 x 1440 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:34.912773	2018-07-05 16:09:34.922408	1383
8224	1315	1567	1405	1	1	https://media.ldlc.com/ld/products/00/04/91/73/LD0004917380_2.jpg	\N	Gigabyte Aero 14K v8 G50W10P-FR Vert	\N	1.9	250.0	336.0	\N	\N	\N	\N	AZERTY	f	t	LED	2560 x 1440 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:35.485541	2018-07-05 16:09:35.493947	1383
8225	1315	1567	1405	1	1	https://media.ldlc.com/ld/products/00/04/91/74/LD0004917430_2.jpg	\N	Gigabyte Aero 14K v8 M50W10P-FR Orange	\N	1.9	250.0	336.0	\N	\N	\N	\N	AZERTY	f	t	LED	2560 x 1440 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:35.980985	2018-07-05 16:09:35.990472	1383
8226	1315	1567	1396	2	1	https://media.ldlc.com/ld/products/00/04/86/43/LD0004864326_2_0004881907.jpg	\N	Gigabyte Aero 15X v8 B4K5W10P-FR	\N	2.0	250.0	356.4	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:36.509519	2018-07-05 16:09:36.522121	1383
8227	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/04/56/95/LD0004569577_2_0004573270.jpg	\N	Gigabyte P56XT v7 C52W10-FR	\N	2.6	270.0	382.8	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:37.055075	2018-07-05 16:09:37.06738	1383
8228	1315	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/29/58/LD0004295849_2_0004575724.jpg	\N	Gigabyte Sabre 15 - P45G V7 C3W10Pro-FR	\N	2.5	267.0	378.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:37.854155	2018-07-05 16:09:37.867961	1383
8229	1	1567	1304	1	1	https://media.ldlc.com/ld/products/00/04/92/88/LD0004928850_2.jpg	\N	Gigabyte Sabre 15 - P45G v8 C30D-FR	\N	2.3	267.0	378.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:38.37889	2018-07-05 16:09:38.392376	1383
8230	1314	1567	1304	1	1	https://media.ldlc.com/ld/products/00/04/92/88/LD0004928850_2_0004929025_0004929285.jpg	\N	Gigabyte Sabre 15 - P45G v8 C35W10-FR	\N	2.3	267.0	378.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:39.160631	2018-07-05 16:09:39.17253	1383
8231	1315	1567	1304	1	1	https://media.ldlc.com/ld/products/00/04/92/88/LD0004928850_2_0004929025.jpg	\N	Gigabyte Sabre 15 - P45G v8 C3W10PRO-FR	\N	2.3	267.0	378.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:39.688629	2018-07-05 16:09:39.700749	1383
8232	1314	1562	1405	1	1	https://media.ldlc.com/ld/products/00/04/29/62/LD0004296230_2_0004700329.jpg	\N	Gigabyte Sabre 15 - P45K V7 C35W10-FR	\N	2.5	267.0	378.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:40.185939	2018-07-05 16:09:40.20089	1383
8233	1314	1567	1405	1	1	https://media.ldlc.com/ld/products/00/04/92/88/LD0004928850_2_0004929025_0004929285_0004932285.jpg	\N	Gigabyte Sabre 15 - P45K v8 C35W10-FR	\N	2.3	267.0	378.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:40.702662	2018-07-05 16:09:40.717993	1383
8234	1	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/29/62/LD0004296230_2_0004700464_0004700860.jpg	\N	Gigabyte Sabre 15 - P45W v7 C2D-FR	\N	2.5	267.0	378.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:41.225846	2018-07-05 16:09:41.236952	1383
8235	1314	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/92/88/LD0004928850_2_0004929025_0004929285_0004932285_0004932433.jpg	\N	Gigabyte Sabre 15 - P45W v8 C350W10-FR	\N	2.5	267.0	378.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:09:41.758446	2018-07-05 16:09:41.773414	1383
8236	1	1567	1304	1	1	https://media.ldlc.com/ld/products/00/04/90/73/LD0004907389_2_0004907784_0004931294.jpg	\N	Gigabyte Sabre 17 - P47G v8 C30D-FR	\N	2.9	288.7	418.5	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:09:42.274293	2018-07-05 16:09:42.28317	1383
8237	1314	1567	1304	1	1	https://media.ldlc.com/ld/products/00/04/90/73/LD0004907389_2.jpg	\N	Gigabyte Sabre 17 - P47G v8 C35W10-FR	\N	2.9	288.7	418.5	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:09:42.802407	2018-07-05 16:09:42.811968	1383
8238	1315	1567	1304	1	1	https://media.ldlc.com/ld/products/00/04/90/73/LD0004907389_2_0004907784.jpg	\N	Gigabyte Sabre 17 - P47G v8 C3W10Pro-FR	\N	2.9	288.7	418.5	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:09:43.329234	2018-07-05 16:09:43.341909	1383
8239	1314	1567	1405	1	1	https://media.ldlc.com/ld/products/00/04/90/73/LD0004907389_2_0004940368.jpg	\N	Gigabyte Sabre 17 - P47K v8 C35W10-FR	\N	2.9	288.7	418.5	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:09:43.856183	2018-07-05 16:09:43.865138	1383
8240	1314	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/90/73/LD0004907389_2_0004940482.jpg	\N	Gigabyte Sabre 17 - P47W v8 C350W10-FR	\N	2.8	288.7	418.5	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:09:44.376969	2018-07-05 16:09:44.393064	1383
8241	1315	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/84/23/LD0004842338_2.jpg	\N	Gigabyte Aero 15W v8 B544W10P-FR Noir	\N	2.0	250.0	356.4	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	144	15	16/9	\N	t	t	2018-07-05 16:09:44.891055	2018-07-05 16:09:44.905191	1383
8242	1314	1556	1396	2	1	https://media.ldlc.com/ld/products/00/04/30/35/LD0004303571_2.jpg	\N	Gigabyte P37X v6 C4KW10-FR 4K + Bonus Pack OFFERT !	\N	2.8	287.0	417.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:09:45.412559	2018-07-05 16:09:45.425262	1383
8243	1314	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/41/02/LD0004410225_2_0004699842.jpg	\N	Gigabyte Sabre 17 - P47G v7 C35W10-FR	\N	3.1	284.0	418.5	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:09:45.914799	2018-07-05 16:09:45.923416	1383
8244	1314	1921	1538	3	1	https://media.ldlc.com/ld/products/00/04/16/51/LD0004165157_2.jpg	\N	HP 14-am027nf	\N	1.94	241.5	345.4	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:46.409609	2018-07-05 16:09:46.420294	1384
8245	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/45/95/LD0004459564_2.jpg	\N	HP 17-bs051nf	\N	2.71	278.0	415.0	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:09:46.920165	2018-07-05 16:09:46.929817	1384
8246	1315	1462	1372	3	1	https://media.ldlc.com/ld/products/00/04/33/75/LD0004337594_2.jpg	\N	HP 250 G5 W4N09EA	\N	1.96	254.6	384.3	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:47.435749	2018-07-05 16:09:47.444918	1384
8247	1315	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/86/62/LD0004866218_2.jpg	\N	HP 250 G6 1WY65EA	\N	1.86	253.8	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:47.9732	2018-07-05 16:09:47.98575	1384
8248	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/86/62/LD0004866218_2_0004943870.jpg	\N	HP 250 G6 2SX93EA	\N	1.86	253.8	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:48.441771	2018-07-05 16:09:48.453068	1384
8249	1315	1902	1376	3	1	https://media.ldlc.com/ld/products/00/03/48/23/LD0003482372_2_0003562921_0004004288_0004301416.jpg	\N	HP Elite x2 1012 G1 L5H18EA	\N	1.205	213.5	300.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1920 x 1080 pixels	60	12	16/9	\N	t	t	2018-07-05 16:09:48.946908	2018-07-05 16:09:48.956782	1384
8250	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/65/90/LD0004659029_2_0004808974.jpg	\N	HP Elite x2 1012 G2 2TL99EA	\N	1.3	219.7	300.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	2736 x 1824 pixels	\N	12	15/10	\N	t	t	2018-07-05 16:09:49.447016	2018-07-05 16:09:49.46093	1384
8251	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/76/93/LD0004769340_2.jpg	\N	HP EliteBook 1040 G4 1EP76EA	\N	1.36	232.8	328.9	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:49.957071	2018-07-05 16:09:49.96942	1384
8252	1315	1732	1540	3	1	https://media.ldlc.com/ld/products/00/04/67/86/LD0004678618_2.jpg	\N	HP EliteBook 745 G4 1EN93EA	\N	1.48	237.0	338.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:50.457749	2018-07-05 16:09:50.466658	1384
8253	1315	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/86/68/LD0004866860_2_0004867671_0004867939.jpg	\N	HP EliteBook 830 G5 3JW95EA	\N	1.33	229.3	310.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:51.034091	2018-07-05 16:09:51.041925	1384
8254	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/86/68/LD0004866860_2.jpg	\N	HP EliteBook 830 G5 3JX92EA	\N	1.33	229.3	310.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:51.543171	2018-07-05 16:09:51.555186	1384
8255	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/86/68/LD0004866860_2_0004867671.jpg	\N	HP EliteBook 830 G5 3JX93EA	\N	1.33	229.3	310.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:52.080791	2018-07-05 16:09:52.092819	1384
8256	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/86/85/LD0004868573_2_0004869241.jpg	\N	HP EliteBook 840 G5 3JX29EA	\N	1.48	234.0	326.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:52.604855	2018-07-05 16:09:52.614706	1384
8257	1315	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/86/85/LD0004868573_2_0004889949.jpg	\N	HP EliteBook 840 G5 3JX94EA	\N	1.48	234.0	326.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:09:53.094941	2018-07-05 16:09:53.104625	1384
8258	1315	1553	1468	3	1	https://media.ldlc.com/ld/products/00/04/71/64/LD0004716443_2_0004898963.jpg	\N	HP EliteBook 850 G3 T9X71EA	\N	1.88	257.7	383.3	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:53.617792	2018-07-05 16:09:53.630452	1384
8259	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/71/64/LD0004716443_2.jpg	\N	HP EliteBook 850 G4 Z2W86EA	\N	1.84	257.7	383.6	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:54.121253	2018-07-05 16:09:54.129709	1384
8260	1315	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/86/96/LD0004869618_2.jpg	\N	HP EliteBook 850 G5 3JX18EA	\N	1.78	252.0	370.0	\N	\N	\N	\N	AZERTY	t	f	LED	3840 x 2160 pixels	60	15	16/9	\N	t	t	2018-07-05 16:09:54.637993	2018-07-05 16:09:54.652877	1384
8261	1315	1903	1376	3	1	https://media.ldlc.com/ld/products/00/03/81/89/LD0003818964_2_0003819188_0004302633.jpg	\N	HP EliteBook Folio G1 X2F47EA	\N	0.97	209.0	292.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	12	16/9	\N	t	t	2018-07-05 16:09:55.21033	2018-07-05 16:09:55.220875	1384
8262	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/69/15/LD0004691583_2.jpg	\N	HP EliteBook x360 Y8Q89EA	\N	1.28	218.5	316.9	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:55.746799	2018-07-05 16:09:55.760533	1384
8263	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/88/72/LD0004887235_2_0004891098.jpg	\N	HP EliteBook x360 1020 1EM56EA	\N	1.13	203.8	290.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	12	16/9	\N	t	t	2018-07-05 16:09:56.32643	2018-07-05 16:09:56.35835	1384
8264	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/88/72/LD0004887235_2.jpg	\N	HP EliteBook x360 1020 1EP69EA	\N	1.13	203.8	290.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	12	16/9	\N	t	t	2018-07-05 16:09:57.006514	2018-07-05 16:09:57.032547	1384
8265	1314	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/16/26/LD0004162618_2.jpg	\N	HP ENVY 13-ab012nf	\N	1.34	226.0	326.5	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:57.654082	2018-07-05 16:09:57.676723	1384
7781	1314	1891	1291	2	1	https://media.ldlc.com/ld/products/00/04/94/22/LD0004942274_2.jpg	\N	HP Omen X 17-AP006NF	\N	4.85	327.2	425.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:02:28.03779	2018-07-05 16:09:58.205674	1384
8266	1315	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/69/69/LD0004696944_2.jpg	\N	HP ProBook 430 G4 Y7Z31EA	\N	1.49	233.5	330.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:58.7497	2018-07-05 16:09:58.772139	1384
8267	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/68/96/LD0004689619_2_0004864511.jpg	\N	HP ProBook 430 G5 2SY07EA	\N	1.49	234.0	326.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:59.470902	2018-07-05 16:09:59.483408	1384
8268	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/68/96/LD0004689619_2_0004864380.jpg	\N	HP ProBook 430 G5 2VQ27ET	\N	1.49	234.0	326.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:09:59.991157	2018-07-05 16:10:00.01313	1384
8269	1315	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/68/96/LD0004689619_2.jpg	\N	HP ProBook 430 G5 2VQ32EA	\N	1.49	234.0	326.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:10:00.519562	2018-07-05 16:10:00.534321	1384
8270	1315	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/68/04/LD0004680412_2_0004680557_0004680588_0004864689.jpg	\N	HP ProBook 440 G5 3DP47EA	\N	1.63	238.0	336.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:01.053029	2018-07-05 16:10:01.066777	1384
8271	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/68/04/LD0004680412_2_0004680557_0004680588.jpg	\N	HP ProBook 440 G5 Pro 2RS30EA	\N	1.63	238.0	336.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:01.593865	2018-07-05 16:10:01.603843	1384
8272	1315	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/68/04/LD0004680412_2.jpg	\N	HP ProBook 440 G5 Pro 2UB64EA	\N	1.63	238.0	336.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:02.095542	2018-07-05 16:10:02.106187	1384
8273	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/68/04/LD0004680412_2_0004680557.jpg	\N	HP ProBook 440 G5 Pro 2VQ15EA	\N	1.63	238.0	336.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:02.654698	2018-07-05 16:10:02.66753	1384
8274	1315	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/88/81/LD0004888185_2.jpg	\N	HP ProBook 450 G5 2RS18EA	\N	2.1	264.1	376.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:03.189297	2018-07-05 16:10:03.202194	1384
8275	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/88/81/LD0004888185_2_0004888484.jpg	\N	HP ProBook 450 G5 2XY35EA	\N	2.1	264.1	376.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:03.948483	2018-07-05 16:10:03.959574	1384
8276	1315	1893	1336	3	1	https://media.ldlc.com/ld/products/00/04/70/53/LD0004705316_2.jpg	\N	HP ProBook 450 G5 2XZ22EA	\N	2.1	264.1	376.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:04.561027	2018-07-05 16:10:04.573465	1384
8277	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/86/55/LD0004865553_2.jpg	\N	HP ProBook 450 G5 2XZ52ET	\N	2.1	264.1	376.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:05.090184	2018-07-05 16:10:05.099082	1384
8278	1315	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/70/53/LD0004705316_2_0004802910_0004849489_0004886782.jpg	\N	HP ProBook 450 G5 3DP57ET	\N	2.1	264.1	376.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:05.649955	2018-07-05 16:10:05.66027	1384
8279	1315	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/70/53/LD0004705316_2_0004802910_0004849489.jpg	\N	HP ProBook 450 G5 3GH33ET	\N	2.1	264.1	376.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:07.161794	2018-07-05 16:10:07.170518	1384
8280	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/70/53/LD0004705316_2_0004802910.jpg	\N	HP ProBook 450 G5 3GH65ET	\N	2.1	264.1	376.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:07.684628	2018-07-05 16:10:07.697273	1384
8281	1315	1470	1461	3	1	https://media.ldlc.com/ld/products/00/04/88/81/LD0004888185_2_0004888484_0004949159.jpg	\N	HP ProBook 450 G5 3VK59ET	\N	2.1	264.1	376.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:08.209953	2018-07-05 16:10:08.224163	1384
8282	1314	1798	1356	3	1	https://media.ldlc.com/ld/products/00/03/47/97/LD0003479750_2_0003480058_0003489332_0003981817_0004004267.jpg	\N	HP ProBook 470 G3 P4P67EA	\N	2.61	290.5	416.8	26.0	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:08.827856	2018-07-05 16:10:08.84239	1384
8283	1314	1553	1356	3	1	https://media.ldlc.com/ld/products/00/03/47/97/LD0003479750_2_0003980848.jpg	\N	HP ProBook 470 G3 W4P92EA	\N	2.61	290.5	416.8	26.0	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:09.359283	2018-07-05 16:10:09.371633	1384
8284	1315	1841	1336	3	1	https://media.ldlc.com/ld/products/00/04/65/85/LD0004658506_2_0004658848_0004948079.jpg	\N	HP ProBook 470 G5 2XY85EA	\N	2.5	276.0	413.8	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:09.852178	2018-07-05 16:10:09.861892	1384
8285	1315	1800	1336	3	1	https://media.ldlc.com/ld/products/00/04/65/85/LD0004658506_2_0004658848_0004690823.jpg	\N	HP ProBook 470 G5 Pro 2VQ20ET	\N	2.5	276.0	413.8	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:10.395638	2018-07-05 16:10:10.405863	1384
8286	1315	1841	1336	3	1	https://media.ldlc.com/ld/products/00/04/65/85/LD0004658506_2_0004658848.jpg	\N	HP ProBook 470 G5 Pro 2VQ22EA	\N	2.5	276.0	413.8	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:10.9525	2018-07-05 16:10:10.964104	1384
8287	1315	1893	1336	3	1	https://media.ldlc.com/ld/products/00/04/65/85/LD0004658506_2.jpg	\N	HP ProBook 470 G5 Pro 2VQ23EA	\N	2.5	276.0	413.8	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:11.463083	2018-07-05 16:10:11.475282	1384
8288	1314	1500	1468	3	1	https://media.ldlc.com/ld/products/00/03/78/31/LD0003783177_2.jpg	\N	HP Spectre 13-v000nf	\N	1.11	229.0	325.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:10:11.986362	2018-07-05 16:10:11.997507	1384
8289	1315	1932	1533	3	1	https://media.ldlc.com/ld/products/00/03/44/94/LD0003449401_2_0003449795_0003479594_0004452047.jpg	\N	HP x2 210 L5H42EA	\N	1.14	182.6	264.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1280 x 800 pixels	60	10	16/10	\N	t	t	2018-07-05 16:10:12.489374	2018-07-05 16:10:12.501042	1384
8290	1315	1562	1308	1	1	https://media.ldlc.com/ld/products/00/04/67/95/LD0004679540_2.jpg	\N	HP ZBook 15 G4 1RQ75ET	\N	\N	264.0	386.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:13.012759	2018-07-05 16:10:13.024265	1384
8291	1315	1563	1308	1	1	https://media.ldlc.com/ld/products/00/04/67/95/LD0004679540_2_0004838752.jpg	\N	HP ZBook 15 G4 1RQ76ET	\N	\N	264.0	386.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:13.520318	2018-07-05 16:10:13.537367	1384
8292	1315	1562	1416	1	1	https://media.ldlc.com/ld/products/00/04/67/95/LD0004679540_2_0004803415.jpg	\N	HP ZBook 15 G4 Y6K19ET	\N	\N	264.0	386.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:14.040897	2018-07-05 16:10:14.049457	1384
8293	1315	1562	1308	1	1	https://media.ldlc.com/ld/products/00/04/68/00/LD0004680081_2_0004820450.jpg	\N	HP ZBook 17 G4 1RQ79ET	\N	\N	280.0	420.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:14.54025	2018-07-05 16:10:14.557159	1384
8474	1314	1891	1396	2	1	https://media.ldlc.com/ld/products/00/03/80/37/LD0003803788_2_0003803842_0004110620_0004111045_0004111360.jpg	\N	MSI GT73VR 7RE-492FR Titan	\N	4.14	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:19.560106	2018-07-05 16:12:19.571071	1387
8475	1314	1562	1291	2	1	https://media.ldlc.com/ld/products/00/03/80/37/LD0003803788_2_0003803842_0004110620_0004111045_0004111235.jpg	\N	MSI GT73VR 7RF-491FR Titan Pro	\N	4.14	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:20.129513	2018-07-05 16:12:20.14124	1387
8476	1314	1568	1396	2	1	https://media.ldlc.com/ld/products/00/04/85/88/LD0004858896_2_0004859388_0004859729_0004859980.jpg	\N	MSI GT75 8RF-047FR Titan	\N	4.56	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:20.649434	2018-07-05 16:12:20.66098	1387
8477	1314	1569	1546	3	1	https://media.ldlc.com/ld/products/00/04/85/88/LD0004858896_2.jpg	\N	MSI GT75 8RF-091FR Titan	\N	4.56	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:21.171331	2018-07-05 16:12:21.182634	1387
8478	1314	1568	1291	2	1	https://media.ldlc.com/ld/products/00/04/85/88/LD0004858896_2_0004859388_0004859729.jpg	\N	MSI GT75 8RG-015FR Titan	\N	4.56	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:21.715973	2018-07-05 16:12:21.728586	1387
8479	1314	1569	1291	2	1	https://media.ldlc.com/ld/products/00/04/85/88/LD0004858896_2_0004859388.jpg	\N	MSI GT75 8RG-095FR Titan	\N	4.56	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:22.250084	2018-07-05 16:12:22.264051	1387
8480	1314	1891	1396	2	1	https://media.ldlc.com/ld/products/00/04/55/71/LD0004557161_2_0004557377_0004557497_0004580600.jpg	\N	MSI GT75VR 7RE-064FR Titan	\N	4.5	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:24.313478	2018-07-05 16:12:24.322638	1387
8481	1314	1891	1291	2	1	https://media.ldlc.com/ld/products/00/04/55/71/LD0004557161_2_0004557377.jpg	\N	MSI GT75VR 7RF-062FR Titan Pro 4K	\N	4.5	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:24.850314	2018-07-05 16:12:24.863068	1387
8482	1314	1891	1291	2	1	https://media.ldlc.com/ld/products/00/04/55/71/LD0004557161_2_0004557377_0004557497.jpg	\N	MSI GT75VR 7RF-063FR Titan Pro	\N	4.5	314.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:25.407054	2018-07-05 16:12:25.419182	1387
8294	1315	1563	1298	1	1	https://media.ldlc.com/ld/products/00/04/68/00/LD0004680081_2.jpg	\N	HP ZBook 17 G4 Y6K24ET	\N	\N	280.0	420.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:15.072078	2018-07-05 16:10:15.084921	1384
8295	1315	1563	1416	1	1	https://media.ldlc.com/ld/products/00/04/80/53/LD0004805312_2.jpg	\N	HP ZBook Studio G4 Y6K16ET	\N	\N	255.0	375.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:15.596019	2018-07-05 16:10:15.605039	1384
8296	1315	1559	1424	1	1	https://media.ldlc.com/ld/products/00/04/86/50/LD0004865016_2_0004865334_0004947533_0004947840.jpg	\N	HP ZBook x2 G4 2ZB80ET	\N	\N	227.0	364.5	\N	\N	\N	\N	AZERTY	f	t	LED tactile	3840 x 2160 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:16.099308	2018-07-05 16:10:16.109217	1384
8297	1315	1559	1424	1	1	https://media.ldlc.com/ld/products/00/04/86/50/LD0004865016_2_0004865334_0004947533.jpg	\N	HP ZBook x2 G4 2ZB81ET	\N	\N	227.0	364.5	\N	\N	\N	\N	AZERTY	f	t	LED tactile	3840 x 2160 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:16.605984	2018-07-05 16:10:16.615738	1384
8298	1315	1893	1424	1	1	https://media.ldlc.com/ld/products/00/04/86/50/LD0004865016_2.jpg	\N	HP ZBook x2 G4 2ZC14ET	\N	\N	227.0	364.5	\N	\N	\N	\N	AZERTY	f	t	LED tactile	3840 x 2160 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:17.104714	2018-07-05 16:10:17.120658	1384
8299	1315	1893	1424	1	1	https://media.ldlc.com/ld/products/00/04/86/50/LD0004865016_2_0004865334.jpg	\N	HP ZBook x2 G4 2ZC15ET	\N	\N	227.0	364.5	\N	\N	\N	\N	AZERTY	f	t	LED tactile	3840 x 2160 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:17.623835	2018-07-05 16:10:17.634267	1384
8300	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/65/90/LD0004659029_2_0004808974_0004897381.jpg	\N	HP Elite x2 1012 G2 1LV39EA	\N	1.3	219.7	300.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	2736 x 1824 pixels	\N	12	15/10	\N	t	t	2018-07-05 16:10:18.121497	2018-07-05 16:10:18.132228	1384
8301	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/86/85/LD0004868573_2.jpg	\N	HP EliteBook 840 G5 3JX01EA	\N	1.48	234.0	326.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:18.808634	2018-07-05 16:10:18.838846	1384
8302	1315	1500	1468	3	1	https://media.ldlc.com/ld/products/00/03/73/43/LD0003734380_2_0003960214_0004462340.jpg	\N	Lenovo E31-80 80MX010FFR	\N	1.59	230.0	323.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:10:19.339843	2018-07-05 16:10:19.356972	1385
8303	1315	1797	1468	3	1	https://media.ldlc.com/ld/products/00/03/73/43/LD0003734380_2_0003960214_0004462340_0004544571.jpg	\N	Lenovo E31-80 80MX015GFR	\N	1.59	230.0	323.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:10:19.894132	2018-07-05 16:10:19.90869	1385
8304	1315	1797	1468	3	1	https://media.ldlc.com/ld/products/00/03/73/43/LD0003734380_2_0003960214_0004462340_0004642173.jpg	\N	Lenovo E31-80 80MX015HFR	\N	1.59	230.0	323.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:10:20.430224	2018-07-05 16:10:20.447952	1385
8305	1314	1714	1344	3	1	https://media.ldlc.com/ld/products/00/04/64/37/LD0004643733_2.jpg	\N	Lenovo IdeaPad 320-15AST Noir 80XV00JSFR	\N	2.2	260.0	378.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:20.992815	2018-07-05 16:10:21.053416	1385
8306	1314	1594	1379	3	1	https://media.ldlc.com/ld/products/00/04/54/06/LD0004540641_2.jpg	\N	Lenovo IdeaPad 320-15IAP Gris 80XR00YMFR	\N	2.2	260.0	378.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	\N	15	16/9	\N	t	t	2018-07-05 16:10:21.820699	2018-07-05 16:10:21.837012	1385
8307	1314	1504	1448	3	1	https://media.ldlc.com/ld/products/00/04/64/58/LD0004645835_2.jpg	\N	Lenovo IdeaPad 320-15IKBN Gris 80XL02Y2FR	\N	2.2	260.0	378.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:22.331932	2018-07-05 16:10:22.350647	1385
8308	1314	1841	1314	1	1	https://media.ldlc.com/ld/products/00/04/83/79/LD0004837961_2.jpg	\N	Lenovo IdeaPad 320-15IKBRN Gris 81BG00P5FR	\N	2.2	260.0	378.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:22.845341	2018-07-05 16:10:22.869861	1385
8309	1314	1893	1314	1	1	https://media.ldlc.com/ld/products/00/04/83/79/LD0004837961_2_0004838060.jpg	\N	Lenovo IdeaPad 320-15IKBRN Gris 81BG00P6FR	\N	2.2	260.0	378.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:23.680897	2018-07-05 16:10:23.698936	1385
8310	1314	1797	1448	3	1	https://media.ldlc.com/ld/products/00/04/72/99/LD0004729942_2.jpg	\N	Lenovo IdeaPad 320-15ISK Argent 80XH00D5FR	\N	2.2	260.0	378.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:24.241079	2018-07-05 16:10:24.25603	1385
8311	1314	1504	1448	3	1	https://media.ldlc.com/ld/products/00/04/63/28/LD0004632862_2_0004730340.jpg	\N	Lenovo IdeaPad 320-17IKB 80XM00DTFR	\N	2.8	292.6	418.0	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:24.730973	2018-07-05 16:10:24.742316	1385
8312	1314	1841	1314	1	1	https://media.ldlc.com/ld/products/00/04/63/28/LD0004632862_2_0004730484_0004838886_0004839063.jpg	\N	Lenovo IdeaPad 320-17IKBR 81BJ002JFR	\N	2.8	292.6	418.0	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:26.272561	2018-07-05 16:10:26.286871	1385
8313	1314	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/63/28/LD0004632862_2_0004730484_0004838886.jpg	\N	Lenovo IdeaPad 320-17IKBR 81BJ005YFR	\N	2.8	292.6	418.0	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:26.826882	2018-07-05 16:10:26.836711	1385
8314	1314	1797	1448	3	1	https://media.ldlc.com/ld/products/00/04/56/37/LD0004563797_2_0004838469.jpg	\N	Lenovo IdeaPad 320-17ISK Gris 80XJ0036FR	\N	2.8	292.6	418.0	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:27.388898	2018-07-05 16:10:27.399998	1385
8315	1314	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/72/98/LD0004729806_2_0004729880.jpg	\N	Lenovo IdeaPad 320S-14IKBR 81BN004MFR	\N	1.7	236.5	327.4	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:27.889203	2018-07-05 16:10:27.901902	1385
8316	1314	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/83/54/LD0004835472_2_0004836098.jpg	\N	Lenovo IdeaPad 320S-14IKBR 81BN004NFR	\N	1.7	236.5	327.4	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:28.447775	2018-07-05 16:10:28.460144	1385
8317	1314	1470	1461	3	1	https://media.ldlc.com/ld/products/00/04/83/54/LD0004835472_2.jpg	\N	Lenovo IdeaPad 320S-14IKBR 81BN007GFR	\N	1.7	236.5	327.4	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:29.045334	2018-07-05 16:10:29.057501	1385
8318	1314	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/83/54/LD0004835472_2_0004836098_0004837034.jpg	\N	Lenovo IdeaPad 320S-14IKBR 81BN007VFR	\N	1.7	236.5	327.4	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:29.591884	2018-07-05 16:10:29.600479	1385
8319	1314	1893	1541	3	1	https://media.ldlc.com/ld/products/00/04/91/04/LD0004910435_2_0004910514.jpg	\N	Lenovo IdeaPad 330S-15IKB 81F5003CFR	\N	1.8	224.0	358.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:30.095502	2018-07-05 16:10:30.104203	1385
8320	1314	1841	1541	3	1	https://media.ldlc.com/ld/products/00/04/91/04/LD0004910435_2.jpg	\N	Lenovo IdeaPad 330S-15IKB 81F5004GFR	\N	1.8	224.0	358.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:30.592943	2018-07-05 16:10:30.602331	1385
8321	1314	1841	1312	1	1	https://media.ldlc.com/ld/products/00/04/83/93/LD0004839385_2.jpg	\N	Lenovo IdeaPad 720-15IKBR 81C70019FR	\N	2.1	255.0	362.5	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:31.108255	2018-07-05 16:10:31.123166	1385
8322	1314	1841	1312	1	1	https://media.ldlc.com/ld/products/00/04/83/93/LD0004839385_2_0004839643.jpg	\N	Lenovo IdeaPad 720-15IKBR 81C7001CFR	\N	2.1	255.0	362.5	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:31.631267	2018-07-05 16:10:31.641691	1385
8323	1314	1403	1542	3	1	https://media.ldlc.com/ld/products/00/04/89/10/LD0004891022_2.jpg	\N	Lenovo IdeaPad 720s-13ARR 81BR0058FR	\N	1.14	213.82	305.9	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:10:32.414844	2018-07-05 16:10:32.423748	1385
8324	1314	1736	1542	3	1	https://media.ldlc.com/ld/products/00/04/92/24/LD0004922408_2.jpg	\N	Lenovo IdeaPad 720s-13ARR 81BR005EFR	\N	1.14	213.82	305.9	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:10:32.909516	2018-07-05 16:10:32.922551	1385
8325	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/49/67/LD0004496783_2_0004497542_0004730845_0004839908.jpg	\N	Lenovo Legion Y520-15IKBM 80YY003SFR	\N	2.4	265.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:33.467201	2018-07-05 16:10:33.480716	1385
8326	1314	1506	1304	1	1	https://media.ldlc.com/ld/products/00/04/49/67/LD0004496783_2_0004497372.jpg	\N	Lenovo Legion Y520-15IKBN 80WK005BFR	\N	2.4	265.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:33.978427	2018-07-05 16:10:33.988513	1385
8327	1	1506	1296	2	1	https://media.ldlc.com/ld/products/00/04/49/67/LD0004496783_2_0004497542_0004730845.jpg	\N	Lenovo Legion Y520-15IKBN 80YY008QFR	\N	2.4	265.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:34.482664	2018-07-05 16:10:34.492478	1385
8328	1314	1506	1296	2	1	https://media.ldlc.com/ld/products/00/04/57/64/LD0004576455_2_0004577387_0004793127.jpg	\N	Lenovo Legion Y720-15IKB 80VR002KFR	\N	2.95	277.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:35.959245	2018-07-05 16:10:35.969148	1385
8329	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/57/64/LD0004576455_2_0004577387_0004789525_0004840310.jpg	\N	Lenovo Legion Y720-15IKB 80VR00KYFR	\N	2.95	277.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:36.496807	2018-07-05 16:10:36.509029	1385
8330	1	1506	1296	2	1	https://media.ldlc.com/ld/products/00/04/57/64/LD0004576455_2_0004731090.jpg	\N	Lenovo Legion Y720-15IKB 80VR00L6FR	\N	2.95	277.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:37.004151	2018-07-05 16:10:37.020107	1385
8331	1314	1562	1396	2	1	https://media.ldlc.com/ld/products/00/04/58/79/LD0004587951_2.jpg	\N	Lenovo Legion Y920-17IKB 80YW000VFR	\N	4.3	315.0	425.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:37.509074	2018-07-05 16:10:37.519001	1385
8332	1314	1891	1396	2	1	https://media.ldlc.com/ld/products/00/04/58/79/LD0004587951_2_0004674991.jpg	\N	Lenovo Legion Y920-17IKB 80YW000WFR	\N	4.3	315.0	425.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:38.023218	2018-07-05 16:10:38.036222	1385
8333	1319	1455	1479	3	1	https://media.ldlc.com/ld/products/00/02/82/15/LD0002821584_2_0002843035_0002946614_0004263900.jpg	\N	Lenovo M30-70 MCF22FR	\N	1.8	230.2	330.8	22.0	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:10:38.520448	2018-07-05 16:10:38.530133	1385
8334	1315	1932	1537	3	1	https://media.ldlc.com/ld/products/00/04/31/37/LD0004313701_2_0004898830.jpg	\N	Lenovo Miix 320 80XF002FFR	\N	1020.0	183.0	249.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1280 x 800 pixels	60	10	16/10	\N	t	t	2018-07-05 16:10:39.049955	2018-07-05 16:10:39.059606	1385
8335	1315	1932	1537	3	1	https://media.ldlc.com/ld/products/00/04/31/37/LD0004313701_2.jpg	\N	Lenovo Miix 320 80XF002JFR	\N	1020.0	\N	\N	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1280 x 800 pixels	60	10	16/10	\N	t	t	2018-07-05 16:10:39.541597	2018-07-05 16:10:39.551447	1385
8336	1315	1798	1468	3	1	https://media.ldlc.com/ld/products/00/04/01/31/LD0004013101_2_0004239375.jpg	\N	Lenovo Miix 510 80U1001MFR	\N	1.25	205.0	300.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1920 x 1200 pixels	60	12	16/10	\N	t	t	2018-07-05 16:10:40.034335	2018-07-05 16:10:40.04631	1385
8337	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/89/75/LD0004897582_2.jpg	\N	Lenovo ThinkPad 13 2e Gen - 20J1003TFR	\N	1.44	222.8	322.4	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:10:40.562204	2018-07-05 16:10:40.575312	1385
8338	1315	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/54/87/LD0004548715_2_0004549004.jpg	\N	Lenovo ThinkPad E470 20H1003DFR	\N	1.87	242.0	339.0	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:41.068057	2018-07-05 16:10:41.08238	1385
8339	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/54/87/LD0004548715_2_0004549004_0004638776.jpg	\N	Lenovo ThinkPad E470 20H1006KFR	\N	1.87	242.0	339.0	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:41.600997	2018-07-05 16:10:41.6137	1385
8340	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/92/58/LD0004925852_2.jpg	\N	Lenovo ThinkPad E480 20KN001QFR	\N	1.75	242.0	329.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:42.100296	2018-07-05 16:10:42.110339	1385
8341	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/27/48/LD0004274824_2_0004275893.jpg	\N	Lenovo ThinkPad E570 20H50078FR	\N	2.3	261.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:42.570152	2018-07-05 16:10:42.581999	1385
8342	1315	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/27/48/LD0004274824_2_0004439864.jpg	\N	Lenovo ThinkPad E570 20H5007HFR	\N	2.3	261.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:43.09205	2018-07-05 16:10:43.102271	1385
8343	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/46/67/LD0004466776_2_0004630031.jpg	\N	Lenovo ThinkPad E570 20H500B2FR	\N	2.3	261.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:43.609135	2018-07-05 16:10:43.617322	1385
8344	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/89/90/LD0004899064_2.jpg	\N	Lenovo ThinkPad E580 20KS001JFR	\N	2.1	252.0	369.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:44.120315	2018-07-05 16:10:44.129879	1385
8345	1315	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/89/90/LD0004899064_2_0004926600.jpg	\N	Lenovo ThinkPad E580 20KS001QFR	\N	2.1	252.0	369.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:44.596506	2018-07-05 16:10:44.605535	1385
8346	1315	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/89/02/LD0004890274_2_0004912412.jpg	\N	Lenovo ThinkPad L380 Yoga 20M7001HFR	\N	1.56	224.2	322.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:10:45.153511	2018-07-05 16:10:45.166349	1385
8347	1315	1559	1333	3	1	https://media.ldlc.com/ld/products/00/04/86/11/LD0004861146_2.jpg	\N	Lenovo ThinkPad P51s 20HB001YFR	\N	\N	252.8	365.8	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:45.66888	2018-07-05 16:10:45.678741	1385
8348	1315	1838	1333	3	1	https://media.ldlc.com/ld/products/00/04/86/11/LD0004861146_2_0004911017.jpg	\N	Lenovo ThinkPad P51s 20HB0020FR	\N	\N	252.8	365.8	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:46.238666	2018-07-05 16:10:46.247064	1385
8349	1315	1893	1525	3	1	https://media.ldlc.com/ld/products/00/04/91/16/LD0004911613_2_0004912267.jpg	\N	Lenovo ThinkPad P52s 20LB0009FR	\N	\N	252.8	365.8	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:46.737442	2018-07-05 16:10:46.749347	1385
8350	1315	1893	1525	3	1	https://media.ldlc.com/ld/products/00/04/91/16/LD0004911613_2.jpg	\N	Lenovo ThinkPad P52s 20LB000AFR	\N	\N	252.8	365.8	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:47.259561	2018-07-05 16:10:47.267961	1385
8351	1315	1893	1525	3	1	https://media.ldlc.com/ld/products/00/04/91/16/LD0004911613_2_0004912377.jpg	\N	Lenovo ThinkPad P52s 20LB000BFR	\N	\N	252.8	365.8	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:47.754542	2018-07-05 16:10:47.766373	1385
8352	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/41/00/LD0004410041_2.jpg	\N	Lenovo ThinkPad T470s 20HF0047FR	\N	1.32	226.8	331.0	18.8	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:48.264831	2018-07-05 16:10:48.273534	1385
8353	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/42/21/LD0004422160_2_0004897807.jpg	\N	Lenovo ThinkPad T570 20H90000FR	\N	1.97	365.8	252.8	20.2	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:48.766633	2018-07-05 16:10:48.777004	1385
8354	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/42/21/LD0004422175_2.jpg	\N	Lenovo ThinkPad T570 20H90001FR	\N	1.97	365.8	252.8	20.2	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:49.298461	2018-07-05 16:10:49.310974	1385
8355	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/42/21/LD0004422160_2.jpg	\N	Lenovo ThinkPad T570 20H90002FR	\N	1.97	365.8	252.8	20.2	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:49.832315	2018-07-05 16:10:49.843896	1385
8356	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/42/21/LD0004422175_2_0004897964.jpg	\N	Lenovo ThinkPad T570 20H90052FR	\N	1.97	365.8	252.8	20.2	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:50.351838	2018-07-05 16:10:50.364906	1385
8357	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/53/65/LD0004536566_2_0004545631.jpg	\N	Lenovo ThinkPad X1 Carbon 20HR0022FR	\N	1.13	217.1	323.5	15.95	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:50.877876	2018-07-05 16:10:50.886246	1385
8358	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/53/65/LD0004536566_2.jpg	\N	Lenovo ThinkPad X1 Carbon 20HR002FFR	\N	1.13	217.1	323.5	15.95	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:51.457362	2018-07-05 16:10:51.469511	1385
8359	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/64/14/LD0004641432_2.jpg	\N	Lenovo ThinkPad X1 Yoga G2 20JD0025FR	\N	1.36	229.0	333.0	\N	\N	\N	\N	AZERTY	f	t	LED	2560 x 1440 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:51.963197	2018-07-05 16:10:51.97166	1385
8360	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/64/14/LD0004641432_2_0004730836.jpg	\N	Lenovo ThinkPad X1 Yoga G2 20JD002DFR	\N	1.36	229.0	333.0	\N	\N	\N	\N	AZERTY	f	t	LED	2560 x 1440 pixels	60	14	16/9	\N	t	t	2018-07-05 16:10:52.471349	2018-07-05 16:10:52.480088	1385
8361	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/57/93/LD0004579366_2_0004898029.jpg	\N	Lenovo ThinkPad X270 20HN0012FR	\N	1.36	208.5	305.5	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	12	16/9	\N	t	t	2018-07-05 16:10:52.974593	2018-07-05 16:10:52.987423	1385
8362	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/57/93/LD0004579366_2.jpg	\N	Lenovo ThinkPad X270 20HN001SFR	\N	1.36	208.5	305.5	\N	\N	\N	\N	AZERTY	f	t	LED	1366 x 768 pixels	60	12	16/9	\N	t	t	2018-07-05 16:10:53.483564	2018-07-05 16:10:53.495583	1385
8363	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/57/93/LD0004579366_2_0004898029_0004898571.jpg	\N	Lenovo ThinkPad X270 20HN005NFR	\N	1.36	208.5	305.5	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	12	16/9	\N	t	t	2018-07-05 16:10:53.984613	2018-07-05 16:10:53.993816	1385
8364	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/43/85/LD0004438549_2.jpg	\N	Lenovo ThinkPad Yoga 370 Argent 20JH003BFR	\N	1.37	222.2	313.5	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:10:54.517949	2018-07-05 16:10:54.530499	1385
8365	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/43/89/LD0004438953_2_0004439023.jpg	\N	Lenovo ThinkPad Yoga 370 Noir 20JH002KFR	\N	1.37	222.2	313.5	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:10:55.045665	2018-07-05 16:10:55.055496	1385
8366	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/43/89/LD0004438953_2.jpg	\N	Lenovo ThinkPad Yoga 370 Noir 20JH002LFR	\N	1.37	222.2	313.5	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:10:55.588297	2018-07-05 16:10:55.597819	1385
8367	1314	1442	1489	3	1	https://media.ldlc.com/ld/products/00/04/27/23/LD0004272364_2_0004273596.jpg	\N	Lenovo V110-15IAP 80TG00W0FR	\N	1.9	262.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:56.232509	2018-07-05 16:10:56.242364	1385
8368	1315	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/27/23/LD0004272364_2_0004378146.jpg	\N	Lenovo V110-15ISK 80TL00A3FR	\N	1.9	262.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:56.741603	2018-07-05 16:10:56.750693	1385
8369	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/27/23/LD0004272364_2.jpg	\N	Lenovo V110-15ISK 80TL00A9FR	\N	1.9	262.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:10:57.295518	2018-07-05 16:10:57.305601	1385
8370	1314	1934	1468	3	1	https://media.ldlc.com/ld/products/00/04/54/33/LD0004543313_2_0004544525.jpg	\N	Lenovo V110-17ISK 80V2017PFR	\N	2.79	292.6	418.0	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:57.807327	2018-07-05 16:10:57.817367	1385
8371	1314	1934	1377	3	1	https://media.ldlc.com/ld/products/00/04/80/19/LD0004801947_2_0004802403_0004891566.jpg	\N	Lenovo V320-17IKB Gris 81AH001WFR	\N	2.8	293.0	418.0	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:58.58129	2018-07-05 16:10:58.600572	1385
8372	1315	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/80/19/LD0004801947_2_0004802403_0004899717.jpg	\N	Lenovo V320-17IKB Gris 81B60009FR	\N	2.8	293.0	418.0	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:10:59.095429	2018-07-05 16:10:59.110684	1385
8373	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/80/19/LD0004801947_2_0004802403_0004891566_0004899145.jpg	\N	Lenovo V320-17IKB Gris 81B6000FFR	\N	2.8	293.0	418.0	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:11:00.617989	2018-07-05 16:11:00.634345	1385
8374	1315	1841	1314	1	1	https://media.ldlc.com/ld/products/00/04/80/19/LD0004801947_2_0004946097.jpg	\N	Lenovo V320-17IKB Gris 81CN0009FR	\N	2.8	292.6	418.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:11:01.135209	2018-07-05 16:11:01.145716	1385
8375	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/89/66/LD0004896679_2.jpg	\N	Lenovo V330-15 81AX0016FR	\N	1.8	253.0	375.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:01.666505	2018-07-05 16:11:01.684364	1385
8376	1315	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/89/66/LD0004896679_2_0004899108.jpg	\N	Lenovo V330-15 81AX001HFR	\N	2.05	253.0	375.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:02.195826	2018-07-05 16:11:02.208078	1385
8377	1315	1893	1344	3	1	https://media.ldlc.com/ld/products/00/04/89/71/LD0004897141_2.jpg	\N	Lenovo V330-15IKB 81AX001DFR	\N	1.8	253.0	375.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:02.73658	2018-07-05 16:11:02.750759	1385
8378	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/89/71/LD0004897141_2_0004942780.jpg	\N	Lenovo V330-15IKB 81AX00FYFR	\N	1.8	253.0	375.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:04.265126	2018-07-05 16:11:04.278936	1385
8379	1314	1559	1344	3	1	https://media.ldlc.com/ld/products/00/04/27/65/LD0004276547_2_0004545776_0004641888.jpg	\N	Lenovo V510-15IKB 80WQ01UYFR	\N	2.0	262.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:05.088207	2018-07-05 16:11:05.098364	1385
8380	1314	1504	1344	3	1	https://media.ldlc.com/ld/products/00/04/27/65/LD0004276547_2_0004545776.jpg	\N	Lenovo V510-15IKB 80WQ01VQFR	\N	2.0	262.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:05.66008	2018-07-05 16:11:05.672805	1385
8381	1314	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/64/53/LD0004645317_2_0004650351.jpg	\N	Lenovo Yoga 520-14IKB 80X80063FR	\N	1.74	235.0	330.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:11:06.188641	2018-07-05 16:11:06.197721	1385
8382	1314	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/93/72/LD0004937246_2.jpg	\N	Lenovo Yoga 520-14IKB 80X8006BFR	\N	1.74	235.0	330.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:11:06.756656	2018-07-05 16:11:06.768494	1385
8383	1314	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/64/53/LD0004645317_2.jpg	\N	Lenovo Yoga 520-14IKB 80X8006EFR	\N	1.74	235.0	330.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:11:07.354201	2018-07-05 16:11:07.363037	1385
8384	1314	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/64/53/LD0004645317_2_0004650351_0004731406.jpg	\N	Lenovo Yoga 520-14IKB 80X8006FFR	\N	1.74	235.0	330.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:11:07.845321	2018-07-05 16:11:07.856722	1385
8385	1314	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/84/08/LD0004840830_2.jpg	\N	Lenovo Yoga 520-14IKB 81C800FFFR	\N	1.7	229.0	328.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:11:08.361663	2018-07-05 16:11:08.371771	1385
8386	1314	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/54/20/LD0004542082_2_0004697080_0004891046.jpg	\N	Lenovo Yoga 720-13IKB 80X6008CFR	\N	1.3	213.0	310.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:11:08.989248	2018-07-05 16:11:08.998902	1385
8387	1314	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/54/20/LD0004542082_2.jpg	\N	Lenovo Yoga 720-13IKB 80X6008DFR	\N	1.3	213.0	310.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:11:09.813189	2018-07-05 16:11:09.825486	1385
8388	1320	1935	1537	3	1	https://media.ldlc.com/ld/products/00/03/95/68/LD0003956881_2.jpg	\N	Lenovo Yoga Book 10" ZA0V0026FR	\N	690.0	170.8	256.6	\N	\N	\N	\N	\N	f	f	LED tactile	1920 x 1200 pixels	60	10	16/10	\N	t	t	2018-07-05 16:11:11.29293	2018-07-05 16:11:11.30111	1385
8389	1315	1935	1537	3	1	https://media.ldlc.com/ld/products/00/03/95/67/LD0003956726_2.jpg	\N	Lenovo Yoga Book 10" ZA150060FR	\N	690.0	170.8	256.6	\N	\N	\N	\N	\N	f	f	LED tactile	1920 x 1200 pixels	60	10	16/10	\N	t	t	2018-07-05 16:11:11.805664	2018-07-05 16:11:11.814295	1385
8390	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/01/31/LD0004013101_2_0004332847_0004439093.jpg	\N	Lenovo Miix 510 80XE001BFR	\N	1.25	205.0	300.0	\N	\N	\N	\N	AZERTY	f	f	LED tactile	1920 x 1200 pixels	60	12	16/10	\N	t	t	2018-07-05 16:11:12.317994	2018-07-05 16:11:12.328714	1385
8391	1315	1841	1461	3	1	https://media.ldlc.com/ld/products/00/04/89/02/LD0004890274_2.jpg	\N	Lenovo ThinkPad L380 Yoga 20M7001BFR	\N	1.56	224.2	322.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:11:13.789214	2018-07-05 16:11:13.798234	1385
8392	1315	1553	1339	3	1	https://media.ldlc.com/ld/products/00/03/65/71/LD0003657174_2_0003657783.jpg	\N	Lenovo ThinkPad P40 Yoga 20GQ000KFR	\N	\N	236.3	338.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:11:14.360406	2018-07-05 16:11:14.371223	1385
8483	1314	1568	1546	3	1	https://media.ldlc.com/ld/products/00/04/90/48/LD0004904882_2.jpg	\N	MSI GT83 8RF-021FR Titan	\N	5.5	339.0	458.0	69.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	18	16/9	\N	t	t	2018-07-05 16:12:25.925977	2018-07-05 16:12:25.934914	1387
8484	1314	1568	1545	3	1	https://media.ldlc.com/ld/products/00/04/90/48/LD0004904882_2_0004905365.jpg	\N	MSI GT83 8RG-028FR Titan	\N	5.5	339.0	458.0	69.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	18	16/9	\N	t	t	2018-07-05 16:12:26.430868	2018-07-05 16:12:26.441705	1387
8485	1314	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/14/35/LD0004143598_2.jpg	\N	MSI PE60 7RD-484FR	\N	2.4	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:27.033255	2018-07-05 16:12:27.044259	1387
8486	1315	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/56/64/LD0004566441_2.jpg	\N	MSI PE62 7RD-1668FR	\N	2.2	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:27.564355	2018-07-05 16:12:27.575182	1387
8487	1315	1567	1304	1	1	https://media.ldlc.com/ld/products/00/04/90/09/LD0004900957_2_0004901226.jpg	\N	MSI PE62 8RC-024FR	\N	2.2	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:28.097619	2018-07-05 16:12:28.110332	1387
8488	1314	1567	1405	1	1	https://media.ldlc.com/ld/products/00/04/90/09/LD0004900957_2.jpg	\N	MSI PE62 8RD-023FR	\N	2.2	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:28.638138	2018-07-05 16:12:28.650363	1387
8489	1314	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/54/76/LD0004547692_2_0004702754_0004761867.jpg	\N	MSI PE72 7RD-1230FR	\N	2.7	287.8	419.9	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:29.158929	2018-07-05 16:12:29.171752	1387
8490	1315	1562	1304	1	1	https://media.ldlc.com/ld/products/00/04/54/76/LD0004547692_2_0004702754.jpg	\N	MSI PE72 7RD-1265FR	\N	2.7	287.8	419.9	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:29.689659	2018-07-05 16:12:29.702629	1387
8491	1315	1567	1304	1	1	https://media.ldlc.com/ld/products/00/04/54/76/LD0004547692_2_0004702754_0004761867_0004896096_0004896482.jpg	\N	MSI PE72 8RC-024FR	\N	2.7	287.8	419.9	32.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:30.222992	2018-07-05 16:12:30.23187	1387
8492	1315	1562	1416	1	1	https://media.ldlc.com/ld/products/00/04/28/79/LD0004287958_2_0004810248.jpg	\N	MSI WE62 7RI-2002FR	\N	\N	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:30.741956	2018-07-05 16:12:30.754598	1387
8493	1315	1562	1308	1	1	https://media.ldlc.com/ld/products/00/04/28/79/LD0004287958_2.jpg	\N	MSI WE62 7RJ-1836FR	\N	\N	260.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:31.494788	2018-07-05 16:12:31.506269	1387
8494	1315	1562	1308	1	1	https://media.ldlc.com/ld/products/00/04/28/65/LD0004286558_2.jpg	\N	MSI WE72 7RJ-1035FR	\N	\N	287.8	419.9	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:33.009549	2018-07-05 16:12:33.026896	1387
8495	1315	1562	1308	1	1	https://media.ldlc.com/ld/products/00/04/28/56/LD0004285603_2_0004474856.jpg	\N	MSI WS60 7RJ-678FR	\N	1.9	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:33.559351	2018-07-05 16:12:33.571269	1387
8496	1315	1924	1308	1	1	https://media.ldlc.com/ld/products/00/04/28/56/LD0004285603_2.jpg	\N	MSI WS60 7RJ-679FR	\N	\N	266.0	390.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:34.060453	2018-07-05 16:12:34.069175	1387
8497	1315	1562	1298	1	1	https://media.ldlc.com/ld/products/00/04/49/80/LD0004498018_2.jpg	\N	MSI WS63 7RK-405FR	\N	1.8	249.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:34.588201	2018-07-05 16:12:34.59939	1387
8498	1315	1562	1399	1	1	https://media.ldlc.com/ld/products/00/04/49/80/LD0004498018_2_0004557859_0004800466.jpg	\N	MSI WS63VR 7RL-053FR	\N	\N	249.0	380.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:36.179414	2018-07-05 16:12:36.188832	1387
8499	1315	1924	1293	2	1	https://media.ldlc.com/ld/products/00/04/28/34/LD0004283487_2.jpg	\N	MSI WT73VR 7RM-633FR	\N	\N	287.0	428.0	\N	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:36.705078	2018-07-05 16:12:36.717945	1387
8500	1315	1924	1293	2	1	https://media.ldlc.com/ld/products/00/04/28/34/LD0004283487_2_0004493645.jpg	\N	MSI WT73VR 7RM-634FR	\N	\N	287.0	428.0	49.0	\N	\N	\N	AZERTY	t	t	LED	3840 x 2160 pixels	60	17	16/9	\N	t	t	2018-07-05 16:12:37.252735	2018-07-05 16:12:37.265198	1387
7663	1317	1442	1489	3	1	https://media.ldlc.com/ld/products/00/04/91/71/LD0004917100_2.jpg	\N	Acer Swift 1 SF113-31-C74M Or	\N	1.3	225.0	319.5	\N	\N	\N	\N	AZERTY	f	f	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:01:55.007625	2018-07-05 16:07:17.741499	1380
7653	1314	1559	1547	3	1	\N	\N	Acer Swift 3 SF314-52-70QS Bleu	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:51.544226	2018-07-05 16:01:51.544226	1379
7646	1322	1442	1547	3	1	\N	\N	Acer Aspire 1 A114-31-C4WM	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:49.906426	2018-07-05 16:01:49.906426	1379
7647	1323	1774	1547	3	1	\N	\N	HP Notebook 17 17-BS019NF Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:50.09496	2018-07-05 16:01:50.09496	1379
7648	1314	1774	1547	3	1	\N	\N	HP Stream 14 14-AX009NF Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:50.302947	2018-07-05 16:01:50.302947	1379
7649	1324	1559	1547	3	1	\N	\N	Asus ZenBook 3 Deluxe UX490UA-BE032T Bleu	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:50.518707	2018-07-05 16:01:50.518707	1379
7651	1323	1797	1459	3	1	\N	\N	HP Notebook 17 17-BS021NF Argent	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:51.042944	2018-07-05 16:01:51.042944	1379
7652	1325	1374	1539	3	1	\N	\N	Asus VivoBook 17 X751BP-TY054T Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:51.267466	2018-07-05 16:01:51.267466	1379
7654	1314	1504	1318	1	1	\N	\N	Acer Aspire E15 E5-575G-50NS Noir	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:51.975987	2018-07-05 16:01:51.975987	1379
7655	1326	1506	1405	1	1	\N	\N	Acer Aspire V17 Nitro VN7-793G-594N Black Edition	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:52.234523	2018-07-05 16:01:52.234523	1379
7656	1314	1714	1459	3	1	\N	\N	HP Notebook 15 15-BW012NF Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:52.628674	2018-07-05 16:01:52.628674	1379
7657	1314	1504	1547	3	1	\N	\N	HP Pavilion X360 14-BA008NF Argent	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:52.953164	2018-07-05 16:01:52.953164	1379
7658	1327	1506	1304	1	1	\N	\N	Asus FX502VD-DM173T	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:53.271588	2018-07-05 16:01:53.271588	1379
7659	1324	1893	1336	3	1	\N	\N	Asus VivoBook S15 S510UR-BR270T Or	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:53.684456	2018-07-05 16:01:53.684456	1379
7660	1324	1841	1547	3	1	\N	\N	Asus ZenBook+ UX430-58256 Bleu	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:53.977648	2018-07-05 16:01:53.977648	1379
7661	1314	1504	1318	1	1	\N	\N	Acer Aspire E15 E5-575G-518K	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:54.358777	2018-07-05 16:01:54.358777	1379
7662	1326	1506	1304	1	1	\N	\N	Acer Nitro 5 AN515-51-53HT	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:54.575056	2018-07-05 16:01:54.575056	1379
7664	1314	1921	1547	3	1	\N	\N	HP Notebook 15 15-BS097NF Noir	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:55.196796	2018-07-05 16:01:55.196796	1379
7665	1328	1594	1547	3	1	\N	\N	Acer Swift 1 SF113-31-P3MG Or	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:55.407395	2018-07-05 16:01:55.407395	1379
7666	1325	1937	1547	3	1	\N	\N	Thomson NEO14 2BK32 Noir	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:55.599203	2018-07-05 16:01:55.599203	1379
7667	1314	1841	1314	1	1	\N	\N	Acer Swift 3 SF314-52G-55XD Bleu	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:55.881196	2018-07-05 16:01:55.881196	1379
7668	1323	1506	1304	1	1	\N	\N	HP Omen 15 15-AX246NF	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:56.212476	2018-07-05 16:01:56.212476	1379
7669	1314	1594	1547	3	1	\N	\N	Acer Swift 1 SF113-31-P3P0 Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:56.542634	2018-07-05 16:01:56.542634	1379
7670	1329	1506	1405	1	1	\N	\N	MSI GF62 7RE-2829XFR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:56.752732	2018-07-05 16:01:56.752732	1379
7671	1324	1893	1314	1	1	\N	\N	Asus ZenBook+ UX430-78256-GeForce Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:57.057463	2018-07-05 16:01:57.057463	1379
7672	1330	1594	1547	3	1	\N	\N	Acer Swift 1 SF113-31-P697 Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:57.282545	2018-07-05 16:01:57.282545	1379
7674	1324	1714	1547	3	1	\N	\N	Asus VivoBook 15 X505BP-BR062T Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:57.826765	2018-07-05 16:01:57.826765	1379
7675	1314	1797	1547	3	1	\N	\N	Acer Aspire 3 A315-51-34HU	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:58.132575	2018-07-05 16:01:58.132575	1379
7676	1324	1893	1547	3	1	\N	\N	Asus ZenBook Flip S UX370-78256 Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:58.445498	2018-07-05 16:01:58.445498	1379
7677	1324	1797	1547	3	1	\N	\N	Asus VivoBook 14 X405UA-EB715T Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:58.65129	2018-07-05 16:01:58.65129	1379
7678	1314	1594	1547	3	1	\N	\N	Acer Swift 1 SF113-31-P6E3 Rose	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:58.894105	2018-07-05 16:01:58.894105	1379
7679	1314	1594	1547	3	1	\N	\N	Acer Swift 1 SF113-31-P6VV Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:59.123864	2018-07-05 16:01:59.123864	1379
7680	1314	1594	1547	3	1	\N	\N	Acer Aspire ES1 ES1-533-P0NN	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:59.349408	2018-07-05 16:01:59.349408	1379
7681	1324	1893	1547	3	1	\N	\N	Asus ZenBook Flip 14 UX461UA-E1092T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:59.597221	2018-07-05 16:01:59.597221	1379
7682	1314	1374	1547	3	1	\N	\N	Acer Aspire 3 A315-21-6464	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:01:59.845016	2018-07-05 16:01:59.845016	1379
7684	1331	1567	1296	2	1	\N	\N	MSI GS63 8RE-041FR Stealth	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:00.398203	2018-07-05 16:02:00.398203	1379
7685	1314	1841	1304	1	1	\N	\N	Acer Spin 5 SP515-51GN-54GU Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:00.608952	2018-07-05 16:02:00.608952	1379
7686	1314	1797	1547	3	1	\N	\N	Acer Aspire 3 A315-51-327M Bleu	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:00.847515	2018-07-05 16:02:00.847515	1379
7687	1324	1910	1547	3	1	\N	\N	Asus VivoBook 15 R542UA-DM457T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:01.318847	2018-07-05 16:02:01.318847	1379
7688	1314	1374	1547	3	1	\N	\N	Acer Aspire 3 A315-21-618D	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:01.555059	2018-07-05 16:02:01.555059	1379
7689	1324	1442	1547	3	1	\N	\N	Asus VivoBook 14 E402NA-GA248T Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:01.778039	2018-07-05 16:02:01.778039	1379
7690	1330	1797	1547	3	1	\N	\N	Acer Spin 3 SP314-51-301U Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:02.027067	2018-07-05 16:02:02.027067	1379
7691	1324	1841	1547	3	1	\N	\N	Asus ZenBook+ UX430-58256 Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:02.286516	2018-07-05 16:02:02.286516	1379
7692	1314	1712	1547	3	1	\N	\N	Acer Aspire ES1 ES1-523-8211	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:02.619484	2018-07-05 16:02:02.619484	1379
7693	1329	1506	1304	1	1	\N	\N	MSI GL62M 7RDX-2646XFR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:02.924403	2018-07-05 16:02:02.924403	1379
7694	1325	1442	1547	3	1	\N	\N	Thomson Neo X X6-4-32GR Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:03.505369	2018-07-05 16:02:03.505369	1379
7695	1314	1562	1405	1	1	\N	\N	Acer Nitro 5 AN515-51-72CL	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:03.869437	2018-07-05 16:02:03.869437	1379
7696	1324	1841	1547	3	1	\N	\N	Asus VivoBook S15 S501UA-EJ644T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:04.214873	2018-07-05 16:02:04.214873	1379
7697	1324	1841	1334	3	1	\N	\N	Asus VivoBook 17 R702UQ-GC176T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:04.506655	2018-07-05 16:02:04.506655	1379
7698	1324	1509	1304	1	1	\N	\N	Asus TUF Gaming FX504GD-E4667T	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:04.746181	2018-07-05 16:02:04.746181	1379
7699	1327	1562	1296	2	1	\N	\N	Asus FX503VM-DM033T	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:04.971	2018-07-05 16:02:04.971	1379
7700	1314	1506	1405	1	1	\N	\N	Acer Nitro 5 AN515-51-53ZA	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:05.374111	2018-07-05 16:02:05.374111	1379
7701	1324	1559	1547	3	1	\N	\N	Asus ZenBook+ UX430-78512 Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:05.621798	2018-07-05 16:02:05.621798	1379
7702	1326	1567	1296	2	1	\N	\N	MSI GP73 8RE-287XFR Leopard	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:05.937012	2018-07-05 16:02:05.937012	1379
7704	1332	1938	1547	3	1	\N	\N	Apple MacBook Air 13'' 128 Go Silver 2017 + Apple USB SuperDrive	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:06.378676	2018-07-05 16:02:06.378676	1379
7705	1332	1938	1547	3	1	\N	\N	Apple MacBook Air 13'' 128 Go Silver 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:06.597041	2018-07-05 16:02:06.597041	1379
7706	1325	1937	1547	3	1	\N	\N	Thomson HERO9 2BK32	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:06.920308	2018-07-05 16:02:06.920308	1379
7707	1314	1841	1547	3	1	\N	\N	Acer Spin 5 SP513-52N-51V2 Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:07.30687	2018-07-05 16:02:07.30687	1379
7708	1324	1893	1314	1	1	\N	\N	Asus VivoBook S15 S510UN-BQ233T Or	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:07.552749	2018-07-05 16:02:07.552749	1379
7709	1324	1910	1507	3	1	\N	\N	Asus VivoBook 17 R702UB-BX065T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:07.771726	2018-07-05 16:02:07.771726	1379
7710	1314	1594	1547	3	1	\N	\N	Acer Aspire 3 A315-31-P7LC Rouge	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:08.015326	2018-07-05 16:02:08.015326	1379
7711	1324	1893	1304	1	1	\N	\N	Asus VivoBook Pro 17 N705UD-GC081T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:08.260503	2018-07-05 16:02:08.260503	1379
7712	1324	1509	1405	1	1	\N	\N	Asus TUF Gaming FX504GE-E4421T	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:08.468666	2018-07-05 16:02:08.468666	1379
7713	1314	1506	1405	1	1	\N	\N	Acer Aspire 7 A717-71G-54ZH	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:08.704339	2018-07-05 16:02:08.704339	1379
7714	1333	1833	1543	3	1	\N	\N	Microsoft Surface Pro 4 Core i5 256 Go Wi-Fi Silver	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:08.921242	2018-07-05 16:02:08.921242	1379
7715	1314	1504	1318	1	1	\N	\N	Acer Aspire E15 E5-575G-578N Blanc	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:09.146321	2018-07-05 16:02:09.146321	1379
7716	1323	1506	1296	2	1	\N	\N	MSI GP72MVR 7RFX-696FR Leopard Pro	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:09.379507	2018-07-05 16:02:09.379507	1379
7717	1324	1841	1336	3	1	\N	\N	Asus VivoBook Flip 14 TP410UR-EC149T Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:09.729471	2018-07-05 16:02:09.729471	1379
7718	1314	1506	1304	1	1	\N	\N	HP Pavilion Power 15 15-CB015NF	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:10.030619	2018-07-05 16:02:10.030619	1379
7719	1323	1562	1304	1	1	\N	\N	MSI GL72M 7RDX-1085FR	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:10.398004	2018-07-05 16:02:10.398004	1379
7720	1329	1504	1304	1	1	\N	\N	HP Pavilion 17 17-AB307NF Noir	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:10.72043	2018-07-05 16:02:10.72043	1379
7721	1332	1938	1547	3	1	\N	\N	Apple MacBook Air 13'' 256 Go Silver 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:10.951568	2018-07-05 16:02:10.951568	1379
7722	1332	1938	1547	3	1	\N	\N	Apple MacBook Air 13'' 256 Go Silver 2017 + Apple USB SuperDrive	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:11.188655	2018-07-05 16:02:11.188655	1379
7723	1332	1938	1547	3	1	\N	\N	Apple MacBook Pro 13 128 Go Silver 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:11.442684	2018-07-05 16:02:11.442684	1379
7724	1324	1841	1314	1	1	\N	\N	Asus VivoBook S15 S510UN-BQ232T Or	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:11.696437	2018-07-05 16:02:11.696437	1379
7725	1324	1562	1304	1	1	\N	\N	Asus ROG Strix GL503VD-GZ279T Hero Edition	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:11.93841	2018-07-05 16:02:11.93841	1379
7726	1324	1504	1547	3	1	\N	\N	Asus ZenBook Flip UX360UAK-DQ456T Noir	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:12.284658	2018-07-05 16:02:12.284658	1379
7727	1324	1893	1547	3	1	\N	\N	Asus ZenBook 13 UX331UA-EG051T Bleu	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:12.504948	2018-07-05 16:02:12.504948	1379
7729	1332	1938	1547	3	1	\N	\N	Apple MacBook Pro 13 128 Go Gris Sidéral 2017	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:13.089778	2018-07-05 16:02:13.089778	1379
7730	1314	1562	1296	2	1	\N	\N	HP Omen 15 15-CE020NF	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:13.466524	2018-07-05 16:02:13.466524	1379
7731	1314	1506	1304	1	1	\N	\N	HP Pavilion Power 15 15-CB025NF	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:13.734818	2018-07-05 16:02:13.734818	1379
7732	1324	1893	1547	3	1	\N	\N	Asus ZenBook Flip S UX370-716512 Bleu	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:13.972658	2018-07-05 16:02:13.972658	1379
7733	1324	1893	1547	3	1	\N	\N	Asus ZenBook 3 Deluxe UX490-78512 Gris	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:14.220345	2018-07-05 16:02:14.220345	1379
7734	1331	1562	1304	1	1	\N	\N	MSI GS63 7RD-242FR Stealth Pro	\N	\N	\N	\N	\N	\N	\N	\N		f	f			\N	\N		\N	\N	t	2018-07-05 16:02:14.466082	2018-07-05 16:02:14.466082	1379
8393	1315	1553	1339	3	1	https://media.ldlc.com/ld/products/00/03/65/71/LD0003657174_2_0004336648.jpg	\N	Lenovo ThinkPad P40 Yoga 20GQ001QFR	\N	\N	236.3	338.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	14	16/9	\N	t	t	2018-07-05 16:11:14.867442	2018-07-05 16:11:14.885539	1385
8394	1314	1797	1468	3	1	https://media.ldlc.com/ld/products/00/04/54/33/LD0004543313_2_0004589468_0004802348.jpg	\N	Lenovo V110-17ISK 80VM00DQFR	\N	2.79	292.6	418.0	\N	\N	\N	\N	AZERTY	t	f	LED	1600 x 900 pixels	60	17	16/9	\N	t	t	2018-07-05 16:11:16.375023	2018-07-05 16:11:16.387143	1385
8395	1314	1559	1363	3	1	https://media.ldlc.com/ld/products/00/04/27/65/LD0004276547_2_0004439594.jpg	\N	Lenovo V510-15IKB 80WQ01TNFR	\N	2.0	262.0	380.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:16.896355	2018-07-05 16:11:16.911418	1385
8396	1315	1565	1296	2	1	https://media.ldlc.com/ld/products/00/04/81/59/LD0004815946_2_0004816120.jpg	\N	Microsoft Surface Book 2 15" - i7-8650U - 16 Go - 1 To	\N	1.9	251.0	343.0	23.0	\N	\N	\N	AZERTY	f	t	LED tactile	3240 x 2160 pixels	60	15	15/10	\N	t	t	2018-07-05 16:11:17.436517	2018-07-05 16:11:17.448747	1386
8397	1315	1565	1296	2	1	https://media.ldlc.com/ld/products/00/04/81/59/LD0004815946_2.jpg	\N	Microsoft Surface Book 2 15" - i7-8650U - 16 Go - 256 Go	\N	1.9	251.0	343.0	23.0	\N	\N	\N	AZERTY	f	t	LED tactile	3240 x 2160 pixels	60	15	15/10	\N	t	t	2018-07-05 16:11:17.965419	2018-07-05 16:11:17.977935	1386
8398	1315	1565	1296	2	1	https://media.ldlc.com/ld/products/00/04/81/59/LD0004815946_2_0004816182.jpg	\N	Microsoft Surface Book 2 15" - i7-8650U - 16 Go - 512 Go	\N	1.9	251.0	343.0	23.0	\N	\N	\N	AZERTY	f	t	LED tactile	3240 x 2160 pixels	60	15	15/10	\N	t	t	2018-07-05 16:11:18.492087	2018-07-05 16:11:18.505012	1386
8399	1315	1561	1345	3	1	https://media.ldlc.com/ld/products/00/04/37/88/LD0004378860_2_0004379367_0004379394_0004379421.jpg	\N	Microsoft Surface Pro - Intel Core i7 - 8 Go - 256 Go	\N	786.0	201.42	292.1	\N	\N	\N	\N	\N	f	f	LED tactile	2736 x 1824 pixels	60	12	15/10	\N	t	t	2018-07-05 16:11:19.02874	2018-07-05 16:11:19.040339	1386
8400	1315	1901	1475	3	1	https://media.ldlc.com/ld/products/00/04/37/88/LD0004378860_2.jpg	\N	Microsoft Surface Pro - Intel Core m3 - 4 Go - 128 Go	\N	766.0	201.42	292.1	\N	\N	\N	\N	\N	f	f	LED tactile	2736 x 1824 pixels	60	12	15/10	\N	t	t	2018-07-05 16:11:20.52556	2018-07-05 16:11:20.535669	1386
8401	1315	1573	1376	3	1	https://media.ldlc.com/ld/products/00/03/93/81/LD0003938167_2.jpg	\N	Microsoft Surface Pro 4 - m3-6Y30 - 4 Go - 128 Go	\N	786.0	201.42	292.1	\N	\N	\N	\N	\N	f	f	LED tactile	2736 x 1824 pixels	60	12	15/10	\N	t	t	2018-07-05 16:11:21.068751	2018-07-05 16:11:21.079657	1386
8402	1314	1929	1480	3	1	https://media.ldlc.com/ld/products/00/04/02/44/LD0004024424_2_0004024502_0004494721.jpg	\N	MSI CR62 6ML-028FR	\N	2.3	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:21.599623	2018-07-05 16:11:21.62344	1387
8403	1314	1800	1334	3	1	https://media.ldlc.com/ld/products/00/04/02/42/LD0004024244_2_0004495989.jpg	\N	MSI CX62 7QL-024FR	\N	2.3	260.0	383.0	29.0	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:22.113054	2018-07-05 16:11:22.12623	1387
8404	1	1562	1405	1	1	https://media.ldlc.com/ld/products/00/04/11/98/LD0004119822_2_0004942901.jpg	\N	MSI GE62 7RE-026XFR Apache	\N	2.3	265.0	388.0	31.0	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:11:22.686646	2018-07-05 16:11:22.69906	1387
7830	1314	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/86/08/LD0004860824_2_0004861697.jpg	\N	MSI GE63 8RE-027FR Raider RGB	\N	2.49	260.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:02:40.45356	2018-07-05 16:11:23.218921	1387
7817	1314	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/86/08/LD0004860824_2_0004861697_0004861997.jpg	\N	MSI GE63 8RE-028FR Raider RGB	\N	2.49	260.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:02:37.134522	2018-07-05 16:11:23.786221	1387
7703	1321	1567	1296	2	1	https://media.ldlc.com/ld/products/00/04/86/08/LD0004860824_2_0004861697_0004861997_0004862246.jpg	\N	MSI GE63 8RE-029XFR Raider RGB	\N	2.49	260.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:02:06.159429	2018-07-05 16:11:24.337584	1387
8405	1	1567	1396	2	1	https://media.ldlc.com/ld/products/00/04/86/08/LD0004860824_2_0004860911.jpg	\N	MSI GE63 8RF-026XFR Raider RGB	\N	2.49	260.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:11:25.846345	2018-07-05 16:11:25.856514	1387
7858	1314	1567	1396	2	1	https://media.ldlc.com/ld/products/00/04/86/08/LD0004860824_2.jpg	\N	MSI GE63 8RF-093FR Raider RGB	\N	2.49	260.0	383.0	\N	\N	\N	\N	AZERTY	t	t	LED	1920 x 1080 pixels	120	15	16/9	\N	t	t	2018-07-05 16:02:48.349706	2018-07-05 16:11:26.360155	1387
8513	1314	1562	1296	2	1	https://media.ldlc.com/ld/products/00/04/56/01/LD0004560148_2_0004649537.jpg	\N	Razer Blade Pro RZ09-02202F75-R3F1	\N	3.07	281.0	424.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	120	17	16/9	\N	t	t	2018-07-05 16:12:48.19374	2018-07-05 16:12:48.203666	1388
8514	1314	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/70/60/LD0004706056_2.jpg	\N	Razer Blade Stealth 13.3" RZ09-02393F31-R3F1	\N	1.35	206.0	321.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	3200 x 1800 pixels	60	13	16/9	\N	t	t	2018-07-05 16:12:48.804298	2018-07-05 16:12:48.812198	1388
8515	1314	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/54/58/LD0004545879_2_0004674781.jpg	\N	Razer Blade Stealth 13.3" RZ09-02393F32-R3F1	\N	1.35	206.0	321.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	3200 x 1800 pixels	60	13	16/9	\N	t	t	2018-07-05 16:12:49.342072	2018-07-05 16:12:49.354019	1388
8516	1314	1893	1461	3	1	https://media.ldlc.com/ld/products/00/04/94/74/LD0004947417_2.jpg	\N	Razer Blade Stealth 13.3" Gris RZ09-02394F32-R3F1	\N	1.35	206.0	321.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	3200 x 1800 pixels	60	13	16/9	\N	t	t	2018-07-05 16:12:49.854704	2018-07-05 16:12:49.867447	1388
8517	1314	1567	1396	2	1	https://media.ldlc.com/ld/products/00/04/92/37/LD0004923709_2_0004924129_0004924524.jpg	\N	Razer Blade 15" RZ09-02386F91-R3F1	\N	2.1	235.0	355.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	144	15	16/9	\N	t	t	2018-07-05 16:12:50.375076	2018-07-05 16:12:50.38666	1388
8518	1314	1936	1533	3	1	https://media.ldlc.com/ld/products/00/03/75/82/LD0003758227_2.jpg	\N	Thomson THBK2-12.32CTW	\N	\N	\N	\N	\N	\N	\N	\N	AZERTY	f	f	LED	1366 x 768 pixels	60	11	16/9	\N	t	t	2018-07-05 16:12:50.889824	2018-07-05 16:12:50.90223	1389
8519	1315	1500	1468	3	1	https://media.ldlc.com/ld/products/00/03/54/00/LD0003540080_2_0003540489.jpg	\N	Toshiba Portégé A30-C-10H	\N	1.5	229.0	316.0	\N	\N	\N	\N	AZERTY	f	t	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:12:51.407224	2018-07-05 16:12:51.420793	1390
8520	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/56/43/LD0004564372_2_0004565132.jpg	\N	Toshiba Portégé X30-D-10Z	\N	1.05	227.0	316.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:12:51.930702	2018-07-05 16:12:51.943033	1390
8521	1315	1800	1359	3	1	https://media.ldlc.com/ld/products/00/04/56/43/LD0004564372_2_0004564877.jpg	\N	Toshiba Portégé X30-D-111	\N	1.05	227.0	316.0	\N	\N	\N	\N	AZERTY	f	t	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:12:52.46049	2018-07-05 16:12:52.47453	1390
8522	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/56/43/LD0004564372_2_0004564877_0004564957.jpg	\N	Toshiba Portégé X30-D-112	\N	1.05	227.0	316.0	\N	\N	\N	\N	AZERTY	f	t	LED	1366 x 768 pixels	60	13	16/9	\N	t	t	2018-07-05 16:12:52.989374	2018-07-05 16:12:53.003369	1390
8523	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/56/43/LD0004564372_2_0004565107.jpg	\N	Toshiba Portégé X30-D-126	\N	1.05	227.0	316.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:12:53.586441	2018-07-05 16:12:53.599753	1390
8524	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/56/43/LD0004564372_2_0004565132_0004825341_0004825526.jpg	\N	Toshiba Portégé X30-D-15F	\N	1.05	227.0	316.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:12:54.10381	2018-07-05 16:12:54.117785	1390
8525	1315	1559	1359	3	1	https://media.ldlc.com/ld/products/00/04/56/43/LD0004564372_2_0004565132_0004825341.jpg	\N	Toshiba Portégé X30-D-15N	\N	1.05	227.0	316.0	\N	\N	\N	\N	AZERTY	f	t	LED	1920 x 1080 pixels	60	13	16/9	\N	t	t	2018-07-05 16:12:54.642135	2018-07-05 16:12:54.655099	1390
8526	1315	1902	1376	3	1	https://media.ldlc.com/ld/products/00/03/52/04/LD0003520499_2_0004357006_0004563050_0004607009.jpg	\N	Toshiba Portégé Z20t-C-13Q	\N	1.51	215.0	309.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	12	16/9	\N	t	t	2018-07-05 16:12:55.18419	2018-07-05 16:12:55.200344	1390
8527	1315	1902	1376	3	1	https://media.ldlc.com/ld/products/00/03/52/04/LD0003520499_2_0004357006_0004563050.jpg	\N	Toshiba Portégé Z20t-C-15H	\N	1.51	215.0	309.0	\N	\N	\N	\N	AZERTY	f	t	LED tactile	1920 x 1080 pixels	60	12	16/9	\N	t	t	2018-07-05 16:12:55.731762	2018-07-05 16:12:55.741233	1390
8528	1315	1797	1468	3	1	https://media.ldlc.com/ld/products/00/03/25/10/LD0003251011_2_0003251505_0003417311_0003502513_0003518364_0003634113_0004390447_0004608625.jpg	\N	Toshiba Satellite Pro A50-C-256	\N	2.1	258.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:56.289222	2018-07-05 16:12:56.306049	1390
8529	1315	1553	1343	3	1	https://media.ldlc.com/ld/products/00/03/25/10/LD0003251011_2_0003251505_0003309239_0003631813_0004064714_0004175422.jpg	\N	Toshiba Satellite Pro A50-C-26Q	\N	2.2	258.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:58.209576	2018-07-05 16:12:58.221384	1390
8530	1315	1929	1480	3	1	https://media.ldlc.com/ld/products/00/04/25/52/LD0004255221_2.jpg	\N	Toshiba Satellite Pro R50-C-14G	\N	2.2	258.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:58.769517	2018-07-05 16:12:58.781251	1390
8531	1314	1910	1480	3	1	https://media.ldlc.com/ld/products/00/04/25/52/LD0004255221_2_0004255495.jpg	\N	Toshiba Satellite Pro R50-C-14N	\N	2.2	258.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:59.279399	2018-07-05 16:12:59.289487	1390
8532	1315	1910	1480	3	1	https://media.ldlc.com/ld/products/00/04/25/52/LD0004255221_2_0004255495_0004255693.jpg	\N	Toshiba Satellite Pro R50-C-14P	\N	2.2	258.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:12:59.838141	2018-07-05 16:12:59.850817	1390
8533	1315	1797	1480	3	1	https://media.ldlc.com/ld/products/00/04/25/52/LD0004255221_2_0004255495_0004255693_0004350661.jpg	\N	Toshiba Satellite Pro R50-C-15P	\N	2.2	258.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:13:00.379572	2018-07-05 16:13:00.39049	1390
8534	1315	1797	1480	3	1	https://media.ldlc.com/ld/products/00/04/25/52/LD0004255221_2_0004255495_0004255693_0004350661_0004931137.jpg	\N	Toshiba Satellite Pro R50-C-15X	\N	2.2	258.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:13:00.966806	2018-07-05 16:13:00.976598	1390
8535	1315	1798	1468	3	1	https://media.ldlc.com/ld/products/00/03/54/06/LD0003540640_2_0003546997_0004255718.jpg	\N	Toshiba Tecra A50-C-1ZQ	\N	2.0	258.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:13:02.582333	2018-07-05 16:13:02.592266	1390
8536	1315	1500	1468	3	1	https://media.ldlc.com/ld/products/00/03/54/06/LD0003540640_2_0003546997_0004255718_0004255852.jpg	\N	Toshiba Tecra A50-C-1ZR	\N	2.0	258.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:13:03.102845	2018-07-05 16:13:03.11168	1390
8537	1315	1500	1468	3	1	https://media.ldlc.com/ld/products/00/03/54/06/LD0003540640_2_0003546997_0004255718_0004255852_0004562932.jpg	\N	Toshiba Tecra A50-C-1ZV	\N	2.2	258.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:13:04.624074	2018-07-05 16:13:04.635423	1390
8538	1315	1500	1343	3	1	https://media.ldlc.com/ld/products/00/03/54/06/LD0003540640_2_0004256004.jpg	\N	Toshiba Tecra A50-C-21C	\N	2.0	258.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1920 x 1080 pixels	60	15	16/9	\N	t	t	2018-07-05 16:13:05.141006	2018-07-05 16:13:05.14962	1390
8539	1315	1500	1468	3	1	https://media.ldlc.com/ld/products/00/03/54/06/LD0003540640_2_0003541634_0004255884.jpg	\N	Toshiba Tecra A50-C-C217	\N	2.0	258.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:13:05.816788	2018-07-05 16:13:05.829873	1390
8540	1315	1504	1359	3	1	https://media.ldlc.com/ld/products/00/04/56/57/LD0004565742_2.jpg	\N	Toshiba Tecra X40-D-10T	\N	1.25	228.9	332.0	\N	\N	\N	\N	AZERTY	f	t	LED	1366 x 768 pixels	60	14	16/9	\N	t	t	2018-07-05 16:13:07.365133	2018-07-05 16:13:07.378596	1390
8541	1315	1500	1468	3	1	https://media.ldlc.com/ld/products/00/03/25/10/LD0003251011_2_0003251505_0003417311_0003502513_0003518364_0003634113_0004390447.jpg	\N	Toshiba Satellite Pro A50-C-204	\N	2.1	258.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:13:07.873325	2018-07-05 16:13:07.886492	1390
8542	1315	1500	1468	3	1	https://media.ldlc.com/ld/products/00/03/25/10/LD0003251011_2_0003251505_0003417311_0003502513_0003518364_0003634113_0004390447_0004606236.jpg	\N	Toshiba Satellite Pro A50-C-205	\N	2.1	258.0	379.0	\N	\N	\N	\N	AZERTY	t	f	LED	1366 x 768 pixels	60	15	16/9	\N	t	t	2018-07-05 16:13:08.376128	2018-07-05 16:13:08.388502	1390
\.


--
-- Data for Name: computers_activities; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY computers_activities (id, name, description) FROM stdin;
1	N/A	\N
2	Gaming	\N
3	Bureautique	\N
4	Montage photo/vidéo	\N
\.


--
-- Name: computers_activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valentin
--

SELECT pg_catalog.setval('computers_activities_id_seq', 1, false);


--
-- Data for Name: computers_brands; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY computers_brands (id, name, description) FROM stdin;
1379	ldlc	\N
1380	acer	\N
1381	aorus	\N
1382	asus	\N
1383	gigabyte	\N
1384	hp	\N
1385	lenovo	\N
1386	microsoft	\N
1387	msi	\N
1388	razer	\N
1389	thomson	\N
1390	toshiba	\N
1391	fujitsu	\N
\.


--
-- Name: computers_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valentin
--

SELECT pg_catalog.setval('computers_brands_id_seq', 1391, true);


--
-- Data for Name: computers_chipsets; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY computers_chipsets (id, name, description) FROM stdin;
1	N/A	\N
\.


--
-- Name: computers_chipsets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valentin
--

SELECT pg_catalog.setval('computers_chipsets_id_seq', 1, false);


--
-- Data for Name: computers_cpus; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY computers_cpus (id, name, score, description) FROM stdin;
1349	AMD A10 Pro-7350B	25.6999999999999993	\N
1350	AMD A10-4655M	0	\N
1351	AMD A10-5745M	26.1000000000000014	\N
1352	AMD A10-5757M	0	\N
1353	AMD A10-7400P	0	\N
1354	AMD A10-9600P	30.6999999999999993	\N
1355	AMD A12-9700P	0	\N
1356	AMD A4 Micro-6400T	18.6999999999999993	\N
1357	AMD A4-1250	12.4000000000000004	\N
1358	AMD A4-3300M	0	\N
1359	AMD A4-3310MX	0	\N
1360	AMD A4-3330MX	0	\N
1361	AMD A4-4355M	0	\N
1362	AMD A4-5050	0	\N
1363	AMD A4-5145M	0	\N
1364	AMD A4-7210	23.6999999999999993	\N
1365	AMD A6 Pro-7050B	20.3999999999999986	\N
1366	AMD A6-3400M	0	\N
1367	AMD A6-3420M	0	\N
1368	AMD A6-4400M	0	\N
1369	AMD A6-5200	23.1999999999999993	\N
1370	AMD A6-5350M	23.8999999999999986	\N
1371	AMD A6-6310	24	\N
1372	AMD A6-7000	0	\N
1373	AMD A6-8500P	0	\N
1374	AMD A6-9220	25.1999999999999993	\N
1375	AMD A8-3500M	0	\N
1376	AMD A8-3520M	0	\N
1377	AMD A8-3550MX	0	\N
1378	AMD A8-4500M	0	\N
1379	AMD A8-4557M	0	\N
1380	AMD A8-5550M	27.8000000000000007	\N
1381	AMD A8-7200P	0	\N
1382	AMD A9-9410	26.3000000000000007	\N
1383	AMD A9-9420e	0	\N
1384	AMD C-50	0	\N
1385	AMD C-70	0	\N
1386	AMD E-300	0	\N
1387	AMD E-450	0	\N
1388	AMD E1-1200	0	\N
1389	AMD E1-2100	12.8000000000000007	\N
1390	AMD E1-2500	15.1999999999999993	\N
1391	AMD E1-7010	0	\N
1392	AMD E2-2000	0	\N
1393	AMD E2-3000M	0	\N
1394	AMD E2-6110	0	\N
1395	AMD E2-9000	20.6999999999999993	\N
1396	AMD FX-7500	25.8999999999999986	\N
1397	AMD FX-9800P	0	\N
1398	AMD GX-210JA	0	\N
1399	AMD Pro A12-8800B	29.3000000000000007	\N
1400	AMD PRO A12-9830B	0	\N
1401	AMD Pro A8-8600B	0	\N
1402	AMD Ryzen 3 2300U	0	\N
1403	AMD Ryzen 7 2700U	0	\N
1404	Intel Atom D2560	0	\N
1405	Intel Atom E3805	0	\N
1406	Intel Atom E3825	0	\N
1407	Intel Atom E3827	0	\N
1408	Intel Atom N2600	0	\N
1409	Intel Atom N2800	0	\N
1410	Intel Atom x7-Z8750	0	\N
1411	Intel Celeron 1005M	0	\N
1412	Intel Celeron 1017U	0	\N
1413	Intel Celeron 1020E	0	\N
1414	Intel Celeron 1037U	0	\N
1415	Intel Celeron 2950M	0	\N
1416	Intel Celeron 2957U	0	\N
1417	Intel Celeron 2970M	29.5	\N
1418	Intel Celeron 2981U	0	\N
1419	Intel Celeron 3215U	0	\N
1420	Intel Celeron 3765U	0	\N
1421	Intel Celeron 3965U	0	\N
1422	Intel Celeron 797	0	\N
1423	Intel Celeron 847	0	\N
1424	Intel Celeron 877	0	\N
1425	Intel Celeron 927UE	0	\N
1426	Intel Celeron B720	0	\N
1427	Intel Celeron B800	0	\N
1428	Intel Celeron B815	0	\N
1429	Intel Celeron B830	0	\N
1430	Intel Celeron J1750	0	\N
1431	Intel Celeron J1850	0	\N
1432	Intel Celeron J4005	0	\N
1433	Intel Celeron N2805	0	\N
1434	Intel Celeron N2807	0	\N
1435	Intel Celeron N2810	15.9000000000000004	\N
1436	Intel Celeron N2820	0	\N
1437	Intel Celeron N2840	0	\N
1438	Intel Celeron N2920	19.3999999999999986	\N
1439	Intel Celeron N2940	20.6000000000000014	\N
1440	Intel Celeron N3050	17	\N
1441	Intel Celeron N3150	19.8999999999999986	\N
1442	Intel Celeron N3350	20.1000000000000014	\N
1443	Intel Celeron N4000	25.6000000000000014	\N
1444	Intel Core i3-2308M	0	\N
1445	Intel Core i3-2312M	0	\N
1446	Intel Core i3-2330M	0	\N
1447	Intel Core i3-2350M	29.6999999999999993	\N
1448	Intel Core i3-2365M	0	\N
1449	Intel Core i3-2370M	0	\N
1450	Intel Core i3-2377M	0	\N
1451	Intel Core i3-3120M	0	\N
1452	Intel Core i3-3217U	25.8999999999999986	\N
1453	Intel Core i3-3227U	0	\N
1454	Intel Core i3-4000M	33.5	\N
1455	Intel Core i3-4010U	0	\N
1456	Intel Core i3-4012Y	22.6999999999999993	\N
1457	Intel Core i3-4025U	0	\N
1458	Intel Core i3-4030Y	0	\N
1459	Intel Core i3-4100M	0	\N
1460	Intel Core i3-4102E	0	\N
1461	Intel Core i3-4120U	0	\N
1462	Intel Core i3-5005U	30.3999999999999986	\N
1463	Intel Core i3-5015U	31	\N
1464	Intel Core i3-5157U	0	\N
1465	Intel Core i3-6100H	0	\N
1466	Intel Core i3-6157U	0	\N
1467	Intel Core i3-7100H	0	\N
1468	Intel Core i3-7130U	38.6000000000000014	\N
1469	Intel Core i3-8100H	0	\N
1470	Intel Core i3-8130U	45.5	\N
1471	Intel Core i5-2410M	0	\N
1472	Intel Core i5-2430M	0	\N
1473	Intel Core i5-2450M	0	\N
1474	Intel Core i5-2537M	0	\N
1475	Intel Core i5-2557M	0	\N
1476	Intel Core i5-3230M	35.5	\N
1477	Intel Core i5-3320M	0	\N
1478	Intel Core i5-3339Y	25.1000000000000014	\N
1479	Intel Core i5-3360M	0	\N
1480	Intel Core i5-3427U	0	\N
1481	Intel Core i5-3439Y	0	\N
1482	Intel Core i5-4200H	43.1000000000000014	\N
1483	Intel Core i5-4200U	33.7000000000000028	\N
1484	Intel Core i5-4202Y	27.6000000000000014	\N
1485	Intel Core i5-4210M	40.1000000000000014	\N
1486	Intel Core i5-4210Y	26.6999999999999993	\N
1487	Intel Core i5-4250U	0	\N
1488	Intel Core i5-4260U	0	\N
1489	Intel Core i5-4288U	0	\N
1490	Intel Core i5-4300U	35.7999999999999972	\N
1491	Intel Core i5-4302Y	0	\N
1492	Intel Core i5-4310M	0	\N
1493	Intel Core i5-4330M	0	\N
1494	Intel Core i5-4350U	0	\N
1495	Intel Core i5-4402E	0	\N
1496	Intel Core i5-5200U	36.3999999999999986	\N
1497	Intel Core i5-5257U	0	\N
1498	Intel Core i5-5300U	38.2999999999999972	\N
1499	Intel Core i5-5350U	0	\N
1500	Intel Core i5-6200U	39.1000000000000014	\N
1501	Intel Core i5-6267U	43.3999999999999986	\N
1502	Intel Core i5-6300HQ	48.7000000000000028	\N
1503	Intel Core i5-6350HQ	0	\N
1504	Intel Core i5-7200U	42.8999999999999986	\N
1505	Intel Core i5-7267U	44.6000000000000014	\N
1506	Intel Core i5-7300HQ	51.7999999999999972	\N
1507	Intel Core i5-7360U	0	\N
1508	Intel Core i5-7Y57	0	\N
1509	Intel Core i5-8300H	0	\N
1510	Intel Core i5-8350U	53.2999999999999972	\N
1511	Intel Core i5-8400H	0	\N
1512	Intel Core i7-2620M	0	\N
1513	Intel Core i7-2630QM	0	\N
1514	Intel Core i7-2637M	32.2000000000000028	\N
1515	Intel Core i7-2649M	0	\N
1516	Intel Core i7-2670QM	0	\N
1517	Intel Core i7-2677M	0	\N
1518	Intel Core i7-2720QM	0	\N
1519	Intel Core i7-2820QM	0	\N
1520	Intel Core i7-2920XM	0	\N
1521	Intel Core i7-3517U	0	\N
1522	Intel Core i7-3537U	0	\N
1523	Intel Core i7-3610QM	0	\N
1524	Intel Core i7-3615QM	0	\N
1525	Intel Core i7-3632QM	45.7000000000000028	\N
1526	Intel Core i7-3667U	0	\N
1527	Intel Core i7-3689Y	0	\N
1528	Intel Core i7-3740QM	0	\N
1529	Intel Core i7-3820QM	0	\N
1530	Intel Core i7-3920XM	0	\N
1531	Intel Core i7-4510U	38	\N
1532	Intel Core i7-4558U	0	\N
1533	Intel Core i7-4600M	0	\N
1534	Intel Core i7-4610M	0	\N
1535	Intel Core i7-4650U	38.5	\N
1536	Intel Core i7-4700MQ	52.1000000000000014	\N
1537	Intel Core i7-4702MQ	48.5	\N
1538	Intel Core i7-4710MQ	0	\N
1539	Intel Core i7-4712MQ	0	\N
1540	Intel Core i7-4722HQ	0	\N
1541	Intel Core i7-4760HQ	0	\N
1542	Intel Core i7-4800MQ	54.8999999999999986	\N
1543	Intel Core i7-4850HQ	0	\N
1544	Intel Core i7-4870HQ	54.1000000000000014	\N
1545	Intel Core i7-4910MQ	0	\N
1546	Intel Core i7-4940MX	58.2999999999999972	\N
1547	Intel Core i7-4960HQ	0	\N
1548	Intel Core i7-4980HQ	57.7999999999999972	\N
1549	Intel Core i7-5550U	0	\N
1550	Intel Core i7-5600U	41.3999999999999986	\N
1551	Intel Core i7-5700HQ	56.8999999999999986	\N
1552	Intel Core i7-5950HQ	0	\N
1553	Intel Core i7-6500U	42	\N
1554	Intel Core i7-6567U	0	\N
1555	Intel Core i7-6650U	0	\N
1556	Intel Core i7-6700HQ	55.2000000000000028	\N
1557	Intel Core i7-6820HK	57.5	\N
1558	Intel Core i7-6870HQ	0	\N
1559	Intel Core i7-7500U	45.8999999999999986	\N
1560	Intel Core i7-7567U	0	\N
1561	Intel Core i7-7660U	50.6000000000000014	\N
1562	Intel Core i7-7700HQ	59.3999999999999986	\N
1563	Intel Core i7-7820HQ	0	\N
1564	Intel Core i7-7Y75	40.6000000000000014	\N
1565	Intel Core i7-8650U	59.5	\N
1566	Intel Core i7-8706G	0	\N
1567	Intel Core i7-8750H	72.2999999999999972	\N
1568	Intel Core i7-8850H	0	\N
1569	Intel Core i9-8950HK	0	\N
1570	Intel Core M-5Y10a	0	\N
1571	Intel Core M-5Y31	0	\N
1572	Intel Core M-5Y70	32.6000000000000014	\N
1573	Intel Core m3-6Y30	31.3999999999999986	\N
1574	Intel Core m3-7Y32	0	\N
1575	Intel Core m5-6Y57	33.5	\N
1576	Intel Pentium 2020M	0	\N
1577	Intel Pentium 2117U	0	\N
1578	Intel Pentium 2129Y	0	\N
1579	Intel Pentium 3556U	24.8000000000000007	\N
1580	Intel Pentium 3560M	0	\N
1581	Intel Pentium 3561Y	0	\N
1582	Intel Pentium 3825U	29.1000000000000014	\N
1583	Intel Pentium 4405Y	0	\N
1584	Intel Pentium 967	0	\N
1585	Intel Pentium 987	0	\N
1586	Intel Pentium B940	0	\N
1587	Intel Pentium B960	0	\N
1588	Intel Pentium B980	0	\N
1589	Intel Pentium Gold 4415U	33.7000000000000028	\N
1590	Intel Pentium J2850	0	\N
1591	Intel Pentium N3510	0	\N
1592	Intel Pentium N3530	0	\N
1593	Intel Pentium N3700	21.1000000000000014	\N
1594	Intel Pentium N4200	24.8000000000000007	\N
1595	Intel Xeon E-2176M	0	\N
1596	Intel Xeon E3-1505M v5	57.7999999999999972	\N
1597	Intel Xeon E3-1515M v5	0	\N
1598	Intel Xeon E3-1535M v6	60.8999999999999986	\N
1599	Intel Xeon E3-1575M v5	0	\N
1600	Intel Xeon W-2145	0	\N
1601	Qualcomm Snapdragon 835 (8998)	0	\N
1602	AMD A10-5800K	0	\N
1603	AMD A10-7700K	35.7000000000000028	\N
1604	AMD A6-6400K	0	\N
1605	AMD A8-3850	0	\N
1606	AMD Ryzen 3 1300X	53.5	\N
1607	AMD Ryzen 5 1400	51.6000000000000014	\N
1608	AMD Ryzen 5 1600	62.2000000000000028	\N
1609	AMD Ryzen 5 2600X	0	\N
1610	AMD Ryzen 7 1700X	70.5999999999999943	\N
1611	AMD Ryzen 7 2700	71.7999999999999972	\N
1612	AMD Ryzen 7 2700X	0	\N
1613	Intel Celeron J4105	0	\N
1614	Intel Core i3-3220	0	\N
1615	Intel Core i5-2400	0	\N
1616	Intel Core i5-3470	0	\N
1617	Intel Core i5-3570K	0	\N
1618	Intel Core i5-4430	0	\N
1619	Intel Core i5-4590	0	\N
1620	Intel Core i5-6500T	48.7000000000000028	\N
1621	Intel Core i5-6600T	51.5	\N
1622	Intel Core i5-7500T	0	\N
1623	Intel Core i5-8400	69.2999999999999972	\N
1624	Intel Core i5-8600K	72	\N
1625	Intel Core i7-2700K	0	\N
1626	Intel Core i7-3770K	0	\N
1627	Intel Core i7-4790	0	\N
1628	Intel Core i7-4790S	0	\N
1629	Intel Core i7-4960X	0	\N
1630	Intel Core i7-5960X	69.2999999999999972	\N
1631	Intel Core i7-6700	63.2000000000000028	\N
1632	Intel Core i7-6700K	66.7999999999999972	\N
1633	Intel Core i7-7700	0	\N
1634	Intel Core i7-7700K	73.0999999999999943	\N
1635	Intel Core i7-8700	77.2000000000000028	\N
1636	Intel Core i9-7900X	93	\N
1637	Intel Pentium G4500T	38	\N
1638	Intel Xeon E3-1230 v3	0	\N
1639	Intel Xeon E3-1280 v5	0	\N
1640	Intel Xeon E5-2680	0	\N
1641	Intel Xeon E5-2697 v2	65.0999999999999943	\N
1642	AMD A10-6800K	38.5	\N
1643	AMD A10-7850K	37.1000000000000014	\N
1644	AMD A4-5300	26.1999999999999993	\N
1645	AMD A8-5600K	35	\N
1646	AMD A8-6600K	0	\N
1647	AMD A8-7650K	35.3999999999999986	\N
1648	AMD FX-8350	45.8999999999999986	\N
1649	AMD Ryzen 3 1200	48.1000000000000014	\N
1650	AMD Ryzen 3 2200G	53.7000000000000028	\N
1651	AMD Ryzen 5 1500X	58	\N
1652	AMD Ryzen 5 2400G	58.1000000000000014	\N
1653	AMD Ryzen 5 2600	68.2000000000000028	\N
1654	AMD Ryzen 7 1700	65.2999999999999972	\N
1655	AMD Ryzen 7 1800X	72.5999999999999943	\N
1656	AMD Ryzen Threadripper 1950X	0	\N
1657	Intel Core i5-2500K	0	\N
1658	Intel Core i5-3550	0	\N
1659	Intel Core i5-4460	50.6000000000000014	\N
1660	Intel Core i5-6400T	45.1000000000000014	\N
1661	Intel Core i5-6500	55	\N
1662	Intel Core i5-6600K	0	\N
1663	Intel Core i5-7500	0	\N
1664	Intel Core i5-7600K	65.4000000000000057	\N
1665	Intel Core i7-2600K	51.1000000000000014	\N
1666	Intel Core i7-3960X	61.8999999999999986	\N
1667	Intel Core i7-4770K	0	\N
1668	Intel Core i7-4790K	65.5999999999999943	\N
1669	Intel Core i7-5775C	59.7999999999999972	\N
1670	Intel Core i7-6700T	56.6000000000000014	\N
1671	Intel Core i7-6950X	80.0999999999999943	\N
1672	Intel Core i7-7740X	74.2000000000000028	\N
1673	Intel Core i7-8700K	82.2000000000000028	\N
1674	Intel Pentium G860	0	\N
1675	Intel Xeon E3-1226 v3	0	\N
1676	Intel Xeon E3-1231 v3	0	\N
1677	Intel Xeon E5-2680 v4	0	\N
1678	AMD A10 Micro-6700T	0	\N
1679	AMD A10-4600M	26.3000000000000007	\N
1680	AMD A10-4657M	0	\N
1681	AMD A10-5750M	29.8000000000000007	\N
1682	AMD A10-7300	25.3999999999999986	\N
1683	AMD A10-8700P	29	\N
1684	AMD A10-9620P	0	\N
1685	AMD A12-9720P	0	\N
1686	AMD A4-1200	12.4000000000000004	\N
1687	AMD A4-1350	0	\N
1688	AMD A4-3305M	0	\N
1689	AMD A4-3320M	0	\N
1690	AMD A4-4300M	22	\N
1691	AMD A4-5000	19.8000000000000007	\N
1692	AMD A4-5100	0	\N
1693	AMD A4-5150M	23.1000000000000014	\N
1694	AMD A4-6210	21.3999999999999986	\N
1695	AMD A4-9120	0	\N
1696	AMD A6-1450	0	\N
1697	AMD A6-3410MX	0	\N
1698	AMD A6-3430MX	0	\N
1699	AMD A6-4455M	0	\N
1700	AMD A6-5345M	0	\N
1701	AMD A6-5357M	0	\N
1702	AMD A6-7310	0	\N
1703	AMD A6-9210	0	\N
1704	AMD A8 Pro-7150B	0	\N
1705	AMD A8-3510MX	0	\N
1706	AMD A8-3530MX	0	\N
1707	AMD A8-4555M	0	\N
1708	AMD A8-5545M	0	\N
1709	AMD A8-5557M	0	\N
1710	AMD A8-6410	24.8000000000000007	\N
1711	AMD A8-7100	22.3999999999999986	\N
1712	AMD A8-7410	24.1999999999999993	\N
1713	AMD A8-8600P	0	\N
1714	AMD A9-9420	0	\N
1715	AMD C-30	0	\N
1716	AMD C-60	0	\N
1717	AMD E-240	0	\N
1718	AMD E-350	0	\N
1719	AMD E1 Micro-6200T	0	\N
1720	AMD E1-1500	0	\N
1721	AMD E1-2200	0	\N
1722	AMD E1-6010	14.5	\N
1723	AMD E2-1800	0	\N
1724	AMD E2-3000	0	\N
1725	AMD E2-3800	0	\N
1726	AMD E2-7110	21.6999999999999993	\N
1727	AMD E2-9010	0	\N
1728	AMD FX-7600P	30.8999999999999986	\N
1729	AMD FX-8800P	33.7999999999999972	\N
1730	AMD FX-9830P	0	\N
1731	AMD Pro A10-8700B	26.5	\N
1732	AMD PRO A12-9800B	30.6000000000000014	\N
1733	AMD Pro A6-8500B	0	\N
1734	AMD PRO A8-9600B	28.6000000000000014	\N
1735	AMD Ryzen 3 2200U	36.8999999999999986	\N
1736	AMD Ryzen 5 2500U	47.6000000000000014	\N
1737	CSR8670	0	\N
1738	Intel Atom D2550	0	\N
1739	Intel Atom D2700	0	\N
1740	Intel Atom E3815	0	\N
1741	Intel Atom E3826	0	\N
1742	Intel Atom E3845	0	\N
1743	Intel Atom N2650	0	\N
1744	Intel Atom N2850	0	\N
1745	Intel Celeron 1000M	0	\N
1746	Intel Celeron 1007U	0	\N
1747	Intel Celeron 1019Y	0	\N
1748	Intel Celeron 1020M	0	\N
1749	Intel Celeron 1047UE	0	\N
1750	Intel Celeron 2955U	0	\N
1751	Intel Celeron 2961Y	0	\N
1752	Intel Celeron 2980U	0	\N
1753	Intel Celeron 3205U	0	\N
1754	Intel Celeron 3755U	0	\N
1755	Intel Celeron 3865U	0	\N
1756	Intel Celeron 3965Y	0	\N
1757	Intel Celeron 807	0	\N
1758	Intel Celeron 867	0	\N
1759	Intel Celeron 887	0	\N
1760	Intel Celeron B710	0	\N
1761	Intel Celeron B730	0	\N
1762	Intel Celeron B810	0	\N
1763	Intel Celeron B820	0	\N
1764	Intel Celeron B840	0	\N
1765	Intel Celeron J1800	0	\N
1766	Intel Celeron J1900	0	\N
1767	Intel Celeron N2806	0	\N
1768	Intel Celeron N2808	0	\N
1769	Intel Celeron N2815	0	\N
1770	Intel Celeron N2830	0	\N
1771	Intel Celeron N2910	0	\N
1772	Intel Celeron N2930	20.6000000000000014	\N
1773	Intel Celeron N3000	0	\N
1774	Intel Celeron N3060	0	\N
1775	Intel Celeron N3160	0	\N
1776	Intel Celeron N3450	23.1000000000000014	\N
1777	Intel Celeron N4100	0	\N
1778	Intel Core i3-2310M	0	\N
1779	Intel Core i3-2328M	0	\N
1780	Intel Core i3-2348M	0	\N
1781	Intel Core i3-2357M	0	\N
1782	Intel Core i3-2367M	0	\N
1783	Intel Core i3-2375M	0	\N
1784	Intel Core i3-3110M	0	\N
1785	Intel Core i3-3130M	0	\N
1786	Intel Core i3-3229Y	0	\N
1787	Intel Core i3-4005U	26.5	\N
1788	Intel Core i3-4010Y	0	\N
1789	Intel Core i3-4020Y	0	\N
1790	Intel Core i3-4030U	28.1000000000000014	\N
1791	Intel Core i3-4100E	0	\N
1792	Intel Core i3-4100U	0	\N
1793	Intel Core i3-4110M	0	\N
1794	Intel Core i3-4158U	29.3999999999999986	\N
1795	Intel Core i3-5010U	31	\N
1796	Intel Core i3-5020U	0	\N
1797	Intel Core i3-6006U	0	\N
1798	Intel Core i3-6100U	34.3999999999999986	\N
1799	Intel Core i3-6167U	0	\N
1800	Intel Core i3-7100U	0	\N
1801	Intel Core i3-7167U	0	\N
1802	Intel Core i3-8121U	0	\N
1803	Intel Core i5-2415M	0	\N
1804	Intel Core i5-2435M	0	\N
1805	Intel Core i5-2467M	0	\N
1806	Intel Core i5-2520M	0	\N
1807	Intel Core i5-2540M	0	\N
1808	Intel Core i5-3210M	0	\N
1809	Intel Core i5-3317U	0	\N
1810	Intel Core i5-3337U	33.2999999999999972	\N
1811	Intel Core i5-3340M	0	\N
1812	Intel Core i5-3380M	0	\N
1813	Intel Core i5-3437U	35.1000000000000014	\N
1814	Intel Core i5-4200M	39.3999999999999986	\N
1815	Intel Core i5-4200Y	0	\N
1816	Intel Core i5-4210H	42.7999999999999972	\N
1817	Intel Core i5-4210U	34.6000000000000014	\N
1818	Intel Core i5-4220Y	0	\N
1819	Intel Core i5-4258U	38.5	\N
1820	Intel Core i5-4278U	0	\N
1821	Intel Core i5-4300M	0	\N
1822	Intel Core i5-4300Y	26.3999999999999986	\N
1823	Intel Core i5-4308U	0	\N
1824	Intel Core i5-4310U	39.1000000000000014	\N
1825	Intel Core i5-4340M	0	\N
1826	Intel Core i5-4360U	0	\N
1827	Intel Core i5-5250U	36.2000000000000028	\N
1828	Intel Core i5-5287U	0	\N
1829	Intel Core i5-5350H	0	\N
1830	Intel Core i5-6198DU	39.5	\N
1831	Intel Core i5-6260U	39.7000000000000028	\N
1832	Intel Core i5-6287U	0	\N
1833	Intel Core i5-6300U	41	\N
1834	Intel Core i5-6360U	41.5	\N
1835	Intel Core i5-6440HQ	51.7999999999999972	\N
1836	Intel Core i5-7260U	0	\N
1837	Intel Core i5-7287U	0	\N
1838	Intel Core i5-7300U	46.2000000000000028	\N
1839	Intel Core i5-7440HQ	0	\N
1840	Intel Core i5-7Y54	35.5	\N
1841	Intel Core i5-8250U	51.7000000000000028	\N
1842	Intel Core i5-8305G	58.6000000000000014	\N
1843	Intel Core i7-2617M	0	\N
1844	Intel Core i7-2629M	0	\N
1845	Intel Core i7-2635QM	0	\N
1846	Intel Core i7-2640M	0	\N
1847	Intel Core i7-2657M	0	\N
1848	Intel Core i7-2675QM	0	\N
1849	Intel Core i7-2760QM	0	\N
1850	Intel Core i7-2860QM	0	\N
1851	Intel Core i7-2960XM	0	\N
1852	Intel Core i7-3520M	0	\N
1853	Intel Core i7-3540M	0	\N
1854	Intel Core i7-3612QM	0	\N
1855	Intel Core i7-3630QM	0	\N
1856	Intel Core i7-3635QM	0	\N
1857	Intel Core i7-3687U	0	\N
1858	Intel Core i7-3720QM	50.8999999999999986	\N
1859	Intel Core i7-3840QM	0	\N
1860	Intel Core i7-3940XM	0	\N
1861	Intel Core i7-4500U	37.6000000000000014	\N
1862	Intel Core i7-4550U	0	\N
1863	Intel Core i7-4578U	0	\N
1864	Intel Core i7-4600U	38.6000000000000014	\N
1865	Intel Core i7-4610Y	34.1000000000000014	\N
1866	Intel Core i7-4700HQ	51.2000000000000028	\N
1867	Intel Core i7-4702HQ	0	\N
1868	Intel Core i7-4710HQ	52.6000000000000014	\N
1869	Intel Core i7-4712HQ	0	\N
1870	Intel Core i7-4720HQ	53.2000000000000028	\N
1871	Intel Core i7-4750HQ	49.5	\N
1872	Intel Core i7-4770HQ	0	\N
1873	Intel Core i7-4810MQ	54.2000000000000028	\N
1874	Intel Core i7-4860HQ	0	\N
1875	Intel Core i7-4900MQ	55	\N
1876	Intel Core i7-4930MX	57.1000000000000014	\N
1877	Intel Core i7-4950HQ	0	\N
1878	Intel Core i7-5500U	39.7000000000000028	\N
1879	Intel Core i7-5557U	44.7000000000000028	\N
1880	Intel Core i7-5650U	40.7999999999999972	\N
1881	Intel Core i7-5750HQ	0	\N
1882	Intel Core i7-5850HQ	0	\N
1883	Intel Core i7-6560U	0	\N
1884	Intel Core i7-6600U	44.2000000000000028	\N
1885	Intel Core i7-6770HQ	0	\N
1886	Intel Core i7-6820HQ	56.6000000000000014	\N
1887	Intel Core i7-6920HQ	59.8999999999999986	\N
1888	Intel Core i7-6970HQ	0	\N
1889	Intel Core i7-7560U	0	\N
1890	Intel Core i7-7600U	48.7999999999999972	\N
1891	Intel Core i7-7820HK	61.2000000000000028	\N
1892	Intel Core i7-7920HQ	0	\N
1893	Intel Core i7-8550U	54.8999999999999986	\N
1894	Intel Core i7-8705G	0	\N
1895	Intel Core i7-8709G	0	\N
1896	Intel Core i7-8809G	66.5999999999999943	\N
1897	Intel Core M-5Y10	28	\N
1898	Intel Core M-5Y10c	0	\N
1899	Intel Core M-5Y51	28.3999999999999986	\N
1900	Intel Core M-5Y71	33	\N
1901	Intel Core m3-7Y30	36.1000000000000014	\N
1902	Intel Core m5-6Y54	32.8999999999999986	\N
1903	Intel Core m7-6Y75	33.8999999999999986	\N
1904	Intel Pentium 2030M	0	\N
1905	Intel Pentium 2127U	0	\N
1906	Intel Pentium 3550M	0	\N
1907	Intel Pentium 3558U	24.8000000000000007	\N
1908	Intel Pentium 3560Y	0	\N
1909	Intel Pentium 3805U	0	\N
1910	Intel Pentium 4405U	0	\N
1911	Intel Pentium 957	0	\N
1912	Intel Pentium 977	0	\N
1913	Intel Pentium 997	0	\N
1914	Intel Pentium B950	0	\N
1915	Intel Pentium B970	0	\N
1916	Intel Pentium Gold 4410Y	0	\N
1917	Intel Pentium Gold 4415Y	0	\N
1918	Intel Pentium J2900	0	\N
1919	Intel Pentium N3520	21.5	\N
1920	Intel Pentium N3540	0	\N
1921	Intel Pentium N3710	22.3000000000000007	\N
1922	Intel Pentium Silver N5000	30.6000000000000014	\N
1923	Intel Xeon E-2186M	0	\N
1924	Intel Xeon E3-1505M v6	62.1000000000000014	\N
1925	Intel Xeon E3-1535M v5	59.2000000000000028	\N
1926	Intel Xeon E3-1545M v5	0	\N
1927	Qualcomm Snapdragon 845	0	\N
1928	VIA Nano QuadCore L4700	0	\N
1929	Intel Celeron 3855U	0	\N
1930	Mediatek M8173C	0	\N
1931	AMD A9-9400	0	\N
1932	Intel Atom x5-Z8350	0	\N
1933	Intel Atom x5-Z5800	0	\N
1934	Intel Pentium 4415U	0	\N
1935	Intel Atom x5-Z8550	0	\N
1936	Intel Cherry Trail Z8300	0	\N
1937	Intel Atom Z3735F	0	\N
1938	Intel Core i5	0	\N
1939	Intel Core i7	0	\N
1940		0	\N
1941	Intel Core m3	0	\N
\.


--
-- Name: computers_cpus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valentin
--

SELECT pg_catalog.setval('computers_cpus_id_seq', 1941, true);


--
-- Data for Name: computers_disks; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY computers_disks (id, computer_id, size, interface, type) FROM stdin;
\.


--
-- Name: computers_disks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valentin
--

SELECT pg_catalog.setval('computers_disks_id_seq', 1, false);


--
-- Data for Name: computers_gpus; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY computers_gpus (id, name, score, description, memory_type, max_memory) FROM stdin;
1379	Intel HD Graphics 505	1.80000000000000004	\N		\N
1380	AMD Radeon R4 (Stoney Ridge)	1.89999999999999991	\N		\N
1290	NVIDIA GeForce GTX 1080 SLI	93.5999999999999943	\N	GDDR5	\N
1291	NVIDIA GeForce GTX 1080	68.5999999999999943	\N	GDDR5X	\N
1292	NVIDIA GeForce GTX 1080 Max-Q	62.1000000000000014	\N	GDDR5X	\N
1293	NVIDIA Quadro P5000	47	\N	GDDR5	\N
1294	NVIDIA GeForce GTX 980M SLI	67.2000000000000028	\N		\N
1295	NVIDIA GeForce GTX 970M SLI	52.5	\N		\N
1296	NVIDIA GeForce GTX 1060	39.7000000000000028	\N	GDDR5	\N
1297	AMD Radeon RX 580	37.6000000000000014	\N	GDDR5	\N
1298	NVIDIA Quadro P3000	34.2999999999999972	\N	GDDR5	\N
1299	NVIDIA GeForce GTX 880M SLI	41.7000000000000028	\N	GDDR5	\N
1300	NVIDIA GeForce GTX 980M	35.2999999999999972	\N		\N
1301	AMD Radeon RX Vega M GL / 870	23.6000000000000014	\N		\N
1302	NVIDIA GeForce GTX 970M	27.8000000000000007	\N		\N
1303	AMD Radeon R9 M295X	20.6999999999999993	\N	GDDR5	\N
1304	NVIDIA GeForce GTX 1050	20.5	\N	GDDR5	\N
1305	AMD Radeon R9 M395	20.8999999999999986	\N		\N
1306	AMD Radeon RX 560	19.8000000000000007	\N	GDDR5	\N
1307	NVIDIA Quadro K5100M	16.8000000000000007	\N	GDDR5	\N
1308	NVIDIA Quadro M2200	20.5	\N	GDDR5	\N
1309	AMD Radeon R9 M290X	18	\N	GDDR5	\N
1310	AMD FirePro M6100	13.6999999999999993	\N	GDDR5	\N
1311	AMD Radeon Pro 460	14.6999999999999993	\N	GDDR5	\N
1312	AMD Radeon RX 550	12.5	\N	GDDR5	\N
1313	AMD Radeon Pro 555	12.3000000000000007	\N	GDDR5	\N
1314	NVIDIA GeForce MX150	10.4000000000000004	\N	GDDR5	\N
1315	NVIDIA Quadro K5000M	12.5	\N	GDDR5	\N
1316	NVIDIA GeForce GTX 770M	12.6999999999999993	\N	GDDR5	\N
1317	AMD Radeon Pro WX 3100 Mobile	10	\N	GDDR5	\N
1318	NVIDIA GeForce GTX 950M	11.5999999999999996	\N	DDR3/GDDR5	\N
1319	AMD Radeon R9 M385X	12.1999999999999993	\N	GDDR5	\N
1320	NVIDIA Quadro M1000M	12.6999999999999993	\N		\N
1321	AMD Radeon R9 M280X	12.5999999999999996	\N	GDDR5	\N
1322	NVIDIA GeForce 945M	10.5	\N		\N
1323	NVIDIA Quadro K4000M	10.3000000000000007	\N	GDDR5	\N
1324	Intel Iris Pro Graphics 580	7.90000000000000036	\N		\N
1325	NVIDIA Quadro K3100M	10	\N	GDDR5	\N
1326	AMD Radeon R9 M370X	8.40000000000000036	\N	GDDR5	\N
1327	AMD Radeon R9 M275	6.20000000000000018	\N		\N
1328	AMD FirePro W5130M	7.79999999999999982	\N		\N
1329	NVIDIA Quadro K2100M	6.40000000000000036	\N		\N
1330	NVIDIA GeForce 845M	7.5	\N		\N
1331	AMD Radeon R7 M465	6.59999999999999964	\N		\N
1332	NVIDIA GeForce GT 750M	5.90000000000000036	\N	DDR3, GDDR5	\N
1333	NVIDIA Quadro M520	7.29999999999999982	\N	GDDR5	\N
1334	NVIDIA GeForce 940MX	6.20000000000000018	\N	GDDR5/DDR3	\N
1335	AMD Radeon RX Vega 8	8.19999999999999929	\N		\N
1336	NVIDIA GeForce 930MX	4.90000000000000036	\N	GDDR5/DDR3	\N
1337	AMD FirePro W4190M	6.70000000000000018	\N	GDDR5	\N
1338	AMD Radeon R7 M445	5.20000000000000018	\N		\N
1339	NVIDIA Quadro M500M	4.5	\N		\N
1340	AMD Radeon R7 M275DX	6	\N	DDR3	\N
1341	AMD Radeon R7 (Bristol Ridge)	2.89999999999999991	\N		\N
1342	NVIDIA GeForce GT 740M	4	\N	DDR3	\N
1343	NVIDIA GeForce 930M	4.5	\N	DDR3	\N
1344	AMD Radeon 530	3.39999999999999991	\N		\N
1345	Intel Iris Plus Graphics 640	6.09999999999999964	\N		\N
1346	Intel Iris Graphics 540	6.09999999999999964	\N		\N
1347	NVIDIA GeForce GT 735M	3.70000000000000018	\N	DDR3	\N
1348	AMD FirePro M4000	6.79999999999999982	\N	GDDR5	\N
1349	NVIDIA GeForce GT 730M	3.89999999999999991	\N		\N
1350	AMD Radeon R7 M270	3.39999999999999991	\N	DDR3	\N
1351	NVIDIA GeForce GT 640M	4.90000000000000036	\N	DDR3, GDDR5	\N
1352	AMD Radeon R7 (Kaveri)	3.5	\N		\N
1353	AMD Radeon R7 M460	3.29999999999999982	\N		\N
1354	NVIDIA GeForce 920M	3.89999999999999991	\N	DDR3	\N
1355	AMD Radeon R7 M440	3.29999999999999982	\N		\N
1356	AMD Radeon R7 M340	3.29999999999999982	\N	DDR3	\N
1357	AMD Radeon R6 M340DX	4.79999999999999982	\N		\N
1358	AMD Radeon R5 (Bristol Ridge)	4.5	\N		\N
1359	Intel HD Graphics 620	4.20000000000000018	\N		\N
1360	AMD Radeon R6 (Kaveri)	2.89999999999999991	\N		\N
1361	AMD Radeon R6 M255DX	3.89999999999999991	\N		\N
1362	AMD Radeon R5 M335	2.5	\N	DDR3	\N
1363	AMD Radeon R5 M430	3	\N		\N
1364	NVIDIA GeForce 910M	3.60000000000000009	\N	DDR3	\N
1365	AMD Radeon RX Vega 3	4.59999999999999964	\N		\N
1366	Intel Iris Graphics 6100	4.20000000000000018	\N		\N
1367	AMD Radeon R5 (Stoney Ridge)	2.29999999999999982	\N		\N
1368	AMD Radeon R5 M320	2.70000000000000018	\N	DDR3	\N
1369	AMD Radeon R5 M315	2.70000000000000018	\N	DDR3	\N
1370	NVIDIA Quadro K610M	3.20000000000000018	\N		\N
1371	AMD Radeon HD 8610G	1.5	\N		\N
1372	Intel HD Graphics 5500	3	\N		\N
1373	AMD Radeon R5 (Carrizo)	3.10000000000000009	\N		\N
1374	NVIDIA GeForce 710M	2.89999999999999991	\N		\N
1375	Intel HD Graphics 5000	3.10000000000000009	\N		\N
1376	Intel HD Graphics 515	3	\N		\N
1377	Intel HD Graphics 610	2.79999999999999982	\N		\N
1378	Intel HD Graphics 5300	2	\N		\N
1381	Intel HD Graphics (Broadwell)	2.20000000000000018	\N		\N
1382	AMD Radeon R4 (Beema)	1.80000000000000004	\N		\N
1383	AMD Radeon R2 (Stoney Ridge)	1.80000000000000004	\N		\N
1384	AMD Radeon HD 8450G	1.69999999999999996	\N		\N
1385	AMD Radeon HD 8350G	1.60000000000000009	\N		\N
1386	Intel UHD Graphics 600	1.89999999999999991	\N		\N
1387	Intel HD Graphics 405 (Braswell)	1.10000000000000009	\N		\N
1388	Intel HD Graphics 400 (Braswell)	1	\N		\N
1389	AMD Radeon R2 (Mullins/Beema/Carrizo-L)	1.39999999999999991	\N		\N
1390	AMD Radeon HD 8280	1.39999999999999991	\N		\N
1391	AMD Radeon R6 (Mullins)	1.19999999999999996	\N		\N
1392	AMD Radeon HD 8210	1	\N		\N
1393	AMD Radeon HD 7310	0.900000000000000022	\N		\N
1394	NVIDIA GeForce GTX 1070 SLI	82.5999999999999943	\N	GDDR5	\N
1395	NVIDIA GeForce GTX 980 SLI	84.0999999999999943	\N	GDDR5	\N
1477	AMD Radeon HD 7660G	3.5	\N		\N
1396	NVIDIA GeForce GTX 1070	54.7000000000000028	\N	GDDR5	\N
1397	NVIDIA GeForce GTX 1070 Max-Q	54	\N	GDDR5	\N
1398	NVIDIA GeForce GTX 980	41.6000000000000014	\N	GDDR5	\N
1399	NVIDIA Quadro P4000	29.1999999999999993	\N	GDDR5	\N
1400	NVIDIA Quadro P4000 Max-Q	40.6000000000000014	\N	GDDR5	\N
1401	AMD Radeon RX Vega M GH	32.1000000000000014	\N		\N
1402	NVIDIA GeForce GTX 1060 Max-Q	38.6000000000000014	\N	GDDR5	\N
1403	NVIDIA GeForce GTX 965M SLI	27.6999999999999993	\N		\N
1404	NVIDIA Quadro M5000M	34.5	\N		\N
1405	NVIDIA GeForce GTX 1050 Ti	27.3999999999999986	\N	GDDR5	\N
1406	NVIDIA Quadro M4000M	26.6999999999999993	\N		\N
1407	NVIDIA Quadro M3000M	24.1999999999999993	\N		\N
1408	AMD FirePro W7170M	23.3999999999999986	\N	GDDR5	\N
1409	NVIDIA GeForce GTX 880M	21.6000000000000014	\N	GDDR5	\N
1410	NVIDIA GeForce GTX 780M	19.5	\N	GDDR5	\N
1411	NVIDIA GeForce GTX 965M	18.8000000000000007	\N	GDDR5	\N
1412	NVIDIA GeForce GTX 870M	17	\N	GDDR5	\N
1413	AMD Radeon RX 460	17	\N	GDDR5	\N
1414	AMD Radeon Pro 560	12.5	\N	GDDR5	\N
1415	NVIDIA GeForce GTX 960M	16.3000000000000007	\N	GDDR5	\N
1416	NVIDIA Quadro M1200	14.9000000000000004	\N	GDDR5	\N
1417	AMD Radeon Pro 455	12.6999999999999993	\N	GDDR5	\N
1418	NVIDIA Quadro M2000M	16.1000000000000014	\N		\N
1419	NVIDIA Quadro K4100M	13.4000000000000004	\N	GDDR5	\N
1420	AMD Radeon RX 540	12.5999999999999996	\N	GDDR5	\N
1421	NVIDIA GeForce GTX 860M	15.0999999999999996	\N	GDDR5	\N
1422	AMD Radeon Pro 450	11.6999999999999993	\N	GDDR5	\N
1423	NVIDIA GeForce GTX 850M	11.9000000000000004	\N	DDR3, GDDR5	\N
1424	NVIDIA Quadro M620	12.5999999999999996	\N	GDDR5	\N
1425	NVIDIA GeForce GTX 765M	9.5	\N	GDDR5	\N
1426	AMD Radeon RX Vega 10	8.5	\N		\N
1427	AMD Radeon R9 M470	13.1999999999999993	\N		\N
1428	AMD FirePro W5170M	10.3000000000000007	\N		\N
1429	NVIDIA GeForce GTX 760M	8.59999999999999964	\N	GDDR5	\N
1430	NVIDIA Maxwell GPU Surface Book (940M, GDDR5)	6.20000000000000018	\N	GDDR5	\N
1431	AMD FirePro M5100	9.09999999999999964	\N		\N
1432	NVIDIA GeForce GT 755M	8.09999999999999964	\N	GDDR5	\N
1433	AMD Radeon R9 M265X	6.79999999999999982	\N	GDDR5	\N
1434	AMD FirePro W4170M	6.79999999999999982	\N	GDDR5	\N
1435	Intel Iris Pro Graphics 6200	8.30000000000000071	\N		\N
1436	NVIDIA GeForce MX130	6.79999999999999982	\N		\N
1437	NVIDIA Quadro K1100M	5	\N		\N
1438	NVIDIA GeForce 940M	4.79999999999999982	\N	DDR3	\N
1439	NVIDIA Quadro M600M	10	\N		\N
1440	AMD Radeon R9 M375	4.59999999999999964	\N		\N
1441	AMD Radeon R7 M370	5.59999999999999964	\N		\N
1442	NVIDIA GeForce 840M	4.70000000000000018	\N	DDR3	\N
1443	NVIDIA GeForce GT 745M	5.5	\N	DDR3, GDDR5	\N
1444	Intel Iris Pro Graphics 5200	6.5	\N		\N
1445	Intel Iris Plus Graphics 650	7.09999999999999964	\N		\N
1446	Intel Iris Graphics 550	6.90000000000000036	\N		\N
1447	NVIDIA GeForce 830M	4.40000000000000036	\N	DDR3	\N
1448	NVIDIA GeForce 920MX	4.90000000000000036	\N	GDDR5/DDR3	\N
1449	NVIDIA Quadro K2000M	4.70000000000000018	\N	DDR3	\N
1450	NVIDIA GeForce 825M	4	\N		\N
1451	AMD Radeon R7 M260X	4.90000000000000036	\N	GDDR5	\N
1452	AMD FirePro M4100	3.39999999999999991	\N		\N
1453	AMD Radeon R7 M265	4.59999999999999964	\N	DDR3	\N
1454	AMD Radeon R7 (Carrizo)	4	\N		\N
1455	AMD Radeon R8 M365DX	6.09999999999999964	\N		\N
1456	AMD Radeon R7 M360	3.10000000000000009	\N		\N
1457	AMD Radeon R8 M445DX	6.70000000000000018	\N		\N
1458	AMD Radeon R7 M260	3	\N	DDR3	\N
1459	AMD Radeon 520	3.29999999999999982	\N		\N
1460	Intel HD Graphics 530	4.09999999999999964	\N		\N
1461	Intel UHD Graphics 620	4.59999999999999964	\N		\N
1462	AMD Radeon R6 (Carrizo)	2.60000000000000009	\N		\N
1463	Intel HD Graphics 5600	4.20000000000000018	\N		\N
1464	AMD Radeon HD 8650G	3.5	\N		\N
1465	AMD Radeon R5 M330	2.70000000000000018	\N	DDR3	\N
1466	AMD Radeon R5 M255	3.29999999999999982	\N	DDR3	\N
1467	NVIDIA GeForce 820M	3.29999999999999982	\N		\N
1468	Intel HD Graphics 520	3.60000000000000009	\N		\N
1469	NVIDIA GeForce GT 720M	2.89999999999999991	\N		\N
1470	AMD Radeon R5 M240	3	\N	DDR3	\N
1471	AMD Radeon R5 M230	2.60000000000000009	\N	DDR3	\N
1472	Intel HD Graphics 6000	4.20000000000000018	\N		\N
1473	Intel Iris Graphics 5100	3.79999999999999982	\N		\N
1474	Intel HD Graphics 4600	3	\N		\N
1475	Intel HD Graphics 615	3.39999999999999991	\N		\N
1476	AMD Radeon R5 (Kaveri)	2.10000000000000009	\N		\N
1478	AMD Radeon HD 8550G	3.29999999999999982	\N		\N
1479	Intel HD Graphics 4400	2.70000000000000018	\N		\N
1480	Intel HD Graphics 510	3.10000000000000009	\N		\N
1481	Intel UHD Graphics 605	1.80000000000000004	\N		\N
1482	Intel HD Graphics 4000	2	\N		\N
1483	AMD Radeon R4 (Kaveri)	1.80000000000000004	\N		\N
1484	AMD Radeon R5 (Beema/Carrizo-L)	1.80000000000000004	\N		\N
1485	AMD Radeon R3 (Mullins/Beema)	1.69999999999999996	\N		\N
1486	Intel HD Graphics 4200	2.10000000000000009	\N		\N
1487	AMD Radeon HD 8400	1.60000000000000009	\N		\N
1488	AMD Radeon HD 8330	1.39999999999999991	\N		\N
1491	Intel HD Graphics (Haswell)	1.80000000000000004	\N		\N
1489	Intel HD Graphics 500	1.60000000000000009	\N		\N
1490	Intel HD Graphics (Braswell)	1.19999999999999996	\N		\N
1492	AMD Radeon HD 8240	1.19999999999999996	\N		\N
1493	AMD Radeon HD 8250	1.10000000000000009	\N		\N
1494	Intel HD Graphics (Ivy Bridge)	1.19999999999999996	\N		\N
1495	AMD Radeon HD 7340	1	\N		\N
1496	AMD Radeon HD 8180	0.800000000000000044	\N		\N
1497	AMD Radeon HD 7290	0	\N		\N
1498	AMD Radeon Pro WX 4130	0	\N	GDDR5	\N
1499	AMD Radeon Pro WX 7100	0	\N	GDDR5	\N
1500	AMD Radeon R9 M390X	0	\N	GDDR5	\N
1501	AMD Radeon R9 M395X	0	\N	GDDR5	\N
1502	AMD Radeon R9 M470X	0	\N	GDDR5	\N
1503	AMD Radeon RX 570	0	\N		\N
1504	Intel Iris Pro Graphics P580	0	\N		\N
1505	NVIDIA GeForce GTX 1050 Max-Q	0	\N	GDDR5	\N
1506	NVIDIA GeForce GTX 1050 Ti Max-Q	0	\N	GDDR5	\N
1507	NVIDIA GeForce MX110	0	\N	GDDR5/DDR3	\N
1508	NVIDIA Quadro K1000M	0	\N	DDR3	\N
1509	NVIDIA Quadro K3000M	0	\N	GDDR5	\N
1510	NVIDIA Quadro M5500	0	\N		\N
1511	NVIDIA Quadro P3000 Max-Q	0	\N	GDDR5	\N
1512	NVIDIA Quadro P4200	0	\N	GDDR5	\N
1513	NVIDIA Quadro P5200	0	\N		\N
1514	AMD FirePro M6000	0	\N		\N
1515	AMD Radeon Pro WX 4150	0	\N	GDDR5	\N
1516	AMD Radeon R9 M380	0	\N	GDDR5	\N
1517	AMD Radeon R9 M390	0	\N	GDDR5	\N
1518	AMD Radeon R9 M485X	0	\N	GDDR5	\N
1519	AMD Radeon RX 470	0	\N	GDDR5	\N
1520	AMD Radeon RX 560X	0	\N	GDDR5	\N
1521	AMD Radeon RX Vega 6	0	\N		\N
1522	AMD Radeon RX Vega Mobile	0	\N		\N
1523	Intel HD Graphics P530	0	\N		\N
1524	NVIDIA Quadro P3200	0	\N		\N
1525	NVIDIA Quadro P500	0	\N		\N
1526	NVIDIA Quadro P5000 Max-Q	0	\N	GDDR5	\N
1527	NVIDIA Quadro P600	0	\N		\N
1528	2 x NVIDIA GeForce GTX 1080	0	\N	\N	\N
1529	AMD Radeon R4	0	\N	\N	\N
1530	AMD Radeon R5	0	\N	\N	\N
1531	AMD Radeon R5 M430, AMD Radeon R4	0	\N	\N	\N
1532	AMD Radeon R2	0	\N	\N	\N
1533	Intel HD Graphics	0	\N	\N	\N
1534	PowerVR Graphics	0	\N	\N	\N
1535	2 x NVIDIA GeForce GTX 1070	0	\N	\N	\N
1536	Intégré	0	\N	\N	\N
1537	Intel HD Graphics 400	0	\N	\N	\N
1538	Intel HD Graphics 405	0	\N	\N	\N
1539	AMD Radeon R5 M420	0	\N	\N	\N
1540	AMD Radeon R7	0	\N	\N	\N
1541	AMD Radeon 535	0	\N	\N	\N
1542	AMD Radeon RX Vega 10 Graphics	0	\N	\N	\N
1543		0	\N	\N	\N
1544	Nvidia GeForce GTX 1080	0	\N	\N	\N
1545	NVIDIA GeForce GTX 1080SLI	0	\N	\N	\N
1546	NVIDIA GeForce GTX 1070SLI	0	\N	\N	\N
1547	Pas de carte graphique dédiée	0	\N	\N	\N
1548	Nvidia GeForce GTX 1070 / Max-Q	0	\N	\N	\N
1549	Nvidia GeForce GTX 1080 / G-Sync	0	\N	\N	\N
1550	Nvidia GeForce GTX 1060 / Max-Q	0	\N	\N	\N
1551	Nvidia GeForce GTX 1060 / G-Sync	0	\N	\N	\N
1552	Nvidia GeForce GTX 1070 / G-Sync	0	\N	\N	\N
1553	Nvidia GeForce GTX 1080 / G-Sync	0	\N	\N	\N
1554	2 x Nvidia GeForce GTX 1070 SLI	0	\N	\N	\N
\.


--
-- Name: computers_gpus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valentin
--

SELECT pg_catalog.setval('computers_gpus_id_seq', 1554, true);


--
-- Name: computers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valentin
--

SELECT pg_catalog.setval('computers_id_seq', 8542, true);


--
-- Data for Name: computers_os; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY computers_os (id, name, description) FROM stdin;
1314	Windows 10 Famille 64 Bits	\N
1315	Windows 10 Professionnel 64 Bits	\N
1316	Chrome OS	\N
1317	Windows 10 S	\N
1318	Endless OS	\N
1319	Windows 8.1 Professionnel 64 Bits	\N
1320	Android 6.0 (Marshmallow)	\N
1321	Free DOS	\N
1322	Windows 10S (64bit)	\N
1323	Windows 10 Famille	\N
1324	Windows 10 (64bit)	\N
1325	Windows 10	\N
1326	Sans OS	\N
1327	Windows 10 64-bits	\N
1328	Windows 10S	\N
1329	Free DOS (sans OS)	\N
1330	Windows 10 (64-Bit)	\N
1331	Windows 10 Home	\N
1332	MacOS Sierra	\N
1333	Windows 10 Professionnel	\N
1334		\N
1335	Windows 10 (64-Bits)	\N
1	N/A	\N
\.


--
-- Name: computers_os_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valentin
--

SELECT pg_catalog.setval('computers_os_id_seq', 1335, true);


--
-- Data for Name: computers_prices; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY computers_prices (id, computer_id, trader_id, url, created_at, updated_at, pricing, last_price) FROM stdin;
7719	7763	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108335.html	2018-07-05 16:02:23.200076	2018-07-05 16:02:23.354636	"2018-07-05T18:02:23+02:00"=>"589"	589
7711	7755	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112470.html	2018-07-05 16:02:21.042268	2018-07-05 16:02:21.181809	"2018-07-05T18:02:21+02:00"=>"1491"	1491
7691	7735	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105132.html	2018-07-05 16:02:14.978024	2018-07-05 16:02:15.214691	"2018-07-05T18:02:14+02:00"=>"3134", "2018-07-05T18:02:15+02:00"=>"3134.05"	3134
7706	7750	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10106337.html	2018-07-05 16:02:19.632667	2018-07-05 16:02:19.856377	"2018-07-05T18:02:19+02:00"=>"1491"	1491
7700	7744	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108098.html	2018-07-05 16:02:17.543717	2018-07-05 16:02:17.961503	"2018-07-05T18:02:17+02:00"=>"854"	854
7692	7736	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10106335.html	2018-07-05 16:02:15.345546	2018-07-05 16:02:15.613195	"2018-07-05T18:02:15+02:00"=>"849"	849
7693	7737	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105009.html	2018-07-05 16:02:15.696767	2018-07-05 16:02:15.92571	"2018-07-05T18:02:15+02:00"=>"1661"	1661
7694	7738	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112203.html	2018-07-05 16:02:16.003454	2018-07-05 16:02:16.139842	"2018-07-05T18:02:16+02:00"=>"1139"	1139
7701	7745	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10093440.html	2018-07-05 16:02:18.076915	2018-07-05 16:02:18.338356	"2018-07-05T18:02:18+02:00"=>"2136"	2136
7695	7739	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10106902.html	2018-07-05 16:02:16.224282	2018-07-05 16:02:16.386843	"2018-07-05T18:02:16+02:00"=>"469"	469
7696	7740	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10106953.html	2018-07-05 16:02:16.482544	2018-07-05 16:02:16.667677	"2018-07-05T18:02:16+02:00"=>"1249"	1249
7707	7751	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10106901.html	2018-07-05 16:02:19.945377	2018-07-05 16:02:20.096627	"2018-07-05T18:02:19+02:00"=>"879", "2018-07-05T18:02:20+02:00"=>"879.9"	879
7697	7741	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109011.html	2018-07-05 16:02:16.75133	2018-07-05 16:02:16.915372	"2018-07-05T18:02:16+02:00"=>"1804"	1804
7702	7746	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110253.html	2018-07-05 16:02:18.41747	2018-07-05 16:02:18.556925	"2018-07-05T18:02:18+02:00"=>"712"	712
7698	7742	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112461.html	2018-07-05 16:02:17.004846	2018-07-05 16:02:17.235687	"2018-07-05T18:02:17+02:00"=>"1899"	1899
7699	7743	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108978.html	2018-07-05 16:02:17.317726	2018-07-05 16:02:17.45523	"2018-07-05T18:02:17+02:00"=>"1329"	1329
7715	7759	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108638.html	2018-07-05 16:02:22.134291	2018-07-05 16:02:22.300397	"2018-07-05T18:02:22+02:00"=>"1614"	1614
7703	7747	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109896.html	2018-07-05 16:02:18.636088	2018-07-05 16:02:18.789455	"2018-07-05T18:02:18+02:00"=>"1999"	1999
7712	7756	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109898.html	2018-07-05 16:02:21.2659	2018-07-05 16:02:21.445244	"2018-07-05T18:02:21+02:00"=>"1799"	1799
7708	7752	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10107784.html	2018-07-05 16:02:20.187534	2018-07-05 16:02:20.463203	"2018-07-05T18:02:20+02:00"=>"669"	669
7704	7748	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108435.html	2018-07-05 16:02:18.88463	2018-07-05 16:02:19.17255	"2018-07-05T18:02:18+02:00"=>"759", "2018-07-05T18:02:19+02:00"=>"759.91"	759
7705	7749	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108720.html	2018-07-05 16:02:19.287775	2018-07-05 16:02:19.530743	"2018-07-05T18:02:19+02:00"=>"849"	849
7709	7753	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109242.html	2018-07-05 16:02:20.55374	2018-07-05 16:02:20.702976	"2018-07-05T18:02:20+02:00"=>"649"	649
7710	7754	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10106338.html	2018-07-05 16:02:20.802746	2018-07-05 16:02:20.954134	"2018-07-05T18:02:20+02:00"=>"1049"	1049
7713	7757	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108327.html	2018-07-05 16:02:21.527806	2018-07-05 16:02:21.670678	"2018-07-05T18:02:21+02:00"=>"309"	309
7718	7762	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112453.html	2018-07-05 16:02:22.967674	2018-07-05 16:02:23.109062	"2018-07-05T18:02:22+02:00"=>"1690", "2018-07-05T18:02:23+02:00"=>"1690.91"	1690
7716	7760	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110528.html	2018-07-05 16:02:22.409756	2018-07-05 16:02:22.577068	"2018-07-05T18:02:22+02:00"=>"237"	237
7714	7758	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111230.html	2018-07-05 16:02:21.751447	2018-07-05 16:02:22.030064	"2018-07-05T18:02:21+02:00"=>"1994", "2018-07-05T18:02:22+02:00"=>"1994.91"	1994
7717	7761	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109045.html	2018-07-05 16:02:22.681351	2018-07-05 16:02:22.879588	"2018-07-05T18:02:22+02:00"=>"1099"	1099
7720	7764	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108213.html	2018-07-05 16:02:23.460535	2018-07-05 16:02:23.637127	"2018-07-05T18:02:23+02:00"=>"788"	788
7721	7765	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112227.html	2018-07-05 16:02:23.702009	2018-07-05 16:02:23.868537	"2018-07-05T18:02:23+02:00"=>"1994"	1994
7722	7765	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112892.html	2018-07-05 16:02:23.960704	2018-07-05 16:02:24.104977	"2018-07-05T18:02:23+02:00"=>"2374", "2018-07-05T18:02:24+02:00"=>"2374.91"	2374
7723	7766	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108979.html	2018-07-05 16:02:24.182836	2018-07-05 16:02:24.353684	"2018-07-05T18:02:24+02:00"=>"1499"	1499
7724	7767	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108375.html	2018-07-05 16:02:24.435891	2018-07-05 16:02:24.577686	"2018-07-05T18:02:24+02:00"=>"1519"	1519
7735	7778	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108815.html	2018-07-05 16:02:27.217254	2018-07-05 16:02:27.357098	"2018-07-05T18:02:27+02:00"=>"929"	929
7725	7768	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111908.html	2018-07-05 16:02:24.648907	2018-07-05 16:02:24.774104	"2018-07-05T18:02:24+02:00"=>"1092"	1092
7726	7769	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10106894.html	2018-07-05 16:02:24.853379	2018-07-05 16:02:25.021398	"2018-07-05T18:02:24+02:00"=>"408", "2018-07-05T18:02:25+02:00"=>"408.41"	408
7755	7798	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108807.html	2018-07-05 16:02:32.569138	2018-07-05 16:02:32.782747	"2018-07-05T18:02:32+02:00"=>"807"	807
7727	7770	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10106958.html	2018-07-05 16:02:25.103455	2018-07-05 16:02:25.254137	"2018-07-05T18:02:25+02:00"=>"999"	999
7736	7779	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108324.html	2018-07-05 16:02:27.447256	2018-07-05 16:02:27.635045	"2018-07-05T18:02:27+02:00"=>"419"	419
7728	7771	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105018.html	2018-07-05 16:02:25.346043	2018-07-05 16:02:25.559448	"2018-07-05T18:02:25+02:00"=>"2136"	2136
7747	7790	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111931.html	2018-07-05 16:02:30.317468	2018-07-05 16:02:30.444859	"2018-07-05T18:02:30+02:00"=>"341"	341
7729	7772	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108090.html	2018-07-05 16:02:25.642586	2018-07-05 16:02:25.882337	"2018-07-05T18:02:25+02:00"=>"1139"	1139
7742	7785	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105013.html	2018-07-05 16:02:29.100079	2018-07-05 16:02:29.335669	"2018-07-05T18:02:29+02:00"=>"1661"	1661
7730	7773	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108211.html	2018-07-05 16:02:25.983287	2018-07-05 16:02:26.178893	"2018-07-05T18:02:25+02:00"=>"845", "2018-07-05T18:02:26+02:00"=>"845.41"	845
7737	7780	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10107729.html	2018-07-05 16:02:27.719315	2018-07-05 16:02:27.951561	"2018-07-05T18:02:27+02:00"=>"759"	759
7731	7774	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10106013.html	2018-07-05 16:02:26.260201	2018-07-05 16:02:26.433714	"2018-07-05T18:02:26+02:00"=>"1472"	1472
7732	7775	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108625.html	2018-07-05 16:02:26.542203	2018-07-05 16:02:26.696381	"2018-07-05T18:02:26+02:00"=>"1519"	1519
7733	7776	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109772.html	2018-07-05 16:02:26.773132	2018-07-05 16:02:26.917693	"2018-07-05T18:02:26+02:00"=>"3249"	3249
7738	7781	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108066.html	2018-07-05 16:02:28.042641	2018-07-05 16:02:28.241761	"2018-07-05T18:02:28+02:00"=>"3599"	3599
7734	7777	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108065.html	2018-07-05 16:02:26.99011	2018-07-05 16:02:27.145829	"2018-07-05T18:02:26+02:00"=>"3499", "2018-07-05T18:02:27+02:00"=>"3499.9"	3499
7743	7786	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108063.html	2018-07-05 16:02:29.416963	2018-07-05 16:02:29.573442	"2018-07-05T18:02:29+02:00"=>"2499"	2499
7739	7782	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112167.html	2018-07-05 16:02:28.307892	2018-07-05 16:02:28.45291	"2018-07-05T18:02:28+02:00"=>"2184"	2184
7740	7783	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108209.html	2018-07-05 16:02:28.540224	2018-07-05 16:02:28.690534	"2018-07-05T18:02:28+02:00"=>"645"	645
7748	7791	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110318.html	2018-07-05 16:02:30.513771	2018-07-05 16:02:31.176819	"2018-07-05T18:02:30+02:00"=>"3894", "2018-07-05T18:02:31+02:00"=>"3894.91"	3894
7744	7787	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112827.html	2018-07-05 16:02:29.645052	2018-07-05 16:02:29.789698	"2018-07-05T18:02:29+02:00"=>"1699"	1699
7741	7784	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108853.html	2018-07-05 16:02:28.768145	2018-07-05 16:02:28.98529	"2018-07-05T18:02:28+02:00"=>"455"	455
7745	7788	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110319.html	2018-07-05 16:02:29.869804	2018-07-05 16:02:30.011365	"2018-07-05T18:02:29+02:00"=>"4464", "2018-07-05T18:02:30+02:00"=>"4464.91"	4464
7746	7789	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108041.html	2018-07-05 16:02:30.099587	2018-07-05 16:02:30.238755	"2018-07-05T18:02:30+02:00"=>"2199"	2199
7751	7794	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108334.html	2018-07-05 16:02:31.599848	2018-07-05 16:02:31.761652	"2018-07-05T18:02:31+02:00"=>"408"	408
7749	7792	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105218.html	2018-07-05 16:02:30.722833	2018-07-05 16:02:30.918885	"2018-07-05T18:02:30+02:00"=>"1424"	1424
7753	7796	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108052.html	2018-07-05 16:02:32.100043	2018-07-05 16:02:32.259505	"2018-07-05T18:02:32+02:00"=>"2699"	2699
7750	7793	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110258.html	2018-07-05 16:02:31.262325	2018-07-05 16:02:31.513815	"2018-07-05T18:02:31+02:00"=>"699"	699
7752	7795	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108059.html	2018-07-05 16:02:31.844281	2018-07-05 16:02:31.997346	"2018-07-05T18:02:31+02:00"=>"3039"	3039
7754	7797	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110968.html	2018-07-05 16:02:32.344784	2018-07-05 16:02:32.493227	"2018-07-05T18:02:32+02:00"=>"854"	854
7756	7799	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111595.html	2018-07-05 16:02:32.857372	2018-07-05 16:02:33.031115	"2018-07-05T18:02:32+02:00"=>"2299", "2018-07-05T18:02:33+02:00"=>"2299.9"	2299
7757	7800	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10107476.html	2018-07-05 16:02:33.121971	2018-07-05 16:02:33.268527	"2018-07-05T18:02:33+02:00"=>"799"	799
7758	7801	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108810.html	2018-07-05 16:02:33.350753	2018-07-05 16:02:33.494312	"2018-07-05T18:02:33+02:00"=>"469"	469
7769	7812	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111234.html	2018-07-05 16:02:36.051292	2018-07-05 16:02:36.208234	"2018-07-05T18:02:36+02:00"=>"2564"	2564
7759	7802	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111817.html	2018-07-05 16:02:33.569465	2018-07-05 16:02:33.723375	"2018-07-05T18:02:33+02:00"=>"1994"	1994
7760	7803	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108671.html	2018-07-05 16:02:33.814324	2018-07-05 16:02:33.949889	"2018-07-05T18:02:33+02:00"=>"854"	854
7776	7819	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111858.html	2018-07-05 16:02:37.640618	2018-07-05 16:02:37.800771	"2018-07-05T18:02:37+02:00"=>"2659"	2659
7761	7804	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111910.html	2018-07-05 16:02:34.033749	2018-07-05 16:02:34.166879	"2018-07-05T18:02:34+02:00"=>"1282"	1282
7770	7813	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111945.html	2018-07-05 16:02:36.282117	2018-07-05 16:02:36.415305	"2018-07-05T18:02:36+02:00"=>"1329"	1329
7762	7805	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111954.html	2018-07-05 16:02:34.261548	2018-07-05 16:02:34.404497	"2018-07-05T18:02:34+02:00"=>"237"	237
7763	7806	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111215.html	2018-07-05 16:02:34.48571	2018-07-05 16:02:34.631307	"2018-07-05T18:02:34+02:00"=>"1709"	1709
7764	7807	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10107733.html	2018-07-05 16:02:34.717764	2018-07-05 16:02:34.896662	"2018-07-05T18:02:34+02:00"=>"845"	845
7771	7814	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112225.html	2018-07-05 16:02:36.503046	2018-07-05 16:02:36.636218	"2018-07-05T18:02:36+02:00"=>"2659"	2659
7765	7808	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108455.html	2018-07-05 16:02:34.99361	2018-07-05 16:02:35.156899	"2018-07-05T18:02:34+02:00"=>"807", "2018-07-05T18:02:35+02:00"=>"807.41"	807
7787	7830	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10113028.html	2018-07-05 16:02:40.467181	2018-07-05 16:02:40.624051	"2018-07-05T18:02:40+02:00"=>"1804"	1804
7766	7809	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111934.html	2018-07-05 16:02:35.241683	2018-07-05 16:02:35.476388	"2018-07-05T18:02:35+02:00"=>"1054"	1054
7772	7815	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111919.html	2018-07-05 16:02:36.705944	2018-07-05 16:02:36.827852	"2018-07-05T18:02:36+02:00"=>"1614"	1614
7767	7810	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111662.html	2018-07-05 16:02:35.56255	2018-07-05 16:02:35.724418	"2018-07-05T18:02:35+02:00"=>"2279"	2279
7768	7811	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108975.html	2018-07-05 16:02:35.80637	2018-07-05 16:02:35.944011	"2018-07-05T18:02:35+02:00"=>"1709"	1709
7777	7820	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10106928.html	2018-07-05 16:02:37.88517	2018-07-05 16:02:38.065921	"2018-07-05T18:02:37+02:00"=>"1199", "2018-07-05T18:02:38+02:00"=>"1199.9"	1199
7773	7816	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109490.html	2018-07-05 16:02:36.90385	2018-07-05 16:02:37.063434	"2018-07-05T18:02:36+02:00"=>"474", "2018-07-05T18:02:37+02:00"=>"474.91"	474
7781	7824	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112476.html	2018-07-05 16:02:38.960112	2018-07-05 16:02:39.11865	"2018-07-05T18:02:38+02:00"=>"3799", "2018-07-05T18:02:39+02:00"=>"3799.91"	3799
7778	7821	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112226.html	2018-07-05 16:02:38.159664	2018-07-05 16:02:38.302198	"2018-07-05T18:02:38+02:00"=>"3134"	3134
7774	7817	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10113033.html	2018-07-05 16:02:37.138684	2018-07-05 16:02:37.343615	"2018-07-05T18:02:37+02:00"=>"1614"	1614
7775	7818	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112428.html	2018-07-05 16:02:37.423421	2018-07-05 16:02:37.552786	"2018-07-05T18:02:37+02:00"=>"2659"	2659
7784	7827	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112170.html	2018-07-05 16:02:39.740649	2018-07-05 16:02:39.865298	"2018-07-05T18:02:39+02:00"=>"2564"	2564
7782	7825	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110276.html	2018-07-05 16:02:39.204201	2018-07-05 16:02:39.373206	"2018-07-05T18:02:39+02:00"=>"284"	284
7779	7822	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110279.html	2018-07-05 16:02:38.380109	2018-07-05 16:02:38.622235	"2018-07-05T18:02:38+02:00"=>"892"	892
7780	7823	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111568.html	2018-07-05 16:02:38.711495	2018-07-05 16:02:38.88412	"2018-07-05T18:02:38+02:00"=>"2089"	2089
7786	7829	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111585.html	2018-07-05 16:02:40.214873	2018-07-05 16:02:40.372804	"2018-07-05T18:02:40+02:00"=>"1804"	1804
7783	7826	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111487.html	2018-07-05 16:02:39.464815	2018-07-05 16:02:39.675273	"2018-07-05T18:02:39+02:00"=>"1424"	1424
7785	7828	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105219.html	2018-07-05 16:02:39.956519	2018-07-05 16:02:40.13206	"2018-07-05T18:02:39+02:00"=>"1424", "2018-07-05T18:02:40+02:00"=>"1424.05"	1424
7788	7831	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108534.html	2018-07-05 16:02:40.698249	2018-07-05 16:02:40.838908	"2018-07-05T18:02:40+02:00"=>"1424"	1424
7790	7833	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111214.html	2018-07-05 16:02:41.175644	2018-07-05 16:02:41.422732	"2018-07-05T18:02:41+02:00"=>"1709"	1709
7789	7832	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110323.html	2018-07-05 16:02:40.91918	2018-07-05 16:02:41.087507	"2018-07-05T18:02:40+02:00"=>"2279", "2018-07-05T18:02:41+02:00"=>"2279.91"	2279
7792	7835	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105422.html	2018-07-05 16:02:41.771902	2018-07-05 16:02:41.994423	"2018-07-05T18:02:41+02:00"=>"1842"	1842
7791	7834	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110326.html	2018-07-05 16:02:41.518735	2018-07-05 16:02:41.683063	"2018-07-05T18:02:41+02:00"=>"2374"	2374
7823	7866	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105121.html	2018-07-05 16:02:50.429085	2018-07-05 16:02:57.484049	"2018-07-05T18:02:50+02:00"=>"2659", "2018-07-05T18:02:57+02:00"=>"2659.05"	2659
7803	7846	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10113031.html	2018-07-05 16:02:44.644187	2018-07-05 16:02:44.81892	"2018-07-05T18:02:44+02:00"=>"2184"	2184
7793	7836	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111216.html	2018-07-05 16:02:42.081751	2018-07-05 16:02:42.299844	"2018-07-05T18:02:42+02:00"=>"1709"	1709
7794	7837	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111599.html	2018-07-05 16:02:42.393474	2018-07-05 16:02:42.549451	"2018-07-05T18:02:42+02:00"=>"1044"	1044
7812	7855	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105220.html	2018-07-05 16:02:47.640567	2018-07-05 16:02:47.808463	"2018-07-05T18:02:47+02:00"=>"1424"	1424
7806	7849	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105143.html	2018-07-05 16:02:46.134757	2018-07-05 16:02:46.354861	"2018-07-05T18:02:46+02:00"=>"3134"	3134
7804	7847	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10113037.html	2018-07-05 16:02:44.912919	2018-07-05 16:02:45.059443	"2018-07-05T18:02:44+02:00"=>"2374", "2018-07-05T18:02:45+02:00"=>"2374.91"	2374
7807	7850	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108447.html	2018-07-05 16:02:46.446721	2018-07-05 16:02:46.613767	"2018-07-05T18:02:46+02:00"=>"2469"	2469
7805	7848	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105223.html	2018-07-05 16:02:45.139997	2018-07-05 16:02:45.306822	"2018-07-05T18:02:45+02:00"=>"1709"	1709
7798	7841	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110576.html	2018-07-05 16:02:43.416847	2018-07-05 16:02:43.57648	"2018-07-05T18:02:43+02:00"=>"2699"	2699
7799	7842	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112426.html	2018-07-05 16:02:43.68357	2018-07-05 16:02:43.820695	"2018-07-05T18:02:43+02:00"=>"2184"	2184
7816	7859	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108330.html	2018-07-05 16:02:48.567646	2018-07-05 16:02:48.715832	"2018-07-05T18:02:48+02:00"=>"379"	379
7800	7843	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111343.html	2018-07-05 16:02:43.907557	2018-07-05 16:02:44.078662	"2018-07-05T18:02:43+02:00"=>"3799", "2018-07-05T18:02:44+02:00"=>"3799.91"	3799
7808	7851	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108676.html	2018-07-05 16:02:46.690574	2018-07-05 16:02:46.835193	"2018-07-05T18:02:46+02:00"=>"1282"	1282
7801	7844	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111641.html	2018-07-05 16:02:44.170609	2018-07-05 16:02:44.340526	"2018-07-05T18:02:44+02:00"=>"1139"	1139
7796	7839	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10104560.html	2018-07-05 16:02:42.893943	2018-07-05 16:02:45.616267	"2018-07-05T18:02:42+02:00"=>"142", "2018-07-05T18:02:43+02:00"=>"142.41", "2018-07-05T18:02:45+02:00"=>"142.41"	142
7802	7845	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105221.html	2018-07-05 16:02:44.418288	2018-07-05 16:02:44.571491	"2018-07-05T18:02:44+02:00"=>"1709"	1709
7813	7856	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108680.html	2018-07-05 16:02:47.883365	2018-07-05 16:02:48.040903	"2018-07-05T18:02:47+02:00"=>"1519", "2018-07-05T18:02:48+02:00"=>"1519.91"	1519
7795	7838	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111857.html	2018-07-05 16:02:42.638781	2018-07-05 16:02:45.828546	"2018-07-05T18:02:42+02:00"=>"2184", "2018-07-05T18:02:45+02:00"=>"2184.91"	2184
7809	7852	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10107080.html	2018-07-05 16:02:46.920491	2018-07-05 16:02:47.091843	"2018-07-05T18:02:46+02:00"=>"2999", "2018-07-05T18:02:47+02:00"=>"2999.9"	2999
7797	7840	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108537.html	2018-07-05 16:02:43.211102	2018-07-05 16:02:46.058231	"2018-07-05T18:02:43+02:00"=>"3001", "2018-07-05T18:02:45+02:00"=>"3001.91", "2018-07-05T18:02:46+02:00"=>"3001.91"	3001
7810	7853	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10113029.html	2018-07-05 16:02:47.178683	2018-07-05 16:02:47.324863	"2018-07-05T18:02:47+02:00"=>"1804"	1804
7811	7854	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105021.html	2018-07-05 16:02:47.409319	2018-07-05 16:02:47.562098	"2018-07-05T18:02:47+02:00"=>"1899"	1899
7814	7857	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105110.html	2018-07-05 16:02:48.123777	2018-07-05 16:02:48.285711	"2018-07-05T18:02:48+02:00"=>"379"	379
7821	7864	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111639.html	2018-07-05 16:02:49.989274	2018-07-05 16:02:56.967896	"2018-07-05T18:02:49+02:00"=>"854", "2018-07-05T18:02:50+02:00"=>"854.91", "2018-07-05T18:02:56+02:00"=>"854.91"	854
7815	7858	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10113026.html	2018-07-05 16:02:48.355899	2018-07-05 16:02:48.482309	"2018-07-05T18:02:48+02:00"=>"2184"	2184
7817	7860	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105216.html	2018-07-05 16:02:48.809215	2018-07-05 16:02:48.957761	"2018-07-05T18:02:48+02:00"=>"1424"	1424
7819	7862	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112171.html	2018-07-05 16:02:49.545105	2018-07-05 16:02:56.727928	"2018-07-05T18:02:49+02:00"=>"2374", "2018-07-05T18:02:56+02:00"=>"2374.91"	2374
7822	7865	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112033.html	2018-07-05 16:02:50.239885	2018-07-05 16:02:57.163686	"2018-07-05T18:02:50+02:00"=>"1377", "2018-07-05T18:02:57+02:00"=>"1377.41"	1377
7824	7867	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111508.html	2018-07-05 16:02:50.735608	2018-07-05 16:02:57.716255	"2018-07-05T18:02:50+02:00"=>"1424", "2018-07-05T18:02:57+02:00"=>"1424.91"	1424
7818	7861	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111483.html	2018-07-05 16:02:49.307373	2018-07-05 16:02:56.347162	"2018-07-05T18:02:49+02:00"=>"1519", "2018-07-05T18:02:56+02:00"=>"1519.91"	1519
7825	7868	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112344.html	2018-07-05 16:02:50.961428	2018-07-05 16:02:51.108735	"2018-07-05T18:02:50+02:00"=>"664", "2018-07-05T18:02:51+02:00"=>"664.91"	664
7826	7869	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105222.html	2018-07-05 16:02:51.201609	2018-07-05 16:02:51.36518	"2018-07-05T18:02:51+02:00"=>"1709"	1709
7836	7879	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111268.html	2018-07-05 16:02:53.653208	2018-07-05 16:02:53.821355	"2018-07-05T18:02:53+02:00"=>"2564"	2564
7827	7870	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111603.html	2018-07-05 16:02:51.455692	2018-07-05 16:02:51.684729	"2018-07-05T18:02:51+02:00"=>"949"	949
7828	7871	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111946.html	2018-07-05 16:02:51.752788	2018-07-05 16:02:51.885996	"2018-07-05T18:02:51+02:00"=>"1519"	1519
7837	7880	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108632.html	2018-07-05 16:02:53.894967	2018-07-05 16:02:54.021497	"2018-07-05T18:02:53+02:00"=>"1899", "2018-07-05T18:02:54+02:00"=>"1899.91"	1899
7829	7872	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112164.html	2018-07-05 16:02:51.974416	2018-07-05 16:02:52.118426	"2018-07-05T18:02:51+02:00"=>"1899", "2018-07-05T18:02:52+02:00"=>"1899.91"	1899
7830	7873	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112473.html	2018-07-05 16:02:52.190028	2018-07-05 16:02:52.341142	"2018-07-05T18:02:52+02:00"=>"1139"	1139
7843	7886	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111352.html	2018-07-05 16:02:55.575096	2018-07-05 16:02:55.838748	"2018-07-05T18:02:55+02:00"=>"2944"	2944
7831	7874	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112445.html	2018-07-05 16:02:52.43217	2018-07-05 16:02:52.568541	"2018-07-05T18:02:52+02:00"=>"854"	854
7838	7881	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111498.html	2018-07-05 16:02:54.110629	2018-07-05 16:02:54.290416	"2018-07-05T18:02:54+02:00"=>"1139"	1139
7832	7875	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10107735.html	2018-07-05 16:02:52.671383	2018-07-05 16:02:52.900309	"2018-07-05T18:02:52+02:00"=>"617"	617
7833	7876	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111947.html	2018-07-05 16:02:52.97173	2018-07-05 16:02:53.131393	"2018-07-05T18:02:52+02:00"=>"1709", "2018-07-05T18:02:53+02:00"=>"1709.91"	1709
7839	7882	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112404.html	2018-07-05 16:02:54.364439	2018-07-05 16:02:54.492708	"2018-07-05T18:02:54+02:00"=>"379"	379
7834	7877	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112463.html	2018-07-05 16:02:53.209907	2018-07-05 16:02:53.33647	"2018-07-05T18:02:53+02:00"=>"1187"	1187
7835	7878	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112471.html	2018-07-05 16:02:53.426255	2018-07-05 16:02:53.561267	"2018-07-05T18:02:53+02:00"=>"474"	474
7840	7883	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112448.html	2018-07-05 16:02:54.588913	2018-07-05 16:02:54.727707	"2018-07-05T18:02:54+02:00"=>"664"	664
7844	7887	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105023.html	2018-07-05 16:02:55.927373	2018-07-05 16:02:56.117153	"2018-07-05T18:02:55+02:00"=>"2136", "2018-07-05T18:02:56+02:00"=>"2136.55"	2136
7841	7884	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109294.html	2018-07-05 16:02:54.799657	2018-07-05 16:02:54.933484	"2018-07-05T18:02:54+02:00"=>"759"	759
7820	7863	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112757.html	2018-07-05 16:02:49.774835	2018-07-05 16:02:56.530546	"2018-07-05T18:02:49+02:00"=>"664", "2018-07-05T18:02:56+02:00"=>"664.91"	664
7842	7885	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105915.html	2018-07-05 16:02:55.056976	2018-07-05 16:02:55.293864	"2018-07-05T18:02:55+02:00"=>"522"	522
8428	8455	3	https://www.ldlc.com/fiche/PB00232009.html	2018-07-05 16:12:07.798535	2018-07-05 16:12:07.798535	"2018-07-05T18:12:07+02:00"=>"1199"	1199
8429	8456	3	https://www.ldlc.com/fiche/PB00247717.html	2018-07-05 16:12:08.328132	2018-07-05 16:12:08.328132	"2018-07-05T18:12:08+02:00"=>"1699"	1699
8430	8457	3	https://www.ldlc.com/fiche/PB00247668.html	2018-07-05 16:12:08.861517	2018-07-05 16:12:08.861517	"2018-07-05T18:12:08+02:00"=>"1899"	1899
8431	8458	3	https://www.ldlc.com/fiche/PB00247667.html	2018-07-05 16:12:09.44677	2018-07-05 16:12:09.44677	"2018-07-05T18:12:09+02:00"=>"2599"	2599
8432	8459	3	https://www.ldlc.com/fiche/PB00247538.html	2018-07-05 16:12:09.940542	2018-07-05 16:12:09.940542	"2018-07-05T18:12:09+02:00"=>"2799"	2799
8433	8460	3	https://www.ldlc.com/fiche/PB00247656.html	2018-07-05 16:12:10.470841	2018-07-05 16:12:10.470841	"2018-07-05T18:12:10+02:00"=>"2399"	2399
8434	8461	3	https://www.ldlc.com/fiche/PB00237222.html	2018-07-05 16:12:11.016692	2018-07-05 16:12:11.016692	"2018-07-05T18:12:11+02:00"=>"2299"	2299
8435	8462	3	https://www.ldlc.com/fiche/PB00222048.html	2018-07-05 16:12:11.58289	2018-07-05 16:12:11.58289	"2018-07-05T18:12:11+02:00"=>"1399"	1399
8436	8463	3	https://www.ldlc.com/fiche/PB00240853.html	2018-07-05 16:12:12.106427	2018-07-05 16:12:12.106427	"2018-07-05T18:12:12+02:00"=>"1549"	1549
8437	8464	3	https://www.ldlc.com/fiche/PB00222821.html	2018-07-05 16:12:12.646101	2018-07-05 16:12:12.646101	"2018-07-05T18:12:12+02:00"=>"2499"	2499
8438	8465	3	https://www.ldlc.com/fiche/PB00237448.html	2018-07-05 16:12:13.189298	2018-07-05 16:12:13.189298	"2018-07-05T18:12:13+02:00"=>"1999"	1999
8439	7880	3	https://www.ldlc.com/fiche/PB00240857.html	2018-07-05 16:12:14.71058	2018-07-05 16:12:14.71058	"2018-07-05T18:12:14+02:00"=>"1679"	1679
7845	7889	3	https://www.ldlc.com/fiche/PB00217522.html	2018-07-05 16:04:47.764763	2018-07-05 16:04:47.764763	"2018-07-05T18:04:47+02:00"=>"879"	879
7846	7890	3	https://www.ldlc.com/fiche/PB00217524.html	2018-07-05 16:04:48.35875	2018-07-05 16:04:48.35875	"2018-07-05T18:04:48+02:00"=>"929"	929
7847	7896	3	https://www.ldlc.com/fiche/PB00224693.html	2018-07-05 16:04:52.451217	2018-07-05 16:04:52.451217	"2018-07-05T18:04:52+02:00"=>"4499"	4499
7848	7897	3	https://www.ldlc.com/fiche/PB00241704.html	2018-07-05 16:04:52.971389	2018-07-05 16:04:52.971389	"2018-07-05T18:04:52+02:00"=>"199"	199
7849	7898	3	https://www.ldlc.com/fiche/PB00241707.html	2018-07-05 16:04:53.575188	2018-07-05 16:04:53.575188	"2018-07-05T18:04:53+02:00"=>"279"	279
7850	7901	3	https://www.ldlc.com/fiche/PB00229897.html	2018-07-05 16:04:56.410759	2018-07-05 16:04:56.410759	"2018-07-05T18:04:56+02:00"=>"1259"	1259
7851	7903	3	https://www.ldlc.com/fiche/PB00217520.html	2018-07-05 16:04:57.522978	2018-07-05 16:04:57.522978	"2018-07-05T18:04:57+02:00"=>"769"	769
7852	7904	3	https://www.ldlc.com/fiche/PB00239367.html	2018-07-05 16:04:58.058179	2018-07-05 16:04:58.058179	"2018-07-05T18:04:58+02:00"=>"379"	379
7853	7905	3	https://www.ldlc.com/fiche/PB00232421.html	2018-07-05 16:04:58.567715	2018-07-05 16:04:58.567715	"2018-07-05T18:04:58+02:00"=>"419"	419
7854	7906	3	https://www.ldlc.com/fiche/PB00239363.html	2018-07-05 16:04:59.07933	2018-07-05 16:04:59.07933	"2018-07-05T18:04:59+02:00"=>"499"	499
7855	7907	3	https://www.ldlc.com/fiche/PB00238981.html	2018-07-05 16:04:59.607864	2018-07-05 16:04:59.607864	"2018-07-05T18:04:59+02:00"=>"469"	469
7856	7650	3	https://www.ldlc.com/fiche/PB00233016.html	2018-07-05 16:05:00.118518	2018-07-05 16:05:00.118518	"2018-07-05T18:05:00+02:00"=>"369"	369
7857	7908	3	https://www.ldlc.com/fiche/PB00238843.html	2018-07-05 16:05:00.622431	2018-07-05 16:05:00.622431	"2018-07-05T18:05:00+02:00"=>"369"	369
7858	7909	3	https://www.ldlc.com/fiche/PB00244313.html	2018-07-05 16:05:01.143014	2018-07-05 16:05:01.143014	"2018-07-05T18:05:01+02:00"=>"499"	499
7859	7910	3	https://www.ldlc.com/fiche/PB00242818.html	2018-07-05 16:05:01.697029	2018-07-05 16:05:01.697029	"2018-07-05T18:05:01+02:00"=>"599"	599
7860	7911	3	https://www.ldlc.com/fiche/PB00250968.html	2018-07-05 16:05:02.24984	2018-07-05 16:05:02.24984	"2018-07-05T18:05:02+02:00"=>"549"	549
7861	7912	3	https://www.ldlc.com/fiche/PB00232407.html	2018-07-05 16:05:02.773076	2018-07-05 16:05:02.773076	"2018-07-05T18:05:02+02:00"=>"549"	549
7862	7913	3	https://www.ldlc.com/fiche/PB00232625.html	2018-07-05 16:05:03.297481	2018-07-05 16:05:03.297481	"2018-07-05T18:05:03+02:00"=>"499"	499
7863	7914	3	https://www.ldlc.com/fiche/PB00233017.html	2018-07-05 16:05:03.80289	2018-07-05 16:05:03.80289	"2018-07-05T18:05:03+02:00"=>"479"	479
7864	7915	3	https://www.ldlc.com/fiche/PB00250854.html	2018-07-05 16:05:04.361458	2018-07-05 16:05:04.361458	"2018-07-05T18:05:04+02:00"=>"513"	513
7865	7916	3	https://www.ldlc.com/fiche/PB00250983.html	2018-07-05 16:05:04.907636	2018-07-05 16:05:04.907636	"2018-07-05T18:05:04+02:00"=>"549"	549
7866	7917	3	https://www.ldlc.com/fiche/PB00232400.html	2018-07-05 16:05:05.469644	2018-07-05 16:05:05.469644	"2018-07-05T18:05:05+02:00"=>"629"	629
7867	7918	3	https://www.ldlc.com/fiche/PB00244901.html	2018-07-05 16:05:06.038315	2018-07-05 16:05:06.038315	"2018-07-05T18:05:06+02:00"=>"599"	599
7868	7919	3	https://www.ldlc.com/fiche/PB00250987.html	2018-07-05 16:05:06.580918	2018-07-05 16:05:06.580918	"2018-07-05T18:05:06+02:00"=>"599"	599
7869	7920	3	https://www.ldlc.com/fiche/PB00232393.html	2018-07-05 16:05:07.126178	2018-07-05 16:05:07.126178	"2018-07-05T18:05:07+02:00"=>"519"	519
7870	7921	3	https://www.ldlc.com/fiche/PB00232381.html	2018-07-05 16:05:07.646947	2018-07-05 16:05:07.646947	"2018-07-05T18:05:07+02:00"=>"739"	739
7871	7922	3	https://www.ldlc.com/fiche/PB00242813.html	2018-07-05 16:05:08.19271	2018-07-05 16:05:08.19271	"2018-07-05T18:05:08+02:00"=>"699"	699
7872	7923	3	https://www.ldlc.com/fiche/PB00238968.html	2018-07-05 16:05:09.681863	2018-07-05 16:05:09.681863	"2018-07-05T18:05:09+02:00"=>"699"	699
7873	7924	3	https://www.ldlc.com/fiche/PB00242811.html	2018-07-05 16:05:10.231332	2018-07-05 16:05:10.231332	"2018-07-05T18:05:10+02:00"=>"499"	499
7874	7925	3	https://www.ldlc.com/fiche/PB00250996.html	2018-07-05 16:05:10.7585	2018-07-05 16:05:10.7585	"2018-07-05T18:05:10+02:00"=>"649"	649
7875	7925	3	https://www.ldlc.com/fiche/PB00238948.html	2018-07-05 16:05:11.276031	2018-07-05 16:05:11.276031	"2018-07-05T18:05:11+02:00"=>"649"	649
7876	7926	3	https://www.ldlc.com/fiche/PB00238951.html	2018-07-05 16:05:11.853442	2018-07-05 16:05:11.853442	"2018-07-05T18:05:11+02:00"=>"579"	579
7877	7927	3	https://www.ldlc.com/fiche/PB00242795.html	2018-07-05 16:05:12.359804	2018-07-05 16:05:12.359804	"2018-07-05T18:05:12+02:00"=>"649"	649
7878	7928	3	https://www.ldlc.com/fiche/PB00242809.html	2018-07-05 16:05:12.87642	2018-07-05 16:05:12.87642	"2018-07-05T18:05:12+02:00"=>"549"	549
7879	7929	3	https://www.ldlc.com/fiche/PB00242805.html	2018-07-05 16:05:13.396139	2018-07-05 16:05:13.396139	"2018-07-05T18:05:13+02:00"=>"649"	649
7880	7930	3	https://www.ldlc.com/fiche/PB00242712.html	2018-07-05 16:05:13.938653	2018-07-05 16:05:13.938653	"2018-07-05T18:05:13+02:00"=>"799"	799
7881	7683	3	https://www.ldlc.com/fiche/PB00238935.html	2018-07-05 16:05:14.439931	2018-07-05 16:05:14.439931	"2018-07-05T18:05:14+02:00"=>"799"	799
7882	7931	3	https://www.ldlc.com/fiche/PB00242711.html	2018-07-05 16:05:14.940522	2018-07-05 16:05:14.940522	"2018-07-05T18:05:14+02:00"=>"879"	879
7883	7932	3	https://www.ldlc.com/fiche/PB00238938.html	2018-07-05 16:05:15.662109	2018-07-05 16:05:15.662109	"2018-07-05T18:05:15+02:00"=>"799"	799
7884	7933	3	https://www.ldlc.com/fiche/PB00242706.html	2018-07-05 16:05:16.20327	2018-07-05 16:05:16.20327	"2018-07-05T18:05:16+02:00"=>"999"	999
7885	7934	3	https://www.ldlc.com/fiche/PB00233562.html	2018-07-05 16:05:16.704227	2018-07-05 16:05:16.704227	"2018-07-05T18:05:16+02:00"=>"899"	899
7886	7935	3	https://www.ldlc.com/fiche/PB00233558.html	2018-07-05 16:05:17.206756	2018-07-05 16:05:17.206756	"2018-07-05T18:05:17+02:00"=>"779"	779
7887	7936	3	https://www.ldlc.com/fiche/PB00233563.html	2018-07-05 16:05:17.751719	2018-07-05 16:05:17.751719	"2018-07-05T18:05:17+02:00"=>"729"	729
7888	7937	3	https://www.ldlc.com/fiche/PB00238971.html	2018-07-05 16:05:18.276794	2018-07-05 16:05:18.276794	"2018-07-05T18:05:18+02:00"=>"1199"	1199
7889	7938	3	https://www.ldlc.com/fiche/PB00232784.html	2018-07-05 16:05:18.789817	2018-07-05 16:05:18.789817	"2018-07-05T18:05:18+02:00"=>"1049"	1049
7890	7939	3	https://www.ldlc.com/fiche/PB00238915.html	2018-07-05 16:05:20.268802	2018-07-05 16:05:20.268802	"2018-07-05T18:05:20+02:00"=>"849"	849
7891	7940	3	https://www.ldlc.com/fiche/PB00232856.html	2018-07-05 16:05:20.801245	2018-07-05 16:05:20.801245	"2018-07-05T18:05:20+02:00"=>"899"	899
7892	7941	3	https://www.ldlc.com/fiche/PB00232783.html	2018-07-05 16:05:21.311073	2018-07-05 16:05:21.311073	"2018-07-05T18:05:21+02:00"=>"1399"	1399
7893	7942	3	https://www.ldlc.com/fiche/PB00233351.html	2018-07-05 16:05:21.860998	2018-07-05 16:05:21.860998	"2018-07-05T18:05:21+02:00"=>"399"	399
7894	7943	3	https://www.ldlc.com/fiche/PB00228796.html	2018-07-05 16:05:22.378614	2018-07-05 16:05:22.378614	"2018-07-05T18:05:22+02:00"=>"499"	499
7895	7944	3	https://www.ldlc.com/fiche/PB00232351.html	2018-07-05 16:05:22.999178	2018-07-05 16:05:22.999178	"2018-07-05T18:05:22+02:00"=>"599"	599
7896	7945	3	https://www.ldlc.com/fiche/PB00226162.html	2018-07-05 16:05:23.529281	2018-07-05 16:05:23.529281	"2018-07-05T18:05:23+02:00"=>"549"	549
7897	7946	3	https://www.ldlc.com/fiche/PB00237650.html	2018-07-05 16:05:24.119491	2018-07-05 16:05:24.119491	"2018-07-05T18:05:24+02:00"=>"589"	589
7898	7947	3	https://www.ldlc.com/fiche/PB00222415.html	2018-07-05 16:05:24.637328	2018-07-05 16:05:24.637328	"2018-07-05T18:05:24+02:00"=>"729"	729
7899	7948	3	https://www.ldlc.com/fiche/PB00230447.html	2018-07-05 16:05:25.167816	2018-07-05 16:05:25.167816	"2018-07-05T18:05:25+02:00"=>"329"	329
7900	7949	3	https://www.ldlc.com/fiche/PB00221312.html	2018-07-05 16:05:25.704258	2018-07-05 16:05:25.704258	"2018-07-05T18:05:25+02:00"=>"449"	449
7901	7950	3	https://www.ldlc.com/fiche/PB00206170.html	2018-07-05 16:05:26.23794	2018-07-05 16:05:26.23794	"2018-07-05T18:05:26+02:00"=>"429"	429
7902	7951	3	https://www.ldlc.com/fiche/PB00233877.html	2018-07-05 16:05:26.727522	2018-07-05 16:05:26.727522	"2018-07-05T18:05:26+02:00"=>"429"	429
7903	7952	3	https://www.ldlc.com/fiche/PB00199390.html	2018-07-05 16:05:27.264389	2018-07-05 16:05:27.264389	"2018-07-05T18:05:27+02:00"=>"999"	999
7904	7953	3	https://www.ldlc.com/fiche/PB00234037.html	2018-07-05 16:05:27.870191	2018-07-05 16:05:27.870191	"2018-07-05T18:05:27+02:00"=>"519"	519
7905	7954	3	https://www.ldlc.com/fiche/PB00250382.html	2018-07-05 16:05:28.37571	2018-07-05 16:05:28.37571	"2018-07-05T18:05:28+02:00"=>"598"	598
7906	7955	3	https://www.ldlc.com/fiche/PB00224612.html	2018-07-05 16:05:28.876526	2018-07-05 16:05:28.876526	"2018-07-05T18:05:28+02:00"=>"379"	379
7907	7956	3	https://www.ldlc.com/fiche/PB00250374.html	2018-07-05 16:05:29.38621	2018-07-05 16:05:29.38621	"2018-07-05T18:05:29+02:00"=>"448"	448
7908	7957	3	https://www.ldlc.com/fiche/PB00245874.html	2018-07-05 16:05:29.911175	2018-07-05 16:05:29.911175	"2018-07-05T18:05:29+02:00"=>"548"	548
7909	7958	3	https://www.ldlc.com/fiche/PB00234312.html	2018-07-05 16:05:30.431648	2018-07-05 16:05:30.431648	"2018-07-05T18:05:30+02:00"=>"949"	949
7910	7959	3	https://www.ldlc.com/fiche/PB00234264.html	2018-07-05 16:05:31.039837	2018-07-05 16:05:31.039837	"2018-07-05T18:05:31+02:00"=>"849"	849
7911	7960	3	https://www.ldlc.com/fiche/PB00238963.html	2018-07-05 16:05:31.721208	2018-07-05 16:05:31.721208	"2018-07-05T18:05:31+02:00"=>"799"	799
7912	7961	3	https://www.ldlc.com/fiche/PB00242694.html	2018-07-05 16:05:32.497627	2018-07-05 16:05:32.497627	"2018-07-05T18:05:32+02:00"=>"949"	949
7913	7962	3	https://www.ldlc.com/fiche/PB00234315.html	2018-07-05 16:05:33.038397	2018-07-05 16:05:33.038397	"2018-07-05T18:05:33+02:00"=>"979"	979
7914	7963	3	https://www.ldlc.com/fiche/PB00242687.html	2018-07-05 16:05:34.543848	2018-07-05 16:05:34.543848	"2018-07-05T18:05:34+02:00"=>"1099"	1099
7915	7964	3	https://www.ldlc.com/fiche/PB00228464.html	2018-07-05 16:05:35.080321	2018-07-05 16:05:35.080321	"2018-07-05T18:05:35+02:00"=>"1599"	1599
7916	7965	3	https://www.ldlc.com/fiche/PB00226275.html	2018-07-05 16:05:35.58322	2018-07-05 16:05:35.58322	"2018-07-05T18:05:35+02:00"=>"1799"	1799
7917	7966	3	https://www.ldlc.com/fiche/PB00238932.html	2018-07-05 16:05:36.104769	2018-07-05 16:05:36.104769	"2018-07-05T18:05:36+02:00"=>"1999"	1999
7918	7967	3	https://www.ldlc.com/fiche/PB00238867.html	2018-07-05 16:05:36.664541	2018-07-05 16:05:36.664541	"2018-07-05T18:05:36+02:00"=>"1799"	1799
7919	7968	3	https://www.ldlc.com/fiche/PB00238868.html	2018-07-05 16:05:37.195756	2018-07-05 16:05:37.195756	"2018-07-05T18:05:37+02:00"=>"1719"	1719
7920	7969	3	https://www.ldlc.com/fiche/PB00233046.html	2018-07-05 16:05:38.713667	2018-07-05 16:05:38.713667	"2018-07-05T18:05:38+02:00"=>"2199"	2199
7921	7970	3	https://www.ldlc.com/fiche/PB00220922.html	2018-07-05 16:05:39.272634	2018-07-05 16:05:39.272634	"2018-07-05T18:05:39+02:00"=>"2799"	2799
7922	7971	3	https://www.ldlc.com/fiche/PB00232896.html	2018-07-05 16:05:39.767834	2018-07-05 16:05:39.767834	"2018-07-05T18:05:39+02:00"=>"1399"	1399
7923	7972	3	https://www.ldlc.com/fiche/PB00240893.html	2018-07-05 16:05:40.300775	2018-07-05 16:05:40.300775	"2018-07-05T18:05:40+02:00"=>"1199"	1199
7924	7973	3	https://www.ldlc.com/fiche/PB00233045.html	2018-07-05 16:05:40.820411	2018-07-05 16:05:40.820411	"2018-07-05T18:05:40+02:00"=>"1159"	1159
7925	7974	3	https://www.ldlc.com/fiche/PB00233043.html	2018-07-05 16:05:41.375403	2018-07-05 16:05:41.375403	"2018-07-05T18:05:41+02:00"=>"1249"	1249
7926	7975	3	https://www.ldlc.com/fiche/PB00233040.html	2018-07-05 16:05:41.895368	2018-07-05 16:05:41.895368	"2018-07-05T18:05:41+02:00"=>"1299"	1299
7927	7976	3	https://www.ldlc.com/fiche/PB00240974.html	2018-07-05 16:05:42.414848	2018-07-05 16:05:42.414848	"2018-07-05T18:05:42+02:00"=>"2699"	2699
7928	7977	3	https://www.ldlc.com/fiche/PB00244284.html	2018-07-05 16:05:42.91829	2018-07-05 16:05:42.91829	"2018-07-05T18:05:42+02:00"=>"749"	749
7929	7978	3	https://www.ldlc.com/fiche/PB00219961.html	2018-07-05 16:05:43.429513	2018-07-05 16:05:43.429513	"2018-07-05T18:05:43+02:00"=>"599"	599
7930	7979	3	https://www.ldlc.com/fiche/PB00250259.html	2018-07-05 16:05:43.960946	2018-07-05 16:05:43.960946	"2018-07-05T18:05:43+02:00"=>"999"	999
7931	7980	3	https://www.ldlc.com/fiche/PB00215676.html	2018-07-05 16:05:44.73187	2018-07-05 16:05:44.73187	"2018-07-05T18:05:44+02:00"=>"1149"	1149
7932	7663	3	https://www.ldlc.com/fiche/PB00250727.html	2018-07-05 16:05:45.253466	2018-07-05 16:05:45.253466	"2018-07-05T18:05:45+02:00"=>"299"	299
7933	7673	3	https://www.ldlc.com/fiche/PB00232659.html	2018-07-05 16:05:45.787261	2018-07-05 16:05:45.787261	"2018-07-05T18:05:45+02:00"=>"399"	399
7934	7981	3	https://www.ldlc.com/fiche/PB00232663.html	2018-07-05 16:05:46.307758	2018-07-05 16:05:46.307758	"2018-07-05T18:05:46+02:00"=>"499"	499
7935	7982	3	https://www.ldlc.com/fiche/PB00232662.html	2018-07-05 16:05:47.786013	2018-07-05 16:05:47.786013	"2018-07-05T18:05:47+02:00"=>"449"	449
7936	7983	3	https://www.ldlc.com/fiche/PB00232658.html	2018-07-05 16:05:48.326614	2018-07-05 16:05:48.326614	"2018-07-05T18:05:48+02:00"=>"369"	369
7937	7984	3	https://www.ldlc.com/fiche/PB00219948.html	2018-07-05 16:05:48.904389	2018-07-05 16:05:48.904389	"2018-07-05T18:05:48+02:00"=>"549"	549
7938	7985	3	https://www.ldlc.com/fiche/PB00220702.html	2018-07-05 16:05:49.431525	2018-07-05 16:05:49.431525	"2018-07-05T18:05:49+02:00"=>"619"	619
7939	7986	3	https://www.ldlc.com/fiche/PB00232669.html	2018-07-05 16:05:49.928975	2018-07-05 16:05:49.928975	"2018-07-05T18:05:49+02:00"=>"499"	499
7940	7987	3	https://www.ldlc.com/fiche/PB00232673.html	2018-07-05 16:05:50.464444	2018-07-05 16:05:50.464444	"2018-07-05T18:05:50+02:00"=>"649"	649
7941	7988	3	https://www.ldlc.com/fiche/PB00232678.html	2018-07-05 16:05:50.986437	2018-07-05 16:05:50.986437	"2018-07-05T18:05:50+02:00"=>"599"	599
7942	7989	3	https://www.ldlc.com/fiche/PB00232685.html	2018-07-05 16:05:51.503725	2018-07-05 16:05:51.503725	"2018-07-05T18:05:51+02:00"=>"799"	799
7943	7990	3	https://www.ldlc.com/fiche/PB00232684.html	2018-07-05 16:05:51.992192	2018-07-05 16:05:51.992192	"2018-07-05T18:05:51+02:00"=>"649"	649
7944	7991	3	https://www.ldlc.com/fiche/PB00232679.html	2018-07-05 16:05:52.52857	2018-07-05 16:05:52.52857	"2018-07-05T18:05:52+02:00"=>"649"	649
7945	7992	3	https://www.ldlc.com/fiche/PB00232689.html	2018-07-05 16:05:54.05887	2018-07-05 16:05:54.05887	"2018-07-05T18:05:54+02:00"=>"799"	799
7946	7993	3	https://www.ldlc.com/fiche/PB00232688.html	2018-07-05 16:05:54.650759	2018-07-05 16:05:54.650759	"2018-07-05T18:05:54+02:00"=>"699"	699
7947	7994	3	https://www.ldlc.com/fiche/PB00232690.html	2018-07-05 16:05:55.141521	2018-07-05 16:05:55.141521	"2018-07-05T18:05:55+02:00"=>"799"	799
7948	7995	3	https://www.ldlc.com/fiche/PB00243338.html	2018-07-05 16:05:55.680069	2018-07-05 16:05:55.680069	"2018-07-05T18:05:55+02:00"=>"849"	849
7949	7996	3	https://www.ldlc.com/fiche/PB00245019.html	2018-07-05 16:05:56.168252	2018-07-05 16:05:56.168252	"2018-07-05T18:05:56+02:00"=>"949"	949
7950	7997	3	https://www.ldlc.com/fiche/PB00242319.html	2018-07-05 16:05:56.69204	2018-07-05 16:05:56.69204	"2018-07-05T18:05:56+02:00"=>"1199"	1199
7952	7999	3	https://www.ldlc.com/fiche/PB00234036.html	2018-07-05 16:05:57.239087	2018-07-05 16:05:57.239087	"2018-07-05T18:05:57+02:00"=>"639"	639
7953	8000	3	https://www.ldlc.com/fiche/PB00245869.html	2018-07-05 16:05:57.728972	2018-07-05 16:05:57.728972	"2018-07-05T18:05:57+02:00"=>"549"	549
7954	8001	3	https://www.ldlc.com/fiche/PB00236206.html	2018-07-05 16:05:58.245374	2018-07-05 16:05:58.245374	"2018-07-05T18:05:58+02:00"=>"719"	719
7956	8003	3	https://www.ldlc.com/fiche/PB00219451.html	2018-07-05 16:05:58.711979	2018-07-05 16:05:58.711979	"2018-07-05T18:05:58+02:00"=>"669"	669
7951	7998	3	https://www.ldlc.com/fiche/PB00217521.html	2018-07-05 16:05:56.743739	2018-07-05 16:05:56.743739	"2018-07-05T18:05:56+02:00"=>"759"	759
7955	8002	3	https://www.ldlc.com/fiche/PB00217409.html	2018-07-05 16:05:58.286952	2018-07-05 16:05:58.286952	"2018-07-05T18:05:58+02:00"=>"499"	499
7957	8004	3	https://www.ldlc.com/fiche/PB00217428.html	2018-07-05 16:05:58.796535	2018-07-05 16:05:58.796535	"2018-07-05T18:05:58+02:00"=>"599"	599
7959	8006	3	https://www.ldlc.com/fiche/PB00229763.html	2018-07-05 16:05:59.271991	2018-07-05 16:05:59.271991	"2018-07-05T18:05:59+02:00"=>"569"	569
7960	8007	3	https://www.ldlc.com/fiche/PB00229765.html	2018-07-05 16:05:59.768643	2018-07-05 16:05:59.768643	"2018-07-05T18:05:59+02:00"=>"669"	669
7962	8009	3	https://www.ldlc.com/fiche/PB00224359.html	2018-07-05 16:06:00.342852	2018-07-05 16:06:00.342852	"2018-07-05T18:06:00+02:00"=>"4299"	4299
7968	8015	3	https://www.ldlc.com/fiche/PB00217502.html	2018-07-05 16:06:02.51537	2018-07-05 16:06:02.51537	"2018-07-05T18:06:02+02:00"=>"349"	349
7970	8017	3	https://www.ldlc.com/fiche/PB00217506.html	2018-07-05 16:06:03.058823	2018-07-05 16:06:03.058823	"2018-07-05T18:06:03+02:00"=>"349"	349
7972	8019	3	https://www.ldlc.com/fiche/PB00229896.html	2018-07-05 16:06:03.580211	2018-07-05 16:06:03.580211	"2018-07-05T18:06:03+02:00"=>"1129"	1129
7975	8022	3	https://www.ldlc.com/fiche/PB00217518.html	2018-07-05 16:06:04.627245	2018-07-05 16:06:04.627245	"2018-07-05T18:06:04+02:00"=>"649"	649
8440	8466	3	https://www.ldlc.com/fiche/PB00241850.html	2018-07-05 16:12:15.234157	2018-07-05 16:12:15.234157	"2018-07-05T18:12:15+02:00"=>"2199"	2199
8441	8467	3	https://www.ldlc.com/fiche/PB00221755.html	2018-07-05 16:12:15.754686	2018-07-05 16:12:15.754686	"2018-07-05T18:12:15+02:00"=>"1799"	1799
8442	8468	3	https://www.ldlc.com/fiche/PB00250091.html	2018-07-05 16:12:16.284749	2018-07-05 16:12:16.284749	"2018-07-05T18:12:16+02:00"=>"2299"	2299
8443	8469	3	https://www.ldlc.com/fiche/PB00250092.html	2018-07-05 16:12:16.814326	2018-07-05 16:12:16.814326	"2018-07-05T18:12:16+02:00"=>"2999"	2999
8444	8470	3	https://www.ldlc.com/fiche/PB00230856.html	2018-07-05 16:12:17.359455	2018-07-05 16:12:17.359455	"2018-07-05T18:12:17+02:00"=>"1749"	1749
8445	8471	3	https://www.ldlc.com/fiche/PB00230850.html	2018-07-05 16:12:17.920538	2018-07-05 16:12:17.920538	"2018-07-05T18:12:17+02:00"=>"2099"	2099
8446	8472	3	https://www.ldlc.com/fiche/PB00213700.html	2018-07-05 16:12:18.468007	2018-07-05 16:12:18.468007	"2018-07-05T18:12:18+02:00"=>"2999"	2999
8447	8473	3	https://www.ldlc.com/fiche/PB00221769.html	2018-07-05 16:12:19.010515	2018-07-05 16:12:19.010515	"2018-07-05T18:12:19+02:00"=>"3899"	3899
8448	8474	3	https://www.ldlc.com/fiche/PB00221772.html	2018-07-05 16:12:19.564593	2018-07-05 16:12:19.564593	"2018-07-05T18:12:19+02:00"=>"2099"	2099
8449	8475	3	https://www.ldlc.com/fiche/PB00221768.html	2018-07-05 16:12:20.134508	2018-07-05 16:12:20.134508	"2018-07-05T18:12:20+02:00"=>"2699"	2699
8450	8476	3	https://www.ldlc.com/fiche/PB00247929.html	2018-07-05 16:12:20.653611	2018-07-05 16:12:20.653611	"2018-07-05T18:12:20+02:00"=>"2899"	2899
8451	8477	3	https://www.ldlc.com/fiche/PB00247874.html	2018-07-05 16:12:21.175807	2018-07-05 16:12:21.175807	"2018-07-05T18:12:21+02:00"=>"4499"	4499
8452	8478	3	https://www.ldlc.com/fiche/PB00247927.html	2018-07-05 16:12:21.720391	2018-07-05 16:12:21.720391	"2018-07-05T18:12:21+02:00"=>"3599"	3599
8453	8479	3	https://www.ldlc.com/fiche/PB00247876.html	2018-07-05 16:12:22.256028	2018-07-05 16:12:22.256028	"2018-07-05T18:12:22+02:00"=>"4299"	4299
8454	7852	3	https://www.ldlc.com/fiche/PB00234592.html	2018-07-05 16:12:22.771922	2018-07-05 16:12:22.771922	"2018-07-05T18:12:22+02:00"=>"3999"	3999
8455	8480	3	https://www.ldlc.com/fiche/PB00235404.html	2018-07-05 16:12:24.317892	2018-07-05 16:12:24.317892	"2018-07-05T18:12:24+02:00"=>"1999"	1999
8456	8481	3	https://www.ldlc.com/fiche/PB00234596.html	2018-07-05 16:12:24.855102	2018-07-05 16:12:24.855102	"2018-07-05T18:12:24+02:00"=>"3699"	3699
8457	8482	3	https://www.ldlc.com/fiche/PB00234602.html	2018-07-05 16:12:25.411658	2018-07-05 16:12:25.411658	"2018-07-05T18:12:25+02:00"=>"3199"	3199
8458	8483	3	https://www.ldlc.com/fiche/PB00250143.html	2018-07-05 16:12:25.930208	2018-07-05 16:12:25.930208	"2018-07-05T18:12:25+02:00"=>"4999"	4999
8459	8484	3	https://www.ldlc.com/fiche/PB00250160.html	2018-07-05 16:12:26.435872	2018-07-05 16:12:26.435872	"2018-07-05T18:12:26+02:00"=>"6299"	6299
8460	8485	3	https://www.ldlc.com/fiche/PB00222865.html	2018-07-05 16:12:27.040348	2018-07-05 16:12:27.040348	"2018-07-05T18:12:27+02:00"=>"1229"	1229
8461	8486	3	https://www.ldlc.com/fiche/PB00234839.html	2018-07-05 16:12:27.56919	2018-07-05 16:12:27.56919	"2018-07-05T18:12:27+02:00"=>"1399"	1399
8462	8487	3	https://www.ldlc.com/fiche/PB00249953.html	2018-07-05 16:12:28.102464	2018-07-05 16:12:28.102464	"2018-07-05T18:12:28+02:00"=>"1499"	1499
8463	8488	3	https://www.ldlc.com/fiche/PB00249910.html	2018-07-05 16:12:28.642982	2018-07-05 16:12:28.642982	"2018-07-05T18:12:28+02:00"=>"1399"	1399
8464	8489	3	https://www.ldlc.com/fiche/PB00243458.html	2018-07-05 16:12:29.163673	2018-07-05 16:12:29.163673	"2018-07-05T18:12:29+02:00"=>"1399"	1399
8465	8490	3	https://www.ldlc.com/fiche/PB00240209.html	2018-07-05 16:12:29.694596	2018-07-05 16:12:29.694596	"2018-07-05T18:12:29+02:00"=>"1799"	1799
8466	8491	3	https://www.ldlc.com/fiche/PB00249684.html	2018-07-05 16:12:30.227139	2018-07-05 16:12:30.227139	"2018-07-05T18:12:30+02:00"=>"1699"	1699
8467	8492	3	https://www.ldlc.com/fiche/PB00245925.html	2018-07-05 16:12:30.746868	2018-07-05 16:12:30.746868	"2018-07-05T18:12:30+02:00"=>"1999"	1999
8468	8493	3	https://www.ldlc.com/fiche/PB00226625.html	2018-07-05 16:12:31.49938	2018-07-05 16:12:31.49938	"2018-07-05T18:12:31+02:00"=>"2199"	2199
8469	8494	3	https://www.ldlc.com/fiche/PB00226606.html	2018-07-05 16:12:33.017204	2018-07-05 16:12:33.017204	"2018-07-05T18:12:33+02:00"=>"2299"	2299
8470	8495	3	https://www.ldlc.com/fiche/PB00231989.html	2018-07-05 16:12:33.563965	2018-07-05 16:12:33.563965	"2018-07-05T18:12:33+02:00"=>"2099"	2099
8471	8496	3	https://www.ldlc.com/fiche/PB00226561.html	2018-07-05 16:12:34.064711	2018-07-05 16:12:34.064711	"2018-07-05T18:12:34+02:00"=>"2799"	2799
8472	8497	3	https://www.ldlc.com/fiche/PB00232572.html	2018-07-05 16:12:34.592691	2018-07-05 16:12:34.592691	"2018-07-05T18:12:34+02:00"=>"3199"	3199
8473	8498	3	https://www.ldlc.com/fiche/PB00245547.html	2018-07-05 16:12:36.183712	2018-07-05 16:12:36.183712	"2018-07-05T18:12:36+02:00"=>"3999"	3999
8474	8499	3	https://www.ldlc.com/fiche/PB00226551.html	2018-07-05 16:12:36.70982	2018-07-05 16:12:36.70982	"2018-07-05T18:12:36+02:00"=>"5999"	5999
8475	8500	3	https://www.ldlc.com/fiche/PB00232457.html	2018-07-05 16:12:37.257794	2018-07-05 16:12:37.257794	"2018-07-05T18:12:37+02:00"=>"5499"	5499
8476	7774	3	https://www.ldlc.com/fiche/PB00234159.html	2018-07-05 16:12:37.798323	2018-07-05 16:12:37.798323	"2018-07-05T18:12:37+02:00"=>"1649"	1649
8477	8501	3	https://www.ldlc.com/fiche/PB00234168.html	2018-07-05 16:12:38.30944	2018-07-05 16:12:38.30944	"2018-07-05T18:12:38+02:00"=>"1369"	1369
8478	8502	3	https://www.ldlc.com/fiche/PB00247837.html	2018-07-05 16:12:38.817186	2018-07-05 16:12:38.817186	"2018-07-05T18:12:38+02:00"=>"1499"	1499
8479	8503	3	https://www.ldlc.com/fiche/PB00222208.html	2018-07-05 16:12:39.338633	2018-07-05 16:12:39.338633	"2018-07-05T18:12:39+02:00"=>"1499"	1499
8480	8504	3	https://www.ldlc.com/fiche/PB00219884.html	2018-07-05 16:12:40.842263	2018-07-05 16:12:40.842263	"2018-07-05T18:12:40+02:00"=>"1449"	1449
8481	7810	3	https://www.ldlc.com/fiche/PB00237121.html	2018-07-05 16:12:41.356576	2018-07-05 16:12:41.356576	"2018-07-05T18:12:41+02:00"=>"2399"	2399
8482	8505	3	https://www.ldlc.com/fiche/PB00249683.html	2018-07-05 16:12:42.855332	2018-07-05 16:12:42.855332	"2018-07-05T18:12:42+02:00"=>"1499"	1499
8483	8506	3	https://www.ldlc.com/fiche/PB00234611.html	2018-07-05 16:12:43.371851	2018-07-05 16:12:43.371851	"2018-07-05T18:12:43+02:00"=>"2599"	2599
8484	8507	3	https://www.ldlc.com/fiche/PB00248804.html	2018-07-05 16:12:43.916859	2018-07-05 16:12:43.916859	"2018-07-05T18:12:43+02:00"=>"2599"	2599
7958	8005	3	https://www.ldlc.com/fiche/PB00233982.html	2018-07-05 16:05:59.240958	2018-07-05 16:05:59.240958	"2018-07-05T18:05:59+02:00"=>"829"	829
7961	8008	3	https://www.ldlc.com/fiche/PB00248880.html	2018-07-05 16:05:59.772931	2018-07-05 16:05:59.772931	"2018-07-05T18:05:59+02:00"=>"849"	849
7963	8010	3	https://www.ldlc.com/fiche/PB00234257.html	2018-07-05 16:06:00.359228	2018-07-05 16:06:00.359228	"2018-07-05T18:06:00+02:00"=>"629"	629
7964	8011	3	https://www.ldlc.com/fiche/PB00229961.html	2018-07-05 16:06:00.920699	2018-07-05 16:06:00.920699	"2018-07-05T18:06:00+02:00"=>"688"	688
7965	8012	3	https://www.ldlc.com/fiche/PB00229909.html	2018-07-05 16:06:01.460155	2018-07-05 16:06:01.460155	"2018-07-05T18:06:01+02:00"=>"879"	879
7966	8013	3	https://www.ldlc.com/fiche/PB00229949.html	2018-07-05 16:06:01.966668	2018-07-05 16:06:01.966668	"2018-07-05T18:06:01+02:00"=>"899"	899
7967	8014	3	https://www.ldlc.com/fiche/PB00229861.html	2018-07-05 16:06:02.476692	2018-07-05 16:06:02.476692	"2018-07-05T18:06:02+02:00"=>"859"	859
7969	8016	3	https://www.ldlc.com/fiche/PB00229959.html	2018-07-05 16:06:03.047233	2018-07-05 16:06:03.047233	"2018-07-05T18:06:03+02:00"=>"939"	939
7971	8018	3	https://www.ldlc.com/fiche/PB00250364.html	2018-07-05 16:06:03.578194	2018-07-05 16:06:03.578194	"2018-07-05T18:06:03+02:00"=>"398"	398
7973	8020	3	https://www.ldlc.com/fiche/PB00226288.html	2018-07-05 16:06:04.086212	2018-07-05 16:06:04.086212	"2018-07-05T18:06:04+02:00"=>"1999"	1999
7974	8021	3	https://www.ldlc.com/fiche/PB00242608.html	2018-07-05 16:06:04.588522	2018-07-05 16:06:04.588522	"2018-07-05T18:06:04+02:00"=>"1299"	1299
7976	8023	3	https://www.ldlc.com/fiche/PB00210691.html	2018-07-05 16:06:05.121198	2018-07-05 16:06:05.121198	"2018-07-05T18:06:05+02:00"=>"549"	549
8485	8508	3	https://www.ldlc.com/fiche/PB00251180.html	2018-07-05 16:12:44.438348	2018-07-05 16:12:44.438348	"2018-07-05T18:12:44+02:00"=>"1949"	1949
8486	8509	3	https://www.ldlc.com/fiche/PB00251196.html	2018-07-05 16:12:46.060422	2018-07-05 16:12:46.060422	"2018-07-05T18:12:46+02:00"=>"2249"	2249
8487	8510	3	https://www.ldlc.com/fiche/PB00251206.html	2018-07-05 16:12:46.58176	2018-07-05 16:12:46.58176	"2018-07-05T18:12:46+02:00"=>"2649"	2649
8488	8511	3	https://www.ldlc.com/fiche/PB00234643.html	2018-07-05 16:12:47.105284	2018-07-05 16:12:47.105284	"2018-07-05T18:12:47+02:00"=>"4499"	4499
8489	8512	3	https://www.ldlc.com/fiche/PB00234659.html	2018-07-05 16:12:47.673514	2018-07-05 16:12:47.673514	"2018-07-05T18:12:47+02:00"=>"4999"	4999
8490	8513	3	https://www.ldlc.com/fiche/PB00238044.html	2018-07-05 16:12:48.198552	2018-07-05 16:12:48.198552	"2018-07-05T18:12:48+02:00"=>"2399"	2399
8491	8514	3	https://www.ldlc.com/fiche/PB00240409.html	2018-07-05 16:12:48.808465	2018-07-05 16:12:48.808465	"2018-07-05T18:12:48+02:00"=>"1699"	1699
8492	8515	3	https://www.ldlc.com/fiche/PB00239202.html	2018-07-05 16:12:49.346664	2018-07-05 16:12:49.346664	"2018-07-05T18:12:49+02:00"=>"1899"	1899
8493	8516	3	https://www.ldlc.com/fiche/PB00253090.html	2018-07-05 16:12:49.85958	2018-07-05 16:12:49.85958	"2018-07-05T18:12:49+02:00"=>"1899"	1899
8494	8517	3	https://www.ldlc.com/fiche/PB00251202.html	2018-07-05 16:12:50.379523	2018-07-05 16:12:50.379523	"2018-07-05T18:12:50+02:00"=>"2449"	2449
8495	8518	3	https://www.ldlc.com/fiche/PB00212260.html	2018-07-05 16:12:50.894939	2018-07-05 16:12:50.894939	"2018-07-05T18:12:50+02:00"=>"229"	229
8496	8519	3	https://www.ldlc.com/fiche/PB00205208.html	2018-07-05 16:12:51.412575	2018-07-05 16:12:51.412575	"2018-07-05T18:12:51+02:00"=>"1249"	1249
8497	8520	3	https://www.ldlc.com/fiche/PB00234765.html	2018-07-05 16:12:51.935156	2018-07-05 16:12:51.935156	"2018-07-05T18:12:51+02:00"=>"1549"	1549
8498	8521	3	https://www.ldlc.com/fiche/PB00234761.html	2018-07-05 16:12:52.466549	2018-07-05 16:12:52.466549	"2018-07-05T18:12:52+02:00"=>"829"	829
8499	8522	3	https://www.ldlc.com/fiche/PB00234762.html	2018-07-05 16:12:52.995606	2018-07-05 16:12:52.995606	"2018-07-05T18:12:52+02:00"=>"899"	899
8500	8523	3	https://www.ldlc.com/fiche/PB00234763.html	2018-07-05 16:12:53.591163	2018-07-05 16:12:53.591163	"2018-07-05T18:12:53+02:00"=>"1579"	1579
8501	8524	3	https://www.ldlc.com/fiche/PB00246558.html	2018-07-05 16:12:54.110205	2018-07-05 16:12:54.110205	"2018-07-05T18:12:54+02:00"=>"1149"	1149
8502	8525	3	https://www.ldlc.com/fiche/PB00246554.html	2018-07-05 16:12:54.646991	2018-07-05 16:12:54.646991	"2018-07-05T18:12:54+02:00"=>"1292"	1292
8503	8526	3	https://www.ldlc.com/fiche/PB00236289.html	2018-07-05 16:12:55.189884	2018-07-05 16:12:55.189884	"2018-07-05T18:12:55+02:00"=>"1695"	1695
8504	8527	3	https://www.ldlc.com/fiche/PB00234721.html	2018-07-05 16:12:55.736116	2018-07-05 16:12:55.736116	"2018-07-05T18:12:55+02:00"=>"1599"	1599
8505	8528	3	https://www.ldlc.com/fiche/PB00236351.html	2018-07-05 16:12:56.295623	2018-07-05 16:12:56.295623	"2018-07-05T18:12:56+02:00"=>"579"	579
8506	8529	3	https://www.ldlc.com/fiche/PB00223752.html	2018-07-05 16:12:58.215716	2018-07-05 16:12:58.215716	"2018-07-05T18:12:58+02:00"=>"1299"	1299
8507	8530	3	https://www.ldlc.com/fiche/PB00225733.html	2018-07-05 16:12:58.774046	2018-07-05 16:12:58.774046	"2018-07-05T18:12:58+02:00"=>"399"	399
8508	8531	3	https://www.ldlc.com/fiche/PB00225737.html	2018-07-05 16:12:59.284145	2018-07-05 16:12:59.284145	"2018-07-05T18:12:59+02:00"=>"489"	489
8509	8532	3	https://www.ldlc.com/fiche/PB00225738.html	2018-07-05 16:12:59.843123	2018-07-05 16:12:59.843123	"2018-07-05T18:12:59+02:00"=>"389"	389
8510	8533	3	https://www.ldlc.com/fiche/PB00228606.html	2018-07-05 16:13:00.384007	2018-07-05 16:13:00.384007	"2018-07-05T18:13:00+02:00"=>"479"	479
8511	8534	3	https://www.ldlc.com/fiche/PB00251983.html	2018-07-05 16:13:00.971646	2018-07-05 16:13:00.971646	"2018-07-05T18:13:00+02:00"=>"549"	549
8512	8535	3	https://www.ldlc.com/fiche/PB00225739.html	2018-07-05 16:13:02.587098	2018-07-05 16:13:02.587098	"2018-07-05T18:13:02+02:00"=>"959"	959
8513	8536	3	https://www.ldlc.com/fiche/PB00225740.html	2018-07-05 16:13:03.107041	2018-07-05 16:13:03.107041	"2018-07-05T18:13:03+02:00"=>"789"	789
8514	8537	3	https://www.ldlc.com/fiche/PB00234682.html	2018-07-05 16:13:04.628897	2018-07-05 16:13:04.628897	"2018-07-05T18:13:04+02:00"=>"1149"	1149
8515	8538	3	https://www.ldlc.com/fiche/PB00225743.html	2018-07-05 16:13:05.145182	2018-07-05 16:13:05.145182	"2018-07-05T18:13:05+02:00"=>"1199"	1199
8516	8539	3	https://www.ldlc.com/fiche/PB00225741.html	2018-07-05 16:13:05.821108	2018-07-05 16:13:05.821108	"2018-07-05T18:13:05+02:00"=>"939"	939
8517	8540	3	https://www.ldlc.com/fiche/PB00234824.html	2018-07-05 16:13:07.369394	2018-07-05 16:13:07.369394	"2018-07-05T18:13:07+02:00"=>"1559"	1559
8518	8541	3	https://www.ldlc.com/fiche/PB00229649.html	2018-07-05 16:13:07.878305	2018-07-05 16:13:07.878305	"2018-07-05T18:13:07+02:00"=>"779"	779
8519	8542	3	https://www.ldlc.com/fiche/PB00236280.html	2018-07-05 16:13:08.380932	2018-07-05 16:13:08.380932	"2018-07-05T18:13:08+02:00"=>"799"	799
7977	8024	3	https://www.ldlc.com/fiche/PB00236197.html	2018-07-05 16:07:38.872976	2018-07-05 16:07:38.872976	"2018-07-05T18:07:38+02:00"=>"769"	769
7978	8025	3	https://www.ldlc.com/fiche/PB00235160.html	2018-07-05 16:07:40.437426	2018-07-05 16:07:40.437426	"2018-07-05T18:07:40+02:00"=>"2549"	2549
7979	8026	3	https://www.ldlc.com/fiche/PB00248491.html	2018-07-05 16:07:41.109049	2018-07-05 16:07:41.109049	"2018-07-05T18:07:41+02:00"=>"2699"	2699
7980	8027	3	https://www.ldlc.com/fiche/PB00237826.html	2018-07-05 16:07:41.633425	2018-07-05 16:07:41.633425	"2018-07-05T18:07:41+02:00"=>"3099"	3099
7981	8028	3	https://www.ldlc.com/fiche/PB00239020.html	2018-07-05 16:07:42.150633	2018-07-05 16:07:42.150633	"2018-07-05T18:07:42+02:00"=>"3399"	3399
7982	8029	3	https://www.ldlc.com/fiche/PB00248596.html	2018-07-05 16:07:42.651497	2018-07-05 16:07:42.651497	"2018-07-05T18:07:42+02:00"=>"2999"	2999
7983	8030	3	https://www.ldlc.com/fiche/PB00234676.html	2018-07-05 16:07:43.255503	2018-07-05 16:07:43.255503	"2018-07-05T18:07:43+02:00"=>"2499"	2499
7984	8031	3	https://www.ldlc.com/fiche/PB00248610.html	2018-07-05 16:07:43.81311	2018-07-05 16:07:43.81311	"2018-07-05T18:07:43+02:00"=>"3999"	3999
7985	8032	3	https://www.ldlc.com/fiche/PB00239553.html	2018-07-05 16:07:44.325775	2018-07-05 16:07:44.325775	"2018-07-05T18:07:44+02:00"=>"999"	999
7986	8033	3	https://www.ldlc.com/fiche/PB00242411.html	2018-07-05 16:07:44.83771	2018-07-05 16:07:44.83771	"2018-07-05T18:07:44+02:00"=>"1279"	1279
7987	8034	3	https://www.ldlc.com/fiche/PB00233641.html	2018-07-05 16:07:45.376295	2018-07-05 16:07:45.376295	"2018-07-05T18:07:45+02:00"=>"1199"	1199
7988	8035	3	https://www.ldlc.com/fiche/PB00250679.html	2018-07-05 16:07:45.856269	2018-07-05 16:07:45.856269	"2018-07-05T18:07:45+02:00"=>"1229"	1229
7989	8036	3	https://www.ldlc.com/fiche/PB00250724.html	2018-07-05 16:07:46.6073	2018-07-05 16:07:46.6073	"2018-07-05T18:07:46+02:00"=>"1499"	1499
7990	8038	3	https://www.ldlc.com/fiche/PB00251944.html	2018-07-05 16:07:47.663324	2018-07-05 16:07:47.663324	"2018-07-05T18:07:47+02:00"=>"718"	718
7991	8039	3	https://www.ldlc.com/fiche/PB00241489.html	2018-07-05 16:07:48.196185	2018-07-05 16:07:48.196185	"2018-07-05T18:07:48+02:00"=>"449"	449
7992	8040	3	https://www.ldlc.com/fiche/PB00236367.html	2018-07-05 16:07:48.700467	2018-07-05 16:07:48.700467	"2018-07-05T18:07:48+02:00"=>"399"	399
7993	8041	3	https://www.ldlc.com/fiche/PB00194572.html	2018-07-05 16:07:49.166902	2018-07-05 16:07:49.166902	"2018-07-05T18:07:49+02:00"=>"299"	299
7994	8042	3	https://www.ldlc.com/fiche/PB00246129.html	2018-07-05 16:07:49.663509	2018-07-05 16:07:49.663509	"2018-07-05T18:07:49+02:00"=>"289"	289
7995	8043	3	https://www.ldlc.com/fiche/PB00241596.html	2018-07-05 16:07:50.184198	2018-07-05 16:07:50.184198	"2018-07-05T18:07:50+02:00"=>"349"	349
7996	8044	3	https://www.ldlc.com/fiche/PB00216561.html	2018-07-05 16:07:50.68237	2018-07-05 16:07:50.68237	"2018-07-05T18:07:50+02:00"=>"289"	289
7997	8045	3	https://www.ldlc.com/fiche/PB00233697.html	2018-07-05 16:07:51.220838	2018-07-05 16:07:51.220838	"2018-07-05T18:07:51+02:00"=>"449"	449
7998	8046	3	https://www.ldlc.com/fiche/PB00236033.html	2018-07-05 16:07:51.723958	2018-07-05 16:07:51.723958	"2018-07-05T18:07:51+02:00"=>"699"	699
7999	8047	3	https://www.ldlc.com/fiche/PB00235548.html	2018-07-05 16:07:52.242888	2018-07-05 16:07:52.242888	"2018-07-05T18:07:52+02:00"=>"899"	899
8000	8048	3	https://www.ldlc.com/fiche/PB00236089.html	2018-07-05 16:07:52.735316	2018-07-05 16:07:52.735316	"2018-07-05T18:07:52+02:00"=>"999"	999
8001	8049	3	https://www.ldlc.com/fiche/PB00227969.html	2018-07-05 16:07:53.24028	2018-07-05 16:07:53.24028	"2018-07-05T18:07:53+02:00"=>"1139"	1139
8002	8050	3	https://www.ldlc.com/fiche/PB00224024.html	2018-07-05 16:07:53.808311	2018-07-05 16:07:53.808311	"2018-07-05T18:07:53+02:00"=>"699"	699
8003	8051	3	https://www.ldlc.com/fiche/PB00212699.html	2018-07-05 16:07:54.421648	2018-07-05 16:07:54.421648	"2018-07-05T18:07:54+02:00"=>"867"	867
8004	8052	3	https://www.ldlc.com/fiche/PB00221509.html	2018-07-05 16:07:54.986296	2018-07-05 16:07:54.986296	"2018-07-05T18:07:54+02:00"=>"689"	689
8005	8053	3	https://www.ldlc.com/fiche/PB00241767.html	2018-07-05 16:07:55.519255	2018-07-05 16:07:55.519255	"2018-07-05T18:07:55+02:00"=>"319"	319
8006	8054	3	https://www.ldlc.com/fiche/PB00242420.html	2018-07-05 16:07:56.05637	2018-07-05 16:07:56.05637	"2018-07-05T18:07:56+02:00"=>"549"	549
8007	8055	3	https://www.ldlc.com/fiche/PB00242442.html	2018-07-05 16:07:57.949088	2018-07-05 16:07:57.949088	"2018-07-05T18:07:57+02:00"=>"579"	579
8008	8056	3	https://www.ldlc.com/fiche/PB00252083.html	2018-07-05 16:07:58.467939	2018-07-05 16:07:58.467939	"2018-07-05T18:07:58+02:00"=>"559"	559
8009	8057	3	https://www.ldlc.com/fiche/PB00244009.html	2018-07-05 16:07:59.04232	2018-07-05 16:07:59.04232	"2018-07-05T18:07:59+02:00"=>"749"	749
8010	8058	3	https://www.ldlc.com/fiche/PB00243154.html	2018-07-05 16:07:59.545335	2018-07-05 16:07:59.545335	"2018-07-05T18:07:59+02:00"=>"849"	849
8011	8059	3	https://www.ldlc.com/fiche/PB00242175.html	2018-07-05 16:08:00.089229	2018-07-05 16:08:00.089229	"2018-07-05T18:08:00+02:00"=>"559"	559
8012	8060	3	https://www.ldlc.com/fiche/PB00242176.html	2018-07-05 16:08:00.591972	2018-07-05 16:08:00.591972	"2018-07-05T18:08:00+02:00"=>"529"	529
8013	8061	3	https://www.ldlc.com/fiche/PB00242173.html	2018-07-05 16:08:01.102398	2018-07-05 16:08:01.102398	"2018-07-05T18:08:01+02:00"=>"719"	719
8014	8062	3	https://www.ldlc.com/fiche/PB00250678.html	2018-07-05 16:08:01.676108	2018-07-05 16:08:01.676108	"2018-07-05T18:08:01+02:00"=>"619"	619
8015	8063	3	https://www.ldlc.com/fiche/PB00251100.html	2018-07-05 16:08:02.198355	2018-07-05 16:08:02.198355	"2018-07-05T18:08:02+02:00"=>"999"	999
8016	8064	3	https://www.ldlc.com/fiche/PB00238025.html	2018-07-05 16:08:02.696034	2018-07-05 16:08:02.696034	"2018-07-05T18:08:02+02:00"=>"519"	519
8017	8065	3	https://www.ldlc.com/fiche/PB00250427.html	2018-07-05 16:08:03.217284	2018-07-05 16:08:03.217284	"2018-07-05T18:08:03+02:00"=>"669"	669
8018	8066	3	https://www.ldlc.com/fiche/PB00242169.html	2018-07-05 16:08:03.717942	2018-07-05 16:08:03.717942	"2018-07-05T18:08:03+02:00"=>"649"	649
8019	8067	3	https://www.ldlc.com/fiche/PB00242170.html	2018-07-05 16:08:04.205341	2018-07-05 16:08:04.205341	"2018-07-05T18:08:04+02:00"=>"799"	799
8020	8068	3	https://www.ldlc.com/fiche/PB00250173.html	2018-07-05 16:08:04.729814	2018-07-05 16:08:04.729814	"2018-07-05T18:08:04+02:00"=>"829"	829
8021	8069	3	https://www.ldlc.com/fiche/PB00250380.html	2018-07-05 16:08:05.248891	2018-07-05 16:08:05.248891	"2018-07-05T18:08:05+02:00"=>"1049"	1049
8022	8070	3	https://www.ldlc.com/fiche/PB00250445.html	2018-07-05 16:08:05.780604	2018-07-05 16:08:05.780604	"2018-07-05T18:08:05+02:00"=>"1101"	1101
8023	8071	3	https://www.ldlc.com/fiche/PB00230468.html	2018-07-05 16:08:06.273188	2018-07-05 16:08:06.273188	"2018-07-05T18:08:06+02:00"=>"829"	829
8024	8072	3	https://www.ldlc.com/fiche/PB00203569.html	2018-07-05 16:08:07.78138	2018-07-05 16:08:07.78138	"2018-07-05T18:08:07+02:00"=>"541"	541
8025	8073	3	https://www.ldlc.com/fiche/PB00241465.html	2018-07-05 16:08:08.305681	2018-07-05 16:08:08.305681	"2018-07-05T18:08:08+02:00"=>"499"	499
8026	8074	3	https://www.ldlc.com/fiche/PB00241456.html	2018-07-05 16:08:08.827079	2018-07-05 16:08:08.827079	"2018-07-05T18:08:08+02:00"=>"549"	549
8027	8075	3	https://www.ldlc.com/fiche/PB00241398.html	2018-07-05 16:08:09.356215	2018-07-05 16:08:09.356215	"2018-07-05T18:08:09+02:00"=>"649"	649
8028	8076	3	https://www.ldlc.com/fiche/PB00246703.html	2018-07-05 16:08:09.879348	2018-07-05 16:08:09.879348	"2018-07-05T18:08:09+02:00"=>"599"	599
8029	8077	3	https://www.ldlc.com/fiche/PB00209609.html	2018-07-05 16:08:10.392773	2018-07-05 16:08:10.392773	"2018-07-05T18:08:10+02:00"=>"879"	879
8030	8078	3	https://www.ldlc.com/fiche/PB00241486.html	2018-07-05 16:08:10.91063	2018-07-05 16:08:10.91063	"2018-07-05T18:08:10+02:00"=>"529"	529
8031	8079	3	https://www.ldlc.com/fiche/PB00218893.html	2018-07-05 16:08:11.438622	2018-07-05 16:08:11.438622	"2018-07-05T18:08:11+02:00"=>"659"	659
8032	8080	3	https://www.ldlc.com/fiche/PB00196480.html	2018-07-05 16:08:12.046698	2018-07-05 16:08:12.046698	"2018-07-05T18:08:12+02:00"=>"759"	759
8033	8081	3	https://www.ldlc.com/fiche/PB00248666.html	2018-07-05 16:08:12.585609	2018-07-05 16:08:12.585609	"2018-07-05T18:08:12+02:00"=>"449"	449
8034	8082	3	https://www.ldlc.com/fiche/PB00213206.html	2018-07-05 16:08:13.136371	2018-07-05 16:08:13.136371	"2018-07-05T18:08:13+02:00"=>"459"	459
8035	8083	3	https://www.ldlc.com/fiche/PB00237380.html	2018-07-05 16:08:13.6541	2018-07-05 16:08:13.6541	"2018-07-05T18:08:13+02:00"=>"559"	559
8036	8084	3	https://www.ldlc.com/fiche/PB00248707.html	2018-07-05 16:08:14.418895	2018-07-05 16:08:14.418895	"2018-07-05T18:08:14+02:00"=>"499"	499
8037	8085	3	https://www.ldlc.com/fiche/PB00248712.html	2018-07-05 16:08:14.937141	2018-07-05 16:08:14.937141	"2018-07-05T18:08:14+02:00"=>"699"	699
8038	8086	3	https://www.ldlc.com/fiche/PB00236660.html	2018-07-05 16:08:15.455675	2018-07-05 16:08:15.455675	"2018-07-05T18:08:15+02:00"=>"579"	579
8039	8087	3	https://www.ldlc.com/fiche/PB00244789.html	2018-07-05 16:08:16.046301	2018-07-05 16:08:16.046301	"2018-07-05T18:08:16+02:00"=>"699"	699
8040	8088	3	https://www.ldlc.com/fiche/PB00233865.html	2018-07-05 16:08:16.553061	2018-07-05 16:08:16.553061	"2018-07-05T18:08:16+02:00"=>"649"	649
8041	8089	3	https://www.ldlc.com/fiche/PB00234767.html	2018-07-05 16:08:17.098167	2018-07-05 16:08:17.098167	"2018-07-05T18:08:17+02:00"=>"739"	739
8042	8090	3	https://www.ldlc.com/fiche/PB00236489.html	2018-07-05 16:08:17.648486	2018-07-05 16:08:17.648486	"2018-07-05T18:08:17+02:00"=>"649"	649
8043	8091	3	https://www.ldlc.com/fiche/PB00241080.html	2018-07-05 16:08:18.124135	2018-07-05 16:08:18.124135	"2018-07-05T18:08:18+02:00"=>"799"	799
8044	8092	3	https://www.ldlc.com/fiche/PB00236097.html	2018-07-05 16:08:18.646197	2018-07-05 16:08:18.646197	"2018-07-05T18:08:18+02:00"=>"449"	449
8045	8093	3	https://www.ldlc.com/fiche/PB00235607.html	2018-07-05 16:08:19.188578	2018-07-05 16:08:19.188578	"2018-07-05T18:08:19+02:00"=>"699"	699
8046	8094	3	https://www.ldlc.com/fiche/PB00247269.html	2018-07-05 16:08:19.711721	2018-07-05 16:08:19.711721	"2018-07-05T18:08:19+02:00"=>"649"	649
8047	8095	3	https://www.ldlc.com/fiche/PB00245285.html	2018-07-05 16:08:20.25828	2018-07-05 16:08:20.25828	"2018-07-05T18:08:20+02:00"=>"2999"	2999
8048	8096	3	https://www.ldlc.com/fiche/PB00245292.html	2018-07-05 16:08:20.766333	2018-07-05 16:08:20.766333	"2018-07-05T18:08:20+02:00"=>"3499"	3499
8049	8097	3	https://www.ldlc.com/fiche/PB00251804.html	2018-07-05 16:08:21.261958	2018-07-05 16:08:21.261958	"2018-07-05T18:08:21+02:00"=>"1349"	1349
8050	8098	3	https://www.ldlc.com/fiche/PB00251006.html	2018-07-05 16:08:21.75733	2018-07-05 16:08:21.75733	"2018-07-05T18:08:21+02:00"=>"3999"	3999
8051	8099	3	https://www.ldlc.com/fiche/PB00249987.html	2018-07-05 16:08:22.273644	2018-07-05 16:08:22.273644	"2018-07-05T18:08:22+02:00"=>"2999"	2999
8052	8100	3	https://www.ldlc.com/fiche/PB00246392.html	2018-07-05 16:08:22.786531	2018-07-05 16:08:22.786531	"2018-07-05T18:08:22+02:00"=>"3999"	3999
8053	8101	3	https://www.ldlc.com/fiche/PB00243783.html	2018-07-05 16:08:23.345431	2018-07-05 16:08:23.345431	"2018-07-05T18:08:23+02:00"=>"1499"	1499
8054	8102	3	https://www.ldlc.com/fiche/PB00243788.html	2018-07-05 16:08:23.882388	2018-07-05 16:08:23.882388	"2018-07-05T18:08:23+02:00"=>"1699"	1699
8055	8103	3	https://www.ldlc.com/fiche/PB00249906.html	2018-07-05 16:08:24.422326	2018-07-05 16:08:24.422326	"2018-07-05T18:08:24+02:00"=>"2099"	2099
8056	8104	3	https://www.ldlc.com/fiche/PB00250620.html	2018-07-05 16:08:25.034555	2018-07-05 16:08:25.034555	"2018-07-05T18:08:25+02:00"=>"1499"	1499
8057	8105	3	https://www.ldlc.com/fiche/PB00234415.html	2018-07-05 16:08:25.576959	2018-07-05 16:08:25.576959	"2018-07-05T18:08:25+02:00"=>"1449"	1449
8058	8106	3	https://www.ldlc.com/fiche/PB00231388.html	2018-07-05 16:08:26.075537	2018-07-05 16:08:26.075537	"2018-07-05T18:08:26+02:00"=>"1899"	1899
8059	8107	3	https://www.ldlc.com/fiche/PB00231466.html	2018-07-05 16:08:26.616216	2018-07-05 16:08:26.616216	"2018-07-05T18:08:26+02:00"=>"2099"	2099
8060	8108	3	https://www.ldlc.com/fiche/PB00231465.html	2018-07-05 16:08:27.161849	2018-07-05 16:08:27.161849	"2018-07-05T18:08:27+02:00"=>"1899"	1899
8061	8109	3	https://www.ldlc.com/fiche/PB00231469.html	2018-07-05 16:08:27.690951	2018-07-05 16:08:27.690951	"2018-07-05T18:08:27+02:00"=>"2299"	2299
8062	8110	3	https://www.ldlc.com/fiche/PB00249387.html	2018-07-05 16:08:28.244327	2018-07-05 16:08:28.244327	"2018-07-05T18:08:28+02:00"=>"1399"	1399
8063	8111	3	https://www.ldlc.com/fiche/PB00236138.html	2018-07-05 16:08:28.774231	2018-07-05 16:08:28.774231	"2018-07-05T18:08:28+02:00"=>"899"	899
8064	8112	3	https://www.ldlc.com/fiche/PB00231348.html	2018-07-05 16:08:29.295972	2018-07-05 16:08:29.295972	"2018-07-05T18:08:29+02:00"=>"1199"	1199
8065	8113	3	https://www.ldlc.com/fiche/PB00231319.html	2018-07-05 16:08:29.814569	2018-07-05 16:08:29.814569	"2018-07-05T18:08:29+02:00"=>"1049"	1049
8066	8114	3	https://www.ldlc.com/fiche/PB00239303.html	2018-07-05 16:08:30.360658	2018-07-05 16:08:30.360658	"2018-07-05T18:08:30+02:00"=>"1499"	1499
8067	8115	3	https://www.ldlc.com/fiche/PB00249381.html	2018-07-05 16:08:30.892541	2018-07-05 16:08:30.892541	"2018-07-05T18:08:30+02:00"=>"1299"	1299
8068	8116	3	https://www.ldlc.com/fiche/PB00249384.html	2018-07-05 16:08:31.456657	2018-07-05 16:08:31.456657	"2018-07-05T18:08:31+02:00"=>"1499"	1499
8069	8117	3	https://www.ldlc.com/fiche/PB00236936.html	2018-07-05 16:08:31.982735	2018-07-05 16:08:31.982735	"2018-07-05T18:08:31+02:00"=>"1499"	1499
8070	8118	3	https://www.ldlc.com/fiche/PB00231532.html	2018-07-05 16:08:33.54435	2018-07-05 16:08:33.54435	"2018-07-05T18:08:33+02:00"=>"999"	999
8071	8119	3	https://www.ldlc.com/fiche/PB00227970.html	2018-07-05 16:08:34.067844	2018-07-05 16:08:34.067844	"2018-07-05T18:08:34+02:00"=>"1349"	1349
8072	8120	3	https://www.ldlc.com/fiche/PB00236013.html	2018-07-05 16:08:34.605259	2018-07-05 16:08:34.605259	"2018-07-05T18:08:34+02:00"=>"1119"	1119
8073	8121	3	https://www.ldlc.com/fiche/PB00253083.html	2018-07-05 16:08:35.10217	2018-07-05 16:08:35.10217	"2018-07-05T18:08:35+02:00"=>"1799"	1799
8074	8122	3	https://www.ldlc.com/fiche/PB00235994.html	2018-07-05 16:08:36.595833	2018-07-05 16:08:36.595833	"2018-07-05T18:08:36+02:00"=>"1799"	1799
8075	8123	3	https://www.ldlc.com/fiche/PB00245217.html	2018-07-05 16:08:38.080536	2018-07-05 16:08:38.080536	"2018-07-05T18:08:38+02:00"=>"3499"	3499
8076	8124	3	https://www.ldlc.com/fiche/PB00249294.html	2018-07-05 16:08:38.59139	2018-07-05 16:08:38.59139	"2018-07-05T18:08:38+02:00"=>"2999"	2999
8077	8125	3	https://www.ldlc.com/fiche/PB00234510.html	2018-07-05 16:08:39.090393	2018-07-05 16:08:39.090393	"2018-07-05T18:08:39+02:00"=>"2899"	2899
8078	8126	3	https://www.ldlc.com/fiche/PB00249868.html	2018-07-05 16:08:39.615492	2018-07-05 16:08:39.615492	"2018-07-05T18:08:39+02:00"=>"2499"	2499
8079	8127	3	https://www.ldlc.com/fiche/PB00197904.html	2018-07-05 16:08:40.11632	2018-07-05 16:08:40.11632	"2018-07-05T18:08:40+02:00"=>"349"	349
8080	8128	3	https://www.ldlc.com/fiche/PB00213822.html	2018-07-05 16:08:40.62545	2018-07-05 16:08:40.62545	"2018-07-05T18:08:40+02:00"=>"273"	273
8081	8129	3	https://www.ldlc.com/fiche/PB00213815.html	2018-07-05 16:08:41.114231	2018-07-05 16:08:41.114231	"2018-07-05T18:08:41+02:00"=>"303"	303
8082	8130	3	https://www.ldlc.com/fiche/PB00230413.html	2018-07-05 16:08:41.623688	2018-07-05 16:08:41.623688	"2018-07-05T18:08:41+02:00"=>"359"	359
8083	8131	3	https://www.ldlc.com/fiche/PB00233652.html	2018-07-05 16:08:42.170668	2018-07-05 16:08:42.170668	"2018-07-05T18:08:42+02:00"=>"409"	409
8084	8132	3	https://www.ldlc.com/fiche/PB00235542.html	2018-07-05 16:08:42.909649	2018-07-05 16:08:42.909649	"2018-07-05T18:08:42+02:00"=>"349"	349
8085	8133	3	https://www.ldlc.com/fiche/PB00241951.html	2018-07-05 16:08:43.42354	2018-07-05 16:08:43.42354	"2018-07-05T18:08:43+02:00"=>"499"	499
8086	8134	3	https://www.ldlc.com/fiche/PB00236314.html	2018-07-05 16:08:43.941411	2018-07-05 16:08:43.941411	"2018-07-05T18:08:43+02:00"=>"499"	499
8087	8135	3	https://www.ldlc.com/fiche/PB00236140.html	2018-07-05 16:08:44.469695	2018-07-05 16:08:44.469695	"2018-07-05T18:08:44+02:00"=>"219"	219
8088	8136	3	https://www.ldlc.com/fiche/PB00241605.html	2018-07-05 16:08:44.983554	2018-07-05 16:08:44.983554	"2018-07-05T18:08:44+02:00"=>"259"	259
8089	8137	3	https://www.ldlc.com/fiche/PB00226560.html	2018-07-05 16:08:45.450557	2018-07-05 16:08:45.450557	"2018-07-05T18:08:45+02:00"=>"219"	219
8090	8138	3	https://www.ldlc.com/fiche/PB00236362.html	2018-07-05 16:08:45.992208	2018-07-05 16:08:45.992208	"2018-07-05T18:08:45+02:00"=>"349"	349
8091	8139	3	https://www.ldlc.com/fiche/PB00247268.html	2018-07-05 16:08:46.484312	2018-07-05 16:08:46.484312	"2018-07-05T18:08:46+02:00"=>"399"	399
8092	8140	3	https://www.ldlc.com/fiche/PB00232067.html	2018-07-05 16:08:46.959474	2018-07-05 16:08:46.959474	"2018-07-05T18:08:46+02:00"=>"349"	349
8093	8141	3	https://www.ldlc.com/fiche/PB00241607.html	2018-07-05 16:08:47.473592	2018-07-05 16:08:47.473592	"2018-07-05T18:08:47+02:00"=>"399"	399
8094	8142	3	https://www.ldlc.com/fiche/PB00234461.html	2018-07-05 16:08:48.065534	2018-07-05 16:08:48.065534	"2018-07-05T18:08:48+02:00"=>"699"	699
8095	8143	3	https://www.ldlc.com/fiche/PB00236564.html	2018-07-05 16:08:48.563048	2018-07-05 16:08:48.563048	"2018-07-05T18:08:48+02:00"=>"849"	849
8096	8144	3	https://www.ldlc.com/fiche/PB00250643.html	2018-07-05 16:08:49.064797	2018-07-05 16:08:49.064797	"2018-07-05T18:08:49+02:00"=>"1599"	1599
8097	8145	3	https://www.ldlc.com/fiche/PB00243436.html	2018-07-05 16:08:49.576038	2018-07-05 16:08:49.576038	"2018-07-05T18:08:49+02:00"=>"1599"	1599
8098	8146	3	https://www.ldlc.com/fiche/PB00248780.html	2018-07-05 16:08:50.073704	2018-07-05 16:08:50.073704	"2018-07-05T18:08:50+02:00"=>"1199"	1199
8099	8147	3	https://www.ldlc.com/fiche/PB00236625.html	2018-07-05 16:08:50.600374	2018-07-05 16:08:50.600374	"2018-07-05T18:08:50+02:00"=>"1299"	1299
8100	8148	3	https://www.ldlc.com/fiche/PB00236456.html	2018-07-05 16:08:51.100167	2018-07-05 16:08:51.100167	"2018-07-05T18:08:51+02:00"=>"979"	979
8101	8149	3	https://www.ldlc.com/fiche/PB00248525.html	2018-07-05 16:08:51.626714	2018-07-05 16:08:51.626714	"2018-07-05T18:08:51+02:00"=>"899"	899
8102	8150	3	https://www.ldlc.com/fiche/PB00248524.html	2018-07-05 16:08:52.168528	2018-07-05 16:08:52.168528	"2018-07-05T18:08:52+02:00"=>"999"	999
8103	8151	3	https://www.ldlc.com/fiche/PB00240979.html	2018-07-05 16:08:52.668299	2018-07-05 16:08:52.668299	"2018-07-05T18:08:52+02:00"=>"899"	899
8104	8152	3	https://www.ldlc.com/fiche/PB00248658.html	2018-07-05 16:08:53.204976	2018-07-05 16:08:53.204976	"2018-07-05T18:08:53+02:00"=>"1199"	1199
8105	8153	3	https://www.ldlc.com/fiche/PB00236470.html	2018-07-05 16:08:53.784996	2018-07-05 16:08:53.784996	"2018-07-05T18:08:53+02:00"=>"759"	759
8106	8154	3	https://www.ldlc.com/fiche/PB00253043.html	2018-07-05 16:08:54.341202	2018-07-05 16:08:54.341202	"2018-07-05T18:08:54+02:00"=>"549"	549
8107	8155	3	https://www.ldlc.com/fiche/PB00241332.html	2018-07-05 16:08:54.892982	2018-07-05 16:08:54.892982	"2018-07-05T18:08:54+02:00"=>"869"	869
8108	8156	3	https://www.ldlc.com/fiche/PB00241364.html	2018-07-05 16:08:55.401291	2018-07-05 16:08:55.401291	"2018-07-05T18:08:55+02:00"=>"619"	619
8109	8157	3	https://www.ldlc.com/fiche/PB00236851.html	2018-07-05 16:08:55.960361	2018-07-05 16:08:55.960361	"2018-07-05T18:08:55+02:00"=>"699"	699
8110	8158	3	https://www.ldlc.com/fiche/PB00236855.html	2018-07-05 16:08:56.519933	2018-07-05 16:08:56.519933	"2018-07-05T18:08:56+02:00"=>"799"	799
8111	8159	3	https://www.ldlc.com/fiche/PB00241365.html	2018-07-05 16:08:57.062725	2018-07-05 16:08:57.062725	"2018-07-05T18:08:57+02:00"=>"799"	799
8112	8160	3	https://www.ldlc.com/fiche/PB00236864.html	2018-07-05 16:08:57.589556	2018-07-05 16:08:57.589556	"2018-07-05T18:08:57+02:00"=>"949"	949
8113	8161	3	https://www.ldlc.com/fiche/PB00237445.html	2018-07-05 16:08:58.083535	2018-07-05 16:08:58.083535	"2018-07-05T18:08:58+02:00"=>"1069"	1069
8114	8162	3	https://www.ldlc.com/fiche/PB00237830.html	2018-07-05 16:08:59.561103	2018-07-05 16:08:59.561103	"2018-07-05T18:08:59+02:00"=>"1299"	1299
8115	8163	3	https://www.ldlc.com/fiche/PB00241270.html	2018-07-05 16:09:00.095025	2018-07-05 16:09:00.095025	"2018-07-05T18:09:00+02:00"=>"969"	969
8116	8164	3	https://www.ldlc.com/fiche/PB00241267.html	2018-07-05 16:09:00.610535	2018-07-05 16:09:00.610535	"2018-07-05T18:09:00+02:00"=>"1299"	1299
8117	8165	3	https://www.ldlc.com/fiche/PB00241236.html	2018-07-05 16:09:01.075248	2018-07-05 16:09:01.075248	"2018-07-05T18:09:01+02:00"=>"599"	599
8118	8166	3	https://www.ldlc.com/fiche/PB00241095.html	2018-07-05 16:09:01.600764	2018-07-05 16:09:01.600764	"2018-07-05T18:09:01+02:00"=>"819"	819
8119	8167	3	https://www.ldlc.com/fiche/PB00234769.html	2018-07-05 16:09:02.107033	2018-07-05 16:09:02.107033	"2018-07-05T18:09:02+02:00"=>"1149"	1149
8120	8168	3	https://www.ldlc.com/fiche/PB00236638.html	2018-07-05 16:09:02.658307	2018-07-05 16:09:02.658307	"2018-07-05T18:09:02+02:00"=>"849"	849
8121	8169	3	https://www.ldlc.com/fiche/PB00236634.html	2018-07-05 16:09:03.237457	2018-07-05 16:09:03.237457	"2018-07-05T18:09:03+02:00"=>"999"	999
8122	8170	3	https://www.ldlc.com/fiche/PB00236640.html	2018-07-05 16:09:03.737913	2018-07-05 16:09:03.737913	"2018-07-05T18:09:03+02:00"=>"799"	799
8123	8171	3	https://www.ldlc.com/fiche/PB00249996.html	2018-07-05 16:09:04.233995	2018-07-05 16:09:04.233995	"2018-07-05T18:09:04+02:00"=>"999"	999
8124	8172	3	https://www.ldlc.com/fiche/PB00248511.html	2018-07-05 16:09:04.775072	2018-07-05 16:09:04.775072	"2018-07-05T18:09:04+02:00"=>"499"	499
8125	8173	3	https://www.ldlc.com/fiche/PB00241392.html	2018-07-05 16:09:05.285042	2018-07-05 16:09:05.285042	"2018-07-05T18:09:05+02:00"=>"699"	699
8126	8174	3	https://www.ldlc.com/fiche/PB00236383.html	2018-07-05 16:09:05.814933	2018-07-05 16:09:05.814933	"2018-07-05T18:09:05+02:00"=>"369"	369
8127	8175	3	https://www.ldlc.com/fiche/PB00236384.html	2018-07-05 16:09:06.347317	2018-07-05 16:09:06.347317	"2018-07-05T18:09:06+02:00"=>"549"	549
8128	8176	3	https://www.ldlc.com/fiche/PB00241578.html	2018-07-05 16:09:06.940861	2018-07-05 16:09:06.940861	"2018-07-05T18:09:06+02:00"=>"419"	419
8129	8177	3	https://www.ldlc.com/fiche/PB00237394.html	2018-07-05 16:09:07.612273	2018-07-05 16:09:07.612273	"2018-07-05T18:09:07+02:00"=>"449"	449
8130	8178	3	https://www.ldlc.com/fiche/PB00237395.html	2018-07-05 16:09:08.095413	2018-07-05 16:09:08.095413	"2018-07-05T18:09:08+02:00"=>"379"	379
8131	8179	3	https://www.ldlc.com/fiche/PB00233920.html	2018-07-05 16:09:08.61916	2018-07-05 16:09:08.61916	"2018-07-05T18:09:08+02:00"=>"599"	599
8132	8180	3	https://www.ldlc.com/fiche/PB00227940.html	2018-07-05 16:09:09.392564	2018-07-05 16:09:09.392564	"2018-07-05T18:09:09+02:00"=>"459"	459
8133	8181	3	https://www.ldlc.com/fiche/PB00239501.html	2018-07-05 16:09:09.914408	2018-07-05 16:09:09.914408	"2018-07-05T18:09:09+02:00"=>"1299"	1299
8134	8182	3	https://www.ldlc.com/fiche/PB00244406.html	2018-07-05 16:09:10.429314	2018-07-05 16:09:10.429314	"2018-07-05T18:09:10+02:00"=>"1299"	1299
8135	8183	3	https://www.ldlc.com/fiche/PB00239503.html	2018-07-05 16:09:11.005746	2018-07-05 16:09:11.005746	"2018-07-05T18:09:11+02:00"=>"999"	999
8136	8184	3	https://www.ldlc.com/fiche/PB00243445.html	2018-07-05 16:09:11.516299	2018-07-05 16:09:11.516299	"2018-07-05T18:09:11+02:00"=>"999"	999
8137	8185	3	https://www.ldlc.com/fiche/PB00237436.html	2018-07-05 16:09:12.099471	2018-07-05 16:09:12.099471	"2018-07-05T18:09:12+02:00"=>"929"	929
8138	8186	3	https://www.ldlc.com/fiche/PB00237397.html	2018-07-05 16:09:12.611977	2018-07-05 16:09:12.611977	"2018-07-05T18:09:12+02:00"=>"1649"	1649
8139	8187	3	https://www.ldlc.com/fiche/PB00237425.html	2018-07-05 16:09:13.188626	2018-07-05 16:09:13.188626	"2018-07-05T18:09:13+02:00"=>"1199"	1199
8140	8188	3	https://www.ldlc.com/fiche/PB00219239.html	2018-07-05 16:09:13.779832	2018-07-05 16:09:13.779832	"2018-07-05T18:09:13+02:00"=>"1759"	1759
8141	8189	3	https://www.ldlc.com/fiche/PB00237831.html	2018-07-05 16:09:14.286532	2018-07-05 16:09:14.286532	"2018-07-05T18:09:14+02:00"=>"1099"	1099
8142	8190	3	https://www.ldlc.com/fiche/PB00242224.html	2018-07-05 16:09:14.807829	2018-07-05 16:09:14.807829	"2018-07-05T18:09:14+02:00"=>"1069"	1069
8143	8191	3	https://www.ldlc.com/fiche/PB00242222.html	2018-07-05 16:09:15.310919	2018-07-05 16:09:15.310919	"2018-07-05T18:09:15+02:00"=>"1299"	1299
8144	8192	3	https://www.ldlc.com/fiche/PB00237896.html	2018-07-05 16:09:15.809494	2018-07-05 16:09:15.809494	"2018-07-05T18:09:15+02:00"=>"1249"	1249
8145	8193	3	https://www.ldlc.com/fiche/PB00242237.html	2018-07-05 16:09:16.31497	2018-07-05 16:09:16.31497	"2018-07-05T18:09:16+02:00"=>"1205"	1205
8146	8194	3	https://www.ldlc.com/fiche/PB00242272.html	2018-07-05 16:09:16.833311	2018-07-05 16:09:16.833311	"2018-07-05T18:09:16+02:00"=>"1399"	1399
8147	8195	3	https://www.ldlc.com/fiche/PB00242274.html	2018-07-05 16:09:17.326563	2018-07-05 16:09:17.326563	"2018-07-05T18:09:17+02:00"=>"1399"	1399
8148	8196	3	https://www.ldlc.com/fiche/PB00233412.html	2018-07-05 16:09:17.860433	2018-07-05 16:09:17.860433	"2018-07-05T18:09:17+02:00"=>"1349"	1349
8149	8197	3	https://www.ldlc.com/fiche/PB00242604.html	2018-07-05 16:09:18.383975	2018-07-05 16:09:18.383975	"2018-07-05T18:09:18+02:00"=>"1999"	1999
8150	8198	3	https://www.ldlc.com/fiche/PB00242216.html	2018-07-05 16:09:19.860295	2018-07-05 16:09:19.860295	"2018-07-05T18:09:19+02:00"=>"1399"	1399
8151	8199	3	https://www.ldlc.com/fiche/PB00238876.html	2018-07-05 16:09:20.401878	2018-07-05 16:09:20.401878	"2018-07-05T18:09:20+02:00"=>"1699"	1699
8152	8200	3	https://www.ldlc.com/fiche/PB00242218.html	2018-07-05 16:09:20.922523	2018-07-05 16:09:20.922523	"2018-07-05T18:09:20+02:00"=>"1749"	1749
8153	8201	3	https://www.ldlc.com/fiche/PB00244049.html	2018-07-05 16:09:21.467764	2018-07-05 16:09:21.467764	"2018-07-05T18:09:21+02:00"=>"1469"	1469
8154	8202	3	https://www.ldlc.com/fiche/PB00252646.html	2018-07-05 16:09:21.943659	2018-07-05 16:09:21.943659	"2018-07-05T18:09:21+02:00"=>"1749"	1749
8155	8203	3	https://www.ldlc.com/fiche/PB00243789.html	2018-07-05 16:09:22.494243	2018-07-05 16:09:22.494243	"2018-07-05T18:09:22+02:00"=>"1799"	1799
8156	8204	3	https://www.ldlc.com/fiche/PB00236526.html	2018-07-05 16:09:23.002474	2018-07-05 16:09:23.002474	"2018-07-05T18:09:23+02:00"=>"1999"	1999
8157	8205	3	https://www.ldlc.com/fiche/PB00236244.html	2018-07-05 16:09:23.562529	2018-07-05 16:09:23.562529	"2018-07-05T18:09:23+02:00"=>"1239"	1239
8158	8206	3	https://www.ldlc.com/fiche/PB00227780.html	2018-07-05 16:09:24.080483	2018-07-05 16:09:24.080483	"2018-07-05T18:09:24+02:00"=>"729"	729
8159	8207	3	https://www.ldlc.com/fiche/PB00218456.html	2018-07-05 16:09:24.638802	2018-07-05 16:09:24.638802	"2018-07-05T18:09:24+02:00"=>"1299"	1299
8160	8208	3	https://www.ldlc.com/fiche/PB00242120.html	2018-07-05 16:09:25.142882	2018-07-05 16:09:25.142882	"2018-07-05T18:09:25+02:00"=>"969"	969
8161	8209	3	https://www.ldlc.com/fiche/PB00244051.html	2018-07-05 16:09:25.672301	2018-07-05 16:09:25.672301	"2018-07-05T18:09:25+02:00"=>"1149"	1149
8162	8210	3	https://www.ldlc.com/fiche/PB00247351.html	2018-07-05 16:09:26.17748	2018-07-05 16:09:26.17748	"2018-07-05T18:09:26+02:00"=>"1099"	1099
8163	8211	3	https://www.ldlc.com/fiche/PB00241272.html	2018-07-05 16:09:26.717132	2018-07-05 16:09:26.717132	"2018-07-05T18:09:26+02:00"=>"1049"	1049
8164	8212	3	https://www.ldlc.com/fiche/PB00247381.html	2018-07-05 16:09:27.232317	2018-07-05 16:09:27.232317	"2018-07-05T18:09:27+02:00"=>"899"	899
8165	8213	3	https://www.ldlc.com/fiche/PB00236668.html	2018-07-05 16:09:27.730574	2018-07-05 16:09:27.730574	"2018-07-05T18:09:27+02:00"=>"1199"	1199
8166	8214	3	https://www.ldlc.com/fiche/PB00233194.html	2018-07-05 16:09:28.284043	2018-07-05 16:09:28.284043	"2018-07-05T18:09:28+02:00"=>"1199"	1199
8167	8215	3	https://www.ldlc.com/fiche/PB00242605.html	2018-07-05 16:09:28.814559	2018-07-05 16:09:28.814559	"2018-07-05T18:09:28+02:00"=>"1149"	1149
8168	8216	3	https://www.ldlc.com/fiche/PB00242413.html	2018-07-05 16:09:29.314498	2018-07-05 16:09:29.314498	"2018-07-05T18:09:29+02:00"=>"1568"	1568
8169	8217	3	https://www.ldlc.com/fiche/PB00219570.html	2018-07-05 16:09:29.866635	2018-07-05 16:09:29.866635	"2018-07-05T18:09:29+02:00"=>"799"	799
8170	8218	3	https://www.ldlc.com/fiche/PB00249454.html	2018-07-05 16:09:30.358284	2018-07-05 16:09:30.358284	"2018-07-05T18:09:30+02:00"=>"2299"	2299
8171	8219	3	https://www.ldlc.com/fiche/PB00242321.html	2018-07-05 16:09:30.856688	2018-07-05 16:09:30.856688	"2018-07-05T18:09:30+02:00"=>"1049"	1049
8172	8220	3	https://www.ldlc.com/fiche/PB00252171.html	2018-07-05 16:09:32.413242	2018-07-05 16:09:32.413242	"2018-07-05T18:09:32+02:00"=>"2999"	2999
8173	8221	3	https://www.ldlc.com/fiche/PB00242860.html	2018-07-05 16:09:32.917705	2018-07-05 16:09:32.917705	"2018-07-05T18:09:32+02:00"=>"1299"	1299
8174	8222	3	https://www.ldlc.com/fiche/PB00252990.html	2018-07-05 16:09:34.404116	2018-07-05 16:09:34.404116	"2018-07-05T18:09:34+02:00"=>"898"	898
8175	8223	3	https://www.ldlc.com/fiche/PB00246964.html	2018-07-05 16:09:34.917688	2018-07-05 16:09:34.917688	"2018-07-05T18:09:34+02:00"=>"1799"	1799
8176	8224	3	https://www.ldlc.com/fiche/PB00250733.html	2018-07-05 16:09:35.489612	2018-07-05 16:09:35.489612	"2018-07-05T18:09:35+02:00"=>"1799"	1799
8177	8225	3	https://www.ldlc.com/fiche/PB00250735.html	2018-07-05 16:09:35.985343	2018-07-05 16:09:35.985343	"2018-07-05T18:09:35+02:00"=>"1799"	1799
8178	8226	3	https://www.ldlc.com/fiche/PB00248868.html	2018-07-05 16:09:36.51457	2018-07-05 16:09:36.51457	"2018-07-05T18:09:36+02:00"=>"2699"	2699
8179	8227	3	https://www.ldlc.com/fiche/PB00235019.html	2018-07-05 16:09:37.059967	2018-07-05 16:09:37.059967	"2018-07-05T18:09:37+02:00"=>"1999"	1999
8180	8228	3	https://www.ldlc.com/fiche/PB00235144.html	2018-07-05 16:09:37.858691	2018-07-05 16:09:37.858691	"2018-07-05T18:09:37+02:00"=>"1199"	1199
8181	8229	3	https://www.ldlc.com/fiche/PB00248874.html	2018-07-05 16:09:38.383835	2018-07-05 16:09:38.383835	"2018-07-05T18:09:38+02:00"=>"1099"	1099
8182	8230	3	https://www.ldlc.com/fiche/PB00251835.html	2018-07-05 16:09:39.164751	2018-07-05 16:09:39.164751	"2018-07-05T18:09:39+02:00"=>"1379"	1379
8183	8231	3	https://www.ldlc.com/fiche/PB00251827.html	2018-07-05 16:09:39.692848	2018-07-05 16:09:39.692848	"2018-07-05T18:09:39+02:00"=>"1349"	1349
8184	8232	3	https://www.ldlc.com/fiche/PB00240117.html	2018-07-05 16:09:40.191974	2018-07-05 16:09:40.191974	"2018-07-05T18:09:40+02:00"=>"1349"	1349
8185	8233	3	https://www.ldlc.com/fiche/PB00252059.html	2018-07-05 16:09:40.706963	2018-07-05 16:09:40.706963	"2018-07-05T18:09:40+02:00"=>"1399"	1399
8186	8234	3	https://www.ldlc.com/fiche/PB00240134.html	2018-07-05 16:09:41.229932	2018-07-05 16:09:41.229932	"2018-07-05T18:09:41+02:00"=>"1179"	1179
8187	8235	3	https://www.ldlc.com/fiche/PB00252064.html	2018-07-05 16:09:41.765635	2018-07-05 16:09:41.765635	"2018-07-05T18:09:41+02:00"=>"1649"	1649
8188	8236	3	https://www.ldlc.com/fiche/PB00251990.html	2018-07-05 16:09:42.278644	2018-07-05 16:09:42.278644	"2018-07-05T18:09:42+02:00"=>"1099"	1099
8189	8237	3	https://www.ldlc.com/fiche/PB00250285.html	2018-07-05 16:09:42.806796	2018-07-05 16:09:42.806796	"2018-07-05T18:09:42+02:00"=>"1399"	1399
8190	8238	3	https://www.ldlc.com/fiche/PB00250287.html	2018-07-05 16:09:43.334041	2018-07-05 16:09:43.334041	"2018-07-05T18:09:43+02:00"=>"1349"	1349
8191	8239	3	https://www.ldlc.com/fiche/PB00252705.html	2018-07-05 16:09:43.860329	2018-07-05 16:09:43.860329	"2018-07-05T18:09:43+02:00"=>"1399"	1399
8192	8240	3	https://www.ldlc.com/fiche/PB00252708.html	2018-07-05 16:09:44.383502	2018-07-05 16:09:44.383502	"2018-07-05T18:09:44+02:00"=>"1649"	1649
8193	8241	3	https://www.ldlc.com/fiche/PB00247185.html	2018-07-05 16:09:44.897224	2018-07-05 16:09:44.897224	"2018-07-05T18:09:44+02:00"=>"2299"	2299
8194	8242	3	https://www.ldlc.com/fiche/PB00226995.html	2018-07-05 16:09:45.417267	2018-07-05 16:09:45.417267	"2018-07-05T18:09:45+02:00"=>"2199"	2199
8195	8243	3	https://www.ldlc.com/fiche/PB00240059.html	2018-07-05 16:09:45.918923	2018-07-05 16:09:45.918923	"2018-07-05T18:09:45+02:00"=>"1299"	1299
8196	8244	3	https://www.ldlc.com/fiche/PB00223516.html	2018-07-05 16:09:46.414478	2018-07-05 16:09:46.414478	"2018-07-05T18:09:46+02:00"=>"379"	379
8197	8245	3	https://www.ldlc.com/fiche/PB00231298.html	2018-07-05 16:09:46.924763	2018-07-05 16:09:46.924763	"2018-07-05T18:09:46+02:00"=>"539"	539
8198	8246	3	https://www.ldlc.com/fiche/PB00228254.html	2018-07-05 16:09:47.439892	2018-07-05 16:09:47.439892	"2018-07-05T18:09:47+02:00"=>"499"	499
8199	8247	3	https://www.ldlc.com/fiche/PB00248226.html	2018-07-05 16:09:47.978155	2018-07-05 16:09:47.978155	"2018-07-05T18:09:47+02:00"=>"429"	429
8200	8248	3	https://www.ldlc.com/fiche/PB00252876.html	2018-07-05 16:09:48.44637	2018-07-05 16:09:48.44637	"2018-07-05T18:09:48+02:00"=>"529"	529
8201	8249	3	https://www.ldlc.com/fiche/PB00226961.html	2018-07-05 16:09:48.951863	2018-07-05 16:09:48.951863	"2018-07-05T18:09:48+02:00"=>"1199"	1199
8202	8250	3	https://www.ldlc.com/fiche/PB00245867.html	2018-07-05 16:09:49.453362	2018-07-05 16:09:49.453362	"2018-07-05T18:09:49+02:00"=>"2199"	2199
8203	8251	3	https://www.ldlc.com/fiche/PB00243980.html	2018-07-05 16:09:49.961353	2018-07-05 16:09:49.961353	"2018-07-05T18:09:49+02:00"=>"1999"	1999
8204	8252	3	https://www.ldlc.com/fiche/PB00239319.html	2018-07-05 16:09:50.461924	2018-07-05 16:09:50.461924	"2018-07-05T18:09:50+02:00"=>"1642"	1642
8205	8253	3	https://www.ldlc.com/fiche/PB00248326.html	2018-07-05 16:09:51.038158	2018-07-05 16:09:51.038158	"2018-07-05T18:09:51+02:00"=>"2299"	2299
8206	8254	3	https://www.ldlc.com/fiche/PB00248262.html	2018-07-05 16:09:51.547725	2018-07-05 16:09:51.547725	"2018-07-05T18:09:51+02:00"=>"1349"	1349
8207	8255	3	https://www.ldlc.com/fiche/PB00248313.html	2018-07-05 16:09:52.085767	2018-07-05 16:09:52.085767	"2018-07-05T18:09:52+02:00"=>"1549"	1549
8208	8256	3	https://www.ldlc.com/fiche/PB00248361.html	2018-07-05 16:09:52.609156	2018-07-05 16:09:52.609156	"2018-07-05T18:09:52+02:00"=>"1599"	1599
8209	8257	3	https://www.ldlc.com/fiche/PB00249305.html	2018-07-05 16:09:53.099508	2018-07-05 16:09:53.099508	"2018-07-05T18:09:53+02:00"=>"1699"	1699
8210	8258	3	https://www.ldlc.com/fiche/PB00249788.html	2018-07-05 16:09:53.62271	2018-07-05 16:09:53.62271	"2018-07-05T18:09:53+02:00"=>"2469"	2469
8211	8259	3	https://www.ldlc.com/fiche/PB00241163.html	2018-07-05 16:09:54.126019	2018-07-05 16:09:54.126019	"2018-07-05T18:09:54+02:00"=>"1399"	1399
8212	8260	3	https://www.ldlc.com/fiche/PB00248368.html	2018-07-05 16:09:54.644291	2018-07-05 16:09:54.644291	"2018-07-05T18:09:54+02:00"=>"2799"	2799
8213	8261	3	https://www.ldlc.com/fiche/PB00226971.html	2018-07-05 16:09:55.216232	2018-07-05 16:09:55.216232	"2018-07-05T18:09:55+02:00"=>"1699"	1699
8214	8262	3	https://www.ldlc.com/fiche/PB00239715.html	2018-07-05 16:09:55.751252	2018-07-05 16:09:55.751252	"2018-07-05T18:09:55+02:00"=>"1999"	1999
8215	8263	3	https://www.ldlc.com/fiche/PB00249412.html	2018-07-05 16:09:56.336039	2018-07-05 16:09:56.336039	"2018-07-05T18:09:56+02:00"=>"1799"	1799
8216	8264	3	https://www.ldlc.com/fiche/PB00249161.html	2018-07-05 16:09:57.02059	2018-07-05 16:09:57.02059	"2018-07-05T18:09:57+02:00"=>"1899"	1899
8217	8265	3	https://www.ldlc.com/fiche/PB00223451.html	2018-07-05 16:09:57.671364	2018-07-05 16:09:57.671364	"2018-07-05T18:09:57+02:00"=>"799"	799
8218	7781	3	https://www.ldlc.com/fiche/PB00252786.html	2018-07-05 16:09:58.190094	2018-07-05 16:09:58.190094	"2018-07-05T18:09:58+02:00"=>"3599"	3599
8219	8266	3	https://www.ldlc.com/fiche/PB00239904.html	2018-07-05 16:09:58.759473	2018-07-05 16:09:58.759473	"2018-07-05T18:09:58+02:00"=>"849"	849
8220	8267	3	https://www.ldlc.com/fiche/PB00248143.html	2018-07-05 16:09:59.476674	2018-07-05 16:09:59.476674	"2018-07-05T18:09:59+02:00"=>"849"	849
8221	8268	3	https://www.ldlc.com/fiche/PB00248127.html	2018-07-05 16:10:00.001894	2018-07-05 16:10:00.001894	"2018-07-05T18:09:59+02:00"=>"1069"	1069
8222	8269	3	https://www.ldlc.com/fiche/PB00239625.html	2018-07-05 16:10:00.529417	2018-07-05 16:10:00.529417	"2018-07-05T18:10:00+02:00"=>"1299"	1299
8223	8270	3	https://www.ldlc.com/fiche/PB00248145.html	2018-07-05 16:10:01.058668	2018-07-05 16:10:01.058668	"2018-07-05T18:10:01+02:00"=>"749"	749
8224	8271	3	https://www.ldlc.com/fiche/PB00239457.html	2018-07-05 16:10:01.59866	2018-07-05 16:10:01.59866	"2018-07-05T18:10:01+02:00"=>"899"	899
8225	8272	3	https://www.ldlc.com/fiche/PB00239415.html	2018-07-05 16:10:02.099826	2018-07-05 16:10:02.099826	"2018-07-05T18:10:02+02:00"=>"1129"	1129
8226	8273	3	https://www.ldlc.com/fiche/PB00239446.html	2018-07-05 16:10:02.659731	2018-07-05 16:10:02.659731	"2018-07-05T18:10:02+02:00"=>"769"	769
8227	8274	3	https://www.ldlc.com/fiche/PB00249199.html	2018-07-05 16:10:03.19358	2018-07-05 16:10:03.19358	"2018-07-05T18:10:03+02:00"=>"999"	999
8228	8275	3	https://www.ldlc.com/fiche/PB00249205.html	2018-07-05 16:10:03.953517	2018-07-05 16:10:03.953517	"2018-07-05T18:10:03+02:00"=>"979"	979
8229	8276	3	https://www.ldlc.com/fiche/PB00240384.html	2018-07-05 16:10:04.565944	2018-07-05 16:10:04.565944	"2018-07-05T18:10:04+02:00"=>"999"	999
8230	8277	3	https://www.ldlc.com/fiche/PB00248258.html	2018-07-05 16:10:05.094511	2018-07-05 16:10:05.094511	"2018-07-05T18:10:05+02:00"=>"849"	849
8231	8278	3	https://www.ldlc.com/fiche/PB00249145.html	2018-07-05 16:10:05.654842	2018-07-05 16:10:05.654842	"2018-07-05T18:10:05+02:00"=>"749"	749
8232	8279	3	https://www.ldlc.com/fiche/PB00247437.html	2018-07-05 16:10:07.166155	2018-07-05 16:10:07.166155	"2018-07-05T18:10:07+02:00"=>"739"	739
8233	8280	3	https://www.ldlc.com/fiche/PB00245649.html	2018-07-05 16:10:07.689175	2018-07-05 16:10:07.689175	"2018-07-05T18:10:07+02:00"=>"929"	929
8234	8281	3	https://www.ldlc.com/fiche/PB00253182.html	2018-07-05 16:10:08.215036	2018-07-05 16:10:08.215036	"2018-07-05T18:10:08+02:00"=>"769"	769
8235	8282	3	https://www.ldlc.com/fiche/PB00218002.html	2018-07-05 16:10:08.832655	2018-07-05 16:10:08.832655	"2018-07-05T18:10:08+02:00"=>"649"	649
8236	8283	3	https://www.ldlc.com/fiche/PB00217303.html	2018-07-05 16:10:09.363731	2018-07-05 16:10:09.363731	"2018-07-05T18:10:09+02:00"=>"999"	999
8237	8284	3	https://www.ldlc.com/fiche/PB00253114.html	2018-07-05 16:10:09.856361	2018-07-05 16:10:09.856361	"2018-07-05T18:10:09+02:00"=>"999"	999
8238	8285	3	https://www.ldlc.com/fiche/PB00239697.html	2018-07-05 16:10:10.40044	2018-07-05 16:10:10.40044	"2018-07-05T18:10:10+02:00"=>"749"	749
8239	8286	3	https://www.ldlc.com/fiche/PB00238494.html	2018-07-05 16:10:10.956754	2018-07-05 16:10:10.956754	"2018-07-05T18:10:10+02:00"=>"949"	949
8240	8287	3	https://www.ldlc.com/fiche/PB00238492.html	2018-07-05 16:10:11.468079	2018-07-05 16:10:11.468079	"2018-07-05T18:10:11+02:00"=>"1099"	1099
8241	8288	3	https://www.ldlc.com/fiche/PB00210059.html	2018-07-05 16:10:11.992916	2018-07-05 16:10:11.992916	"2018-07-05T18:10:11+02:00"=>"1349"	1349
8242	8289	3	https://www.ldlc.com/fiche/PB00231036.html	2018-07-05 16:10:12.494548	2018-07-05 16:10:12.494548	"2018-07-05T18:10:12+02:00"=>"489"	489
8243	8290	3	https://www.ldlc.com/fiche/PB00239392.html	2018-07-05 16:10:13.018739	2018-07-05 16:10:13.018739	"2018-07-05T18:10:13+02:00"=>"2379"	2379
8244	8291	3	https://www.ldlc.com/fiche/PB00247013.html	2018-07-05 16:10:13.528553	2018-07-05 16:10:13.528553	"2018-07-05T18:10:13+02:00"=>"2499"	2499
8245	8292	3	https://www.ldlc.com/fiche/PB00245653.html	2018-07-05 16:10:14.045063	2018-07-05 16:10:14.045063	"2018-07-05T18:10:14+02:00"=>"2099"	2099
8246	8293	3	https://www.ldlc.com/fiche/PB00246367.html	2018-07-05 16:10:14.545728	2018-07-05 16:10:14.545728	"2018-07-05T18:10:14+02:00"=>"2788"	2788
8247	8294	3	https://www.ldlc.com/fiche/PB00239402.html	2018-07-05 16:10:15.078129	2018-07-05 16:10:15.078129	"2018-07-05T18:10:15+02:00"=>"3599"	3599
8248	8295	3	https://www.ldlc.com/fiche/PB00245745.html	2018-07-05 16:10:15.60121	2018-07-05 16:10:15.60121	"2018-07-05T18:10:15+02:00"=>"2699"	2699
8249	8296	3	https://www.ldlc.com/fiche/PB00253111.html	2018-07-05 16:10:16.105519	2018-07-05 16:10:16.105519	"2018-07-05T18:10:16+02:00"=>"2448"	2448
8250	8297	3	https://www.ldlc.com/fiche/PB00253107.html	2018-07-05 16:10:16.611127	2018-07-05 16:10:16.611127	"2018-07-05T18:10:16+02:00"=>"2999"	2999
8251	8298	3	https://www.ldlc.com/fiche/PB00248163.html	2018-07-05 16:10:17.111187	2018-07-05 16:10:17.111187	"2018-07-05T18:10:17+02:00"=>"3199"	3199
8252	8299	3	https://www.ldlc.com/fiche/PB00248195.html	2018-07-05 16:10:17.628268	2018-07-05 16:10:17.628268	"2018-07-05T18:10:17+02:00"=>"3499"	3499
8253	8300	3	https://www.ldlc.com/fiche/PB00249716.html	2018-07-05 16:10:18.127468	2018-07-05 16:10:18.127468	"2018-07-05T18:10:18+02:00"=>"1798"	1798
8254	8301	3	https://www.ldlc.com/fiche/PB00248342.html	2018-07-05 16:10:18.829161	2018-07-05 16:10:18.829161	"2018-07-05T18:10:18+02:00"=>"1999"	1999
8255	8302	3	https://www.ldlc.com/fiche/PB00231456.html	2018-07-05 16:10:19.349887	2018-07-05 16:10:19.349887	"2018-07-05T18:10:19+02:00"=>"725"	725
8256	8303	3	https://www.ldlc.com/fiche/PB00234164.html	2018-07-05 16:10:19.903317	2018-07-05 16:10:19.903317	"2018-07-05T18:10:19+02:00"=>"649"	649
8257	8304	3	https://www.ldlc.com/fiche/PB00237581.html	2018-07-05 16:10:20.437351	2018-07-05 16:10:20.437351	"2018-07-05T18:10:20+02:00"=>"629"	629
8258	8305	3	https://www.ldlc.com/fiche/PB00237679.html	2018-07-05 16:10:21.001559	2018-07-05 16:10:21.001559	"2018-07-05T18:10:20+02:00"=>"439"	439
8259	8306	3	https://www.ldlc.com/fiche/PB00233919.html	2018-07-05 16:10:21.831231	2018-07-05 16:10:21.831231	"2018-07-05T18:10:21+02:00"=>"359"	359
8260	8307	3	https://www.ldlc.com/fiche/PB00237778.html	2018-07-05 16:10:22.343404	2018-07-05 16:10:22.343404	"2018-07-05T18:10:22+02:00"=>"649"	649
8261	8308	3	https://www.ldlc.com/fiche/PB00246993.html	2018-07-05 16:10:22.857046	2018-07-05 16:10:22.857046	"2018-07-05T18:10:22+02:00"=>"699"	699
8262	8309	3	https://www.ldlc.com/fiche/PB00247003.html	2018-07-05 16:10:23.692106	2018-07-05 16:10:23.692106	"2018-07-05T18:10:23+02:00"=>"799"	799
8263	8310	3	https://www.ldlc.com/fiche/PB00241931.html	2018-07-05 16:10:24.248843	2018-07-05 16:10:24.248843	"2018-07-05T18:10:24+02:00"=>"599"	599
8264	8311	3	https://www.ldlc.com/fiche/PB00241954.html	2018-07-05 16:10:24.736028	2018-07-05 16:10:24.736028	"2018-07-05T18:10:24+02:00"=>"599"	599
8265	8312	3	https://www.ldlc.com/fiche/PB00247024.html	2018-07-05 16:10:26.279144	2018-07-05 16:10:26.279144	"2018-07-05T18:10:26+02:00"=>"799"	799
8266	8313	3	https://www.ldlc.com/fiche/PB00247023.html	2018-07-05 16:10:26.831084	2018-07-05 16:10:26.831084	"2018-07-05T18:10:26+02:00"=>"649"	649
8267	8314	3	https://www.ldlc.com/fiche/PB00247007.html	2018-07-05 16:10:27.393256	2018-07-05 16:10:27.393256	"2018-07-05T18:10:27+02:00"=>"549"	549
8268	8315	3	https://www.ldlc.com/fiche/PB00241929.html	2018-07-05 16:10:27.894204	2018-07-05 16:10:27.894204	"2018-07-05T18:10:27+02:00"=>"719"	719
8269	8316	3	https://www.ldlc.com/fiche/PB00246939.html	2018-07-05 16:10:28.452316	2018-07-05 16:10:28.452316	"2018-07-05T18:10:28+02:00"=>"699"	699
8270	8317	3	https://www.ldlc.com/fiche/PB00246897.html	2018-07-05 16:10:29.049698	2018-07-05 16:10:29.049698	"2018-07-05T18:10:29+02:00"=>"499"	499
8271	8318	3	https://www.ldlc.com/fiche/PB00246951.html	2018-07-05 16:10:29.596106	2018-07-05 16:10:29.596106	"2018-07-05T18:10:29+02:00"=>"799"	799
8272	8319	3	https://www.ldlc.com/fiche/PB00250437.html	2018-07-05 16:10:30.099439	2018-07-05 16:10:30.099439	"2018-07-05T18:10:30+02:00"=>"949"	949
8273	8320	3	https://www.ldlc.com/fiche/PB00246958.html	2018-07-05 16:10:30.597087	2018-07-05 16:10:30.597087	"2018-07-05T18:10:30+02:00"=>"799"	799
8274	8321	3	https://www.ldlc.com/fiche/PB00247060.html	2018-07-05 16:10:31.112974	2018-07-05 16:10:31.112974	"2018-07-05T18:10:31+02:00"=>"699"	699
8275	8322	3	https://www.ldlc.com/fiche/PB00247069.html	2018-07-05 16:10:31.635744	2018-07-05 16:10:31.635744	"2018-07-05T18:10:31+02:00"=>"899"	899
8276	8323	3	https://www.ldlc.com/fiche/PB00249388.html	2018-07-05 16:10:32.418949	2018-07-05 16:10:32.418949	"2018-07-05T18:10:32+02:00"=>"999"	999
8277	8324	3	https://www.ldlc.com/fiche/PB00251122.html	2018-07-05 16:10:32.914316	2018-07-05 16:10:32.914316	"2018-07-05T18:10:32+02:00"=>"899"	899
8278	8325	3	https://www.ldlc.com/fiche/PB00247080.html	2018-07-05 16:10:33.47206	2018-07-05 16:10:33.47206	"2018-07-05T18:10:33+02:00"=>"1249"	1249
8279	8326	3	https://www.ldlc.com/fiche/PB00232565.html	2018-07-05 16:10:33.983417	2018-07-05 16:10:33.983417	"2018-07-05T18:10:33+02:00"=>"799"	799
8280	8327	3	https://www.ldlc.com/fiche/PB00241994.html	2018-07-05 16:10:34.487312	2018-07-05 16:10:34.487312	"2018-07-05T18:10:34+02:00"=>"1049"	1049
8281	8328	3	https://www.ldlc.com/fiche/PB00245202.html	2018-07-05 16:10:35.964103	2018-07-05 16:10:35.964103	"2018-07-05T18:10:35+02:00"=>"1099"	1099
8282	8329	3	https://www.ldlc.com/fiche/PB00247087.html	2018-07-05 16:10:36.501488	2018-07-05 16:10:36.501488	"2018-07-05T18:10:36+02:00"=>"1539"	1539
8283	8330	3	https://www.ldlc.com/fiche/PB00241997.html	2018-07-05 16:10:37.009	2018-07-05 16:10:37.009	"2018-07-05T18:10:37+02:00"=>"1199"	1199
8284	8331	3	https://www.ldlc.com/fiche/PB00235710.html	2018-07-05 16:10:37.513319	2018-07-05 16:10:37.513319	"2018-07-05T18:10:37+02:00"=>"2399"	2399
8285	8332	3	https://www.ldlc.com/fiche/PB00239212.html	2018-07-05 16:10:38.029995	2018-07-05 16:10:38.029995	"2018-07-05T18:10:38+02:00"=>"2549"	2549
8286	8333	3	https://www.ldlc.com/fiche/PB00226025.html	2018-07-05 16:10:38.525194	2018-07-05 16:10:38.525194	"2018-07-05T18:10:38+02:00"=>"549"	549
8287	8334	3	https://www.ldlc.com/fiche/PB00249787.html	2018-07-05 16:10:39.054793	2018-07-05 16:10:39.054793	"2018-07-05T18:10:39+02:00"=>"299"	299
8288	8335	3	https://www.ldlc.com/fiche/PB00227388.html	2018-07-05 16:10:39.546263	2018-07-05 16:10:39.546263	"2018-07-05T18:10:39+02:00"=>"369"	369
8289	8336	3	https://www.ldlc.com/fiche/PB00225275.html	2018-07-05 16:10:40.04044	2018-07-05 16:10:40.04044	"2018-07-05T18:10:40+02:00"=>"799"	799
8290	8337	3	https://www.ldlc.com/fiche/PB00249720.html	2018-07-05 16:10:40.566947	2018-07-05 16:10:40.566947	"2018-07-05T18:10:40+02:00"=>"939"	939
8291	8338	3	https://www.ldlc.com/fiche/PB00234332.html	2018-07-05 16:10:41.072868	2018-07-05 16:10:41.072868	"2018-07-05T18:10:41+02:00"=>"615"	615
8292	8339	3	https://www.ldlc.com/fiche/PB00237507.html	2018-07-05 16:10:41.605891	2018-07-05 16:10:41.605891	"2018-07-05T18:10:41+02:00"=>"819"	819
8293	8340	3	https://www.ldlc.com/fiche/PB00251274.html	2018-07-05 16:10:42.105205	2018-07-05 16:10:42.105205	"2018-07-05T18:10:42+02:00"=>"839"	839
8294	8341	3	https://www.ldlc.com/fiche/PB00226416.html	2018-07-05 16:10:42.574977	2018-07-05 16:10:42.574977	"2018-07-05T18:10:42+02:00"=>"729"	729
8295	8342	3	https://www.ldlc.com/fiche/PB00230739.html	2018-07-05 16:10:43.096583	2018-07-05 16:10:43.096583	"2018-07-05T18:10:43+02:00"=>"619"	619
8296	8343	3	https://www.ldlc.com/fiche/PB00237187.html	2018-07-05 16:10:43.612949	2018-07-05 16:10:43.612949	"2018-07-05T18:10:43+02:00"=>"879"	879
8297	8344	3	https://www.ldlc.com/fiche/PB00249809.html	2018-07-05 16:10:44.12473	2018-07-05 16:10:44.12473	"2018-07-05T18:10:44+02:00"=>"899"	899
8298	8345	3	https://www.ldlc.com/fiche/PB00251345.html	2018-07-05 16:10:44.600501	2018-07-05 16:10:44.600501	"2018-07-05T18:10:44+02:00"=>"1049"	1049
8299	8346	3	https://www.ldlc.com/fiche/PB00250520.html	2018-07-05 16:10:45.158462	2018-07-05 16:10:45.158462	"2018-07-05T18:10:45+02:00"=>"1299"	1299
8300	8347	3	https://www.ldlc.com/fiche/PB00247991.html	2018-07-05 16:10:45.673338	2018-07-05 16:10:45.673338	"2018-07-05T18:10:45+02:00"=>"1369"	1369
8301	8348	3	https://www.ldlc.com/fiche/PB00250462.html	2018-07-05 16:10:46.242611	2018-07-05 16:10:46.242611	"2018-07-05T18:10:46+02:00"=>"999"	999
8302	8349	3	https://www.ldlc.com/fiche/PB00250516.html	2018-07-05 16:10:46.742443	2018-07-05 16:10:46.742443	"2018-07-05T18:10:46+02:00"=>"1799"	1799
8303	8350	3	https://www.ldlc.com/fiche/PB00250512.html	2018-07-05 16:10:47.263606	2018-07-05 16:10:47.263606	"2018-07-05T18:10:47+02:00"=>"1789"	1789
8304	8351	3	https://www.ldlc.com/fiche/PB00250528.html	2018-07-05 16:10:47.758752	2018-07-05 16:10:47.758752	"2018-07-05T18:10:47+02:00"=>"1998"	1998
8305	8352	3	https://www.ldlc.com/fiche/PB00229972.html	2018-07-05 16:10:48.269011	2018-07-05 16:10:48.269011	"2018-07-05T18:10:48+02:00"=>"1479"	1479
8306	8353	3	https://www.ldlc.com/fiche/PB00249751.html	2018-07-05 16:10:48.771518	2018-07-05 16:10:48.771518	"2018-07-05T18:10:48+02:00"=>"1179"	1179
8307	8354	3	https://www.ldlc.com/fiche/PB00229983.html	2018-07-05 16:10:49.303162	2018-07-05 16:10:49.303162	"2018-07-05T18:10:49+02:00"=>"1549"	1549
8308	8355	3	https://www.ldlc.com/fiche/PB00230235.html	2018-07-05 16:10:49.83711	2018-07-05 16:10:49.83711	"2018-07-05T18:10:49+02:00"=>"1239"	1239
8309	8356	3	https://www.ldlc.com/fiche/PB00249755.html	2018-07-05 16:10:50.356646	2018-07-05 16:10:50.356646	"2018-07-05T18:10:50+02:00"=>"1679"	1679
8310	8357	3	https://www.ldlc.com/fiche/PB00234214.html	2018-07-05 16:10:50.881967	2018-07-05 16:10:50.881967	"2018-07-05T18:10:50+02:00"=>"1679"	1679
8311	8358	3	https://www.ldlc.com/fiche/PB00233789.html	2018-07-05 16:10:51.462039	2018-07-05 16:10:51.462039	"2018-07-05T18:10:51+02:00"=>"1999"	1999
8312	8359	3	https://www.ldlc.com/fiche/PB00237533.html	2018-07-05 16:10:51.967303	2018-07-05 16:10:51.967303	"2018-07-05T18:10:51+02:00"=>"1899"	1899
8313	8360	3	https://www.ldlc.com/fiche/PB00241991.html	2018-07-05 16:10:52.475517	2018-07-05 16:10:52.475517	"2018-07-05T18:10:52+02:00"=>"1979"	1979
8314	8361	3	https://www.ldlc.com/fiche/PB00249768.html	2018-07-05 16:10:52.979489	2018-07-05 16:10:52.979489	"2018-07-05T18:10:52+02:00"=>"1959"	1959
8315	8362	3	https://www.ldlc.com/fiche/PB00235342.html	2018-07-05 16:10:53.48815	2018-07-05 16:10:53.48815	"2018-07-05T18:10:53+02:00"=>"1199"	1199
8316	8363	3	https://www.ldlc.com/fiche/PB00249775.html	2018-07-05 16:10:53.989066	2018-07-05 16:10:53.989066	"2018-07-05T18:10:53+02:00"=>"1619"	1619
8317	8364	3	https://www.ldlc.com/fiche/PB00230661.html	2018-07-05 16:10:54.522544	2018-07-05 16:10:54.522544	"2018-07-05T18:10:54+02:00"=>"1599"	1599
8318	8365	3	https://www.ldlc.com/fiche/PB00230703.html	2018-07-05 16:10:55.050603	2018-07-05 16:10:55.050603	"2018-07-05T18:10:55+02:00"=>"1199"	1199
8319	8366	3	https://www.ldlc.com/fiche/PB00230702.html	2018-07-05 16:10:55.59254	2018-07-05 16:10:55.59254	"2018-07-05T18:10:55+02:00"=>"1399"	1399
8320	8367	3	https://www.ldlc.com/fiche/PB00226366.html	2018-07-05 16:10:56.237223	2018-07-05 16:10:56.237223	"2018-07-05T18:10:56+02:00"=>"299"	299
8321	8368	3	https://www.ldlc.com/fiche/PB00229352.html	2018-07-05 16:10:56.745931	2018-07-05 16:10:56.745931	"2018-07-05T18:10:56+02:00"=>"439"	439
8322	8369	3	https://www.ldlc.com/fiche/PB00226342.html	2018-07-05 16:10:57.300264	2018-07-05 16:10:57.300264	"2018-07-05T18:10:57+02:00"=>"399"	399
8323	8370	3	https://www.ldlc.com/fiche/PB00234160.html	2018-07-05 16:10:57.811889	2018-07-05 16:10:57.811889	"2018-07-05T18:10:57+02:00"=>"479"	479
8324	8371	3	https://www.ldlc.com/fiche/PB00249420.html	2018-07-05 16:10:58.595306	2018-07-05 16:10:58.595306	"2018-07-05T18:10:58+02:00"=>"469"	469
8325	8372	3	https://www.ldlc.com/fiche/PB00249855.html	2018-07-05 16:10:59.103234	2018-07-05 16:10:59.103234	"2018-07-05T18:10:59+02:00"=>"635"	635
8326	8373	3	https://www.ldlc.com/fiche/PB00249807.html	2018-07-05 16:11:00.626569	2018-07-05 16:11:00.626569	"2018-07-05T18:11:00+02:00"=>"539"	539
8327	8374	3	https://www.ldlc.com/fiche/PB00252984.html	2018-07-05 16:11:01.140701	2018-07-05 16:11:01.140701	"2018-07-05T18:11:01+02:00"=>"878"	878
8328	8375	3	https://www.ldlc.com/fiche/PB00249694.html	2018-07-05 16:11:01.678292	2018-07-05 16:11:01.678292	"2018-07-05T18:11:01+02:00"=>"699"	699
8329	8376	3	https://www.ldlc.com/fiche/PB00249801.html	2018-07-05 16:11:02.200187	2018-07-05 16:11:02.200187	"2018-07-05T18:11:02+02:00"=>"998"	998
8330	8377	3	https://www.ldlc.com/fiche/PB00249697.html	2018-07-05 16:11:02.743094	2018-07-05 16:11:02.743094	"2018-07-05T18:11:02+02:00"=>"938"	938
8331	8378	3	https://www.ldlc.com/fiche/PB00252798.html	2018-07-05 16:11:04.271553	2018-07-05 16:11:04.271553	"2018-07-05T18:11:04+02:00"=>"799"	799
8332	8379	3	https://www.ldlc.com/fiche/PB00237577.html	2018-07-05 16:11:05.092982	2018-07-05 16:11:05.092982	"2018-07-05T18:11:05+02:00"=>"879"	879
8333	8380	3	https://www.ldlc.com/fiche/PB00234218.html	2018-07-05 16:11:05.664736	2018-07-05 16:11:05.664736	"2018-07-05T18:11:05+02:00"=>"749"	749
8334	8381	3	https://www.ldlc.com/fiche/PB00238119.html	2018-07-05 16:11:06.193215	2018-07-05 16:11:06.193215	"2018-07-05T18:11:06+02:00"=>"739"	739
8335	8382	3	https://www.ldlc.com/fiche/PB00252464.html	2018-07-05 16:11:06.761106	2018-07-05 16:11:06.761106	"2018-07-05T18:11:06+02:00"=>"549"	549
8336	8383	3	https://www.ldlc.com/fiche/PB00237773.html	2018-07-05 16:11:07.358608	2018-07-05 16:11:07.358608	"2018-07-05T18:11:07+02:00"=>"569"	569
8337	8384	3	https://www.ldlc.com/fiche/PB00242007.html	2018-07-05 16:11:07.849966	2018-07-05 16:11:07.849966	"2018-07-05T18:11:07+02:00"=>"599"	599
8338	8385	3	https://www.ldlc.com/fiche/PB00247094.html	2018-07-05 16:11:08.366037	2018-07-05 16:11:08.366037	"2018-07-05T18:11:08+02:00"=>"749"	749
8339	8386	3	https://www.ldlc.com/fiche/PB00249401.html	2018-07-05 16:11:08.993935	2018-07-05 16:11:08.993935	"2018-07-05T18:11:08+02:00"=>"999"	999
8340	8387	3	https://www.ldlc.com/fiche/PB00234016.html	2018-07-05 16:11:09.817784	2018-07-05 16:11:09.817784	"2018-07-05T18:11:09+02:00"=>"869"	869
8341	8388	3	https://www.ldlc.com/fiche/PB00216468.html	2018-07-05 16:11:11.296839	2018-07-05 16:11:11.296839	"2018-07-05T18:11:11+02:00"=>"499"	499
8342	8389	3	https://www.ldlc.com/fiche/PB00216460.html	2018-07-05 16:11:11.809419	2018-07-05 16:11:11.809419	"2018-07-05T18:11:11+02:00"=>"559"	559
8343	8390	3	https://www.ldlc.com/fiche/PB00230714.html	2018-07-05 16:11:12.322652	2018-07-05 16:11:12.322652	"2018-07-05T18:11:12+02:00"=>"1448"	1448
8344	8391	3	https://www.ldlc.com/fiche/PB00249368.html	2018-07-05 16:11:13.793369	2018-07-05 16:11:13.793369	"2018-07-05T18:11:13+02:00"=>"1149"	1149
8345	8392	3	https://www.ldlc.com/fiche/PB00209427.html	2018-07-05 16:11:14.364575	2018-07-05 16:11:14.364575	"2018-07-05T18:11:14+02:00"=>"2299"	2299
8346	8393	3	https://www.ldlc.com/fiche/PB00228226.html	2018-07-05 16:11:14.873518	2018-07-05 16:11:14.873518	"2018-07-05T18:11:14+02:00"=>"2549"	2549
8347	8394	3	https://www.ldlc.com/fiche/PB00245582.html	2018-07-05 16:11:16.380343	2018-07-05 16:11:16.380343	"2018-07-05T18:11:16+02:00"=>"518"	518
8348	8395	3	https://www.ldlc.com/fiche/PB00230734.html	2018-07-05 16:11:16.902177	2018-07-05 16:11:16.902177	"2018-07-05T18:11:16+02:00"=>"849"	849
8349	8396	3	https://www.ldlc.com/fiche/PB00246224.html	2018-07-05 16:11:17.440863	2018-07-05 16:11:17.440863	"2018-07-05T18:11:17+02:00"=>"3659"	3659
8350	8397	3	https://www.ldlc.com/fiche/PB00246166.html	2018-07-05 16:11:17.969718	2018-07-05 16:11:17.969718	"2018-07-05T18:11:17+02:00"=>"2799"	2799
8351	8398	3	https://www.ldlc.com/fiche/PB00246225.html	2018-07-05 16:11:18.496818	2018-07-05 16:11:18.496818	"2018-07-05T18:11:18+02:00"=>"3188"	3188
8352	8399	3	https://www.ldlc.com/fiche/PB00229368.html	2018-07-05 16:11:19.033834	2018-07-05 16:11:19.033834	"2018-07-05T18:11:19+02:00"=>"1699"	1699
8353	8400	3	https://www.ldlc.com/fiche/PB00229365.html	2018-07-05 16:11:20.529929	2018-07-05 16:11:20.529929	"2018-07-05T18:11:20+02:00"=>"899"	899
8354	8401	3	https://www.ldlc.com/fiche/PB00216297.html	2018-07-05 16:11:21.073121	2018-07-05 16:11:21.073121	"2018-07-05T18:11:21+02:00"=>"999"	999
8355	8402	3	https://www.ldlc.com/fiche/PB00232471.html	2018-07-05 16:11:21.604091	2018-07-05 16:11:21.604091	"2018-07-05T18:11:21+02:00"=>"479"	479
8356	8403	3	https://www.ldlc.com/fiche/PB00232514.html	2018-07-05 16:11:22.117899	2018-07-05 16:11:22.117899	"2018-07-05T18:11:22+02:00"=>"579"	579
8357	8404	3	https://www.ldlc.com/fiche/PB00252800.html	2018-07-05 16:11:22.691201	2018-07-05 16:11:22.691201	"2018-07-05T18:11:22+02:00"=>"999"	999
8358	7830	3	https://www.ldlc.com/fiche/PB00248007.html	2018-07-05 16:11:23.214675	2018-07-05 16:11:23.214675	"2018-07-05T18:11:23+02:00"=>"1899"	1899
8359	7817	3	https://www.ldlc.com/fiche/PB00248010.html	2018-07-05 16:11:23.781643	2018-07-05 16:11:23.781643	"2018-07-05T18:11:23+02:00"=>"1699"	1699
8360	7703	3	https://www.ldlc.com/fiche/PB00248019.html	2018-07-05 16:11:24.332856	2018-07-05 16:11:24.332856	"2018-07-05T18:11:24+02:00"=>"1599"	1599
8361	8405	3	https://www.ldlc.com/fiche/PB00247955.html	2018-07-05 16:11:25.851183	2018-07-05 16:11:25.851183	"2018-07-05T18:11:25+02:00"=>"1999"	1999
8362	7858	3	https://www.ldlc.com/fiche/PB00247954.html	2018-07-05 16:11:26.35497	2018-07-05 16:11:26.35497	"2018-07-05T18:11:26+02:00"=>"2299"	2299
8363	8406	3	https://www.ldlc.com/fiche/PB00234845.html	2018-07-05 16:11:26.91213	2018-07-05 16:11:26.91213	"2018-07-05T18:11:26+02:00"=>"1499"	1499
8364	7775	3	https://www.ldlc.com/fiche/PB00240787.html	2018-07-05 16:11:27.45099	2018-07-05 16:11:27.45099	"2018-07-05T18:11:27+02:00"=>"1799"	1799
8365	8407	3	https://www.ldlc.com/fiche/PB00218020.html	2018-07-05 16:11:27.99402	2018-07-05 16:11:27.99402	"2018-07-05T18:11:27+02:00"=>"1299"	1299
8366	8408	3	https://www.ldlc.com/fiche/PB00222083.html	2018-07-05 16:11:28.549305	2018-07-05 16:11:28.549305	"2018-07-05T18:11:28+02:00"=>"1499"	1499
8367	8409	3	https://www.ldlc.com/fiche/PB00235540.html	2018-07-05 16:11:29.100576	2018-07-05 16:11:29.100576	"2018-07-05T18:11:29+02:00"=>"1499"	1499
8368	7853	3	https://www.ldlc.com/fiche/PB00247792.html	2018-07-05 16:11:29.667303	2018-07-05 16:11:29.667303	"2018-07-05T18:11:29+02:00"=>"1899"	1899
8369	8410	3	https://www.ldlc.com/fiche/PB00247798.html	2018-07-05 16:11:30.211151	2018-07-05 16:11:30.211151	"2018-07-05T18:11:30+02:00"=>"1699"	1699
8370	8411	3	https://www.ldlc.com/fiche/PB00247745.html	2018-07-05 16:11:30.756183	2018-07-05 16:11:30.756183	"2018-07-05T18:11:30+02:00"=>"1999"	1999
8371	7846	3	https://www.ldlc.com/fiche/PB00247743.html	2018-07-05 16:11:32.295754	2018-07-05 16:11:32.295754	"2018-07-05T18:11:32+02:00"=>"2299"	2299
8372	8412	3	https://www.ldlc.com/fiche/PB00212523.html	2018-07-05 16:11:33.067961	2018-07-05 16:11:33.067961	"2018-07-05T18:11:33+02:00"=>"899"	899
8373	8413	3	https://www.ldlc.com/fiche/PB00234252.html	2018-07-05 16:11:34.580304	2018-07-05 16:11:34.580304	"2018-07-05T18:11:34+02:00"=>"849"	849
8374	8414	3	https://www.ldlc.com/fiche/PB00237209.html	2018-07-05 16:11:35.108017	2018-07-05 16:11:35.108017	"2018-07-05T18:11:35+02:00"=>"999"	999
8375	8415	3	https://www.ldlc.com/fiche/PB00239559.html	2018-07-05 16:11:35.632312	2018-07-05 16:11:35.632312	"2018-07-05T18:11:35+02:00"=>"899"	899
8376	8416	3	https://www.ldlc.com/fiche/PB00244028.html	2018-07-05 16:11:36.143403	2018-07-05 16:11:36.143403	"2018-07-05T18:11:36+02:00"=>"699"	699
8377	8417	3	https://www.ldlc.com/fiche/PB00244024.html	2018-07-05 16:11:36.703866	2018-07-05 16:11:36.703866	"2018-07-05T18:11:36+02:00"=>"949"	949
8378	8418	3	https://www.ldlc.com/fiche/PB00244638.html	2018-07-05 16:11:37.245634	2018-07-05 16:11:37.245634	"2018-07-05T18:11:37+02:00"=>"999"	999
8379	8419	3	https://www.ldlc.com/fiche/PB00252799.html	2018-07-05 16:11:37.758439	2018-07-05 16:11:37.758439	"2018-07-05T18:11:37+02:00"=>"1099"	1099
8380	7864	3	https://www.ldlc.com/fiche/PB00248442.html	2018-07-05 16:11:38.29231	2018-07-05 16:11:38.29231	"2018-07-05T18:11:38+02:00"=>"899"	899
8381	8420	3	https://www.ldlc.com/fiche/PB00251139.html	2018-07-05 16:11:39.783344	2018-07-05 16:11:39.783344	"2018-07-05T18:11:39+02:00"=>"799"	799
8382	7844	3	https://www.ldlc.com/fiche/PB00248434.html	2018-07-05 16:11:40.298546	2018-07-05 16:11:40.298546	"2018-07-05T18:11:40+02:00"=>"1199"	1199
8383	8421	3	https://www.ldlc.com/fiche/PB00248437.html	2018-07-05 16:11:40.843858	2018-07-05 16:11:40.843858	"2018-07-05T18:11:40+02:00"=>"999"	999
8384	8422	3	https://www.ldlc.com/fiche/PB00241856.html	2018-07-05 16:11:41.347815	2018-07-05 16:11:41.347815	"2018-07-05T18:11:41+02:00"=>"799"	799
8385	8423	3	https://www.ldlc.com/fiche/PB00253151.html	2018-07-05 16:11:41.873433	2018-07-05 16:11:41.873433	"2018-07-05T18:11:41+02:00"=>"769"	769
8386	7728	3	https://www.ldlc.com/fiche/PB00238033.html	2018-07-05 16:11:42.407877	2018-07-05 16:11:42.407877	"2018-07-05T18:11:42+02:00"=>"1099"	1099
8387	7837	3	https://www.ldlc.com/fiche/PB00248472.html	2018-07-05 16:11:42.892907	2018-07-05 16:11:42.892907	"2018-07-05T18:11:42+02:00"=>"1099"	1099
8388	7870	3	https://www.ldlc.com/fiche/PB00248480.html	2018-07-05 16:11:43.414092	2018-07-05 16:11:43.414092	"2018-07-05T18:11:43+02:00"=>"999"	999
8389	8424	3	https://www.ldlc.com/fiche/PB00206110.html	2018-07-05 16:11:43.941879	2018-07-05 16:11:43.941879	"2018-07-05T18:11:43+02:00"=>"739"	739
8390	8425	3	https://www.ldlc.com/fiche/PB00232525.html	2018-07-05 16:11:44.506587	2018-07-05 16:11:44.506587	"2018-07-05T18:11:44+02:00"=>"1199"	1199
8391	8426	3	https://www.ldlc.com/fiche/PB00234244.html	2018-07-05 16:11:45.044033	2018-07-05 16:11:45.044033	"2018-07-05T18:11:45+02:00"=>"1099"	1099
8392	8427	3	https://www.ldlc.com/fiche/PB00243270.html	2018-07-05 16:11:45.578538	2018-07-05 16:11:45.578538	"2018-07-05T18:11:45+02:00"=>"1199"	1199
8393	8428	3	https://www.ldlc.com/fiche/PB00235347.html	2018-07-05 16:11:46.109832	2018-07-05 16:11:46.109832	"2018-07-05T18:11:46+02:00"=>"1099"	1099
8394	8429	3	https://www.ldlc.com/fiche/PB00239665.html	2018-07-05 16:11:46.678768	2018-07-05 16:11:46.678768	"2018-07-05T18:11:46+02:00"=>"999"	999
8395	8430	3	https://www.ldlc.com/fiche/PB00249544.html	2018-07-05 16:11:47.284005	2018-07-05 16:11:47.284005	"2018-07-05T18:11:47+02:00"=>"1099"	1099
8396	7867	3	https://www.ldlc.com/fiche/PB00248050.html	2018-07-05 16:11:48.070042	2018-07-05 16:11:48.070042	"2018-07-05T18:11:48+02:00"=>"1499"	1499
8397	8431	3	https://www.ldlc.com/fiche/PB00248053.html	2018-07-05 16:11:48.608341	2018-07-05 16:11:48.608341	"2018-07-05T18:11:48+02:00"=>"1299"	1299
8398	8432	3	https://www.ldlc.com/fiche/PB00248018.html	2018-07-05 16:11:49.12915	2018-07-05 16:11:49.12915	"2018-07-05T18:11:49+02:00"=>"1599"	1599
8399	8433	3	https://www.ldlc.com/fiche/PB00248020.html	2018-07-05 16:11:49.673362	2018-07-05 16:11:49.673362	"2018-07-05T18:11:49+02:00"=>"1499"	1499
8400	8434	3	https://www.ldlc.com/fiche/PB00248045.html	2018-07-05 16:11:50.198511	2018-07-05 16:11:50.198511	"2018-07-05T18:11:50+02:00"=>"1399"	1399
8401	8435	3	https://www.ldlc.com/fiche/PB00248047.html	2018-07-05 16:11:50.746711	2018-07-05 16:11:50.746711	"2018-07-05T18:11:50+02:00"=>"1249"	1249
8402	8436	3	https://www.ldlc.com/fiche/PB00222105.html	2018-07-05 16:11:51.292153	2018-07-05 16:11:51.292153	"2018-07-05T18:11:51+02:00"=>"859"	859
8403	8437	3	https://www.ldlc.com/fiche/PB00231986.html	2018-07-05 16:11:51.810016	2018-07-05 16:11:51.810016	"2018-07-05T18:11:51+02:00"=>"1099"	1099
8404	8438	3	https://www.ldlc.com/fiche/PB00239616.html	2018-07-05 16:11:53.375683	2018-07-05 16:11:53.375683	"2018-07-05T18:11:53+02:00"=>"999"	999
8405	8439	3	https://www.ldlc.com/fiche/PB00234953.html	2018-07-05 16:11:53.875706	2018-07-05 16:11:53.875706	"2018-07-05T18:11:53+02:00"=>"1099"	1099
8406	8440	3	https://www.ldlc.com/fiche/PB00240817.html	2018-07-05 16:11:54.401185	2018-07-05 16:11:54.401185	"2018-07-05T18:11:54+02:00"=>"1299"	1299
8407	8441	3	https://www.ldlc.com/fiche/PB00239607.html	2018-07-05 16:11:54.931632	2018-07-05 16:11:54.931632	"2018-07-05T18:11:54+02:00"=>"1399"	1399
8408	8442	3	https://www.ldlc.com/fiche/PB00241855.html	2018-07-05 16:11:55.487108	2018-07-05 16:11:55.487108	"2018-07-05T18:11:55+02:00"=>"1299"	1299
8409	8443	3	https://www.ldlc.com/fiche/PB00237592.html	2018-07-05 16:11:56.027128	2018-07-05 16:11:56.027128	"2018-07-05T18:11:56+02:00"=>"1099"	1099
7601	7646	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110975.html	2018-07-05 16:01:49.911089	2018-07-05 16:01:50.0339	"2018-07-05T18:01:49+02:00"=>"189", "2018-07-05T18:01:50+02:00"=>"189.91"	189
8410	7826	3	https://www.ldlc.com/fiche/PB00247854.html	2018-07-05 16:11:57.64079	2018-07-05 16:11:57.64079	"2018-07-05T18:11:57+02:00"=>"1499"	1499
7628	7673	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110255.html	2018-07-05 16:01:57.590279	2018-07-05 16:01:57.748942	"2018-07-05T18:01:57+02:00"=>"351"	351
7602	7647	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10107264.html	2018-07-05 16:01:50.10423	2018-07-05 16:01:50.232389	"2018-07-05T18:01:50+02:00"=>"360"	360
7611	7656	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108670.html	2018-07-05 16:01:52.636154	2018-07-05 16:01:52.842696	"2018-07-05T18:01:52+02:00"=>"474"	474
7603	7648	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105098.html	2018-07-05 16:01:50.311753	2018-07-05 16:01:50.453964	"2018-07-05T18:01:50+02:00"=>"208"	208
7604	7649	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110585.html	2018-07-05 16:01:50.522432	2018-07-05 16:01:50.653315	"2018-07-05T18:01:50+02:00"=>"997"	997
7617	7662	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110265.html	2018-07-05 16:01:54.581106	2018-07-05 16:01:54.857882	"2018-07-05T18:01:54+02:00"=>"598"	598
7612	7657	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10107672.html	2018-07-05 16:01:52.966394	2018-07-05 16:01:53.165377	"2018-07-05T18:01:52+02:00"=>"759", "2018-07-05T18:01:53+02:00"=>"759.91"	759
7605	7650	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109883.html	2018-07-05 16:01:50.738911	2018-07-05 16:01:50.961347	"2018-07-05T18:01:50+02:00"=>"303"	303
7606	7651	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10106985.html	2018-07-05 16:01:51.048687	2018-07-05 16:01:51.192244	"2018-07-05T18:01:51+02:00"=>"474"	474
7607	7652	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110004.html	2018-07-05 16:01:51.278182	2018-07-05 16:01:51.455379	"2018-07-05T18:01:51+02:00"=>"427"	427
7613	7658	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108452.html	2018-07-05 16:01:53.283517	2018-07-05 16:01:53.614083	"2018-07-05T18:01:53+02:00"=>"648"	648
7608	7653	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105784.html	2018-07-05 16:01:51.548355	2018-07-05 16:01:51.813624	"2018-07-05T18:01:51+02:00"=>"759"	759
7618	7663	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112173.html	2018-07-05 16:01:55.011605	2018-07-05 16:01:55.13251	"2018-07-05T18:01:55+02:00"=>"284"	284
7609	7654	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112019.html	2018-07-05 16:01:51.979792	2018-07-05 16:01:52.127235	"2018-07-05T18:01:51+02:00"=>"493", "2018-07-05T18:01:52+02:00"=>"493.91"	493
7614	7659	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109998.html	2018-07-05 16:01:53.689076	2018-07-05 16:01:53.868645	"2018-07-05T18:01:53+02:00"=>"807"	807
7610	7655	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109652.html	2018-07-05 16:01:52.2484	2018-07-05 16:01:52.537218	"2018-07-05T18:01:52+02:00"=>"699"	699
7622	7667	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105791.html	2018-07-05 16:01:55.888797	2018-07-05 16:01:56.124422	"2018-07-05T18:01:55+02:00"=>"807", "2018-07-05T18:01:56+02:00"=>"807.41"	807
7615	7660	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108712.html	2018-07-05 16:01:53.983218	2018-07-05 16:01:54.29295	"2018-07-05T18:01:53+02:00"=>"788", "2018-07-05T18:01:54+02:00"=>"788.41"	788
7619	7664	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111140.html	2018-07-05 16:01:55.209416	2018-07-05 16:01:55.344415	"2018-07-05T18:01:55+02:00"=>"360"	360
7616	7661	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112014.html	2018-07-05 16:01:54.363468	2018-07-05 16:01:54.486439	"2018-07-05T18:01:54+02:00"=>"598"	598
7625	7670	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111916.html	2018-07-05 16:01:56.757924	2018-07-05 16:01:56.975711	"2018-07-05T18:01:56+02:00"=>"698"	698
7620	7665	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112191.html	2018-07-05 16:01:55.415882	2018-07-05 16:01:55.535537	"2018-07-05T18:01:55+02:00"=>"313"	313
7623	7668	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10107717.html	2018-07-05 16:01:56.221303	2018-07-05 16:01:56.475632	"2018-07-05T18:01:56+02:00"=>"750"	750
7621	7666	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10101629.html	2018-07-05 16:01:55.6043	2018-07-05 16:01:55.801799	"2018-07-05T18:01:55+02:00"=>"142"	142
7627	7672	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109991.html	2018-07-05 16:01:57.292493	2018-07-05 16:01:57.508721	"2018-07-05T18:01:57+02:00"=>"379"	379
7624	7669	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10107889.html	2018-07-05 16:01:56.54705	2018-07-05 16:01:56.68727	"2018-07-05T18:01:56+02:00"=>"398"	398
7626	7671	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108829.html	2018-07-05 16:01:57.062456	2018-07-05 16:01:57.204469	"2018-07-05T18:01:57+02:00"=>"1044"	1044
7629	7674	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109438.html	2018-07-05 16:01:57.831232	2018-07-05 16:01:58.063368	"2018-07-05T18:01:57+02:00"=>"446", "2018-07-05T18:01:58+02:00"=>"446.41"	446
7631	7676	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112469.html	2018-07-05 16:01:58.449527	2018-07-05 16:01:58.580383	"2018-07-05T18:01:58+02:00"=>"1044"	1044
7630	7675	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105907.html	2018-07-05 16:01:58.141654	2018-07-05 16:01:58.375398	"2018-07-05T18:01:58+02:00"=>"398"	398
7632	7677	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108854.html	2018-07-05 16:01:58.65833	2018-07-05 16:01:58.817574	"2018-07-05T18:01:58+02:00"=>"455"	455
7633	7678	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110254.html	2018-07-05 16:01:58.899233	2018-07-05 16:01:59.044345	"2018-07-05T18:01:58+02:00"=>"351", "2018-07-05T18:01:59+02:00"=>"351.41"	351
7655	7700	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110259.html	2018-07-05 16:02:05.37839	2018-07-05 16:02:05.537375	"2018-07-05T18:02:05+02:00"=>"807"	807
7634	7679	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110351.html	2018-07-05 16:01:59.130045	2018-07-05 16:01:59.276861	"2018-07-05T18:01:59+02:00"=>"351"	351
7645	7690	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110406.html	2018-07-05 16:02:02.038306	2018-07-05 16:02:02.198557	"2018-07-05T18:02:02+02:00"=>"498"	498
7635	7680	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109810.html	2018-07-05 16:01:59.357471	2018-07-05 16:01:59.511703	"2018-07-05T18:01:59+02:00"=>"379"	379
7636	7681	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108851.html	2018-07-05 16:01:59.602953	2018-07-05 16:01:59.767939	"2018-07-05T18:01:59+02:00"=>"997"	997
7651	7696	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109243.html	2018-07-05 16:02:04.220016	2018-07-05 16:02:04.427622	"2018-07-05T18:02:04+02:00"=>"693"	693
7637	7682	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110286.html	2018-07-05 16:01:59.852686	2018-07-05 16:02:00.003247	"2018-07-05T18:01:59+02:00"=>"498", "2018-07-05T18:02:00+02:00"=>"498.66"	498
7646	7691	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108715.html	2018-07-05 16:02:02.295447	2018-07-05 16:02:02.538014	"2018-07-05T18:02:02+02:00"=>"788"	788
7638	7683	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10107904.html	2018-07-05 16:02:00.101977	2018-07-05 16:02:00.332549	"2018-07-05T18:02:00+02:00"=>"693"	693
7639	7684	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112247.html	2018-07-05 16:02:00.40328	2018-07-05 16:02:00.526533	"2018-07-05T18:02:00+02:00"=>"1519"	1519
7640	7685	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108583.html	2018-07-05 16:02:00.620552	2018-07-05 16:02:00.772854	"2018-07-05T18:02:00+02:00"=>"997"	997
7647	7692	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109892.html	2018-07-05 16:02:02.623779	2018-07-05 16:02:02.838585	"2018-07-05T18:02:02+02:00"=>"379"	379
7641	7686	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110889.html	2018-07-05 16:02:00.857273	2018-07-05 16:02:01.004099	"2018-07-05T18:02:00+02:00"=>"498", "2018-07-05T18:02:01+02:00"=>"498.66"	498
7642	7687	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108890.html	2018-07-05 16:02:01.32536	2018-07-05 16:02:01.477076	"2018-07-05T18:02:01+02:00"=>"498"	498
7652	7697	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108889.html	2018-07-05 16:02:04.515086	2018-07-05 16:02:04.662657	"2018-07-05T18:02:04+02:00"=>"807"	807
7643	7688	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110281.html	2018-07-05 16:02:01.562012	2018-07-05 16:02:01.717966	"2018-07-05T18:02:01+02:00"=>"398"	398
7644	7689	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112143.html	2018-07-05 16:02:01.788403	2018-07-05 16:02:01.919501	"2018-07-05T18:02:01+02:00"=>"199"	199
7648	7693	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10111723.html	2018-07-05 16:02:02.930542	2018-07-05 16:02:03.184808	"2018-07-05T18:02:02+02:00"=>"617", "2018-07-05T18:02:03+02:00"=>"617.41"	617
7658	7703	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10113090.html	2018-07-05 16:02:06.169799	2018-07-05 16:02:06.30936	"2018-07-05T18:02:06+02:00"=>"1234"	1234
7653	7698	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112546.html	2018-07-05 16:02:04.756338	2018-07-05 16:02:04.878327	"2018-07-05T18:02:04+02:00"=>"854"	854
7649	7694	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10107877.html	2018-07-05 16:02:03.514377	2018-07-05 16:02:03.792059	"2018-07-05T18:02:03+02:00"=>"179"	179
7650	7695	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105942.html	2018-07-05 16:02:03.874007	2018-07-05 16:02:04.112256	"2018-07-05T18:02:03+02:00"=>"999", "2018-07-05T18:02:04+02:00"=>"999.9"	999
7656	7701	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108799.html	2018-07-05 16:02:05.63124	2018-07-05 16:02:05.856061	"2018-07-05T18:02:05+02:00"=>"997"	997
7654	7699	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108453.html	2018-07-05 16:02:04.975712	2018-07-05 16:02:05.291292	"2018-07-05T18:02:04+02:00"=>"997", "2018-07-05T18:02:05+02:00"=>"997.41"	997
7660	7705	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105187.html	2018-07-05 16:02:06.612316	2018-07-05 16:02:06.826502	"2018-07-05T18:02:06+02:00"=>"1044"	1044
7659	7704	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109614.html	2018-07-05 16:02:06.385998	2018-07-05 16:02:06.526853	"2018-07-05T18:02:06+02:00"=>"1044"	1044
7657	7702	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10113100.html	2018-07-05 16:02:05.944878	2018-07-05 16:02:06.096612	"2018-07-05T18:02:05+02:00"=>"1234", "2018-07-05T18:02:06+02:00"=>"1234.91"	1234
8411	8444	3	https://www.ldlc.com/fiche/PB00247856.html	2018-07-05 16:11:58.163611	2018-07-05 16:11:58.163611	"2018-07-05T18:11:58+02:00"=>"1299"	1299
7662	7707	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108645.html	2018-07-05 16:02:07.311702	2018-07-05 16:02:07.480271	"2018-07-05T18:02:07+02:00"=>"788"	788
7661	7706	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10101726.html	2018-07-05 16:02:06.9265	2018-07-05 16:02:07.213237	"2018-07-05T18:02:06+02:00"=>"94", "2018-07-05T18:02:07+02:00"=>"94.91"	94
7663	7708	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109025.html	2018-07-05 16:02:07.557209	2018-07-05 16:02:07.703664	"2018-07-05T18:02:07+02:00"=>"911"	911
7664	7709	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112437.html	2018-07-05 16:02:07.782421	2018-07-05 16:02:07.939824	"2018-07-05T18:02:07+02:00"=>"617"	617
7665	7710	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110262.html	2018-07-05 16:02:08.021213	2018-07-05 16:02:08.181281	"2018-07-05T18:02:08+02:00"=>"339"	339
7666	7711	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112365.html	2018-07-05 16:02:08.270073	2018-07-05 16:02:08.392661	"2018-07-05T18:02:08+02:00"=>"1329"	1329
7667	7712	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112211.html	2018-07-05 16:02:08.481806	2018-07-05 16:02:08.611242	"2018-07-05T18:02:08+02:00"=>"892"	892
7684	7729	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105011.html	2018-07-05 16:02:13.098603	2018-07-05 16:02:13.38134	"2018-07-05T18:02:13+02:00"=>"1424"	1424
7668	7713	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108553.html	2018-07-05 16:02:08.709372	2018-07-05 16:02:08.851614	"2018-07-05T18:02:08+02:00"=>"997"	997
7678	7723	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105012.html	2018-07-05 16:02:11.447857	2018-07-05 16:02:11.605028	"2018-07-05T18:02:11+02:00"=>"1424"	1424
7669	7714	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10101779.html	2018-07-05 16:02:08.928994	2018-07-05 16:02:09.068547	"2018-07-05T18:02:08+02:00"=>"1139", "2018-07-05T18:02:09+02:00"=>"1139.91"	1139
7670	7715	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10107797.html	2018-07-05 16:02:09.151552	2018-07-05 16:02:09.304616	"2018-07-05T18:02:09+02:00"=>"598"	598
7679	7724	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108514.html	2018-07-05 16:02:11.702983	2018-07-05 16:02:11.853285	"2018-07-05T18:02:11+02:00"=>"712"	712
7671	7716	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108719.html	2018-07-05 16:02:09.384621	2018-07-05 16:02:09.633885	"2018-07-05T18:02:09+02:00"=>"1092"	1092
7672	7717	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108835.html	2018-07-05 16:02:09.734253	2018-07-05 16:02:09.906788	"2018-07-05T18:02:09+02:00"=>"797"	797
7685	7730	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108086.html	2018-07-05 16:02:13.47225	2018-07-05 16:02:13.647962	"2018-07-05T18:02:13+02:00"=>"1396"	1396
7673	7718	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10107734.html	2018-07-05 16:02:10.04207	2018-07-05 16:02:10.298089	"2018-07-05T18:02:10+02:00"=>"759"	759
7680	7725	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108485.html	2018-07-05 16:02:11.944653	2018-07-05 16:02:12.206114	"2018-07-05T18:02:11+02:00"=>"997", "2018-07-05T18:02:12+02:00"=>"997.41"	997
7674	7719	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10107158.html	2018-07-05 16:02:10.407143	2018-07-05 16:02:10.648206	"2018-07-05T18:02:10+02:00"=>"997"	997
7675	7720	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108097.html	2018-07-05 16:02:10.725757	2018-07-05 16:02:10.880651	"2018-07-05T18:02:10+02:00"=>"712"	712
7681	7726	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108377.html	2018-07-05 16:02:12.289978	2018-07-05 16:02:12.431293	"2018-07-05T18:02:12+02:00"=>"902"	902
7676	7721	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10105186.html	2018-07-05 16:02:10.959362	2018-07-05 16:02:11.112499	"2018-07-05T18:02:10+02:00"=>"1281", "2018-07-05T18:02:11+02:00"=>"1281.55"	1281
7677	7722	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10109612.html	2018-07-05 16:02:11.192915	2018-07-05 16:02:11.352496	"2018-07-05T18:02:11+02:00"=>"1186"	1186
7682	7727	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10108868.html	2018-07-05 16:02:12.510164	2018-07-05 16:02:12.653392	"2018-07-05T18:02:12+02:00"=>"997"	997
7686	7731	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10107779.html	2018-07-05 16:02:13.739072	2018-07-05 16:02:13.892411	"2018-07-05T18:02:13+02:00"=>"807"	807
7683	7728	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10106476.html	2018-07-05 16:02:12.742252	2018-07-05 16:02:13.000351	"2018-07-05T18:02:12+02:00"=>"759"	759
7690	7734	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10110309.html	2018-07-05 16:02:14.723084	2018-07-05 16:02:14.897404	"2018-07-05T18:02:14+02:00"=>"1234"	1234
8412	7881	3	https://www.ldlc.com/fiche/PB00247864.html	2018-07-05 16:11:58.70902	2018-07-05 16:11:58.70902	"2018-07-05T18:11:58+02:00"=>"1199"	1199
7687	7732	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112452.html	2018-07-05 16:02:13.977758	2018-07-05 16:02:14.139319	"2018-07-05T18:02:13+02:00"=>"1396", "2018-07-05T18:02:14+02:00"=>"1396.41"	1396
8413	7861	3	https://www.ldlc.com/fiche/PB00247808.html	2018-07-05 16:11:59.23501	2018-07-05 16:11:59.23501	"2018-07-05T18:11:59+02:00"=>"1599"	1599
7688	7733	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112674.html	2018-07-05 16:02:14.230107	2018-07-05 16:02:14.384434	"2018-07-05T18:02:14+02:00"=>"1424"	1424
8414	8445	3	https://www.ldlc.com/fiche/PB00234616.html	2018-07-05 16:11:59.757964	2018-07-05 16:11:59.757964	"2018-07-05T18:11:59+02:00"=>"1349"	1349
7689	7734	2	https://www.topachat.com/pages/detail2_cat_est_ordinateurs_puis_rubrique_est_wport_puis_ref_est_in10112893.html	2018-07-05 16:02:14.474421	2018-07-05 16:02:14.619482	"2018-07-05T18:02:14+02:00"=>"1234"	1234
8415	8446	3	https://www.ldlc.com/fiche/PB00222807.html	2018-07-05 16:12:00.320846	2018-07-05 16:12:00.320846	"2018-07-05T18:12:00+02:00"=>"1299"	1299
8416	8447	3	https://www.ldlc.com/fiche/PB00235486.html	2018-07-05 16:12:00.837963	2018-07-05 16:12:00.837963	"2018-07-05T18:12:00+02:00"=>"1179"	1179
8417	8448	3	https://www.ldlc.com/fiche/PB00222804.html	2018-07-05 16:12:01.378496	2018-07-05 16:12:01.378496	"2018-07-05T18:12:01+02:00"=>"1199"	1199
8418	8449	3	https://www.ldlc.com/fiche/PB00247943.html	2018-07-05 16:12:02.086567	2018-07-05 16:12:02.086567	"2018-07-05T18:12:02+02:00"=>"2299"	2299
8419	7829	3	https://www.ldlc.com/fiche/PB00247947.html	2018-07-05 16:12:02.61251	2018-07-05 16:12:02.61251	"2018-07-05T18:12:02+02:00"=>"1999"	1999
8420	8450	3	https://www.ldlc.com/fiche/PB00221730.html	2018-07-05 16:12:03.35058	2018-07-05 16:12:03.35058	"2018-07-05T18:12:03+02:00"=>"1399"	1399
8421	8451	3	https://www.ldlc.com/fiche/PB00249530.html	2018-07-05 16:12:03.905408	2018-07-05 16:12:03.905408	"2018-07-05T18:12:03+02:00"=>"1499"	1499
8422	8452	3	https://www.ldlc.com/fiche/PB00222814.html	2018-07-05 16:12:04.446759	2018-07-05 16:12:04.446759	"2018-07-05T18:12:04+02:00"=>"2099"	2099
8423	7759	3	https://www.ldlc.com/fiche/PB00239953.html	2018-07-05 16:12:04.994553	2018-07-05 16:12:04.994553	"2018-07-05T18:12:04+02:00"=>"1849"	1849
8424	7823	3	https://www.ldlc.com/fiche/PB00248057.html	2018-07-05 16:12:05.534556	2018-07-05 16:12:05.534556	"2018-07-05T18:12:05+02:00"=>"2149"	2149
8425	8453	3	https://www.ldlc.com/fiche/PB00248055.html	2018-07-05 16:12:06.176519	2018-07-05 16:12:06.176519	"2018-07-05T18:12:06+02:00"=>"2699"	2699
8426	7799	3	https://www.ldlc.com/fiche/PB00248056.html	2018-07-05 16:12:06.715012	2018-07-05 16:12:06.715012	"2018-07-05T18:12:06+02:00"=>"2399"	2399
8427	8454	3	https://www.ldlc.com/fiche/PB00249551.html	2018-07-05 16:12:07.250611	2018-07-05 16:12:07.250611	"2018-07-05T18:12:07+02:00"=>"2199"	2199
\.


--
-- Name: computers_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valentin
--

SELECT pg_catalog.setval('computers_prices_id_seq', 8519, true);


--
-- Data for Name: computers_quests; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY computers_quests (id, activity_id, rank, quest, domain, created_at, updated_at) FROM stdin;
\.


--
-- Name: computers_quests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valentin
--

SELECT pg_catalog.setval('computers_quests_id_seq', 1, false);


--
-- Data for Name: computers_quests_resps; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY computers_quests_resps (id, quest_id, resp, indice) FROM stdin;
\.


--
-- Name: computers_quests_resps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valentin
--

SELECT pg_catalog.setval('computers_quests_resps_id_seq', 1, false);


--
-- Data for Name: computers_traders; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY computers_traders (id, name, description) FROM stdin;
3	LDLC	\N
2	Top Achat	\N
4	Fnac	\N
5	Materiel.net	\N
\.


--
-- Name: computers_traders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valentin
--

SELECT pg_catalog.setval('computers_traders_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY schema_migrations (version) FROM stdin;
20180524131513
20180703131348
20180705142452
\.


--
-- Data for Name: users_auth; Type: TABLE DATA; Schema: public; Owner: valentin
--

COPY users_auth (id, name, description) FROM stdin;
\.


--
-- Name: users_auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valentin
--

SELECT pg_catalog.setval('users_auth_id_seq', 1, false);


--
-- Name: SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY "SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: computer_disks_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computer_disks
    ADD CONSTRAINT computer_disks_pkey PRIMARY KEY (id);


--
-- Name: computers_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_activities
    ADD CONSTRAINT computers_activities_pkey PRIMARY KEY (id);


--
-- Name: computers_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_brands
    ADD CONSTRAINT computers_brands_pkey PRIMARY KEY (id);


--
-- Name: computers_chipsets_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_chipsets
    ADD CONSTRAINT computers_chipsets_pkey PRIMARY KEY (id);


--
-- Name: computers_cpus_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_cpus
    ADD CONSTRAINT computers_cpus_pkey PRIMARY KEY (id);


--
-- Name: computers_disks_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_disks
    ADD CONSTRAINT computers_disks_pkey PRIMARY KEY (id);


--
-- Name: computers_gpus_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_gpus
    ADD CONSTRAINT computers_gpus_pkey PRIMARY KEY (id);


--
-- Name: computers_os_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_os
    ADD CONSTRAINT computers_os_pkey PRIMARY KEY (id);


--
-- Name: computers_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers
    ADD CONSTRAINT computers_pkey PRIMARY KEY (id);


--
-- Name: computers_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_prices
    ADD CONSTRAINT computers_prices_pkey PRIMARY KEY (id);


--
-- Name: computers_quests_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_quests
    ADD CONSTRAINT computers_quests_pkey PRIMARY KEY (id);


--
-- Name: computers_quests_resps_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_quests_resps
    ADD CONSTRAINT computers_quests_resps_pkey PRIMARY KEY (id);


--
-- Name: computers_traders_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_traders
    ADD CONSTRAINT computers_traders_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_auth_pkey; Type: CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY users_auth
    ADD CONSTRAINT users_auth_pkey PRIMARY KEY (id);


--
-- Name: index_computers_prices_on_url; Type: INDEX; Schema: public; Owner: valentin
--

CREATE UNIQUE INDEX index_computers_prices_on_url ON computers_prices USING btree (url);


--
-- Name: computers_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers
    ADD CONSTRAINT computers_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES computers_activities(id);


--
-- Name: computers_chipset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers
    ADD CONSTRAINT computers_chipset_id_fkey FOREIGN KEY (chipset_id) REFERENCES computers_chipsets(id);


--
-- Name: computers_cpu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers
    ADD CONSTRAINT computers_cpu_id_fkey FOREIGN KEY (cpu_id) REFERENCES computers_cpus(id);


--
-- Name: computers_disks_computer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_disks
    ADD CONSTRAINT computers_disks_computer_id_fkey FOREIGN KEY (computer_id) REFERENCES computers(id);


--
-- Name: computers_gpu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers
    ADD CONSTRAINT computers_gpu_id_fkey FOREIGN KEY (gpu_id) REFERENCES computers_gpus(id);


--
-- Name: computers_os_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers
    ADD CONSTRAINT computers_os_id_fkey FOREIGN KEY (os_id) REFERENCES computers_os(id);


--
-- Name: computers_prices_computer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_prices
    ADD CONSTRAINT computers_prices_computer_id_fkey FOREIGN KEY (computer_id) REFERENCES computers(id);


--
-- Name: computers_prices_trader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_prices
    ADD CONSTRAINT computers_prices_trader_id_fkey FOREIGN KEY (trader_id) REFERENCES computers_traders(id);


--
-- Name: computers_quests_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_quests
    ADD CONSTRAINT computers_quests_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES computers_activities(id);


--
-- Name: computers_quests_resps_quest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valentin
--

ALTER TABLE ONLY computers_quests_resps
    ADD CONSTRAINT computers_quests_resps_quest_id_fkey FOREIGN KEY (quest_id) REFERENCES computers_quests(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

