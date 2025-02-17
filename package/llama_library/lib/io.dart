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
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:general_lib/event_emitter/event_emitter.dart';
import 'package:general_lib/stream/core.dart';
import 'package:general_lib/stream/extension.dart';
import 'base.dart';
import 'ffi/bindings.dart';
import 'io/context_params.dart';
import 'io/model_params.dart';
import 'io/sampler_params.dart';

///
class LlamaLibrary extends LlamaLibraryBase {
  // ignore: prefer_final_fields
  bool _isInIsolate = true;

  ///
  LlamaLibrary({
    String? sharedLibraryPath,
  }) : super(
          sharedLibraryPath: sharedLibraryPath ?? LlamaLibraryBase.getLibraryWhisperPathDefault(),
        );

  ///
  static late final LlamaLibrarySharedBindingsByGeneralDeveloper _llamaLibrary;
  // ignore: prefer_final_fields
  static Pointer<llama_model> _modelContext = nullptr;
  // ignore: prefer_final_fields
  static Pointer<llama_context> _llamaContext = nullptr;
  // ignore: prefer_final_fields
  static Pointer<llama_sampler> _llamaSampler = nullptr;
  // ignore: prefer_final_fields

  static Pointer<llama_vocab> _vocab = nullptr;

  static bool _isEnsureInitialized = false;

  static String _modelPath = "";

