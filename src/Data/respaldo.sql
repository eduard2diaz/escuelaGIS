PGDMP     4                    x           leen21 "   10.13 (Ubuntu 10.13-1.pgdg18.04+1)     12.3 (Ubuntu 12.3-1.pgdg18.04+1) �    y           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            z           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            {           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            |           1262    47541    leen21    DATABASE     x   CREATE DATABASE leen21 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_MX.UTF-8' LC_CTYPE = 'es_MX.UTF-8';
    DROP DATABASE leen21;
                postgres    false                        3079    48049    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false            }           0    0    EXTENSION postgis    COMMENT     g   COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
                        false    2            �           1255    49594 "   proyectoestatus(character varying)    FUNCTION     p  CREATE FUNCTION public.proyectoestatus(variable character varying) RETURNS TABLE(id integer, escuela character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN Query Select distinct e.id as id , e.escuela as escuela from escuela as e join proyecto as p on(e.id=p.escuela_id) join estatus as est on(est.id=p.estatus_id)
        where est.estatus=variable;
END;
$$;
 B   DROP FUNCTION public.proyectoestatus(variable character varying);
       public          postgres    false            �            1259    47697    ciudad    TABLE     �   CREATE TABLE public.ciudad (
    id integer NOT NULL,
    estado_id integer NOT NULL,
    municipio_id integer NOT NULL,
    estatus_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    clave character varying(10) NOT NULL
);
    DROP TABLE public.ciudad;
       public            postgres    false            �            1259    47758    ciudad_id_seq    SEQUENCE     v   CREATE SEQUENCE public.ciudad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.ciudad_id_seq;
       public          postgres    false            �            1259    47595    codigo_postal    TABLE     �  CREATE TABLE public.codigo_postal (
    id integer NOT NULL,
    tipoasentamiento_id integer NOT NULL,
    municipio_id integer NOT NULL,
    estado_id integer NOT NULL,
    ciudad_id integer,
    estatus_id integer NOT NULL,
    d_asenta character varying(50) NOT NULL,
    d_cp integer NOT NULL,
    id_asenta_cpcons character varying(5) NOT NULL,
    d_zona character varying(50) NOT NULL,
    c_cp character varying(50) DEFAULT NULL::character varying
);
 !   DROP TABLE public.codigo_postal;
       public            postgres    false            �            1259    47734    codigo_postal_id_seq    SEQUENCE     }   CREATE SEQUENCE public.codigo_postal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.codigo_postal_id_seq;
       public          postgres    false            �            1259    47715    condicion_docente_educativa    TABLE     $  CREATE TABLE public.condicion_docente_educativa (
    id integer NOT NULL,
    diagnostico_id integer NOT NULL,
    grado_id integer NOT NULL,
    estatus_id integer NOT NULL,
    ccts_id integer NOT NULL,
    curp character varying(18) NOT NULL,
    nombre character varying(50) NOT NULL
);
 /   DROP TABLE public.condicion_docente_educativa;
       public            postgres    false            �            1259    47762 "   condicion_docente_educativa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.condicion_docente_educativa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.condicion_docente_educativa_id_seq;
       public          postgres    false            �            1259    47640    condicion_educativa_alumnos    TABLE       CREATE TABLE public.condicion_educativa_alumnos (
    id integer NOT NULL,
    diagnostico_id integer NOT NULL,
    grado_id integer NOT NULL,
    estatus_id integer NOT NULL,
    ccts_id integer NOT NULL,
    numalumnas integer NOT NULL,
    numalumnos integer NOT NULL
);
 /   DROP TABLE public.condicion_educativa_alumnos;
       public            postgres    false            �            1259    47742 "   condicion_educativa_alumnos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.condicion_educativa_alumnos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.condicion_educativa_alumnos_id_seq;
       public          postgres    false            �            1259    47577    control_gastos    TABLE     k  CREATE TABLE public.control_gastos (
    id integer NOT NULL,
    proyecto_id integer NOT NULL,
    estatus_id integer NOT NULL,
    tipo_comprobante_id integer NOT NULL,
    fechacaptura date NOT NULL,
    concepto text NOT NULL,
    numerocomprobante integer NOT NULL,
    monto double precision NOT NULL,
    controlarchivos character varying(255) NOT NULL
);
 "   DROP TABLE public.control_gastos;
       public            postgres    false            �            1259    47730    control_gastos_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.control_gastos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.control_gastos_id_seq;
       public          postgres    false            �            1259    47617    diagnostico_plantel    TABLE     �  CREATE TABLE public.diagnostico_plantel (
    id integer NOT NULL,
    proyecto_id integer NOT NULL,
    idcondiciones_aula_id integer NOT NULL,
    idcondicionessanitarios_id integer NOT NULL,
    estatus_id integer NOT NULL,
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
       public            postgres    false            �            1259    47740    diagnostico_plantel_id_seq    SEQUENCE     �   CREATE SEQUENCE public.diagnostico_plantel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.diagnostico_plantel_id_seq;
       public          postgres    false            �            1259    47557    escuela    TABLE     �  CREATE TABLE public.escuela (
    id integer NOT NULL,
    d_codigo_id integer,
    tipoasentamiento_id integer,
    municipio_id integer,
    estado_id integer,
    estatus_id integer NOT NULL,
    escuela character varying(255) NOT NULL,
    calle character varying(50) DEFAULT NULL::character varying,
    asentamiento character varying(50) DEFAULT NULL::character varying,
    noexterior character varying(10) DEFAULT NULL::character varying,
    coordenada character varying(80) NOT NULL
);
    DROP TABLE public.escuela;
       public            postgres    false            �            1259    47542    escuela_ccts    TABLE     �   CREATE TABLE public.escuela_ccts (
    id integer NOT NULL,
    escuela_id integer NOT NULL,
    value character varying(10) NOT NULL
);
     DROP TABLE public.escuela_ccts;
       public            postgres    false            �            1259    47724    escuela_ccts_id_seq    SEQUENCE     |   CREATE SEQUENCE public.escuela_ccts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.escuela_ccts_id_seq;
       public          postgres    false            �            1259    47728    escuela_id_seq    SEQUENCE     w   CREATE SEQUENCE public.escuela_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.escuela_id_seq;
       public          postgres    false            �            1259    47570    escuela_tipo_ensenanza    TABLE     x   CREATE TABLE public.escuela_tipo_ensenanza (
    escuela_id integer NOT NULL,
    tipo_ensenanza_id integer NOT NULL
);
 *   DROP TABLE public.escuela_tipo_ensenanza;
       public            postgres    false            �            1259    47679    proyecto    TABLE       CREATE TABLE public.proyecto (
    id integer NOT NULL,
    escuela_id integer NOT NULL,
    estatus_id integer NOT NULL,
    fechainicio date NOT NULL,
    fechafin date NOT NULL,
    montoasignado double precision NOT NULL,
    numero character varying(10) NOT NULL
);
    DROP TABLE public.proyecto;
       public            postgres    false            �            1259    49560    escuelas_con_proyecto_view    VIEW     �   CREATE VIEW public.escuelas_con_proyecto_view AS
 SELECT DISTINCT e.id,
    e.escuela
   FROM (public.escuela e
     JOIN public.proyecto p ON ((e.id = p.escuela_id)));
 -   DROP VIEW public.escuelas_con_proyecto_view;
       public          postgres    false    213    199    199                       1259    49584    escuelas_sin_aguapotable_view    VIEW       CREATE VIEW public.escuelas_sin_aguapotable_view AS
 SELECT e.id,
    e.escuela
   FROM ((public.diagnostico_plantel d
     JOIN public.proyecto p ON ((d.proyecto_id = p.id)))
     JOIN public.escuela e ON ((p.escuela_id = e.id)))
  WHERE ((d.fecha >= ALL ( SELECT d2.fecha
           FROM ((public.diagnostico_plantel d2
             JOIN public.proyecto p2 ON ((d2.proyecto_id = p2.id)))
             JOIN public.escuela e2 ON ((p2.escuela_id = e2.id)))
          WHERE (e2.id = e.id))) AND (d.aguapotable = false));
 0   DROP VIEW public.escuelas_sin_aguapotable_view;
       public          postgres    false    199    199    206    206    206    213    213                        1259    49569    escuelas_sin_bibliotecas_view    VIEW     	  CREATE VIEW public.escuelas_sin_bibliotecas_view AS
 SELECT e.id,
    e.escuela
   FROM ((public.diagnostico_plantel d
     JOIN public.proyecto p ON ((d.proyecto_id = p.id)))
     JOIN public.escuela e ON ((p.escuela_id = e.id)))
  WHERE ((d.fecha >= ALL ( SELECT d2.fecha
           FROM ((public.diagnostico_plantel d2
             JOIN public.proyecto p2 ON ((d2.proyecto_id = p2.id)))
             JOIN public.escuela e2 ON ((p2.escuela_id = e2.id)))
          WHERE (e2.id = e.id))) AND (d.numerobibliotecas = 0));
 0   DROP VIEW public.escuelas_sin_bibliotecas_view;
       public          postgres    false    199    199    206    206    206    213    213                       1259    49574    escuelas_sin_drenaje_view    VIEW     �  CREATE VIEW public.escuelas_sin_drenaje_view AS
 SELECT e.id,
    e.escuela
   FROM ((public.diagnostico_plantel d
     JOIN public.proyecto p ON ((d.proyecto_id = p.id)))
     JOIN public.escuela e ON ((p.escuela_id = e.id)))
  WHERE ((d.fecha >= ALL ( SELECT d2.fecha
           FROM ((public.diagnostico_plantel d2
             JOIN public.proyecto p2 ON ((d2.proyecto_id = p2.id)))
             JOIN public.escuela e2 ON ((p2.escuela_id = e2.id)))
          WHERE (e2.id = e.id))) AND (d.drenaje = false));
 ,   DROP VIEW public.escuelas_sin_drenaje_view;
       public          postgres    false    199    213    213    206    206    206    199                       1259    49589    escuelas_sin_electricidad_view    VIEW       CREATE VIEW public.escuelas_sin_electricidad_view AS
 SELECT e.id,
    e.escuela
   FROM ((public.diagnostico_plantel d
     JOIN public.proyecto p ON ((d.proyecto_id = p.id)))
     JOIN public.escuela e ON ((p.escuela_id = e.id)))
  WHERE ((d.fecha >= ALL ( SELECT d2.fecha
           FROM ((public.diagnostico_plantel d2
             JOIN public.proyecto p2 ON ((d2.proyecto_id = p2.id)))
             JOIN public.escuela e2 ON ((p2.escuela_id = e2.id)))
          WHERE (e2.id = e.id))) AND (d.energiaelectrica = false));
 1   DROP VIEW public.escuelas_sin_electricidad_view;
       public          postgres    false    199    199    206    206    206    213    213                       1259    49579    escuelas_sin_internet_view    VIEW       CREATE VIEW public.escuelas_sin_internet_view AS
 SELECT e.id,
    e.escuela
   FROM ((public.diagnostico_plantel d
     JOIN public.proyecto p ON ((d.proyecto_id = p.id)))
     JOIN public.escuela e ON ((p.escuela_id = e.id)))
  WHERE ((d.fecha >= ALL ( SELECT d2.fecha
           FROM ((public.diagnostico_plantel d2
             JOIN public.proyecto p2 ON ((d2.proyecto_id = p2.id)))
             JOIN public.escuela e2 ON ((p2.escuela_id = e2.id)))
          WHERE (e2.id = e.id))) AND (d.internet = false));
 -   DROP VIEW public.escuelas_sin_internet_view;
       public          postgres    false    199    199    206    206    206    213    213            �            1259    49564    escuelas_sin_sanitarios_view    VIEW       CREATE VIEW public.escuelas_sin_sanitarios_view AS
 SELECT e.id,
    e.escuela
   FROM ((public.diagnostico_plantel d
     JOIN public.proyecto p ON ((d.proyecto_id = p.id)))
     JOIN public.escuela e ON ((p.escuela_id = e.id)))
  WHERE ((d.fecha >= ALL ( SELECT d2.fecha
           FROM ((public.diagnostico_plantel d2
             JOIN public.proyecto p2 ON ((d2.proyecto_id = p2.id)))
             JOIN public.escuela e2 ON ((p2.escuela_id = e2.id)))
          WHERE (e2.id = e.id))) AND (d.numerosanitarios = 0));
 /   DROP VIEW public.escuelas_sin_sanitarios_view;
       public          postgres    false    199    213    213    206    206    206    199            �            1259    47611    estado    TABLE     �   CREATE TABLE public.estado (
    id integer NOT NULL,
    estatus_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    clave character varying(10) NOT NULL
);
    DROP TABLE public.estado;
       public            postgres    false            �            1259    47738    estado_id_seq    SEQUENCE     v   CREATE SEQUENCE public.estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.estado_id_seq;
       public          postgres    false            �            1259    47606    estatus    TABLE     �   CREATE TABLE public.estatus (
    id integer NOT NULL,
    estatus character varying(250) NOT NULL,
    code integer NOT NULL
);
    DROP TABLE public.estatus;
       public            postgres    false            �            1259    47736    estatus_id_seq    SEQUENCE     w   CREATE SEQUENCE public.estatus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.estatus_id_seq;
       public          postgres    false            �            1259    47673    grado_ensenanza    TABLE     �   CREATE TABLE public.grado_ensenanza (
    id integer NOT NULL,
    tipoensenanza_id integer NOT NULL,
    nombre character varying(30) NOT NULL
);
 #   DROP TABLE public.grado_ensenanza;
       public            postgres    false            �            1259    47752    grado_ensenanza_id_seq    SEQUENCE        CREATE SEQUENCE public.grado_ensenanza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.grado_ensenanza_id_seq;
       public          postgres    false            �            1259    47588 	   municipio    TABLE     �   CREATE TABLE public.municipio (
    id integer NOT NULL,
    estado_id integer NOT NULL,
    estatus_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    clave character varying(255) NOT NULL
);
    DROP TABLE public.municipio;
       public            postgres    false            �            1259    47732    municipio_id_seq    SEQUENCE     y   CREATE SEQUENCE public.municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.municipio_id_seq;
       public          postgres    false            �            1259    47686    plan_trabajo    TABLE     �  CREATE TABLE public.plan_trabajo (
    id integer NOT NULL,
    proyecto_id integer NOT NULL,
    tipo_accion_id integer NOT NULL,
    estatus_id integer NOT NULL,
    fechacaptura date NOT NULL,
    descripcionaccion text NOT NULL,
    tiempoestimado character varying(50) NOT NULL,
    costoestimado double precision NOT NULL,
    totalrecursosasignados double precision NOT NULL,
    planarchivo character varying(255) NOT NULL
);
     DROP TABLE public.plan_trabajo;
       public            postgres    false            �            1259    47756    plan_trabajo_id_seq    SEQUENCE     |   CREATE SEQUENCE public.plan_trabajo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.plan_trabajo_id_seq;
       public          postgres    false            �            1259    47754    proyecto_id_seq    SEQUENCE     x   CREATE SEQUENCE public.proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.proyecto_id_seq;
       public          postgres    false            �            1259    47660    rendicion_cuentas    TABLE     )  CREATE TABLE public.rendicion_cuentas (
    id integer NOT NULL,
    proyecto_id integer NOT NULL,
    estatus_id integer NOT NULL,
    tipo_accion_id integer NOT NULL,
    fechacaptura date NOT NULL,
    monto double precision NOT NULL,
    rendicionesarchivos character varying(255) NOT NULL
);
 %   DROP TABLE public.rendicion_cuentas;
       public            postgres    false            �            1259    47748    rendicion_cuentas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rendicion_cuentas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.rendicion_cuentas_id_seq;
       public          postgres    false            �            1259    47705    tipo_accion    TABLE     �   CREATE TABLE public.tipo_accion (
    id integer NOT NULL,
    estatus_id integer NOT NULL,
    accion character varying(200) NOT NULL,
    descripcion text NOT NULL,
    fechacaptura date NOT NULL
);
    DROP TABLE public.tipo_accion;
       public            postgres    false            �            1259    47760    tipo_accion_id_seq    SEQUENCE     {   CREATE SEQUENCE public.tipo_accion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tipo_accion_id_seq;
       public          postgres    false            �            1259    47654    tipo_asentamiento    TABLE     �   CREATE TABLE public.tipo_asentamiento (
    id integer NOT NULL,
    estatus_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    clave integer NOT NULL
);
 %   DROP TABLE public.tipo_asentamiento;
       public            postgres    false            �            1259    47746    tipo_asentamiento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_asentamiento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.tipo_asentamiento_id_seq;
       public          postgres    false            �            1259    47548    tipo_comprobante    TABLE     �   CREATE TABLE public.tipo_comprobante (
    id integer NOT NULL,
    estatus_id integer NOT NULL,
    comprobante character varying(50) NOT NULL,
    descripcion text NOT NULL,
    fechacaptura date NOT NULL
);
 $   DROP TABLE public.tipo_comprobante;
       public            postgres    false            �            1259    47726    tipo_comprobante_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_comprobante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tipo_comprobante_id_seq;
       public          postgres    false            �            1259    47668    tipo_condicion    TABLE     n   CREATE TABLE public.tipo_condicion (
    id integer NOT NULL,
    condicion character varying(50) NOT NULL
);
 "   DROP TABLE public.tipo_condicion;
       public            postgres    false            �            1259    47750    tipo_condicion_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.tipo_condicion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tipo_condicion_id_seq;
       public          postgres    false            �            1259    47649    tipo_ensenanza    TABLE     k   CREATE TABLE public.tipo_ensenanza (
    id integer NOT NULL,
    nombre character varying(40) NOT NULL
);
 "   DROP TABLE public.tipo_ensenanza;
       public            postgres    false            �            1259    47744    tipo_ensenanza_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.tipo_ensenanza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tipo_ensenanza_id_seq;
       public          postgres    false            �            1259    49556    total_escuelas_view    VIEW     a   CREATE VIEW public.total_escuelas_view AS
 SELECT count(e.id) AS count
   FROM public.escuela e;
 &   DROP VIEW public.total_escuelas_view;
       public          postgres    false    199            `          0    47697    ciudad 
   TABLE DATA           X   COPY public.ciudad (id, estado_id, municipio_id, estatus_id, nombre, clave) FROM stdin;
    public          postgres    false    215   �;      T          0    47595    codigo_postal 
   TABLE DATA           �   COPY public.codigo_postal (id, tipoasentamiento_id, municipio_id, estado_id, ciudad_id, estatus_id, d_asenta, d_cp, id_asenta_cpcons, d_zona, c_cp) FROM stdin;
    public          postgres    false    203   <      b          0    47715    condicion_docente_educativa 
   TABLE DATA           v   COPY public.condicion_docente_educativa (id, diagnostico_id, grado_id, estatus_id, ccts_id, curp, nombre) FROM stdin;
    public          postgres    false    217   .<      X          0    47640    condicion_educativa_alumnos 
   TABLE DATA           �   COPY public.condicion_educativa_alumnos (id, diagnostico_id, grado_id, estatus_id, ccts_id, numalumnas, numalumnos) FROM stdin;
    public          postgres    false    207   K<      R          0    47577    control_gastos 
   TABLE DATA           �   COPY public.control_gastos (id, proyecto_id, estatus_id, tipo_comprobante_id, fechacaptura, concepto, numerocomprobante, monto, controlarchivos) FROM stdin;
    public          postgres    false    201   h<      W          0    47617    diagnostico_plantel 
   TABLE DATA           �  COPY public.diagnostico_plantel (id, proyecto_id, idcondiciones_aula_id, idcondicionessanitarios_id, estatus_id, idcondicionoficina_id, idcondicionesbliblioteca_id, idcondicionaulamedios_id, idcondicionpatio_id, idcondicioncanchasdeportivas_id, idcondicionbarda_id, idcondicionagua_id, idcondiciondrenaje_id, idcondicionenergia_id, idcondiciontelefono_id, idcondicioninternet_id, numeroaulas, numerosanitarios, numerooficinas, numerobibliotecas, numeroaulasmedios, numeropatio, numerocanchasdeportivas, numerobarda, aguapotable, drenaje, energiaelectrica, telefono, internet, iddiagnosticoplantel, diagnosticoarchivo, fecha, descrip_num_aulas, descrip_num_sanitarios, descrip_num_oficinas, descrip_num_bibliotecas, descrip_num_aulamedios, descrip_num_patios, descrip_num_canchas_deportivas, descrip_num_bardas, descrip_agua_potables, descrip_drenaje, descrip_energiaelectrica, descrip_telefonia, descrip_internet) FROM stdin;
    public          postgres    false    206   �<      P          0    47557    escuela 
   TABLE DATA           �   COPY public.escuela (id, d_codigo_id, tipoasentamiento_id, municipio_id, estado_id, estatus_id, escuela, calle, asentamiento, noexterior, coordenada) FROM stdin;
    public          postgres    false    199   �<      N          0    47542    escuela_ccts 
   TABLE DATA           =   COPY public.escuela_ccts (id, escuela_id, value) FROM stdin;
    public          postgres    false    197   �<      Q          0    47570    escuela_tipo_ensenanza 
   TABLE DATA           O   COPY public.escuela_tipo_ensenanza (escuela_id, tipo_ensenanza_id) FROM stdin;
    public          postgres    false    200   �<      V          0    47611    estado 
   TABLE DATA           ?   COPY public.estado (id, estatus_id, nombre, clave) FROM stdin;
    public          postgres    false    205   �<      U          0    47606    estatus 
   TABLE DATA           4   COPY public.estatus (id, estatus, code) FROM stdin;
    public          postgres    false    204   =      ]          0    47673    grado_ensenanza 
   TABLE DATA           G   COPY public.grado_ensenanza (id, tipoensenanza_id, nombre) FROM stdin;
    public          postgres    false    212   `=      S          0    47588 	   municipio 
   TABLE DATA           M   COPY public.municipio (id, estado_id, estatus_id, nombre, clave) FROM stdin;
    public          postgres    false    202   �=      _          0    47686    plan_trabajo 
   TABLE DATA           �   COPY public.plan_trabajo (id, proyecto_id, tipo_accion_id, estatus_id, fechacaptura, descripcionaccion, tiempoestimado, costoestimado, totalrecursosasignados, planarchivo) FROM stdin;
    public          postgres    false    214   �=      ^          0    47679    proyecto 
   TABLE DATA           l   COPY public.proyecto (id, escuela_id, estatus_id, fechainicio, fechafin, montoasignado, numero) FROM stdin;
    public          postgres    false    213   �=      [          0    47660    rendicion_cuentas 
   TABLE DATA           �   COPY public.rendicion_cuentas (id, proyecto_id, estatus_id, tipo_accion_id, fechacaptura, monto, rendicionesarchivos) FROM stdin;
    public          postgres    false    210   >      "          0    48349    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    239   ->      a          0    47705    tipo_accion 
   TABLE DATA           X   COPY public.tipo_accion (id, estatus_id, accion, descripcion, fechacaptura) FROM stdin;
    public          postgres    false    216   J>      Z          0    47654    tipo_asentamiento 
   TABLE DATA           J   COPY public.tipo_asentamiento (id, estatus_id, nombre, clave) FROM stdin;
    public          postgres    false    209   �@      O          0    47548    tipo_comprobante 
   TABLE DATA           b   COPY public.tipo_comprobante (id, estatus_id, comprobante, descripcion, fechacaptura) FROM stdin;
    public          postgres    false    198   �@      \          0    47668    tipo_condicion 
   TABLE DATA           7   COPY public.tipo_condicion (id, condicion) FROM stdin;
    public          postgres    false    211   �A      Y          0    47649    tipo_ensenanza 
   TABLE DATA           4   COPY public.tipo_ensenanza (id, nombre) FROM stdin;
    public          postgres    false    208   B      ~           0    0    ciudad_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.ciudad_id_seq', 1, true);
          public          postgres    false    235                       0    0    codigo_postal_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.codigo_postal_id_seq', 1, true);
          public          postgres    false    223            �           0    0 "   condicion_docente_educativa_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.condicion_docente_educativa_id_seq', 23, true);
          public          postgres    false    237            �           0    0 "   condicion_educativa_alumnos_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.condicion_educativa_alumnos_id_seq', 6, true);
          public          postgres    false    227            �           0    0    control_gastos_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.control_gastos_id_seq', 1, true);
          public          postgres    false    221            �           0    0    diagnostico_plantel_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.diagnostico_plantel_id_seq', 1, true);
          public          postgres    false    226            �           0    0    escuela_ccts_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.escuela_ccts_id_seq', 4, true);
          public          postgres    false    218            �           0    0    escuela_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.escuela_id_seq', 2, true);
          public          postgres    false    220            �           0    0    estado_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.estado_id_seq', 5, true);
          public          postgres    false    225            �           0    0    estatus_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.estatus_id_seq', 8, true);
          public          postgres    false    224            �           0    0    grado_ensenanza_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.grado_ensenanza_id_seq', 20, true);
          public          postgres    false    232            �           0    0    municipio_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.municipio_id_seq', 2, true);
          public          postgres    false    222            �           0    0    plan_trabajo_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.plan_trabajo_id_seq', 1, true);
          public          postgres    false    234            �           0    0    proyecto_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.proyecto_id_seq', 9, true);
          public          postgres    false    233            �           0    0    rendicion_cuentas_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.rendicion_cuentas_id_seq', 1, true);
          public          postgres    false    230            �           0    0    tipo_accion_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.tipo_accion_id_seq', 7, true);
          public          postgres    false    236            �           0    0    tipo_asentamiento_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tipo_asentamiento_id_seq', 2, true);
          public          postgres    false    229            �           0    0    tipo_comprobante_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tipo_comprobante_id_seq', 7, true);
          public          postgres    false    219            �           0    0    tipo_condicion_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tipo_condicion_id_seq', 6, true);
          public          postgres    false    231            �           0    0    tipo_ensenanza_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tipo_ensenanza_id_seq', 6, true);
          public          postgres    false    228            ~           2606    47701    ciudad ciudad_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT ciudad_pkey;
       public            postgres    false    215            C           2606    47600     codigo_postal codigo_postal_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.codigo_postal
    ADD CONSTRAINT codigo_postal_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.codigo_postal DROP CONSTRAINT codigo_postal_pkey;
       public            postgres    false    203            �           2606    47719 <   condicion_docente_educativa condicion_docente_educativa_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.condicion_docente_educativa
    ADD CONSTRAINT condicion_docente_educativa_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.condicion_docente_educativa DROP CONSTRAINT condicion_docente_educativa_pkey;
       public            postgres    false    217            `           2606    47644 <   condicion_educativa_alumnos condicion_educativa_alumnos_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.condicion_educativa_alumnos
    ADD CONSTRAINT condicion_educativa_alumnos_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.condicion_educativa_alumnos DROP CONSTRAINT condicion_educativa_alumnos_pkey;
       public            postgres    false    207            :           2606    47584 "   control_gastos control_gastos_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.control_gastos
    ADD CONSTRAINT control_gastos_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.control_gastos DROP CONSTRAINT control_gastos_pkey;
       public            postgres    false    201            O           2606    47624 ,   diagnostico_plantel diagnostico_plantel_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT diagnostico_plantel_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT diagnostico_plantel_pkey;
       public            postgres    false    206            )           2606    47546    escuela_ccts escuela_ccts_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.escuela_ccts
    ADD CONSTRAINT escuela_ccts_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.escuela_ccts DROP CONSTRAINT escuela_ccts_pkey;
       public            postgres    false    197            /           2606    47564    escuela escuela_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.escuela
    ADD CONSTRAINT escuela_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.escuela DROP CONSTRAINT escuela_pkey;
       public            postgres    false    199            6           2606    47574 2   escuela_tipo_ensenanza escuela_tipo_ensenanza_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.escuela_tipo_ensenanza
    ADD CONSTRAINT escuela_tipo_ensenanza_pkey PRIMARY KEY (escuela_id, tipo_ensenanza_id);
 \   ALTER TABLE ONLY public.escuela_tipo_ensenanza DROP CONSTRAINT escuela_tipo_ensenanza_pkey;
       public            postgres    false    200    200            L           2606    47615    estado estado_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.estado DROP CONSTRAINT estado_pkey;
       public            postgres    false    205            J           2606    47610    estatus estatus_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.estatus
    ADD CONSTRAINT estatus_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.estatus DROP CONSTRAINT estatus_pkey;
       public            postgres    false    204            r           2606    47677 $   grado_ensenanza grado_ensenanza_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.grado_ensenanza
    ADD CONSTRAINT grado_ensenanza_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.grado_ensenanza DROP CONSTRAINT grado_ensenanza_pkey;
       public            postgres    false    212            A           2606    47592    municipio municipio_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.municipio DROP CONSTRAINT municipio_pkey;
       public            postgres    false    202            |           2606    47693    plan_trabajo plan_trabajo_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.plan_trabajo
    ADD CONSTRAINT plan_trabajo_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.plan_trabajo DROP CONSTRAINT plan_trabajo_pkey;
       public            postgres    false    214            w           2606    47683    proyecto proyecto_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.proyecto
    ADD CONSTRAINT proyecto_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.proyecto DROP CONSTRAINT proyecto_pkey;
       public            postgres    false    213            n           2606    47664 (   rendicion_cuentas rendicion_cuentas_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.rendicion_cuentas
    ADD CONSTRAINT rendicion_cuentas_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.rendicion_cuentas DROP CONSTRAINT rendicion_cuentas_pkey;
       public            postgres    false    210            �           2606    47712    tipo_accion tipo_accion_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tipo_accion
    ADD CONSTRAINT tipo_accion_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tipo_accion DROP CONSTRAINT tipo_accion_pkey;
       public            postgres    false    216            i           2606    47658 (   tipo_asentamiento tipo_asentamiento_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tipo_asentamiento
    ADD CONSTRAINT tipo_asentamiento_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.tipo_asentamiento DROP CONSTRAINT tipo_asentamiento_pkey;
       public            postgres    false    209            -           2606    47555 &   tipo_comprobante tipo_comprobante_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.tipo_comprobante
    ADD CONSTRAINT tipo_comprobante_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.tipo_comprobante DROP CONSTRAINT tipo_comprobante_pkey;
       public            postgres    false    198            p           2606    47672 "   tipo_condicion tipo_condicion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tipo_condicion
    ADD CONSTRAINT tipo_condicion_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.tipo_condicion DROP CONSTRAINT tipo_condicion_pkey;
       public            postgres    false    211            f           2606    47653 "   tipo_ensenanza tipo_ensenanza_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tipo_ensenanza
    ADD CONSTRAINT tipo_ensenanza_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.tipo_ensenanza DROP CONSTRAINT tipo_ensenanza_pkey;
       public            postgres    false    208            ;           1259    47586    idx_141b8c4c59bab351    INDEX     U   CREATE INDEX idx_141b8c4c59bab351 ON public.control_gastos USING btree (estatus_id);
 (   DROP INDEX public.idx_141b8c4c59bab351;
       public            postgres    false    201            <           1259    47587    idx_141b8c4ca9b5e49a    INDEX     ^   CREATE INDEX idx_141b8c4ca9b5e49a ON public.control_gastos USING btree (tipo_comprobante_id);
 (   DROP INDEX public.idx_141b8c4ca9b5e49a;
       public            postgres    false    201            =           1259    47585    idx_141b8c4cf625d1ba    INDEX     V   CREATE INDEX idx_141b8c4cf625d1ba ON public.control_gastos USING btree (proyecto_id);
 (   DROP INDEX public.idx_141b8c4cf625d1ba;
       public            postgres    false    201            7           1259    47576    idx_17fbbcc02f92be1    INDEX     c   CREATE INDEX idx_17fbbcc02f92be1 ON public.escuela_tipo_ensenanza USING btree (tipo_ensenanza_id);
 '   DROP INDEX public.idx_17fbbcc02f92be1;
       public            postgres    false    200            8           1259    47575    idx_17fbbcc0e33f8867    INDEX     ]   CREATE INDEX idx_17fbbcc0e33f8867 ON public.escuela_tipo_ensenanza USING btree (escuela_id);
 (   DROP INDEX public.idx_17fbbcc0e33f8867;
       public            postgres    false    200            �           1259    47723    idx_1cea54b7458aa1ad    INDEX     _   CREATE INDEX idx_1cea54b7458aa1ad ON public.condicion_docente_educativa USING btree (ccts_id);
 (   DROP INDEX public.idx_1cea54b7458aa1ad;
       public            postgres    false    217            �           1259    47722    idx_1cea54b759bab351    INDEX     b   CREATE INDEX idx_1cea54b759bab351 ON public.condicion_docente_educativa USING btree (estatus_id);
 (   DROP INDEX public.idx_1cea54b759bab351;
       public            postgres    false    217            �           1259    47720    idx_1cea54b77a94ba1a    INDEX     f   CREATE INDEX idx_1cea54b77a94ba1a ON public.condicion_docente_educativa USING btree (diagnostico_id);
 (   DROP INDEX public.idx_1cea54b77a94ba1a;
       public            postgres    false    217            �           1259    47721    idx_1cea54b791a441cc    INDEX     `   CREATE INDEX idx_1cea54b791a441cc ON public.condicion_docente_educativa USING btree (grado_id);
 (   DROP INDEX public.idx_1cea54b791a441cc;
       public            postgres    false    217            �           1259    47713    idx_1fbb15ac59bab351    INDEX     R   CREATE INDEX idx_1fbb15ac59bab351 ON public.tipo_accion USING btree (estatus_id);
 (   DROP INDEX public.idx_1fbb15ac59bab351;
       public            postgres    false    216            M           1259    47616    idx_265de1e359bab351    INDEX     M   CREATE INDEX idx_265de1e359bab351 ON public.estado USING btree (estatus_id);
 (   DROP INDEX public.idx_265de1e359bab351;
       public            postgres    false    205            s           1259    47678    idx_2877888eda33e9e7    INDEX     \   CREATE INDEX idx_2877888eda33e9e7 ON public.grado_ensenanza USING btree (tipoensenanza_id);
 (   DROP INDEX public.idx_2877888eda33e9e7;
       public            postgres    false    212            g           1259    47659    idx_42a2e95b59bab351    INDEX     X   CREATE INDEX idx_42a2e95b59bab351 ON public.tipo_asentamiento USING btree (estatus_id);
 (   DROP INDEX public.idx_42a2e95b59bab351;
       public            postgres    false    209            x           1259    47696    idx_4369f00259bab351    INDEX     S   CREATE INDEX idx_4369f00259bab351 ON public.plan_trabajo USING btree (estatus_id);
 (   DROP INDEX public.idx_4369f00259bab351;
       public            postgres    false    214            y           1259    47695    idx_4369f002dd25ed3b    INDEX     W   CREATE INDEX idx_4369f002dd25ed3b ON public.plan_trabajo USING btree (tipo_accion_id);
 (   DROP INDEX public.idx_4369f002dd25ed3b;
       public            postgres    false    214            z           1259    47694    idx_4369f002f625d1ba    INDEX     T   CREATE INDEX idx_4369f002f625d1ba ON public.plan_trabajo USING btree (proyecto_id);
 (   DROP INDEX public.idx_4369f002f625d1ba;
       public            postgres    false    214            j           1259    47666    idx_48b3888559bab351    INDEX     X   CREATE INDEX idx_48b3888559bab351 ON public.rendicion_cuentas USING btree (estatus_id);
 (   DROP INDEX public.idx_48b3888559bab351;
       public            postgres    false    210            k           1259    47667    idx_48b38885dd25ed3b    INDEX     \   CREATE INDEX idx_48b38885dd25ed3b ON public.rendicion_cuentas USING btree (tipo_accion_id);
 (   DROP INDEX public.idx_48b38885dd25ed3b;
       public            postgres    false    210            l           1259    47665    idx_48b38885f625d1ba    INDEX     Y   CREATE INDEX idx_48b38885f625d1ba ON public.rendicion_cuentas USING btree (proyecto_id);
 (   DROP INDEX public.idx_48b38885f625d1ba;
       public            postgres    false    210            *           1259    47547    idx_60ab6d27e33f8867    INDEX     S   CREATE INDEX idx_60ab6d27e33f8867 ON public.escuela_ccts USING btree (escuela_id);
 (   DROP INDEX public.idx_60ab6d27e33f8867;
       public            postgres    false    197            +           1259    47556    idx_60fac07a59bab351    INDEX     W   CREATE INDEX idx_60fac07a59bab351 ON public.tipo_comprobante USING btree (estatus_id);
 (   DROP INDEX public.idx_60fac07a59bab351;
       public            postgres    false    198            t           1259    47685    idx_6fd202b959bab351    INDEX     O   CREATE INDEX idx_6fd202b959bab351 ON public.proyecto USING btree (estatus_id);
 (   DROP INDEX public.idx_6fd202b959bab351;
       public            postgres    false    213            u           1259    47684    idx_6fd202b9e33f8867    INDEX     O   CREATE INDEX idx_6fd202b9e33f8867 ON public.proyecto USING btree (escuela_id);
 (   DROP INDEX public.idx_6fd202b9e33f8867;
       public            postgres    false    213                       1259    47703    idx_8e86059e58bc1be0    INDEX     O   CREATE INDEX idx_8e86059e58bc1be0 ON public.ciudad USING btree (municipio_id);
 (   DROP INDEX public.idx_8e86059e58bc1be0;
       public            postgres    false    215            �           1259    47704    idx_8e86059e59bab351    INDEX     M   CREATE INDEX idx_8e86059e59bab351 ON public.ciudad USING btree (estatus_id);
 (   DROP INDEX public.idx_8e86059e59bab351;
       public            postgres    false    215            �           1259    47702    idx_8e86059e9f5a440b    INDEX     L   CREATE INDEX idx_8e86059e9f5a440b ON public.ciudad USING btree (estado_id);
 (   DROP INDEX public.idx_8e86059e9f5a440b;
       public            postgres    false    215            D           1259    47601    idx_cdf05b79373c6c4a    INDEX     ]   CREATE INDEX idx_cdf05b79373c6c4a ON public.codigo_postal USING btree (tipoasentamiento_id);
 (   DROP INDEX public.idx_cdf05b79373c6c4a;
       public            postgres    false    203            E           1259    47602    idx_cdf05b7958bc1be0    INDEX     V   CREATE INDEX idx_cdf05b7958bc1be0 ON public.codigo_postal USING btree (municipio_id);
 (   DROP INDEX public.idx_cdf05b7958bc1be0;
       public            postgres    false    203            F           1259    47605    idx_cdf05b7959bab351    INDEX     T   CREATE INDEX idx_cdf05b7959bab351 ON public.codigo_postal USING btree (estatus_id);
 (   DROP INDEX public.idx_cdf05b7959bab351;
       public            postgres    false    203            G           1259    47603    idx_cdf05b799f5a440b    INDEX     S   CREATE INDEX idx_cdf05b799f5a440b ON public.codigo_postal USING btree (estado_id);
 (   DROP INDEX public.idx_cdf05b799f5a440b;
       public            postgres    false    203            H           1259    47604    idx_cdf05b79e8608214    INDEX     S   CREATE INDEX idx_cdf05b79e8608214 ON public.codigo_postal USING btree (ciudad_id);
 (   DROP INDEX public.idx_cdf05b79e8608214;
       public            postgres    false    203            P           1259    47632    idx_dfbfa0301877de2e    INDEX     c   CREATE INDEX idx_dfbfa0301877de2e ON public.diagnostico_plantel USING btree (idcondicionpatio_id);
 (   DROP INDEX public.idx_dfbfa0301877de2e;
       public            postgres    false    206            Q           1259    47636    idx_dfbfa0302ac83a8a    INDEX     e   CREATE INDEX idx_dfbfa0302ac83a8a ON public.diagnostico_plantel USING btree (idcondiciondrenaje_id);
 (   DROP INDEX public.idx_dfbfa0302ac83a8a;
       public            postgres    false    206            R           1259    47637    idx_dfbfa030311b18f1    INDEX     e   CREATE INDEX idx_dfbfa030311b18f1 ON public.diagnostico_plantel USING btree (idcondicionenergia_id);
 (   DROP INDEX public.idx_dfbfa030311b18f1;
       public            postgres    false    206            S           1259    47630    idx_dfbfa0305128e947    INDEX     k   CREATE INDEX idx_dfbfa0305128e947 ON public.diagnostico_plantel USING btree (idcondicionesbliblioteca_id);
 (   DROP INDEX public.idx_dfbfa0305128e947;
       public            postgres    false    206            T           1259    47628    idx_dfbfa03059bab351    INDEX     Z   CREATE INDEX idx_dfbfa03059bab351 ON public.diagnostico_plantel USING btree (estatus_id);
 (   DROP INDEX public.idx_dfbfa03059bab351;
       public            postgres    false    206            U           1259    47627    idx_dfbfa030612be04d    INDEX     j   CREATE INDEX idx_dfbfa030612be04d ON public.diagnostico_plantel USING btree (idcondicionessanitarios_id);
 (   DROP INDEX public.idx_dfbfa030612be04d;
       public            postgres    false    206            V           1259    47629    idx_dfbfa03083cd1575    INDEX     e   CREATE INDEX idx_dfbfa03083cd1575 ON public.diagnostico_plantel USING btree (idcondicionoficina_id);
 (   DROP INDEX public.idx_dfbfa03083cd1575;
       public            postgres    false    206            W           1259    47638    idx_dfbfa030880e9d7d    INDEX     f   CREATE INDEX idx_dfbfa030880e9d7d ON public.diagnostico_plantel USING btree (idcondiciontelefono_id);
 (   DROP INDEX public.idx_dfbfa030880e9d7d;
       public            postgres    false    206            X           1259    47626    idx_dfbfa030a85158d1    INDEX     e   CREATE INDEX idx_dfbfa030a85158d1 ON public.diagnostico_plantel USING btree (idcondiciones_aula_id);
 (   DROP INDEX public.idx_dfbfa030a85158d1;
       public            postgres    false    206            Y           1259    47639    idx_dfbfa030aa9185d8    INDEX     f   CREATE INDEX idx_dfbfa030aa9185d8 ON public.diagnostico_plantel USING btree (idcondicioninternet_id);
 (   DROP INDEX public.idx_dfbfa030aa9185d8;
       public            postgres    false    206            Z           1259    47631    idx_dfbfa030d0ca6419    INDEX     h   CREATE INDEX idx_dfbfa030d0ca6419 ON public.diagnostico_plantel USING btree (idcondicionaulamedios_id);
 (   DROP INDEX public.idx_dfbfa030d0ca6419;
       public            postgres    false    206            [           1259    47633    idx_dfbfa030e241bcd3    INDEX     o   CREATE INDEX idx_dfbfa030e241bcd3 ON public.diagnostico_plantel USING btree (idcondicioncanchasdeportivas_id);
 (   DROP INDEX public.idx_dfbfa030e241bcd3;
       public            postgres    false    206            \           1259    47634    idx_dfbfa030e8ffb8e7    INDEX     c   CREATE INDEX idx_dfbfa030e8ffb8e7 ON public.diagnostico_plantel USING btree (idcondicionbarda_id);
 (   DROP INDEX public.idx_dfbfa030e8ffb8e7;
       public            postgres    false    206            ]           1259    47635    idx_dfbfa030f31154f5    INDEX     b   CREATE INDEX idx_dfbfa030f31154f5 ON public.diagnostico_plantel USING btree (idcondicionagua_id);
 (   DROP INDEX public.idx_dfbfa030f31154f5;
       public            postgres    false    206            ^           1259    47625    idx_dfbfa030f625d1ba    INDEX     [   CREATE INDEX idx_dfbfa030f625d1ba ON public.diagnostico_plantel USING btree (proyecto_id);
 (   DROP INDEX public.idx_dfbfa030f625d1ba;
       public            postgres    false    206            a           1259    47648    idx_f3e42807458aa1ad    INDEX     _   CREATE INDEX idx_f3e42807458aa1ad ON public.condicion_educativa_alumnos USING btree (ccts_id);
 (   DROP INDEX public.idx_f3e42807458aa1ad;
       public            postgres    false    207            b           1259    47647    idx_f3e4280759bab351    INDEX     b   CREATE INDEX idx_f3e4280759bab351 ON public.condicion_educativa_alumnos USING btree (estatus_id);
 (   DROP INDEX public.idx_f3e4280759bab351;
       public            postgres    false    207            c           1259    47645    idx_f3e428077a94ba1a    INDEX     f   CREATE INDEX idx_f3e428077a94ba1a ON public.condicion_educativa_alumnos USING btree (diagnostico_id);
 (   DROP INDEX public.idx_f3e428077a94ba1a;
       public            postgres    false    207            d           1259    47646    idx_f3e4280791a441cc    INDEX     `   CREATE INDEX idx_f3e4280791a441cc ON public.condicion_educativa_alumnos USING btree (grado_id);
 (   DROP INDEX public.idx_f3e4280791a441cc;
       public            postgres    false    207            0           1259    47565    idx_f6c6e2ce2ee5e0ab    INDEX     O   CREATE INDEX idx_f6c6e2ce2ee5e0ab ON public.escuela USING btree (d_codigo_id);
 (   DROP INDEX public.idx_f6c6e2ce2ee5e0ab;
       public            postgres    false    199            1           1259    47566    idx_f6c6e2ce373c6c4a    INDEX     W   CREATE INDEX idx_f6c6e2ce373c6c4a ON public.escuela USING btree (tipoasentamiento_id);
 (   DROP INDEX public.idx_f6c6e2ce373c6c4a;
       public            postgres    false    199            2           1259    47567    idx_f6c6e2ce58bc1be0    INDEX     P   CREATE INDEX idx_f6c6e2ce58bc1be0 ON public.escuela USING btree (municipio_id);
 (   DROP INDEX public.idx_f6c6e2ce58bc1be0;
       public            postgres    false    199            3           1259    47569    idx_f6c6e2ce59bab351    INDEX     N   CREATE INDEX idx_f6c6e2ce59bab351 ON public.escuela USING btree (estatus_id);
 (   DROP INDEX public.idx_f6c6e2ce59bab351;
       public            postgres    false    199            4           1259    47568    idx_f6c6e2ce9f5a440b    INDEX     M   CREATE INDEX idx_f6c6e2ce9f5a440b ON public.escuela USING btree (estado_id);
 (   DROP INDEX public.idx_f6c6e2ce9f5a440b;
       public            postgres    false    199            >           1259    47594    idx_fe98f5e059bab351    INDEX     P   CREATE INDEX idx_fe98f5e059bab351 ON public.municipio USING btree (estatus_id);
 (   DROP INDEX public.idx_fe98f5e059bab351;
       public            postgres    false    202            ?           1259    47593    idx_fe98f5e09f5a440b    INDEX     O   CREATE INDEX idx_fe98f5e09f5a440b ON public.municipio USING btree (estado_id);
 (   DROP INDEX public.idx_fe98f5e09f5a440b;
       public            postgres    false    202            �           2606    47814 "   control_gastos fk_141b8c4c59bab351    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_gastos
    ADD CONSTRAINT fk_141b8c4c59bab351 FOREIGN KEY (estatus_id) REFERENCES public.estatus(id);
 L   ALTER TABLE ONLY public.control_gastos DROP CONSTRAINT fk_141b8c4c59bab351;
       public          postgres    false    201    4426    204            �           2606    47819 "   control_gastos fk_141b8c4ca9b5e49a    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_gastos
    ADD CONSTRAINT fk_141b8c4ca9b5e49a FOREIGN KEY (tipo_comprobante_id) REFERENCES public.tipo_comprobante(id);
 L   ALTER TABLE ONLY public.control_gastos DROP CONSTRAINT fk_141b8c4ca9b5e49a;
       public          postgres    false    198    201    4397            �           2606    47809 "   control_gastos fk_141b8c4cf625d1ba    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_gastos
    ADD CONSTRAINT fk_141b8c4cf625d1ba FOREIGN KEY (proyecto_id) REFERENCES public.proyecto(id);
 L   ALTER TABLE ONLY public.control_gastos DROP CONSTRAINT fk_141b8c4cf625d1ba;
       public          postgres    false    201    213    4471            �           2606    47804 )   escuela_tipo_ensenanza fk_17fbbcc02f92be1    FK CONSTRAINT     �   ALTER TABLE ONLY public.escuela_tipo_ensenanza
    ADD CONSTRAINT fk_17fbbcc02f92be1 FOREIGN KEY (tipo_ensenanza_id) REFERENCES public.tipo_ensenanza(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.escuela_tipo_ensenanza DROP CONSTRAINT fk_17fbbcc02f92be1;
       public          postgres    false    4454    208    200            �           2606    47799 *   escuela_tipo_ensenanza fk_17fbbcc0e33f8867    FK CONSTRAINT     �   ALTER TABLE ONLY public.escuela_tipo_ensenanza
    ADD CONSTRAINT fk_17fbbcc0e33f8867 FOREIGN KEY (escuela_id) REFERENCES public.escuela(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.escuela_tipo_ensenanza DROP CONSTRAINT fk_17fbbcc0e33f8867;
       public          postgres    false    200    199    4399            �           2606    48044 /   condicion_docente_educativa fk_1cea54b7458aa1ad    FK CONSTRAINT     �   ALTER TABLE ONLY public.condicion_docente_educativa
    ADD CONSTRAINT fk_1cea54b7458aa1ad FOREIGN KEY (ccts_id) REFERENCES public.escuela_ccts(id);
 Y   ALTER TABLE ONLY public.condicion_docente_educativa DROP CONSTRAINT fk_1cea54b7458aa1ad;
       public          postgres    false    4393    217    197            �           2606    48039 /   condicion_docente_educativa fk_1cea54b759bab351    FK CONSTRAINT     �   ALTER TABLE ONLY public.condicion_docente_educativa
    ADD CONSTRAINT fk_1cea54b759bab351 FOREIGN KEY (estatus_id) REFERENCES public.estatus(id);
 Y   ALTER TABLE ONLY public.condicion_docente_educativa DROP CONSTRAINT fk_1cea54b759bab351;
       public          postgres    false    4426    217    204            �           2606    48029 /   condicion_docente_educativa fk_1cea54b77a94ba1a    FK CONSTRAINT     �   ALTER TABLE ONLY public.condicion_docente_educativa
    ADD CONSTRAINT fk_1cea54b77a94ba1a FOREIGN KEY (diagnostico_id) REFERENCES public.diagnostico_plantel(id);
 Y   ALTER TABLE ONLY public.condicion_docente_educativa DROP CONSTRAINT fk_1cea54b77a94ba1a;
       public          postgres    false    4431    217    206            �           2606    48034 /   condicion_docente_educativa fk_1cea54b791a441cc    FK CONSTRAINT     �   ALTER TABLE ONLY public.condicion_docente_educativa
    ADD CONSTRAINT fk_1cea54b791a441cc FOREIGN KEY (grado_id) REFERENCES public.grado_ensenanza(id);
 Y   ALTER TABLE ONLY public.condicion_docente_educativa DROP CONSTRAINT fk_1cea54b791a441cc;
       public          postgres    false    4466    217    212            �           2606    48024    tipo_accion fk_1fbb15ac59bab351    FK CONSTRAINT     �   ALTER TABLE ONLY public.tipo_accion
    ADD CONSTRAINT fk_1fbb15ac59bab351 FOREIGN KEY (estatus_id) REFERENCES public.estatus(id);
 I   ALTER TABLE ONLY public.tipo_accion DROP CONSTRAINT fk_1fbb15ac59bab351;
       public          postgres    false    204    4426    216            �           2606    47859    estado fk_265de1e359bab351    FK CONSTRAINT     ~   ALTER TABLE ONLY public.estado
    ADD CONSTRAINT fk_265de1e359bab351 FOREIGN KEY (estatus_id) REFERENCES public.estatus(id);
 D   ALTER TABLE ONLY public.estado DROP CONSTRAINT fk_265de1e359bab351;
       public          postgres    false    204    205    4426            �           2606    47979 #   grado_ensenanza fk_2877888eda33e9e7    FK CONSTRAINT     �   ALTER TABLE ONLY public.grado_ensenanza
    ADD CONSTRAINT fk_2877888eda33e9e7 FOREIGN KEY (tipoensenanza_id) REFERENCES public.tipo_ensenanza(id);
 M   ALTER TABLE ONLY public.grado_ensenanza DROP CONSTRAINT fk_2877888eda33e9e7;
       public          postgres    false    212    208    4454            �           2606    47959 %   tipo_asentamiento fk_42a2e95b59bab351    FK CONSTRAINT     �   ALTER TABLE ONLY public.tipo_asentamiento
    ADD CONSTRAINT fk_42a2e95b59bab351 FOREIGN KEY (estatus_id) REFERENCES public.estatus(id);
 O   ALTER TABLE ONLY public.tipo_asentamiento DROP CONSTRAINT fk_42a2e95b59bab351;
       public          postgres    false    209    204    4426            �           2606    48004     plan_trabajo fk_4369f00259bab351    FK CONSTRAINT     �   ALTER TABLE ONLY public.plan_trabajo
    ADD CONSTRAINT fk_4369f00259bab351 FOREIGN KEY (estatus_id) REFERENCES public.estatus(id);
 J   ALTER TABLE ONLY public.plan_trabajo DROP CONSTRAINT fk_4369f00259bab351;
       public          postgres    false    214    4426    204            �           2606    47999     plan_trabajo fk_4369f002dd25ed3b    FK CONSTRAINT     �   ALTER TABLE ONLY public.plan_trabajo
    ADD CONSTRAINT fk_4369f002dd25ed3b FOREIGN KEY (tipo_accion_id) REFERENCES public.tipo_accion(id);
 J   ALTER TABLE ONLY public.plan_trabajo DROP CONSTRAINT fk_4369f002dd25ed3b;
       public          postgres    false    214    216    4484            �           2606    47994     plan_trabajo fk_4369f002f625d1ba    FK CONSTRAINT     �   ALTER TABLE ONLY public.plan_trabajo
    ADD CONSTRAINT fk_4369f002f625d1ba FOREIGN KEY (proyecto_id) REFERENCES public.proyecto(id);
 J   ALTER TABLE ONLY public.plan_trabajo DROP CONSTRAINT fk_4369f002f625d1ba;
       public          postgres    false    214    4471    213            �           2606    47969 %   rendicion_cuentas fk_48b3888559bab351    FK CONSTRAINT     �   ALTER TABLE ONLY public.rendicion_cuentas
    ADD CONSTRAINT fk_48b3888559bab351 FOREIGN KEY (estatus_id) REFERENCES public.estatus(id);
 O   ALTER TABLE ONLY public.rendicion_cuentas DROP CONSTRAINT fk_48b3888559bab351;
       public          postgres    false    210    204    4426            �           2606    47974 %   rendicion_cuentas fk_48b38885dd25ed3b    FK CONSTRAINT     �   ALTER TABLE ONLY public.rendicion_cuentas
    ADD CONSTRAINT fk_48b38885dd25ed3b FOREIGN KEY (tipo_accion_id) REFERENCES public.tipo_accion(id);
 O   ALTER TABLE ONLY public.rendicion_cuentas DROP CONSTRAINT fk_48b38885dd25ed3b;
       public          postgres    false    210    216    4484            �           2606    47964 %   rendicion_cuentas fk_48b38885f625d1ba    FK CONSTRAINT     �   ALTER TABLE ONLY public.rendicion_cuentas
    ADD CONSTRAINT fk_48b38885f625d1ba FOREIGN KEY (proyecto_id) REFERENCES public.proyecto(id);
 O   ALTER TABLE ONLY public.rendicion_cuentas DROP CONSTRAINT fk_48b38885f625d1ba;
       public          postgres    false    210    213    4471            �           2606    47764     escuela_ccts fk_60ab6d27e33f8867    FK CONSTRAINT     �   ALTER TABLE ONLY public.escuela_ccts
    ADD CONSTRAINT fk_60ab6d27e33f8867 FOREIGN KEY (escuela_id) REFERENCES public.escuela(id);
 J   ALTER TABLE ONLY public.escuela_ccts DROP CONSTRAINT fk_60ab6d27e33f8867;
       public          postgres    false    197    4399    199            �           2606    47769 $   tipo_comprobante fk_60fac07a59bab351    FK CONSTRAINT     �   ALTER TABLE ONLY public.tipo_comprobante
    ADD CONSTRAINT fk_60fac07a59bab351 FOREIGN KEY (estatus_id) REFERENCES public.estatus(id);
 N   ALTER TABLE ONLY public.tipo_comprobante DROP CONSTRAINT fk_60fac07a59bab351;
       public          postgres    false    4426    204    198            �           2606    47989    proyecto fk_6fd202b959bab351    FK CONSTRAINT     �   ALTER TABLE ONLY public.proyecto
    ADD CONSTRAINT fk_6fd202b959bab351 FOREIGN KEY (estatus_id) REFERENCES public.estatus(id);
 F   ALTER TABLE ONLY public.proyecto DROP CONSTRAINT fk_6fd202b959bab351;
       public          postgres    false    213    204    4426            �           2606    47984    proyecto fk_6fd202b9e33f8867    FK CONSTRAINT     �   ALTER TABLE ONLY public.proyecto
    ADD CONSTRAINT fk_6fd202b9e33f8867 FOREIGN KEY (escuela_id) REFERENCES public.escuela(id);
 F   ALTER TABLE ONLY public.proyecto DROP CONSTRAINT fk_6fd202b9e33f8867;
       public          postgres    false    213    199    4399            �           2606    48014    ciudad fk_8e86059e58bc1be0    FK CONSTRAINT     �   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT fk_8e86059e58bc1be0 FOREIGN KEY (municipio_id) REFERENCES public.municipio(id);
 D   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT fk_8e86059e58bc1be0;
       public          postgres    false    215    4417    202            �           2606    48019    ciudad fk_8e86059e59bab351    FK CONSTRAINT     ~   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT fk_8e86059e59bab351 FOREIGN KEY (estatus_id) REFERENCES public.estatus(id);
 D   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT fk_8e86059e59bab351;
       public          postgres    false    4426    204    215            �           2606    48009    ciudad fk_8e86059e9f5a440b    FK CONSTRAINT     |   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT fk_8e86059e9f5a440b FOREIGN KEY (estado_id) REFERENCES public.estado(id);
 D   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT fk_8e86059e9f5a440b;
       public          postgres    false    215    4428    205            �           2606    47834 !   codigo_postal fk_cdf05b79373c6c4a    FK CONSTRAINT     �   ALTER TABLE ONLY public.codigo_postal
    ADD CONSTRAINT fk_cdf05b79373c6c4a FOREIGN KEY (tipoasentamiento_id) REFERENCES public.tipo_asentamiento(id);
 K   ALTER TABLE ONLY public.codigo_postal DROP CONSTRAINT fk_cdf05b79373c6c4a;
       public          postgres    false    203    209    4457            �           2606    47839 !   codigo_postal fk_cdf05b7958bc1be0    FK CONSTRAINT     �   ALTER TABLE ONLY public.codigo_postal
    ADD CONSTRAINT fk_cdf05b7958bc1be0 FOREIGN KEY (municipio_id) REFERENCES public.municipio(id);
 K   ALTER TABLE ONLY public.codigo_postal DROP CONSTRAINT fk_cdf05b7958bc1be0;
       public          postgres    false    203    202    4417            �           2606    47854 !   codigo_postal fk_cdf05b7959bab351    FK CONSTRAINT     �   ALTER TABLE ONLY public.codigo_postal
    ADD CONSTRAINT fk_cdf05b7959bab351 FOREIGN KEY (estatus_id) REFERENCES public.estatus(id);
 K   ALTER TABLE ONLY public.codigo_postal DROP CONSTRAINT fk_cdf05b7959bab351;
       public          postgres    false    204    4426    203            �           2606    47844 !   codigo_postal fk_cdf05b799f5a440b    FK CONSTRAINT     �   ALTER TABLE ONLY public.codigo_postal
    ADD CONSTRAINT fk_cdf05b799f5a440b FOREIGN KEY (estado_id) REFERENCES public.estado(id);
 K   ALTER TABLE ONLY public.codigo_postal DROP CONSTRAINT fk_cdf05b799f5a440b;
       public          postgres    false    203    4428    205            �           2606    47849 !   codigo_postal fk_cdf05b79e8608214    FK CONSTRAINT     �   ALTER TABLE ONLY public.codigo_postal
    ADD CONSTRAINT fk_cdf05b79e8608214 FOREIGN KEY (ciudad_id) REFERENCES public.ciudad(id);
 K   ALTER TABLE ONLY public.codigo_postal DROP CONSTRAINT fk_cdf05b79e8608214;
       public          postgres    false    203    4478    215            �           2606    47899 '   diagnostico_plantel fk_dfbfa0301877de2e    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa0301877de2e FOREIGN KEY (idcondicionpatio_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa0301877de2e;
       public          postgres    false    206    211    4464            �           2606    47919 '   diagnostico_plantel fk_dfbfa0302ac83a8a    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa0302ac83a8a FOREIGN KEY (idcondiciondrenaje_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa0302ac83a8a;
       public          postgres    false    206    211    4464            �           2606    47924 '   diagnostico_plantel fk_dfbfa030311b18f1    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030311b18f1 FOREIGN KEY (idcondicionenergia_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030311b18f1;
       public          postgres    false    211    206    4464            �           2606    47889 '   diagnostico_plantel fk_dfbfa0305128e947    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa0305128e947 FOREIGN KEY (idcondicionesbliblioteca_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa0305128e947;
       public          postgres    false    206    211    4464            �           2606    47879 '   diagnostico_plantel fk_dfbfa03059bab351    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa03059bab351 FOREIGN KEY (estatus_id) REFERENCES public.estatus(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa03059bab351;
       public          postgres    false    206    204    4426            �           2606    47874 '   diagnostico_plantel fk_dfbfa030612be04d    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030612be04d FOREIGN KEY (idcondicionessanitarios_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030612be04d;
       public          postgres    false    211    206    4464            �           2606    47884 '   diagnostico_plantel fk_dfbfa03083cd1575    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa03083cd1575 FOREIGN KEY (idcondicionoficina_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa03083cd1575;
       public          postgres    false    206    211    4464            �           2606    47929 '   diagnostico_plantel fk_dfbfa030880e9d7d    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030880e9d7d FOREIGN KEY (idcondiciontelefono_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030880e9d7d;
       public          postgres    false    206    211    4464            �           2606    47869 '   diagnostico_plantel fk_dfbfa030a85158d1    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030a85158d1 FOREIGN KEY (idcondiciones_aula_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030a85158d1;
       public          postgres    false    211    206    4464            �           2606    47934 '   diagnostico_plantel fk_dfbfa030aa9185d8    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030aa9185d8 FOREIGN KEY (idcondicioninternet_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030aa9185d8;
       public          postgres    false    206    211    4464            �           2606    47894 '   diagnostico_plantel fk_dfbfa030d0ca6419    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030d0ca6419 FOREIGN KEY (idcondicionaulamedios_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030d0ca6419;
       public          postgres    false    206    211    4464            �           2606    47904 '   diagnostico_plantel fk_dfbfa030e241bcd3    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030e241bcd3 FOREIGN KEY (idcondicioncanchasdeportivas_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030e241bcd3;
       public          postgres    false    206    211    4464            �           2606    47909 '   diagnostico_plantel fk_dfbfa030e8ffb8e7    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030e8ffb8e7 FOREIGN KEY (idcondicionbarda_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030e8ffb8e7;
       public          postgres    false    206    211    4464            �           2606    47914 '   diagnostico_plantel fk_dfbfa030f31154f5    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030f31154f5 FOREIGN KEY (idcondicionagua_id) REFERENCES public.tipo_condicion(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030f31154f5;
       public          postgres    false    206    211    4464            �           2606    47864 '   diagnostico_plantel fk_dfbfa030f625d1ba    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico_plantel
    ADD CONSTRAINT fk_dfbfa030f625d1ba FOREIGN KEY (proyecto_id) REFERENCES public.proyecto(id);
 Q   ALTER TABLE ONLY public.diagnostico_plantel DROP CONSTRAINT fk_dfbfa030f625d1ba;
       public          postgres    false    4471    213    206            �           2606    47954 /   condicion_educativa_alumnos fk_f3e42807458aa1ad    FK CONSTRAINT     �   ALTER TABLE ONLY public.condicion_educativa_alumnos
    ADD CONSTRAINT fk_f3e42807458aa1ad FOREIGN KEY (ccts_id) REFERENCES public.escuela_ccts(id);
 Y   ALTER TABLE ONLY public.condicion_educativa_alumnos DROP CONSTRAINT fk_f3e42807458aa1ad;
       public          postgres    false    207    197    4393            �           2606    47949 /   condicion_educativa_alumnos fk_f3e4280759bab351    FK CONSTRAINT     �   ALTER TABLE ONLY public.condicion_educativa_alumnos
    ADD CONSTRAINT fk_f3e4280759bab351 FOREIGN KEY (estatus_id) REFERENCES public.estatus(id);
 Y   ALTER TABLE ONLY public.condicion_educativa_alumnos DROP CONSTRAINT fk_f3e4280759bab351;
       public          postgres    false    207    204    4426            �           2606    47939 /   condicion_educativa_alumnos fk_f3e428077a94ba1a    FK CONSTRAINT     �   ALTER TABLE ONLY public.condicion_educativa_alumnos
    ADD CONSTRAINT fk_f3e428077a94ba1a FOREIGN KEY (diagnostico_id) REFERENCES public.diagnostico_plantel(id);
 Y   ALTER TABLE ONLY public.condicion_educativa_alumnos DROP CONSTRAINT fk_f3e428077a94ba1a;
       public          postgres    false    207    206    4431            �           2606    47944 /   condicion_educativa_alumnos fk_f3e4280791a441cc    FK CONSTRAINT     �   ALTER TABLE ONLY public.condicion_educativa_alumnos
    ADD CONSTRAINT fk_f3e4280791a441cc FOREIGN KEY (grado_id) REFERENCES public.grado_ensenanza(id);
 Y   ALTER TABLE ONLY public.condicion_educativa_alumnos DROP CONSTRAINT fk_f3e4280791a441cc;
       public          postgres    false    207    212    4466            �           2606    47774    escuela fk_f6c6e2ce2ee5e0ab    FK CONSTRAINT     �   ALTER TABLE ONLY public.escuela
    ADD CONSTRAINT fk_f6c6e2ce2ee5e0ab FOREIGN KEY (d_codigo_id) REFERENCES public.codigo_postal(id);
 E   ALTER TABLE ONLY public.escuela DROP CONSTRAINT fk_f6c6e2ce2ee5e0ab;
       public          postgres    false    199    4419    203            �           2606    47779    escuela fk_f6c6e2ce373c6c4a    FK CONSTRAINT     �   ALTER TABLE ONLY public.escuela
    ADD CONSTRAINT fk_f6c6e2ce373c6c4a FOREIGN KEY (tipoasentamiento_id) REFERENCES public.tipo_asentamiento(id);
 E   ALTER TABLE ONLY public.escuela DROP CONSTRAINT fk_f6c6e2ce373c6c4a;
       public          postgres    false    4457    209    199            �           2606    47784    escuela fk_f6c6e2ce58bc1be0    FK CONSTRAINT     �   ALTER TABLE ONLY public.escuela
    ADD CONSTRAINT fk_f6c6e2ce58bc1be0 FOREIGN KEY (municipio_id) REFERENCES public.municipio(id);
 E   ALTER TABLE ONLY public.escuela DROP CONSTRAINT fk_f6c6e2ce58bc1be0;
       public          postgres    false    202    4417    199            �           2606    47794    escuela fk_f6c6e2ce59bab351    FK CONSTRAINT        ALTER TABLE ONLY public.escuela
    ADD CONSTRAINT fk_f6c6e2ce59bab351 FOREIGN KEY (estatus_id) REFERENCES public.estatus(id);
 E   ALTER TABLE ONLY public.escuela DROP CONSTRAINT fk_f6c6e2ce59bab351;
       public          postgres    false    4426    199    204            �           2606    47789    escuela fk_f6c6e2ce9f5a440b    FK CONSTRAINT     }   ALTER TABLE ONLY public.escuela
    ADD CONSTRAINT fk_f6c6e2ce9f5a440b FOREIGN KEY (estado_id) REFERENCES public.estado(id);
 E   ALTER TABLE ONLY public.escuela DROP CONSTRAINT fk_f6c6e2ce9f5a440b;
       public          postgres    false    205    4428    199            �           2606    47829    municipio fk_fe98f5e059bab351    FK CONSTRAINT     �   ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT fk_fe98f5e059bab351 FOREIGN KEY (estatus_id) REFERENCES public.estatus(id);
 G   ALTER TABLE ONLY public.municipio DROP CONSTRAINT fk_fe98f5e059bab351;
       public          postgres    false    204    202    4426            �           2606    47824    municipio fk_fe98f5e09f5a440b    FK CONSTRAINT        ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT fk_fe98f5e09f5a440b FOREIGN KEY (estado_id) REFERENCES public.estado(id);
 G   ALTER TABLE ONLY public.municipio DROP CONSTRAINT fk_fe98f5e09f5a440b;
       public          postgres    false    202    205    4428            `      x������ � �      T      x������ � �      b      x������ � �      X      x������ � �      R      x������ � �      W      x������ � �      P      x������ � �      N      x������ � �      Q      x������ � �      V      x������ � �      U   :   x�3�tL.�,��4�2���K�p���9��SsS�9��,8]s2s3�@<�=... ��h      ]   I   x���	�0��m1�&w���#�� ����ϐ�v�9��}�#XU]U0���l*�ni���j�� ��1�      S      x������ � �      _      x������ � �      ^      x������ � �      [      x������ � �      "      x������ � �      a   x  x��T�nA����Җ.��H�M$
@�6����Y�?��11o��"��b|{w�6"���;;���]M�&��>ӱ3�sh�q�h�J�%�[�LH��FU����'-�Bk��hʤv$IˑfִQbH�a,�!r8ѐ
�+�5VP�����v���,V�&�(hl\���u�A��.�b؉�C�&�S�-�t#ɦD�Yc���U~�~�
x��c6~�ֆl��ٿ�$��lG{RE����SC(�n�E�3;�L]�u+)�`�i~�����'����Eq6�@��;H���,\Avj�����e|*.T�'����BS�RX�o�w>�\^./���^O���ZTp�1tA�g�f=?�=�g�aL��m�K�q̢T-��]�$���~���hpc��  �8&ֆ��ٳ6��9FPcM l��*���u�$�z�:�Nz���&��*Gxc�3~��Ť,nHo
B�)�D��C����T�7���Tw�U�'7"Ţ�v�X���cg�/��>%���$���k�BD�i�9�����5�����DÐg؏iQU��{���k{��]W�T@n����]���W��2R����V0�}���OW�n�G}9-�Խ[L������1      Z      x������ � �      O   �   x���A��0E��)| D�5��
!07��Q�L���#p�q2$X������iMk�����l������'���M� @Hv=9�N���Ի�'�"������'�fլ�����u���cH��OOO &��7󤡒�䊽xA��x}(U�ʇw�>�����qFs�k����J�:����/[U���u1      \   &   x�3�t*M���2��M���2�JM/�I,����� ��      Y   *   x�3����KI-�2�(��M,�L�2�NM.�Ksb���� �2     