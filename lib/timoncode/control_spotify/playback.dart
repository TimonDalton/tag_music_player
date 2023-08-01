import 'package:spotify_sdk/models/track.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:tag_music_player/timoncode/control_spotify/api_calls.dart';
import 'package:tag_music_player/timoncode/control_spotify/connectToSpotifyRemote.dart';
import 'package:flutter/services.dart';
import 'package:spotify_sdk/models/player_context.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:tag_music_player/timoncode/globals.dart';
import 'package:spotify_sdk/models/connection_status.dart';

Future<void> initializePlayer() async {
  if (!remoteConnection) {
    //TODO, implement delay
  }
  if (remoteConnection) {
    playerStateStream = SpotifySdk.subscribePlayerState();
  }
}

Future<void> play(String spotifyUri) async {
  try {
    await ensureRequestAvailable();
    await SpotifySdk.play(spotifyUri: spotifyUri);
  } on PlatformException catch (e) {
    // setStatus(e.code, message: e.message);
  } on MissingPluginException {
    // setStatus('not implemented');
  } catch (e) {
    print(StackTrace.current.toString());
    print(e);
  }
}

Future<void> pause() async {
  try {
    await ensureRequestAvailable();
    await SpotifySdk.pause();
  } on PlatformException catch (e) {
    // setStatus(e.code, message: e.message);
  } on MissingPluginException {
    // setStatus('not implemented');
  } catch (e) {
    print(StackTrace.current.toString());
    print(e);
  }
}

Future<void> resume() async {
  try {
    await ensureRequestAvailable();
    await SpotifySdk.resume();
  } on PlatformException catch (e) {
    // setStatus(e.code, message: e.message);
  } on MissingPluginException {
    // setStatus('not implemented');
  } catch (e) {
    print(StackTrace.current.toString());
    print(e);
  }
}

Future<void> skipNext() async {
  try {
    await ensureRequestAvailable();
    await SpotifySdk.skipNext();
  } on PlatformException catch (e) {
    // setStatus(e.code, message: e.message);
  } on MissingPluginException {
    // setStatus('not implemented');
  } catch (e) {
    print(StackTrace.current.toString());
    print(e);
  }
}

Future<PlayerState> getPlayerState() async {
  return await playerStateStream.first;
}

Future<Track?> getCurrentTrack() async {
  PlayerState pState = await getPlayerState();
  return pState.track;
}

Future<void> addToQueue(String spotifyUri) async {
  try {
    await SpotifySdk.queue(spotifyUri: spotifyUri);
  } on PlatformException catch (e) {
    // setStatus(e.code, message: e.message);
  } on MissingPluginException {
    // setStatus('not implemented');
  } catch (e) {
    print(StackTrace.current.toString());
    print(e);
  }
}

void skipToSongUri(String songUri) async {
  int count = 0;
  final int countLimit = 500;
  Track? currentTrack = await getCurrentTrack();
  while ((currentTrack) != null && (currentTrack).uri != songUri && count++ < countLimit) {
    await skipNext();
    currentTrack = await getCurrentTrack();
  }
  if (count > countLimit) {
    print('Skip exceeded count limit of ${countLimit}');
  }
  if (currentTrack == null) {
    print('Track is null');
  }
  if (currentTrack!.uri == songUri) {
    print('Track found after ${count - 1} skips');
  } else {
    print('Track not found');
  }
}
