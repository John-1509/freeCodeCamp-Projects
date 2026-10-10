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
    name character varying(30) NOT NULL,
    distance numeric NOT NULL,
    star_count bigint NOT NULL,
    description text,
    has_supernova boolean,
    has_singularity boolean
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
    planet_id integer,
    name character varying(30) NOT NULL,
    circumference numeric,
    color text
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
    star_id integer,
    name character varying(30) NOT NULL,
    is_habitable boolean,
    mass numeric
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
    planet_count integer,
    core_temp_c integer,
    is_white_dwarf boolean,
    galaxy_id integer
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
-- Name: universe_combined; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe_combined (
    universe_combined_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_name character varying(30) NOT NULL,
    planet_name character varying(30) NOT NULL,
    moon_name character varying(30) NOT NULL,
    distance numeric,
    star_count bigint,
    planet_count integer,
    is_habitable boolean,
    description text
);


ALTER TABLE public.universe_combined OWNER TO freecodecamp;

--
-- Name: universe_combined_universe_combined_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_combined_universe_combined_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_combined_universe_combined_id_seq OWNER TO freecodecamp;

--
-- Name: universe_combined_universe_combined_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_combined_universe_combined_id_seq OWNED BY public.universe_combined.universe_combined_id;


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
-- Name: universe_combined universe_combined_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_combined ALTER COLUMN universe_combined_id SET DEFAULT nextval('public.universe_combined_universe_combined_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 400000000000, 'Our home galaxy, a barred spiral containing the Solar System. Supernovae have been observed, and its center contains the supermassive black hole Sagittarius A*.', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2500000, 1000000000000, 'Ther nearest major galaxy to ours', true, true);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 160000, 20000000000, 'An irregular dwarf galaxy', true, false);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 200000, 3000000000, 'A small, irregular galaxy', true, false);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 3000000, 40000000000, 'A spiral galaxy with active star formation', true, false);
INSERT INTO public.galaxy VALUES (6, 'Cigar', 12000000, 30000000000, 'A starburst galaxy producing start at an unusually high rate', true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 9, 'Phobos', 69, 'Gray');
INSERT INTO public.moon VALUES (2, 9, 'Deimos', 39, 'Gray');
INSERT INTO public.moon VALUES (3, 8, 'Moon', 10921, 'Gray');
INSERT INTO public.moon VALUES (4, 10, 'Io', 11445, 'Yellow-orange');
INSERT INTO public.moon VALUES (5, 10, 'Europa', 9805, 'White');
INSERT INTO public.moon VALUES (6, 10, 'Ganymede', 16533, 'Gray-brown');
INSERT INTO public.moon VALUES (7, 10, 'Callisto', 14472, 'Dark gray');
INSERT INTO public.moon VALUES (8, 11, 'Titan', 16452, 'Orange');
INSERT INTO public.moon VALUES (9, 11, 'Ecneladus', 1582, 'White');
INSERT INTO public.moon VALUES (10, 11, 'Rhea', 4801, 'Gray');
INSERT INTO public.moon VALUES (11, 11, 'Iapetus', 4603, 'Black-white');
INSERT INTO public.moon VALUES (12, 11, 'Dione', 3529, 'Gray-white');
INSERT INTO public.moon VALUES (13, 11, 'Tethys', 3323, 'White');
INSERT INTO public.moon VALUES (14, 11, 'Mimas', 1240, 'Gray');
INSERT INTO public.moon VALUES (15, 12, 'Titania', 4961, 'Gray');
INSERT INTO public.moon VALUES (16, 12, 'Oberon', 4761, 'Gray');
INSERT INTO public.moon VALUES (17, 12, 'Umbriel', 3653, 'Dark gray');
INSERT INTO public.moon VALUES (18, 12, 'Ariel', 3641, 'Light gray');
INSERT INTO public.moon VALUES (19, 12, 'Miranda', 1480, 'Gray');
INSERT INTO public.moon VALUES (20, 12, 'Triton', 6800, 'Pinkish-gray');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 2, 'TRAPPIST-1 b', false, 1.4);
INSERT INTO public.planet VALUES (2, 2, 'TRAPPIST-1 c', false, 1.3);
INSERT INTO public.planet VALUES (3, 2, 'TRAPPIST-1 d', false, 1.4);
INSERT INTO public.planet VALUES (4, 2, 'TRAPPIST-1 e', true, 0.7);
INSERT INTO public.planet VALUES (5, 2, 'TRAPPIST-1 f', true, 1.0);
INSERT INTO public.planet VALUES (6, 2, 'TRAPPIST-1 g', true, 1.3);
INSERT INTO public.planet VALUES (7, 2, 'TRAPPIST-1 h', false, 0.3);
INSERT INTO public.planet VALUES (8, 1, 'Earth', true, 1.0);
INSERT INTO public.planet VALUES (9, 1, 'Mars', false, 0.1);
INSERT INTO public.planet VALUES (10, 1, 'Jupiter', false, 317.8);
INSERT INTO public.planet VALUES (11, 1, 'Saturn', false, 95.2);
INSERT INTO public.planet VALUES (12, 1, 'Neptune', false, 17.1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 5500, false, 1);
INSERT INTO public.star VALUES (2, 'TRAPPIST-1', 7, 2400, false, 1);
INSERT INTO public.star VALUES (3, 'Sirius B', 0, 25000, true, 1);
INSERT INTO public.star VALUES (4, 'M31-V1', NULL, 5500, false, 2);
INSERT INTO public.star VALUES (5, 'R136a1', NULL, 43000, false, 3);
INSERT INTO public.star VALUES (6, 'HD 5980', NULL, 42000, false, 4);


