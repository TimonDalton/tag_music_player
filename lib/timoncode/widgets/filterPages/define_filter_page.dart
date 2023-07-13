import 'dart:convert';

import 'package:tag_music_player/timoncode/functions/nav/navBase.dart';
import 'package:tag_music_player/timoncode/models/playbackFilter.dart';
import 'package:tag_music_player/timoncode/widgets/tag_groups/filterTagsSelector.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/other/search_bar_widget/search_bar_widget_widget.dart';
import '/project/components/tag_group_widgets/included_excluded_tag_group/included_excluded_tag_group_widget.dart';
import '/project/components/tag_group_widgets/select_required_tag/select_required_tag_widget.dart';
import '/project/components/text_widgets/dropdown_text_widget/dropdown_text_widget_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import '/project/components/text_widgets/textfield_widget/textfield_widget_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:tag_music_player/timoncode/objectbox.dart';

class DefineFilterPage extends StatefulWidget {
  DefineFilterPage({this.filter}) {
    tags = objectBox.getAllUserDefTags();
    if (filter != null) {
      if (filter!.tagWeights != null) {
        filter!.tagWeights!.forEach((id, weight) {
          if (weight < PlaybackFilter.minRequiredWeight) {
            includedIds.add(id);
          } else {
            excludedIds.add(id);
          }
        });
      } else {
        throw 'filter!.tagWeights = null';
      }
    }
  }
  PlaybackFilter? filter;
  List<Tag> tags = [];
  List<int> includedIds = [];
  List<int> excludedIds = [];
  @override
  _DefineFilterPageState createState() => _DefineFilterPageState();
}

class _DefineFilterPageState extends State<DefineFilterPage> {
  TextEditingController nameTEC = TextEditingController();
  late FilterTagSelector filterTagSelector;

  @override
  void initState() {
    if (widget.filter != null) {
      nameTEC.text = widget.filter!.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            size: 46.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Align(
          alignment: AlignmentDirectional(-0.35, 0.0),
          child: Text(
            widget.filter == null ? 'Create Filter' : 'Edit ${widget.filter!.name}',
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
                width: MediaQuery.of(context).size.width * 0.85,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: HeadingTextWidget(
                            text: 'Name',
                          ),
                        ),
                        Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                            child: TextField(
                              controller: nameTEC,
                            )),
                        () {
                          filterTagSelector = FilterTagSelector(availableTags: widget.tags, includedTagIds: widget.includedIds, excludedTagIds: widget.excludedIds);
                          return filterTagSelector;
                        }(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            BottomOptionsBarWidgetWidget(
              confirmText: 'Save',
              onConfirmCallBack: () {
                PlaybackFilter saveFilter = PlaybackFilter(name: nameTEC.text);
                List<int> originalTagIds = [];
                if (widget.filter != null) {
                  saveFilter.id = widget.filter!.id;
                  List<Tag> originalTags = widget.filter!.tags.toList();
                  originalTagIds = List<int>.generate(originalTags.length, (index) => originalTags[index].id);
                }
                List<Tag> includedTags = filterTagSelector.getIncluded();
                List<Tag> excludedTags = filterTagSelector.getExcluded();
                List<int> currentExcludedTagIds = List<int>.generate(excludedTags.length, ((index) => excludedTags[index].id));
                saveFilter.tagWeights = {};
                saveFilter.tags.addAll(includedTags);
                saveFilter.tags.addAll(excludedTags);
                for (int i = 0; i < includedTags.length; i++) {
                  var insert = {
                    includedTags[i].id:
                        (originalTagIds.contains(includedTags[i].id) && !currentExcludedTagIds.contains(includedTags[i].id)) ? widget.filter!.tagWeights![includedTags[i].id]! : 1.0
                  };
                  saveFilter.tagWeights!.addAll(insert);
                }
                for (int i = 0; i < currentExcludedTagIds.length; i++) {
                  saveFilter.tagWeights!.addAll({currentExcludedTagIds[i]: 0.0});
                }
                if (saveFilter.tags.toList().length != saveFilter.tagWeights!.entries.toList().length) {
                  throw 'savefilter weights and tags incompatible: tags:${saveFilter.tags.toList().length} ; weights: ${saveFilter.tagWeights} ';
                }

                // dynamic jsonObj = jsonEncode(saveFilter.tagWeights);
                // print('mapJson: ${jsonObj}');
                objectBox.saveFilter(saveFilter);
                navBase(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
