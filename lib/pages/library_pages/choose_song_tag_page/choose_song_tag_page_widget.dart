import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/bottom_bars/now_playing_bar/now_playing_bar_widget.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/other/search_bar_widget/search_bar_widget_widget.dart';
import '/project/components/song_widgets/tagless_song_widget/tagless_song_widget_widget.dart';
import '/project/components/tag_group_widgets/included_excluded_tag_group/included_excluded_tag_group_widget.dart';
import '/project/components/tag_group_widgets/select_tag_widget/select_tag_widget_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_song_tag_page_model.dart';
export 'choose_song_tag_page_model.dart';

class ChooseSongTagPageWidget extends StatefulWidget {
  const ChooseSongTagPageWidget({Key? key}) : super(key: key);

  @override
  _ChooseSongTagPageWidgetState createState() =>
      _ChooseSongTagPageWidgetState();
}

class _ChooseSongTagPageWidgetState extends State<ChooseSongTagPageWidget> {
  late ChooseSongTagPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseSongTagPageModel());
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
            alignment: AlignmentDirectional(-0.35, 0.0),
            child: Text(
              'Choose Tags',
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
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          wrapWithModel(
                            model: _model.headingTextModel1,
                            updateCallback: () => setState(() {}),
                            child: HeadingTextWidget(
                              text: 'Add Tags to the Song',
                            ),
                          ),
                          wrapWithModel(
                            model: _model.taglessSongWidgetModel,
                            updateCallback: () => setState(() {}),
                            child: TaglessSongWidgetWidget(),
                          ),
                          wrapWithModel(
                            model: _model.nowPlayingBarModel,
                            updateCallback: () => setState(() {}),
                            child: NowPlayingBarWidget(),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: wrapWithModel(
                              model: _model.headingTextModel2,
                              updateCallback: () => setState(() {}),
                              child: HeadingTextWidget(
                                text: 'Search Tag',
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.searchBarWidgetModel,
                                updateCallback: () => setState(() {}),
                                child: SearchBarWidgetWidget(
                                  hintText: 'Enter tag name here',
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.headingTextModel3,
                                    updateCallback: () => setState(() {}),
                                    child: HeadingTextWidget(
                                      text: 'Available Tags',
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.filterButtonModel,
                                  updateCallback: () => setState(() {}),
                                  child: FilterButtonWidget(),
                                ),
                              ),
                            ],
                          ),
                          wrapWithModel(
                            model: _model.selectTagWidgetModel,
                            updateCallback: () => setState(() {}),
                            child: SelectTagWidgetWidget(),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: wrapWithModel(
                              model: _model.headingTextModel4,
                              updateCallback: () => setState(() {}),
                              child: HeadingTextWidget(
                                text: 'Selected Tags',
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: wrapWithModel(
                              model: _model.includedExcludedTagGroupModel,
                              updateCallback: () => setState(() {}),
                              child: IncludedExcludedTagGroupWidget(),
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 300.0,
                            decoration: BoxDecoration(
                              color: Color(0x00FFFFFF),
                            ),
                          ),
                        ],
                      ),
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
