--
-- PostgreSQL database dump
--

\restrict udAkTjeXkUY5B0Lvzb9r1SsaGSqoJxk8wUaQeDefxj55CA6PjRSQYiCUdB7p1mb

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-04-03 11:43:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 16628)
-- Name: dim_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_customers (
    customer_id text,
    customer_name text,
    city text
);


ALTER TABLE public.dim_customers OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16638)
-- Name: dim_date; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_date (
    order_date date,
    year numeric,
    month numeric,
    day numeric
);


ALTER TABLE public.dim_date OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16633)
-- Name: dim_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_products (
    product_id text,
    product_name text,
    category text
);


ALTER TABLE public.dim_products OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16623)
-- Name: fact_sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_sales (
    order_id text,
    customer_id text,
    product_id text,
    order_date date,
    quantity integer,
    price numeric,
    revenue numeric
);


ALTER TABLE public.fact_sales OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16517)
-- Name: raw_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raw_customers (
    customer_id text,
    customer_name text,
    city text
);


ALTER TABLE public.raw_customers OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16532)
-- Name: raw_order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raw_order_items (
    order_id text,
    product_id text,
    quantity integer,
    price numeric
);


ALTER TABLE public.raw_order_items OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16522)
-- Name: raw_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raw_orders (
    order_id text,
    customer_id text,
    order_status text,
    order_date date
);


ALTER TABLE public.raw_orders OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16537)
-- Name: raw_payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raw_payments (
    order_id text,
    payment_value numeric
);


ALTER TABLE public.raw_payments OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16527)
-- Name: raw_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raw_products (
    product_id text,
    product_name text,
    category text
);


ALTER TABLE public.raw_products OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16603)
-- Name: stg_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stg_customers (
    customer_id text,
    customer_name text,
    city text
);


ALTER TABLE public.stg_customers OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16613)
-- Name: stg_order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stg_order_items (
    order_id text,
    product_id text,
    quantity integer,
    price numeric
);


ALTER TABLE public.stg_order_items OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16598)
-- Name: stg_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stg_orders (
    order_id text,
    customer_id text,
    order_status text,
    order_date date
);


ALTER TABLE public.stg_orders OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16618)
-- Name: stg_payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stg_payments (
    order_id text,
    payment_value numeric
);


ALTER TABLE public.stg_payments OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16608)
-- Name: stg_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stg_products (
    product_id text,
    product_name text,
    category text
);


ALTER TABLE public.stg_products OWNER TO postgres;

--
-- TOC entry 5018 (class 0 OID 16628)
-- Dependencies: 230
-- Data for Name: dim_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_customers (customer_id, customer_name, city) FROM stdin;
C1	Rahul	Delhi
C2	Priya	Mumbai
C3	Amit	Bangalore
C4	Neha	Delhi
C5	Arjun	Pune
\.


--
-- TOC entry 5020 (class 0 OID 16638)
-- Dependencies: 232
-- Data for Name: dim_date; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_date (order_date, year, month, day) FROM stdin;
2023-01-01	2023	1	1
2023-01-02	2023	1	2
2023-01-03	2023	1	3
2023-01-04	2023	1	4
2023-01-05	2023	1	5
2023-01-06	2023	1	6
2023-01-07	2023	1	7
\.


--
-- TOC entry 5019 (class 0 OID 16633)
-- Dependencies: 231
-- Data for Name: dim_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_products (product_id, product_name, category) FROM stdin;
P1	Laptop	Electronics
P2	Mobile	Electronics
P3	Headphones	Electronics
P4	Shoes	Fashions
P5	T-Shirt	Fashions
P6	Watch	Accessories
P7	Bag	Accessories
\.


--
-- TOC entry 5017 (class 0 OID 16623)
-- Dependencies: 229
-- Data for Name: fact_sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_sales (order_id, customer_id, product_id, order_date, quantity, price, revenue) FROM stdin;
1	C1	P1	2023-01-01	1	50000	50000
2	C2	P2	2023-01-02	1	20000	20000
3	C3	P3	2023-01-03	2	1500	3000
4	C1	P4	2023-01-04	1	1500	1500
5	C2	P5	2023-01-05	2	400	800
6	C3	P6	2023-01-06	1	2500	2500
7	C1	P7	2023-01-07	1	1200	1200
\.


--
-- TOC entry 5007 (class 0 OID 16517)
-- Dependencies: 219
-- Data for Name: raw_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raw_customers (customer_id, customer_name, city) FROM stdin;
C1	Rahul	Delhi
C2	Priya	Mumbai
C3	Amit	Bangalore
C4	Neha	Delhi
C5	Arjun	Pune
\.


--
-- TOC entry 5010 (class 0 OID 16532)
-- Dependencies: 222
-- Data for Name: raw_order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raw_order_items (order_id, product_id, quantity, price) FROM stdin;
\.


--
-- TOC entry 5008 (class 0 OID 16522)
-- Dependencies: 220
-- Data for Name: raw_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raw_orders (order_id, customer_id, order_status, order_date) FROM stdin;
\.


--
-- TOC entry 5011 (class 0 OID 16537)
-- Dependencies: 223
-- Data for Name: raw_payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raw_payments (order_id, payment_value) FROM stdin;
\.


--
-- TOC entry 5009 (class 0 OID 16527)
-- Dependencies: 221
-- Data for Name: raw_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raw_products (product_id, product_name, category) FROM stdin;
\.


--
-- TOC entry 5013 (class 0 OID 16603)
-- Dependencies: 225
-- Data for Name: stg_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stg_customers (customer_id, customer_name, city) FROM stdin;
C1	Rahul	Delhi
C2	Priya	Mumbai
C3	Amit	Bangalore
C4	Neha	Delhi
C5	Arjun	Pune
\.


--
-- TOC entry 5015 (class 0 OID 16613)
-- Dependencies: 227
-- Data for Name: stg_order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stg_order_items (order_id, product_id, quantity, price) FROM stdin;
\.


--
-- TOC entry 5012 (class 0 OID 16598)
-- Dependencies: 224
-- Data for Name: stg_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stg_orders (order_id, customer_id, order_status, order_date) FROM stdin;
\.


--
-- TOC entry 5016 (class 0 OID 16618)
-- Dependencies: 228
-- Data for Name: stg_payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stg_payments (order_id, payment_value) FROM stdin;
\.


--
-- TOC entry 5014 (class 0 OID 16608)
-- Dependencies: 226
-- Data for Name: stg_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stg_products (product_id, product_name, category) FROM stdin;
\.


-- Completed on 2026-04-03 11:43:50

--
-- PostgreSQL database dump complete
--

\unrestrict udAkTjeXkUY5B0Lvzb9r1SsaGSqoJxk8wUaQeDefxj55CA6PjRSQYiCUdB7p1mb

