// ignore_for_file: constant_identifier_names
part of '../../lcpp.dart';

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
class ContextParams {
  // text context, 0 = from model
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final int? nCtx;

  // logical maximum batch size that can be submitted to llama_decode
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final int? nBatch;

  // physical maximum batch size
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final int? nUBatch;

  // max number of sequences (i.e. distinct states for recurrent models)
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final int? nSeqMax;

  // number of threads to use for generation
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final int? nThreads;

  // number of threads to use for batch processing
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final int? nThreadsBatch;

  // RoPE scaling type, from `enum llama_rope_scaling_type`
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final RopeScalingType? ropeScalingType;

  // whether to pool (sum) embedding results by sequence id
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final PoolingType? poolingType;

  // attention type to use for embeddings
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final AttentionType? attentionType;

  // RoPE base frequency, 0 = from model
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final double? ropeFrequencyBase;

  // RoPE frequency scaling factor, 0 = from model
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final double? ropeFrequencyScale;

  // YaRN extrapolation mix factor, negative = from model
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final double? yarnExtrapolationFactor;

  // YaRN magnitude scaling factor
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final double? yarnAttenuationFactor;

  // YaRN low correction dim
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final double? yarnBetaFast;

  // YaRN high correction dim
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final double? yarnBetaSlow;

  // YaRN original context size
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final int? yarnOriginalContext;

  // defragment the KV cache if holes/size > thold, < 0 disabled (default)
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final double? defragmentationThreshold;

  // data type for K cache
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final GgmlType? typeK;

  // data type for V cache
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final GgmlType? typeV;

  // if true, extract embeddings (together with logits)
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final bool? embeddings;

  // whether to offload the KQV ops (including the KV cache) to GPU
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final bool? offloadKqv;

  // whether to use flash attention
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final bool? flashAttention;

  // whether to measure performance timings
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final bool? noPerformance;

  /// A class representing the parameters for context configuration.
  ///
  /// The parameters include various settings for context size, batch size,
  /// threading, scaling, pooling, attention, and other advanced configurations.
  ///
  /// - `nCtx`: The context size.
  /// - `nBatch`: The batch size.
  /// - `nUBatch`: The unrolled batch size.
  /// - `nSeqMax`: The maximum sequence length.
  /// - `nThreads`: The number of threads.
  /// - `nThreadsBatch`: The number of threads for batch processing.
  /// - `ropeScalingType`: The type of scaling for ROPE (Rotary Position Embedding).
  /// - `poolingType`: The type of pooling to be used.
  /// - `attentionType`: The type of attention mechanism to be used.
  /// - `ropeFrequencyBase`: The base frequency for ROPE.
  /// - `ropeFrequencyScale`: The scaling factor for ROPE frequency.
  /// - `yarnExtrapolationFactor`: The extrapolation factor for YARN.
  /// - `yarnAttenuationFactor`: The attenuation factor for YARN.
  /// - `yarnBetaFast`: The fast beta parameter for YARN.
  /// - `yarnBetaSlow`: The slow beta parameter for YARN.
  /// - `yarnOriginalContext`: The original context for YARN.
  /// - `defragmentationThreshold`: The threshold for defragmentation.
  /// - `typeK`: The type of key embeddings.
  /// - `typeV`: The type of value embeddings.
  /// - `embeddings`: The embeddings to be used.
  /// - `offloadKqv`: Whether to offload KQV (Key, Query, Value) computations.
  /// - `flashAttention`: Whether to use flash attention.
  /// - `noPerformance`: Whether to disable performance optimizations.
  const ContextParams({
    this.nCtx,
    this.nBatch,
    this.nUBatch,
    this.nSeqMax,
    this.nThreads,
    this.nThreadsBatch,
    this.ropeScalingType,
    this.poolingType,
    this.attentionType,
    this.ropeFrequencyBase,
    this.ropeFrequencyScale,
    this.yarnExtrapolationFactor,
    this.yarnAttenuationFactor,
    this.yarnBetaFast,
    this.yarnBetaSlow,
    this.yarnOriginalContext,
    this.defragmentationThreshold,
    this.typeK,
    this.typeV,
    this.embeddings,
    this.offloadKqv,
    this.flashAttention,
    this.noPerformance,
  });

