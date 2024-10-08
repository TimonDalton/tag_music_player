import 'package:flutter/material.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:tag_music_player/timoncode/functions/roundedCorners.dart';
import 'package:tag_music_player/timoncode/functions/roundedCorners.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class TapableTag extends StatefulWidget {
  const TapableTag({required this.tag, required this.selected, required this.index, required this.callback, required this.height, required this.width});
  final Tag tag;
  final bool selected;
  final int index;
  final Function callback;
  final double width, height;
  @override
  State<TapableTag> createState() => _TapableTagState();
}

class _TapableTagState extends State<TapableTag> {
  @override
  Widget build(BuildContext context) {
    const double textSizeMultipier = 0.75;
    return InkWell(
        onTap: () => widget.callback(widget.index),
        child: Container(
          width: widget.width,
          height: widget.height,
          margin: EdgeInsets.all(widget.height / 8),
          decoration: BoxDecoration(
            color: widget.tag.colour(),
            borderRadius: BorderRadius.circular(borderRadiusFromSides(widget.width, widget.height)),
          ),
          child: Center(
              child: Text(widget.tag.name, style: TextStyle(fontSize: widget.height * textSizeMultipier, fontWeight: widget.selected ? FontWeight.bold : FontWeight.normal))),
        ));
  }
}

class TagSelector extends StatefulWidget {
  ///Tags are the selectable tags.
  ///Max Selectable is the maximum amount of tags that are selectable at one time.
  /// overflowMax = false does not allow selecting more than maxSelectable, while = true deselects the first selected if max overflowed
  TagSelector({this.tags = const [], this.maxSelectable = null, this.overflowMax = false}) {
    if (maxSelectable == null) {
      maxSelectable = 1 << 63; //max int size
    }
  }
  List<Tag> tags;
  int? maxSelectable;
  bool overflowMax;
  List<int> selectedIndicies = [];
  List<int> getSelectedTagIds() {
    List<int> ret = [];
    for (int i = 0; i < selectedIndicies.length; i++) {
      ret.add(tags[selectedIndicies[i]].id);
    }
    return ret;
  }

  List<Tag> getSelectedTags() {
    List<Tag> ret = [];
    for (int i = 0; i < selectedIndicies.length; i++) {
      ret.add(tags[selectedIndicies[i]]);
    }
    return ret;
  }

  @override
  State<TagSelector> createState() => _TagSelectorState();
}

class _TagSelectorState extends State<TagSelector> {
  void callback(int index) {
    setState(() {
      if (widget.selectedIndicies.contains(index)) {
        widget.selectedIndicies.remove(index);
      } else {
        if (widget.selectedIndicies.length < widget.maxSelectable!) {
          widget.selectedIndicies.add(index);
        } else if (widget.overflowMax == true) {
          widget.selectedIndicies.removeAt(0);
          widget.selectedIndicies.add(index);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const double maxItemWidth = 100;

    return Container(
      child: new Builder(builder: (BuildContext context) {
        double maxWidth = MediaQuery.of(context).size.width*0.8;
        double maxHeight = MediaQuery.of(context).size.height;

        const double widthToHeight = 3.5;
        int itemCount = widget.tags.length;
        double area = maxHeight * maxWidth;
        double itemArea = area / itemCount;
        double maxColWidth = itemArea * (widthToHeight / (widthToHeight + 1));
        if (maxColWidth > maxItemWidth) {
          maxColWidth = maxItemWidth;
        }

        int itemsPerRow = (maxWidth / maxColWidth).ceil();
        double itemWidth = -1, itemHeight = -1;
        bool shouldLoop = true;
        while (shouldLoop) {
          itemWidth = maxWidth / itemsPerRow;
          itemHeight = itemWidth / widthToHeight;
          if ((maxHeight / itemHeight).floor() * (maxWidth / itemWidth).floor() < itemCount) {
            itemsPerRow += 1;
          } else {
            shouldLoop = false;
          }
        }
        List<Widget> children = [];
        for (int i = 0; i < itemCount; i++) {
          children.add(TapableTag(tag: widget.tags[i], selected: widget.selectedIndicies.contains(i), index: i, callback: callback, height: itemHeight, width: itemWidth));
        }
        return Selector(context, children);
      }),
    );
  }
}

Widget Selector(BuildContext context, List<Widget> children) {
  return Padding(
    padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
    child: Container(
      height: 150.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        borderRadius: BorderRadius.circular(0.0),
        shape: BoxShape.rectangle,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 200.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent1,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-0.9, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(7.0, 7.0, 7.0, 7.0),
                    child: Text(
                      'Tap to Select',
                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                            fontFamily: 'Roboto Condensed',
                            color: FlutterFlowTheme.of(context).accent1,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                Expanded(
                  child: Wrap(
                    spacing: 0.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [...children],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
