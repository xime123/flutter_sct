import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_sct/RandomWords.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   //final wordPair=new WordPair("xu", "min");
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        body: new Center(
          //child: new Text('Hello World'),
          child: new RandomWords(),
        ),
      ),
    );
  }
}