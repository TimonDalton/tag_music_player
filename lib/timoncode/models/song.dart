import 'dart:ffi';

import 'package:objectbox/objectbox.dart';
import 'tag.dart';
//https://docs.objectbox.io/relations#many-to-many-n-m

@Entity()
class Song {
  @Id()
  int id;

  late final String name;
  late final String artist;
  late final int duration;
  @Unique()
  late final String spotifyId;
  @Property(type: PropertyType.date) // Store as int in milliseconds
  late final DateTime dateAdded;
  @Property(type: PropertyType.date) // Store as int in milliseconds
  late final DateTime releaseDate;
  final tags = ToMany<Tag>();
  Song(
      {this.id = 0,
      required this.name,
      required this.artist,
      required this.spotifyId,
      this.duration = -1});

  static Song fromJsonObj(dynamic obj) {
    try {
      return Song(
        name: obj['name'],
        artist: obj['artist'],
        spotifyId: obj['id'],
      );
    } catch (e) {
      print('This object is not a song:');
      print(obj);
      print(StackTrace.current.toString());
      throw e;
    }
  }

  static String durationToString(int duration){
    int minutes = duration~/60;
    int seconds = duration - minutes*60;
    return minutes.toString()+ ":"+seconds.toString();
  }
}
