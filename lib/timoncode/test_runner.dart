import 'package:flutter/material.dart';
import 'package:tag_music_player/timoncode/functions/appInit.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'dart:math';
import 'package:flex_list/flex_list.dart';
import 'package:tag_music_player/timoncode/functions/roundedCorners.dart';
import 'package:tag_music_player/timoncode/objectbox.dart';
import 'package:tag_music_player/timoncode/widgets/common/playback_bar.dart';
import 'package:tag_music_player/timoncode/widgets/tag_groups/tagSelector.dart';
import 'package:tag_music_player/timoncode/widgets/tag_groups/filterTagsSelector.dart';
import 'package:tag_music_player/timoncode/globals.dart';
import 'package:tag_music_player/timoncode/functions/appInit.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:tag_music_player/timoncode/control_spotify/playback.dart';
import 'package:tag_music_player/timoncode/control_spotify/connectToSpotifyRemote.dart';
import 'package:tag_music_player/timoncode/models/song.dart';

import 'package:spotify_sdk/models/connection_status.dart';
import 'package:spotify_sdk/models/crossfade_state.dart';
import 'package:spotify_sdk/models/image_uri.dart';
import 'package:spotify_sdk/models/player_context.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'dart:isolate';
import 'dart:async';

bool remoteConnection = false;
bool checkingCon = false;
late Stream<ConnectionStatus> conStatusBroadcast;

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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.init();
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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    onStartup();
    conStatusBroadcast = SpotifySdk.subscribeConnectionStatus().asBroadcastStream();
    backgroundConnectionChecker(conStatusBroadcast);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectionStatus>(
      stream: conStatusBroadcast,
      builder: (context, snapshot) {
        var data = snapshot.data;
        if (data != null) {
          remoteConnection = data.connected;
        } else {
          remoteConnection = false;
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('SpotifySdk Example'),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height,
          ),
          bottomNavigationBar: PlaybackBar(context: context, playerStateStream: SpotifySdk.subscribePlayerState()),
        );
      },
    );
  }
}

class PlaybackBar extends StatefulWidget {
  PlaybackBar({
    required this.context,
    this.playerStateStream,
  });
  BuildContext context;
  Stream<PlayerState>? playerStateStream;
  @override
  _PlaybackBarState createState() => _PlaybackBarState();
}

class _PlaybackBarState extends State<PlaybackBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: Container(
          width: 110.0,
          height: 110.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent1,
          ),
          child: widget.playerStateStream == null
              ? Container(child: Text('No Stream'))
              : StreamBuilder(
                  initialData: null,
                  stream: widget.playerStateStream,
                  builder: (context, snapshot) {
                    PlayerState? playerState;
                    playerState = snapshot.data as PlayerState?;
                    if (playerState == null) {
                      return Text('No player state');
                    }
                    if (playerState.track == null) {
                      return Text('No Track');
                    }
                    Song song = Song.fromTrack(playerState.track!);
                    // if (queue.songs.first.spotifyId != song.spotifyId) {
                    //   queue.onExternalSongChange();
                    // }
                    String playbackPositionText = playerState.playbackPosition.toString();
                    double progress = playerState.playbackPosition.toDouble();
                    return _buildBar(context,
                        songName: song.name,
                        artist: song.artist,
                        playbackPositionText: playbackPositionText,
                        progress: progress,
                        duration: song.duration,
                        paused: playerState.isPaused);
                  },
                ),
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context, {String? songName, String? artist, String? playbackPositionText, double? progress, int? duration, bool? paused}) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          songName ?? '',
                          style: FlutterFlowTheme.of(context).titleLarge.override(
                                fontFamily: 'Roboto Condensed',
                                fontSize: 16.0,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                          child: Text(
                            artist ?? '',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Roboto Condensed',
                                  fontSize: 12.0,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                  child: Text(
                    playbackPositionText ?? '',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Expanded(
                  child: LinearProgressIndicator(
                    value: progress ?? 0.0,
                    backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                    minHeight: 4,
                    color: Colors.white70,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                  child: Text(
                    duration != null ? duration.toString() : '',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.skip_previous,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 50.0,
                          ),
                        ),
                      ),
                      paused != null
                          ? InkWell(
                              onTap: () async {
                                if (paused) {
                                  await resume();
                                } else {
                                  await pause();
                                }
                              },
                              child: Icon(
                                paused ? Icons.play_arrow_rounded : Icons.pause,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 50.0,
                              ),
                            )
                          : Container(),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            queue.skipToNext();
                          },
                          child: Icon(
                            Icons.skip_next,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 50.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
