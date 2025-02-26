// ignore_for_file: public_member_api_docs, use_build_context_synchronously, empty_catches, unnecessary_brace_in_string_interps

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

import 'package:llama_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:general_framework/flutter/ui/alert/core.dart';
import 'package:general_framework/flutter/widget/widget.dart';
import 'package:general_lib/general_lib.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:general_system_device/core/core.dart';
import 'package:llama_app/scheme/scheme/application_llama_library_database.dart';
import 'package:llama_library/llama_library.dart';
import 'package:llama_library/scheme/scheme/api/load_model_from_file_llama_library.dart';
import 'package:llama_library/scheme/scheme/respond/update_llama_library_message.dart';
import "package:path/path.dart" as path;

class LlamaAiPage extends StatefulWidget {
  const LlamaAiPage({super.key});

  @override
  State<LlamaAiPage> createState() => _LlamaAiPageState();
}

class _LlamaAiPageState extends State<LlamaAiPage> with GeneralLibFlutterStatefulWidget {
  late final GeneralSystemDeviceLibraryPlayerControllerBase playerController;

  @override
  void initState() {
    //  initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ensureInitialized();
      await initialized();
      await refresh();
    });
  }

  @override
  void dispose() {
    try {
      playerController.stop();
    } catch (e) {}
    playerController.dispose();
    transcribeFromExampleJFKToJson.clear();
    transcribeFromRecordToJson.clear();
    LlamaAppClientFlutter.llamaLibrary.dispose();
    super.dispose();
  }

  @override
  void ensureInitialized() {
    //  ensureInitialized
    super.ensureInitialized();
    playerController = LlamaAppClientFlutter.generalFlutter.media_player.createPlayer(player_id: "player");
  }

  Future<void> initialized() async {
    setState(() {
      isLoading = true;
    });
    await Future(() async {
      final ApplicationLlamaLibraryDatabase applicationLlamaLibraryDatabase = getApplicationLlamaLibraryDatabase();

      LlamaAppClientFlutter.llamaLibrary.on(
        eventType: LlamaAppClientFlutter.llamaLibrary.eventUpdate,
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

      await loadLlamaModel(
        llamaModel: File(applicationLlamaLibraryDatabase.llama_model_path ?? ""),
      );
    });
    setState(() {
      isLoading = false;
    });
  }

  int modelSize = 0;
  String modelName = "";

  Future<bool> loadLlamaModel({
    required File llamaModel,
  }) async {
    if (llamaModel.existsSync() == false) {
      return false;
    }
    final res = await LlamaAppClientFlutter.llamaLibrary.invoke(
      invokeParametersLlamaLibraryData: InvokeParametersLlamaLibraryData(
        parameters: LoadModelFromFileLlamaLibrary.create(
          model_file_path: llamaModel.path,
        ),
        isVoid: false,
        extra: null,
        invokeParametersLlamaLibraryDataOptions: null,
      ),
    );
    setState(() {
      modelSize = llamaModel.statSync().size;
      modelName = path.basename(llamaModel.path);
    });
    if (res["@type"] != "ok") {
      context.showSnackBar("Model Cant Loaded");
      return false;
    }
    return true;
  }

  @override
  Future<void> refresh() async {
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    await Future(() async {});
    setState(() {
      isLoading = false;
    });
  }

  final File fileAudioRecord = () {
    return File(path.join(LlamaAppClientFlutter.generalFrameworkClientFlutterAppDirectory.app_support_directory.path, "record.wav"));
  }();

  Map transcribeFromExampleJFKToJson = {};

  Map transcribeFromRecordToJson = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: appBarGlobalKey,
        title: Text(
          "Llama Library - General Developer",
          style: context.theme.textTheme.titleLarge,
        ),
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          children: [
            configurationWidget(
              isLoading: isLoading,
              context: context,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: refresh,
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: context.height,
                      minWidth: context.width,
                    ),
                    child: Column(
                      children: [],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: context.width,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: context.theme.appBarTheme.backgroundColor,
                borderRadius: BorderRadius.circular(20),
                border: context.extensionGeneralLibFlutterBorderAll(),
                boxShadow: context.extensionGeneralLibFlutterBoxShadows(),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: TextFormField(
                      
                      decoration: () {
                        final OutlineInputBorder inputBorder = OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        );
                        return InputDecoration(
                          enabledBorder: inputBorder,
                          border: inputBorder,
                          errorBorder: inputBorder,
                          focusedBorder: inputBorder,
                          disabledBorder: inputBorder,
                          focusedErrorBorder: inputBorder,
                        );
                      }(),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.send),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.mediaQueryData.padding.bottom,
            ),
          ],
        ),
      ),
    );
  }

  Widget configurationWidget({
    required bool isLoading,
    required BuildContext context,
  }) {
    return MenuContainerResponsiveGeneralFrameworkWidget(
      isLoading: isLoading,
      decorationBuilder: (context, decoration) {
        return decoration.copyWith(
          borderRadius: BorderRadius.circular(15),
        );
      },
      titleBuilder: (context) {
        return MenuContainerGeneralFrameworkWidget.title(
          context: context,
          title: "Information",
        );
      },
      menuBuilder: (context) {
        return [
          MenuContainerGeneralFrameworkWidget.lisTile(
            context: context,
            contentPadding: EdgeInsets.all(5),
            title: "Support",
            trailing: Icon(
              (LlamaAppClientFlutter.llamaLibrary.isDeviceSupport() == true) ? Icons.verified : Icons.close,
            ),
          ),
          MenuContainerGeneralFrameworkWidget.lisTile(
            context: context,
            contentPadding: EdgeInsets.all(5),
            title: "Model",
            subtitle: [
              "- Model Name: ${modelName}",
              "- Model Size: ${FileSize.filesize(
                size: modelSize,
              )}",
            ].join("\n"),
            trailing: IconButton(
              onPressed: () {
                handleFunction(
                  onFunction: (context, statefulWidget) async {
                    final file = await LlamaAppClientFlutter.pickFile(
                      dialogTitle: "Llama Model",
                    );
                    if (file == null) {
                      context.showAlertGeneralFramework(
                        alertGeneralFrameworkOptions: AlertGeneralFrameworkOptions(
                          title: "Failed Load Model Llama",
                          builder: (context, alertGeneralFrameworkOptions) {
                            return "Coba lagi";
                          },
                        ),
                      );
                      return;
                    }

                    /// save to application settings
                    {
                      final ApplicationLlamaLibraryDatabase applicationLlamaLibraryDatabase = getApplicationLlamaLibraryDatabase();
                      applicationLlamaLibraryDatabase.llama_model_path = file.path;
                      saveApplicationLlamaLibraryDatabase();
                    }
                    final bool isLoadLlamaModel = await loadLlamaModel(llamaModel: file);
                    context.showSnackBar(isLoadLlamaModel ? "Succes Load Model Llama" : "Failed Load Model Llama");
                  },
                );
              },
              icon: Icon(Icons.create),
            ),
          ),
        ];
      },
    );
  }
}
