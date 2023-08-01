import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/control_spotify/playback.dart';
import 'package:tag_music_player/timoncode/globals.dart';
import 'dart:async';

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
    Timer.periodic(Duration(milliseconds:200), (timer) {//TODO this solution works but is disgusting. Provider should be used to link the playerstate form the listener to this page.
      setState(() {

      });
    });
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
                    if (!snapshot.hasData) {
                      playerState = playerStateCache;
                      // print('no playerstate snapshot data. Took cached data');
                    } else {
                      playerState = snapshot.data as PlayerState?;
                      // print('There was a playerstate snapshot. Used Snapshot');
                    }
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
                    String playbackPositionText = msToMinutes(playerState.playbackPosition);
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
                    duration != null ? msToMinutes(duration) : '',
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
