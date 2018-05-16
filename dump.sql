--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: node
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO node;

--
-- Name: computers; Type: TABLE; Schema: public; Owner: node
--

CREATE TABLE public.computers (
    id integer NOT NULL,
    osid integer DEFAULT 1,
    keyboardid integer DEFAULT 1,
    cpuid integer DEFAULT 1,
    "screenId" integer DEFAULT 1,
    gpuid integer DEFAULT 1,
    activityid integer DEFAULT 1,
    chipsetid integer DEFAULT 1,
    picture character varying(512),
    designation character varying(256),
    model character varying(256) NOT NULL,
    connector_available character varying(2048),
    weight character varying(16),
    length character varying(16),
    width character varying(16),
    height character varying(16),
    memory_size character varying(128),
    memory_type character varying(128),
    memory_max_size character varying(128),
    storage_size character varying(128),
    storage_type character varying(128),
    network character varying(128),
    webcam boolean DEFAULT true NOT NULL,
    active boolean DEFAULT true NOT NULL,
    createdat timestamp with time zone NOT NULL,
    updatedat timestamp with time zone NOT NULL
);


ALTER TABLE public.computers OWNER TO node;

--
-- Name: computers_activities; Type: TABLE; Schema: public; Owner: node
--

CREATE TABLE public.computers_activities (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(512)
);


ALTER TABLE public.computers_activities OWNER TO node;

--
-- Name: computers_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: node
--

CREATE SEQUENCE public.computers_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computers_activities_id_seq OWNER TO node;

--
-- Name: computers_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node
--

ALTER SEQUENCE public.computers_activities_id_seq OWNED BY public.computers_activities.id;


--
-- Name: computers_chipsets; Type: TABLE; Schema: public; Owner: node
--

CREATE TABLE public.computers_chipsets (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(512)
);


ALTER TABLE public.computers_chipsets OWNER TO node;

--
-- Name: computers_chipsets_id_seq; Type: SEQUENCE; Schema: public; Owner: node
--

CREATE SEQUENCE public.computers_chipsets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computers_chipsets_id_seq OWNER TO node;

--
-- Name: computers_chipsets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node
--

ALTER SEQUENCE public.computers_chipsets_id_seq OWNED BY public.computers_chipsets.id;


--
-- Name: computers_cpus; Type: TABLE; Schema: public; Owner: node
--

CREATE TABLE public.computers_cpus (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(512)
);


ALTER TABLE public.computers_cpus OWNER TO node;

--
-- Name: computers_cpus_id_seq; Type: SEQUENCE; Schema: public; Owner: node
--

CREATE SEQUENCE public.computers_cpus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computers_cpus_id_seq OWNER TO node;

--
-- Name: computers_cpus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node
--

ALTER SEQUENCE public.computers_cpus_id_seq OWNED BY public.computers_cpus.id;


--
-- Name: computers_gpus; Type: TABLE; Schema: public; Owner: node
--

CREATE TABLE public.computers_gpus (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(1024)
);


ALTER TABLE public.computers_gpus OWNER TO node;

--
-- Name: computers_gpus_id_seq; Type: SEQUENCE; Schema: public; Owner: node
--

CREATE SEQUENCE public.computers_gpus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computers_gpus_id_seq OWNER TO node;

--
-- Name: computers_gpus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node
--

ALTER SEQUENCE public.computers_gpus_id_seq OWNED BY public.computers_gpus.id;


--
-- Name: computers_id_seq; Type: SEQUENCE; Schema: public; Owner: node
--

CREATE SEQUENCE public.computers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computers_id_seq OWNER TO node;

--
-- Name: computers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node
--

ALTER SEQUENCE public.computers_id_seq OWNED BY public.computers.id;


--
-- Name: computers_keyboards; Type: TABLE; Schema: public; Owner: node
--

CREATE TABLE public.computers_keyboards (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(128)
);


ALTER TABLE public.computers_keyboards OWNER TO node;

--
-- Name: computers_keyboards_id_seq; Type: SEQUENCE; Schema: public; Owner: node
--

CREATE SEQUENCE public.computers_keyboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computers_keyboards_id_seq OWNER TO node;

--
-- Name: computers_keyboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node
--

ALTER SEQUENCE public.computers_keyboards_id_seq OWNED BY public.computers_keyboards.id;


--
-- Name: computers_os; Type: TABLE; Schema: public; Owner: node
--

CREATE TABLE public.computers_os (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(128)
);


ALTER TABLE public.computers_os OWNER TO node;

--
-- Name: computers_os_id_seq; Type: SEQUENCE; Schema: public; Owner: node
--

CREATE SEQUENCE public.computers_os_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computers_os_id_seq OWNER TO node;

--
-- Name: computers_os_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node
--

ALTER SEQUENCE public.computers_os_id_seq OWNED BY public.computers_os.id;


--
-- Name: computers_prices; Type: TABLE; Schema: public; Owner: node
--

CREATE TABLE public.computers_prices (
    id integer NOT NULL,
    "computerId" integer NOT NULL,
    "traderId" integer NOT NULL,
    pricing integer NOT NULL,
    url character varying(512) NOT NULL,
    createdat timestamp with time zone NOT NULL
);


ALTER TABLE public.computers_prices OWNER TO node;

--
-- Name: computers_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: node
--

CREATE SEQUENCE public.computers_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computers_prices_id_seq OWNER TO node;

--
-- Name: computers_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node
--

ALTER SEQUENCE public.computers_prices_id_seq OWNED BY public.computers_prices.id;


--
-- Name: computers_quests; Type: TABLE; Schema: public; Owner: node
--

CREATE TABLE public.computers_quests (
    id integer NOT NULL,
    "activityId" integer NOT NULL,
    quest character varying(512) NOT NULL,
    domain character varying(64) NOT NULL,
    createdat timestamp with time zone NOT NULL,
    updatedat timestamp with time zone NOT NULL
);


ALTER TABLE public.computers_quests OWNER TO node;

--
-- Name: computers_quests_id_seq; Type: SEQUENCE; Schema: public; Owner: node
--

CREATE SEQUENCE public.computers_quests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computers_quests_id_seq OWNER TO node;

--
-- Name: computers_quests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node
--

ALTER SEQUENCE public.computers_quests_id_seq OWNED BY public.computers_quests.id;


--
-- Name: computers_quests_resps; Type: TABLE; Schema: public; Owner: node
--

CREATE TABLE public.computers_quests_resps (
    id integer NOT NULL,
    "questId" integer NOT NULL,
    resp character varying(32) NOT NULL,
    indice character varying(32) NOT NULL
);


ALTER TABLE public.computers_quests_resps OWNER TO node;

--
-- Name: computers_quests_resps_id_seq; Type: SEQUENCE; Schema: public; Owner: node
--

CREATE SEQUENCE public.computers_quests_resps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computers_quests_resps_id_seq OWNER TO node;

--
-- Name: computers_quests_resps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node
--

ALTER SEQUENCE public.computers_quests_resps_id_seq OWNED BY public.computers_quests_resps.id;


--
-- Name: computers_screens; Type: TABLE; Schema: public; Owner: node
--

CREATE TABLE public.computers_screens (
    id integer NOT NULL,
    type character varying(256),
    resolution character varying(16),
    size character varying(16),
    refresh_rate integer,
    description character varying(512)
);


ALTER TABLE public.computers_screens OWNER TO node;

--
-- Name: computers_screens_id_seq; Type: SEQUENCE; Schema: public; Owner: node
--

CREATE SEQUENCE public.computers_screens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computers_screens_id_seq OWNER TO node;

--
-- Name: computers_screens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node
--

ALTER SEQUENCE public.computers_screens_id_seq OWNED BY public.computers_screens.id;


--
-- Name: computers_traders; Type: TABLE; Schema: public; Owner: node
--

CREATE TABLE public.computers_traders (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(512)
);


ALTER TABLE public.computers_traders OWNER TO node;

--
-- Name: computers_traders_id_seq; Type: SEQUENCE; Schema: public; Owner: node
--

CREATE SEQUENCE public.computers_traders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computers_traders_id_seq OWNER TO node;

--
-- Name: computers_traders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node
--

ALTER SEQUENCE public.computers_traders_id_seq OWNED BY public.computers_traders.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: node
--

