// ignore: file_names
// To parse this JSON data, do
//
//     final exchangerate = exchangerateFromJson(jsonString);

// ignore_for_file: unused_import, unnecessary_null_comparison

import 'dart:convert';
import 'package:json_serializable/json_serializable.dart';

Exchangerate exchangerateFromJson(String str) =>
    Exchangerate.fromJson(json.decode(str));

String exchangerateToJson(Exchangerate data) => json.encode(data.toJson());

class Exchangerate {
  Exchangerate({
    this.timestamp,
    this.base,
    this.date,
    this.rates,
  });

  int? timestamp;
  String? base;
  DateTime? date;
  Map<String, double>? rates;

  factory Exchangerate.fromJson(Map<String, dynamic> json) => Exchangerate(
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
        base: json["base"] == null ? null : json["base"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        rates: json["rates"] == null
            ? null
            : Map.from(json["rates"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp == null ? null : timestamp,
        "base": base == null ? null : base,
        "date": date == null
            ? null
            : "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "rates": rates == null
            ? null
            : Map.from(rates!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
