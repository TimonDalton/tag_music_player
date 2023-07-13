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
  void initState(){
    List<Tag> tags = widget.filter.tags.toList(); 
    widget.newWeights.forEach((id, tagWeight) {
      sliders.add(TagWeightSilder(
        changeCallback: (val)=>widget.newWeights[id] = val,
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
  TagWeightSilder({required this.tag, required this.weight, required this.changeCallback});
  Tag tag;
  double weight;
  Function(double) changeCallback;

  @override
  State<TagWeightSilder> createState() => _TagWeightSilderState();
}

class _TagWeightSilderState extends State<TagWeightSilder> {
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
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                            child: Container(
                              height: 100,
                              alignment: Alignment.center,
                              child: Expanded(
                                child: Slider(
                                  value: widget.weight,
                                  onChanged: (val) {
                                    setState(() {
                                      widget.weight = val;
                                    });
                                  },
                                  onChangeEnd: (val)=>widget.changeCallback(val),
                                  min: 0.0,
                                  max: 2.0,
                                  inactiveColor: widget.tag.colour(),
                                  activeColor: widget.tag.colour(),
                                  thumbColor: Colors.white70,
                                ),
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
    return Text(
      '${widget.val}',
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Roboto Condensed',
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