  /// Creates a new instance of [ContextParams] from a map.
  ///
  /// The [map] parameter should contain the following keys:
  /// - `nCtx`: The context size.
  /// - `nBatch`: The batch size.
  /// - `nUBatch`: The unrolled batch size.
  /// - `nSeqMax`: The maximum sequence length.
  /// - `nThreads`: The number of threads.
  /// - `nThreadsBatch`: The number of threads for batch processing.
  /// - `ropeScalingType`: The type of rope scaling, parsed using [RopeScalingType.fromString].
  /// - `poolingType`: The type of pooling, parsed using [PoolingType.fromString].
  /// - `attentionType`: The type of attention, parsed using [AttentionType.fromString].
  /// - `ropeFrequencyBase`: The base frequency for rope.
  /// - `ropeFrequencyScale`: The scale frequency for rope.
  /// - `yarnExtrapolationFactor`: The extrapolation factor for yarn.
  /// - `yarnAttenuationFactor`: The attenuation factor for yarn.
  /// - `yarnBetaFast`: The beta fast parameter for yarn.
  /// - `yarnBetaSlow`: The beta slow parameter for yarn.
  /// - `yarnOriginalContext`: The original context for yarn.
  /// - `defragmentationThreshold`: The threshold for defragmentation.
  /// - `typeK`: The type K, parsed using [GgmlType.fromString].
  /// - `typeV`: The type V, parsed using [GgmlType.fromString].
  /// - `embeddings`: The embeddings.
  /// - `offloadKqv`: The offload KQV parameter.
  /// - `flashAttention`: The flash attention parameter.
  /// - `noPerformance`: The no performance parameter.
  factory ContextParams.fromMap(Map<String, dynamic> map) => ContextParams(
        nCtx: map['nCtx'],
        nBatch: map['nBatch'],
        nUBatch: map['nUBatch'],
        nSeqMax: map['nSeqMax'],
        nThreads: map['nThreads'],
        nThreadsBatch: map['nThreadsBatch'],
        ropeScalingType: map['ropeScalingType'] != null
            ? RopeScalingType.fromString(map['ropeScalingType'])
            : null,
        poolingType: map['poolingType'] != null
            ? PoolingType.fromString(map['poolingType'])
            : null,
        attentionType: map['attentionType'] != null
            ? AttentionType.fromString(map['attentionType'])
            : null,
        ropeFrequencyBase: map['ropeFrequencyBase'],
        ropeFrequencyScale: map['ropeFrequencyScale'],
        yarnExtrapolationFactor: map['yarnExtrapolationFactor'],
        yarnAttenuationFactor: map['yarnAttenuationFactor'],
        yarnBetaFast: map['yarnBetaFast'],
        yarnBetaSlow: map['yarnBetaSlow'],
        yarnOriginalContext: map['yarnOriginalContext'],
        defragmentationThreshold: map['defragmentationThreshold'],
        typeK: map['typeK'] != null ? GgmlType.fromString(map['typeK']) : null,
        typeV: map['typeV'] != null ? GgmlType.fromString(map['typeV']) : null,
        embeddings: map['embeddings'],
        offloadKqv: map['offloadKqv'],
        flashAttention: map['flashAttention'],
        noPerformance: map['noPerformance'],
      );

  /// Creates an instance of [ContextParams] from a JSON string.
  ///
  /// The [source] parameter is a JSON-encoded string representation of the
  /// context parameters.
  ///
  /// Returns an instance of [ContextParams] created from the decoded JSON map.
  factory ContextParams.fromJson(String source) =>
      ContextParams.fromMap(jsonDecode(source));

