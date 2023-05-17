// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class DefualtSettableButton extends StatefulWidget {
  const DefualtSettableButton({
    Key? key,
    this.width,
    this.height,
    this.text,
    this.fontSize,
    this.fontStyle,
    this.onTap,
    this.buttonColour,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? text;
  final double? fontSize;
  final String? fontStyle;
  final Future<dynamic> Function()? onTap;
  final Color? buttonColour;

  @override
  _DefualtSettableButtonState createState() => _DefualtSettableButtonState();
}

class _DefualtSettableButtonState extends State<DefualtSettableButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width!,
      height: widget.height!,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(0),
        shape: BoxShape.rectangle,
      ),
      child: Align(
        alignment: AlignmentDirectional(0, 0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 50,
          decoration: BoxDecoration(
            color: widget.buttonColour,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              child: Text(
                widget.text!,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: widget.fontStyle,
                      fontSize: widget.fontSize,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
