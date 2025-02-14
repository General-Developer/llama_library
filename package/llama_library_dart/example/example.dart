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

import 'dart:io';
import 'package:llama_library_dart/llama_library_dart.dart';
import 'package:llama_library/raw/lcpp.dart';

void main(List<String> args) async {
  print("start");

  File modelFile = File("../../../../../big-data/llama/Meta-Llama-3.1-8B-Instruct.Q8_0.gguf");

  final LlamaLibrary llamaLibrary = LlamaLibrary(
    sharedLibraryPath: "../llama_library_flutter/linux/libllama.so",
  );
  await llamaLibrary.ensureInitialized();
  llamaLibrary.loadModel(modelPath: modelFile.path);

  /// call this if you want use llama if in main page / or not in page llama
  /// dont call if on low end specs device
  /// if device can't handle
  /// this program will auto exit because llama need reseources depends model
  /// and fast with modern cpu
  await llamaLibrary.initialized();

  await for (final result in llamaLibrary.prompt(messages: [
    ChatMessage(
      role: "user",
      content: "What is Linux?",
    )
  ])) {
    print(result);
  }

  await llamaLibrary.dispose();
  llamaLibrary.stop();
  llamaLibrary.close();
  exit(0);
}
