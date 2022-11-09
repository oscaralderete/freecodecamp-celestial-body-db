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
-- Name: foo; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.foo (
    foo_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    is_true boolean DEFAULT false
);


ALTER TABLE public.foo OWNER TO freecodecamp;

--
-- Name: foo_foo_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.foo_foo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foo_foo_id_seq OWNER TO freecodecamp;

--
-- Name: foo_foo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.foo_foo_id_seq OWNED BY public.foo.foo_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    starts_quantity_in_billions integer NOT NULL,
    black_holes_quantity integer DEFAULT 0,
    light_years_dimension numeric(10,2),
    description text NOT NULL,
    has_irregular_shape boolean DEFAULT false,
    has_spiral_shape boolean DEFAULT false,
    has_elliptical_shape boolean DEFAULT false
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
    rotation_around_in_days integer NOT NULL,
    distance_to_planet_in_million_km integer NOT NULL,
    diatemer_in_million_km numeric(7,2),
    description text NOT NULL,
    has_water boolean DEFAULT false,
    solid_surface boolean DEFAULT true
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
    satellites integer DEFAULT 0,
    suns integer DEFAULT 1,
    diameter_in_millions_km numeric(7,2),
    description text NOT NULL,
    has_water boolean DEFAULT false,
    solid_surface boolean DEFAULT true
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
    galaxy_id integer,
    name character varying(30) NOT NULL,
    energy_in_gigatons integer,
    planets integer DEFAULT 0,
    diameter_in_million_km numeric(10,2),
    description text NOT NULL,
    is_black_hole boolean DEFAULT false,
    is_dwarf_star boolean DEFAULT false
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
-- Name: foo foo_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.foo ALTER COLUMN foo_id SET DEFAULT nextval('public.foo_foo_id_seq'::regclass);


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
-- Data for Name: foo; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.foo VALUES (1, 'one', 'one', true);
INSERT INTO public.foo VALUES (2, 'two', 'two', false);
INSERT INTO public.foo VALUES (3, 'three', 'three', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 85797, 1, 6778996.50, 'The galaxy where the Solar System is', false, true, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 996697, 4, 33548996.50, 'Gets its name from the area of the sky in which appears, the constellation of andromeda', false, true, false);
INSERT INTO public.galaxy VALUES (3, 'Backward', 555557, 10, 44444996.50, 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.', false, true, false);
INSERT INTO public.galaxy VALUES (4, 'Circinus', 6666667, 15, 55555596.50, 'Named after the constellation it is located in (Circinus).', false, true, false);
INSERT INTO public.galaxy VALUES (5, 'Cigar', 7777777, 20, 66666696.50, 'Appears similar in shape to a cigar.', false, false, true);
INSERT INTO public.galaxy VALUES (6, 'Bode Gallaxy', 888888, 23, 7777796.50, 'Named for Johann Elert Bode who discovered this galaxy in 1774.', false, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'The moon', 365, 2, NULL, 'the moon', false, true);
INSERT INTO public.moon VALUES (2, 2, 'Locus', 365, 2, NULL, 'locus', false, true);
INSERT INTO public.moon VALUES (3, 2, 'workout', 365, 2, NULL, 'workout', false, true);
INSERT INTO public.moon VALUES (4, 2, 'nothing', 365, 2, NULL, 'nothing', false, true);
INSERT INTO public.moon VALUES (5, 4, 'uno', 1, 1, NULL, 'uno', false, true);
INSERT INTO public.moon VALUES (6, 4, 'dos', 2, 2, NULL, 'dos', false, true);
INSERT INTO public.moon VALUES (7, 4, 'tres', 2, 2, NULL, 'tres', false, true);
INSERT INTO public.moon VALUES (8, 4, 'cuatro', 2, 2, NULL, 'cuantro', false, true);
INSERT INTO public.moon VALUES (9, 4, 'cuatro-5', 2, 2, NULL, 'cinco', false, true);
INSERT INTO public.moon VALUES (10, 4, 'cuatro-6', 2, 2, NULL, 'seis', false, true);
INSERT INTO public.moon VALUES (11, 4, 'cuatro-7', 2, 2, NULL, 'siete', false, true);
INSERT INTO public.moon VALUES (12, 4, 'cuatro-8', 2, 2, NULL, '', false, true);
INSERT INTO public.moon VALUES (13, 4, 'cuatro-9', 2, 2, NULL, '', false, true);
INSERT INTO public.moon VALUES (14, 4, 'cuatro-10', 2, 2, NULL, '', false, true);
INSERT INTO public.moon VALUES (15, 4, 'cuatro-11', 2, 2, NULL, '', false, true);
INSERT INTO public.moon VALUES (16, 4, 'cuatro-12', 2, 2, NULL, '', false, true);
INSERT INTO public.moon VALUES (17, 4, 'cuatro-13', 2, 2, NULL, '', false, true);
INSERT INTO public.moon VALUES (18, 4, 'cuatro-14', 2, 2, NULL, '', false, true);
INSERT INTO public.moon VALUES (19, 4, 'cuatro-15', 2, 2, NULL, '', false, true);
INSERT INTO public.moon VALUES (20, 4, 'cuatro-16', 2, 2, NULL, '', false, true);
INSERT INTO public.moon VALUES (21, 4, 'cuatro-17', 2, 2, NULL, '', false, true);
INSERT INTO public.moon VALUES (22, 4, 'cuatro-18', 2, 2, NULL, '', false, true);
INSERT INTO public.moon VALUES (23, 4, 'cuatro-19', 2, 2, NULL, '', false, true);
INSERT INTO public.moon VALUES (24, 4, 'cuatro-20', 2, 2, NULL, '', false, true);
INSERT INTO public.moon VALUES (25, 4, 'cuatro-21', 2, 2, NULL, '', false, true);
INSERT INTO public.moon VALUES (26, 4, 'cuatro-22', 2, 2, NULL, '', false, true);
INSERT INTO public.moon VALUES (27, 4, 'cuatro-23', 2, 2, NULL, '', false, true);
INSERT INTO public.moon VALUES (28, 4, 'cuatro-24', 2, 2, NULL, '', false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'The earth', 1, 1, 1.00, 'Our beautiful blue planet.', true, true);
INSERT INTO public.planet VALUES (2, 1, 'Mercury', 1, 1, 1.00, 'second planet.', false, true);
INSERT INTO public.planet VALUES (3, 1, 'Venus', 1, 1, 1.00, 'third planet.', false, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 1, 1, 1.00, 'fourth planet.', false, true);
INSERT INTO public.planet VALUES (5, 1, 'Saturn', 1, 1, 3.00, 'fifth planet.', false, true);
INSERT INTO public.planet VALUES (7, 1, 'Neptune', 1, 1, 4.00, 'sixth planet.', false, true);
INSERT INTO public.planet VALUES (8, 2, 'Orbis', 1, 1, 4.00, 'orbis', false, true);
INSERT INTO public.planet VALUES (9, 2, 'Tlon', 1, 1, 4.00, 'tlon', false, true);
INSERT INTO public.planet VALUES (10, 2, 'Ukbar', 1, 1, 4.00, 'ukbar', false, true);
INSERT INTO public.planet VALUES (11, 2, 'Tetris', 1, 1, 4.00, 'tetris', false, true);
INSERT INTO public.planet VALUES (12, 2, 'Ipsum', 1, 1, 4.00, 'ipsum', false, true);
INSERT INTO public.planet VALUES (13, 3, 'Consectum', 1, 1, 4.00, 'consectum', false, true);
INSERT INTO public.planet VALUES (14, 3, 'vobis', 1, 1, 4.00, 'vobis', false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'The Sun', 22222, 9, 33333.50, 'A hot ball of glowing gases at the heart of our solar system.', false, false);
INSERT INTO public.star VALUES (2, 1, 'Polaris', 33333, 22, 44444.50, 'Also known as the North Star, Pole star, Lodestar and sometimes Guide Star..', false, false);
INSERT INTO public.star VALUES (3, 1, 'Sirius', 44444, 29, 55555.50, 'Also known as the Dog Star because it is in Canis Major constellation.', false, false);
INSERT INTO public.star VALUES (4, 1, 'Alpha centauri', 55555, 33, 66666.50, 'Also known as Rigel Kent or Toliman.', false, false);
INSERT INTO public.star VALUES (5, 1, 'Betelgeuse', 66666, 37, 77777.50, 'Is pronounced: Beetle-juice.', false, false);
INSERT INTO public.star VALUES (6, 1, 'Rigel', 77777, 39, 88888.50, 'Also known as Beta Orionis.', false, false);


--
-- Name: foo_foo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.foo_foo_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 28, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: foo foo_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.foo
    ADD CONSTRAINT foo_name_key UNIQUE (name);


--
-- Name: foo foo_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.foo
    ADD CONSTRAINT foo_pkey PRIMARY KEY (foo_id);


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

