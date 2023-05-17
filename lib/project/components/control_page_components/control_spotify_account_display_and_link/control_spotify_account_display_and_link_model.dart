import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ControlSpotifyAccountDisplayAndLinkModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for heading_text component.
  late HeadingTextModel headingTextModel;
  // Model for Default_Button component.
  late DefaultButtonModel defaultButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headingTextModel = createModel(context, () => HeadingTextModel());
    defaultButtonModel = createModel(context, () => DefaultButtonModel());
  }

  void dispose() {
    headingTextModel.dispose();
    defaultButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
