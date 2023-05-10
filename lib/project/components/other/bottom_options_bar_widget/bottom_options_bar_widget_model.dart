import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/colour_button/colour_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomOptionsBarWidgetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for colour_button component.
  late ColourButtonModel colourButtonModel1;
  // Model for colour_button component.
  late ColourButtonModel colourButtonModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    colourButtonModel1 = createModel(context, () => ColourButtonModel());
    colourButtonModel2 = createModel(context, () => ColourButtonModel());
  }

  void dispose() {
    colourButtonModel1.dispose();
    colourButtonModel2.dispose();
  }

  /// Additional helper methods are added here.

}
