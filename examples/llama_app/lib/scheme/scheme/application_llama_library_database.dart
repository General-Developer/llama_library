// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

/// Generated
class ApplicationLlamaLibraryDatabase extends JsonScheme {
  /// Generated
  ApplicationLlamaLibraryDatabase(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {"@type": "applicationLlamaLibraryDatabase", "llama_model_path": ""};
  }

  /// check data
  /// if raw data
  /// - rawData["@type"] == applicationLlamaLibraryDatabase
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

  /// create [ApplicationLlamaLibraryDatabase]
  /// Empty
  static ApplicationLlamaLibraryDatabase empty() {
    return ApplicationLlamaLibraryDatabase({});
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
  String? get llama_model_path {
    try {
      if (rawData["llama_model_path"] is String == false) {
        return null;
      }
      return rawData["llama_model_path"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set llama_model_path(String? value) {
    rawData["llama_model_path"] = value;
  }

  /// Generated
  static ApplicationLlamaLibraryDatabase create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "applicationLlamaLibraryDatabase",
    String? llama_model_path,
  }) {
    // ApplicationLlamaLibraryDatabase applicationLlamaLibraryDatabase = ApplicationLlamaLibraryDatabase({
    final Map applicationLlamaLibraryDatabase_data_create_json = {
      "@type": special_type,
      "llama_model_path": llama_model_path,
    };

    applicationLlamaLibraryDatabase_data_create_json
        .removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (applicationLlamaLibraryDatabase_data_create_json.containsKey(key) ==
            false) {
          applicationLlamaLibraryDatabase_data_create_json[key] = value;
        }
      });
    }
    return ApplicationLlamaLibraryDatabase(
        applicationLlamaLibraryDatabase_data_create_json);
  }
}
