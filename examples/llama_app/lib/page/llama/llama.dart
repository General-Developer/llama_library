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

import 'package:general_framework/flutter/flutter.dart';
import 'package:llama_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:general_framework/flutter/ui/alert/core.dart';
import 'package:general_framework/flutter/widget/widget.dart';
import 'package:general_lib/general_lib.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:llama_app/scheme/scheme/application_llama_library_database.dart';
import 'package:llama_app/scheme/scheme/llama_message_database.dart';
import 'package:llama_library/llama_library.dart';
import 'package:llama_library/scheme/scheme/api/api.dart';
import 'package:llama_library/scheme/scheme/respond/update_llama_library_message.dart';
import "package:path/path.dart" as path;

class LlamaAiPage extends StatefulWidget {
  const LlamaAiPage({super.key});

  @override
  State<LlamaAiPage> createState() => _LlamaAiPageState();
}

class _LlamaAiPageState extends State<LlamaAiPage>
    with GeneralLibFlutterStatefulWidget {
  final TextEditingController textEditingController = TextEditingController();

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
    LlamaAppClientFlutter.llamaLibrary.dispose();
    super.dispose();
  }

  Future<void> initialized() async {
    setState(() {
      isLoading = true;
    });
    await Future(() async {
      final ApplicationLlamaLibraryDatabase applicationLlamaLibraryDatabase =
          getApplicationLlamaLibraryDatabase();

      LlamaAppClientFlutter.llamaLibrary.on(
        eventType: LlamaAppClientFlutter.llamaLibrary.eventUpdate,
        onUpdate: onUpdate,
      );

      await loadLlamaModel(
        llamaModel:
            File(applicationLlamaLibraryDatabase.llama_model_path ?? ""),
      );
    });
    setState(() {
      isLoading = false;
    });
  }

  void onUpdate(UpdateLlamaLibraryData<LlamaLibrary, JsonScheme> data) async {
    final update = data.update;
    if (update is UpdateLlamaLibraryMessage) {
      /// streaming update
      if (update.is_done == false) {
        final String text = llamaMessageDatabases[0].text ?? "";
        llamaMessageDatabases[0].text = "${text}${update.text}";
        scrollController.scrollToMinimum(duration: Durations.short1);
        setState(() {});
      } else if (update.is_done == true) {
        print("\n\n");
        print("-- done --");

        llamaMessageDatabases[0].is_done = true;
        scrollController.scrollToMinimum(duration: Durations.short1);
        setState(() {});
      }
    }
  }

  final ScrollController scrollController = ScrollController();

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

  final List<LlamaMessageDatabase> llamaMessageDatabases = [];

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
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final biggest = constraints.biggest;
                  final contentMaxWidth = biggest.width * 3 / 4;
                  return SizedBox(
                    height: biggest.height,
                    width: biggest.width,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          for (final element in llamaMessageDatabases
                              .extensionGeneralLibForEach(
                            isReverse: true,
                            onData: (data, index, totalLength, isReverse) {
                              return data;
                            },
                          )) ...[
                            () {
                              final bool is_outgoing =
                                  (element.is_outgoing == true);
                              final String text = () {
                                String textProcces = (element.text ?? "");
                                if (is_outgoing == false) {
                                  if (element.is_done == true) {
                                    return textProcces.cleaner();
                                  }
                                }
                                return textProcces;
                              }();
                              if (text.isEmpty) {
                                return SizedBox.shrink();
                              }
                              final Alignment alignment = (is_outgoing == true)
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft;

                              return Row(
                                mainAxisAlignment:
                                    alignment.toMainAxisAlignment(),
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: contentMaxWidth,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: context
                                            .theme.appBarTheme.backgroundColor,
                                        borderRadius: BorderRadius.circular(10),
                                        border: context
                                            .extensionGeneralLibFlutterBorderAll(),
                                        boxShadow: context
                                            .extensionGeneralLibFlutterBoxShadows(),
                                      ),
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            alignment.toCrossAxisAlignment(),
                                        children: [
                                          Flexible(
                                            child: Text(
                                              text,
                                              style: context
                                                  .theme.textTheme.bodySmall,
                                              overflow: TextOverflow.clip,
                                              // textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }()
                          ],
                        ],
                      ),
                    ),
                  );
                },
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
                      controller: textEditingController,
                      decoration: () {
                        final OutlineInputBorder inputBorder =
                            OutlineInputBorder(
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
                    onPressed: () {
                      handleFunction(
                        onFunction: (context, statefulWidget) async {
                          final text = textEditingController.text;
                          textEditingController.clear();

                          llamaMessageDatabases.insert(
                            0,
                            LlamaMessageDatabase.create(
                              id: llamaMessageDatabases.length + 1,
                              is_outgoing: true,
                              is_done: true,
                              text: text,
                              date: DateTime.now().millisecondsSinceEpoch,
                            ),
                          );
                          llamaMessageDatabases.insert(
                            0,
                            LlamaMessageDatabase.create(
                              id: llamaMessageDatabases.length + 1,
                              is_outgoing: false,
                              is_done: false,
                              text: "",
                              date: DateTime.now().millisecondsSinceEpoch,
                            ),
                          );
                          await LlamaAppClientFlutter.llamaLibrary.request(
                            invokeParametersLlamaLibraryData:
                                InvokeParametersLlamaLibraryData(
                              parameters: SendLlamaLibraryMessage.create(
                                text: text,
                                is_stream: false,
                              ),
                              isVoid: true,
                              extra: null,
                              invokeParametersLlamaLibraryDataOptions: null,
                            ),
                          );
                        },
                      );
                    },
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
              (LlamaAppClientFlutter.llamaLibrary.isDeviceSupport() == true)
                  ? Icons.verified
                  : Icons.close,
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
                        alertGeneralFrameworkOptions:
                            AlertGeneralFrameworkOptions(
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
                      final ApplicationLlamaLibraryDatabase
                          applicationLlamaLibraryDatabase =
                          getApplicationLlamaLibraryDatabase();
                      applicationLlamaLibraryDatabase.llama_model_path =
                          file.path;
                      saveApplicationLlamaLibraryDatabase();
                    }
                    final bool isLoadLlamaModel =
                        await loadLlamaModel(llamaModel: file);
                    context.showSnackBar(isLoadLlamaModel
                        ? "Succes Load Model Llama"
                        : "Failed Load Model Llama");
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
