import 'dart:ffi';

import 'package:objectbox/objectbox.dart';
import 'package:tag_music_player/objectbox.g.dart';
import 'package:tag_music_player/timoncode/objectbox.dart';
import 'tag.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/models/track.dart';
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
  late final DateTime? dateAdded;
  @Property(type: PropertyType.date) // Store as int in milliseconds
  late final DateTime releaseDate;
  final tags = ToMany<Tag>();
  
  Song({this.id = 0, required this.name, required this.artist, required this.spotifyId, required this.dateAdded, required this.releaseDate, required this.duration});

  static Song fromJsonObj(dynamic obj) {
    //TODO currently takes only first artist. View Artist not implemented
    try {
      var track = obj['track'];
      return Song(
          name: track['name'],
          artist: (){
            String artists = '';
            for(int i =0;i<track['artists'].length;i++){
              artists += track['artists'][0]['name'] + ' ';
            }
            return artists;
          }(),
          spotifyId: track['id'],
          dateAdded: obj['added_at'] != null ? DateTime.parse(obj['added_at']) : null,
          releaseDate: convertLowInfoDate(track['album']['release_date']),
          duration: track['duration_ms']);
    } catch (e) {
      var track = obj['track'];
      print('Conversion to song failed for json:');
      print(track['name'] == null ? "track['name'] null" : "track['name'] found ${track['name']}");
      print(track['artists'][0]['name'] == null ? "track['artists'][0]['name'] null" : "track['artists'][0]['name'] found ${track['artists'][0]['name']}");
      print(track['id'] == null ? "track['id'] null" : "track['id'] found ${track['id']}");
      print(obj['added_at'] == null ? "obj['added_at'] null" : "obj['added_at'] found ${obj['added_at']}");
      print(track['album']['release_date'] == null ? "track['album'] null" : "track['album']['release_date'] found ${track['album']['release_date']}");
      print(track['duration_ms'] == null ? "track['duration_ms'] null" : "track['duration_ms'] found ${track['duration_ms']}");
      print("track['album'] album: ${track['album']}");
      print(obj);
      print(StackTrace.current.toString());
      throw e;
    }
  }

  static String durationToString(int duration) {
    duration ~/= 1000;
    int minutes = duration ~/ 60;
    int seconds = duration - minutes * 60;
    String secondsStr = (seconds >= 10) ? seconds.toString() : '0' + seconds.toString();
    return minutes.toString() + ":" + secondsStr;
  }

  static Song fromTrack(Track track) {
    Song? ret = objectBox.getSongBox.query(Song_.spotifyId.equals(track.uri)).build().findFirst();
    if(ret != null){
      return ret;
    }
    return Song(
      dateAdded: DateTime.now(),
      artist: track.artist!=null?track.artist.name!:'',
      duration: track.duration,
      name: track.name,
      releaseDate: DateTime.now(),
      spotifyId: track.uri,
      id: 0,
    );
  }
}

DateTime convertLowInfoDate(String d) {
  try {
    return DateTime.parse(d);
  } catch (e) {}
  int count = d.allMatches('-').length;
  List<String> parts = [];
  if (count == 0) {
    count = 1;
    parts.add(d);
  } else {
    d += '-';
    for (int i = 0; i < count - 1; i++) {
      int matchIndex = d.indexOf('-');
      parts.add(d.substring(0, matchIndex));
      d = d.substring(matchIndex + 1, d.length);
    }
  }
  String year = '1970';
  String month = '01';
  String day = '01';
  if (parts.length > 0) {
    year = parts[0];
  }
  if (parts.length > 1) {
    month = parts[1];
  }
  if (parts.length > 2) {
    day = parts[2];
  }
  return DateTime.parse("${year}-${month}-${day}");
}

String msToMinutes(int ms){
  double sec = ms/1000;
  int min = 0;
  while(sec > 60){
    sec -= 60;
    min += 1;
  }
  String minStr = min > 9?min.toString():'0${min}';
  String secStr = sec > 9?sec.toStringAsFixed(0):'0${sec.toStringAsFixed(0)}';
  return minStr+':'+secStr;
}