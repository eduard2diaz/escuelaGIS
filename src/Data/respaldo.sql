PGDMP     "    ,                x           leen212 "   10.13 (Ubuntu 10.13-1.pgdg18.04+1)     12.3 (Ubuntu 12.3-1.pgdg18.04+1) �    e           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            f           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            g           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            h           1262    54872    leen212    DATABASE     y   CREATE DATABASE leen212 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_MX.UTF-8' LC_CTYPE = 'es_MX.UTF-8';
    DROP DATABASE leen212;
                postgres    false                        3079    55291    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false            i           0    0    EXTENSION postgis    COMMENT     g   COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
                        false    2            �            1259    55017    ciudad    TABLE     �   CREATE TABLE public.ciudad (
    id integer NOT NULL,
    estado_id integer NOT NULL,
    municipio_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    clave character varying(10) NOT NULL
);
    DROP TABLE public.ciudad;
       public            postgres    false            �            1259    55074    ciudad_id_seq    SEQUENCE     v   CREATE SEQUENCE public.ciudad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.ciudad_id_seq;
       public          postgres    false            �            1259    54923    codigo_postal    TABLE     �  CREATE TABLE public.codigo_postal (
    id integer NOT NULL,
    tipoasentamiento_id integer NOT NULL,
    municipio_id integer NOT NULL,
    estado_id integer NOT NULL,
    ciudad_id integer,
    d_asenta character varying(50) NOT NULL,
    d_cp integer NOT NULL,
    id_asenta_cpcons character varying(5) NOT NULL,
    d_zona character varying(50) NOT NULL,
    c_cp character varying(50) DEFAULT NULL::character varying
);
 !   DROP TABLE public.codigo_postal;
       public            postgres    false            �            1259    55050    codigo_postal_id_seq    SEQUENCE     }   CREATE SEQUENCE public.codigo_postal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.codigo_postal_id_seq;
       public          postgres    false            �            1259    55032    condicion_docente_educativa    TABLE       CREATE TABLE public.condicion_docente_educativa (
    id integer NOT NULL,
    diagnostico_id integer NOT NULL,
    grado_id integer NOT NULL,
    escuela_id integer NOT NULL,
    curp character varying(18) NOT NULL,
    nombre character varying(50) NOT NULL
);
 /   DROP TABLE public.condicion_docente_educativa;
       public            postgres    false            �            1259    55078 "   condicion_docente_educativa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.condicion_docente_educativa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.condicion_docente_educativa_id_seq;
       public          postgres    false            �            1259    54965    condicion_educativa_alumnos    TABLE     �   CREATE TABLE public.condicion_educativa_alumnos (
    id integer NOT NULL,
    diagnostico_id integer NOT NULL,
    grado_id integer NOT NULL,
    escuela_id integer NOT NULL,
    numalumnas integer NOT NULL,
    numalumnos integer NOT NULL
);
 /   DROP TABLE public.condicion_educativa_alumnos;
       public            postgres    false            �            1259    55058 "   condicion_educativa_alumnos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.condicion_educativa_alumnos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.condicion_educativa_alumnos_id_seq;
       public          postgres    false            �            1259    54907    control_gastos    TABLE     J  CREATE TABLE public.control_gastos (
    id integer NOT NULL,
    proyecto_id integer NOT NULL,
    tipo_comprobante_id integer NOT NULL,
    fechacaptura date NOT NULL,
    concepto text NOT NULL,
    numerocomprobante integer NOT NULL,
    monto double precision NOT NULL,
    controlarchivos character varying(255) NOT NULL
);
 "   DROP TABLE public.control_gastos;
       public            postgres    false            �            1259    55046    control_gastos_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.control_gastos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.control_gastos_id_seq;
       public          postgres    false            �            1259    54943    diagnostico_plantel    TABLE     �  CREATE TABLE public.diagnostico_plantel (
    id integer NOT NULL,
    plantel_id integer NOT NULL,
    idcondiciones_aula_id integer NOT NULL,
    idcondicionessanitarios_id integer NOT NULL,
    idcondicionoficina_id integer NOT NULL,
    idcondicionesbliblioteca_id integer NOT NULL,
    idcondicionaulamedios_id integer NOT NULL,
    idcondicionpatio_id integer NOT NULL,
    idcondicioncanchasdeportivas_id integer NOT NULL,
    idcondicionbarda_id integer NOT NULL,
    idcondicionagua_id integer NOT NULL,
    idcondiciondrenaje_id integer NOT NULL,
    idcondicionenergia_id integer NOT NULL,
    idcondiciontelefono_id integer NOT NULL,
    idcondicioninternet_id integer NOT NULL,
    numeroaulas integer NOT NULL,
    numerosanitarios integer NOT NULL,
    numerooficinas integer NOT NULL,
    numerobibliotecas integer NOT NULL,
    numeroaulasmedios integer NOT NULL,
    numeropatio integer NOT NULL,
    numerocanchasdeportivas integer NOT NULL,
    numerobarda integer NOT NULL,
    aguapotable boolean NOT NULL,
    drenaje boolean NOT NULL,
    energiaelectrica boolean NOT NULL,
    telefono boolean NOT NULL,
    internet boolean NOT NULL,
    iddiagnosticoplantel integer NOT NULL,
    diagnosticoarchivo character varying(255) NOT NULL,
    fecha date NOT NULL,
    descrip_num_aulas text,
    descrip_num_sanitarios text,
    descrip_num_oficinas text,
    descrip_num_bibliotecas text,
    descrip_num_aulamedios text,
    descrip_num_patios text,
    descrip_num_canchas_deportivas text,
    descrip_num_bardas text,
    descrip_agua_potables text,
    descrip_drenaje text,
    descrip_energiaelectrica text,
    descrip_telefonia text,
    descrip_internet text
);
 '   DROP TABLE public.diagnostico_plantel;
       public            postgres    false            �            1259    55056    diagnostico_plantel_id_seq    SEQUENCE     �   CREATE SEQUENCE public.diagnostico_plantel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.diagnostico_plantel_id_seq;
       public          postgres    false            �            1259    54894    escuela    TABLE     �   CREATE TABLE public.escuela (
    id integer NOT NULL,
    plantel_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    ccts character varying(10) NOT NULL
);
    DROP TABLE public.escuela;
       public            postgres    false            �            1259    55044    escuela_id_seq    SEQUENCE     w   CREATE SEQUENCE public.escuela_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.escuela_id_seq;
       public          postgres    false            �            1259    54900    escuela_tipo_ensenanza    TABLE     x   CREATE TABLE public.escuela_tipo_ensenanza (
    escuela_id integer NOT NULL,
    tipo_ensenanza_id integer NOT NULL
);
 *   DROP TABLE public.escuela_tipo_ensenanza;
       public            postgres    false            �            1259    54873    plantel    TABLE     0  CREATE TABLE public.plantel (
    id integer NOT NULL,
    d_codigo_id integer,
    tipoasentamiento_id integer,
    municipio_id integer,
    estado_id integer,
    nombre character varying(255) NOT NULL,
    calle character varying(50) DEFAULT NULL::character varying,
    asentamiento character varying(50) DEFAULT NULL::character varying,
    noexterior character varying(10) DEFAULT NULL::character varying,
    coord_geometry character varying(80) DEFAULT NULL::character varying,
    latitud numeric(8,3) NOT NULL,
    longitud numeric(8,3) NOT NULL
);
    DROP TABLE public.plantel;
       public            postgres    false            �            1259    55001    proyecto    TABLE     �   CREATE TABLE public.proyecto (
    id integer NOT NULL,
    plantel_id integer NOT NULL,
    fechainicio date NOT NULL,
    fechafin date,
    montoasignado double precision NOT NULL,
    numero character varying(10) NOT NULL
);
    DROP TABLE public.proyecto;
       public            postgres    false            �            1259    56798    escuelas_con_proyecto_view    VIEW       CREATE VIEW public.escuelas_con_proyecto_view AS
 SELECT e.id,
    e.nombre,
    e.ccts,
    p.nombre AS plantel
   FROM ((public.escuela e
     JOIN public.plantel p ON ((p.id = e.plantel_id)))
     JOIN public.proyecto ON ((proyecto.plantel_id = p.id)));
 -   DROP VIEW public.escuelas_con_proyecto_view;
       public          postgres    false    199    199    199    199    213    197    197            �            1259    54938    estado    TABLE     �   CREATE TABLE public.estado (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    clave character varying(10) NOT NULL
);
    DROP TABLE public.estado;
       public            postgres    false            �            1259    55054    estado_id_seq    SEQUENCE     v   CREATE SEQUENCE public.estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.estado_id_seq;
       public          postgres    false            �            1259    54933    estatus    TABLE     �   CREATE TABLE public.estatus (
    id integer NOT NULL,
    estatus character varying(250) NOT NULL,
    code integer NOT NULL
);
    DROP TABLE public.estatus;
       public            postgres    false            �            1259    55052    estatus_id_seq    SEQUENCE     w   CREATE SEQUENCE public.estatus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.estatus_id_seq;
       public          postgres    false            �            1259    54995    grado_ensenanza    TABLE     �   CREATE TABLE public.grado_ensenanza (
    id integer NOT NULL,
    tipoensenanza_id integer NOT NULL,
    nombre character varying(30) NOT NULL
);
 #   DROP TABLE public.grado_ensenanza;
       public            postgres    false            �            1259    55068    grado_ensenanza_id_seq    SEQUENCE        CREATE SEQUENCE public.grado_ensenanza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.grado_ensenanza_id_seq;
       public          postgres    false            �            1259    54917 	   municipio    TABLE     �   CREATE TABLE public.municipio (
    id integer NOT NULL,
    estado_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    clave character varying(255) NOT NULL
);
    DROP TABLE public.municipio;
       public            postgres    false            �            1259    55048    municipio_id_seq    SEQUENCE     y   CREATE SEQUENCE public.municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.municipio_id_seq;
       public          postgres    false            �            1259    55007    plan_trabajo    TABLE     �  CREATE TABLE public.plan_trabajo (
    id integer NOT NULL,
    proyecto_id integer NOT NULL,
    tipo_accion_id integer NOT NULL,
    fechacaptura date NOT NULL,
    descripcionaccion text NOT NULL,
    tiempoestimado character varying(50) NOT NULL,
    costoestimado double precision NOT NULL,
    totalrecursosasignados double precision NOT NULL,
    planarchivo character varying(255) NOT NULL
);
     DROP TABLE public.plan_trabajo;
       public            postgres    false            �            1259    55072    plan_trabajo_id_seq    SEQUENCE     |   CREATE SEQUENCE public.plan_trabajo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.plan_trabajo_id_seq;
       public          postgres    false            �            1259    55040    plantel_id_seq    SEQUENCE     w   CREATE SEQUENCE public.plantel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.plantel_id_seq;
       public          postgres    false            �            1259    56803    planteles_con_proyecto_view    VIEW     �   CREATE VIEW public.planteles_con_proyecto_view AS
 SELECT p.id,
    p.nombre
   FROM (public.plantel p
     JOIN public.proyecto ON ((proyecto.plantel_id = p.id)));
 .   DROP VIEW public.planteles_con_proyecto_view;
       public          postgres    false    213    197    197            �            1259    56807    planteles_sin_aguapotable_view    VIEW     �  CREATE VIEW public.planteles_sin_aguapotable_view AS
 SELECT p.id,
    p.nombre
   FROM (public.diagnostico_plantel d
     JOIN public.plantel p ON ((p.id = d.plantel_id)))
  WHERE ((d.fecha >= ALL ( SELECT d2.fecha
           FROM (public.diagnostico_plantel d2
             JOIN public.plantel p2 ON ((p2.id = d2.plantel_id)))
          WHERE (p2.id = p.id))) AND (d.aguapotable = false));
 1   DROP VIEW public.planteles_sin_aguapotable_view;
       public          postgres    false    206    206    206    197    197                        1259    56812    planteles_sin_bibliotecas_view    VIEW     �  CREATE VIEW public.planteles_sin_bibliotecas_view AS
 SELECT p.id,
    p.nombre
   FROM (public.diagnostico_plantel d
     JOIN public.plantel p ON ((p.id = d.plantel_id)))
  WHERE ((d.fecha >= ALL ( SELECT d2.fecha
           FROM (public.diagnostico_plantel d2
             JOIN public.plantel p2 ON ((p2.id = d2.plantel_id)))
          WHERE (p2.id = p.id))) AND (d.numerobibliotecas = 0));
 1   DROP VIEW public.planteles_sin_bibliotecas_view;
       public          postgres    false    206    197    197    206    206                       1259    56817    planteles_sin_drenaje_view    VIEW     �  CREATE VIEW public.planteles_sin_drenaje_view AS
 SELECT p.id,
    p.nombre
   FROM (public.diagnostico_plantel d
     JOIN public.plantel p ON ((p.id = d.plantel_id)))
  WHERE ((d.fecha >= ALL ( SELECT d2.fecha
           FROM (public.diagnostico_plantel d2
             JOIN public.plantel p2 ON ((p2.id = d2.plantel_id)))
          WHERE (p2.id = p.id))) AND (d.drenaje = false));
 -   DROP VIEW public.planteles_sin_drenaje_view;
       public          postgres    false    197    206    206    206    197                       1259    56822    planteles_sin_electricidad_view    VIEW     �  CREATE VIEW public.planteles_sin_electricidad_view AS
 SELECT p.id,
    p.nombre
   FROM (public.diagnostico_plantel d
     JOIN public.plantel p ON ((p.id = d.plantel_id)))
  WHERE ((d.fecha >= ALL ( SELECT d2.fecha
           FROM (public.diagnostico_plantel d2
             JOIN public.plantel p2 ON ((p2.id = d2.plantel_id)))
          WHERE (p2.id = p.id))) AND (d.energiaelectrica = false));
 2   DROP VIEW public.planteles_sin_electricidad_view;
       public          postgres    false    206    197    197    206    206                       1259    56827    planteles_sin_internet_view    VIEW     �  CREATE VIEW public.planteles_sin_internet_view AS
 SELECT p.id,
    p.nombre
   FROM (public.diagnostico_plantel d
     JOIN public.plantel p ON ((p.id = d.plantel_id)))
  WHERE ((d.fecha >= ALL ( SELECT d2.fecha
           FROM (public.diagnostico_plantel d2
             JOIN public.plantel p2 ON ((p2.id = d2.plantel_id)))
          WHERE (p2.id = p.id))) AND (d.internet = false));
 .   DROP VIEW public.planteles_sin_internet_view;
       public          postgres    false    206    197    197    206    206                       1259    56832    planteles_sin_sanitarios_view    VIEW     �  CREATE VIEW public.planteles_sin_sanitarios_view AS
 SELECT p.id,
    p.nombre
   FROM (public.diagnostico_plantel d
     JOIN public.plantel p ON ((p.id = d.plantel_id)))
  WHERE ((d.fecha >= ALL ( SELECT d2.fecha
           FROM (public.diagnostico_plantel d2
             JOIN public.plantel p2 ON ((p2.id = d2.plantel_id)))
          WHERE (p2.id = p.id))) AND (d.numerosanitarios = 0));
 0   DROP VIEW public.planteles_sin_sanitarios_view;
       public          postgres    false    206    206    206    197    197            �            1259    55070    proyecto_id_seq    SEQUENCE     x   CREATE SEQUENCE public.proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.proyecto_id_seq;
       public          postgres    false            �            1259    54983    rendicion_cuentas    TABLE       CREATE TABLE public.rendicion_cuentas (
    id integer NOT NULL,
    proyecto_id integer NOT NULL,
    tipo_accion_id integer NOT NULL,
    fechacaptura date NOT NULL,
    monto double precision NOT NULL,
    rendicionesarchivos character varying(255) NOT NULL
);
 %   DROP TABLE public.rendicion_cuentas;
       public            postgres    false            �            1259    55064    rendicion_cuentas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rendicion_cuentas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.rendicion_cuentas_id_seq;
       public          postgres    false            �            1259    55024    tipo_accion    TABLE     �   CREATE TABLE public.tipo_accion (
    id integer NOT NULL,
    accion character varying(200) NOT NULL,
    descripcion text NOT NULL,
    fechacaptura date NOT NULL
);
    DROP TABLE public.tipo_accion;
       public            postgres    false            �            1259    55076    tipo_accion_id_seq    SEQUENCE     {   CREATE SEQUENCE public.tipo_accion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tipo_accion_id_seq;
       public          postgres    false            �            1259    54978    tipo_asentamiento    TABLE     �   CREATE TABLE public.tipo_asentamiento (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    clave integer NOT NULL
);
 %   DROP TABLE public.tipo_asentamiento;
       public            postgres    false            �            1259    55062    tipo_asentamiento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_asentamiento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.tipo_asentamiento_id_seq;
       public          postgres    false            �            1259    54886    tipo_comprobante    TABLE     �   CREATE TABLE public.tipo_comprobante (
    id integer NOT NULL,
    comprobante character varying(50) NOT NULL,
    descripcion text NOT NULL,
    fechacaptura date NOT NULL
);
 $   DROP TABLE public.tipo_comprobante;
       public            postgres    false            �            1259    55042    tipo_comprobante_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_comprobante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tipo_comprobante_id_seq;
       public          postgres    false            �            1259    54990    tipo_condicion    TABLE     n   CREATE TABLE public.tipo_condicion (
    id integer NOT NULL,
    condicion character varying(50) NOT NULL
);
 "   DROP TABLE public.tipo_condicion;
       public            postgres    false            �            1259    55066    tipo_condicion_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.tipo_condicion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tipo_condicion_id_seq;
       public          postgres    false            �            1259    54973    tipo_ensenanza    TABLE     k   CREATE TABLE public.tipo_ensenanza (
    id integer NOT NULL,
    nombre character varying(40) NOT NULL
);
 "   DROP TABLE public.tipo_ensenanza;
       public            postgres    false            �            1259    55060    tipo_ensenanza_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.tipo_ensenanza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tipo_ensenanza_id_seq;
       public          postgres    false                       1259    56837    total_escuelas_view    VIEW     a   CREATE VIEW public.total_escuelas_view AS
 SELECT count(e.id) AS count
   FROM public.escuela e;
 &   DROP VIEW public.total_escuelas_view;
       public          postgres    false    199                       1259    56841    total_planteles_view    VIEW     b   CREATE VIEW public.total_planteles_view AS
 SELECT count(e.id) AS count
   FROM public.plantel e;
 '   DROP VIEW public.total_planteles_view;
       public          postgres    false    197            L          0    55017    ciudad 
   TABLE DATA           L   COPY public.ciudad (id, estado_id, municipio_id, nombre, clave) FROM stdin;
    public          postgres    false    215   �      @          0    54923    codigo_postal 
   TABLE DATA           �   COPY public.codigo_postal (id, tipoasentamiento_id, municipio_id, estado_id, ciudad_id, d_asenta, d_cp, id_asenta_cpcons, d_zona, c_cp) FROM stdin;
    public          postgres    false    203   �      N          0    55032    condicion_docente_educativa 
   TABLE DATA           m   COPY public.condicion_docente_educativa (id, diagnostico_id, grado_id, escuela_id, curp, nombre) FROM stdin;
    public          postgres    false    217   �      D          0    54965    condicion_educativa_alumnos 
   TABLE DATA           w   COPY public.condicion_educativa_alumnos (id, diagnostico_id, grado_id, escuela_id, numalumnas, numalumnos) FROM stdin;
    public          postgres    false    207         >          0    54907    control_gastos 
   TABLE DATA           �   COPY public.control_gastos (id, proyecto_id, tipo_comprobante_id, fechacaptura, concepto, numerocomprobante, monto, controlarchivos) FROM stdin;
    public          postgres    false    201   !      C          0    54943    diagnostico_plantel 
   TABLE DATA           �  COPY public.diagnostico_plantel (id, plantel_id, idcondiciones_aula_id, idcondicionessanitarios_id, idcondicionoficina_id, idcondicionesbliblioteca_id, idcondicionaulamedios_id, idcondicionpatio_id, idcondicioncanchasdeportivas_id, idcondicionbarda_id, idcondicionagua_id, idcondiciondrenaje_id, idcondicionenergia_id, idcondiciontelefono_id, idcondicioninternet_id, numeroaulas, numerosanitarios, numerooficinas, numerobibliotecas, numeroaulasmedios, numeropatio, numerocanchasdeportivas, numerobarda, aguapotable, drenaje, energiaelectrica, telefono, internet, iddiagnosticoplantel, diagnosticoarchivo, fecha, descrip_num_aulas, descrip_num_sanitarios, descrip_num_oficinas, descrip_num_bibliotecas, descrip_num_aulamedios, descrip_num_patios, descrip_num_canchas_deportivas, descrip_num_bardas, descrip_agua_potables, descrip_drenaje, descrip_energiaelectrica, descrip_telefonia, descrip_internet) FROM stdin;
    public          postgres    false    206   >      <          0    54894    escuela 
   TABLE DATA           ?   COPY public.escuela (id, plantel_id, nombre, ccts) FROM stdin;
    public          postgres    false    199   [      =          0    54900    escuela_tipo_ensenanza 
   TABLE DATA           O   COPY public.escuela_tipo_ensenanza (escuela_id, tipo_ensenanza_id) FROM stdin;
    public          postgres    false    200   }      B          0    54938    estado 
   TABLE DATA           3   COPY public.estado (id, nombre, clave) FROM stdin;
    public          postgres    false    205   �      A          0    54933    estatus 
   TABLE DATA           4   COPY public.estatus (id, estatus, code) FROM stdin;
    public          postgres    false    204   �      I          0    54995    grado_ensenanza 
   TABLE DATA           G   COPY public.grado_ensenanza (id, tipoensenanza_id, nombre) FROM stdin;
    public          postgres    false    212         ?          0    54917 	   municipio 
   TABLE DATA           A   COPY public.municipio (id, estado_id, nombre, clave) FROM stdin;
    public          postgres    false    202   Y      K          0    55007    plan_trabajo 
   TABLE DATA           �   COPY public.plan_trabajo (id, proyecto_id, tipo_accion_id, fechacaptura, descripcionaccion, tiempoestimado, costoestimado, totalrecursosasignados, planarchivo) FROM stdin;
    public          postgres    false    214   {      :          0    54873    plantel 
   TABLE DATA           �   COPY public.plantel (id, d_codigo_id, tipoasentamiento_id, municipio_id, estado_id, nombre, calle, asentamiento, noexterior, coord_geometry, latitud, longitud) FROM stdin;
    public          postgres    false    197   �      J          0    55001    proyecto 
   TABLE DATA           `   COPY public.proyecto (id, plantel_id, fechainicio, fechafin, montoasignado, numero) FROM stdin;
    public          postgres    false    213   B      G          0    54983    rendicion_cuentas 
   TABLE DATA           v   COPY public.rendicion_cuentas (id, proyecto_id, tipo_accion_id, fechacaptura, monto, rendicionesarchivos) FROM stdin;
    public          postgres    false    210   _      )          0    55591    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    239   |      M          0    55024    tipo_accion 
   TABLE DATA           L   COPY public.tipo_accion (id, accion, descripcion, fechacaptura) FROM stdin;
    public          postgres    false    216   �      F          0    54978    tipo_asentamiento 
   TABLE DATA           >   COPY public.tipo_asentamiento (id, nombre, clave) FROM stdin;
    public          postgres    false    209         ;          0    54886    tipo_comprobante 
   TABLE DATA           V   COPY public.tipo_comprobante (id, comprobante, descripcion, fechacaptura) FROM stdin;
    public          postgres    false    198   A      H          0    54990    tipo_condicion 
   TABLE DATA           7   COPY public.tipo_condicion (id, condicion) FROM stdin;
    public          postgres    false    211         E          0    54973    tipo_ensenanza 
   TABLE DATA           4   COPY public.tipo_ensenanza (id, nombre) FROM stdin;
    public          postgres    false    208   O      j           0    0    ciudad_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.ciudad_id_seq', 1, true);
          public          postgres    false    235            k           0    0    codigo_postal_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.codigo_postal_id_seq', 1, true);
          public          postgres    false    223            l           0    0 "   condicion_docente_educativa_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.condicion_docente_educativa_id_seq', 1, false);
          public          postgres    false    237            m           0    0 "   condicion_educativa_alumnos_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.condicion_educativa_alumnos_id_seq', 1, false);
          public          postgres    false    227            n           0    0    control_gastos_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.control_gastos_id_seq', 1, false);
          public          postgres    false    221            o           0    0    diagnostico_plantel_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.diagnostico_plantel_id_seq', 1, false);
          public          postgres    false    226            p           0    0    escuela_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.escuela_id_seq', 1, true);
          public          postgres    false    220            q           0    0    estado_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.estado_id_seq', 1, true);
          public          postgres    false    225            r           0    0    estatus_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.estatus_id_seq', 3, true);
          public          postgres    false    224            s           0    0    grado_ensenanza_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.grado_ensenanza_id_seq', 10, true);
          public          postgres    false    232            t           0    0    municipio_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.municipio_id_seq', 1, true);
          public          postgres    false    222            u           0    0    plan_trabajo_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.plan_trabajo_id_seq', 1, false);
          public          postgres    false    234            v           0    0    plantel_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.plantel_id_seq', 3, true);
          public          postgres    false    218            w           0    0    proyecto_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.proyecto_id_seq', 1, false);
          public          postgres    false    233            x           0    0    rendicion_cuentas_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.rendicion_cuentas_id_seq', 1, false);
          public          postgres    false    230            y           0    0    tipo_accion_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.tipo_accion_id_seq', 3, true);
          public          postgres    false    236            z           0    0    tipo_asentamiento_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tipo_asentamiento_id_seq', 1, true);
          public          postgres    false    229            {           0    0    tipo_comprobante_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tipo_comprobante_id_seq', 3, true);
          public          postgres    false    219            |           0    0    tipo_condicion_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tipo_condicion_id_seq', 3, true);
          public          postgres    false    231            }           0    0    tipo_ensenanza_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tipo_ensenanza_id_seq', 3, true);
          public          postgres    false    228            z           2606    55021    ciudad ciudad_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT ciudad_pkey;
       public            postgres    false    215            G           2606    54928     codigo_postal codigo_postal_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.codigo_postal
    ADD CONSTRAINT codigo_postal_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.codigo_postal DROP CONSTRAINT codigo_postal_pkey;
       public            postgres    false    203            �           2606    55036 <   condicion_docente_educativa condicion_docente_educativa_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.condicion_docente_educativa
    ADD CONSTRAINT condicion_docente_educativa_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.condicion_docente_educativa DROP CONSTRAINT condicion_docente_educativa_pkey;
       public            postgres    false    217            a           2606    54969 <   condicion_educativa_alumnos condicion_educativa_alumnos_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.condicion_educativa_alumnos
    ADD CONSTRAINT condicion_educativa_alumnos_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.condicion_educativa_alumnos DROP CONSTRAINT condicion_educativa_alumnos_pkey;
       public            postgres    false    207            @           2606    54914 "   control_gastos control_gastos_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.control_gastos
    ADD CONSTRAINT control_gastos_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.control_gastos DROP CONSTRAINT control_gastos_pkey;
       public            postgres    false    201            Q           2606    54950 ,   diagnostico_plantel diagnostico_plantel_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT diagnostico_plantel_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT diagnostico_plantel_pkey;
       public            postgres    false    206            9           2606    54898    escuela escuela_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.escuela
    ADD CONSTRAINT escuela_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.escuela DROP CONSTRAINT escuela_pkey;
       public            postgres    false    199            <           2606    54904 2   escuela_tipo_ensenanza escuela_tipo_ensenanza_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.escuela_tipo_ensenanza
    ADD CONSTRAINT escuela_tipo_ensenanza_pkey PRIMARY KEY (escuela_id, tipo_ensenanza_id);
 \   ALTER TABLE ONLY public.escuela_tipo_ensenanza DROP CONSTRAINT escuela_tipo_ensenanza_pkey;
       public            postgres    false    200    200            O           2606    54942    estado estado_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.estado DROP CONSTRAINT estado_pkey;
       public            postgres    false    205            M           2606    54937    estatus estatus_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.estatus
    ADD CONSTRAINT estatus_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.estatus DROP CONSTRAINT estatus_pkey;
       public            postgres    false    204            p           2606    54999 $   grado_ensenanza grado_ensenanza_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.grado_ensenanza
    ADD CONSTRAINT grado_ensenanza_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.grado_ensenanza DROP CONSTRAINT grado_ensenanza_pkey;
       public            postgres    false    212            E           2606    54921    municipio municipio_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.municipio DROP CONSTRAINT municipio_pkey;
       public            postgres    false    202            x           2606    55014    plan_trabajo plan_trabajo_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.plan_trabajo
    ADD CONSTRAINT plan_trabajo_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.plan_trabajo DROP CONSTRAINT plan_trabajo_pkey;
       public            postgres    false    214            5           2606    54881    plantel plantel_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.plantel
    ADD CONSTRAINT plantel_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.plantel DROP CONSTRAINT plantel_pkey;
       public            postgres    false    197            t           2606    55005    proyecto proyecto_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.proyecto
    ADD CONSTRAINT proyecto_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.proyecto DROP CONSTRAINT proyecto_pkey;
       public            postgres    false    213            l           2606    54987 (   rendicion_cuentas rendicion_cuentas_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.rendicion_cuentas
    ADD CONSTRAINT rendicion_cuentas_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.rendicion_cuentas DROP CONSTRAINT rendicion_cuentas_pkey;
       public            postgres    false    210            ~           2606    55031    tipo_accion tipo_accion_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tipo_accion
    ADD CONSTRAINT tipo_accion_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tipo_accion DROP CONSTRAINT tipo_accion_pkey;
       public            postgres    false    216            h           2606    54982 (   tipo_asentamiento tipo_asentamiento_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tipo_asentamiento
    ADD CONSTRAINT tipo_asentamiento_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.tipo_asentamiento DROP CONSTRAINT tipo_asentamiento_pkey;
       public            postgres    false    209            7           2606    54893 &   tipo_comprobante tipo_comprobante_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.tipo_comprobante
    ADD CONSTRAINT tipo_comprobante_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.tipo_comprobante DROP CONSTRAINT tipo_comprobante_pkey;
       public            postgres    false    198            n           2606    54994 "   tipo_condicion tipo_condicion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tipo_condicion
    ADD CONSTRAINT tipo_condicion_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.tipo_condicion DROP CONSTRAINT tipo_condicion_pkey;
       public            postgres    false    211            f           2606    54977 "   tipo_ensenanza tipo_ensenanza_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tipo_ensenanza
    ADD CONSTRAINT tipo_ensenanza_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.tipo_ensenanza DROP CONSTRAINT tipo_ensenanza_pkey;
       public            postgres    false    208            A           1259    54916    idx_141b8c4ca9b5e49a    INDEX     ^   CREATE INDEX idx_141b8c4ca9b5e49a ON public.control_gastos USING btree (tipo_comprobante_id);
 (   DROP INDEX public.idx_141b8c4ca9b5e49a;
       public            postgres    false    201            B           1259    54915    idx_141b8c4cf625d1ba    INDEX     V   CREATE INDEX idx_141b8c4cf625d1ba ON public.control_gastos USING btree (proyecto_id);
 (   DROP INDEX public.idx_141b8c4cf625d1ba;
       public            postgres    false    201            =           1259    54906    idx_17fbbcc02f92be1    INDEX     c   CREATE INDEX idx_17fbbcc02f92be1 ON public.escuela_tipo_ensenanza USING btree (tipo_ensenanza_id);
 '   DROP INDEX public.idx_17fbbcc02f92be1;
       public            postgres    false    200            >           1259    54905    idx_17fbbcc0e33f8867    INDEX     ]   CREATE INDEX idx_17fbbcc0e33f8867 ON public.escuela_tipo_ensenanza USING btree (escuela_id);
 (   DROP INDEX public.idx_17fbbcc0e33f8867;
       public            postgres    false    200            �           1259    55037    idx_1cea54b77a94ba1a    INDEX     f   CREATE INDEX idx_1cea54b77a94ba1a ON public.condicion_docente_educativa USING btree (diagnostico_id);
 (   DROP INDEX public.idx_1cea54b77a94ba1a;
       public            postgres    false    217            �           1259    55038    idx_1cea54b791a441cc    INDEX     `   CREATE INDEX idx_1cea54b791a441cc ON public.condicion_docente_educativa USING btree (grado_id);
 (   DROP INDEX public.idx_1cea54b791a441cc;
       public            postgres    false    217            �           1259    55039    idx_1cea54b7e33f8867    INDEX     b   CREATE INDEX idx_1cea54b7e33f8867 ON public.condicion_docente_educativa USING btree (escuela_id);
 (   DROP INDEX public.idx_1cea54b7e33f8867;
       public            postgres    false    217            q           1259    55000    idx_2877888eda33e9e7    INDEX     \   CREATE INDEX idx_2877888eda33e9e7 ON public.grado_ensenanza USING btree (tipoensenanza_id);
 (   DROP INDEX public.idx_2877888eda33e9e7;
       public            postgres    false    212            u           1259    55016    idx_4369f002dd25ed3b    INDEX     W   CREATE INDEX idx_4369f002dd25ed3b ON public.plan_trabajo USING btree (tipo_accion_id);
 (   DROP INDEX public.idx_4369f002dd25ed3b;
       public            postgres    false    214            v           1259    55015    idx_4369f002f625d1ba    INDEX     T   CREATE INDEX idx_4369f002f625d1ba ON public.plan_trabajo USING btree (proyecto_id);
 (   DROP INDEX public.idx_4369f002f625d1ba;
       public            postgres    false    214            i           1259    54989    idx_48b38885dd25ed3b    INDEX     \   CREATE INDEX idx_48b38885dd25ed3b ON public.rendicion_cuentas USING btree (tipo_accion_id);
 (   DROP INDEX public.idx_48b38885dd25ed3b;
       public            postgres    false    210            j           1259    54988    idx_48b38885f625d1ba    INDEX     Y   CREATE INDEX idx_48b38885f625d1ba ON public.rendicion_cuentas USING btree (proyecto_id);
 (   DROP INDEX public.idx_48b38885f625d1ba;
       public            postgres    false    210            r           1259    55006    idx_6fd202b941cdebb0    INDEX     O   CREATE INDEX idx_6fd202b941cdebb0 ON public.proyecto USING btree (plantel_id);
 (   DROP INDEX public.idx_6fd202b941cdebb0;
       public            postgres    false    213            0           1259    54882    idx_7eef6ca42ee5e0ab    INDEX     O   CREATE INDEX idx_7eef6ca42ee5e0ab ON public.plantel USING btree (d_codigo_id);
 (   DROP INDEX public.idx_7eef6ca42ee5e0ab;
       public            postgres    false    197            1           1259    54883    idx_7eef6ca4373c6c4a    INDEX     W   CREATE INDEX idx_7eef6ca4373c6c4a ON public.plantel USING btree (tipoasentamiento_id);
 (   DROP INDEX public.idx_7eef6ca4373c6c4a;
       public            postgres    false    197            2           1259    54884    idx_7eef6ca458bc1be0    INDEX     P   CREATE INDEX idx_7eef6ca458bc1be0 ON public.plantel USING btree (municipio_id);
 (   DROP INDEX public.idx_7eef6ca458bc1be0;
       public            postgres    false    197            3           1259    54885    idx_7eef6ca49f5a440b    INDEX     M   CREATE INDEX idx_7eef6ca49f5a440b ON public.plantel USING btree (estado_id);
 (   DROP INDEX public.idx_7eef6ca49f5a440b;
       public            postgres    false    197            {           1259    55023    idx_8e86059e58bc1be0    INDEX     O   CREATE INDEX idx_8e86059e58bc1be0 ON public.ciudad USING btree (municipio_id);
 (   DROP INDEX public.idx_8e86059e58bc1be0;
       public            postgres    false    215            |           1259    55022    idx_8e86059e9f5a440b    INDEX     L   CREATE INDEX idx_8e86059e9f5a440b ON public.ciudad USING btree (estado_id);
 (   DROP INDEX public.idx_8e86059e9f5a440b;
       public            postgres    false    215            H           1259    54929    idx_cdf05b79373c6c4a    INDEX     ]   CREATE INDEX idx_cdf05b79373c6c4a ON public.codigo_postal USING btree (tipoasentamiento_id);
 (   DROP INDEX public.idx_cdf05b79373c6c4a;
       public            postgres    false    203            I           1259    54930    idx_cdf05b7958bc1be0    INDEX     V   CREATE INDEX idx_cdf05b7958bc1be0 ON public.codigo_postal USING btree (municipio_id);
 (   DROP INDEX public.idx_cdf05b7958bc1be0;
       public            postgres    false    203            J           1259    54931    idx_cdf05b799f5a440b    INDEX     S   CREATE INDEX idx_cdf05b799f5a440b ON public.codigo_postal USING btree (estado_id);
 (   DROP INDEX public.idx_cdf05b799f5a440b;
       public            postgres    false    203            K           1259    54932    idx_cdf05b79e8608214    INDEX     S   CREATE INDEX idx_cdf05b79e8608214 ON public.codigo_postal USING btree (ciudad_id);
 (   DROP INDEX public.idx_cdf05b79e8608214;
       public            postgres    false    203            R           1259    54957    idx_dfbfa0301877de2e    INDEX     c   CREATE INDEX idx_dfbfa0301877de2e ON public.diagnostico_plantel USING btree (idcondicionpatio_id);
 (   DROP INDEX public.idx_dfbfa0301877de2e;
       public            postgres    false    206            S           1259    54961    idx_dfbfa0302ac83a8a    INDEX     e   CREATE INDEX idx_dfbfa0302ac83a8a ON public.diagnostico_plantel USING btree (idcondiciondrenaje_id);
 (   DROP INDEX public.idx_dfbfa0302ac83a8a;
       public            postgres    false    206            T           1259    54962    idx_dfbfa030311b18f1    INDEX     e   CREATE INDEX idx_dfbfa030311b18f1 ON public.diagnostico_plantel USING btree (idcondicionenergia_id);
 (   DROP INDEX public.idx_dfbfa030311b18f1;
       public            postgres    false    206            U           1259    54951    idx_dfbfa03041cdebb0    INDEX     Z   CREATE INDEX idx_dfbfa03041cdebb0 ON public.diagnostico_plantel USING btree (plantel_id);
 (   DROP INDEX public.idx_dfbfa03041cdebb0;
       public            postgres    false    206            V           1259    54955    idx_dfbfa0305128e947    INDEX     k   CREATE INDEX idx_dfbfa0305128e947 ON public.diagnostico_plantel USING btree (idcondicionesbliblioteca_id);
 (   DROP INDEX public.idx_dfbfa0305128e947;
       public            postgres    false    206            W           1259    54953    idx_dfbfa030612be04d    INDEX     j   CREATE INDEX idx_dfbfa030612be04d ON public.diagnostico_plantel USING btree (idcondicionessanitarios_id);
 (   DROP INDEX public.idx_dfbfa030612be04d;
       public            postgres    false    206            X           1259    54954    idx_dfbfa03083cd1575    INDEX     e   CREATE INDEX idx_dfbfa03083cd1575 ON public.diagnostico_plantel USING btree (idcondicionoficina_id);
 (   DROP INDEX public.idx_dfbfa03083cd1575;
       public            postgres    false    206            Y           1259    54963    idx_dfbfa030880e9d7d    INDEX     f   CREATE INDEX idx_dfbfa030880e9d7d ON public.diagnostico_plantel USING btree (idcondiciontelefono_id);
 (   DROP INDEX public.idx_dfbfa030880e9d7d;
       public            postgres    false    206            Z           1259    54952    idx_dfbfa030a85158d1    INDEX     e   CREATE INDEX idx_dfbfa030a85158d1 ON public.diagnostico_plantel USING btree (idcondiciones_aula_id);
 (   DROP INDEX public.idx_dfbfa030a85158d1;
       public            postgres    false    206            [           1259    54964    idx_dfbfa030aa9185d8    INDEX     f   CREATE INDEX idx_dfbfa030aa9185d8 ON public.diagnostico_plantel USING btree (idcondicioninternet_id);
 (   DROP INDEX public.idx_dfbfa030aa9185d8;
       public            postgres    false    206            \           1259    54956    idx_dfbfa030d0ca6419    INDEX     h   CREATE INDEX idx_dfbfa030d0ca6419 ON public.diagnostico_plantel USING btree (idcondicionaulamedios_id);
 (   DROP INDEX public.idx_dfbfa030d0ca6419;
       public            postgres    false    206            ]           1259    54958    idx_dfbfa030e241bcd3    INDEX     o   CREATE INDEX idx_dfbfa030e241bcd3 ON public.diagnostico_plantel USING btree (idcondicioncanchasdeportivas_id);
 (   DROP INDEX public.idx_dfbfa030e241bcd3;
       public            postgres    false    206            ^           1259    54959    idx_dfbfa030e8ffb8e7    INDEX     c   CREATE INDEX idx_dfbfa030e8ffb8e7 ON public.diagnostico_plantel USING btree (idcondicionbarda_id);
 (   DROP INDEX public.idx_dfbfa030e8ffb8e7;
       public            postgres    false    206            _           1259    54960    idx_dfbfa030f31154f5    INDEX     b   CREATE INDEX idx_dfbfa030f31154f5 ON public.diagnostico_plantel USING btree (idcondicionagua_id);
 (   DROP INDEX public.idx_dfbfa030f31154f5;
       public            postgres    false    206            b           1259    54970    idx_f3e428077a94ba1a    INDEX     f   CREATE INDEX idx_f3e428077a94ba1a ON public.condicion_educativa_alumnos USING btree (diagnostico_id);
 (   DROP INDEX public.idx_f3e428077a94ba1a;
       public            postgres    false    207            c           1259    54971    idx_f3e4280791a441cc    INDEX     `   CREATE INDEX idx_f3e4280791a441cc ON public.condicion_educativa_alumnos USING btree (grado_id);
 (   DROP INDEX public.idx_f3e4280791a441cc;
       public            postgres    false    207            d           1259    54972    idx_f3e42807e33f8867    INDEX     b   CREATE INDEX idx_f3e42807e33f8867 ON public.condicion_educativa_alumnos USING btree (escuela_id);
 (   DROP INDEX public.idx_f3e42807e33f8867;
       public            postgres    false    207            :           1259    54899    idx_f6c6e2ce41cdebb0    INDEX     N   CREATE INDEX idx_f6c6e2ce41cdebb0 ON public.escuela USING btree (plantel_id);
 (   DROP INDEX public.idx_f6c6e2ce41cdebb0;
       public            postgres    false    199            C           1259    54922    idx_fe98f5e09f5a440b    INDEX     O   CREATE INDEX idx_fe98f5e09f5a440b ON public.municipio USING btree (estado_id);
 (   DROP INDEX public.idx_fe98f5e09f5a440b;
       public            postgres    false    202            �           2606    55120 "   control_gastos fk_141b8c4ca9b5e49a    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_gastos
    ADD CONSTRAINT fk_141b8c4ca9b5e49a FOREIGN KEY (tipo_comprobante_id) REFERENCES public.tipo_comprobante(id);
 L   ALTER TABLE ONLY public.control_gastos DROP CONSTRAINT fk_141b8c4ca9b5e49a;
       public          postgres    false    201    4407    198            �           2606    55115 "   control_gastos fk_141b8c4cf625d1ba    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_gastos
    ADD CONSTRAINT fk_141b8c4cf625d1ba FOREIGN KEY (proyecto_id) REFERENCES public.proyecto(id);
 L   ALTER TABLE ONLY public.control_gastos DROP CONSTRAINT fk_141b8c4cf625d1ba;
       public          postgres    false    201    4468    213            �           2606    55110 )   escuela_tipo_ensenanza fk_17fbbcc02f92be1    FK CONSTRAINT     �   ALTER TABLE ONLY public.escuela_tipo_ensenanza
    ADD CONSTRAINT fk_17fbbcc02f92be1 FOREIGN KEY (tipo_ensenanza_id) REFERENCES public.tipo_ensenanza(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.escuela_tipo_ensenanza DROP CONSTRAINT fk_17fbbcc02f92be1;
       public          postgres    false    208    4454    200            �           2606    55105 *   escuela_tipo_ensenanza fk_17fbbcc0e33f8867    FK CONSTRAINT     �   ALTER TABLE ONLY public.escuela_tipo_ensenanza
    ADD CONSTRAINT fk_17fbbcc0e33f8867 FOREIGN KEY (escuela_id) REFERENCES public.escuela(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.escuela_tipo_ensenanza DROP CONSTRAINT fk_17fbbcc0e33f8867;
       public          postgres    false    4409    199    200            �           2606    55275 /   condicion_docente_educativa fk_1cea54b77a94ba1a    FK CONSTRAINT     �   ALTER TABLE ONLY public.condicion_docente_educativa
    ADD CONSTRAINT fk_1cea54b77a94ba1a FOREIGN KEY (diagnostico_id) REFERENCES public.diagnostico_plantel(id);
 Y   ALTER TABLE ONLY public.condicion_docente_educativa DROP CONSTRAINT fk_1cea54b77a94ba1a;
       public          postgres    false    4433    206    217            �           2606    55280 /   condicion_docente_educativa fk_1cea54b791a441cc    FK CONSTRAINT     �   ALTER TABLE ONLY public.condicion_docente_educativa
    ADD CONSTRAINT fk_1cea54b791a441cc FOREIGN KEY (grado_id) REFERENCES public.grado_ensenanza(id);
 Y   ALTER TABLE ONLY public.condicion_docente_educativa DROP CONSTRAINT fk_1cea54b791a441cc;
       public          postgres    false    212    4464    217            �           2606    55285 /   condicion_docente_educativa fk_1cea54b7e33f8867    FK CONSTRAINT     �   ALTER TABLE ONLY public.condicion_docente_educativa
    ADD CONSTRAINT fk_1cea54b7e33f8867 FOREIGN KEY (escuela_id) REFERENCES public.escuela(id);
 Y   ALTER TABLE ONLY public.condicion_docente_educativa DROP CONSTRAINT fk_1cea54b7e33f8867;
       public          postgres    false    4409    199    217            �           2606    55245 #   grado_ensenanza fk_2877888eda33e9e7    FK CONSTRAINT     �   ALTER TABLE ONLY public.grado_ensenanza
    ADD CONSTRAINT fk_2877888eda33e9e7 FOREIGN KEY (tipoensenanza_id) REFERENCES public.tipo_ensenanza(id);
 M   ALTER TABLE ONLY public.grado_ensenanza DROP CONSTRAINT fk_2877888eda33e9e7;
       public          postgres    false    208    4454    212            �           2606    55260     plan_trabajo fk_4369f002dd25ed3b    FK CONSTRAINT     �   ALTER TABLE ONLY public.plan_trabajo
    ADD CONSTRAINT fk_4369f002dd25ed3b FOREIGN KEY (tipo_accion_id) REFERENCES public.tipo_accion(id);
 J   ALTER TABLE ONLY public.plan_trabajo DROP CONSTRAINT fk_4369f002dd25ed3b;
       public          postgres    false    4478    216    214            �           2606    55255     plan_trabajo fk_4369f002f625d1ba    FK CONSTRAINT     �   ALTER TABLE ONLY public.plan_trabajo
    ADD CONSTRAINT fk_4369f002f625d1ba FOREIGN KEY (proyecto_id) REFERENCES public.proyecto(id);
 J   ALTER TABLE ONLY public.plan_trabajo DROP CONSTRAINT fk_4369f002f625d1ba;
       public          postgres    false    213    4468    214            �           2606    55240 %   rendicion_cuentas fk_48b38885dd25ed3b    FK CONSTRAINT     �   ALTER TABLE ONLY public.rendicion_cuentas
    ADD CONSTRAINT fk_48b38885dd25ed3b FOREIGN KEY (tipo_accion_id) REFERENCES public.tipo_accion(id);
 O   ALTER TABLE ONLY public.rendicion_cuentas DROP CONSTRAINT fk_48b38885dd25ed3b;
       public          postgres    false    4478    210    216            �           2606    55235 %   rendicion_cuentas fk_48b38885f625d1ba    FK CONSTRAINT     �   ALTER TABLE ONLY public.rendicion_cuentas
    ADD CONSTRAINT fk_48b38885f625d1ba FOREIGN KEY (proyecto_id) REFERENCES public.proyecto(id);
 O   ALTER TABLE ONLY public.rendicion_cuentas DROP CONSTRAINT fk_48b38885f625d1ba;
       public          postgres    false    4468    210    213            �           2606    55250    proyecto fk_6fd202b941cdebb0    FK CONSTRAINT     �   ALTER TABLE ONLY public.proyecto
    ADD CONSTRAINT fk_6fd202b941cdebb0 FOREIGN KEY (plantel_id) REFERENCES public.plantel(id);
 F   ALTER TABLE ONLY public.proyecto DROP CONSTRAINT fk_6fd202b941cdebb0;
       public          postgres    false    213    197    4405            �           2606    55080    plantel fk_7eef6ca42ee5e0ab    FK CONSTRAINT     �   ALTER TABLE ONLY public.plantel
    ADD CONSTRAINT fk_7eef6ca42ee5e0ab FOREIGN KEY (d_codigo_id) REFERENCES public.codigo_postal(id);
 E   ALTER TABLE ONLY public.plantel DROP CONSTRAINT fk_7eef6ca42ee5e0ab;
       public          postgres    false    203    4423    197            �           2606    55085    plantel fk_7eef6ca4373c6c4a    FK CONSTRAINT     �   ALTER TABLE ONLY public.plantel
    ADD CONSTRAINT fk_7eef6ca4373c6c4a FOREIGN KEY (tipoasentamiento_id) REFERENCES public.tipo_asentamiento(id);
 E   ALTER TABLE ONLY public.plantel DROP CONSTRAINT fk_7eef6ca4373c6c4a;
       public          postgres    false    197    209    4456            �           2606    55090    plantel fk_7eef6ca458bc1be0    FK CONSTRAINT     �   ALTER TABLE ONLY public.plantel
    ADD CONSTRAINT fk_7eef6ca458bc1be0 FOREIGN KEY (municipio_id) REFERENCES public.municipio(id);
 E   ALTER TABLE ONLY public.plantel DROP CONSTRAINT fk_7eef6ca458bc1be0;
       public          postgres    false    202    4421    197            �           2606    55095    plantel fk_7eef6ca49f5a440b    FK CONSTRAINT     }   ALTER TABLE ONLY public.plantel
    ADD CONSTRAINT fk_7eef6ca49f5a440b FOREIGN KEY (estado_id) REFERENCES public.estado(id);
 E   ALTER TABLE ONLY public.plantel DROP CONSTRAINT fk_7eef6ca49f5a440b;
       public          postgres    false    4431    197    205            �           2606    55270    ciudad fk_8e86059e58bc1be0    FK CONSTRAINT     �   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT fk_8e86059e58bc1be0 FOREIGN KEY (municipio_id) REFERENCES public.municipio(id);
 D   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT fk_8e86059e58bc1be0;
       public          postgres    false    4421    202    215            �           2606    55265    ciudad fk_8e86059e9f5a440b    FK CONSTRAINT     |   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT fk_8e86059e9f5a440b FOREIGN KEY (estado_id) REFERENCES public.estado(id);
 D   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT fk_8e86059e9f5a440b;
       public          postgres    false    205    4431    215            �           2606    55130 !   codigo_postal fk_cdf05b79373c6c4a    FK CONSTRAINT     �   ALTER TABLE ONLY public.codigo_postal
    ADD CONSTRAINT fk_cdf05b79373c6c4a FOREIGN KEY (tipoasentamiento_id) REFERENCES public.tipo_asentamiento(id);
 K   ALTER TABLE ONLY public.codigo_postal DROP CONSTRAINT fk_cdf05b79373c6c4a;
       public          postgres    false    209    4456    203            �           2606    55135 !   codigo_postal fk_cdf05b7958bc1be0    FK CONSTRAINT     �   ALTER TABLE ONLY public.codigo_postal
    ADD CONSTRAINT fk_cdf05b7958bc1be0 FOREIGN KEY (municipio_id) REFERENCES public.municipio(id);
 K   ALTER TABLE ONLY public.codigo_postal DROP CONSTRAINT fk_cdf05b7958bc1be0;
       public          postgres    false    203    202    4421            �           2606    55140 !   codigo_postal fk_cdf05b799f5a440b    FK CONSTRAINT     �   ALTER TABLE ONLY public.codigo_postal
    ADD CONSTRAINT fk_cdf05b799f5a440b FOREIGN KEY (estado_id) REFERENCES public.estado(id);
 K   ALTER TABLE ONLY public.codigo_postal DROP CONSTRAINT fk_cdf05b799f5a440b;
       public          postgres    false    203    4431    205            �           2606    55145 !   codigo_postal fk_cdf05b79e8608214    FK CONSTRAINT     �   ALTER TABLE ONLY public.codigo_postal
    ADD CONSTRAINT fk_cdf05b79e8608214 FOREIGN KEY (ciudad_id) REFERENCES public.ciudad(id);
 K   ALTER TABLE ONLY public.codigo_postal DROP CONSTRAINT fk_cdf05b79e8608214;
       public          postgres    false    203    4474    215            �           2606    55180 '   diagnostico_plantel fk_dfbfa0301877de2e    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa0301877de2e FOREIGN KEY (idcondicionpatio_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa0301877de2e;
       public          postgres    false    211    206    4462            �           2606    55200 '   diagnostico_plantel fk_dfbfa0302ac83a8a    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa0302ac83a8a FOREIGN KEY (idcondiciondrenaje_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa0302ac83a8a;
       public          postgres    false    206    4462    211            �           2606    55205 '   diagnostico_plantel fk_dfbfa030311b18f1    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030311b18f1 FOREIGN KEY (idcondicionenergia_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030311b18f1;
       public          postgres    false    4462    211    206            �           2606    55150 '   diagnostico_plantel fk_dfbfa03041cdebb0    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa03041cdebb0 FOREIGN KEY (plantel_id) REFERENCES public.plantel(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa03041cdebb0;
       public          postgres    false    4405    206    197            �           2606    55170 '   diagnostico_plantel fk_dfbfa0305128e947    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa0305128e947 FOREIGN KEY (idcondicionesbliblioteca_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa0305128e947;
       public          postgres    false    4462    211    206            �           2606    55160 '   diagnostico_plantel fk_dfbfa030612be04d    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030612be04d FOREIGN KEY (idcondicionessanitarios_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030612be04d;
       public          postgres    false    4462    206    211            �           2606    55165 '   diagnostico_plantel fk_dfbfa03083cd1575    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa03083cd1575 FOREIGN KEY (idcondicionoficina_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa03083cd1575;
       public          postgres    false    4462    206    211            �           2606    55210 '   diagnostico_plantel fk_dfbfa030880e9d7d    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030880e9d7d FOREIGN KEY (idcondiciontelefono_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030880e9d7d;
       public          postgres    false    206    4462    211            �           2606    55155 '   diagnostico_plantel fk_dfbfa030a85158d1    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030a85158d1 FOREIGN KEY (idcondiciones_aula_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030a85158d1;
       public          postgres    false    211    206    4462            �           2606    55215 '   diagnostico_plantel fk_dfbfa030aa9185d8    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030aa9185d8 FOREIGN KEY (idcondicioninternet_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030aa9185d8;
       public          postgres    false    4462    206    211            �           2606    55175 '   diagnostico_plantel fk_dfbfa030d0ca6419    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030d0ca6419 FOREIGN KEY (idcondicionaulamedios_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030d0ca6419;
       public          postgres    false    211    206    4462            �           2606    55185 '   diagnostico_plantel fk_dfbfa030e241bcd3    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030e241bcd3 FOREIGN KEY (idcondicioncanchasdeportivas_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030e241bcd3;
       public          postgres    false    206    4462    211            �           2606    55190 '   diagnostico_plantel fk_dfbfa030e8ffb8e7    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030e8ffb8e7 FOREIGN KEY (idcondicionbarda_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030e8ffb8e7;
       public          postgres    false    4462    211    206            �           2606    55195 '   diagnostico_plantel fk_dfbfa030f31154f5    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030f31154f5 FOREIGN KEY (idcondicionagua_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030f31154f5;
       public          postgres    false    4462    206    211            �           2606    55220 /   condicion_educativa_alumnos fk_f3e428077a94ba1a    FK CONSTRAINT     �   ALTER TABLE ONLY public.condicion_educativa_alumnos
    ADD CONSTRAINT fk_f3e428077a94ba1a FOREIGN KEY (diagnostico_id) REFERENCES public.diagnostico_plantel(id);
 Y   ALTER TABLE ONLY public.condicion_educativa_alumnos DROP CONSTRAINT fk_f3e428077a94ba1a;
       public          postgres    false    207    4433    206            �           2606    55225 /   condicion_educativa_alumnos fk_f3e4280791a441cc    FK CONSTRAINT     �   ALTER TABLE ONLY public.condicion_educativa_alumnos
    ADD CONSTRAINT fk_f3e4280791a441cc FOREIGN KEY (grado_id) REFERENCES public.grado_ensenanza(id);
 Y   ALTER TABLE ONLY public.condicion_educativa_alumnos DROP CONSTRAINT fk_f3e4280791a441cc;
       public          postgres    false    212    4464    207            �           2606    55230 /   condicion_educativa_alumnos fk_f3e42807e33f8867    FK CONSTRAINT     �   ALTER TABLE ONLY public.condicion_educativa_alumnos
    ADD CONSTRAINT fk_f3e42807e33f8867 FOREIGN KEY (escuela_id) REFERENCES public.escuela(id);
 Y   ALTER TABLE ONLY public.condicion_educativa_alumnos DROP CONSTRAINT fk_f3e42807e33f8867;
       public          postgres    false    4409    199    207            �           2606    55100    escuela fk_f6c6e2ce41cdebb0    FK CONSTRAINT        ALTER TABLE ONLY public.escuela
    ADD CONSTRAINT fk_f6c6e2ce41cdebb0 FOREIGN KEY (plantel_id) REFERENCES public.plantel(id);
 E   ALTER TABLE ONLY public.escuela DROP CONSTRAINT fk_f6c6e2ce41cdebb0;
       public          postgres    false    197    199    4405            �           2606    55125    municipio fk_fe98f5e09f5a440b    FK CONSTRAINT        ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT fk_fe98f5e09f5a440b FOREIGN KEY (estado_id) REFERENCES public.estado(id);
 G   ALTER TABLE ONLY public.municipio DROP CONSTRAINT fk_fe98f5e09f5a440b;
       public          postgres    false    202    4431    205            L      x�3�4�@�=... �      @      x�3�4D�A�E�9��\1z\\\ Br�      N      x������ � �      D      x������ � �      >      x������ � �      C      x������ � �      <      x�3�4A�=... ��      =      x�3�4����� k       B      x�3�4�4����� �X      A   4   x�3���v
qt��4�2�tt	u��񍸌9]}<}=�@<�=... �
�      I   D   x�Ż	�@E�xn1����� ��a�|�9nnǚ���Z��9IY&��TYh��-YcȎ�jpn�U�      ?      x�3�4A�=... ��      K      x������ � �      :   �   x���1� Eg�K���3�Y�Hӝ�_5i�*�T����W��^{��Z��V�.���h9g�h4��l�re,Ţ�	8!g~Qޙ�Q] ���)rR_/���:Ѭ�C���&���!�Z�i��<��r(��{��f3B6؟��h�_k,?�      J      x������ � �      G      x������ � �      )      x������ � �      M   u  x��T�n1>o���D�Fm��8��H 	���ړ��?۱ަG= a_�ϻ	I�!��l������jVKu�PlO�rȱU�2�%�I�Tb�ZmcjVU	�ï�+;�,��(��!*N::5w�����8�P�8�*}_2��(S�8��.��}2;��������%똣��=\�Kܱ�S�&3R�Z��t#�5d�ً����^���m�w�b�ex/A(���ޞT�O�0�
%���2kx�`OB�/,P��B
�G���fx����HS4e��j�S)ex��`��SCժ��+Q6��c�y���u��rД�U)��7>�]4חח��/��̮��K�:h�9T[ԅ�@!s������辶8��9�OjÁeD1�J���.�	@������{k��>(�;_$�g�ڦ2�1��?�^5���5�#��j�{߳x�~�XTlF�~�,p�o���2�)c�)�Pg�2d�<K�NU�ܜ�N��zs!�=i�õ�le97}��	9~*�� h}?��p����sH~m;�H���Qi�g��I�U	#D���w#H!��5]%��7S\*'�6����Ǯ�)Ա�DN+�۱ة�OW�nGu)-ϴ�[�f��8�z      F      x�3�4�4����� �X      ;   �   x���1�0E��> ��"!1B��M2j�S���#p1�� �������S���-�0zT��6�����BG�2Y�@�ߣ��I��'�C�C�n#�wz'�q<����b�'Ѫ����e�,�ְwAx���U?` �i/M1R�M�g?�f	�w�(3Y��\m4�8�Z=N�xvi�8os��l�\��c����x(tz      H   &   x�3�t*M���2��M���2�JM/�I,����� ~��      E   *   x�3����KI-�2�(��M,�L�2�NM.�Ksb���� �)     