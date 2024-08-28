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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    size numeric(5,2)
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
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    has_life boolean,
    is_spherical boolean,
    size_in_millions_of_years numeric(10,2)
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
    name character varying(100),
    description text,
    age_in_millions_of_years integer,
    distance_from_earth bigint,
    has_life boolean,
    is_spherical boolean,
    size numeric(10,2),
    planet_id integer NOT NULL
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
    description text,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    has_life boolean,
    is_spherical boolean,
    size numeric(10,2),
    star_id integer NOT NULL
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
    name character varying(100),
    description text,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    has_life boolean,
    is_spherical boolean,
    size numeric(5,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


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
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Largest object in the asteroid belt', 939.40);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 'Second largest asteroid in the belt', 512.00);
INSERT INTO public.asteroid VALUES (3, 'Vesta', 'One of the brightest asteroids', 525.40);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 'Largest carbonaceous asteroid', 431.00);
INSERT INTO public.asteroid VALUES (5, 'Eros', 'Near-Earth asteroid', 16.80);
INSERT INTO public.asteroid VALUES (6, 'Gaspra', 'First asteroid to be imaged by a spacecraft', 18.20);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy.', 13600, 0, true, true, 100000.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy.', 10000, 2500000, false, true, 220000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A member of the Local Group.', 13000, 3000000, false, true, 60000.00);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Famous for its spiral shape.', 4500, 23000000, false, true, 76000.00);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Known for its large central bulge.', 8900, 31000000, false, true, 50000.00);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Unusual galaxy due to a collision.', 1400, 500000000, false, true, 150000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Only natural satellite of Earth.', 4500, 384000, false, true, 3474.00, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger moon of Mars.', 4500, 9377, false, true, 22.20, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller moon of Mars.', 4500, 23459, false, true, 12.40, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 'Ice-covered moon of Jupiter.', 4500, 628000000, false, true, 3121.00, 7);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Largest moon in the Solar System.', 4500, 628000000, false, true, 5268.00, 7);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Second largest moon of Jupiter.', 4500, 628000000, false, true, 4821.00, 7);
INSERT INTO public.moon VALUES (7, 'Io', 'Most volcanically active body.', 4500, 628000000, false, true, 3643.00, 7);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn.', 4500, 1427000000, false, true, 5149.00, 8);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Second largest moon of Saturn.', 4500, 1427000000, false, true, 1528.00, 8);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Has a two-tone coloration.', 4500, 1427000000, false, true, 1469.00, 8);
INSERT INTO public.moon VALUES (11, 'Mimas', 'Small moon of Saturn.', 4500, 1427000000, false, true, 396.00, 8);
INSERT INTO public.moon VALUES (12, 'Enceladus', 'Known for its geysers.', 4500, 1427000000, false, true, 504.00, 8);
INSERT INTO public.moon VALUES (13, 'Oberon', 'Second largest moon of Uranus.', 4500, 2871000000, false, true, 1522.00, 9);
INSERT INTO public.moon VALUES (14, 'Titania', 'Largest moon of Uranus.', 4500, 2871000000, false, true, 1578.00, 9);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Smallest and innermost moon of Uranus.', 4500, 2871000000, false, true, 471.00, 9);
INSERT INTO public.moon VALUES (16, 'Triton', 'Largest moon of Neptune.', 4500, 4503000000, false, true, 2707.00, 10);
INSERT INTO public.moon VALUES (17, 'Proteus', 'Second largest moon of Neptune.', 4500, 4503000000, false, true, 420.00, 10);
INSERT INTO public.moon VALUES (18, 'Nereid', 'Third largest moon of Neptune.', 4500, 4503000000, false, true, 340.00, 10);
INSERT INTO public.moon VALUES (19, 'Charon', 'Largest moon of Pluto.', 4500, 5913000000, false, true, 1212.00, 11);
INSERT INTO public.moon VALUES (20, 'Styx', 'One of Pluto’s small moons.', 4500, 5913000000, false, true, 16.00, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet in the Solar System.', 4500, 58000000, false, true, 4879.00, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Similar size to Earth.', 4500, 108000000, false, true, 12104.00, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet.', 4500, 0, true, true, 12742.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Known as the Red Planet.', 4500, 227000000, false, true, 6779.00, 1);
INSERT INTO public.planet VALUES (5, 'Proxima b', 'Potentially habitable exoplanet.', 5000, 43000000, false, true, 11900.00, 2);
INSERT INTO public.planet VALUES (6, 'Sirius b', 'White dwarf star.', 300, 8600000, false, true, 12000.00, 3);
INSERT INTO public.planet VALUES (7, 'Betelgeuse I', 'First planet orbiting Betelgeuse.', 8000, 640000000, false, true, 60000.00, 4);
INSERT INTO public.planet VALUES (8, 'Betelgeuse II', 'Second planet orbiting Betelgeuse.', 8000, 640000000, false, true, 70000.00, 4);
INSERT INTO public.planet VALUES (9, 'Rigel I', 'First planet orbiting Rigel.', 8000, 860000000, false, true, 80000.00, 5);
INSERT INTO public.planet VALUES (10, 'Rigel II', 'Second planet orbiting Rigel.', 8000, 860000000, false, true, 90000.00, 5);
INSERT INTO public.planet VALUES (11, 'Polaris b', 'Planet orbiting Polaris.', 7000, 433000000, false, true, 10000.00, 6);
INSERT INTO public.planet VALUES (12, 'Polaris c', 'Another planet orbiting Polaris.', 7000, 433000000, false, true, 11000.00, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System.', 4600, 0, true, true, 1.39, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'Closest star system.', 5500, 43000000, false, true, 1.22, 2);
INSERT INTO public.star VALUES (3, 'Sirius', 'Brightest star in the night sky.', 300, 8600000, false, true, 1.71, 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant star.', 8000, 640000000, false, true, 887.00, 3);
INSERT INTO public.star VALUES (5, 'Rigel', 'Brightest star in Orion constellation.', 8000, 860000000, false, true, 78.90, 3);
INSERT INTO public.star VALUES (6, 'Polaris', 'North Star.', 7000, 433000000, false, true, 44.30, 4);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


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
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 1, false);


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
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

