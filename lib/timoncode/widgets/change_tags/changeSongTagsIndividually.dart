import 'package:tag_music_player/timoncode/functions/nav/navBase.dart';
import 'package:tag_music_player/timoncode/objectbox.dart';
import 'package:tag_music_player/timoncode/widgets/common/songWidget.dart';
import 'package:tag_music_player/timoncode/widgets/common/songWidgetWithoutTags.dart';
import 'package:tag_music_player/timoncode/widgets/tag_groups/tagGroup.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/other/colour_toggle_bubble_widget/colour_toggle_bubble_widget_widget.dart';
import '/project/components/song_widgets/song_artist_and_name_widget/song_artist_and_name_widget_widget.dart';
import '/project/components/tag_widgets/default_tag/default_tag_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tag_music_player/timoncode/models/songFilter.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/widgets/popups/defineFilter.dart';

class ChangeSongTagsIndividuallyPage extends StatefulWidget {
  ChangeSongTagsIndividuallyPage({Key? key, required this.tagIds}) {
    tags = objectBox.getTagsById(tagIds);
    filter = SongFilter();
    songs = filter.getSongs();
  }
  List<int> tagIds;
  late List<Tag> tags;
  late SongFilter filter;
  late List<Song> songs;
  late Map<Song, Map<Tag, bool>> songTagSettings;

  @override
  _ChangeSongTagsIndividuallyPageWidgetState createState() => _ChangeSongTagsIndividuallyPageWidgetState();
}

class _ChangeSongTagsIndividuallyPageWidgetState extends State<ChangeSongTagsIndividuallyPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  void setSongTagMap() {
    widget.songTagSettings = {};
    for (int i = 0; i < widget.songs.length; i++) {
      Map<Tag, bool> tagBoolList = {};
      for (int tagIndex = 0; tagIndex < widget.tags.length; tagIndex++) {
        List<Tag> songTags = widget.songs[i].tags.toList();
        List<int> songTagIds = List<int>.generate(songTags.length, (index) => songTags[index].id);
        Map<Tag, bool> item = {widget.tags[tagIndex]: songTagIds.contains(widget.tags[tagIndex].id)};
        tagBoolList.addEntries(item.entries);
      }
      widget.songTagSettings.addEntries({
        widget.songs[i]: tagBoolList,
      }.entries);
    }
  }

  @override
  initState() {
    super.initState();
    setSongTagMap();
  }

  @override
  Widget build(BuildContext context) {
    List<String> filterToStrings = widget.filter.toMultilineString();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
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
            alignment: AlignmentDirectional(-0.55, 0.0),
            child: Text(
              'Change Song Tags',
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
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: ListView(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: HeadingTextWidget(
                                      text: 'Visible Tags',
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 125,
                                  padding: EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pop(); //intentionally popping twice
                                      context.pop();
                                      context.pushNamed('select_editable_song_tags_popup');
                                    },
                                    child: TagGroup(tags: widget.tags),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 125.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: FilterButtonWidget(),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 130.0,
                                      height: 90.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).accent1,
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
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
                                                  setSongTagMap();
                                                });
                                              },
                                            );
                                          },
                                          child: RichText(
                                            text: TextSpan(
                                              children: List<TextSpan>.generate(filterToStrings.length, (index) => TextSpan(text: filterToStrings[index])),
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Roboto Condensed',
                                                    fontSize: 14.0,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Table(
                            columnWidths: <int, TableColumnWidth>{
                              ...() {
                                Map<int, TableColumnWidth> ret = {};
                                for (int i = 0; i < widget.tags.length; i++) {
                                  ret.addAll({i: i == 0 ? FlexColumnWidth(2) : FlexColumnWidth(1)});
                                }
                                return ret;
                              }()
                            },
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                            children: <TableRow>[
                              TableRow(
                                children: [
                                  HeadingTextWidget(
                                    text: 'Song',
                                  ),
                                  ...List<Widget>.generate(
                                    widget.tags.length,
                                    (index) => HeadingTextWidget(
                                      text: widget.tags[index].name,
                                    ),
                                  )
                                ],
                              ),
                              ...List<TableRow>.generate(
                                widget.songs.length,
                                (rowIndex) => TableRow(
                                  children: [
                                    SongWidgetWithoutTags(song: widget.songs[rowIndex]),
                                    ...() {
                                      List<Widget> ret = [];
                                      for (int offSetColumnIndex = 0; offSetColumnIndex < widget.tags.length; offSetColumnIndex++) {
                                        ret.add(TapableRadioButton(
                                          active: widget.songTagSettings[widget.songs[rowIndex]]![widget.tags[offSetColumnIndex]]!,
                                          colour: Tag.colours[widget.tags[offSetColumnIndex].colourIndex],
                                          callback: (isActive) => widget.songTagSettings[widget.songs[rowIndex]]![widget.tags[offSetColumnIndex]] = isActive,
                                        ));
                                      }
                                      return ret;
                                    }(),
                                  ],
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),
              ),
              BottomOptionsBarWidgetWidget(
                  confirmText: 'Save',
                  confirmColour: Color(0xFF0094ED),
                  onConfirmCallBack: () {
                    for (int songIndex = 0; songIndex < widget.songs.length; songIndex++) {
                      List<Tag> songTags = widget.songs[songIndex].tags.toList();
                      List<int> songTagIds = List<int>.generate(songTags.length, (index) => songTags[index].id);
                      for (int tagIndex = 0; tagIndex < widget.tags.length; tagIndex++) {
                        if (widget.songTagSettings[widget.songs[songIndex]]![widget.tags[tagIndex]]!) {
                          widget.songs[songIndex].tags.add(widget.tags[tagIndex]); //If this creates a copy, it will not write
                        } else {
                          widget.songs[songIndex].tags.removeWhere((tag) => tag.id == widget.tags[tagIndex].id); //If this does not exist, does not delete
                        }
                      }
                    }
                    objectBox.saveSongs(widget.songs);
                    navBase(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class TapableRadioButton extends StatefulWidget {
  TapableRadioButton({required this.colour, this.active = false, required this.callback});
  Color colour;
  bool active;
  Function(bool) callback;

  @override
  State<TapableRadioButton> createState() => _TapableRadioButtonState();
}

class _TapableRadioButtonState extends State<TapableRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: widget.colour,
      ),
      child: Center(
        child: InkWell(
          onTap: () {
            setState(() {});
            widget.active = !widget.active;
            widget.callback(widget.active);
          },
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: widget.active ? Colors.white : Colors.grey[800],
            ),
          ),
        ),
      ),
    );
  }
}
