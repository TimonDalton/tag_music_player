import 'dart:math';

import 'package:tag_music_player/timoncode/widgets/tag_groups/tagGroup.dart';
import 'package:tag_music_player/timoncode/widgets/tag_groups/tagGroupWithWeights.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/tag_widgets/default_tag/default_tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tag_music_player/timoncode/models/playbackFilter.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';

class DisplayPlaybackFilter extends StatefulWidget {
  const DisplayPlaybackFilter({
    required this.filter,
  });

  final PlaybackFilter filter;

  @override
  _DisplayPlaybackFilterState createState() => _DisplayPlaybackFilterState();
}

class _DisplayPlaybackFilterState extends State<DisplayPlaybackFilter> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 160.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
         TagGroupWithWeights(filter: widget.filter),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
            child: Text(
              widget.filter.name,
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Roboto Condensed',
                    fontSize: 20.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