  @override
  Future<void> ensureInitialized() async {
    if (_isEnsureInitialized) {
      return;
    }

    try {
      LlamaLibrary._llamaLibrary = LlamaLibrarySharedBindingsByGeneralDeveloper(
        DynamicLibrary.open(
          sharedLibraryPath,
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
  bool loadModel({
    required String modelPath,
  }) {
    if (_isInIsolate) {}
    {
      LlamaLibrary._modelPath = modelPath;
    }
    if (_isInIsolate == false) {
      return true;
    }

    if (isDeviceSupport() == false || isCrash()) {
      return false;
    }
    LlamaLibrary._llamaLibrary.ggml_backend_load_all();
    LlamaLibrary._llamaLibrary.llama_backend_init();

    final ModelParams modelParamsDart = ModelParams();
    var modelParams = modelParamsDart.get(
      llama: LlamaLibrary._llamaLibrary,
    );

    final modelPathPtr = LlamaLibrary._modelPath.toNativeUtf8().cast<Char>();
    try {
      LlamaLibrary._modelContext = LlamaLibrary._llamaLibrary.llama_load_model_from_file(modelPathPtr, modelParams);
      if (LlamaLibrary._modelContext.address == 0) {
        // throw LlamaException("Could not load model at $modelPath");
      }
    } finally {
      malloc.free(modelPathPtr);
    }
    LlamaLibrary._vocab = LlamaLibrary._llamaLibrary.llama_model_get_vocab(LlamaLibrary._modelContext);

    const size = 512 * 4;
    ContextParams contextParamsDart = ContextParams();
    contextParamsDart.nThreadsBatch = 4;
    contextParamsDart.nThreads = 4;
    contextParamsDart.nCtx = size;
    contextParamsDart.nBatch = size;
    contextParamsDart.nUbatch = size;
    contextParamsDart.nPredit = 512;

    _nPredict = contextParamsDart.nPredit;

    var contextParams = contextParamsDart.get(
      llama: LlamaLibrary._llamaLibrary,
    );

    LlamaLibrary._llamaContext = LlamaLibrary._llamaLibrary.llama_new_context_with_model(LlamaLibrary._modelContext, contextParams);
    if (LlamaLibrary._llamaContext.address == 0) {}

    final samplerParams = SamplerParams();

    // Initialize sampler chain
    llama_sampler_chain_params sparams = LlamaLibrary._llamaLibrary.llama_sampler_chain_default_params();
    sparams.no_perf = false;
    LlamaLibrary._llamaSampler = LlamaLibrary._llamaLibrary.llama_sampler_chain_init(sparams);

    // Add samplers based on params
    if (samplerParams.greedy) {
      LlamaLibrary._llamaLibrary.llama_sampler_chain_add(LlamaLibrary._llamaSampler, LlamaLibrary._llamaLibrary.llama_sampler_init_greedy());
    }

    LlamaLibrary._llamaLibrary.llama_sampler_chain_add(LlamaLibrary._llamaSampler, LlamaLibrary._llamaLibrary.llama_sampler_init_dist(samplerParams.seed));

    if (samplerParams.softmax) {
      LlamaLibrary._llamaLibrary.llama_sampler_chain_add(LlamaLibrary._llamaSampler, LlamaLibrary._llamaLibrary.llama_sampler_init_softmax());
    }

    LlamaLibrary._llamaLibrary.llama_sampler_chain_add(LlamaLibrary._llamaSampler, LlamaLibrary._llamaLibrary.llama_sampler_init_top_k(samplerParams.topK));
    LlamaLibrary._llamaLibrary.llama_sampler_chain_add(LlamaLibrary._llamaSampler, LlamaLibrary._llamaLibrary.llama_sampler_init_top_p(samplerParams.topP, samplerParams.topPKeep));
    LlamaLibrary._llamaLibrary.llama_sampler_chain_add(LlamaLibrary._llamaSampler, LlamaLibrary._llamaLibrary.llama_sampler_init_min_p(samplerParams.minP, samplerParams.minPKeep));
    LlamaLibrary._llamaLibrary.llama_sampler_chain_add(LlamaLibrary._llamaSampler, LlamaLibrary._llamaLibrary.llama_sampler_init_typical(samplerParams.typical, samplerParams.typicalKeep));
    LlamaLibrary._llamaLibrary.llama_sampler_chain_add(LlamaLibrary._llamaSampler, LlamaLibrary._llamaLibrary.llama_sampler_init_temp(samplerParams.temp));
    LlamaLibrary._llamaLibrary.llama_sampler_chain_add(LlamaLibrary._llamaSampler, LlamaLibrary._llamaLibrary.llama_sampler_init_xtc(samplerParams.xtcTemperature, samplerParams.xtcStartValue, samplerParams.xtcKeep, samplerParams.xtcLength));

    LlamaLibrary._llamaLibrary.llama_sampler_chain_add(LlamaLibrary._llamaSampler, LlamaLibrary._llamaLibrary.llama_sampler_init_mirostat(LlamaLibrary._llamaLibrary.llama_n_vocab(LlamaLibrary._vocab), samplerParams.seed, samplerParams.mirostatTau, samplerParams.mirostatEta, samplerParams.mirostatM));

    LlamaLibrary._llamaLibrary.llama_sampler_chain_add(LlamaLibrary._llamaSampler, LlamaLibrary._llamaLibrary.llama_sampler_init_mirostat_v2(samplerParams.seed, samplerParams.mirostat2Tau, samplerParams.mirostat2Eta));

    final grammarStrPtr = samplerParams.grammarStr.toNativeUtf8().cast<Char>();
    final grammarRootPtr = samplerParams.grammarRoot.toNativeUtf8().cast<Char>();
    LlamaLibrary._llamaLibrary.llama_sampler_chain_add(LlamaLibrary._llamaSampler, LlamaLibrary._llamaLibrary.llama_sampler_init_grammar(LlamaLibrary._vocab, grammarStrPtr, grammarRootPtr));
    calloc.free(grammarStrPtr);
    calloc.free(grammarRootPtr);

    /*LlamaLibrary._llamaLibrary.llama_sampler_chain_add(
        LlamaLibrary._llamaSampler,
        LlamaLibrary._llamaLibrary.llama_sampler_init_penalties(
            LlamaLibrary._llamaLibrary.llama_n_vocab(vocab),
            LlamaLibrary._llamaLibrary.llama_token_eos(vocab).toDouble(),
            LlamaLibrary._llamaLibrary.llama_token_nl(vocab).toDouble(),
            samplerParams.penaltyLastTokens.toDouble(),
            samplerParams.penaltyRepeat,
            samplerParams.penaltyFreq,
            samplerParams.penaltyPresent,
            samplerParams.penaltyNewline,
            samplerParams.ignoreEOS));*/

    LlamaLibrary._llamaLibrary.llama_sampler_chain_add(
        LlamaLibrary._llamaSampler,
        LlamaLibrary._llamaLibrary.llama_sampler_init_penalties(
          samplerParams.penaltyLastTokens,
          samplerParams.penaltyRepeat,
          samplerParams.penaltyFreq,
          samplerParams.penaltyPresent,
        ));

    // Add DRY sampler
    final seqBreakers = samplerParams.dryBreakers;
    final numBreakers = seqBreakers.length;
    final seqBreakersPointer = calloc<Pointer<Char>>(numBreakers);

    try {
      for (var i = 0; i < numBreakers; i++) {
        seqBreakersPointer[i] = seqBreakers[i].toNativeUtf8().cast<Char>();
      }

      LlamaLibrary._llamaLibrary.llama_sampler_chain_add(
          LlamaLibrary._llamaSampler,
          LlamaLibrary._llamaLibrary.llama_sampler_init_penalties(
            samplerParams.penaltyLastTokens,
            samplerParams.penaltyRepeat,
            samplerParams.penaltyFreq,
            samplerParams.penaltyPresent,
          ));
    } finally {
      // Clean up DRY sampler allocations
      for (var i = 0; i < numBreakers; i++) {
        calloc.free(seqBreakersPointer[i]);
      }
      calloc.free(seqBreakersPointer);
    }

    // LlamaLibrary._llamaLibrary.llama_sampler_chain_add(LlamaLibrary._llamaSampler, LlamaLibrary._llamaLibrary.llama_sampler_init_infill(model));

    _tokenPtr = malloc<llama_token>();

    return true;
  }

  @override
  Future<void> initialized() async {
    // Isolate isolate = await Isolate.spawn(entryPoint, message);
  }

  @override
  FutureOr<void> close() async {
    if (_isInIsolate == false) {
      return;
    }

    if (_modelContext != nullptr) {
      LlamaLibrary._llamaLibrary.llama_free_model(_modelContext);
    }
    if (_llamaSampler != nullptr) {
      LlamaLibrary._llamaLibrary.llama_sampler_free(_llamaSampler);
    }
    if (_llamaContext != nullptr) {
      LlamaLibrary._llamaLibrary.llama_free(_llamaContext);
    }
    return;
  }

  @override
  void stop() {}

  @override
  void emit({required String eventType, required data}) {}

  @override
  EventEmitterListener on({required String eventType, required FutureOr Function(dynamic data) onUpdate}) {
    throw UnimplementedError();
  }

  int _nPrompt = 0;
  int _nPredict = 32;
  int _nPos = 0;

  Pointer<llama_token> _tokens = nullptr;
  Pointer<llama_token> _tokenPtr = nullptr;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  late llama_batch batch;

  /// Generates the next token in the sequence.
  ///
  /// Returns a tuple containing the generated text and a boolean indicating if generation is complete.
  /// Throws [LlamaException] if generation fails.
  @override
  StreamController<LLamaResponse> sendPromptAndStream({
    required String prompt,
  }) {
    return GeneralLibraryStream.generalLibraryCreateStreamController<LLamaResponse>(
      onStreamController: (streamController, delayDuration) async {
        await streamController.generalLibraryUtilsIsCanSendNow();
        /// send Prompt
        {
          // Free previous tokens if they exist
          if (_tokens != nullptr) {}

          final promptPtr = prompt.toNativeUtf8().cast<Char>();
          _nPrompt = -LlamaLibrary._llamaLibrary.llama_tokenize(_vocab, promptPtr, prompt.length, nullptr, 0, true, true);

          _tokens = malloc<llama_token>(_nPrompt);
          if (LlamaLibrary._llamaLibrary.llama_tokenize(_vocab, promptPtr, prompt.length, _tokens, _nPrompt, true, true) < 0) {
            streamController.addError("Failed to tokenize prompt", StackTrace.current);
            streamController.close();
            return;
          }

          batch = LlamaLibrary._llamaLibrary.llama_batch_get_one(_tokens, _nPrompt);
          _nPos = 0;
        }

        while (true) {
          await Future.delayed(Duration(microseconds: 1));
          await streamController.generalLibraryUtilsIsCanSendNow();

          {
            if (_nPos + batch.n_tokens >= _nPrompt + _nPredict) {
              streamController.add(LLamaResponse(
                result: "",
                isDone: true,
              ));
              streamController.close();
              return;
            }

            if (LlamaLibrary._llamaLibrary.llama_decode(LlamaLibrary._llamaContext, batch) != 0) {
              streamController.add(LLamaResponse(
                result: "",
                isDone: true,
              ));
              streamController.close();
              return;
            }

            _nPos += batch.n_tokens;
            int newTokenId = LlamaLibrary._llamaLibrary.llama_sampler_sample(LlamaLibrary._llamaSampler, LlamaLibrary._llamaContext, -1);

            if (LlamaLibrary._llamaLibrary.llama_token_is_eog(LlamaLibrary._vocab, newTokenId)) {
              streamController.add(LLamaResponse(
                result: "",
                isDone: true,
              ));
              streamController.close();
              return;
            }
            final buf = malloc<Char>(128);
            int n = LlamaLibrary._llamaLibrary.llama_token_to_piece(LlamaLibrary._vocab, newTokenId, buf, 128, 0, true);

            if (n < 0) {
              streamController.add(LLamaResponse(
                result: "",
                isDone: true,
              ));
              streamController.close();
              return;
            }

            String piece = String.fromCharCodes(buf.cast<Uint8>().asTypedList(n));

            _tokenPtr.value = newTokenId;
            batch = LlamaLibrary._llamaLibrary.llama_batch_get_one(_tokenPtr, 1);

            bool isEos = newTokenId == LlamaLibrary._llamaLibrary.llama_token_eos(LlamaLibrary._vocab);

            streamController.add(LLamaResponse(
              result: piece,
              isDone: isEos,
            ));
            // streamController.close();
            // return;
          }
        }
      },
    );
  }


  @override
  FutureOr<void> dispose() async {}
}
