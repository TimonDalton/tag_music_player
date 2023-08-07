import 'dart:async';
import 'package:tag_music_player/timoncode/objectbox.dart';
import 'package:tag_music_player/timoncode/globals.dart';
import 'package:tag_music_player/timoncode/control_spotify/playback.dart';
import 'package:tag_music_player/timoncode/control_spotify/connectToSpotifyRemote.dart';
import 'package:spotify_sdk/models/connection_status.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:tag_music_player/timoncode/control_spotify/playbackLogic.dart';

bool hasConnectedPlayer = false;
StreamSubscription<PlayerState>? psSub;
onStartup() async {
  objectBox = await ObjectBox.init();
  await initializePlayer();
  queue.load();
  conStatusBroadcast = SpotifySdk.subscribeConnectionStatus().asBroadcastStream();
  backgroundConnectionChecker(conStatusBroadcast);
}

void backgroundConnectionChecker(Stream<ConnectionStatus> remoteConStream) {
  print('Started background timed spotify connector');
  remoteConStream.listen((conStatus) async {
    print('Connection Status Stream received');
    if (remoteConnection != conStatus.connected) {
      remoteConnection = conStatus.connected;
      print('Connection status stream changed to ${conStatus.connected}');
      if (remoteConnection == false) {
        // playerStateCache = null;
      } else {
        if (!hasConnectedPlayer) {
          playerStateStream = SpotifySdk.subscribePlayerState().asBroadcastStream();
          hasConnectedPlayer = true;
        }
        if (psSub != null) {
          await psSub!.cancel();
        }
        psSub = backGroundPlayerStateUpdater(playerStateStream);
      }
    }
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

StreamSubscription<PlayerState> backGroundPlayerStateUpdater(Stream<PlayerState> stream) {
  PlayerState? prev = null;

  StreamSubscription<PlayerState> ret = stream.listen((newPlayerState) async {
    print('Player State Stream received data: ${newPlayerState.toString()}');
    playerStateCache = newPlayerState;
    if (playerStateCache != prev && playerStateCache != null) {
      if (playerStateCache!.track != null) {
        print('playerStateCache going to onSongEnded: ${playerStateCache!.track!.name} -> ${playerStateCache!.track!.uri}');
        if (prev == null) {
          //if there is no previous track
          onSongEnded(playerStateCache!);
        } else if (prev!.track == null) {
          onSongEnded(playerStateCache!);
        }else if (playerStateCache!.track!.uri != prev!.track!.uri) {
          //if the playing external track has changed.
          onSongEnded(playerStateCache!);
        }
      } else {
        print('Null track');
      }
    }
    //Phase 3: Handle caching
    prev = playerStateCache;
  });
  return ret;
}
