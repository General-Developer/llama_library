// ignore_for_file: non_constant_identifier_names, unnecessary_this, public_member_api_docs

// GENERATED CODE - DO NOT MODIFY BY HAND

import 'dart:convert';
import 'package:database_universe/database_universe.dart';
part "llama_message_database.g.dart";

@collection
class LlamaMessageDatabase {
  // Id id = DatabaseUniverse.autoIncrement;

  /// Generated Document Database Universe By General Lib
  String special_type = "llamaMessageDatabase";

  /// Generated Document Database Universe By General Lib
  int id = 0;

  /// Generated Document Database Universe By General Lib
  bool is_outgoing = false;

  /// Generated Document Database Universe By General Lib
  bool is_done = false;

  /// Generated Document Database Universe By General Lib
  String text = "";

  /// Generated Document Database Universe By General Lib
  int date = 0;

  /// operator map data
  operator [](key) {
    return toJson()[key];
  }

  /// operator map data
  void operator []=(key, value) {
    if (key == "@type") {
      this.special_type = value;
    }

    if (key == "id") {
      this.id = value;
    }

    if (key == "is_outgoing") {
      this.is_outgoing = value;
    }

    if (key == "is_done") {
      this.is_done = value;
    }

    if (key == "text") {
      this.text = value;
    }

    if (key == "date") {
      this.date = value;
    }
  }

  /// return original data json
  Map utils_remove_values_null() {
    Map rawData = toJson();
    rawData.forEach((key, value) {
      if (value == null) {
        rawData.remove(key);
      }
    });
    return rawData;
  }

  /// return original data json
  Map utils_remove_by_values(List values) {
    Map rawData = toJson();
    rawData.forEach((key, value) {
      for (var element in values) {
        if (value == element) {
          rawData.remove(key);
        }
      }
    });

    return rawData;
  }

  /// return original data json
  Map utils_remove_by_keys(List keys) {
    Map rawData = toJson();
    for (var element in keys) {
      rawData.remove(element);
    }
    return rawData;
  }

  /// return original data json
  Map utils_filter_by_keys(List keys) {
    Map rawData = toJson();
    Map jsonData = {};
    for (var key in keys) {
      jsonData[key] = rawData[key];
    }
    return jsonData;
  }

  /// return original data json
  Map toMap() {
    return toJson();
  }

  /// return original data json
  Map toJson() {
    return {
      "@type": special_type,
      "id": id,
      "is_outgoing": is_outgoing,
      "is_done": is_done,
      "text": text,
      "date": date,
    };
  }

  /// return string data encode json original data
  String toStringPretty() {
    return JsonEncoder.withIndent(" " * 2).convert(toJson());
  }

  /// return string data encode json original data
  @override
  String toString() {
    return json.encode(toJson());
  }

  /// return original data json
  static Map get defaultData {
    return {
      "@type": "llamaMessageDatabase",
      "id": 0,
      "is_outgoing": false,
      "is_done": false,
      "text": "",
      "date": 0
    };
  }

  /// Generated Document Database Universe By General Lib
  static LlamaMessageDatabase create({
    bool utils_is_print_data = false,
  }) {
    LlamaMessageDatabase llamaMessageDatabase_data_create =
        LlamaMessageDatabase();

    if (utils_is_print_data) {
      // print(llamaMessageDatabase_data_create.toStringPretty());
    }

    return llamaMessageDatabase_data_create;
  }
}