  /// Converts the current instance to a native `llama_context_params` object.
  ///
  /// This method initializes a `llama_context_params` object with default values
  /// and then updates its fields based on the current instance's properties if they are not null.
  ///
  /// The following fields are set if they are not null:
  /// - `nCtx`: Sets the `n_ctx` field.
  /// - `nBatch`: Sets the `n_batch` field.
  /// - `nUBatch`: Sets the `n_ubatch` field.
  /// - `nSeqMax`: Sets the `n_seq_max` field.
  /// - `nThreads`: Sets the `n_threads` field.
  /// - `nThreadsBatch`: Sets the `n_threads_batch` field.
  /// - `ropeScalingType`: Sets the `rope_scaling_typeAsInt` field (enum index - 1).
  /// - `poolingType`: Sets the `pooling_typeAsInt` field (enum index - 1).
  /// - `attentionType`: Sets the `attention_typeAsInt` field (enum index - 1).
  /// - `ropeFrequencyBase`: Sets the `rope_freq_base` field.
  /// - `ropeFrequencyScale`: Sets the `rope_freq_scale` field.
  /// - `yarnExtrapolationFactor`: Sets the `yarn_ext_factor` field.
  /// - `yarnAttenuationFactor`: Sets the `yarn_attn_factor` field.
  /// - `yarnBetaFast`: Sets the `yarn_beta_fast` field.
  /// - `yarnBetaSlow`: Sets the `yarn_beta_slow` field.
  /// - `yarnOriginalContext`: Sets the `yarn_orig_ctx` field.
  /// - `defragmentationThreshold`: Sets the `defrag_thold` field.
  /// - `typeK`: Sets the `type_kAsInt` field (enum index * 1).
  /// - `typeV`: Sets the `type_vAsInt` field (enum index * 1).
  /// - `embeddings`: Sets the `embeddings` field.
  /// - `offloadKqv`: Sets the `offload_kqv` field.
  /// - `flashAttention`: Sets the `flash_attn` field.
  /// - `noPerformance`: Sets the `no_perf` field.
  ///
  /// Returns:
  /// - A `llama_context_params` object with the updated fields.
  llama_context_params toNative({
    required LlamaLibrarySharedBindingsByGeneralDeveloper generalAiLLamaLibrary,
  }) {
    final llama_context_params contextParams =
        generalAiLLamaLibrary.llama_context_default_params();

    if (nCtx != null) {
      contextParams.n_ctx = nCtx!;
    }

    if (nBatch != null) {
      contextParams.n_batch = nBatch!;
    }

    if (nUBatch != null) {
      contextParams.n_ubatch = nUBatch!;
    }

    if (nSeqMax != null) {
      contextParams.n_seq_max = nSeqMax!;
    }

    if (nThreads != null) {
      contextParams.n_threads = nThreads!;
    }

    if (nThreadsBatch != null) {
      contextParams.n_threads_batch = nThreadsBatch!;
    }

    if (ropeScalingType != null) {
      // This enum starts at -1, so we need to subtract 1 from the index
      contextParams.rope_scaling_type = ropeScalingType!.index - 1;
    }

    if (poolingType != null) {
      // This enum starts at -1, so we need to subtract 1 from the index
      contextParams.pooling_type = poolingType!.index - 1;
    }

    if (attentionType != null) {
      // This enum starts at -1, so we need to subtract 1 from the index
      contextParams.attention_type = attentionType!.index - 1;
    }

    if (ropeFrequencyBase != null) {
      contextParams.rope_freq_base = ropeFrequencyBase!;
    }

    if (ropeFrequencyScale != null) {
      contextParams.rope_freq_scale = ropeFrequencyScale!;
    }

    if (yarnExtrapolationFactor != null) {
      contextParams.yarn_ext_factor = yarnExtrapolationFactor!;
    }

    if (yarnAttenuationFactor != null) {
      contextParams.yarn_attn_factor = yarnAttenuationFactor!;
    }

    if (yarnBetaFast != null) {
      contextParams.yarn_beta_fast = yarnBetaFast!;
    }

    if (yarnBetaSlow != null) {
      contextParams.yarn_beta_slow = yarnBetaSlow!;
    }

    if (yarnOriginalContext != null) {
      contextParams.yarn_orig_ctx = yarnOriginalContext!;
    }

    if (defragmentationThreshold != null) {
      contextParams.defrag_thold = defragmentationThreshold!;
    }

    if (typeK != null) {
      // It may seem redundant to multiply by 1, but it's necessary to convert to a C int
      contextParams.type_k = typeK!.index * 1;
    }

    if (typeV != null) {
      // It may seem redundant to multiply by 1, but it's necessary to convert to a C int
      contextParams.type_v = typeV!.index * 1;
    }

    if (embeddings != null) {
      contextParams.embeddings = embeddings!;
    }

    if (offloadKqv != null) {
      contextParams.offload_kqv = offloadKqv!;
    }

    if (flashAttention != null) {
      contextParams.flash_attn = flashAttention!;
    }

    if (noPerformance != null) {
      contextParams.no_perf = noPerformance!;
    }

    return contextParams;
  }

