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
-- Name: Ingredient; Type: TABLE; Schema: public; Owner: r15i
--

CREATE TABLE public."Ingredient" (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public."Ingredient" OWNER TO r15i;

--
-- Name: Ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: r15i
--

CREATE SEQUENCE public."Ingredient_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Ingredient_id_seq" OWNER TO r15i;

--
-- Name: Ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: r15i
--

ALTER SEQUENCE public."Ingredient_id_seq" OWNED BY public."Ingredient".id;


--
-- Name: Recipe; Type: TABLE; Schema: public; Owner: r15i
--

CREATE TABLE public."Recipe" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    time_minutes integer NOT NULL,
    difficulty character varying(255) NOT NULL,
    image_url character varying(255) NOT NULL,
    user_id integer NOT NULL,
    approved boolean,
    CONSTRAINT "Recipe_difficulty_check" CHECK (((difficulty)::text = ANY ((ARRAY['easy'::character varying, 'medium'::character varying, 'hard'::character varying])::text[])))
);


ALTER TABLE public."Recipe" OWNER TO r15i;

--
-- Name: Recipe_Ingredient; Type: TABLE; Schema: public; Owner: r15i
--

CREATE TABLE public."Recipe_Ingredient" (
    recipe_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


ALTER TABLE public."Recipe_Ingredient" OWNER TO r15i;

--
-- Name: Recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: r15i
--

CREATE SEQUENCE public."Recipe_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Recipe_id_seq" OWNER TO r15i;

--
-- Name: Recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: r15i
--

ALTER SEQUENCE public."Recipe_id_seq" OWNED BY public."Recipe".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: r15i
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    role_id boolean NOT NULL,
    registration_date date NOT NULL
);


ALTER TABLE public."User" OWNER TO r15i;

--
-- Name: User_Favourite_Recipe; Type: TABLE; Schema: public; Owner: r15i
--