--
-- Data for Name: universe_combined; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe_combined VALUES (1, 'Milky Way', 'Sun', 'Mars', 'Phobos', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (2, 'Milky Way', 'Sun', 'Mars', 'Deimos', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (3, 'Milky Way', 'Sun', 'Earth', 'Moon', 0, 400000000000, 8, true, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (4, 'Milky Way', 'Sun', 'Jupiter', 'Io', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (5, 'Milky Way', 'Sun', 'Jupiter', 'Europa', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (6, 'Milky Way', 'Sun', 'Jupiter', 'Ganymede', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (7, 'Milky Way', 'Sun', 'Jupiter', 'Callisto', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (8, 'Milky Way', 'Sun', 'Saturn', 'Titan', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (9, 'Milky Way', 'Sun', 'Saturn', 'Ecneladus', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (10, 'Milky Way', 'Sun', 'Saturn', 'Rhea', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (11, 'Milky Way', 'Sun', 'Saturn', 'Iapetus', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (12, 'Milky Way', 'Sun', 'Saturn', 'Dione', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (13, 'Milky Way', 'Sun', 'Saturn', 'Tethys', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (14, 'Milky Way', 'Sun', 'Saturn', 'Mimas', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (15, 'Milky Way', 'Sun', 'Neptune', 'Titania', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (16, 'Milky Way', 'Sun', 'Neptune', 'Oberon', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (17, 'Milky Way', 'Sun', 'Neptune', 'Umbriel', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (18, 'Milky Way', 'Sun', 'Neptune', 'Ariel', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (19, 'Milky Way', 'Sun', 'Neptune', 'Miranda', 0, 400000000000, 8, false, 'Our home galaxy');
INSERT INTO public.universe_combined VALUES (20, 'Milky Way', 'Sun', 'Neptune', 'Triton', 0, 400000000000, 8, false, 'Our home galaxy');


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
-- Name: universe_combined_universe_combined_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_combined_universe_combined_id_seq', 20, true);


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
-- Name: universe_combined universe_combined_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_combined
    ADD CONSTRAINT universe_combined_moon_name_key UNIQUE (moon_name);


--
-- Name: universe_combined universe_combined_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_combined
    ADD CONSTRAINT universe_combined_pkey PRIMARY KEY (universe_combined_id);


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

