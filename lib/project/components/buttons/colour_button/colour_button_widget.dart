import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'colour_button_model.dart';
export 'colour_button_model.dart';

class ColourButtonWidget extends StatefulWidget {
  const ColourButtonWidget({
    Key? key,
    this.buttonColour,
    this.text,
  }) : super(key: key);

  final Color? buttonColour;
  final String? text;

  @override
  _ColourButtonWidgetState createState() => _ColourButtonWidgetState();
}

class _ColourButtonWidgetState extends State<ColourButtonWidget> {
  late ColourButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColourButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
      child: Container(
        width: 120.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(0.0),
          shape: BoxShape.rectangle,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50.0,
            decoration: BoxDecoration(
              color: valueOrDefault<Color>(
                widget.buttonColour,
                FlutterFlowTheme.of(context).accent1,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.text,
                    '[text]',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Roboto Condensed',
                        fontSize: 18.0,
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
