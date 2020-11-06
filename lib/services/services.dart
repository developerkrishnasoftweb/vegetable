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
}