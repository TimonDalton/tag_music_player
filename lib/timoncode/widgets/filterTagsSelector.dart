import 'package:flutter/material.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:tag_music_player/timoncode/functions/roundedCorners.dart';
import 'package:tag_music_player/timoncode/functions/roundedCorners.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class DragTag extends StatefulWidget {
  const DragTag(
      {required this.tag, required this.index, required this.callback});
  final Tag tag;
  final int index;
  final Function callback;
  @override
  State<DragTag> createState() => _DragTagState();
}

class _DragTagState extends State<DragTag> {
  final double width = 80;
  final double height = 30;
  @override
  Widget build(BuildContext context) {
    const double textSizeMultipier = 0.75;
    return InkWell(
        onTap: () => widget.callback(widget.index),
        child: Container(
          margin: EdgeInsets.all(height / 8),
          decoration: BoxDecoration(
            color: widget.tag.colour,
            borderRadius:
                BorderRadius.circular(borderRadiusFromSides(width, height)),
          ),
          child: Center(
              child: Text(widget.tag.name,
                  style: TextStyle(
                      fontSize: height * textSizeMultipier,
                      fontWeight: FontWeight.normal))),
        ));
  }
}

class FilterTagSelector extends StatefulWidget {
  FilterTagSelector({this.tags = const [],this.included = const [],this.excluded = const[]}){
    for(int i =0;i<tags.length;i++){
      if( !(this.included.contains(this.tags[i].id) || this.excluded.contains(this.tags[i].id)) ){
        available.add(this.tags[i].id);
      }
    }
  }
  List<Tag> tags;
  List<int> available = [];
  List<int> included = [];
  List<int> excluded = [];
  List<int> getIncludedTagIds() {
    List<int> ret = List.filled(included.length, -1);
    for (int i = 0; i < included.length; i++) {
      ret.add(tags[included[i]].id);
    }
    return ret;
  }

  List<int> getExcludedTagIds() {
    List<int> ret = List.filled(excluded.length, -1);
    for (int i = 0; i < excluded.length; i++) {
      ret.add(tags[excluded[i]].id);
    }
    return ret;
  }

  @override
  State<FilterTagSelector> createState() => _FilterTagSelectorState();
}

class _FilterTagSelectorState extends State<FilterTagSelector> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget filterSelector(BuildContext context) {
  return Column(

  );
}


Widget AvailableBox(BuildContext context, List<Widget> children) {
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
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
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

Widget IncludedBox(BuildContext context, List<Widget> children) {
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
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
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


Widget ExcludedBox(BuildContext context, List<Widget> children) {
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
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
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