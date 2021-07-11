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
-- Name: speciality_category; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.speciality_category AS ENUM (
    'flooring',
    'other'
);


--
-- Name: speciality_material; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.speciality_material AS ENUM (
    'wood',
    'carpet',
    'tiles'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: customer_flooring_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_flooring_requests (
    id bigint NOT NULL,
    lat numeric(10,6),
    lng numeric(10,6),
    phone_number character varying(50),
    material public.speciality_material,
    square_meters integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: customer_flooring_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customer_flooring_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customer_flooring_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customer_flooring_requests_id_seq OWNED BY public.customer_flooring_requests.id;


--
-- Name: provider_specialities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.provider_specialities (
    id bigint NOT NULL,
    provider_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    category public.speciality_category,
    material public.speciality_material
);


--
-- Name: provider_specialities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.provider_specialities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: provider_specialities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.provider_specialities_id_seq OWNED BY public.provider_specialities.id;


--
-- Name: providers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.providers (
    id bigint NOT NULL,
    name character varying(100),
    lat numeric(10,6),
    lng numeric(10,6),
    operating_radius integer,
    average_rating double precision,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.providers_id_seq OWNED BY public.providers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: customer_flooring_requests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_flooring_requests ALTER COLUMN id SET DEFAULT nextval('public.customer_flooring_requests_id_seq'::regclass);


--
-- Name: provider_specialities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.provider_specialities ALTER COLUMN id SET DEFAULT nextval('public.provider_specialities_id_seq'::regclass);


--
-- Name: providers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.providers ALTER COLUMN id SET DEFAULT nextval('public.providers_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: customer_flooring_requests customer_flooring_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_flooring_requests
    ADD CONSTRAINT customer_flooring_requests_pkey PRIMARY KEY (id);


--
-- Name: provider_specialities provider_specialities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.provider_specialities
    ADD CONSTRAINT provider_specialities_pkey PRIMARY KEY (id);


--
-- Name: providers providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_provider_specialities_on_provider_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_provider_specialities_on_provider_id ON public.provider_specialities USING btree (provider_id);


--
-- Name: provider_specialities fk_rails_6d45982cb4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.provider_specialities
    ADD CONSTRAINT fk_rails_6d45982cb4 FOREIGN KEY (provider_id) REFERENCES public.providers(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20210711142742'),
('20210711143811'),
('20210711144141'),
('20210711144152'),
('20210711155900');


