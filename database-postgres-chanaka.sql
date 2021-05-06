--
-- PostgreSQL database dump
--

-- Dumped from database version 10.13
-- Dumped by pg_dump version 12.3

-- Started on 2021-05-05 23:28:23

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

DROP DATABASE chanaka;
--
-- TOC entry 2876 (class 1262 OID 149900)
-- Name: chanaka; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE chanaka WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE chanaka OWNER TO postgres;

\connect chanaka

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

--
-- TOC entry 202 (class 1259 OID 149941)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id bigint NOT NULL,
    description character varying(255),
    material_type_id bigint NOT NULL
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 149939)
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO postgres;

--
-- TOC entry 2877 (class 0 OID 0)
-- Dependencies: 201
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- TOC entry 204 (class 1259 OID 149949)
-- Name: magazines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.magazines (
    id bigint NOT NULL,
    description character varying(255),
    material_type_id bigint NOT NULL
);


ALTER TABLE public.magazines OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 149947)
-- Name: magazines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.magazines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magazines_id_seq OWNER TO postgres;

--
-- TOC entry 2878 (class 0 OID 0)
-- Dependencies: 203
-- Name: magazines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.magazines_id_seq OWNED BY public.magazines.id;


--
-- TOC entry 206 (class 1259 OID 149957)
-- Name: material_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material_types (
    id bigint NOT NULL,
    description character varying(255)
);


ALTER TABLE public.material_types OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 149955)
-- Name: material_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.material_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.material_types_id_seq OWNER TO postgres;

--
-- TOC entry 2879 (class 0 OID 0)
-- Dependencies: 205
-- Name: material_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.material_types_id_seq OWNED BY public.material_types.id;


--
-- TOC entry 197 (class 1259 OID 149903)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 149901)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- TOC entry 2880 (class 0 OID 0)
-- Dependencies: 196
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- TOC entry 208 (class 1259 OID 150031)
-- Name: user_material_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_material_info (
    id bigint NOT NULL,
    book_id bigint,
    magazine_id bigint,
    material_type_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.user_material_info OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 150029)
-- Name: user_material_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_material_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_material_info_id_seq OWNER TO postgres;

--
-- TOC entry 2881 (class 0 OID 0)
-- Dependencies: 207
-- Name: user_material_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_material_info_id_seq OWNED BY public.user_material_info.id;


--
-- TOC entry 198 (class 1259 OID 149909)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 149916)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_by character varying(255),
    created_date timestamp without time zone,
    last_modified_by character varying(255),
    last_modified_date timestamp without time zone,
    email character varying(255),
    password character varying(255),
    username character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 149914)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 199
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2707 (class 2604 OID 149944)
-- Name: books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- TOC entry 2708 (class 2604 OID 149952)
-- Name: magazines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magazines ALTER COLUMN id SET DEFAULT nextval('public.magazines_id_seq'::regclass);


--
-- TOC entry 2709 (class 2604 OID 149960)
-- Name: material_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_types ALTER COLUMN id SET DEFAULT nextval('public.material_types_id_seq'::regclass);


--
-- TOC entry 2705 (class 2604 OID 149906)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 2710 (class 2604 OID 150034)
-- Name: user_material_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_material_info ALTER COLUMN id SET DEFAULT nextval('public.user_material_info_id_seq'::regclass);


--
-- TOC entry 2706 (class 2604 OID 149919)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2864 (class 0 OID 149941)
-- Dependencies: 202
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.books (id, description, material_type_id) VALUES (1, 'dfsgs', 1);
INSERT INTO public.books (id, description, material_type_id) VALUES (2, 'dvxfbdfb', 1);
INSERT INTO public.books (id, description, material_type_id) VALUES (3, 'xfbgfsbsb', 1);
INSERT INTO public.books (id, description, material_type_id) VALUES (4, 'madol duwa', 1);


--
-- TOC entry 2866 (class 0 OID 149949)
-- Dependencies: 204
-- Data for Name: magazines; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.magazines (id, description, material_type_id) VALUES (1, 'sCzsVz', 2);


--
-- TOC entry 2868 (class 0 OID 149957)
-- Dependencies: 206
-- Data for Name: material_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.material_types (id, description) VALUES (1, 'Books');
INSERT INTO public.material_types (id, description) VALUES (2, 'Magazines');


--
-- TOC entry 2859 (class 0 OID 149903)
-- Dependencies: 197
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role (id, name) VALUES (1, 'ROLE_LIBRARIAN');
INSERT INTO public.role (id, name) VALUES (2, 'ROLE_STUDENT');


--
-- TOC entry 2870 (class 0 OID 150031)
-- Dependencies: 208
-- Data for Name: user_material_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_material_info (id, book_id, magazine_id, material_type_id, user_id) VALUES (1, 1, NULL, 1, 4);
INSERT INTO public.user_material_info (id, book_id, magazine_id, material_type_id, user_id) VALUES (2, 2, NULL, 1, 4);
INSERT INTO public.user_material_info (id, book_id, magazine_id, material_type_id, user_id) VALUES (3, 1, NULL, 1, 2);
INSERT INTO public.user_material_info (id, book_id, magazine_id, material_type_id, user_id) VALUES (4, 2, NULL, 1, 2);
INSERT INTO public.user_material_info (id, book_id, magazine_id, material_type_id, user_id) VALUES (5, 3, NULL, 1, 2);
INSERT INTO public.user_material_info (id, book_id, magazine_id, material_type_id, user_id) VALUES (6, NULL, 1, 2, 2);


