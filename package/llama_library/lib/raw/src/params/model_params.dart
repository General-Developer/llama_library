part of '../../lcpp.dart';

/// A class representing the parameters for a model.
///
/// The [ModelParams] class holds various configuration options for a model,
/// including the path to the model, and optional parameters for vocabulary,
/// memory mapping, memory locking, and tensor checking.
///
/// The class provides methods to create an instance from a map or JSON string,
/// convert the instance to a map or JSON string, and convert the instance to
/// native parameters.
///
/// Properties:
/// - `path`: The path to the model.
/// - `vocabOnly`: Optional. Whether to use only the vocabulary.
/// - `useMmap`: Optional. Whether to use memory mapping.
/// - `useMlock`: Optional. Whether to use memory locking.
/// - `checkTensors`: Optional. Whether to check tensors.
///
/// Methods:
/// - `ModelParams.fromMap(Map<String, dynamic> map)`: Creates an instance from a map.
/// - `ModelParams.fromJson(String source)`: Creates an instance from a JSON string.
/// - `llama_model_params toNative()`: Converts the instance to native parameters.
/// - `Map<String, dynamic> toMap()`: Converts the instance to a map.
/// - `String toJson()`: Converts the instance to a JSON string.
class ModelParams {
  /// The file path to the model.
  final String path;

  /// Indicates whether only the vocabulary should be loaded.
  ///
  /// If `true`, only the vocabulary is loaded, which can be useful for
  /// certain operations where the full model is not required. If `false`
  /// or `null`, the full model is loaded.
  final bool? vocabOnly;

  /// Indicates whether memory-mapped files should be used.
  ///
  /// If `true`, memory-mapped files will be used, which can improve performance
  /// by allowing the operating system to manage memory more efficiently.
  /// If `false` or `null`, memory-mapped files will not be used.
  final bool? useMmap;

  /// Indicates whether memory locking (mlock) should be used.
  ///
  /// When `true`, the memory used by the application will be locked,
  /// preventing it from being swapped out to disk. This can improve
  /// performance by ensuring that the memory remains in RAM.
  ///
  /// When `false` or `null`, memory locking is not used.
  final bool? useMlock;

  /// A flag indicating whether to check tensors.
  ///
  /// If `true`, tensors will be checked. If `false` or `null`, tensors will not be checked.
  final bool? checkTensors;

  /// Creates a new instance of the [ModelParams] class.
  ///
  /// Parameters:
  /// - `path` (required): The file path to the model.
  /// - `vocabOnly` (optional): A flag indicating whether to load only the vocabulary.
  /// - `useMmap` (optional): A flag indicating whether to use memory-mapped files.
  /// - `useMlock` (optional): A flag indicating whether to lock the model in memory.
  /// - `checkTensors` (optional): A flag indicating whether to check the tensors.
  const ModelParams({
    required this.path,
    this.vocabOnly,
    this.useMmap,
    this.useMlock,
    this.checkTensors,
  });

  /// Creates an instance of [ModelParams] from a map.
  ///
  /// The [map] parameter should contain the following keys:
  /// - `path`: The path to the model.
  /// - `vocabOnly`: A boolean indicating if only the vocabulary should be used.
  /// - `useMmap`: A boolean indicating if memory-mapped files should be used.
  /// - `useMlock`: A boolean indicating if memory locking should be used.
  /// - `checkTensors`: A boolean indicating if tensors should be checked.
  ///
  /// Returns an instance of [ModelParams] with values from the provided map.
  factory ModelParams.fromMap(Map<String, dynamic> map) => ModelParams(path: map['path'], vocabOnly: map['vocabOnly'], useMmap: map['useMmap'], useMlock: map['useMlock'], checkTensors: map['checkTensors']);

  /// Creates a new `ModelParams` instance from a JSON string.
  ///
  /// The [source] parameter is a JSON-encoded string representation of the
  /// `ModelParams` object.
  ///
  /// Returns a `ModelParams` instance created from the decoded JSON map.
  factory ModelParams.fromJson(String source) => ModelParams.fromMap(jsonDecode(source));

  /// Converts the current instance of `model_params` to its native representation.
  ///
  /// This method initializes the native `llama_model_params` structure with default values
  /// and then updates it with the values from the current instance if they are not null.
  ///
  /// Returns:
  ///   A `llama_model_params` instance with the updated values.
  llama_model_params toNative({
    required LlamaLibrarySharedBindingsByGeneralDeveloper generalAiLLamaLibrary,
  }) {
    final llama_model_params modelParams = generalAiLLamaLibrary.llama_model_default_params();
    log("Model params initialized");

    if (vocabOnly != null) {
      modelParams.vocab_only = vocabOnly!;
    }

    if (useMmap != null) {
      modelParams.use_mmap = useMmap!;
    }

    if (useMlock != null) {
      modelParams.use_mlock = useMlock!;
    }

    if (checkTensors != null) {
      modelParams.check_tensors = checkTensors!;
    }

    return modelParams;
  }

  /// Converts the model parameters to a map.
  ///
  /// The map contains the following keys:
  /// - 'path': The file path of the model.
  /// - 'vocabOnly': A boolean indicating if only the vocabulary should be used.
  /// - 'useMmap': A boolean indicating if memory-mapped files should be used.
  /// - 'useMlock': A boolean indicating if memory locking should be used.
  /// - 'checkTensors': A boolean indicating if tensors should be checked.
  ///
  /// Returns a map representation of the model parameters.
  Map<String, dynamic> toMap() => {
        'path': path,
        'vocabOnly': vocabOnly,
        'useMmap': useMmap,
        'useMlock': useMlock,
        'checkTensors': checkTensors,
      };

  /// Converts the model parameters to a JSON string.
  ///
  /// This method uses [toMap] to convert the model parameters to a map,
  /// and then encodes the map to a JSON string using [jsonEncode].
  ///
  /// Returns a JSON string representation of the model parameters.
  String toJson() => jsonEncode(toMap());
}
