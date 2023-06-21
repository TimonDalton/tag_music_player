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

Future<void> showDefineFilterPopup(BuildContext context, SongFilter currentFilter, Function(SongFilter) filterSetterCallback) async {
  SongFilter tempFilter = currentFilter;

  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        print('Showdialog built. Filter:');
        print(tempFilter.toMultilineString());
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
                filterSetterCallback(tempFilter);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
          content: DefineFilterWidget(filter: tempFilter),
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

Future<DateTime?> chooseDate(BuildContext context) async {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );
}

class SelectableDropdownItem extends StatefulWidget {
  SelectableDropdownItem({super.key, required this.child, this.selected = false, this.onTapCallback});
  Widget child;
  bool selected;
  Function? onTapCallback;

  @override
  State<SelectableDropdownItem> createState() => _SelectableDropdownItemState();
}

class _SelectableDropdownItemState extends State<SelectableDropdownItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: InkWell(
              onTap: () {
                if (widget.onTapCallback != null){
                  widget.onTapCallback!(widget.selected);
                }
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
  DefineFilterWidget({required this.filter});

  SongFilter filter;

  @override
  State<DefineFilterWidget> createState() => _DefineFilterWidgetState();
}

class _DefineFilterWidgetState extends State<DefineFilterWidget> {
  @override
  Widget build(BuildContext context) {
    if (!widget.filter.queryIsSet) {
      widget.filter.generateQuery();
    }
    List<Tag> tags = objectBox.getAllUserDefTags();



    Widget filterSelector = FilterTagSelector(
      availableTags: tags,
      includedTagIds:  widget.filter.includedTagIds, 
      excludedTagIds: widget.filter.excludedTagIds,
    );

    List<Tag> playlistTags = objectBox.getAllPlaylistTags();

    List<Widget> playlistDropDowns = List<Widget>.generate(
        playlistTags.length,
        (index) => SelectableDropdownItem(
              child: Text(playlistTags[index].name.replaceFirst(RegExp(r'playlist: '), ''),maxLines: 2,overflow: TextOverflow.ellipsis,),
              selected: widget.filter.includedTagIds.contains(playlistTags[index].id),
              onTapCallback: (bool selected){
                if(selected){
                  widget.filter.includedTagIds.remove(playlistTags[index].id);
                }else{
                  widget.filter.includedTagIds.add(playlistTags[index].id);
                }
              },
            ));
    List<Tag> genreTags = objectBox.getAllGenreTags();
    List<Widget> genreDropDowns =
        List<Widget>.generate(genreTags.length, (index) => SelectableDropdownItem(child: Text(genreTags[index].name.replaceFirst(RegExp(r'genre: '), ''))));

    Widget minSongDuration = Row(children: [
      InkWell(
          child: Text(widget.filter.shortestShorterSD.active ? 'Shorter than ${widget.filter.shortestShorterSD.duration.toString()}' : 'Max Duration Inactive'),
          onTap: () => showSongDurationPicker(context, (newDuration) {
                setState(() {
                  widget.filter.shortestShorterSD.duration = newDuration;
                  widget.filter.shortestShorterSD.active = true;
                });
              })),
      InkWell(
        child: widget.filter.shortestShorterSD.active ? Icon(Icons.refresh) : Container(),
        onTap: () {
          setState(() {
            widget.filter.shortestShorterSD.duration = Duration.zero;
            widget.filter.shortestShorterSD.active = false;
          });
        },
      )
    ]);
    Widget maxSongDuration = Row(children: [
      InkWell(
          child: Text(widget.filter.longestLongerSD.active ? 'Longer than ${widget.filter.longestLongerSD.duration.toString()}' : 'Min Duration Inactive'),
          onTap: () => showSongDurationPicker(context, (newDuration) {
                setState(() {
                  widget.filter.longestLongerSD.duration = newDuration;
                  widget.filter.longestLongerSD.active = true;
                });
              })),
      InkWell(
        child: widget.filter.longestLongerSD.active ? Icon(Icons.refresh) : Container(),
        onTap: () {
          setState(() {
            widget.filter.longestLongerSD.duration = Duration.zero;
            widget.filter.longestLongerSD.active = false;
          });
        },
      ),
    ]);

    Widget addedBefore = Row(children: [
      InkWell(
          child: Text(
            widget.filter.earliestBefDA.active ? 'Before ${widget.filter.earliestBefDA.dateAdded.toString()}' : 'Added Before Inactive',
            overflow: TextOverflow.fade,
          ),
          onTap: () async {
            DateTime? newDate = await chooseDate(context);
            if (newDate != null) {
              setState(() {
                widget.filter.earliestBefDA.dateAdded = newDate;
                widget.filter.earliestBefDA.active = true;
              });
            }
          }),
      InkWell(
        child: widget.filter.earliestBefDA.active ? Icon(Icons.refresh) : Container(),
        onTap: () {
          setState(() {
            widget.filter.earliestBefDA.dateAdded = null;
            widget.filter.earliestBefDA.active = false;
          });
        },
      )
    ]);
    Widget addedAfter = Row(children: [
      InkWell(
          child: Text(
            widget.filter.latestAfDA.active ? 'After ${widget.filter.latestAfDA.dateAdded.toString()}' : 'Added After Inactive',
            overflow: TextOverflow.fade,
          ),
          onTap: () async {
            DateTime? newDate = await chooseDate(context);
            if (newDate != null) {
              setState(() {
                widget.filter.latestAfDA.dateAdded = newDate;
                widget.filter.latestAfDA.active = true;
              });
            }
          }),
      InkWell(
        child: widget.filter.latestAfDA.active ? Icon(Icons.refresh) : Container(),
        onTap: () {
          setState(() {
            widget.filter.latestAfDA.dateAdded = null;
            widget.filter.latestAfDA.active = false;
          });
        },
      )
    ]);
    Widget releasedBefore = Row(children: [
      InkWell(
          child: Text(
            widget.filter.earliestBefDC.active ? 'Before ${widget.filter.earliestBefDC.dateCreated.toString()}' : 'Released Before Inactive',
            overflow: TextOverflow.fade,
          ),
          onTap: () async {
            DateTime? newDate = await chooseDate(context);
            if (newDate != null) {
              setState(() {
                widget.filter.earliestBefDC.dateCreated = newDate;
                widget.filter.earliestBefDC.active = true;
              });
            }
          }),
      InkWell(
        child: widget.filter.earliestBefDC.active ? Icon(Icons.refresh) : Container(),
        onTap: () {
          setState(() {
            widget.filter.earliestBefDC.dateCreated = null;
            widget.filter.earliestBefDC.active = false;
          });
        },
      )
    ]);
    Widget releasedAfter = Row(children: [
      InkWell(
          child: Text(
            widget.filter.latestAfDC.active ? 'After ${widget.filter.latestAfDC.dateCreated.toString()}' : 'Released After Inactive',
            overflow: TextOverflow.fade,
          ),
          onTap: () async {
            DateTime? newDate = await chooseDate(context);
            if (newDate != null) {
              setState(() {
                widget.filter.latestAfDC.dateCreated = newDate;
                widget.filter.latestAfDC.active = true;
              });
            }
          }),
      InkWell(
        child: widget.filter.latestAfDC.active ? Icon(Icons.refresh) : Container(),
        onTap: () {
          setState(() {
            widget.filter.latestAfDC.dateCreated = null;
            widget.filter.latestAfDC.active = false;
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
            Wrap(
              children: [
                maxSongDuration,
                minSongDuration,
              ],
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Date Added', style: FlutterFlowTheme.of(context).bodyMedium),
          children: [
            Wrap(
              children: [
                addedAfter,
                addedBefore,
              ],
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Date Created', style: FlutterFlowTheme.of(context).bodyMedium),
          children: [
            Wrap(
              children: [
                releasedAfter,
                releasedBefore,
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
