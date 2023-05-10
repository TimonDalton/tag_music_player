import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/mini_button/mini_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'start_playing_bar_model.dart';
export 'start_playing_bar_model.dart';

class StartPlayingBarWidget extends StatefulWidget {
  const StartPlayingBarWidget({Key? key}) : super(key: key);

  @override
  _StartPlayingBarWidgetState createState() => _StartPlayingBarWidgetState();
}

class _StartPlayingBarWidgetState extends State<StartPlayingBarWidget> {
  late StartPlayingBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartPlayingBarModel());
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
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent1,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: wrapWithModel(
                  model: _model.miniButtonModel1,
                  updateCallback: () => setState(() {}),
                  child: MiniButtonWidget(
                    text: 'Play',
                  ),
                ),
              ),
              Expanded(
                child: wrapWithModel(
                  model: _model.miniButtonModel2,
                  updateCallback: () => setState(() {}),
                  child: MiniButtonWidget(
                    text: 'Shuffle',
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
