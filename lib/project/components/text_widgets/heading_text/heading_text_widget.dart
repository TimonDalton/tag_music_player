import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'heading_text_model.dart';
export 'heading_text_model.dart';

class HeadingTextWidget extends StatefulWidget {
  const HeadingTextWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  _HeadingTextWidgetState createState() => _HeadingTextWidgetState();
}

class _HeadingTextWidgetState extends State<HeadingTextWidget> {
  late HeadingTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeadingTextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
      child: Text(
        widget.text!,
        style: FlutterFlowTheme.of(context).titleLarge.override(
              fontFamily: 'Roboto Condensed',
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
