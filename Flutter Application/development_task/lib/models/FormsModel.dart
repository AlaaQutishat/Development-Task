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
    required this.filedValue,
  });

  String datetime;
  String filedsNumber;
  String filedTypes;
  List<FiledValue> filedValue;

  factory FormData.fromJson(Map<String, dynamic> json) => FormData(
    datetime: json["datetime"],
    filedsNumber: json["fileds_number"],
    filedTypes: json["filed_types"],
    filedValue: List<FiledValue>.from(json["filed_value"].map((x) => FiledValue.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "datetime": datetime,
    "fileds_number": filedsNumber,
    "filed_types": filedTypes,
    "filed_value": List<dynamic>.from(filedValue.map((x) => x.toJson())),
  };
}

class FiledValue {
  FiledValue({
    required this.id,
    required this.value,
  });

  String id;
  String value;

  factory FiledValue.fromJson(Map<String, dynamic> json) => FiledValue(
    id: json["id"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
  };
}
