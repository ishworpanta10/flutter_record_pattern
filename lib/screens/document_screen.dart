import 'package:flutter/material.dart';

import '../data/data.dart';

class DocumentScreen extends StatelessWidget {
  final Document document;

  const DocumentScreen({
    required this.document,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final metadata = document.metadata;
    // final (title, modified: modified) = document.metadata;
    final (title, :modified) = document.metadata;
    //variable pattern :modified is shorthand for modified: modified
    //if you want a new local variable of a different name, you can write modified: localModified instead.

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Last Modified : $modified}'),
          ),
        ],
      ),
    );
  }
}
