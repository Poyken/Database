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
-- Name: CHI_TIET_SU_DUNG_DV; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CHI_TIET_SU_DUNG_DV" (
    "MaDatPhong" character varying(50) NOT NULL,
    "MaDV" character varying(50) NOT NULL,
    "SoLuong" integer
);


ALTER TABLE public."CHI_TIET_SU_DUNG_DV" OWNER TO postgres;

--
-- Name: DAT_PHONG; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DAT_PHONG" (
    "MaDatPhong" character varying(50) NOT NULL,
    "MaPhong" character varying(50),
    "MaKH" character varying(50),
    "NgayDat" timestamp without time zone,
    "GioBatDau" integer,
    "GioKetThuc" integer,
    "TienDatCoc" integer,
    "GhiChu" character varying(100),
    "TrangThaiDat" boolean DEFAULT true
);


ALTER TABLE public."DAT_PHONG" OWNER TO postgres;

--
-- Name: DICH_VU_DI_KEM; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DICH_VU_DI_KEM" (
    "MaDV" character varying(50) NOT NULL,
    "TenDV" character varying(50),
    "DonViTinh" character varying(10),
    "DOnGia" integer
);


ALTER TABLE public."DICH_VU_DI_KEM" OWNER TO postgres;

--
-- Name: KHACH_HANG; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KHACH_HANG" (
    "MaKH" character varying(50) NOT NULL,
    "TenKH" character varying(50),
    "DiaChi" character varying(50),
    "SoDT" character varying(50)
);


ALTER TABLE public."KHACH_HANG" OWNER TO postgres;

--
-- Name: PHONG; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PHONG" (
    "MaPhong" character varying(50) NOT NULL,
    "LoaiPhong" character varying(50),
    "SoKhachToiDa" integer,
    "GiaPhong" integer,
    "MoTa" character varying(50)
);


ALTER TABLE public."PHONG" OWNER TO postgres;

--
-- Data for Name: CHI_TIET_SU_DUNG_DV; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CHI_TIET_SU_DUNG_DV" ("MaDatPhong", "MaDV", "SoLuong") FROM stdin;
dp3	dv3	3
dp3	dv2	4
dp2	dv1	9
dp2	dv4	8
dp1	dv3	10
dp1	dv2	15
dp1	dv1	20
\.


--
-- Data for Name: DAT_PHONG; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DAT_PHONG" ("MaDatPhong", "MaPhong", "MaKH", "NgayDat", "GioBatDau", "GioKetThuc", "TienDatCoc", "GhiChu", "TrangThaiDat") FROM stdin;
dp4	p1	kh3	\N	7	15	700000	\N	t
dp2	p2	kh2	\N	8	22	500000	\N	t
dp1	p1	kh1	\N	11	16	200000	\N	t
dp3	p3	kh2	\N	6	20	800000	\N	f
\.


--
-- Data for Name: DICH_VU_DI_KEM; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DICH_VU_DI_KEM" ("MaDV", "TenDV", "DonViTinh", "DOnGia") FROM stdin;
dv1	beer	lon	100
dv4	thuoc	bao	50
dv3	ruou	chai	30
dv2	dao	slot	80
\.


--
-- Data for Name: KHACH_HANG; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."KHACH_HANG" ("MaKH", "TenKH", "DiaChi", "SoDT") FROM stdin;
kh4	D	dc4	4444
kh3	C	dc2	3333
kh2	B	dc3	2222
kh1	A	dc1	1111
\.


--
-- Data for Name: PHONG; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PHONG" ("MaPhong", "LoaiPhong", "SoKhachToiDa", "GiaPhong", "MoTa") FROM stdin;
p4	l4	10	50	\N
p3	l3	15	100	\N
p2	l2	25	80	\N
p1	l1	20	60	\N
\.


--
-- Name: CHI_TIET_SU_DUNG_DV CHI_TIET_SU_DUNG_DV_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CHI_TIET_SU_DUNG_DV"
    ADD CONSTRAINT "CHI_TIET_SU_DUNG_DV_pkey" PRIMARY KEY ("MaDatPhong", "MaDV");


--
-- Name: DAT_PHONG DAT_PHONG_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DAT_PHONG"
    ADD CONSTRAINT "DAT_PHONG_pkey" PRIMARY KEY ("MaDatPhong");


--
-- Name: DICH_VU_DI_KEM DICH_VU_DI_KEM_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DICH_VU_DI_KEM"
    ADD CONSTRAINT "DICH_VU_DI_KEM_pkey" PRIMARY KEY ("MaDV");


--
-- Name: KHACH_HANG KHACH_HANG_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KHACH_HANG"
    ADD CONSTRAINT "KHACH_HANG_pkey" PRIMARY KEY ("MaKH");


--
-- Name: PHONG PHONG_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PHONG"
    ADD CONSTRAINT "PHONG_pkey" PRIMARY KEY ("MaPhong");


--
-- Name: CHI_TIET_SU_DUNG_DV CHI_TIET_SU_DUNG_DV_MaDV_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CHI_TIET_SU_DUNG_DV"
    ADD CONSTRAINT "CHI_TIET_SU_DUNG_DV_MaDV_fkey" FOREIGN KEY ("MaDV") REFERENCES public."DICH_VU_DI_KEM"("MaDV");


--
-- Name: CHI_TIET_SU_DUNG_DV CHI_TIET_SU_DUNG_DV_MaDatPhong_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CHI_TIET_SU_DUNG_DV"
    ADD CONSTRAINT "CHI_TIET_SU_DUNG_DV_MaDatPhong_fkey" FOREIGN KEY ("MaDatPhong") REFERENCES public."DAT_PHONG"("MaDatPhong");


--
-- Name: DAT_PHONG DAT_PHONG_MaKH_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DAT_PHONG"
    ADD CONSTRAINT "DAT_PHONG_MaKH_fkey" FOREIGN KEY ("MaKH") REFERENCES public."KHACH_HANG"("MaKH");


--
-- Name: DAT_PHONG DAT_PHONG_MaPhong_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DAT_PHONG"
    ADD CONSTRAINT "DAT_PHONG_MaPhong_fkey" FOREIGN KEY ("MaPhong") REFERENCES public."PHONG"("MaPhong");


--
-- PostgreSQL database dump complete
--

