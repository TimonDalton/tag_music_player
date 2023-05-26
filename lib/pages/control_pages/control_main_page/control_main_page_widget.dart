import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/control_page_components/control_spotify_account_display_and_link/control_spotify_account_display_and_link_widget.dart';
import '/project/components/control_page_components/control_subscription_board_link/control_subscription_board_link_widget.dart';
import '/project/components/control_page_components/control_suggestion_control/control_suggestion_control_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'control_main_page_model.dart';
export 'control_main_page_model.dart';

class ControlMainPageWidget extends StatefulWidget {
  const ControlMainPageWidget({Key? key}) : super(key: key);

  @override
  _ControlMainPageWidgetState createState() => _ControlMainPageWidgetState();
}

class _ControlMainPageWidgetState extends State<ControlMainPageWidget> {
  late ControlMainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ControlMainPageModel());
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
              'Account Settings',
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
                  wrapWithModel(
                    model: _model.controlSpotifyAccountDisplayAndLinkModel,
                    updateCallback: () => setState(() {}),
                    child: ControlSpotifyAccountDisplayAndLinkWidget(),
                  ),
                  wrapWithModel(
                    model: _model.controlSubscriptionBoardLinkModel,
                    updateCallback: () => setState(() {}),
                    child: ControlSubscriptionBoardLinkWidget(),
                  ),
                  wrapWithModel(
                    model: _model.controlSuggestionControlModel,
                    updateCallback: () => setState(() {}),
                    child: ControlSuggestionControlWidget(),
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
