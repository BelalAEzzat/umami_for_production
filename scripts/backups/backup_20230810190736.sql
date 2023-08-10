--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: umami
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO umami;

--
-- Name: event_data; Type: TABLE; Schema: public; Owner: umami
--

CREATE TABLE public.event_data (
    event_data_id uuid NOT NULL,
    website_id uuid NOT NULL,
    website_event_id uuid NOT NULL,
    event_key character varying(500) NOT NULL,
    string_value character varying(500),
    number_value numeric(19,4),
    date_value timestamp(6) with time zone,
    data_type integer NOT NULL,
    created_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.event_data OWNER TO umami;

--
-- Name: report; Type: TABLE; Schema: public; Owner: umami
--

CREATE TABLE public.report (
    report_id uuid NOT NULL,
    user_id uuid NOT NULL,
    website_id uuid NOT NULL,
    type character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    description character varying(500) NOT NULL,
    parameters character varying(6000) NOT NULL,
    created_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp(6) with time zone
);


ALTER TABLE public.report OWNER TO umami;

--
-- Name: session; Type: TABLE; Schema: public; Owner: umami
--

CREATE TABLE public.session (
    session_id uuid NOT NULL,
    website_id uuid NOT NULL,
    hostname character varying(100),
    browser character varying(20),
    os character varying(20),
    device character varying(20),
    screen character varying(11),
    language character varying(35),
    country character(2),
    subdivision1 character varying(20),
    subdivision2 character varying(50),
    city character varying(50),
    created_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.session OWNER TO umami;

--
-- Name: session_data; Type: TABLE; Schema: public; Owner: umami
--

CREATE TABLE public.session_data (
    session_data_id uuid NOT NULL,
    website_id uuid NOT NULL,
    session_id uuid NOT NULL,
    session_key character varying(500) NOT NULL,
    string_value character varying(500),
    number_value numeric(19,4),
    date_value timestamp(6) with time zone,
    data_type integer NOT NULL,
    created_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.session_data OWNER TO umami;

--
-- Name: team; Type: TABLE; Schema: public; Owner: umami
--

CREATE TABLE public.team (
    team_id uuid NOT NULL,
    name character varying(50) NOT NULL,
    access_code character varying(50),
    created_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp(6) with time zone
);


ALTER TABLE public.team OWNER TO umami;

--
-- Name: team_user; Type: TABLE; Schema: public; Owner: umami
--

CREATE TABLE public.team_user (
    team_user_id uuid NOT NULL,
    team_id uuid NOT NULL,
    user_id uuid NOT NULL,
    role character varying(50) NOT NULL,
    created_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp(6) with time zone
);


ALTER TABLE public.team_user OWNER TO umami;

--
-- Name: team_website; Type: TABLE; Schema: public; Owner: umami
--

CREATE TABLE public.team_website (
    team_website_id uuid NOT NULL,
    team_id uuid NOT NULL,
    website_id uuid NOT NULL,
    created_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.team_website OWNER TO umami;

--
-- Name: user; Type: TABLE; Schema: public; Owner: umami
--

CREATE TABLE public."user" (
    user_id uuid NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(60) NOT NULL,
    role character varying(50) NOT NULL,
    created_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp(6) with time zone,
    deleted_at timestamp(6) with time zone
);


ALTER TABLE public."user" OWNER TO umami;

--
-- Name: website; Type: TABLE; Schema: public; Owner: umami
--

CREATE TABLE public.website (
    website_id uuid NOT NULL,
    name character varying(100) NOT NULL,
    domain character varying(500),
    share_id character varying(50),
    reset_at timestamp(6) with time zone,
    user_id uuid,
    created_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp(6) with time zone,
    deleted_at timestamp(6) with time zone
);


ALTER TABLE public.website OWNER TO umami;

--
-- Name: website_event; Type: TABLE; Schema: public; Owner: umami
--

CREATE TABLE public.website_event (
    event_id uuid NOT NULL,
    website_id uuid NOT NULL,
    session_id uuid NOT NULL,
    created_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    url_path character varying(500) NOT NULL,
    url_query character varying(500),
    referrer_path character varying(500),
    referrer_query character varying(500),
    referrer_domain character varying(500),
    page_title character varying(500),
    event_type integer DEFAULT 1 NOT NULL,
    event_name character varying(50)
);


ALTER TABLE public.website_event OWNER TO umami;

--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: umami
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
c90f1407-bf10-4758-ab97-8a2741c10ccb	65f0f9ee4a3b432e7fa917795033254887497a849d95acf7d9cb4ff24b45f98f	2023-08-10 13:24:16.028972+00	01_init	\N	\N	2023-08-10 13:24:15.858237+00	1
e242523d-d7bf-46dd-9503-1bfe52cd44ff	4cc3c14482cb8700574cbdbdb478a93ccd1cabb0aeed37dfffb77a80278ce575	2023-08-10 13:24:16.090678+00	02_report_schema_session_data	\N	\N	2023-08-10 13:24:16.032168+00	1
\.


--
-- Data for Name: event_data; Type: TABLE DATA; Schema: public; Owner: umami
--

COPY public.event_data (event_data_id, website_id, website_event_id, event_key, string_value, number_value, date_value, data_type, created_at) FROM stdin;
\.


--
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: umami
--

COPY public.report (report_id, user_id, website_id, type, name, description, parameters, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: umami
--

COPY public.session (session_id, website_id, hostname, browser, os, device, screen, language, country, subdivision1, subdivision2, city, created_at) FROM stdin;
\.


--
-- Data for Name: session_data; Type: TABLE DATA; Schema: public; Owner: umami
--

COPY public.session_data (session_data_id, website_id, session_id, session_key, string_value, number_value, date_value, data_type, created_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: umami
--

COPY public.team (team_id, name, access_code, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: team_user; Type: TABLE DATA; Schema: public; Owner: umami
--

COPY public.team_user (team_user_id, team_id, user_id, role, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: team_website; Type: TABLE DATA; Schema: public; Owner: umami
--

COPY public.team_website (team_website_id, team_id, website_id, created_at) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: umami
--

COPY public."user" (user_id, username, password, role, created_at, updated_at, deleted_at) FROM stdin;
41e2b680-648e-4b09-bcd7-3e2b10c06264	admin	$2b$10$BUli0c.muyCW1ErNJc3jL.vFRFtFJWrT8/GcR4A.sUdCznaXiqFXa	admin	2023-08-10 13:24:15.860037+00	\N	\N
\.


--
-- Data for Name: website; Type: TABLE DATA; Schema: public; Owner: umami
--

COPY public.website (website_id, name, domain, share_id, reset_at, user_id, created_at, updated_at, deleted_at) FROM stdin;
a6f23d5c-2437-451f-bac3-dd260f2009ca	cope	copium.com	\N	\N	41e2b680-648e-4b09-bcd7-3e2b10c06264	2023-08-10 14:15:56.233+00	2023-08-10 14:15:56.233+00	\N
\.


--
-- Data for Name: website_event; Type: TABLE DATA; Schema: public; Owner: umami
--

COPY public.website_event (event_id, website_id, session_id, created_at, url_path, url_query, referrer_path, referrer_query, referrer_domain, page_title, event_type, event_name) FROM stdin;
\.


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: umami
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: event_data event_data_pkey; Type: CONSTRAINT; Schema: public; Owner: umami
--

ALTER TABLE ONLY public.event_data
    ADD CONSTRAINT event_data_pkey PRIMARY KEY (event_data_id);


--
-- Name: report report_pkey; Type: CONSTRAINT; Schema: public; Owner: umami
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_pkey PRIMARY KEY (report_id);


--
-- Name: session_data session_data_pkey; Type: CONSTRAINT; Schema: public; Owner: umami
--

ALTER TABLE ONLY public.session_data
    ADD CONSTRAINT session_data_pkey PRIMARY KEY (session_data_id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: umami
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (session_id);


--
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: umami
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (team_id);


--
-- Name: team_user team_user_pkey; Type: CONSTRAINT; Schema: public; Owner: umami
--

ALTER TABLE ONLY public.team_user
    ADD CONSTRAINT team_user_pkey PRIMARY KEY (team_user_id);


--
-- Name: team_website team_website_pkey; Type: CONSTRAINT; Schema: public; Owner: umami
--

ALTER TABLE ONLY public.team_website
    ADD CONSTRAINT team_website_pkey PRIMARY KEY (team_website_id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: umami
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- Name: website_event website_event_pkey; Type: CONSTRAINT; Schema: public; Owner: umami
--

ALTER TABLE ONLY public.website_event
    ADD CONSTRAINT website_event_pkey PRIMARY KEY (event_id);


--
-- Name: website website_pkey; Type: CONSTRAINT; Schema: public; Owner: umami
--

ALTER TABLE ONLY public.website
    ADD CONSTRAINT website_pkey PRIMARY KEY (website_id);


--
-- Name: event_data_created_at_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX event_data_created_at_idx ON public.event_data USING btree (created_at);


--
-- Name: event_data_website_event_id_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX event_data_website_event_id_idx ON public.event_data USING btree (website_event_id);


--
-- Name: event_data_website_id_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX event_data_website_id_idx ON public.event_data USING btree (website_id);


--
-- Name: report_name_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX report_name_idx ON public.report USING btree (name);


--
-- Name: report_report_id_key; Type: INDEX; Schema: public; Owner: umami
--

CREATE UNIQUE INDEX report_report_id_key ON public.report USING btree (report_id);


--
-- Name: report_type_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX report_type_idx ON public.report USING btree (type);


--
-- Name: report_user_id_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX report_user_id_idx ON public.report USING btree (user_id);


--
-- Name: report_website_id_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX report_website_id_idx ON public.report USING btree (website_id);


--
-- Name: session_created_at_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX session_created_at_idx ON public.session USING btree (created_at);


--
-- Name: session_data_created_at_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX session_data_created_at_idx ON public.session_data USING btree (created_at);


--
-- Name: session_data_session_id_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX session_data_session_id_idx ON public.session_data USING btree (session_id);


--
-- Name: session_data_website_id_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX session_data_website_id_idx ON public.session_data USING btree (website_id);


--
-- Name: session_session_id_key; Type: INDEX; Schema: public; Owner: umami
--

CREATE UNIQUE INDEX session_session_id_key ON public.session USING btree (session_id);


--
-- Name: session_website_id_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX session_website_id_idx ON public.session USING btree (website_id);


--
-- Name: team_access_code_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX team_access_code_idx ON public.team USING btree (access_code);


--
-- Name: team_access_code_key; Type: INDEX; Schema: public; Owner: umami
--

CREATE UNIQUE INDEX team_access_code_key ON public.team USING btree (access_code);


--
-- Name: team_team_id_key; Type: INDEX; Schema: public; Owner: umami
--

CREATE UNIQUE INDEX team_team_id_key ON public.team USING btree (team_id);


--
-- Name: team_user_team_id_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX team_user_team_id_idx ON public.team_user USING btree (team_id);


--
-- Name: team_user_team_user_id_key; Type: INDEX; Schema: public; Owner: umami
--

CREATE UNIQUE INDEX team_user_team_user_id_key ON public.team_user USING btree (team_user_id);


--
-- Name: team_user_user_id_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX team_user_user_id_idx ON public.team_user USING btree (user_id);


--
-- Name: team_website_team_id_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX team_website_team_id_idx ON public.team_website USING btree (team_id);


--
-- Name: team_website_team_website_id_key; Type: INDEX; Schema: public; Owner: umami
--

CREATE UNIQUE INDEX team_website_team_website_id_key ON public.team_website USING btree (team_website_id);


--
-- Name: team_website_website_id_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX team_website_website_id_idx ON public.team_website USING btree (website_id);


--
-- Name: user_user_id_key; Type: INDEX; Schema: public; Owner: umami
--

CREATE UNIQUE INDEX user_user_id_key ON public."user" USING btree (user_id);


--
-- Name: user_username_key; Type: INDEX; Schema: public; Owner: umami
--

CREATE UNIQUE INDEX user_username_key ON public."user" USING btree (username);


--
-- Name: website_created_at_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX website_created_at_idx ON public.website USING btree (created_at);


--
-- Name: website_event_created_at_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX website_event_created_at_idx ON public.website_event USING btree (created_at);


--
-- Name: website_event_session_id_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX website_event_session_id_idx ON public.website_event USING btree (session_id);


--
-- Name: website_event_website_id_created_at_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX website_event_website_id_created_at_idx ON public.website_event USING btree (website_id, created_at);


--
-- Name: website_event_website_id_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX website_event_website_id_idx ON public.website_event USING btree (website_id);


--
-- Name: website_event_website_id_session_id_created_at_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX website_event_website_id_session_id_created_at_idx ON public.website_event USING btree (website_id, session_id, created_at);


--
-- Name: website_share_id_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX website_share_id_idx ON public.website USING btree (share_id);


--
-- Name: website_share_id_key; Type: INDEX; Schema: public; Owner: umami
--

CREATE UNIQUE INDEX website_share_id_key ON public.website USING btree (share_id);


--
-- Name: website_user_id_idx; Type: INDEX; Schema: public; Owner: umami
--

CREATE INDEX website_user_id_idx ON public.website USING btree (user_id);


--
-- Name: website_website_id_key; Type: INDEX; Schema: public; Owner: umami
--

CREATE UNIQUE INDEX website_website_id_key ON public.website USING btree (website_id);


--
-- PostgreSQL database dump complete
--

