part of 'package:llama_library/io/core/core.dart';

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
extension LlamaLibraryExtensionSendMessaage on LlamaLibrary {
  Future<UpdateLlamaLibraryMessage> _sendMessage({
    required SendLlamaLibraryMessage parameters,
    required final String extra,
    required InvokeParametersLlamaLibraryDataOptions
        invokeParametersLlamaLibraryDataOptions,
  }) async {
    if (_isInIsolate == false) {
      return UpdateLlamaLibraryMessage({});
    }

    final chatHistory = LlamaLibraryChatHistory();

    // Initialize system prompt
    chatHistory.addMessage(
      role: LlamaLibraryRole.assistant,
      content: """""".trim(),
    );

    chatHistory.addMessage(
        role: LlamaLibraryRole.user, content: parameters.text ?? "");
    final String prompt = chatHistory.exportFormat(
      LlamaLibraryChatFormat.chatml,
    );

    int nPrompt = 0;
    int nPredict = LlamaLibrary._nPredict;
    int nPos = 0;

    Pointer<llama_token> tokens = nullptr;
    Pointer<llama_token> tokenPtr = malloc<llama_token>();

    /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
    late llama_batch batch;

    /// clear
    {
      // Free current tokens if they exist
      if (tokens != nullptr) {
        malloc.free(tokens);
        tokens = nullptr;
      }

      // Reset internal state
      nPrompt = 0;
      nPos = 0;

      // Reset the context state
      if (LlamaLibrary._llamaContext.address != 0) {
        LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
            .llama_kv_cache_clear(LlamaLibrary._llamaContext);
      }

      // Reset batch
      batch = LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
          .llama_batch_init(0, 0, 1);
    }

    /// send Prompt
    {
      // Free previous tokens if they exist
      if (tokens != nullptr) {
        malloc.free(tokens);
      }

      final promptPtr = prompt.toNativeUtf8().cast<Char>();
      nPrompt = -LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
          .llama_tokenize(LlamaLibrary._vocab, promptPtr, prompt.length,
              nullptr, 0, true, true);

      tokens = malloc<llama_token>(nPrompt);
      if (LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
              .llama_tokenize(LlamaLibrary._vocab, promptPtr, prompt.length,
                  tokens, nPrompt, true, true) <
          0) {
        return UpdateLlamaLibraryMessage({
          "@type": "error",
          "message": "failed_to_tokenize_prompt",
        });
      }

      batch = LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
          .llama_batch_get_one(tokens, nPrompt);
      nPos = 0;
    }
    final StringBuffer stringBuffer = StringBuffer();

    while (true) {
      await Future.delayed(Duration(microseconds: 1));

      if (nPos + batch.n_tokens >= nPrompt + nPredict) {
        return UpdateLlamaLibraryMessage.create(
          is_done: true,
          text: "",
          special_extra: extra,
        );
      }

      if (LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
              .llama_decode(LlamaLibrary._llamaContext, batch) !=
          0) {
        return UpdateLlamaLibraryMessage.create(
          is_done: true,
          text: "",
          special_extra: extra,
        );
      }

      nPos += batch.n_tokens;
      int newTokenId = LlamaLibrary
          ._llamaLibrarySharedBindingsByGeneralDeveloper
          .llama_sampler_sample(
              LlamaLibrary._llamaSampler, LlamaLibrary._llamaContext, -1);

      if (LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
          .llama_token_is_eog(LlamaLibrary._vocab, newTokenId)) {
        return UpdateLlamaLibraryMessage.create(
          is_done: true,
          text: "",
          special_extra: extra,
        );
      }
      final buf = malloc<Char>(128);
      int n = LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
          .llama_token_to_piece(
              LlamaLibrary._vocab, newTokenId, buf, 128, 0, true);

      if (n < 0) {
        return UpdateLlamaLibraryMessage.create(
          is_done: true,
          text: "",
          special_extra: extra,
        );
      }

      String piece = String.fromCharCodes(buf.cast<Uint8>().asTypedList(n));

      tokenPtr.value = newTokenId;
      batch = LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
          .llama_batch_get_one(tokenPtr, 1);

      final bool isEos = newTokenId ==
          LlamaLibrary._llamaLibrarySharedBindingsByGeneralDeveloper
              .llama_token_eos(LlamaLibrary._vocab);

      send(UpdateLlamaLibraryMessage.create(
        is_done: false,
        text: piece,
        special_extra: extra,
      ));
      if (isEos) {
        break;
      }
    }
    if (tokens != nullptr) {
      malloc.free(tokens);
    }
    if (tokenPtr != nullptr) {
      malloc.free(tokenPtr);
    }

    return UpdateLlamaLibraryMessage.create(
      is_done: true,
      text: stringBuffer.toString().trim(),
      special_extra: extra,
    );
  }
}
