import 'package:flutter/material.dart';
import '../../models/AddFormResponse.dart';
import '../../models/ApiResponse.dart';
import 'rest_api_service.dart';
import 'package:development_task/Constants/app_constants.dart';
class AssistantMethods {
  static   CreateDevice(String token, context) async {
    ApiResponse apiResponse = ApiResponse();
    String Urllink =
        "${Constant.apiurl}new_user.php?token=$token";
    var response = await RequestAssestant.getRequest(Urllink);
    if (response != "Failed") {
      apiResponse.id = response["id"];
      apiResponse. data = response["data"];
    }
    return apiResponse;
  }

  static   Createform(String fileds_number,String token,String fileds_type, context) async {
    AddFormResponse apiResponse = AddFormResponse();
    String Urllink =
        "${Constant.apiurl}add_form.php?fileds_number=$fileds_number&user_token=$token&fileds_type=$fileds_type";
    var response = await RequestAssestant.getRequest(Urllink);
    if (response != "Failed") {
      apiResponse.id = response["id"];
      apiResponse. data = response["data"];
      apiResponse. form_id = response["form_id"];
    }
    return apiResponse;
  }
  static  saveformdata(String form_id,String fileds_value, context) async {
    ApiResponse apiResponse = ApiResponse();
    String Urllink =
        "${Constant.apiurl}save_form_data.php?form_id=$form_id&fileds_value=$fileds_value";
    var response = await RequestAssestant.getRequest(Urllink);
    if (response != "Failed") {
      apiResponse.id = response["id"];
      apiResponse. data = response["data"];
    }
    return apiResponse;
  }



}