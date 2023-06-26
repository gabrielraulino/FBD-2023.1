--
-- PostgreSQL database cluster dump
--

-- Started on 2023-06-19 22:57:40

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.0

-- Started on 2023-06-19 22:57:40

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

-- Completed on 2023-06-19 22:57:40

--
-- PostgreSQL database dump complete
--

--
-- Database "BodegaFacil" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.0

-- Started on 2023-06-19 22:57:40

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

--
-- TOC entry 3454 (class 1262 OID 49443)
-- Name: BodegaFacil; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "BodegaFacil" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "BodegaFacil" OWNER TO postgres;

\connect "BodegaFacil"

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
-- TOC entry 215 (class 1259 OID 49445)
-- Name: caixa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.caixa (
    id integer NOT NULL,
    username character varying(20),
    senha character varying(20)
);


ALTER TABLE public.caixa OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 49444)
-- Name: caixa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.caixa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.caixa_id_seq OWNER TO postgres;

--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 214
-- Name: caixa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.caixa_id_seq OWNED BY public.caixa.id;


--
-- TOC entry 220 (class 1259 OID 49465)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    nome character varying(20),
    descricao character varying(100)
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 49464)
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorias_id_seq OWNER TO postgres;

--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 219
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 229 (class 1259 OID 49494)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(50),
    cpf character varying(15),
    dt_cadastro date
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 49493)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 228
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 232 (class 1259 OID 49504)
-- Name: enderecos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enderecos (
    id integer NOT NULL,
    cep character varying(15),
    bairro character varying(50),
    rua character varying(50),
    numero integer,
    complemento character varying(50),
    cliente_id integer NOT NULL
);


ALTER TABLE public.enderecos OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 49503)
-- Name: enderecos_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enderecos_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enderecos_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 231
-- Name: enderecos_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enderecos_cliente_id_seq OWNED BY public.enderecos.cliente_id;


--
-- TOC entry 230 (class 1259 OID 49502)
-- Name: enderecos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enderecos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enderecos_id_seq OWNER TO postgres;

--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 230
-- Name: enderecos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enderecos_id_seq OWNED BY public.enderecos.id;


--
-- TOC entry 227 (class 1259 OID 49488)
-- Name: fiados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fiados (
    cliente_id integer NOT NULL,
    pagamento_id integer NOT NULL
);


ALTER TABLE public.fiados OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 49486)
-- Name: fiados_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fiados_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fiados_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 225
-- Name: fiados_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fiados_cliente_id_seq OWNED BY public.fiados.cliente_id;


--
-- TOC entry 226 (class 1259 OID 49487)
-- Name: fiados_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fiados_pagamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fiados_pagamento_id_seq OWNER TO postgres;

--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 226
-- Name: fiados_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fiados_pagamento_id_seq OWNED BY public.fiados.pagamento_id;


--
-- TOC entry 237 (class 1259 OID 49521)
-- Name: pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagamento (
    id integer NOT NULL,
    tipo character varying(20),
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    atualizado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.pagamento OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 49520)
-- Name: pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pagamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagamento_id_seq OWNER TO postgres;

--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 236
-- Name: pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagamento_id_seq OWNED BY public.pagamento.id;


--
-- TOC entry 218 (class 1259 OID 49455)
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id integer NOT NULL,
    nome character varying(50),
    preco numeric,
    descricao character varying(100),
    quantidade integer,
    tipo_unidade character(2),
    upc character varying(15),
    categoria_id integer NOT NULL
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 49454)
-- Name: produtos_categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produtos_categoria_id_seq OWNER TO postgres;

--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 217
-- Name: produtos_categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_categoria_id_seq OWNED BY public.produtos.categoria_id;


--
-- TOC entry 216 (class 1259 OID 49453)
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produtos_id_seq OWNER TO postgres;

--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 216
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;


--
-- TOC entry 235 (class 1259 OID 49513)
-- Name: telefones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.telefones (
    id integer NOT NULL,
    ddd character(2),
    numero character varying(11),
    cliente_id integer NOT NULL
);


