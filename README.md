# Llama Library
 
**Llama Library** Is library for inference any model ai LLAMA / LLM On Edge without api or internet quota, but need resources depends model you want run

[![](https://raw.githubusercontent.com/General-Developer/llama_library/refs/heads/main/assets/demo_background.png)](https://youtu.be/drlqUwJEOg4)

[![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/powered.png)](https://www.youtube.com/@Global_Corporation)

**Copyright (c) 2024 GLOBAL CORPORATION - GENERAL DEVELOPER**

## 📚️ Docs

1. [Documentation](https://youtube.com/@GENERAL_DEV)
2. [Youtube](https://youtube.com/@GENERAL_DEV)
3. [Telegram Support Group](https://t.me/DEVELOPER_GLOBAL_PUBLIC)
4. [Contact Developer](https://github.com/General-Developer) (check social media or readme profile github)

## 🔖️ Features

1. [x] 📱️ **Cross Platform** support (Device, Edge Severless functions)
2. [x] 📜️ **Standarization** Style Code
3. [x] ⌨️ **Cli** (Terminal for help you use this library or create project)
4. [x] 🔥️ **Api** (If you developer bot / userbot you can use this library without interact cli just add library and use 🚀️)
5. [x] 🧩️ **Customizable Extension** (if you want add extension so you can more speed up on development)
6. [x] ✨️ **Pretty Information** (user friendly for newbie)
 
## ❔️ Fun Fact

- **This library 100%** use on every my create project (**App, Server, Bot, Userbot**)

- **This library 100%** support all models from [llama.cpp](https://github.com/ggerganov/llama.cpp) (depending on your device specs, if high then it can be up to turbo, but if low, just choose tiny/small)
 
## 📈️ Proggres
 
- **10-02-2025**
  Starting **Release Stable** With core Features

## Resources

1. [MODEL](https://huggingface.co/ggml-org/Meta-Llama-3.1-8B-Instruct-Q4_0-GGUF)

### 📥️ Install Library

1. **Dart**

```bash
dart pub add llama_library_dart
```

2. **Flutter**

```bash
flutter pub add llama_library_flutter ggml_library_flutter
```

## 🚀️ Quick Start

Example Quickstart script minimal for insight you or make you use this library because very simple

```dart

import 'dart:io';
import 'package:llama_library/llama_library.dart';
import 'package:llama_library/io/chat.dart';

void main(List<String> args) async {
  print("start");

  File modelFile = File(
      "../../../../../big-data/llama/Meta-Llama-3.1-8B-Instruct.Q8_0.gguf");

  final LlamaLibrary llamaLibrary = LlamaLibrary(
    sharedLibraryPath: "../llama_library_flutter/linux/libllama.so",
  );
  await llamaLibrary.ensureInitialized();
  llamaLibrary.loadModel(modelPath: modelFile.path);

  /// call this if you want use llama if in main page / or not in page llama
  /// dont call if on low end specs device
  /// if device can't handle
  /// this program will auto exit because llama need reseources depends model
  /// and fast with modern cpu
  await llamaLibrary.initialized();

  {
    final chatHistory = ChatHistory();

    print('Initializing chat...\n');

    // Initialize system prompt
    chatHistory.addMessage(
      role: Role.assistant,
      content: """""".trim(),
    );

    chatHistory.addMessage(role: Role.user, content: "Apa itu AI?");
    final strm = llamaLibrary.sendPromptAndStream(
      prompt: chatHistory.exportFormat(
        ChatFormat.chatml,
      ),
    );
    StringBuffer stringBuffer = StringBuffer();
    strm.stream.listen((LLamaResponse element) {
      stdout.write(element.result);
      stringBuffer.write(element.result);
      if (element.isDone) {
        return;
      }
    }, onError: (e, stack) {
      print("${e}, ${stack}");
    });
    await strm.done;
    chatHistory.addMessage(
      role: Role.assistant,
      content: stringBuffer.toString().trim(),
    );
  }

  print("\n");
  print("\n");
  await llamaLibrary.dispose();
  llamaLibrary.stop();
  llamaLibrary.close();
  exit(0);
}

```

## Reference
 
1. [Ggerganov-llama.cpp](https://github.com/ggerganov/llama.cpp)
  ffi bridge main script so that this program can run


**Copyright (c) 2024 GLOBAL CORPORATION - GENERAL DEVELOPER**


## Example Project Use This Library


1. [AZKA GRAM](https://github.com/azkadev/azkagram) / [Global GRAM](https://github.com/globalcorporation/global_gram_app)
    
 **Telegram Application** with **redesign** with new some features userbot and other **features which is not officially provided on Telegram** First this project open source but we closed it to **close source** because our program is easy to read and allows other people to edit the source code and then use it for criminal acts
 
|                                                 CHAT PAGE                                                  |                                                SIGN UP PAGE                                                |                                                                                                  HOME PAGE |                                          GUIDE PAGE                                           |
|:----------------------------------------------------------------------------------------------------------:|:----------------------------------------------------------------------------------------------------------:|-----------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------:|
| ![](https://user-images.githubusercontent.com/82513502/205481759-b6815e2f-bd5d-4d72-9570-becd3829dd36.png) | ![](https://user-images.githubusercontent.com/82513502/173319331-9e96fbe7-3e66-44b2-8577-f6685d86a368.png) | ![](https://user-images.githubusercontent.com/82513502/173319541-19a60407-f410-4e95-8ac0-d0da2eaf2457.png) | ![](https://raw.githubusercontent.com/GLXCORP/glx_bot_app/main/screenshots/home_telegram.png) |
