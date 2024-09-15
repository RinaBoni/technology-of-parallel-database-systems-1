--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2024-09-15 13:17:18

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

DROP DATABASE IF EXISTS bookstore;
--
-- TOC entry 3342 (class 1262 OID 24576)
-- Name: bookstore; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bookstore WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE bookstore OWNER TO postgres;

\connect bookstore

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
-- TOC entry 218 (class 1259 OID 24594)
-- Name: basket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket (
    order_id bigint NOT NULL,
    book_id bigint NOT NULL
);


ALTER TABLE public.basket OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24578)
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.book OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24577)
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_id_seq OWNER TO postgres;

--
-- TOC entry 3343 (class 0 OID 0)
-- Dependencies: 214
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;


--
-- TOC entry 217 (class 1259 OID 24586)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    client character varying(50) NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24585)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 216
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 3182 (class 2604 OID 24581)
-- Name: book id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);


--
-- TOC entry 3183 (class 2604 OID 24589)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3336 (class 0 OID 24594)
-- Dependencies: 218
-- Data for Name: basket; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.basket (order_id, book_id) VALUES (91, 62) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (61, 7) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (14, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (91, 84) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (81, 52) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (32, 37) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (26, 96) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (45, 85) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (90, 42) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (28, 36) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (88, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (61, 86) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (5, 22) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (53, 63) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (71, 82) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (84, 84) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (79, 71) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (51, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (74, 83) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (73, 85) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (13, 56) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (4, 22) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (70, 75) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (14, 54) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (17, 73) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (4, 36) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (65, 53) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (29, 76) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (82, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (39, 18) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (8, 78) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (90, 48) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (29, 52) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (9, 18) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (65, 15) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (61, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (31, 32) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (42, 74) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (38, 50) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (11, 95) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (46, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (80, 16) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (68, 58) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (90, 62) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (57, 12) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (58, 51) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (53, 82) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (31, 98) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (70, 23) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (22, 62) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (99, 95) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (71, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (45, 93) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (89, 39) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (14, 84) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (94, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (59, 37) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (96, 67) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (18, 85) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (88, 55) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (20, 79) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (97, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (81, 73) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (9, 44) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (96, 23) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (89, 50) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (63, 19) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (58, 48) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (2, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (86, 45) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (10, 39) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (37, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (93, 83) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (59, 46) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (16, 73) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (65, 11) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (55, 54) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (13, 18) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (8, 82) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (66, 88) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (2, 96) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (89, 60) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (29, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (70, 65) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (62, 57) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (72, 21) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (30, 19) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (33, 72) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (61, 16) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (91, 22) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (1, 14) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (78, 38) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (45, 70) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (3, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (85, 85) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (98, 47) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (42, 35) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (26, 50) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (65, 56) ON CONFLICT DO NOTHING;
INSERT INTO public.basket (order_id, book_id) VALUES (4, 12) ON CONFLICT DO NOTHING;


--
-- TOC entry 3333 (class 0 OID 24578)
-- Dependencies: 215
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.book (id, name) VALUES (1, 'Nacho Libre') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (2, 'Detour') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (3, 'Tartuffe (Herr TartГјff)') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (4, 'Recoil') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (5, 'Barfly') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (6, 'Undertow (Contracorriente)') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (7, 'Eyes of Tammy Faye, The') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (8, 'Gypsy') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (9, 'Lon Chaney: A Thousand Faces') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (10, 'He Who Dares') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (11, 'Beautiful Life, A') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (12, 'Jolson Story, The') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (13, 'Red Heat') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (14, 'Hounds, The') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (15, 'Die Another Day') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (16, 'Annie Oakley') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (17, 'Battle of Shaker Heights, The') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (18, 'Favorite Deadly Sins') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (19, 'Experiment in Terror') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (20, 'As I Lay Dying') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (21, 'Uncounted: The New Math of American Elections') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (22, 'Kiss Before Dying, A') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (23, 'Role Models') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (24, 'Tyler Perry''s A Madea Christmas') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (25, 'Painting Sellers, The (Taulukauppiaat)') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (26, 'Boulevard') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (27, 'Bigger, Stronger, Faster*') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (28, 'Runaway') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (29, 'Taistelu NГ¤silinnasta 1918') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (30, 'Hotel Pacific (Zaklete rewiry)') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (31, 'When Time Ran Out... (Day the World Ended, The)') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (32, 'Torment (Hets)') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (33, 'Aftermath') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (34, 'The Hunchback of Paris') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (35, 'Drive Thru') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (36, 'Pharaoh''s Army') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (37, 'Children Underground') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (38, 'Leonard Part 6') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (39, 'Generation War') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (40, 'Chappie') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (41, 'Christmas Carol, A') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (42, 'The Humanoid') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (43, 'Cheeky Girls') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (44, 'Gamera vs. Jiger') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (45, 'L''antisГ©mite') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (46, 'Eastern Promises') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (47, 'Abbott and Costello Meet the Keystone Kops') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (48, 'Cloud-Capped Star, The (Meghe Dhaka Tara)') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (49, 'Holy Matrimony') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (50, 'MГ©tastases') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (51, 'Q & A') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (52, 'Chosen One, The') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (53, 'Riding in Cars with Boys') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (54, 'Cheap Detective, The') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (55, 'Power and Terror: Noam Chomsky in Our Times') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (56, 'Mayerling') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (57, 'Anguish (Angustia)') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (58, 'Colossal Youth (Juventude Em Marcha)') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (59, 'Space Odyssey: Voyage to the Planets') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (60, 'QuinceaГ±era') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (61, 'Hellboy II: The Golden Army') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (62, 'Dreamland') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (63, 'Project Nim') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (64, 'Lili''s Apron') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (65, 'Taking Care of Business') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (66, 'Brigham Young') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (67, 'Visitor, The') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (68, 'Our Man in Havana') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (69, 'Ju-on: White Ghost') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (70, 'Coluche, l''histoire d''un mec') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (71, 'Flu') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (72, 'Infinity') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (73, 'Hysterical Blindness') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (74, 'Benigni') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (75, 'Solomon Kane') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (76, 'Irreversible (IrrГ©versible)') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (77, 'Go Fish') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (78, 'Viridiana') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (79, 'Delicatessen') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (80, 'Dom Hemingway') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (81, 'S.O.S. Eisberg') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (82, 'Black Rain') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (83, 'Louis C.K.: Oh My God') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (84, 'Runaway') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (85, '8th Wonderland') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (86, 'Let''s Get Lost') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (87, 'Detective, The (C+ jing taam)') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (88, 'Exorcism of Emily Rose, The') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (89, 'Bird People') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (90, 'Ski Party') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (91, '7 Women (a.k.a. Seven Women)') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (92, 'Cavemen') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (93, 'Gentle Breeze in the Village, A (Tennen kokekkГґ) ') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (94, 'Undisputed') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (95, 'Sniper, The') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (96, 'Evidence') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (97, 'Walk in the Sun, A') ON CONFLICT DO NOTHING;
INSERT INTO public.book (id, name) VALUES (98, 'Vendetta') ON CONFLICT DO NOTHING;


--
-- TOC entry 3335 (class 0 OID 24586)
-- Dependencies: 217
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, client) VALUES (1, 'Clarette Swiers') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (2, 'Brocky Quinnette') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (3, 'Bastien Myott') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (4, 'Ruperta MacTrustie') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (5, 'Kevyn Charlton') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (6, 'Park Merington') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (7, 'Fionna Buxey') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (8, 'Yasmin Humbell') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (9, 'Crista Tapsell') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (10, 'Madge De Blasi') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (11, 'Billy Filipyev') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (12, 'Pepita Ashmore') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (13, 'Enoch Maffione') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (14, 'Obie Spriggs') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (15, 'Kaye Ansell') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (16, 'Frankie Santus') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (17, 'Hewie Tadlow') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (18, 'Melanie Emanulsson') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (19, 'Javier Draxford') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (20, 'Blake O''Teague') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (21, 'Lew Crichton') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (22, 'Devin Puttergill') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (23, 'Estell Crothers') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (24, 'Marion Murthwaite') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (25, 'Sherrie Sargeaunt') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (26, 'Bendix Coraini') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (27, 'Barbee Guillou') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (28, 'Kellby Eagar') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (29, 'Svend Aldrick') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (30, 'Zeke Tring') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (31, 'Remington Toner') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (32, 'Gasparo Bullick') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (33, 'Chrissy Clacson') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (34, 'Mabel Veck') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (35, 'Juliann Talman') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (36, 'Burty Piggin') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (37, 'Blithe Teacy') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (38, 'Hettie Collyear') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (39, 'Rubin Oehme') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (40, 'Bruno Stealy') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (41, 'Faun Hugk') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (42, 'Lyle Queree') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (43, 'Lowrance Fidgeon') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (44, 'Jethro Tomeo') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (45, 'Angelo Rossant') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (46, 'Shirleen Clapperton') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (47, 'Clevie Cardus') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (48, 'Grazia Dorrity') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (49, 'Nannette Arnason') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (50, 'Perri Eaddy') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (51, 'Tracey Fouch') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (52, 'Matthieu Aubery') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (53, 'Dex Christley') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (54, 'Luelle Nollet') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (55, 'Corissa Kinavan') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (56, 'Scotty Bever') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (57, 'Bucky Rothermel') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (58, 'Thedric Grumble') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (59, 'Christean Lakenton') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (60, 'Harriette Madsen') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (61, 'Ardith Oxtoby') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (62, 'Kahlil Marcinkus') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (63, 'Kathleen Thorington') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (64, 'Murdoch Williamson') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (65, 'Dre Staterfield') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (66, 'Jandy Sickamore') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (67, 'Lily Hurrion') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (68, 'Randee Morman') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (69, 'Levy Ferrero') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (70, 'Tersina Kermit') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (71, 'Lenore Skeermer') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (72, 'Ivie Kolak') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (73, 'Ulrike Favill') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (74, 'Dorie Armsby') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (75, 'Ailsun Mum') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (76, 'Paola Luetkemeyer') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (77, 'Zaria Colliber') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (78, 'Sondra Kerton') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (79, 'Piggy Block') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (80, 'Rosemary Tollemache') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (81, 'Kip Faucett') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (82, 'Agatha Meritt') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (83, 'Mandy Sones') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (84, 'Gayla Gelder') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (85, 'Gleda Mateescu') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (86, 'Sella Jacobovitch') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (87, 'Chester Shadrack') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (88, 'Tiffani Mac Giany') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (89, 'Tome Blazej') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (90, 'Meggy Urien') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (91, 'Eleen Lillywhite') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (92, 'Patrizius Bedford') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (93, 'Orazio Ilyas') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (94, 'Sammie Riden') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (95, 'Martie Rathborne') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (96, 'Ingamar Flight') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (97, 'Velvet Miettinen') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (98, 'Briana Niesegen') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (99, 'Dedra Roubay') ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, client) VALUES (100, 'Raine Duchatel') ON CONFLICT DO NOTHING;


--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 214
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_id_seq', 98, true);


--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 216
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 100, true);


--
-- TOC entry 3185 (class 2606 OID 24583)
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 3187 (class 2606 OID 24591)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3188 (class 2606 OID 24602)
-- Name: basket basket_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(id);


--
-- TOC entry 3189 (class 2606 OID 24597)
-- Name: basket basket_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


-- Completed on 2024-09-15 13:17:18

--
-- PostgreSQL database dump complete
--

