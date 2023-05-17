import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'default_button_model.dart';
export 'default_button_model.dart';

class DefaultButtonWidget extends StatefulWidget {
  const DefaultButtonWidget({
    Key? key,
    this.text,
    this.icon,
    double? width,
    double? height,
    Color? colour,
  })  : this.width = width ?? 60.0,
        this.height = height ?? 60.0,
        this.colour = colour ?? const Color(0x34FFFFFF),
        super(key: key);

  final String? text;
  final Widget? icon;
  final double width;
  final double height;
  final Color colour;

  @override
  _DefaultButtonWidgetState createState() => _DefaultButtonWidgetState();
}

class _DefaultButtonWidgetState extends State<DefaultButtonWidget> {
  late DefaultButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DefaultButtonModel());
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
      width: valueOrDefault<double>(
        widget.width,
        125.0,
      ),
      height: valueOrDefault<double>(
        widget.height,
        60.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).accent1,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.text!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Roboto Condensed',
                    fontSize: 18.0,
                  ),
            ),
            widget.icon!,
          ],
        ),
      ),
    );
  }
}
