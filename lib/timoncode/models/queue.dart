import 'dart:ffi';
import 'package:objectbox/objectbox.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:tag_music_player/timoncode/objectbox.dart';
import 'package:tag_music_player/timoncode/control_spotify/playback.dart';
import 'song.dart';

@Entity()
class Queue {
  @Id()
  int id;
  var songs = ToMany<Song>(); //assume that objectbox saves this in the order as entered, else I'll have some work to do
  Queue({this.id = 0});
  void save() {
    objectBox.saveQueue(this);
  }

  void load() {
    Queue? ret = objectBox.loadQueue();
    if (ret != null) {
      this.id = ret.id;
      this.songs = ret.songs;
    } else {
      this.save();
    }
  }

  Song? popForNext() {
    if (songs.toList().length == 0) {
      return null;
    }
    Song ret = songs.removeAt(0);
    save();
    return ret;
  }

  bool doesQueueMatch(Song currentSong) {
    if (songs.length == 0) {
      return false;
    }
    return currentSong.id == songs[0].id;
  }

  Future<void> queueAllToPlayer() async {
    List<Song> songList = songs.toList();
    for (int i = 0; i < songList.length; i++) {
      await addToQueue(songList[i].spotifyId);
    }
  }

  void onExternalSongEnd() async {
    popForNext();
    PlayerState pState = await getPlayerState();
    if (pState.track != null) {
      int foundIndex = songs.toList().indexWhere((internalSong) => internalSong.spotifyId == pState.track!.uri);
      if (foundIndex == -1) { // The currently playing song is not recognized in the list of songs in queue.
        await clearExternalQueue();
        await queueAllToPlayer();
        await skipNext();
      } else if (foundIndex > 0) {//0 == means all is fine
        for (int i = 0; i < foundIndex; i++) {// The currently playing song is found later in the queue. Could have played through spotify after setting queue with app.
          songs.removeAt(0);
        }
        save();
      }
    }
  }
}

const String silentTrackUri = '5XSKC4d0y0DfcGbvDOiL93';
Future<void> clearExternalQueue() async {
  await addToQueue(silentTrackUri);
  const int counterMax = 600;
  int counter = 0;
  PlayerState pState = await getPlayerState();
  while (counter++ < counterMax && pState.track!.uri != silentTrackUri) {
    await skipNext();
    pState = await getPlayerState();
  }
  await skipNext();
}
