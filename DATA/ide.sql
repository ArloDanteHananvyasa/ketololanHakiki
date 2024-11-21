--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-11-18 21:36:40

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16424)
-- Name: usergroups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usergroups (
    id_ug integer NOT NULL,
    name character varying(8) NOT NULL
);


ALTER TABLE public.usergroups OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16438)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id_u integer NOT NULL,
    userid character varying(10) NOT NULL,
    name character varying(50) NOT NULL,
    username character varying(9) NOT NULL,
    pass character varying(50) NOT NULL,
    id_ug integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16453)
-- Name: user_data; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.user_data AS
 SELECT users.userid,
    users.name,
    usergroups.name AS role
   FROM (public.usergroups
     JOIN public.users ON ((usergroups.id_ug = users.id_ug)));


ALTER VIEW public.user_data OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16423)
-- Name: usergroups_id_ug_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usergroups_id_ug_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usergroups_id_ug_seq OWNER TO postgres;

--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 215
-- Name: usergroups_id_ug_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usergroups_id_ug_seq OWNED BY public.usergroups.id_ug;


--
-- TOC entry 217 (class 1259 OID 16437)
-- Name: users_id_u_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_u_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_u_seq OWNER TO postgres;

--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_u_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_u_seq OWNED BY public.users.id_u;


--
-- TOC entry 4697 (class 2604 OID 16427)
-- Name: usergroups id_ug; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usergroups ALTER COLUMN id_ug SET DEFAULT nextval('public.usergroups_id_ug_seq'::regclass);


--
-- TOC entry 4698 (class 2604 OID 16441)
-- Name: users id_u; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id_u SET DEFAULT nextval('public.users_id_u_seq'::regclass);


--
-- TOC entry 4853 (class 0 OID 16424)
-- Dependencies: 216
-- Data for Name: usergroups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usergroups (id_ug, name) VALUES (1, 'lecturer');
INSERT INTO public.usergroups (id_ug, name) VALUES (2, 'student');
INSERT INTO public.usergroups (id_ug, name) VALUES (3, 'admin');


--
-- TOC entry 4855 (class 0 OID 16438)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (1, '20160065', 'Maria Veronica Claudia', '16065', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 1);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (2, '20130053', 'Husnul Hakim', '13053', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 1);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (3, '2011730053', 'MARIA VERONICA', '7311053', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (4, '2011730103', 'JOHANES MARIO ADRIANO', '7311103', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (5, '2012730027', 'NICHOLAS MARTIN PRIBADI', '7312027', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (6, '2012730078', 'RIZQI PUTRA PRATAMA', '7312078', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (7, '2012730093', 'YOHAN STURE ENANDER', '7312093', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (8, '2013730001', 'ALVIN IRAWAN', '7313001', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (9, '2013730002', 'CHERIA', '7313002', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (10, '2013730003', 'FADHIL AHSAN', '7313003', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (11, '2013730004', 'CLARA', '7313004', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (12, '2013730005', 'ALDY MARCELLINO CHRISTIAN', '7313005', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (13, '2013730006', 'ANTONIUS', '7313006', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (14, '2013730008', 'ENRICOFINDLEY', '7313008', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (15, '2013730009', 'ROMMY KURNIAWAN WIJAYA', '7313009', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (16, '2013730010', 'YOSUA YUUTA BIMA PRAMANA', '7313010', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (17, '2013730011', 'RICKY SLAMAT PUTRA', '7313011', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (18, '2013730012', 'CLAUDIA VERONICA HANURAWAN', '7313012', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (19, '2013730013', 'AXEL RAHARJA', '7313013', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (20, '2013730019', 'IGNASIUS DAVID YULIANUS', '7313019', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (21, '2013730021', 'ERLANGGA LAIMENA', '7313021', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (22, '2013730024', 'MARKUS EDWIN SOEGIANTO', '7313024', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (23, '2013730025', 'GAVRILA TIOMINAR', '7313025', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (24, '2013730029', 'KEVIN RIZKHY TANUJAYA', '7313029', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (25, '2013730033', 'JACINTA DELORA', '7313033', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (26, '2013730046', 'ANDRIANTO SUGIARTO', '7313046', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (27, '2013730052', 'FRANSISCUS EVAN KRISTIAN', '7313052', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (28, '2013730053', 'SOHUTURON FERNANDO', '7313053', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (29, '2013730054', 'MICHAEL WILLIAM KINSEY', '7313054', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (30, '2013730057', 'MAUDY NUR AVIANTI', '7313057', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (31, '2013730058', 'ADRIAN REYNALDI', '7313058', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (32, '2013730060', 'HARSETO PANDITYO', '7313060', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (33, '2013730065', 'JONATHAN SURYA', '7313065', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (34, '2013730068', 'REZA ZACKY RAMADAN', '7313068', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);
INSERT INTO public.users (id_u, userid, name, username, pass, id_ug) VALUES (35, '2013730069', 'RICKY WAHYUDI', '7313069', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 2);


--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 215
-- Name: usergroups_id_ug_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usergroups_id_ug_seq', 3, true);


--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_u_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_u_seq', 35, false);


--
-- TOC entry 4700 (class 2606 OID 16429)
-- Name: usergroups usergroups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usergroups
    ADD CONSTRAINT usergroups_pkey PRIMARY KEY (id_ug);


--
-- TOC entry 4702 (class 2606 OID 16443)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_u);


--
-- TOC entry 4704 (class 2606 OID 16445)
-- Name: users users_userid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_userid_key UNIQUE (userid);


--
-- TOC entry 4706 (class 2606 OID 16447)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4707 (class 2606 OID 16448)
-- Name: users users_id_ug_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_ug_fkey FOREIGN KEY (id_ug) REFERENCES public.usergroups(id_ug);


-- Completed on 2024-11-18 21:36:41

--
-- PostgreSQL database dump complete
--

