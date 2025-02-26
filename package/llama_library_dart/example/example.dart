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

import 'dart:convert';
import 'dart:io';
import 'package:llama_library/scheme/scheme/api/load_model_from_file_llama_library.dart';
import 'package:llama_library_dart/llama_library_dart.dart';
import 'package:llama_library/scheme/scheme/api/send_llama_library_message.dart';
import 'package:llama_library/scheme/scheme/respond/update_llama_library_message.dart';

void main(List<String> args) async {
  print("start");
  File modelFile = File(
    "../../../../../big-data/deepseek-r1/deepseek-r1-distill-qwen-1.5b-q4_0.gguf",
  );
  final LlamaLibrary llamaLibrary = LlamaLibrary(
    sharedLibraryPath: "libllama.so",
    invokeParametersLlamaLibraryDataOptions:
        InvokeParametersLlamaLibraryDataOptions(
      invokeTimeOut: Duration(minutes: 10),
      isThrowOnError: false,
    ),
  );
  await llamaLibrary.ensureInitialized();
  llamaLibrary.on(
    eventType: llamaLibrary.eventUpdate,
    onUpdate: (data) {
      final update = data.update;
      if (update is UpdateLlamaLibraryMessage) {
        /// streaming update
        if (update.is_done == false) {
          stdout.write(update.text);
        } else if (update.is_done == true) {
          print("\n\n");
          print("-- done --");
        }
      }
    },
  );
  await llamaLibrary.initialized();

  final res = await llamaLibrary.invoke(
    invokeParametersLlamaLibraryData: InvokeParametersLlamaLibraryData(
      parameters: LoadModelFromFileLlamaLibrary.create(
        model_file_path: modelFile.path,
      ),
      isVoid: false,
      extra: null,
      invokeParametersLlamaLibraryDataOptions: null,
    ),
  );
  if (res["@type"] == "ok") {
    print("succes load Model");
  } else {
    print("Failed load Model");
    exit(0);
  }
  stdin.listen((e) async {
    print("\n\n");
    final String text = utf8.decode(e).trim();
    if (text == "exit") {
      llamaLibrary.dispose();
      exit(0);
    } else {
      await llamaLibrary.invoke(
        invokeParametersLlamaLibraryData: InvokeParametersLlamaLibraryData(
          parameters: SendLlamaLibraryMessage.create(text: text),
          isVoid: true,
          extra: null,
          invokeParametersLlamaLibraryDataOptions: null,
        ),
      );
    }
  });
}
