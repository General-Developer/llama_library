import 'prompt_format.dart';

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
class ChatMLFormat extends LLamaPromptFormat {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  ChatMLFormat()
      : super(
          LLamaPromptFormatType.chatml,
          inputSequence: '<|im_start|>user',
          outputSequence: '<|im_start|>assistant',
          systemSequence: '<|im_start|>system',
          stopSequence: '<|im_end|>',
        );

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  String preparePrompt(String prompt,
      [String role = "user", bool assistant = true]) {
    prompt = '<|im_start|>$role\n$prompt\n<|im_end|>\n';
    if (assistant) {
      prompt += '<|im_start|>assistant\n';
    }
    return prompt;
  }
}