  /// Converts the context parameters to a map.
  ///
  /// The map contains the following key-value pairs:
  /// - `nCtx`: The context size.
  /// - `nBatch`: The batch size.
  /// - `nUBatch`: The unbatched size.
  /// - `nSeqMax`: The maximum sequence length.
  /// - `nThreads`: The number of threads.
  /// - `nThreadsBatch`: The number of threads for batching.
  /// - `ropeScalingType`: The type of rope scaling, if any.
  /// - `poolingType`: The type of pooling, if any.
  /// - `attentionType`: The type of attention, if any.
  /// - `ropeFrequencyBase`: The base frequency for rope.
  /// - `ropeFrequencyScale`: The scale frequency for rope.
  /// - `yarnExtrapolationFactor`: The extrapolation factor for yarn.
  /// - `yarnAttenuationFactor`: The attenuation factor for yarn.
  /// - `yarnBetaFast`: The fast beta value for yarn.
  /// - `yarnBetaSlow`: The slow beta value for yarn.
  /// - `yarnOriginalContext`: The original context for yarn.
  /// - `defragmentationThreshold`: The threshold for defragmentation.
  /// - `typeK`: The type K, if any.
  /// - `typeV`: The type V, if any.
  /// - `embeddings`: The embeddings.
  /// - `offloadKqv`: Whether to offload KQV.
  /// - `flashAttention`: Whether flash attention is enabled.
  /// - `noPerformance`: Whether performance optimizations are disabled.
  Map<String, dynamic> toMap() => {
        'nCtx': nCtx,
        'nBatch': nBatch,
        'nUBatch': nUBatch,
        'nSeqMax': nSeqMax,
        'nThreads': nThreads,
        'nThreadsBatch': nThreadsBatch,
        'ropeScalingType': ropeScalingType?.name,
        'poolingType': poolingType?.name,
        'attentionType': attentionType?.name,
        'ropeFrequencyBase': ropeFrequencyBase,
        'ropeFrequencyScale': ropeFrequencyScale,
        'yarnExtrapolationFactor': yarnExtrapolationFactor,
        'yarnAttenuationFactor': yarnAttenuationFactor,
        'yarnBetaFast': yarnBetaFast,
        'yarnBetaSlow': yarnBetaSlow,
        'yarnOriginalContext': yarnOriginalContext,
        'defragmentationThreshold': defragmentationThreshold,
        'typeK': typeK?.name,
        'typeV': typeV?.name,
        'embeddings': embeddings,
        'offloadKqv': offloadKqv,
        'flashAttention': flashAttention,
        'noPerformance': noPerformance,
      };

  /// Converts the current object to a JSON string representation.
  ///
  /// This method uses the `toMap` method to first convert the object to a
  /// map, and then encodes the map to a JSON string using `jsonEncode`.
  ///
  /// Returns:
  ///   A JSON string representation of the current object.
  String toJson() => jsonEncode(toMap());
}

/// Enum representing different types of rope scaling.
///
/// The available types are:
/// - `unspecified`: Default value when the type is not specified.
/// - `none`: No scaling applied.
/// - `linear`: Linear scaling.
/// - `yarn`: Yarn scaling.
/// - `longrope`: Long rope scaling.
///
/// Provides a method to convert a string value to the corresponding
/// `RopeScalingType` enum value.
enum RopeScalingType {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  unspecified,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  none,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  linear,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  yarn,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  longrope;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static RopeScalingType fromString(String value) {
    switch (value) {
      case 'none':
        return RopeScalingType.none;
      case 'linear':
        return RopeScalingType.linear;
      case 'yarn':
        return RopeScalingType.yarn;
      case 'longrope':
        return RopeScalingType.longrope;
      default:
        return RopeScalingType.unspecified;
    }
  }
}

/// Enum representing different types of pooling operations.
///
/// The available pooling types are:
/// - `unspecified`: Default value when no pooling type is specified.
/// - `none`: No pooling operation.
/// - `mean`: Mean pooling operation.
/// - `cls`: CLS token pooling operation.
/// - `last`: Last token pooling operation.
/// - `rank`: Rank pooling operation.
///
/// The `fromString` method converts a string value to the corresponding
/// `PoolingType` enum value. If the string does not match any known pooling
/// type, it returns `PoolingType.unspecified`.
enum PoolingType {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  unspecified,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  none,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  mean,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  cls,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  last,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  rank;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static PoolingType fromString(String value) {
    switch (value) {
      case 'none':
        return PoolingType.none;
      case 'mean':
        return PoolingType.mean;
      case 'cls':
        return PoolingType.cls;
      case 'last':
        return PoolingType.last;
      case 'rank':
        return PoolingType.rank;
      default:
        return PoolingType.unspecified;
    }
  }
}

/// Enum representing different types of attention mechanisms.
///
/// - `unspecified`: Default value when the attention type is not specified.
/// - `causal`: Represents causal attention.
/// - `nonCausal`: Represents non-causal attention.
///
/// Provides a method to convert a string representation to an `AttentionType` enum value.
enum AttentionType {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  unspecified,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  causal,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  nonCausal;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static AttentionType fromString(String value) {
    switch (value) {
      case 'causal':
        return AttentionType.causal;
      case 'non-causal':
        return AttentionType.nonCausal;
      default:
        return AttentionType.unspecified;
    }
  }
}

