import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'colour_toggle_bubble_widget_model.dart';
export 'colour_toggle_bubble_widget_model.dart';

class ColourToggleBubbleWidgetWidget extends StatefulWidget {
  const ColourToggleBubbleWidgetWidget({
    Key? key,
    Color? colour,
  })  : this.colour = colour ?? const Color(0xFFFFD600),
        super(key: key);

  final Color colour;

  @override
  _ColourToggleBubbleWidgetWidgetState createState() =>
      _ColourToggleBubbleWidgetWidgetState();
}

class _ColourToggleBubbleWidgetWidgetState
    extends State<ColourToggleBubbleWidgetWidget> {
  late ColourToggleBubbleWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColourToggleBubbleWidgetModel());
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
      width: 36.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: widget.colour,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          width: 16.0,
          height: 16.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent3,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
