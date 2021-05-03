library flutter_app.globals;

import 'ItemsList.dart';
import 'Product.dart';
import 'Page__Pooshak_mardane.dart';
import 'Page__Pooshak_zanane.dart';
import 'Page__Pooshak_dokhtarane.dart';
import 'Page__Pooshak_nozadi.dart';
import 'Page__Pooshak_pesarane.dart';
import 'SignupClassList.dart';
import 'Page__Parcheh.dart';
import 'Page__Kharazi_Lavazem_Tahrir.dart';
import 'Page__Kharazi_Abzar.dart';
import 'Page__Haraji.dart';
import 'Page__Hejab_Chador.dart';
import 'Page__Hejab_Roosari.dart';
import 'Page__Hejab_Shal.dart';
import 'Page__Hejab_Saghedast_Dastkesh.dart';
import 'Page__Hejab_Mask_Pooshie.dart';
import 'Page__Sefaresh_Pooshak_Mardane.dart';
import 'Page__Sefaresh_Pooshak_Zanane.dart';
import 'Page__Sefaresh_Pooshak_Pesarane.dart';
import 'Page__Sefaresh_Pooshak_Dokhtarane.dart';
import 'Page__Sefaresh_Pooshak_Nozadi.dart';
import 'Page__Sefaresh_Sayer.dart';
import 'Page__Zivar_alat.dart';
import 'Page__Pishnahad_Vizhe.dart';
import 'Page__Users_kalas.dart';

bool to_comments = false;

String color = "";
String size = "";
int num = 0;
Map new_size = {};
Map new_color_size = {};
Map edit_color_size = {};
Map new_color = {};

String add_dastebandi = "";

String add_dastebandi_btn_text = "انتخاب دسته بندی";

int all_amount = 0;
int all_amount_tarikhche = 0;
String django_url = "193.176.243.61:8080";

String pishnahad_mojood_url = "send_comment";
String get_comments_url = "comments";

String tarikhche_kharid_getall = "/tarikhche_kharid/getall_admin";

String haraji_getall_url = "/kala/haraji/getall";
String haraji_delete_url = "/kala/haraji/delete";

String pooshak_mardane_getall_url = "/kala/pooshak_mardane/getall";
String pooshak_mardane_delete_url = "/kala/pooshak_mardane/delete";
String pooshak_zanane_getall_url = "/kala/pooshak_zanane/getall";
String pooshak_zanane_delete_url = "/kala/pooshak_zanane/delete";
String pooshak_pesarane_getall_url = "/kala/pooshak_pesarane/getall";
String pooshak_pesarane_delete_url = "/kala/pooshak_pesarane/delete";
String pooshak_dokhtarane_getall_url = "/kala/pooshak_dokhtarane/getall";
String pooshak_dokhtarane_delete_url = "/kala/pooshak_dokhtarane/delete";
String pooshak_nozadi_getall_url = "/kala/pooshak_nozadi/getall";
String pooshak_nozadi_delete_url = "/kala/pooshak_nozadi/delete";
String pooshak_getall_url = "/kala/pooshak/getall";

String parcheh_getall_url = "/kala/parcheh/getall";
String parcheh_delete_url = "/kala/parcheh/delete";

String kharazi_getall_url = "/kala/kharazi/getall";
String kharazi_abzar_getall_url = "/kala/kharazi_abzarkhayati/getall";
String kharazi_abzar_delete_url = "/kala/kharazi_abzarkhayati/delete";
String kharazi_lavazemtahrir_getall_url = "/kala/kharazi_lavazemtahrir/getall";
String kharazi_lavazemtahrir_delete_url = "/kala/kharazi_lavazemtahrir/delete";

