import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/default_text_button/default_text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'queue_song_hold_popup_model.dart';
export 'queue_song_hold_popup_model.dart';

class QueueSongHoldPopupWidget extends StatefulWidget {
  const QueueSongHoldPopupWidget({Key? key}) : super(key: key);

  @override
  _QueueSongHoldPopupWidgetState createState() =>
      _QueueSongHoldPopupWidgetState();
}

class _QueueSongHoldPopupWidgetState extends State<QueueSongHoldPopupWidget> {
  late QueueSongHoldPopupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QueueSongHoldPopupModel());
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
              size: 46.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-0.35, 0.0),
            child: Text(
              'Tag Details',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.defaultTextButtonModel1,
                  updateCallback: () => setState(() {}),
                  child: DefaultTextButtonWidget(
                    text: 'Play Next',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.defaultTextButtonModel2,
                  updateCallback: () => setState(() {}),
                  child: DefaultTextButtonWidget(
                    text: 'Add to Queue',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.defaultTextButtonModel3,
                  updateCallback: () => setState(() {}),
                  child: DefaultTextButtonWidget(
                    text: 'Remove From Queue',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.defaultTextButtonModel4,
                  updateCallback: () => setState(() {}),
                  child: DefaultTextButtonWidget(
                    text: 'Edit Tags',
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
