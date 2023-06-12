import 'package:tag_music_player/timoncode/widgets/common/songWidget.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/buttons/colour_button/colour_button_widget.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import '/project/components/tag_widgets/default_tag/default_tag_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tag_music_player/timoncode/models/songFilter.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/widgets/common/songWidget.dart';
import 'package:tag_music_player/timoncode/widgets/popups/selectSingleTagPopup.dart';
import 'package:tag_music_player/timoncode/widgets/tag_groups/tagGroup.dart';
import 'package:tag_music_player/timoncode/objectbox.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';

class TagAction {
  bool primaryAdd;

  bool add;
  bool remove;

  Tag? addedTag;
  Tag? removedTag;

  TagAction({this.primaryAdd = true, this.add = false, this.addedTag, this.remove = false, this.removedTag});

  void revert(List<Tag> addList, List<Tag> removeList) {
    if (primaryAdd) {
      if (add) {
        addList.remove(addedTag!);
      }
      if (remove) {
        removeList.add(removedTag!);
      }
    } else {
      if (add) {
        addList.add(addedTag!);
      }
      if (remove) {
        removeList.remove(removedTag!);
      }
    }
  }
}

class ChangeSongsTagsByGroupPage extends StatefulWidget {
  ChangeSongsTagsByGroupPage({Key? key, required this.filter}) : super(key: key) {
    songs = [];
    try {
      songs = filter.getQueryBuilder().build().find();
    } catch (e) {
      print('Songs queryBuilder Error');
      print(e);
      print('queryBuilder:');
      print(filter.getQueryBuilder());
    }
  }

  SongFilter filter;
  late List<Song> songs;
  Tag? displayedTag;
  List<Tag> addedTags = [];
  List<Tag> removedTags = [];
  List<TagAction> previousActions = [];

  @override
  _ChangeSongsTagsByGroupPageState createState() => _ChangeSongsTagsByGroupPageState();
}

class _ChangeSongsTagsByGroupPageState extends State<ChangeSongsTagsByGroupPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void undo(List<TagAction> actions, List<Tag> addList, List<Tag> removeList) {
    setState(() {
      if (actions.length > 0) {
        actions.last.revert(addList, removeList);
        actions.removeAt(actions.length - 1);
      }
    });
  }

  List<Widget> buildSongs(BuildContext context) {
    List<Widget> ret = [];
    for (int i = 0; i < widget.songs.length; i++) {
      ret.add(SongWidget(
        song: widget.songs[i],
        index: i,
        extraIncludedTags: widget.addedTags,
        extraExcludedTags: widget.removedTags,
      ));
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: ListView(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 130.0,
                            height: 90.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent1,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Align(alignment: AlignmentDirectional(0.0, -1.0), child: FilterButtonWidget()),
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
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Artist: Twentyone Pilots',
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: '\nSource: Playlist2',
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'Roboto Condensed',
                                            fontSize: 18.0,
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
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 130.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent1,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: HeadingTextWidget(
                                  text: 'Tag',
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () => showSelectSingleTagPopup(context, (tag) {
                                  setState(() {
                                    widget.displayedTag = tag;
                                  });
                                }),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 130.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).accent1,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Align(
                                        alignment: AlignmentDirectional(0.0, 0.0),
                                        child: widget.displayedTag != null
                                            ? TagGroup(
                                                tags: [widget.displayedTag!],
                                              )
                                            : Text('Please Choose a Tag')),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (widget.displayedTag != null) {
                                  if (!widget.addedTags.contains(widget.displayedTag!)) {
                                    setState(() {
                                      widget.addedTags.add(widget.displayedTag!);
                                      widget.previousActions.add(TagAction(primaryAdd: true, add: true, addedTag: widget.displayedTag!)); //true means that last something was added
                                      if (widget.removedTags.contains(widget.displayedTag!)) {
                                        widget.removedTags.remove(widget.displayedTag!);
                                        widget.previousActions.last.remove = true;
                                        widget.previousActions.last.removedTag = widget.displayedTag!;
                                      }
                                    });
                                  }
                                }
                              },
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                child: ColourButtonWidget(
                                  buttonColour: Color(0xFF5AA849),
                                  text: 'Add to All',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (widget.displayedTag != null) {
                                  if (!widget.removedTags.contains(widget.displayedTag!)) {
                                    setState(() {
                                      widget.removedTags.add(widget.displayedTag!);
                                      widget.previousActions.add(TagAction(primaryAdd: false, remove: true, removedTag: widget.displayedTag!)); //true means tha
                                      if (widget.addedTags.contains(widget.displayedTag!)) {
                                        widget.addedTags.remove(widget.displayedTag!);
                                        widget.previousActions.last.add = true;
                                        widget.previousActions.last.addedTag = widget.displayedTag!;
                                      }
                                    });
                                  }
                                }
                              },
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                child: ColourButtonWidget(
                                  buttonColour: Color(0xFFE85536),
                                  text: 'Remove From All',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () => undo(widget.previousActions, widget.addedTags, widget.removedTags),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                child: ColourButtonWidget(
                                  buttonColour: Color(0xFF0094ED),
                                  text: 'Undo',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...buildSongs(context),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomOptionsBarWidgetWidget(
                confirmText: 'Save',
                confirmColour: Color(0xFF0094ED),
                onConfirmCallBack: () {
                  widget.songs.removeWhere((song) => widget.removedTags.contains(song));
                  objectBox.saveSongsWithTags(widget.songs, widget.addedTags);
                  context.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
