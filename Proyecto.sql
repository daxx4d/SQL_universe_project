--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    size_in_kilometers integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    description text,
    galaxy_type text,
    size_in_light_years integer,
    distance_from_earth integer
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
    name character varying(30) NOT NULL,
    ddescription text,
    moon_type character varying(30),
    size_in_kilometers integer,
    distance_from_earth integer,
    planet_id integer
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
    name character varying(30) NOT NULL,
    description text,
    planet_type character varying(30),
    size_in_kilometers integer,
    distance_from_earth integer,
    has_life boolean NOT NULL,
    has_water boolean NOT NULL,
    average_temperature numeric(4,1),
    star_id integer
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
    name character varying(30) NOT NULL,
    description text,
    star_type character varying(30),
    size_in_kilometers integer,
    distance_from_earth integer,
    galaxy_id integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'KS-1', 'Lorem Ipsum', 125);
INSERT INTO public.asteroid VALUES (2, 'KS-2', 'Lorem Ipsum', 156);
INSERT INTO public.asteroid VALUES (3, 'KS-3', 'Lorem ipsum', 47);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'MWQ-1145', 23, 'Lorem Ipsum', 'standard', 2491, 1111);
INSERT INTO public.galaxy VALUES (2, 'MFY-7003', 50, 'Lorem Ipsum', 'standard', 3250, 1111);
INSERT INTO public.galaxy VALUES (3, 'QBG-5024', 7, 'Lorem Ipsum', 'standard', 248, 1111);
INSERT INTO public.galaxy VALUES (4, 'LKJ-6071', 12, 'Lorem Ipsum', 'standard', 1008, 1111);
INSERT INTO public.galaxy VALUES (5, 'UNG-5337', 84, 'Lorem Ipsum', 'standard', 3007, 1111);
INSERT INTO public.galaxy VALUES (6, 'KJM-5227', 11, 'Lorem Ipsum', 'standard', 1725, 1111);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'YT12', 'Lorem Ipsum', 'standard', 89, 1111, 1);
INSERT INTO public.moon VALUES (2, 'TR54', 'Lorem Ipsum', 'standard', 45, 1111, 1);
INSERT INTO public.moon VALUES (3, 'YW92', 'Lorem Ipsum', 'standard', 91, 1111, 1);
INSERT INTO public.moon VALUES (4, 'FT81', 'Lorem Ipsum', 'standard', 65, 1111, 1);
INSERT INTO public.moon VALUES (5, 'EW47', 'Lorem Ipsum', 'standard', 15, 1111, 2);
INSERT INTO public.moon VALUES (6, 'UI91', 'Lorem Ipsum', 'standard', 35, 1111, 2);
INSERT INTO public.moon VALUES (7, 'FT74', 'Lorem Ipsum', 'standard', 81, 1111, 2);
INSERT INTO public.moon VALUES (8, 'IT97', 'Lorem Ipsum', 'standard', 32, 1111, 2);
INSERT INTO public.moon VALUES (9, 'GH45', 'Lorem Ipsum', 'standard', 63, 1111, 3);
INSERT INTO public.moon VALUES (10, 'TZ38', 'Lorem Ipsum', 'standard', 40, 1111, 3);
INSERT INTO public.moon VALUES (11, 'EW13', 'Lorem Ipsum', 'standard', 51, 1111, 4);
INSERT INTO public.moon VALUES (12, 'BB88', 'Lorem Ipsum', 'standard', 73, 1111, 4);
INSERT INTO public.moon VALUES (13, 'IT17', 'Lorem Ipsum', 'standard', 38, 1111, 4);
INSERT INTO public.moon VALUES (14, 'YT78', 'Lorem Ipsum', 'standard', 62, 1111, 4);
INSERT INTO public.moon VALUES (15, 'TR55', 'Lorem Ipsum', 'standard', 29, 1111, 5);
INSERT INTO public.moon VALUES (16, 'TT23', 'Lorem Ipsum', 'standard', 60, 1111, 5);
INSERT INTO public.moon VALUES (17, 'KK86', 'Lorem Ipsum', 'standard', 98, 1111, 5);
INSERT INTO public.moon VALUES (18, 'QA27', 'Lorem Ipsum', 'standard', 61, 1111, 5);
INSERT INTO public.moon VALUES (19, 'TZ93', 'Lorem Ipsum', 'standard', 77, 1111, 6);
INSERT INTO public.moon VALUES (20, 'JK77', 'Lorem Ipsum', 'standard', 11, 1111, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'E016', 'Lorem Ipsum', 'standard', 3240, 1111, false, true, 1.5, 1);
INSERT INTO public.planet VALUES (2, 'T890', 'Lorem Ipsum', 'standard', 1823, 1111, true, true, 38.2, 1);
INSERT INTO public.planet VALUES (3, 'Y103', 'Lorem Ipsum', 'standard', 2890, 1111, false, false, 128.6, 2);
INSERT INTO public.planet VALUES (4, 'T190', 'Lorem Ipsum', 'standard', 1750, 1111, false, false, 83.2, 2);
INSERT INTO public.planet VALUES (5, 'U153', 'Lorem Ipsum', 'standard', 9010, 1111, false, true, 28.7, 3);
INSERT INTO public.planet VALUES (6, 'U901', 'Lorem Ipsum', 'standard', 3510, 1111, false, false, 230.0, 3);
INSERT INTO public.planet VALUES (7, 'L302', 'Lorem Ipsum', 'standard', 1890, 1111, false, false, 8.0, 4);
INSERT INTO public.planet VALUES (8, 'U741', 'Lorem Ipsum', 'standard', 5010, 1111, false, false, 30.7, 4);
INSERT INTO public.planet VALUES (9, 'L703', 'Lorem Ipsum', 'standard', 2960, 1111, false, false, 18.2, 5);
INSERT INTO public.planet VALUES (10, 'E542', 'Lorem Ipsum', 'standard', 1020, 1111, false, true, 87.5, 5);
INSERT INTO public.planet VALUES (11, 'T317', 'Lorem Ipsum', 'standard', 6290, 1111, false, false, 298.3, 6);
INSERT INTO public.planet VALUES (12, 'Y425', 'Lorem Ipsum', 'standard', 1270, 1111, false, false, 589.0, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'ALFA', 'Lorem Ipsum', 'white', 200000, 1111, 1);
INSERT INTO public.star VALUES (2, 'BETA', 'Lorem Ipsum', 'red', 3200000, 1111, 2);
INSERT INTO public.star VALUES (3, 'OMEGA', 'Lorem Ipsum', 'white', 280000, 1111, 3);
INSERT INTO public.star VALUES (4, 'GAMMA', 'Lorem Ipsum', 'blue', 1200000, 1111, 4);
INSERT INTO public.star VALUES (5, 'DELTA', 'Lorem Ipsum', 'yellow', 174000, 1111, 5);
INSERT INTO public.star VALUES (6, 'EPSILON', 'Lorem Ipsum', 'yellow', 3740000, 1111, 6);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


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
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

