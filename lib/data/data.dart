import 'dart:convert';

import 'sealed_class_for_block.dart';

class Document {
  final Map<String, Object?> _json;
  Document() : _json = jsonDecode(documentJson);

//   (String, {DateTime modified}) get metadata {
//     const title = 'My Document From Doc';
//     final now = DateTime.now();
//
//     return (title, modified: now);
//   }

  // (String, {DateTime modified}) get metadata {
  //   if (_json.containsKey('metadata')) {
  //     // Modify from here...
  //     final metadataJson = _json['metadata'];
  //     if (metadataJson is Map) {
  //       final title = metadataJson['title'] as String;
  //       final localModified = DateTime.parse(metadataJson['modified'] as String);
  //       return (title, modified: localModified);
  //     }
  //   }
  //   throw const FormatException('Unexpected JSON'); // to here.
  // }

  (String, {DateTime modified}) get metadata {
    if (_json // Modify from here...
        case {
          'metadata': {
            'title': String title,
            'modified': String localModified,
          }
        }) {
      return (title, modified: DateTime.parse(localModified));
    } else {
      throw const FormatException('Unexpected JSON');
    }
  }

  List<Block> getBlocks() {
    if (_json case {'blocks': List blocksJson}) {
      return [for (final blockJson in blocksJson) Block.fromJson(blockJson)];
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }
}

const documentJson = '''
{
  "metadata": {
    "title": "My Document",
    "modified": "2023-05-10"
  },
  "blocks": [
    {
      "type": "h1",
      "text": "Chapter 1"
    },
    {
      "type": "p",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      "type": "checkbox",
      "checked": true,
      "text": "Learn Dart 3"
    }
  ]
}
''';
