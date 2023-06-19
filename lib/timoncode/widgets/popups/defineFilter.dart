import 'package:flutter/material.dart';
import 'package:tag_music_player/objectbox.g.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/widgets/tag_groups/filterTagsSelector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:tag_music_player/timoncode/models/songFilter.dart';
import 'package:tag_music_player/timoncode/objectbox.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_picker/flutter_picker.dart';

Future<void> showDefineFilterPopup(BuildContext context, SongFilter currentFilter, Function(SongFilter) setterCallback) async {
  SongFilter tempFilter = currentFilter;

  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
            child: AlertDialog(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setterCallback(tempFilter);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
          content: DefineFilterWidget(tempFilter: tempFilter, setterCallback: setterCallback),
        ));
      });
}

void showSongDurationPicker(BuildContext context, Function(Duration) setterCallback) {
  Picker(
    adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
      const NumberPickerColumn(begin: 0, end: 300, suffix: Text(' minutes')),
      const NumberPickerColumn(begin: 0, end: 60, suffix: Text(' seconds')),
    ]),
    delimiter: <PickerDelimiter>[
      PickerDelimiter(
        child: Container(
          width: 30.0,
          alignment: Alignment.center,
          child: Icon(Icons.more_vert),
        ),
      )
    ],
    hideHeader: true,
    confirmText: 'OK',
    confirmTextStyle: TextStyle(inherit: false, color: Colors.red, fontSize: 22),
    title: const Text('Select duration'),
    selectedTextStyle: TextStyle(color: Colors.blue),
    onConfirm: (Picker picker, List<int> value) {
      setterCallback(Duration(minutes: picker.getSelectedValues()[0], seconds: picker.getSelectedValues()[1]));
    },
  ).showDialog(context);
}

void showDatePicker(BuildContext context, Function(DateTime) setterCallback) {
  Picker(
    adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
      NumberPickerColumn(begin: 1900, end: DateTime.now().year, initValue: DateTime.now().year, suffix: Text(' year')),
      const NumberPickerColumn(begin: 1, end: 12, suffix: Text(' month')),
      const NumberPickerColumn(begin: 1, end: 31, suffix: Text(' day')),
    ]),
    delimiter: <PickerDelimiter>[
      PickerDelimiter(
        child: Container(
          width: 30.0,
          alignment: Alignment.center,
          child: Icon(Icons.more_vert),
        ),
      )
    ],
    hideHeader: true,
    confirmText: 'OK',
    confirmTextStyle: TextStyle(inherit: false, color: Colors.red, fontSize: 22),
    title: const Text('Select date'),
    selectedTextStyle: TextStyle(color: Colors.blue),
    onConfirm: (Picker picker, List<int> value) {
      setterCallback(DateTime(
        picker.getSelectedValues()[0],
        picker.getSelectedValues()[1],
        picker.getSelectedValues()[2],
      ));
    },
  ).showDialog(context);
}

class SelectableDropdownItem extends StatefulWidget {
  SelectableDropdownItem({super.key, required this.child, this.selected = false});
  Widget child;
  bool selected;

  @override
  State<SelectableDropdownItem> createState() => _SelectableDropdownItemState();
}

class _SelectableDropdownItemState extends State<SelectableDropdownItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: InkWell(
              onTap: () {
                setState(() {
                  widget.selected = !widget.selected;
                });
              },
              child: widget.selected ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank_outlined),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}

class DefineFilterWidget extends StatefulWidget {
  DefineFilterWidget({required this.tempFilter, required this.setterCallback});

  SongFilter tempFilter;
  Function(SongFilter) setterCallback;

  @override
  State<DefineFilterWidget> createState() => _DefineFilterWidgetState();
}

