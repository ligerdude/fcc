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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_type text NOT NULL,
    ngc_number integer NOT NULL,
    beauty_opinion numeric(3,1) NOT NULL,
    name character varying(35)
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
    name character varying(20) NOT NULL,
    planet_orbitting boolean NOT NULL,
    planet_id integer,
    surface_gravity_relative_to_earth numeric(5,3)
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
    name character varying(20) NOT NULL,
    star_orbitting boolean NOT NULL,
    star_id integer,
    total_moons integer
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
    name character varying(20) NOT NULL,
    galaxy_id integer,
    total_planets integer,
    star_type character varying(1)
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
-- Name: star_type_colors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type_colors (
    star_type_colors_id integer NOT NULL,
    star_type character varying(1) NOT NULL,
    star_type_color text NOT NULL,
    name character varying(1)
);


ALTER TABLE public.star_type_colors OWNER TO freecodecamp;

--
-- Name: star_type_definitions_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_definitions_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_definitions_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_definitions_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_definitions_star_type_id_seq OWNED BY public.star_type_colors.star_type_colors_id;


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
-- Name: star_type_colors star_type_colors_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type_colors ALTER COLUMN star_type_colors_id SET DEFAULT nextval('public.star_type_definitions_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Barred Spiral Galaxy', 1068, 9.1, 'Squid Galaxy');
INSERT INTO public.galaxy VALUES (2, 'Supergiant Elliptical Galaxy', 4486, 9.4, 'Virgo A');
INSERT INTO public.galaxy VALUES (3, 'Spiral Galaxy', 598, 8.7, 'Triangulum Galaxy');
INSERT INTO public.galaxy VALUES (4, 'Barred Spiral Galaxy', 224, 9.8, 'Andromeda Galaxy');
INSERT INTO public.galaxy VALUES (5, 'Grand-Design Spiral Galaxy', 5194, 9.7, 'Whirlpool Galaxy');
INSERT INTO public.galaxy VALUES (6, 'Intermediate Barred Spiral Galaxy', 4303, 9.0, 'M61');
INSERT INTO public.galaxy VALUES (7, 'Spiral Galaxy', 5055, 9.6, 'Sunflower Galaxy');
INSERT INTO public.galaxy VALUES (8, 'Spiral Galaxy', 4826, 9.0, 'Black Eye Galaxy');
INSERT INTO public.galaxy VALUES (9, 'Grand-Design Spiral Galaxy', 628, 8.9, 'Phantom Galaxy');
INSERT INTO public.galaxy VALUES (10, 'Starburst Galaxy', 3034, 9.5, 'Cigar Galaxy');
INSERT INTO public.galaxy VALUES (11, 'Barred Spiral Galaxy', 5236, 9.7, 'Southern Pinwheel Galaxy');
INSERT INTO public.galaxy VALUES (12, 'Barred Spiral Galaxy', 0, 10.0, 'Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', true, 3, 0.165);
INSERT INTO public.moon VALUES (2, 'Phobos', true, 4, 0.000);
INSERT INTO public.moon VALUES (3, 'Deimos', true, 4, 0.000);
INSERT INTO public.moon VALUES (4, 'Ganymede', true, 5, 0.146);
INSERT INTO public.moon VALUES (5, 'Io', true, 5, 0.183);
INSERT INTO public.moon VALUES (6, 'Europa', true, 5, 0.134);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 5, 0.126);
INSERT INTO public.moon VALUES (8, 'Metis', true, 5, NULL);
INSERT INTO public.moon VALUES (9, 'Amalthea', true, 5, 0.002);
INSERT INTO public.moon VALUES (10, 'Thebe', true, 5, 0.004);
INSERT INTO public.moon VALUES (11, 'Himalia', true, 5, 0.006);
INSERT INTO public.moon VALUES (12, 'Mimas', true, 6, 0.006);
INSERT INTO public.moon VALUES (13, 'Enceladus', true, 6, 0.012);
INSERT INTO public.moon VALUES (14, 'Iapetus', true, 6, 0.023);
INSERT INTO public.moon VALUES (15, 'Titan', true, 6, 0.138);
INSERT INTO public.moon VALUES (16, 'Rhea', true, 6, 0.027);
INSERT INTO public.moon VALUES (17, 'Dione', true, 6, 0.023);
INSERT INTO public.moon VALUES (18, 'Tethys', true, 6, 0.015);
INSERT INTO public.moon VALUES (19, 'Miranda', true, 7, 0.008);
INSERT INTO public.moon VALUES (20, 'Ariel', true, 7, 0.026);
INSERT INTO public.moon VALUES (21, 'Umbriel', true, 7, 0.023);
INSERT INTO public.moon VALUES (22, 'Titania', true, 7, 0.037);
INSERT INTO public.moon VALUES (23, 'Oberon', true, 7, 0.035);
INSERT INTO public.moon VALUES (24, 'Triton', true, 8, 0.079);
INSERT INTO public.moon VALUES (25, 'Proteus', true, 8, 0.007);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', true, 10, 0);
INSERT INTO public.planet VALUES (2, 'Venus', true, 10, 0);
INSERT INTO public.planet VALUES (3, 'Earth', true, 10, 1);
INSERT INTO public.planet VALUES (4, 'Mars', true, 10, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, 10, 92);
INSERT INTO public.planet VALUES (6, 'Saturn', true, 10, 83);
INSERT INTO public.planet VALUES (7, 'Uranus', true, 10, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', true, 10, 14);
INSERT INTO public.planet VALUES (9, 'Kepler-90i', true, 18, 0);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', true, 17, 0);
INSERT INTO public.planet VALUES (11, 'HD 10180 g', true, 16, 1);
INSERT INTO public.planet VALUES (12, 'OTS 44', false, NULL, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Betelgeuse', 12, 0, 'M');
INSERT INTO public.star VALUES (4, 'Aldebaran', 12, 1, 'K');
INSERT INTO public.star VALUES (5, 'Pollux', 12, 1, 'K');
INSERT INTO public.star VALUES (6, 'Arcturus', 12, 0, 'K');
INSERT INTO public.star VALUES (7, 'Vega', 12, 0, 'A');
INSERT INTO public.star VALUES (8, 'Polaris', 12, 0, 'F');
INSERT INTO public.star VALUES (9, 'Sirius A', 12, 0, 'A');
INSERT INTO public.star VALUES (10, 'The Sun', 12, 8, 'G');
INSERT INTO public.star VALUES (12, 'Romano''s Star', 3, 0, 'W');
INSERT INTO public.star VALUES (13, 'UW Canis Majoris', 12, 0, 'O');
INSERT INTO public.star VALUES (14, 'AE Andromedae', 4, 0, 'B');
INSERT INTO public.star VALUES (3, 'Rigel', 12, 0, 'B');
INSERT INTO public.star VALUES (15, 'HD 191939', 12, 6, 'G');
INSERT INTO public.star VALUES (16, 'HD 10180', 12, 6, 'G');
INSERT INTO public.star VALUES (17, 'Proxima Centauri', 12, 3, 'M');
INSERT INTO public.star VALUES (18, 'Kepler-90', 12, 8, 'F');


--
-- Data for Name: star_type_colors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type_colors VALUES (1, 'O', 'Blue', 'O');
INSERT INTO public.star_type_colors VALUES (2, 'B', 'Blue', 'B');
INSERT INTO public.star_type_colors VALUES (3, 'A', 'Blue', 'A');
INSERT INTO public.star_type_colors VALUES (4, 'F', 'Blue/White', 'F');
INSERT INTO public.star_type_colors VALUES (5, 'G', 'White/Yellow', 'G');
INSERT INTO public.star_type_colors VALUES (6, 'K', 'Orange/Red', 'K');
INSERT INTO public.star_type_colors VALUES (7, 'M', 'Red', 'M');
INSERT INTO public.star_type_colors VALUES (8, 'W', 'Blue', 'W');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


--
-- Name: star_type_definitions_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_definitions_star_type_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_ngc_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_ngc_number_key UNIQUE (ngc_number);


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
-- Name: star_type_colors star_type_colors_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type_colors
    ADD CONSTRAINT star_type_colors_name_key UNIQUE (name);


--
-- Name: star_type_colors star_type_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type_colors
    ADD CONSTRAINT star_type_colors_pkey PRIMARY KEY (star_type_colors_id);


--
-- Name: star_type_colors star_type_colors_star_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type_colors
    ADD CONSTRAINT star_type_colors_star_type_key UNIQUE (star_type);


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
-- Name: star star_star_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_fkey FOREIGN KEY (star_type) REFERENCES public.star_type_colors(star_type);


--
-- PostgreSQL database dump complete
--

