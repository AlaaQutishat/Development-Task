// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AddFormResponse AddFormResponseFromJson(String str) => AddFormResponse.fromJson(json.decode(str));

String AddFormResponseToJson(AddFormResponse data) => json.encode(data.toJson());

class AddFormResponse {
  AddFormResponse({
    this.id='',
    this.data='',
    this.form_id='',
  });

  String id;
  String data;
  String form_id;

  factory AddFormResponse.fromJson(Map<String, dynamic> json) => AddFormResponse(
    id: json["id"],
    data: json["data"],
    form_id: json["form_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "data": data,
    "form_id": form_id,
  };
}
