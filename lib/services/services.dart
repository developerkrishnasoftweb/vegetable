import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import '../services/urls.dart';
import '../services/data.dart';
class Services{
  /*
  * signIn Api
  * */
  static Future<Data> signIn(body) async{
    String url = Urls.baseUrl + Urls.signIn;
    try{
      dio.Response response;
      response = await dio.Dio().post(url, data: body);
      if(response.statusCode == 200){
        Data data = Data();
        final jsonResponse = jsonDecode(response.data);
        data.message = jsonResponse["message"];
        data.response = jsonResponse["status"];
        data.data = jsonResponse["data"];
        return data;
      }
      return null;
    } on dio.DioError catch (e) {
      if(dio.DioErrorType.DEFAULT == e.type){
        Data data = Data(message: "No internet connection !!!", response: null, data: null);
        return data;
      } else {
        Data data = Data(message: e.toString(), response: null, data: null);
        return data;
      }
    } catch (e) {
      Data data = Data(message: e.toString(), response: null, data: null);
      return data;
    }
  }

  /*
  * signUp Api
  * */
  static Future<Data> signUp(body) async{
    String url = Urls.baseUrl + Urls.signUp;
    try{
      dio.Response response;
      response = await dio.Dio().post(url, data: body);
      if(response.statusCode == 200){
        Data data = Data();
        final jsonResponse = jsonDecode(response.data);
        data.message = jsonResponse["message"];
        data.response = jsonResponse["status"];
        data.data = jsonResponse["data"];
        return data;
      }
      return null;
    } on dio.DioError catch (e) {
      if(dio.DioErrorType.DEFAULT == e.type){
        Data data = Data(message: "No internet connection !!!", response: null, data: null);
        return data;
      } else {
        Data data = Data(message: e.toString(), response: null, data: null);
        return data;
      }
    } catch (e) {
      Data data = Data(message: e.toString(), response: null, data: null);
      return data;
    }
  }

  /*
  * get category list
  * */
  static Future<Data> getAllCategory() async{
    String url = Urls.baseUrl + Urls.category;
    try{
      dio.Response response;
      response = await dio.Dio().get(url);
      if(response.statusCode == 200){
        Data data = Data();
        final jsonResponse = jsonDecode(response.data);
        data.message = jsonResponse["message"];
        data.response = jsonResponse["status"];
        data.data = jsonResponse["data"];
        return data;
      }
      return null;
    } on dio.DioError catch (e) {
      if(dio.DioErrorType.DEFAULT == e.type){
        Data data = Data(message: "No internet connection !!!", response: null, data: null);
        return data;
      } else {
        Data data = Data(message: e.toString(), response: null, data: null);
        return data;
      }
    } catch (e) {
      Data data = Data(message: e.toString(), response: null, data: null);
      return data;
    }
  }

  /*
  * get banners
  * */

  static Future<Data> getBanner() async{
    String url = Urls.baseUrl + Urls.banner;
    try{
      dio.Response response;
      response = await dio.Dio().get(url);
      if(response.statusCode == 200){
        Data data = Data();
        final jsonResponse = jsonDecode(response.data);
        data.message = jsonResponse["message"];
        data.response = jsonResponse["status"];
        data.data = jsonResponse["data"];
        return data;
      }
      return null;
    } on dio.DioError catch (e) {
      if(dio.DioErrorType.DEFAULT == e.type){
        Data data = Data(message: "No internet connection !!!", response: null, data: null);
        return data;
      } else {
        Data data = Data(message: e.toString(), response: null, data: null);
        return data;
      }
    } catch (e) {
      Data data = Data(message: e.toString(), response: null, data: null);
      return data;
    }
  }

  /*
  * get products
  * */

