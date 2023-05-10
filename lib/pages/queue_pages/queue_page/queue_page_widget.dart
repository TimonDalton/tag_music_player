import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/now_playing_bar/now_playing_bar_widget.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/buttons/mini_button/mini_button_widget.dart';
import '/project/components/other/bottom_nav_bar_widget/bottom_nav_bar_widget_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import '/project/components/tag_group_widgets/editable_tag_group/editable_tag_group_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'queue_page_model.dart';
export 'queue_page_model.dart';

class QueuePageWidget extends StatefulWidget {
  const QueuePageWidget({Key? key}) : super(key: key);

  @override
  _QueuePageWidgetState createState() => _QueuePageWidgetState();
}

class _QueuePageWidgetState extends State<QueuePageWidget> {
  late QueuePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QueuePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'Queue',
              style: FlutterFlowTheme.of(context).displaySmall.override(
                    fontFamily: 'Roboto Condensed',
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
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 0.83,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.editableTagGroupModel,
                            updateCallback: () => setState(() {}),
                            child: EditableTagGroupWidget(),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-0.75, 0.0),
                                  child: wrapWithModel(
                                    model: _model.defaultButtonModel1,
                                    updateCallback: () => setState(() {}),
                                    child: DefaultButtonWidget(
                                      text: 'Save Filter',
                                      icon: Icon(
                                        Icons.save_alt,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.75, 0.0),
                                  child: wrapWithModel(
                                    model: _model.defaultButtonModel2,
                                    updateCallback: () => setState(() {}),
                                    child: DefaultButtonWidget(
                                      text: 'Set Tag \nWeights',
                                      icon: FaIcon(
                                        FontAwesomeIcons.slidersH,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: wrapWithModel(
                              model: _model.headingTextModel1,
                              updateCallback: () => setState(() {}),
                              child: HeadingTextWidget(
                                text: 'Now Playing',
                              ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.defualtSongModel1,
                            updateCallback: () => setState(() {}),
                            child: DefualtSongWidget(),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: wrapWithModel(
                                    model: _model.headingTextModel2,
                                    updateCallback: () => setState(() {}),
                                    child: HeadingTextWidget(
                                      text: 'Next From: [Source]',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                wrapWithModel(
                                  model: _model.defualtSongModel2,
                                  updateCallback: () => setState(() {}),
                                  child: DefualtSongWidget(),
                                ),
                                wrapWithModel(
                                  model: _model.defualtSongModel3,
                                  updateCallback: () => setState(() {}),
                                  child: DefualtSongWidget(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: wrapWithModel(
                              model: _model.miniButtonModel1,
                              updateCallback: () => setState(() {}),
                              child: MiniButtonWidget(
                                text: 'Add',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: wrapWithModel(
                              model: _model.miniButtonModel2,
                              updateCallback: () => setState(() {}),
                              child: MiniButtonWidget(
                                text: 'Remove',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.nowPlayingBarModel,
                          updateCallback: () => setState(() {}),
                          child: NowPlayingBarWidget(),
                        ),
                      ],
                    ),
                    wrapWithModel(
                      model: _model.bottomNavBarWidgetModel,
                      updateCallback: () => setState(() {}),
                      child: BottomNavBarWidgetWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
