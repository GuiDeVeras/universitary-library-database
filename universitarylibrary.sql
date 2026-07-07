--
-- PostgreSQL database dump
--

\restrict vf7ANFmbUrGkAXhJocxfJ7z5ecL7qpu1mKrcC1tutvRKvZ5Zz6WmIH1SeqngRgF

-- Dumped from database version 15.18 (Debian 15.18-0+deb12u1)
-- Dumped by pg_dump version 15.18 (Debian 15.18-0+deb12u1)

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
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    id integer NOT NULL,
    name text NOT NULL,
    nationality text NOT NULL,
    birth_date date NOT NULL
);


ALTER TABLE public.author OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_id_seq OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.author_id_seq OWNED BY public.author.id;


--
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    id integer NOT NULL,
    title text NOT NULL,
    publication_year date NOT NULL,
    id_author integer NOT NULL
);


ALTER TABLE public.book OWNER TO postgres;

--
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_id_seq OWNER TO postgres;

--
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;


--
-- Name: loan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loan (
    id integer NOT NULL,
    id_student integer NOT NULL,
    id_book integer NOT NULL,
    loan_date date NOT NULL,
    expected_return_date date NOT NULL,
    real_return_date date,
    status text NOT NULL
);


ALTER TABLE public.loan OWNER TO postgres;

--
-- Name: loan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loan_id_seq OWNER TO postgres;

--
-- Name: loan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loan_id_seq OWNED BY public.loan.id;


--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    registration text NOT NULL,
    course text NOT NULL
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_id_seq OWNER TO postgres;

--
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- Name: author id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author ALTER COLUMN id SET DEFAULT nextval('public.author_id_seq'::regclass);


--
-- Name: book id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);


--
-- Name: loan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan ALTER COLUMN id SET DEFAULT nextval('public.loan_id_seq'::regclass);


--
-- Name: student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (id, name, nationality, birth_date) FROM stdin;
1	Marina Valença	Brasileira	1985-03-14
2	Thomas Whitaker	Britânico	1976-11-22
3	Sofia Bellini	Italiana	1990-07-09
4	Henrique Duarte	Português	1968-01-30
5	Lúcia Nakamura	Japonesa	1982-09-18
\.


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (id, title, publication_year, id_author) FROM stdin;
1	Introduction to Programming	2020-01-15	1
2	Data Structures and Algorithms	2019-06-10	2
3	Database Systems: Design and Implementation	2021-03-22	3
4	Modern Software Engineering	2022-08-05	4
5	Calculus: Early Transcendentals	2018-02-14	5
6	Fundamentals of Physics	2017-09-18	1
7	Operating System Concepts	2020-11-30	2
8	Computer Networks and Internet	2019-04-25	3
9	Artificial Intelligence: A Modern Approach	2021-10-12	4
10	Discrete Mathematics for Computer Science	2016-05-20	5
\.


--
-- Data for Name: loan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loan (id, id_student, id_book, loan_date, expected_return_date, real_return_date, status) FROM stdin;
1	1	3	2026-01-10	2026-01-24	2026-01-22	returned
2	2	1	2026-01-12	2026-01-26	\N	borrowed
3	3	5	2026-01-15	2026-01-29	2026-01-28	returned
4	4	2	2026-01-18	2026-02-01	\N	borrowed
5	5	8	2026-01-20	2026-02-03	2026-02-02	returned
6	6	4	2026-01-22	2026-02-05	\N	borrowed
7	7	10	2026-01-25	2026-02-08	2026-02-10	late
8	8	6	2026-01-27	2026-02-10	\N	borrowed
9	1	7	2026-02-01	2026-02-15	2026-02-14	returned
10	2	9	2026-02-03	2026-02-17	\N	borrowed
11	3	2	2026-02-05	2026-02-19	2026-02-18	returned
12	4	10	2026-02-08	2026-02-22	\N	borrowed
13	5	1	2026-02-10	2026-02-24	2026-02-23	returned
14	6	3	2026-02-12	2026-02-26	\N	borrowed
15	7	5	2026-02-15	2026-03-01	2026-03-03	late
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, name, email, registration, course) FROM stdin;
1	Lucas Almeida	lucas.almeida@email.com	20250001	Computer Science
2	Emma Johnson	emma.johnson@email.com	20250002	Software Engineering
3	Gabriel Santos	gabriel.santos@email.com	20250003	Information Systems
4	Olivia Brown	olivia.brown@email.com	20250004	Computer Engineering
5	Matheus Oliveira	matheus.oliveira@email.com	20250005	Data Science
6	Sophia Miller	sophia.miller@email.com	20250006	Cybersecurity
7	Rafael Costa	rafael.costa@email.com	20250007	Artificial Intelligence
8	Isabella Moore	isabella.moore@email.com	20250008	Software Engineering
\.


--
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.author_id_seq', 5, true);


--
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_id_seq', 10, true);


--
-- Name: loan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loan_id_seq', 15, true);


--
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_id_seq', 8, true);


--
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);


--
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- Name: loan loan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT loan_pkey PRIMARY KEY (id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: student student_registration_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_registration_key UNIQUE (registration);


--
-- Name: book book_id_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_id_author_fkey FOREIGN KEY (id_author) REFERENCES public.author(id);


--
-- Name: loan loan_id_book_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT loan_id_book_fkey FOREIGN KEY (id_book) REFERENCES public.book(id);


--
-- Name: loan loan_id_student_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT loan_id_student_fkey FOREIGN KEY (id_student) REFERENCES public.student(id);


--
-- PostgreSQL database dump complete
--

\unrestrict vf7ANFmbUrGkAXhJocxfJ7z5ecL7qpu1mKrcC1tutvRKvZ5Zz6WmIH1SeqngRgF

