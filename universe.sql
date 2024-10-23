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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size integer NOT NULL,
    velocity numeric,
    is_periodic boolean,
    last_seen integer NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type text,
    age numeric,
    contains_life boolean DEFAULT false,
    discovery_year integer NOT NULL
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
    name character varying(100) NOT NULL,
    type text,
    diameter numeric,
    planet_id integer NOT NULL,
    habitable boolean DEFAULT false,
    discovered_by integer NOT NULL
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
    name character varying(100) NOT NULL,
    type text,
    radius numeric,
    star_id integer,
    has_water boolean DEFAULT true,
    population integer NOT NULL
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
    name character varying(100) NOT NULL,
    type text,
    mass numeric,
    age integer NOT NULL,
    galaxy_id integer,
    habitable boolean DEFAULT true
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 15, 70.56, true, 1986);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 60, 10.34, true, 1997);
INSERT INTO public.comet VALUES (3, 'Swift-Tuttle', 26, 60.96, true, 1992);
INSERT INTO public.comet VALUES (4, 'Borrelly', 5, 25.71, true, 2001);
INSERT INTO public.comet VALUES (5, 'Hyakutake', 4, 41.88, true, 1996);
INSERT INTO public.comet VALUES (6, 'Tempel 1', 8, 29.33, true, 2005);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13.51, true, 1924);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10.0, false, 1764);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Elliptical', 12.8, false, 1912);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 12.4, false, 1845);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Spiral', 12.1, false, 1654);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', 10.5, false, 1826);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Natural Satellite', 3474.8, 1, false, 0);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Natural Satellite', 22.4, 2, false, 1);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Natural Satellite', 12.4, 2, false, 1);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Natural Satellite', 5262.4, 3, false, 2);
INSERT INTO public.moon VALUES (5, 'Europa', 'Natural Satellite', 3121.6, 3, true, 2);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Natural Satellite', 4820.6, 4, false, 2);
INSERT INTO public.moon VALUES (7, 'Io', 'Natural Satellite', 3642.6, 4, false, 2);
INSERT INTO public.moon VALUES (8, 'Titan', 'Natural Satellite', 5149.5, 4, true, 3);
INSERT INTO public.moon VALUES (9, 'Triton', 'Natural Satellite', 2706.8, 5, false, 3);
INSERT INTO public.moon VALUES (10, 'Nereid', 'Natural Satellite', 340.0, 5, false, 3);
INSERT INTO public.moon VALUES (11, 'Proteus', 'Natural Satellite', 420.0, 5, false, 3);
INSERT INTO public.moon VALUES (12, 'Enceladus', 'Natural Satellite', 504.2, 6, false, 3);
INSERT INTO public.moon VALUES (13, 'Mimas', 'Natural Satellite', 396.4, 6, false, 3);
INSERT INTO public.moon VALUES (14, 'Iapetus', 'Natural Satellite', 1436.6, 6, false, 3);
INSERT INTO public.moon VALUES (15, 'Rhea', 'Natural Satellite', 1527.6, 6, false, 3);
INSERT INTO public.moon VALUES (16, 'Oberon', 'Natural Satellite', 1523.4, 7, false, 4);
INSERT INTO public.moon VALUES (17, 'Titania', 'Natural Satellite', 1578.6, 8, false, 4);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'Natural Satellite', 1169.4, 9, false, 4);
INSERT INTO public.moon VALUES (19, 'Ariel', 'Natural Satellite', 1157.8, 10, false, 4);
INSERT INTO public.moon VALUES (20, 'Miranda', 'Natural Satellite', 471.6, 11, false, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 6371.0, 1, true, 8000);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 3389.5, 1, false, 0);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestrial', 6051.8, 1, false, 0);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Gas Giant', 69911.0, 1, false, 0);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Gas Giant', 58232.0, 1, false, 0);
INSERT INTO public.planet VALUES (6, 'Proxima Centauri b', 'Terrestrial', 6350.0, 2, true, 0);
INSERT INTO public.planet VALUES (7, 'Alpha Centauri Bb', 'Terrestrial', 7000.0, 3, false, 0);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bc', 'Terrestrial', 7500.0, 4, false, 0);
INSERT INTO public.planet VALUES (9, 'Betelgeuse b', 'Gas Giant', 115000.0, 5, false, 0);
INSERT INTO public.planet VALUES (10, 'Rigel b', 'Gas Giant', 118000.0, 6, false, 0);
INSERT INTO public.planet VALUES (11, 'Rigel c', 'Gas Giant', 118000.0, 6, false, 0);
INSERT INTO public.planet VALUES (12, 'Rigel d', 'Gas Giant', 118000.0, 6, false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-Type', 1.0, 5, 1, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M-Type', 0.123, 5, 2, false);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'G-Type', 1.1, 5, 1, true);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'K-Type', 0.907, 5, 1, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'M-Type', 20.0, 8, 3, false);
INSERT INTO public.star VALUES (6, 'Rigel', 'B-Type', 21.0, 8, 4, false);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

