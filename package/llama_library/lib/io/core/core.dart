// ignore_for_file: non_constant_identifier_names, empty_catches, unnecessary_brace_in_string_interps

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

library;

import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:ffi_universe/ffi_universe.dart';

import 'package:general_lib/general_lib.dart';

import 'package:llama_library/base.dart';
import 'package:llama_library/ffi/bindings.dart';
import 'package:llama_library/io/models/context_params.dart';
import 'package:llama_library/io/models/model_params.dart';
import 'package:llama_library/io/models/sampler_params.dart';
import 'package:llama_library/scheme/scheme/api/load_model_from_file_llama_library.dart';
import 'package:llama_library/scheme/scheme/api/send_llama_library_message.dart';
import 'package:llama_library/scheme/scheme/respond/update_llama_library_message.dart';
part "send_message/send_message.dart";

///
class LlamaLibrary extends LlamaLibraryBase {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final ReceivePort receivePort = ReceivePort();
  bool _isInIsolate = false;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  late SendPort _sendPort;

  final Completer<bool> _completerSendPortInitialized = Completer<bool>();

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  LlamaLibrary({
    super.eventEmitter,
    super.sharedLibraryPath,
    super.eventInvoke,
    super.eventUpdate,
    super.invokeParametersLlamaLibraryDataOptions,
  }) {
    receivePort.listen(
      (event) async {
        try {
          if (_isInIsolate == true) {
            if (event is SendPort) {
              if (_completerSendPortInitialized.isCompleted == false) {
                _completerSendPortInitialized.complete(true);
              }
              _sendPort = event;
            } else if (event == LlamaLibraryActionType.close) {
              dispose();
            } else if (event == LlamaLibraryActionType.clear) {
              clear();
            } else if (event == LlamaLibraryActionType.test) {
              test();
            } else if (event is InvokeParametersLlamaLibraryData) {
              await invokeRaw(
                invokeParametersLlamaLibraryData: event.copyWith(
                  isVoid: true,
                  invokeParametersLlamaLibraryDataOptions:
                      (event.invokeParametersLlamaLibraryDataOptions ??
                              invokeParametersLlamaLibraryDataOptions)
                          .copyWith(
                    isThrowOnError: false,
                  ),
                ),
              );
            }
          } else {
            if (event is SendPort) {
              if (_completerSendPortInitialized.isCompleted == false) {
                _completerSendPortInitialized.complete(true);
              }
              _sendPort = event;
            } else if (event == LlamaLibraryActionType.close) {
              if (LlamaLibrary._isolate != Isolate.current) {
                LlamaLibrary._isolate.kill();
              }
            } else if (event is JsonScheme) {
              emit(
                eventType: eventUpdate,
                data: event,
              );
            }
          }
        } catch (e) {}
      },
    );
  }

  @override
  void send(dynamic data) async {
    try {
      await _completerSendPortInitialized.future;
      _sendPort.send(data);
    } catch (e) {}
  }

  ///
  static late final LlamaLibrarySharedBindingsByGeneralDeveloper
      _llamaLibrarySharedBindingsByGeneralDeveloper;

  static Pointer<llama_model> _modelContext = nullptr;
  static Pointer<llama_context> _llamaContext = nullptr;
  static Pointer<llama_sampler> _llamaSampler = nullptr;

  static int _nPredict = 32;
  // ignore: prefer_final_fields

  static Pointer<llama_vocab> _vocab = nullptr;

  static bool _isEnsureInitialized = false;

  @override
  Future<void> ensureInitialized() async {
    if (_isEnsureInitialized) {
      return;
    }

    try {
      _llamaLibrarySharedBindingsByGeneralDeveloper =
          LlamaLibrarySharedBindingsByGeneralDeveloper(
        await FFIUniverse.open(
          path: sharedLibraryPath,
        ),
      );
      _isDeviceSupport = true;
    } catch (e) {
      _isCrash = true;
    }

    _isEnsureInitialized = true;
  }

  bool _isCrash = false;
  bool _isDeviceSupport = false;
  @override
  bool isCrash() {
    return _isCrash;
  }

  @override
  bool isDeviceSupport() {
    if (_isCrash) {
      return false;
    }
    return _isDeviceSupport;
  }

  @override
  void emit({
    required String eventType,
    required data,
  }) {
    return eventEmitter.emit(
      eventName: eventType,
      value: data,
    );
  }

