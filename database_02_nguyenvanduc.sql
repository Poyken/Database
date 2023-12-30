--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    email character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    address character varying(50) NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    price_total integer NOT NULL,
    quantity_total integer NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    customer_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_products (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    price integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    quantity integer
);


ALTER TABLE public.orders_products OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    quantity integer NOT NULL,
    status boolean DEFAULT true,
    price integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, name, age, email, phone, address) FROM stdin;
5	customer5	2	customer5@gmail.com	5555	ad5
4	customer4	21	customer4@gmail.com	4444	ad4
3	customer3	20	customer3@gmail.com	3333	ad3
2	customer2	19	custome2r@gmail.com	2222	ad2
1	customer1	18	customer1@gmail.com	1111	ad1
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, name, price_total, quantity_total, status, created_at, updated_at, customer_id) FROM stdin;
5	order5	500	50	t	2023-12-30 16:01:47.026864	2023-12-30 16:01:47.026864	1
4	order4	400	40	t	2023-12-30 16:01:47.026864	2023-12-30 16:01:47.026864	2
3	order3	300	30	t	2023-12-30 16:01:47.026864	2023-12-30 16:01:47.026864	3
2	order2	200	20	t	2023-12-30 16:01:47.026864	2023-12-30 16:01:47.026864	2
1	order1	100	10	t	2023-12-30 16:01:47.026864	2023-12-30 16:01:47.026864	1
\.


--
-- Data for Name: orders_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_products (id, order_id, product_id, price, created_at, updated_at, quantity) FROM stdin;
5	1	4	600	2023-12-30 16:04:55.18504	2023-12-30 16:04:55.18504	2
3	5	2	400	2023-12-30 16:04:55.18504	2023-12-30 16:04:55.18504	5
2	4	3	300	2023-12-30 16:04:55.18504	2023-12-30 16:04:55.18504	4
1	1	2	200	2023-12-30 16:04:55.18504	2023-12-30 16:04:55.18504	6
4	1	5	500	2023-12-30 16:04:55.18504	2023-12-30 16:04:55.18504	3
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, quantity, status, price, created_at, updated_at) FROM stdin;
5	product5	50	t	50	2023-12-30 16:03:51.831551	2023-12-30 16:03:51.831551
4	product4	40	t	40	2023-12-30 16:03:51.831551	2023-12-30 16:03:51.831551
3	product3	30	t	30	2023-12-30 16:03:51.831551	2023-12-30 16:03:51.831551
2	product2	20	t	20	2023-12-30 16:03:51.831551	2023-12-30 16:03:51.831551
1	product1	10	t	10	2023-12-30 16:03:51.831551	2023-12-30 16:03:51.831551
\.


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: orders_products orders_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: orders_products orders_products_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: orders_products orders_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

