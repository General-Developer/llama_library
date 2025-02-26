import 'default.dart';

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
final List<Map<String, dynamic>> llamaLibraryApiSchemes = () {
  return <Map<String, dynamic>>[
    {
      "@type": "send${LlamaLibrarySchemeDefaultData.namespace}Message",
      "text": "",
      "is_stream": false,
    },
    {
      "@type": "loadModelFromFile${LlamaLibrarySchemeDefaultData.namespace}",
      "model_file_path": ""
    },
  ];
}();