ALTER TABLE public.telefones OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 49512)
-- Name: telefones_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.telefones_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.telefones_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 234
-- Name: telefones_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.telefones_cliente_id_seq OWNED BY public.telefones.cliente_id;


--
-- TOC entry 233 (class 1259 OID 49511)
-- Name: telefones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.telefones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.telefones_id_seq OWNER TO postgres;

--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 233
-- Name: telefones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.telefones_id_seq OWNED BY public.telefones.id;


--
-- TOC entry 224 (class 1259 OID 49474)
-- Name: vendas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendas (
    id integer NOT NULL,
    subtotal numeric,
    caixa_id integer NOT NULL,
    pagamento_id integer NOT NULL,
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    atualizado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.vendas OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 49472)
-- Name: vendas_caixa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendas_caixa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendas_caixa_id_seq OWNER TO postgres;

--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 222
-- Name: vendas_caixa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendas_caixa_id_seq OWNED BY public.vendas.caixa_id;


--
-- TOC entry 221 (class 1259 OID 49471)
-- Name: vendas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendas_id_seq OWNER TO postgres;

--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 221
-- Name: vendas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendas_id_seq OWNED BY public.vendas.id;


--
-- TOC entry 223 (class 1259 OID 49473)
-- Name: vendas_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendas_pagamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendas_pagamento_id_seq OWNER TO postgres;

--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 223
-- Name: vendas_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendas_pagamento_id_seq OWNED BY public.vendas.pagamento_id;


--
-- TOC entry 240 (class 1259 OID 49533)
-- Name: vendas_produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendas_produtos (
    produto_id integer NOT NULL,
    venda_id integer NOT NULL,
    quantidade integer,
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    atualizado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    subtotal numeric
);


ALTER TABLE public.vendas_produtos OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 49531)
-- Name: vendas_produtos_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendas_produtos_produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendas_produtos_produto_id_seq OWNER TO postgres;

--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 238
-- Name: vendas_produtos_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendas_produtos_produto_id_seq OWNED BY public.vendas_produtos.produto_id;


--
-- TOC entry 239 (class 1259 OID 49532)
-- Name: vendas_produtos_venda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendas_produtos_venda_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendas_produtos_venda_id_seq OWNER TO postgres;

--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 239
-- Name: vendas_produtos_venda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendas_produtos_venda_id_seq OWNED BY public.vendas_produtos.venda_id;


--
-- TOC entry 3228 (class 2604 OID 49448)
-- Name: caixa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caixa ALTER COLUMN id SET DEFAULT nextval('public.caixa_id_seq'::regclass);


