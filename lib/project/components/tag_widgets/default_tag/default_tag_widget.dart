import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'default_tag_model.dart';
export 'default_tag_model.dart';

class DefaultTagWidget extends StatefulWidget {
  const DefaultTagWidget({
    Key? key,
    this.name,
    Color? colour,
    double? fontSize,
  })  : this.colour = colour ?? const Color(0x800D7D02),
        this.fontSize = fontSize ?? 12.0,
        super(key: key);

  final String? name;
  final Color colour;
  final double fontSize;

  @override
  _DefaultTagWidgetState createState() => _DefaultTagWidgetState();
}

class _DefaultTagWidgetState extends State<DefaultTagWidget> {
  late DefaultTagModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DefaultTagModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 2.0),
      child: Container(
        width: 45.0,
        height: 18.0,
        decoration: BoxDecoration(
          color: widget.colour,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            widget.name!,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Roboto Condensed',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: valueOrDefault<double>(
                    widget.fontSize,
                    8.0,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
