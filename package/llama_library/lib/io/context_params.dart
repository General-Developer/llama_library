import 'dart:convert';
import '../ffi/bindings.dart';

/// RoPE scaling types
enum LlamaRopeScalingType {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  unspecified(-1),

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  none(0),

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  linear(1),

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  yarn(2),

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  maxValue(2);

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final int value;
  const LlamaRopeScalingType(this.value);
}

/// Pooling types for embeddings
enum LlamaPoolingType {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  unspecified(-1),

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  none(0),

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  mean(1),

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  cls(2),

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  last(3),

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  rank(4);

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final int value;
  const LlamaPoolingType(this.value);
}

/// Attention types for embeddings
enum LlamaAttentionType {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  unspecified(-1),

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  causal(0),

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  nonCausal(1);

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final int value;
  const LlamaAttentionType(this.value);
}

/// ContextParams holds configuration settings for the Llama model context
class ContextParams {
  /// Maximum number of tokens to predict/generate in response
  int nPredit = 32;

  /// Text context size. 0 = from model
  int nCtx = 512;

  /// Logical maximum batch size that can be submitted to llama_decode
  int nBatch = 512;

  /// Physical maximum batch size
  int nUbatch = 512;

  /// Max number of sequences (i.e. distinct states for recurrent models)
  int nSeqMax = 1;

  /// Number of threads to use for generation
  int nThreads = 8;

  /// Number of threads to use for batch processing
  int nThreadsBatch = 8;

  /// RoPE scaling type
  LlamaRopeScalingType ropeScalingType = LlamaRopeScalingType.unspecified;

  /// Pooling type for embeddings
  LlamaPoolingType poolingType = LlamaPoolingType.unspecified;

  /// Attention type to use for embeddings
  LlamaAttentionType attentionType = LlamaAttentionType.unspecified;

  /// RoPE base frequency, 0 = from model
  double ropeFreqBase = 0.0;

  /// RoPE frequency scaling factor, 0 = from model
  double ropeFreqScale = 0.0;

  /// YaRN extrapolation mix factor, negative = from model
  double yarnExtFactor = -1.0;

  /// YaRN magnitude scaling factor
  double yarnAttnFactor = 1.0;

  /// YaRN low correction dim
  double yarnBetaFast = 32.0;

  /// YaRN high correction dim
  double yarnBetaSlow = 1.0;

  /// YaRN original context size
  int yarnOrigCtx = 0;

  /// Defragment the KV cache if holes/size > thold, < 0 disabled
  double defragThold = -1.0;

  /// The llama_decode() call computes all logits, not just the last one
  bool logitsAll = false;

  /// If true, extract embeddings (together with logits)
  bool embeddings = false;

  /// Whether to offload the KQV ops (including the KV cache) to GPU
  bool offloadKqv = true;

  /// Whether to use flash attention [EXPERIMENTAL]
  bool flashAttn = false;

  /// Whether to measure performance timings
  bool noPerfTimings = false;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  ContextParams();

  /// Constructs and returns a `llama_context_params` object
  llama_context_params get(
      {required LlamaLibrarySharedBindingsByGeneralDeveloper llama}) {
    final contextParams = llama.llama_context_default_params();

    contextParams.n_ctx = nCtx;
    contextParams.n_batch = nBatch;
    contextParams.n_ubatch = nUbatch;
    contextParams.n_seq_max = nSeqMax;
    contextParams.n_threads = nThreads;
    contextParams.n_threads_batch = nThreadsBatch;
    // contextParams.rope_scaling_type = ropeScalingType.value;
    // contextParams.pooling_type = poolingType.value;
    // contextParams.attention_type = attentionType.value;
    contextParams.rope_freq_base = ropeFreqBase;
    contextParams.rope_freq_scale = ropeFreqScale;
    contextParams.yarn_ext_factor = yarnExtFactor;
    contextParams.yarn_attn_factor = yarnAttnFactor;
    contextParams.yarn_beta_fast = yarnBetaFast;
    contextParams.yarn_beta_slow = yarnBetaSlow;
    contextParams.yarn_orig_ctx = yarnOrigCtx;
    contextParams.defrag_thold = defragThold;
    contextParams.logits_all = logitsAll;
    contextParams.embeddings = embeddings;
    contextParams.offload_kqv = offloadKqv;
    contextParams.flash_attn = flashAttn;
    contextParams.no_perf = noPerfTimings;

    return contextParams;
  }

  /// Creates a ContextParams instance from JSON
  factory ContextParams.fromJson(Map<String, dynamic> json) {
    return ContextParams()
      ..nCtx = json['nCtx'] ?? 512
      ..nBatch = json['nBatch'] ?? 512
      ..nUbatch = json['nUbatch'] ?? 512
      ..nSeqMax = json['nSeqMax'] ?? 1
      ..nThreads = json['nThreads'] ?? 8
      ..nThreadsBatch = json['nThreadsBatch'] ?? 8
      ..ropeScalingType = LlamaRopeScalingType.values[
          json['ropeScalingType'] ?? LlamaRopeScalingType.unspecified.value + 1]
      ..poolingType = LlamaPoolingType
          .values[json['poolingType'] ?? LlamaPoolingType.unspecified.value + 1]
      ..attentionType = LlamaAttentionType.values[
          json['attentionType'] ?? LlamaAttentionType.unspecified.value + 1]
      ..ropeFreqBase = json['ropeFreqBase']?.toDouble() ?? 0.0
      ..ropeFreqScale = json['ropeFreqScale']?.toDouble() ?? 0.0
      ..yarnExtFactor = json['yarnExtFactor']?.toDouble() ?? -1.0
      ..yarnAttnFactor = json['yarnAttnFactor']?.toDouble() ?? 1.0
      ..yarnBetaFast = json['yarnBetaFast']?.toDouble() ?? 32.0
      ..yarnBetaSlow = json['yarnBetaSlow']?.toDouble() ?? 1.0
      ..yarnOrigCtx = json['yarnOrigCtx'] ?? 0
      ..defragThold = json['defragThold']?.toDouble() ?? -1.0
      ..logitsAll = json['logitsAll'] ?? false
      ..embeddings = json['embeddings'] ?? false
      ..offloadKqv = json['offloadKqv'] ?? true
      ..flashAttn = json['flashAttn'] ?? false
      ..noPerfTimings = json['noPerfTimings'] ?? false;
  }

  /// Converts to JSON
  Map<String, dynamic> toJson() => {
        'nCtx': nCtx,
        'nBatch': nBatch,
        'nUbatch': nUbatch,
        'nSeqMax': nSeqMax,
        'nThreads': nThreads,
        'nThreadsBatch': nThreadsBatch,
        'ropeScalingType': ropeScalingType.value + 1,
        'poolingType': poolingType.value + 1,
        'attentionType': attentionType.value + 1,
        'ropeFreqBase': ropeFreqBase,
        'ropeFreqScale': ropeFreqScale,
        'yarnExtFactor': yarnExtFactor,
        'yarnAttnFactor': yarnAttnFactor,
        'yarnBetaFast': yarnBetaFast,
        'yarnBetaSlow': yarnBetaSlow,
        'yarnOrigCtx': yarnOrigCtx,
        'defragThold': defragThold,
        'logitsAll': logitsAll,
        'embeddings': embeddings,
        'offloadKqv': offloadKqv,
        'flashAttn': flashAttn,
        'noPerfTimings': noPerfTimings,
      };

  @override
  String toString() => jsonEncode(toJson());
}
