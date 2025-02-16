import 'sequence_filter.dart';

/// An enumeration representing different types of LLM Prompt Formats.
/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
enum PromptFormatType {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  raw,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  chatml,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  alpaca,
}

/// A class representing a LLM Prompt Format.
abstract class PromptFormat {
  late List<SequenceFilter> _filters;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final PromptFormatType type;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final String inputSequence;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final String outputSequence;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final String systemSequence;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final String? stopSequence;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  PromptFormat(this.type,
      {required this.inputSequence,
      required this.outputSequence,
      required this.systemSequence,
      this.stopSequence}) {
    var tempFilters = [
      SequenceFilter(inputSequence),
      SequenceFilter(outputSequence),
      SequenceFilter(systemSequence)
    ];

    if (stopSequence != null) {
      tempFilters.add(SequenceFilter(stopSequence!));
    }

    _filters = tempFilters;
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  String? filterResponse(String response) {
    // Iteratively process the response through each filter
    List<String?> chunks = [];
    for (var filter in _filters) {
      chunks.add(filter.processChunk(response));
    }

    // If any of the _filters return null, the response is incomplete
    for (var chunk in chunks) {
      if (chunk == null) return null;
    }

    // Return the longest chunk
    return chunks.reduce((a, b) => a!.length > b!.length ? a : b);
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  String formatPrompt(String prompt) {
    if (stopSequence != null) {
      return '$inputSequence$prompt$stopSequence$outputSequence';
    }
    return '$inputSequence$prompt$outputSequence';
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  String formatMessages(List<Map<String, dynamic>> messages) {
    String formattedMessages = '';
    for (var message in messages) {
      if (message['role'] == 'user') {
        formattedMessages += '$inputSequence${message['content']}';
      } else if (message['role'] == 'assistant') {
        formattedMessages += '$outputSequence${message['content']}';
      } else if (message['role'] == 'system') {
        formattedMessages += '$systemSequence${message['content']}';
      }

      if (stopSequence != null) {
        formattedMessages += stopSequence!;
      }
    }
    return formattedMessages;
  }
}
