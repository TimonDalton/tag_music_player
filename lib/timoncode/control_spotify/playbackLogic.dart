import 'package:spotify_sdk/models/track.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:tag_music_player/timoncode/control_spotify/api_calls.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/globals.dart';
import 'package:tag_music_player/timoncode/control_spotify/connectToSpotifyRemote.dart';
import 'package:flutter/services.dart';
import 'package:spotify_sdk/models/player_context.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:tag_music_player/timoncode/globals.dart';
import 'package:spotify_sdk/models/connection_status.dart';
import 'dart:ffi';
import 'package:objectbox/objectbox.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:tag_music_player/objectbox.g.dart';
import 'package:tag_music_player/timoncode/models/playbackFilter.dart';
import 'package:tag_music_player/timoncode/objectbox.dart';
import 'package:tag_music_player/timoncode/control_spotify/playback.dart';
import 'package:tag_music_player/timoncode/models/song.dart';

Song? currentSong = queue.songs[0];
bool queuingOneByOne = true;
bool activatedPlay = false;
bool busySkipping = false;

Future<void> skipTrackLogic() async {
  skipNext();
  //the local change will happen automatically through the stream listener
}

Future<void> onSongEnded(PlayerState playerState) async {
  print('onSongEnded: track ${playerState.track != null ? playerState.track!.name : 'null track'}, activatedPlay:${activatedPlay}, busySkipping: ${busySkipping}');
  if (!activatedPlay && !busySkipping) {
    currentSong = queue.popForNext();
    print('currentSong: ${currentSong != null ? currentSong!.name + ' -> ' + currentSong!.spotifyId : 'null local current song'}');
    if (currentSong != null) {
      print('current track uri: ${playerState.track!.uri}');
      if (playerState.track!.uri != currentSong!.spotifyId) {
        print('passing to play in onSongEnded: ${'spotify:track:' + currentSong!.spotifyId}');
        activatedPlay = true;
        await play('spotify:track:' + currentSong!.spotifyId);
        // bool successfullyChanged = await skipUntilSongIsPlaying(currentSong!.spotifyId);
        if (!queuingOneByOne) {
          //if we want the whole queue to be filled and the queue had just been cleared, then...fill
          queue.queueAllToPlayer(startingIndex: 1);
        }
      }
      if (queue.songs.length > 1 && queuingOneByOne) {
        await addToQueue(queue.songs[1].spotifyId);
      }
    }
  } else {
    activatedPlay = false;
  }
}

Future<bool> skipUntilSongIsPlaying(String uri) async {
  busySkipping = true;
  print('skip until uri: ${uri}');
  PlayerState playerState = await getPlayerState();
  int count = 0;
  while (playerState.track != null && count++ < 20) {
    if (playerState.track!.uri == uri) {
      busySkipping = false;
      return true;
    }
    print('tried ${playerState.track!.uri}');
    await skipNext();
    playerState = await getPlayerState();
  }
  busySkipping = false;
  return false;
}

Future<void> playSong(Song song) async {
  activatedPlay = true;
  if (queue.songs.length > 1) {
    queue.songs[0] = song; //replace playing song
  } else {
    queue.songs.add(song);
  }
  play('spotify:track:${song.spotifyId}');
}
