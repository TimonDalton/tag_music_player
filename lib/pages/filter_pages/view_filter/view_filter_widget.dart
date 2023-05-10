import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/start_playing_bar/start_playing_bar_widget.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import '/project/components/tag_group_widgets/default_tag_group/default_tag_group_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_filter_model.dart';
export 'view_filter_model.dart';

class ViewFilterWidget extends StatefulWidget {
  const ViewFilterWidget({Key? key}) : super(key: key);

  @override
  _ViewFilterWidgetState createState() => _ViewFilterWidgetState();
}

class _ViewFilterWidgetState extends State<ViewFilterWidget> {
  late ViewFilterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewFilterModel());
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
              '[Filter Title]',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.9,
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
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.defaultTagGroupModel,
                            updateCallback: () => setState(() {}),
                            child: DefaultTagGroupWidget(),
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
                                      text: 'Edit Filter',
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
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.headingTextModel,
                                updateCallback: () => setState(() {}),
                                child: HeadingTextWidget(
                                  text: 'Songs',
                                ),
                              ),
                            ),
                          ),
                          ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              wrapWithModel(
                                model: _model.defualtSongModel,
                                updateCallback: () => setState(() {}),
                                child: DefualtSongWidget(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.startPlayingBarModel,
                updateCallback: () => setState(() {}),
                child: StartPlayingBarWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
