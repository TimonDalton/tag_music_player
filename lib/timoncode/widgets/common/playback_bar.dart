import 'package:spotify_sdk/models/player_state.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/control_spotify/playback.dart';
import 'package:tag_music_player/timoncode/globals.dart';

class PlaybackBar extends StatefulWidget {
  PlaybackBar({
    required this.song,
    required this.playerStateStream,
  });
  final Song song;
  Stream<PlayerState> playerStateStream;
  @override
  _PlaybackBarState createState() => _PlaybackBarState();
}

class _PlaybackBarState extends State<PlaybackBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: Container(
          width: 100.0,
          height: 80.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent1,
          ),
          child: StreamBuilder(
            builder: (context, snapshot) {
              PlayerState playerState = snapshot.data as PlayerState;
              if (widget.song.spotifyId != playerState.track!.uri) {
                queue.onExternalSongChange();
              }
              String playbackPositionText = playerState.playbackPosition.toString();
              double progress = playerState.playbackPosition.toDouble() / widget.song.duration.toDouble();
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Row(
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
                                            widget.song.name,
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
                                              widget.song.artist,
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
                                InkWell(
                                  onTap: () async {
                                    if (playerState.isPaused) {
                                      await resume();
                                    } else {
                                      await pause();
                                    }
                                  },
                                  child: Icon(
                                    playerState.isPaused ? Icons.play_arrow_rounded : Icons.pause,
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    size: 50.0,
                                  ),
                                ),
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
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              playbackPositionText,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: progress,
                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                              minHeight: 4,
                              color: Colors.white70,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                            child: Text(
                              widget.song.duration.toString(),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
