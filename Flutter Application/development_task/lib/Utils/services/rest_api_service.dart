import 'dart:convert';

import 'package:http/http.dart' as http;
class RequestAssestant {
  static Future <dynamic>getRequest(String url)async{
    http.Response response=await http.get(Uri.parse(url));

    try{
      if(response.statusCode==200){
        String Jsondata = response.body;
        var decodedata=jsonDecode(Jsondata);
        return decodedata;
      }
      else {
        return "Failed";
      }
    }
    catch (exp){
      return "Failed";
    }
  }
  static Future <dynamic>postRequest(String url,Map<String, dynamic> json)async{
    http.Response response=await http.post(Uri.parse(url),body:json );

    try{
      if(response.statusCode==200){
        String Jsondata = response.body;
        var decodedata=jsonDecode(Jsondata);

        return decodedata;

      }
      else {
        return "Failed";
      }
    }
    catch (exp){
      return "Failed";
    }
  }
}