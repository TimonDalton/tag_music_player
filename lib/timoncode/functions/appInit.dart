import 'dart:async';
import 'package:tag_music_player/timoncode/objectbox.dart';
import 'package:tag_music_player/timoncode/globals.dart';

onStartup() async {
  objectBox = await ObjectBox.init();
  queue.load();
}