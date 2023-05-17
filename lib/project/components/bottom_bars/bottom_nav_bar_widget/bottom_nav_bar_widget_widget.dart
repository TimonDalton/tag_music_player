import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_nav_bar_widget_model.dart';
export 'bottom_nav_bar_widget_model.dart';

class BottomNavBarWidgetWidget extends StatefulWidget {
  const BottomNavBarWidgetWidget({Key? key}) : super(key: key);

  @override
  _BottomNavBarWidgetWidgetState createState() =>
      _BottomNavBarWidgetWidgetState();
}

class _BottomNavBarWidgetWidgetState extends State<BottomNavBarWidgetWidget> {
  late BottomNavBarWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavBarWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 65.0,
      decoration: BoxDecoration(
        color: Color(0x00FFFFFF),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2.0,
            sigmaY: 2.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 25.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                fillColor: FlutterFlowTheme.of(context).accent1,
                icon: Icon(
                  Icons.queue_music_sharp,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 25.0,
                ),
                onPressed: () async {
                  setState(() {
                    FFAppState().basePage = 0;
                  });

                  context.pushNamed('Queue_Page');
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                fillColor: FlutterFlowTheme.of(context).accent1,
                icon: Icon(
                  Icons.dashboard_customize,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  setState(() {
                    FFAppState().basePage = 1;
                  });

                  context.pushNamed('Filters_Page');
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                fillColor: FlutterFlowTheme.of(context).accent1,
                icon: Icon(
                  Icons.local_library_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  setState(() {
                    FFAppState().basePage = 2;
                  });

                  context.pushNamed('song_library_page');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
