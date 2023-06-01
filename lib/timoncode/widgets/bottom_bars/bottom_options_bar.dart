import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/colour_button/colour_button_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tag_music_player/timoncode/functions/nav/navBase.dart';

class BottomOptionsBarWidgetWidget extends StatefulWidget {
  const BottomOptionsBarWidgetWidget({
    Key? key,
    this.confirmText,
    Color? confirmColour,
    required this.confirmTap,
  })  : this.confirmColour = confirmColour ?? const Color(0xFF0094ED),
        super(key: key);

  final String? confirmText;
  final Color confirmColour;
  final Function confirmTap;

  @override
  _BottomOptionsBarWidgetWidgetState createState() =>
      _BottomOptionsBarWidgetWidgetState();
}

class _BottomOptionsBarWidgetWidgetState
    extends State<BottomOptionsBarWidgetWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.9),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 75.0,
        decoration: BoxDecoration(
          color: Color(0xF1262626),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2.0,
                sigmaY: 2.0,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          navBase(context);
                        },
                        child: ColourButtonWidget(
                          buttonColour: FlutterFlowTheme.of(context).secondary,
                          text: 'Cancel',
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        onTap: () {
                          widget.confirmTap();
                          navBase(context);
                        },
                        child: ColourButtonWidget(
                          buttonColour: valueOrDefault<Color>(
                            widget.confirmColour,
                            FlutterFlowTheme.of(context).accent1,
                          ),
                          text: valueOrDefault<String>(
                            widget.confirmText,
                            '[Confirm]',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