  static Future<Data> getProducts() async{
    String url = Urls.baseUrl + Urls.product;
    try{
      dio.Response response;
      response = await dio.Dio().get(url);
      if(response.statusCode == 200){
        Data data = Data();
        final jsonResponse = jsonDecode(response.data);
        data.message = jsonResponse["message"];
        data.response = jsonResponse["status"];
        data.data = jsonResponse["data"];
        return data;
      }
      return null;
    } on dio.DioError catch (e) {
      if(dio.DioErrorType.DEFAULT == e.type){
        Data data = Data(message: "No internet connection !!!", response: null, data: null);
        return data;
      } else {
        Data data = Data(message: e.toString(), response: null, data: null);
        return data;
      }
    } catch (e) {
      Data data = Data(message: e.toString(), response: null, data: null);
      return data;
    }
  }

  /*
  * get sub category data
  * */

  static Future<Data> getSubCategory(body) async{
    String url = Urls.baseUrl + Urls.subCategory;
    try{
      dio.Response response;
      response = await dio.Dio().post(url, data: body);
      if(response.statusCode == 200){
        Data data = Data();
        final jsonResponse = jsonDecode(response.data);
        data.message = jsonResponse["message"];
        data.response = jsonResponse["status"];
        data.data = jsonResponse["data"];
        return data;
      }
      return null;
    } on dio.DioError catch (e) {
      if(dio.DioErrorType.DEFAULT == e.type){
        Data data = Data(message: "No internet connection !!!", response: null, data: null);
        return data;
      } else {
        Data data = Data(message: e.toString(), response: null, data: null);
        return data;
      }
    } catch (e) {
      Data data = Data(message: e.toString(), response: null, data: null);
      return data;
    }
  }

  /*
  * get specific product data
  * */

  static Future<Data> getProduct(body) async{
    String url = Urls.baseUrl + Urls.product;
    try{
      dio.Response response;
      response = await dio.Dio().post(url, data: body);
      if(response.statusCode == 200){
        Data data = Data();
        final jsonResponse = jsonDecode(response.data);
        data.message = jsonResponse["message"];
        data.response = jsonResponse["status"];
        data.data = jsonResponse["data"];
        return data;
      }
      return null;
    } on dio.DioError catch (e) {
      if(dio.DioErrorType.DEFAULT == e.type){
        Data data = Data(message: "No internet connection !!!", response: null, data: null);
        return data;
      } else {
        Data data = Data(message: e.toString(), response: null, data: null);
        return data;
      }
    } catch (e) {
      Data data = Data(message: e.toString(), response: null, data: null);
      return data;
    }
  }

  /*
  * add to cart
  * */

  static Future<Data> addToCart(body) async{
    String url = Urls.baseUrl + Urls.addToCart;
    try{
      dio.Response response;
      response = await dio.Dio().post(url, data: body);
      if(response.statusCode == 200){
        Data data = Data();
        final jsonResponse = jsonDecode(response.data);
        data.message = jsonResponse["message"];
        data.response = jsonResponse["status"];
        data.data = jsonResponse["data"];
        return data;
      }
      return null;
    } on dio.DioError catch (e) {
      if(dio.DioErrorType.DEFAULT == e.type){
        Data data = Data(message: "No internet connection !!!", response: null, data: null);
        return data;
      } else {
        Data data = Data(message: e.toString(), response: null, data: null);
        return data;
      }
    } catch (e) {
      Data data = Data(message: e.toString(), response: null, data: null);
      return data;
    }
  }

  /*
  * view cart
  * */

  static Future<Data> viewCart(body) async{
    String url = Urls.baseUrl + Urls.viewCart;
    try{
      dio.Response response;
      response = await dio.Dio().post(url, data: body);
      if(response.statusCode == 200){
        Data data = Data();
        final jsonResponse = jsonDecode(response.data);
        data.message = jsonResponse["message"];
        data.response = jsonResponse["status"];
        data.data = jsonResponse["data"];
        return data;
      }
      return null;
    } on dio.DioError catch (e) {
      if(dio.DioErrorType.DEFAULT == e.type){
        Data data = Data(message: "No internet connection !!!", response: null, data: null);
        return data;
      } else {
        Data data = Data(message: e.toString(), response: null, data: null);
        return data;
      }
    } catch (e) {
      Data data = Data(message: e.toString(), response: null, data: null);
      return data;
    }
  }