String hejab_chador_getall_url = "/kala/hejab_chador/getall";
String hejab_chador_delete_url = "/kala/hejab_chador/delete";
String hejab_roosari_getall_url = "/kala/hejab_roosari/getall";
String hejab_roosari_delete_url = "/kala/hejab_roosari/delete";
String hejab_shal_getall_url = "/kala/hejab_shal/getall";
String hejab_shal_delete_url = "/kala/hejab_shal/delete";
String hejab_saghedast_dastkesh_getall_url =
    "/kala/hejab_saghedast_dastkesh/getall";
String hejab_saghedast_dastkesh_delete_url =
    "/kala/hejab_saghedast_dastkesh/delete";
String hejab_mask_pooshie_getall_url = "/kala/hejab_mask_pooshie/getall";
String hejab_mask_pooshie_delete_url = "/kala/hejab_mask_pooshie/delete";
String hejab_getall_url = "/kala/hejab/getall";

String sefaresh_pooshak_mardane_getall_url = "/kala/sefaresh_mardane/getall";
String sefaresh_pooshak_mardane_delete_url = "/kala/sefaresh_mardane/delete";
String sefaresh_pooshak_zanane_getall_url = "/kala/sefaresh_zanane/getall";
String sefaresh_pooshak_zanane_delete_url = "/kala/sefaresh_zanane/delete";
String sefaresh_pooshak_pesarane_getall_url = "/kala/sefaresh_pesarane/getall";
String sefaresh_pooshak_pesarane_delete_url = "/kala/sefaresh_pesarane/delete";
String sefaresh_pooshak_dokhtarane_getall_url =
    "/kala/sefaresh_dokhtarane/getall";
String sefaresh_pooshak_dokhtarane_delete_url =
    "/kala/sefaresh_dokhtarane/delete";
String sefaresh_pooshak_nozadi_getall_url = "/kala/sefaresh_nozadi/getall";
String sefaresh_pooshak_nozadi_delete_url = "/kala/sefaresh_nozadi/delete";
String sefaresh_pooshak_sayer_getall_url = "/kala/sefaresh_sayer/getall";
String sefaresh_pooshak_sayer_delete_url = "/kala/sefaresh_sayer/delete";

String pishnahad_vizhe_getall_url = "/kala/pishnahad_vizhe/getall";
String pishnahad_vizhe_delete_url = "/kala/pishnahad_vizhe/delete";
String zivar_alat_getall_url = "/kala/zivar_alat/getall";
String zivar_alat_delete_url = "/kala/zivar_alat/delete";

String get_all_cart_url = "/cart/getall";
String delete_from_cart_url = "/cart/delete";
String edit_cart_url = "/cart/edit";
String add_to_cart_url = "/cart/add";

bool to_cart = false;
var pooshak_mardane_getall_res = null;
String kharazi_abzarkhayati_getall_url = "/kala/kharazi_abzarkhayati/getall";

String signin_url = "account/checkadmin";
String signup_url = "account/register";
String delete_account_url = "account/delete";
String edit_account_url = "account/edit";

String signup_class_getall_url = "signupclass/getall";

String Ersal = "";
String send_message_url = "send_message";

String username = '';
String password = '';
String phonenumber = '';
String eitaa_id = '';
String address = '';
String post_code = '';
bool loop = false;
List<Product> items = [];

String users_kalas_getall_url = "/kala/users_kalas/getall";
String users_kalas_delete_url = "/kala/users_kalas/delete";

List<ItemsList> users_kalas_items = [
  ItemsList("بازار کاربران", "", "http://193.176.243.61/media/Icon%20Ok-28.png",
      Page__Users_kalas())
];

