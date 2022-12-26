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
    name character varying(30) NOT NULL,
    description text,
    galaxy_type character varying(20),
    number_of_stars integer NOT NULL
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
-- Name: planet_more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_more_info (
    planet_more_info_id integer NOT NULL,
    more_description text,
    has_satelite boolean,
    name character varying(20) NOT NULL
);


ALTER TABLE public.planet_more_info OWNER TO freecodecamp;

--
-- Name: galaxy_more_info_galaxy_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_more_info_galaxy_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_more_info_galaxy_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_more_info_galaxy_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_more_info_galaxy_more_info_id_seq OWNED BY public.planet_more_info.planet_more_info_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_planet_km numeric(10,4),
    has_life boolean,
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
    planet_type character varying(20),
    number_of_moons integer NOT NULL,
    distance_from_sun_lym numeric(10,4),
    has_life boolean,
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
    star_type character varying(20),
    number_of_planets integer NOT NULL,
    distance_from_earth numeric(10,4),
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
-- Name: planet_more_info planet_more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info ALTER COLUMN planet_more_info_id SET DEFAULT nextval('public.galaxy_more_info_galaxy_more_info_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'NGC 7537', 'Radial Velocity 2874 km/s ', 'spyral', 120);
INSERT INTO public.galaxy VALUES (2, 'NGS 3021', 'Radial Velocity 1537 km/s', 'spyral', 93);
INSERT INTO public.galaxy VALUES (3, 'NGC 5643', 'Radial Velocity 1199 km/s ', 'spyral', 41);
INSERT INTO public.galaxy VALUES (4, 'NGS 2525', 'Radial Velocity 1581 km/s', 'spyral', 71);
INSERT INTO public.galaxy VALUES (5, 'NGC 5584', 'Radial Velocity 1637 km/s ', 'spyral', 91);
INSERT INTO public.galaxy VALUES (6, 'NGC 0105', 'Radial Velocity 5290 km/s', 'spyral', 221);
INSERT INTO public.galaxy VALUES (7, 'Milky Way', 'Number of Stars 400 billions', 'spyral', 87400);
INSERT INTO public.galaxy VALUES (8, 'Whirlpool Galaxy', 'M51-ULS-1b is first known Exoplanet', 'spyral', 31);
INSERT INTO public.galaxy VALUES (9, 'NGC 6946', 'Supernova SN 2017', 'spyral', 25);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Moonless', 384400.0000, false, 1);
INSERT INTO public.moon VALUES (3, 'Ganymede', 'Water discovered', 663647.0000, false, 6);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanicaly active', 262896.0000, false, 6);
INSERT INTO public.moon VALUES (5, 'Europa', 'Water moon - life friendly.', 415879.0000, false, 6);
INSERT INTO public.moon VALUES (6, 'Calisto', 'Salty ocean beneath its surface.', 1.1830, false, 6);
INSERT INTO public.moon VALUES (7, 'Deimos', '2.5 km diametar', 0.0000, false, 4);
INSERT INTO public.moon VALUES (8, 'Phoebos', 'Close to Mars to 1.8m.', 1.8000, false, 4);
INSERT INTO public.moon VALUES (10, 'Titan', 'Substantial atmosphere and liquids on the surface.', 741378.0000, false, 8);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Iced ocean on the surface.', 238000.0000, false, 8);
INSERT INTO public.moon VALUES (11, 'Epimetheus', '52 km radius', 151000.0000, false, 8);
INSERT INTO public.moon VALUES (12, 'Ariel', 'Water ice and silicate rock.', 151000.0000, false, 9);
INSERT INTO public.moon VALUES (13, 'Oberon', 'Second larges to Uran.', 0.0000, false, 9);
INSERT INTO public.moon VALUES (14, 'Titania', 'One of  largest to Uran.', 0.0000, false, 9);
INSERT INTO public.moon VALUES (15, 'Miranda', 'One of  largest to Uran.', 0.0000, false, 9);
INSERT INTO public.moon VALUES (16, 'Charon', 'Double planet system.', 19.6400, false, 11);
INSERT INTO public.moon VALUES (17, 'Hydra', 'Double moon system.', 40000.0000, false, 11);
INSERT INTO public.moon VALUES (18, 'Kerberos', 'Covered with water ice.', 0.0000, false, 11);
INSERT INTO public.moon VALUES (19, 'Proteus', 'Box shape', 40000.0000, false, 10);
INSERT INTO public.moon VALUES (20, 'Galatea', 'Disturb ring system of Neptun', 40000.0000, false, 10);
INSERT INTO public.moon VALUES (21, 'Triton', 'Has retrograde orbit', 0.0000, false, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Moon', 'terrestrial', 1, 0.0000, true, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Without moons', 'terrestrial', 0, 2.6900, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Without moons', 'terrestrial', 0, 6.2000, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Moons Phobos | Deimos', 'terrestrial', 2, 13.0000, false, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 'Moons Io | Europa | Ganymede | Callisto | Dia | Arche | Ananke | Eirene | Eupheme | Euporie | Kale | Leda | Mneme | Thyone | Valetudo', 'Gas Giant', 75, 41.1770, false, 1);
INSERT INTO public.planet VALUES (8, 'Saturn', 'Moons Enceladus | Titan  Aegaeon | Anthe | Atlas | Calypso | Daphnis | Dione | Epimetheus | Helene | Hyperion | Iapetus | Janus | Methone | Mimas | Pan | Pandora | Phoebe | Prometheus | Rhea | Tethys | Telesto', 'Gas Giant', 83, 81.8100, false, 1);
INSERT INTO public.planet VALUES (9, 'Uran', 'Moons Ariel | Oberon | Puck | Rosalind | Titania | Umbriel', 'Ice Giant ', 27, 163.5960, false, 1);
INSERT INTO public.planet VALUES (10, 'Neptun', 'Moons Triton | Proteus | Nereid | Naiad ', 'Ice Giant', 14, 248.7760, false, 1);
INSERT INTO public.planet VALUES (11, 'Pluto', 'Moons Charon | Hydra | Nix | Kerberos | Styx ', 'Dwarf Planet', 5, 288.3740, false, 1);
INSERT INTO public.planet VALUES (12, 'Ceres', 'Moonless ', 'Dwarf Planet', 0, 21.2060, false, 1);
INSERT INTO public.planet VALUES (13, 'Makemake', 'Moonless ', 'Dwarf Planet', 0, 380.0000, false, 1);
INSERT INTO public.planet VALUES (14, 'Haumea', 'Moons Namaka | Hiiaka ', 'Dwarf Planet', 2, 360.0000, false, 1);
INSERT INTO public.planet VALUES (15, 'Eris', 'Moons Dysnomia ', 'Dwarf Planet', 1, 360.0000, false, 1);


--
-- Data for Name: planet_more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_more_info VALUES (1, 'Hydrogen and helium atmosphere.', true, 'Jupiter');
INSERT INTO public.planet_more_info VALUES (2, 'Temperature -72 C.', false, 'Mars');
INSERT INTO public.planet_more_info VALUES (3, 'Life planet', true, 'Earth');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Source of life', 'yellow dwarf', 8, 8.0000, 7);
INSERT INTO public.star VALUES (2, 'SN 2017eaw', 'Outside of Milky Way', 'super nova', 0, 22.0000, 9);
INSERT INTO public.star VALUES (3, 'Proxima Centaury', 'Exoplanets a | b | c', 'red dwarf', 3, 4.0000, 7);
INSERT INTO public.star VALUES (4, 'Alpha Centaury', 'Exoplanets b | c', 'orange dwarf', 2, 6.0000, 7);
INSERT INTO public.star VALUES (5, 'Epsilon Eridani', 'Exoplanets b', 'orange dwarf', 1, 10.5000, 7);
INSERT INTO public.star VALUES (6, 'Alpha Centaury A', 'Exoplanets b', 'yellow dwarf', 1, 4.2000, 7);
INSERT INTO public.star VALUES (7, 'Procyon A', 'Exoplanets b', 'pale yellow', 0, 11.4600, 7);
INSERT INTO public.star VALUES (8, 'Eta Cassiopeiae A', 'Hypothetical planet', 'pale yellow', 0, 19.4200, 7);
INSERT INTO public.star VALUES (9, 'Sirius', 'Hypothetical planet', 'cyan (white dwarf)', 0, 8.6000, 7);
INSERT INTO public.star VALUES (10, 'Vega', 'Hypothetical planet', 'cyan (white dwarf)', 0, 25.0000, 7);
INSERT INTO public.star VALUES (11, 'Algol', 'Hypothetical planet', 'blue', 0, 90.0000, 7);
INSERT INTO public.star VALUES (12, 'Regulus', 'Hypothetical planet', 'blue', 0, 79.0000, 7);
INSERT INTO public.star VALUES (13, 'Iota Orionis', 'Hypothetical planet', 'bluish-violet', 0, 1340.0000, 7);
INSERT INTO public.star VALUES (14, 'Alitak(Zeta Orionis)', 'Hypothetical planet', 'bluish-violet', 0, 1260.0000, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: galaxy_more_info_galaxy_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_more_info_galaxy_more_info_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


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
-- Name: planet_more_info planet_more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_name_key UNIQUE (name);


--
-- Name: planet_more_info planet_more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_pkey PRIMARY KEY (planet_more_info_id);


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

