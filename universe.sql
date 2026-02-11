--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years numeric(8,2),
    description text,
    galaxy_type character varying(20) NOT NULL,
    CONSTRAINT galaxy_galaxy_type_check CHECK (((galaxy_type)::text = ANY ((ARRAY['elliptical'::character varying, 'spiral'::character varying, 'irregular'::character varying])::text[])))
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    age_in_millions_of_years integer,
    is_habitable boolean,
    is_spherical boolean,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: organic_body; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.organic_body (
    organic_body_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer,
    name character varying(50),
    life_present boolean NOT NULL
);


ALTER TABLE public.organic_body OWNER TO freecodecamp;

--
-- Name: organic_bodies_organic_bodies_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.organic_bodies_organic_bodies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_bodies_organic_bodies_id_seq OWNER TO freecodecamp;

--
-- Name: organic_bodies_organic_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.organic_bodies_organic_bodies_id_seq OWNED BY public.organic_body.organic_body_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    age_in_millions_of_years integer,
    is_habitable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years numeric(8,2),
    distance_from_earth_in_ly double precision,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: organic_body organic_body_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.organic_body ALTER COLUMN organic_body_id SET DEFAULT nextval('public.organic_bodies_organic_bodies_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600.00, 'Home to Earth. Nearly as old as the universe.', 'spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10001.00, 'Closest to Earth.', 'spiral');
INSERT INTO public.galaxy VALUES (3, 'Centaurus', 10000.00, 'Closest radio galaxy to Earth. Center is supermassive black hole.', 'elliptical');
INSERT INTO public.galaxy VALUES (4, 'Maffei', 10000.00, 'Discovered by Paolo Maffei. Mainly metal-rich stars', 'elliptical');
INSERT INTO public.galaxy VALUES (5, 'Circinus', NULL, 'In the process of change, as rings of gas are constantly emitted.', 'spiral');
INSERT INTO public.galaxy VALUES (7, 'M81', NULL, 'Also known as Bode''s Galaxy.', 'irregular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 50, false, true, 'Earth''s Moon');
INSERT INTO public.moon VALUES (2, 'Phobos', 3, 70, false, true, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 3, 100, false, true, NULL);
INSERT INTO public.moon VALUES (4, 'Charon', 4, 30, false, true, 'Ferrykeeper');
INSERT INTO public.moon VALUES (5, 'Styx', 4, 1000, false, false, 'Oathkeeper');
INSERT INTO public.moon VALUES (6, 'Nix', 4, 70, true, true, 'Nightsky');
INSERT INTO public.moon VALUES (7, 'Titan', 5, 120, false, true, 'Earth''s Moon');
INSERT INTO public.moon VALUES (8, 'Europa', 5, 140, true, true, 'Contains water');
INSERT INTO public.moon VALUES (9, 'Chrysoar', 8, 71, false, true, 'Contains gold');
INSERT INTO public.moon VALUES (10, 'Chiron', 8, 720, false, true, 'Binary system');
INSERT INTO public.moon VALUES (11, 'Agamemnon', 7, 738, false, true, NULL);
INSERT INTO public.moon VALUES (12, 'Clytemnestra', 7, 309, false, false, NULL);
INSERT INTO public.moon VALUES (13, 'Jade Emperor', 10, 462, false, true, 'Completely green');
INSERT INTO public.moon VALUES (14, 'Nuwa', 10, 43, true, true, 'Soil rich');
INSERT INTO public.moon VALUES (15, 'Set', 10, 501, false, true, 'Obsidian planet');
INSERT INTO public.moon VALUES (16, 'Ra', 10, 509, false, false, 'Mirror like');
INSERT INTO public.moon VALUES (17, 'Idunn', 12, 501, false, false, 'Apple shaped');
INSERT INTO public.moon VALUES (18, 'Freya', 12, 503, false, true, 'Tidally Locked');
INSERT INTO public.moon VALUES (19, 'Loki', 12, 32, true, false, 'False moon');
INSERT INTO public.moon VALUES (20, 'Proteus', 9, 13, false, true, 'Has oceans');


--
-- Data for Name: organic_body; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.organic_body VALUES (2, 8, NULL, 'Elephantine', false);
INSERT INTO public.organic_body VALUES (3, 9, NULL, 'Betelguese A', false);
INSERT INTO public.organic_body VALUES (5, 4, 6, 'Nix', false);
INSERT INTO public.organic_body VALUES (6, 5, 8, 'Europa', false);
INSERT INTO public.organic_body VALUES (8, 12, 19, 'Loki', false);
INSERT INTO public.organic_body VALUES (1, 1, NULL, 'Earth', true);
INSERT INTO public.organic_body VALUES (4, 11, NULL, 'Alpheratz A', true);
INSERT INTO public.organic_body VALUES (7, 10, 14, 'Nuwa', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 500, true);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 600, false);
INSERT INTO public.planet VALUES (3, 'Mars', 1, 850, false);
INSERT INTO public.planet VALUES (4, 'Pluto', 1, 50, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 1500, false);
INSERT INTO public.planet VALUES (6, 'Kuiper', 2, 510, false);
INSERT INTO public.planet VALUES (7, 'Serpentine', 3, 1030, false);
INSERT INTO public.planet VALUES (8, 'Elephantine', 3, 1020, true);
INSERT INTO public.planet VALUES (9, 'Betelguese A', 2, 600, true);
INSERT INTO public.planet VALUES (10, 'Mirach B', 5, 320, false);
INSERT INTO public.planet VALUES (11, 'Alpheratz A', 4, 50, true);
INSERT INTO public.planet VALUES (12, 'Centauri A1', 6, 290, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 4600.00, 1.58e-05, 'Home star for Earth.');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850.00, 4.2465, 'Closest star to Earth');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 250.00, 8.6, 'Brightest star in Earth''s sky');
INSERT INTO public.star VALUES (4, 'Alpheratz', 2, NULL, 97, 'Brightest star in Andromeda from Earth');
INSERT INTO public.star VALUES (5, 'Mirach', 2, 400.00, 197, 'Aging red giant');
INSERT INTO public.star VALUES (6, 'Centaurus A', 3, NULL, 12000000, 'Too faint to make out individual stars');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: organic_bodies_organic_bodies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.organic_bodies_organic_bodies_id_seq', 8, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: organic_body organic_body_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.organic_body
    ADD CONSTRAINT organic_body_name_key UNIQUE (name);


--
-- Name: organic_body organic_body_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.organic_body
    ADD CONSTRAINT organic_body_pkey PRIMARY KEY (organic_body_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_uname; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_uname UNIQUE (name);


--
-- Name: galaxy u_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT u_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: organic_body organic_body_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.organic_body
    ADD CONSTRAINT organic_body_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: organic_body organic_body_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.organic_body
    ADD CONSTRAINT organic_body_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

