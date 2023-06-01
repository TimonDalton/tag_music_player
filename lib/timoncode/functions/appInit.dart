import 'dart:async';
import 'package:tag_music_player/timoncode/objectbox.dart';

onStartup() async {
  objectBox = await ObjectBox.init();

}