CREATE TABLE public."User_Favourite_Recipe" (
    user_id integer NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE public."User_Favourite_Recipe" OWNER TO r15i;

--
-- Name: User_Role; Type: TABLE; Schema: public; Owner: r15i
--

CREATE TABLE public."User_Role" (
    id boolean NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public."User_Role" OWNER TO r15i;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: r15i
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."User_id_seq" OWNER TO r15i;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: r15i
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: Ingredient id; Type: DEFAULT; Schema: public; Owner: r15i
--

ALTER TABLE ONLY public."Ingredient" ALTER COLUMN id SET DEFAULT nextval('public."Ingredient_id_seq"'::regclass);


--
-- Name: Recipe id; Type: DEFAULT; Schema: public; Owner: r15i
--

ALTER TABLE ONLY public."Recipe" ALTER COLUMN id SET DEFAULT nextval('public."Recipe_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: r15i
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Data for Name: Ingredient; Type: TABLE DATA; Schema: public; Owner: r15i
--

COPY public."Ingredient" (id, name) FROM stdin;
1	Agretti
2	Alice fish
3	Allspice
4	Almonds
5	Angler
6	Anice
7	Aperol
8	Apple
9	Artichoke
10	Asiago Cheese
11	Asparagus
12	Aubergine
13	Avocado
14	Bacon
15	Bamboo Shoot
16	Barley
17	Basil
18	Batter
19	Beans
20	Bechamel
21	Beef
22	Beef Broth
23	Beer
24	Black Pepper
25	Blackspot Seabream
26	Blue Cheese
27	Blueberries
28	Boar
29	Bottarga
30	Boursault Cheese
31	Brandy
32	Bread
33	Brie
34	Brill
35	Broccoli
36	Brussel Sprouts
37	Bucatini
38	Bulgur
39	Burrata
40	Butter
41	Cabbage
42	Caciocavallo Cheese
43	Caciotta
44	Cajun
45	Calamarata
46	Camembert Cheese
47	Capers
48	Cardamom
49	Carrots
50	Caserecce
51	Cashew
52	Cauliflower
53	Cayenne
54	Celery
55	Chard
56	Cheddar Cheese
57	Chesnut
58	Chicken Meat
59	Chickpeas
60	Chicory
61	Chilli Peppers
62	Chives
63	Chorizo
64	Cinnamon
65	Clams
66	Clove
67	Cocoa Powder
68	Cod
69	Cod
70	Coffee
71	Cognac
72	Common Plum
73	Conchiglioni
74	Coriander
75	Corn
76	Corn Starch
77	Cotechino
78	Couscous
79	Crabmeat
80	Cream
81	Cucumber
82	Cumin
83	Currant
84	Curry Powder
85	Cuttlefish
86	Ditaloni
87	Dried Figs
88	Duck
89	Edam
90	Eggs
91	Emmental Cheese
92	Farfalle
93	Fava Beans
94	Fennel
95	Feta Cheese
96	Figs
97	Filo
98	Fish Broth
99	Flax Seeds
100	Flour
101	Focaccia
102	Fontina Cheese
103	Frankfurters
104	Fruit Juice
105	Fusilli
106	Garam Masala
107	Garlic
108	Ginger
109	Goat Cheese
110	Goat Meat
111	Grand Marnier
112	Grapefruit
113	Grappa
114	Green Beans
115	Gruyere Cheese
116	Guacamole
117	Guanciale
118	Ham
119	Hazelnuts
120	Honey
121	Juniper
122	Ketchup
123	Lamb
124	Lamb's Lettuce
125	Langres Cheese
126	Lard
127	Latteria Cheese
128	Laurel
129	Leek
130	Lemon
131	Lemongrass
132	Lentils
133	Lettuce
134	Linguine
135	Lobster
136	Lucanica
137	Mackerel
138	Malt
139	Mandarin
140	Maple Syrup
141	Marjoram
142	Marsala
143	Mascarpone
144	Mayonnaise
145	Melissa
146	Milk
147	Mint
148	Miso
149	Mixed Pasta
150	Monkfish
151	Montasio Cheese
152	Mortadella
153	Mozzarella
154	Mushroom
155	Musky Octopus
156	Mussels
157	Mustard
158	Narutomaki
159	Nduja
160	Nutmeg
161	Oat
162	Octopus
163	Oil
164	Olives
165	Onion
166	Orange
167	Orechiette
168	Oregano
169	Paccheri
170	Pancetta
171	Paprika
172	Parmesan
173	Parsley
174	Passion Fruit
175	Peanuts
176	Pear
177	Peas
178	Pecorino Cheese
179	Penne
180	Pepper
181	Pesto
182	Pine Nut
183	Pistachio
184	Pizzoccheri
185	Plum
186	Poppy Seeds
187	Pork Meat
188	Potato
189	Potato Starch
190	Prawn
191	Prosciutto
192	Puff Pastry
193	Pumpkin
194	Quinoa
195	Rabbit
196	Radicchio
197	Radish
198	Raisin
199	Red Bandfish
200	Red mullet
201	Rice
202	Ricotta Cheese
203	Rigatoni
204	Robiola Cheese
205	Rocket
206	Roquefort Cheese
207	Rosemary
208	Rum
209	Saffron
210	Sage
211	Sake
212	Salad
213	Salami
214	Salmon
215	Sardine
216	Sausage
217	Savory
218	Savoy Cabbage
219	Scallop
220	Scamorza Cheese
221	Scampi
222	Sea Bream
223	Seabass
224	Seafood Sauce
225	Seaweed
226	Sedanini
227	Semolina
228	Sesame
229	Shallot
230	Shortcrust pastry
231	Soy
232	Soy Sauce
233	Soybean Sprout
234	Spaghetti
235	Spelt
236	Spinach
237	Spreadable Cheese
238	Squacquerone Cheese
239	Squid
240	Squid
241	Stone Bass
242	Stracchino Cheese
243	Stracciatella Cheese
244	Striped Prawn
245	Sugar
246	Sunflower Seeds
247	Swordfish
248	Tabasco
249	Taco
250	Tahin
251	Taleggio Cheese
252	Thyme
253	Tomato
254	Tomino Cheese
255	Tripe
256	Trofie
257	Trout
258	Truffle
259	Tub Gurnard
260	Tuna
261	Turkey
262	Turmeric
263	Turnip Greens
264	Valtellina Cheese
265	Veal
266	Vegetable Broth
267	Verzini
268	Vinegar
269	Vodka
270	Walnuts
271	Wasabi
272	Wine
273	Worcester Sauce
274	Yogurt
275	Ziti
276	Zucchini
277	Zucchini Flowers
\.


--
-- Data for Name: Recipe; Type: TABLE DATA; Schema: public; Owner: r15i
--

COPY public."Recipe" (id, name, description, time_minutes, difficulty, image_url, user_id, approved) FROM stdin;
1	Spaghetti alla Carbonara	<description of 1 Spaghetti alla Carbonara>	25	medium	https://ricette.giallozafferano.it/Spaghetti-alla-Carbonara	1	t
2	Spaghetti alle vongole	<description of 2 Spaghetti alle vongole>	40	medium	https://ricette.giallozafferano.it/Spaghetti-alle-vongole	1	t
3	Spaghetti Cacio e Pepe	<description of 3 Spaghetti Cacio e Pepe>	20	medium	https://ricette.giallozafferano.it/Spaghetti-Cacio-e-Pepe	1	t
4	Spaghetti all'Amatriciana	<description of 4 Spaghetti all'Amatriciana>	35	medium	https://ricette.giallozafferano.it/Spaghetti-all-Amatriciana	1	t
5	Penne al baffo	<description of 5 Penne al baffo>	17	medium	https://ricette.giallozafferano.it/Penne-al-baffo	1	t
6	Lasagne alla Bolognese	<description of 6 Lasagne alla Bolognese>	55	hard	https://ricette.giallozafferano.it/Lasagne-alla-Bolognese	1	t
7	Parmigiana di melanzane	<description of 7 Parmigiana di melanzane>	140	hard	https://ricette.giallozafferano.it/Parmigiana-di-melanzane	1	t
8	Gateau di patate	<description of 8 Gateau di patate>	100	medium	https://ricette.giallozafferano.it/Gateau-di-patate	1	t
9	Spaghetti allo scoglio	<description of 9 Spaghetti allo scoglio>	55	hard	https://ricette.giallozafferano.it/Spaghetti-allo-scoglio	1	t
10	Arancine	<description of 10 Arancine>	105	hard	https://ricette.giallozafferano.it/Arancini-di-riso	1	t
11	Pasta e fagioli	<description of 11 Pasta e fagioli>	125	easy	https://ricette.giallozafferano.it/Pasta-e-fagioli	1	t
12	Pasta alla gricia	<description of 12 Pasta alla gricia>	25	medium	https://ricette.giallozafferano.it/Pasta-alla-gricia	1	t
13	Crema di zucca	<description of 13 Crema di zucca>	50	medium	https://ricette.giallozafferano.it/Crema-di-zucca	1	t
14	Pasta al forno	<description of 14 Pasta al forno>	110	medium	https://ricette.giallozafferano.it/Pasta-al-forno	1	t
15	Calamarata	<description of 15 Calamarata>	70	medium	https://ricette.giallozafferano.it/Calamarata	1	t
16	Pollo alle mandorle	<description of 16 Pollo alle mandorle>	30	medium	https://ricette.giallozafferano.it/Pollo-alle-mandorle	1	t
17	Torta salata di melanzane	<description of 17 Torta salata di melanzane>	60	easy	https://ricette.giallozafferano.it/Torta-salata-di-melanzane	1	t
18	Vitello tonnato	<description of 18 Vitello tonnato>	85	medium	https://ricette.giallozafferano.it/Vitello-tonnato	1	t
19	Spaghetti con crema di burrata e melanzane	<description of 19 Spaghetti con crema di burrata e melanzane>	30	medium	https://ricette.giallozafferano.it/Spaghetti-con-crema-di-burrata-e-melanzane	1	t
20	Insalata tiepida di polpo e patate	<description of 20 Insalata tiepida di polpo e patate>	85	medium	https://ricette.giallozafferano.it/Insalata-tiepida-di-polpo-e-patate	1	t
21	Scaloppine al limone	<description of 21 Scaloppine al limone>	20	medium	https://ricette.giallozafferano.it/Scaloppine-al-limone	1	t
22	Melanzane al forno	<description of 22 Melanzane al forno>	55	easy	https://ricette.giallozafferano.it/Melanzane-al-forno	1	t
23	Seppie con piselli	<description of 23 Seppie con piselli>	70	hard	https://ricette.giallozafferano.it/Seppie-con-piselli	1	t
24	Torta salata di zucchine	<description of 24 Torta salata di zucchine>	75	hard	https://ricette.giallozafferano.it/Torta-salata-di-zucchine	1	t
25	Polpettine di tonno e ricotta	<description of 25 Polpettine di tonno e ricotta>	30	medium	https://ricette.giallozafferano.it/Polpettine-di-tonno-e-ricotta	1	t
26	Polpette di melanzane	<description of 26 Polpette di melanzane>	90	medium	https://ricette.giallozafferano.it/Polpette-di-melanzane	1	t
27	Conchiglioni ripieni	<description of 27 Conchiglioni ripieni>	105	hard	https://ricette.giallozafferano.it/Conchiglioni-ripieni	1	t
28	Risotto allo Zafferano	<description of 28 Risotto allo Zafferano>	30	hard	https://ricette.giallozafferano.it/Risotto-allo-Zafferano	1	t
29	Couscous alle verdure	<description of 29 Couscous alle verdure>	40	medium	https://ricette.giallozafferano.it/Couscous-alle-verdure	1	t
30	Polpette al sugo	<description of 30 Polpette al sugo>	50	easy	https://ricette.giallozafferano.it/Polpette-al-sugo	1	t
31	Pasta e zucchine	<description of 31 Pasta e zucchine>	20	easy	https://ricette.giallozafferano.it/Pasta-e-zucchine	1	t
32	Salmone al forno	<description of 32 Salmone al forno>	50	medium	https://ricette.giallozafferano.it/Salmone-al-forno	1	t
33	Calamari ripieni	<description of 33 Calamari ripieni>	60	medium	https://ricette.giallozafferano.it/Calamari-ripieni	1	t
34	Pasta e patate alla napoletana	<description of 34 Pasta e patate alla napoletana>	70	medium	https://ricette.giallozafferano.it/Pasta-e-patate-alla-napoletana	1	t
35	Gnocchi alla romana	<description of 35 Gnocchi alla romana>	50	hard	https://ricette.giallozafferano.it/Gnocchi-alla-romana	1	t
36	Pizzoccheri alla valtellinese	<description of 36 Pizzoccheri alla valtellinese>	45	hard	https://ricette.giallozafferano.it/Pizzoccheri-alla-valtellinese	1	t
37	Pasta e lenticchie	<description of 37 Pasta e lenticchie>	70	medium	https://ricette.giallozafferano.it/Pasta-e-lenticchie	1	t
38	Pasta allo scarpariello	<description of 38 Pasta allo scarpariello>	20	easy	https://ricette.giallozafferano.it/Pasta-allo-scarpariello	1	t
39	Cannelloni	<description of 39 Cannelloni>	140	medium	https://ricette.giallozafferano.it/Cannelloni	1	t
40	Sushi	<description of 40 Sushi>	110	hard	https://ricette.giallozafferano.it/Sushi	1	t
41	Gamberoni al forno	<description of 41 Gamberoni al forno>	32	medium	https://ricette.giallozafferano.it/Gamberoni-al-forno	1	t
42	Pasta alla zozzona	<description of 42 Pasta alla zozzona>	40	medium	https://ricette.giallozafferano.it/Pasta-alla-zozzona	1	t
43	Paccheri con carciofi alla carbonara	<description of 43 Paccheri con carciofi alla carbonara>	50	medium	https://ricette.giallozafferano.it/Paccheri-con-carciofi-alla-carbonara	1	t
44	Ossibuchi alla milanese	<description of 44 Ossibuchi alla milanese>	90	hard	https://ricette.giallozafferano.it/Ossibuchi-alla-milanese	1	t
45	Trofie con crema di zucchine e pancetta	<description of 45 Trofie con crema di zucchine e pancetta>	30	medium	https://ricette.giallozafferano.it/Trofie-con-crema-di-zucchine-e-pancetta	1	t
46	Mozzarella in carrozza	<description of 46 Mozzarella in carrozza>	28	medium	https://ricette.giallozafferano.it/Mozzarella-in-carrozza	1	t
47	Brasato al Barolo	<description of 47 Brasato al Barolo>	170	medium	https://ricette.giallozafferano.it/Brasato-al-Barolo	1	t
48	Baccalà in umido	<description of 48 Baccalà in umido>	70	medium	https://ricette.giallozafferano.it/Baccala-in-umido	1	t
49	Saltimbocca alla Romana	<description of 49 Saltimbocca alla Romana>	25	medium	https://ricette.giallozafferano.it/Saltimbocca-alla-Romana	1	t
50	Fiori di zucca in pastella	<description of 50 Fiori di zucca in pastella>	25	medium	https://ricette.giallozafferano.it/Fiori-di-zucca-in-pastella	1	t
51	Gnocco fritto	<description of 51 Gnocco fritto>	62	hard	https://ricette.giallozafferano.it/Gnocco-fritto	1	t
52	Pollo al limone	<description of 52 Pollo al limone>	35	medium	https://ricette.giallozafferano.it/Pollo-al-limone	1	t
53	Insalata di riso	<description of 53 Insalata di riso>	35	medium	https://ricette.giallozafferano.it/Insalata-di-riso-classica	1	t
54	Piadina Romagnola	<description of 54 Piadina Romagnola>	34	medium	https://ricette.giallozafferano.it/Piadina-Romagnola	1	t
55	Zuppa di ceci	<description of 55 Zuppa di ceci>	130	medium	https://ricette.giallozafferano.it/Zuppa-di-ceci	1	t
56	Spaghetti al tonno	<description of 56 Spaghetti al tonno>	15	easy	https://ricette.giallozafferano.it/Spaghetti-al-tonno	1	t
57	Pollo al curry	<description of 57 Pollo al curry>	35	medium	https://ricette.giallozafferano.it/Pollo-al-curry	1	t
58	Spezzatino di vitello con patate	<description of 58 Spezzatino di vitello con patate>	150	medium	https://ricette.giallozafferano.it/Spezzatino-di-vitello-con-patate	1	t
59	Risotto alla salsiccia	<description of 59 Risotto alla salsiccia>	50	medium	https://ricette.giallozafferano.it/Risotto-alla-salsiccia	1	t
60	Crocchette di patate	<description of 60 Crocchette di patate>	75	medium	https://ricette.giallozafferano.it/Crocchette-di-patate	1	t
61	Riso alla cantonese	<description of 61 Riso alla cantonese>	40	easy	https://ricette.giallozafferano.it/Riso-alla-cantonese	1	t
62	Gnocchi alla sorrentina	<description of 62 Gnocchi alla sorrentina>	70	medium	https://ricette.giallozafferano.it/Gnocchi-alla-sorrentina	1	t
63	Paccheri al sugo di calamari	<description of 63 Paccheri al sugo di calamari>	45	medium	https://ricette.giallozafferano.it/Paccheri-al-sugo-di-calamari	1	t
64	Orecchiette broccoli e salsiccia	<description of 64 Orecchiette broccoli e salsiccia>	35	easy	https://ricette.giallozafferano.it/Orecchiette-broccoli-e-salsiccia	1	t
65	Pollo alla cacciatora	<description of 65 Pollo alla cacciatora>	70	medium	https://ricette.giallozafferano.it/Pollo-alla-cacciatora	1	t
66	Linguine gamberetti zucchine e zafferano	<description of 66 Linguine gamberetti zucchine e zafferano>	35	easy	https://ricette.giallozafferano.it/Linguine-gamberetti-zucchine-e-zafferano	1	t
67	Cornetti salati	<description of 67 Cornetti salati>	45	medium	https://ricette.giallozafferano.it/Cornetti-salati	1	t
68	Salmone croccante	<description of 68 Salmone croccante>	30	easy	https://ricette.giallozafferano.it/Salmone-croccante	1	t
69	Risotto con zucchine	<description of 69 Risotto con zucchine>	35	easy	https://ricette.giallozafferano.it/Risotto-con-zucchine	1	t
70	Genovese	<description of 70 Genovese>	280	medium	https://ricette.giallozafferano.it/Genovese	1	t
71	Pesce spada alla siciliana	<description of 71 Pesce spada alla siciliana>	25	easy	https://ricette.giallozafferano.it/Pesce-spada-alla-siciliana	1	t
72	Cozze gratinate	<description of 72 Cozze gratinate>	45	medium	https://ricette.giallozafferano.it/Cozze-gratinate	1	t
73	Scaloppine ai funghi	<description of 73 Scaloppine ai funghi>	30	medium	https://ricette.giallozafferano.it/Scaloppine-ai-funghi	1	t
74	Polpette di verdure	<description of 74 Polpette di verdure>	90	easy	https://ricette.giallozafferano.it/Polpette-di-verdura	1	t
75	Spezzatino di manzo	<description of 75 Spezzatino di manzo>	160	easy	https://ricette.giallozafferano.it/Spezzatino-di-manzo	1	t
76	Torta rustica salata	<description of 76 Torta rustica salata>	80	medium	https://ricette.giallozafferano.it/Torta-rustica-salata	1	t
77	Passatelli in brodo	<description of 77 Passatelli in brodo>	15	easy	https://ricette.giallozafferano.it/Passatelli-in-brodo	1	t
78	Arrosto di vitello al forno con patate	<description of 78 Arrosto di vitello al forno con patate>	90	hard	https://ricette.giallozafferano.it/Arrosto-di-vitello-al-forno-con-patate	1	t
79	Pasta con la zucca	<description of 79 Pasta con la zucca>	60	easy	https://ricette.giallozafferano.it/Pasta-con-la-zucca	1	t
80	Frittata di spaghetti	<description of 80 Frittata di spaghetti>	30	medium	https://ricette.giallozafferano.it/Frittata-di-spaghetti	1	t
81	Canederli alla tirolese (Knödel)	<description of 81 Canederli alla tirolese (Knödel)>	55	medium	https://ricette.giallozafferano.it/Canederli-alla-tirolese-Knodel	1	t
82	Spaghetti alla puttanesca	<description of 82 Spaghetti alla puttanesca>	40	medium	https://ricette.giallozafferano.it/Spaghetti-alla-puttanesca	1	t
83	Pasta al forno con broccoli e pancetta	<description of 83 Pasta al forno con broccoli e pancetta>	53	medium	https://ricette.giallozafferano.it/Pasta-al-forno-con-broccoli-e-pancetta	1	t
84	Polpette di zucchine	<description of 84 Polpette di zucchine>	35	easy	https://ricette.giallozafferano.it/Polpette-di-zucchine	1	t
85	Carne alla pizzaiola	<description of 85 Carne alla pizzaiola>	20	easy	https://ricette.giallozafferano.it/Carne-alla-pizzaiola	1	t
86	Cosce di pollo al forno	<description of 86 Cosce di pollo al forno>	100	medium	https://ricette.giallozafferano.it/Cosce-di-pollo-al-forno	1	t
87	Vellutata di zucca	<description of 87 Vellutata di zucca>	45	medium	https://ricette.giallozafferano.it/Vellutata-di-zucca	1	t
88	Capesante gratinate	<description of 88 Capesante gratinate>	30	easy	https://ricette.giallozafferano.it/Capesante-gratinate	1	t
89	Pasta alla cenere	<description of 89 Pasta alla cenere>	25	easy	https://ricette.giallozafferano.it/Pasta-alla-cenere	1	t
90	Polpette di carne	<description of 90 Polpette di carne>	40	medium	https://ricette.giallozafferano.it/Polpette-di-carne	1	t
91	Pasta alla marinara	<description of 91 Pasta alla marinara>	40	hard	https://ricette.giallozafferano.it/Pasta-alla-marinara	1	t
92	Pasta agli asparagi	<description of 92 Pasta agli asparagi>	40	medium	https://ricette.giallozafferano.it/Pasta-agli-asparagi	1	t
93	Spaghetti aglio olio e peperoncino	<description of 93 Spaghetti aglio olio e peperoncino>	15	easy	https://ricette.giallozafferano.it/Spaghetti-aglio-olio-e-peperoncino	1	t
94	Pomodori ripieni	<description of 94 Pomodori ripieni>	100	medium	https://ricette.giallozafferano.it/Pomodori-ripieni	1	t
95	Ali di pollo e patate saporite	<description of 95 Ali di pollo e patate saporite>	70	easy	https://ricette.giallozafferano.it/Ali-di-pollo-e-patate-saporite	1	t
96	Pasta con asparagi e pancetta	<description of 96 Pasta con asparagi e pancetta>	45	medium	https://ricette.giallozafferano.it/Pasta-con-asparagi-e-pancetta	1	t
97	Orecchiette con le cime di rapa	<description of 97 Orecchiette con le cime di rapa>	45	medium	https://ricette.giallozafferano.it/Orecchiette-con-le-cime-di-rapa	1	t
98	Carbonara di mare	<description of 98 Carbonara di mare>	45	medium	https://ricette.giallozafferano.it/Carbonara-di-mare	1	t
99	Tagliatelle ai funghi porcini	<description of 99 Tagliatelle ai funghi porcini>	65	hard	https://ricette.giallozafferano.it/Tagliatelle-ai-funghi-porcini	1	t
100	Risotto ai funghi porcini	<description of 100 Risotto ai funghi porcini>	45	medium	https://ricette.giallozafferano.it/Risotto-ai-funghi-porcini	1	t
101	Spezzatino con piselli	<description of 101 Spezzatino con piselli>	115	medium	https://ricette.giallozafferano.it/Spezzatino-con-piselli	1	t
\.


--
-- Data for Name: Recipe_Ingredient; Type: TABLE DATA; Schema: public; Owner: r15i
--

COPY public."Recipe_Ingredient" (recipe_id, ingredient_id) FROM stdin;
1	234
1	90
1	24
1	117
1	178
2	234
2	107
2	163
2	65
2	173
2	24
3	234
3	178
3	24
4	234
4	253
4	117
4	178
4	163
4	61
4	272
5	179
5	118
5	80
5	253
5	173
5	163
5	24
6	192
6	21
6	170
6	49
6	54
6	165
6	253
6	163
6	272
6	24
6	20
6	40
6	172
7	12
7	153
7	165
7	163
7	253
7	172
7	17
7	24
8	188
8	213
8	172
8	163
8	153
8	118
8	90
8	24
8	32
9	234
9	65
9	221
9	163
9	173
9	156
9	239
9	253
9	107
9	272
9	24
10	201
10	40
10	209
10	42
10	18
10	32
10	187
10	253
10	24
10	177
10	163
10	272
11	86
11	253
11	191
11	19
11	126
11	54
11	107
11	128
11	24
11	165
11	49
11	207
11	163
12	203
12	178
12	117
13	193
13	266
13	24
13	163
13	160
13	188
13	165
13	64
14	203
14	90
14	172
14	220
14	20
14	216
14	187
14	253
14	163
14	160
14	24
14	17
14	173
14	32
14	107
15	45
15	239
15	107
15	61
15	253
15	272
15	24
15	163
16	58
16	90
16	163
16	189
16	24
16	4
16	232
16	15
17	192
17	12
17	220
17	172
17	253
17	24
17	163
18	265
18	54
18	49
18	165
18	107
18	272
18	128
18	66
18	163
18	24
18	90
18	260
18	215
18	47
19	234
19	39
19	17
19	163
19	12
19	182
19	24
20	239
20	188
20	128
20	173
20	24
20	163
20	130
21	265
21	104
21	24
21	100
21	40
22	12
22	253
22	220
22	164
22	47
22	163
22	24
22	168
23	177
23	85
23	165
23	163
23	173
23	266
23	253
23	272
23	24
24	100
24	163
24	268
24	252
24	276
24	229
24	24
24	90
24	220
24	172
24	170
25	260
25	202
25	2
25	47
25	173
25	90
25	172
25	24
25	32
25	163
26	12
26	32
26	172
26	90
26	107
26	24
26	173
26	163
27	73
27	253
27	172
27	163
27	165
27	24
27	187
27	21
27	202
27	153
27	272
27	90
27	107
28	209
28	201
28	40
28	165
28	172
28	272
28	266
29	78
29	163
29	262
29	49
29	12
29	253
29	61
29	165
29	107
29	276
29	177
29	108
29	147
30	21
30	216
30	32
30	172
30	90
30	173
30	168
30	160
30	24
30	163
30	253
31	92
31	276
31	17
31	163
31	24
31	107
32	214
32	188
32	130
32	272
32	163
32	173
32	24
33	239
33	272
33	107
33	32
33	2
33	90
33	172
33	173
33	24
33	163
34	149
34	188
34	54
34	49
34	165
34	126
34	253
34	207
34	172
34	163
34	24
35	227
35	40
35	172
35	146
35	90
35	160
36	184
36	40
36	172
36	127
36	188
36	107
37	86
37	132
37	170
37	253
37	49
37	165
37	54
37	266
37	107
37	207
37	252
37	172
37	61
37	163
37	24
38	234
38	253
38	178
38	172
38	17
38	61
38	163
38	107
39	100
39	90
39	253
39	20
39	216
39	21
39	172
39	163
39	165
39	54
39	49
39	272
39	24
40	201
40	268
40	245
40	225
40	13
40	79
40	214
40	271
40	260
40	232
40	108
41	190
41	130
41	163
41	24
41	173
42	203
42	117
42	216
42	178
42	253
42	163
42	90
43	169
43	9
43	90
43	170
43	172
43	178
43	229
43	272
43	163
43	24
44	21
44	22
44	165
44	100
44	272
44	163
44	40
44	24
44	173
44	107
44	130
45	256
45	276
45	170
45	107
45	163
45	24
46	32
46	153
46	90
46	100
46	163
47	21
47	272
47	49
47	54
47	165
47	107
47	207
47	128
47	66
47	24
47	64
47	40
47	163
48	68
48	165
48	100
48	253
48	163
48	47
48	164
48	168
48	272
48	24
48	173
49	265
49	118
49	210
49	100
49	272
49	40
49	24
49	163
50	277
50	163
50	100
50	90
51	126
51	100
51	146
51	163
52	58
52	100
52	163
52	168
52	130
52	76
52	232
53	201
53	260
53	253
53	42
53	118
53	177
53	180
53	164
53	81
53	62
54	100
54	126
54	191
54	238
54	205
55	59
55	49
55	54
55	165
55	163
55	207
55	24
55	128
55	266
55	253
56	234
56	260
56	253
56	163
56	24
56	17
56	165
57	58
57	53
57	171
57	82
57	24
57	274
57	262
57	64
57	74
57	107
57	61
57	108
57	163
57	165
57	201
57	48
57	6
58	265
58	188
58	49
58	54
58	165
58	163
58	22
58	24
58	100
58	272
58	210
58	207
58	252
59	201
59	216
59	22
59	209
59	272
59	229
59	24
59	163
59	40
59	172
60	188
60	90
60	160
60	24
60	172
60	32
60	163
61	201
61	177
61	118
61	90
61	272
61	163
61	62
62	188
62	100
62	90
62	253
62	17
62	107
62	163
62	153
62	172
63	239
63	169
63	253
63	163
63	272
63	61
63	107
63	173
64	167
64	35
64	216
64	272
64	107
64	252
64	207
64	163
64	24
65	58
65	253
65	165
65	49
65	54
65	107
65	272
65	163
65	207
65	173
65	24
66	134
66	276
66	190
66	209
66	229
66	80
66	272
66	163
66	24
67	192
67	170
67	89
67	228
67	146
67	90
68	214
68	32
68	173
68	252
68	207
68	130
68	163
68	180
69	201
69	276
69	266
69	165
69	272
69	40
69	172
69	24
69	163
69	147
70	275
70	21
70	165
70	54
70	49
70	173
70	128
70	272
70	163
70	24
70	172
71	247
71	253
71	164
71	163
71	107
71	175
71	168
71	24
72	156
72	32
72	172
72	107
72	130
72	173
72	163
72	24
73	21
73	154
73	40
73	24
73	100
73	107
73	163
73	252
73	207
74	188
74	49
74	177
74	276
74	165
74	172
74	90
74	107
74	173
74	163
74	160
74	24
75	21
75	22
75	165
75	49
75	54
75	272
75	163
75	40
75	100
75	207
75	252
75	210
75	24
76	192
76	40
76	191
76	188
76	102
76	252
76	171
76	24
77	90
77	32
77	172
77	130
77	160
77	22
78	265
78	188
78	272
78	207
78	107
78	163
78	24
79	92
79	193
79	170
79	207
79	266
79	163
79	202
79	165
79	24
80	234
80	90
80	146
80	172
80	220
80	170
80	252
80	24
80	163
80	107
81	32
81	191
81	165
81	90
81	146
81	40
81	24
81	173
81	62
81	22
82	234
82	253
82	2
82	47
82	173
82	164
82	107
82	61
82	163
83	105
83	35
83	172
83	170
83	264
83	163
84	276
84	172
84	202
84	32
84	90
84	252
84	163
84	227
85	21
85	253
85	163
85	168
85	107
86	58
86	188
86	163
86	207
86	252
86	171
87	266
87	160
87	129
87	193
87	80
87	163
88	219
88	32
88	163
88	130
88	173
88	252
88	24
88	141
89	203
89	26
89	164
89	80
89	24
90	21
90	32
90	172
90	90
90	24
90	173
90	252
90	163
91	253
91	169
91	221
91	190
91	219
91	163
91	107
91	17
91	173
91	61
91	156
91	65
92	179
92	11
92	24
92	172
92	229
92	252
93	234
93	107
93	61
93	163
94	253
94	201
94	220
94	178
94	172
94	107
94	17
94	24
94	163
95	58
95	188
95	32
95	100
95	172
95	90
95	173
95	163
96	179
96	11
96	170
96	229
96	24
96	163
97	263
97	32
97	107
97	2
97	163
97	227
98	234
98	260
98	247
98	214
98	90
98	272
98	172
98	107
98	252
98	163
98	24
99	100
99	90
99	227
99	154
99	40
99	163
99	107
99	173
99	24
100	201
100	154
100	266
100	165
100	107
100	40
100	163
100	24
100	172
100	173
101	21
101	177
101	54
101	49
101	165
101	100
101	272
101	266
101	24
101	163
101	253
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: r15i
--

COPY public."User" (id, email, password, name, surname, role_id, registration_date) FROM stdin;
1	emilio.risi@studenti.unipd.it	9b96e9a7b00e4833ea8ac5169d6c69a87bb0591bae55f82910f10a661d4de286	Emilio	Risi	f	2022-03-10
2	francesco.frigato@studenti.unipd.it	9b96e9a7b00e4833ea8ac5169d6c69a87bb0591bae55f82910f10a661d4de286	Francesco 	Frigato 	f	2022-03-10
3	tommaso.bergamasco@studenti.unipd.it	9b96e9a7b00e4833ea8ac5169d6c69a87bb0591bae55f82910f10a661d4de286	Tommaso 	Bergamasco	f	2022-03-10
4	andrea.felline@studenti.unipd.it	9b96e9a7b00e4833ea8ac5169d6c69a87bb0591bae55f82910f10a661d4de286	Andrea	Felline	f	2022-03-10
5	gianluca.antolini@studenti.unipd.it	9b96e9a7b00e4833ea8ac5169d6c69a87bb0591bae55f82910f10a661d4de286	Gianluca	Antolini	f	2022-03-10
\.


--
-- Data for Name: User_Favourite_Recipe; Type: TABLE DATA; Schema: public; Owner: r15i
--

COPY public."User_Favourite_Recipe" (user_id, recipe_id) FROM stdin;
\.


--
-- Data for Name: User_Role; Type: TABLE DATA; Schema: public; Owner: r15i
--

COPY public."User_Role" (id, description) FROM stdin;
f	Admin
t	User
\.


--
-- Name: Ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: r15i
--

SELECT pg_catalog.setval('public."Ingredient_id_seq"', 1, false);


--
-- Name: Recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: r15i
--

SELECT pg_catalog.setval('public."Recipe_id_seq"', 1, false);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: r15i
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, false);


--
-- Name: Ingredient Ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: r15i
--

ALTER TABLE ONLY public."Ingredient"
    ADD CONSTRAINT "Ingredient_pkey" PRIMARY KEY (id);


--
-- Name: Recipe_Ingredient Recipe_Ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: r15i
--

ALTER TABLE ONLY public."Recipe_Ingredient"
    ADD CONSTRAINT "Recipe_Ingredient_pkey" PRIMARY KEY (recipe_id, ingredient_id);


--
-- Name: Recipe Recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: r15i
--

ALTER TABLE ONLY public."Recipe"
    ADD CONSTRAINT "Recipe_pkey" PRIMARY KEY (id);


--
-- Name: User_Favourite_Recipe User_Favourite_Recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: r15i
--

ALTER TABLE ONLY public."User_Favourite_Recipe"
    ADD CONSTRAINT "User_Favourite_Recipe_pkey" PRIMARY KEY (user_id, recipe_id);


--
-- Name: User_Role User_Role_pkey; Type: CONSTRAINT; Schema: public; Owner: r15i
--

ALTER TABLE ONLY public."User_Role"
    ADD CONSTRAINT "User_Role_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: r15i
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: Recipe_Ingredient recipe_ingredient_ingredient_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: r15i
--

ALTER TABLE ONLY public."Recipe_Ingredient"
    ADD CONSTRAINT recipe_ingredient_ingredient_id_foreign FOREIGN KEY (ingredient_id) REFERENCES public."Ingredient"(id);


--
-- Name: Recipe_Ingredient recipe_ingredient_recipe_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: r15i
--

ALTER TABLE ONLY public."Recipe_Ingredient"
    ADD CONSTRAINT recipe_ingredient_recipe_id_foreign FOREIGN KEY (recipe_id) REFERENCES public."Recipe"(id);


--
-- Name: Recipe recipe_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: r15i
--

ALTER TABLE ONLY public."Recipe"
    ADD CONSTRAINT recipe_user_id_foreign FOREIGN KEY (user_id) REFERENCES public."User"(id);


--
-- Name: User_Favourite_Recipe user_favourite_recipe_recipe_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: r15i
--

ALTER TABLE ONLY public."User_Favourite_Recipe"
    ADD CONSTRAINT user_favourite_recipe_recipe_id_foreign FOREIGN KEY (recipe_id) REFERENCES public."Recipe"(id);


--
-- Name: User_Favourite_Recipe user_favourite_recipe_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: r15i
--

ALTER TABLE ONLY public."User_Favourite_Recipe"
    ADD CONSTRAINT user_favourite_recipe_user_id_foreign FOREIGN KEY (user_id) REFERENCES public."User"(id);


--
-- Name: User user_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: r15i
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT user_role_id_foreign FOREIGN KEY (role_id) REFERENCES public."User_Role"(id);


--
-- PostgreSQL database dump complete
--