--
-- TOC entry 2860 (class 0 OID 149909)
-- Dependencies: 198
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_roles (user_id, role_id) VALUES (2, 2);
INSERT INTO public.user_roles (user_id, role_id) VALUES (1, 2);
INSERT INTO public.user_roles (user_id, role_id) VALUES (3, 1);
INSERT INTO public.user_roles (user_id, role_id) VALUES (3, 2);
INSERT INTO public.user_roles (user_id, role_id) VALUES (4, 1);


--
-- TOC entry 2862 (class 0 OID 149916)
-- Dependencies: 200
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, created_by, created_date, last_modified_by, last_modified_date, email, password, username) VALUES (1, 'System', '2021-05-05 17:53:04.769', 'System', '2021-05-05 17:53:04.769', 'ffff', '$2a$10$WaiLoop48Mb0FjTbZQW5C.h7t7sSepdv3eZm9s0UrvgBS5mVjb0s6', 'fff');
INSERT INTO public.users (id, created_by, created_date, last_modified_by, last_modified_date, email, password, username) VALUES (2, 'fff', '2021-05-05 18:02:28.455', 'fff', '2021-05-05 18:02:28.455', 'rrr', '$2a$10$D92mUThWBe9y7D/F36859uhvO3kTzZyxgAILLcmFNRcBCvm2Nd//i', 'rrr');
INSERT INTO public.users (id, created_by, created_date, last_modified_by, last_modified_date, email, password, username) VALUES (3, 'fff', '2021-05-05 18:03:50.816', 'fff', '2021-05-05 18:03:50.816', 'rrrr', '$2a$10$SGoUP75xlZUCoSJgAmWPX.qpnc/QYQlpIvZec.VtT7.5aShFjwLS2', 'rrrr');
INSERT INTO public.users (id, created_by, created_date, last_modified_by, last_modified_date, email, password, username) VALUES (4, 'rrrr', '2021-05-05 18:34:30.403', 'rrrr', '2021-05-05 18:34:30.403', 'eeee', '$2a$10$17MNqN/IX7hly/s32H3O1OHSXZ4qluDLeKWixYqIBUNPccqlHnBp6', 'eeee');


--
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 201
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_id_seq', 4, true);


--
-- TOC entry 2884 (class 0 OID 0)
-- Dependencies: 203
-- Name: magazines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.magazines_id_seq', 1, true);


--
-- TOC entry 2885 (class 0 OID 0)
-- Dependencies: 205
-- Name: material_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.material_types_id_seq', 1, false);


--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 196
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 1, false);


--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 207
-- Name: user_material_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_material_info_id_seq', 6, true);


--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 199
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- TOC entry 2722 (class 2606 OID 149946)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 149954)
-- Name: magazines magazines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magazines
    ADD CONSTRAINT magazines_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 149962)
-- Name: material_types material_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_types
    ADD CONSTRAINT material_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 149908)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 149928)
-- Name: users uk6dotkott2kjsp8vw4d0m25fb7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);


--
-- TOC entry 2718 (class 2606 OID 149926)
-- Name: users ukr43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT ukr43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- TOC entry 2728 (class 2606 OID 150036)
-- Name: user_material_info user_material_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_material_info
    ADD CONSTRAINT user_material_info_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 149913)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2720 (class 2606 OID 149924)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 149996)
-- Name: magazines fk90s5ft7whsktx9shwqoagrsgb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magazines
    ADD CONSTRAINT fk90s5ft7whsktx9shwqoagrsgb FOREIGN KEY (material_type_id) REFERENCES public.material_types(id);


--
-- TOC entry 2731 (class 2606 OID 149991)
-- Name: books fkd9kqeuly1ramikc1uyx6vjvhb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT fkd9kqeuly1ramikc1uyx6vjvhb FOREIGN KEY (material_type_id) REFERENCES public.material_types(id);


--
-- TOC entry 2733 (class 2606 OID 150037)
-- Name: user_material_info fkg01o0tcfdx20xlaqqh1vqfpyi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_material_info
    ADD CONSTRAINT fkg01o0tcfdx20xlaqqh1vqfpyi FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- TOC entry 2730 (class 2606 OID 149934)
-- Name: user_roles fkhfh9dx7w3ubf1co1vdev94g3f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2735 (class 2606 OID 150047)
-- Name: user_material_info fkittg0kjf4h9pgaa78gdejpmh4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_material_info
    ADD CONSTRAINT fkittg0kjf4h9pgaa78gdejpmh4 FOREIGN KEY (material_type_id) REFERENCES public.material_types(id);


--
-- TOC entry 2734 (class 2606 OID 150042)
-- Name: user_material_info fkml51c16l49nf1j4h5f8g7efn7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_material_info
    ADD CONSTRAINT fkml51c16l49nf1j4h5f8g7efn7 FOREIGN KEY (magazine_id) REFERENCES public.magazines(id);


--
-- TOC entry 2729 (class 2606 OID 149929)
-- Name: user_roles fkrhfovtciq1l558cw6udg0h0d3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkrhfovtciq1l558cw6udg0h0d3 FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- TOC entry 2736 (class 2606 OID 150052)
-- Name: user_material_info fks266094jr25e690se70ksc6du; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_material_info
    ADD CONSTRAINT fks266094jr25e690se70ksc6du FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2021-05-05 23:28:24

--
-- PostgreSQL database dump complete
--

