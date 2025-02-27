// ignore_for_file: non_constant_identifier_names, unnecessary_this, public_member_api_docs

// GENERATED CODE - DO NOT MODIFY BY HAND

import 'dart:convert';
import 'package:database_universe/database_universe.dart';
part "application_llama_library_database.g.dart";

@collection
class ApplicationLlamaLibraryDatabase {
  // Id id = DatabaseUniverse.autoIncrement;

  int id = 0;

  /// Generated Document Database Universe By General Lib
  String special_type = "applicationLlamaLibraryDatabase";

  /// Generated Document Database Universe By General Lib
  String llama_model_path = "";

  /// operator map data
  operator [](key) {
    return toJson()[key];
  }

  /// operator map data
  void operator []=(key, value) {
    if (key == "@type") {
      this.special_type = value;
    }

    if (key == "llama_model_path") {
      this.llama_model_path = value;
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
      "llama_model_path": llama_model_path,
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
    return {"@type": "applicationLlamaLibraryDatabase", "llama_model_path": ""};
  }

  /// Generated Document Database Universe By General Lib
  static ApplicationLlamaLibraryDatabase create({
    bool utils_is_print_data = false,
  }) {
    ApplicationLlamaLibraryDatabase
        applicationLlamaLibraryDatabase_data_create =
        ApplicationLlamaLibraryDatabase();

    if (utils_is_print_data) {
      // print(applicationLlamaLibraryDatabase_data_create.toStringPretty());
    }

    return applicationLlamaLibraryDatabase_data_create;
  }
}