--
-- TOC entry 3231 (class 2604 OID 49468)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 49497)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 49507)
-- Name: enderecos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enderecos ALTER COLUMN id SET DEFAULT nextval('public.enderecos_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 49508)
-- Name: enderecos cliente_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enderecos ALTER COLUMN cliente_id SET DEFAULT nextval('public.enderecos_cliente_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 49491)
-- Name: fiados cliente_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiados ALTER COLUMN cliente_id SET DEFAULT nextval('public.fiados_cliente_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 49492)
-- Name: fiados pagamento_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiados ALTER COLUMN pagamento_id SET DEFAULT nextval('public.fiados_pagamento_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 49524)
-- Name: pagamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamento ALTER COLUMN id SET DEFAULT nextval('public.pagamento_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 49458)
-- Name: produtos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 49459)
-- Name: produtos categoria_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN categoria_id SET DEFAULT nextval('public.produtos_categoria_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 49516)
-- Name: telefones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefones ALTER COLUMN id SET DEFAULT nextval('public.telefones_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 49517)
-- Name: telefones cliente_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefones ALTER COLUMN cliente_id SET DEFAULT nextval('public.telefones_cliente_id_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 49477)
-- Name: vendas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas ALTER COLUMN id SET DEFAULT nextval('public.vendas_id_seq'::regclass);


--
-- TOC entry 3233 (class 2604 OID 49478)
-- Name: vendas caixa_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas ALTER COLUMN caixa_id SET DEFAULT nextval('public.vendas_caixa_id_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 49479)
-- Name: vendas pagamento_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas ALTER COLUMN pagamento_id SET DEFAULT nextval('public.vendas_pagamento_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 49536)
-- Name: vendas_produtos produto_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas_produtos ALTER COLUMN produto_id SET DEFAULT nextval('public.vendas_produtos_produto_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 49537)
-- Name: vendas_produtos venda_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas_produtos ALTER COLUMN venda_id SET DEFAULT nextval('public.vendas_produtos_venda_id_seq'::regclass);


--
-- TOC entry 3423 (class 0 OID 49445)
-- Dependencies: 215
-- Data for Name: caixa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.caixa (id, username, senha) FROM stdin;
1	admin	admin123
\.


--
-- TOC entry 3428 (class 0 OID 49465)
-- Dependencies: 220
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, nome, descricao) FROM stdin;
1	Alimentos	\N
2	Carnes	\N
3	Bebidas	\N
4	Hortifrut	\N
5	Limpeza	\N
6	Padaria	\N
7	Papelaria	\N
8	Utilidades	\N
9	Temperos	\N
10	Pets	\N
\.


--
-- TOC entry 3437 (class 0 OID 49494)
-- Dependencies: 229
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nome, cpf, dt_cadastro) FROM stdin;
1	Jose Silva	584.731.660-78	2023-06-19
2	Francisco Teixeira	820.434.400-71	2023-06-19
3	Paulo Pinho	882.616.430-42	2023-06-19
4	Joana Larissa	220.474.950-83	2023-06-19
5	Lucas Silva	693.583.240-31	2023-06-19
6	Guilherme Girão	038.417.260-11	2023-06-19
7	Maria Ferreira	777.707.320-69	2023-06-19
8	Joselia Mafra	661.845.490-57	2023-06-19
9	Jeneudo Farias	694.928.970-75	2023-06-19
10	Manoel Gomes	818.354.600-54	2023-06-19
\.


--
-- TOC entry 3440 (class 0 OID 49504)
-- Dependencies: 232
-- Data for Name: enderecos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enderecos (id, cep, bairro, rua, numero, complemento, cliente_id) FROM stdin;
1	63900-002	Centro	Rua Florencio Lopes	410	Casa	1
2	63900-013	Centro	Rua Campina	620	Casa	2
3	63900-017	Centro	Rua Estudante Antonio Brito	800	Casa	3
4	63900-037	Centro	ravessa Aristides Goncalves da Silva	1230	casa	4
5	63900-045	Centro	Rua Frazão Cravo	1945	casa	5
6	63900-350	Herval	Rua do Sossego	336	apto 402	6
7	63900-405	Sao Joao	Rua B	1513	casa	7
8	63900-415	Sao Joao	Rua C	1428	casa	8
9	63901-080	Planalto Renascer	Rua Clarinda Moreira de Queiroz	2203	casa	9
10	63902-145	 Planalto Universitario	Travessa Pedro Cabral de Oliveira	700	casa	10
\.


--
-- TOC entry 3435 (class 0 OID 49488)
-- Dependencies: 227
-- Data for Name: fiados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fiados (cliente_id, pagamento_id) FROM stdin;
\.


--
-- TOC entry 3445 (class 0 OID 49521)
-- Dependencies: 237
-- Data for Name: pagamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pagamento (id, tipo, criado_em, atualizado_em) FROM stdin;
1	Cartão de Crédito	2023-06-19 15:39:04.970883	2023-06-19 15:39:04.970883
2	Cartão de Débido	2023-06-19 18:02:23.990372	2023-06-19 18:02:23.990372
3	Dinheiro	2023-06-19 18:02:23.990372	2023-06-19 18:02:23.990372
4	Pix	2023-06-19 18:02:23.990372	2023-06-19 18:02:23.990372
\.


--
-- TOC entry 3426 (class 0 OID 49455)
-- Dependencies: 218
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id, nome, preco, descricao, quantidade, tipo_unidade, upc, categoria_id) FROM stdin;
2	Pasteis Crocantes Uchoa 200g	6.38	Pasteis industrializados de massa fina	12	UN	\N	1
3	Amido de Milo Maizena 200g	4.38	Ótimo para receitas e mingau	10	UN	\N	1
4	Maionese Quero Sache 200g	3.28	A Maionese Quero Sachê vem na medida certa para fazer suas receitas em casa.	10	UN	\N	1
5	Geleia de Mocoto Predilecta 180G Natural	5.99	Geleia de Mocotó Natural Predilecta Vidro 180g	5	UN	\N	1
7	Pao integral Visconti 400g	11.99	Pão integral de alta qualidade, rico em proteínas e fibras	10	UN	\N	6
8	Pao de Forma Renopan 500g	8.78	Pão de forma Renopan 500g UN	10	UN	\N	6
9	Bolacha Acebolada Nobre 250g	4.58	Bolacha Acebolada Nobre 250g	10	UN	\N	6
10	Caldo de Galinha Maggi Tablete 57g	1.68	Caldo de Galinha MAGGI. Contém glúten	20	UN	\N	9
11	Vassoura Mazzaferro lindona	12.10	Vassoura Mazzaferro Lindona Unidade	5	UN	\N	8
12	Frango ao Molho Pedigree Sache 100g	3.35	Alimento para Cães Filhotes Frango ao Molho Pedigree Sachê 100g	10	UN	\N	10
13	Caderno Universitario 10 Materias	16.65	Caderno Universitário 10 Matérias Zip Preto 160 Folhas Tilibra	8	UN	\N	7
14	Tangerina Kg	8.87	Tangerina Kg	10	KG	\N	4
15	Agua Sanitaria Dragao	1.99	Produto com múltiplas funcionalidades.	10	UN	\N	5
16	Cerveja Budweiser Lata 350ml	4.57	Cerveja Budweiser Lata 350ml	15	UN	\N	3
17	Carne Moida Intermediaria Kg	26.47	Carne Moída Intermediária kg	10	KG	\N	2
1	Leite em Po Betania Integral 200g	8.95	Alergicos: Contem leite, lactose	8	UN	\N	1
6	Arroz Branco 101 1Kg	3.99	Subtipo: polido tipo 1	8	Un	\N	1
\.


--
-- TOC entry 3443 (class 0 OID 49513)
-- Dependencies: 235
-- Data for Name: telefones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.telefones (id, ddd, numero, cliente_id) FROM stdin;
1	88	25841381	1
2	88	31431627	3
3	85	21578825	2
4	85	34542375	4
5	85	25901388	5
6	88	33210081	6
7	88	27574262	7
8	85	34325243	8
9	88	25446798	9
10	85	33782657	10
\.


--
-- TOC entry 3432 (class 0 OID 49474)
-- Dependencies: 224
-- Data for Name: vendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendas (id, subtotal, caixa_id, pagamento_id, criado_em, atualizado_em) FROM stdin;
1	25.88	1	1	2023-06-19 17:00:10.26032	2023-06-19 17:00:10.26032
\.


--
-- TOC entry 3448 (class 0 OID 49533)
-- Dependencies: 240
-- Data for Name: vendas_produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendas_produtos (produto_id, venda_id, quantidade, criado_em, atualizado_em, subtotal) FROM stdin;
1	1	2	2023-06-19 17:12:46.104693	2023-06-19 17:12:46.104693	17.9
6	1	2	2023-06-19 17:12:46.104693	2023-06-19 17:12:46.104693	7.98
\.


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 214
-- Name: caixa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.caixa_id_seq', 1, true);


--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 219
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 10, true);


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 228
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 10, true);


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 231
-- Name: enderecos_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enderecos_cliente_id_seq', 1, false);


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 230
-- Name: enderecos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enderecos_id_seq', 10, true);


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 225
-- Name: fiados_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fiados_cliente_id_seq', 1, false);


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 226
-- Name: fiados_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fiados_pagamento_id_seq', 1, false);


--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 236
-- Name: pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagamento_id_seq', 4, true);


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 217
-- Name: produtos_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_categoria_id_seq', 1, false);


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 216
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_seq', 17, true);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 234
-- Name: telefones_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.telefones_cliente_id_seq', 1, false);


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 233
-- Name: telefones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.telefones_id_seq', 10, true);


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 222
-- Name: vendas_caixa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendas_caixa_id_seq', 1, true);


--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 221
-- Name: vendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendas_id_seq', 1, true);


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 223
-- Name: vendas_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendas_pagamento_id_seq', 1, false);


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 238
-- Name: vendas_produtos_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendas_produtos_produto_id_seq', 1, false);


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 239
-- Name: vendas_produtos_venda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendas_produtos_venda_id_seq', 1, false);


--
-- TOC entry 3252 (class 2606 OID 49450)
-- Name: caixa caixa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caixa
    ADD CONSTRAINT caixa_pkey PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 49452)
-- Name: caixa caixa_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caixa
    ADD CONSTRAINT caixa_username_key UNIQUE (username);


--
-- TOC entry 3258 (class 2606 OID 49470)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 49501)
-- Name: clientes clientes_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cpf_key UNIQUE (cpf);


--
-- TOC entry 3264 (class 2606 OID 49499)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 49510)
-- Name: enderecos enderecos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enderecos
    ADD CONSTRAINT enderecos_pkey PRIMARY KEY (id);


--
-- TOC entry 3270 (class 2606 OID 49530)
-- Name: pagamento pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 49463)
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- TOC entry 3268 (class 2606 OID 49519)
-- Name: telefones telefones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefones
    ADD CONSTRAINT telefones_pkey PRIMARY KEY (id);


--
-- TOC entry 3260 (class 2606 OID 49485)
-- Name: vendas vendas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (id);


--
-- TOC entry 3276 (class 2606 OID 49563)
-- Name: enderecos fk_enderecos_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enderecos
    ADD CONSTRAINT fk_enderecos_cliente FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE RESTRICT;


--
-- TOC entry 3274 (class 2606 OID 49553)
-- Name: fiados fk_fiados_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiados
    ADD CONSTRAINT fk_fiados_cliente FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE CASCADE;


--
-- TOC entry 3275 (class 2606 OID 49558)
-- Name: fiados fk_fiados_pagamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiados
    ADD CONSTRAINT fk_fiados_pagamento FOREIGN KEY (pagamento_id) REFERENCES public.pagamento(id);


--
-- TOC entry 3278 (class 2606 OID 49573)
-- Name: vendas_produtos fk_produtos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas_produtos
    ADD CONSTRAINT fk_produtos FOREIGN KEY (produto_id) REFERENCES public.produtos(id) ON DELETE RESTRICT;


--
-- TOC entry 3271 (class 2606 OID 49538)
-- Name: produtos fk_produtos_categorias; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT fk_produtos_categorias FOREIGN KEY (categoria_id) REFERENCES public.categorias(id) ON DELETE CASCADE;


--
-- TOC entry 3277 (class 2606 OID 49568)
-- Name: telefones fk_telefones_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefones
    ADD CONSTRAINT fk_telefones_cliente FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE RESTRICT;


--
-- TOC entry 3279 (class 2606 OID 49578)
-- Name: vendas_produtos fk_vendas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas_produtos
    ADD CONSTRAINT fk_vendas FOREIGN KEY (venda_id) REFERENCES public.vendas(id) ON DELETE SET NULL;


--
-- TOC entry 3272 (class 2606 OID 49543)
-- Name: vendas fk_vendas_caixa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT fk_vendas_caixa FOREIGN KEY (caixa_id) REFERENCES public.caixa(id) ON DELETE CASCADE;


--
-- TOC entry 3273 (class 2606 OID 49548)
-- Name: vendas fk_vendas_pagamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT fk_vendas_pagamento FOREIGN KEY (pagamento_id) REFERENCES public.pagamento(id) ON DELETE RESTRICT;


-- Completed on 2023-06-19 22:57:40

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.0

-- Started on 2023-06-19 22:57:40

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

-- Completed on 2023-06-19 22:57:41

--
-- PostgreSQL database dump complete
--

-- Completed on 2023-06-19 22:57:41

--
-- PostgreSQL database cluster dump complete
--

