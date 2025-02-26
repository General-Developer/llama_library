# Llama Library
 
**Llama Library** Is library for inference any model ai LLAMA / LLM On Edge without api or internet quota, but need resources depends model you want run

[![](https://raw.githubusercontent.com/General-Developer/llama_library/refs/heads/main/assets/demo_background.png)](https://youtu.be/x2z5gI_h5Yk)

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

import 'dart:convert';
import 'dart:io';
import 'package:llama_library/llama_library.dart';
import 'package:llama_library/scheme/scheme/api/send_llama_library_message.dart';
import 'package:llama_library/scheme/scheme/respond/update_llama_library_message.dart'; 

void main(List<String> args) async {
  print("start");
  File modelFile = File(
    "../../../../../big-data/deepseek-r1/deepseek-r1-distill-qwen-1.5b-q4_0.gguf",
  );
  final LlamaLibrary llamaLibrary = LlamaLibrary(
    sharedLibraryPath: "libllama.so",
    invokeParametersLlamaLibraryDataOptions: InvokeParametersLlamaLibraryDataOptions(
      invokeTimeOut: Duration(minutes: 10),
      isThrowOnError: false,
    ),
  );
  await llamaLibrary.ensureInitialized();
  llamaLibrary.loadModel(
    modelPath: modelFile.path,
  );
  llamaLibrary.on(
    eventType: llamaLibrary.eventUpdate,
    onUpdate: (data) {
      final update = data.update;
      if (update is UpdateLlamaLibraryMessage) {
        /// streaming update
        if (update.is_done == false) {
          stdout.write(update.text);
        } else if (update.is_done == true) {
          print("\n\n");
          print("-- done --");
        }
      }
    },
  );
  await llamaLibrary.initialized();

  stdin.listen((e) async {
    print("\n\n");
    final String text = utf8.decode(e).trim();
    if (text == "exit") {
      llamaLibrary.dispose();
      exit(0);
    } else {
      await llamaLibrary.invoke(
        invokeParametersLlamaLibraryData: InvokeParametersLlamaLibraryData(
          parameters: SendLlamaLibraryMessage.create(text: text),
          isVoid: true,
          extra: null,
          invokeParametersLlamaLibraryDataOptions: null,
        ),
      );
    }
  });
}
```

## Reference
 
1. [Ggerganov-llama.cpp](https://github.com/ggerganov/llama.cpp)
  ffi bridge main script so that this program can run


**Copyright (c) 2024 GLOBAL CORPORATION - GENERAL DEVELOPER**


## Example Project Use This Library


- [Llama Application](https://github.com/General-Developer/llama_library/tree/main/examples/llama_app)
    
Minimal simple application example of using whisper library [Youtube Video](https://youtu.be/U-5EDMk0UgE) 
| Mobile                                                                                                                                  | Desktop |
|-----------------------------------------------------------------------------------------------------------------------------------------|---------|
| [![](https://raw.githubusercontent.com/General-Developer/llama_library/refs/heads/main/assets/examples/llama_app/mobile.png)](https://youtu.be/U-5EDMk0UgE) | [![](https://raw.githubusercontent.com/General-Developer/llama_library/refs/heads/main/assets/examples/llama_app/desktop.png)](https://youtu.be/U-5EDMk0UgE)        |

