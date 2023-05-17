import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_nav_bar_widget/bottom_nav_bar_widget_widget.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/buttons/mini_button/mini_button_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'song_library_page_model.dart';
export 'song_library_page_model.dart';

class SongLibraryPageWidget extends StatefulWidget {
  const SongLibraryPageWidget({Key? key}) : super(key: key);

  @override
  _SongLibraryPageWidgetState createState() => _SongLibraryPageWidgetState();
}

class _SongLibraryPageWidgetState extends State<SongLibraryPageWidget> {
  late SongLibraryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SongLibraryPageModel());
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
          title: Align(
            alignment: AlignmentDirectional(0.35, 0.0),
            child: Text(
              'Song Library',
              style: FlutterFlowTheme.of(context).displaySmall.override(
                    fontFamily: 'Roboto Condensed',
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.settings_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-0.75, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('edit_songs_popup');
                                        },
                                        child: wrapWithModel(
                                          model: _model.defaultButtonModel1,
                                          updateCallback: () => setState(() {}),
                                          child: DefaultButtonWidget(
                                            text: 'Edit Songs',
                                            icon: Icon(
                                              Icons.edit,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                            width: 125.0,
                                            height: 60.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.75, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('add_songs_page');
                                        },
                                        child: wrapWithModel(
                                          model: _model.defaultButtonModel2,
                                          updateCallback: () => setState(() {}),
                                          child: DefaultButtonWidget(
                                            text: 'Add Songs',
                                            icon: Icon(
                                              Icons.library_music,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                            width: 125.0,
                                            height: 60.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.filterButtonModel,
                                      updateCallback: () => setState(() {}),
                                      child: FilterButtonWidget(),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.05, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('add_to_queue_page');
                                      },
                                      child: wrapWithModel(
                                        model: _model.miniButtonModel,
                                        updateCallback: () => setState(() {}),
                                        child: MiniButtonWidget(
                                          text: 'Add to queue',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('choose_song_tag_page');
                                    },
                                    child: wrapWithModel(
                                      model: _model.defualtSongModel,
                                      updateCallback: () => setState(() {}),
                                      child: DefualtSongWidget(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.bottomNavBarWidgetModel,
                    updateCallback: () => setState(() {}),
                    child: BottomNavBarWidgetWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
