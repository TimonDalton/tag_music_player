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

class TagGroupWithWeights extends StatefulWidget {
  const TagGroupWithWeights({
    required this.filter,
  });

  final PlaybackFilter filter;

  @override
  _TagGroupWithWeightsState createState() => _TagGroupWithWeightsState();
}

class _TagGroupWithWeightsState extends State<TagGroupWithWeights> {
  double _heightCalc(double weight) {
    return (log(weight) + 1) * 25;
  }

  double _widthCalc(double weight) {
    return (log(weight) + 1) * 100;
  }

  @override
  Widget build(BuildContext context) {
    bool hasInitiated = widget.filter.tags.length > 0;
    dynamic filterVals = hasInitiated ? widget.filter.getTagsByCategory() : [];
    List<Tag> requiredTags = hasInitiated ? filterVals['required'] : [];
    Map<Tag, double> includedTagsMap = hasInitiated ? filterVals['included'] : {};
    List<Tag> excludedTags = hasInitiated ? filterVals['excluded'] : [];

    return Expanded(
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
    ));
  }
}