CREATE TABLE public.users (
    id integer NOT NULL,
    "roleId" integer,
    "authId" integer,
    firstname character varying(128) NOT NULL,
    lastname character varying(256) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(1024) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    createdat timestamp with time zone NOT NULL,
    updatedat timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO node;

--
-- Name: users_auth; Type: TABLE; Schema: public; Owner: node
--

CREATE TABLE public.users_auth (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    description character varying(128)
);


ALTER TABLE public.users_auth OWNER TO node;

--
-- Name: users_auth_id_seq; Type: SEQUENCE; Schema: public; Owner: node
--

CREATE SEQUENCE public.users_auth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_auth_id_seq OWNER TO node;

--
-- Name: users_auth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node
--

ALTER SEQUENCE public.users_auth_id_seq OWNED BY public.users_auth.id;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: node
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO node;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: node
--

CREATE TABLE public.users_roles (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(50)
);


ALTER TABLE public.users_roles OWNER TO node;

--
-- Name: users_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: node
--

CREATE SEQUENCE public.users_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_roles_id_seq OWNER TO node;

--
-- Name: users_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node
--

ALTER SEQUENCE public.users_roles_id_seq OWNED BY public.users_roles.id;


--
-- Name: computers id; Type: DEFAULT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers ALTER COLUMN id SET DEFAULT nextval('public.computers_id_seq'::regclass);


--
-- Name: computers_activities id; Type: DEFAULT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_activities ALTER COLUMN id SET DEFAULT nextval('public.computers_activities_id_seq'::regclass);


--
-- Name: computers_chipsets id; Type: DEFAULT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_chipsets ALTER COLUMN id SET DEFAULT nextval('public.computers_chipsets_id_seq'::regclass);


--
-- Name: computers_cpus id; Type: DEFAULT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_cpus ALTER COLUMN id SET DEFAULT nextval('public.computers_cpus_id_seq'::regclass);


--
-- Name: computers_gpus id; Type: DEFAULT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_gpus ALTER COLUMN id SET DEFAULT nextval('public.computers_gpus_id_seq'::regclass);


--
-- Name: computers_keyboards id; Type: DEFAULT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_keyboards ALTER COLUMN id SET DEFAULT nextval('public.computers_keyboards_id_seq'::regclass);


--
-- Name: computers_os id; Type: DEFAULT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_os ALTER COLUMN id SET DEFAULT nextval('public.computers_os_id_seq'::regclass);


--
-- Name: computers_prices id; Type: DEFAULT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_prices ALTER COLUMN id SET DEFAULT nextval('public.computers_prices_id_seq'::regclass);


--
-- Name: computers_quests id; Type: DEFAULT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_quests ALTER COLUMN id SET DEFAULT nextval('public.computers_quests_id_seq'::regclass);


--
-- Name: computers_quests_resps id; Type: DEFAULT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_quests_resps ALTER COLUMN id SET DEFAULT nextval('public.computers_quests_resps_id_seq'::regclass);


--
-- Name: computers_screens id; Type: DEFAULT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_screens ALTER COLUMN id SET DEFAULT nextval('public.computers_screens_id_seq'::regclass);


--
-- Name: computers_traders id; Type: DEFAULT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_traders ALTER COLUMN id SET DEFAULT nextval('public.computers_traders_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_auth id; Type: DEFAULT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.users_auth ALTER COLUMN id SET DEFAULT nextval('public.users_auth_id_seq'::regclass);


--
-- Name: users_roles id; Type: DEFAULT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.users_roles ALTER COLUMN id SET DEFAULT nextval('public.users_roles_id_seq'::regclass);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: node
--

COPY public."SequelizeMeta" (name) FROM stdin;
20180305103837-create-computers-traders.js
20180305102132-create-users-roles.js
20180305111117-create-computers-os.js
20180305111740-create-computers-keyboards.js
20180305111943-create-computers-gpus.js
20180305123835-create-computers-screens.js
20180305125345-create-computers-cpus.js
20180305125408-create-computers-chipsets.js
20180305125425-create-computers-activities.js
20180305125439-create-computers.js
20180305110501-create-computers-prices.js
20180305104623-create-computers-quests.js
20180305105733-create-computers-quests-resps.js
20180305103243-create-users-auth.js
20180305100122-create-users.js
\.


--
-- Data for Name: computers; Type: TABLE DATA; Schema: public; Owner: node
--

COPY public.computers (id, osid, keyboardid, cpuid, "screenId", gpuid, activityid, chipsetid, picture, designation, model, connector_available, weight, length, width, height, memory_size, memory_type, memory_max_size, storage_size, storage_type, network, webcam, active, createdat, updatedat) FROM stdin;
1	2	1	2	1	2	1	1	\N	\N	PC Portable Acer Nitro 5 AN515-51-56EN 15.6" Gaming	1 Ethernet RJ-451 USB 3.0 dont 1 fonction charge même ordinateur éteint2 USB 2.01 HDMI1 USB Type C 3.1 Gen 1 (jusqu'à 5 Gbps), Support : Audio, Vidéo, Données, Charge	2,7 Kg	39 cm	26,6 cm	2,67 cm	4 Go	DDR4		\N	\N		t	t	2018-05-14 11:31:36.980935+02	2018-05-14 11:31:36.980935+02
2	3	1	3	1	2	1	2	\N	\N	PC Portable MSI GV72 7RD-1280FR 17.3" Gaming	2 USB 3.01 USB 2.01 HDMI 4K à 30 Hz1 USB Type C 3.0	2,2 Kg	38,3 cm	26 cm	2,9 cm	8 Go	DDR IV		\N	\N		t	t	2018-05-14 11:31:37.096115+02	2018-05-14 11:31:37.096115+02
3	4	1	4	1	2	1	1	\N	\N	PC Portable HP Omen 15-ax245nf 15.6"	1 Ethernet RJ-45 LAN Gigabit Ethernet 10/100/1000 intégré2 USB 3.1 Gen 11 USB 2.01 HDMI	2,2 Kg	38,2 cm	25,3 cm	2,45 cm	8 Go	SDRAM DDR4-2400		\N	\N		t	t	2018-05-14 11:31:37.186305+02	2018-05-14 11:31:37.186305+02
4	5	1	5	1	3	1	1	\N	\N	PC Portable HP Pavilion 15-cc519nf 15.6"	1 Ethernet RJ-45 LAN GbE 10/100/1000 intégré1 USB 3.1 Gen 1, transfert de données uniquement1 HDMI1 USB Type C 3.1 Gen 1 (transfert de données jusqu’à 5 Gbit/s)	1,91 Kg	37,8 cm	25,21 cm	1,99 cm	8 Go	SDRAM DDR4-2133 (1 x 8 Go)		\N	\N		t	t	2018-05-14 11:31:37.271943+02	2018-05-14 11:31:37.271943+02
5	5	1	6	1	4	1	1	\N	\N	PC Portable HP 15-bw008nf 15.6"	1 Ethernet RJ-452 USB 3.1 1e génération (transfert de données uniquement)1 USB 2.01 HDMI	2,1 Kg	38 cm	25,38 cm	2,38 cm	4 Go	SDRAM DDR4-1866 (1 x 4 Go)		\N	\N	LAN GbE 10/100/1000 intégré	t	t	2018-05-14 11:31:37.358382+02	2018-05-14 11:31:37.358382+02
6	6	1	4	1	5	1	3	\N	\N	PC Portable Asus ROG Strix GL753VE-GC198T 17.3"		3 Kg	41,5 cm	27,3 cm	3,2 cm	8 Go	DRAM DDR4	32 Go	\N	\N		t	t	2018-05-14 11:31:37.460897+02	2018-05-14 11:31:37.460897+02
7	7	1	7	1	6	1	1	\N	\N	PC Ultra-Portable Asus R414UV-WX302T 14"	1 Ethernet RJ-451 USB 3.01 VGA D-Sub1 USB 2.01 HDMI1 USB Type C 3.1 (Gen. 1)	1,75 Kg	34,8 cm	24,2 cm	2,76 cm	4 Go	DDR4	12 Go	\N	\N	LAN 10/1000 Mbps	t	t	2018-05-14 11:31:37.545793+02	2018-05-14 11:31:37.545793+02
8	5	1	8	1	7	1	1	\N	\N	PC Ultra-portable HP Pavilion 14-ba019nf 14" Tactile	1 USB Type C USB 3.1 Type-C™ 1e génération (transfert de données jusqu’à 5 Gbit/s);	1,63 Kg	33,48 cm	22,69 cm	1,99 cm	8 Go	SDRAM DDR4-2133 (1 x 8 Go)		\N	\N		t	t	2018-05-14 11:31:37.628879+02	2018-05-14 11:31:37.628879+02
9	5	1	5	1	8	1	1	\N	\N	PC Portable HP 17-bs503nf 17.3"	1 Ethernet RJ-45 LAN GbE 10/100/1000 intégré2 USB 3.1 Gen 1 (transfert de données uniquement)1 USB 2.01 HDMI	2,6 Kg	41,5 cm	27,8 cm	2,46 cm	12 Go	SDRAM DDR4-2133 (1 x 4 Go, 1 x 8 Go)		\N	\N		t	t	2018-05-14 11:31:37.71444+02	2018-05-14 11:31:37.71444+02
10	8	1	4	1	9	1	4	\N	\N	PC Portable Acer Predator 17X GX-792-713B 17.3"	1 DisplayPort1 Ethernet RJ-454 USB 3.0	4,55 Kg	42,3 cm	32,15 cm	4,49 cm	16 Go	DDR4		\N	\N		t	t	2018-05-14 11:31:37.817171+02	2018-05-14 11:31:37.817171+02
11	9	1	9	1	1	1	1	\N	\N	PC Portable HP 15-BS007NF 15.6"	1 Ethernet RJ-45 LAN GbE 10/100/1000 intégré2 USB 3.1 1e génération (transfert de données uniquement)1 USB 2.01 HDMI	2,1 Kg	38 cm	25,38 cm	2,38 cm	8 Go	SDRAM DDR4-2133		\N	\N		t	t	2018-05-14 11:31:37.887299+02	2018-05-14 11:31:37.887299+02
12	5	1	9	1	10	1	1	\N	\N	PC Portable HP 17-bs086nf 17.3"	1 Ethernet RJ-45 LAN GbE 10/100/1000 intégré2 USB 3.1 Gen 1 (transfert de données uniquement)1 USB 2.01 HDMI	2,6 Kg	41,5 cm	27,8 cm	2,46 cm	4 Go	SDRAM DDR4-2133 (1 x 4 Go)		\N	\N		t	t	2018-05-14 11:31:37.974164+02	2018-05-14 11:31:37.974164+02
13	7	1	9	1	11	1	1	\N	\N	PC Portable Asus R702UV-BX057T 17.3"	1 Ethernet RJ-451 USB 3.01 VGA2 USB 2.01 HDMI 1.41 USB Type C 3.1 (gen. 1)	2,1 Kg	41,1 cm	27 cm	2,27 cm	4 Go	DRAM DDR4	16 Go	\N	\N	LAN 10/100/1000 Mbps	t	t	2018-05-14 11:31:38.062328+02	2018-05-14 11:31:38.062328+02
14	10	1	8	1	12	1	1	\N	\N	PC Ultra-Portable Lenovo IdeaPad 320S-14IKB 14"	1 USB 3.01 USB 2.01 USB Type C	1,7 Kg	32,74 cm	23,65 cm	1,93 cm	4 Go			\N	\N		t	t	2018-05-14 11:31:38.148071+02	2018-05-14 11:31:38.148071+02
15	11	1	10	1	2	1	1	\N	\N	PC Portable Asus N705UD-GC104T 17.3"	1 Ethernet RJ-45 10/100/1000 Mbps1 USB 3.02 USB 2.01 HDMI1 USB Type C 3.1 Gen 1	2,1 Kg	41,1 cm	27 cm	2,1 cm	16 Go DRAM DDR4 8 Go x 2	DRAM DDR4	16 Go	\N	\N		t	t	2018-05-14 11:31:38.235917+02	2018-05-14 11:31:38.235917+02
16	11	1	7	1	13	1	1	\N	\N	PC Ultra-Portable Asus VivoBook S405UR-BV063T 14"	1 Ethernet RJ-45 10/100/1000 Mbps1 USB 3.02 USB 2.01 HDMI1 USB Type C 3.1 Gen 1	1,42 Kg	32,6 cm	22,6 cm	1,88 cm	4 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:31:38.322467+02	2018-05-14 11:31:38.322467+02
17	7	1	11	1	14	1	3	\N	\N	PC Portable Asus ROG Strix-GL503VM-FY055T 15.6" Gaming	1 Ethernet RJ-454 USB 3.01 HDMI 2.01 Mini DisplayPort1 USB Type C 3.1 (Gen. 1)	2,6 Kg	38,4 cm	26,2 cm	2,3 cm	8 Go	DRAM DDR4		\N	\N	LAN 10/100/1000 Mbps	t	t	2018-05-14 11:31:38.42489+02	2018-05-14 11:31:38.42489+02
18	12	1	12	1	15	1	5	\N	\N	LDLC Aurore CI3-8-S1H10						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:12.724987+02	2018-05-14 11:35:12.724987+02
19	13	1	12	1	15	1	5	\N	\N	LDLC Aurore CI3-8-S1H10-H10						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:12.834017+02	2018-05-14 11:35:12.834017+02
20	14	1	12	1	15	1	5	\N	\N	LDLC Aurore CI3-8-S1H10-P10						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:12.946943+02	2018-05-14 11:35:12.946943+02
21	12	1	13	1	15	1	5	\N	\N	LDLC Aurore CI5P-16-S2H20						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:13.055627+02	2018-05-14 11:35:13.055627+02
22	14	1	13	1	15	1	5	\N	\N	LDLC Aurore CI5P-16-S2H20-P10						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:13.163044+02	2018-05-14 11:35:13.163044+02
23	12	1	13	1	15	1	5	\N	\N	LDLC Aurore Ci5P-8-S5						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:13.269695+02	2018-05-14 11:35:13.269695+02
24	13	1	13	1	15	1	5	\N	\N	LDLC Aurore Ci5P-8-S5-H10						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:13.376403+02	2018-05-14 11:35:13.376403+02
25	14	1	13	1	15	1	5	\N	\N	LDLC Aurore Ci5P-8-S5-P10						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:13.479029+02	2018-05-14 11:35:13.479029+02
26	12	1	14	1	16	1	1	\N	\N	LDLC Aurore KZ5F-8-H10S						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:13.568431+02	2018-05-14 11:35:13.568431+02
27	12	1	15	1	16	1	1	\N	\N	LDLC Aurore TK3D-8-H10S1						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:13.667923+02	2018-05-14 11:35:13.667923+02
28	13	1	15	1	16	1	1	\N	\N	LDLC Aurore TK3D-8-H10S1-H10						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:13.763374+02	2018-05-14 11:35:13.763374+02
29	12	1	16	1	17	1	1	\N	\N	LDLC Bellone XK81B-16-H20S2						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:13.851066+02	2018-05-14 11:35:13.851066+02
30	14	1	16	1	17	1	1	\N	\N	LDLC Bellone XK81B-16-H20S2-P10						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:13.938752+02	2018-05-14 11:35:13.938752+02
31	12	1	16	1	17	1	1	\N	\N	LDLC Bellone XK81B-32-H40S4						32 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:14.028188+02	2018-05-14 11:35:14.028188+02
32	14	1	16	1	17	1	1	\N	\N	LDLC Bellone XK81B-32-H40S4-P10						32 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:14.11735+02	2018-05-14 11:35:14.11735+02
33	12	1	16	1	18	1	1	\N	\N	LDLC Bellone XK82B-32-H20S2						32 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:14.207525+02	2018-05-14 11:35:14.207525+02
34	14	1	16	1	18	1	1	\N	\N	LDLC Bellone XK82B-32-H20S2-P10						32 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:14.297633+02	2018-05-14 11:35:14.297633+02
35	12	1	16	1	18	1	1	\N	\N	LDLC Bellone XK82B-64-H40S4						64 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:14.386587+02	2018-05-14 11:35:14.386587+02
36	14	1	16	1	18	1	1	\N	\N	LDLC Bellone XK82B-64-H40S4-P10						64 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:14.478057+02	2018-05-14 11:35:14.478057+02
37	13	1	17	1	19	1	1	\N	\N	LDLC Mercure MH33-4SW						4 Go	DDR3	4 Go	\N	\N		t	t	2018-05-14 11:35:14.564687+02	2018-05-14 11:35:14.564687+02
38	13	1	18	1	19	1	1	\N	\N	LDLC Mercure MH34-4TW						4 Go	DDR3	4 Go	\N	\N		t	t	2018-05-14 11:35:14.652572+02	2018-05-14 11:35:14.652572+02
39	12	1	19	1	2	1	1	\N	\N	LDLC Saturne AK51B-I5-16-H20S4						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:14.743468+02	2018-05-14 11:35:14.743468+02
40	13	1	19	1	2	1	1	\N	\N	LDLC Saturne AK51B-I5-16-H20S4-H10						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:14.830885+02	2018-05-14 11:35:14.830885+02
41	12	1	19	1	2	1	1	\N	\N	LDLC Saturne AK51B-I5-8-H10S2						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:14.918637+02	2018-05-14 11:35:14.918637+02
42	13	1	19	1	2	1	1	\N	\N	LDLC Saturne AK51B-I5-8-H10S2-H10						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:15.005013+02	2018-05-14 11:35:15.005013+02
43	12	1	20	1	20	1	1	\N	\N	LDLC Saturne SK1-I3-4-S1						4 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:35:15.092153+02	2018-05-14 11:35:15.092153+02
44	12	1	12	1	15	1	5	\N	\N	LDLC Aurore Ci3-4-H20						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:15.198235+02	2018-05-14 11:35:15.198235+02
45	13	1	12	1	15	1	5	\N	\N	LDLC Aurore Ci3-4-H20-H10						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:15.297318+02	2018-05-14 11:35:15.297318+02
46	12	1	15	1	16	1	1	\N	\N	LDLC Aurore TK3D-4-S1						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:15.385379+02	2018-05-14 11:35:15.385379+02
47	13	1	15	1	16	1	1	\N	\N	LDLC Aurore TK3D-4-S1-H10						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:15.473011+02	2018-05-14 11:35:15.473011+02
48	12	1	19	1	2	1	1	\N	\N	LDLC Saturne AK51B-I5-16-H20S1						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:15.558601+02	2018-05-14 11:35:15.558601+02
49	13	1	19	1	2	1	1	\N	\N	LDLC Saturne AK51B-I5-16-H20S1-H10						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:15.642933+02	2018-05-14 11:35:15.642933+02
50	13	1	21	1	21	1	1	\N	\N	Acer Aspire 3 A315-21-645X						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:15.735025+02	2018-05-14 11:35:15.735025+02
51	13	1	21	1	21	1	1	\N	\N	Acer Aspire 3 A315-21-656R						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:15.824656+02	2018-05-14 11:35:15.824656+02
52	13	1	21	1	21	1	1	\N	\N	Acer Aspire 3 A315-21-66HG						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:15.91118+02	2018-05-14 11:35:15.91118+02
53	13	1	21	1	21	1	1	\N	\N	Acer Aspire 3 A315-21-67C7						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:15.997653+02	2018-05-14 11:35:15.997653+02
54	13	1	22	1	4	1	1	\N	\N	Acer Aspire 3 A315-21-97JA						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:16.086515+02	2018-05-14 11:35:16.086515+02
55	13	1	22	1	22	1	1	\N	\N	Acer Aspire 3 A315-21G-96NH						6 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:16.177409+02	2018-05-14 11:35:16.177409+02
56	13	1	23	1	19	1	1	\N	\N	Acer Aspire 3 A315-31-C389						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:16.266174+02	2018-05-14 11:35:16.266174+02
57	13	1	24	1	19	1	1	\N	\N	Acer Aspire 3 A315-31-P2QN						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:16.356041+02	2018-05-14 11:35:16.356041+02
58	13	1	25	1	20	1	1	\N	\N	Acer Aspire 5 515-51-370K Noir						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:16.441046+02	2018-05-14 11:35:16.441046+02
59	13	1	25	1	23	1	1	\N	\N	Acer Aspire 5 515-51G-337Y Noir						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:16.527586+02	2018-05-14 11:35:16.527586+02
60	13	1	25	1	20	1	1	\N	\N	Acer Aspire 5 A515-51-34LE Noir						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:16.614778+02	2018-05-14 11:35:16.614778+02
61	13	1	25	1	20	1	1	\N	\N	Acer Aspire 5 A515-51-35TL Noir						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:16.706547+02	2018-05-14 11:35:16.706547+02
62	13	1	25	1	20	1	1	\N	\N	Acer Aspire 5 A515-51-382L Noir						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:16.791999+02	2018-05-14 11:35:16.791999+02
63	13	1	25	1	20	1	1	\N	\N	Acer Aspire 5 A515-51-39PA Noir						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:16.875833+02	2018-05-14 11:35:16.875833+02
64	13	1	14	1	16	1	1	\N	\N	Acer Aspire 5 A515-51-55BQ Noir						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:16.966975+02	2018-05-14 11:35:16.966975+02
65	13	1	14	1	16	1	1	\N	\N	Acer Aspire 5 A515-51-5871 Noir						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:17.058149+02	2018-05-14 11:35:17.058149+02
66	13	1	25	1	3	1	1	\N	\N	Acer Aspire 5 A515-51G-32LL Noir						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:17.144069+02	2018-05-14 11:35:17.144069+02
67	13	1	14	1	3	1	1	\N	\N	Acer Aspire 5 A515-51G-526Y Noir						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:17.231613+02	2018-05-14 11:35:17.231613+02
68	13	1	14	1	24	1	1	\N	\N	Acer Aspire 5 A515-51G-52SZ						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:17.325184+02	2018-05-14 11:35:17.325184+02
69	13	1	14	1	23	1	1	\N	\N	Acer Aspire 5 A515-51G-538N						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:17.411599+02	2018-05-14 11:35:17.411599+02
70	13	1	14	1	3	1	1	\N	\N	Acer Aspire 5 A515-51G-57CP						6 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:17.501137+02	2018-05-14 11:35:17.501137+02
71	13	1	26	1	24	1	1	\N	\N	Acer Aspire 5 A515-51G-78AS Noir						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:17.588183+02	2018-05-14 11:35:17.588183+02
72	13	1	25	1	20	1	1	\N	\N	Acer Aspire 5 A517-51-30Y						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:17.677192+02	2018-05-14 11:35:17.677192+02
73	13	1	25	1	20	1	1	\N	\N	Acer Aspire 5 A517-51-33KJ						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:17.767274+02	2018-05-14 11:35:17.767274+02
74	13	1	25	1	20	1	1	\N	\N	Acer Aspire 5 A517-51-3827						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:17.859008+02	2018-05-14 11:35:17.859008+02
75	13	1	14	1	16	1	1	\N	\N	Acer Aspire 5 A517-51-5098						6 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:17.945199+02	2018-05-14 11:35:17.945199+02
76	13	1	25	1	23	1	1	\N	\N	Acer Aspire 5 A517-51G-39MT						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:18.031781+02	2018-05-14 11:35:18.031781+02
77	13	1	25	1	23	1	1	\N	\N	Acer Aspire 5 A517-51G-39YS						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:18.12322+02	2018-05-14 11:35:18.12322+02
78	13	1	27	1	23	1	1	\N	\N	Acer Aspire 5 A517-51G-50TQ						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:18.203734+02	2018-05-14 11:35:18.203734+02
79	13	1	27	1	24	1	1	\N	\N	Acer Aspire 5 A517-51G-51UU						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:18.294155+02	2018-05-14 11:35:18.294155+02
80	13	1	27	1	24	1	1	\N	\N	Acer Aspire 5 A517-51G-522G						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:18.380256+02	2018-05-14 11:35:18.380256+02
81	13	1	14	1	3	1	1	\N	\N	Acer Aspire 5 A517-51G-53K1						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:18.472306+02	2018-05-14 11:35:18.472306+02
82	13	1	28	1	24	1	1	\N	\N	Acer Aspire 5 A517-51G-86KE						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:18.562013+02	2018-05-14 11:35:18.562013+02
83	13	1	19	1	2	1	1	\N	\N	Acer Aspire 7 A715-71G-56YF Noir						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:18.651487+02	2018-05-14 11:35:18.651487+02
84	13	1	19	1	2	1	1	\N	\N	Acer Aspire 7 A715-71G-57JW Noir						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:18.744279+02	2018-05-14 11:35:18.744279+02
85	13	1	19	1	2	1	1	\N	\N	Acer Aspire 7 A715-71G-58TH Noir						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:18.835334+02	2018-05-14 11:35:18.835334+02
86	13	1	29	1	5	1	1	\N	\N	Acer Aspire 7 A715-71G-79YK						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:18.927287+02	2018-05-14 11:35:18.927287+02
87	13	1	19	1	5	1	1	\N	\N	Acer Aspire 7 A717-71G-54ZH Noir						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:19.013603+02	2018-05-14 11:35:19.013603+02
88	13	1	19	1	5	1	1	\N	\N	Acer Aspire 7 A717-71G-552V Noir						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:19.105632+02	2018-05-14 11:35:19.105632+02
89	13	1	19	1	2	1	1	\N	\N	Acer Aspire 7 A717-71G-584T Noir						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:19.19663+02	2018-05-14 11:35:19.19663+02
90	13	1	19	1	5	1	1	\N	\N	Acer Aspire 7 A717-71G-58P6 Noir						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:19.29082+02	2018-05-14 11:35:19.29082+02
91	13	1	29	1	25	1	1	\N	\N	Acer Aspire 7 A717-71G-73LN Noir						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:19.380277+02	2018-05-14 11:35:19.380277+02
92	13	1	30	1	26	1	1	\N	\N	Acer Aspire E5-523G-61ML						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:19.475574+02	2018-05-14 11:35:19.475574+02
93	13	1	31	1	3	1	1	\N	\N	Acer Aspire E5-575G-551M						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:19.561553+02	2018-05-14 11:35:19.561553+02
94	13	1	25	1	20	1	1	\N	\N	Acer Aspire E5-774-330R						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:19.661372+02	2018-05-14 11:35:19.661372+02
95	13	1	25	1	20	1	1	\N	\N	Acer Aspire E5-774-3798						4 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:19.754198+02	2018-05-14 11:35:19.754198+02
96	13	1	25	1	3	1	1	\N	\N	Acer Aspire E5-774G-33XK						4 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:19.844693+02	2018-05-14 11:35:19.844693+02
97	13	1	25	1	3	1	1	\N	\N	Acer Aspire E5-774G-33XK + Acer Notebook Starter Kit 17" OFFERT !						4 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:19.931473+02	2018-05-14 11:35:19.931473+02
98	13	1	31	1	3	1	1	\N	\N	Acer Aspire E5-774G-50TS						4 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:20.026261+02	2018-05-14 11:35:20.026261+02
99	13	1	31	1	27	1	1	\N	\N	Acer Aspire E5-774G-552X						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:20.115022+02	2018-05-14 11:35:20.115022+02
100	13	1	32	1	28	1	1	\N	\N	Acer Aspire ES1-523-24HN						4 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:20.203494+02	2018-05-14 11:35:20.203494+02
101	13	1	33	1	21	1	1	\N	\N	Acer Aspire ES1-523-625G						4 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:20.294271+02	2018-05-14 11:35:20.294271+02
102	13	1	25	1	20	1	1	\N	\N	Acer Aspire ES1-572-301M						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:20.380288+02	2018-05-14 11:35:20.380288+02
103	13	1	34	1	12	1	1	\N	\N	Acer Aspire ES1-731-P25X						4 Go	DDR3L (1.35V)	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:20.472817+02	2018-05-14 11:35:20.472817+02
104	13	1	35	1	29	1	1	\N	\N	Acer Aspire ES1-732-P9A1						4 Go		8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:20.559665+02	2018-05-14 11:35:20.559665+02
105	13	1	36	1	27	1	1	\N	\N	Acer Aspire V Nitro VN7-572G-55WV						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:20.650088+02	2018-05-14 11:35:20.650088+02
106	13	1	37	1	30	1	5	\N	\N	Acer Aspire V Nitro VN7-592G-512W Black Edition						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:20.757649+02	2018-05-14 11:35:20.757649+02
107	13	1	19	1	5	1	3	\N	\N	Acer Aspire V17 Nitro VN7-793G-58C9 Black Edition						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:20.859425+02	2018-05-14 11:35:20.859425+02
108	15	1	20	1	20	1	1	\N	\N	Acer Chromebook 14 CP5-471-32J3						8 Go			\N	\N		t	t	2018-05-14 11:35:20.949874+02	2018-05-14 11:35:20.949874+02
109	15	1	38	1	31	1	1	\N	\N	Acer Chromebook 14 CP5-471-C67N						4 Go			\N	\N		t	t	2018-05-14 11:35:21.043083+02	2018-05-14 11:35:21.043083+02
110	14	1	25	1	20	1	1	\N	\N	Acer Extensa 2540-32UM						4 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:21.128285+02	2018-05-14 11:35:21.128285+02
111	14	1	25	1	20	1	1	\N	\N	Acer Extensa 2540-32WS						4 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:21.221627+02	2018-05-14 11:35:21.221627+02
112	13	1	19	1	5	1	3	\N	\N	Acer Nitro 5  AN515-51-56UX						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:21.32574+02	2018-05-14 11:35:21.32574+02
113	13	1	19	1	2	1	3	\N	\N	Acer Nitro 5 AN515-51-50CD						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:21.425622+02	2018-05-14 11:35:21.425622+02
114	13	1	19	1	2	1	3	\N	\N	Acer Nitro 5 AN515-51-50DX						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:21.531665+02	2018-05-14 11:35:21.531665+02
115	13	1	19	1	2	1	3	\N	\N	Acer Nitro 5 AN515-51-53BW						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:21.639478+02	2018-05-14 11:35:21.639478+02
116	13	1	19	1	2	1	3	\N	\N	Acer Nitro 5 AN515-51-53S2						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:21.744844+02	2018-05-14 11:35:21.744844+02
117	13	1	29	1	5	1	3	\N	\N	Acer Nitro 5 AN515-51-7088						6 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:21.850517+02	2018-05-14 11:35:21.850517+02
118	13	1	29	1	5	1	3	\N	\N	Acer Nitro 5 AN515-51-72CL						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:21.951099+02	2018-05-14 11:35:21.951099+02
119	13	1	19	1	25	1	3	\N	\N	Acer Predator 15 G9-593-523M						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:22.052354+02	2018-05-14 11:35:22.052354+02
120	13	1	29	1	25	1	3	\N	\N	Acer Predator 15 G9-593-72YL						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:22.157343+02	2018-05-14 11:35:22.157343+02
121	13	1	29	1	32	1	3	\N	\N	Acer Predator 15 G9-593-77VQ						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:22.259063+02	2018-05-14 11:35:22.259063+02
122	13	1	29	1	32	1	3	\N	\N	Acer Predator 15 G9-593-79Q4						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:22.364883+02	2018-05-14 11:35:22.364883+02
123	13	1	13	1	25	1	5	\N	\N	Acer Predator 17 G9-793-55ZQ						8 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:22.467261+02	2018-05-14 11:35:22.467261+02
124	13	1	29	1	32	1	3	\N	\N	Acer Predator 17 G9-793-720A						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:22.573159+02	2018-05-14 11:35:22.573159+02
125	13	1	29	1	25	1	3	\N	\N	Acer Predator 17 G9-793-75EU						8 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:22.675794+02	2018-05-14 11:35:22.675794+02
126	13	1	29	1	32	1	3	\N	\N	Acer Predator 17 G9-793-79QF						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:22.778691+02	2018-05-14 11:35:22.778691+02
127	13	1	39	1	17	1	3	\N	\N	Acer Predator 17X GX-792-713B						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:22.88331+02	2018-05-14 11:35:22.88331+02
128	13	1	40	1	17	1	3	\N	\N	Acer Predator 17X GX-792-78VQ						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:23.003513+02	2018-05-14 11:35:23.003513+02
129	13	1	29	1	25	1	1	\N	\N	Acer Predator Helios 300 G3-572-72MT						16 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:23.093151+02	2018-05-14 11:35:23.093151+02
130	13	1	29	1	25	1	1	\N	\N	Acer Predator Helios 300 G3-572-750M						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:23.183923+02	2018-05-14 11:35:23.183923+02
131	13	1	29	1	5	1	1	\N	\N	Acer Predator Helios 300 G3-572-7884						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:23.268997+02	2018-05-14 11:35:23.268997+02
132	13	1	19	1	5	1	1	\N	\N	Acer Predator Helios 300 PH317-51-52ZD						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:23.357305+02	2018-05-14 11:35:23.357305+02
133	13	1	29	1	5	1	1	\N	\N	Acer Predator Helios 300 PH317-51-72VU						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:23.443037+02	2018-05-14 11:35:23.443037+02
134	13	1	29	1	5	1	1	\N	\N	Acer Predator Helios 300 PH317-51-73XK						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:23.529111+02	2018-05-14 11:35:23.529111+02
135	13	1	29	1	25	1	1	\N	\N	Acer Predator Helios 300 PH317-51-779L						16 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:23.618158+02	2018-05-14 11:35:23.618158+02
136	13	1	29	1	25	1	1	\N	\N	Acer Predator Helios 300 PH317-51-7815						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:23.704485+02	2018-05-14 11:35:23.704485+02
137	13	1	39	1	17	1	3	\N	\N	Acer Predator Triton 700 PT715-51-709K						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:23.807157+02	2018-05-14 11:35:23.807157+02
138	13	1	17	1	19	1	1	\N	\N	Acer Spin 1 SP113-31-C7F5						4 Go	DDR3L (1.35V)		\N	\N		t	t	2018-05-14 11:35:23.898286+02	2018-05-14 11:35:23.898286+02
139	13	1	25	1	20	1	1	\N	\N	Acer Spin 3 SP314-51-301U						4 Go	DDR4		\N	\N		t	t	2018-05-14 11:35:24.001227+02	2018-05-14 11:35:24.001227+02
140	13	1	27	1	33	1	1	\N	\N	Acer Spin 3 SP314-51-58BE						8 Go	DDR4		\N	\N		t	t	2018-05-14 11:35:24.08926+02	2018-05-14 11:35:24.08926+02
141	13	1	41	1	20	1	1	\N	\N	Acer Spin 5 SP513-51-33RB						4 Go	DDR4		\N	\N		t	t	2018-05-14 11:35:24.177167+02	2018-05-14 11:35:24.177167+02
142	13	1	14	1	16	1	1	\N	\N	Acer Spin 5 SP513-51-5954						4 Go	DDR4		\N	\N		t	t	2018-05-14 11:35:24.26096+02	2018-05-14 11:35:24.26096+02
143	13	1	42	1	34	1	1	\N	\N	Acer Spin 7 SP714-51-M37P						8 Go			\N	\N		t	t	2018-05-14 11:35:24.350491+02	2018-05-14 11:35:24.350491+02
144	16	1	17	1	19	1	1	\N	\N	Acer Swift 1 SF113-31-C7UK Argent						4 Go	DDR3L (1.35V)	4 Go	\N	\N		t	t	2018-05-14 11:35:24.441266+02	2018-05-14 11:35:24.441266+02
145	13	1	24	1	29	1	1	\N	\N	Acer Swift 1 SF113-31-P0ZF Or						4 Go	DDR3L (1.35V)	4 Go	\N	\N		t	t	2018-05-14 11:35:24.527034+02	2018-05-14 11:35:24.527034+02
146	13	1	24	1	29	1	1	\N	\N	Acer Swift 1 SF113-31-P14U Or						4 Go	DDR3L (1.35V)	4 Go	\N	\N		t	t	2018-05-14 11:35:24.611996+02	2018-05-14 11:35:24.611996+02
147	13	1	24	1	29	1	1	\N	\N	Acer Swift 1 SF113-31-P1CP Rose						4 Go	DDR3L (1.35V)	4 Go	\N	\N		t	t	2018-05-14 11:35:24.703459+02	2018-05-14 11:35:24.703459+02
148	13	1	24	1	29	1	1	\N	\N	Acer Swift 1 SF113-31-P3P0 Argent						4 Go	DDR3L (1.35V)	4 Go	\N	\N		t	t	2018-05-14 11:35:24.792605+02	2018-05-14 11:35:24.792605+02
149	13	1	24	1	29	1	1	\N	\N	Acer Swift 1 SF113-31-P6VV Argent						4 Go	DDR3L (1.35V)	4 Go	\N	\N		t	t	2018-05-14 11:35:24.880749+02	2018-05-14 11:35:24.880749+02
150	13	1	41	1	16	1	1	\N	\N	Acer Swift 3 SF314-51-37B2 Argent						8 Go			\N	\N		t	t	2018-05-14 11:35:24.973786+02	2018-05-14 11:35:24.973786+02
151	13	1	41	1	20	1	1	\N	\N	Acer Swift 3 SF314-51-39ZJ Argent						4 Go			\N	\N		t	t	2018-05-14 11:35:25.06477+02	2018-05-14 11:35:25.06477+02
152	13	1	31	1	16	1	1	\N	\N	Acer Swift 3 SF314-51-56LK Argent						4 Go		4 Go	\N	\N		t	t	2018-05-14 11:35:25.156113+02	2018-05-14 11:35:25.156113+02
153	13	1	15	1	16	1	1	\N	\N	Acer Swift 3 SF314-52-305B Gris						4 Go	DDR4		\N	\N		t	t	2018-05-14 11:35:25.247409+02	2018-05-14 11:35:25.247409+02
154	13	1	15	1	16	1	1	\N	\N	Acer Swift 3 SF314-52-38Z7 Gris						4 Go	DDR4		\N	\N		t	t	2018-05-14 11:35:25.338085+02	2018-05-14 11:35:25.338085+02
155	13	1	15	1	16	1	1	\N	\N	Acer Swift 3 SF314-52-396X Rose						4 Go	DDR4		\N	\N		t	t	2018-05-14 11:35:25.426139+02	2018-05-14 11:35:25.426139+02
156	13	1	15	1	16	1	1	\N	\N	Acer Swift 3 SF314-52-39VU Bleu						4 Go	DDR4		\N	\N		t	t	2018-05-14 11:35:25.516616+02	2018-05-14 11:35:25.516616+02
157	13	1	14	1	16	1	1	\N	\N	Acer Swift 3 SF314-52-5451 Gris						8 Go	DDR4		\N	\N		t	t	2018-05-14 11:35:25.607445+02	2018-05-14 11:35:25.607445+02
158	13	1	14	1	16	1	1	\N	\N	Acer Swift 3 SF314-52-54LU Bleu						4 Go	DDR4		\N	\N		t	t	2018-05-14 11:35:25.700596+02	2018-05-14 11:35:25.700596+02
159	13	1	14	1	16	1	1	\N	\N	Acer Swift 3 SF314-52-59GC Gris						4 Go	DDR4		\N	\N		t	t	2018-05-14 11:35:25.7842+02	2018-05-14 11:35:25.7842+02
160	13	1	43	1	16	1	1	\N	\N	Acer Swift 3 SF314-52-70AR Gris						8 Go	DDR4		\N	\N		t	t	2018-05-14 11:35:25.873774+02	2018-05-14 11:35:25.873774+02
161	13	1	14	1	24	1	1	\N	\N	Acer Swift 3 SF314-52G-52M7 Gris						4 Go	DDR4		\N	\N		t	t	2018-05-14 11:35:25.966735+02	2018-05-14 11:35:25.966735+02
162	13	1	43	1	24	1	1	\N	\N	Acer Swift 3 SF314-52G-72R4 Gris						4 Go	DDR4		\N	\N		t	t	2018-05-14 11:35:26.057407+02	2018-05-14 11:35:26.057407+02
163	13	1	14	1	24	1	1	\N	\N	Acer Swift 3 SF315-51G-54NE Gris						8 Go	DDR4		\N	\N		t	t	2018-05-14 11:35:26.151284+02	2018-05-14 11:35:26.151284+02
164	13	1	28	1	24	1	1	\N	\N	Acer Swift 3 SF315-51G-87HR Gris						8 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:35:26.242038+02	2018-05-14 11:35:26.242038+02
165	13	1	27	1	33	1	1	\N	\N	Acer Swift 5 SF514-52T-56JV Bleu						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:35:26.332898+02	2018-05-14 11:35:26.332898+02
166	13	1	28	1	33	1	1	\N	\N	Acer Swift 5 SF514-52T-8240 Bleu						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:35:26.421511+02	2018-05-14 11:35:26.421511+02
167	13	1	28	1	33	1	1	\N	\N	Acer Swift 5 SF514-52T-85ZX Bleu						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:35:26.511821+02	2018-05-14 11:35:26.511821+02
168	14	1	44	1	34	1	1	\N	\N	Acer Swift 7 SF713-51-M8EJ Or						8 Go			\N	\N		t	t	2018-05-14 11:35:26.599328+02	2018-05-14 11:35:26.599328+02
169	14	1	25	1	20	1	1	\N	\N	Acer TravelMate P238-M-32E6						4 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:26.690681+02	2018-05-14 11:35:26.690681+02
170	14	1	25	1	20	1	1	\N	\N	Acer TravelMate P238-M-37HW						4 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:26.78255+02	2018-05-14 11:35:26.78255+02
171	14	1	45	1	20	1	1	\N	\N	Acer TravelMate P238-M-531H						4 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:26.874237+02	2018-05-14 11:35:26.874237+02
172	14	1	45	1	20	1	1	\N	\N	Acer TravelMate P238-M-560Q						8 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:26.967775+02	2018-05-14 11:35:26.967775+02
173	14	1	20	1	20	1	1	\N	\N	Acer TravelMate P259-M-30YX						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:27.05768+02	2018-05-14 11:35:27.05768+02
174	14	1	45	1	20	1	1	\N	\N	Acer TravelMate P259-M-50DZ						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:27.150016+02	2018-05-14 11:35:27.150016+02
175	14	1	46	1	20	1	1	\N	\N	Acer TravelMate P259-M-76PC						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:35:27.240197+02	2018-05-14 11:35:27.240197+02
176	14	1	45	1	20	1	1	\N	\N	Acer TravelMate X349-M-580J						8 Go	DDR4	8 Go	\N	\N		t	t	2018-05-14 11:35:27.332568+02	2018-05-14 11:35:27.332568+02
177	14	1	46	1	20	1	1	\N	\N	Acer TravelMate X349-M-761F						8 Go	DDR4	8 Go	\N	\N		t	t	2018-05-14 11:35:27.418916+02	2018-05-14 11:35:27.418916+02
178	17	1	47	1	35	1	1	\N	\N	Acer TravelMate P236-M-31SW						4 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:22.552314+02	2018-05-14 11:38:22.552314+02
179	14	1	45	1	20	1	1	\N	\N	Acer TravelMate P259-M-52MP						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:22.646218+02	2018-05-14 11:38:22.646218+02
180	14	1	25	1	20	1	1	\N	\N	Acer TravelMate P278-M-30JM						4 Go	DDR3L (1.35V)	16 Go	\N	\N		t	t	2018-05-14 11:38:22.734859+02	2018-05-14 11:38:22.734859+02
181	14	1	45	1	36	1	1	\N	\N	Acer TravelMate P278-MG-58R2						4 Go	DDR3L (1.35V)	16 Go	\N	\N		t	t	2018-05-14 11:38:22.822679+02	2018-05-14 11:38:22.822679+02
182	13	1	40	1	32	1	3	\N	\N	AORUS X5 v7 C4K0NW10-FR						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:22.926918+02	2018-05-14 11:38:22.926918+02
183	13	1	48	1	37	1	5	\N	\N	AORUS X5S v5 KAMW10-FR Edition limitée Camouflage						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:23.030388+02	2018-05-14 11:38:23.030388+02
184	13	1	40	1	32	1	3	\N	\N	AORUS X7 v7 K220NW10-FR						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:23.135116+02	2018-05-14 11:38:23.135116+02
185	13	1	40	1	38	1	3	\N	\N	AORUS X9 v7 K220NW10-FR						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:23.237822+02	2018-05-14 11:38:23.237822+02
186	13	1	40	1	17	1	3	\N	\N	AORUS X7 DT v7 K220NW10-FR						32 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:23.342957+02	2018-05-14 11:38:23.342957+02
187	14	1	45	1	20	1	1	\N	\N	ASUS B8430UA-FA0833R						8 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:23.433413+02	2018-05-14 11:38:23.433413+02
188	14	1	43	1	16	1	1	\N	\N	ASUS B9440UA (90NX0151-M02370)						16 Go	DDR3	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:23.520052+02	2018-05-14 11:38:23.520052+02
189	14	1	31	1	16	1	1	\N	\N	ASUS B9440UA (90NX0151-M02540)						8 Go	DDR3	8 Go	\N	\N		t	t	2018-05-14 11:38:23.609635+02	2018-05-14 11:38:23.609635+02
190	14	1	31	1	16	1	1	\N	\N	ASUS B9440UA-GV0046RB						8 Go	DDR3	8 Go	\N	\N		t	t	2018-05-14 11:38:23.696156+02	2018-05-14 11:38:23.696156+02
191	13	1	24	1	29	1	1	\N	\N	ASUS EeeBook E402NA-GA073T Bleu						4 Go	DDR3	4 Go	\N	\N	10/100 Mbps	t	t	2018-05-14 11:38:23.785176+02	2018-05-14 11:38:23.785176+02
192	13	1	49	1	12	1	1	\N	\N	ASUS EeeBook E403SA-WX0004T						2 Go	DDR3		\N	\N		t	t	2018-05-14 11:38:23.873846+02	2018-05-14 11:38:23.873846+02
193	16	1	50	1	39	1	1	\N	\N	ASUS EeeBook E406SA-BV005TS						4 Go	DDR3	4 Go	\N	\N		t	t	2018-05-14 11:38:23.963267+02	2018-05-14 11:38:23.963267+02
194	13	1	51	1	39	1	1	\N	\N	ASUS EeeBook X206HA-FD0077T Bleu						4 Go	DDR3	4 Go	\N	\N		t	t	2018-05-14 11:38:24.052281+02	2018-05-14 11:38:24.052281+02
195	13	1	51	1	39	1	1	\N	\N	ASUS EeeBook X206HA-FD0099T Or						4 Go	DDR3	4 Go	\N	\N		t	t	2018-05-14 11:38:24.142987+02	2018-05-14 11:38:24.142987+02
196	13	1	52	1	40	1	1	\N	\N	ASUS F541SA-XX457T						4 Go	DDR3L (1.35V)	4 Go	\N	\N	10/100 Mbps	t	t	2018-05-14 11:38:24.235244+02	2018-05-14 11:38:24.235244+02
197	13	1	24	1	41	1	1	\N	\N	ASUS F751NV-TY014T Blanc						4 Go	DDR3L (1.35V)	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:24.32392+02	2018-05-14 11:38:24.32392+02
198	13	1	48	1	25	1	5	\N	\N	ASUS FX502VM-DM114T						8 Go	DDR4	24 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:24.428566+02	2018-05-14 11:38:24.428566+02
199	18	1	29	1	25	1	3	\N	\N	ASUS FX502VM-DM572						8 Go	DDR4	24 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:24.533769+02	2018-05-14 11:38:24.533769+02
200	13	1	19	1	2	1	3	\N	\N	ASUS FX503VD-DM051T						6 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:24.638823+02	2018-05-14 11:38:24.638823+02
201	18	1	19	1	2	1	3	\N	\N	ASUS FX553VD-DM344						6 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:24.743547+02	2018-05-14 11:38:24.743547+02
202	13	1	29	1	5	1	3	\N	\N	ASUS FX553VE-DM209T						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:24.847546+02	2018-05-14 11:38:24.847546+02
203	18	1	29	1	5	1	3	\N	\N	ASUS FX553VE-DM353						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:24.952633+02	2018-05-14 11:38:24.952633+02
204	13	1	19	1	2	1	3	\N	\N	ASUS FX753VD-GC261T						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:25.056071+02	2018-05-14 11:38:25.056071+02
205	13	1	14	1	3	1	1	\N	\N	ASUS K401UQ-FA079T						4 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:25.151232+02	2018-05-14 11:38:25.151232+02
206	13	1	45	1	42	1	1	\N	\N	ASUS K456UB-WX049T						8 Go	DDR3L (1.35V)		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:25.240277+02	2018-05-14 11:38:25.240277+02
207	13	1	46	1	30	1	1	\N	\N	ASUS K501UW-DM013T						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:25.329711+02	2018-05-14 11:38:25.329711+02
208	13	1	31	1	3	1	1	\N	\N	ASUS K756UQ-TY277T						4 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:25.417095+02	2018-05-14 11:38:25.417095+02
209	13	1	31	1	41	1	1	\N	\N	ASUS K756UV-TY269T						6 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:25.506647+02	2018-05-14 11:38:25.506647+02
210	16	1	17	1	19	1	1	\N	\N	ASUS Laptop TP202NA-EH008TS						4 Go	DDR3L (1.35V)	4 Go	\N	\N		t	t	2018-05-14 11:38:25.59532+02	2018-05-14 11:38:25.59532+02
211	14	1	25	1	20	1	1	\N	\N	ASUS P1400UA-BV739R						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:25.681253+02	2018-05-14 11:38:25.681253+02
212	14	1	25	1	20	1	1	\N	\N	ASUS P1400UA-BV752R						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:25.768363+02	2018-05-14 11:38:25.768363+02
213	14	1	15	1	16	1	1	\N	\N	ASUS P1501UA-DM496R						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:25.856996+02	2018-05-14 11:38:25.856996+02
214	14	1	27	1	33	1	1	\N	\N	ASUS P1501UA-DM598R						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:25.945338+02	2018-05-14 11:38:25.945338+02
215	14	1	15	1	16	1	1	\N	\N	ASUS P1501UA-GQ495R						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:26.034619+02	2018-05-14 11:38:26.034619+02
216	14	1	15	1	16	1	1	\N	\N	ASUS P1501UA-GQ502R						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:26.121166+02	2018-05-14 11:38:26.121166+02
217	14	1	27	1	33	1	1	\N	\N	ASUS P1501UA-GQ599R						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:26.211135+02	2018-05-14 11:38:26.211135+02
218	14	1	28	1	43	1	1	\N	\N	ASUS P1501UR-DM473R						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:26.301717+02	2018-05-14 11:38:26.301717+02
219	14	1	15	1	16	1	1	\N	\N	ASUS P1510UA-GQ280R						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:26.388098+02	2018-05-14 11:38:26.388098+02
220	14	1	15	1	16	1	1	\N	\N	ASUS P1510UA-GQ467R						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:26.477236+02	2018-05-14 11:38:26.477236+02
221	14	1	15	1	16	1	1	\N	\N	ASUS P1700UA-BX286R						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:26.569135+02	2018-05-14 11:38:26.569135+02
222	14	1	27	1	16	1	1	\N	\N	ASUS P1700UA-BX298R						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:26.657707+02	2018-05-14 11:38:26.657707+02
223	14	1	28	1	41	1	1	\N	\N	ASUS P1700UV-GC250R						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:26.746437+02	2018-05-14 11:38:26.746437+02
224	14	1	27	1	41	1	1	\N	\N	ASUS P1700UV-GC256R						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:26.835284+02	2018-05-14 11:38:26.835284+02
225	14	1	45	1	20	1	1	\N	\N	ASUS P2530UA-DM0179RB						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:26.92436+02	2018-05-14 11:38:26.92436+02
226	14	1	25	1	20	1	1	\N	\N	ASUS P2530UA-DM1264R						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:27.011012+02	2018-05-14 11:38:27.011012+02
227	14	1	45	1	20	1	1	\N	\N	ASUS P2530UA-XO0651R						4 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:27.107059+02	2018-05-14 11:38:27.107059+02
228	19	1	53	1	44	1	6	\N	\N	ASUS P2710JA-T2032G Noir						4 Go	DDR3L (1.35V)	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:27.212386+02	2018-05-14 11:38:27.212386+02
229	13	1	46	1	3	1	1	\N	\N	ASUS R415UQ-FR014T						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:27.298858+02	2018-05-14 11:38:27.298858+02
230	13	1	54	1	31	1	1	\N	\N	ASUS R418UA-BV773T						6 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:27.38782+02	2018-05-14 11:38:27.38782+02
231	13	1	55	1	27	1	6	\N	\N	ASUS R510JX-DM225T						6 Go	DDR3L (1.35V)		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:27.492079+02	2018-05-14 11:38:27.492079+02
232	13	1	47	1	36	1	1	\N	\N	ASUS R540LJ-DM502T						4 Go	DDR3L (1.35V)	8 Go	\N	\N	10/100 Mbps	t	t	2018-05-14 11:38:27.580855+02	2018-05-14 11:38:27.580855+02
233	13	1	14	1	16	1	1	\N	\N	ASUS R540UA-GO033T						4 Go	DDR4	12 Go	\N	\N		t	t	2018-05-14 11:38:27.672961+02	2018-05-14 11:38:27.672961+02
234	13	1	14	1	41	1	1	\N	\N	ASUS R540UV-DM025T						4 Go	DDR4	12 Go	\N	\N		t	t	2018-05-14 11:38:27.762109+02	2018-05-14 11:38:27.762109+02
235	13	1	27	1	23	1	1	\N	\N	ASUS R542UF-DM179T						6 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:27.848751+02	2018-05-14 11:38:27.848751+02
236	13	1	31	1	43	1	1	\N	\N	ASUS R542UR-DM150T						4 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:27.939663+02	2018-05-14 11:38:27.939663+02
237	13	1	31	1	43	1	1	\N	\N	ASUS R542UR-DM153T						4 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:28.030315+02	2018-05-14 11:38:28.030315+02
238	13	1	31	1	43	1	1	\N	\N	ASUS R542UR-DM224T						6 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:28.117009+02	2018-05-14 11:38:28.117009+02
239	13	1	14	1	3	1	1	\N	\N	ASUS R558UQ-DM682T						4 Go	DDR4	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:28.210508+02	2018-05-14 11:38:28.210508+02
240	13	1	26	1	43	1	1	\N	\N	ASUS R558UR-DM511T						6 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:28.302003+02	2018-05-14 11:38:28.302003+02
241	13	1	14	1	43	1	1	\N	\N	ASUS R558UR-DM567T						4 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:28.389614+02	2018-05-14 11:38:28.389614+02
242	13	1	56	1	16	1	1	\N	\N	ASUS R702UA-BX069T						6 Go	DDR4	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:28.479021+02	2018-05-14 11:38:28.479021+02
243	13	1	25	1	16	1	1	\N	\N	ASUS R702UA-BX095T						6 Go	DDR4	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:28.571832+02	2018-05-14 11:38:28.571832+02
244	13	1	14	1	16	1	1	\N	\N	ASUS R702UA-GC221T						4 Go	DDR4	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:28.659791+02	2018-05-14 11:38:28.659791+02
245	13	1	25	1	16	1	1	\N	\N	ASUS R702UA-GC373T						6 Go	DDR4	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:28.749377+02	2018-05-14 11:38:28.749377+02
246	13	1	27	1	23	1	1	\N	\N	ASUS R702UF-GC043T						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:28.836491+02	2018-05-14 11:38:28.836491+02
247	13	1	54	1	41	1	1	\N	\N	ASUS R702UV-BX109T						4 Go	DDR4	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:28.924597+02	2018-05-14 11:38:28.924597+02
248	13	1	57	1	41	1	1	\N	\N	ASUS R702UV-BX138T						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:29.014389+02	2018-05-14 11:38:29.014389+02
249	13	1	54	1	41	1	1	\N	\N	ASUS R702UV-BX196T						4 Go	DDR4	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:29.10619+02	2018-05-14 11:38:29.10619+02
250	13	1	56	1	41	1	1	\N	\N	ASUS R702UV-GC192T						4 Go	DDR4	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:29.194797+02	2018-05-14 11:38:29.194797+02
251	13	1	40	1	17	1	7	\N	\N	ASUS ROG Chimera G701VIK-BA044T						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:29.297055+02	2018-05-14 11:38:29.297055+02
252	13	1	40	1	17	1	7	\N	\N	ASUS ROG Chimera G701VIK-GB046T						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:29.4038+02	2018-05-14 11:38:29.4038+02
253	13	1	40	1	17	1	7	\N	\N	ASUS ROG Chimera G703VI-E5011T						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:29.508947+02	2018-05-14 11:38:29.508947+02
254	13	1	29	1	17	1	7	\N	\N	ASUS ROG Chimera G703VI-E5046T						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:29.612435+02	2018-05-14 11:38:29.612435+02
255	13	1	29	1	32	1	7	\N	\N	ASUS ROG Chimera G752VS-BA548T						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:29.717028+02	2018-05-14 11:38:29.717028+02
256	13	1	29	1	32	1	7	\N	\N	ASUS ROG G752VS(KBL)-BA513T						8 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:29.82185+02	2018-05-14 11:38:29.82185+02
257	14	1	29	1	2	1	3	\N	\N	ASUS ROG Station 15 GL503VD-FY036R						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:29.924641+02	2018-05-14 11:38:29.924641+02
258	13	1	58	1	25	1	5	\N	\N	ASUS ROG Strix G702VM-GC072T						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:30.028553+02	2018-05-14 11:38:30.028553+02
259	13	1	29	1	25	1	3	\N	\N	ASUS ROG STRIX GL502VM-FY534T						8 Go	DDR4	24 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:30.13906+02	2018-05-14 11:38:30.13906+02
260	13	1	29	1	25	1	3	\N	\N	ASUS ROG STRIX GL502VM-GZ580T						8 Go	DDR4	24 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:30.239058+02	2018-05-14 11:38:30.239058+02
261	13	1	29	1	32	1	3	\N	\N	ASUS ROG STRIX GL502VS-GZ227T						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:30.342587+02	2018-05-14 11:38:30.342587+02
262	13	1	29	1	32	1	3	\N	\N	ASUS ROG STRIX GL502VS-GZ422T						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:30.446148+02	2018-05-14 11:38:30.446148+02
263	13	1	29	1	32	1	3	\N	\N	ASUS ROG STRIX GL502VS-GZ423T						24 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:30.550647+02	2018-05-14 11:38:30.550647+02
264	13	1	19	1	2	1	3	\N	\N	ASUS ROG STRIX GL503VD-FY005T						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:30.657855+02	2018-05-14 11:38:30.657855+02
265	13	1	29	1	2	1	1	\N	\N	ASUS ROG STRIX GL553VD-DM067T						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:30.75128+02	2018-05-14 11:38:30.75128+02
266	13	1	29	1	2	1	1	\N	\N	ASUS ROG STRIX GL553VD-DM068T						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:30.843338+02	2018-05-14 11:38:30.843338+02
267	13	1	19	1	2	1	1	\N	\N	ASUS ROG STRIX GL553VD-DM287T						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:30.93197+02	2018-05-14 11:38:30.93197+02
268	13	1	59	1	45	1	8	\N	\N	ASUS ROG Strix GL702ZC-GC201T						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:31.038179+02	2018-05-14 11:38:31.038179+02
269	13	1	29	1	2	1	3	\N	\N	ASUS ROG STRIX GL703VD-GC040T						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:31.14382+02	2018-05-14 11:38:31.14382+02
270	13	1	29	1	25	1	3	\N	\N	ASUS ROG STRIX GL703VM-GC105T						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:31.250363+02	2018-05-14 11:38:31.250363+02
271	13	1	19	1	2	1	3	\N	\N	ASUS ROG STRIX GL753VD-GC197T						6 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:31.354499+02	2018-05-14 11:38:31.354499+02
272	13	1	29	1	5	1	3	\N	\N	ASUS ROG STRIX GL753VE-GC055T						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:31.458636+02	2018-05-14 11:38:31.458636+02
273	13	1	29	1	2	1	3	\N	\N	ASUS ROG STRIX HERO Edition GL503VD-GZ149T						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:31.581589+02	2018-05-14 11:38:31.581589+02
274	13	1	29	1	25	1	3	\N	\N	ASUS ROG STRIX SCAR Edition GL503VM-ED033T						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:31.684088+02	2018-05-14 11:38:31.684088+02
275	13	1	29	1	32	1	3	\N	\N	ASUS ROG STRIX SCAR Edition GL503VS-EI005T						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:31.78924+02	2018-05-14 11:38:31.78924+02
276	13	1	29	1	17	1	3	\N	\N	ASUS ROG Zephyrus GX501VI-ULTIMATE-01						16 Go	DDR4	24 Go	\N	\N		t	t	2018-05-14 11:38:31.892222+02	2018-05-14 11:38:31.892222+02
277	13	1	29	1	32	1	3	\N	\N	ASUS ROG Zephyrus GX501VS-GZ024T						16 Go	DDR4	24 Go	\N	\N		t	t	2018-05-14 11:38:32.006669+02	2018-05-14 11:38:32.006669+02
278	18	1	29	1	2	1	1	\N	\N	ASUS STRIX GL553VD-FY009						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:32.098311+02	2018-05-14 11:38:32.098311+02
279	13	1	60	1	12	1	1	\N	\N	ASUS Transformer Book T100HA-FU029T						4 Go			\N	\N		t	t	2018-05-14 11:38:32.188479+02	2018-05-14 11:38:32.188479+02
280	13	1	61	1	12	1	1	\N	\N	ASUS Transformer Book T101HA-GR005T Gris avec clavier						2 Go			\N	\N		t	t	2018-05-14 11:38:32.275715+02	2018-05-14 11:38:32.275715+02
281	14	1	61	1	12	1	1	\N	\N	ASUS Transformer Book T101HA-GR029RB Gris avec clavier						4 Go	DDR3L (1.35V)		\N	\N		t	t	2018-05-14 11:38:32.364818+02	2018-05-14 11:38:32.364818+02
282	14	1	61	1	12	1	1	\N	\N	ASUS Transformer Book T101HA-GR030RB Gris avec clavier						4 Go	DDR3L (1.35V)		\N	\N		t	t	2018-05-14 11:38:32.451375+02	2018-05-14 11:38:32.451375+02
283	13	1	61	1	12	1	1	\N	\N	ASUS Transformer Book T101HA-GR041T Gris avec clavier						4 Go	DDR3		\N	\N		t	t	2018-05-14 11:38:32.541835+02	2018-05-14 11:38:32.541835+02
284	14	1	62	1	46	1	1	\N	\N	ASUS Transformer Book T302CA-FL013R + Clavier						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:32.633273+02	2018-05-14 11:38:32.633273+02
285	13	1	54	1	31	1	1	\N	\N	ASUS VivoBook 14 X405UA-BM519T						4 Go	DDR4	4 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:32.722077+02	2018-05-14 11:38:32.722077+02
286	13	1	27	1	33	1	1	\N	\N	ASUS Vivobook 15 X510UA-EJ758T						6 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:32.808319+02	2018-05-14 11:38:32.808319+02
287	16	1	17	1	19	1	1	\N	\N	ASUS VivoBook E12 E203NA-FD026T						2 Go	DDR3		\N	\N		t	t	2018-05-14 11:38:32.898917+02	2018-05-14 11:38:32.898917+02
288	16	1	17	1	19	1	1	\N	\N	ASUS VivoBook E12 E203NA-FD084T						4 Go	DDR3	4 Go	\N	\N		t	t	2018-05-14 11:38:32.988097+02	2018-05-14 11:38:32.988097+02
289	13	1	63	1	12	1	1	\N	\N	ASUS Vivobook E200HA-FD0041TS						2 Go	DDR3L (1.35V)	2 Go	\N	\N		t	t	2018-05-14 11:38:33.074745+02	2018-05-14 11:38:33.074745+02
290	16	1	24	1	29	1	1	\N	\N	ASUS VivoBook E403NA-FA049T						4 Go	DDR3	4 Go	\N	\N		t	t	2018-05-14 11:38:33.164843+02	2018-05-14 11:38:33.164843+02
291	13	1	17	1	19	1	1	\N	\N	ASUS Vivobook Flip 12 TP203NA-BP027T Gris						4 Go	DDR3L (1.35V)	4 Go	\N	\N		t	t	2018-05-14 11:38:33.251717+02	2018-05-14 11:38:33.251717+02
292	16	1	17	1	19	1	1	\N	\N	ASUS Vivobook Flip J401NA-BZ060TS						4 Go	DDR3L (1.35V)	4 Go	\N	\N		t	t	2018-05-14 11:38:33.336633+02	2018-05-14 11:38:33.336633+02
293	13	1	15	1	16	1	1	\N	\N	ASUS VivoBook Flip TP410UA-EC229T						4 Go	DDR4	12 Go	\N	\N		t	t	2018-05-14 11:38:33.422145+02	2018-05-14 11:38:33.422145+02
294	13	1	27	1	16	1	1	\N	\N	ASUS VivoBook Flip TP410UA-EC380T						6 Go	DDR4	12 Go	\N	\N		t	t	2018-05-14 11:38:33.509184+02	2018-05-14 11:38:33.509184+02
295	14	1	29	1	2	1	1	\N	\N	ASUS VivoBook Pro 15 NX580VD-FI667R						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:33.598497+02	2018-05-14 11:38:33.598497+02
296	13	1	29	1	2	1	3	\N	\N	ASUS VivoBook Pro N580VD-FJ693T						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:33.700472+02	2018-05-14 11:38:33.700472+02
297	13	1	26	1	2	1	1	\N	\N	ASUS VivoBook Pro N705UD-GC041T						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:33.78667+02	2018-05-14 11:38:33.78667+02
298	13	1	27	1	2	1	1	\N	\N	ASUS VivoBook Pro N705UD-GC124T						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:33.874566+02	2018-05-14 11:38:33.874566+02
299	13	1	28	1	2	1	1	\N	\N	ASUS VivoBook Pro N705UD-GC129T						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:33.962979+02	2018-05-14 11:38:33.962979+02
300	13	1	27	1	24	1	1	\N	\N	ASUS VivoBook Pro N705UN-GC064T						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:34.055444+02	2018-05-14 11:38:34.055444+02
301	13	1	27	1	24	1	1	\N	\N	ASUS VivoBook Pro N705UN-GC129T						6 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:34.144278+02	2018-05-14 11:38:34.144278+02
302	13	1	27	1	3	1	1	\N	\N	ASUS VivoBook Pro N705UQ-GC141T						6 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:34.234174+02	2018-05-14 11:38:34.234174+02
303	13	1	27	1	33	1	1	\N	\N	ASUS Vivobook S14 S406UA-BM013T						8 Go	DDR3	8 Go	\N	\N		t	t	2018-05-14 11:38:34.321244+02	2018-05-14 11:38:34.321244+02
304	13	1	15	1	16	1	1	\N	\N	ASUS Vivobook S14 S406UA-BM240T						8 Go	DDR3	8 Go	\N	\N		t	t	2018-05-14 11:38:34.409594+02	2018-05-14 11:38:34.409594+02
305	13	1	27	1	16	1	1	\N	\N	ASUS Vivobook S14 S410UA-EB063T						4 Go	DDR4	12 Go	\N	\N		t	t	2018-05-14 11:38:34.495066+02	2018-05-14 11:38:34.495066+02
306	13	1	27	1	16	1	1	\N	\N	ASUS Vivobook S14 S410UA-EB145T						6 Go	DDR4	12 Go	\N	\N		t	t	2018-05-14 11:38:34.584265+02	2018-05-14 11:38:34.584265+02
307	13	1	28	1	24	1	1	\N	\N	ASUS Vivobook S14 S410UN-EB078T						8 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:34.676011+02	2018-05-14 11:38:34.676011+02
308	13	1	28	1	24	1	1	\N	\N	ASUS Vivobook S14 S410UN-EB079T						8 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:34.761915+02	2018-05-14 11:38:34.761915+02
309	13	1	28	1	24	1	1	\N	\N	ASUS Vivobook S14 S410UN-EB080T						16 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:34.854242+02	2018-05-14 11:38:34.854242+02
310	13	1	28	1	24	1	1	\N	\N	ASUS Vivobook S14 S410UN-EB226T						8 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:34.940635+02	2018-05-14 11:38:34.940635+02
311	13	1	27	1	33	1	1	\N	\N	ASUS Vivobook S15 S501UA-BR709T						4 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:35.027906+02	2018-05-14 11:38:35.027906+02
312	13	1	31	1	16	1	1	\N	\N	ASUS Vivobook S15 S510UA-BQ113T						8 Go	DDR4	16 Go	\N	\N	Bluetooth 4.1, Wi-Fi AC	t	t	2018-05-14 11:38:35.119578+02	2018-05-14 11:38:35.119578+02
313	13	1	27	1	23	1	1	\N	\N	ASUS Vivobook S15 S510UF-BQ050T						8 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:35.212027+02	2018-05-14 11:38:35.212027+02
314	13	1	27	1	23	1	1	\N	\N	ASUS Vivobook S15 S510UF-BQ089T						6 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:35.300314+02	2018-05-14 11:38:35.300314+02
315	13	1	28	1	24	1	1	\N	\N	ASUS Vivobook S15 S510UN-BQ090T						8 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:35.386688+02	2018-05-14 11:38:35.386688+02
316	13	1	28	1	24	1	1	\N	\N	ASUS Vivobook S15 S510UN-BQ147T						16 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:35.47639+02	2018-05-14 11:38:35.47639+02
317	13	1	28	1	24	1	1	\N	\N	ASUS Vivobook S15 S510UN-BQ182T						8 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:35.567426+02	2018-05-14 11:38:35.567426+02
318	13	1	27	1	24	1	1	\N	\N	ASUS Vivobook S15 S510UN-BQ183T						6 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:35.659775+02	2018-05-14 11:38:35.659775+02
319	13	1	28	1	24	1	1	\N	\N	ASUS Vivobook S15 S510UN-BQ184T						8 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:35.754482+02	2018-05-14 11:38:35.754482+02
320	13	1	27	1	24	1	1	\N	\N	ASUS Vivobook S15 S510UN-BQ187T						6 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:35.846086+02	2018-05-14 11:38:35.846086+02
321	13	1	54	1	43	1	1	\N	\N	ASUS VivoBook S405UA-BM057T						6 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:35.93628+02	2018-05-14 11:38:35.93628+02
322	13	1	14	1	16	1	1	\N	\N	ASUS VivoBook S405UA-EB654T						4 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:36.02638+02	2018-05-14 11:38:36.02638+02
323	13	1	22	1	4	1	1	\N	\N	ASUS Vivobook S505BA-BR016T						4 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:36.115141+02	2018-05-14 11:38:36.115141+02
324	13	1	22	1	47	1	1	\N	\N	ASUS Vivobook S505BP-BR057T						4 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:36.20871+02	2018-05-14 11:38:36.20871+02
325	13	1	21	1	4	1	1	\N	\N	ASUS X441BA-FA052T						4 Go	DDR4		\N	\N	10/100 Mbps	t	t	2018-05-14 11:38:36.320716+02	2018-05-14 11:38:36.320716+02
326	13	1	64	1	48	1	1	\N	\N	ASUS X441SC-WX005T						4 Go	DDR3L (1.35V)	4 Go	\N	\N	10/100 Mbps	t	t	2018-05-14 11:38:36.408992+02	2018-05-14 11:38:36.408992+02
327	13	1	47	1	35	1	1	\N	\N	ASUS X540LA-DM1052T						4 Go	DDR3	8 Go	\N	\N	10/100 Mbps	t	t	2018-05-14 11:38:36.496864+02	2018-05-14 11:38:36.496864+02
328	13	1	24	1	29	1	1	\N	\N	ASUS X541NA-GO125T						4 Go	DDR3	4 Go	\N	\N	10/100 Mbps	t	t	2018-05-14 11:38:36.585102+02	2018-05-14 11:38:36.585102+02
329	13	1	24	1	29	1	1	\N	\N	ASUS X541NA-GO526T						4 Go	DDR3	4 Go	\N	\N	10/100 Mbps	t	t	2018-05-14 11:38:36.675022+02	2018-05-14 11:38:36.675022+02
330	13	1	22	1	4	1	1	\N	\N	ASUS X555BA-DM155T						4 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:36.762372+02	2018-05-14 11:38:36.762372+02
331	13	1	52	1	41	1	1	\N	\N	ASUS X751SV-TY002T Blanc						4 Go	DDR3L (1.35V)	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:36.850687+02	2018-05-14 11:38:36.850687+02
332	13	1	65	1	20	1	1	\N	\N	ASUS X756UA-TY181T						4 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:36.940826+02	2018-05-14 11:38:36.940826+02
333	13	1	25	1	20	1	1	\N	\N	ASUS X756UA-TY337T						4 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:37.031069+02	2018-05-14 11:38:37.031069+02
334	14	1	28	1	33	1	1	\N	\N	ASUS Zenbook 13 UX331UA-EG011R						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:37.125175+02	2018-05-14 11:38:37.125175+02
335	14	1	28	1	33	1	1	\N	\N	ASUS Zenbook 13 UX331UA-EG011RB						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:37.210025+02	2018-05-14 11:38:37.210025+02
336	14	1	27	1	33	1	1	\N	\N	ASUS Zenbook 13 UX331UA-EG012RB						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:37.298739+02	2018-05-14 11:38:37.298739+02
337	13	1	27	1	33	1	1	\N	\N	ASUS Zenbook 13 UX331UA-EG013T						8 Go	DDR4	8 Go	\N	\N		t	t	2018-05-14 11:38:37.390957+02	2018-05-14 11:38:37.390957+02
338	13	1	28	1	24	1	1	\N	\N	ASUS Zenbook 13 UX331UN-EG015T						16 Go	DDR3	16 Go	\N	\N		t	t	2018-05-14 11:38:37.47698+02	2018-05-14 11:38:37.47698+02
339	13	1	28	1	24	1	1	\N	\N	ASUS Zenbook 13 UX331UN-EG036T						16 Go	DDR3	16 Go	\N	\N		t	t	2018-05-14 11:38:37.573151+02	2018-05-14 11:38:37.573151+02
340	13	1	28	1	24	1	1	\N	\N	ASUS Zenbook 13 UX331UN-EG037T						8 Go	DDR3	8 Go	\N	\N		t	t	2018-05-14 11:38:37.66019+02	2018-05-14 11:38:37.66019+02
341	13	1	26	1	16	1	1	\N	\N	ASUS Zenbook 3 3U-GS099T Gris						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:37.74794+02	2018-05-14 11:38:37.74794+02
342	13	1	26	1	16	1	1	\N	\N	ASUS Zenbook 3 3U-GS124T						16 Go	DDR3L (1.35V)	16 Go	\N	\N		t	t	2018-05-14 11:38:37.843155+02	2018-05-14 11:38:37.843155+02
343	14	1	28	1	33	1	1	\N	\N	ASUS Zenbook 3 Deluxe UX490UAR-BE113RB						16 Go	DDR3	16 Go	\N	\N		t	t	2018-05-14 11:38:37.930619+02	2018-05-14 11:38:37.930619+02
344	13	1	27	1	33	1	1	\N	\N	ASUS Zenbook Flip 14 UX461UA-E1010T						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:38.024153+02	2018-05-14 11:38:38.024153+02
345	14	1	27	1	33	1	1	\N	\N	ASUS Zenbook Flip 14 UX461UA-E1012R						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:38.113597+02	2018-05-14 11:38:38.113597+02
346	14	1	27	1	33	1	1	\N	\N	ASUS Zenbook Flip 14 UX461UA-E1012RB						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:38.204407+02	2018-05-14 11:38:38.204407+02
347	14	1	28	1	33	1	1	\N	\N	ASUS Zenbook Flip 14 UX461UA-E1017R						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:38.294304+02	2018-05-14 11:38:38.294304+02
348	13	1	28	1	24	1	1	\N	\N	ASUS Zenbook Flip 14 UX461UN-E1035T						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:38.382788+02	2018-05-14 11:38:38.382788+02
349	14	1	27	1	33	1	1	\N	\N	ASUS Zenbook Flip 15 UX561UA-BO020R						8 Go	DDR4	8 Go	\N	\N		t	t	2018-05-14 11:38:38.471615+02	2018-05-14 11:38:38.471615+02
350	14	1	28	1	33	1	1	\N	\N	ASUS Zenbook Flip 15 UX561UA-BO021R						8 Go	DDR4	8 Go	\N	\N		t	t	2018-05-14 11:38:38.561043+02	2018-05-14 11:38:38.561043+02
351	13	1	14	1	16	1	1	\N	\N	ASUS Zenbook Flip 58256-B						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:38.653267+02	2018-05-14 11:38:38.653267+02
352	13	1	28	1	16	1	1	\N	\N	ASUS Zenbook Flip S U7R16512-B Bleu						16 Go	DDR3L (1.35V)	16 Go	\N	\N		t	t	2018-05-14 11:38:38.744327+02	2018-05-14 11:38:38.744327+02
353	14	1	27	1	33	1	1	\N	\N	ASUS Zenbook Flip S UX370UA-C4198R						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:38.833493+02	2018-05-14 11:38:38.833493+02
354	14	1	28	1	16	1	1	\N	\N	ASUS Zenbook Flip S UX370UA-C4237R						16 Go	DDR3L (1.35V)	16 Go	\N	\N		t	t	2018-05-14 11:38:38.927426+02	2018-05-14 11:38:38.927426+02
355	14	1	28	1	16	1	1	\N	\N	ASUS Zenbook Flip S UX370UA-C4237RB						16 Go	DDR3L (1.35V)	16 Go	\N	\N		t	t	2018-05-14 11:38:39.027296+02	2018-05-14 11:38:39.027296+02
356	14	1	66	1	46	1	1	\N	\N	ASUS Zenbook Flip UX360CA-C4004R						8 Go	DDR3L (1.35V)	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:39.119825+02	2018-05-14 11:38:39.119825+02
357	13	1	45	1	15	1	1	\N	\N	ASUS Zenbook Flip UX360UA-C4136T						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:39.211736+02	2018-05-14 11:38:39.211736+02
358	14	1	19	1	2	1	3	\N	\N	ASUS Zenbook Pro UX550VD-BN022R						8 Go	DDR4	8 Go	\N	\N		t	t	2018-05-14 11:38:39.316322+02	2018-05-14 11:38:39.316322+02
359	14	1	29	1	2	1	3	\N	\N	ASUS Zenbook Pro UX550VD-BO098RB						16 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:39.429407+02	2018-05-14 11:38:39.429407+02
360	13	1	29	1	2	1	3	\N	\N	ASUS Zenbook Pro UX550VD-E3156T						16 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:39.535737+02	2018-05-14 11:38:39.535737+02
361	13	1	43	1	16	1	1	\N	\N	ASUS ZenBook Pro-14-78256						8 Go	DDR3	8 Go	\N	\N		t	t	2018-05-14 11:38:39.626342+02	2018-05-14 11:38:39.626342+02
362	13	1	31	1	16	1	1	\N	\N	ASUS Zenbook UX310UA-FC676T Gris						4 Go	DDR4	12 Go	\N	\N		t	t	2018-05-14 11:38:39.713871+02	2018-05-14 11:38:39.713871+02
363	13	1	31	1	16	1	1	\N	\N	ASUS Zenbook UX310UA-GL437T Gris						4 Go	DDR4	12 Go	\N	\N		t	t	2018-05-14 11:38:39.809693+02	2018-05-14 11:38:39.809693+02
364	14	1	26	1	16	1	1	\N	\N	ASUS Zenbook UX330UA-FB136R						16 Go	DDR3L (1.35V)	16 Go	\N	\N		t	t	2018-05-14 11:38:39.897662+02	2018-05-14 11:38:39.897662+02
365	14	1	14	1	16	1	1	\N	\N	ASUS Zenbook UX410UA-GV027R						8 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:39.988105+02	2018-05-14 11:38:39.988105+02
366	14	1	67	1	16	1	1	\N	\N	ASUS Zenbook UX410UA-GV351R						8 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:40.077059+02	2018-05-14 11:38:40.077059+02
367	14	1	28	1	33	1	1	\N	\N	ASUS Zenbook UX410UA-GV352R						8 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:40.166715+02	2018-05-14 11:38:40.166715+02
368	13	1	28	1	23	1	1	\N	\N	ASUS Zenbook UX410UF-GV046T						8 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:40.260661+02	2018-05-14 11:38:40.260661+02
369	13	1	28	1	24	1	1	\N	\N	ASUS Zenbook UX430UN-GV031T						16 Go	DDR3	16 Go	\N	\N		t	t	2018-05-14 11:38:40.350243+02	2018-05-14 11:38:40.350243+02
370	13	1	28	1	24	1	1	\N	\N	ASUS Zenbook UX430UN-GV103T						8 Go	DDR3	8 Go	\N	\N		t	t	2018-05-14 11:38:40.443114+02	2018-05-14 11:38:40.443114+02
371	13	1	26	1	3	1	1	\N	\N	ASUS Zenbook UX430UQ-GV154T						8 Go	DDR4	8 Go	\N	\N		t	t	2018-05-14 11:38:40.5321+02	2018-05-14 11:38:40.5321+02
372	13	1	28	1	24	1	1	\N	\N	ASUS Zenbook+N-GRIS-7R8256						8 Go	DDR3	8 Go	\N	\N		t	t	2018-05-14 11:38:40.624062+02	2018-05-14 11:38:40.624062+02
373	13	1	68	1	41	1	1	\N	\N	ASUS R558UV-DM345T						8 Go	DDR4	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:40.713992+02	2018-05-14 11:38:40.713992+02
374	14	1	61	1	12	1	1	\N	\N	ASUS Transformer Mini T103HAF-GR025R Gris avec clavier						4 Go	DDR3	4 Go	\N	\N		t	t	2018-05-14 11:38:40.804004+02	2018-05-14 11:38:40.804004+02
375	14	1	26	1	16	1	1	\N	\N	ASUS Zenbook Flip S UX370UA-C4060R						16 Go	DDR3L (1.35V)	16 Go	\N	\N		t	t	2018-05-14 11:38:40.89389+02	2018-05-14 11:38:40.89389+02
376	14	1	29	1	5	1	3	\N	\N	Gigabyte Aero 14K v7 B40W10PFR						16 Go	DDR4	32 Go	\N	\N		t	t	2018-05-14 11:38:41.001055+02	2018-05-14 11:38:41.001055+02
377	14	1	29	1	25	1	3	\N	\N	Gigabyte Aero 14W v7 G40W10P-FR Vert						16 Go	DDR4	32 Go	\N	\N		t	t	2018-05-14 11:38:41.107104+02	2018-05-14 11:38:41.107104+02
378	14	1	39	1	25	1	3	\N	\N	Gigabyte Aero 14W v7 M40W10P-FR Orange						16 Go	DDR4	32 Go	\N	\N		t	t	2018-05-14 11:38:41.215568+02	2018-05-14 11:38:41.215568+02
379	14	1	29	1	25	1	3	\N	\N	Gigabyte Aero 15W v7 B40W10P-FR Noir						16 Go	DDR4	32 Go	\N	\N		t	t	2018-05-14 11:38:41.320672+02	2018-05-14 11:38:41.320672+02
380	14	1	29	1	25	1	3	\N	\N	Gigabyte Aero 15W v7 G40W10P-FR Vert						16 Go	DDR4	32 Go	\N	\N		t	t	2018-05-14 11:38:41.422805+02	2018-05-14 11:38:41.422805+02
381	13	1	39	1	32	1	3	\N	\N	Gigabyte P56XT v7 C52W10-FR						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:41.525964+02	2018-05-14 11:38:41.525964+02
382	20	1	39	1	25	1	3	\N	\N	Gigabyte P57W v7 C2D-FR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:41.629979+02	2018-05-14 11:38:41.629979+02
383	13	1	39	1	32	1	3	\N	\N	Gigabyte P57X v7 C520W10-FR						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:41.737118+02	2018-05-14 11:38:41.737118+02
384	20	1	39	1	2	1	3	\N	\N	Gigabyte Sabre 15 - P45G V7 C30D-FR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:41.839659+02	2018-05-14 11:38:41.839659+02
385	13	1	39	1	2	1	3	\N	\N	Gigabyte Sabre 15 - P45G v7 C32W10-FR						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:41.941822+02	2018-05-14 11:38:41.941822+02
386	14	1	39	1	2	1	3	\N	\N	Gigabyte Sabre 15 - P45G V7 C3W10Pro-FR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:42.045513+02	2018-05-14 11:38:42.045513+02
387	13	1	39	1	5	1	3	\N	\N	Gigabyte Sabre 15 - P45K V7 C35W10-FR						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:42.152356+02	2018-05-14 11:38:42.152356+02
388	20	1	39	1	25	1	3	\N	\N	Gigabyte Sabre 15 - P45W v7 C2D-FR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:42.26157+02	2018-05-14 11:38:42.26157+02
389	13	1	39	1	25	1	3	\N	\N	Gigabyte Sabre 15 - P45W v7 C35W10-FR						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:42.365652+02	2018-05-14 11:38:42.365652+02
390	13	1	48	1	32	1	5	\N	\N	Gigabyte P37X v6 C4KW10-FR 4K + Bonus Pack OFFERT !						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:42.468958+02	2018-05-14 11:38:42.468958+02
391	13	1	52	1	40	1	1	\N	\N	HP 14-am027nf						4 Go	DDR3L (1.35V)		\N	\N	10/100 Mbps	t	t	2018-05-14 11:38:42.560203+02	2018-05-14 11:38:42.560203+02
392	13	1	25	1	16	1	1	\N	\N	HP 15-bs004nf						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:42.647011+02	2018-05-14 11:38:42.647011+02
393	13	1	25	1	20	1	1	\N	\N	HP 17-bs051nf						6 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:42.73426+02	2018-05-14 11:38:42.73426+02
394	14	1	47	1	35	1	1	\N	\N	HP 250 G5 (W4N09EA)						4 Go	DDR3L (1.35V)		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:42.823595+02	2018-05-14 11:38:42.823595+02
395	14	1	66	1	46	1	1	\N	\N	HP Elite x2 1012 G1 (L5H17EA)						4 Go	DDR3L (1.35V)		\N	\N		t	t	2018-05-14 11:38:42.910251+02	2018-05-14 11:38:42.910251+02
396	14	1	69	1	46	1	1	\N	\N	HP Elite x2 1012 G1 (L5H18EA)						4 Go	DDR3L (1.35V)	4 Go	\N	\N		t	t	2018-05-14 11:38:42.997007+02	2018-05-14 11:38:42.997007+02
397	14	1	69	1	46	1	1	\N	\N	HP Elite x2 1012 G1 (L5H19EA)						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:43.084034+02	2018-05-14 11:38:43.084034+02
398	14	1	43	1	16	1	1	\N	\N	HP Elite x2 1012 G2 (2TL99EA)						8 Go	DDR3L (1.35V)	16 Go	\N	\N		t	t	2018-05-14 11:38:43.174099+02	2018-05-14 11:38:43.174099+02
399	21	1	45	1	20	1	1	\N	\N	HP EliteBook 1040 G3 (1EN07EA)						8 Go	DDR4	8 Go	\N	\N		t	t	2018-05-14 11:38:43.261109+02	2018-05-14 11:38:43.261109+02
400	14	1	14	1	16	1	1	\N	\N	HP EliteBook 1040 G4 (1EP76EA)						8 Go	DDR4	8 Go	\N	\N		t	t	2018-05-14 11:38:43.350446+02	2018-05-14 11:38:43.350446+02
401	14	1	70	1	49	1	1	\N	\N	HP EliteBook 745 G4 (1EN93EA)						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:43.446049+02	2018-05-14 11:38:43.446049+02
402	14	1	14	1	16	1	1	\N	\N	HP EliteBook 850 G4 (Z2W86EA)						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:43.534895+02	2018-05-14 11:38:43.534895+02
403	14	1	62	1	46	1	1	\N	\N	HP EliteBook Folio G1 (X2F47EA)						8 Go	DDR4	8 Go	\N	\N		t	t	2018-05-14 11:38:43.632055+02	2018-05-14 11:38:43.632055+02
404	14	1	14	1	16	1	1	\N	\N	HP EliteBook x360 (Y8Q89EA)						8 Go	DDR4	8 Go	\N	\N		t	t	2018-05-14 11:38:43.724679+02	2018-05-14 11:38:43.724679+02
405	13	1	31	1	16	1	1	\N	\N	HP ENVY 13-ab012nf						4 Go	DDR3L (1.35V)	4 Go	\N	\N		t	t	2018-05-14 11:38:43.817598+02	2018-05-14 11:38:43.817598+02
406	13	1	19	1	2	1	3	\N	\N	HP OMEN 15-ce003nf						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:43.924874+02	2018-05-14 11:38:43.924874+02
407	13	1	48	1	25	1	5	\N	\N	HP Omen 17-w102nf						16 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:44.028585+02	2018-05-14 11:38:44.028585+02
408	13	1	31	1	16	1	1	\N	\N	HP Pavilion 14-bf002nf						6 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:44.118729+02	2018-05-14 11:38:44.118729+02
409	14	1	15	1	16	1	1	\N	\N	HP ProBook 430 G4 (Y7Z31EA)						4 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:44.206052+02	2018-05-14 11:38:44.206052+02
410	14	1	28	1	33	1	1	\N	\N	HP ProBook 430 G5 (2VQ32EA)						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:44.293138+02	2018-05-14 11:38:44.293138+02
411	14	1	14	1	16	1	1	\N	\N	HP ProBook 440 G4 (Y7Z73EA)						4 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:44.379274+02	2018-05-14 11:38:44.379274+02
412	14	1	27	1	33	1	1	\N	\N	HP ProBook 440 G5 Pro (2RS30EA)						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:44.466873+02	2018-05-14 11:38:44.466873+02
413	14	1	28	1	33	1	1	\N	\N	HP ProBook 440 G5 Pro (2UB64EA)						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:44.555715+02	2018-05-14 11:38:44.555715+02
414	14	1	27	1	33	1	1	\N	\N	HP ProBook 440 G5 Pro (2VQ15EA)						4 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:44.645422+02	2018-05-14 11:38:44.645422+02
415	17	1	20	1	20	1	1	\N	\N	HP ProBook 450 G3 (W4P23ET)						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:44.731428+02	2018-05-14 11:38:44.731428+02
416	14	1	45	1	20	1	1	\N	\N	HP ProBook 450 G3 (Z2Y58ET)						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:44.820586+02	2018-05-14 11:38:44.820586+02
417	14	1	15	1	16	1	1	\N	\N	HP ProBook 450 G4 (Y8A06ET)						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:44.910805+02	2018-05-14 11:38:44.910805+02
418	14	1	28	1	43	1	1	\N	\N	HP ProBook 450 G5 (2XZ22EA)						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:44.999575+02	2018-05-14 11:38:44.999575+02
419	14	1	27	1	33	1	1	\N	\N	HP ProBook 450 G5 (3GH65ET)						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:45.09274+02	2018-05-14 11:38:45.09274+02
420	13	1	20	1	50	1	1	\N	\N	HP ProBook 470 G3 (P4P67EA)						4 Go	DDR3		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:45.183266+02	2018-05-14 11:38:45.183266+02
421	14	1	15	1	43	1	1	\N	\N	HP ProBook 470 G5 Pro (2VQ20ET)						4 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:45.273156+02	2018-05-14 11:38:45.273156+02
422	14	1	27	1	43	1	1	\N	\N	HP ProBook 470 G5 Pro (2VQ22EA)						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:45.363448+02	2018-05-14 11:38:45.363448+02
423	14	1	28	1	43	1	1	\N	\N	HP ProBook 470 G5 Pro (2VQ23EA)						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:45.452082+02	2018-05-14 11:38:45.452082+02
424	13	1	45	1	20	1	1	\N	\N	HP Spectre 13-v000nf						8 Go	DDR3L (1.35V)		\N	\N		t	t	2018-05-14 11:38:45.544296+02	2018-05-14 11:38:45.544296+02
425	14	1	29	1	51	1	9	\N	\N	HP ZBook 15 G4 (Y6K19ET)						8 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:45.651869+02	2018-05-14 11:38:45.651869+02
426	14	1	71	1	52	1	9	\N	\N	HP ZBook 17 G4 (Y6K24ET)						32 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:45.757897+02	2018-05-14 11:38:45.757897+02
427	14	1	71	1	51	1	9	\N	\N	HP ZBook Studio G4 (Y6K16ET)						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:45.861615+02	2018-05-14 11:38:45.861615+02
428	13	1	25	1	22	1	1	\N	\N	HP 15-bs047nf						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:45.950913+02	2018-05-14 11:38:45.950913+02
429	13	1	29	1	5	1	3	\N	\N	HP OMEN 15-ce098nf						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:46.061034+02	2018-05-14 11:38:46.061034+02
430	14	1	29	1	53	1	9	\N	\N	HP ZBook 15 G4 (1RQ75ET)						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:46.168726+02	2018-05-14 11:38:46.168726+02
431	14	1	29	1	53	1	9	\N	\N	HP ZBook 17 G4 (1RQ79ET)						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:46.274603+02	2018-05-14 11:38:46.274603+02
432	14	1	45	1	20	1	1	\N	\N	Lenovo E31-80 (80MX010FFR)						4 Go	DDR3L (1.35V)		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:46.363688+02	2018-05-14 11:38:46.363688+02
433	14	1	25	1	20	1	1	\N	\N	Lenovo E31-80 (80MX015GFR)						4 Go	DDR3L (1.35V)		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:46.451839+02	2018-05-14 11:38:46.451839+02
434	14	1	25	1	20	1	1	\N	\N	Lenovo E31-80 (80MX015HFR)						4 Go	DDR3L (1.35V)		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:46.554163+02	2018-05-14 11:38:46.554163+02
435	13	1	72	1	54	1	1	\N	\N	Lenovo G50-80 (80E502SUFR)						4 Go	DDR3L (1.35V)		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:46.648527+02	2018-05-14 11:38:46.648527+02
436	13	1	22	1	55	1	1	\N	\N	Lenovo IdeaPad 320-15AST Noir (80XV00JSFR)						4 Go	DDR4		\N	\N	10/100 Mbps	t	t	2018-05-14 11:38:46.73579+02	2018-05-14 11:38:46.73579+02
437	13	1	35	1	29	1	1	\N	\N	Lenovo IdeaPad 320-15IAP Gris (80XR00YMFR)						4 Go	DDR3L (1.35V)	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:46.825541+02	2018-05-14 11:38:46.825541+02
438	13	1	14	1	41	1	1	\N	\N	Lenovo IdeaPad 320-15IKBN Blanc (80XL03LLFR)						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:46.913957+02	2018-05-14 11:38:46.913957+02
439	13	1	14	1	41	1	1	\N	\N	Lenovo IdeaPad 320-15IKBN Gris (80XL02Y2FR)						4 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:47.002271+02	2018-05-14 11:38:47.002271+02
440	13	1	28	1	24	1	1	\N	\N	Lenovo IdeaPad 320-15IKBRN Gris (81BG00BLFR)						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:47.091461+02	2018-05-14 11:38:47.091461+02
441	13	1	25	1	41	1	1	\N	\N	Lenovo IdeaPad 320-15ISK Argent (80XH00D5FR)						4 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:47.185831+02	2018-05-14 11:38:47.185831+02
442	13	1	25	1	41	1	1	\N	\N	Lenovo IdeaPad 320-15ISK Blanc (80XH006PFR)						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:47.274605+02	2018-05-14 11:38:47.274605+02
443	13	1	25	1	41	1	1	\N	\N	Lenovo IdeaPad 320-15ISK Noir (80XH01GDFR)						4 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:47.359589+02	2018-05-14 11:38:47.359589+02
444	13	1	73	1	28	1	1	\N	\N	Lenovo IdeaPad 320-17AST (80XW000SFR)						4 Go	DDR4	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:47.449204+02	2018-05-14 11:38:47.449204+02
445	13	1	74	1	55	1	1	\N	\N	Lenovo IdeaPad 320-17AST (80XW001SFR)						8 Go	DDR4	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:47.538581+02	2018-05-14 11:38:47.538581+02
446	13	1	14	1	41	1	1	\N	\N	Lenovo IdeaPad 320-17IKB (80XM00DTFR)						4 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:47.631789+02	2018-05-14 11:38:47.631789+02
447	13	1	14	1	41	1	1	\N	\N	Lenovo IdeaPad 320-17IKB (80XM00H3FR)						8 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:47.719882+02	2018-05-14 11:38:47.719882+02
448	13	1	25	1	20	1	1	\N	\N	Lenovo IdeaPad 320-17ISK Gris (80XJ002PFR)						4 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:47.809326+02	2018-05-14 11:38:47.809326+02
449	13	1	27	1	33	1	1	\N	\N	Lenovo IdeaPad 320S-14IKBR (81BN004MFR)						8 Go	DDR4	8 Go	\N	\N		t	t	2018-05-14 11:38:47.894238+02	2018-05-14 11:38:47.894238+02
450	13	1	27	1	56	1	1	\N	\N	Lenovo IdeaPad 720-15IKBR (81C7004RFR)						8 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:47.984216+02	2018-05-14 11:38:47.984216+02
451	13	1	19	1	2	1	3	\N	\N	Lenovo Legion Y520-15IKBN (80WK005BFR)						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:48.091134+02	2018-05-14 11:38:48.091134+02
452	13	1	19	1	2	1	3	\N	\N	Lenovo Legion Y520-15IKBN (80WK00C9FR)						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:48.189468+02	2018-05-14 11:38:48.189468+02
453	20	1	19	1	25	1	3	\N	\N	Lenovo Legion Y520-15IKBN (80YY008QFR)						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:48.294462+02	2018-05-14 11:38:48.294462+02
454	13	1	19	1	25	1	3	\N	\N	Lenovo Legion Y720-15IKB (80VR002KFR)						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:48.398874+02	2018-05-14 11:38:48.398874+02
455	13	1	29	1	25	1	3	\N	\N	Lenovo Legion Y720-15IKB (80VR002MFR)						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:48.501341+02	2018-05-14 11:38:48.501341+02
456	20	1	19	1	25	1	3	\N	\N	Lenovo Legion Y720-15IKB (80VR0030FR)						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:48.614826+02	2018-05-14 11:38:48.614826+02
457	13	1	29	1	25	1	3	\N	\N	Lenovo Legion Y720-15IKB (80VR00GJFR)						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:48.717023+02	2018-05-14 11:38:48.717023+02
458	20	1	19	1	25	1	3	\N	\N	Lenovo Legion Y720-15IKB (80VR00L6FR)						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:48.822061+02	2018-05-14 11:38:48.822061+02
459	13	1	29	1	32	1	7	\N	\N	Lenovo Legion Y920-17IKB (80YW000VFR)						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:48.923864+02	2018-05-14 11:38:48.923864+02
460	13	1	40	1	32	1	7	\N	\N	Lenovo Legion Y920-17IKB (80YW000WFR)						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:49.026538+02	2018-05-14 11:38:49.026538+02
461	22	1	75	1	57	1	10	\N	\N	Lenovo M30-70 (MCF22FR)						4 Go	DDR3L (1.35V)	8 Go	\N	\N	10/100 Mbps	t	t	2018-05-14 11:38:49.138574+02	2018-05-14 11:38:49.138574+02
462	14	1	43	1	16	1	1	\N	\N	Lenovo Miix 510 (80XE001BFR)						8 Go	DDR4		\N	\N		t	t	2018-05-14 11:38:49.225256+02	2018-05-14 11:38:49.225256+02
463	14	1	25	1	20	1	1	\N	\N	Lenovo ThinkPad E470 (20H1003DFR)						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:49.314097+02	2018-05-14 11:38:49.314097+02
464	14	1	14	1	16	1	1	\N	\N	Lenovo ThinkPad E470 (20H1007GFR)						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:49.400369+02	2018-05-14 11:38:49.400369+02
465	14	1	14	1	16	1	1	\N	\N	Lenovo ThinkPad E570 (20H50078FR)						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:49.488072+02	2018-05-14 11:38:49.488072+02
466	14	1	25	1	16	1	1	\N	\N	Lenovo ThinkPad E570 (20H5007NFR)						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:49.575373+02	2018-05-14 11:38:49.575373+02
467	14	1	43	1	27	1	1	\N	\N	Lenovo ThinkPad E570 (20H500B1FR)						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:49.664933+02	2018-05-14 11:38:49.664933+02
468	14	1	15	1	16	1	1	\N	\N	Lenovo ThinkPad E570 (20H500CFFR)						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:49.750282+02	2018-05-14 11:38:49.750282+02
469	14	1	46	1	58	1	1	\N	\N	Lenovo ThinkPad P40 Yoga (20GQ001QFR)						16 Go	DDR3L (1.35V)	16 Go	\N	\N		t	t	2018-05-14 11:38:49.838801+02	2018-05-14 11:38:49.838801+02
470	14	1	26	1	16	1	1	\N	\N	Lenovo ThinkPad T470s (20HF0047FR)						8 Go	DDR4	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:49.928238+02	2018-05-14 11:38:49.928238+02
471	14	1	26	1	16	1	1	\N	\N	Lenovo ThinkPad T470s (20HF004QFR)						8 Go	DDR4	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:50.018422+02	2018-05-14 11:38:50.018422+02
472	14	1	14	1	16	1	1	\N	\N	Lenovo ThinkPad T570 (20H90002FR)						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:50.116415+02	2018-05-14 11:38:50.116415+02
473	14	1	14	1	16	1	1	\N	\N	Lenovo ThinkPad X1 Carbon (20HR0022FR)						8 Go	DDR3L (1.35V)		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:50.203331+02	2018-05-14 11:38:50.203331+02
474	14	1	45	1	20	1	1	\N	\N	Lenovo ThinkPad X1 Yoga G1 (20FQ003YFR)						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:50.292129+02	2018-05-14 11:38:50.292129+02
475	14	1	14	1	16	1	1	\N	\N	Lenovo ThinkPad X1 Yoga G2 (20JD0025FR)						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:50.376134+02	2018-05-14 11:38:50.376134+02
476	14	1	43	1	16	1	1	\N	\N	Lenovo ThinkPad X1 Yoga G2 (20JD002DFR)						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:38:50.460509+02	2018-05-14 11:38:50.460509+02
477	14	1	14	1	16	1	1	\N	\N	Lenovo ThinkPad X270 (20HN001SFR)						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:50.547954+02	2018-05-14 11:38:50.547954+02
478	14	1	43	1	16	1	1	\N	\N	Lenovo ThinkPad Yoga 370 Argent (20JH003BFR)						8 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:50.63849+02	2018-05-14 11:38:50.63849+02
479	14	1	43	1	16	1	1	\N	\N	Lenovo ThinkPad Yoga 370 Noir (20JH002LFR)						8 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:50.727278+02	2018-05-14 11:38:50.727278+02
480	13	1	17	1	19	1	1	\N	\N	Lenovo V110-15IAP (80TG00W0FR)						4 Go	DDR3L (1.35V)	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:50.814771+02	2018-05-14 11:38:50.814771+02
481	14	1	25	1	20	1	1	\N	\N	Lenovo V110-15ISK (80TL00A3FR)						4 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:50.902885+02	2018-05-14 11:38:50.902885+02
482	13	1	25	1	20	1	1	\N	\N	Lenovo V110-15ISK (80TL00A9FR)						4 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:50.992879+02	2018-05-14 11:38:50.992879+02
483	13	1	76	1	20	1	1	\N	\N	Lenovo V110-17ISK (80V2017PFR)						4 Go	DDR4	8 Go	\N	\N	10/100 Mbps	t	t	2018-05-14 11:38:51.081076+02	2018-05-14 11:38:51.081076+02
484	13	1	25	1	20	1	1	\N	\N	Lenovo V110-17ISK (80VM00CDFR)						4 Go	DDR4	8 Go	\N	\N	10/100 Mbps	t	t	2018-05-14 11:38:51.176641+02	2018-05-14 11:38:51.176641+02
485	14	1	25	1	20	1	1	\N	\N	Lenovo V110-17ISK (80VM00CEFR)						4 Go	DDR4	8 Go	\N	\N	10/100 Mbps	t	t	2018-05-14 11:38:51.266861+02	2018-05-14 11:38:51.266861+02
486	14	1	25	1	20	1	1	\N	\N	Lenovo V110-17ISK (80VM00DQFR)						4 Go	DDR4	8 Go	\N	\N	10/100 Mbps	t	t	2018-05-14 11:38:51.353889+02	2018-05-14 11:38:51.353889+02
487	14	1	77	1	3	1	1	\N	\N	Lenovo V320-17IKB Gris (81AH000CFR)						8 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:51.441419+02	2018-05-14 11:38:51.441419+02
488	14	1	78	1	3	1	1	\N	\N	Lenovo V320-17IKB Gris (81AH000HFR)						8 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:51.527597+02	2018-05-14 11:38:51.527597+02
489	13	1	43	1	59	1	1	\N	\N	Lenovo V510-15IKB (80WQ01TNFR)						8 Go	DDR4	12 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:51.616509+02	2018-05-14 11:38:51.616509+02
490	13	1	43	1	55	1	1	\N	\N	Lenovo V510-15IKB (80WQ01UYFR)						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:51.702503+02	2018-05-14 11:38:51.702503+02
491	13	1	14	1	55	1	1	\N	\N	Lenovo V510-15IKB (80WQ01VQFR)						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:51.790351+02	2018-05-14 11:38:51.790351+02
492	13	1	79	1	16	1	1	\N	\N	Lenovo Yoga 520-14IKB (80X80063FR)						4 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:51.883055+02	2018-05-14 11:38:51.883055+02
493	13	1	79	1	16	1	1	\N	\N	Lenovo Yoga 520-14IKB (80X80069FR)						4 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:51.969194+02	2018-05-14 11:38:51.969194+02
494	13	1	15	1	16	1	1	\N	\N	Lenovo Yoga 520-14IKB (80X8006EFR)						4 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:52.060141+02	2018-05-14 11:38:52.060141+02
495	13	1	15	1	16	1	1	\N	\N	Lenovo Yoga 520-14IKB (80X8006FFR)						4 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:52.155323+02	2018-05-14 11:38:52.155323+02
496	13	1	14	1	16	1	1	\N	\N	Lenovo Yoga 720-13IKB (80X6001FFR)						4 Go	DDR4	4 Go	\N	\N		t	t	2018-05-14 11:38:52.243645+02	2018-05-14 11:38:52.243645+02
497	13	1	14	1	16	1	1	\N	\N	Lenovo Yoga 720-13IKB (80X6008DFR)						8 Go	DDR4	8 Go	\N	\N		t	t	2018-05-14 11:38:52.331958+02	2018-05-14 11:38:52.331958+02
498	23	1	80	1	39	1	1	\N	\N	Lenovo Yoga Book 10" (ZA0V0026FR)						4 Go	DDR3		\N	\N		t	t	2018-05-14 11:38:52.420987+02	2018-05-14 11:38:52.420987+02
499	14	1	80	1	39	1	1	\N	\N	Lenovo Yoga Book 10" (ZA150060FR)						4 Go	DDR3		\N	\N		t	t	2018-05-14 11:38:52.511106+02	2018-05-14 11:38:52.511106+02
500	14	1	25	1	20	1	1	\N	\N	Lenovo Miix 510 (80XE0012FR)						4 Go	DDR4		\N	\N		t	t	2018-05-14 11:38:52.597483+02	2018-05-14 11:38:52.597483+02
501	14	1	14	1	16	1	1	\N	\N	Lenovo Miix 510 (80XE001FFR)						8 Go	DDR4		\N	\N		t	t	2018-05-14 11:38:52.686629+02	2018-05-14 11:38:52.686629+02
502	14	1	14	1	16	1	1	\N	\N	Lenovo ThinkPad E470 (20H1006KFR)						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:52.773424+02	2018-05-14 11:38:52.773424+02
503	14	1	25	1	20	1	1	\N	\N	Lenovo ThinkPad E570 (20H5007HFR)						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:52.860029+02	2018-05-14 11:38:52.860029+02
504	14	1	31	1	16	1	1	\N	\N	Lenovo ThinkPad E570 (20H500B2FR)						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:52.947578+02	2018-05-14 11:38:52.947578+02
505	14	1	46	1	58	1	1	\N	\N	Lenovo ThinkPad P40 Yoga (20GQ000KFR)						16 Go	DDR3L (1.35V)	16 Go	\N	\N		t	t	2018-05-14 11:38:53.034024+02	2018-05-14 11:38:53.034024+02
506	14	1	26	1	16	1	1	\N	\N	Lenovo ThinkPad T570 (20H90001FR)						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:53.133241+02	2018-05-14 11:38:53.133241+02
507	14	1	14	1	16	1	1	\N	\N	Lenovo ThinkPad Yoga 370 Noir (20JH002KFR)						8 Go	DDR4	16 Go	\N	\N		t	t	2018-05-14 11:38:53.217668+02	2018-05-14 11:38:53.217668+02
508	14	1	43	1	16	1	1	\N	\N	Lenovo ThinkPad Yoga 370 Noir (20JH002SFR)						8 Go	DDR4	8 Go	\N	\N		t	t	2018-05-14 11:38:53.305958+02	2018-05-14 11:38:53.305958+02
509	13	1	19	1	2	1	1	\N	\N	Lenovo Yoga 720-15IKB (80X7000YFR)						8 Go	DDR4	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:53.394747+02	2018-05-14 11:38:53.394747+02
510	14	1	81	1	25	1	1	\N	\N	Microsoft Surface Book 2 15" - i7-8650U - 16 Go - 256 Go						16 Go	DDR3	16 Go	\N	\N		t	t	2018-05-14 11:38:53.479922+02	2018-05-14 11:38:53.479922+02
511	14	1	81	1	25	1	1	\N	\N	Microsoft Surface Book 2 15" - i7-8650U - 16 Go - 512 Go						16 Go	DDR3	16 Go	\N	\N		t	t	2018-05-14 11:38:53.565698+02	2018-05-14 11:38:53.565698+02
512	16	1	1	1	16	1	1	\N	\N	Microsoft Surface Laptop - Intel Core i5 - 4 Go - SSD 128 Go						4 Go			\N	\N		t	t	2018-05-14 11:38:53.641303+02	2018-05-14 11:38:53.641303+02
513	16	1	1	1	60	1	1	\N	\N	Microsoft Surface Laptop - Intel Core i7 - 8 Go - SSD 256 Go						8 Go			\N	\N		t	t	2018-05-14 11:38:53.716213+02	2018-05-14 11:38:53.716213+02
514	14	1	82	1	16	1	1	\N	\N	Microsoft Surface Pro - Intel Core i5 - 4 Go - 128 Go						4 Go			\N	\N		t	t	2018-05-14 11:38:53.803241+02	2018-05-14 11:38:53.803241+02
515	14	1	83	1	60	1	1	\N	\N	Microsoft Surface Pro - Intel Core i7 - 8 Go - 256 Go						8 Go			\N	\N		t	t	2018-05-14 11:38:53.890721+02	2018-05-14 11:38:53.890721+02
516	14	1	84	1	34	1	1	\N	\N	Microsoft Surface Pro - Intel Core m3 - 4 Go - 128 Go						4 Go			\N	\N		t	t	2018-05-14 11:38:53.977906+02	2018-05-14 11:38:53.977906+02
517	14	1	66	1	46	1	1	\N	\N	Microsoft Surface Pro 4 - m3-6Y30 - 4 Go - 128 Go						4 Go			\N	\N		t	t	2018-05-14 11:38:54.066395+02	2018-05-14 11:38:54.066395+02
518	14	1	81	1	25	1	1	\N	\N	Microsoft Surface Book 2 15" - i7-8650U - 16 Go - 1 To						16 Go	DDR3	16 Go	\N	\N		t	t	2018-05-14 11:38:54.16216+02	2018-05-14 11:38:54.16216+02
519	14	1	82	1	16	1	1	\N	\N	Microsoft Surface Pro - Intel Core i5 - 8 Go - 256 Go						8 Go			\N	\N		t	t	2018-05-14 11:38:54.248302+02	2018-05-14 11:38:54.248302+02
520	14	1	85	1	61	1	1	\N	\N	Microsoft Surface Pro 4 - i7-6650U - 16 Go - 1 To avec clavier Type Cover AZERTY Noir						16 Go			\N	\N		t	t	2018-05-14 11:38:54.335636+02	2018-05-14 11:38:54.335636+02
521	14	1	85	1	61	1	1	\N	\N	Microsoft Surface Pro 4 - i7-6650U - 16 Go - 256 Go avec clavier Type Cover AZERTY Noir						16 Go			\N	\N		t	t	2018-05-14 11:38:54.423295+02	2018-05-14 11:38:54.423295+02
522	14	1	85	1	61	1	1	\N	\N	Microsoft Surface Pro 4 - i7-6650U - 16 Go - 512 Go avec clavier Type Cover AZERTY Noir						16 Go			\N	\N		t	t	2018-05-14 11:38:54.511117+02	2018-05-14 11:38:54.511117+02
523	14	1	85	1	61	1	1	\N	\N	Microsoft Surface Pro 4 - i7-6650U - 8 Go - 256 Go avec clavier Type Cover AZERTY Noir						8 Go			\N	\N		t	t	2018-05-14 11:38:54.597526+02	2018-05-14 11:38:54.597526+02
524	13	1	38	1	31	1	5	\N	\N	MSI CR62 6ML-028FR						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:54.701996+02	2018-05-14 11:38:54.701996+02
525	20	1	38	1	31	1	5	\N	\N	MSI CR62 6ML-029XFR						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:54.804038+02	2018-05-14 11:38:54.804038+02
526	13	1	54	1	31	1	5	\N	\N	MSI CR72 6ML-010FR						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:54.907607+02	2018-05-14 11:38:54.907607+02
527	13	1	38	1	31	1	5	\N	\N	MSI CR72 6ML-011FR						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:55.010971+02	2018-05-14 11:38:55.010971+02
528	13	1	15	1	3	1	1	\N	\N	MSI CX62 7QL-024FR						4 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:55.103952+02	2018-05-14 11:38:55.103952+02
529	13	1	13	1	62	1	5	\N	\N	MSI GE62 6QF-242FR Apache						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:55.212368+02	2018-05-14 11:38:55.212368+02
530	13	1	13	1	62	1	5	\N	\N	MSI GE62 6QF-242FR Apache + Pack MSI Back to School OFFERT !						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:55.31364+02	2018-05-14 11:38:55.31364+02
531	13	1	29	1	5	1	3	\N	\N	MSI GE62 7RE-021FR Apache						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:55.413102+02	2018-05-14 11:38:55.413102+02
532	13	1	29	1	5	1	3	\N	\N	MSI GE62 7RE-021FR Apache + Pack MSI Back to School OFFERT !						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:55.513093+02	2018-05-14 11:38:55.513093+02
533	13	1	29	1	5	1	3	\N	\N	MSI GE62 7RE-811FR Camo Squad + Pack d'accessoires						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:55.613817+02	2018-05-14 11:38:55.613817+02
534	13	1	39	1	25	1	3	\N	\N	MSI GE62VR 7RF-478FR Apache Pro						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:55.719394+02	2018-05-14 11:38:55.719394+02
535	20	1	19	1	25	1	3	\N	\N	MSI GE62VR 7RF-481XFR Apache Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:55.820156+02	2018-05-14 11:38:55.820156+02
536	20	1	86	1	25	1	3	\N	\N	MSI GE62VR 7RF-481XFR Apache Pro + Pack MSI Back to School OFFERT !						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:55.924404+02	2018-05-14 11:38:55.924404+02
537	20	1	39	1	25	1	3	\N	\N	MSI GE63VR 7RE-013XFR Raider						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:56.026597+02	2018-05-14 11:38:56.026597+02
538	13	1	39	1	25	1	3	\N	\N	MSI GE63VR 7RE-066FR Raider						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:56.141463+02	2018-05-14 11:38:56.141463+02
539	13	1	39	1	25	1	3	\N	\N	MSI GE63VR 7RE-098FR Raider						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:56.242108+02	2018-05-14 11:38:56.242108+02
540	20	1	39	1	32	1	3	\N	\N	MSI GE63VR 7RF-011XFR Raider						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:56.347194+02	2018-05-14 11:38:56.347194+02
541	13	1	39	1	32	1	3	\N	\N	MSI GE63VR 7RF-208FR Raider						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:56.4501+02	2018-05-14 11:38:56.4501+02
542	12	1	13	1	62	1	5	\N	\N	MSI GE72 6QF-049XFR Apache Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:56.552831+02	2018-05-14 11:38:56.552831+02
543	13	1	39	1	5	1	3	\N	\N	MSI GE72 7RE-066FR Apache						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:56.654714+02	2018-05-14 11:38:56.654714+02
544	13	1	29	1	32	1	3	\N	\N	MSI GE72MVR 7RG-055FR Apache Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:56.757513+02	2018-05-14 11:38:56.757513+02
545	13	1	29	1	32	1	3	\N	\N	MSI GE72MVR 7RG-071FR Apache Pro						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:56.860044+02	2018-05-14 11:38:56.860044+02
546	20	1	13	1	25	1	5	\N	\N	MSI GE72VR 6RF-238XFR Apache Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:56.967502+02	2018-05-14 11:38:56.967502+02
547	20	1	13	1	25	1	5	\N	\N	MSI GE72VR 6RF-238XFR Apache Pro + Pack MSI Back to School OFFERT !						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:57.075567+02	2018-05-14 11:38:57.075567+02
548	20	1	29	1	25	1	3	\N	\N	MSI GE72VR 7RF-427XFR Apache Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:57.188027+02	2018-05-14 11:38:57.188027+02
549	20	1	29	1	25	1	3	\N	\N	MSI GE72VR 7RF-427XFR Apache Pro + Pack MSI Back to School OFFERT !						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:57.294564+02	2018-05-14 11:38:57.294564+02
550	20	1	86	1	25	1	3	\N	\N	MSI GE72VR 7RF-428XFR Apache Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:57.402081+02	2018-05-14 11:38:57.402081+02
551	20	1	19	1	25	1	3	\N	\N	MSI GE72VR 7RF-428XFR Apache Pro + Pack MSI Back to School OFFERT !						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:57.504707+02	2018-05-14 11:38:57.504707+02
552	13	1	39	1	25	1	3	\N	\N	MSI GE73VR 7RE-017FR Raider						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:57.610148+02	2018-05-14 11:38:57.610148+02
553	20	1	39	1	25	1	3	\N	\N	MSI GE73VR 7RE-047XFR Raider						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:57.709534+02	2018-05-14 11:38:57.709534+02
554	13	1	39	1	25	1	3	\N	\N	MSI GE73VR 7RE-239FR Raider						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:57.814234+02	2018-05-14 11:38:57.814234+02
555	13	1	39	1	32	1	3	\N	\N	MSI GE73VR 7RF-016FR Raider						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:57.920714+02	2018-05-14 11:38:57.920714+02
556	20	1	39	1	32	1	3	\N	\N	MSI GE73VR 7RF-046XFR Raider						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:58.025102+02	2018-05-14 11:38:58.025102+02
557	13	1	39	1	32	1	3	\N	\N	MSI GE73VR 7RF-238FR Raider						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:58.131024+02	2018-05-14 11:38:58.131024+02
558	13	1	13	1	30	1	5	\N	\N	MSI GL62 6QF-624FR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:58.23703+02	2018-05-14 11:38:58.23703+02
559	20	1	19	1	2	1	3	\N	\N	MSI GL62M 7RDX-1628XFR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:58.340432+02	2018-05-14 11:38:58.340432+02
560	20	1	19	1	2	1	3	\N	\N	MSI GL62M 7RDX-1629XFR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:58.442403+02	2018-05-14 11:38:58.442403+02
561	20	1	29	1	2	1	3	\N	\N	MSI GL62M 7RDX-2074XFR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:58.545427+02	2018-05-14 11:38:58.545427+02
562	13	1	19	1	2	1	3	\N	\N	MSI GL62M 7RDX-2231FR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:58.652705+02	2018-05-14 11:38:58.652705+02
563	20	1	19	1	2	1	3	\N	\N	MSI GL62M 7RDX-2613XFR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:58.75451+02	2018-05-14 11:38:58.75451+02
564	13	1	19	1	5	1	3	\N	\N	MSI GL62M 7REX-2612FR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:58.859751+02	2018-05-14 11:38:58.859751+02
565	20	1	19	1	25	1	3	\N	\N	MSI GL62MVR 7RFX-1233XFR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:58.966156+02	2018-05-14 11:38:58.966156+02
566	13	1	19	1	2	1	3	\N	\N	MSI GL72 7RDX-446FR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:59.069023+02	2018-05-14 11:38:59.069023+02
567	20	1	19	1	2	1	3	\N	\N	MSI GL72M 7RDX-1453XFR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:59.17973+02	2018-05-14 11:38:59.17973+02
568	13	1	19	1	2	1	3	\N	\N	MSI GL72M 7RDX-858FR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:59.283262+02	2018-05-14 11:38:59.283262+02
569	20	1	19	1	5	1	3	\N	\N	MSI GP62 7RE-415XFR Leopard Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:59.387443+02	2018-05-14 11:38:59.387443+02
570	13	1	29	1	5	1	3	\N	\N	MSI GP62 7REX-818FR Leopard Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:59.489711+02	2018-05-14 11:38:59.489711+02
571	20	1	29	1	2	1	3	\N	\N	MSI GP62M 7RDX-1484XFR Leopard						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:59.593911+02	2018-05-14 11:38:59.593911+02
572	13	1	19	1	5	1	3	\N	\N	MSI GP62M 7REX-2063FR Leopard Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:59.694662+02	2018-05-14 11:38:59.694662+02
573	13	1	19	1	25	1	3	\N	\N	MSI GP62MVR 7RF-609FR Leopard Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:59.79883+02	2018-05-14 11:38:59.79883+02
574	20	1	19	1	25	1	3	\N	\N	MSI GP62MVR 7RFX-1010XFR Leopard Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:59.897552+02	2018-05-14 11:38:59.897552+02
575	20	1	19	1	25	1	3	\N	\N	MSI GP62MVR 7RFX-1010XFR Leopard Pro + Pack MSI Xmas 2017 OFFERT !						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:38:59.997884+02	2018-05-14 11:38:59.997884+02
576	13	1	19	1	25	1	3	\N	\N	MSI GP62MVR 7RFX-1011FR Leopard Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:00.104265+02	2018-05-14 11:39:00.104265+02
577	13	1	29	1	25	1	3	\N	\N	MSI GP62MVR 7RFX-842FR Leopard Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:00.21295+02	2018-05-14 11:39:00.21295+02
578	20	1	29	1	25	1	3	\N	\N	MSI GP62MVR 7RFX-847XFR Leopard Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:00.314218+02	2018-05-14 11:39:00.314218+02
579	20	1	19	1	5	1	3	\N	\N	MSI GP72 7RE-209XFR Leopard Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:00.416709+02	2018-05-14 11:39:00.416709+02
580	20	1	19	1	5	1	3	\N	\N	MSI GP72 7RE-210XFR Leopard Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:00.52208+02	2018-05-14 11:39:00.52208+02
581	13	1	19	1	2	1	3	\N	\N	MSI GP72M 7RDX-1259FR Leopard						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:00.627674+02	2018-05-14 11:39:00.627674+02
582	20	1	29	1	2	1	3	\N	\N	MSI GP72M 7RDX-871XFR Leopard						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:00.731279+02	2018-05-14 11:39:00.731279+02
583	13	1	29	1	5	1	3	\N	\N	MSI GP72M 7REX-1257FR Leopard Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:00.830339+02	2018-05-14 11:39:00.830339+02
584	13	1	19	1	5	1	3	\N	\N	MSI GP72M 7REX-1258FR Leopard Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:00.937194+02	2018-05-14 11:39:00.937194+02
585	13	1	29	1	25	1	3	\N	\N	MSI GP72MVR 7RFX-683FR Leopard Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:01.040452+02	2018-05-14 11:39:01.040452+02
586	13	1	19	1	25	1	3	\N	\N	MSI GP72MVR 7RFX-844FR Leopard Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:01.147139+02	2018-05-14 11:39:01.147139+02
587	20	1	19	1	25	1	3	\N	\N	MSI GP72VR 7RF-430XFR Leopard Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:01.255018+02	2018-05-14 11:39:01.255018+02
588	13	1	29	1	25	1	3	\N	\N	MSI GS43VR 7RE-086FR Phantom Pro						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:01.358185+02	2018-05-14 11:39:01.358185+02
589	14	1	39	1	2	1	3	\N	\N	MSI GS63 7RD-059FR Stealth						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:01.464228+02	2018-05-14 11:39:01.464228+02
590	13	1	39	1	5	1	3	\N	\N	MSI GS63 7RE-013FR Stealth Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:01.566513+02	2018-05-14 11:39:01.566513+02
591	20	1	39	1	5	1	3	\N	\N	MSI GS63 7RE-014XFR Stealth Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:01.672579+02	2018-05-14 11:39:01.672579+02
592	13	1	39	1	25	1	3	\N	\N	MSI GS63VR 7RF-262FR Stealth Pro 4K						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:01.778089+02	2018-05-14 11:39:01.778089+02
593	13	1	29	1	25	1	3	\N	\N	MSI GS63VR 7RF-263FR Stealth Pro						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:01.882539+02	2018-05-14 11:39:01.882539+02
594	20	1	39	1	25	1	3	\N	\N	MSI GS63VR 7RF-264XFR Stealth Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:01.984412+02	2018-05-14 11:39:01.984412+02
595	13	1	39	1	32	1	3	\N	\N	MSI GS63VR 7RG-009FR Stealth Pro						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:02.089059+02	2018-05-14 11:39:02.089059+02
596	13	1	39	1	32	1	3	\N	\N	MSI GS63VR 7RG-060FR Stealth Pro						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:02.201936+02	2018-05-14 11:39:02.201936+02
597	13	1	39	1	32	1	3	\N	\N	MSI GS63VR 7RG-092FR Stealth Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:02.306159+02	2018-05-14 11:39:02.306159+02
598	13	1	29	1	5	1	3	\N	\N	MSI GS73 7RE-006FR Stealth Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:02.410571+02	2018-05-14 11:39:02.410571+02
599	20	1	29	1	5	1	3	\N	\N	MSI GS73 7RE-007XFR Stealth Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:02.514177+02	2018-05-14 11:39:02.514177+02
600	13	1	29	1	25	1	3	\N	\N	MSI GS73VR 7RF-251FR Stealth Pro 4K						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:02.615193+02	2018-05-14 11:39:02.615193+02
601	20	1	29	1	25	1	3	\N	\N	MSI GS73VR 7RF-253XFR Stealth Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:02.727161+02	2018-05-14 11:39:02.727161+02
602	13	1	29	1	25	1	3	\N	\N	MSI GS73VR 7RF-428FR Stealth Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:02.83023+02	2018-05-14 11:39:02.83023+02
603	13	1	39	1	32	1	3	\N	\N	MSI GS73VR 7RG-012FR Stealth Pro 4K						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:02.931332+02	2018-05-14 11:39:02.931332+02
604	13	1	39	1	32	1	3	\N	\N	MSI GS73VR 7RG-049FR Stealth Pro						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:03.039667+02	2018-05-14 11:39:03.039667+02
605	13	1	39	1	32	1	3	\N	\N	MSI GS73VR 7RG-086FR Stealth Pro						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:03.144971+02	2018-05-14 11:39:03.144971+02
606	13	1	39	1	32	1	3	\N	\N	MSI GS73VR 7RG-088FR Stealth Pro						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:03.255674+02	2018-05-14 11:39:03.255674+02
607	20	1	48	1	32	1	5	\N	\N	MSI GT62VR 6RE-203XFR Dominator Pro						8 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:03.359876+02	2018-05-14 11:39:03.359876+02
608	13	1	39	1	25	1	3	\N	\N	MSI GT62VR 7RD-268FR Dominator						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:03.464828+02	2018-05-14 11:39:03.464828+02
609	13	1	39	1	25	1	3	\N	\N	MSI GT62VR 7RD-443FR Dominator						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:03.566239+02	2018-05-14 11:39:03.566239+02
610	13	1	29	1	32	1	3	\N	\N	MSI GT62VR 7RE-264FR Dominator Pro						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:03.671533+02	2018-05-14 11:39:03.671533+02
611	13	1	87	1	63	1	5	\N	\N	MSI GT72S 6QF-067FR Dominator Pro G + Pack Spécial Printemps OFFERT !						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:03.77321+02	2018-05-14 11:39:03.77321+02
612	13	1	29	1	25	1	3	\N	\N	MSI GT73EVR 7RD-828FR Titan						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:03.875483+02	2018-05-14 11:39:03.875483+02
613	20	1	29	1	25	1	3	\N	\N	MSI GT73EVR 7RD-829XFR Titan						8 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:03.977951+02	2018-05-14 11:39:03.977951+02
614	13	1	29	1	32	1	3	\N	\N	MSI GT73EVR 7RE-827FR Titan						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:04.081742+02	2018-05-14 11:39:04.081742+02
615	13	1	29	1	17	1	3	\N	\N	MSI GT73EVR 7RF-1012FR Titan Pro						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:04.182044+02	2018-05-14 11:39:04.182044+02
616	13	1	87	1	38	1	9	\N	\N	MSI GT73VR 6RE-073FR Titan SLI 4K						32 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:04.287777+02	2018-05-14 11:39:04.287777+02
617	13	1	40	1	38	1	7	\N	\N	MSI GT73VR 7RE-486FR Titan SLI 4K						32 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:04.406818+02	2018-05-14 11:39:04.406818+02
618	13	1	40	1	32	1	7	\N	\N	MSI GT73VR 7RE-492FR Titan						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:04.510045+02	2018-05-14 11:39:04.510045+02
619	13	1	29	1	32	1	3	\N	\N	MSI GT73VR 7RE-493FR Titan						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:04.613376+02	2018-05-14 11:39:04.613376+02
620	13	1	40	1	17	1	7	\N	\N	MSI GT73VR 7RF-475FR Titan Pro 4K						32 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:04.712982+02	2018-05-14 11:39:04.712982+02
621	13	1	29	1	17	1	7	\N	\N	MSI GT73VR 7RF-491FR Titan Pro						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:04.816393+02	2018-05-14 11:39:04.816393+02
622	13	1	40	1	38	1	7	\N	\N	MSI GT75VR 7RE-061FR Titan SLI 4K						32 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:04.917663+02	2018-05-14 11:39:04.917663+02
623	13	1	40	1	17	1	7	\N	\N	MSI GT75VR 7RF-062FR Titan Pro 4K						32 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:05.017456+02	2018-05-14 11:39:05.017456+02
624	13	1	40	1	17	1	7	\N	\N	MSI GT75VR 7RF-063FR Titan Pro						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:05.116941+02	2018-05-14 11:39:05.116941+02
625	13	1	39	1	2	1	3	\N	\N	MSI PE60 7RD-484FR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:05.230553+02	2018-05-14 11:39:05.230553+02
626	14	1	39	1	2	1	3	\N	\N	MSI PE62 7RD-1668FR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:05.33474+02	2018-05-14 11:39:05.33474+02
627	13	1	39	1	2	1	3	\N	\N	MSI PE72 7RD-1230FR						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:05.436136+02	2018-05-14 11:39:05.436136+02
628	14	1	39	1	2	1	3	\N	\N	MSI PE72 7RD-1265FR						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:05.540033+02	2018-05-14 11:39:05.540033+02
629	14	1	29	1	51	1	3	\N	\N	MSI WE62 7RI-2002FR						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:05.643907+02	2018-05-14 11:39:05.643907+02
630	14	1	29	1	53	1	3	\N	\N	MSI WE62 7RJ-1836FR						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:05.747614+02	2018-05-14 11:39:05.747614+02
631	14	1	29	1	53	1	3	\N	\N	MSI WE72 7RJ-1035FR						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:05.851204+02	2018-05-14 11:39:05.851204+02
632	14	1	29	1	53	1	7	\N	\N	MSI WS60 7RJ-678FR						16 Go	DDR4 ECC	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:05.952053+02	2018-05-14 11:39:05.952053+02
633	14	1	88	1	53	1	7	\N	\N	MSI WS60 7RJ-679FR						16 Go	DDR4 ECC	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:06.055925+02	2018-05-14 11:39:06.055925+02
634	14	1	29	1	52	1	3	\N	\N	MSI WS63 7RK-405FR						32 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:06.159842+02	2018-05-14 11:39:06.159842+02
635	14	1	29	1	52	1	3	\N	\N	MSI WS63 7RK-406FR						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:06.269346+02	2018-05-14 11:39:06.269346+02
636	14	1	29	1	64	1	3	\N	\N	MSI WS63VR 7RL-053FR						32 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:06.375122+02	2018-05-14 11:39:06.375122+02
637	14	1	88	1	65	1	7	\N	\N	MSI WT73VR 7RM-633FR						64 Go	DDR4 ECC	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:06.477485+02	2018-05-14 11:39:06.477485+02
638	14	1	88	1	65	1	7	\N	\N	MSI WT73VR 7RM-634FR						32 Go	DDR4 ECC		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:06.5786+02	2018-05-14 11:39:06.5786+02
639	20	1	29	1	5	1	3	\N	\N	MSI GE62 7RE-024XFR Apache						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:06.681745+02	2018-05-14 11:39:06.681745+02
640	20	1	29	1	5	1	3	\N	\N	MSI GE62 7RE-024XFR Apache + Pack MSI Back to School OFFERT !						8 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:06.786642+02	2018-05-14 11:39:06.786642+02
641	13	1	48	1	62	1	5	\N	\N	MSI GS72 6QE-408FR Stealth Pro - Garantie 2 ans + 1 an OFFERT !						16 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:06.889809+02	2018-05-14 11:39:06.889809+02
642	13	1	40	1	32	1	7	\N	\N	MSI GT75VR 7RE-064FR Titan						16 Go	DDR4	64 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:06.992274+02	2018-05-14 11:39:06.992274+02
643	13	1	89	1	25	1	1	\N	\N	Razer Blade 14" (RZ09-01953F71-R3F1)						16 Go	DDR4		\N	\N		t	t	2018-05-14 11:39:07.081366+02	2018-05-14 11:39:07.081366+02
644	13	1	89	1	25	1	1	\N	\N	Razer Blade 14" (RZ09-01953F73-R3F1)						16 Go	DDR4		\N	\N		t	t	2018-05-14 11:39:07.169406+02	2018-05-14 11:39:07.169406+02
645	13	1	40	1	17	1	7	\N	\N	Razer Blade Pro (RZ09-01663F52-R3F1)						32 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:07.277144+02	2018-05-14 11:39:07.277144+02
646	13	1	40	1	17	1	7	\N	\N	Razer Blade Pro (RZ09-01663F53-R3F1)						32 Go	DDR4	32 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:07.387017+02	2018-05-14 11:39:07.387017+02
647	13	1	29	1	25	1	3	\N	\N	Razer Blade Pro (RZ09-02202F75-R3F1)						16 Go	DDR4		\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:07.496746+02	2018-05-14 11:39:07.496746+02
648	13	1	28	1	33	1	1	\N	\N	Razer Blade Stealth 13.3" (RZ09-02393F31-R3F1)						16 Go	DDR3L (1.35V)	16 Go	\N	\N		t	t	2018-05-14 11:39:07.584108+02	2018-05-14 11:39:07.584108+02
649	13	1	28	1	33	1	1	\N	\N	Razer Blade Stealth 13.3" (RZ09-02393F32-R3F1)						16 Go	DDR3L (1.35V)	16 Go	\N	\N		t	t	2018-05-14 11:39:07.675074+02	2018-05-14 11:39:07.675074+02
650	13	1	89	1	25	1	1	\N	\N	Razer Blade 14" (RZ09-01953F72-R3F1)						16 Go	DDR4		\N	\N		t	t	2018-05-14 11:39:07.759675+02	2018-05-14 11:39:07.759675+02
651	13	1	90	1	12	1	1	\N	\N	Thomson THBK2-12.32CTW						2 Go	DDR3		\N	\N	Wi-Fi B (IEEE 802.11b), Wi-Fi G (IEEE 802.11g), Wi-Fi N 150 Mbps (IEEE 802.11n)	t	t	2018-05-14 11:39:07.8457+02	2018-05-14 11:39:07.8457+02
652	21	1	45	1	20	1	1	\N	\N	Toshiba Portégé A30-C-10H						4 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:07.933618+02	2018-05-14 11:39:07.933618+02
653	14	1	45	1	20	1	1	\N	\N	Toshiba Portégé A30-C-1CZ						8 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:08.020376+02	2018-05-14 11:39:08.020376+02
654	14	1	20	1	20	1	1	\N	\N	Toshiba Portégé A30-C-1DT						4 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:08.110032+02	2018-05-14 11:39:08.110032+02
655	14	1	43	1	16	1	1	\N	\N	Toshiba Portégé X20W-D-10V						8 Go	DDR3L (1.35V)	8 Go	\N	\N		t	t	2018-05-14 11:39:08.195372+02	2018-05-14 11:39:08.195372+02
656	14	1	43	1	16	1	1	\N	\N	Toshiba Portégé X30-D-10Z						8 Go	DDR4	32 Go	\N	\N		t	t	2018-05-14 11:39:08.290882+02	2018-05-14 11:39:08.290882+02
657	14	1	15	1	16	1	1	\N	\N	Toshiba Portégé X30-D-111						8 Go	DDR4	32 Go	\N	\N		t	t	2018-05-14 11:39:08.377541+02	2018-05-14 11:39:08.377541+02
658	14	1	14	1	16	1	1	\N	\N	Toshiba Portégé X30-D-112						8 Go	DDR4	32 Go	\N	\N		t	t	2018-05-14 11:39:08.468158+02	2018-05-14 11:39:08.468158+02
659	14	1	69	1	46	1	1	\N	\N	Toshiba Portégé Z20t-C-13Q						8 Go	DDR3L (1.35V)	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:08.553487+02	2018-05-14 11:39:08.553487+02
660	14	1	45	1	20	1	1	\N	\N	Toshiba Portégé Z30-C-176						8 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:08.644822+02	2018-05-14 11:39:08.644822+02
661	17	1	45	1	20	1	1	\N	\N	Toshiba Satellite Pro A50-C-1G9						4 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:08.733387+02	2018-05-14 11:39:08.733387+02
662	14	1	45	1	20	1	1	\N	\N	Toshiba Satellite Pro A50-C-204						4 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:08.823164+02	2018-05-14 11:39:08.823164+02
663	14	1	45	1	20	1	1	\N	\N	Toshiba Satellite Pro A50-C-206						8 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:08.908849+02	2018-05-14 11:39:08.908849+02
664	14	1	38	1	31	1	1	\N	\N	Toshiba Satellite Pro R50-C-14G						4 Go	DDR3L (1.35V)	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:08.998598+02	2018-05-14 11:39:08.998598+02
665	13	1	54	1	31	1	1	\N	\N	Toshiba Satellite Pro R50-C-14N						4 Go	DDR3L (1.35V)	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:09.090887+02	2018-05-14 11:39:09.090887+02
666	14	1	54	1	31	1	1	\N	\N	Toshiba Satellite Pro R50-C-14P						4 Go	DDR3L (1.35V)	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:09.177393+02	2018-05-14 11:39:09.177393+02
667	14	1	91	1	31	1	1	\N	\N	Toshiba Satellite Pro R50-C-15P						4 Go	DDR3L (1.35V)	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:09.273167+02	2018-05-14 11:39:09.273167+02
668	14	1	20	1	20	1	1	\N	\N	Toshiba Tecra A50-C-1ZQ						4 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:09.359719+02	2018-05-14 11:39:09.359719+02
669	14	1	45	1	20	1	1	\N	\N	Toshiba Tecra A50-C-1ZV						8 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:09.447403+02	2018-05-14 11:39:09.447403+02
670	14	1	45	1	66	1	1	\N	\N	Toshiba Tecra A50-C-21C						8 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:09.537541+02	2018-05-14 11:39:09.537541+02
671	14	1	45	1	20	1	1	\N	\N	Toshiba Tecra A50-C-C217						4 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:09.62025+02	2018-05-14 11:39:09.62025+02
672	14	1	14	1	16	1	1	\N	\N	Toshiba Tecra X40-D-10T						8 Go	DDR4	32 Go	\N	\N		t	t	2018-05-14 11:39:09.714835+02	2018-05-14 11:39:09.714835+02
673	14	1	14	1	16	1	1	\N	\N	Toshiba Portégé X30-D-126						8 Go	DDR4	32 Go	\N	\N		t	t	2018-05-14 11:39:09.803993+02	2018-05-14 11:39:09.803993+02
674	14	1	69	1	46	1	1	\N	\N	Toshiba Portégé Z20t-C-15H						8 Go	DDR3L (1.35V)	8 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:09.890145+02	2018-05-14 11:39:09.890145+02
675	14	1	45	1	20	1	1	\N	\N	Toshiba Portégé Z30-C-16K						8 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:09.975841+02	2018-05-14 11:39:09.975841+02
676	14	1	46	1	20	1	1	\N	\N	Toshiba Portégé Z30-C-16M						8 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:10.06523+02	2018-05-14 11:39:10.06523+02
677	14	1	46	1	20	1	1	\N	\N	Toshiba Portégé Z30-C-16P						16 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:10.158419+02	2018-05-14 11:39:10.158419+02
678	14	1	45	1	20	1	1	\N	\N	Toshiba Satellite Pro A50-C-205						8 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:10.245303+02	2018-05-14 11:39:10.245303+02
679	14	1	25	1	20	1	1	\N	\N	Toshiba Satellite Pro A50-C-256						4 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:10.33868+02	2018-05-14 11:39:10.33868+02
680	14	1	46	1	66	1	1	\N	\N	Toshiba Satellite Pro A50-C-26Q						8 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:10.426718+02	2018-05-14 11:39:10.426718+02
681	14	1	45	1	20	1	1	\N	\N	Toshiba Tecra A40-C-1DE						8 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:10.512622+02	2018-05-14 11:39:10.512622+02
682	14	1	45	1	20	1	1	\N	\N	Toshiba Tecra A50-C-1ZR						4 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:10.601042+02	2018-05-14 11:39:10.601042+02
683	14	1	46	1	66	1	1	\N	\N	Toshiba Tecra A50-C-21E						8 Go	DDR3L (1.35V)	16 Go	\N	\N	10/100/1000 Mbps	t	t	2018-05-14 11:39:10.686435+02	2018-05-14 11:39:10.686435+02
\.


--
-- Data for Name: computers_activities; Type: TABLE DATA; Schema: public; Owner: node
--

COPY public.computers_activities (id, name, description) FROM stdin;
1	N/A	\N
\.


--
-- Data for Name: computers_chipsets; Type: TABLE DATA; Schema: public; Owner: node
--

COPY public.computers_chipsets (id, name, description) FROM stdin;
1	N/A	\N
2	Intel HM175	\N
3	Mobile Intel HM175 Express	\N
4	Mobile Intel® HM175	\N
5	Mobile Intel HM170 Express	\N
6	Mobile Intel HM86 Express	\N
7	Mobile Intel CM238 Express	\N
8	AMD B350	\N
9	Mobile Intel CM236 Express	\N
10	Mobile Intel HM77 Express	\N
\.


--
-- Data for Name: computers_cpus; Type: TABLE DATA; Schema: public; Owner: node
--

COPY public.computers_cpus (id, name, description) FROM stdin;
1	N/A	\N
2	Intel Core i5 7300HQ, 4 Cœurs	\N
3	Intel Core i5 7300HQ	\N
4	Intel Core i7 7700HQ	\N
5	Intel Core i7 7500U	\N
6	AMD A9-9420	\N
7	Intel Core i3 6006U	\N
8	Intel Core i3 7100U	\N
9	Intel Core i5 7200U	\N
10	Intel Core i7 8550U	\N
11	Intel Core i7 i7-7700HQ	\N
12	Intel Core i3-6100H (Dual-Core 2.7 GHz - Cache 3 Mo)	\N
13	Intel Core i5-6300HQ (Quad-Core 2.3 GHz / 3.2 GHz Turbo - Cache 6 Mo)	\N
14	Intel Core i5-7200U (Dual-Core 2.5 GHz / 3.1 GHz Turbo - Cache 3 Mo)	\N
15	Intel Core i3-7100U (Dual-Core 2.4 GHz - Cache 3 Mo)	\N
16	Intel Core i7-7700K (Quad-Core 4.2 GHz / 4.4 GHz Turbo - Cache 8 Mo)	\N
17	Intel Celeron N3350 (Dual-Core 1.1 GHz / 2.4 GHz Rafale - Cache 2 Mo)	\N
18	Intel Celeron N3450 (Quad-Core 1.1 GHz / 2.2 GHz Rafale - Cache 2 Mo)	\N
19	Intel Core i5-7300HQ (Quad-Core 2.5 GHz / 3.5 GHz Turbo - Cache 6 Mo)	\N
20	Intel Core i3-6100U (Dual-Core 2.3 GHz - Cache 3 Mo)	\N
21	AMD A6-9220 (Dual Core 2.5 GHz / 2.9 GHz Turbo - Cache 1 Mo)	\N
22	AMD A9-9420 (Dual-Core 3.0 GHz / Turbo 3.6 GHz - Cache 1 Mo)	\N
23	Intel Celeron N3350 (Dual-Core 1.1 GHz / 2.4 GHz Turbo - Cache 2 Mo)	\N
24	Intel Pentium N4200 (Quad-Core 1.1 GHz / 2.5 GHz Rafale - Cache 2 Mo)	\N
25	Intel Core i3-6006U (Dual-Core 2 GHz - Cache 3 Mo)	\N
26	Intel Core i7-7500U (Dual-Core 2.7 GHz / 3.5 GHz Turbo - Cache 4 Mo)	\N
27	Intel Core i5-8250U (Quad-Core 1.6 GHz / 3.4 GHz Turbo - Cache 6 Mo)	\N
28	Intel Core i7-8550U (Quad-Core 1.8 GHz / 4 GHz Turbo - Cache 8 Mo)	\N
29	Intel Core i7-7700HQ (Quad-Core 2.8 GHz / 3.8 GHz Turbo - Cache 6 Mo)	\N
30	AMD A6-9210 (Dual Core 2.4 GHz / 2.8 GHz Turbo - Cache 1 Mo)	\N
31	Intel Core i5-7200U (Dual-Core 2.5 GHz / 3.1 GHz Turbo - cache 3 Mo)	\N
32	AMD E1-7010 (Dual Core 1.5 GHz - Cache 1 Mo)	\N
33	AMD A6-7310 (Quad Core 2.0 GHz / 2.4 GHz Turbo - Cache 2 Mo)	\N
34	Intel Pentium N3700 (Quad-Core 1.6 GHz - Turbo 2.4 GHz - Cache 2 Mo)	\N
35	Intel Pentium N4200 (Quad-Core 1.1 GHz - Cache 2 Mo)	\N
36	Intel Core i5-6200U (Dual-Core 2.3 GHz / 2.8 GHz Turbo - cache 3 Mo)	\N
37	Intel Core i5-6300HQ (Quad-Core 2.3 GHz / 3.2 GHz Turbo - cache 6 Mo)	\N
38	Intel Celeron 3855U (Dual-Core 1.6 GHz - Cache 2 Mo)	\N
39	Intel Core i7-7700HQ (Quad-Core 2.8 GHz / 3.8 GHz Turbo - Cache 8 Mo)	\N
40	Intel Core i7-7820HK (Quad-Core 2.9 GHz / 3.9 GHz Turbo - Cache 8 Mo)	\N
41	Intel Core i3-6006U (Dual-Core 2.0 GHz - Cache 3 Mo)	\N
42	Intel Core i7-7Y75 (Dual-Core 1.3 GHz / 3.6 GHz Turbo - Cache 4 Mo)	\N
43	Intel Core i7-7500U (Dual-Core 2.7 GHz / 3.5 GHz Turbo - cache 4 Mo)	\N
44	Intel Core i5-7Y54 (Dual-Core 1.2 GHz / 3.2 GHz Turbo - cache 4 Mo)	\N
45	Intel Core i5-6200U (Dual-Core 2.3 GHz / 2.8 GHz Turbo - Cache 3 Mo)	\N
46	Intel Core i7-6500U (Dual-Core 2.5 GHz / 3.1 GHz Turbo - Cache 4 Mo)	\N
47	Intel Core i3-5005U (Dual-Core 2 GHz - Cache 3 Mo)	\N
48	Intel Core i7-6700HQ (Quad-Core 2.6 GHz / 3.5 GHz Turbo - Cache 6 Mo)	\N
49	Intel Celeron N3050 (Dual-Core 1.6 GHz / 2.16 GHz Rafale - Cache 2 Mo)	\N
50	Intel Celeron N3060 (Dual-Core 1.6 GHz / 2.48 GHz Rafale - Cache 2 Mo)	\N
51	Intel Atom x5-Z8350 (Quad-Core 1.44 GHz / 1.92 GHz Rafale - Cache 2 Mo)	\N
52	Intel Pentium N3710 (Quad-Core 1.6 GHz / 2.56 GHz Rafale - Cache 2 Mo)	\N
53	Intel Core i3-4000M (Dual-Core 2.4 GHz - Cache 3 Mo - TDP 37W)	\N
54	Intel Pentium 4405U (Dual-Core 2.1 GHz - Cache 2 Mo)	\N
55	Intel Core i5-4200H (Dual-Core 2.8 GHz / 3.4 GHz Turbo - cache 3 Mo)	\N
56	Intel Core i7-7200U (Dual-Core 2.5 GHz / 3.1 GHz Turbo - Cache 3 Mo)	\N
57	Intel Core i3-6006U (Dual-Core 2 GHz - Cache 3 Mo)	\N
58	Intel Core i7-6700HQ (Quad-Core 2.6 GHz / 3.5 GHz Turbo - Cache 8 Mo)	\N
59	AMD Ryzen 7 1700 (Octo-Core 3 GHz / 3.7 GHz Turbo - Cache 16 Mo)	\N
60	Intel Atom x5-Z5800 (Quad-Core 1.44 GHz / 2.24 GHz Rafale - Cache 2 Mo)	\N
61	Intel Atom x5-Z8350 (Quad-Core 1.44 GHz / 2.24 GHz Turbo - Cache 2 Mo)	\N
62	Intel Core m7-6Y75 (Dual-Core 1.2 GHz / 3.1 GHz Turbo - Cache 4 Mo)	\N
63	Intel Atom x5-Z8350 (Quad-Core 1.44 GHz - Cache 2 Mo)	\N
64	Intel Pentium N3710 (Quad-Core 1.6 GHz - Cache 2 Mo)	\N
65	Intel Core i5-6200U (Dual-Core 2.3 GHz / 2.8 GHz - Cache 3 Mo)	\N
66	Intel Core m3-6Y30 (Dual-Core 0.9 GHz / 2.2 GHz Turbo - Cache 4 Mo)	\N
67	Intel Core i5-8250U (Quad-Core 1.6 GHz / 3.4 GHz Turbo - Cache 6 Mo)	\N
68	Intel Core i7-6500U (Dual-Core 2.5 GHz / 3.1 GHz Turbo - Cache 3 Mo)	\N
69	Intel Core m5-6Y54 (Dual-Core 1.1 GHz / 2.7 GHz Turbo - Cache 4 Mo)	\N
70	AMD PRO A12-9800B (Quad-Core 2.7 GHz / 3.6 GHz Turbo)	\N
71	Intel Core i7-7820HQ (Quad-Core 2.9 GHz / 3.9 GHz Turbo - Cache 8 Mo)	\N
72	Intel Core i5-5200U (Dual-Core 2.2 GHz / 2.7 GHz - Cache 3 Mo)	\N
73	AMD E2-9000 (Dual Core 1.8 GHz / 2.2 GHz - Cache 1 Mo)	\N
74	AMD A9-9420 (Dual Core 3 GHz / 3.6 GHz Turbo - Cache 1 Mo)	\N
75	Intel Core i3-4010U (Dual-Core 1.7 GHz - Cache 3 Mo)	\N
76	Intel Pentium 4415U (Dual-Core 2.3 GHz - Cache 2 Mo)	\N
77	Intel Core i7-7500U (Dual-Core 2.7 GHz, Turbo 3.5 GHz - Cache 4 Mo)	\N
78	Intel Core i5-7200U (Dual-Core 2.5 GHz, Turbo 3.1 GHz - Cache 3 Mo)	\N
79	Intel Core i5-7200U (Dual-Core 2.5 GHz - Cache 3 Mo)	\N
80	Intel Atom x5-Z8550 (Quad-Core 1.44 GHz / 2.4 GHz Rafale - Cache 2 Mo)	\N
81	Intel Core i7-8650U (Quad-Core 1.9 GHz / Turbo 4.2 GHz - Cache 8 Mo)	\N
82	Intel Core i5	\N
83	Intel Core i7	\N
84	Intel Core m3	\N
85	Intel Core i7-6650U (Dual-Core 2.2 GHz / 3.4 GHz Turbo - Cache 4 Mo)	\N
86	Intel Core i5-7300HQ (Dual-Core 2.5 GHz / 3.1 GHz Turbo - Cache 3 Mo)	\N
87	Intel Core i7-6820HK (Quad-Core 2.7 GHz / 3.6 GHz Turbo - Cache 8 Mo)	\N
88	Intel Xeon E3-1505M v6 (Quad-Core 3 GHz / 4 GHz Turbo - Cache 8 Mo)	\N
89	Intel Core i7-7700HQ (Quad-Core 2.8 GHz / 3.8 GHz Turbo - Cache 6 Mo - TDP 45W)	\N
90	Intel Cherry Trail Z8300 (Quad-Core 1.44 GHz / 1.84 GHz - Cache 2 Mo)	\N
91	Intel Core i3-6006U (Dual-Core 2.0 GHz - Cache 3 Mo - TDP 15W)	\N
\.


--
-- Data for Name: computers_gpus; Type: TABLE DATA; Schema: public; Owner: node
--

COPY public.computers_gpus (id, name, description) FROM stdin;
1	N/A	\N
2	NVIDIA GeForce GTX 1050	\N
3	NVIDIA GeForce 940MX	\N
4	AMD Radeon R5	\N
5	NVIDIA GeForce GTX 1050 Ti	\N
6	NVIDIA GeForce 920MX (N16V-GMR1)	\N
7	Intégré Carte graphique Intel® HD 620	\N
8	520 AMD Radeon	\N
9	NVIDIA® GeForce® GTX 1080	\N
10	Intel HD 620	\N
11	NVIDIA GeForce 920MX 2G (N16V-GMR1)	\N
12	Intel HD Graphics	\N
13	NVIDIA GeForce 930MX (N16S-GMR)	\N
14	NVIDIA GeForce GTX1060, Intel HD Graphics 630	\N
15	Intel HD Graphics 530	\N
16	Intel HD Graphics 620	\N
17	NVIDIA GeForce GTX 1080	\N
18	2 x NVIDIA GeForce GTX 1080	\N
19	Intel HD Graphics 500	\N
20	Intel HD Graphics 520	\N
21	AMD Radeon R4	\N
22	AMD Radeon 520	\N
23	NVIDIA GeForce MX130	\N
24	NVIDIA GeForce MX150	\N
25	NVIDIA GeForce GTX 1060	\N
26	AMD Radeon R5 M430, AMD Radeon R4	\N
27	NVIDIA GeForce GTX 950M	\N
28	AMD Radeon R2	\N
29	Intel HD Graphics 505	\N
30	NVIDIA GeForce GTX 960M	\N
31	Intel HD Graphics 510	\N
32	NVIDIA GeForce GTX 1070	\N
33	Intel UHD Graphics 620	\N
34	Intel HD Graphics 615	\N
35	Intel HD Graphics 5500	\N
36	NVIDIA GeForce 920M	\N
37	NVIDIA GeForce GTX 980M	\N
38	2 x NVIDIA GeForce GTX 1070	\N
39	Intel HD Graphics 400	\N
40	Intel HD Graphics 405	\N
41	NVIDIA GeForce 920MX	\N
42	NVIDIA GeForce 940M	\N
43	NVIDIA GeForce 930MX	\N
44	Intel HD Graphics 4600	\N
45	AMD Radeon RX 580	\N
46	Intel HD Graphics 515	\N
47	AMD Radeon R5 M420	\N
48	NVIDIA GeForce 810M	\N
49	AMD Radeon R7	\N
50	AMD Radeon R7 M340	\N
51	NVIDIA Quadro M1200	\N
52	NVIDIA Quadro P3000	\N
53	NVIDIA Quadro M2200	\N
54	AMD Radeon R5 M330	\N
55	AMD Radeon 530	\N
56	AMD Radeon RX 550	\N
57	Intel HD Graphics 4400	\N
58	NVIDIA Quadro M500M	\N
59	AMD Radeon R5 M430	\N
60	Intel Iris Plus Graphics 640	\N
61	Intel Iris Graphics 540	\N
62	NVIDIA GeForce GTX 970M	\N
63	NVIDIA GeForce GTX 980	\N
64	NVIDIA Quadro P4000	\N
65	NVIDIA Quadro P5000	\N
66	NVIDIA GeForce 930M	\N
\.


--
-- Data for Name: computers_keyboards; Type: TABLE DATA; Schema: public; Owner: node
--

COPY public.computers_keyboards (id, name, description) FROM stdin;
1	N/A	\N
\.


--
-- Data for Name: computers_os; Type: TABLE DATA; Schema: public; Owner: node
--

COPY public.computers_os (id, name, description) FROM stdin;
1	N/A	\N
2	Microsoft Windows 10 Edition Famille à 64 bits	\N
3	Microsoft Windows 10	\N
4	Microsoft Windows 10 Edition Famille à 64 bits **	\N
5	Microsoft Windows 10 Edition Famille à 64 bits**	\N
6	Microsoft Windows 10 à 64 bits	\N
7	Microsoft Windows 10 à 64 bits**	\N
8	Microsoft Windows 10 Windows 10 Edition Famille**	\N
9	Microsoft Windows 10 Edition Famille à 647 bits**	\N
10	Microsoft Windows 10 Edition Famille**	\N
11	Microsoft Windows 10 64 bits	\N
12	Aucun	\N
13	Windows 10 Famille 64 bits	\N
14	Windows 10 Professionnel 64 bits	\N
15	Chrome OS	\N
16	Windows 10 S	\N
17	Windows 7 Professionnel 64 bits, Windows 10 Professionnel 64 bits	\N
18	Endless OS	\N
19	Windows 7 Professionnel 64 bits, Windows 8.1 Pro 64 bits	\N
20	Free DOS	\N
21	Windows 10 Professionnel 64 bits, Windows 7 Professionnel 64 bits	\N
22	Windows 8.1 Pro 64 bits	\N
23	Android 6.0 (Marshmallow)	\N
\.


--
-- Data for Name: computers_prices; Type: TABLE DATA; Schema: public; Owner: node
--

COPY public.computers_prices (id, "computerId", "traderId", pricing, url, createdat) FROM stdin;
\.


--
-- Data for Name: computers_quests; Type: TABLE DATA; Schema: public; Owner: node
--

COPY public.computers_quests (id, "activityId", quest, domain, createdat, updatedat) FROM stdin;
\.


--
-- Data for Name: computers_quests_resps; Type: TABLE DATA; Schema: public; Owner: node
--

COPY public.computers_quests_resps (id, "questId", resp, indice) FROM stdin;
\.


--
-- Data for Name: computers_screens; Type: TABLE DATA; Schema: public; Owner: node
--

COPY public.computers_screens (id, type, resolution, size, refresh_rate, description) FROM stdin;
1	N/A	\N	\N	\N	\N
\.


--
-- Data for Name: computers_traders; Type: TABLE DATA; Schema: public; Owner: node
--

COPY public.computers_traders (id, name, description) FROM stdin;
1	LDLC	\N
2	Fnac	\N
3	Materiel.NET	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: node
--

COPY public.users (id, "roleId", "authId", firstname, lastname, email, password, active, createdat, updatedat) FROM stdin;
\.


--
-- Data for Name: users_auth; Type: TABLE DATA; Schema: public; Owner: node
--

COPY public.users_auth (id, name, description) FROM stdin;
1	local	Local auth
2	twitter	Twitter oauth2
3	facebook	Facebook oauth2
\.


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: node
--

COPY public.users_roles (id, name, description) FROM stdin;
1	user	users class
2	moderator	Moderator class
3	admin	Admin class
\.


--
-- Name: computers_activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: node
--

SELECT pg_catalog.setval('public.computers_activities_id_seq', 1, true);


--
-- Name: computers_chipsets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: node
--

SELECT pg_catalog.setval('public.computers_chipsets_id_seq', 10, true);


--
-- Name: computers_cpus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: node
--

SELECT pg_catalog.setval('public.computers_cpus_id_seq', 91, true);


--
-- Name: computers_gpus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: node
--

SELECT pg_catalog.setval('public.computers_gpus_id_seq', 66, true);


--
-- Name: computers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: node
--

SELECT pg_catalog.setval('public.computers_id_seq', 683, true);


--
-- Name: computers_keyboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: node
--

SELECT pg_catalog.setval('public.computers_keyboards_id_seq', 1, true);


--
-- Name: computers_os_id_seq; Type: SEQUENCE SET; Schema: public; Owner: node
--

SELECT pg_catalog.setval('public.computers_os_id_seq', 23, true);


--
-- Name: computers_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: node
--

SELECT pg_catalog.setval('public.computers_prices_id_seq', 1, false);


--
-- Name: computers_quests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: node
--

SELECT pg_catalog.setval('public.computers_quests_id_seq', 1, false);


--
-- Name: computers_quests_resps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: node
--

SELECT pg_catalog.setval('public.computers_quests_resps_id_seq', 1, false);


--
-- Name: computers_screens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: node
--

SELECT pg_catalog.setval('public.computers_screens_id_seq', 1, true);


--
-- Name: computers_traders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: node
--

SELECT pg_catalog.setval('public.computers_traders_id_seq', 3, true);


--
-- Name: users_auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: node
--

SELECT pg_catalog.setval('public.users_auth_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: node
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: users_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: node
--

SELECT pg_catalog.setval('public.users_roles_id_seq', 3, true);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: computers_activities computers_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_activities
    ADD CONSTRAINT computers_activities_pkey PRIMARY KEY (id);


--
-- Name: computers_chipsets computers_chipsets_pkey; Type: CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_chipsets
    ADD CONSTRAINT computers_chipsets_pkey PRIMARY KEY (id);


--
-- Name: computers_cpus computers_cpus_pkey; Type: CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_cpus
    ADD CONSTRAINT computers_cpus_pkey PRIMARY KEY (id);


--
-- Name: computers_gpus computers_gpus_pkey; Type: CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_gpus
    ADD CONSTRAINT computers_gpus_pkey PRIMARY KEY (id);


--
-- Name: computers_keyboards computers_keyboards_pkey; Type: CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_keyboards
    ADD CONSTRAINT computers_keyboards_pkey PRIMARY KEY (id);


--
-- Name: computers_os computers_os_pkey; Type: CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_os
    ADD CONSTRAINT computers_os_pkey PRIMARY KEY (id);


--
-- Name: computers computers_pkey; Type: CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers
    ADD CONSTRAINT computers_pkey PRIMARY KEY (id);


--
-- Name: computers_prices computers_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_prices
    ADD CONSTRAINT computers_prices_pkey PRIMARY KEY (id);


--
-- Name: computers_quests computers_quests_pkey; Type: CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_quests
    ADD CONSTRAINT computers_quests_pkey PRIMARY KEY (id);


--
-- Name: computers_quests_resps computers_quests_resps_pkey; Type: CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_quests_resps
    ADD CONSTRAINT computers_quests_resps_pkey PRIMARY KEY (id);


--
-- Name: computers_screens computers_screens_pkey; Type: CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_screens
    ADD CONSTRAINT computers_screens_pkey PRIMARY KEY (id);


--
-- Name: computers_traders computers_traders_pkey; Type: CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_traders
    ADD CONSTRAINT computers_traders_pkey PRIMARY KEY (id);


--
-- Name: users_auth users_auth_pkey; Type: CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.users_auth
    ADD CONSTRAINT users_auth_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (id);


--
-- Name: computers computers_activityid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers
    ADD CONSTRAINT computers_activityid_fkey FOREIGN KEY (activityid) REFERENCES public.computers_activities(id);


--
-- Name: computers computers_chipsetid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers
    ADD CONSTRAINT computers_chipsetid_fkey FOREIGN KEY (chipsetid) REFERENCES public.computers_chipsets(id);


--
-- Name: computers computers_cpuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers
    ADD CONSTRAINT computers_cpuid_fkey FOREIGN KEY (cpuid) REFERENCES public.computers_cpus(id);


--
-- Name: computers computers_gpuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers
    ADD CONSTRAINT computers_gpuid_fkey FOREIGN KEY (gpuid) REFERENCES public.computers_gpus(id);


--
-- Name: computers computers_keyboardid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers
    ADD CONSTRAINT computers_keyboardid_fkey FOREIGN KEY (keyboardid) REFERENCES public.computers_keyboards(id);


--
-- Name: computers computers_osid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers
    ADD CONSTRAINT computers_osid_fkey FOREIGN KEY (osid) REFERENCES public.computers_os(id);


--
-- Name: computers_prices computers_prices_computerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_prices
    ADD CONSTRAINT "computers_prices_computerId_fkey" FOREIGN KEY ("computerId") REFERENCES public.computers(id);


--
-- Name: computers_prices computers_prices_traderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_prices
    ADD CONSTRAINT "computers_prices_traderId_fkey" FOREIGN KEY ("traderId") REFERENCES public.computers_traders(id);


--
-- Name: computers_quests computers_quests_activityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_quests
    ADD CONSTRAINT "computers_quests_activityId_fkey" FOREIGN KEY ("activityId") REFERENCES public.computers_activities(id);


--
-- Name: computers_quests_resps computers_quests_resps_questId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers_quests_resps
    ADD CONSTRAINT "computers_quests_resps_questId_fkey" FOREIGN KEY ("questId") REFERENCES public.computers_quests(id);


--
-- Name: computers computers_screenId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.computers
    ADD CONSTRAINT "computers_screenId_fkey" FOREIGN KEY ("screenId") REFERENCES public.computers_screens(id);


--
-- Name: users users_authId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_authId_fkey" FOREIGN KEY ("authId") REFERENCES public.users_auth(id);


--
-- Name: users users_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: node
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public.users_roles(id);


--
-- PostgreSQL database dump complete
--

