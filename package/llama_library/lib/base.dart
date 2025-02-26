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

import 'package:general_lib/dynamic_library/dynamic_library.dart';
import "package:general_lib/event_emitter/event_emitter.dart";
import 'package:general_lib/extension/map.dart';
import 'package:general_lib/json_scheme/json_scheme.dart' show JsonScheme;

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
class UpdateLlamaLibraryData<C extends LlamaLibraryBase, U extends JsonScheme> {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final U update;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final C llamaLibrary;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  UpdateLlamaLibraryData({
    required this.update,
    required this.llamaLibrary,
  });
}

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
class InvokeParametersLlamaLibraryDataOptions {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  Duration invokeTimeOut;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  bool isThrowOnError;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  InvokeParametersLlamaLibraryDataOptions({
    required this.invokeTimeOut,
    required this.isThrowOnError,
  });

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static InvokeParametersLlamaLibraryDataOptions defaultData() {
    return InvokeParametersLlamaLibraryDataOptions(
      invokeTimeOut: Duration(
        minutes: 1,
      ),
      isThrowOnError: false,
    );
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  InvokeParametersLlamaLibraryDataOptions copyWith({
    Duration? invokeTimeOut,
    bool? isThrowOnError,
  }) {
    return InvokeParametersLlamaLibraryDataOptions(
      invokeTimeOut: invokeTimeOut ?? this.invokeTimeOut,
      isThrowOnError: isThrowOnError ?? this.isThrowOnError,
    );
  }
}

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
class InvokeParametersLlamaLibraryData<D extends JsonScheme> {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final D parameters;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final String? extra;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer

  final bool isVoid;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer

