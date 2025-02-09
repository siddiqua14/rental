PGDMP     !                     }         
   booking_db     14.15 (Debian 14.15-1.pgdg120+1)    14.15     7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            :           1262    16384 
   booking_db    DATABASE     ^   CREATE DATABASE booking_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE booking_db;
                postgres    false            �            1259    16386    location    TABLE       CREATE TABLE public.location (
    id integer NOT NULL,
    dest_id character varying(100) DEFAULT ''::character varying NOT NULL,
    dest_type character varying(100) DEFAULT ''::character varying NOT NULL,
    value character varying(255) DEFAULT ''::character varying NOT NULL
);
    DROP TABLE public.location;
       public         heap    postgres    false            �            1259    16385    location_id_seq    SEQUENCE     �   CREATE SEQUENCE public.location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.location_id_seq;
       public          postgres    false    210            ;           0    0    location_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.location_id_seq OWNED BY public.location.id;
          public          postgres    false    209            �            1259    16420    property_details    TABLE     �  CREATE TABLE public.property_details (
    i_d integer NOT NULL,
    hotel_i_d character varying(100) DEFAULT ''::character varying NOT NULL,
    description text NOT NULL,
    city_in_trans character varying(255) DEFAULT ''::character varying NOT NULL,
    image_url_1 character varying(500) DEFAULT ''::character varying NOT NULL,
    image_url_2 character varying(500) DEFAULT ''::character varying NOT NULL,
    image_url_3 character varying(500) DEFAULT ''::character varying NOT NULL,
    image_url_4 character varying(500) DEFAULT ''::character varying NOT NULL,
    image_url_5 character varying(500) DEFAULT ''::character varying NOT NULL
);
 $   DROP TABLE public.property_details;
       public         heap    postgres    false            �            1259    16419    property_details_i_d_seq    SEQUENCE     �   CREATE SEQUENCE public.property_details_i_d_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.property_details_i_d_seq;
       public          postgres    false    212            <           0    0    property_details_i_d_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.property_details_i_d_seq OWNED BY public.property_details.i_d;
          public          postgres    false    211            �            1259    16472    rental_property    TABLE     �  CREATE TABLE public.rental_property (
    i_d integer NOT NULL,
    i_d_hotel integer DEFAULT 0 NOT NULL,
    hotel_i_d character varying(100) DEFAULT ''::character varying NOT NULL,
    hotel_name character varying(255) DEFAULT ''::character varying NOT NULL,
    dest_i_d character varying(100) DEFAULT ''::character varying NOT NULL,
    location character varying(255) DEFAULT ''::character varying NOT NULL,
    rating numeric(2,1) DEFAULT 0 NOT NULL,
    review_count integer DEFAULT 0 NOT NULL,
    price character varying(100) DEFAULT ''::character varying NOT NULL,
    num_beds integer DEFAULT 0 NOT NULL,
    num_bed_r integer DEFAULT 0 NOT NULL,
    num_baths integer DEFAULT 0 NOT NULL,
    bedroom integer DEFAULT 0 NOT NULL,
    guests integer DEFAULT 0 NOT NULL,
    property_type character varying(100) DEFAULT ''::character varying NOT NULL,
    amenities text NOT NULL,
    city_in_trans text DEFAULT ''::text NOT NULL
);
 #   DROP TABLE public.rental_property;
       public         heap    postgres    false            �            1259    16471    rental_property_i_d_seq    SEQUENCE     �   CREATE SEQUENCE public.rental_property_i_d_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.rental_property_i_d_seq;
       public          postgres    false    214            =           0    0    rental_property_i_d_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.rental_property_i_d_seq OWNED BY public.rental_property.i_d;
          public          postgres    false    213            �           2604    16389    location id    DEFAULT     j   ALTER TABLE ONLY public.location ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);
 :   ALTER TABLE public.location ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            �           2604    16423    property_details i_d    DEFAULT     |   ALTER TABLE ONLY public.property_details ALTER COLUMN i_d SET DEFAULT nextval('public.property_details_i_d_seq'::regclass);
 C   ALTER TABLE public.property_details ALTER COLUMN i_d DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    16475    rental_property i_d    DEFAULT     z   ALTER TABLE ONLY public.rental_property ALTER COLUMN i_d SET DEFAULT nextval('public.rental_property_i_d_seq'::regclass);
 B   ALTER TABLE public.rental_property ALTER COLUMN i_d DROP DEFAULT;
       public          postgres    false    214    213    214            0          0    16386    location 
   TABLE DATA           A   COPY public.location (id, dest_id, dest_type, value) FROM stdin;
    public          postgres    false    210   �#       2          0    16420    property_details 
   TABLE DATA           �   COPY public.property_details (i_d, hotel_i_d, description, city_in_trans, image_url_1, image_url_2, image_url_3, image_url_4, image_url_5) FROM stdin;
    public          postgres    false    212   *$       4          0    16472    rental_property 
   TABLE DATA           �   COPY public.rental_property (i_d, i_d_hotel, hotel_i_d, hotel_name, dest_i_d, location, rating, review_count, price, num_beds, num_bed_r, num_baths, bedroom, guests, property_type, amenities, city_in_trans) FROM stdin;
    public          postgres    false    214   a�       >           0    0    location_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.location_id_seq', 5, true);
          public          postgres    false    209            ?           0    0    property_details_i_d_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.property_details_i_d_seq', 89, true);
          public          postgres    false    211            @           0    0    rental_property_i_d_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.rental_property_i_d_seq', 68, true);
          public          postgres    false    213            �           2606    16394    location location_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.location DROP CONSTRAINT location_pkey;
       public            postgres    false    210            �           2606    16434 &   property_details property_details_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.property_details
    ADD CONSTRAINT property_details_pkey PRIMARY KEY (i_d);
 P   ALTER TABLE ONLY public.property_details DROP CONSTRAINT property_details_pkey;
       public            postgres    false    212            �           2606    16494 $   rental_property rental_property_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.rental_property
    ADD CONSTRAINT rental_property_pkey PRIMARY KEY (i_d);
 N   ALTER TABLE ONLY public.rental_property DROP CONSTRAINT rental_property_pkey;
       public            postgres    false    214            �           1259    16435    property_details_hotel_i_d    INDEX     \   CREATE INDEX property_details_hotel_i_d ON public.property_details USING btree (hotel_i_d);
 .   DROP INDEX public.property_details_hotel_i_d;
       public            postgres    false    212            �           1259    16495    rental_property_i_d_hotel    INDEX     Z   CREATE INDEX rental_property_i_d_hotel ON public.rental_property USING btree (i_d_hotel);
 -   DROP INDEX public.rental_property_i_d_hotel;
       public            postgres    false    214            0   �   x��Ͽ
�0����y ��im3w��Ap9��5��D|{��P�v����`��kkJ�=?aKy���J��<� ;F�$8�`����Zgd��+���"㽿R��t�HK|ƪM��8~��y��$T��l�d�	��_�uNk!�dg�      2      x��˒dו%6��-���8�G���	�` !$XT���<#�������_PO�L2�TM5W�	@����}�{��^ݚ�݅̌p���s�]{������ç�����&�%�nˇ������q�P��{
���W��%�����ˇտ�7+)ܪ�r\���a�m9��>l��ownV߮�V��!�o���C�޶C�v���a����W�����~w,��}8���X����*l󪮏�r8�R���7�gwO8~������_y(a�
����Ok�#������'����_���}�٬����'|����W�_�/������@�K��>������{d��}��9�{�ۯ������/euܭ7�_�i�gZ�Wy���<�w�׹�,������~�����s9�.	�x,��s;֛�>�r�q���ov�n&��tG�o6�%���÷r��>��B���=�#y�gG����꫰���a�z�����J�֫�#�ŭ>/a�JO���v����o�د�=	��N�/�F�[����>�#�¡�yڗ��$�n�����];P�/��->�U%<9�&��#�e{�}���Mk'_������<�\���_�5��f}�[�㖬���	��Օ�?��|�w��'l�ze��:����f��.��v}wO��w�؞���f��ph�ѽ�����H�5>v螳��qV���ƅ�0	����z�����Z�Nt�t�{����Xp-Z�~��]l/J{�J����c_��2�<=��f\��]�NE���;�+����l�]JO�a����[�wv�e���������=SG�{:b��z���W�w��ݬ��>ʰ&���H�z	�]��mݯN��~}���������pWVx�����c�^z�7������	���z��������ëO>�?��駩��@��:��Z>�>�c�t��#>m�)�C0�)��Z)�|��ǻ���?����V�N������S�B-�L�,�U�d�2�jj���r�����G��W�Lp�/��x���r�i����uB+ϙ�9	W������ZGUC�b!�	�q߯�HV��)U%
�)��j�Y
�JLZ�s�'k����F��9���+�o�T�JD�Yp!J񵦔]�1(�z��U��F܏hl��Ke3��[5�
�>~%Vp-��BtuL�PTq.	�A*<%[W��&�R�Zǜ�6r�Ed�٬�X����B,��C�އ�1l����fs�9.����_�\�e3���m�m����i��������!���ư'��S��Ծ��ނ]������X�hq��n{{xؽ��~�t�P����nzV��a�� ~6�zs�z�z�Ɓ��i��KlK����@s�M��\�e:�����p�=�(l�?�\ 7��lp۶�#8���j5�����{��3��_�ζ�{|�`�wk���5��-��y������c��o�ݺt;�~���W�0��|rJńv\����EH�x��
��J ftBr��Ԍ��I�i-Bx.�p2T[��,�+`B*ᵷb��R��2��q�J,(I��9�,t�����*���R@
�Q[�l�&`A;�İ���9�B�\��In��E+B����![M��fVX՚9���6 +�D���cڲ�2˹$�RbJ%�M�,�S,1{�B$f�(2�\�'�JF�T8�2�I��x��%���XV<xo4�%�	)��<�<�(M�V�I؉���o�f�.�A3����|8��G��*^-P
¶�/�ޯ�p����{��b�����P�.�ohie��b`sxq��>>�����.5`l;���S�`���s���sXM����mٔ4?j}�oׇ��)zX���Cs�p������V[���-�1�<��;��z�ю7 ���F�]��B��{_ڑ�%�G���  ���o�"�Z��M�X>(z�t�?'X����r�`��fܯ���A�	���|��+�l6�oo�ۇ=a�y6#��7�?����`��T�)�͏1� 
 dU8���`��{'���$��a|�񐴏,\�<�ю��@E!
��$W&�Ds�l��R�<�
8b6�$�ʫR� W,��>l�� ��Y�xt)G�,�e�m������с�Vm��*M�q�O�X�� �λaO|��7�Ք�}�ǜ��Q�YҸ;A�G|��c,6�+Ts�-F�a$g,϶�R�
	\��$drA�.8X"k����ra05�	!`�݂(�����C�l� g�a`=~�� <�'9�ǉ7�Z��4�w�w��:QJ��%��%���F��`ݽG?G��>���>��S+:�=^�L����L��C�@��P����>���W���=�c���v5c\�;C�%�X5��>��B�RӕѶ<>�h8�+ety?�|���75K�3�Q�3�� 7����S'�Y	\�[P�r��l�L����%��6�O�s��(^��Z+5�B�W�n$� [%L�W�`o���=��l?����X-��I��c��^�=
.���@�BU�)�V�� A{��` T�8��a��rUp��sQ�|�J���^�8����m�;�<W`!�*V�K��e�Sl��i̲���퉲v�"�	�}���(Lظ@�T�;M�b�d�E�^/�|	Y��_	v�(�����d��7��2���"��L+8�����>j����]�l�D�y��%��n�y���z�)0�YS�����k_X}G_�_<�nx2��k��Ǣ7>hyz�������!_�)n��{��tGw� �WrAF�.G�vB�8����h���������|��˧L�vn]���M%����.��!<�GYR��6��7���q�� ���Ӿ�9ٛB����(t�	-L�ޯ��5E2�̽]�1���=d�G/�V� �ҵ�Z����2���_��6ہCRX����}�;��ӭ����� J�s&�`��y�]DP��W� T?HZ�z
 fQ�p)��?�E�/d���_ȶ�G
)�.+��-�\\����
<5t�z��`j	���YX@��p߼�_�1�Cu�LH��1�"�һ T\Ñ����d�j۪1J@u1:;�AD��OW�,��}V����rS��P�h�s�!$�g1����aҀ�U��t��q��!N�G�����s���1*Y��D���	�m����`SeV��������gx����t�}�KF@�7�-\���np{�����/����F*��<�w����f��W�NPs�9��ϛU|�б�}�7���� ^����"��G7^<ss�u8<�j���7y��> Sz4hI@s��P��ջw��-�B!�	�)7��(���������x@���e�=�7��}��w�����P�-l�e���Plѐ�����]z):�M_N���髏���>��>m�C0����u��2K�v<��Cy��F�������k�c�c�;�Lt�aºQ<�ҹ����C��~���]���n�>ܷ��}���!��@n���ڙ��Z�W]�yu_6�혟m�~3zT�s#�ۏ��![�����o�_������j����˱d��=C��	&-�InNp��f��ʢ� ���.`氇�)��r�W��P5о�- ���V���5�����A�"�m��(�v�����+�| K%��K��xJ�^����~T�Y'��k`���`¼�0�R]�Q|Y%��י)ǥ��)��^�=�b�^`v��U0+<s/)����er�1%g\fO2��vNa��0���x5�H���I���8�p_8���'�˦����*Q��5$�wSζ@
�����T^��Wj����m�&���G��ɛ��+5��S��/�/�>��P�Aj\�+d�N�h%6�z��m��Y����2X3��1����5�ϼ���Ҏ�Қ��sn�.X��O�����Ci�;�EE?����9��~"G�y�^\ �MPX[���֍(�x�F(�r�Q��+�6h�XII3�kɌEa3�@�    =^:��� ��J:��c �caʦ�#�����}v�����68$�S.

