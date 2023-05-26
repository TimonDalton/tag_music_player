import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'delete_songs_page_model.dart';
export 'delete_songs_page_model.dart';

class DeleteSongsPageWidget extends StatefulWidget {
  const DeleteSongsPageWidget({Key? key}) : super(key: key);

  @override
  _DeleteSongsPageWidgetState createState() => _DeleteSongsPageWidgetState();
}

class _DeleteSongsPageWidgetState extends State<DeleteSongsPageWidget> {
  late DeleteSongsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteSongsPageModel());
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
            alignment: AlignmentDirectional(-0.85, 0.0),
            child: Text(
              'Remove Songs',
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
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.headingTextModel1,
                                  updateCallback: () => setState(() {}),
                                  child: HeadingTextWidget(
                                    text: 'Select Songs to Remove',
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.headingTextModel2,
                                  updateCallback: () => setState(() {}),
                                  child: HeadingTextWidget(
                                    text: '[x] Songs Selected',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          wrapWithModel(
                            model: _model.defaultButtonModel,
                            updateCallback: () => setState(() {}),
                            child: DefaultButtonWidget(
                              text: 'Filter',
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.2),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE85536),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      '-',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto Condensed',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 28.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.defualtSongModel,
                                updateCallback: () => setState(() {}),
                                child: DefualtSongWidget(),
                              ),
                            ],
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
                  confirmText: 'Remove\nSelected',
                  confirmColour: Color(0xFFE85536),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
