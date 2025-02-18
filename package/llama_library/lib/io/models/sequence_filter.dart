import 'dart:math';

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
class LLamaSequenceFilter {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final String sequence;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  StringBuffer buffer = StringBuffer();

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  LLamaSequenceFilter(this.sequence);

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  String? processChunk(String chunk) {
    for (var i = 0; i < chunk.length; i++) {
      String sub;
      if (buffer.isEmpty) {
        sub = chunk.substring(i);
      } else {
        final budget = min(sequence.length - buffer.length, chunk.length);
        sub = buffer.toString() + chunk.substring(0, budget);
      }

      if (sequence.contains(sub)) {
        buffer.write(sub);
        if (buffer.length == sequence.length) {
          buffer.clear();
        }
      } else {
        String result = chunk.substring(i);

        if (buffer.isNotEmpty) {
          result += buffer.toString();
          buffer.clear();
        }

        return result;
      }
    }
    return null;
  }
}
