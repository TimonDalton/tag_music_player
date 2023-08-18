import 'package:spotify_sdk/models/connection_status.dart';
import 'package:tag_music_player/custom_code/widgets/default_button.dart';
import 'package:tag_music_player/timoncode/control_spotify/playback.dart';
import 'package:tag_music_player/timoncode/globals.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/widgets/common/playback_bar.dart';
import 'package:tag_music_player/timoncode/widgets/common/songWidget.dart';
import 'package:tag_music_player/timoncode/widgets/tag_groups/tagGroupWithWeights.dart';
import 'package:tag_music_player/timoncode/widgets/common/songWidgetList.dart';
import 'package:tag_music_player/timoncode/widgets/popupPages/hold_song_popup_page.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_nav_bar_widget/bottom_nav_bar_widget_widget.dart';
import '/project/components/bottom_bars/now_playing_bar/now_playing_bar_widget.dart';
import '/project/components/buttons/mini_button/mini_button_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import '/project/components/tag_group_widgets/editable_tag_group/editable_tag_group_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QueuePage extends StatefulWidget {
  QueuePage({Key? key}) : super(key: key);

  bool removingState = false;
  List<int> selectedSongIndexes = [];

  @override
  _QueuePageState createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> queueSongWidgets = [];

    List<Song> songs = queue.songs.toList();
    if (songs.length > 0) {
      songs.removeAt(0);
    }
    if (!widget.removingState) {
      queueSongWidgets = buildSongWidgetList(context, songs, onLongPress: (BuildContext c, Song s, int index) {
        showHoldSongSnackbar(c, s, index);
        setState(() {
          if (queue.songs.length > 0) {
            queue.songs.first = queue.songs.first;
          }
        });
      });
    } else {
      queueSongWidgets = buildSelectableSongWidgetList(context, songs, Icon(Icons.remove_circle_outline, color: Colors.red), Icon(Icons.circle_outlined),
          (songIndex, selected) => selected ? widget.selectedSongIndexes.add(songIndex) : widget.selectedSongIndexes.remove(songIndex));
    }
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primary,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: AlignmentDirectional(0.35, 0.0),
          child: Text(
            'Queue',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Roboto Condensed',
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.settings_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('control_main_page');
            },
          ),
        ],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.85,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('queue_edit_filter_page');
                          },
                          child: TagGroupWithWeights(filter: activePbFilter),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 125.0,
                                height: 60.0,
                                child: custom_widgets.DefaultButton(
                                  width: 125.0,
                                  height: 60.0,
                                  text: 'Save Filter',
                                  icon: Icon(
                                    Icons.save_alt,
                                    color: FlutterFlowTheme.of(context).primaryText,
                                  ),
                                  onTap: () async {},
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('tag_weight_page');
                                },
                                child: Container(
                                  width: 125.0,
                                  height: 60.0,
                                  child: custom_widgets.DefaultButton(
                                    width: 125.0,
                                    height: 60.0,
                                    text: 'Set Tag \nWeights',
                                    icon: FaIcon(
                                      FontAwesomeIcons.slidersH,
                                      color: FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    onTap: () async {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: HeadingTextWidget(
                            text: 'Now Playing',
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onLongPress: () async {
                            context.pushNamed('queue_song_hold_popup');
                          },
                          child: !queue.songs.isEmpty ? SongWidget(song: queue.songs.first) : Container(),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: HeadingTextWidget(
                                  text: queue.songs.length > 0 ? 'Next From: [Source]' : '',
                                ),
                              ),
                            ),
                          ],
                        ),
                        ...queueSongWidgets,
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: widget.removingState
                                ? () async {
                                    setState(() {
                                      widget.removingState = false;
                                      widget.selectedSongIndexes = [];
                                    });
                                  }
                                : () async {
                                    setState(() {
                                      widget.removingState = false;
                                      widget.selectedSongIndexes = [];
                                    });
                                    context.pushNamed('add_to_queue_page');
                                  },
                            child: MiniButtonWidget(
                              text: widget.removingState ? 'Cancel' : 'Add',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: widget.removingState
                                ? () async {
                                    List<int> ids = List<int>.generate(widget.selectedSongIndexes.length, (index) => songs[widget.selectedSongIndexes[index]].id);
                                    setState(() {
                                      queue.songs.removeWhere((song) => ids.contains(song.id));
                                      widget.removingState = false;
                                      widget.selectedSongIndexes = [];
                                    });
                                  }
                                : () async {
                                    setState(() {
                                      widget.removingState = true;
                                      widget.selectedSongIndexes = [];
                                    });
                                  },
                            child: MiniButtonWidget(
                              text: widget.removingState ? 'Confirm' : 'Remove',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  StreamBuilder(
                    stream: conStatusBroadcast,
                    builder: (context, snapshot) {
                      bool con;
                      if (!snapshot.hasData) {
                        con = remoteConnection;
                        print('No conStatus snapshot data. Using cached value');
                      } else {
                        con = (snapshot.data as ConnectionStatus).connected;
                      }
                      if (con) {
                        return PlaybackBar(
                          context: context,
                          playerStateStream: playerStateStream,
                          setStateCallback: () {
                            setState(() {
                              if (queue.songs.length > 0) {
                                queue.songs.first = queue.songs.first;
                              }
                            });
                          },
                        );
                      } else {
                        return Text('Remote not connected');
                      }
                    },
                  ),
                  BottomNavBarWidgetWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
