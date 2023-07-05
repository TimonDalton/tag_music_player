import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/models/songFilter.dart';
import 'package:tag_music_player/timoncode/widgets/common/songWidgetList.dart';
import 'package:tag_music_player/timoncode/widgets/popups/defineFilter.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:tag_music_player/timoncode/objectbox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeleteSongsPage extends StatefulWidget {
  DeleteSongsPage() {
    filter = SongFilter();
    songs = filter.getSongs();
  }

  late SongFilter filter;
  late List<Song> songs = [];
  List<Widget> songWidgets = [];
  List<int> deleteIndexes = [];
  @override
  _DeleteSongsPageState createState() => _DeleteSongsPageState();
}

class _DeleteSongsPageState extends State<DeleteSongsPage> {
  @override
  Widget build(BuildContext context) {
    widget.songWidgets = buildSelectableSongWidgetList(
        context,
        widget.songs,
        Icon(
          Icons.remove_circle_outline_sharp,
          color: Colors.red,
        ),
        Icon(Icons.check_box_outline_blank),
        (songIndex, activeState) => activeState ? widget.deleteIndexes.add(songIndex) : widget.deleteIndexes.remove(songIndex));

    return GestureDetector(
      child: Scaffold(
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
              size: 36.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-0.45, 0.0),
            child: Text(
              'Remove From Library',
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
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HeadingTextWidget(
                              text: 'Select Songs to Remove',
                            ),
                            Icon(Icons.search, color: Colors.white, size: 35),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                          child: InkWell(
                            onTap: () {
                              showDefineFilterPopup(
                                context,
                                widget.filter,
                                (newFilter) {
                                  print('song filter setter called');
                                  setState(() {
                                    widget.filter.becomeCloneOf(newFilter);
                                    widget.songs = widget.filter.getSongs();
                                    widget.deleteIndexes = [];
                                  });
                                },
                              );
                            },
                            child: FilterButtonWidget(),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: widget.songWidgets,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: BottomOptionsBarWidgetWidget(
                  confirmText: 'Delete',
                  confirmColour: Color(0xFFE85536),
                  onConfirmCallBack: () {
                    List<Song> chosenSongs = List<Song>.generate(widget.deleteIndexes.length, (index) => widget.songs[widget.deleteIndexes[index]]);
                    objectBox.removeSongs(chosenSongs);
                    setState(() {
                      for(int i =widget.deleteIndexes.length-1;i>=0;i--){
                        widget.songs.removeAt(widget.deleteIndexes[i]);
                      }
                      widget.deleteIndexes.clear();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