��bP�_Qa6E��AF	�Kh��Ķ�*��ȬY�ZW���A��(��9�٢��L��b%mO<`}H�f��t8���	�`U�2�\s����U8W� ��0�8NU%@�+�~O���Sһ�}w�!�H���*=�4���
��"�����ĳc`B�1~Da�\�]�\�xZ��d\�EPxw���!��$R=+HX�NC<�R���(ܰ?��#�S���QA���E��eCZp]:��-���H����vPq��Ҁ�+�(������7~J���z�e��(�?����߽�_�Ӗ��m���O>�0BO1�n��[���gHy36���=ˉ"�!�dE����t�l�Q5�@��� ��xq@)�0
X������ �j�&/	�=�z
�]/T��5X*K��<;�dN�U��7�������5~8И������ %  )@չb��jc �PH��{3P�}v��S�*�~ȼVc�1j�M����9�[���a55��2����Rq<0V�b.��5���sbQ�Z���TT����>z<^M���$�W0���,ϒ1*��ص%��~뿔���U#�����=�_�0�ᮮ�C�[�f��'��Y;�O]��phm���u=���Pu_>/�
���ܹ�������a9a����U�y������Mu#+��_��ru�[8������� �p�p����,���KhFd�{�r6���-�I�p?����Rt�}���f�ъӜ�a�O��P�|x5�w���������1�̭�߄|����|���M�U�Shd����O3ðnBzwK'�l
��<5���Qv��O��� }(8 ��i�j��hUې�v�����[�����+��/ǺY�m�f�Bk)ߖ���Ev���;:6���Վ�ȇ�oQ,~[ұ�I����`��g-�	���㐴��ð��f>�D/���
nw}�wW���ݓ4���x���@թ�+=�k�'z��#ԧ���#��v�y�>���W�����n���n�a�y���ݛtX?<�I׸��1ފ>�F\hV��ŐhyO�-q� }6��mܴO�ӗ����t���yI�I�{��튪�i9����"����?�CWAp�ãv�F�8��,̝��b���KZ��} �a1u]6y,ç;~������3���P�w�}��i�w�.0w)�;�2�rԘ�
���}	r�q����,☇�*h���$�����Xrej1�D���^�Jޗ�.a).%oaM���5��)�,�U^S��V��F���i�Be�E(Q,��ֹ��l5ǁ��XyX����ҪnO�`�Uu΀0�dW���U䦂2HZ�
��s���&��}���h��]SGԭ�{���T�*b3�ȐC���*,EXK5��Q���¥\�¬�LGw�JF�e���qӠå2��J���5K��q6�Q2xz�3��?B����n8�����,��	������I�����^�1>�W����%��#@��y���y����.>�K
+)n��ݟz�C��c�oO�<��;�`���_�OJ�/yS���
��9C��#y�?Rz�(��W���H�j�ӊ0��큲Lw�cLn������h`~>[�紡��T�ڀ�|�v�7�t���}2A��P�J����W��[��P���p;���N�5��N���,���Z;}R���=�~�ٛ������C���B����I�"q!�X��k� �2��FI�o�mYf���Sٳ��x���VP-RL�x|F8�8lA��h����\��8 ���Uu�9Fe,���r��r�K6��e7G1k�j% ㆕pȑ�)�L��p�`�j=K,�4]�l�dz���" ���е�6F��Ap't���r*+�
+2@�b4W�T��:̂��y�\>���{b�����&(�,uM����	�b���T%�ePpս6N��e��wi��p΃�Y���� ��5/u��z����P����2[W�~}8-�+�U�6����4���W�Ӏ�˕;���o�����-P�Y�h@����;��^��y���ht�S�����C߅8�\����'�,Ȳ����]m�e���z�	�z7l^�5�L�e��=0�����mZ�=2]�?�*[��� {��/<{��ևu1��1*�:��}j�g�g�1 4%�Ww�z\u��R����Rl�.�K�(�y�(t�BH]W����T��y���kg}�������;+ �0v����P.�@e��k�@�BB����9mjL�']Ux+��R�K�9[�w4�vf��'�%`�*��SY��
8��L�Ȅ���L�y��cH%`�R�|MI���3d����T�;ს|u��8�ȕ�
�V`�@у͚���7��k
�$Sʺ!A!L�8?)�Z��6�HY$T��� �ks����"p�B�`ޔd�g�r�-خ3����g��`-aB��_�|�U�jl�a���'���ާ�U6�v���6>��=��-:zJܿ_T�:���_�cq��,!Fs����+Bo�'}A%`ESY���N�Y��g�柑�>'��n��S�p�!u��f���^Zsd�طO~s�>l��D�����)�)n�i��:R����@�8���Z3������?�]��p������Y�`LL��.����zCmk��Hf��^�½��6�ܼ��j��R	9�*�Ox��p)�8k%�x��<��4Q��M/o�d�;�"2�+�	���1�,)PI�gm��lL2����E�R��K3*����0ʨ+8o��1�#���:�S�r�#���	I-Ri,�'�*�YM��a O�,_��!6@\���0���FRυ660�[i��Z"�xց�B-����j+�`Xy0YHW�kN��,��P55����p\�s<1�b)�����:N\/�� �$H�;o�}�J�U �������VOe#����.��Ws�]&X�`�����Q@�w��KtZT|D�K����#~�Q�c��_hDz=�L��m������Jzq��:_}���
 u���9sܖ��FvC�^[]�������!ڭ�(h��8Y���$���w�5~�E��x������J/-K��݄�t��9閱/�o�m��#ɮk�BР�D�)^�}W�,w����(�m��O��.3Ӓ0��J����Y�4넛�z�yRV<��e��0+D^.�G�ZbI�t�n��{tц��%��u��F]n�Y]~g/=�}���%��8Z
�=Nk
<Me_���,CL�ˣT�W�U�A
�������k�p�Kr3@*�xn��	S�M��I'6)��>�.�*)���W��5��6BaX0_��O����U<��>
j�U��@Y=�%9�UP��U�+Lo���7��<eؗP��``X�s"����-��v*n��JI����JӔ尩c1l
`�i��Ec	��JnKE�@v�^��cP�.����-+62��W��jH��J.�
.�D�26��S?��e5�u�U�|�}]ʜ���j����[��o�r?�,��{)�t5{���i��fEG\�s�&��/�]����,��g���Z.P�ٻ7�����]�.q�B�2-k�LЬ�v�����S��:.��S$}����:�.��W3ᲾN�U"��{�Kn"Y�ۢg��3����ǥ�N�����e��4m}��0Bu�}x�qYۻ'�=}D�L�m�B���|����z)֮n���]O
����i'!�i�-2�Oی��
^�"����˻YYgOl�Gg	$�Gm��N2F:Y�TYE��Ptފz�������FM���hr��
����L��˰#UE�e�x^t����R𚴂@�*�*�ek�Y�+jV۞3�v4���F��X��F�o��g<j�aLI��`gd�T]�I�kĊ�J���$�N;�2W
����H'S:���Y�6s&|v�sU��N��5Sww,=&��aDr�z�`���H�^����I
7(ñ2    Nhr��/0�Z;����.<�1<����߽����ͯ�ݷ��Z}�����:�w-�v�,�����v}��6���Ŕh�T�	��+����A'����:|�X��ꋮ���̳�G_��h)���퀳��@o=�؛���!��[�g��/�f@�rW����:��H��7
AE2{)k	|N��8��'�=Ǉc4:&!�����I(F�D�B�&,+<ɶC��xn�B��(j��T�μ$�jagFg/���*y>]��50�!��XF�4P���z�H՘��aM�Nb���,H�Ta
��j�A����肷zƧN�Ĺ���z���d���:ϔW9�ȫSV++���t)JHV<�+�VB���sB>�� ��x�X��
�x��ŜReAf���^��s(�-'\j�{*.�+SOW���x�נP/�����\���XDg�WoKh/P���3A�TF�5�5����Q�������D=������/��I��}=J�����D�/�����V�mC�q�v�����3h贒���>=���B;����k���\��JK��F6�~�Zx�R�s�̇R�Q�#����Y�q�ZKx��%S[�� �1	D����j�k�.��M>d�p�ݶ�U���L�鼧����Y&���B�7���T�e.>�@\ŲQSK��e*�'!Wc։
��5$uZR�I��&B Ն�<�äd4�����p%�4Ϋ�	<P��5?�ޗ���.1��t����1�3��3��R�P��W�8�\��_L1��#,.:Ê)��#Z��2n���r�eP[u��n��POߩU�؍J2b6�@D���ց�Ay�.J� :�
�א�n!~̍�#�(N�)�dXv�j�y��	�&��-A+����S!���1e&��V��=J�u��P�9��v)5r_8��/��</����I�G�dr���Vh�al��5�u��:�3��M���n��������)��Ѝ#vE�c�n;����Wq��ؾ<n�[/������4t�����V'�1B��R�%˜a����Y��E��&�*�V�=�\���;�i�!K4<_&��L2ÅU2G���O�T8�V�Z��:Z ��H86�M�5u��Iמ��20�s8�9�1�h�'�}e�Jg��xc,^�+��w���wܢ��o܀{�����3l�c�y쌈��([���]S�M"Dp<�3��8)�ǸVI::&%+��&��R�� �LcZ�5���rg�������Ү�U}q����RV�S�M��L��e��5�\'c�c�ρr��"�ӭ���V�1FX���w'�e�0#��~_�O�"��j�"9g�O}��J�i���z���r�گ/z���	Y8�-0��� �=���b����L�G��t����b�O��c��Ǆr^n �$���p?U2�k_�j��'���03T�}�7
�������9Z�楮=���2�}Y�b�~F����#����z�<��?ywr	MO0z/�b���庣�t�J���_-�"9x��n���MBW�`R[2�Ǌdyx�,�b�e��I�6�����쌸��UQ(�s�Κ%�/��'��Lf`�`�5H�$l���F�`�I3�&����
�֭���D�k���Ҵ)8��W�嚕X*e1s�$�	O��:��:^cȡ\S����ؿ��IQL��Lp�.&��E[��:���@o����$�DJ�ǒ�^wM-S�'|��m:�+�9�j��7�n/pq��s���fB�B\t��eև�O{x����/��Y�^.6���:ʲ 3v������'�ꦅ��O��S�َ�Ew���m����Z'�h~9}M�ѿ�Y����<��'b���� 's�N�JM��]lY�^y�fl�+`H���n��8P�RL���[��6n���@ޫ����n[�nhj ���E�:ٟ!���v^�^���q��8��;54�'S�Z�o�5~�Y��m]"������0?d,�LC�E��{��Ӡk_�>�:~5��rCB�q����=v����e�j��K��*B���2go����v/ ��pok*UPX�ʶ%E`K \��'U�g���UINV�#���Ȳ�f�E�����&_~L1�jjv�g��Qd�R&8CN �t�d���Tx	�ĥ�J<� ��2N
t����(��B~���g�Cf�R_�,:�iK3���Wu�=ܳa�d\����:�VzJ3���GgY�,�;Eqsؐ�
�_�:�F�|���C���$D.w�q'4�Fg�l��/�2�����]8�j0G����3;ҊP�Z�.A���~ ��J7�6哮4��C�^��n�?�3Ks�Y4�c��<�
{5��ˀқ�f��|��?�].�'Ng�6O���ַ����]��;�v��mw�y<���^,�7�7����jc�h'ѭ�'����{�������F���>P��o���.�����^VC�y��>����n񗛵��hA+���n7$l�J�M�k�+ոU��r<~a��Z]l��u�(R��!��
��J��z�1U�@�������UG�7KJ��Q�8P��`�!�xM��_���1���+�Ҏ���M, bcA��[g��[��� ��qh����:@		A�TYE�"ŹDc���"U���,(\%��>������W"�h�����8�q^�.���d���1�-�� ���q!�'�m�y�D�'x�g�D'�64n��y��wM��yx��:��e"�������0�:�Qr�/aC��/�e:}q��K�#��ź.�/??G܁�R�����7��ͅ���nnf�O���tP ]�=oZP������#�+��}&��x���^+��6�����_����7v�|_zW�i���j��ŌW�!�y�ɢl��>�%�~I˸*���QzZS��q�1�ts�0�̚":�`03'a��ނglu��D��l
�cE�y��Ü�J-�OG�;��n���75~��Xe�٪�0:�=�E�=V��>@��(�>́韥��2~�y���1.M�,X#2�ZM��H�?�br��i.�7���5<*�qU}͌�a%��t�?_3E�@���pPX�O�X6Q-|��9E��QӉE2�3
��1��<L�`&&�S�4�^�%�����%*oLػ��&�X�W�R!P4W)�u{2f�5���&�;�����XK� U:���021O��^� a���5��~O�M�f���1J�)�M���m�$q����ueUؤ��ޗ:�
uY�na��� �V�K���Z�_����}c֯����Y���������u�|x�߬��:M^�|Y	`����t��9w�t|*k�;�s޻p� L���0Kᳱh��|�����L�L���V���YFd���_i���&��=
�-慷����ͪ�|�&~6�����cK_uFS�?�G�L�cc��"���O�Bl�r���r�@2h�&�v�j?�4�p�_�4��wPl;�(���r�$1Ԥ��������t�f�O�V�G!�͊n8=RM�|VT�{���O�;6���!�nHS"�Z����?�.�}�}����xX[���­'a�����B�t?��<��]�%e ��V�v�ϻ��� �������������k���73����(�5ڜ�Z��f��r`��F�~��rKU3cs�t%�)�t%������{,6���-�Q3�5��r{9�u�t����] �{KZ��XT�uW�3�V�ʕ~l< ����q6=9�N���L1�T�##͑�.��[@����U���គ$���{S\�\�# ,�
A�e��
�2���X�*X�����0%�SE�F&���v%j,-s�YSXb I8��a7�S�y�1h�x Ո�fe)�f�o@�|��"�a%�H=E��m�)��hl�9�u�6,뒨7�q����&��PB����wg����Ri���U���4j� ~lH)@:�Y�d��J �Z՘�������Q��Q���0�f,ݙC���    2k�z�I�?�n	%�o��=�8���A{�r��;u���{ք7/�P����n�;�goZ�O�Ӭ�^|w(㛚�㎌GhT�'j;`��c�G�;6O�?-:���S�D�X��������q藸@p��M*oy�n�k�����$t�.�5Z��#E�����'��-,9�7����'h>=8�}%�I�m�;Eڟ榟<����Z��i�Nz8� ~�n�żڨ>����8q˺�>�yG��������O���F�r �i-8��� H ^�&�x$.9Hr�VR��� ͵ܔ���<>|�P��ͥ˴I[h}�l�(�h�( S&���h-�ћ攅�ǹ�.\�4�iʚ�1U%u�!X!u�Y���$g�M��ek<I���5,���3jS.?��$W�d�9:�6Qf�*�c�0T��]������r6��X�.yx��J6�M�!�~O�Q�d�>n�<R���U��9��">�X��� A���
k:�d�T�M�φ���m�F�:�0̳*e���g�QR8���>ѤE�&�z�
�v�?�L�e�����e��ys��#k��xg�ls��04�YV~���;�2u�V��J�6�\,C����E-�s̹�Ih��)7Q���i���^���|hi�Ygx���;N"㳂�ei�ͼ�6�|,w��O��G����$����{7�����b���o�������N/��&�y���L+U��.w��~7�,~�^��R��z��C���j������.~�r�Ͽ���Ѩ����\(JN�d�)>Ɂ3�)^��N�`A��$�t�ׅ'|���q���r�~%�`0����@-(��Xq�IA�Y��{��L
��j��#�r]����W2ZFx��d��,/EU¾��T1�TW��VYV�e��ҩhI`�\3|XɐO��N�e4�e V.4��3��V�ad�k�vO��(�x���;6銕hr,�g�0�z�� o���P[�C �1x�Q�Lz[�$
eW�7�Q�ߙd
e+sϕ� ��l�6|��re�{ߘߗC���ݧ�	������,;4ϣ��_, lq�V���LA�$��IM�K Xw�sX���@P�\��f�� c��߽C����j5�$/�'
G߇�E*�ҹi�+׈mR����ܛF5O�W�*��yl�VmCW�Ѳw�p(���=�����}i|�%vmO�I���:�xվ/��Cʦv�J�x똧�o�*އ��s�Kc��ֲ�$��A:�Xc�*@�t��������xpr8G#��,����[�w���
=�p�vx������M�-D��ݬ��Z��Y�Q�ٻ�YE{o�����K8
�?�x�.��Ѝ��.1����wo�'�;y�.�Z�(����~����'rQ�b���켥����]�K?���z?�>��t�mI�ͳHCCZ'������L]ѝxs'����ޝ�4_Rf��dP��S�WA�,�(��v��ф��N����w�׏4��� ��tl?-rG_�0�(J��D�E S��!qc�w�)����3����-~����S#Q�����Nop�g��{r��������{����}4�r҇}��ۧ���!��cEs	�yEOj:DB����}�'!�!��x���F�ڽ�Nl6s������Xdz��\�=j��h���9����4С�|y ��/���B�x
��wt�9�{����#�k	Jtܮ������%����"�]�e7~��DJ���yOI��9]�ͬ�����w���� ��ʵ��ҧ$rsb��??�:��S���H5��yi�ɕ!W
��M9�y�>f��N�|Y�SM�8�04�#{)�5j�	Km���r%]���`h��Y����4JFD�5�,��yM��|��D���29uZ��%9E2�ArjwV�W/c&B#�����'��}ՠ�<��_�'c(F� X��&��q�+r�e.J�C��0x����:^->J�� H��1L�5N�H��K������Ձ�wR��Ѱ�
����3-�����m,@k��J��������橿���n�*M�h� 3�ڀY�v���,i5�\�%V7'r������Trj�^���V莺�f���Ƿ㠄e!�j©Y�}(;�|���a��Rx��oO�Ǽ�nm����pi�t�#]t�g}�`ó&yb���7S��P��_.g~ߧ�?.�X�`�Z{̼i����3���O��*����|�B�!8 Ѫa�YW7D��`�a������,`
D����}��)�}3����9r������/$5n��w��[��:����|�i�!>m�Q"v�� ޓ[⒏����Gi�.kbmX�ꎔ���?4�����Q�Ij�Sn�ЖQ���7�a��HC.� �9&��H��Lf��Oml�w��5I��l̒z�<�s�\6(�3�|X����eʕ�`If� �at���z]���+򒇲4��1��q�4���JY�${��������^xx�U4��Vb̴[��6$߽J�9u�WlA�Xa�5I��%M7���?�]�%V2�,7L��N��b�PҴ8'��0�.b�B��YV��"��
��B�Sl��*��	��djY����s��n�y���w[�����ǲq���L�t�'vҠ����iYʉ%iP�h��f8�@�G3��o��*�/Xw;1�i=7W`V#s:k�4��߾��
��G���'����Ml|�O���y���f&}ipx�/���У������0Lh��8J�[���A�4b�Y�$c�x�鰁��P����Dc�/�WҌ�wD\��R�19��V'2iXМC�������ʔ$U�6jXWBd�i�a5�k���J����_�I�43e*	�Ҕ�]T�xpdG)�� -��2x>Y�B��W4�uwgt�b��2� F&Щ�]���88�H>4�'��&&ܲ��O�m_qw��؁��Ф�$�'�V',-���_p�Q�&$�%!�3���J�70G�L�]�V��.��s�� �f1JzP�׽�P�=9� ���=�+5<u�!�uǦ�WO��q����s�nh���0w��G�J�?���H_m�j�#BX܀ng�p.KY���P�����v�Ps���f^\�|E�������Y���x��Y<�9�d�(8Mx����E?n�#/���̙ם���A�����ǣ,�c�NG����U��c�b[���Qn�cض�|Y`m;��6f}3�O�6��ʹ��ɴș��uCv^�	�m�[�ID�<��_M-D+��w��Q���g�K,�D/�K�	��D䴳���T����V8=� �W$Ø���q��V4J���d�j�_i���} ��y(>�,d(��bQ�P���W�N�;��	�h6�4�UoCWT4{Fɸ����4#���4��s-he�F���;��_5V&g��*�ݹ��K��jkX*���u�Kl�"�7Y�`0�ؓa%���!Q���<ycA�)t�)�[`�C�*�a�4p�,����:�ut�ͮ�p�0Tg�XO �z���ԥ��@���4���'�r�R�@߹pA]��B!��n���3u�k=��z,��h �ډvv�rh��>�����/�*��$g�~Sv* �{aB}K���D=N�Y{?3�_�ع��G�i�J��b��'��b͵�ƴ&)���d����*�ȼ��)��(�H�5��\�����76?�J����'��J.�LP�lZ��H�6g�*���i�G�l-���8�}2Q�� �H`�8� �UKik�aIw΃���Lsju6r��V
���hn����1�uN���<��pD`,s�g���ܐ��z%c9�*���������r���'!I��&Y\W�JR�
/��N)s�{���Htu�1�q+i�N�K
�'V�H�8�]�6gM���������?�|a��!Mԉ��xBUS3|l#� �>�(	���C�:Ls�eӑ:P���=(�m�#]L_-ƨ佌Is�6��'��y�Y��|���%��]f��$�b"��KzWZ��NNJ5��q�F�    L����D���(8���h�.ۓ����ܙ���y�K�{�&l&F���];�̪-��Cw�	�A�I�������Ӫѡ�z����۬���H�H<h,����6�w�I��𤕃'Ffq���T{d�4G��y-QdwE��_�8�K�w4���D�  ~�s���'����Fg�ĚH�]_3q�[�8/غL���<Jk�b�l�Y�%�&������ �(Թldƿ�f^z[�;�)b���P7<"���$�	;�e�N�=+�{�<�,c����Wp�~O�4��ZC�`��=�)���FS$N���YI$�C��R9�j�����/d���(e��_[��������?gl�J��'��"�)�:�k���I������@�����IR�Fz7����py����]���7����V����V���kk�����g�����D�G!nb�K5�y����1itT�_�?J�:�A�tP���j�6N�ͅ��v:�<�Á���y�o�%~�>�gCk�%�#���X�-=כ{L?F�~5�S�4��j��z�R�𰍡y I	K�XPL0U�\�IH��6Ǯ_�V���"w^k�O�f7(�s�5��T�Õ��2�|I�-Uny��K����u+e&��Rc�'�Ʀ�6���G�A��O�%�K��t�E�Z����Q�����YѪX���:�� s�{����������#���!|���u�j��qځ��Vy$�e�t �r�+�~�
PN�d�T�C�$JQm�M��B�&3��n�I���S�n(R~�r'�k߾H�Z�[�޲Lw�N���:��x��%�B���p�k5t��*�(q-�I��yL�b��˼c'��j���y߲~���-,r��ba@�.�;03�k�^�~����sN9eG��j�n0&[9]<6�Z}�Z�ǁ]sMկ��@�}�¶��.RҊ"ΧLi���㎊�gz@���b=
@u٠>	{�p+.�p���q{u*&2
�\H&t�����3�=��i�n�:��P,��(�x Q2͍-��~���4�� rB
�]��o6�������
3P2�����bʅ�\x
I��:-i��Ve�S���Z2"	dW&����a���Ո\`��f�B�!�S �ۆ�ҐDN�P�b��Vڛ����sX�l�C��1��0���%���N
8�P1���9��%[`;N��0�aoj�KIJc�T�fO��:b��;s�g�W"������+�%�Uq�8����^I�!�"�]��{�cټ��^�:�i
,��FZ��\��᠃-8��vD�ũ)�+�OK�e'gS`(�����A�ј�MW��Oh}q��<&@���������2I�D��>�e=��t�^���׃�h�]�~x 3�Y��ئ��q~E�"7����;���0�8�:[s>MAo""�X�_͇��\�0��'s4�%_J(������(����>���`��?3��^�+�<�%~q���0L��t�G��(2Ϥ����h68kӑ3����k��]<h���S�*ZiA� 7�@���f�\����1�,|�W�m
,QÉ�DP<uY�Yj#��J4�<�CԻ~E�T���>Ƃ8��d�a���`�*ΖeV9R�����R�����s̈rE{b��c�C�D�v ������XY�-L܍��������&MC�n��V[���Y��6�K����j��,���$��gF��jR)�K�=rJ�H�it�/TkALx�TFq)f�3�[��c7R��D<�>��S�ى��$��w^q|��F$�]�@���:�4}*S4	V��=�l�o��_C|#��ĘN]�S�v�7�V]z�����9c�_;�`HZV�t7�v�/��oљE{�G������ݚ7˪u.����A�S�r:9����i3��T�	ks7FǇ��=1SBo���ҵ�9c�UNiʦ7�Μ��[Geo>'W��_w�Fx0�܏��U�}g�.���/�nta꫘{"}�����z��a��\#uI��%dd���j���Hy�%,��Ț�v�fYc���p+j��LAtYL�r`��Q]��RZ
�c��I'���R��S�H ˏAq�`a��u���Az��٩�\3k��ˆ�M����"�G&��m�\8�}��xI�YZ1Yy��n��Qjͮ���������\�/4Z��a�$�m�t�"�r�^{�u��(K-��gwwg�qǨ���j��%i���h���[����M���6� �bJ�E�%�͙�Պ�i&��&lgF��������Hch�w���Z����o!.��
웘���n�,���o��'�]ِTᱷ\�T��Xñ�4�f������ۮK�K@����osj����|3��/l��l�Q=tn�Z\l��z���e�/�k@��X���00]��s�f�&��O�Cy�_}�������4������VH��0��2���ץ�+���t2t�Yz����}�AkS�\#�B沓p����ru��3iVz����"]/|��X�rc7�?�����'�*@۾��Y������f�$k2��D ڹ���,|�VR�P���v���2���~rU�^�LKY	�� �)�W2Fnt����5�𡫺VE��@��0>��G��YOmG��^#�DH�x�YGl��L1�W��3'5��n��D���Ɉ�Y�h�ur�qE�|���0�<Q�����C�$9�0�
[I����0a|,,s�d(60���޺�#�|iq[��h\�����S���j�,��Ur���� ��d|2U&xoe��v{8����?u4t��;���߽^b�0���D�js�i~؎*����z�j�m	�6���1r�VY��Ldފ3H.��o� ����y8]uK)�Ӕ©�YN8l)@?����v8Qў�LF楮���	�oR��oB�I�LN����7�]~ ���ֵ���/���a7��"�>�� �N�t��w�b���-�8�nE;P�e�������Y�^C��x���M�ԓO��m�ډݺ8w�|"�8������xE�m)!BC��$NX}W��v���K�g��L%��;��f�:���);���'_��gW��ӌ�f]ޙ����~gR��,S=l?�����@��^�}�Ra�N-��mH-����t�PG�ߒ\I� �<xK��B����l�M�.��BE+��hIa�Oݸ4��»�^UM�Z&բ�. "Ih	/��JM:U�"N8�)q~Un�b[z�����po����@�GI�NHܾ�P`.%U�$��W";��k��i%��Q=Y��ʹ��GX$>#���!?�'�h^�·R�>Y���k"ϵwnt;��Z�*�0���sL
�g&Q�$(铪�R:^9��������!����5�ݗ;� ϟ�a��իV(����W�@g*�Y�͎�
gY�!Qqa:�~�)�b���^���-Otr,3�6��0�sr&����nW=1�!#���)g~����A+r�� �	��^�p4�$��d�_��]C)����˔�^����W/G`�x�5M�6h���4F��܍!�ơ5�W�+��	����8��U��S�����	'	�I��רൕ���t�j�g&�O4��H2��⯑T����c=I��R/�N
 j�^� �@���О�JQz|o|����1�
%#��݋RM�����q�Dғ)������z�9�X�H�"���?��I�1sGj�"2 �c�r�5s%�����b%b6�'y�|`���JO5P.e`L���8ό�2���P S�������L1F�!);�����1!˻����4�|�z�C�xn3��[�|�P�2"?�jc��B8\�rsJ���z����[��EJ�}/c�J��h��B���E �16��_l�o��ao1�� �}�zb�C��pj��'�w�npJh5�ư�4���{*o��l
_N2�t��nL_��r���|�őfU=��[r{� hV^u���m��gcE�ظ�X��)�uR9kkJ}}�~��/�}�J��d�|�h���C�+d`W/<g�-"�    I�Y)y�R�`�3Ь ��������еq�d��h�E0"�H�\�c$X|�𫥓\�k`3�2�LD��c�k�R�@ɨQJSсG?�䎔B�4[8�+�݄E��5�ݙ��k���_S�����q�y�r��g.���t�T�_��т�IF�VX��U�갇ި�ڀ���)m���28ɪL�dգ2�s�*�\o 'g"��h���"�I�[��A���6�ß[��7�7@��g5/�+Ӌu]��Ǖ� �~�9��8��Yj�&QQK���nz�JL�XtW}ӭ�d6���V~���3�1�y��h�؆ӤI��e�!��M(�"�A��C��,��˓)4b�� y��
T&���6�-y܄禟z8v��[,d�ZL��=Y����^y�{�f�KӼfqj���&u6Ĩ��wi��@���XҚ"�r����;׊9I*t��-o�a����tW}�a���M/�Is��h2�&��(�[�&�+����s��_臝�UW������дK;%��[2��ϔ���"���C?V������?�Ǯ�v߂����L���m�)Ln3�)��n�M��U���>N��M1�v?aIޕB%�����NCo��)l�������o�8��ݞ��|A[B�a<j�_������`�I�+�ᡜ>b�-��)��MS�y�L����=6��6��^whƵ&�Q��Z6=����韣~�V{��@Q���{�#��G:���g�y�x?����������v�E~w����]��;�~��7�'����dj�%5�ضm��<T��pyy����.l)�5\��涝ۗ.���F�h�h�[@_���ff�U��RI����пt���O[���Ӕ�G%覽L�pV�f�:N:���!�/$P/�hwo��n�g�tRi��������q��W�t1\LW Hݚ]���BP��|~:M�Ƀvl���U�h�~�ޒ%Ch��*'�O�����jv�?IکR����<��nVsP����C˯i(�Z�捲
9+��W�\��C�3��ܴ�EQu�D�S3%�>P+k��W�opM��g�� |p�8|O%�Į��$�̣J��$4���_j������+1�D\��?ZՔ�t*��z��T�\�'��5��T��Pi9H2�(iQ(�
�f!Zy=6{3<!�_A�,��S&F�g�6���LH,�\�1����`������܊�I\�,=u4���漀��9�p_��&N6 59�;Y)����b�߆w���Լ��fq��r���NZ3NzL��GZ������!�IgLS#%@ZJ��Z����<�2�����T��#���:���n�*��?�+���w��q�^7@�M��2��5]�g�żP ���v�B�!�v�n7��}�0�]�_�.-8��H����h����>���:<g���
a֪H��e��x�5����E�_�p�i�[�8��������c���9"Q��%R�*PR�`t1�d0��
઀��*��2�DEX׌�`�&�n;KNx*��P�IbN�ȥ E��a|�T��\�����i����N�e�BS1Z�&T��jc Kx��iS�HF�e��}���W������n��"LG�%��\zYc��h�$�Tiܗ1���y�W���mɘ����m瞒1�r"�mQ�dD �/�m����&�7�"���Y�/��ɮ��Rϳ'o�W�9��vx�e�f�k�D�[|8�>���n��\�!Y�bfeN� �a��n7� �N��k��S4<�%����.�{�۾P������Ľɒ�֕-8&��-�L��G�����إȗi���zxһ�םdh���U�2�2+��&��?ї���p/nD(��g21"������ֺ����֨5.<�K�+����Fvz>��h������R��.��#2)3;��6X~�D�����%3��n�ܐ��q�w7iv+�,�+�e�D�J��;:��M�y{��d�گF;�r�׎���v�ϛ[{�.��]*H 쨨�HY5hT�Sʀi�y	tJ�{��(mV�W��/�WɇU!9�$?��tM��F��6��pF)R�EE�.,��'~}�E���ۈ%G��Q����|���g5�Ղ?(�!`V�}D,�DC�����������0��;�[<-�Pw� �'�`Wj�V��Eƣ��-	��R�/}�f�Ǟ.h��Xg�SI(n�`6�ͪk��O�M��a5%�HDWS]&�^�׭~6���X���}s؜�[һ�W�z�	���:��3KΖ� ��͏����X	�6G�6���!_2ǍX�i1.qy���m����>�1]p�c���,��;؀�r������w����׷�.�gY3�Nn4��%�\�U�P>$�����xj/�F�H�;Z�*��fT=,���a�V"�iJ�����֩,�)W�w�o�by[�3��pJ�P\�E�}e|�H�ujGMV8-HW�,u)��Sg���9��,vG�%���3uN�=�ٝ�@�8p�Ae�|��_�	G���1�307p(�s[ȝ5��+q�q�Co@""
��̈0H����!61��D��L"VjRQ�8+�
V�
%�܎�7�Q�t�7ȋ��(�w���z�m��f;1^��a�������:gz�Jd7MM�q�붙�{�|R�~ko�d�6&b'6����mϘn'݊�"�.�+YK�ܐ�C %`�VF���ѕ��"���e�>E�����Ykg��gڽ #�i6�MN@`�A�'�(Sp,�(� �3���d�z��;��T�]	������eԞ+����은Ib)e	���} >r�WY��"麇�v��!�)� ��X�I�\`�-�	�ݱ���5՘l�F�T�TY��Gk\���h ���j����*��p����'�ju
{`�d�Ю��|3ҭ�6\!���\8�u3����\��6�>�%K�Lxҡ����׺Z�ٲ瘤�����4�2Qƴ���.��]A���	�b����U��	����+Y��~�e3��:hZ@�2@�e�Y��Oq�>*?R���h_ף�dԞ	�u�V����G�x�Hlj�?�\�bwki��[F@W��y���c�˪��[,> Ф��a��SU�}3O7�l�ҿ:,�-�7���vz�o*P�4�J�`s��=��#�L�.3+�=��Vr!�R�(���%-�r�N���l�a�o����&;[�.B��LuM�km��X<�Y�r��#Ֆ��,����F��J��Z0��K�9�|	D.	lH���F� �
ЙӚ�y$ٞ�{�;	��$>h3.Z$)�F0�#U�$���r�
�S�
Tt2DM)��:Ǖ��{�=�>�WU�8I�YGm��z�"�R�����za�Y��M��)�f�0m� ��7a�Q�d3'�ԓn'���`j�����F�_�h%&_fHը�/:5��Q���y��[�2{~��T�Yɠ��d!/4������9ݢ��|kK�g=�c��o�w+۾wy^��2n_������9$����f�>$iJ�y�E���c�n�b��G�N���v�� �(n�ȝ�	69^O��qD�g8le³��Z�=O:�JV�Mmw�T�+�5񔕆��N����*m�p���LŲ )�V�3'�v"�3@�9c.�����Ȋ�q���+���ז&ɫnd-�˃���dhD�E���+�#Pj�j�\�U)� �����*��g�eE]�F��0K�T�4I���;�-�9���]1��i@<!��o$�lI��*�,J��ڊ��pCv���$1����i]n��]�}��#1��ܠ@���L�m�p_.rm�S'T��A��XJ �m��o�߭�y,v�*٭���%�:��b��B1�L.g0O#F�2|}fo�,�C��M}��-��w�XlK��?MJQ��:'ǖ����)��O.p3:���KR|�{�U1����-41�w�V�*�0��|�3��RY�,$+��2����i�-w�(��*�f��1�Ӯ�T)
�G&�I��Td�Z�b4|iԜQ�;c�    �B���RÿCP���W�gNE�dUڳGM���)Ys�A;W�J1�!�DP�Mj��1��Eq���dl��C>6쉲S��W�?
�;"&��Z�]��8"�5FŲ�Z\�4�q7#�%��=��m%l&]��\�0I:x)[�'b�����G%	/���@���"4)ESo�?6�I�燧�|5�!/�Ntt@���,]k����=<Q��w���aY���О���z��RgɹU1iU�_����-l�W�}��&�Wk�_v���+]Ԕp�-\�6�q�s�0�!��_�(�bl�><���g�5�<_[MM�"����/�)(w�˘J>4��j|��1�Dq��v�nc^��ǝ��ӝ��KzK~�ъ�k_���f�lf���ub��?N�So�2��8�����a솣���%x�U��f7QK������x�N�8��j��j`��S{T�g�=iD"Z��5p��~vV��i�͍�_��pK��1OjMY�/n��+�]�����U�k�oɆ����C#'���v�AnE�{J#���`*�h���n�ON��8�����V�"(�_��$i+�� gaY�b+���H��d�t n�"T�G�ݎ��a!�&$)���U�T���MĖ��</���Z��Aǹ��{GzIғ�
�$%He�Υ�lq�|� 
P�aR��EI~4t��.)�(3%b���cາA�4�F�x��2����(�h���
5�'�$�
g��1���&�|�ɨԤ菒��/ə��ޜ/~���7f�.�}�7S>�{��Bu>�C���7c�"�w��w��rY���5����7�����d-�����+�r�����Ύ2K�3)�����#�e�=��^R]��)�&���~
�OM�9�η)��Wa��@�Ϳ�������:c��v�h܆v�.ޗ����,�Z�tV(��@i�L�#�+,�+�Z+P�E�0�`%c�:�97�����v:����01�(�+챢>��y� �+,?�Azͨ�ѿuQ�U[��DE�GMA��	��Ɉ�WX��Լy��2�<B��M� ?"����IA��a��J���CXT��JYq
.|����vB���$�G�$�&l!<["mkE��;\�AJj���E��#4�pʮFo�&�g�D�����w�O��t��ˁc�pV��y��4�\a!����Y�׍L��z��W�	���������60;̚���q�ב�rJ���2H��=������������6YB�g[<��J##X:!����ꆿ��Q��o��@xěpW	���Hw�zGkh�W��0p��Kv�-]�������<�U�#A��l��L��q�w.n������X��ѭz��lZ��CmB�4��I���0���'�%���/�Ǘw�ԱOv��~�/Om�q�B�"�0��zBNF8��]�h̪�(�`S��^u��+����)Y�Q�4g��K�S����@�V�e.j���Nx�J���{A�,%�괱��kuNE�mXu��� ���H��T'���8��R ����U/���	au�*�J��=�h!Ĵ�+�
@�1Eqt�[��)7zd%Hf���$ㅤ�R5:�{ �Ü���m��%�^�G�������!��W�6!n�U��a�U E!�r4�� ���Z�_Z�L�{Yo�m����WAa�41}��|�=+��0�ўtꕥ��z+*_�28�8�d���7�c�E�&R�8���b�[�@s��JW���o}�&Ջɯ.�cw���sW�p?Qڬ�]ʿ��n5P}�t���]�Ǯ?���{��j�Ytr7�e�p�v�|�:�~�H��M����k�ºz3��P��$=|�eU�����q�"5<@��x%^@��ğ�w�t!����Ye5W��	α�I/�Fθ��2���e���+���G�P�!/uGJy\��|��Xx"�%=O�0BE���<�dcu���Xn�$��sT�U��N�sZɔ�O�l����_�w%gI <
�(Vr.�1N�I�����[�X�8V�� �+��v$�Lj�f":�/2��\,e@x��w.�-E%�
{F'-�W*ƨy��c����N5A*�οC�W��Y��W�4�;�}^�������Qg��I����4��Lrvk�]��Z�D0��T���nV�af�M��RVk�@�f�s�&��`5��nC�s�w=^�f*�����[���ǉ����	�H=	v"��x�]:���t<Kע�#-�~'�D������~u�8��~��;�褔���h29�,�{�rj�O1R�-9�mUU� )������LL�/l �7-A���)fk��i+�-�:��j�N���ip�R���Y1�"-y�;2%Ӟt;��0'�6�&�$1�g&!|�U����T�=�sC*�*fF�|WV [ M������q*������)�^��E#y�DZ!M��t{\ ���{2����,�T<5��e��(8�X����vH9L�fC{+��"��mı?��4��K�����G'$�<w'�s4r��S����^٭�������mg�Z���:���l'����O�M��=�%ܓ��?�MR�z�-�h¸<�2��f\^����ʒѢ�{l��+}4"�(|nK4���=�;7TG[.d��9�p�L6\�� «$�� "������Qe<�]�<���I�{��Bd;m��qa�<�ߺ՝ۂ����L����i�%¥�����~H��e
����� u9�D�,�H�0>���ɧg���F��N��c�����$3%�F-�?Q^�C����ڸ�ሯ��X�!TW�!��󝈤���B��s�*`(�ʨ_rG �V���)��U����p�2 $I�.����H��@���8�I�e�W�C�@��g�qr$Z',�d�REnL)��c����9I��(��A*eer~GK͸�{s��w9]mⶄ\�i�L��pH#f����Y�J8�j�y�J���dl��RhF�F[�%p^����'��z��"�U���	����k��!��2(G)��1�
Y�@�����ŗ�S��Xy���v��F���0�H|�h�V��0W���������t^�l̉�����*Kr�g榿��<2{����p{sI�!8�˭F���E��-�f�{=����{���EũYo-.۴l�����R���z�9���-Hq�#0e2����vou1�}TpĲШ����G�jbA,���GKf�L|Mݜ�@5xlO����$���w�K�h���%'te�Wv�Dy��S� *�8�1rQ�u�s��B�=J �<65:n��sPJ#�v��eO�Zp�m���9M�C�
����%�;:ܲjJ��c��'�H��$͵�X<�Y�*{b�=�4DE9�&�@n@F��C�U�^S!_�LٻB����.	C�T����*����3�b���+tK��e�.���<�^�a���@�ON�t�w��apǎXΒX��lI�J��ᭆV������Q�,�w���D��h�H�3��0���e1�y��ؒ���ϛ����>}��}�a� ��6�ݶ��v��,��k`��>��;<�Q2	f�Gx����S��l��㨀s�g����#�w�~]?��C'�]�Տ�>i��z>�">u�:����qB�_���_.�����Hb�7���ǩq�Ϡ��A��7ӄ���u����1�,�3tq@_�L��2$A��}�E@�b-+@���S�&e _r5��C��(�Tb-�SL�5��T�J:����EeDP���%�x?
�P�$�Z��Yh�9��)"�B���W���f_���3L��p�0z��8��٦(�����M���i�G�rv{�� ���ǀ��TL����*J�,T�L�zi#��������T2$�_�Z���$�+�
�F��=+��D7�W�� �UO�(2*�����t#�JkNA�T�+>eH�H7 �Jv���*�����7��F�ۚc�L�B|`1q}�A��Њ�2��Ag�6��>x�g�Y[s-�w�ݫ6͞������ޫw{۽�D�>�ch|�~7d��G��p��|k��C�N    FI��S:@���*\oa��`� �B"�6���d6Fs�-�
_�C�3���>8�c��C&R>���I	糡rǩ�ʓ�g"e'x�֦���4�d��&�;dsN��V5��(�	m�	�=~4��5D�����۰��f/4�:�oofJ�{�Pu!φH(��^���4��L4˻R��J���U#"������������4��5p_ܰ�c(uv���gV班���id
��� ��hQ$ ��vpع�V���D�.��l��~�^ݯZv
Oof5��\�;�-���F���b�au²��nÛ�2��Y�����xM��c��S����Et����?��������	~ޖ��( ty���r{�ܬ�#�����|/�D�ے^�k�J6}�Cz�}�0p�O�~|����ާ� QF����l�t(����6��.����p�׿��'�,���H*Ѐ�e_�.��5K�4p�~ڋ�x�����Z�[z���5F�@+�Q�S��_������.��M�tx���/K�-Q�#K}n��r}����1����iK��K�3�3.�$������>��|���|/eo�.�p�6�C��PV]��	�~�~�O�y�^�ˑ�0���@�3��#�E�ɠ{���:<���o_�X�wa�2�p��_^D��pÉh��Ɯ�H��&���������J{	ЕA�"���<R O��a�J"��jB�, #road�R^>��5	�N�h�QM��̪��K�-���#����i���DS_��R�0@d�V]M!Ť� ��u>!�(�
�`����i'�q=�!��
�J��LgA�2� p���,���'F�<r�TF���Qi���4�Vҥ�J|�p��@��k��f�R&~m��>,KJ��lI��b�Mx1���]D�&�{�����ȭ$�'"F����*Qdj&�4��bH�T�����:O�u�[cM�i=�X��WA?	Z��+�;���ߍҙ:�F3�}�,m�'����*�t/�|�p1�cU�p�������a�OK4�&4��E	��n�q�!a=��u��陒ݙ�ö�=�I�!�}B��Ò4�Ӡ�B��0������6S����Lۡ�?�]'��gh�a�_�<���>d!_�If��F���I�1'ǥ'�6tX���oc�Q���?_w���Ba%�T��Bxl�%N�p�Z]b$NJ�T6�3��H]��:<��mb#=i|v�%��j�4E�� �Ӕ^kIY~F�������J
᩸�D޵%dȴ��t,:� ���D����م�L4��p�U0�\�0�^JR���4�@�]��tsD_��D$�-vE�d,=����Dm�n���מR`Ԩ4�
UD
33���~j�2D�9�r�)h�yf� S,�Xu�;Y۱/�>�_��n�0�k��@���x��'�@`�4'ڂ��k;A�M��tC�+���G�����i�|� �<��Tr��m�iݰ�dl��b��Mx������0�%��rKo�P���gJ��@Mꙍ�dLY?4���b$c]� f�F^NIHVۻ�������K��q���a��n�����|5*�N�2�C"�* �����6����o��R��>����ힷ'���C���
���5�Z��l[�09��^Ýf���/��ܴ5AAx�V�9D��|�]����<��=�{��In��f��9	��,�&�^0���G�u�����TJ�{Z� {�#-B�lJ�0M*��q�MT��M�+g�Qy�Y�^g�Kf���BuE�Q;�͚�2Nv���|*���L�XS0�2MV']�6����D*��"��b��R�)���U�4��Q$rB(�"g5;��HB�p�&�$CMF�9�c̹��X�n{�i�LQ@rcTΒf���\��[���<����K
<��,_I^���UH��.�+J Pݒ����ۗ;X?D�O鶴h����|Hx�?E0�y���
/Ļ��Z&V_��<��)�s!C��lǚ-�D�b���f�����7�u\|;n����
�:�ǯND�6��[��j��BE��7�E1w���pKٮ�퍮qct��Y'a̷]@Oё���T҆㛉�^���vw8Ј�М},�9��.���j��QW�˽!�{��Y��
�6�9�Xh���p�ߎn�rZ��}P��0����DR�yV�n���
%�覷D��37{���}?J������!�m)�I��p"�ƹ:ZI�,�bޮr�ښ���۸e��Q�͈V�U'�%�)��+`{�[MB-
����FS�z~���Vw�'8
C�Q�d@�`^(�M�"P	\�>��#n3��Ű��o%pHݩ�6;&
E��V�hT�d����f�)�dU$k�u�F#�s�ͅ]�����s#@̊��E4�Dl<��\&��LZ h$��$q�iEP�0Q���JLўؙT�38��=<�pV����d%)?Z5PP
!�QkU>"�ö�83M����Ck����?�&<��f�n~[��2����D�lS�/�gZ�E'_�6nVs�=�3�ʑ�〉G����4�4,n���ɏ�`^��UH�թg2:����X�l��CI�Lz�ǥ��9���Y���S��S ~��{�=�,}��Iθݒ3�N�n5I�US[st�j�c5Hfa����� ����F��� &A��4�0��t�~�V-���8q�R�Z�?	�$����jF���dT���P�a��x�9Yɱx��a%a,g��x>��F��������J�*����=�gɤ7�[�(a��3���JD_SaU)Z1	R=!P;���36'k��"KA8��E+aj�;)�RS^��*��p��08Z�
����É��UyT��.f��������rݸl�c����b�mSy�=f��y���Ze�Ż,9�Vm�'Ӄ����繏Ʒ?h����m�8L3�Cy�nL�4QK�����H[���K
���~,�l�.>`�}�"�V�I\0�j1u�r?R
d��X�?'@��u&�rP�x��	�(`hB�:|6%؎��N�:�q�N�LG��0�6��pqd�//�����zp���u��m��Q+�:�b�����eK(�,�z4Ls�	�>S�zi��N�P��Vҋ�:�����'˃�Dߔ�e�r�� ������(W�)���ߤ��� �L�D�i��MM&�$x����<M���eKS���I|,��V������$bAԑX��t�[	 ���C�I&*��A�u��'c$�k�tXIg�%-�bBI�K�ƀC���HTԍd�Ivh�K
�کp�|�ܫ�F8�(�����Ju�G�?�lI�~V�g���\|�� ��q8Ȍ^��]���O��N~Vmv$���]�+��1���V��Z�{�Gj��K���ۅ��l4�v�S2�)��~C��K��m���rM�ޡAi.=�2U�Q���+R��r�9���&7�^SW��
�x����w����9�7ꮛ�5�e8���y���(ƨ��g�	�8Ym�B��Ʊ��)�������x�@�DD��+�m/��5�^�Q�D[�_ԚD=��!�� ��Dwa��4�$
�{��i<��aF � ���:x[-M����k��Ip'�eQS����vU��*��g�D���ွe1�%�36$;*;S�5(@�Jم�r�/0�DB�K�dQп�ݙ������tv�s&,��If�c"�ZMR�K�Ű��eU+�Ҍ����&�p�h������5^�����5ǘ?'�;teo/l�$�|�<����Zf���*�}�b��Kz� ����A�a���󏔓}�y j��,F3>�s�=sw�Q���M��b�?ǹ�!,�a�ߡ.�ɱ���_r"+��țE7���r�/�1�~�L�7�FzV���)���G��.*��a�[9H��S����+���ݠ�v9n�0r�Z��0�����]#B�G���?�߶iH��P��EU�R��:��
孱�����VWӧ�%JOi�@>�L�.�7� ��a�<�e�Hwꄟ(�K�p�PՔ�%��;�    0�<
�����_����;�@���Z��}��I��We���b�{�&�����{;v����ߔEo_�CH�⏯𗟈����,�=P�H�]R[��s����� ir����i�Ii�K��ͦW&$mt �`2���I3+��T^OA#�i%��h�c@���T*�J�Z�NE�8�*cQ,�q�44
8Վ���$�uB�B��8�I�\)�M�J9+�p!J��T��0cOȂ=1�o;����9E�DP��j��Z_(����p�4�"OD���fH*��}R����B6��� ��D&�l�D0[�j��1$�Su��<����Hs�h��^ݿIC_��c�\HR��ץne��ړ������<yI*w0�efX��>��^xZ��k)��Ri4'M�7WD�R�c��8@a�$�ը�'2Y��?���\�oŠ���#��@H�����Y���s�b�>�@B�	�J^��c���׭av��l�}��ߞhI���/%��R��h�k�1W��K�HO��[l�}Ӷ���1u6�v��j�gy 2ԺD�^���{�����>��l���3�tF;���?T繌���Ix �O�ّ�s�\2��gT��F��P,1!�-��H��K����;�咶*��
w�&�4Qx;ۛnR��^m�D�� zV�V����X����X�����I1�����u*n�Ԧq+QT�SE�/�|�c��hV|B�a�d�5��a�r��e2*��i[�:��(�W��C(�mZb����%������J���Ud�`���H��_�P(;%�L(a�Q����˭��K���/��,��œz	��b�V�g�	ْN�^�#Lh�u�M����[=��ٶ�2�m���p|��\��L�ӒZu������(�����LߴL{�7��z����D��ꩥ6�K�����a����F��!'��W��.\��: zG�E�=�Y�/N)��J�:yJd��s�.6��;�ǜ;#eΉ��ԎzNMu���c�#y׮"t�(PFhEոY�<��g������縟8ϐ(|}��%&o���|����k?��Uqqt��|`�K8!-�6�!"��@?e�f�}�^Wj����K�M,i���˩K�i�t�8��b2�
FH���%*����hY�I�ìD%`[�,6�Ĉ�x@kAI8��sX�����?�l��Ɵ�ĵFHru��;K�T	,K:��'M�^;j!m%�M��ps*� {a�W�����Fi���
6����Tq��U0���;KD}%N�p�=��2y�]b�� Խ*-�0q��(Lن��Ȟ�u=�-5ׄ]�H  t��.��.�NPn�L�z��ٻ?'P�h�뉘�;:�����q�ˁŵkGP��_t�|�������$;G)�Y��nG�S��e'����
����߾��W#�_�\�Y�;S6����"�Gd4�8n@���X*��U?�*�;�\
8^�9�
Cl�c=�j0����]Yq����ZV�]��K������M��2�?O��k���[15�~���k� �����i�-ڸn�ϥ�Gْ��tJ�le9,�%�mƁ�h|��A�Ͻo��P=���go�y�� z���)�gybk_�BV<:s֧W����o�0���E��������S�$d:�Z�!��[M=���.�� Q�����3%S��"F:�lG���E7���H���J�D�҄���d�]��&��d\�tђ�A�A��V��\42����'�)Ϫ�9�qV�2t	�G�2.j�D��Bf�W���Q���yc�J�G�gƂ��`�X��F;�$��;x0㵪�HPEx)BE4���Z�����)�)�� da"��f�C�T���hj$<
>U����$� ���f8�Y�7���Ux^�}�f�����'"�Q���Ԍ�,�p,�D/_���=*�0���dpz��밁�Q'u�o&{�T���`q�����kNǓ�_,	cg4y��t�����z�[E���H��T��J^��p �qy�Fo��~�~���k�"r<'��M����o��F0d�zMhn��mcc>}�t�2�K^6�/ ��������7����?9���u��S���'2�N��7Ί�lI���Z/�}zs}�����%v`g��jj'��uɐr��z6m0@��y�\`4��S����<�PG�ND��: �.�
'���R+
\�@�&d3����<�T���R�6YE,;d�hG��v�$�O�,gG�B*&�Qh��L�s�3c�&!�{im3A�8����'�r	�L��E��+�
�9�+c��G�B/�T.�	w&��DO0e�A�Z4���T*h_8<S��wNж�<�-V��-�:M��~�-T!�j�s���m?jl(�B���}�4�2~�+�[���>�L�,�6D�z�����.>����O��Λ9�!;S�;wY�u�9�z<`��`?�u���>J2��*�;���e&ɧ��b���P/Z�k7���'���p2k�ҥ�&+��}'W1��EqsxH+e�emn�DCޛ��E�5I$%��D�0�7t᫶譧k����a(��16�=���)lY�mқ���[���K&������G�y�?H��Ԁ��<�P��Rd�R�w>&R���TX{��Td�ⅎ��1���\I ��^쳅��	��`�K���"�W�&{XRC���h0IW٫L�҅�(;Ҟ av
�5K�Y�硨P�Nj�w ���e�8c��<O��Z'��Z	 um��񬔉�"�ӌ6$c9Z�{*�Q-C�
g�HD��,�v.�!�A ��EaH+���Pj��!����=� F\F �K��Q������	�a�<%Z"�5࠘���x���L�{��R�\L�ǻh�g��wi����=�>���q�&s������<߿S���r;�����h,/׎g샹IO?�����嵀	Nݱ�ܝ{��W#?e����.r��]�Α�Pg�	"yWyM0^�H�BY�v�E�Y�`Ҥ/� $��7/������a%Vt� �K���v0^�i�U3� 1�T�5��Q.�g�9�}��}�5Wһ>}��t�d2=q�n�1xkm1�̚�����ln��"��.a���0�|��d!�v�'��:j<�&CVVQk%nl'"�J��0l��lv��i%��3J�Dn%�4V]h��� �e��#�IҎį*"���'����6��-lmM���v�!�L/ޔ�8�H�y��tc��q��hu���}��Q!	bzK�͖����ٍ�[�S������=��ҹ��h�������&��F�/�=��G����8�4�t��0���/�������w�wwoZ���D���8A��a�5C����qh�>����D��i����HG���0���TPse\�(ck@�G8�6*�L�y"<݃�r{3H-��Vݟ4@0�-a_*���i�Q�z�iR��=K��<㙢]����<���kQ��35%��+�������%�bi�{D-��M�w	�7�g<{�.�$,ꍅ�H�cśK�O�m�+Pʚ���9*���������`���І���+� r��hk
��,�!8�� �3 }*�j� ��T{�Y:�k�T��)~m �'O ��+��
@�^+�V��UI��rU<J�H����_�C��X8�ɴ��L�}$�� �q�&�J�	�D)����e1Lp���mzO��']UE88i��ɪ�q"���l���i�𫘨xȕ�Y��\@���;�F�8s[`�^��@�9k�|��s��ɯ����t���GLTG��k3sl$�1P�Mnh�����2��B��ox9�KZ��ޏ�F���L��!��	L"��Hr����c�a%8���9�Tʢ���&[���$�Ds�F��%Qӑ���܎��z㯀�à�6e��_��ӡ�R7����g��jq�N'��m��9����ty�-^�M�ޡ3�]蔑�u�!M�.p�W9zZV    a�����JD����0��IՁZ$,9$K�"Z��BXea_���P�4w&�
�(t	�ȶ#=2�dj������C�j�)'�3��`�Ԩ�<Z)SZ�SF.�wOX1ʸiOd��1WM��F���
�:k�1��u&��ctF������=ǂ3%m�qL�Ɍ�YU�+B�HM$���R,��z�� [���P�`0�2�=��m!��T�M��hxy�>��#拘��D�C��ܰ3<y�8L�E�z����j����a�G�/P�l�o�Bv{y�^h��=��x���a��<����FA'�x@t}�⛯.��}�gc!����}q1a5�*��dkv�ۗ�Qq	��Q?���v~j��� �q#)d;;}��R>�L��[� K��a�gU/OI^]|U���i�ţ3;��Z�!�|D����q�F�O���a1S��&��Oj�կda�
L{��mՎ�2�SW]x�*����$}m�L ����>�]|;1�O���IԊ���0����᱔<X|G7��sTfy�1E!�\�ˤ�u��&zT܆q=���� ��7��~���v(�u�zB������A���R���������A�%$�l�R� ��>(i'�NDMOzC�d�����Y����:(�
�I���ې�N�RY�NQ�N����9�t�Js��"YN͘�YR(�#�T�{$	ǕLm*�d�`\�Μ���d��3���]�**Vj�����.'�P�g�wN+�<��� 
���k[s-ZSЕ��c�>OOx�&8E-b1I�"�PK�#�2�I±�($,P�����t�TI�`��NԜ��KD�W��ŗru�dݟ��Mk�y�����e]�=�ݡ���\���F���Sc7 ��m�]9���� O)�E6�����'wc̿��zsv������[���eb�&�w�����t�I�㇯/�BzM-0��qA&s;u���e3�����xz�e{ƙL�6��J�{{֙H3Y�+�5�C�瓲̓mj����)�5�4���r\O#�^M���X�&�z?�������1�7p(�-,C��Ƈ��6ƙ>����38S-H��(X�j4�|9���$
j��ߚƋ��g�Pװ��`�:��-5٬"�L�CH�)'�Ni��5z�C�;jb6i���qXI/�V#�!+��K��`��>K��p!(8jNU��H=�T�������v�=�M�2"�!՚�"�5���xM2da��+!f
�.&x�3�0���!���3ZF�w�[���.eg3c��)��t�:���!�i����ٮ����v~�~��l���l5�3�ms�4������6�iڎ����4ǽBS�b�4���Պ���^��|\b���=Y2u��c��	ZzC)��$�rDx�Z�8�:=h���}���m6����b�c���x�Ul��%��k�u��]�\_P�4b<�jo�wŲ�9B�9(���"�P�������)6�d�����W߾<Sm���D�4��j�nl{���$W�����u���H�4Qԕ��O�H��
@/��r�yN	��L�;����۩EM�$��T�=��w�z$�0Xe_9�t��>� ��91�	��H��w�G��Ȣ��Tt���Ԃ2���K&q/O�	If��	9OlBV��{"'۬s���p�*2.y�:[d/L�.p�O,A�D���JB�e묑���_I�m��'j�DȓtT�qx�ȢA�$�ĉyv.x��8����t��r�͍���s=9g�jy�E���� ��٨5�qy��D@E����7����h$��B�Ӡ�j�y�2Rq$�����l!����:��Xl��F�m����1�~�T���[�OK�0u��ge����x�c��D�6A�������_�_Z��2����oƫ���^�o�l7��l���Mc�kk�4<M.t��}��0 �+�=�zn�~o���?��pO�R㯯n�T��=O��f<�DO���P֍��n��K��AW�۔�]?�7$�	�~�?Ky���&2�|�����].
3��qLj��z���� �~b�'���%>L?#�K ���E�*�ܦ�&)����h��Kz^Ή�Gx7в���U����ի)����u���$z���_Q	WK;YV���Ta�,��Z��X��W�D��C��$a Reb�e�Mh����J:�g4��,m�5Z	w�هJۂ�W���hRhc�ƶ/E:��#�*�����(������Ӆ�B� ��T,O0�����C����F8����GDs�W��7R�3�E&�!F�:N�Ϛ(���.񐥋x�X$�L��b9��;S,i�64)!4u]6.ەd()�m� �4u`�`ř�j��Dx����cњ��^�6�89�O��-`�p�Z�3��0~ʹ|;S�40��%���a��Z��x�vc>a���i�E�g��Y\ܜ�yIݚ�a{r`Hf_;��m�vrs�%�/:�g�xh}[��и�#�v	�8�қɊ�4��׈�e�0
�ٓ��U���*Ł��1ɬ��˹�r��v�	/�X�w"�ʣg�FᔊA�aWK�0�@�I�^Qٷ�M�'o,:���+Q����7�(��$�#⦖���+˰n��
��F�b"#���'�=.fq�v���Fs��F���fk�>�XI�+�@њ�D���Y�dݓ�j{bz�e}v��$�l�������׹Ö��}d%�'��,��vJ�	�4:�5O�FP�9���y���6�rR]c�#��j" ���7w��0/w�y�cY�X���E�c�בO�w���g:�ad`�)�	}"R��]�D�H����m�S�ľ$W��X;��P;2�D.w�j����jy����T�8Ҍ�ໄ��znC����!��"��)�_<����a��P�#���ru��+���9�f�'�.�w�7��_���Q�x�`XP/ࡡ:B�1ǔ�ǲ�Tx�{vF���ˑ�:f�,R��[�,~yyz3�Zu���U�g�i�)�܈�������;���B�jq.^�P8^��	�-�%�R9���!Z|8��,��Քt���̋���I�hF}��a��̵�&��U,�:����-���$�I��&V���PC�P{W�X��/��@]�"�@�q*e � *�B��H�N� ���Y�����ƕ�ΰ�+ÕVx{o�~]U�0N�l@�P(��چ\2����X$uWQ"kטH[�,� �3�)���1�}�&���t��%��,�ÊlE�j�҅(@k?�׿��y��n�1��d�i�����N<����$Ӂ#��q���K�G>��"XjO����NzggU���/`�o��K������:p���D�z9��؍�~����2,������%�ޤ��h����|ʀw����:�̦I�?_�=_�=4��V��\���	��M����q�N
�kɮ����T�xicJ�d6�����xʛ4>�O��_�}F���S��nu[L*�������{�*-�F�f�\l���IE\�G@d�(��(�S8������r�+Xmd��g�a��u-MI$��YibڱJZI��)�7�ג�WJ li��)؈h�!"��C��n�V�z㓀�67=B!E5�RJ� Jd&É(Si��tI��#ZS�zT51r�^I��S�)�C�icB��r0��E�<GY�8Q�^�`@JF�HZ~OYj�;=x�	M�^�MEh��Z�D��aR-���	�0�f=Ϗݠ4�W�ak4��������]r�,i"�}MgٚUn�ϷTV��@oB�3R(��"7ts���qo��~m�R8��ƞJ��с�3�ss8P���{Vf�D��l�X��j1@�
��$��
1)kV%�ZE�Wo�V$���2���>��8�b��V�i%�|o�0B��ԭ��U�E^R�L��t�1)%8t��#i�X�5J�Vb&�4��@Ce%��)i���:j�U���&0�#�&Yl�I�Z��tY�+����%�>I�Y.�Dx�������s5ES�H�4�2y�V{tƕ��s�hx�=q�]���8QNJ    #�x�T�,	
��"Q˙�g����8�=x?�4�W�<��I������ꀽG��bN�t��ie2�v}��}_�9�MϨ�8]�-N���[:�f�����6p~(/r,��:�F�q�,L�m>bH��a�r"6-��~ӉT��S#�_V���_��mu�n�����_����XO~�J���]���=�8᯵[�M�:l+�:Z��=�<Rv���b��^�͸�X�f'oױȚ�OI��Fx9g�|�\�6�G�t���Y��Wfe�4�t�y�#�;^�%gՄ&U	{��f������b�,���_��ޘ�Wk�}K�: R��)�B�Q[l���]mOzZ�J4�7��)Ef�sm4�[�h��D����)>��b��F����ӝ:쉛���P���ho=C�9V��ĀSW��I*Vn�Cl@��P��eI4z����$��zNl'�F� �ip�d5�Pu��V�pD�#I���̒棑&�xs�H��X|~]��:9z�&�G����pµ�)7�a��&1�!b�����J�(=�sm$M���_��XX�6��D34����	��������o�^�^I��=4�z�R�')����<]�E��(��[�������Zk`U���f̬s��˴�uM���c~s�������L�
b��ܮW�r޿?<,��>�2�8�J�N���o�R@�)���ƿB�ɻ$#��V��L��L�qQØ�{��(a�I�}Js�H�)A�N*[i���w�D���,;)���C�?
̱(%�bL{�	#�J!f�IM �R#i_%V����!t��(	�Wm+3&Ҽ�1}7�DOI����ň��6*-�X�@'�=c=˰b��l�Z����&9x QvI +��i�=�U�'��2�� 54��=D�]�%#LV�K��`�n&�3v"�[��N4Jg"�A�>���>0lQSl��	>�k>�<���r����o L���o�!Ms����]����2��t*�̍�5���uo ��8����\�y-�W ��nb��N׸���k�nc�lO�@-r|�ǻ�(��(+luK�|��=sJn�軿���Ǧ�pۻ���Kl�}~��j��Nګ����
~���<�<i�:�dm�����x�aN&�O�������S��8>�N^h��@5����;��b�*c�B\�@1���iN�����������eׂ��4Sc�����[s�ض���'�0��Bm/o���t���V�3R���-�,%.D�p��++���
�8���D��ت*�h:Vb:H�D���S8?MnK"ޓJ�0�%y�]��)�h!%.�����T�JlO/"\�# ,�7��l�L����"+���&)㒇�/0ޒ+�S�o+ѽ�7#I-��1C�4��a69M�	V�JZ����#J -5�.b���>��x��,4��Sz�;]"�O���RS��RN��cT�� 0��� ���fEl��a��4��1Z."����l~�rHɝ�1ΔD��㨕|�w��<�،�p�-JZ�!߻H�A9��g���loI�}�L��Сy߻���)�;ݭT�j$c���#O�����F4�B�}��ht�'�l���J�u�}���c�Y'�/��*)*m(��M��)�ȬԀ��B��bH�����F��:	X9 �����V����cU�v���z�Ț�$J��3%�G� �Vs����BrO����WG��{<��$-63�'^I� x�I�p^NIi��0
K1NE�d��ҩ8�o��1��dlwGt檨��>�ELV
x��9&|)^-�̭��pĕ��$�J���+�]rv�{�@�7V�h���F�l,M�H��J���C�҅�f��[���!z�KD<v�Xf�:�D\��=���I��>������ɳ(��s�H|����u��F��/4���^n���	��������7�Ҍ����p?
��tC�I���:|Q-���V��rϖZ��UwE����[O�0��G����&��P�Cɉ��2�������NjC������3�
��!�
&�S�Z����=`�ϻ ��Ӳ���K_�����=��)���^tZ��X�4���Z�������{uқ�_�	�_�\ﯦ~�F<w4�$�z�g���ef PwӒ�7�$W��,���``6�\GE�9qJ��:��8�Z�L�E��c�jX�����"xK-Z8 s��Db`�#����9f8�g&`U 0����o�5���V���q� ��MpٻL���lX�$�a��˱0���A1�v��8Τ���ЕNSsII�2��ؚ����IrǙ3ܑkB�l�Y��0�U��a�=a�ʒ�\�p��"�	
��K⊗�D�ʔ�$mƍN#"ap�s�L��R$/{_�?�>���'!��"��8��c�.tv��%m�����'|1�ྛ;��輦�Pb2�i����廝�5�.f~��<^],y�`��/���?<5�E���{��߇�r?�~�E���͢�&ݶ3�K;J�L��l��u�h��љ8~X�_L\[��f��#шK�t}>�[�Rt�ݜs��HQ p)+��S��9g���% �s�:��`�����)����B��q��E����̵�V{̤�C�$�n#�q��
�y�L'�]�:�!��"���c�h��W��&z�N�L2I0X%�
����=-K�$�){&qIy�t���b�����:�  MҮ1��#��2<{�n�\`�&���=Jj�swN`�����[9�z�|D\��U��4�@�<A&�%�\pC���3�-�A�R����������c�6�mϥM�|G�8N6B��z�_�&��mO�N�N�����{�G5�[J��o��d;cR^]�Դ޻>�ArvG|�ǜ}�=r�cvw�4:h�� �)�~�	0���IQYF��<O����<�f�#�S�y{~�r�7���ߔ�#��>���Ϙ�o\N�-[?Q�]|6���%��S|�CC�H��QKȇ���p�~<�\|O#zۿh��b^�jC]�b�}NT:'G7�3��h>�����������&9�+\
-A���Y���ϞB����7���������Б��gڎ1�r<M>}M��k���G����/F�#����ꃲꈧ����	:h��Ҥ��~Bq�~�U�L�;V��
 �90)\���2��������/��g��h)�b�z�]�"j�'r��8/��>�Z�50�]��}%���t�F\P��Dg�,�ԬU�I�7e��>�T��.Cۓ��&ȏM	����BTl#���d�-T	�w"�
�/�xW�*�&f�Wq_��'���0��TȀ_���̙���y��bv,�,�	Xa��4�8�ϪZ���������\Q��aezu���ĕ��\z_�#��/��������~��?%�x�3�zf�mA���	f��'~���S�����/m����n�4�k�U��m^��-�Sƈ�������v��,번7L��,��ts�ۊ?��oF��E�QK�]shC��ܳ�|\�~��jlPq���=y�*�<ݷ�f�9�=A2���pcź�ѹDAJ����n_�HE󳛧t[ƨĝ����� ޸N�X��%�@�$�[�N�O�0$YK��Q���a�2Avo�#Q�=9RʩNm��r��J"���u�'������29�@󸎩Be]�6V�}��K�{�:��s���`�e)����N� ���F>MJ�ľ��{�<����a%l�;U�q&����;Q��JT��p��Vr���<�x>pN�g��\;���JXN�vO��O�("[W�UKk�h<'���+<�p}�$<ie��X�)l���%��8`�ػyb��.�NwvDs�<Y�?-x��uЙ�~�i;��^��r9$�������6*"�zע�obV�o݂7�,=J߶��|�	�Y�1�4�j��d()̸��M%z���a�#>#�jH���u�g�9�%=<Mw�ć��dޤ�`b#�8��:�;L.����O��8L��߽���ob���:Jn��ԗ��� �  �}����n��3�zZ�ELRs��h�nZN������H������c8<ބ6�<�~j'#�qz OX�٣:��=Z���>���O�toc������iYr"si�y�[�jw�bk*�EɃ�Q��D���ǹ�҆>���D<}�%�2�/.�(?�n.�'��A�i��y��L���k>}Xk��t,x��>���H�.�<��\��橴�XLN8�Q�"������>G��#�r�S,?�ѓE�r{xZ����=ۙ$�C,A�N  
"�&�*��YSSj0,��b���+%�b%'\̘�SҔ��ߔL�9��Z�@>�;�?�QhY����V�J�x�_u�:0��j���_K㸞���"�(�51�lY���z.i&ZD٨�#�GIs�JK����}e�vwz^�L�R���X��,`��cTF�I��5q�$/�K��E�ŕrۙ�Y!9���Wڵ�6��=?ҥ-��D����]L��4@��Iٖ��u�z
���OG��D�[����tQDLE���&�Cb~�,2{���4d��-f%y-�o�(�zO19�4�c�ʋ�@y;u9�ъ�kfE�Լl��s���������g�֒�8z���&��3�j���_ڪGW���z�_�o�'�y�U~h���
�����z�m�7�t�AՃ��/��|A�*��J�>�J�K�ۣ2���z���V��٫c���!5��X���DC����3�W��{��K�����{2��,c��q���ou�A ��^v�tm>Zp�p�1��6�1��_V2I����0v�့�^�(*ɔf�[��ܨd%M�|�Y�&�1ך�l!D
��6=���s崋h��s�5�Q��#u�<��J&�G�!��Σ6��B��������FB���g鴷̱ �ɗ"8�UW2U�J�J���2��ɐ�i��Ψ�ĘQ��&15f2�cb��P�_��RJ�� ���S�l�(s�z=�řS��s�#SP�`�h*�K�a����r�D�V�      4     x��[Ms�F=ÿ���E@0�3GE�#�-�b)�J�^ r$" �0�~�g ��~�L�R��!�=����	d"�6����\VѢ̊���WQ=�UڔE��i1��<�fuSe�&� K�k�4�_�7����}/�����h�߀&�֌��*-fiӤ��zU�b�L�����Xр	���˲�y|�y���aU���,��5���pb��Vg�W[7�J�&�z��@1)���\�.�<�
��^��K���^��Ti^���Mn�"�i�&+���cB5�Ϙ�Y20�v��ͬ�'�4��t2���ܞ����eSgS.�ra�fu^Wٷ���df'OQV�KNɀh�h�>M�%|WSY��*�d�*�O�M��݂[X�Q��r����>R��0
/ڏ�n�E&(Aw�!I̻x������V߲�8��J$:7�z�fn/�b5	.?�0��so�o��� ��������x�.^t#^��O'Y�5��Ç�
!R��i���_��ﲇ,?�<�ʦ��)�̈́tN=�U>��>w���vo?ܺ�7�Ʀ3�$��~�I�!��?�%zL��- �E�&��:��\��A��_ܺ�c�A��.�q��/e���с�L��"&���Dج�*i�U��V =�����)k u��+>/�����S�pm��� @2�Lho?դGؑ!��M�Pe��櫡��'�~P�/N^���*��+�{�� p1o��f4����D����N�KȝH�f��`��s�|y���^�lƵ�˸��zO�hp��+�i�ś�jw�]���԰ĥ{3�P=�Yp;�ᇏ?<,���9i��E��B*�ZJ��[!:�35 (-<=A9���ھז�_pEW0϶�!�b�ߧu��)���Hօ�dԅ�!�!.�-V�bb��5�6{H`_�Վ��N^�U��M��p��'��hOf���{����Q
�^�ӡ_��t$�w��L��QD�ʛ�O�m�����$}\Q��~	����q ��m�PF�\�[�J��Y�"&Z�'i���W��	U��!���6�H��9����EYb���`h3P�!	��k'iU��̂�r:�����a����7���p��]�	�B+�qN��y!?-��J�q�T���9S� �
��I��p�q��:��TJjI��L]��ba����')���'�����ߪ���o��*��@�3`w�f�1. �
�@�����7��{�p� 1 �' �@�DX$�=L��L�b\�Z�y�z���O��+��-w�����5���}��s;qM��i{΀�J��%DL�kg>`o�	prZ��q�5���h�}g;�������^fa�B�w�7�����a4t-�~�K��bmZB8�i,�s��4b40��D8�f �i�V/G:\���Ӻ��ڎ����0A-}�K�֌�i�4�5r�{5�ol��I�h��;J=	Xb�I�9m�1�m�ϲ�(�C��[v��=k����c��1��&䉍��#��׫r�"��#�/zv'ag�� '$f���>�0��E�z�l>�'u�R��՘;d�q@��_@��
H��:�q_u (0v���l�E�<��xy ��׸�՘��0����3FA��V��8��дוü=D�mg{�~�Vx��FbX��N4���#5~
6B�w���"5��( �D�vZ�2q�C���g��3�o�
� ߾ڢ�q�t7[p�0e�<�D�I$��@�d�b>��j�][:�E�	QC�ā�a�|���I6��k�׆�yЖ�}��i�C<�Z�޴��#�v΄o�Ӽ|h6x�������?��"�N��As"��]�Ͱ�m��N�&F\��=~�?����07��Z�Z�m÷��T�T��T���Vu���j��4�)G�n�͉7��@%JK�\�}@���W��ro���n���x�d�@�)�i�iR�U�Ӎ�8�!8�}%n��hL�����߿ܑ0n�!�4BiJH;E��Ă�O�ލ��K������=���}.��Al��uߔ�҈�)Ȃ-��e8�x�>�P��C)�F��]T�`��{B{�h?�g�
�W�~	�ȧo��	{#}�~���Vn�l���'� �ŷ�DӶ�~�X�S~Tt�T��?R�cH��7�]�;����Pޮ��ެ��ײ ��e,N�V�ǝ���	{�D�G�~Ew����eD����I��;�[q� �ݍ+�|�&2�������)}߬�~�9>�9o���b��'e�d|.�GB��]�˶G�����7�I��!��}�"�c�p�`$Xn�'_w�W�t[+�:�C ��*1��WC@�
i(񒴜/��=��c$����6O��3�X8�.9Z����z�F,�xi��۰v�(������~l�7"�����0��Rb�v�e:�O��h��g6����*�ߵ��3�����aIx����Ӻ��Ep�{jx��7	���5ح�������=����p2��J��r��|��]VkןK:8V���)�-��j�{�rY5���nS@]�����v�6����=��_wl��Aǽ�c�m!����VQ���i�c��S�Fv��:�V�Jf׉��;�"�H8������(�����њ;-*�)hͨ�B)@��'��'�(��n�����^��]�yRRR�	��g��h�ѮK|��B�3}�^�����I:��r�-82d�G�s׭X��[@�Y�8�Ym{jb~�|xs�%�A�Y_�Yd��
R=�����=@Lߦx�"3�5Bx`�{-A�S_�
�?I�z���2+��Ї_�����a�v_�n�����1�qה���0��6��*�B ��6�j_o�ߏ��C�0҆n=��������!U^��:��-&��3�;���9���.�<Jh33!}m=Z��J�gkee��������d�4��~�����ܔ8�7����Gw�͉�	;V8��dZP���Nt�SB�%J3�t��<˚{��νܳ��%�fq
��� $L9i�ɢ}#F����Jt-8��v��I�T�ak�OՏK�c  ͰTF�������`o^�82~�a�k�w0ކ��߆�SǿM��&��j��:>nRlf:�4��^���{h����{ꜣ�P��nC��D��t�����6��v�^�+8Z���,=�~�� ��<�h������~=�^����dԪ����,/�����`���rR�|��*Y7XX�zxbs��Xa��EM��C���,[�Y��h5� v��`�����bp	Է�{��k������w2$�/~�����Y�U     