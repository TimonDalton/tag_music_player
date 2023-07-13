import 'dart:math';

import 'package:tag_music_player/timoncode/functions/nav/navBase.dart';
import 'package:tag_music_player/timoncode/objectbox.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/other/tag_weight_slider/tag_weight_slider_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tag_music_player/timoncode/models/playbackFilter.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';

class TagWeightPage extends StatefulWidget {
  TagWeightPage({required this.filter}) {
    newWeights = filter.tagWeights!;
  }
  PlaybackFilter filter;
  late Map<int, double> newWeights;

  @override
  _TagWeightPageState createState() => _TagWeightPageState();
}

class _TagWeightPageState extends State<TagWeightPage> {
  List<TagWeightSilder> sliders = [];
  @override
  void initState() {
    List<Tag> tags = widget.filter.tags.toList();
    widget.newWeights.forEach((id, tagWeight) {
      sliders.add(TagWeightSilder(
        changeCallback: (val) => widget.newWeights[id] = val,
        tag: tags.where((tag) => tag.id == id).first,
        weight: tagWeight,
      ));
    });
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
            size: 36.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Text(
            '${widget.filter.name} Weights',
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
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0x00FFFFFF),
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: HeadingTextWidget(
                          text: 'Configure Tag Weights',
                        ),
                      ),
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: sliders,
                      ),
                    ],
                  ),
                ),
                BottomOptionsBarWidgetWidget(
                  confirmText: 'Save',
                  confirmColour: Color(0xFF0095FF),
                  onConfirmCallBack: (){
                    widget.filter.tagWeights = widget.newWeights;
                    objectBox.saveFilter(widget.filter);
                    navBase(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TagWeightSilder extends StatefulWidget {
  TagWeightSilder({required this.tag, required this.weight, required this.changeCallback}) {
    convertedSliderVal = toSliderVal(weight);
  }
  Tag tag;
  double weight;
  Function(double) changeCallback;

  static const double maxVal = 1.1;
  static const double minVal = -1.1;
  double toSliderVal(double val) {
    // print('toSliderVal on: ${val}');
    if (val < PlaybackFilter.maxExcludedWeight) {
      val = pow(PlaybackFilter.minRequiredWeight, minVal) as double;
    } else if (val > PlaybackFilter.minRequiredWeight) {
      val = pow(PlaybackFilter.minRequiredWeight, maxVal) as double;
    }
    return log(val) / log(PlaybackFilter.minRequiredWeight); //same as logBase(val,PlaybackFilter.minRequiredWeight). logBase not in my dart:math for some reason
  }

  double fromSliderVal(double val) {
    // print('fromSliderVal on: ${val}');
    if (val < minVal) {
      val = minVal;
    } else if (val > maxVal) {
      val = maxVal;
    }
    return pow(PlaybackFilter.minRequiredWeight, val) as double;
  }

  late double convertedSliderVal;
  @override
  State<TagWeightSilder> createState() => _TagWeightSilderState();
}

class _TagWeightSilderState extends State<TagWeightSilder> {
  bool near(double search, double target) {
    const double epsilon = 0.06;
    double val = target - search;
    if (val < 0) {
      val = -val;
    }
    if (val < epsilon) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: Color(0x0EFFFFFF),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Text(
                          widget.tag.name,
                          textAlign: TextAlign.justify,
                          style: FlutterFlowTheme.of(context).titleLarge.override(
                                fontFamily: 'Roboto Condensed',
                                color: widget.tag.colour(),
                                fontSize: 18.0,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.9, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                        child: NumberTracker(val: widget.weight),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                          child: Container(
                            height: 100,
                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                            alignment: Alignment.center,
                            child: Expanded(
                              child: Slider(
                                value: widget.convertedSliderVal,
                                onChanged: (sliderVal) {
                                  setState(() {
                                    if (near(sliderVal, TagWeightSilder.minVal)) {
                                      widget.convertedSliderVal = TagWeightSilder.minVal;
                                    } else if (near(sliderVal, 0)) {
                                      widget.convertedSliderVal = 0;
                                    } else if (near(sliderVal, TagWeightSilder.maxVal)) {
                                      widget.convertedSliderVal = TagWeightSilder.maxVal;
                                    } else {
                                      widget.convertedSliderVal = sliderVal;
                                    }
                                    widget.weight = widget.fromSliderVal(widget.convertedSliderVal);
                                  });
                                  // print('widget.weight:${widget.weight}');
                                  // print('widget.convertedSliderVal:${widget.convertedSliderVal}');
                                },
                                onChangeEnd: (sliderVal) {
                                  widget.changeCallback(widget.weight);
                                },
                                min: TagWeightSilder.minVal,
                                max: TagWeightSilder.maxVal,
                                inactiveColor: widget.tag.colour(),
                                activeColor: widget.tag.colour(),
                                thumbColor: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NumberTracker extends StatefulWidget {
  const NumberTracker({super.key, required double val}) : val = val;
  final double val;
  @override
  State<NumberTracker> createState() => _NumberTrackerState();
}

class _NumberTrackerState extends State<NumberTracker> {
  @override
  Widget build(BuildContext context) {
    String text = widget.val.toStringAsFixed(2);
    if (widget.val < PlaybackFilter.maxExcludedWeight) {
      text = 'Excluded';
    } else if (widget.val > PlaybackFilter.minRequiredWeight) {
      text = 'Required';
    }
    return Text(
      text,
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Roboto Condensed',
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
