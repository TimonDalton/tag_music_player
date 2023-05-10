import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mini_button_model.dart';
export 'mini_button_model.dart';

class MiniButtonWidget extends StatefulWidget {
  const MiniButtonWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  _MiniButtonWidgetState createState() => _MiniButtonWidgetState();
}

class _MiniButtonWidgetState extends State<MiniButtonWidget> {
  late MiniButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiniButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
        child: Container(
          width: 120.0,
          height: 30.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent1,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.text,
                '[text]',
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
