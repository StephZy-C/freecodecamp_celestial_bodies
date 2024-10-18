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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_id integer,
    galaxy_id integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    visibility_naked_eye boolean NOT NULL,
    galaxy_type character varying(30),
    description text
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
    moon_diameter_km numeric(7,1),
    moon_surface text,
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
    planet_size_km integer,
    planet_types character varying(20),
    number_of_moons integer,
    gravity_field_strength numeric(5,2),
    distance_from_sun numeric(5,2),
    planet_shape character varying(30),
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
    solar_mass numeric(5,3),
    number_of_planets integer,
    candidate_planets integer,
    flare_star boolean NOT NULL,
    description text,
    galaxy_id integer,
    star_system character varying(30)
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Sagittarius', 9, 1);
INSERT INTO public.constellation VALUES (2, 'Andromeda', 5, 2);
INSERT INTO public.constellation VALUES (3, 'Draco', 10, 8);
INSERT INTO public.constellation VALUES (4, 'Orphiuchus', 3, 9);
INSERT INTO public.constellation VALUES (5, 'Hydra', 11, 10);
INSERT INTO public.constellation VALUES (6, 'Eridanus', 4, 13);
INSERT INTO public.constellation VALUES (7, 'Cetus', 6, 14);
INSERT INTO public.constellation VALUES (8, 'Centaurus', 2, 15);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 'Barred spiral', 'The galaxy contains the Sun and its Solar System and therefore Earth');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', true, 'Barred spiral', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', true, 'Grand-design spiral', NULL);
INSERT INTO public.galaxy VALUES (4, 'Sunflower Galaxy', true, 'Flocculent spiral', NULL);
INSERT INTO public.galaxy VALUES (5, 'Topsy Turvy Galaxy', false, 'Barred spiral', NULL);
INSERT INTO public.galaxy VALUES (6, 'Needle Galaxy', false, 'Edge-on spiral', 'Also known as Caldwell 38');
INSERT INTO public.galaxy VALUES (7, 'UFO Galaxy', false, 'Barred spiral', NULL);
INSERT INTO public.galaxy VALUES (8, 'Tadpole Galaxy', false, 'Disrupted barred spiral', 'This shape resulted from tidal interaction that drew out a long tidal tail');
INSERT INTO public.galaxy VALUES (9, 'Starfish Galaxy', false, 'Ultraluminous infrared', 'Merger of 3 galaxies');
INSERT INTO public.galaxy VALUES (10, 'Peekaboo Galaxy', false, 'Compact blue dwarf', 'Galaxy, relatively nearby, is considered one of the most metal-poor ("extremely metal-poor" (XMP)), least chemically enriched, and seemingly primordial, galaxies known');
INSERT INTO public.galaxy VALUES (11, 'Spiderweb Galaxy', false, 'Irregular', NULL);
INSERT INTO public.galaxy VALUES (12, 'Sculptor Dwarf Galaxy', false, 'Dwarf elliptical', NULL);
INSERT INTO public.galaxy VALUES (13, 'Eye of God', true, 'Intermediate spiral', 'A prototype for multi-arm spiral galaxies');
INSERT INTO public.galaxy VALUES (14, 'Wolf-Lundmark-Melotte', false, 'Dwarf irregular', 'a relatively isolated dwarf galaxy located about 3 million light-years from Earth, notable for its chemically unenriched gas similar to that of early universe galaxies');
INSERT INTO public.galaxy VALUES (15, 'Centaurus A', true, 'Elliptical', 'is the fifth brightest galaxy in the sky');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474.8, 'Rocky surface', 3);
INSERT INTO public.moon VALUES (2, 'Deimos', 12.4, 'Smooth and covered in craters', 4);
INSERT INTO public.moon VALUES (3, 'Phobos', 22.5, 'Dust, loose rocks, very dark surface', 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5268.2, 'Dark regions and light-grooved terrian', 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 4820.6, 'Rocky and icy surface', 5);
INSERT INTO public.moon VALUES (6, 'Io', 3640.0, 'extensive plains with frosty coating of sulfur and sulfur dioxide', 5);
INSERT INTO public.moon VALUES (7, 'Titan', 5149.5, 'Flowing methane and ethane', 6);
INSERT INTO public.moon VALUES (8, 'Rhea', 1527.6, 'Icy, cratered, and highhly reflective', 6);
INSERT INTO public.moon VALUES (9, 'Iapetus', 1469.0, 'Hemisphere is dark, while its trailing hemisphere is bright, creating a yin-yang effect', 6);
INSERT INTO public.moon VALUES (10, 'Ariel', 1157.8, 'Water ice and silcate rock with carbon dioxide also present', 7);
INSERT INTO public.moon VALUES (11, 'Titania', 1576.8, 'Relatively dark and slightly red', 7);
INSERT INTO public.moon VALUES (12, 'Oberon', 1552.8, 'Heavily cratered surface that is generally red, withh some dark patches', 7);
INSERT INTO public.moon VALUES (13, 'Triton', 2706.8, 'Sparsely cratered surface with smooth volcanic plains, mounds and round pits formed by icy lava flows', 8);
INSERT INTO public.moon VALUES (14, 'Nereid', 340.0, 'Mixture of water ice and some spectrally neutral material', 8);
INSERT INTO public.moon VALUES (15, 'Proteus', 420.0, 'Dark, neutral in colour, and heavily cratered', 8);
INSERT INTO public.moon VALUES (16, 'Charon', 1212.0, 'Mostly made of dirty water ice, with some reddish organic material in the polar regions', 9);
INSERT INTO public.moon VALUES (17, 'Nix', 49.8, 'covered in water ice', 9);
INSERT INTO public.moon VALUES (18, 'MK2', 175.0, 'Dark surface', 11);
INSERT INTO public.moon VALUES (19, 'Dysnomia', 600.0, 'Dark surface that reflects only 5% of visible light', 12);
INSERT INTO public.moon VALUES (20, 'Namaka', 170.0, 'made of water ice', 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2440, 'Rocky', 0, 3.70, 0.39, 'Spherical-harmonic', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 6052, 'Terrestrial', 0, 8.80, 0.72, 'Extended teadrop', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 6371, 'Terrestrial', 1, 9.80, 1.00, 'Oblate spheroid', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3390, 'Terrestrial', 2, 3.70, 1.52, 'Oblate spheroid', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 69911, 'Gas giant', 95, 24.70, 5.20, 'Oblate spheroid', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 58232, 'Gas giant', 146, 10.50, 9.54, 'Oblate spheroid', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 25362, 'Ice giant', 28, 9.00, 19.20, 'Oblate spheroid', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 24622, 'Ice giant', 16, 11.70, 30.06, 'Oblate spheroid', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 2370, 'Dwarf', 5, 0.49, 39.50, 'Roughly spherical', 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 940, 'Dwarf', 0, 0.27, 2.77, 'Oblate spheroid', 1);
INSERT INTO public.planet VALUES (11, 'Makemake', 1400, 'Dwarf', 1, NULL, 45.48, 'Oblate spheroid', 1);
INSERT INTO public.planet VALUES (12, 'Eris', 2326, 'Dwarf', 1, NULL, 67.84, 'Spherical', 1);
INSERT INTO public.planet VALUES (13, 'Haumea', 1740, 'Dwarf', 2, NULL, 43.19, 'Oval-shaped', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.000, 8, NULL, true, 'eight recognised planets and more dwarf planets', 1, 'Solar System');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 0.122, 1, 2, true, 'is the closest star to the sun and is too faint to be seen with the naked eye, but it can sometimes produce powerful flares that can be seen from Earth', 1, 'Alpha Centuari');
INSERT INTO public.star VALUES (3, 'Barnards Star', 0.144, 1, NULL, true, 'largest known proper motion', 1, NULL);
INSERT INTO public.star VALUES (4, 'Epsilon Eridani', 0.820, 1, 1, true, 'three circumstellar disks', 1, NULL);
INSERT INTO public.star VALUES (5, 'A (GX Andromedae)', 0.380, 1, NULL, true, 'a red dwarf star that is part of a binary star system with its companion star, Gliese 15 B, and is located about 11.6 light-years from the Sun', 1, 'Groombridge 34 (Gliese 15)');
INSERT INTO public.star VALUES (6, 'Tau Ceti', 0.783, 4, 4, false, 'a star in the constellation Cetus that is similar to the Sun in many ways, including its size, brightness, and stability', 1, NULL);
INSERT INTO public.star VALUES (7, 'Teegardens Star', 0.080, 3, NULL, false, 'a red dwarf star that is one of the smallest and closest stars to the sun', 1, NULL);
INSERT INTO public.star VALUES (8, 'Aldebaran', 1.700, 1, NULL, true, 'is one of the 15 brightest stars', 1, NULL);
INSERT INTO public.star VALUES (9, 'Kaus Australis', 3.515, NULL, NULL, false, 'a binary star system in the constellation Sagittarius that is the brightest star in the constellation', 1, 'Epsilon Sagittarii');
INSERT INTO public.star VALUES (10, 'Gliese 625', 0.240, 1, NULL, false, 'a small red dwarf star with an exoplanetary companion in the northern constellation of Draco', 1, NULL);
INSERT INTO public.star VALUES (11, 'Gliese 433', NULL, 3, NULL, false, 'a dim red dwarf star with multiple exoplanetary companions, located in the equatorial constellation of Hydra', 1, NULL);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: constellation constellation_constellation_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_constellation_id_key UNIQUE (constellation_id);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: constellation constellation_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

