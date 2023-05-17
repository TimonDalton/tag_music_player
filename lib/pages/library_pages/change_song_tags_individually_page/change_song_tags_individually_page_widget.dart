import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/other/colour_toggle_bubble_widget/colour_toggle_bubble_widget_widget.dart';
import '/project/components/song_widgets/song_artist_and_name_widget/song_artist_and_name_widget_widget.dart';
import '/project/components/tag_widgets/default_tag/default_tag_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_song_tags_individually_page_model.dart';
export 'change_song_tags_individually_page_model.dart';

class ChangeSongTagsIndividuallyPageWidget extends StatefulWidget {
  const ChangeSongTagsIndividuallyPageWidget({Key? key}) : super(key: key);

  @override
  _ChangeSongTagsIndividuallyPageWidgetState createState() =>
      _ChangeSongTagsIndividuallyPageWidgetState();
}

class _ChangeSongTagsIndividuallyPageWidgetState
    extends State<ChangeSongTagsIndividuallyPageWidget> {
  late ChangeSongTagsIndividuallyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangeSongTagsIndividuallyPageModel());
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
            alignment: AlignmentDirectional(-0.55, 0.0),
            child: Text(
              'Change Song Tags',
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
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 125.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.headingTextModel1,
                                    updateCallback: () => setState(() {}),
                                    child: HeadingTextWidget(
                                      text: 'Visible Tags',
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      13.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          'select_editable_song_tags_popup');
                                    },
                                    child: Container(
                                      width: 130.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Wrap(
                                          spacing: 0.0,
                                          runSpacing: 0.0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            wrapWithModel(
                                              model: _model.defaultTagModel1,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: DefaultTagWidget(
                                                name: 'Rock',
                                                colour: Color(0xFF5AA849),
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.defaultTagModel2,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: DefaultTagWidget(
                                                name: 'Oldies',
                                                colour: Color(0xFFE85536),
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.defaultTagModel3,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: DefaultTagWidget(
                                                name: 'Vibe',
                                                colour: Color(0xFF8F0095),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 13.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 125.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: wrapWithModel(
                                    model: _model.filterButtonModel,
                                    updateCallback: () => setState(() {}),
                                    child: FilterButtonWidget(),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        13.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 130.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -0.65),
                                        child: wrapWithModel(
                                          model: _model.headingTextModel2,
                                          updateCallback: () => setState(() {}),
                                          child: HeadingTextWidget(
                                            text: 'None',
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
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.headingTextModel3,
                                updateCallback: () => setState(() {}),
                                child: HeadingTextWidget(
                                  text: 'Song',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.headingTextModel4,
                                updateCallback: () => setState(() {}),
                                child: HeadingTextWidget(
                                  text: 'Rock',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.headingTextModel5,
                                updateCallback: () => setState(() {}),
                                child: HeadingTextWidget(
                                  text: 'Oldies',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.headingTextModel6,
                                updateCallback: () => setState(() {}),
                                child: HeadingTextWidget(
                                  text: 'Vibe',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            wrapWithModel(
                              model: _model.songArtistAndNameWidgetModel,
                              updateCallback: () => setState(() {}),
                              child: SongArtistAndNameWidgetWidget(),
                            ),
                            wrapWithModel(
                              model: _model.colourToggleBubbleWidgetModel1,
                              updateCallback: () => setState(() {}),
                              child: ColourToggleBubbleWidgetWidget(
                                colour: Color(0xFF5AA849),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.colourToggleBubbleWidgetModel2,
                              updateCallback: () => setState(() {}),
                              child: ColourToggleBubbleWidgetWidget(
                                colour: Color(0xFFE85536),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.colourToggleBubbleWidgetModel3,
                              updateCallback: () => setState(() {}),
                              child: ColourToggleBubbleWidgetWidget(
                                colour: Color(0xFF8F0095),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.bottomOptionsBarWidgetModel,
                updateCallback: () => setState(() {}),
                child: BottomOptionsBarWidgetWidget(
                  confirmText: 'Save',
                  confirmColour: Color(0xFF0094ED),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
