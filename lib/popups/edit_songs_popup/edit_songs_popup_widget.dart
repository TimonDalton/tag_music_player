import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/default_text_button/default_text_button_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_songs_popup_model.dart';
export 'edit_songs_popup_model.dart';

class EditSongsPopupWidget extends StatefulWidget {
  const EditSongsPopupWidget({Key? key}) : super(key: key);

  @override
  _EditSongsPopupWidgetState createState() => _EditSongsPopupWidgetState();
}

class _EditSongsPopupWidgetState extends State<EditSongsPopupWidget> {
  late EditSongsPopupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditSongsPopupModel());
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
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-0.3, 0.0),
            child: Text(
              'Edit Songs',
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
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: wrapWithModel(
                      model: _model.headingTextModel1,
                      updateCallback: () => setState(() {}),
                      child: HeadingTextWidget(
                        text: 'Change Song\'s Tags',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.4, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context
                                .pushNamed('select_editable_song_tags_popup');
                          },
                          child: wrapWithModel(
                            model: _model.defaultTextButtonModel1,
                            updateCallback: () => setState(() {}),
                            child: DefaultTextButtonWidget(
                              text: 'Change \nSelected',
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.4, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context
                                .pushNamed('change_songs_tags_by_group_page');
                          },
                          child: wrapWithModel(
                            model: _model.defaultTextButtonModel2,
                            updateCallback: () => setState(() {}),
                            child: DefaultTextButtonWidget(
                              text: 'Change by \nGroup',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: wrapWithModel(
                      model: _model.headingTextModel2,
                      updateCallback: () => setState(() {}),
                      child: HeadingTextWidget(
                        text: 'Change Existing Tags',
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.75, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('edit_tags_popup');
                      },
                      child: wrapWithModel(
                        model: _model.defaultTextButtonModel3,
                        updateCallback: () => setState(() {}),
                        child: DefaultTextButtonWidget(
                          text: 'Edit Tags',
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: wrapWithModel(
                      model: _model.headingTextModel3,
                      updateCallback: () => setState(() {}),
                      child: HeadingTextWidget(
                        text: 'Remove Songs',
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.75, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('delete_songs_page');
                      },
                      child: wrapWithModel(
                        model: _model.defaultTextButtonModel4,
                        updateCallback: () => setState(() {}),
                        child: DefaultTextButtonWidget(
                          text: 'Remove \nSongs',
                        ),
                      ),
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