  final InvokeParametersLlamaLibraryDataOptions?
      invokeParametersLlamaLibraryDataOptions;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  InvokeParametersLlamaLibraryData({
    required this.parameters,
    required this.isVoid,
    required this.extra,
    required this.invokeParametersLlamaLibraryDataOptions,
  }) {
    if (extra != null) {
      parameters["@extra"] = extra;
    }
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  InvokeParametersLlamaLibraryData copyWith({
    JsonScheme? parameters,
    bool? isVoid,
    String? extra,
    InvokeParametersLlamaLibraryDataOptions?
        invokeParametersLlamaLibraryDataOptions,
  }) {
    return InvokeParametersLlamaLibraryData(
      parameters: parameters ?? this.parameters,
      isVoid: isVoid ?? this.isVoid,
      extra: extra ?? this.extra,
      invokeParametersLlamaLibraryDataOptions:
          invokeParametersLlamaLibraryDataOptions ??
              this.invokeParametersLlamaLibraryDataOptions,
    );
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static RS send<RS extends JsonScheme>({
    required RS data,
    required final Map<String, dynamic> patchData,
    required InvokeParametersLlamaLibraryDataOptions
        invokeParametersLlamaLibraryDataOptions,
  }) {
    data.rawData.general_lib_extension_updateForce(data: patchData);
    if (data["@type"] == "error") {
      if (invokeParametersLlamaLibraryDataOptions.isThrowOnError) {
        throw data;
      }
    }
    return data;
  }
}

///
abstract class LlamaLibraryBaseCore extends GeneralLibraryDynamicLibraryBase {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  FutureOr<JsonScheme> invokeRaw({
    required InvokeParametersLlamaLibraryData invokeParametersLlamaLibraryData,
  });

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  FutureOr<JsonScheme> invoke({
    required InvokeParametersLlamaLibraryData invokeParametersLlamaLibraryData,
  });

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  FutureOr<JsonScheme> request({
    required InvokeParametersLlamaLibraryData invokeParametersLlamaLibraryData,
  });

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  void clear();

  // /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  // StreamController<LLamaResponse> sendPromptAndStream({
  //   required String prompt,
  // });

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  void emit({
    required String eventType,
    required dynamic data,
  });

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  EventEmitterListener on({
    required String eventType,
    required FutureOr<dynamic> Function(
            UpdateLlamaLibraryData updateLlamaLibrary)
        onUpdate,
  });

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  void send(dynamic data);

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  void test();
}

///
abstract class LlamaLibraryBase implements LlamaLibraryBaseCore {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final EventEmitter eventEmitter;

  ///
  final String sharedLibraryPath;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final String eventUpdate;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final String eventInvoke;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final InvokeParametersLlamaLibraryDataOptions
      invokeParametersLlamaLibraryDataOptions;

  ///
  LlamaLibraryBase({
    String? sharedLibraryPath,
    EventEmitter? eventEmitter,
    String? eventUpdate,
    String? eventInvoke,
    InvokeParametersLlamaLibraryDataOptions?
        invokeParametersLlamaLibraryDataOptions,
  })  : sharedLibraryPath = sharedLibraryPath ?? getLibraryWhisperPathDefault(),
        eventEmitter = eventEmitter ?? EventEmitter(),
        eventInvoke = eventInvoke ?? "general_ai_llama_invoke",
        eventUpdate = eventUpdate ?? "general_ai_llama_update",
        invokeParametersLlamaLibraryDataOptions =
            invokeParametersLlamaLibraryDataOptions ??
                InvokeParametersLlamaLibraryDataOptions.defaultData();

  ///
  static String getLibraryWhisperPathDefault() {
    return "libllama.so";
  }
}

// class LlamaLibraryChatMessage {}

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
class LLamaResponse {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final String result;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final bool isDone;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  LLamaResponse({
    required this.isDone,
    required this.result,
  });
}

/// Represents supported chat formats for export
enum LlamaLibraryChatFormat {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  chatml,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  alpaca;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  String get value => name;
}

/// Represents different roles in a chat conversation
enum LlamaLibraryRole {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  unknown,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  system,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  user,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  assistant;

  /// Converts Role enum to its string representation
  String get value {
    return switch (this) {
      LlamaLibraryRole.unknown => 'unknown',
      LlamaLibraryRole.system => 'system',
      LlamaLibraryRole.user => 'user',
      LlamaLibraryRole.assistant => 'assistant',
    };
  }

  /// Creates a Role from a string value
  static LlamaLibraryRole fromString(String value) {
    return switch (value.toLowerCase()) {
      'unknown' => LlamaLibraryRole.unknown,
      'system' => LlamaLibraryRole.system,
      'user' => LlamaLibraryRole.user,
      'assistant' => LlamaLibraryRole.assistant,
      _ => LlamaLibraryRole.unknown,
    };
  }
}

/// Represents a single message in a chat conversation
class LlamaLibraryMessage {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final LlamaLibraryRole role;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final String content;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  const LlamaLibraryMessage({
    required this.role,
    required this.content,
  });

  /// Creates a Message from JSON
  factory LlamaLibraryMessage.fromJson(Map<String, dynamic> json) {
    return LlamaLibraryMessage(
      role: LlamaLibraryRole.fromString(json['role'] as String),
      content: json['content'] as String,
    );
  }

  /// Converts Message to JSON
  Map<String, dynamic> toJson() => {
        'role': role.value,
        'content': content,
      };

  @override
  String toString() => 'Message(role: ${role.value}, content: $content)';
}

/// Manages a collection of chat messages
class LlamaLibraryChatHistory {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final List<LlamaLibraryMessage> messages = [];

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  LlamaLibraryChatHistory();

  /// Adds a new message to the chat history
  void addMessage({
    required LlamaLibraryRole role,
    required String content,
  }) {
    messages.add(LlamaLibraryMessage(role: role, content: content));
  }

  /// Exports chat history in the specified format
  String exportFormat(LlamaLibraryChatFormat format) {
    switch (format) {
      case LlamaLibraryChatFormat.chatml:
        return _exportChatML();
      case LlamaLibraryChatFormat.alpaca:
        return _exportAlpaca();
    }
  }

  /// Exports chat history in ChatML format
  String _exportChatML() {
    final buffer = StringBuffer();

    for (final message in messages) {
      buffer.writeln('<|im_start|>${message.role.value}');
      buffer.writeln(message.content);
      buffer.writeln('<|im_end|>');
    }

    return buffer.toString();
  }

  /// Exports chat history in Alpaca format
  String _exportAlpaca() {
    final buffer = StringBuffer();

    for (final message in messages) {
      switch (message.role) {
        case LlamaLibraryRole.system:
          buffer.writeln('### Instruction:');
        case LlamaLibraryRole.user:
          buffer.writeln('### Input:');
        case LlamaLibraryRole.assistant:
          buffer.writeln('### Response:');
        case LlamaLibraryRole.unknown:
          buffer.writeln('### Unknown:');
      }
      buffer.writeln();
      buffer.writeln(message.content);
      buffer.writeln();
    }

    return buffer.toString();
  }

  /// Creates a ChatHistory from JSON
  factory LlamaLibraryChatHistory.fromJson(Map<String, dynamic> json) {
    final chatHistory = LlamaLibraryChatHistory();
    final messagesList = json['messages'] as List<dynamic>;

    for (final message in messagesList) {
      chatHistory.messages
          .add(LlamaLibraryMessage.fromJson(message as Map<String, dynamic>));
    }

    return chatHistory;
  }

  /// Converts ChatHistory to JSON
  Map<String, dynamic> toJson() => {
        'messages': messages.map((message) => message.toJson()).toList(),
      };

  /// Clears all messages from the chat history
  void clear() => messages.clear();

  /// Returns the number of messages in the chat history
  int get length => messages.length;

  @override
  String toString() => 'ChatHistory(messages: $messages)';
}
