

import 'dart:convert';

import 'package:ecommerce/api/about/AboutResponse.dart';

import 'auth/AddToCartResponse.dart';
import 'auth/LoginResponse.dart';
import 'carousel/ListCarouselResponse.dart';
import 'package:http/http.dart' as http;

import 'cart/DeleteCartResponse.dart';
import 'cart/ListCartResponse.dart';
import 'cart/check_cart_response.dart';
import 'cart/edit_cart_response.dart';
import 'category/DetailSubcategoryResponse.dart';
import 'category/ListCategoryResponse.dart';
import 'category/ListSubcategoryResponse.dart';
import 'feed/DetailFeedResponse.dart';
import 'feed/ListFeedResponse.dart';
import 'help/DetailHelpResponse.dart';
import 'help/ListHelpResponse.dart';
import 'product/DetailProductResponse.dart';
import 'product/ListProductResponse.dart';

const BASE_URL = "http://192.168.1.28/PROJECTS/smaaveros_ecommerce/ecom_smaaveros/index.php/Api/";
class Api{

//  Carousel
  static Future<ListCarouselResponse> getListCarousel() async{
    var url = BASE_URL + "Carousel/select_carousel";
    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return ListCarouselResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to show list carousel";
    }
  }

  // PRODUCT
  static Future<ListProductResponse> getListProduct() async{
    var url = BASE_URL + "Product/select_product";
    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      // print(ListProductResponse.fromJson(jsonDecode(response.body)));
      return ListProductResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to show list product";
    }
  }

  static Future<DetailProductResponse> getDetailProduct(String id) async{
    var url = BASE_URL + "Product/select_product_by_id/$id";
    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return DetailProductResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to show detail product";
    }
  }

  // CATEGORY
  static Future<ListCategoryResponse> getListCategory() async{
    var url = BASE_URL + "Category/select_category";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return ListCategoryResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to show list category";
    }
  }

  static Future<ListSubcategoryResponse> getListSubcategory(String id) async{
    var url = BASE_URL + "Category/select_list_subcategory/$id";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return ListSubcategoryResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to show list product";
    }
  }

  static Future<DetailSubcategoryResponse> getDetailSubcategory(String id) async{
    var url = BASE_URL + "Category/select_subcategory_by_id/$id";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return DetailSubcategoryResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to show list product";
    }
  }

  //FEED
  static Future<DetailFeedResponse> getDetailFeed(String idFeed) async{
    var url = BASE_URL + "Feed/select_feed_by_id/$idFeed";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return DetailFeedResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to get detail feed";
    }
  }

  static Future<ListFeedResponse> getListFeed() async{
    var url = BASE_URL + "Feed/select_feed";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return ListFeedResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to get list feed";
    }
  }

  //  LOGIN
  static Future<LoginResponse> login(Map<String, String> dataLogin) async{
    var url = BASE_URL + "Auth/login";

    final response = await http.post(Uri.parse(url),body: dataLogin);

    if(response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to Log in";
    }
  }

//  REGISTER
  static register(Map<String, String> registerData) async{
    var url = BASE_URL + "Auth/register";

    await http.post(Uri.parse(url),body: registerData);

    // if(response.statusCode == 200) {
    //   return RegisterResponse.fromJson(jsonDecode(response.body));
    // }else{
    //   throw "Unable to show list product";
    // }
  }

  // CART
  static Future<ListCartResponse> getListCart(String idUser) async{
    var url = BASE_URL + "Cart/select_cart/$idUser";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return ListCartResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to show list cart";
    }
  }

  static Future<DeleteCartResponse> deleteCart(String idCart) async{
    var url = BASE_URL + "Cart/delete_cart/$idCart";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return DeleteCartResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to delete cart";
    }
  }

  static Future<AddToCartResponse> addToCart(Map<String,String> dataProduct) async{
    var url = BASE_URL + "Cart/add_cart/";

    var response = await http.post(Uri.parse(url),body: dataProduct);

    if(response.statusCode == 200) {
      return AddToCartResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to add cart";
    }
  }

  static Future<EditCartResponse> updateCart(Map<String,String> dataProduct) async{
    var url = BASE_URL + "Cart/update_cart/";

    var response = await http.post(Uri.parse(url),body: dataProduct);

    if(response.statusCode == 200) {
      return EditCartResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to update cart";
    }
  }

  static Future<CheckCartResponse> checkCart(String idUser, String idProduct) async{
    var url = BASE_URL + "Cart/select_check_cart/$idUser/$idProduct";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return CheckCartResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to check cart";
    }
  }

  // HELP
  static Future<ListHelpResponse> getListHelp() async{
    var url = BASE_URL + "Help/select_help";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return ListHelpResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to get list help";
    }
  }

  static Future<DetailHelpResponse> getDetailHelp(String id) async{
    var url = BASE_URL + "Help/select_help_by_id/$id";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return DetailHelpResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to get detail help";
    }
  }

  static Future<AboutResponse> getAbout() async{
    var url = BASE_URL + "About/select_about";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return AboutResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to get about";
    }
  }

}