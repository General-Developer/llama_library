part of '../lcpp.dart';

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef ChatMessageRecord = (String role, String content);

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
class ChatMessage {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final String role;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  String content;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  ChatMessage({
    required this.role,
    required this.content,
  });

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  ChatMessage.fromRecord(ChatMessageRecord record)
      : role = record.$1,
        content = record.$2;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  ChatMessage.fromNative(llama_chat_message message)
      : role = message.role.cast<Utf8>().toDartString(),
        content = message.content.cast<Utf8>().toDartString();

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  llama_chat_message toNative() {
    final message = calloc<llama_chat_message>();
    message.ref.role = role.toNativeUtf8().cast<ffi.Char>();
    message.ref.content = content.toNativeUtf8().cast<ffi.Char>();

    return message.ref;
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  ChatMessageRecord toRecord() => (role, content);
}

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
extension ChatMessages on List<ChatMessage> {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static List<ChatMessage> fromRecords(List<ChatMessageRecord> records) {
    final List<ChatMessage> messages = [];

    for (var record in records) {
      messages.add(ChatMessage.fromRecord(record));
    }

    return messages;
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  ffi.Pointer<llama_chat_message> toNative() {
    final messages = calloc<llama_chat_message>(length);

    for (var i = 0; i < length; i++) {
      messages[i] = this[i].toNative();
    }

    return messages;
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  List<ChatMessageRecord> toRecords() {
    final List<ChatMessageRecord> records = [];

    for (var i = 0; i < length; i++) {
      records.add(this[i].toRecord());
    }

    return records;
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  List<ChatMessage> copy() {
    final List<ChatMessage> messages = [];

    for (var message in this) {
      messages.add(ChatMessage(role: message.role, content: message.content));
    }

    return messages;
  }
}

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
extension LlamaChatMessagePtrExtension on ffi.Pointer<llama_chat_message> {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  void free(int length) {
    for (var i = 0; i < length; i++) {
      calloc.free(this[i].role);
      calloc.free(this[i].content);
    }

    calloc.free(this);
  }
}
