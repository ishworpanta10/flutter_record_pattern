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
    final metadata = document.metadata;
    return Scaffold(
      appBar: AppBar(
        title: Text(metadata.$1),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Last Modified : ${metadata.modified}}'),
          ),
        ],
      ),
    );
  }
}
