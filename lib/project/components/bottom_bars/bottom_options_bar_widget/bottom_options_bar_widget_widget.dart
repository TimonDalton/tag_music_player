import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/colour_button/colour_button_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_options_bar_widget_model.dart';
export 'bottom_options_bar_widget_model.dart';

class BottomOptionsBarWidgetWidget extends StatefulWidget {
  const BottomOptionsBarWidgetWidget({
    Key? key,
    this.confirmText,
    Color? confirmColour,
  })  : this.confirmColour = confirmColour ?? const Color(0xFF0094ED),
        super(key: key);

  final String? confirmText;
  final Color confirmColour;

  @override
  _BottomOptionsBarWidgetWidgetState createState() =>
      _BottomOptionsBarWidgetWidgetState();
}

class _BottomOptionsBarWidgetWidgetState
    extends State<BottomOptionsBarWidgetWidget> {
  late BottomOptionsBarWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomOptionsBarWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

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
                          if (FFAppState().basePage == 0) {
                            context.pushNamed('Queue_Page');
                          } else {
                            if (FFAppState().basePage == 1) {
                              context.pushNamed('Filters_Page');
                            } else {
                              context.pushNamed('song_library_page');
                            }
                          }
                        },
                        child: wrapWithModel(
                          model: _model.colourButtonModel1,
                          updateCallback: () => setState(() {}),
                          child: ColourButtonWidget(
                            buttonColour:
                                FlutterFlowTheme.of(context).secondary,
                            text: 'Cancel',
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.colourButtonModel2,
                        updateCallback: () => setState(() {}),
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
