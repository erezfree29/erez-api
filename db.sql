--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)

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
-- Name: albums; Type: TABLE; Schema: public; Owner: erez
--

CREATE TABLE public.albums (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.albums OWNER TO erez;

--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: erez
--

CREATE SEQUENCE public.albums_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_id_seq OWNER TO erez;

--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erez
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: erez
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO erez;

--
-- Name: photos; Type: TABLE; Schema: public; Owner: erez
--

CREATE TABLE public.photos (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    album_id bigint
);


ALTER TABLE public.photos OWNER TO erez;

--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: erez
--

CREATE SEQUENCE public.photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photos_id_seq OWNER TO erez;

--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erez
--

ALTER SEQUENCE public.photos_id_seq OWNED BY public.photos.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: erez
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO erez;

--
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: erez
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: erez
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: erez
--

COPY public.albums (id, name, created_at, updated_at) FROM stdin;
1	family photos	2022-04-15 23:55:16.506123	2022-04-15 23:55:16.506123
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: erez
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2022-04-15 23:54:21.436534	2022-04-15 23:54:21.436534
\.


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: erez
--

COPY public.photos (id, name, created_at, updated_at, album_id) FROM stdin;
1	Mom and Dad	2022-04-15 23:55:26.631199	2022-04-15 23:55:26.631199	1
2	Me and my cousins	2022-04-15 23:55:26.650962	2022-04-15 23:55:26.650962	1
3	Me and my cousins	2022-04-15 23:55:26.669719	2022-04-15 23:55:26.669719	1
4	Me and my cousins	2022-04-15 23:55:26.733923	2022-04-15 23:55:26.733923	1
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: erez
--

COPY public.schema_migrations (version) FROM stdin;
20220413213756
20220413215225
20220413220413
\.


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erez
--

SELECT pg_catalog.setval('public.albums_id_seq', 1, true);


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erez
--

SELECT pg_catalog.setval('public.photos_id_seq', 4, true);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: erez
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: erez
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: erez
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: erez
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_photos_on_album_id; Type: INDEX; Schema: public; Owner: erez
--

CREATE INDEX index_photos_on_album_id ON public.photos USING btree (album_id);


--
-- Name: photos fk_rails_2593557582; Type: FK CONSTRAINT; Schema: public; Owner: erez
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT fk_rails_2593557582 FOREIGN KEY (album_id) REFERENCES public.albums(id);


--
-- PostgreSQL database dump complete
--

