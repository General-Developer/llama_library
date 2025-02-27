// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

/// Generated
class LlamaMessageDatabase extends JsonScheme {
  /// Generated
  LlamaMessageDatabase(super.rawData);

  /// return default data
  ///
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

  /// check data
  /// if raw data
  /// - rawData["@type"] == llamaMessageDatabase
  /// if same return true
  bool json_scheme_utils_checkDataIsSameBySpecialType() {
    return rawData["@type"] == defaultData["@type"];
  }

  /// check value data whatever do yout want
  bool json_scheme_utils_checkDataIsSameBuilder({
    required bool Function(Map rawData, Map defaultData) onResult,
  }) {
    return onResult(rawData["@type"], defaultData["@type"]);
  }

  /// create [LlamaMessageDatabase]
  /// Empty
  static LlamaMessageDatabase empty() {
    return LlamaMessageDatabase({});
  }

  /// Generated
  String? get special_type {
    try {
      if (rawData["@type"] is String == false) {
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set special_type(String? value) {
    rawData["@type"] = value;
  }

  /// Generated
  num? get id {
    try {
      if (rawData["id"] is num == false) {
        return null;
      }
      return rawData["id"] as num;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set id(num? value) {
    rawData["id"] = value;
  }

  /// Generated
  bool? get is_outgoing {
    try {
      if (rawData["is_outgoing"] is bool == false) {
        return null;
      }
      return rawData["is_outgoing"] as bool;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set is_outgoing(bool? value) {
    rawData["is_outgoing"] = value;
  }

  /// Generated
  bool? get is_done {
    try {
      if (rawData["is_done"] is bool == false) {
        return null;
      }
      return rawData["is_done"] as bool;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set is_done(bool? value) {
    rawData["is_done"] = value;
  }

  /// Generated
  String? get text {
    try {
      if (rawData["text"] is String == false) {
        return null;
      }
      return rawData["text"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set text(String? value) {
    rawData["text"] = value;
  }

  /// Generated
  num? get date {
    try {
      if (rawData["date"] is num == false) {
        return null;
      }
      return rawData["date"] as num;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set date(num? value) {
    rawData["date"] = value;
  }

  /// Generated
  static LlamaMessageDatabase create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "llamaMessageDatabase",
    num? id,
    bool? is_outgoing,
    bool? is_done,
    String? text,
    num? date,
  }) {
    // LlamaMessageDatabase llamaMessageDatabase = LlamaMessageDatabase({
    final Map llamaMessageDatabase_data_create_json = {
      "@type": special_type,
      "id": id,
      "is_outgoing": is_outgoing,
      "is_done": is_done,
      "text": text,
      "date": date,
    };

    llamaMessageDatabase_data_create_json
        .removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (llamaMessageDatabase_data_create_json.containsKey(key) == false) {
          llamaMessageDatabase_data_create_json[key] = value;
        }
      });
    }
    return LlamaMessageDatabase(llamaMessageDatabase_data_create_json);
  }
}