List<SignupClassList> signup_class_items = [];
List<ItemsList> haraj_items = [
  ItemsList("پیشنهاد شگفت انگیز", "",
      "http://193.176.243.61/media/efrfvjkndz.jpg", Page__Haraji())
];
List<ItemsList> pishnahad_vizhe_items = [
  ItemsList("پیشنهاد ویژه", "", "http://193.176.243.61/media/efrfvjkndz.jpg",
      Page__Pishnahad_Vizhe())
];
List<ItemsList> sanaye_dasti_items = [
  ItemsList(
      "زیور آلات",
      "",
      "http://193.176.243.61/media/photo_2021-04-13_00-26-35.jpg",
      Page__Zivar_alat())
];
List<ItemsList> pooshak_items = [
  ItemsList("پوشاک مردانه", "_num", "http://193.176.243.61/media/117355806.jpg",
      Page__Pooshak_mardane()),
  ItemsList(
      "پوشاک زنانه",
      "_num",
      "http://193.176.243.61/media/%D9%85%D8%A7%D9%86%D8%AA%D9%88-%D8%B3%D8%A7%D8%AF%D9%87-%D9%82%D9%87%D9%88%D9%87-%D8%A7%DB%8C.jpg",
      Page__Pooshak_zanane()),
  ItemsList("پوشاک پسرانه", "_num", "http://193.176.243.61/media/120964111.jpg",
      Page__Pooshak_pesarane()),
  ItemsList("پوشاک دخترانه", "_num",
      "http://193.176.243.61/media/116729500.jpg", Page__Pooshak_dokhtarane()),
  ItemsList("پوشاک نوزاد", "_num", "http://193.176.243.61/media/120408602.jpg",
      Page__Pooshak_nozadi()),
];

List<ItemsList> parcheh_items = [
  ItemsList("پارچه ها", "_num", "http://193.176.243.61/media/qwrre.jpg",
      Page__Parcheh()),
];

List<ItemsList> kharazi_items = [
  ItemsList("ابزار خیاطی", "_num", "http://193.176.243.61/media/unnamed.jpg",
      Page__Kharazi_Abzar()),
  ItemsList(
      "لوازم التحریر",
      "_num",
      "http://193.176.243.61/media/156557431.jpg",
      Page__Kharazi_Lavazem_Tahrir())
];

List<ItemsList> hejab_items = [
  ItemsList("چادر", "_num", "http://193.176.243.61/media/img.png",
      Page__Hejab_Chador()),
  ItemsList(
      "روسری",
      "_num",
      "http://193.176.243.61/media/86c534850d138bb6557276ea40dbc061.jpg",
      Page__Hejab_Roosari()),
  ItemsList(
      "شال",
      "_num",
      "http://193.176.243.61/media/8787b08434c1afb0a4b7aaeb489b74559ff39e8a_1603482115.jpg",
      Page__Hejab_Shal()),
  ItemsList(
      "ساق دست و دستکش",
      "_num",
      "http://193.176.243.61/media/cYkWBoH2kaenpHUY.jpg",
      Page__Hejab_Saghedast_Dastkesh()),
  ItemsList("ماسک و پوشیه", "_num", "http://193.176.243.61/media/1640703.jpg",
      Page__Hejab_Mask_Pooshie()),
];

List<ItemsList> sefaresh_items = [
  ItemsList("پوشاک مردانه", "_num", "http://193.176.243.61/media/117355806.jpg",
      Page__Sefaresh_Pooshak_mardane()),
  ItemsList(
      "پوشاک زنانه",
      "_num",
      "http://193.176.243.61/media/%D9%85%D8%A7%D9%86%D8%AA%D9%88-%D8%B3%D8%A7%D8%AF%D9%87-%D9%82%D9%87%D9%88%D9%87-%D8%A7%DB%8C.jpg",
      Page__Sefaresh_Pooshak_zanane()),
  ItemsList("پوشاک پسرانه", "_num", "http://193.176.243.61/media/120964111.jpg",
      Page__Sefaresh_Pooshak_pesarane()),
  ItemsList(
      "پوشاک دخترانه",
      "_num",
      "http://193.176.243.61/media/116729500.jpg",
      Page__Sefaresh_Pooshak_dokhtarane()),
  ItemsList("پوشاک نوزاد", "_num", "http://193.176.243.61/media/120408602.jpg",
      Page__Sefaresh_Pooshak_nozadi()),
];
