import 'package:flutter/material.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'dart:math';
import 'package:flex_list/flex_list.dart';
import 'package:tag_music_player/timoncode/functions/roundedCorners.dart';
import 'package:tag_music_player/timoncode/widgets/tagSelector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home();

  final List<Tag> tags = const [
    const Tag(name: 'Banjo', colour: Colors.brown, id: 0),
    const Tag(name: 'Loud', colour: Colors.red, id: 1),
    const Tag(name: 'Vibes', colour: Colors.blueGrey, id: 2),
    const Tag(name: 'Yeet', colour: Colors.deepOrangeAccent, id: 3),
    const Tag(name: 'Yoo', colour: Colors.green, id: 4),
    const Tag(name: 'Skroo', colour: Colors.blue, id: 5),
    const Tag(name: 'Skra', colour: Colors.purple, id: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: TagSelector(tags: tags,),
        ),
      ),
    );
  }
}
