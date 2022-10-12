PGDMP     9    2            	    z         	   my_bd_ads    14.5    14.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394 	   my_bd_ads    DATABASE     f   CREATE DATABASE my_bd_ads WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE my_bd_ads;
                postgres    false            �            1259    16410 	   addresses    TABLE     W   CREATE TABLE public.addresses (
    id integer NOT NULL,
    address character(255)
);
    DROP TABLE public.addresses;
       public         heap    postgres    false            �            1259    16398    author    TABLE     P   CREATE TABLE public.author (
    id integer NOT NULL,
    name character(60)
);
    DROP TABLE public.author;
       public         heap    postgres    false            �            1259    16415    author_address    TABLE     o   CREATE TABLE public.author_address (
    id integer NOT NULL,
    author_id integer,
    address_id integer
);
 "   DROP TABLE public.author_address;
       public         heap    postgres    false            �            1259    16437 
   categories    TABLE     T   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character(50)
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    16442    categories_product    TABLE     x   CREATE TABLE public.categories_product (
    id integer NOT NULL,
    connection_id integer,
    category_id integer
);
 &   DROP TABLE public.categories_product;
       public         heap    postgres    false            �            1259    16405    connections    TABLE     �   CREATE TABLE public.connections (
    id integer NOT NULL,
    author_address_id integer,
    product_id integer,
    is_published boolean
);
    DROP TABLE public.connections;
       public         heap    postgres    false            �            1259    16420    product    TABLE     {   CREATE TABLE public.product (
    id integer NOT NULL,
    name character(100),
    price integer,
    description text
);
    DROP TABLE public.product;
       public         heap    postgres    false                      0    16410 	   addresses 
   TABLE DATA           0   COPY public.addresses (id, address) FROM stdin;
    public          postgres    false    211   $"                 0    16398    author 
   TABLE DATA           *   COPY public.author (id, name) FROM stdin;
    public          postgres    false    209   #                 0    16415    author_address 
   TABLE DATA           C   COPY public.author_address (id, author_id, address_id) FROM stdin;
    public          postgres    false    212   �#                 0    16437 
   categories 
   TABLE DATA           .   COPY public.categories (id, name) FROM stdin;
    public          postgres    false    214   �#                 0    16442    categories_product 
   TABLE DATA           L   COPY public.categories_product (id, connection_id, category_id) FROM stdin;
    public          postgres    false    215   ?$                 0    16405    connections 
   TABLE DATA           V   COPY public.connections (id, author_address_id, product_id, is_published) FROM stdin;
    public          postgres    false    210   �$                 0    16420    product 
   TABLE DATA           ?   COPY public.product (id, name, price, description) FROM stdin;
    public          postgres    false    213   %       x           2606    16414    addresses addresses_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.addresses DROP CONSTRAINT addresses_pkey;
       public            postgres    false    211            z           2606    16419 "   author_address author_address_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.author_address
    ADD CONSTRAINT author_address_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.author_address DROP CONSTRAINT author_address_pkey;
       public            postgres    false    212            t           2606    16402    author author_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.author DROP CONSTRAINT author_pkey;
       public            postgres    false    209            ~           2606    16441    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    214            �           2606    16446 *   categories_product categories_product_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.categories_product
    ADD CONSTRAINT categories_product_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.categories_product DROP CONSTRAINT categories_product_pkey;
       public            postgres    false    215            v           2606    16409    connections connections_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.connections DROP CONSTRAINT connections_pkey;
       public            postgres    false    210            |           2606    16424    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    213            �           2606    16462    author_address address_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.author_address
    ADD CONSTRAINT address_fk FOREIGN KEY (address_id) REFERENCES public.addresses(id) NOT VALID;
 C   ALTER TABLE ONLY public.author_address DROP CONSTRAINT address_fk;
       public          postgres    false    212    3192    211            �           2606    16467    categories_product ads_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.categories_product
    ADD CONSTRAINT ads_fk FOREIGN KEY (connection_id) REFERENCES public.connections(id) NOT VALID;
 C   ALTER TABLE ONLY public.categories_product DROP CONSTRAINT ads_fk;
       public          postgres    false    3190    215    210            �           2606    16447    connections author_address_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.connections
    ADD CONSTRAINT author_address_fk FOREIGN KEY (author_address_id) REFERENCES public.author_address(id) NOT VALID;
 G   ALTER TABLE ONLY public.connections DROP CONSTRAINT author_address_fk;
       public          postgres    false    212    210    3194            �           2606    16457    author_address author_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.author_address
    ADD CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES public.author(id) NOT VALID;
 B   ALTER TABLE ONLY public.author_address DROP CONSTRAINT author_fk;
       public          postgres    false    212    3188    209            �           2606    16472    categories_product category_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.categories_product
    ADD CONSTRAINT category_fk FOREIGN KEY (category_id) REFERENCES public.categories(id) NOT VALID;
 H   ALTER TABLE ONLY public.categories_product DROP CONSTRAINT category_fk;
       public          postgres    false    214    3198    215            �           2606    16452    connections product_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.connections
    ADD CONSTRAINT product_fk FOREIGN KEY (product_id) REFERENCES public.product(id) NOT VALID;
 @   ALTER TABLE ONLY public.connections DROP CONSTRAINT product_fk;
       public          postgres    false    3196    213    210               �   x��=
�@���)� �`��e<�&��U!X�&�`����ȗ���V,��;���Ǜ�8���5
����ાx C�d�m�{c���r#�;9�h�Z��r�F+�:�"F�B�!"���,�h�|��M�[9O���Y�[N�J�3�ԝ%4>�y�#WJ���i�1,�v�"78������d� ��ݒ�I'�x�$��02�kd����~��%ˑ�� ��X         h   x����	�0���d�N x��aj7P���P(;��F�+$�|'=�Fă��l���FAƇh���U<�lV�D8Q��$H�axn?io�8^�J^]cThd��qI\�         .   x���	   ��n1B�a3�_�20An>�I��Ќ��x�� ���         f   x�3�0�¾�Mv\�ua�	�ˈ���[/6���d�^��ͤiT�2ἰ���@o�p��ͦ�� �m��{�v��d�ņ�= ��1z\\\ *V�         W   x����@��T1�x��%�ױLH0l�(*�FO��`���.�����z��ԃ膋�j�{G��D����n��r�i�Y����h~=         g   x�%���@�v1Q`�^�N����,�`zA�Wmh�`G��,81e��U�]��T����h���"����:Dـ(�y�Dϔ�${"��wm<��2�         #  x��Z�n�]�_q���Cʒ-�.?�M��j	`ػ ى�eѐlB�5qbǏI�dI5��&�����_��'�Ω���'�Ў�d���z�:UW�V�!���<.��A�̧���Y1,&�0�v�-�'yT���|����w���w�Q���܉uY��&K�偬��|c*�7D��{��-N�(O�3|��4�\;�q$�x�u����`��ɦ)�-���k*�A�b$��b�W��q��Q���Gy�]��CY(KV���R�x�:�8a*��Е���8��+��\t[grL��*^>�����G8{*v����RLQzK�����p}3$�ȧ���x^���t&��g�bQ�Z�Ց�t����@|��h#��Qp�7����W�p�����R�B䭿����8��� k "�q�u�e=�?��4�l㩨~ցm��,1��1 >�2��]��/�X��SXq$�v'�F͢n��w,ϟ��uq*�/�A՗�!۞I�e>˲�F�L�D���|ML'Ɛ���� �J�CE6���"1�|ZZp#Da�E�����#J�D����Rn�h�Q����K5��⬌�/i�<j�H��r���՟�2a0d4�٪����F����I�Ĉ�r|с�����H>�n10�۾��ك�������=�����o��~w����w�����_1GK�9y�R�Y"�5q�����O~��3(43$�%��K�dNSh(���G�!����\�;Od�m�\�H1ݍ����C���n�NK�,+7we�K)~(�����شn^�J��F ��dJ�qRq�+�/ʢ�Xˊ�, ��X�����T�$�����v��QRv���`�y����4Pjj����JND�Q��t��V�_7Jc\j|@�Pd"�m����w!�&ֈ�&D �gܧbJuieՎc�B���);E��P��Y��ĐpZAR�i�%�)HI`HQ��'�tq�D��p`Y�3S���p�s��%�����>[3#A�&LHHmW�1aO���"��).I��+�u��tb�%��4_0'-�3��#���},B�`K#R��i߷� T���]��θ5�8��Ml:Q�iv`���A��0n����_����3��!K�j�?�h�J�1�	�*J�wJP.�C�,R�"B����G���0�-����JUR'hd-��WMZ+�VcZ����J�Xy�x"��fz�3�CT�E
Y�FSO�N���_���ކ�_��L�Fh��$N���8W��Zk!NY&�Y);���ʣo��+��
�Od��z�||�6<g=Z���m���$�[4����u�������
J�q��M�m�^0�
O�ǌj�bB�AT����Kwi�s"�	�sld	s���=Kl�Vb٬n/�C|�	�.Y���2(���#O?�VQ	k�wDYU�R���k�-?�ޛh='1@���8Ҳ�љ�9&5@�E�3(��b�$�َ��O��MV_<���Q��P�gМs�g<n��Fh8E�c�n%���{R��������a���6��c)�K F!1mdH�lbg�w�M��Z���g%������QE�\3�{��G 5�|ǋbD�f3�':�7b���$�K�7����DHv�����lF2c���y�(��6�:e`,��"&7�&aR�ا`\U�)kZV)P�ȉ�Z;��-�ш{�h�"�� 鋆Gka���_�Q���P5b�XQz`���N�0���7P>�&n6�S�V������H����yTϯ؃k�~TN��]#��I�hmGSߺw�t8�O1��P�6ha�ld�*��4��D��9�xf���!_���@�Ҥ1�IQ�R�(W~���;jӱ�AM�ڷ�;Yq���6���czX�]c��3{���Y�NB<Z$Uce �$Ab�Ǻ	�g�/4G�Ɋ���1t��1�c�q6a(Y�h5�nUk�SR�����^9#4&ʀR���ة����ޞgCW�x3k��	�LᓦZSBIT����{x�l��[=�i��7��R�C׵��qNJ�s��,�	U�,�e�V���2���rn�V`��L*c��wUJl}�����i��剜���=�&a�7�TND��0Np[Ggfff�nYȮq��%mw��Q�;✡����/?�P�wk�,�|"����O� �i]L�N��N;Y��ud	'e+��0�����d�������sޕ<k�i	RT� ��!���&S;�-�!��9���dWx���B1��9L+4�3�N�;���}�6�35��˱�5�i��Q��mδ~�~�����+ӊ�{�s��@?k"4s��Y�>V7/s�O�Q$�O�����$M��z�m�^�d"�ӷ��6	]W�|��j�Φ#?�Q�2SN&�ڏ���@qbLV�h̩ �X���#B�J�]��ŞV� 浡��Ws�͐t����s�AR-���X_�ɉ�%�gJ��6�+=�`�7��S-�f�>F\�ٙ�{e���au��遂û����]�<���>r�&��(P���6kG�"�6����u�Zm7��9]�����%���c�5=�FX��eg�e�k*��`������7��o�al����W��ZL�p1��N�iڿ��=1CW�UD�/�a�1V6�z��~�(��D�9������߭�kM.���7����'r�+�:��G*�2�#������^�R���az�2��2���KI�����8��ˬ�9+T1"�.+2}����o��*w)C����m'97�	������ym4���*0�p-�}+��_��9�F������k<����M����m(}f%�+����U�1Tzg���W�7_3�����%�?���L���������b��𸋒�6@�6KոO������k�g��:�G<�K��J��:u+X$�A����đTj�ʺ��I�/6��^�d"k^�R�uy���]R�n�Wg�;��j�����Y9gwmw������x�f{o��Q����K��ط|\6����2��7���)�Jj�Uu'��T�����������5�0h��j:b�q����
~U���{�v��o}ğ8     