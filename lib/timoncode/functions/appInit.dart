import 'dart:async';
import 'package:tag_music_player/timoncode/objectbox.dart';
import 'package:tag_music_player/timoncode/globals.dart';
import 'package:tag_music_player/timoncode/control_spotify/playback.dart';
import 'package:tag_music_player/timoncode/control_spotify/connectToSpotifyRemote.dart';
import 'package:spotify_sdk/models/connection_status.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

onStartup() async {
  objectBox = await ObjectBox.init();
  await initializePlayer();
  queue.load();
  conStatusBroadcast = SpotifySdk.subscribeConnectionStatus().asBroadcastStream();
  playerStateStream = SpotifySdk.subscribePlayerState().asBroadcastStream();
  backGroundPlayerStateUpdater();
  backgroundConnectionChecker(conStatusBroadcast);
}
void backGroundPlayerStateUpdater(){
  playerStateStream.listen((data) {
    playerStateCache = data;
    print('New Player State data');
  });
  PlayerState? prev = null;
  Timer.periodic(Duration(seconds: 1), (Timer t) async {
    if(playerStateCache == prev){
      playerStateCache = await SpotifySdk.getPlayerState();
    }
    prev = playerStateCache;
  });
}
void backgroundConnectionChecker(Stream<ConnectionStatus> remoteConStream) {
  print('Started background timed spotify connector');
  remoteConStream.listen((conStatus) {
    if (remoteConnection != conStatus.connected) {
      print('Connection status stream changed to conStatus.connected');
    }
    remoteConnection = conStatus.connected;
  });
  Timer.periodic(Duration(seconds: 1), (Timer t) async {
    // print('tick rc${remoteConnection} cc${checkingCon} nc${networkConnection} ic${internetConnection}');
    if (!checkingCon) {
      // print('Entered Checking Con');
      checkingCon = true;
      if (!remoteConnection) {
        print('No remote connection. Trying to connect');
        await connectToSpotifyRemote();
      }
      checkingCon = false;
    }
  });
}
