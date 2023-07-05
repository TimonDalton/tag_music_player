import 'package:tag_music_player/project/components/buttons/colour_button/colour_button_widget.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/models/songFilter.dart';
import 'package:tag_music_player/timoncode/widgets/common/songWidgetList.dart';
import 'package:tag_music_player/timoncode/widgets/popups/defineFilter.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_nav_bar_widget/bottom_nav_bar_widget_widget.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/buttons/mini_button/mini_button_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SongLibraryPage extends StatefulWidget {
  SongLibraryPage() {
    addingToQueueState = false;
    filter = SongFilter();
    songs = filter.getSongs();
    selectedSongIndexes = [];
    songWidgets = [];
  }
  late bool addingToQueueState;
  late SongFilter filter;
  late List<Song> songs;
  late List<int> selectedSongIndexes;
  late List<Widget> songWidgets;

  @override
  _SongLibraryPageState createState() => _SongLibraryPageState();
}

class _SongLibraryPageState extends State<SongLibraryPage> {
  @override
  Widget build(BuildContext context) {
    if (!widget.addingToQueueState) {
      widget.songWidgets = buildSongWidgetList(context, widget.songs);
    } else {
      widget.songWidgets = buildSelectableSongWidgetList(context, widget.songs, Icon(Icons.add_box_rounded, color: Colors.green), Icon(Icons.check_box_outline_blank),
          (songIndex, selected) => selected ? widget.selectedSongIndexes.add(songIndex) : widget.selectedSongIndexes.remove(songIndex));
    }
    return GestureDetector(
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0.35, 0.0),
            child: Text(
              'Song Library',
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 0.83,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                        onTap: (){
                                          showDefineFilterPopup(
                                            context,
                                            widget.filter,
                                            (newFilter) {
                                              print('song filter setter called');
                                              setState(() {
                                                widget.filter.becomeCloneOf(newFilter);
                                                widget.songs = widget.filter.getSongs();
                                              });
                                            },
                                          );
                                        },
                                        child:FilterButtonWidget(),
                                      ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.05, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: widget.addingToQueueState
                                          ? () {
                                              setState(() {
                                                widget.selectedSongIndexes = [];
                                                widget.addingToQueueState = false;
                                              });
                                            }
                                          : () {
                                              print('clicked add to queue');
                                              setState(() {
                                                widget.addingToQueueState = true;
                                              });
                                            },
                                      child: MiniButtonWidget(
                                        text: widget.addingToQueueState ? 'Cancel' : 'Add to queue',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ...widget.songWidgets
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: (!widget.addingToQueueState)
                              ? [
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(-0.75, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('edit_songs_popup');
                                        },
                                        child: DefaultButtonWidget(
                                          text: 'Edit Songs',
                                          icon: Icon(
                                            Icons.edit,
                                            color: FlutterFlowTheme.of(context).primaryText,
                                          ),
                                          width: 125.0,
                                          height: 60.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.75, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('add_songs_page');
                                        },
                                        child: DefaultButtonWidget(
                                          text: 'Add Songs',
                                          icon: Icon(
                                            Icons.library_music,
                                            color: FlutterFlowTheme.of(context).primaryText,
                                          ),
                                          width: 125.0,
                                          height: 60.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                              : [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.selectedSongIndexes = [];
                                        });
                                      },
                                      child: ColourButtonWidget(
                                        text: 'Deselect All',
                                        buttonColour: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: InkWell(
                                    onTap: () {
                                      //TODO acually add to queue
                                      widget.selectedSongIndexes = [];
                                      setState(() {
                                        widget.addingToQueueState = false;
                                      });
                                    },
                                    child: ColourButtonWidget(
                                      text: 'Add to Queue',
                                      buttonColour: Colors.green,
                                    ),
                                  ))
                                ],
                        ),
                        BottomNavBarWidgetWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