/// Enum representing different GGML (General Graphical Modeling Language) types.
///
/// Each type corresponds to a specific data format or quantization level used in GGML.
///
/// The available types are:
/// - `f32`: 32-bit floating point
/// - `f16`: 16-bit floating point
/// - `q4_0`, `q4_1`, `q4_2`, `q4_3`: 4-bit quantization levels
/// - `q5_0`, `q5_1`: 5-bit quantization levels
/// - `q8_0`, `q8_1`: 8-bit quantization levels
/// - `q2_k`, `q3_k`, `q4_k`, `q5_k`, `q6_k`, `q8_k`: Various quantization levels with different bit depths
/// - `iq2_xxs`, `iq2_xs`, `iq3_xxs`, `iq1_s`, `iq4_nl`, `iq3_s`, `iq2_s`, `iq4_xs`: Integer quantization levels with different bit depths and suffixes
/// - `i8`, `i16`, `i32`, `i64`: Integer types with different bit depths
/// - `f64`: 64-bit floating point
/// - `iq1_m`: Integer quantization with a specific suffix
/// - `bf16`: Brain floating point 16-bit
/// - `q4_0_4_4`, `q4_0_4_8`, `q4_0_8_8`: Mixed quantization levels
/// - `tq1_0`, `tq2_0`: Tensor quantization levels
///
/// The `fromString` method allows converting a string representation of a GGML type to its corresponding enum value.
enum GgmlType {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  f32,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  f16,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q4_0,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q4_1,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q4_2,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q4_3,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q5_0,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q5_1,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q8_0,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q8_1,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q2_k,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q3_k,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q4_k,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q5_k,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q6_k,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q8_k,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  iq2_xxs,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  iq2_xs,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  iq3_xxs,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  iq1_s,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  iq4_nl,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  iq3_s,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  iq2_s,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  iq4_xs,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  i8,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  i16,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  i32,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  i64,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  f64,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  iq1_m,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  bf16,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q4_0_4_4,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q4_0_4_8,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  q4_0_8_8,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  tq1_0,

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  tq2_0;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static GgmlType fromString(String value) {
    switch (value) {
      case 'f32':
        return GgmlType.f32;
      case 'f16':
        return GgmlType.f16;
      case 'q4_0':
        return GgmlType.q4_0;
      case 'q4_1':
        return GgmlType.q4_1;
      case 'q4_2':
        return GgmlType.q4_2;
      case 'q4_3':
        return GgmlType.q4_3;
      case 'q5_0':
        return GgmlType.q5_0;
      case 'q5_1':
        return GgmlType.q5_1;
      case 'q8_0':
        return GgmlType.q8_0;
      case 'q8_1':
        return GgmlType.q8_1;
      case 'q2_k':
        return GgmlType.q2_k;
      case 'q3_k':
        return GgmlType.q3_k;
      case 'q4_k':
        return GgmlType.q4_k;
      case 'q5_k':
        return GgmlType.q5_k;
      case 'q6_k':
        return GgmlType.q6_k;
      case 'q8_k':
        return GgmlType.q8_k;
      case 'iq2_xxs':
        return GgmlType.iq2_xxs;
      case 'iq2_xs':
        return GgmlType.iq2_xs;
      case 'iq3_xxs':
        return GgmlType.iq3_xxs;
      case 'iq1_s':
        return GgmlType.iq1_s;
      case 'iq4_nl':
        return GgmlType.iq4_nl;
      case 'iq3_s':
        return GgmlType.iq3_s;
      case 'iq2_s':
        return GgmlType.iq2_s;
      case 'iq4_xs':
        return GgmlType.iq4_xs;
      case 'i8':
        return GgmlType.i8;
      case 'i16':
        return GgmlType.i16;
      case 'i32':
        return GgmlType.i32;
      case 'i64':
        return GgmlType.i64;
      case 'f64':
        return GgmlType.f64;
      case 'iq1_m':
        return GgmlType.iq1_m;
      case 'bf16':
        return GgmlType.bf16;
      case 'q4_0_4_4':
        return GgmlType.q4_0_4_4;
      case 'q4_0_4_8':
        return GgmlType.q4_0_4_8;
      case 'q4_0_8_8':
        return GgmlType.q4_0_8_8;
      case 'tq1_0':
        return GgmlType.tq1_0;
      case 'tq2_0':
        return GgmlType.tq2_0;
      default:
        return GgmlType.f32;
    }
  }
}
