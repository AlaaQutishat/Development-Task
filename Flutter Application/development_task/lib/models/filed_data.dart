

import 'dart:convert';

List<FiledData> FiledDataFromJson(String str) => List<FiledData>.from(json.decode(str).map((x) => FiledData.fromJson(x)));

String FiledDataToJson(List<FiledData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FiledData {
  FiledData({
    this.id='',
    this.value='',
  });

  String id;
  String value;

  factory FiledData.fromJson(Map<String, dynamic> json) => FiledData(
    id: json["id"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
  };
}
