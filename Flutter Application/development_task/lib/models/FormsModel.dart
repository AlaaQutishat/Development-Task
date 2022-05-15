// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<FormData> FormDataFromJson(String str) => List<FormData>.from(json.decode(str).map((x) => FormData.fromJson(x)));

String FormDataToJson(List<FormData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FormData {
  FormData({
    this.datetime='',
    this.filedsNumber='',
    this.filedTypes='',
  });

  String datetime;
  String filedsNumber;
  String filedTypes;

  factory FormData.fromJson(Map<String, dynamic> json) => FormData(
    datetime: json["datetime"],
    filedsNumber: json["fileds_number"],
    filedTypes: json["filed_types"],
  );

  Map<String, dynamic> toJson() => {
    "datetime": datetime,
    "fileds_number": filedsNumber,
    "filed_types": filedTypes,
  };
}
