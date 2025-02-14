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
import 'dart:async';

import 'package:general_lib/dynamic_library/core.dart';
import 'package:general_lib/general_lib.dart' show EventEmitterListener;
import 'package:llama_library/raw/lcpp.dart' show ChatMessage;

/// Check Out: https://www.youtube.com/@GENERAL_DEV
abstract class LlamaLibraryBaseCore extends GeneralLibraryDynamicLibraryBase { 

  /// Check Out: https://www.youtube.com/@GENERAL_DEV

  Future<void> initialized();



  /// Check Out: https://www.youtube.com/@GENERAL_DEV

  bool loadModel({
    required String modelPath,
  });
  

  /// Check Out: https://www.youtube.com/@GENERAL_DEV

  void stop();

  /// Check Out: https://www.youtube.com/@GENERAL_DEV

  Stream<String> prompt({
    required List<ChatMessage> messages,
  });

  /// Check Out: https://www.youtube.com/@GENERAL_DEV

  void emit({
    required String eventType,
    required dynamic data,
  });

  /// Check Out: https://www.youtube.com/@GENERAL_DEV

  EventEmitterListener on({
    required String eventType,
    required FutureOr<dynamic> Function(dynamic data) onUpdate,
  });
}

/// Check Out: https://www.youtube.com/@GENERAL_DEV
abstract class LlamaLibraryBase implements LlamaLibraryBaseCore {
  ///
  final String sharedLibraryPath;

  ///
  LlamaLibraryBase({
    String? sharedLibraryPath,
  }) : sharedLibraryPath = sharedLibraryPath ?? getLibraryWhisperPathDefault();

  ///
  static String getLibraryWhisperPathDefault() {
    return "libllama.so";
  }
}
