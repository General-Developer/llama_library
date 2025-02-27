/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: public_member_api_docs
//
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:general_lib/regexp_replace/regexp_replace.dart';
import 'package:llama_app/scheme/scheme/application_llama_library_database.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:general_framework/flutter/client/general_framework_client_flutter_app_directory.dart';
import 'package:general_lib/crypto/crypto.dart';
import 'package:general_lib/dart/dart.dart';
import 'package:general_lib/database/database.dart';
import 'package:general_lib/database/database_core.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:general_system_device/general_system_device_flutter.dart';
import 'package:llama_library/llama_library.dart';
import "package:path/path.dart" as path;

class LlamaAppClientFlutter {
  static GeneralLibFlutterApp generalLibFlutterApp = GeneralLibFlutterApp();
  static final GeneralSystemDeviceFlutter generalFlutter =
      GeneralSystemDeviceFlutter();
  static final GeneralFrameworkClientFlutterAppDirectory
      generalFrameworkClientFlutterAppDirectory =
      GeneralFrameworkClientFlutterAppDirectory();
  static final LlamaLibrary llamaLibrary = LlamaLibrary();

  static final DatabaseGeneralLib databaseGeneralLib = DatabaseGeneralLib();
  static late final DatabaseMiniGeneralLibrary coreDatabaseMiniLibrary;
  static Future<void> ensureInitialized() async {
    WidgetsFlutterBinding.ensureInitialized();
    generalFlutter.media_player.ensureInitialized();
    await llamaLibrary.ensureInitialized();
    await llamaLibrary.initialized();
  }

  static final Crypto _crypto = Crypto(
    key: utf8
        .decode(base64.decode("MjBIUEg4MzVrWjlBcnN0MjNhVHc0MlQyWU84ZVdPYkU=")),
    iv: utf8.decode(base64.decode("R29pNklmWGRNeHVHSmFpenYwTlg3UT09")),
  );

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static DatabaseMiniGeneralLibraryBaseOptions
      get databaseMiniGeneralLibraryBaseOptions {
    return DatabaseMiniGeneralLibraryBaseOptions(
      crypto: _crypto,
      isUseCrypto: true,
      isIgnoreError: true,
    );
  }

  static Future<void> initialized({
    required BuildContext context,
    required FutureOr<void> Function(String text) onLoading,
  }) async {
    await generalFrameworkClientFlutterAppDirectory.ensureInitialized(
      context: context,
      onLoading: onLoading,
    );

    {
      coreDatabaseMiniLibrary = await databaseGeneralLib.openDatabaseMiniAsync(
        key: path.join(
            generalFrameworkClientFlutterAppDirectory
                .app_support_directory.path,
            "core_database"),
        databaseMiniGeneralLibraryBaseOptions:
            databaseMiniGeneralLibraryBaseOptions,
        defaultData: {},
      );
    }
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static ApplicationLlamaLibraryDatabase coreDatabaseValue() {
    return coreDatabaseMiniLibrary.valueBuilder(
      builder: (db) {
        return ApplicationLlamaLibraryDatabase(db.stateData);
      },
    );
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static FutureOr<void> saveCoreDatabase() async {
    await coreDatabaseMiniLibrary.write();
  }

  static Future<File?> pickFile({
    String? dialogTitle,
    String? initialDirectory,
    FileType? type,
    List<String>? allowedExtensions,
  }) async {
    final filePicker = await FilePicker.platform.pickFiles(
      dialogTitle: dialogTitle,
      initialDirectory: initialDirectory,
      allowCompression: false,
      allowMultiple: false,
      type: type ?? FileType.custom,
      allowedExtensions: allowedExtensions ??
          [
            "bin",
            "gguf",
            "ggml",
            "ckpt",
          ],
    );

    if (filePicker == null) {
      return null;
    }

    final fileFirst = filePicker.files.firstOrNull;
    if (fileFirst == null) {
      return null;
    }
    final file = File(fileFirst.path ?? fileFirst.xFile.path);
    if (Dart.isAndroid) {
      final File fileCopy = File(
        path.join(
          generalFrameworkClientFlutterAppDirectory.app_support_directory.path,
          path.basename(file.path),
        ),
      );
      if (fileCopy.existsSync()) {
        fileCopy.deleteSync(recursive: true);
      }
      await file.copy(fileCopy.path);
      await file.delete(recursive: true);
      return fileCopy;
    }
    return file;
  }
}

extension StatellamaLibraryExtensionFLutter<T extends StatefulWidget>
    on State<T> {
  ApplicationLlamaLibraryDatabase getApplicationLlamaLibraryDatabase() {
    return LlamaAppClientFlutter.coreDatabaseValue();
  }

  void saveApplicationLlamaLibraryDatabase() async {
    await LlamaAppClientFlutter.saveCoreDatabase();
    return;
  }
}

extension LLamaStringClearExtension on String {
  String cleaner() {
    String text = this;
    for (final element in regExpReplaces) {
      try {
        text = text.replaceAllMapped(element.from, element.replace);
      } catch (e) {}
    }

    return text.trim();
  }
}

List<RegExpReplace> get regExpReplaces => [
      RegExpReplace(
        from: RegExp(
          "(([<|])([<|])?([/])?(think|im_start|im_end)([|>])?([|>]))",
          caseSensitive: false,
        ),
        replace: (match) {
          return "";
        },
      ),
      RegExpReplace(
        from: RegExp(
          "([<|]([/])?([ ]+)?[|>])",
          caseSensitive: false,
        ),
        replace: (match) {
          return "";
        },
      ),
    ];
