import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'control_spotify_account_model.dart';
export 'control_spotify_account_model.dart';
import 'package:tag_music_player/timoncode/showSnackbar/showMessageSnackbar.dart';
import 'package:tag_music_player/timoncode/control_spotify/api_calls.dart';
import 'package:tag_music_player/timoncode/control_spotify/getAccessToken.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        try {
                          var token = await getAccessToken();
                          print('connected token = ${token}');
                          if (token == '')throw '';
                          // setState(() {
                          //   FFAppState().spotifyConnectionStatus = 'Connected';
                          // });
                          showMessageSnackbar('Connected to Spotify', context);
                        } catch (e) {
                          print('connection error:');
                          print(e);
                          setState(() {
                            FFAppState().spotifyConnectionStatus =
                                'Not Connected';
                          });
                          showMessageSnackbar(
                              'Error connecting to Spotify. Check to see if Spotify is open',
                              context);
                        }
                      },
                      child: wrapWithModel(
                        model: _model.defaultButtonModel1,
                        updateCallback: () => setState(() {}),
                        child: DefaultButtonWidget(
                          text: 'Connect to Spotify App',
                          icon: Icon(
                            Icons.settings_remote_outlined,
                            color: FlutterFlowTheme.of(context).lineColor,
                          ),
                          width: 240.0,
                          height: 60.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        try {
                          String authenticationToken = await getAccessToken();

                          setState(() {
                          FFAppState().spotifyAuthToken = authenticationToken;
                          FFAppState().hasAuthToken = true;
                          });
                          ;
                        } catch (e) {
                          print('error getting Auth Token:');
                          print(e);
                          setState(() {
                          FFAppState().hasAuthToken = false;
                          });
                          showMessageSnackbar(
                              'Error connecting Auth Token', context);
                        }
                      },
                      child: wrapWithModel(
                        model: _model.defaultButtonModel2,
                        updateCallback: () => setState(() {}),
                        child: DefaultButtonWidget(
                          text: 'Connect to \nSpotify Account',
                          icon: Icon(
                            Icons.account_circle,
                            color: FlutterFlowTheme.of(context).lineColor,
                          ),
                          width: 240.0,
                          height: 60.0,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: wrapWithModel(
                          model: _model.headingTextModel1,
                          updateCallback: () => setState(() {}),
                          child: HeadingTextWidget(
                            text: 'Spotify App Connection:',
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: wrapWithModel(
                          model: _model.headingTextModel2,
                          updateCallback: () => setState(() {}),
                          child: HeadingTextWidget(
                            text: valueOrDefault<String>(
                              FFAppState().spotifyConnectionStatus,
                              'Not Connected',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: wrapWithModel(
                          model: _model.headingTextModel3,
                          updateCallback: () => setState(() {}),
                          child: HeadingTextWidget(
                            text: 'Spotify Account Connection:',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: wrapWithModel(
                            model: _model.headingTextModel4,
                            updateCallback: () => setState(() {}),
                            child: HeadingTextWidget(
                              text: valueOrDefault<String>(
                                FFAppState().spotifyConnectionStatus,
                                'Not Connected',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        try {
                          await getUserId();                          
                        } catch (e) {
                          print(e);
                        }
                        try {
                          await getUserPlaylists();                          
                        } catch (e) {
                          print(e);
                        }
                        
                      },
                      child: wrapWithModel(
                        model: _model.defaultButtonModel2,
                        updateCallback: () => setState(() {}),
                        child: DefaultButtonWidget(
                          text: 'Connect to \nSpotify Account',
                          icon: Icon(
                            Icons.account_circle,
                            color: FlutterFlowTheme.of(context).lineColor,
                          ),
                          width: 240.0,
                          height: 60.0,
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
