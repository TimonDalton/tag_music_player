import 'package:tag_music_player/project/components/tag_group_widgets/included_excluded_tag_group/included_excluded_tag_group_widget.dart';
import 'package:tag_music_player/timoncode/control_spotify/playback.dart';
import 'package:tag_music_player/timoncode/globals.dart';
import 'package:tag_music_player/timoncode/widgets/common/songWidgetList.dart';
import 'package:tag_music_player/timoncode/widgets/tag_groups/tagGroupWithWeights.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/start_playing_bar/start_playing_bar_widget.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import '/project/components/tag_group_widgets/default_tag_group/default_tag_group_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tag_music_player/timoncode/models/playbackFilter.dart';
import 'package:tag_music_player/timoncode/models/songFilter.dart';
import 'package:tag_music_player/timoncode/models/song.dart';

class ViewFilterPage extends StatefulWidget {
  ViewFilterPage({required this.filter}) {
    songFilter = filter.generateSongFilter();
    songs = songFilter.getSongs();
  }
  PlaybackFilter filter;
  late SongFilter songFilter;
  late List<Song> songs;

  @override
  _ViewFilterPageState createState() => _ViewFilterPageState();
}

class _ViewFilterPageState extends State<ViewFilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primary,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 46.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Align(
          alignment: AlignmentDirectional(-0.35, 0.0),
          child: Text(
            widget.filter.name,
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Roboto Condensed',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 0.9,
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
                        Container(
                          height: 150,
                          child: TagGroupWithWeights(filter: widget.filter),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(-0.75, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('define_filter_page', extra: {'filter': widget.filter});
                                  },
                                  child: DefaultButtonWidget(
                                    text: 'Edit Filter',
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
                                    context.pushNamed('tag_weight_page', extra: {'filter': widget.filter});
                                  },
                                  child: DefaultButtonWidget(
                                    text: 'Set Tag \nWeights',
                                    icon: FaIcon(
                                      FontAwesomeIcons.sliders,
                                      color: FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    width: 125.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                            child: HeadingTextWidget(
                              text: 'Songs',
                            ),
                          ),
                        ),
                        Expanded(
                          child: SongWidgetList(songs: widget.songs),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent1,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextButton(
                          child:Text('Play'),
                          onPressed: (){
                            activePbFilter = widget.filter;
                            queue.songs.clear();
                            queue.songs.addAll(activePbFilter.generateSortedSongs());
                            queue.save();
                            if(remoteConnection){
                              resume();
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          child:Text( 'Shuffle'),
                          onPressed: (){
                            print('pressed shuffle');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
