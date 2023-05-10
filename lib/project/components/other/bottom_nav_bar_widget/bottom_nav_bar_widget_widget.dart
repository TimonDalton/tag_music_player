import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
    return Container(
      width: double.infinity,
      height: 65.0,
      decoration: BoxDecoration(
        color: Color(0x00FFFFFF),
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
            onPressed: () {
              print('IconButton pressed ...');
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
            onPressed: () {
              print('IconButton pressed ...');
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
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        ],
      ),
    );
  }
}
