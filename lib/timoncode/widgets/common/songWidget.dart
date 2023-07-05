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

class SongWidget extends StatefulWidget {
  SongWidget({required this.song, this.index = null, this.leading, List<Tag> extraIncluded = const [], List<Tag> extraExcluded = const []})
      : this.extraIncludedTags = extraIncluded.length > 0 ? extraIncluded : [],
        this.extraExcludedTags = extraExcluded.length > 0 ? extraExcluded : [];
  final Song song;
  final int? index;
  List<Tag> extraIncludedTags;
  List<Tag> extraExcludedTags;
  Widget? leading;

  @override
  _SongWidgetState createState() => _SongWidgetState();
}

class _SongWidgetState extends State<SongWidget> {
  @override
  Widget build(BuildContext context) {
    List<Tag> tags = widget.song.tags.toList();
    List<int> localIncludeTagIds = List<int>.generate(tags.length, (index) => tags[index].id);
    List<int> extraIncludedTagIds = List<int>.generate(widget.extraIncludedTags.length, (index) => widget.extraIncludedTags[index].id);
    for(int i =0;i< widget.extraIncludedTags.length;i++){
      if(!localIncludeTagIds.contains(extraIncludedTagIds[i])){
        tags.add(widget.extraIncludedTags[i]);
      }
    }
    List<int> excludeGenerate = List<int>.generate(
      widget.extraExcludedTags.length,
      (index) => widget.extraExcludedTags[index].id,
    );
    tags.removeWhere((element) => excludeGenerate.contains(element.id));
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
      child: Container(
        height: 45.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(0.0),
          shape: BoxShape.rectangle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: double.infinity,
            height: 40.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent1,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            widget.leading == null
                                ? Container(
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).accent1,
                                    ),
                                  )
                                : Container(
                                    child: widget.leading,
                                  ),
                            widget.index == null
                                ? Container()
                                : Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        (widget.index! + 1).toString(),
                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                      ),
                                    ),
                                  ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      widget.song.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 20.0, 0.0),
                                          child: Text(
                                            widget.song.artist,
                                            overflow: TextOverflow.ellipsis,
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'Roboto Condensed',
                                                  color: FlutterFlowTheme.of(context).accent1,
                                                  fontSize: 12,
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 60,
                                            alignment: Alignment.centerRight,
                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 20.0, 0.0),
                                            child: Text(
                                              Song.durationToString(widget.song.duration),
                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TagGroup(tags: tags),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
