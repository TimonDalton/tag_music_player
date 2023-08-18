import 'package:tag_music_player/timoncode/widgets/common/songWidget.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/tag_widgets/default_tag/default_tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tag_music_player/timoncode/widgets/tag_groups/tagGroup.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:tag_music_player/timoncode/objectbox.dart';

class SongWidgetList extends StatefulWidget {
  SongWidgetList({
    required this.songs,
    this.selectedList = const [],
    this.selectedIndicator = const Icon(Icons.add),
  }) {
    if (selectedList.length == 0) {
      selectedList = List<bool>.generate(songs.length, (index) => false);
    }
  }

  List<Song> songs;
  List<bool> selectedList = [];
  Widget selectedIndicator = Container();

  @override
  _SongWidgetListState createState() => _SongWidgetListState();
}

class _SongWidgetListState extends State<SongWidgetList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.songs.length,
      itemBuilder: (context, index) {
        return widget.selectedList[index]
            ? SongWidget(
                song: widget.songs[index],
                leading: widget.selectedIndicator,
              )
            : SongWidget(song: widget.songs[index]);
      },
    );
  }
}

List<Widget> buildSongWidgetList(BuildContext context, List<Song> songs,{Function(BuildContext, Song,int)? onLongPress}) {
  List<Widget> ret = [];
  for (int i = 0; i < songs.length; i++) {
    onLongPress == null
        ? ret.add(SongWidget(song: songs[i]))
        : ret.add(InkWell(
            child: SongWidget(song: songs[i]),
            onLongPress: () => onLongPress(context, songs[i],i),
          ));
  }
  return ret;
}

List<SelectableSong> buildSelectableSongWidgetList(BuildContext context, List<Song> songs, Widget selectedLeading, Widget defaultLeading, Function(int, bool) callback) {
  List<SelectableSong> ret = [];
  for (int i = 0; i < songs.length; i++) {
    ret.add(
      SelectableSong(
        song: songs[i],
        selectedLeading: selectedLeading,
        defaultLeading: defaultLeading,
        selected: false,
        callback: callback,
        index: i,
      ),
    );
  }
  return ret;
}

class SelectableSong extends StatefulWidget {
  SelectableSong({required this.song, required this.selected, required this.selectedLeading, required this.defaultLeading, required this.callback, required this.index});
  Song song;
  bool selected;
  int index;
  Widget selectedLeading;
  Widget defaultLeading;
  Function(int, bool) callback;

  @override
  State<SelectableSong> createState() => _SelectableSongState();
}

class _SelectableSongState extends State<SelectableSong> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.selected = !widget.selected;
          widget.callback(widget.index, widget.selected);
        });
      },
      child: SongWidget(
        song: widget.song,
        leading: widget.selected ? widget.selectedLeading : widget.defaultLeading,
      ),
    );
  }
}
