import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/mini_button/mini_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartPlayingBarModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for mini_button component.
  late MiniButtonModel miniButtonModel1;
  // Model for mini_button component.
  late MiniButtonModel miniButtonModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    miniButtonModel1 = createModel(context, () => MiniButtonModel());
    miniButtonModel2 = createModel(context, () => MiniButtonModel());
  }

  void dispose() {
    miniButtonModel1.dispose();
    miniButtonModel2.dispose();
  }

  /// Additional helper methods are added here.

}
