import 'dart:math';

import 'package:tag_music_player/timoncode/widgets/tag_groups/tagGroup.dart';

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
  double _heightCalc(double weight) {
    return (log(weight) + 1) * 25;
  }

  double _widthCalc(double weight) {
    return (log(weight) + 1) * 100;
  }

  @override
  Widget build(BuildContext context) {
    dynamic filterVals = widget.filter.getTagsByCategory();
    List<Tag> requiredTags = filterVals['required'];
    Map<Tag, double> includedTagsMap = filterVals['included'];
    List<Tag> excludedTags = filterVals['excluded'];

    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 160.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).accent1,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(children: [
                          Wrap(
                              children: List<Widget>.generate(
                            requiredTags.length,
                            (index) => TagWidget(
                              callback: () {},
                              index: -1,
                              selected: false,
                              tag: requiredTags[index],
                              height: 20,
                              width: 80,
                            ),
                          )),
                          Wrap(
                            children: () {
                              List<Widget> ret = [];
                              includedTagsMap.forEach((tag, weight) => ret.add(TagWidget(
                                    callback: () {},
                                    index: -1,
                                    selected: false,
                                    tag: tag,
                                    height: _heightCalc(weight),
                                    width: _widthCalc(weight),
                                  )));
                              return ret;
                            }(),
                          ),
                        ]),
                      ),
                      Container(
                        width: 5.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: List<Widget>.generate(
                              excludedTags.length,
                              (index) => TagWidget(
                                callback: () {},
                                index: -1,
                                selected: false,
                                tag: excludedTags[index],
                                height: 20,
                                width: 80,
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
