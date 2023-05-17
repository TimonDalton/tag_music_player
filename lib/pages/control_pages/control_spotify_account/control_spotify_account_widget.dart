import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import '/project/components/text_widgets/textfield_widget/textfield_widget_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'control_spotify_account_model.dart';
export 'control_spotify_account_model.dart';

class ControlSpotifyAccountWidget extends StatefulWidget {
  const ControlSpotifyAccountWidget({Key? key}) : super(key: key);

  @override
  _ControlSpotifyAccountWidgetState createState() =>
      _ControlSpotifyAccountWidgetState();
}

class _ControlSpotifyAccountWidgetState
    extends State<ControlSpotifyAccountWidget> {
  late ControlSpotifyAccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ControlSpotifyAccountModel());
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
            alignment: AlignmentDirectional(-0.5, 0.0),
            child: Text(
              'Spotify Account',
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
              height: MediaQuery.of(context).size.height * 1.0,
              decoration: BoxDecoration(
                color: Color(0x00FFFFFF),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: wrapWithModel(
                      model: _model.headingTextModel,
                      updateCallback: () => setState(() {}),
                      child: HeadingTextWidget(
                        text: 'Login',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.textfieldWidgetModel1,
                      updateCallback: () => setState(() {}),
                      child: TextfieldWidgetWidget(
                        hintText: 'Username or email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.textfieldWidgetModel2,
                      updateCallback: () => setState(() {}),
                      child: TextfieldWidgetWidget(
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.defaultButtonModel,
                      updateCallback: () => setState(() {}),
                      child: DefaultButtonWidget(
                        text: 'Login',
                        icon: Icon(
                          Icons.account_circle,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                        width: 200.0,
                        height: 60.0,
                        colour: FlutterFlowTheme.of(context).primaryText,
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
