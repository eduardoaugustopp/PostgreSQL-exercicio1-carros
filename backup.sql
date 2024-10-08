PGDMP  )    3                |            carro    16.3    16.3                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16399    carro    DATABASE     |   CREATE DATABASE carro WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE carro;
                postgres    false            �            1259    16410    carro    TABLE     �  CREATE TABLE public.carro (
    id integer NOT NULL,
    titulo character varying(255),
    chassi character(17),
    preco numeric(12,2),
    autor character varying(255),
    imagem text,
    alt text,
    quantidade integer,
    categoria character varying(255),
    comprimento real,
    disponivel boolean,
    data_cadastro date,
    hora_cadastro time without time zone,
    cadastrado_em timestamp without time zone
);
    DROP TABLE public.carro;
       public         heap    postgres    false            �            1259    16428    carro_estacionamento    TABLE     t   CREATE TABLE public.carro_estacionamento (
    carro_id integer NOT NULL,
    estacionamento_id integer NOT NULL
);
 (   DROP TABLE public.carro_estacionamento;
       public         heap    postgres    false            �            1259    16409    carro_id_seq    SEQUENCE     �   CREATE SEQUENCE public.carro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.carro_id_seq;
       public          postgres    false    216                       0    0    carro_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.carro_id_seq OWNED BY public.carro.id;
          public          postgres    false    215            �            1259    16416    estacionamento    TABLE     j   CREATE TABLE public.estacionamento (
    id integer NOT NULL,
    nome character varying(255) NOT NULL
);
 "   DROP TABLE public.estacionamento;
       public         heap    postgres    false            �            1259    16444 
   vendedores    TABLE     �   CREATE TABLE public.vendedores (
    id integer NOT NULL,
    matricula character varying(20),
    nome character varying(255),
    sobrenome character varying(255)
);
    DROP TABLE public.vendedores;
       public         heap    postgres    false            �            1259    16443    vendedores_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vendedores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.vendedores_id_seq;
       public          postgres    false    220                       0    0    vendedores_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.vendedores_id_seq OWNED BY public.vendedores.id;
          public          postgres    false    219            ]           2604    16413    carro id    DEFAULT     d   ALTER TABLE ONLY public.carro ALTER COLUMN id SET DEFAULT nextval('public.carro_id_seq'::regclass);
 7   ALTER TABLE public.carro ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            ^           2604    16447    vendedores id    DEFAULT     n   ALTER TABLE ONLY public.vendedores ALTER COLUMN id SET DEFAULT nextval('public.vendedores_id_seq'::regclass);
 <   ALTER TABLE public.vendedores ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �          0    16410    carro 
   TABLE DATA           �   COPY public.carro (id, titulo, chassi, preco, autor, imagem, alt, quantidade, categoria, comprimento, disponivel, data_cadastro, hora_cadastro, cadastrado_em) FROM stdin;
    public          postgres    false    216          �          0    16428    carro_estacionamento 
   TABLE DATA           K   COPY public.carro_estacionamento (carro_id, estacionamento_id) FROM stdin;
    public          postgres    false    218   &        �          0    16416    estacionamento 
   TABLE DATA           2   COPY public.estacionamento (id, nome) FROM stdin;
    public          postgres    false    217   U        �          0    16444 
   vendedores 
   TABLE DATA           D   COPY public.vendedores (id, matricula, nome, sobrenome) FROM stdin;
    public          postgres    false    220   �                   0    0    carro_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.carro_id_seq', 7, true);
          public          postgres    false    215                       0    0    vendedores_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.vendedores_id_seq', 7, true);
          public          postgres    false    219            d           2606    16432 .   carro_estacionamento carro_estacionamento_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.carro_estacionamento
    ADD CONSTRAINT carro_estacionamento_pkey PRIMARY KEY (carro_id, estacionamento_id);
 X   ALTER TABLE ONLY public.carro_estacionamento DROP CONSTRAINT carro_estacionamento_pkey;
       public            postgres    false    218    218            `           2606    16427    carro carro_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.carro
    ADD CONSTRAINT carro_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.carro DROP CONSTRAINT carro_pkey;
       public            postgres    false    216            b           2606    16420 "   estacionamento estacionamento_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.estacionamento
    ADD CONSTRAINT estacionamento_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.estacionamento DROP CONSTRAINT estacionamento_pkey;
       public            postgres    false    217            f           2606    16451    vendedores vendedores_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.vendedores
    ADD CONSTRAINT vendedores_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.vendedores DROP CONSTRAINT vendedores_pkey;
       public            postgres    false    220            g           2606    16433 7   carro_estacionamento carro_estacionamento_carro_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.carro_estacionamento
    ADD CONSTRAINT carro_estacionamento_carro_id_fkey FOREIGN KEY (carro_id) REFERENCES public.carro(id);
 a   ALTER TABLE ONLY public.carro_estacionamento DROP CONSTRAINT carro_estacionamento_carro_id_fkey;
       public          postgres    false    216    4704    218            h           2606    16438 @   carro_estacionamento carro_estacionamento_estacionamento_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.carro_estacionamento
    ADD CONSTRAINT carro_estacionamento_estacionamento_id_fkey FOREIGN KEY (estacionamento_id) REFERENCES public.estacionamento(id);
 j   ALTER TABLE ONLY public.carro_estacionamento DROP CONSTRAINT carro_estacionamento_estacionamento_id_fkey;
       public          postgres    false    217    218    4706            �     x���Kn�0�5}�Y��zّta�p���8v� @@Qc���QI�1r����+�4mw5!%|�ÈM�ppA�*`RC $Z����:a8�Ȳ��$��Џ�(N�ј��y�a�b��s�-8��P��vduS��$�|Q_��u��m.��lHfU;�Η٧<܅E��]�g9ϲlr�
��Z5�-�3�{PR�{�U`��m�'˛ك\�U���u<.�q:.�pTV�([{;�+����h�9���<�_�.���$^�QΞ����J�>r���v5���"�KG�5�����%�O�1��0���"	��=x��l�W
p�i8�)�#Zl;����k%	�Z�b���}	[Q��>��J�Kc��k�R��(*e��j��\�]��׾���C��Z% [�[�����s�<�y�
>�nPjj�>H��T��������q�������k��H�-jכ.ߊ�~����׈�8���HWn��+�������c>��rus�_�_      �      x�3�4�2bc 6�4���؄+F��� 4Xr      �   C   x�3�t-.IL���K�M�+�Wp�E�9\F��E���\���~�e�
�E�\&:�J�&��qqq �l#�      �   �   x�M�1�0����(i��s�&�N.'f�\b~=��>/_wc��5��D9�b!�l�N�z�A[����_�0��:uW�J&N��S�_>�����n�����&4��%��;�� �.B     