class _DefineFilterWidgetState extends State<DefineFilterWidget> {
  @override
  Widget build(BuildContext context) {
    if (!widget.tempFilter.queryIsSet) {
      widget.tempFilter.generateQuery();
    }
    List<Tag> tags = objectBox.getAllUserDefTags();

    Widget filterSelector = FilterTagSelector(
      availableTags: tags,
      includedTagIds: widget.tempFilter.includedTagIds,
      excludedTagIds: widget.tempFilter.excludedTagIds,
    );

    List<Tag> playlistTags = objectBox.getAllPlaylistTags();
    List<Widget> playlistDropDowns =
        List<Widget>.generate(playlistTags.length, (index) => SelectableDropdownItem(child: Text(playlistTags[index].name.replaceFirst(RegExp(r'playlist: '), ''))));
    List<Tag> genreTags = objectBox.getAllGenreTags();
    List<Widget> genreDropDowns =
        List<Widget>.generate(genreTags.length, (index) => SelectableDropdownItem(child: Text(genreTags[index].name.replaceFirst(RegExp(r'genre: '), ''))));

    Widget minSongDuration = Row(children: [
      InkWell(
          child: widget.tempFilter.shortestShorterSD.active ? Text('Shorter than ${widget.tempFilter.shortestShorterSD.duration.toString()}') : Text('Not Active'),
          onTap: () => showSongDurationPicker(context, (newDuration) {
                setState(() {
                  widget.tempFilter.shortestShorterSD.duration = newDuration;
                  widget.tempFilter.shortestShorterSD.active = true;
                });
              })),
      InkWell(
        child: Icon(Icons.refresh),
        onTap: () {
          setState(() {
            widget.tempFilter.shortestShorterSD.duration = Duration.zero;
            widget.tempFilter.shortestShorterSD.active = false;
          });
        },
      )
    ]);
    Widget maxSongDuration = Row(children: [
      InkWell(
          child: widget.tempFilter.longestLongerSD.active ? Text('Longer than ${widget.tempFilter.longestLongerSD.duration.toString()}') : Text('Not Active'),
          onTap: () => showSongDurationPicker(context, (newDuration) {
                setState(() {
                  widget.tempFilter.longestLongerSD.duration = newDuration;
                  widget.tempFilter.longestLongerSD.active = true;
                });
              })),
      InkWell(
        child: Icon(Icons.refresh),
        onTap: () {
          setState(() {
            widget.tempFilter.longestLongerSD.duration = Duration.zero;
            widget.tempFilter.longestLongerSD.active = false;
          });
        },
      )
    ]);

    Widget addedBefore = Row(children: [
      InkWell(
          child: widget.tempFilter.earliestBefDA.active ? Text('Shorter than ${widget.tempFilter.earliestBefDA.dateAdded.toString()}') : Text('Not Active'),
          onTap: () => showDatePicker(context, (newDate) {
                setState(() {
                  widget.tempFilter.earliestBefDA.dateAdded = newDate;
                  widget.tempFilter.earliestBefDA.active = true;
                });
              })),
      InkWell(
        child: Icon(Icons.refresh),
        onTap: () {
          setState(() {
            widget.tempFilter.earliestBefDA.dateAdded = null;
            widget.tempFilter.earliestBefDA.active = false;
          });
        },
      )
    ]);
    Widget addedAfter = Row(children: [
      InkWell(
          child: widget.tempFilter.latestAfDA.active ? Text('Longer than ${widget.tempFilter.latestAfDA.dateAdded.toString()}') : Text('Not Active'),
          onTap: () => showDatePicker(context, (newDate) {
                setState(() {
                  widget.tempFilter.latestAfDA.dateAdded = newDate;
                  widget.tempFilter.latestAfDA.active = true;
                });
              })),
      InkWell(
        child: Icon(Icons.refresh),
        onTap: () {
          setState(() {
            widget.tempFilter.latestAfDA.dateAdded = null;
            widget.tempFilter.latestAfDA.active = false;
          });
        },
      )
    ]);
    Widget releasedBefore = Row(children: [
      InkWell(
          child: widget.tempFilter.earliestBefDC.active ? Text('Shorter than ${widget.tempFilter.earliestBefDC.dateCreated.toString()}') : Text('Not Active'),
          onTap: () => showDatePicker(context, (newDate) {
                setState(() {
                  widget.tempFilter.earliestBefDC.dateCreated = newDate;
                  widget.tempFilter.earliestBefDC.active = true;
                });
              })),
      InkWell(
        child: Icon(Icons.refresh),
        onTap: () {
          setState(() {
            widget.tempFilter.earliestBefDC.dateCreated = null;
            widget.tempFilter.earliestBefDC.active = false;
          });
        },
      )
    ]);
    Widget releasedAfter = Row(children: [
      InkWell(
          child: widget.tempFilter.latestAfDC.active ? Text('Longer than ${widget.tempFilter.latestAfDC.dateCreated.toString()}') : Text('Not Active'),
          onTap: () => showDatePicker(context, (newDate) {
                setState(() {
                  widget.tempFilter.latestAfDC.dateCreated = newDate;
                  widget.tempFilter.latestAfDC.active = true;
                });
              })),
      InkWell(
        child: Icon(Icons.refresh),
        onTap: () {
          setState(() {
            widget.tempFilter.latestAfDC.dateCreated = null;
            widget.tempFilter.latestAfDC.active = false;
          });
        },
      )
    ]);

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.8,
      color: FlutterFlowTheme.of(context).primary,
      child: ListView(children: [
        ExpansionTile(
          title: Text('User Tags', style: FlutterFlowTheme.of(context).bodyMedium),
          children: [
            filterSelector,
          ],
        ),
        ExpansionTile(
          title: Text('Playlists', style: FlutterFlowTheme.of(context).bodyMedium),
          children: playlistDropDowns,
        ),
        ExpansionTile(
          title: Text('Genres', style: FlutterFlowTheme.of(context).bodyMedium),
          children: genreDropDowns,
        ),
        ExpansionTile(
          title: Text('Song Duration', style: FlutterFlowTheme.of(context).bodyMedium),
          children: [
            Row(
              children: [
                minSongDuration,
                maxSongDuration,
              ],
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Date Added', style: FlutterFlowTheme.of(context).bodyMedium),
          children: [
            Row(
              children: [
                addedBefore,
                addedAfter,
              ],
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Date Created', style: FlutterFlowTheme.of(context).bodyMedium),
          children: [
            Row(
              children: [
                releasedBefore,
                releasedAfter,
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
