import 'package:flutter/material.dart';

import 'data/data.dart';
import 'screens/document_screen.dart';

void main() {
  runApp(const DocumentApp());
}

class DocumentApp extends StatelessWidget {
  const DocumentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: DocumentScreen(document: Document()),
    );
  }
}
