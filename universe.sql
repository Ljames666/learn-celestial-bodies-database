--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    description text,
    type character varying(50),
    distance_from_earth numeric(10,2),
    has_black_hole boolean
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
    name character varying(255) NOT NULL,
    planet_id integer,
    distance_from_planet numeric(10,2),
    is_tidal_locked boolean,
    has_water boolean
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    distance_from_star numeric(10,2),
    has_atmosphere boolean,
    is_habitable boolean,
    degree integer
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
-- Name: space_beings; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_beings (
    space_beings_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    description text,
    is_hostile boolean NOT NULL
);


ALTER TABLE public.space_beings OWNER TO freecodecamp;

--
-- Name: space_beings_being_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_beings_being_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_beings_being_id_seq OWNER TO freecodecamp;

--
-- Name: space_beings_being_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_beings_being_id_seq OWNED BY public.space_beings.space_beings_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    spectral_class character varying(10),
    luminosity numeric(10,2),
    is_binary boolean,
    degree integer
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_beings space_beings_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_beings ALTER COLUMN space_beings_id SET DEFAULT nextval('public.space_beings_being_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Láctea', 'Nossa galáxia', 'Espiral', 25000.50, true);
INSERT INTO public.galaxy VALUES (2, 'Andrômeda', 'Galáxia vizinha', 'Espiral', 220000.75, false);
INSERT INTO public.galaxy VALUES (3, 'Triângulo', 'Galáxia do Grupo Local', 'Irregular', 300000.00, false);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Galáxia ativa', 'Elíptica', 120000.25, true);
INSERT INTO public.galaxy VALUES (5, 'M87', 'Galáxia no Aglomerado de Virgem', 'Elíptica', 550000.80, false);
INSERT INTO public.galaxy VALUES (6, 'NGC 1300', 'Galáxia espiral barrada', 'Espiral barrada', 70000.10, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (36, 'Luna', 13, 0.00, true, false);
INSERT INTO public.moon VALUES (37, 'Phobos', 14, 0.01, true, false);
INSERT INTO public.moon VALUES (38, 'Deimos', 15, 0.02, true, false);
INSERT INTO public.moon VALUES (39, 'Io', 14, 0.00, true, true);
INSERT INTO public.moon VALUES (40, 'Europa', 14, 0.00, true, true);
INSERT INTO public.moon VALUES (41, 'Ganymede', 14, 0.01, true, true);
INSERT INTO public.moon VALUES (42, 'Callisto', 14, 0.01, true, true);
INSERT INTO public.moon VALUES (43, 'Titan', 15, 0.01, true, true);
INSERT INTO public.moon VALUES (44, 'Titania', 16, 0.01, true, true);
INSERT INTO public.moon VALUES (45, 'Triton', 17, 0.00, true, true);
INSERT INTO public.moon VALUES (46, 'Charon', 18, 0.00, true, false);
INSERT INTO public.moon VALUES (47, 'Enceladus', 19, 0.00, true, true);
INSERT INTO public.moon VALUES (48, 'Miranda', 20, 0.00, true, false);
INSERT INTO public.moon VALUES (49, 'Oberon', 21, 0.00, true, true);
INSERT INTO public.moon VALUES (50, 'Trioni', 22, 0.00, true, true);
INSERT INTO public.moon VALUES (51, 'Nereid', 16, 0.04, true, false);
INSERT INTO public.moon VALUES (52, 'Phoebe', 16, 0.13, true, false);
INSERT INTO public.moon VALUES (53, 'Charoni', 16, 0.00, true, false);
INSERT INTO public.moon VALUES (54, 'Dione', 16, 0.00, true, true);
INSERT INTO public.moon VALUES (55, 'Rhea', 16, 0.00, true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', 1, 0.39, false, false, NULL);
INSERT INTO public.planet VALUES (14, 'Venus', 1, 0.72, true, false, NULL);
INSERT INTO public.planet VALUES (15, 'Mars', 2, 1.52, true, false, NULL);
INSERT INTO public.planet VALUES (16, 'Jupiter', 3, 5.20, true, false, NULL);
INSERT INTO public.planet VALUES (17, 'Saturn', 3, 9.58, true, false, NULL);
INSERT INTO public.planet VALUES (18, 'Uranus', 4, 19.22, true, false, NULL);
INSERT INTO public.planet VALUES (19, 'Neptune', 4, 30.05, true, false, NULL);
INSERT INTO public.planet VALUES (20, 'Pluto', 5, 39.48, false, false, NULL);
INSERT INTO public.planet VALUES (21, 'Kepler-186f', 6, 490.00, true, true, NULL);
INSERT INTO public.planet VALUES (22, 'Proxima Centauri b', 6, 0.05, true, true, NULL);
INSERT INTO public.planet VALUES (23, 'HD 209458 b', 2, 0.05, true, false, NULL);
INSERT INTO public.planet VALUES (24, 'Gliese 581 d', 5, 0.22, true, true, NULL);


--
-- Data for Name: space_beings; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_beings VALUES (1, 'Zog', 18, 'Zog é um ser pacífico de Kepler-186f.', false);
INSERT INTO public.space_beings VALUES (2, 'Xelox', 24, 'Xelox é um ser misterioso de Triton.', true);
INSERT INTO public.space_beings VALUES (3, 'Luna', 21, 'Luna é um espírito lunar da Terra.', false);
INSERT INTO public.space_beings VALUES (4, 'Vortis', 18, 'Vortis é um ser metamorfo de Titã.', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 'G', 1.00, false, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A', 25.00, true, NULL);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 'G', 1.50, false, NULL);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 'M', 10000.00, false, NULL);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A', 50.00, false, NULL);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 'M', 0.00, false, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 55, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: space_beings_being_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_beings_being_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
-- Name: space_beings space_beings_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_beings
    ADD CONSTRAINT space_beings_name_key UNIQUE (name);


--
-- Name: space_beings space_beings_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_beings
    ADD CONSTRAINT space_beings_pkey PRIMARY KEY (space_beings_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: space_beings space_beings_origin_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_beings
    ADD CONSTRAINT space_beings_origin_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

