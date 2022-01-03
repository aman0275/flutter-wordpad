import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wp = WordPair.random();
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.lime[200]),
      home: Scaffold(
        appBar: AppBar(
          title: Text('WordPad'),
        ),
        body: Center(
          child: Text(wp.asPascalCase),
        ),
      ),
    );
  }
}
