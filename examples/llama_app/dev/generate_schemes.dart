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
import 'package:general_lib/general_lib.dart';
import "package:path/path.dart" as path;

void main(List<String> args) async {
  final Directory directoryScheme =
      Directory(path.join(Directory.current.path, "lib", "scheme"));
  directoryScheme.generalLibUtilsDangerRecreate();
  {
    await jsonToScripts(
      database_schemes,
      directory: Directory(path.join(directoryScheme.path, "scheme")),
    );
  }
  {
    final Directory directoryDatabaseScheme = Directory(
        path.join(Directory.current.path, "lib", "database_universe_scheme"));
    directoryDatabaseScheme.generalLibUtilsDangerRecreate();
    for (final element in database_schemes) {
      if (element["@type"] is String == false) {
        continue;
      }
      final String className = (element["@type"] as String);
      if (className.isEmpty) {
        continue;
      }
      final result = jsonToDatabaseUniverse(
        element,
        className: className,
      );
      await result.saveToFile(directoryDatabaseScheme);
    }
  }
  Process.runSync(
    "dart",
    [
      "format",
      directoryScheme.path,
    ],
  );
  final result = await Process.start(
    "dart",
    [
      "run",
      "build_runner",
      "build",
      "--delete-conflicting-outputs",
    ],
    workingDirectory: Directory.current.path,
  );
  result.stdout.listen(stdout.add);
  result.stderr.listen(stderr.add);
  int exit_code = await result.exitCode;
  exit(exit_code);
}

final List<Map<String, dynamic>> database_schemes = [
  {
    "@type": "applicationLlamaLibraryDatabase",
    "llama_model_path": "",
  },
  {
    "@type": "llamaMessageDatabase",
    "id": 0,
    "is_outgoing": false,
    "is_done": false,
    "text": "",
    "date": 0,
  }
];
