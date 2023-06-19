import 'package:flutter/material.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'dart:math';
import 'package:flex_list/flex_list.dart';
import 'package:tag_music_player/timoncode/functions/roundedCorners.dart';
import 'package:tag_music_player/timoncode/widgets/tag_groups/tagSelector.dart';
import 'package:tag_music_player/timoncode/widgets/tag_groups/filterTagsSelector.dart';

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
  Home();

  List<Tag> tags = [
    Tag(name: 'Banjo', colourIndex: 0, id: 0),
    Tag(name: 'Loud', colourIndex: 1, id: 1),
    Tag(name: 'Vibes', colourIndex: 2, id: 2),
    Tag(name: 'Yeet', colourIndex: 3, id: 3),
    Tag(name: 'Yoo', colourIndex: 4, id: 4),
    Tag(name: 'Skroo', colourIndex: 5, id: 5),
    Tag(name: 'Skra', colourIndex: 6, id: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: FilterTagSelector(availableTags: tags,),
        ),
      ),
    );
  }
}
