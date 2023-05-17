// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class DefaultButton extends StatefulWidget {
  const DefaultButton({
    Key? key,
    this.width,
    this.height,
    this.onTap,
    this.text,
    this.icon,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function()? onTap;
  final String? text;
  final Widget? icon;

  @override
  _DefaultButtonState createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: widget.width!,
          height: widget.height!,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
            borderRadius: BorderRadius.circular(0),
            shape: BoxShape.rectangle,
          ),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 1.1,
              height: widget.height!,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).accent1,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
                          child: Text(
                            widget.text!,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Roboto Condensed',
                                  fontSize: 18,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: widget.icon!,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