  @override
  EventEmitterListener on({
    required String eventType,
    required FutureOr Function(
            UpdateLlamaLibraryData<LlamaLibrary, JsonScheme> updateLlamaLibrary)
        onUpdate,
  }) {
    return eventEmitter.on(
      eventName: eventType,
      onCallback: (listener, update) {
        if (update is JsonScheme) {
          onUpdate(UpdateLlamaLibraryData(
            update: update,
            llamaLibrary: this,
          ));
        }
      },
    );
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static void ggmlLogCallbackFunction(
      int level, Pointer<Char> text, Pointer<Void> user_data) {
    // print(text.cast<Utf8>().toDartString());
  }

  bool _loadModel({
    required String modelPath,
  }) {
    final File modelFile = File(modelPath);
    if (modelFile.existsSync() == false) {
      return false;
    }
    if (_isInIsolate == false) {
      return true;
    }

    if (isDeviceSupport() == false || isCrash()) {
      return false;
    }
    {
      LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper.llama_log_set(
          Pointer.fromFunction(ggmlLogCallbackFunction),
          "log".toNativeUtf8().cast<Void>());
      LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper.ggml_log_set(
          Pointer.fromFunction(ggmlLogCallbackFunction),
          "log".toNativeUtf8().cast<Void>());
    }

    LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
        .ggml_backend_load_all();
    LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_backend_init();

    final LLamaModelParams modelParamsDart = LLamaModelParams();
    var modelParams = modelParamsDart.get(
      llama: LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper,
    );

    final modelPathPtr = modelPath.toNativeUtf8().cast<Char>();
    try {
      LlamaLibrary._modelContext = LlamaLibrary
          ._llamaLibrarySharedBindingsByGeneralDeveloper
          .llama_load_model_from_file(modelPathPtr, modelParams);
      if (LlamaLibrary._modelContext.address == 0) {
        // throw LlamaException("Could not load model at $modelPath");
      }
    } finally {
      malloc.free(modelPathPtr);
    }
    LlamaLibrary._vocab = LlamaLibrary
        ._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_model_get_vocab(LlamaLibrary._modelContext);

    const size = 512 * 4;
    LLamaContextParams contextParamsDart = LLamaContextParams();
    contextParamsDart.nThreadsBatch = 4;
    contextParamsDart.nThreads = 4;
    contextParamsDart.nCtx = size;
    contextParamsDart.nBatch = size;
    contextParamsDart.nUbatch = size;
    contextParamsDart.nPredit = 512;

    _nPredict = contextParamsDart.nPredit;

    var contextParams = contextParamsDart.get(
      llama: LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper,
    );

    LlamaLibrary._llamaContext = LlamaLibrary
        ._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_new_context_with_model(
            LlamaLibrary._modelContext, contextParams);
    if (LlamaLibrary._llamaContext.address == 0) {}

    final samplerParams = LLamaSamplerParams();

    // Initialize sampler chain
    llama_sampler_chain_params sparams = LlamaLibrary
        ._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_sampler_chain_default_params();
    sparams.no_perf = false;
    LlamaLibrary._llamaSampler = LlamaLibrary
        ._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_sampler_chain_init(sparams);

    // Add samplers based on params
    if (samplerParams.greedy) {
      LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
          .llama_sampler_chain_add(
              LlamaLibrary._llamaSampler,
              LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
                  .llama_sampler_init_greedy());
    }

    LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_sampler_chain_add(
            LlamaLibrary._llamaSampler,
            LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
                .llama_sampler_init_dist(samplerParams.seed));

    if (samplerParams.softmax) {
      LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
          .llama_sampler_chain_add(
              LlamaLibrary._llamaSampler,
              LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
                  .llama_sampler_init_softmax());
    }

    LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_sampler_chain_add(
            LlamaLibrary._llamaSampler,
            LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
                .llama_sampler_init_top_k(samplerParams.topK));
    LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_sampler_chain_add(
            LlamaLibrary._llamaSampler,
            LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
                .llama_sampler_init_top_p(
                    samplerParams.topP, samplerParams.topPKeep));
    LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_sampler_chain_add(
            LlamaLibrary._llamaSampler,
            LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
                .llama_sampler_init_min_p(
                    samplerParams.minP, samplerParams.minPKeep));
    LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_sampler_chain_add(
            LlamaLibrary._llamaSampler,
            LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
                .llama_sampler_init_typical(
                    samplerParams.typical, samplerParams.typicalKeep));
    LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_sampler_chain_add(
            LlamaLibrary._llamaSampler,
            LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
                .llama_sampler_init_temp(samplerParams.temp));
    LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_sampler_chain_add(
            LlamaLibrary._llamaSampler,
            LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
                .llama_sampler_init_xtc(
                    samplerParams.xtcTemperature,
                    samplerParams.xtcStartValue,
                    samplerParams.xtcKeep,
                    samplerParams.xtcLength));

    LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_sampler_chain_add(
            LlamaLibrary._llamaSampler,
            LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
                .llama_sampler_init_mirostat(
                    LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
                        .llama_n_vocab(LlamaLibrary._vocab),
                    samplerParams.seed,
                    samplerParams.mirostatTau,
                    samplerParams.mirostatEta,
                    samplerParams.mirostatM));

    LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_sampler_chain_add(
            LlamaLibrary._llamaSampler,
            LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
                .llama_sampler_init_mirostat_v2(samplerParams.seed,
                    samplerParams.mirostat2Tau, samplerParams.mirostat2Eta));

    final grammarStrPtr = samplerParams.grammarStr.toNativeUtf8().cast<Char>();
    final grammarRootPtr =
        samplerParams.grammarRoot.toNativeUtf8().cast<Char>();
    LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_sampler_chain_add(
            LlamaLibrary._llamaSampler,
            LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
                .llama_sampler_init_grammar(
                    LlamaLibrary._vocab, grammarStrPtr, grammarRootPtr));
    calloc.free(grammarStrPtr);
    calloc.free(grammarRootPtr);

    LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_sampler_chain_add(
      LlamaLibrary._llamaSampler,
      LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
          .llama_sampler_init_penalties(
        samplerParams.penaltyLastTokens,
        samplerParams.penaltyRepeat,
        samplerParams.penaltyFreq,
        samplerParams.penaltyPresent,
      ),
    );

    final seqBreakers = samplerParams.dryBreakers;
    final numBreakers = seqBreakers.length;
    final seqBreakersPointer = calloc<Pointer<Char>>(numBreakers);

    try {
      for (var i = 0; i < numBreakers; i++) {
        seqBreakersPointer[i] = seqBreakers[i].toNativeUtf8().cast<Char>();
      }

      LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
          .llama_sampler_chain_add(
        LlamaLibrary._llamaSampler,
        LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
            .llama_sampler_init_penalties(
          samplerParams.penaltyLastTokens,
          samplerParams.penaltyRepeat,
          samplerParams.penaltyFreq,
          samplerParams.penaltyPresent,
        ),
      );
    } finally {
      // Clean up DRY sampler allocations
      for (var i = 0; i < numBreakers; i++) {
        calloc.free(seqBreakersPointer[i]);
      }
      calloc.free(seqBreakersPointer);
    }

    // LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper.llama_sampler_chain_add(LlamaLibrary._llamaSampler, LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper.llama_sampler_init_infill(model));

    // _tokenPtr = malloc<llama_token>();

    return true;
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static Isolate _isolate = Isolate.current;

  @override
  Future<void> initialized() async {
    if (_isInIsolate == true) {
      return;
    }
    if (LlamaLibrary._isolate != Isolate.current) {
      LlamaLibrary._isolate.kill();
    }
    if (LlamaLibrary._isolate == Isolate.current) {
      LlamaLibrary._isolate = await Isolate.spawn(
        (LlamaLibraryIsolateData llamaLibraryIsolateData) async {
          final LlamaLibrary llamaLibrary = LlamaLibrary();
          llamaLibrary._isInIsolate = true;
          await llamaLibrary.ensureInitialized();
          await llamaLibrary.initialized();
          llamaLibrary.receivePort.sendPort
              .send(llamaLibraryIsolateData.sendPort);
          llamaLibraryIsolateData.sendPort
              .send(llamaLibrary.receivePort.sendPort);
        },
        LlamaLibraryIsolateData(
          sharedLibraryPath: sharedLibraryPath,
          // modelPath: LlamaLibrary._modelPath,
          sendPort: receivePort.sendPort,
          invokeParametersLlamaLibraryDataOptions:
              invokeParametersLlamaLibraryDataOptions,
        ),
      );
    }
    // Isolate isolate = await Isolate.spawn(entryPoint, message);
  }

  /// Disposes of all resources held by this instance
  @override
  void dispose() {
    eventEmitter.clear();
    if (_isInIsolate == false) {
      send(LlamaLibraryActionType.close);
      return;
    }

    if (isDeviceSupport() == false || isCrash()) {
      return;
    }
    clear();

    // if (_tokens != nullptr) {
    //   malloc.free(_tokens);
    // }
    // if (_tokenPtr != nullptr) {
    //   malloc.free(_tokenPtr);
    // }

    if (LlamaLibrary._llamaSampler != nullptr) {
      LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
          .llama_sampler_free(LlamaLibrary._llamaSampler);
    }
    if (LlamaLibrary._llamaContext != nullptr ||
        LlamaLibrary._llamaContext.address != 0) {
      LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
          .llama_free(LlamaLibrary._llamaContext);
    }
    if (LlamaLibrary._modelContext != nullptr ||
        LlamaLibrary._modelContext.address != 0) {
      LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
          .llama_free_model(LlamaLibrary._modelContext);
    }

    LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
        .llama_backend_free();

    send(LlamaLibraryActionType.close);
  }

  /// Clears the current state of the Llama instance
  /// This allows reusing the same instance for a new generation
  /// without creating a new instance
  @override
  void clear() {
    if (_isInIsolate == false) {
      send(LlamaLibraryActionType.clear);
      return;
    }

    if (isDeviceSupport() == false || isCrash()) {
      return;
    }

    // Reset the context state
    if (LlamaLibrary._llamaContext.address != 0) {
      LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
          .llama_kv_cache_clear(LlamaLibrary._llamaContext);
    }
  }

  @override
  void test() async {
    if (_isInIsolate == false) {
      send(LlamaLibraryActionType.test);
    } else {}
  }

  @override
  FutureOr<JsonScheme> invokeRaw({
    required InvokeParametersLlamaLibraryData<JsonScheme>
        invokeParametersLlamaLibraryData,
  }) async {
    await _completerSendPortInitialized.future;
    final invokeParametersLlamaLibraryDataOptions =
        invokeParametersLlamaLibraryData
                .invokeParametersLlamaLibraryDataOptions ??
            this.invokeParametersLlamaLibraryDataOptions;
    if (_isInIsolate == true) {
      invokeParametersLlamaLibraryDataOptions.isThrowOnError = false;
    }
    final parameters = invokeParametersLlamaLibraryData.parameters;

    final String extra = () {
      if (parameters["@extra"] is String == false) {
        parameters["@extra"] = "";
      }
      String extraProcces = (parameters["@extra"] as String).trim();
      if (extraProcces.isEmpty) {
        extraProcces = generateUuid(10);
      }
      invokeParametersLlamaLibraryData.parameters["@extra"] = extraProcces;
      parameters["@extra"] = extraProcces;
      return extraProcces;
    }();
    if (parameters["@type"] is String == false) {
      parameters["@type"] = "";
    }
    final String method = (parameters["@type"] as String).trim();
    final Map<String, dynamic> patchData = {
      "@extra": extra,
    };
    if (method.isEmpty) {
      return InvokeParametersLlamaLibraryData.send(
        data: JsonScheme({
          "@type": "error",
          "message": "method_empty",
        }),
        patchData: patchData,
        invokeParametersLlamaLibraryDataOptions:
            invokeParametersLlamaLibraryDataOptions,
      );
    }

    if (_isInIsolate == false) {
      send(
        invokeParametersLlamaLibraryData.copyWith(
          parameters: parameters,
          extra: extra,
          isVoid: invokeParametersLlamaLibraryData.isVoid,
          invokeParametersLlamaLibraryDataOptions:
              invokeParametersLlamaLibraryDataOptions,
        ),
      );

      if (invokeParametersLlamaLibraryData.isVoid == true) {
        return InvokeParametersLlamaLibraryData.send(
          data: JsonScheme({
            "@type": "ok",
          }),
          patchData: patchData,
          invokeParametersLlamaLibraryDataOptions:
              invokeParametersLlamaLibraryDataOptions,
        );
      }
      final Completer<JsonScheme> completerResult = Completer();
      final listener = on(
        eventType: eventUpdate,
        onUpdate: (updateLlamaLibrary) {
          if (completerResult.isCompleted) {
            return;
          }
          final update = updateLlamaLibrary.update;
          if (update["@extra"] == extra) {
            if (update.rawData.containsKey("is_stream")) {
              if (update["is_stream"] == true) {
                completerResult.complete(update);
              } else {
                if (update["is_done"] == true) {
                  completerResult.complete(update);
                }
              }
            } else {
              completerResult.complete(update);
            }
          }
        },
      );

      final result = await completerResult.future.timeout(
        invokeParametersLlamaLibraryDataOptions.invokeTimeOut,
        onTimeout: () {
          return JsonScheme({
            "@type": "error",
            "message": "timeout",
          });
        },
      );
      try {
        listener.close();
      } catch (e) {}
      try {
        eventEmitter.off(listener: listener);
      } catch (e) {}
      return InvokeParametersLlamaLibraryData.send(
        data: result,
        patchData: patchData,
        invokeParametersLlamaLibraryDataOptions:
            invokeParametersLlamaLibraryDataOptions,
      );

      ///
    } else {
      final result = await Future(() async {
        if (parameters is SendLlamaLibraryMessage) {
          return await _sendMessage(
            parameters: parameters,
            extra: extra,
            invokeParametersLlamaLibraryDataOptions:
                invokeParametersLlamaLibraryDataOptions,
          );
        }
        if (parameters is LoadModelFromFileLlamaLibrary) {
          final bool isLoadModel = _loadModel(
            modelPath: parameters.model_file_path ?? "",
          );
          if (isLoadModel) {
            return JsonScheme({
              "@type": "ok",
            });
          } else {
            return JsonScheme({
              "@type": "error",
              "message": "cant_load_model_maybe_empty_or_not_exist",
            });
          }
        }
        return JsonScheme({
          "@type": "error",
          "message": "unimplmented",
        });
      });

      final resultPatch = InvokeParametersLlamaLibraryData.send(
        data: result,
        patchData: patchData,
        invokeParametersLlamaLibraryDataOptions:
            invokeParametersLlamaLibraryDataOptions,
      );

      send(resultPatch);
      return resultPatch;
      // if (parameters is SendLlamaLibraryMessage) {
      //   _sendMessage(
      //     parameters: parameters,
      //     invokeParametersLlamaLibraryDataOptions: invokeParametersLlamaLibraryDataOptions,
      //   );
      //   {
      //     clear();
      //     final chatHistory = LlamaLibraryChatHistory();

      //     // Initialize system prompt
      //     chatHistory.addMessage(
      //       role: LlamaLibraryRole.assistant,
      //       content: """""".trim(),
      //     );

      //     chatHistory.addMessage(role: LlamaLibraryRole.user, content: parameters.text ?? "");
      //     final strm = sendPromptAndStream(
      //       prompt: chatHistory.exportFormat(
      //         LlamaLibraryChatFormat.chatml,
      //       ),
      //     );
      //     StringBuffer stringBuffer = StringBuffer();
      //     strm.stream.listen(
      //       (LLamaResponse element) {
      //         send(UpdateLlamaLibraryMessage.create(
      //           is_done: false,
      //           text: element.result,
      //           special_extra: extra,
      //         ));
      //         stringBuffer.write(element.result);
      //         if (element.isDone) {
      //           return;
      //         }
      //       },
      //       onError: (e, stack) {},
      //     );
      //     await strm.done;
      //     send(UpdateLlamaLibraryMessage.create(
      //       is_done: true,
      //       text: stringBuffer.toString().trim(),
      //       special_extra: extra,
      //     ));
      //     chatHistory.addMessage(
      //       role: LlamaLibraryRole.assistant,
      //       content: stringBuffer.toString().trim(),
      //     );
      //   }
      // }
    }
  }

  @override
  FutureOr<JsonScheme> invoke({
    required InvokeParametersLlamaLibraryData<JsonScheme>
        invokeParametersLlamaLibraryData,
  }) {
    return invokeRaw(
      invokeParametersLlamaLibraryData: invokeParametersLlamaLibraryData,
    );
  }

  @override
  FutureOr<JsonScheme> request({
    required InvokeParametersLlamaLibraryData<JsonScheme>
        invokeParametersLlamaLibraryData,
  }) async {
    return await invoke(
      invokeParametersLlamaLibraryData: invokeParametersLlamaLibraryData,
    );
  }
}

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
class LlamaLibraryIsolateData {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final String sharedLibraryPath;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final SendPort sendPort;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  // final String modelPath;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final InvokeParametersLlamaLibraryDataOptions
      invokeParametersLlamaLibraryDataOptions;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  LlamaLibraryIsolateData({
    required this.sharedLibraryPath,
    required this.sendPort,
    // required this.modelPath,
    required this.invokeParametersLlamaLibraryDataOptions,
  });
}

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
enum LlamaLibraryActionType {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  close,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  clear,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  test;
}