  /*
  * check cart status
  * */

  static Future<Data> checkCartStatus(body) async{
    String url = Urls.baseUrl + Urls.checkCartStatus;
    try{
      dio.Response response;
      response = await dio.Dio().post(url, data: body);
      if(response.statusCode == 200){
        Data data = Data();
        final jsonResponse = jsonDecode(response.data);
        data.message = jsonResponse["message"];
        data.response = jsonResponse["status"];
        // data.data = [jsonResponse["data"]];
        List list = [];
        list = [
          {
            "id" : jsonResponse["data"]["id"],
            "customer_id" : jsonResponse["data"]["customer_id"],
            "product_id" : jsonResponse["data"]["product_id"],
            "quantity" : jsonResponse["data"]["quantity"],
            "date" : jsonResponse["data"]["date"],
          }
        ];
        data.data = list;
        return data;
      }
      return null;
    } on dio.DioError catch (e) {
      if(dio.DioErrorType.DEFAULT == e.type){
        Data data = Data(message: "No internet connection !!!", response: null, data: null);
        return data;
      } else {
        Data data = Data(message: e.toString(), response: null, data: null);
        return data;
      }
    } catch (e) {
      Data data = Data(message: e.toString(), response: null, data: null);
      return data;
    }
  }

  /*
  * remove item from cart
  * */

  static Future<Data> removeFromCart(body) async{
    String url = Urls.baseUrl + Urls.removeFromCart;
    try{
      dio.Response response;
      response = await dio.Dio().post(url, data: body);
      if(response.statusCode == 200){
        Data data = Data();
        final jsonResponse = jsonDecode(response.data);
        data.message = jsonResponse["message"];
        data.response = jsonResponse["status"];
        data.data = jsonResponse["data"];
        return data;
      }
      return null;
    } on dio.DioError catch (e) {
      if(dio.DioErrorType.DEFAULT == e.type){
        Data data = Data(message: "No internet connection !!!", response: null, data: null);
        return data;
      } else {
        Data data = Data(message: e.toString(), response: null, data: null);
        return data;
      }
    } catch (e) {
      Data data = Data(message: e.toString(), response: null, data: null);
      return data;
    }
  }

  /*
  * update quantity in cart
  * */

  static Future<Data> updateQuantity(body) async{
    String url = Urls.baseUrl + Urls.updateQuantity;
    try{
      dio.Response response;
      response = await dio.Dio().post(url, data: body);
      if(response.statusCode == 200){
        Data data = Data();
        final jsonResponse = jsonDecode(response.data);
        data.message = jsonResponse["message"];
        data.response = jsonResponse["status"];
        data.data = jsonResponse["data"];
        return data;
      }
      return null;
    } on dio.DioError catch (e) {
      if(dio.DioErrorType.DEFAULT == e.type){
        Data data = Data(message: "No internet connection !!!", response: null, data: null);
        return data;
      } else {
        Data data = Data(message: e.toString(), response: null, data: null);
        return data;
      }
    } catch (e) {
      Data data = Data(message: e.toString(), response: null, data: null);
      return data;
    }
  }

  /*
  * get cart item numbers
  * */

  static Future<Data> getCartCount(body) async{
    String url = Urls.baseUrl + Urls.getCartCount;
    try{
      dio.Response response;
      response = await dio.Dio().post(url, data: body);
      if(response.statusCode == 200){
        Data data = Data();
        final jsonResponse = jsonDecode(response.data);
        data.message = jsonResponse["message"];
        data.response = jsonResponse["status"];
        data.data = jsonResponse["data"];
        return data;
      }
      return null;
    } on dio.DioError catch (e) {
      if(dio.DioErrorType.DEFAULT == e.type){
        Data data = Data(message: "No internet connection !!!", response: null, data: null);
        return data;
      } else {
        Data data = Data(message: e.toString(), response: null, data: null);
        return data;
      }
    } catch (e) {
      Data data = Data(message: e.toString(), response: null, data: null);
      return data;
    }
  }
}


