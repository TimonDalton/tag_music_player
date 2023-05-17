import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/other/tag_weight_slider/tag_weight_slider_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tag_weight_page_model.dart';
export 'tag_weight_page_model.dart';

class TagWeightPageWidget extends StatefulWidget {
  const TagWeightPageWidget({Key? key}) : super(key: key);

  @override
  _TagWeightPageWidgetState createState() => _TagWeightPageWidgetState();
}

class _TagWeightPageWidgetState extends State<TagWeightPageWidget> {
  late TagWeightPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagWeightPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
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
              '[Filter Name] Weights',
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
                          child: wrapWithModel(
                            model: _model.headingTextModel,
                            updateCallback: () => setState(() {}),
                            child: HeadingTextWidget(
                              text: 'Configure Tag Weights',
                            ),
                          ),
                        ),
                        ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            wrapWithModel(
                              model: _model.tagWeightSliderModel,
                              updateCallback: () => setState(() {}),
                              child: TagWeightSliderWidget(
                                tagName: '[tagName]',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  wrapWithModel(
                    model: _model.bottomOptionsBarWidgetModel,
                    updateCallback: () => setState(() {}),
                    child: BottomOptionsBarWidgetWidget(
                      confirmText: 'Save',
                      confirmColour: Color(0xFF0095FF),
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
}
