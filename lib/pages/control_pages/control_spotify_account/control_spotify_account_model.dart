import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ControlSpotifyAccountModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for Default_Button component.
  late DefaultButtonModel defaultButtonModel;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    defaultButtonModel = createModel(context, () => DefaultButtonModel());
    headingTextModel = createModel(context, () => HeadingTextModel());
  }

  void dispose() {
    defaultButtonModel.dispose();
    headingTextModel.dispose();
  }

  /// Additional helper methods are added here.

}
