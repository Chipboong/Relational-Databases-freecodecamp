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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    galaxy_id integer,
    name character varying(50) NOT NULL,
    mass_solar_masses numeric(15,4),
    is_supermassive boolean,
    discovery_year integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_billion_years numeric(6,3),
    classification character varying(50) NOT NULL,
    distance_from_earth_ly numeric(15,2),
    mass_solar_masses bigint
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
    planet_id integer NOT NULL,
    radius_km numeric(8,2),
    orbital_period_days numeric(8,4),
    tidally_locked boolean,
    discovery_year integer
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
    name character varying(100),
    star_id integer NOT NULL,
    planet_type text,
    mass_earth_masses numeric(10,4),
    semi_major_axis_au numeric(10,4),
    orbital_period_days numeric(10,2),
    in_habitable_zone boolean,
    known_moon_count integer
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
    galaxy_id integer NOT NULL,
    spectral_type character varying(1),
    mass_solar_masses numeric(8,4),
    luminostity numeric(12,4)
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 1, 'Sagittarius A*', 4154000.0000, true, 1974);
INSERT INTO public.black_hole VALUES (2, 2, 'Andromeda Core', 140000000.0000, true, 1988);
INSERT INTO public.black_hole VALUES (3, 4, 'Sombrero Core', 1000000000.0000, true, 1996);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.610, 'Barred Spiral', 0.00, 1500000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.000, 'Spiral', 2537000.00, 1230000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 10.000, 'Spiral', 2730000.00, 50000000000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 9.000, 'Unbarred Spiral', 31100000.00, 800000000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 4.000, 'Spiral', 23000000.00, 160000000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 13.000, 'Spiral', 20900000.00, 1000000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 1737.40, 27.3217, true, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.27, 0.3189, true, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.20, 1.2630, true, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.60, 1.7691, true, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.80, 3.5512, true, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.10, 7.1546, true, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.30, 16.6890, true, 1610);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 198.20, 0.9424, true, 1789);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252.10, 1.3702, true, 1789);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 531.10, 1.8878, true, 1684);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 561.40, 2.7369, true, 1684);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 763.80, 4.5182, true, 1672);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 2574.70, 15.9450, true, 1655);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 734.50, 79.3215, true, 1671);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 235.80, 1.4135, true, 1948);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 578.90, 2.5204, true, 1851);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 584.70, 4.1442, true, 1851);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 788.40, 8.7059, true, 1787);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 761.40, 13.4632, true, 1787);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 1353.40, -5.8768, true, 1846);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 0.0553, 0.3870, 88.00, false, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 0.8150, 0.7230, 224.70, false, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 1.0000, 1.0000, 365.25, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 0.1070, 1.5240, 687.00, false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 317.8000, 5.2030, 4333.00, false, 95);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 95.1600, 9.5370, 10759.00, false, 146);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 14.5400, 19.1900, 30685.00, false, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 17.1500, 30.0700, 60190.00, false, 14);
INSERT INTO public.planet VALUES (9, 'Sirius b', 2, 'Gas Giant', 150.0000, 5.0000, 3000.00, false, 0);
INSERT INTO public.planet VALUES (10, 'Betelgeuse I', 3, 'Gas Giant', 900.0000, 20.0000, 15000.00, false, 5);
INSERT INTO public.planet VALUES (11, 'Rigel b', 4, 'Gas Giant', 600.0000, 15.0000, 10000.00, false, 2);
INSERT INTO public.planet VALUES (12, 'Vega Prime', 5, 'Terrestrial', 2.5000, 1.2000, 450.00, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G', 1.0000, 1.0000);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A', 2.0630, 25.4000);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'M', 16.5000, 126000.0000);
INSERT INTO public.star VALUES (4, 'Rigel', 1, 'B', 21.0000, 120000.0000);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A', 2.1350, 40.1200);
INSERT INTO public.star VALUES (6, 'Mayall II', 2, 'G', 2.5000, 50.0000);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


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
-- Name: black_hole black_hole_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

