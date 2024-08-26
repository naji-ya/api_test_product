

import 'package:http/http.dart'as http;

import '../model_class/model.dart';


class HttpService{
  static Future<List<ProductDetails>> fetchTheProductus() async{
    var response = await http.get(Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
    if(response.statusCode==200){
      var data =response.body;
      return productDetailsFromJson(data);


    }else{
      throw Exception();
    }
  }
}