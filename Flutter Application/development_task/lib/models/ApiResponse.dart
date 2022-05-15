// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ApiResponse ApiResponseFromJson(String str) => ApiResponse.fromJson(json.decode(str));

String ApiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  ApiResponse({
    this.id='',
    this.data='',
  });

  String id;
  String data;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    id: json["id"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "data": data,
  };
}
